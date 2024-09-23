@implementation CKAudioController

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  -[CKAudioPlayer setDelegate:](self->_audioPlayer, "setDelegate:", 0);
  -[CKAudioPlayer stop](self->_audioPlayer, "stop");
  v4.receiver = self;
  v4.super_class = (Class)CKAudioController;
  -[CKAudioController dealloc](&v4, sel_dealloc);
}

- (CKAudioController)initWithMediaObjects:(id)a3
{
  id v4;
  CKAudioController *v5;
  void *v6;
  void *v7;
  void *v8;
  char isKindOfClass;
  void *v10;
  void *v11;
  int v12;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)CKAudioController;
  v5 = -[CKAudioController init](&v14, sel_init);
  if (v5)
  {
    v6 = (void *)objc_msgSend(v4, "mutableCopy");
    -[CKAudioController _setMediaObjects:](v5, "_setMediaObjects:", v6);
    v5->_shouldUseSpeaker = 1;
    -[CKAudioController setCurrentIndex:](v5, "setCurrentIndex:", 0x7FFFFFFFFFFFFFFFLL);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObserver:selector:name:object:", v5, sel_audioSessionInterruption_, *MEMORY[0x1E0C896F0], 0);
    objc_msgSend(v7, "addObserver:selector:name:object:", v5, sel_applicationWillResignActive, *MEMORY[0x1E0CEB358], 0);
    objc_msgSend(v6, "firstObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      objc_msgSend(v6, "firstObject");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "messageContext");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "isAudioMessage");

      if (v12)
        -[CKAudioController setupMediaRemoteCommandCenter](v5, "setupMediaRemoteCommandCenter");

    }
  }

  return v5;
}

- (NSArray)mediaObjects
{
  return (NSArray *)self->_mediaObjects;
}

- (void)addMediaObject:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CKAudioController _mediaObjects](self, "_mediaObjects");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v4);

}

- (void)addMediaObjects:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CKAudioController _mediaObjects](self, "_mediaObjects");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObjectsFromArray:", v4);

}

- (void)setShouldUseSpeaker:(BOOL)a3
{
  id v4;

  if (self->_shouldUseSpeaker != a3)
  {
    self->_shouldUseSpeaker = a3;
    if (-[CKAudioController isPlaying](self, "isPlaying"))
    {
      +[CKAudioSessionController shareInstance](CKAudioSessionController, "shareInstance");
      v4 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "activateWithOptions:completion:", -[CKAudioController audioSessionControllerOptions](self, "audioSessionControllerOptions"), 0);

    }
  }
}

- (void)setShouldStopPlayingWhenSilent:(BOOL)a3
{
  id v4;

  if (self->_shouldStopPlayingWhenSilent != a3)
  {
    self->_shouldStopPlayingWhenSilent = a3;
    if (-[CKAudioController isPlaying](self, "isPlaying"))
    {
      +[CKAudioSessionController shareInstance](CKAudioSessionController, "shareInstance");
      v4 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "activateWithOptions:completion:", -[CKAudioController audioSessionControllerOptions](self, "audioSessionControllerOptions"), 0);

    }
  }
}

- (void)setShouldDuckOthers:(BOOL)a3
{
  id v4;

  if (self->_shouldDuckOthers != a3)
  {
    self->_shouldDuckOthers = a3;
    if (-[CKAudioController isPlaying](self, "isPlaying"))
    {
      +[CKAudioSessionController shareInstance](CKAudioSessionController, "shareInstance");
      v4 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "activateWithOptions:completion:", -[CKAudioController audioSessionControllerOptions](self, "audioSessionControllerOptions"), 0);

    }
  }
}

- (unint64_t)audioSessionControllerOptions
{
  unint64_t v3;

  v3 = -[CKAudioController shouldUseSpeaker](self, "shouldUseSpeaker");
  if (-[CKAudioController shouldStopPlayingWhenSilent](self, "shouldStopPlayingWhenSilent"))
    v3 |= 2uLL;
  if (-[CKAudioController shouldDuckOthers](self, "shouldDuckOthers"))
    return v3 | 4;
  else
    return v3;
}

- (void)play
{
  -[CKAudioController playAfterDelay:](self, "playAfterDelay:", 0.0);
  -[CKAudioController setCurrentMediaPlayerInfo](self, "setCurrentMediaPlayerInfo");
}

