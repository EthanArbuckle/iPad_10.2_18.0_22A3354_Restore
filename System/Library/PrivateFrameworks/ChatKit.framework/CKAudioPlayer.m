@implementation CKAudioPlayer

- (void)dealloc
{
  NSObject *v3;
  objc_super v4;
  uint8_t buf[16];

  if (-[CKInternalAudioPlayer isPlaying](self->_audioPlayer, "isPlaying")
    && self->_block
    && IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18DFCD000, v3, OS_LOG_TYPE_INFO, "CKAudioPlayer deallocated while playing, completion block won't be called.", buf, 2u);
    }

  }
  -[CKInternalAudioPlayer setDelegate:](self->_audioPlayer, "setDelegate:", 0);
  -[CADisplayLink invalidate](self->_displayLink, "invalidate");
  v4.receiver = self;
  v4.super_class = (Class)CKAudioPlayer;
  -[CKAudioPlayer dealloc](&v4, sel_dealloc);
}

- (CKAudioPlayer)initWithMediaObject:(id)a3
{
  return -[CKAudioPlayer initWithMediaObject:shouldUseAVPlayer:](self, "initWithMediaObject:shouldUseAVPlayer:", a3, 0);
}

- (CKAudioPlayer)initWithMediaObject:(id)a3 shouldUseAVPlayer:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  CKAudioPlayer *v7;
  CKAudioPlayer *v8;
  CKInternalAudioPlayer *v9;
  void *v10;
  CKInternalAudioPlayer *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  objc_super v16;

  v4 = a4;
  v6 = a3;
  v16.receiver = self;
  v16.super_class = (Class)CKAudioPlayer;
  v7 = -[CKAudioPlayer init](&v16, sel_init);
  v8 = v7;
  if (v7)
  {
    -[CKAudioPlayer setMediaObject:](v7, "setMediaObject:", v6);
    v9 = [CKInternalAudioPlayer alloc];
    objc_msgSend(v6, "fileURL");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[CKInternalAudioPlayer initWithContentsOfURL:playerType:](v9, "initWithContentsOfURL:playerType:", v10, v4);

    -[CKInternalAudioPlayer setDelegate:](v11, "setDelegate:", v8);
    -[CKAudioPlayer setAudioPlayer:](v8, "setAudioPlayer:", v11);
    if (!v4)
    {
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = *MEMORY[0x1E0C896F0];
      objc_msgSend(MEMORY[0x1E0C89AE8], "sharedInstance");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "addObserver:selector:name:object:", v8, sel__handleAudioPlayerInterruption_, v13, v14);

    }
  }

  return v8;
}

- (CKAudioPlayer)initWithFileURL:(id)a3
{
  id v4;
  CKAudioPlayer *v5;
  CKInternalAudioPlayer *v6;
  NSObject *v7;
  objc_super v9;
  uint8_t buf[4];
  id v11;
  __int16 v12;
  CKInternalAudioPlayer *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CKAudioPlayer;
  v5 = -[CKAudioPlayer init](&v9, sel_init);
  if (v5)
  {
    v6 = -[CKInternalAudioPlayer initWithContentsOfURL:playerType:]([CKInternalAudioPlayer alloc], "initWithContentsOfURL:playerType:", v4, 0);
    -[CKInternalAudioPlayer setDelegate:](v6, "setDelegate:", v5);
    -[CKAudioPlayer setAudioPlayer:](v5, "setAudioPlayer:", v6);
    if ((!v4 || !v6) && IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        v11 = v4;
        v12 = 2112;
        v13 = v6;
        _os_log_impl(&dword_18DFCD000, v7, OS_LOG_TYPE_INFO, "Couldn't create an audio player. URL=%@, audioPlayer=%@", buf, 0x16u);
      }

    }
  }

  return v5;
}

- (void)playAfterDelay:(double)a3 completion:(id)a4
{
  id v6;
  double v7;
  void *v8;
  double v9;
  id WeakRetained;
  void *v11;
  void *v12;
  id v13;

  v6 = a4;
  v7 = fmax(a3, 0.0);
  v13 = v6;
  if (self->_block)
  {
    (*((void (**)(id, _QWORD, _QWORD, _QWORD))v6 + 2))(v6, 0, 0, 0);
  }
  else if (!v6)
  {
    goto LABEL_5;
  }
  -[CKAudioPlayer setBlock:](self, "setBlock:", v13);
LABEL_5:
  -[CKAudioPlayer audioPlayer](self, "audioPlayer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "deviceCurrentTime");
  objc_msgSend(v8, "playAtTime:", v7 + v9);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (WeakRetained)
  {
    objc_msgSend(MEMORY[0x1E0CD2730], "displayLinkWithTarget:selector:", self, sel_displayLinkFired_);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setPreferredFramesPerSecond:", 60);
    objc_msgSend(MEMORY[0x1E0C99E58], "mainRunLoop");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addToRunLoop:forMode:", v12, *MEMORY[0x1E0C99860]);

    -[CKAudioPlayer setDisplayLink:](self, "setDisplayLink:", v11);
  }

}

- (BOOL)usesAVPlayer
{
  void *v2;
  BOOL v3;

  -[CKAudioPlayer audioPlayer](self, "audioPlayer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "playerType") == 1;

  return v3;
}

- (void)stop
{
  void *v3;
  void *v4;
  void *v5;

  -[CKAudioPlayer audioPlayer](self, "audioPlayer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stop");

  -[CKAudioPlayer audioPlayer](self, "audioPlayer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "resetCurrentTime");

  -[CKAudioPlayer displayLink](self, "displayLink");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "invalidate");

  -[CKAudioPlayer setDisplayLink:](self, "setDisplayLink:", 0);
  -[CKAudioPlayer setPrevCurrentTime:](self, "setPrevCurrentTime:", 0.0);
}

- (void)pause
{
  void *v3;
  void *v4;

  -[CKAudioPlayer audioPlayer](self, "audioPlayer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "pause");

  -[CKAudioPlayer displayLink](self, "displayLink");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "invalidate");

  -[CKAudioPlayer setDisplayLink:](self, "setDisplayLink:", 0);
}

- (void)prepareToPlay
{
  id v2;

  -[CKAudioPlayer audioPlayer](self, "audioPlayer");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "prepareToPlay");

}

- (BOOL)isPlaying
{
  void *v2;
  char v3;

  -[CKAudioPlayer audioPlayer](self, "audioPlayer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isPlaying");

  return v3;
}

- (void)setCurrentTime:(double)a3
{
  void *v5;
  id v6;

  -[CKAudioPlayer audioPlayer](self, "audioPlayer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setCurrentTime:", a3);

  -[CKAudioPlayer delegate](self, "delegate");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "audioPlayerCurrentTimeDidChange:", self);

}

