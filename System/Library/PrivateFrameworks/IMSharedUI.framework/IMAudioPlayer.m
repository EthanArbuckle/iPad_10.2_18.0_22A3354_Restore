@implementation IMAudioPlayer

- (void)dealloc
{
  uint64_t v2;
  const char *v4;
  uint64_t v5;
  NSObject *v6;
  const char *v7;
  uint64_t v8;
  objc_super v9;

  if (objc_msgSend_isPlaying(self->_audioPlayer, a2, v2) && self->_block)
  {
    objc_msgSend_audio(IMSharedUILogs, v4, v5);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      sub_20D65DDD4(v6);

  }
  objc_msgSend_setDelegate_(self->_audioPlayer, v4, 0);
  objc_msgSend_stopTimer(self, v7, v8);
  v9.receiver = self;
  v9.super_class = (Class)IMAudioPlayer;
  -[IMAudioPlayer dealloc](&v9, sel_dealloc);
}

- (IMAudioPlayer)initWithContentsOfURL:(id)a3 shouldUseAVPlayer:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  const char *v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  void *v11;
  IMInternalAVAudioPlayer *v12;
  const char *v13;
  void *v14;
  const char *v15;
  const char *v16;
  objc_super v18;

  v4 = a4;
  v6 = a3;
  v18.receiver = self;
  v18.super_class = (Class)IMAudioPlayer;
  v9 = -[IMAudioPlayer init](&v18, sel_init);
  if (v9)
  {
    v10 = objc_msgSend_copy(v6, v7, v8);
    v11 = (void *)*((_QWORD *)v9 + 1);
    *((_QWORD *)v9 + 1) = v10;

    v12 = [IMInternalAVAudioPlayer alloc];
    v14 = (void *)objc_msgSend_initWithContentsOfURL_playerType_(v12, v13, *((_QWORD *)v9 + 1), v4);
    objc_msgSend_setDelegate_(v14, v15, (uint64_t)v9);
    objc_msgSend_setAudioPlayer_(v9, v16, (uint64_t)v14);

  }
  return (IMAudioPlayer *)v9;
}

- (IMAudioPlayer)initWithContentsOfURL:(id)a3
{
  return (IMAudioPlayer *)objc_msgSend_initWithContentsOfURL_shouldUseAVPlayer_(self, a2, (uint64_t)a3, 0);
}

+ (IMAudioPlayer)audioPlayerWithContentsOfURL:(id)a3
{
  id v3;
  id v4;
  const char *v5;
  void *shouldUseAVPlayer;

  v3 = a3;
  v4 = objc_alloc((Class)objc_opt_class());
  shouldUseAVPlayer = (void *)objc_msgSend_initWithContentsOfURL_shouldUseAVPlayer_(v4, v5, (uint64_t)v3, 0);

  return (IMAudioPlayer *)shouldUseAVPlayer;
}

+ (IMAudioPlayer)audioPlayerWithContentsOfURL:(id)a3 shouldUseAVPlayer:(BOOL)a4
{
  _BOOL8 v4;
  id v5;
  id v6;
  const char *v7;
  void *shouldUseAVPlayer;

  v4 = a4;
  v5 = a3;
  v6 = objc_alloc((Class)objc_opt_class());
  shouldUseAVPlayer = (void *)objc_msgSend_initWithContentsOfURL_shouldUseAVPlayer_(v6, v7, (uint64_t)v5, v4);

  return (IMAudioPlayer *)shouldUseAVPlayer;
}

