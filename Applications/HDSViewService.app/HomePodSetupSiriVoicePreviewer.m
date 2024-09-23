@implementation HomePodSetupSiriVoicePreviewer

- (void)previewVoice:(id)a3 completion:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  NSTimer *v14;
  NSTimer *powerLevelUpdaterTimer;
  id WeakRetained;
  id v17;
  id v18;
  _QWORD v19[4];
  id v20;
  id v21;
  id v22;
  id location;

  v7 = a3;
  v8 = a4;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "languageCode"));
  if (v10)
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v10, CFSTR("siriVL"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "name"));

  if (v11)
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v11, CFSTR("siriVN"));
  v12 = objc_msgSend(v7, "gender");
  if (v12)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v12));
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v13, CFSTR("siriVG"));

  }
  if (!-[NSTimer isValid](self->_powerLevelUpdaterTimer, "isValid"))
  {
    v14 = (NSTimer *)objc_claimAutoreleasedReturnValue(+[NSTimer scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:](NSTimer, "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, "_updatePowerOutputLevel", 0, 1, 0.0166666675));
    powerLevelUpdaterTimer = self->_powerLevelUpdaterTimer;
    self->_powerLevelUpdaterTimer = v14;

  }
  objc_storeStrong((id *)&self->_voicePreviewing, a3);
  objc_initWeak(&location, self);
  WeakRetained = objc_loadWeakRetained((id *)&self->_session);
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_100008370;
  v19[3] = &unk_1000C16B0;
  objc_copyWeak(&v22, &location);
  v17 = v7;
  v20 = v17;
  v18 = v8;
  v21 = v18;
  objc_msgSend(WeakRetained, "sendRequestID:options:request:responseHandler:", CFSTR("_pvoice"), &off_1000C7150, v9, v19);

  objc_destroyWeak(&v22);
  objc_destroyWeak(&location);

}

- (void)_updatePowerOutputLevel
{
  float v3;
  NSTimer *powerLevelUpdaterTimer;
  double v5;
  id v6;

  if (self->_voicePreviewing)
  {
    v3 = (float)(int)arc4random_uniform(0x32u) + -60.0;
  }
  else
  {
    -[NSTimer invalidate](self->_powerLevelUpdaterTimer, "invalidate");
    powerLevelUpdaterTimer = self->_powerLevelUpdaterTimer;
    self->_powerLevelUpdaterTimer = 0;

    v3 = -60.0;
  }
  v6 = (id)objc_claimAutoreleasedReturnValue(-[HomePodSetupSiriVoicePreviewer delegate](self, "delegate"));
  *(float *)&v5 = v3;
  objc_msgSend(v6, "voicePreviewerAudioOutputDidChangePowerLevel:", v5);

}

- (SUICVoicePreviewingDelegate)delegate
{
  return (SUICVoicePreviewingDelegate *)objc_loadWeakRetained((id *)&self->_voicePreviewerDelegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_voicePreviewerDelegate, a3);
}

- (SFSession)session
{
  return (SFSession *)objc_loadWeakRetained((id *)&self->_session);
}

- (void)setSession:(id)a3
{
  objc_storeWeak((id *)&self->_session, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_session);
  objc_storeStrong((id *)&self->_voicePreviewing, 0);
  objc_destroyWeak((id *)&self->_voicePreviewerDelegate);
  objc_storeStrong((id *)&self->_powerLevelUpdaterTimer, 0);
}

@end
