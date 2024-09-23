@implementation IMInternalAVAudioPlayer

- (IMInternalAVAudioPlayer)initWithContentsOfURL:(id)a3 playerType:(int64_t)a4
{
  id v6;
  IMInternalAVAudioPlayer *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  IMInternalAVAudioPlayer *v11;
  const char *v12;
  void *v13;
  const char *v14;
  void *v15;
  const char *v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  const char *v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  const char *v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  const char *v30;
  uint64_t v31;
  void *v32;
  const char *v33;
  id v34;
  const char *v35;
  uint64_t v36;
  void *v37;
  const char *v38;
  objc_super v40;
  uint64_t v41;
  _QWORD v42[2];

  v42[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v40.receiver = self;
  v40.super_class = (Class)IMInternalAVAudioPlayer;
  v7 = -[IMInternalAVAudioPlayer init](&v40, sel_init);
  v10 = (uint64_t)v7;
  v11 = 0;
  if (v6 && v7)
  {
    if (objc_msgSend_isFileURL(v6, v8, v9))
    {
      *(_QWORD *)(v10 + 48) = a4;
      if (a4 == 1)
      {
        v41 = *MEMORY[0x24BDB21E0];
        objc_msgSend_numberWithUnsignedInteger_(MEMORY[0x24BDD16E0], v12, 0xFFFFLL);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v42[0] = v13;
        objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v14, (uint64_t)v42, &v41, 1);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend_URLAssetWithURL_options_(MEMORY[0x24BDB26C8], v16, (uint64_t)v6, v15);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_playerItemWithAsset_(MEMORY[0x24BDB2618], v18, (uint64_t)v17);
        v19 = objc_claimAutoreleasedReturnValue();
        v20 = *(void **)(v10 + 24);
        *(_QWORD *)(v10 + 24) = v19;

        objc_msgSend_setPlayHapticTracks_(*(void **)(v10 + 24), v21, 1);
        objc_msgSend_playerWithPlayerItem_(MEMORY[0x24BDB2610], v22, *(_QWORD *)(v10 + 24));
        v23 = objc_claimAutoreleasedReturnValue();
        v24 = *(void **)(v10 + 16);
        *(_QWORD *)(v10 + 16) = v23;

        objc_msgSend_addObserver_forKeyPath_options_context_(*(void **)(v10 + 24), v25, v10, CFSTR("status"), 3, qword_2549C1170);
        objc_msgSend_defaultCenter(MEMORY[0x24BDD16D0], v26, v27);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_addObserver_selector_name_object_(v28, v29, v10, sel__playerItemDidEndNotification_, *MEMORY[0x24BDB1FA8], *(_QWORD *)(v10 + 24));

        objc_msgSend_defaultCenter(MEMORY[0x24BDD16D0], v30, v31);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_addObserver_selector_name_object_(v32, v33, v10, sel__playerItemDidEndNotification_, *MEMORY[0x24BDB1FB8], *(_QWORD *)(v10 + 24));

      }
      else
      {
        v34 = objc_alloc(MEMORY[0x24BDB1848]);
        v36 = objc_msgSend_initWithContentsOfURL_error_(v34, v35, (uint64_t)v6, 0);
        v37 = *(void **)(v10 + 8);
        *(_QWORD *)(v10 + 8) = v36;

        objc_msgSend_setDelegate_(*(void **)(v10 + 8), v38, v10);
      }
      v11 = (IMInternalAVAudioPlayer *)(id)v10;
    }
    else
    {
      v11 = 0;
    }
  }

  return v11;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  const char *v10;
  id v11;
  const char *v12;
  void *v13;
  const char *v14;
  void *v15;
  const char *v16;
  _QWORD block[5];
  objc_super v18;

  v11 = a5;
  if ((void *)qword_2549C1170 == a6)
  {
    if (objc_msgSend_isEqualToString_(a3, v10, (uint64_t)CFSTR("status")))
    {
      objc_msgSend_objectForKeyedSubscript_(v11, v12, *MEMORY[0x24BDD0E70]);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_objectForKeyedSubscript_(v11, v14, *MEMORY[0x24BDD0E80]);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0 && (objc_msgSend_isEqualToNumber_(v13, v16, (uint64_t)v15) & 1) == 0)
        {
          block[0] = MEMORY[0x24BDAC760];
          block[1] = 3221225472;
          block[2] = sub_20D6587B0;
          block[3] = &unk_24C751268;
          block[4] = self;
          dispatch_async(MEMORY[0x24BDAC9B8], block);
        }
      }

    }
  }
  else
  {
    v18.receiver = self;
    v18.super_class = (Class)IMInternalAVAudioPlayer;
    -[IMInternalAVAudioPlayer observeValueForKeyPath:ofObject:change:context:](&v18, sel_observeValueForKeyPath_ofObject_change_context_, a3, a4, v11, a6);
  }

}

