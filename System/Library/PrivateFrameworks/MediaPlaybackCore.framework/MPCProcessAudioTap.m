@implementation MPCProcessAudioTap

uint64_t __72__MPCProcessAudioTap_initWithPID_refreshRate_numberOfChannels_delegate___block_invoke(uint64_t a1, double a2)
{
  unsigned int *v2;

  v2 = *(unsigned int **)(a1 + 32);
  LODWORD(a2) = v2[12];
  return objc_msgSend(v2, "_createProcessTapWithNumberOfFrames:sampleRate:", v2[11], (double)*(unint64_t *)&a2);
}

- (unsigned)sampleRate
{
  return self->_sampleRate;
}

- (unsigned)numberOfFrames
{
  return self->_numberOfFrames;
}

- (MPCProcessAudioTap)initWithRefreshRate:(id)a3 delegate:(id)a4
{
  id v6;
  id v7;
  MPCProcessAudioTap *v8;

  v6 = a4;
  v7 = a3;
  v8 = -[MPCProcessAudioTap initWithPID:refreshRate:numberOfChannels:delegate:](self, "initWithPID:refreshRate:numberOfChannels:delegate:", getpid(), v7, 1, v6);

  return v8;
}

- (MPCProcessAudioTap)initWithPID:(int)a3 refreshRate:(id)a4 numberOfChannels:(unsigned int)a5 delegate:(id)a6
{
  id v10;
  id v11;
  MPCProcessAudioTap *v12;
  MPCProcessAudioTap *v13;
  unint64_t v14;
  unint64_t v15;
  void *v16;
  double v17;
  unsigned int v18;
  NSObject *v19;
  unsigned int sampleRate;
  dispatch_queue_t v21;
  OS_dispatch_queue *accessQueue;
  NSObject *v23;
  MPCProcessAudioTap *v24;
  _QWORD block[4];
  MPCProcessAudioTap *v27;
  objc_super v28;
  uint8_t buf[4];
  MPCProcessAudioTap *v30;
  __int16 v31;
  unint64_t v32;
  __int16 v33;
  double v34;
  __int16 v35;
  unsigned int v36;
  __int16 v37;
  unsigned int v38;
  __int16 v39;
  double v40;
  __int16 v41;
  double v42;
  uint64_t v43;

  v43 = *MEMORY[0x24BDAC8D0];
  v10 = a4;
  v11 = a6;
  v28.receiver = self;
  v28.super_class = (Class)MPCProcessAudioTap;
  v12 = -[MPCProcessAudioTap init](&v28, sel_init);
  v13 = v12;
  if (v12)
  {
    v12->_pid = a3;
    v12->_sampleRate = 48000;
    v12->_numberOfChannels = a5;
    v12->_enabled = 1;
    if (v10)
    {
      v14 = objc_msgSend(v10, "integerValue");
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDDCB28], "standardUserDefaults");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v16, "audioAnalysisRefreshRate");

    }
    LODWORD(v15) = v13->_sampleRate;
    v17 = log2((double)v15 / (double)v14);
    v18 = exp2(ceil(v17));
    v19 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      sampleRate = v13->_sampleRate;
      *(_DWORD *)buf = 134219520;
      v30 = v13;
      v31 = 2048;
      v32 = v14;
      v33 = 2048;
      v34 = (float)((float)sampleRate / (float)v18);
      v35 = 1024;
      v36 = v18;
      v37 = 1024;
      v38 = sampleRate;
      v39 = 2048;
      v40 = (float)((float)((float)v18 / (float)sampleRate) * 1000.0);
      v41 = 2048;
      v42 = v34;
      _os_log_impl(&dword_210BD8000, v19, OS_LOG_TYPE_DEFAULT, "[AP] - MPCProcessAudioTap %p - Desired refresh rate for process tap: %luHz - Actual refresh rate: %3.1fHz [%u samples @ %uHz] - FFT Info: dt=%3.1fms df=%3.1fHz", buf, 0x40u);
    }

    v21 = dispatch_queue_create("com.apple.mediaplaybackcore.audiotap", 0);
    accessQueue = v13->_accessQueue;
    v13->_accessQueue = (OS_dispatch_queue *)v21;

    v13->_numberOfFrames = v18;
    objc_storeWeak((id *)&v13->_delegate, v11);
    v23 = v13->_accessQueue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __72__MPCProcessAudioTap_initWithPID_refreshRate_numberOfChannels_delegate___block_invoke;
    block[3] = &unk_24CABA2D0;
    v24 = v13;
    v27 = v24;
    dispatch_async(v23, block);
    -[MPCProcessAudioTap setupNotifications](v24, "setupNotifications");

  }
  return v13;
}

- (void)setupNotifications
{
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel_mediaServerDidDie_, *MEMORY[0x24BDB1608], 0);

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObserver:selector:name:object:", self, sel_mediaServerDidRestart_, *MEMORY[0x24BDB1610], 0);

}