- (void)playAfterDelay:(double)a3
{
  unint64_t v5;
  int v6;
  NSObject *v7;
  void *v8;
  unint64_t v9;
  void *v10;
  CKAudioPlayer *v11;
  void *v12;
  unint64_t v13;
  void *v14;
  unint64_t v15;
  void *v16;
  CKAudioPlayer *v17;
  void *v18;
  unint64_t v19;
  void *v20;
  double v21;
  _QWORD v22[4];
  CKAudioPlayer *v23;
  CKAudioController *v24;
  id v25;
  id v26[2];
  _QWORD v27[4];
  CKAudioPlayer *v28;
  CKAudioController *v29;
  id v30;
  id v31[2];
  id location;
  _BYTE buf[12];
  __int16 v34;
  uint64_t v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v5 = -[CKAudioController currentIndex](self, "currentIndex");
  v6 = IMOSLoggingEnabled();
  if (v5 == 0x7FFFFFFFFFFFFFFFLL)
  {
    if (!v6)
      goto LABEL_10;
    OSLogHandleForIMFoundationCategory();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      -[CKAudioController _mediaObjects](self, "_mediaObjects");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134217984;
      *(_QWORD *)&buf[4] = objc_msgSend(v8, "count");
      _os_log_impl(&dword_18DFCD000, v7, OS_LOG_TYPE_INFO, "Playing audio message. _currentIndex was NSNotFound. [[self _mediaObjects] count]: %llu", buf, 0xCu);

    }
  }
  else
  {
    if (!v6)
      goto LABEL_10;
    OSLogHandleForIMFoundationCategory();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v9 = -[CKAudioController currentIndex](self, "currentIndex");
      -[CKAudioController _mediaObjects](self, "_mediaObjects");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218240;
      *(_QWORD *)&buf[4] = v9;
      v34 = 2048;
      v35 = objc_msgSend(v10, "count");
      _os_log_impl(&dword_18DFCD000, v7, OS_LOG_TYPE_INFO, "Playing %llu of %llu audio messages.", buf, 0x16u);

    }
  }

LABEL_10:
  -[CKAudioController audioPlayer](self, "audioPlayer");
  v11 = (CKAudioPlayer *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)buf = 0;
  objc_initWeak((id *)buf, self);
  if (v11)
  {
    if (!-[CKAudioPlayer isPlaying](v11, "isPlaying"))
    {
      location = 0;
      objc_initWeak(&location, v11);
      +[CKAudioSessionController shareInstance](CKAudioSessionController, "shareInstance");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = -[CKAudioController audioSessionControllerOptions](self, "audioSessionControllerOptions");
      v27[0] = MEMORY[0x1E0C809B0];
      v27[1] = 3221225472;
      v27[2] = __36__CKAudioController_playAfterDelay___block_invoke;
      v27[3] = &unk_1E2756A10;
      v11 = v11;
      v28 = v11;
      v31[1] = *(id *)&a3;
      objc_copyWeak(&v30, (id *)buf);
      objc_copyWeak(v31, &location);
      v29 = self;
      objc_msgSend(v12, "activateWithOptions:completion:", v13, v27);

      objc_destroyWeak(v31);
      objc_destroyWeak(&v30);

      objc_destroyWeak(&location);
    }
  }
  else
  {
    if (-[CKAudioController currentIndex](self, "currentIndex") == 0x7FFFFFFFFFFFFFFFLL)
      -[CKAudioController setCurrentIndex:](self, "setCurrentIndex:", 0);
    -[CKAudioController _mediaObjects](self, "_mediaObjects");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = -[CKAudioController currentIndex](self, "currentIndex");
    if (v15 >= objc_msgSend(v14, "count"))
    {
      v11 = 0;
    }
    else
    {
      objc_msgSend(v14, "objectAtIndex:", -[CKAudioController currentIndex](self, "currentIndex"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v16, "shouldSuppressPreview") & 1) != 0)
      {
        v11 = 0;
      }
      else
      {
        v17 = -[CKAudioPlayer initWithMediaObject:shouldUseAVPlayer:]([CKAudioPlayer alloc], "initWithMediaObject:shouldUseAVPlayer:", v16, -[CKAudioController shouldUseAVPlayer](self, "shouldUseAVPlayer"));
        -[CKAudioPlayer setDelegate:](v17, "setDelegate:", self);
        -[CKAudioController setAudioPlayer:](self, "setAudioPlayer:", v17);
        location = 0;
        objc_initWeak(&location, v17);
        +[CKAudioSessionController shareInstance](CKAudioSessionController, "shareInstance");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = -[CKAudioController audioSessionControllerOptions](self, "audioSessionControllerOptions");
        v22[0] = MEMORY[0x1E0C809B0];
        v22[1] = 3221225472;
        v22[2] = __36__CKAudioController_playAfterDelay___block_invoke_3;
        v22[3] = &unk_1E2756A10;
        v11 = v17;
        v23 = v11;
        v26[1] = *(id *)&a3;
        objc_copyWeak(&v25, (id *)buf);
        objc_copyWeak(v26, &location);
        v24 = self;
        objc_msgSend(v18, "activateWithOptions:completion:", v19, v22);

        -[CKAudioController delegate](self, "delegate");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          -[CKAudioPlayer duration](v11, "duration");
          objc_msgSend(v20, "audioController:mediaObjectProgressDidChange:currentTime:duration:", self, v16, 0.0, v21);
        }

        objc_destroyWeak(v26);
        objc_destroyWeak(&v25);

        objc_destroyWeak(&location);
      }

    }
  }
  objc_destroyWeak((id *)buf);

}

