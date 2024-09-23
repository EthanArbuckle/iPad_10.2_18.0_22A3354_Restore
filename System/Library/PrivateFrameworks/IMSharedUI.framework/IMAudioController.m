@implementation IMAudioController

- (void)dealloc
{
  const char *v3;
  uint64_t v4;
  objc_super v5;

  objc_msgSend_setDelegate_(self->_audioPlayer, a2, 0);
  objc_msgSend_stop(self->_audioPlayer, v3, v4);
  v5.receiver = self;
  v5.super_class = (Class)IMAudioController;
  -[IMAudioController dealloc](&v5, sel_dealloc);
}

- (IMAudioController)initWithContentsOfURLs:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  IMAudioController *v7;
  uint64_t v8;
  NSMutableArray *audioURLs;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)IMAudioController;
  v7 = -[IMAudioController init](&v11, sel_init);
  if (v7)
  {
    v8 = objc_msgSend_mutableCopy(v4, v5, v6);
    audioURLs = v7->_audioURLs;
    v7->_audioURLs = (NSMutableArray *)v8;

    v7->_shouldUseSpeaker = 1;
    v7->_currentIndex = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v7;
}

+ (Class)audioControllerClass
{
  return (Class)objc_opt_class();
}

+ (id)audioControllerWithContentsOfURLs:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  id v7;
  const char *v8;
  void *v9;

  v4 = a3;
  v7 = objc_alloc((Class)objc_msgSend_audioControllerClass(a1, v5, v6));
  v9 = (void *)objc_msgSend_initWithContentsOfURLs_(v7, v8, (uint64_t)v4);

  return v9;
}

- (NSArray)audioURLs
{
  uint64_t v2;

  return (NSArray *)(id)objc_msgSend_copy(self->_audioURLs, a2, v2);
}

- (void)addContentsOfURL:(id)a3
{
  objc_msgSend_addObject_(self->_audioURLs, a2, (uint64_t)a3);
}

- (void)addContentsOfURLs:(id)a3
{
  MEMORY[0x24BEDD108](self->_audioURLs, sel_addObjectsFromArray_, a3);
}

- (void)setShouldUseSpeaker:(BOOL)a3
{
  const char *v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  id v10;

  if (self->_shouldUseSpeaker != a3)
  {
    self->_shouldUseSpeaker = a3;
    if (objc_msgSend_isPlaying(self, a2, a3))
    {
      objc_msgSend_sharedInstance(IMAudioSessionController, v4, v5);
      v10 = (id)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend_audioSessionControllerOptions(self, v6, v7);
      objc_msgSend_activateWithOptions_completion_(v10, v9, v8, 0);

    }
  }
}

- (void)setShouldStopPlayingWhenSilent:(BOOL)a3
{
  const char *v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  id v10;

  if (self->_shouldStopPlayingWhenSilent != a3)
  {
    self->_shouldStopPlayingWhenSilent = a3;
    if (objc_msgSend_isPlaying(self, a2, a3))
    {
      objc_msgSend_sharedInstance(IMAudioSessionController, v4, v5);
      v10 = (id)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend_audioSessionControllerOptions(self, v6, v7);
      objc_msgSend_activateWithOptions_completion_(v10, v9, v8, 0);

    }
  }
}

- (void)setShouldDuckOthers:(BOOL)a3
{
  const char *v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  id v10;

  if (self->_shouldDuckOthers != a3)
  {
    self->_shouldDuckOthers = a3;
    if (objc_msgSend_isPlaying(self, a2, a3))
    {
      objc_msgSend_sharedInstance(IMAudioSessionController, v4, v5);
      v10 = (id)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend_audioSessionControllerOptions(self, v6, v7);
      objc_msgSend_activateWithOptions_completion_(v10, v9, v8, 0);

    }
  }
}

- (unint64_t)audioSessionControllerOptions
{
  uint64_t v2;
  unint64_t shouldUseSpeaker;
  const char *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;

  shouldUseSpeaker = objc_msgSend_shouldUseSpeaker(self, a2, v2);
  if (objc_msgSend_shouldStopPlayingWhenSilent(self, v5, v6))
    shouldUseSpeaker |= 2uLL;
  if (objc_msgSend_shouldDuckOthers(self, v7, v8))
    return shouldUseSpeaker | 4;
  else
    return shouldUseSpeaker;
}

- (void)play
{
  ((void (*)(IMAudioController *, char *))MEMORY[0x24BEDD108])(self, sel_playAfterDelay_);
}