- (void)_createProcessTapWithNumberOfFrames:(unsigned int)a3 sampleRate:(double)a4
{
  void *v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  void *v11;
  OpaqueAudioQueue **p_processingQueue;
  OSStatus v13;
  OSStatus v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  void *v20;
  void *v21;
  id v22;
  NSObject *v23;
  NSObject *v24;
  void *v25;
  const void *v26;
  OSStatus v27;
  OSStatus v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  void *v33;
  id v34;
  id v35;
  NSObject *v36;
  const char *v37;
  OSStatus Buffer;
  OSStatus v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  int v43;
  void *v44;
  void *v45;
  id v46;
  id v47;
  OSStatus v48;
  OSStatus v49;
  void *v50;
  uint64_t v51;
  uint64_t v52;
  __darwin_ct_rune_t v53;
  unsigned int v54;
  int v55;
  void *v57;
  void *v58;
  id v59;
  id v60;
  void *v61;
  void *v62;
  uint64_t v63;
  void *v64;
  void *v65;
  AudioStreamBasicDescription inFormat;
  __darwin_ct_rune_t v67[8];
  uint64_t v68;
  _QWORD v69[3];

  v69[1] = *MEMORY[0x24BDAC8D0];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_accessQueue);
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDB1818]), "initWithCommonFormat:sampleRate:channels:interleaved:", 1, self->_numberOfChannels, 1, a4);
  v8 = objc_msgSend(v7, "streamDescription");
  v9 = *(_QWORD *)(v8 + 32);
  v10 = *(_OWORD *)(v8 + 16);
  *(_OWORD *)&inFormat.mSampleRate = *(_OWORD *)v8;
  *(_OWORD *)&inFormat.mBytesPerPacket = v10;
  *(_QWORD *)&inFormat.mBitsPerChannel = v9;
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDB6BD0]), "initProcessTapWithFormat:PID:", v7, self->_pid);
  self->_processingQueue = 0;
  p_processingQueue = &self->_processingQueue;
  v13 = AudioQueueNewInput(&inFormat, (AudioQueueInputCallback)_MPCHandleProcessTapBuffer, self, 0, 0, 0x800u, &self->_processingQueue);
  if (!v13)
  {
    v19 = 0;
    goto LABEL_21;
  }
  v14 = v13;
  v15 = (void *)MEMORY[0x24BDD1540];
  v16 = *MEMORY[0x24BDD1100];
  v17 = v13;
  v69[0] = *MEMORY[0x24BDD0FC8];
  memset(v67, 0, 20);
  *(__darwin_ct_rune_t *)((char *)v67 + 1) = bswap32(v13);
  v18 = MEMORY[0x24BDAC740];
  if ((v67[0] & 0x8000) != 0)
  {
    if (!__maskrune(SBYTE1(v67[0]), 0x40000uLL))
      goto LABEL_19;
  }
  else if ((*(_DWORD *)(MEMORY[0x24BDAC740] + 4 * SBYTE1(v67[0]) + 60) & 0x40000) == 0)
  {
    goto LABEL_19;
  }
  if (SBYTE2(v67[0]) < 0)
  {
    if (!__maskrune(SBYTE2(v67[0]), 0x40000uLL))
      goto LABEL_19;
  }
  else if ((*(_DWORD *)(v18 + 4 * SBYTE2(v67[0]) + 60) & 0x40000) == 0)
  {
    goto LABEL_19;
  }
  if (SHIBYTE(v67[0]) < 0)
  {
    if (!__maskrune(SHIBYTE(v67[0]), 0x40000uLL))
      goto LABEL_19;
  }
  else if ((*(_DWORD *)(v18 + 4 * SHIBYTE(v67[0]) + 60) & 0x40000) == 0)
  {
    goto LABEL_19;
  }
  if (SLOBYTE(v67[1]) < 0)
  {
    if (__maskrune(SLOBYTE(v67[1]), 0x40000uLL))
      goto LABEL_17;
LABEL_19:
    __sprintf_chk((char *)v67, 0, 0x14uLL, "%d", v14);
    goto LABEL_20;
  }
  if ((*(_DWORD *)(v18 + 4 * SLOBYTE(v67[1]) + 60) & 0x40000) == 0)
    goto LABEL_19;
LABEL_17:
  strcpy((char *)&v67[1] + 1, "'");
  LOBYTE(v67[0]) = 39;
LABEL_20:
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v67);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)v67 = v20;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v67, v69, 1);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "errorWithDomain:code:userInfo:", v16, v17, v21);
  v19 = (id)objc_claimAutoreleasedReturnValue();

