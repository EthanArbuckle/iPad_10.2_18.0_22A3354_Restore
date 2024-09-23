@implementation AFUIVoicemailPlayer

- (void)setPlaybackCommand:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5.receiver = self;
    v5.super_class = (Class)AFUIVoicemailPlayer;
    -[AFUIAudioPlayer setPlaybackCommand:](&v5, sel_setPlaybackCommand_, v4);
    -[AFUIVoicemailPlayer _setVoicemailObject:](self, "_setVoicemailObject:", 0);
  }

}

- (id)_voicemailManager
{
  VMVoicemailManager *voicemailManager;
  void *v4;
  objc_class *v5;
  VMVoicemailManager *v6;
  VMVoicemailManager *v7;
  _QWORD v9[5];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;

  voicemailManager = self->_voicemailManager;
  if (!voicemailManager)
  {
    v10 = 0;
    v11 = &v10;
    v12 = 0x2050000000;
    v4 = (void *)getVMVoicemailManagerClass_softClass;
    v13 = getVMVoicemailManagerClass_softClass;
    if (!getVMVoicemailManagerClass_softClass)
    {
      v9[0] = MEMORY[0x24BDAC760];
      v9[1] = 3221225472;
      v9[2] = __getVMVoicemailManagerClass_block_invoke;
      v9[3] = &unk_24D7A1A28;
      v9[4] = &v10;
      __getVMVoicemailManagerClass_block_invoke((uint64_t)v9);
      v4 = (void *)v11[3];
    }
    v5 = objc_retainAutorelease(v4);
    _Block_object_dispose(&v10, 8);
    v6 = (VMVoicemailManager *)objc_alloc_init(v5);
    v7 = self->_voicemailManager;
    self->_voicemailManager = v6;

    voicemailManager = self->_voicemailManager;
  }
  return voicemailManager;
}

- (int64_t)_voicemailID
{
  void *v2;
  void *v3;
  void *v4;
  int64_t v5;

  -[AFUIVoicemailPlayer _audioURL](self, "_audioURL");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URLByDeletingPathExtension");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "lastPathComponent");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "integerValue");

  return v5;
}

- (VMVoicemail)_voicemailObject
{
  VMVoicemail *voicemailObject;
  void *v4;
  VMVoicemail *v5;
  VMVoicemail *v6;

  voicemailObject = self->_voicemailObject;
  if (!voicemailObject)
  {
    -[AFUIVoicemailPlayer _voicemailManager](self, "_voicemailManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "voicemailWithIdentifier:", -[AFUIVoicemailPlayer _voicemailID](self, "_voicemailID"));
    v5 = (VMVoicemail *)objc_claimAutoreleasedReturnValue();
    v6 = self->_voicemailObject;
    self->_voicemailObject = v5;

    voicemailObject = self->_voicemailObject;
  }
  return voicemailObject;
}

- (void)_updateVoicemailPlayedState:(id)a3 finished:(BOOL)a4
{
  id v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  int v17;
  const char *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  objc_msgSend(v6, "duration");
  v8 = v7;
  objc_msgSend(v6, "currentTime");
  v10 = v9;

  if (a4 || v8 != 0.0 && v10 / v8 > 0.75)
  {
    v11 = (void *)*MEMORY[0x24BE08FB0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
    {
      v12 = v11;
      -[AFUIVoicemailPlayer _audioURL](self, "_audioURL");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 136315394;
      v18 = "-[AFUIVoicemailPlayer _updateVoicemailPlayedState:finished:]";
      v19 = 2112;
      v20 = v13;
      _os_log_impl(&dword_217514000, v12, OS_LOG_TYPE_DEFAULT, "%s Marking voicemail as played %@", (uint8_t *)&v17, 0x16u);

    }
    -[AFUIVoicemailPlayer _voicemailManager](self, "_voicemailManager");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[AFUIVoicemailPlayer _voicemailObject](self, "_voicemailObject");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (id)objc_msgSend(v14, "markVoicemailAsRead:", v15);

  }
}

- (id)_audioURL
{
  void *v3;
  char isKindOfClass;
  void *v5;
  void *v6;

  -[AFUIAudioPlayer playbackCommand](self, "playbackCommand");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    -[AFUIAudioPlayer playbackCommand](self, "playbackCommand");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "voiceMailId");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (id)_audioCategory
{
  return (id)*MEMORY[0x24BDB15C8];
}

- (unint64_t)_audioOptions
{
  return 17;
}

- (void)audioPlayerDidFinishPlaying:(id)a3 successfully:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  objc_super v7;

  v4 = a4;
  v6 = a3;
  -[AFUIVoicemailPlayer _updateVoicemailPlayedState:finished:](self, "_updateVoicemailPlayedState:finished:", v6, v4);
  v7.receiver = self;
  v7.super_class = (Class)AFUIVoicemailPlayer;
  -[AFUIAudioPlayer audioPlayerDidFinishPlaying:successfully:](&v7, sel_audioPlayerDidFinishPlaying_successfully_, v6, v4);

}

- (void)_setVoicemailObject:(id)a3
{
  objc_storeStrong((id *)&self->_voicemailObject, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_voicemailObject, 0);
  objc_storeStrong((id *)&self->_voicemailManager, 0);
}

@end