void __36__CKAudioController_playAfterDelay___block_invoke(uint64_t a1)
{
  void *v2;
  double v3;
  uint64_t v4;
  uint64_t v5;
  void (*v6)(uint64_t, int);
  void *v7;
  id v8;
  id v9;

  v2 = *(void **)(a1 + 32);
  v3 = *(double *)(a1 + 64);
  v4 = MEMORY[0x1E0C809B0];
  v5 = 3221225472;
  v6 = __36__CKAudioController_playAfterDelay___block_invoke_2;
  v7 = &unk_1E27569E8;
  objc_copyWeak(&v8, (id *)(a1 + 48));
  objc_copyWeak(&v9, (id *)(a1 + 56));
  objc_msgSend(v2, "playAfterDelay:completion:", &v4, v3);
  objc_msgSend(*(id *)(a1 + 40), "setPlaying:", 1, v4, v5, v6, v7);
  objc_destroyWeak(&v9);
  objc_destroyWeak(&v8);
}

void __36__CKAudioController_playAfterDelay___block_invoke_2(uint64_t a1, int a2)
{
  id v4;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = objc_loadWeakRetained((id *)(a1 + 40));
  if (a2)
    objc_msgSend(WeakRetained, "audioPlayerDidFinishPlaying:", v4);

}

void __36__CKAudioController_playAfterDelay___block_invoke_3(id *a1)
{
  void (**v2)(_QWORD);
  _QWORD aBlock[4];
  id v4;
  id v5;
  id v6;
  id v7[2];

  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __36__CKAudioController_playAfterDelay___block_invoke_4;
  aBlock[3] = &unk_1E2756A10;
  v4 = a1[4];
  v7[1] = a1[8];
  objc_copyWeak(&v6, a1 + 6);
  objc_copyWeak(v7, a1 + 7);
  v5 = a1[5];
  v2 = (void (**)(_QWORD))_Block_copy(aBlock);
  if ((objc_msgSend(a1[5], "shouldUseSpeaker") & 1) != 0)
    v2[2](v2);
  else
    objc_msgSend(a1[5], "playListenSound:", v2);

  objc_destroyWeak(v7);
  objc_destroyWeak(&v6);

}

void __36__CKAudioController_playAfterDelay___block_invoke_4(uint64_t a1)
{
  void *v2;
  double v3;
  uint64_t v4;
  uint64_t v5;
  void (*v6)(uint64_t, int);
  void *v7;
  id v8;
  id v9;

  v2 = *(void **)(a1 + 32);
  v3 = *(double *)(a1 + 64);
  v4 = MEMORY[0x1E0C809B0];
  v5 = 3221225472;
  v6 = __36__CKAudioController_playAfterDelay___block_invoke_5;
  v7 = &unk_1E27569E8;
  objc_copyWeak(&v8, (id *)(a1 + 48));
  objc_copyWeak(&v9, (id *)(a1 + 56));
  objc_msgSend(v2, "playAfterDelay:completion:", &v4, v3);
  objc_msgSend(*(id *)(a1 + 40), "setPlaying:", 1, v4, v5, v6, v7);
  objc_msgSend(*(id *)(a1 + 40), "setCurrentMediaPlayerInfo");
  objc_destroyWeak(&v9);
  objc_destroyWeak(&v8);
}