LABEL_21:
  v22 = v19;
  v23 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  v24 = v23;
  if (!v22)
  {
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Format ID: %u - Sample Rate: %1.0fHz - Bytes/Packet: %u - Frames/Packet: %u - Bytes/Frame: %u - Channels/Frame: %u - Bits/Channel: %u"), inFormat.mFormatID, *(_QWORD *)&inFormat.mSampleRate, inFormat.mBytesPerPacket, inFormat.mFramesPerPacket, inFormat.mBytesPerFrame, inFormat.mChannelsPerFrame, inFormat.mBitsPerChannel);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v67[0] = 134218242;
      *(_QWORD *)&v67[1] = self;
      LOWORD(v67[3]) = 2114;
      *(_QWORD *)((char *)&v67[3] + 2) = v25;
      _os_log_impl(&dword_210BD8000, v24, OS_LOG_TYPE_DEFAULT, "[AP] - MPCProcessAudioTap %p - ASBD for process tap: %{public}@", (uint8_t *)v67, 0x16u);

    }
    v26 = (const void *)objc_msgSend(objc_alloc(MEMORY[0x24BDB6BC8]), "initWithTapDescription:", v11);
    v27 = AudioQueueSetProperty(*p_processingQueue, 0x71746F62u, v26, 8u);
    v65 = (void *)v26;
    if (!v27)
      goto LABEL_49;
    v28 = v27;
    v29 = (void *)MEMORY[0x24BDD1540];
    v30 = *MEMORY[0x24BDD1100];
    v31 = v27;
    v68 = *MEMORY[0x24BDD0FC8];
    memset(v67, 0, 20);
    *(__darwin_ct_rune_t *)((char *)v67 + 1) = bswap32(v27);
    if ((v67[0] & 0x8000) != 0)
    {
      if (!__maskrune(SBYTE1(v67[0]), 0x40000uLL))
        goto LABEL_45;
    }
    else if ((*(_DWORD *)(MEMORY[0x24BDAC740] + 4 * SBYTE1(v67[0]) + 60) & 0x40000) == 0)
    {
      goto LABEL_45;
    }
    if (SBYTE2(v67[0]) < 0)
    {
      if (!__maskrune(SBYTE2(v67[0]), 0x40000uLL))
        goto LABEL_45;
    }
    else if ((*(_DWORD *)(MEMORY[0x24BDAC740] + 4 * SBYTE2(v67[0]) + 60) & 0x40000) == 0)
    {
      goto LABEL_45;
    }
    if (SHIBYTE(v67[0]) < 0)
    {
      if (!__maskrune(SHIBYTE(v67[0]), 0x40000uLL))
        goto LABEL_45;
    }
    else if ((*(_DWORD *)(MEMORY[0x24BDAC740] + 4 * SHIBYTE(v67[0]) + 60) & 0x40000) == 0)
    {
      goto LABEL_45;
    }
    if (SLOBYTE(v67[1]) < 0)
    {
      if (__maskrune(SLOBYTE(v67[1]), 0x40000uLL))
        goto LABEL_43;
    }
    else if ((*(_DWORD *)(MEMORY[0x24BDAC740] + 4 * SLOBYTE(v67[1]) + 60) & 0x40000) != 0)
    {
LABEL_43:
      strcpy((char *)&v67[1] + 1, "'");
      LOBYTE(v67[0]) = 39;
      goto LABEL_46;
    }
LABEL_45:
    __sprintf_chk((char *)v67, 0, 0x14uLL, "%d", v28);
LABEL_46:
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v67);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v69[0] = v32;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v69, &v68, 1);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "errorWithDomain:code:userInfo:", v30, v31, v33);
    v34 = (id)objc_claimAutoreleasedReturnValue();

    v35 = v34;
    if (v35)
    {
      v22 = v35;
      v36 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
      if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
      {
        v67[0] = 134218242;
        *(_QWORD *)&v67[1] = self;
        LOWORD(v67[3]) = 2114;
        *(_QWORD *)((char *)&v67[3] + 2) = v22;
        v37 = "[AP] - MPCProcessAudioTap %p - Error adding processing tap to audio queue: %{public}@";
LABEL_95:
        _os_log_impl(&dword_210BD8000, v36, OS_LOG_TYPE_ERROR, v37, (uint8_t *)v67, 0x16u);
        goto LABEL_96;
      }
      goto LABEL_96;
    }
LABEL_49:
    Buffer = AudioQueueAllocateBuffer(self->_processingQueue, *(_DWORD *)(objc_msgSend(v7, "streamDescription") + 20)* a3* *(_DWORD *)(objc_msgSend(v7, "streamDescription") + 24), &self->_monoAudioBuffer);
    if (!Buffer)
      goto LABEL_72;
    v39 = Buffer;
    v40 = (void *)MEMORY[0x24BDD1540];
    v41 = *MEMORY[0x24BDD1100];
    v42 = Buffer;
    v68 = *MEMORY[0x24BDD0FC8];
    memset(v67, 0, 20);
    *(__darwin_ct_rune_t *)((char *)v67 + 1) = bswap32(Buffer);
    if ((v67[0] & 0x8000) != 0)
    {
      if (!__maskrune(SBYTE1(v67[0]), 0x40000uLL))
        goto LABEL_68;
    }
    else if ((*(_DWORD *)(MEMORY[0x24BDAC740] + 4 * SBYTE1(v67[0]) + 60) & 0x40000) == 0)
    {
      goto LABEL_68;
    }
    if (SBYTE2(v67[0]) < 0)
    {
      if (!__maskrune(SBYTE2(v67[0]), 0x40000uLL))
        goto LABEL_68;
    }
    else if ((*(_DWORD *)(MEMORY[0x24BDAC740] + 4 * SBYTE2(v67[0]) + 60) & 0x40000) == 0)
    {
      goto LABEL_68;
    }
    if (SHIBYTE(v67[0]) < 0)
    {
      if (!__maskrune(SHIBYTE(v67[0]), 0x40000uLL))
        goto LABEL_68;
    }
    else if ((*(_DWORD *)(MEMORY[0x24BDAC740] + 4 * SHIBYTE(v67[0]) + 60) & 0x40000) == 0)
    {
      goto LABEL_68;
    }
    if (SLOBYTE(v67[1]) < 0)
      v43 = __maskrune(SLOBYTE(v67[1]), 0x40000uLL);
    else
      v43 = *(_DWORD *)(MEMORY[0x24BDAC740] + 4 * SLOBYTE(v67[1]) + 60) & 0x40000;
    if (v43)
    {
      strcpy((char *)&v67[1] + 1, "'");
      LOBYTE(v67[0]) = 39;
      goto LABEL_69;
    }
LABEL_68:
    __sprintf_chk((char *)v67, 0, 0x14uLL, "%d", v39);
