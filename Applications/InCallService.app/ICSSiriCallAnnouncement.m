@implementation ICSSiriCallAnnouncement

- (ICSSiriCallAnnouncement)initWithCall:(id)a3
{
  ICSSiriCallAnnouncement *result;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)ICSSiriCallAnnouncement;
  result = -[ICSCallAnnouncement initWithCall:](&v4, "initWithCall:", a3);
  if (result)
    result->_audioSessionIdentifier = 0;
  return result;
}

- (void)pause
{
  id v3;
  NSObject *v4;
  _QWORD block[5];
  uint8_t buf[16];

  v3 = sub_1000C5588();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Pause ICSSiriCallAnnouncement", buf, 2u);
  }

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001F598;
  block[3] = &unk_100284898;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)start
{
  id v3;
  NSObject *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  unsigned __int8 v9;
  uint64_t v10;
  void *v11;
  unsigned int v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  int64_t v18;
  uint64_t v19;
  void *v20;
  char *v21;
  char *v22;
  id v23;
  uint64_t v24;
  void *v25;
  void *v26;
  id v27;
  id v28;
  _QWORD v29[5];
  id v30;
  _QWORD block[4];
  id v32;
  id v33;
  id buf[2];

  v3 = sub_1000C5588();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Start ICSSiriCallAnnouncement", (uint8_t *)buf, 2u);
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICSCallAnnouncement contacts](self, "contacts"));
  v6 = objc_msgSend(objc_alloc((Class)AFSiriRingtone), "initWithContacts:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[ICSCallAnnouncement callDestinationID](self, "callDestinationID"));
  objc_msgSend(v6, "setCallDestinationID:", v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[ICSCallAnnouncement callDestinationID](self, "callDestinationID"));
  v9 = objc_msgSend(v8, "destinationIdIsEmailAddress");

  if ((v9 & 1) != 0)
  {
    v10 = 2;
  }
  else
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[ICSCallAnnouncement callDestinationID](self, "callDestinationID"));
    v12 = objc_msgSend(v11, "destinationIdIsPhoneNumber");

    v10 = v12;
  }
  objc_msgSend(v6, "setCallDestinationIDType:", v10);
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[ICSCallAnnouncement callServiceName](self, "callServiceName"));
  objc_msgSend(v6, "setCallServiceSpeakableName:", v13);

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[ICSCallAnnouncement callerName](self, "callerName"));
  objc_msgSend(v6, "setDisplayedCallerID:", v14);

  v15 = objc_alloc_init((Class)VSSpeechRequest);
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "voiceInfo"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "languageCode"));
  objc_msgSend(v15, "setLanguageCode:", v17);

  v18 = -[ICSCallAnnouncement callerNameType](self, "callerNameType");
  if (v18 == 2)
    v19 = 3;
  else
    v19 = 4 * (v18 == 1);
  objc_msgSend(v6, "setCallerIDType:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "voiceInfo"));
  v21 = (char *)objc_msgSend(v20, "gender");
  if ((unint64_t)(v21 - 1) >= 3)
    v22 = 0;
  else
    v22 = v21;
  objc_msgSend(v15, "setGender:", v22);
  v23 = objc_msgSend(v20, "footprint");
  if (v23 == (id)2)
    v24 = 2;
  else
    v24 = v23 == (id)1;
  objc_msgSend(v15, "setAudioSessionID:", -[ICSSiriCallAnnouncement audioSessionIdentifier](self, "audioSessionIdentifier"));
  objc_msgSend(v15, "setFootprint:", v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "name"));
  objc_msgSend(v15, "setVoiceName:", v25);

  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "textToSpeak"));
  objc_msgSend(v15, "setText:", v26);

  objc_initWeak(buf, self);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001F958;
  block[3] = &unk_100285028;
  objc_copyWeak(&v33, buf);
  v32 = v15;
  v27 = v15;
  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472;
  v29[2] = sub_10001F9F4;
  v29[3] = &unk_100285050;
  v29[4] = self;
  v30 = dispatch_block_create((dispatch_block_flags_t)0, block);
  v28 = v30;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v29);

  objc_destroyWeak(&v33);
  objc_destroyWeak(buf);

}