void __36__CKAudioController_playAfterDelay___block_invoke_5(uint64_t a1, int a2)
{
  id v4;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = objc_loadWeakRetained((id *)(a1 + 40));
  if (a2)
    objc_msgSend(WeakRetained, "audioPlayerDidFinishPlaying:", v4);

}

- (void)prepareToPlay
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  unint64_t v8;
  id v9;
  id v10;
  unint64_t v11;
  _QWORD v12[4];
  id v13;
  CKAudioController *v14;
  id v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__47;
  v21 = __Block_byref_object_dispose__47;
  v22 = 0;
  -[CKAudioController audioPlayer](self, "audioPlayer");
  v22 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend((id)v18[5], "isPlaying"))
  {
    objc_msgSend((id)v18[5], "mediaObject");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKAudioController _notifyPlayerDidPrepareMediaObject:successfully:](self, "_notifyPlayerDidPrepareMediaObject:successfully:", v3, 1);
  }
  else
  {
    if (-[CKAudioController currentIndex](self, "currentIndex") == 0x7FFFFFFFFFFFFFFFLL)
      -[CKAudioController setCurrentIndex:](self, "setCurrentIndex:", 0);
    -[CKAudioController _mediaObjects](self, "_mediaObjects");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (void *)v18[5];
    if (v4)
      goto LABEL_6;
    v11 = -[CKAudioController currentIndex](self, "currentIndex");
    if (v11 >= objc_msgSend(v3, "count"))
    {
      -[CKAudioController _notifyPlayerDidPrepareMediaObject:successfully:](self, "_notifyPlayerDidPrepareMediaObject:successfully:", 0, 0);
      goto LABEL_8;
    }
    v4 = (void *)v18[5];
    if (v4)
    {
LABEL_6:
      objc_msgSend(v4, "mediaObject");
      v5 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(v3, "objectAtIndex:", -[CKAudioController currentIndex](self, "currentIndex"));
      v5 = objc_claimAutoreleasedReturnValue();
    }
    v6 = (void *)v5;
    +[CKAudioSessionController shareInstance](CKAudioSessionController, "shareInstance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[CKAudioController audioSessionControllerOptions](self, "audioSessionControllerOptions");
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __34__CKAudioController_prepareToPlay__block_invoke;
    v12[3] = &unk_1E2756A38;
    v9 = v7;
    v13 = v9;
    v14 = self;
    v10 = v6;
    v15 = v10;
    v16 = &v17;
    objc_msgSend(v9, "activateWithOptions:completion:", v8, v12);

  }
LABEL_8:

  _Block_object_dispose(&v17, 8);
}

uint64_t __34__CKAudioController_prepareToPlay__block_invoke(uint64_t a1)
{
  void *v2;
  CKAudioPlayer *v3;
  uint64_t v4;
  void *v5;

  if ((objc_msgSend(*(id *)(a1 + 32), "isActive") & 1) == 0)
    return objc_msgSend(*(id *)(a1 + 40), "_notifyPlayerDidPrepareMediaObject:successfully:", *(_QWORD *)(a1 + 48), 0);
  v2 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
  if (!v2)
  {
    v3 = -[CKAudioPlayer initWithMediaObject:shouldUseAVPlayer:]([CKAudioPlayer alloc], "initWithMediaObject:shouldUseAVPlayer:", *(_QWORD *)(a1 + 48), objc_msgSend(*(id *)(a1 + 40), "shouldUseAVPlayer"));
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v5 = *(void **)(v4 + 40);
    *(_QWORD *)(v4 + 40) = v3;

    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "setDelegate:", *(_QWORD *)(a1 + 40));
    objc_msgSend(*(id *)(a1 + 40), "setAudioPlayer:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40));
    v2 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
  }
  return objc_msgSend(v2, "prepareToPlay");
}

- (void)pause
{
  void *v3;
  id v4;

  -[CKAudioController audioPlayer](self, "audioPlayer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "pause");

  -[CKAudioController setPlaying:](self, "setPlaying:", 0);
  -[CKAudioController setCurrentMediaPlayerInfo](self, "setCurrentMediaPlayerInfo");
  -[CKAudioController delegate](self, "delegate");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v4, "audioControllerDidPause:", self);

}