LABEL_69:
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v67);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v69[0] = v44;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v69, &v68, 1);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "errorWithDomain:code:userInfo:", v41, v42, v45);
    v46 = (id)objc_claimAutoreleasedReturnValue();

    v47 = v46;
    if (v47)
    {
      v22 = v47;
      v36 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
      if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
      {
        v67[0] = 134218242;
        *(_QWORD *)&v67[1] = self;
        LOWORD(v67[3]) = 2114;
        *(_QWORD *)((char *)&v67[3] + 2) = v22;
        v37 = "[AP] - MPCProcessAudioTap %p - Error allocating buffer for audio queue: %{public}@";
        goto LABEL_95;
      }
LABEL_96:

      -[MPCProcessAudioTap _destroyProcessTap](self, "_destroyProcessTap");
      v61 = v65;
LABEL_101:

      goto LABEL_102;
    }
LABEL_72:
    v48 = AudioQueueEnqueueBuffer(*p_processingQueue, self->_monoAudioBuffer, 0, 0);
    if (!v48)
      goto LABEL_97;
    v49 = v48;
    v50 = (void *)MEMORY[0x24BDD1540];
    v51 = *MEMORY[0x24BDD1100];
    v52 = v48;
    v68 = *MEMORY[0x24BDD0FC8];
    memset(v67, 0, 20);
    v53 = bswap32(v48);
    *(__darwin_ct_rune_t *)((char *)v67 + 1) = v53;
    if ((v53 & 0x80) != 0)
    {
      if (!__maskrune((char)v53, 0x40000uLL))
        goto LABEL_91;
    }
    else if ((*(_DWORD *)(MEMORY[0x24BDAC740] + 4 * (char)v53 + 60) & 0x40000) == 0)
    {
      goto LABEL_91;
    }
    v54 = (__int16)v53 >> 8;
    if ((v53 & 0x8000) != 0)
    {
      if (!__maskrune(v54, 0x40000uLL))
        goto LABEL_91;
    }
    else if ((*(_DWORD *)(MEMORY[0x24BDAC740] + 4 * v54 + 60) & 0x40000) == 0)
    {
      goto LABEL_91;
    }
    if (SHIBYTE(v67[0]) < 0)
      v55 = __maskrune(SHIBYTE(v67[0]), 0x40000uLL);
    else
      v55 = *(_DWORD *)(MEMORY[0x24BDAC740] + 4 * SHIBYTE(v67[0]) + 60) & 0x40000;
    if (v55)
    {
      if (SLOBYTE(v67[1]) < 0
         ? __maskrune(SLOBYTE(v67[1]), 0x40000uLL)
         : *(_DWORD *)(MEMORY[0x24BDAC740] + 4 * SLOBYTE(v67[1]) + 60) & 0x40000)
      {
        strcpy((char *)&v67[1] + 1, "'");
        LOBYTE(v67[0]) = 39;
        goto LABEL_92;
      }
    }
LABEL_91:
    __sprintf_chk((char *)v67, 0, 0x14uLL, "%d", v49);
LABEL_92:
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v67);
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    v69[0] = v57;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v69, &v68, 1);
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "errorWithDomain:code:userInfo:", v51, v52, v58);
    v59 = (id)objc_claimAutoreleasedReturnValue();

    v60 = v59;
    if (v60)
    {
      v22 = v60;
      v36 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
      if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
      {
        v67[0] = 134218242;
        *(_QWORD *)&v67[1] = self;
        LOWORD(v67[3]) = 2114;
        *(_QWORD *)((char *)&v67[3] + 2) = v22;
        v37 = "[AP] - MPCProcessAudioTap %p - Error Enqueuing buffer for audio queue: %{public}@";
        goto LABEL_95;
      }
      goto LABEL_96;
    }
LABEL_97:
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%p"), self);
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    os_unfair_lock_lock((os_unfair_lock_t)&_activeTapsLock);
    if (_activeTaps)
    {
      objc_msgSend((id)_activeTaps, "addObject:", v62);
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDBCEF0], "setWithObject:", v62);
      v63 = objc_claimAutoreleasedReturnValue();
      v64 = (void *)_activeTaps;
      _activeTaps = v63;

    }
    v61 = v65;
    os_unfair_lock_unlock((os_unfair_lock_t)&_activeTapsLock);

    v22 = 0;
    self->_enabled = 1;
    goto LABEL_101;
  }
  if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
  {
    v67[0] = 134218242;
    *(_QWORD *)&v67[1] = self;
    LOWORD(v67[3]) = 2114;
    *(_QWORD *)((char *)&v67[3] + 2) = v22;
    _os_log_impl(&dword_210BD8000, v24, OS_LOG_TYPE_ERROR, "[AP] - MPCProcessAudioTap %p - Error creating new audio queue for processing: %{public}@", (uint8_t *)v67, 0x16u);
  }

  -[MPCProcessAudioTap _destroyProcessTap](self, "_destroyProcessTap");
LABEL_102:

}

- (MPCProcessAudioTap)initWithPID:(int)a3 refreshRate:(id)a4 delegate:(id)a5
{
  return -[MPCProcessAudioTap initWithPID:refreshRate:numberOfChannels:delegate:](self, "initWithPID:refreshRate:numberOfChannels:delegate:", *(_QWORD *)&a3, a4, 1, a5);
}

- (void)start
{
  NSObject *accessQueue;
  _QWORD block[5];

  -[MPCProcessAudioTap setEnabled:](self, "setEnabled:", 1);
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __27__MPCProcessAudioTap_start__block_invoke;
  block[3] = &unk_24CABA2D0;
  block[4] = self;
  dispatch_async(accessQueue, block);
}