- (double)currentTime
{
  void *v3;
  void *v4;
  double v5;
  double v6;

  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "isAudioMessagesEntryViewRecordingEnabled");

  -[CKAudioPlayer audioPlayer](self, "audioPlayer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "currentTime");
  v6 = v5;

  return v6;
}

- (void)setPlaybackSpeed:(double)a3
{
  id v4;

  -[CKAudioPlayer audioPlayer](self, "audioPlayer");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPlaybackSpeed:", a3);

}

- (double)playbackSpeed
{
  void *v2;
  double v3;
  double v4;

  -[CKAudioPlayer audioPlayer](self, "audioPlayer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "playbackSpeed");
  v4 = v3;

  return v4;
}

- (double)duration
{
  void *v2;
  double v3;
  double v4;

  -[CKAudioPlayer audioPlayer](self, "audioPlayer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "duration");
  v4 = v3;

  return v4;
}

- (void)setVolume:(float)a3
{
  double v4;
  id v5;

  -[CKAudioPlayer audioPlayer](self, "audioPlayer");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  *(float *)&v4 = a3;
  objc_msgSend(v5, "setVolume:", v4);

}

- (float)volume
{
  void *v2;
  float v3;
  float v4;

  -[CKAudioPlayer audioPlayer](self, "audioPlayer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "volume");
  v4 = v3;

  return v4;
}

- (void)internalAudioPlayerDidFinishPlaying:(id)a3 successfully:(BOOL)a4
{
  _BOOL8 v4;
  CKAudioPlayer *v5;
  void (**block)(id, uint64_t, _BOOL8, _QWORD);
  id v7;
  void *v8;
  CKAudioPlayer *v9;

  v4 = a4;
  v5 = self;
  block = (void (**)(id, uint64_t, _BOOL8, _QWORD))v5->_block;
  v9 = v5;
  if (block)
  {
    block[2](block, 1, v4, 0);
    v5 = v9;
    v7 = v9->_block;
  }
  else
  {
    v7 = 0;
  }
  v5->_block = 0;

  -[CKAudioPlayer displayLink](v9, "displayLink");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "invalidate");

  -[CKAudioPlayer setDisplayLink:](v9, "setDisplayLink:", 0);
}

- (void)internalAudioPlayerDidPrepareAudioForPlaying:(id)a3 successfully:(BOOL)a4
{
  _BOOL8 v4;
  id v6;

  v4 = a4;
  -[CKAudioPlayer delegate](self, "delegate", a3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v6, "audioPlayerDidPrepareAudioToPlay:successfully:", self, v4);

}

- (void)_handleAudioPlayerInterruption:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;

  objc_msgSend(a3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0C89718]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "integerValue");

  if (v6 == 1)
  {
    -[CKAudioPlayer delegate](self, "delegate");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "audioPlayerDidGetInterrupted");

  }
}

- (void)displayLinkFired:(id)a3
{
  id v4;

  -[CKAudioPlayer delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "audioPlayerCurrentTimeDidChange:", self);

}

- (CKMediaObject)mediaObject
{
  return self->_mediaObject;
}

- (void)setMediaObject:(id)a3
{
  objc_storeStrong((id *)&self->_mediaObject, a3);
}

- (CKAudioPlayerDelegate)delegate
{
  return (CKAudioPlayerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (CKInternalAudioPlayer)audioPlayer
{
  return self->_audioPlayer;
}

- (void)setAudioPlayer:(id)a3
{
  objc_storeStrong((id *)&self->_audioPlayer, a3);
}

- (CADisplayLink)displayLink
{
  return self->_displayLink;
}

- (void)setDisplayLink:(id)a3
{
  objc_storeStrong((id *)&self->_displayLink, a3);
}

- (double)prevCurrentTime
{
  return self->_prevCurrentTime;
}

- (void)setPrevCurrentTime:(double)a3
{
  self->_prevCurrentTime = a3;
}

- (id)block
{
  return self->_block;
}

- (void)setBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_block, 0);
  objc_storeStrong((id *)&self->_displayLink, 0);
  objc_storeStrong((id *)&self->_audioPlayer, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_mediaObject, 0);
}

@end