- (void)stop
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  _DWORD v7[2];
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      v7[0] = 67109120;
      v7[1] = -[CKAudioController interrupted](self, "interrupted");
      _os_log_impl(&dword_18DFCD000, v3, OS_LOG_TYPE_INFO, "Stop (interruption: %d)", (uint8_t *)v7, 8u);
    }

  }
  -[CKAudioController audioPlayer](self, "audioPlayer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stop");

  -[CKAudioController setPlaying:](self, "setPlaying:", 0);
  if (!-[CKAudioController interrupted](self, "interrupted"))
  {
    +[CKAudioSessionController shareInstance](CKAudioSessionController, "shareInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "deactivate");

  }
  -[CKAudioController delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v6, "audioControllerDidStop:", self);
  -[CKAudioController clearMediaPlayerInfo](self, "clearMediaPlayerInfo");

}

- (void)setCurrentTime:(double)a3
{
  void *v5;
  double v6;
  void *v7;
  double v8;
  id v9;

  -[CKAudioController audioPlayer](self, "audioPlayer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v6) = 0;
  objc_msgSend(v5, "setVolume:", v6);

  -[CKAudioController audioPlayer](self, "audioPlayer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setCurrentTime:", a3);

  -[CKAudioController setCurrentMediaPlayerInfo](self, "setCurrentMediaPlayerInfo");
  -[CKAudioController audioPlayer](self, "audioPlayer");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  LODWORD(v8) = 1.0;
  objc_msgSend(v9, "setVolume:", v8);

}

- (void)layoutViewsForScrubbingTime:(double)a3
{
  void *v5;
  id v6;

  -[CKAudioController delegate](self, "delegate");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[CKAudioController currentMediaObject](self, "currentMediaObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "audioController:layoutViewsForScrubbingTime:mediaObject:", self, v5, a3);

  }
}

- (void)setPlaybackSpeed:(double)a3
{
  id v4;

  -[CKAudioController audioPlayer](self, "audioPlayer");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPlaybackSpeed:", a3);

}

- (double)playbackSpeed
{
  void *v2;
  double v3;
  double v4;

  -[CKAudioController audioPlayer](self, "audioPlayer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "playbackSpeed");
  v4 = v3;

  return v4;
}

- (CKMediaObject)currentMediaObject
{
  void *v2;
  void *v4;

  if (self->_currentIndex == 0x7FFFFFFFFFFFFFFFLL)
  {
    v2 = 0;
  }
  else
  {
    -[CKAudioController _mediaObjects](self, "_mediaObjects");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectAtIndex:", self->_currentIndex);
    v2 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return (CKMediaObject *)v2;
}

- (double)currentMediaObjectTime
{
  void *v2;
  double v3;
  double v4;

  -[CKAudioController audioPlayer](self, "audioPlayer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "currentTime");
  v4 = v3;

  return v4;
}

- (double)currentMediaObjectDuration
{
  void *v2;
  double v3;
  double v4;

  -[CKAudioController audioPlayer](self, "audioPlayer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "duration");
  v4 = v3;

  return v4;
}

- (void)setVolume:(float)a3
{
  double v4;
  id v5;

  -[CKAudioController audioPlayer](self, "audioPlayer");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  *(float *)&v4 = a3;
  objc_msgSend(v5, "setVolume:", v4);

}

- (float)volume
{
  void *v2;
  float v3;
  float v4;

  -[CKAudioController audioPlayer](self, "audioPlayer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "volume");
  v4 = v3;

  return v4;
}

- (void)audioPlayerDidGetInterrupted
{
  -[CKAudioController setInterrupted:](self, "setInterrupted:", 1);
  -[CKAudioController stop](self, "stop");
}

- (void)audioPlayerCurrentTimeDidChange:(id)a3
{
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  id v9;

  v9 = a3;
  -[CKAudioController delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[CKAudioController currentMediaObject](self, "currentMediaObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "currentTime");
    v7 = v6;
    objc_msgSend(v9, "duration");
    objc_msgSend(v4, "audioController:mediaObjectProgressDidChange:currentTime:duration:", self, v5, v7, v8);

  }
}

- (void)audioPlayerDidFinishPlaying:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  unint64_t v7;
  void *v8;
  unint64_t v9;
  _QWORD v10[5];

  v4 = a3;
  -[CKAudioController delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[CKAudioController currentMediaObject](self, "currentMediaObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "audioController:mediaObjectDidFinishPlaying:", self, v6);

  }
  objc_msgSend(v4, "setDelegate:", 0);
  -[CKAudioController setAudioPlayer:](self, "setAudioPlayer:", 0);
  v7 = self->_currentIndex + 1;
  -[CKAudioController _mediaObjects](self, "_mediaObjects");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count");

  if (v7 >= v9)
  {
    if (-[CKAudioController shouldUseSpeaker](self, "shouldUseSpeaker"))
    {
      -[CKAudioController stop](self, "stop");
    }
    else
    {
      v10[0] = MEMORY[0x1E0C809B0];
      v10[1] = 3221225472;
      v10[2] = __49__CKAudioController_audioPlayerDidFinishPlaying___block_invoke;
      v10[3] = &unk_1E274A208;
      v10[4] = self;
      -[CKAudioController playListenEndSound:](self, "playListenEndSound:", v10);
    }
  }
  else
  {
    ++self->_currentIndex;
    -[CKAudioController play](self, "play");
  }

}

uint64_t __49__CKAudioController_audioPlayerDidFinishPlaying___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "stop");
}

- (void)audioPlayerDidPrepareAudioToPlay:(id)a3 successfully:(BOOL)a4
{
  id v5;

  objc_msgSend(a3, "mediaObject");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[CKAudioController _notifyPlayerDidPrepareMediaObject:successfully:](self, "_notifyPlayerDidPrepareMediaObject:successfully:", v5, 1);

}

- (void)_notifyPlayerDidPrepareMediaObject:(id)a3 successfully:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;
  id v7;

  v4 = a4;
  v7 = a3;
  -[CKAudioController delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v6, "audioController:didPrepareMediaObjectToPlay:successfully:", self, v7, v4);

}

- (void)playListenSound:(id)a3
{
  id v4;
  CKAudioPlayer *v5;
  void *v6;
  CKAudioPlayer *v7;
  CKAudioPlayer *listenAudioPlayer;
  CKAudioPlayer *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id location;

  v4 = a3;
  v5 = [CKAudioPlayer alloc];
  objc_msgSend(MEMORY[0x1E0C99E98], "ckURLForResource:withExtension:", CFSTR("MessageListen"), CFSTR("caf"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[CKAudioPlayer initWithFileURL:](v5, "initWithFileURL:", v6);
  listenAudioPlayer = self->_listenAudioPlayer;
  self->_listenAudioPlayer = v7;

  location = 0;
  objc_initWeak(&location, self);
  v9 = self->_listenAudioPlayer;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __37__CKAudioController_playListenSound___block_invoke;
  v11[3] = &unk_1E2756A60;
  objc_copyWeak(&v13, &location);
  v10 = v4;
  v12 = v10;
  -[CKAudioPlayer playAfterDelay:completion:](v9, "playAfterDelay:completion:", v11, 0.0);

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);

}

void __37__CKAudioController_playListenSound___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  v6 = WeakRetained;
  if (WeakRetained)
  {
    v4 = (void *)*((_QWORD *)WeakRetained + 1);
    *((_QWORD *)WeakRetained + 1) = 0;

    v3 = v6;
  }
  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
  {
    (*(void (**)(uint64_t, void *))(v5 + 16))(v5, v3);
    v3 = v6;
  }

}

- (void)playListenEndSound:(id)a3
{
  id v4;
  CKAudioPlayer *v5;
  void *v6;
  CKAudioPlayer *v7;
  CKAudioPlayer *listenAudioPlayer;
  CKAudioPlayer *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id location;

  v4 = a3;
  v5 = [CKAudioPlayer alloc];
  objc_msgSend(MEMORY[0x1E0C99E98], "ckURLForResource:withExtension:", CFSTR("MessageListenEnd"), CFSTR("caf"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[CKAudioPlayer initWithFileURL:](v5, "initWithFileURL:", v6);
  listenAudioPlayer = self->_listenAudioPlayer;
  self->_listenAudioPlayer = v7;

  location = 0;
  objc_initWeak(&location, self);
  v9 = self->_listenAudioPlayer;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __40__CKAudioController_playListenEndSound___block_invoke;
  v11[3] = &unk_1E2756A60;
  objc_copyWeak(&v13, &location);
  v10 = v4;
  v12 = v10;
  -[CKAudioPlayer playAfterDelay:completion:](v9, "playAfterDelay:completion:", v11, 0.0);

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);

}

void __40__CKAudioController_playListenEndSound___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  v6 = WeakRetained;
  if (WeakRetained)
  {
    v4 = (void *)*((_QWORD *)WeakRetained + 1);
    *((_QWORD *)WeakRetained + 1) = 0;

    v3 = v6;
  }
  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
  {
    (*(void (**)(uint64_t, void *))(v5 + 16))(v5, v3);
    v3 = v6;
  }

}

- (void)audioSessionInterruption:(id)a3
{
  void *v4;

  -[CKAudioController setInterrupted:](self, "setInterrupted:", 1);
  -[CKAudioController audioPlayer](self, "audioPlayer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stop");

  -[CKAudioController setInterrupted:](self, "setInterrupted:", 0);
}

- (void)applicationWillResignActive
{
  void *v3;
  char v4;
  id v5;

  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isBackgroundAudioEnabled");

  if ((v4 & 1) == 0)
  {
    -[CKAudioController audioPlayer](self, "audioPlayer");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stop");

  }
}

- (void)setPlaying:(BOOL)a3
{
  id v4;

  if (self->_playing != a3)
  {
    self->_playing = a3;
    -[CKAudioController delegate](self, "delegate");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v4, "audioControllerPlayingDidChange:", self);

  }
}

- (NSMutableArray)_mediaObjects
{
  return self->_mediaObjects;
}

- (void)_setMediaObjects:(id)a3
{
  objc_storeStrong((id *)&self->_mediaObjects, a3);
}

- (CKAudioControllerDelegate)delegate
{
  return (CKAudioControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)shouldUseSpeaker
{
  return self->_shouldUseSpeaker;
}

- (BOOL)shouldStopPlayingWhenSilent
{
  return self->_shouldStopPlayingWhenSilent;
}

- (BOOL)shouldDuckOthers
{
  return self->_shouldDuckOthers;
}

- (BOOL)shouldUseAVPlayer
{
  return self->_shouldUseAVPlayer;
}

- (void)setShouldUseAVPlayer:(BOOL)a3
{
  self->_shouldUseAVPlayer = a3;
}

- (CKAudioPlayer)audioPlayer
{
  return self->_audioPlayer;
}

- (void)setAudioPlayer:(id)a3
{
  objc_storeStrong((id *)&self->_audioPlayer, a3);
}

- (unint64_t)currentIndex
{
  return self->_currentIndex;
}

- (void)setCurrentIndex:(unint64_t)a3
{
  self->_currentIndex = a3;
}

- (BOOL)isPlaying
{
  return self->_playing;
}

- (BOOL)isPaused
{
  return self->_paused;
}

- (void)setPaused:(BOOL)a3
{
  self->_paused = a3;
}

- (BOOL)interrupted
{
  return self->_interrupted;
}

- (void)setInterrupted:(BOOL)a3
{
  self->_interrupted = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_audioPlayer, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_mediaObjects, 0);
  objc_storeStrong((id *)&self->_listenAudioPlayer, 0);
}

- (void)setupMediaRemoteCommandCenter
{
  CKAudioController *v2;

  v2 = self;
  CKAudioController.setupMediaRemoteCommandCenter()();

}

- (void)setCurrentMediaPlayerInfo
{
  CKAudioController *v2;

  v2 = self;
  CKAudioController.setCurrentMediaPlayerInfo()();

}

- (void)clearMediaPlayerInfo
{
  void *v3;
  id v4;
  CKAudioController *v5;
  CKAudioController *v6;
  CKAudioController *v7;

  v3 = (void *)objc_opt_self();
  v7 = self;
  v4 = objc_msgSend(v3, sel_sharedFeatureFlags);
  LODWORD(v3) = objc_msgSend(v4, sel_isBackgroundAudioEnabled);

  if ((_DWORD)v3)
  {
    v5 = (CKAudioController *)objc_msgSend((id)objc_opt_self(), sel_defaultCenter);
    -[CKAudioController setNowPlayingInfo:](v5, sel_setNowPlayingInfo_, 0);

    v6 = v5;
  }
  else
  {
    v6 = v7;
  }

}

@end