- (void)stop
{
  NSObject *accessQueue;
  _QWORD block[5];

  -[MPCProcessAudioTap setEnabled:](self, "setEnabled:", 0);
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __26__MPCProcessAudioTap_stop__block_invoke;
  block[3] = &unk_24CABA2D0;
  block[4] = self;
  dispatch_async(accessQueue, block);
}

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;
  uint64_t v5;
  OpaqueAudioQueue *(*v6)(uint64_t);
  void *v7;
  MPCProcessAudioTap *v8;

  v4 = MEMORY[0x24BDAC760];
  v5 = 3221225472;
  v6 = __29__MPCProcessAudioTap_dealloc__block_invoke;
  v7 = &unk_24CABA2D0;
  v8 = self;
  msv_dispatch_sync_on_queue();
  v3.receiver = self;
  v3.super_class = (Class)MPCProcessAudioTap;
  -[MPCProcessAudioTap dealloc](&v3, sel_dealloc);
}

- (void)_destroyProcessTap
{
  void *v3;
  AudioQueueBuffer *monoAudioBuffer;
  OSStatus v5;
  OSStatus v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  id v11;
  unsigned int v12;
  unsigned int v13;
  unsigned int v14;
  void *v15;
  void *v16;
  id v17;
  NSObject *v18;
  OpaqueAudioQueue *processingQueue;
  OSStatus v20;
  OSStatus v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  unsigned int v25;
  id v26;
  unsigned int v27;
  void *v28;
  void *v29;
  id v30;
  NSObject *v31;
  uint8_t buf[24];
  uint64_t v33;
  _QWORD v34[2];

  v34[1] = *MEMORY[0x24BDAC8D0];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_accessQueue);
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%p"), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_lock((os_unfair_lock_t)&_activeTapsLock);
  objc_msgSend((id)_activeTaps, "removeObject:", v3);
  os_unfair_lock_unlock((os_unfair_lock_t)&_activeTapsLock);

  self->_enabled = 0;
  monoAudioBuffer = self->_monoAudioBuffer;
  if (monoAudioBuffer)
  {
    v5 = AudioQueueFreeBuffer(self->_processingQueue, monoAudioBuffer);
    if (!v5)
    {
      v11 = 0;
LABEL_25:
      self->_monoAudioBuffer = 0;

      goto LABEL_26;
    }
    v6 = v5;
    v7 = (void *)MEMORY[0x24BDD1540];
    v8 = *MEMORY[0x24BDD1100];
    v9 = v5;
    v33 = *MEMORY[0x24BDD0FC8];
    memset(buf, 0, 20);
    v10 = bswap32(v5);
    *(_DWORD *)&buf[1] = v10;
    if ((v10 & 0x80) != 0)
    {
      if (!__maskrune((char)v10, 0x40000uLL))
        goto LABEL_20;
    }
    else if ((*(_DWORD *)(MEMORY[0x24BDAC740] + 4 * (char)v10 + 60) & 0x40000) == 0)
    {
      goto LABEL_20;
    }
    v12 = (__int16)v10 >> 8;
    if ((v10 & 0x8000) != 0)
    {
      if (!__maskrune(v12, 0x40000uLL))
        goto LABEL_20;
    }
    else if ((*(_DWORD *)(MEMORY[0x24BDAC740] + 4 * v12 + 60) & 0x40000) == 0)
    {
      goto LABEL_20;
    }
    v13 = v10 << 8 >> 24;
    if ((v10 & 0x800000) != 0)
    {
      if (!__maskrune(v13, 0x40000uLL))
        goto LABEL_20;
    }
    else if ((*(_DWORD *)(MEMORY[0x24BDAC740] + 4 * v13 + 60) & 0x40000) == 0)
    {
      goto LABEL_20;
    }
    v14 = v10 >> 24;
    if (v10 < 0)
    {
      if (__maskrune(v14, 0x40000uLL))
        goto LABEL_18;
    }
    else if ((*(_DWORD *)(MEMORY[0x24BDAC740] + 4 * v14 + 60) & 0x40000) != 0)
    {
LABEL_18:
      strcpy((char *)&buf[5], "'");
      buf[0] = 39;
      goto LABEL_21;
    }
LABEL_20:
    __sprintf_chk((char *)buf, 0, 0x14uLL, "%d", v6);
LABEL_21:
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", buf);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v34[0] = v15;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v34, &v33, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "errorWithDomain:code:userInfo:", v8, v9, v16);
    v17 = (id)objc_claimAutoreleasedReturnValue();

    v11 = v17;
    if (v11)
    {
      v18 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134218242;
        *(_QWORD *)&buf[4] = self;
        *(_WORD *)&buf[12] = 2114;
        *(_QWORD *)&buf[14] = v11;
        _os_log_impl(&dword_210BD8000, v18, OS_LOG_TYPE_ERROR, "MPCProcessAudioTap %p - Audio tap - Error freeing AQ buffer: %{public}@", buf, 0x16u);
      }

    }
    goto LABEL_25;
  }