- (void)playAfterDelay:(double)a3 completion:(id)a4
{
  id v6;
  const char *v7;
  uint64_t v8;
  double v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  double v13;
  const char *v14;
  uint64_t v15;
  id WeakRetained;
  const char *v17;
  uint64_t v18;
  id v19;

  v6 = a4;
  v9 = fmax(a3, 0.0);
  v19 = v6;
  if (self->_block)
  {
    (*((void (**)(id, _QWORD, _QWORD, _QWORD))v6 + 2))(v6, 0, 0, 0);
  }
  else if (!v6)
  {
    goto LABEL_5;
  }
  objc_msgSend_setBlock_(self, v7, (uint64_t)v19);
LABEL_5:
  objc_msgSend_audioPlayer(self, v7, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_deviceCurrentTime(v10, v11, v12);
  objc_msgSend_playAtTime_(v10, v14, v15, v9 + v13);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (WeakRetained)
    objc_msgSend_startTimer(self, v17, v18);

}

- (BOOL)usesAVPlayer
{
  uint64_t v2;
  void *v3;
  const char *v4;
  uint64_t v5;
  BOOL v6;

  objc_msgSend_audioPlayer(self, a2, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend_playerType(v3, v4, v5) == 1;

  return v6;
}

- (void)startTimer
{
  uint64_t v2;
  const char *v4;
  const char *v5;
  uint64_t v6;
  const char *v7;
  id v8;

  objc_msgSend_stopTimer(self, a2, v2);
  objc_msgSend_displayLinkWithTarget_selector_(IMDisplayLink, v4, (uint64_t)self, sel_timerDidExpire_);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_schedule(v8, v5, v6);
  objc_msgSend_setDisplayLink_(self, v7, (uint64_t)v8);

}

- (void)stopTimer
{
  uint64_t v2;
  IMDisplayLink *displayLink;
  IMDisplayLink *v5;

  displayLink = self->_displayLink;
  if (displayLink)
  {
    objc_msgSend_invalidate(displayLink, a2, v2);
    v5 = self->_displayLink;
    self->_displayLink = 0;

  }
}

- (void)timerDidExpire:(id)a3
{
  const char *v4;
  id v5;

  objc_msgSend_delegate(self, a2, (uint64_t)a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_audioPlayerCurrentTimeDidChange_(v5, v4, (uint64_t)self);

}

- (void)stop
{
  uint64_t v2;
  void *v4;
  const char *v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;

  objc_msgSend_audioPlayer(self, a2, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setDelegate_(v4, v5, 0);

  objc_msgSend_audioPlayer(self, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stop(v8, v9, v10);

  objc_msgSend_stopTimer(self, v11, v12);
}

- (void)pause
{
  uint64_t v2;
  void *v4;
  const char *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;

  objc_msgSend_audioPlayer(self, a2, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_pause(v4, v5, v6);

  objc_msgSend_stopTimer(self, v7, v8);
}

- (void)prepareToPlay
{
  uint64_t v2;
  const char *v3;
  uint64_t v4;
  id v5;

  objc_msgSend_audioPlayer(self, a2, v2);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_prepareToPlay(v5, v3, v4);

}

- (BOOL)isPlaying
{
  uint64_t v2;
  void *v3;
  const char *v4;
  uint64_t v5;
  char isPlaying;

  objc_msgSend_audioPlayer(self, a2, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  isPlaying = objc_msgSend_isPlaying(v3, v4, v5);

  return isPlaying;
}

- (double)currentTime
{
  uint64_t v2;
  double prevCurrentTime;
  void *v5;
  const char *v6;
  uint64_t v7;
  double v8;
  double v9;
  double result;

  prevCurrentTime = self->_prevCurrentTime;
  objc_msgSend_audioPlayer(self, a2, v2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_currentTime(v5, v6, v7);
  v9 = v8;

  if (prevCurrentTime >= v9)
    result = prevCurrentTime;
  else
    result = v9;
  self->_prevCurrentTime = result;
  return result;
}

- (double)duration
{
  uint64_t v2;
  void *v3;
  const char *v4;
  uint64_t v5;
  double v6;
  double v7;

  objc_msgSend_audioPlayer(self, a2, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_duration(v3, v4, v5);
  v7 = v6;

  return v7;
}

- (void)setVolume:(float)a3
{
  uint64_t v3;
  double v5;
  const char *v6;
  uint64_t v7;
  id v8;

  objc_msgSend_audioPlayer(self, a2, v3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  *(float *)&v5 = a3;
  objc_msgSend_setVolume_(v8, v6, v7, v5);

}

- (float)volume
{
  uint64_t v2;
  void *v3;
  const char *v4;
  uint64_t v5;
  float v6;
  float v7;

  objc_msgSend_audioPlayer(self, a2, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_volume(v3, v4, v5);
  v7 = v6;

  return v7;
}

- (void)internalAudioPlayerDidFinishPlaying:(id)a3 successfully:(BOOL)a4
{
  _BOOL8 v4;
  IMAudioPlayer *v5;
  void (**block)(id, uint64_t, _BOOL8, _QWORD);
  id v7;
  const char *v8;
  uint64_t v9;
  IMAudioPlayer *v10;

  v4 = a4;
  v5 = self;
  block = (void (**)(id, uint64_t, _BOOL8, _QWORD))v5->_block;
  v10 = v5;
  if (block)
  {
    block[2](block, 1, v4, 0);
    v5 = v10;
    v7 = v10->_block;
  }
  else
  {
    v7 = 0;
  }
  v5->_block = 0;

  objc_msgSend_stopTimer(v10, v8, v9);
}

- (void)internalAVAudioPlayerDidPrepareAudioForPlaying:(id)a3 successfully:(BOOL)a4
{
  _BOOL8 v4;
  const char *v6;
  id v7;

  v4 = a4;
  objc_msgSend_delegate(self, a2, (uint64_t)a3);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend_audioPlayerDidPrepareAudioToPlay_successfully_(v7, v6, (uint64_t)self, v4);

}

- (NSURL)audioURL
{
  return self->_audioURL;
}

- (void)setAudioURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (IMAudioPlayerDelegate)delegate
{
  return (IMAudioPlayerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (IMInternalAVAudioPlayer)audioPlayer
{
  return self->_audioPlayer;
}

- (void)setAudioPlayer:(id)a3
{
  objc_storeStrong((id *)&self->_audioPlayer, a3);
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
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (IMDisplayLink)displayLink
{
  return self->_displayLink;
}

- (void)setDisplayLink:(id)a3
{
  objc_storeStrong((id *)&self->_displayLink, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayLink, 0);
  objc_storeStrong(&self->_block, 0);
  objc_storeStrong((id *)&self->_audioPlayer, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_audioURL, 0);
}

@end