- (void)playAfterDelay:(double)a3
{
  NSMutableArray *v5;
  const char *v6;
  uint64_t v7;
  NSObject *v8;
  const char *v9;
  uint64_t v10;
  unint64_t currentIndex;
  const char *v12;
  uint64_t v13;
  id v14;
  const char *v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  const char *v23;
  unint64_t v24;
  const char *v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  uint64_t shouldUseAVPlayer;
  const char *v30;
  void *v31;
  const char *v32;
  const char *v33;
  const char *v34;
  uint64_t v35;
  void *v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  const char *v40;
  const char *v41;
  uint64_t v42;
  void *v43;
  const char *v44;
  uint64_t v45;
  const char *v46;
  double v47;
  _QWORD v48[4];
  id v49;
  IMAudioController *v50;
  id v51;
  id v52[2];
  _QWORD v53[4];
  id v54;
  IMAudioController *v55;
  id v56;
  id v57[2];
  id location;
  uint8_t buf[8];
  __int16 v60;
  int v61;
  uint64_t v62;

  v62 = *MEMORY[0x24BDAC8D0];
  v5 = self->_audioURLs;
  objc_msgSend_audio(IMSharedUILogs, v6, v7);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    currentIndex = self->_currentIndex;
    *(_DWORD *)buf = 67109376;
    *(_DWORD *)&buf[4] = currentIndex;
    v60 = 1024;
    v61 = objc_msgSend_count(v5, v9, v10);
    _os_log_impl(&dword_20D651000, v8, OS_LOG_TYPE_INFO, "Playing %d of %d audio messages", buf, 0xEu);
  }

  objc_msgSend_audioPlayer(self, v12, v13);
  v14 = (id)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)buf = 0;
  objc_initWeak((id *)buf, self);
  if (v14)
  {
    if ((objc_msgSend_isPlaying(v14, v15, v16) & 1) == 0)
    {
      location = 0;
      objc_initWeak(&location, v14);
      objc_msgSend_sharedInstance(IMAudioSessionController, v17, v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend_audioSessionControllerOptions(self, v20, v21);
      v53[0] = MEMORY[0x24BDAC760];
      v53[1] = 3221225472;
      v53[2] = sub_20D6574F0;
      v53[3] = &unk_24C751218;
      v14 = v14;
      v54 = v14;
      v57[1] = *(id *)&a3;
      objc_copyWeak(&v56, (id *)buf);
      objc_copyWeak(v57, &location);
      v55 = self;
      objc_msgSend_activateWithOptions_completion_(v19, v23, v22, v53);

      objc_destroyWeak(v57);
      objc_destroyWeak(&v56);

      objc_destroyWeak(&location);
    }
  }
  else
  {
    v24 = self->_currentIndex;
    if (v24 == 0x7FFFFFFFFFFFFFFFLL)
    {
      v24 = 0;
      self->_currentIndex = 0;
    }
    if (v24 >= objc_msgSend_count(v5, v15, v16))
    {
      v14 = 0;
    }
    else
    {
      objc_msgSend_objectAtIndex_(v5, v25, self->_currentIndex);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      shouldUseAVPlayer = objc_msgSend_shouldUseAVPlayer(self, v27, v28);
      objc_msgSend_audioPlayerWithContentsOfURL_shouldUseAVPlayer_(IMAudioPlayer, v30, (uint64_t)v26, shouldUseAVPlayer);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setDelegate_(v31, v32, (uint64_t)self);
      objc_msgSend_setAudioPlayer_(self, v33, (uint64_t)v31);
      location = 0;
      objc_initWeak(&location, v31);
      objc_msgSend_sharedInstance(IMAudioSessionController, v34, v35);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = objc_msgSend_audioSessionControllerOptions(self, v37, v38);
      v48[0] = MEMORY[0x24BDAC760];
      v48[1] = 3221225472;
      v48[2] = sub_20D657620;
      v48[3] = &unk_24C751218;
      v14 = v31;
      v49 = v14;
      v52[1] = *(id *)&a3;
      objc_copyWeak(&v51, (id *)buf);
      objc_copyWeak(v52, &location);
      v50 = self;
      objc_msgSend_activateWithOptions_completion_(v36, v40, v39, v48);

      objc_msgSend_delegate(self, v41, v42);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        objc_msgSend_duration(v14, v44, v45);
        objc_msgSend_audioController_didChangeProgressForContentAtURL_currentTime_duration_(v43, v46, (uint64_t)self, v26, 0.0, v47);
      }

      objc_destroyWeak(v52);
      objc_destroyWeak(&v51);

      objc_destroyWeak(&location);
    }
  }
  objc_destroyWeak((id *)buf);

}