LABEL_26:
  processingQueue = self->_processingQueue;
  if (!processingQueue)
    return;
  v20 = AudioQueueDispose(processingQueue, 0);
  if (v20)
  {
    v21 = v20;
    v22 = (void *)MEMORY[0x24BDD1540];
    v23 = *MEMORY[0x24BDD1100];
    v24 = v20;
    v33 = *MEMORY[0x24BDD0FC8];
    memset(buf, 0, 20);
    v25 = bswap32(v20);
    *(_DWORD *)&buf[1] = v25;
    if ((v25 & 0x80) != 0)
    {
      if (!__maskrune((char)v25, 0x40000uLL))
        goto LABEL_45;
    }
    else if ((*(_DWORD *)(MEMORY[0x24BDAC740] + 4 * (char)v25 + 60) & 0x40000) == 0)
    {
      goto LABEL_45;
    }
    v27 = (__int16)v25 >> 8;
    if ((v25 & 0x8000) != 0)
    {
      if (!__maskrune(v27, 0x40000uLL))
        goto LABEL_45;
    }
    else if ((*(_DWORD *)(MEMORY[0x24BDAC740] + 4 * v27 + 60) & 0x40000) == 0)
    {
      goto LABEL_45;
    }
    if ((char)buf[3] < 0)
    {
      if (!__maskrune((char)buf[3], 0x40000uLL))
        goto LABEL_45;
    }
    else if ((*(_DWORD *)(MEMORY[0x24BDAC740] + 4 * (char)buf[3] + 60) & 0x40000) == 0)
    {
      goto LABEL_45;
    }
    if ((char)buf[4] < 0)
    {
      if (__maskrune((char)buf[4], 0x40000uLL))
        goto LABEL_43;
    }
    else if ((*(_DWORD *)(MEMORY[0x24BDAC740] + 4 * (char)buf[4] + 60) & 0x40000) != 0)
    {
LABEL_43:
      strcpy((char *)&buf[5], "'");
      buf[0] = 39;
      goto LABEL_46;
    }
LABEL_45:
    __sprintf_chk((char *)buf, 0, 0x14uLL, "%d", v21);
LABEL_46:
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", buf);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v34[0] = v28;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v34, &v33, 1);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "errorWithDomain:code:userInfo:", v23, v24, v29);
    v30 = (id)objc_claimAutoreleasedReturnValue();

    v26 = v30;
    if (v26)
    {
      v31 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134218242;
        *(_QWORD *)&buf[4] = self;
        *(_WORD *)&buf[12] = 2114;
        *(_QWORD *)&buf[14] = v26;
        _os_log_impl(&dword_210BD8000, v31, OS_LOG_TYPE_ERROR, "MPCProcessAudioTap %p - Audio tap - Error disposing of processing audio queue: %{public}@", buf, 0x16u);
      }

    }
    goto LABEL_50;
  }
  v26 = 0;
LABEL_50:
  self->_processingQueue = 0;

}

- (void)tearDownNotifications
{
  id v3;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

}

- (void)mediaServerDidDie:(id)a3
{
  NSObject *v4;
  NSObject *accessQueue;
  _QWORD block[5];
  uint8_t buf[4];
  MPCProcessAudioTap *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v4 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v8 = self;
    _os_log_impl(&dword_210BD8000, v4, OS_LOG_TYPE_DEFAULT, "[AP] - MPCProcessAudioTap %p - mediaserverd died - clearing AQ", buf, 0xCu);
  }

  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __40__MPCProcessAudioTap_mediaServerDidDie___block_invoke;
  block[3] = &unk_24CABA2D0;
  block[4] = self;
  dispatch_async(accessQueue, block);
}

- (void)mediaServerDidRestart:(id)a3
{
  NSObject *v4;
  NSObject *accessQueue;
  _QWORD block[5];
  uint8_t buf[4];
  MPCProcessAudioTap *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v4 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v8 = self;
    _os_log_impl(&dword_210BD8000, v4, OS_LOG_TYPE_DEFAULT, "[AP] - MPCProcessAudioTap %p - mediaserverd restarted - creating AQ", buf, 0xCu);
  }

  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __44__MPCProcessAudioTap_mediaServerDidRestart___block_invoke;
  block[3] = &unk_24CABA2D0;
  block[4] = self;
  dispatch_async(accessQueue, block);
}

- (void)setNumberOfFrames:(unsigned int)a3
{
  self->_numberOfFrames = a3;
}

- (unsigned)numberOfChannels
{
  return self->_numberOfChannels;
}

- (MPCProcessAudioTapDelegate)delegate
{
  return (MPCProcessAudioTapDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (void)setEnabled:(BOOL)a3
{
  self->_enabled = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_accessQueue, 0);
}

uint64_t __44__MPCProcessAudioTap_mediaServerDidRestart___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_createProcessTapWithNumberOfFrames:sampleRate:", objc_msgSend(*(id *)(a1 + 32), "numberOfFrames"), (double)objc_msgSend(*(id *)(a1 + 32), "sampleRate"));
}

