@implementation IMAssistantAudioPlayer

- (IMAssistantAudioPlayer)initWithDelegate:(id)a3 identifier:(id)a4
{
  id v6;
  id v7;
  IMAssistantAudioPlayer *v8;
  IMAssistantAudioPlayer *v9;
  uint64_t v10;
  NSString *identifier;
  objc_super v13;

  v6 = a3;
  v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)IMAssistantAudioPlayer;
  v8 = -[IMAssistantAudioPlayer init](&v13, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_delegate, v6);
    v10 = objc_msgSend(v7, "copy");
    identifier = v9->_identifier;
    v9->_identifier = (NSString *)v10;

  }
  return v9;
}

- (BOOL)startPlayingAudioURL:(id)a3
{
  id v4;
  AVAudioPlayer *player;
  AVAudioPlayer *v6;
  AVAudioPlayer *v7;
  id v8;
  AVAudioPlayer *v9;
  AVAudioPlayer *v10;
  BOOL v11;
  BOOL v12;
  NSObject *v13;
  id v15;
  uint8_t buf[4];
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  player = self->_player;
  if (player)
  {
    -[AVAudioPlayer setDelegate:](player, "setDelegate:", 0);
    v6 = self->_player;
    self->_player = 0;

  }
  if (!-[IMAssistantAudioPlayer setupAudioSession](self, "setupAudioSession"))
    goto LABEL_13;
  v15 = 0;
  v7 = (AVAudioPlayer *)objc_msgSend(objc_alloc(MEMORY[0x24BDB1848]), "initWithContentsOfURL:error:", v4, &v15);
  v8 = v15;
  v9 = self->_player;
  self->_player = v7;

  v10 = self->_player;
  if (!v10)
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v17 = v8;
        _os_log_impl(&dword_21ED90000, v13, OS_LOG_TYPE_INFO, "Failed to initialize AVAudioPlayer: %@", buf, 0xCu);
      }

    }
    goto LABEL_12;
  }
  -[AVAudioPlayer setDelegate:](v10, "setDelegate:", self);
  if (!-[AVAudioPlayer prepareToPlay](self->_player, "prepareToPlay"))
  {
LABEL_12:

    goto LABEL_13;
  }
  v11 = -[AVAudioPlayer play](self->_player, "play");

  if (!v11)
  {
LABEL_13:
    -[IMAssistantAudioPlayer cleanupAudioSession](self, "cleanupAudioSession");
    v12 = 0;
    goto LABEL_14;
  }
  v12 = 1;
LABEL_14:

  return v12;
}

- (void)stopPlaying
{
  MEMORY[0x24BEDD108](self->_player, sel_stop);
}

- (int64_t)playerState
{
  if (-[AVAudioPlayer isPlaying](self->_player, "isPlaying"))
    return 2;
  else
    return 1;
}

- (BOOL)setupAudioSession
{
  void *v2;
  uint64_t v3;
  char v4;
  id v5;
  void *v6;
  char v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  id v12;
  id v13;
  uint8_t buf[4];
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDB1858], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *MEMORY[0x24BDB15A8];
  v13 = 0;
  v4 = objc_msgSend(v2, "setCategory:withOptions:error:", v3, 19, &v13);
  v5 = v13;

  if ((v4 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDB1858], "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 0;
    v7 = objc_msgSend(v6, "setActive:error:", 1, &v12);
    v8 = v12;

    if ((v7 & 1) == 0 && IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v15 = v8;
        _os_log_impl(&dword_21ED90000, v9, OS_LOG_TYPE_INFO, "Failed to setup AVAudioSession: %@", buf, 0xCu);
      }

    }
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v15 = v5;
        _os_log_impl(&dword_21ED90000, v10, OS_LOG_TYPE_INFO, "Failed to set category and options on AVAudioSession: %@", buf, 0xCu);
      }

    }
    v7 = 0;
  }

  return v7;
}

- (void)cleanupAudioSession
{
  id v2;

  objc_msgSend(MEMORY[0x24BDB1858], "sharedInstance");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setActive:error:", 0, 0);

}

- (void)audioPlayerDidFinishPlaying:(id)a3 successfully:(BOOL)a4
{
  id WeakRetained;
  void *v6;
  id v7;
  char v8;
  id v9;

  -[IMAssistantAudioPlayer cleanupAudioSession](self, "cleanupAudioSession", a3, a4);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained)
  {
    v6 = WeakRetained;
    v7 = objc_loadWeakRetained((id *)&self->_delegate);
    v8 = objc_opt_respondsToSelector();

    if ((v8 & 1) != 0)
    {
      v9 = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(v9, "imAssistantAudioPlayer:didUpdateState:", self, 1);

    }
  }
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_player, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