- (void)prepareToPlay
{
  uint64_t v2;
  const char *v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  NSMutableArray *v8;
  const char *v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  id v22;
  const char *v23;
  unint64_t currentIndex;
  _QWORD v25[4];
  id v26;
  IMAudioController *v27;
  id v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t (*v33)(uint64_t, uint64_t);
  void (*v34)(uint64_t);
  id v35;

  v30 = 0;
  v31 = &v30;
  v32 = 0x3032000000;
  v33 = sub_20D657A44;
  v34 = sub_20D657A54;
  v35 = 0;
  objc_msgSend_audioPlayer(self, a2, v2);
  v35 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_isPlaying((void *)v31[5], v4, v5))
  {
    objc_msgSend_audioURL((void *)v31[5], v6, v7);
    v8 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
    objc_msgSend__notifyPlayerDidPrepareAudioURL_successfully_(self, v9, (uint64_t)v8, 1);
  }
  else
  {
    if (self->_currentIndex == 0x7FFFFFFFFFFFFFFFLL)
      self->_currentIndex = 0;
    v8 = self->_audioURLs;
    v12 = (void *)v31[5];
    if (v12)
      goto LABEL_6;
    currentIndex = self->_currentIndex;
    if (currentIndex >= objc_msgSend_count(v8, v10, v11))
    {
      objc_msgSend__notifyPlayerDidPrepareAudioURL_successfully_(self, v10, 0, 0);
      goto LABEL_8;
    }
    v12 = (void *)v31[5];
    if (v12)
    {
LABEL_6:
      objc_msgSend_audioURL(v12, v10, v11);
      v13 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend_objectAtIndex_(v8, v10, self->_currentIndex);
      v13 = objc_claimAutoreleasedReturnValue();
    }
    v16 = (void *)v13;
    objc_msgSend_sharedInstance(IMAudioSessionController, v14, v15);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend_audioSessionControllerOptions(self, v18, v19);
    v25[0] = MEMORY[0x24BDAC760];
    v25[1] = 3221225472;
    v25[2] = sub_20D657A5C;
    v25[3] = &unk_24C751240;
    v21 = v17;
    v26 = v21;
    v27 = self;
    v22 = v16;
    v28 = v22;
    v29 = &v30;
    objc_msgSend_activateWithOptions_completion_(v21, v23, v20, v25);

  }
LABEL_8:

  _Block_object_dispose(&v30, 8);
}