- (BOOL)playAtTime:(double)a3
{
  uint64_t v3;

  if (self->_playerType != 1 || objc_msgSend_status(self->_playerItem, a2, v3))
    return MEMORY[0x24BEDD108](self, sel__playAtTime_, v3);
  self->_avPlayerPlayRequested = 1;
  return 1;
}

- (BOOL)_playAtTime:(double)a3
{
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  AVPlayer *avPlayer;
  __int128 v10;
  uint64_t v11;
  __int128 v12;
  uint64_t v13;

  v5 = MEMORY[0x212BA5EF4]("kCMTimeZero", CFSTR("CoreMedia"));
  v12 = *(_OWORD *)v5;
  v13 = *(_QWORD *)(v5 + 16);
  if (self->_playerType != 1)
    return objc_msgSend_playAtTime_(self->_avAudioPlayer, v6, v7, a3);
  self->_avPlayerPlayRequested = 0;
  if (self->_avPlayerState == 3)
  {
    avPlayer = self->_avPlayer;
    v10 = v12;
    v11 = v13;
    objc_msgSend_seekToTime_(avPlayer, v6, (uint64_t)&v10);
  }
  objc_msgSend_play(self->_avPlayer, v6, v7);
  self->_avPlayerState = 1;
  return 1;
}

- (double)deviceCurrentTime
{
  uint64_t v2;
  double result;

  if (self->_playerType == 1)
    return 0.0;
  objc_msgSend_deviceCurrentTime(self->_avAudioPlayer, a2, v2);
  return result;
}

- (void)stop
{
  uint64_t v2;

  if (self->_playerType == 1)
  {
    if ((self->_avPlayerState & 0xFFFFFFFFFFFFFFFELL) != 2)
      objc_msgSend_pause(self->_avPlayer, a2, v2);
    self->_avPlayerState = 3;
  }
  else
  {
    objc_msgSend_stop(self->_avAudioPlayer, a2, v2);
  }
}

- (void)pause
{
  uint64_t v2;

  if (self->_playerType == 1)
  {
    objc_msgSend_pause(self->_avPlayer, a2, v2);
    self->_avPlayerState = 2;
  }
  else
  {
    objc_msgSend_pause(self->_avAudioPlayer, a2, v2);
  }
}

- (float)volume
{
  uint64_t v2;
  uint64_t v3;
  float result;

  v3 = 8;
  if (self->_playerType == 1)
    v3 = 16;
  objc_msgSend_volume(*(void **)((char *)&self->super.isa + v3), a2, v2);
  return result;
}

- (void)setVolume:(float)a3
{
  uint64_t v3;
  uint64_t v4;

  v4 = 8;
  if (self->_playerType == 1)
    v4 = 16;
  objc_msgSend_setVolume_(*(void **)((char *)&self->super.isa + v4), a2, v3);
}

- (BOOL)isPlaying
{
  uint64_t v2;

  if (self->_playerType == 1)
    return self->_avPlayerState == 1;
  else
    return objc_msgSend_isPlaying(self->_avAudioPlayer, a2, v2);
}

- (double)currentTime
{
  uint64_t v2;
  void (*v4)(_QWORD *);
  AVPlayer *avPlayer;
  double result;
  _QWORD v7[3];

  if (qword_2549C1240 != -1)
    dispatch_once(&qword_2549C1240, &unk_24C750F88);
  if (self->_playerType == 1)
  {
    v4 = (void (*)(_QWORD *))off_2549C1238;
    avPlayer = self->_avPlayer;
    if (avPlayer)
      objc_msgSend_currentTime(avPlayer, a2, v2);
    else
      memset(v7, 0, sizeof(v7));
    v4(v7);
  }
  else
  {
    objc_msgSend_currentTime(self->_avAudioPlayer, a2, v2);
  }
  return result;
}

