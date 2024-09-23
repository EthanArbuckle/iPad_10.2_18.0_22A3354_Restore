@implementation AFUIAudioPlayer

+ (id)voicemailPlayer
{
  return objc_alloc_init(AFUIVoicemailPlayer);
}

+ (id)audioMessagePlayer
{
  return objc_alloc_init(AFUIAudioMessagePlayer);
}

- (void)startPlaying
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0_0(&dword_217514000, v0, v1, "%s Failed to set audio active: %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_3();
}

- (void)stopPlaying
{
  id v2;

  -[AFUIAudioPlayer _player](self, "_player");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stop");

}

- (void)_setPlayer:(id)a3
{
  AVAudioPlayer *v4;
  AVAudioPlayer *player;
  AVAudioPlayer *v6;

  v4 = (AVAudioPlayer *)a3;
  -[AVAudioPlayer setDelegate:](self->_player, "setDelegate:", 0);
  player = self->_player;
  self->_player = v4;
  v6 = v4;

  -[AVAudioPlayer setDelegate:](self->_player, "setDelegate:", self);
}

- (id)_audioCategory
{
  return (id)*MEMORY[0x24BDB15A8];
}

- (unint64_t)_audioOptions
{
  return 0;
}

- (id)_audioURL
{
  void *v4;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("AFUIAudioPlayer.m"), 86, CFSTR("This method should be overwritten by child class!"));

  return 0;
}

- (void)audioPlayerDidFinishPlaying:(id)a3 successfully:(BOOL)a4
{
  id v5;
  os_log_t *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  uint8_t buf[4];
  const char *v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = (os_log_t *)MEMORY[0x24BE08FB0];
  v7 = (void *)*MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
  {
    v8 = v7;
    -[AFUIAudioPlayer description](self, "description");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[AFUIAudioPlayer _audioURL](self, "_audioURL");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315650;
    v17 = "-[AFUIAudioPlayer audioPlayerDidFinishPlaying:successfully:]";
    v18 = 2112;
    v19 = v9;
    v20 = 2112;
    v21 = v10;
    _os_log_impl(&dword_217514000, v8, OS_LOG_TYPE_DEFAULT, "%s %@ did finish playing %@", buf, 0x20u);

  }
  if (-[AFUIAudioPlayer deactivateAudioSessionOnPlaybackFinished](self, "deactivateAudioSessionOnPlaybackFinished"))
  {
    objc_msgSend(MEMORY[0x24BDB1858], "sharedInstance");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 0;
    objc_msgSend(v11, "setActive:withOptions:error:", 0, 1, &v15);
    v12 = v15;

    if (v12 && os_log_type_enabled(*v6, OS_LOG_TYPE_ERROR))
      -[AFUIAudioPlayer audioPlayerDidFinishPlaying:successfully:].cold.1();

  }
  -[AFUIAudioPlayer delegate](self, "delegate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[AFUIAudioPlayer playbackCommand](self, "playbackCommand");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "audioPlayer:didFinishPlayback:", self, v14);

}

- (AFUIAudioPlayerDelegate)delegate
{
  return (AFUIAudioPlayerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (AceObject)playbackCommand
{
  return self->_playbackCommand;
}

- (void)setPlaybackCommand:(id)a3
{
  objc_storeStrong((id *)&self->_playbackCommand, a3);
}

- (BOOL)deactivateAudioSessionOnPlaybackFinished
{
  return self->_deactivateAudioSessionOnPlaybackFinished;
}

- (void)setDeactivateAudioSessionOnPlaybackFinished:(BOOL)a3
{
  self->_deactivateAudioSessionOnPlaybackFinished = a3;
}

- (NSUUID)conversationItemIdentifier
{
  return (NSUUID *)objc_loadWeakRetained((id *)&self->_conversationItemIdentifier);
}

- (void)setConversationItemIdentifier:(id)a3
{
  objc_storeWeak((id *)&self->_conversationItemIdentifier, a3);
}

- (AVAudioPlayer)_player
{
  return self->_player;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_player, 0);
  objc_destroyWeak((id *)&self->_conversationItemIdentifier);
  objc_storeStrong((id *)&self->_playbackCommand, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)audioPlayerDidFinishPlaying:successfully:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0_0(&dword_217514000, v0, v1, "%s Error setting the AVAudioSession to inactive: %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_3();
}

@end