- (void)pause
{
  uint64_t v2;
  void *v4;
  const char *v5;
  uint64_t v6;
  const char *v7;
  const char *v8;
  uint64_t v9;
  const char *v10;
  id v11;

  objc_msgSend_audioPlayer(self, a2, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_pause(v4, v5, v6);

  objc_msgSend_setPlaying_(self, v7, 0);
  objc_msgSend_delegate(self, v8, v9);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend_audioControllerDidPause_(v11, v10, (uint64_t)self);

}

- (void)stop
{
  uint64_t v2;
  NSObject *v4;
  const char *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  const char *v12;
  const char *v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  _DWORD v22[2];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  objc_msgSend_audio(IMSharedUILogs, a2, v2);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v22[0] = 67109120;
    v22[1] = objc_msgSend_interrupted(self, v5, v6);
    _os_log_impl(&dword_20D651000, v4, OS_LOG_TYPE_INFO, "Stop (interruption: %d)", (uint8_t *)v22, 8u);
  }

  objc_msgSend_audioPlayer(self, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stop(v9, v10, v11);

  objc_msgSend_setPlaying_(self, v12, 0);
  if ((objc_msgSend_interrupted(self, v13, v14) & 1) == 0)
  {
    objc_msgSend_sharedInstance(IMAudioSessionController, v15, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_deactivate(v17, v18, v19);

  }
  objc_msgSend_delegate(self, v15, v16);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend_audioControllerDidStop_(v20, v21, (uint64_t)self);

}

- (id)currentMediaObject
{
  unint64_t currentIndex;

  currentIndex = self->_currentIndex;
  if (currentIndex == 0x7FFFFFFFFFFFFFFFLL)
    return 0;
  objc_msgSend_objectAtIndex_(self->_audioURLs, a2, currentIndex);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (double)currentMediaObjectTime
{
  uint64_t v2;
  void *v3;
  const char *v4;
  uint64_t v5;
  double v6;
  double v7;

  objc_msgSend_audioPlayer(self, a2, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_currentTime(v3, v4, v5);
  v7 = v6;

  return v7;
}

- (double)currentMediaObjectDuration
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

- (void)audioPlayerCurrentTimeDidChange:(id)a3
{
  const char *v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  double v12;
  double v13;
  const char *v14;
  uint64_t v15;
  const char *v16;
  double v17;
  id v18;

  v18 = a3;
  objc_msgSend_delegate(self, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend_currentMediaObject(self, v7, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_currentTime(v18, v10, v11);
    v13 = v12;
    objc_msgSend_duration(v18, v14, v15);
    objc_msgSend_audioController_didChangeProgressForContentAtURL_currentTime_duration_(v6, v16, (uint64_t)self, v9, v13, v17);

  }
}

- (void)audioPlayerDidFinishPlaying:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  const char *v12;
  unint64_t v13;
  const char *v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  _QWORD v20[5];

  v4 = a3;
  objc_msgSend_delegate(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend_currentMediaObject(self, v8, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_audioController_didFinishPlayingContentAtURL_(v7, v11, (uint64_t)self, v10);

  }
  objc_msgSend_setDelegate_(v4, v8, 0);
  objc_msgSend_setAudioPlayer_(self, v12, 0);
  v13 = self->_currentIndex + 1;
  if (v13 >= objc_msgSend_count(self->_audioURLs, v14, v15))
  {
    if ((objc_msgSend_shouldUseSpeaker(self, v16, v17) & 1) != 0)
    {
      objc_msgSend_stop(self, v18, v19);
    }
    else
    {
      v20[0] = MEMORY[0x24BDAC760];
      v20[1] = 3221225472;
      v20[2] = sub_20D657FA4;
      v20[3] = &unk_24C751268;
      v20[4] = self;
      objc_msgSend_playListenEndSound_(self, v18, (uint64_t)v20);
    }
  }
  else
  {
    ++self->_currentIndex;
    objc_msgSend_play(self, v16, v17);
  }

}

- (void)audioPlayerDidPrepareAudioToPlay:(id)a3 successfully:(BOOL)a4
{
  const char *v5;
  id v6;

  objc_msgSend_audioURL(a3, a2, (uint64_t)a3, a4);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend__notifyPlayerDidPrepareAudioURL_successfully_(self, v5, (uint64_t)v6, 1);

}

- (void)_notifyPlayerDidPrepareAudioURL:(id)a3 successfully:(BOOL)a4
{
  _BOOL8 v4;
  const char *v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  id v10;

  v4 = a4;
  v10 = a3;
  objc_msgSend_delegate(self, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend_audioController_didPrepareToPlayContentAtURL_successfully_(v8, v9, (uint64_t)self, v10, v4);

}

- (void)_playSoundWithURL:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  void *v9;
  const char *v10;
  id v11;
  const char *v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id location;

  v6 = a3;
  v7 = a4;
  objc_msgSend_audioPlayerWithContentsOfURL_(IMAudioPlayer, v8, (uint64_t)v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setListenAudioPlayer_(self, v10, (uint64_t)v9);
  location = 0;
  objc_initWeak(&location, self);
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = sub_20D658178;
  v13[3] = &unk_24C751290;
  objc_copyWeak(&v15, &location);
  v11 = v7;
  v14 = v11;
  objc_msgSend_playAfterDelay_completion_(v9, v12, (uint64_t)v13, 0.0);

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);

}

- (void)playListenSound:(id)a3
{
  id v4;
  const char *v5;
  id v6;

  v4 = a3;
  IMURLForResourceFromSharedUIBundle(CFSTR("MessageListen"), CFSTR("caf"));
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend__playSoundWithURL_completion_(self, v5, (uint64_t)v6, v4);

}

- (void)playListenEndSound:(id)a3
{
  id v4;
  const char *v5;
  id v6;

  v4 = a3;
  IMURLForResourceFromSharedUIBundle(CFSTR("MessageListenEnd"), CFSTR("caf"));
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend__playSoundWithURL_completion_(self, v5, (uint64_t)v6, v4);

}

- (void)setPlaying:(BOOL)a3
{
  const char *v4;
  id v5;

  if (self->_playing != a3)
  {
    self->_playing = a3;
    objc_msgSend_delegate(self, a2, a3);
    v5 = (id)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend_audioControllerPlayingDidChange_(v5, v4, (uint64_t)self);

  }
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

- (BOOL)isPlaying
{
  return self->_playing;
}

- (NSURL)currentURL
{
  return self->_currentURL;
}

- (IMAudioControllerDelegate)delegate
{
  return (IMAudioControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)isPaused
{
  return self->_paused;
}

- (void)setPaused:(BOOL)a3
{
  self->_paused = a3;
}

- (IMAudioPlayer)audioPlayer
{
  return self->_audioPlayer;
}

- (void)setAudioPlayer:(id)a3
{
  objc_storeStrong((id *)&self->_audioPlayer, a3);
}

- (BOOL)interrupted
{
  return self->_interrupted;
}

- (void)setInterrupted:(BOOL)a3
{
  self->_interrupted = a3;
}

- (IMAudioPlayer)listenAudioPlayer
{
  return self->_listenAudioPlayer;
}

- (void)setListenAudioPlayer:(id)a3
{
  objc_storeStrong((id *)&self->_listenAudioPlayer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_audioPlayer, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_currentURL, 0);
  objc_storeStrong((id *)&self->_audioURLs, 0);
  objc_storeStrong((id *)&self->_listenAudioPlayer, 0);
}

@end