void __40__MPCProcessAudioTap_mediaServerDidDie___block_invoke(uint64_t a1)
{
  OSStatus v2;
  OSStatus v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  id v8;
  unsigned int v9;
  unsigned int v10;
  unsigned int v11;
  void *v12;
  void *v13;
  id v14;
  NSObject *v15;
  NSObject *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint8_t buf[32];
  _QWORD v21[2];

  v21[1] = *MEMORY[0x24BDAC8D0];
  v2 = AudioQueueStop(*(AudioQueueRef *)(*(_QWORD *)(a1 + 32) + 8), 1u);
  if (!v2)
  {
    v8 = 0;
    goto LABEL_21;
  }
  v3 = v2;
  v4 = (void *)MEMORY[0x24BDD1540];
  v5 = *MEMORY[0x24BDD1100];
  v6 = v2;
  v21[0] = *MEMORY[0x24BDD0FC8];
  memset(buf, 0, 20);
  v7 = bswap32(v2);
  *(_DWORD *)&buf[1] = v7;
  if ((v7 & 0x80) != 0)
  {
    if (!__maskrune((char)v7, 0x40000uLL))
      goto LABEL_19;
  }
  else if ((*(_DWORD *)(MEMORY[0x24BDAC740] + 4 * (char)v7 + 60) & 0x40000) == 0)
  {
    goto LABEL_19;
  }
  v9 = (__int16)v7 >> 8;
  if ((v7 & 0x8000) != 0)
  {
    if (!__maskrune(v9, 0x40000uLL))
      goto LABEL_19;
  }
  else if ((*(_DWORD *)(MEMORY[0x24BDAC740] + 4 * v9 + 60) & 0x40000) == 0)
  {
    goto LABEL_19;
  }
  v10 = v7 << 8 >> 24;
  if ((v7 & 0x800000) != 0)
  {
    if (!__maskrune(v10, 0x40000uLL))
      goto LABEL_19;
  }
  else if ((*(_DWORD *)(MEMORY[0x24BDAC740] + 4 * v10 + 60) & 0x40000) == 0)
  {
    goto LABEL_19;
  }
  v11 = v7 >> 24;
  if (v7 < 0)
  {
    if (__maskrune(v11, 0x40000uLL))
      goto LABEL_17;
LABEL_19:
    __sprintf_chk((char *)buf, 0, 0x14uLL, "%d", v3);
    goto LABEL_20;
  }
  if ((*(_DWORD *)(MEMORY[0x24BDAC740] + 4 * v11 + 60) & 0x40000) == 0)
    goto LABEL_19;
LABEL_17:
  strcpy((char *)&buf[5], "'");
  buf[0] = 39;
LABEL_20:
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", buf);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)buf = v12;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", buf, v21, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "errorWithDomain:code:userInfo:", v5, v6, v13);
  v8 = (id)objc_claimAutoreleasedReturnValue();

LABEL_21:
  v14 = v8;
  v15 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  v16 = v15;
  if (v14)
  {
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      v17 = *(_QWORD *)(a1 + 32);
      objc_msgSend(v14, "msv_description");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218242;
      *(_QWORD *)&buf[4] = v17;
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = v18;
      _os_log_impl(&dword_210BD8000, v16, OS_LOG_TYPE_ERROR, "[AP] - MPCProcessAudioTap %p - Stopping processing audio queue [mediaserverd death] error=%{public}@", buf, 0x16u);

    }
  }
  else if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    v19 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 134217984;
    *(_QWORD *)&buf[4] = v19;
    _os_log_impl(&dword_210BD8000, v16, OS_LOG_TYPE_DEFAULT, "[AP] - MPCProcessAudioTap %p - Stopping processing audio queue [mediaserverd death]", buf, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "_destroyProcessTap");
}

OpaqueAudioQueue *__29__MPCProcessAudioTap_dealloc__block_invoke(uint64_t a1)
{
  OpaqueAudioQueue *result;

  result = *(OpaqueAudioQueue **)(*(_QWORD *)(a1 + 32) + 8);
  if (result)
  {
    AudioQueueStop(result, 1u);
    return (OpaqueAudioQueue *)objc_msgSend(*(id *)(a1 + 32), "_destroyProcessTap");
  }
  return result;
}

void __26__MPCProcessAudioTap_stop__block_invoke(uint64_t a1)
{
  OpaqueAudioQueue *v2;
  OSStatus v3;
  OSStatus v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  id v9;
  unsigned int v10;
  unsigned int v11;
  unsigned int v12;
  void *v13;
  void *v14;
  id v15;
  NSObject *v16;
  NSObject *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint8_t buf[32];
  _QWORD v23[2];

  v23[1] = *MEMORY[0x24BDAC8D0];
  v2 = *(OpaqueAudioQueue **)(*(_QWORD *)(a1 + 32) + 8);
  if (!v2)
    return;
  v3 = AudioQueueStop(v2, 1u);
  if (v3)
  {
    v4 = v3;
    v5 = (void *)MEMORY[0x24BDD1540];
    v6 = *MEMORY[0x24BDD1100];
    v7 = v3;
    v23[0] = *MEMORY[0x24BDD0FC8];
    memset(buf, 0, 20);
    v8 = bswap32(v3);
    *(_DWORD *)&buf[1] = v8;
    if ((v8 & 0x80) != 0)
    {
      if (!__maskrune((char)v8, 0x40000uLL))
        goto LABEL_20;
    }
    else if ((*(_DWORD *)(MEMORY[0x24BDAC740] + 4 * (char)v8 + 60) & 0x40000) == 0)
    {
      goto LABEL_20;
    }
    v10 = (__int16)v8 >> 8;
    if ((v8 & 0x8000) != 0)
    {
      if (!__maskrune(v10, 0x40000uLL))
        goto LABEL_20;
    }
    else if ((*(_DWORD *)(MEMORY[0x24BDAC740] + 4 * v10 + 60) & 0x40000) == 0)
    {
      goto LABEL_20;
    }
    v11 = v8 << 8 >> 24;
    if ((v8 & 0x800000) != 0)
    {
      if (!__maskrune(v11, 0x40000uLL))
        goto LABEL_20;
    }
    else if ((*(_DWORD *)(MEMORY[0x24BDAC740] + 4 * v11 + 60) & 0x40000) == 0)
    {
      goto LABEL_20;
    }
    v12 = v8 >> 24;
    if (v8 < 0)
    {
      if (__maskrune(v12, 0x40000uLL))
        goto LABEL_18;
    }
    else if ((*(_DWORD *)(MEMORY[0x24BDAC740] + 4 * v12 + 60) & 0x40000) != 0)
    {
LABEL_18:
      strcpy((char *)&buf[5], "'");
      buf[0] = 39;
LABEL_21:
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", buf);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_QWORD *)buf = v13;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", buf, v23, 1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "errorWithDomain:code:userInfo:", v6, v7, v14);
      v9 = (id)objc_claimAutoreleasedReturnValue();

      goto LABEL_22;
    }
LABEL_20:
    __sprintf_chk((char *)buf, 0, 0x14uLL, "%d", v4);
    goto LABEL_21;
  }
  v9 = 0;
