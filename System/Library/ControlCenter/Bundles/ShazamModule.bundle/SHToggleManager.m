@implementation SHToggleManager

- (SHToggleManager)init
{
  SHToggleManager *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SHToggleManager;
  result = -[SHToggleManager init](&v3, sel_init);
  if (result)
    result->_toggleState = 1;
  return result;
}

- (void)toggleRecognitionState
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x24BDAC8D0];
  -[SHToggleManager setToggleState:](self, "setToggleState:", -[SHToggleManager isToggleOn](self, "isToggleOn"));
  if (-[SHToggleManager isToggleOn](self, "isToggleOn"))
  {
    -[SHToggleManager playStartRecordingSystemSound](self, "playStartRecordingSystemSound");
    -[SHToggleManager session](self, "session");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "matchAmbientAudioSnippet");

  }
  else
  {
    -[SHToggleManager stop](self, "stop");
    -[SHToggleManager playStopRecordingSystemSound](self, "playStopRecordingSystemSound");
  }
  v4 = (void *)MEMORY[0x24BE90518];
  v5 = *MEMORY[0x24BE90580];
  v9 = *MEMORY[0x24BE905A0];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[SHToggleManager isToggleOn](self, "isToggleOn"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v6;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sendEvent:withPayload:", v5, v7);

  -[SHToggleManager delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "toggleManager:didToggleToState:", self, -[SHToggleManager toggleState](self, "toggleState"));

}

- (void)toggleToState:(int64_t)a3
{
  id v5;

  if (-[SHToggleManager toggleState](self, "toggleState") != a3)
  {
    -[SHToggleManager setToggleState:](self, "setToggleState:", a3);
    -[SHToggleManager delegate](self, "delegate");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "toggleManager:didToggleToState:", self, -[SHToggleManager toggleState](self, "toggleState"));

  }
}

- (BOOL)isToggleOn
{
  return -[SHToggleManager toggleState](self, "toggleState") == 0;
}

- (void)switchToggleOff
{
  -[SHToggleManager setToggleState:](self, "setToggleState:", 1);
}

- (void)playStartRecordingSystemSound
{
  if (UIAccessibilityIsVoiceOverRunning())
    MEMORY[0x24BEDD108](self, sel_playSystemSoundWithID_completion_);
}

- (void)playStopRecordingSystemSound
{
  if (UIAccessibilityIsVoiceOverRunning())
    MEMORY[0x24BEDD108](self, sel_playSystemSoundWithID_completion_);
}

- (void)playSystemSoundWithID:(unsigned int)a3 completion:(id)a4
{
  AudioServicesPlaySystemSoundWithCompletion(a3, a4);
}

- (void)stop
{
  void *v2;
  id v3;

  -[SHToggleManager session](self, "session");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cancel");

  objc_msgSend(MEMORY[0x24BDD1530], "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "postNotificationName:object:", CFSTR("com.apple.musicrecognition.cancelLiveActivity"), 0);

}

- (void)recognitionDidFinish
{
  void *v3;

  if (-[SHToggleManager isToggleOn](self, "isToggleOn"))
  {
    -[SHToggleManager switchToggleOff](self, "switchToggleOff");
    -[SHToggleManager delegate](self, "delegate");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "toggleManager:didToggleToState:", self, -[SHToggleManager toggleState](self, "toggleState"));

    -[SHToggleManager playStopRecordingSystemSound](self, "playStopRecordingSystemSound");
  }
}

- (SHManagedSession)session
{
  SHManagedSession *session;
  SHManagedSession *v4;
  SHManagedSession *v5;

  session = self->_session;
  if (!session)
  {
    v4 = (SHManagedSession *)objc_alloc_init(MEMORY[0x24BDE97D0]);
    v5 = self->_session;
    self->_session = v4;

    -[SHManagedSession setEnableLiveActivity:](self->_session, "setEnableLiveActivity:", 1);
    -[SHManagedSession setDelegate:](self->_session, "setDelegate:", self);
    session = self->_session;
  }
  return session;
}

- (void)session:(id)a3 didFindMatch:(id)a4
{
  id v5;
  NSObject *v6;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  shcore_log_object();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    v7 = 138412290;
    v8 = v5;
    _os_log_impl(&dword_23101B000, v6, OS_LOG_TYPE_DEBUG, "SHToggleManager session didFindMatch %@", (uint8_t *)&v7, 0xCu);
  }

  -[SHToggleManager recognitionDidFinish](self, "recognitionDidFinish");
}

- (void)session:(id)a3 didNotFindMatchForSignature:(id)a4 error:(id)a5
{
  id v7;
  id v8;
  NSObject *v9;
  int v10;
  id v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v7 = a4;
  v8 = a5;
  shcore_log_object();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    v10 = 138412546;
    v11 = v7;
    v12 = 2112;
    v13 = v8;
    _os_log_impl(&dword_23101B000, v9, OS_LOG_TYPE_DEBUG, "SHToggleManager session didNotFindMatchForSignature %@ error %@", (uint8_t *)&v10, 0x16u);
  }

  -[SHToggleManager recognitionDidFinish](self, "recognitionDidFinish");
}

- (void)finishedManagedSession:(id)a3
{
  NSObject *v4;
  uint8_t v5[16];

  shcore_log_object();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_23101B000, v4, OS_LOG_TYPE_DEBUG, "SHToggleManager session finishedManagedSession", v5, 2u);
  }

  -[SHToggleManager recognitionDidFinish](self, "recognitionDidFinish");
}

- (SHToggleManagerDelegate)delegate
{
  return (SHToggleManagerDelegate *)objc_loadWeakRetained((id *)&self->delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->delegate, a3);
}

- (int64_t)toggleState
{
  return self->_toggleState;
}

- (void)setToggleState:(int64_t)a3
{
  self->_toggleState = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_session, 0);
  objc_destroyWeak((id *)&self->delegate);
}

@end
