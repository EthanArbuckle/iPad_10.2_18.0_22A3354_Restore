@implementation ICSDowntimeAnnouncement

- (VSSpeechSynthesizer)speechSynthesizer
{
  VSSpeechSynthesizer *speechSynthesizer;
  VSSpeechSynthesizer *v4;
  VSSpeechSynthesizer *v5;

  speechSynthesizer = self->_speechSynthesizer;
  if (!speechSynthesizer)
  {
    v4 = (VSSpeechSynthesizer *)objc_alloc_init((Class)VSSpeechSynthesizer);
    v5 = self->_speechSynthesizer;
    self->_speechSynthesizer = v4;

    speechSynthesizer = self->_speechSynthesizer;
  }
  return speechSynthesizer;
}

- (void)start
{
  id v3;
  NSObject *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  dispatch_time_t v12;
  id v13;
  _QWORD v14[5];
  id v15;
  uint8_t buf[16];

  v3 = sub_1000C5588();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "", buf, 2u);
  }

  v5 = objc_alloc_init((Class)VSSpeechRequest);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ICSDowntimeAnnouncement text](self, "text"));
  objc_msgSend(v5, "setText:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[AFPreferences sharedPreferences](AFPreferences, "sharedPreferences"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "outputVoice"));

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "languageCode"));
  objc_msgSend(v5, "setLanguageCode:", v9);

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "name"));
  objc_msgSend(v5, "setVoiceName:", v10);

  -[ICSDowntimeAnnouncement setSpeechRequest:](self, "setSpeechRequest:", v5);
  -[ICSAnnouncement delay](self, "delay");
  v12 = dispatch_time(0, (uint64_t)(v11 * *(double *)""));
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100025B94;
  v14[3] = &unk_100285158;
  v14[4] = self;
  v15 = v5;
  v13 = v5;
  dispatch_after(v12, (dispatch_queue_t)&_dispatch_main_q, v14);

}

- (void)stop
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[ICSDowntimeAnnouncement speechSynthesizer](self, "speechSynthesizer"));
  objc_msgSend(v2, "stopSpeakingAtNextBoundary:synchronously:error:", 1, 0, 0);

}

- (id)text
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("ANNOUNCEMENT_CALL_WILL_END_RESTRICTED"), &stru_10028DC20, CFSTR("InCallService")));

  return v3;
}

- (VSSpeechRequest)speechRequest
{
  return self->_speechRequest;
}

- (void)setSpeechRequest:(id)a3
{
  objc_storeStrong((id *)&self->_speechRequest, a3);
}

- (void)setSpeechSynthesizer:(id)a3
{
  objc_storeStrong((id *)&self->_speechSynthesizer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_speechSynthesizer, 0);
  objc_storeStrong((id *)&self->_speechRequest, 0);
}

@end