- (double)duration
{
  uint64_t v3;
  const char *v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  double result;
  __int128 v11;
  uint64_t v12;
  __int128 v13;
  uint64_t v14;
  __int128 v15;
  uint64_t v16;
  __int128 v17;
  uint64_t v18;

  if (qword_2549C1250 != -1)
    dispatch_once(&qword_2549C1250, &unk_24C751068);
  if (qword_2549C1260 != -1)
    dispatch_once(&qword_2549C1260, &unk_24C7512D0);
  v3 = MEMORY[0x212BA5EF4]("kCMTimeIndefinite", CFSTR("CoreMedia"));
  v17 = *(_OWORD *)v3;
  v18 = *(_QWORD *)(v3 + 16);
  if (self->_playerType == 1)
  {
    v15 = 0uLL;
    v16 = 0;
    objc_msgSend_currentItem(self->_avPlayer, v4, v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v6;
    if (v6)
    {
      objc_msgSend_duration(v6, v7, v8);
    }
    else
    {
      v15 = 0uLL;
      v16 = 0;
    }

    v13 = v15;
    v14 = v16;
    v11 = v17;
    v12 = v18;
    if (off_2549C1248(&v13, &v11))
    {
      v13 = v15;
      v14 = v16;
      off_2549C1258(&v13);
    }
    else
    {
      return 0.0;
    }
  }
  else
  {
    objc_msgSend_duration(self->_avAudioPlayer, v4, v5);
  }
  return result;
}

- (void)prepareToPlay
{
  uint64_t v2;
  const char *v4;
  uint64_t v5;
  IMInternalAVAudioPlayer *v6;
  uint64_t v7;
  uint64_t v8;

  if (self->_playerType != 1)
  {
    v7 = objc_msgSend_prepareToPlay(self->_avAudioPlayer, a2, v2);
LABEL_7:
    v6 = self;
    goto LABEL_8;
  }
  if (objc_msgSend_isPlaying(self, a2, v2))
  {
    v6 = self;
    v7 = 1;
LABEL_8:
    objc_msgSend__notifyPlayerDidPrepareAudioFileSuccessfully_(v6, v4, v7);
    return;
  }
  v8 = objc_msgSend_status(self->_playerItem, v4, v5);
  if (v8)
  {
    v7 = v8 == 1;
    goto LABEL_7;
  }
  self->_avPlayerPrepareRequested = 1;
}

- (void)dealloc
{
  const char *v3;
  uint64_t v4;
  void *v5;
  const char *v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  const char *v11;
  objc_super v12;

  objc_msgSend_removeObserver_forKeyPath_(self->_playerItem, a2, (uint64_t)self, CFSTR("status"));
  objc_msgSend_defaultCenter(MEMORY[0x24BDD16D0], v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_removeObserver_name_object_(v5, v6, (uint64_t)self, *MEMORY[0x24BDB1FA8], self->_playerItem);

  objc_msgSend_defaultCenter(MEMORY[0x24BDD16D0], v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_removeObserver_name_object_(v9, v10, (uint64_t)self, *MEMORY[0x24BDB1FB8], self->_playerItem);

  objc_msgSend_setDelegate_(self->_avAudioPlayer, v11, 0);
  v12.receiver = self;
  v12.super_class = (Class)IMInternalAVAudioPlayer;
  -[IMInternalAVAudioPlayer dealloc](&v12, sel_dealloc);
}

- (void)_playerItemDidEndNotification:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = sub_20D658E18;
  v6[3] = &unk_24C7511A8;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  dispatch_async(MEMORY[0x24BDAC9B8], v6);

}

- (void)_handleAVPlayerItemStateChange
{
  uint64_t v2;
  uint64_t v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = objc_msgSend_status(self->_playerItem, a2, v2);
  v7 = v4;
  if (self->_avPlayerPrepareRequested)
  {
    self->_avPlayerPrepareRequested = 0;
    objc_msgSend__notifyPlayerDidPrepareAudioFileSuccessfully_(self, v5, v4 == 1);
  }
  if (self->_avPlayerPlayRequested && v7 != 0)
  {
    self->_avPlayerPlayRequested = 0;
    MEMORY[0x24BEDD108](self, sel__playAtTime_, v6);
  }
}

- (void)_notifyPlayerDidFinishSuccessfully:(BOOL)a3
{
  _BOOL8 v3;
  const char *v5;
  id v6;

  v3 = a3;
  objc_msgSend_delegate(self, a2, a3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend_internalAVAudioPlayerDidFinishPlaying_successfully_(v6, v5, (uint64_t)self, v3);

}

- (void)_notifyPlayerDidPrepareAudioFileSuccessfully:(BOOL)a3
{
  _BOOL8 v3;
  const char *v5;
  id v6;

  v3 = a3;
  objc_msgSend_delegate(self, a2, a3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend_internalAVAudioPlayerDidPrepareAudioForPlaying_successfully_(v6, v5, (uint64_t)self, v3);

}

- (void)audioPlayerDidFinishPlaying:(id)a3 successfully:(BOOL)a4
{
  MEMORY[0x24BEDD108](self, sel__notifyPlayerDidFinishSuccessfully_, a4);
}

- (int64_t)playerType
{
  return self->_playerType;
}

- (IMInternalAVAudioPlayerDelegate)delegate
{
  return (IMInternalAVAudioPlayerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_playerItem, 0);
  objc_storeStrong((id *)&self->_avPlayer, 0);
  objc_storeStrong((id *)&self->_avAudioPlayer, 0);
}

@end