LABEL_22:
  v15 = v9;
  v16 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  v17 = v16;
  if (v15)
  {
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      v18 = *(_QWORD *)(a1 + 32);
      objc_msgSend(v15, "msv_description");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218242;
      *(_QWORD *)&buf[4] = v18;
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = v19;
      _os_log_impl(&dword_210BD8000, v17, OS_LOG_TYPE_ERROR, "[AP] - MPCProcessAudioTap %p - Stopping processing audio queue error=%{public}@", buf, 0x16u);

    }
  }
  else if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    v20 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 134217984;
    *(_QWORD *)&buf[4] = v20;
    _os_log_impl(&dword_210BD8000, v17, OS_LOG_TYPE_DEFAULT, "[AP] - MPCProcessAudioTap %p - Stopping processing audio queue", buf, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "_destroyProcessTap");
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v21, "processAudioTapDidStop");

}

void __27__MPCProcessAudioTap_start__block_invoke(uint64_t a1)
{
  _QWORD *v2;
  OpaqueAudioQueue *v3;
  OSStatus v4;
  OSStatus v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  id v10;
  unsigned int v11;
  unsigned int v12;
  unsigned int v13;
  void *v14;
  void *v15;
  id v16;
  NSObject *v17;
  NSObject *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  uint8_t buf[32];
  _QWORD v23[2];

  v23[1] = *MEMORY[0x24BDAC8D0];
  v2 = *(_QWORD **)(a1 + 32);
  v3 = (OpaqueAudioQueue *)v2[1];
  if (!v3)
  {
    objc_msgSend(v2, "_createProcessTapWithNumberOfFrames:sampleRate:", objc_msgSend(v2, "numberOfFrames"), (double)objc_msgSend(*(id *)(a1 + 32), "sampleRate"));
    v3 = *(OpaqueAudioQueue **)(*(_QWORD *)(a1 + 32) + 8);
  }
  v4 = AudioQueueStart(v3, 0);
  if (!v4)
  {
    v10 = 0;
    goto LABEL_23;
  }
  v5 = v4;
  v6 = (void *)MEMORY[0x24BDD1540];
  v7 = *MEMORY[0x24BDD1100];
  v8 = v4;
  v23[0] = *MEMORY[0x24BDD0FC8];
  memset(buf, 0, 20);
  v9 = bswap32(v4);
  *(_DWORD *)&buf[1] = v9;
  if ((v9 & 0x80) != 0)
  {
    if (!__maskrune((char)v9, 0x40000uLL))
      goto LABEL_21;
  }
  else if ((*(_DWORD *)(MEMORY[0x24BDAC740] + 4 * (char)v9 + 60) & 0x40000) == 0)
  {
    goto LABEL_21;
  }
  v11 = (__int16)v9 >> 8;
  if ((v9 & 0x8000) != 0)
  {
    if (!__maskrune(v11, 0x40000uLL))
      goto LABEL_21;
  }
  else if ((*(_DWORD *)(MEMORY[0x24BDAC740] + 4 * v11 + 60) & 0x40000) == 0)
  {
    goto LABEL_21;
  }
  v12 = v9 << 8 >> 24;
  if ((v9 & 0x800000) != 0)
  {
    if (!__maskrune(v12, 0x40000uLL))
      goto LABEL_21;
  }
  else if ((*(_DWORD *)(MEMORY[0x24BDAC740] + 4 * v12 + 60) & 0x40000) == 0)
  {
    goto LABEL_21;
  }
  v13 = v9 >> 24;
  if (v9 < 0)
  {
    if (__maskrune(v13, 0x40000uLL))
      goto LABEL_19;
LABEL_21:
    __sprintf_chk((char *)buf, 0, 0x14uLL, "%d", v5);
    goto LABEL_22;
  }
  if ((*(_DWORD *)(MEMORY[0x24BDAC740] + 4 * v13 + 60) & 0x40000) == 0)
    goto LABEL_21;
LABEL_19:
  strcpy((char *)&buf[5], "'");
  buf[0] = 39;
LABEL_22:
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", buf);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)buf = v14;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", buf, v23, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "errorWithDomain:code:userInfo:", v7, v8, v15);
  v10 = (id)objc_claimAutoreleasedReturnValue();

LABEL_23:
  v16 = v10;
  v17 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  v18 = v17;
  if (v16)
  {
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      v19 = *(_QWORD *)(a1 + 32);
      objc_msgSend(v16, "msv_description");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218242;
      *(_QWORD *)&buf[4] = v19;
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = v20;
      _os_log_impl(&dword_210BD8000, v18, OS_LOG_TYPE_ERROR, "[AP] - MPCProcessAudioTap %p - Starting processing audio queue error=%{public}@", buf, 0x16u);

    }
  }
  else if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    v21 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 134217984;
    *(_QWORD *)&buf[4] = v21;
    _os_log_impl(&dword_210BD8000, v18, OS_LOG_TYPE_DEFAULT, "[AP] - MPCProcessAudioTap %p - Starting processing audio queue", buf, 0xCu);
  }

}

@end