- (void)stop
{
  id v3;
  NSObject *v4;
  _QWORD block[5];
  uint8_t buf[16];

  v3 = sub_1000C5588();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Stop ICSSiriCallAnnouncement", buf, 2u);
  }

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001FAEC;
  block[3] = &unk_100284898;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (VSSpeechSynthesizer)speechSynthesizer
{
  VSSpeechSynthesizer *speechSynthesizer;
  VSSpeechSynthesizer *v4;
  VSSpeechSynthesizer *v5;

  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  speechSynthesizer = self->_speechSynthesizer;
  if (!speechSynthesizer)
  {
    v4 = (VSSpeechSynthesizer *)objc_alloc_init((Class)VSSpeechSynthesizer);
    v5 = self->_speechSynthesizer;
    self->_speechSynthesizer = v4;

    -[VSSpeechSynthesizer setDelegate:](self->_speechSynthesizer, "setDelegate:", self);
    speechSynthesizer = self->_speechSynthesizer;
  }
  return speechSynthesizer;
}

- (void)speechSynthesizer:(id)a3 didStartSpeakingRequest:(id)a4
{
  id v5;
  NSObject *v6;
  void *v7;
  char v8;
  void *v9;
  uint8_t v10[16];

  v5 = sub_1000C5588();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v10 = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "", v10, 2u);
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[ICSAnnouncement delegate](self, "delegate"));
  v8 = objc_opt_respondsToSelector(v7, "announcementDidStart:");

  if ((v8 & 1) != 0)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[ICSAnnouncement delegate](self, "delegate"));
    objc_msgSend(v9, "announcementDidStart:", self);

  }
}

- (void)speechSynthesizer:(id)a3 didFinishSpeakingRequest:(id)a4 successfully:(BOOL)a5 phonemesSpoken:(id)a6 withError:(id)a7
{
  id v8;
  id v9;
  NSObject *v10;
  id v11;
  NSObject *v12;
  void *v13;
  char v14;
  void *v15;
  uint8_t v16[16];

  v8 = a7;
  v9 = sub_1000C5588();
  v10 = objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v16 = 0;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "", v16, 2u);
  }

  if (v8)
  {
    v11 = sub_1000C5588();
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      sub_1001A8298();

  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[ICSAnnouncement delegate](self, "delegate"));
  v14 = objc_opt_respondsToSelector(v13, "announcementDidFinish:");

  if ((v14 & 1) != 0)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[ICSAnnouncement delegate](self, "delegate"));
    objc_msgSend(v15, "announcementDidFinish:", self);

  }
}

- (void)speechSynthesizer:(id)a3 didPauseSpeakingRequest:(id)a4
{
  id v5;
  NSObject *v6;
  void *v7;
  char v8;
  void *v9;
  uint8_t v10[16];

  v5 = sub_1000C5588();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v10 = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "", v10, 2u);
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[ICSAnnouncement delegate](self, "delegate"));
  v8 = objc_opt_respondsToSelector(v7, "announcementDidPause:");

  if ((v8 & 1) != 0)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[ICSAnnouncement delegate](self, "delegate"));
    objc_msgSend(v9, "announcementDidPause:", self);

  }
}

- (void)speechSynthesizer:(id)a3 didContinueSpeakingRequest:(id)a4
{
  id v5;
  NSObject *v6;
  void *v7;
  char v8;
  void *v9;
  uint8_t v10[16];

  v5 = sub_1000C5588();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v10 = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "", v10, 2u);
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[ICSAnnouncement delegate](self, "delegate"));
  v8 = objc_opt_respondsToSelector(v7, "announcementDidContinue:");

  if ((v8 & 1) != 0)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[ICSAnnouncement delegate](self, "delegate"));
    objc_msgSend(v9, "announcementDidContinue:", self);

  }
}

- (void)speechSynthesizer:(id)a3 willSpeakRangeOfSpeechString:(_NSRange)a4 forRequest:(id)a5
{
  id v5;
  NSObject *v6;
  uint8_t v7[16];

  v5 = sub_1000C5588();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "", v7, 2u);
  }

}

- (unsigned)audioSessionIdentifier
{
  return self->_audioSessionIdentifier;
}

- (void)setAudioSessionIdentifier:(unsigned int)a3
{
  self->_audioSessionIdentifier = a3;
}

- (int64_t)callerIDType
{
  return self->_callerIDType;
}

- (void)setCallerIDType:(int64_t *)a3
{
  self->_callerIDType = a3;
}

- (void)setSpeechSynthesizer:(id)a3
{
  objc_storeStrong((id *)&self->_speechSynthesizer, a3);
}

- (id)playAnnouncementBlock
{
  return self->_playAnnouncementBlock;
}

- (void)setPlayAnnouncementBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 144);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_playAnnouncementBlock, 0);
  objc_storeStrong((id *)&self->_speechSynthesizer, 0);
}

@end
