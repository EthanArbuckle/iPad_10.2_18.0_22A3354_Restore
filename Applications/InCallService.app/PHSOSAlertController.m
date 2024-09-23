@implementation PHSOSAlertController

+ (void)playSOSEntryHaptic
{
  void *v2;
  id v3;

  v3 = objc_msgSend(objc_alloc((Class)TLAlertConfiguration), "initWithType:", 22);
  objc_msgSend(v3, "setTopic:", TLAlertTopicSOSButtonChordingTimeout);
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[TLAlert alertWithConfiguration:](TLAlert, "alertWithConfiguration:", v3));
  objc_msgSend(v2, "play");

}

- (void)playAlertWithAudio:(BOOL)a3 alertTopic:(id)a4
{
  _BOOL8 v4;
  id v6;
  unsigned int v7;
  char v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  NSObject *v20;
  void *v21;
  void *v22;
  int v23;
  void *v24;

  v4 = a3;
  v6 = a4;
  if (-[PHSOSAlertController playingWithAudio](self, "playingWithAudio") != v4)
  {
    -[PHSOSAlertController setPlayingWithAudio:](self, "setPlayingWithAudio:", v4);
    -[PHSOSAlertController stopAlert](self, "stopAlert");
  }
  v7 = +[SOSUtilities BOOLOverrideForDefaultsKey:defaultValue:](SOSUtilities, "BOOLOverrideForDefaultsKey:defaultValue:", CFSTR("debug.countdown.subtle"), 0);
  v8 = v7;
  if (v7)
  {
    v9 = 22;
    if (-[PHSOSAlertController playingWithAudio](self, "playingWithAudio") && (id)TLAlertTopicSOSCountdownTick == v6)
    {
      v10 = TLAlertTopicIncomingCallFaceTimeParticipantJoined;

      v9 = 1;
      v6 = v10;
    }
  }
  else
  {
    v9 = 22;
  }
  v11 = objc_claimAutoreleasedReturnValue(-[PHSOSAlertController alertConfiguration](self, "alertConfiguration"));
  if (!v11
    || (v12 = (void *)v11,
        v13 = (void *)objc_claimAutoreleasedReturnValue(-[PHSOSAlertController alertConfiguration](self, "alertConfiguration")),
        v14 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "topic")),
        v14,
        v13,
        v12,
        v14 != v6))
  {
    v15 = objc_msgSend(objc_alloc((Class)TLAlertConfiguration), "initWithType:", v9);
    objc_msgSend(v15, "setTopic:", v6);
    if (v6 == (id)TLAlertTopicSOSCountdownTick)
      objc_msgSend(v15, "setMaximumDuration:", 0.850000024);
    if (!-[PHSOSAlertController playingWithAudio](self, "playingWithAudio"))
      objc_msgSend(v15, "setToneIdentifier:", TLToneIdentifierNone);
    -[PHSOSAlertController setAlertConfiguration:](self, "setAlertConfiguration:", v15);

  }
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[PHSOSAlertController alertConfiguration](self, "alertConfiguration"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[TLAlert alertWithConfiguration:](TLAlert, "alertWithConfiguration:", v16));

  -[PHSOSAlertController setAlert:](self, "setAlert:", v17);
  v18 = (id)objc_claimAutoreleasedReturnValue(-[PHSOSAlertController alertActivationAssertion](self, "alertActivationAssertion"));
  if (!v18 && v6 != (id)TLAlertTopicSOSButtonChordingTimeout)
  {
    if ((v8 & 1) != 0)
      goto LABEL_20;
    v18 = objc_msgSend(objc_alloc((Class)TLAlertActivationAssertion), "initWithAlert:", v17);
    objc_msgSend(v18, "acquire");
    -[PHSOSAlertController setAlertActivationAssertion:](self, "setAlertActivationAssertion:", v18);
  }

LABEL_20:
  v19 = sub_1000C5588();
  v20 = objc_claimAutoreleasedReturnValue(v19);
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[PHSOSAlertController alertConfiguration](self, "alertConfiguration"));
    v23 = 138412290;
    v24 = v21;
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Playing countdown alert sound with alertConfiguration: %@", (uint8_t *)&v23, 0xCu);

  }
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[PHSOSAlertController alert](self, "alert"));
  objc_msgSend(v22, "play");

}

- (void)stopAlert
{
  void *v3;
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  uint8_t v12[16];
  uint8_t buf[16];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PHSOSAlertController alert](self, "alert"));

  if (v3)
  {
    v4 = sub_1000C5588();
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Stopping countdown alert sound...", buf, 2u);
    }

    v6 = (void *)objc_claimAutoreleasedReturnValue(-[PHSOSAlertController alert](self, "alert"));
    objc_msgSend(v6, "stop");

  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[PHSOSAlertController alertActivationAssertion](self, "alertActivationAssertion"));

  if (v7)
  {
    v8 = sub_1000C5588();
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v12 = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Relinquishing alert activation assertion...", v12, 2u);
    }

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[PHSOSAlertController alertActivationAssertion](self, "alertActivationAssertion"));
    objc_msgSend(v10, "relinquish");

    -[PHSOSAlertController setAlertActivationAssertion:](self, "setAlertActivationAssertion:", 0);
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[PHSOSAlertController alertConfiguration](self, "alertConfiguration"));

  if (v11)
    -[PHSOSAlertController setAlertConfiguration:](self, "setAlertConfiguration:", 0);
}

- (TLAlertConfiguration)alertConfiguration
{
  return self->_alertConfiguration;
}

- (void)setAlertConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_alertConfiguration, a3);
}

- (TLAlertActivationAssertion)alertActivationAssertion
{
  return self->_alertActivationAssertion;
}

- (void)setAlertActivationAssertion:(id)a3
{
  objc_storeStrong((id *)&self->_alertActivationAssertion, a3);
}

- (TLAlert)alert
{
  return self->_alert;
}

- (void)setAlert:(id)a3
{
  objc_storeStrong((id *)&self->_alert, a3);
}

- (BOOL)playingWithAudio
{
  return self->_playingWithAudio;
}

- (void)setPlayingWithAudio:(BOOL)a3
{
  self->_playingWithAudio = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_alert, 0);
  objc_storeStrong((id *)&self->_alertActivationAssertion, 0);
  objc_storeStrong((id *)&self->_alertConfiguration, 0);
}

@end
