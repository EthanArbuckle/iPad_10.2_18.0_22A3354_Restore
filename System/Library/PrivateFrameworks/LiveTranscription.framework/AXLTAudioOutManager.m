@implementation AXLTAudioOutManager

+ (AXLTAudioOutManager)sharedInstance
{
  if (sharedInstance_onceToken_3 != -1)
    dispatch_once(&sharedInstance_onceToken_3, &__block_literal_global_6);
  return (AXLTAudioOutManager *)(id)sharedInstance__shared_1;
}

void __37__AXLTAudioOutManager_sharedInstance__block_invoke()
{
  AXLTAudioOutManager *v0;
  void *v1;

  v0 = objc_alloc_init(AXLTAudioOutManager);
  v1 = (void *)sharedInstance__shared_1;
  sharedInstance__shared_1 = (uint64_t)v0;

}

+ (BOOL)isExcludedAppID:(id)a3
{
  uint64_t v3;
  id v4;
  char v5;

  v3 = isExcludedAppID__onceToken[0];
  v4 = a3;
  if (v3 != -1)
    dispatch_once(isExcludedAppID__onceToken, &__block_literal_global_182);
  v5 = objc_msgSend((id)isExcludedAppID___excludedAppIDs, "containsObject:", v4);

  return v5;
}

void __39__AXLTAudioOutManager_isExcludedAppID___block_invoke()
{
  void *v0;

  v0 = (void *)isExcludedAppID___excludedAppIDs;
  isExcludedAppID___excludedAppIDs = (uint64_t)&unk_24F8790D0;

}

- (AXLTAudioOutManager)init
{
  AXLTAudioOutManager *v2;
  AXLTAudioOutManager *v3;
  NSObject *v4;
  dispatch_queue_t v5;
  OS_dispatch_queue *bufferQueue;
  uint64_t v7;
  NSMapTable *processToTranscriberMap;
  NSObject *v9;
  AVSystemController *avSystemController;
  objc_super v12;
  uint8_t buf[4];
  AVSystemController *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v12.receiver = self;
  v12.super_class = (Class)AXLTAudioOutManager;
  v2 = -[AXLTAudioOutManager init](&v12, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_isTranscribing = 0;
    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INTERACTIVE, -1);
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = dispatch_queue_create("com.apple.accessibility.LiveTranscription.audioOutManagerBufferQueue", v4);
    bufferQueue = v3->_bufferQueue;
    v3->_bufferQueue = (OS_dispatch_queue *)v5;

    objc_msgSend(MEMORY[0x24BDD1650], "strongToStrongObjectsMapTable");
    v7 = objc_claimAutoreleasedReturnValue();
    processToTranscriberMap = v3->_processToTranscriberMap;
    v3->_processToTranscriberMap = (NSMapTable *)v7;

    -[AXLTAudioOutManager _setupAVSystemNotificationSystem](v3, "_setupAVSystemNotificationSystem");
    AXLogLiveTranscription();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      avSystemController = v3->_avSystemController;
      *(_DWORD *)buf = 138412290;
      v14 = avSystemController;
      _os_log_impl(&dword_22D27A000, v9, OS_LOG_TYPE_INFO, "_avSystemController: %@", buf, 0xCu);
    }

  }
  return v3;
}

- (void)dealloc
{
  objc_super v3;

  -[AXLTAudioOutManager stopTranscription:](self, "stopTranscription:", 0);
  -[AXLTAudioOutManager _stopTranscriptionForPID:error:](self, "_stopTranscriptionForPID:error:", 4294967293, 0);
  -[AXLTAudioOutManager _stopTranscriptionForPID:error:](self, "_stopTranscriptionForPID:error:", 4294967294, 0);
  v3.receiver = self;
  v3.super_class = (Class)AXLTAudioOutManager;
  -[AXLTAudioOutManager dealloc](&v3, sel_dealloc);
}

- (BOOL)startTranscription:(id *)a3
{
  NSObject *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  uint8_t v10[16];
  uint8_t buf[16];

  if (-[AXLTAudioOutManager isTranscribing](self, "isTranscribing", a3))
  {
    AXLogLiveTranscription();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_22D27A000, v4, OS_LOG_TYPE_INFO, "Already registered for transcribing", buf, 2u);
    }

  }
  else
  {
    -[AXLTAudioOutManager setIsTranscribing:](self, "setIsTranscribing:", 1);
    +[AXLTTranscriber sharedInstance](AXLTTranscriber, "sharedInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "downloadState");

    if (v6 == -1)
    {
      +[AXLTTranscriber sharedInstance](AXLTTranscriber, "sharedInstance");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setDownloadState:", -2);

    }
    AXLogLiveTranscription();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl(&dword_22D27A000, v8, OS_LOG_TYPE_INFO, "registered for transcription", v10, 2u);
    }

    -[AXLTAudioOutManager registerFirstTimeForAVSystemControllerNotifications](self, "registerFirstTimeForAVSystemControllerNotifications");
  }
  return 1;
}

- (BOOL)stopTranscription:(id *)a3
{
  void *v4;
  NSObject *v5;
  uint8_t v7[16];

  if (-[AXLTAudioOutManager isTranscribing](self, "isTranscribing", a3))
  {
    -[AXLTAudioOutManager setIsTranscribing:](self, "setIsTranscribing:", 0);
    -[AXLTAudioOutManager unregisterForAVSystemContollerNotifications](self, "unregisterForAVSystemContollerNotifications");
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeObserver:name:object:", self, *MEMORY[0x24BE64908], 0);

  }
  else
  {
    AXLogLiveTranscription();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_22D27A000, v5, OS_LOG_TYPE_INFO, "Already stopped transcribing", v7, 2u);
    }

  }
  return 1;
}

- (BOOL)isTranscribingForPID:(int)a3
{
  NSObject *v5;
  _QWORD block[6];
  int v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  char v12;

  v9 = 0;
  v10 = &v9;
  v11 = 0x2020000000;
  v12 = 0;
  -[AXLTAudioOutManager bufferQueue](self, "bufferQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __44__AXLTAudioOutManager_isTranscribingForPID___block_invoke;
  block[3] = &unk_24F875310;
  v8 = a3;
  block[4] = self;
  block[5] = &v9;
  dispatch_sync(v5, block);

  LOBYTE(a3) = *((_BYTE *)v10 + 24);
  _Block_object_dispose(&v9, 8);
  return a3;
}

void __44__AXLTAudioOutManager_isTranscribingForPID___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "processToTranscriberMap", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v8;
    while (2)
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v2);
        if (objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * i), "intValue") == *(_DWORD *)(a1 + 48))
        {
          *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
          goto LABEL_11;
        }
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
      if (v4)
        continue;
      break;
    }
  }
LABEL_11:

}

- (id)_reportErrorWithCode:(int64_t)a3 debugErrorString:(id)a4 cleanupForPID:(int)a5
{
  uint64_t v5;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v14;
  _QWORD v15[2];

  v5 = *(_QWORD *)&a5;
  v15[1] = *MEMORY[0x24BDAC8D0];
  v8 = a4;
  AXLogLiveTranscription();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    -[AXLTAudioOutManager _reportErrorWithCode:debugErrorString:cleanupForPID:].cold.1();

  v10 = (void *)MEMORY[0x24BDD1540];
  v14 = *MEMORY[0x24BDD0BA0];
  v15[0] = v8;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v15, &v14, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "errorWithDomain:code:userInfo:", CFSTR("com.apple.accessibility.LiveTranscription"), a3, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[AXLTAudioOutManager _cleanupForPID:](self, "_cleanupForPID:", v5);
  return v12;
}

- (BOOL)_startTranscriptionForPID:(int)a3 error:(id *)a4
{
  uint64_t v5;
  void *v7;

  v5 = *(_QWORD *)&a3;
  AXLCLocString(CFSTR("liveCaptions.system"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a4) = -[AXLTAudioOutManager _startTranscriptionForPID:appID:appName:excludingPIDs:error:](self, "_startTranscriptionForPID:appID:appName:excludingPIDs:error:", v5, CFSTR("System"), v7, 0, a4);

  return (char)a4;
}

- (BOOL)_startTranscriptionForPID:(int)a3 appName:(id)a4 error:(id *)a5
{
  return -[AXLTAudioOutManager _startTranscriptionForPID:appID:appName:excludingPIDs:error:](self, "_startTranscriptionForPID:appID:appName:excludingPIDs:error:", *(_QWORD *)&a3, CFSTR("System"), a4, 0, a5);
}

- (BOOL)_startTranscriptionForPID:(int)a3 appName:(id)a4 excludingPIDs:(id)a5 error:(id *)a6
{
  return -[AXLTAudioOutManager _startTranscriptionForPID:appID:appName:excludingPIDs:error:](self, "_startTranscriptionForPID:appID:appName:excludingPIDs:error:", *(_QWORD *)&a3, CFSTR("System"), a4, a5, a6);
}

- (BOOL)_startTranscriptionForPID:(int)a3 appID:(id)a4 appName:(id)a5 error:(id *)a6
{
  return -[AXLTAudioOutManager _startTranscriptionForPID:appID:appName:excludingPIDs:error:](self, "_startTranscriptionForPID:appID:appName:excludingPIDs:error:", *(_QWORD *)&a3, a4, a5, 0, a6);
}

- (BOOL)_startTranscriptionForPID:(int)a3 appID:(id)a4 appName:(id)a5 excludingPIDs:(id)a6 error:(id *)a7
{
  uint64_t v10;
  id v12;
  id v13;
  id v14;
  _BOOL4 v15;
  NSObject *v16;
  NSObject *v17;
  BOOL v18;
  void *v19;
  void *v20;
  AXLTAudioOutTranscriber *v21;
  void *v22;
  AXLTAudioOutTranscriber *v23;
  NSObject *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  __int128 v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  void *v35;
  signed int mBytesPerPacket;
  uint64_t v38;
  uint64_t Property;
  UInt32 ioDataSize;
  UInt32 outData;
  AudioQueueRef outAQ;
  _QWORD block[5];
  NSObject *v44;
  int v45;
  AudioStreamBasicDescription buf;
  uint64_t v47;

  v10 = *(_QWORD *)&a3;
  v47 = *MEMORY[0x24BDAC8D0];
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = -[AXLTAudioOutManager isTranscribingForPID:](self, "isTranscribingForPID:", v10);
  AXLogLiveTranscription();
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = v16;
  if (!v15)
  {
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v10);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(buf.mSampleRate) = 138412546;
      *(_QWORD *)((char *)&buf.mSampleRate + 4) = v13;
      LOWORD(buf.mFormatFlags) = 2112;
      *(_QWORD *)((char *)&buf.mFormatFlags + 2) = v20;
      _os_log_impl(&dword_22D27A000, v17, OS_LOG_TYPE_DEFAULT, "AudioManager: Starting transcription for app: %@, pid: %@", (uint8_t *)&buf, 0x16u);

    }
    v21 = [AXLTAudioOutTranscriber alloc];
    -[AXLTAudioOutManager delegate](self, "delegate");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = -[AXLTAudioOutTranscriber initWithPID:appID:appName:delegate:](v21, "initWithPID:appID:appName:delegate:", v10, v12, v13, v22);

    -[AXLTAudioOutManager bufferQueue](self, "bufferQueue");
    v24 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __83__AXLTAudioOutManager__startTranscriptionForPID_appID_appName_excludingPIDs_error___block_invoke;
    block[3] = &unk_24F875338;
    block[4] = self;
    v17 = v23;
    v44 = v17;
    v45 = v10;
    dispatch_sync(v24, block);

    v25 = -[NSObject pid](v17, "pid");
    -[NSObject tapFormat](v17, "tapFormat");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXLTAudioOutManager _tapDescriptionForPID:tapFormat:excludePIDs:](self, "_tapDescriptionForPID:tapFormat:excludePIDs:", v25, v26, v14);
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v27, "format");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = objc_msgSend(v28, "streamDescription");
    v30 = *(_QWORD *)(v29 + 32);
    v31 = *(_OWORD *)(v29 + 16);
    *(_OWORD *)&buf.mSampleRate = *(_OWORD *)v29;
    *(_OWORD *)&buf.mBytesPerPacket = v31;
    *(_QWORD *)&buf.mBitsPerChannel = v30;

    outAQ = 0;
    v32 = AudioQueueNewInput(&buf, (AudioQueueInputCallback)handleInputBuffer, v17, 0, 0, 0x800u, &outAQ);
    if ((_DWORD)v32)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Failed to create audio queue: %d"), v32);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      -[AXLTAudioOutManager _reportErrorWithCode:debugErrorString:cleanupForPID:](self, "_reportErrorWithCode:debugErrorString:cleanupForPID:", 5, v33, v10);
      v18 = 0;
      *a7 = (id)objc_claimAutoreleasedReturnValue();
LABEL_12:

      goto LABEL_13;
    }
    -[NSObject setAudioQueue:](v17, "setAudioQueue:", outAQ);
    v33 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDB6BC8]), "initWithTapDescription:", v27);
    v34 = AudioQueueSetProperty(outAQ, 0x71746F62u, v33, 8u);
    if ((_DWORD)v34)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Failed to create tap: %d"), v34);
    }
    else
    {
      mBytesPerPacket = buf.mBytesPerPacket;
      outData = buf.mBytesPerPacket;
      if (!buf.mBytesPerPacket)
      {
        ioDataSize = 4;
        Property = AudioQueueGetProperty(outAQ, 0x786F7073u, &outData, &ioDataSize);
        if ((_DWORD)Property)
        {
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Failed to get max output packet size: %d"), Property);
          goto LABEL_10;
        }
        mBytesPerPacket = outData;
      }
      if (!-[NSObject createAudioBuffersWithBufferByteSize:error:](v17, "createAudioBuffersWithBufferByteSize:error:", fmin(buf.mSampleRate * (double)mBytesPerPacket, 6400.0), a7))goto LABEL_11;
      v38 = AudioQueueStart(outAQ, 0);
      if (!(_DWORD)v38)
      {
        v18 = 1;
        goto LABEL_12;
      }
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Failed to start audio queue: %d"), v38);
    }
LABEL_10:
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXLTAudioOutManager _reportErrorWithCode:debugErrorString:cleanupForPID:](self, "_reportErrorWithCode:debugErrorString:cleanupForPID:", 5, v35, v10);
    *a7 = (id)objc_claimAutoreleasedReturnValue();

LABEL_11:
    v18 = 0;
    goto LABEL_12;
  }
  v18 = 1;
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v10);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(buf.mSampleRate) = 138412546;
    *(_QWORD *)((char *)&buf.mSampleRate + 4) = v13;
    LOWORD(buf.mFormatFlags) = 2112;
    *(_QWORD *)((char *)&buf.mFormatFlags + 2) = v19;
    _os_log_impl(&dword_22D27A000, v17, OS_LOG_TYPE_INFO, "AudioManager already transcribing for app: %@, pid: %@", (uint8_t *)&buf, 0x16u);

  }
LABEL_13:

  return v18;
}

void __83__AXLTAudioOutManager__startTranscriptionForPID_appID_appName_excludingPIDs_error___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "processToTranscriberMap");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v2 = *(_QWORD *)(a1 + 40);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", *(unsigned int *)(a1 + 48));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v2, v3);

}

- (BOOL)_stopTranscriptionForPID:(int)a3 error:(id *)a4
{
  uint64_t v4;
  NSObject *v6;
  void *v7;
  int v9;
  void *v10;
  uint64_t v11;

  v4 = *(_QWORD *)&a3;
  v11 = *MEMORY[0x24BDAC8D0];
  AXLogLiveTranscription();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138412290;
    v10 = v7;
    _os_log_impl(&dword_22D27A000, v6, OS_LOG_TYPE_DEFAULT, "AudioManager: Stopping transcription for pid: %@", (uint8_t *)&v9, 0xCu);

  }
  -[AXLTAudioOutManager _cleanupForPID:](self, "_cleanupForPID:", v4);
  return 1;
}

- (void)handleInputBufferWithContext:(void *)a3 audioQueue:(OpaqueAudioQueue *)a4 audioBuffer:(AudioQueueBuffer *)a5 timestamp:(const AudioTimeStamp *)a6 packetCount:(unsigned int)a7 packetDesc:(const AudioStreamPacketDescription *)a8
{
  void *v14;
  NSObject *v15;
  id v16;
  _QWORD block[5];
  id v18;
  AudioQueueBuffer *v19;
  OpaqueAudioQueue *v20;
  const AudioTimeStamp *v21;
  const AudioStreamPacketDescription *v22;
  unsigned int v23;

  v14 = a3;
  -[AXLTAudioOutManager bufferQueue](self, "bufferQueue");
  v15 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __108__AXLTAudioOutManager_handleInputBufferWithContext_audioQueue_audioBuffer_timestamp_packetCount_packetDesc___block_invoke;
  block[3] = &unk_24F875360;
  block[4] = self;
  v18 = v14;
  v19 = a5;
  v20 = a4;
  v23 = a7;
  v21 = a6;
  v22 = a8;
  v16 = v14;
  dispatch_async(v15, block);

}

void __108__AXLTAudioOutManager_handleInputBufferWithContext_audioQueue_audioBuffer_timestamp_packetCount_packetDesc___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "processToTranscriberMap");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", objc_msgSend(*(id *)(a1 + 40), "pid"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    objc_msgSend(*(id *)(a1 + 40), "handleAudioBuffer:audioQueue:timestamp:packetCount:packetDesc:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(unsigned int *)(a1 + 80), *(_QWORD *)(a1 + 72));
}

- (void)_cleanupForPID:(int)a3
{
  uint64_t v3;
  void *v5;
  void *v6;
  NSObject *v7;
  id v8;
  _QWORD block[5];
  int v10;

  v3 = *(_QWORD *)&a3;
  -[AXLTAudioOutManager processToTranscriberMap](self, "processToTranscriberMap");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v6);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  -[AXLTAudioOutManager bufferQueue](self, "bufferQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __38__AXLTAudioOutManager__cleanupForPID___block_invoke;
  block[3] = &unk_24F875388;
  block[4] = self;
  v10 = v3;
  dispatch_sync(v7, block);

  objc_msgSend(v8, "cleanup");
}

void __38__AXLTAudioOutManager__cleanupForPID___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "processToTranscriberMap");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", *(unsigned int *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObjectForKey:", v2);

}

- (void)_cleanupAllPids
{
  void *v3;
  NSObject *v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _QWORD block[5];
  id v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)objc_opt_new();
  -[AXLTAudioOutManager bufferQueue](self, "bufferQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __38__AXLTAudioOutManager__cleanupAllPids__block_invoke;
  block[3] = &unk_24F874E58;
  block[4] = self;
  v5 = v3;
  v16 = v5;
  dispatch_sync(v4, block);

  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v6 = v5;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v12;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v12 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v10++), "cleanup", (_QWORD)v11);
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v17, 16);
    }
    while (v8);
  }

}

void __38__AXLTAudioOutManager__cleanupAllPids__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;

  objc_msgSend(*(id *)(a1 + 32), "processToTranscriberMap");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "keyEnumerator");
  v9 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "nextObject");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)v3;
    do
    {
      objc_msgSend(*(id *)(a1 + 32), "processToTranscriberMap");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "objectForKey:", v4);
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      if (v6)
        objc_msgSend(*(id *)(a1 + 40), "addObject:", v6);

      objc_msgSend(v9, "nextObject");
      v7 = objc_claimAutoreleasedReturnValue();

      v4 = (void *)v7;
    }
    while (v7);
  }
  objc_msgSend(*(id *)(a1 + 32), "processToTranscriberMap");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "removeAllObjects");

}

- (id)_tapDescriptionForPID:(int)a3 tapFormat:(id)a4 excludePIDs:(id)a5
{
  uint64_t v6;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  uint64_t v13;
  id v14;

  v6 = *(_QWORD *)&a3;
  v8 = a4;
  v9 = a5;
  if (!-[AXLTAudioOutManager _pidSupportsCoreMediaNotifications:](self, "_pidSupportsCoreMediaNotifications:", v6)
    && (_DWORD)v6 == -1)
  {
    v13 = objc_msgSend(v9, "count");
    v14 = objc_alloc(MEMORY[0x24BDB6BD0]);
    if (v13)
      v10 = objc_msgSend(v14, "initSystemTapWithFormat:excludePIDs:", v8, v9);
    else
      v10 = objc_msgSend(v14, "initSystemTapWithFormat:", v8);
  }
  else
  {
    v10 = objc_msgSend(objc_alloc(MEMORY[0x24BDB6BD0]), "initProcessTapWithFormat:PID:", v8, v6);
  }
  v11 = (void *)v10;

  return v11;
}

- (BOOL)_pidSupportsCoreMediaNotifications:(int)a3
{
  return (a3 + 1) < 0xFFFFFFFE;
}

- (void)registerFirstTimeForAVSystemControllerNotifications
{
  int v3;
  const char *v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v3 = 136315138;
  v4 = "[NSThread isMainThread]";
  OUTLINED_FUNCTION_0_3(&dword_22D27A000, a1, a3, "Assertion failed: %s", (uint8_t *)&v3);
  OUTLINED_FUNCTION_1();
}

- (void)registerForAVSystemContollerNotifications
{
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  uint8_t v10[16];

  if ((objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread") & 1) == 0)
  {
    AXLogLiveTranscription();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      -[AXLTAudioOutManager registerFirstTimeForAVSystemControllerNotifications].cold.1(v3, v4, v5);

  }
  -[AXLTAudioOutManager setSubscribed:](self, "setSubscribed:", 1);
  objc_msgSend(MEMORY[0x24BE64988], "sharedAVSystemController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "attributeForKey:", *MEMORY[0x24BE648A8]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXLTAudioOutManager updateAudioSessionsInfoFromSessionsArray:](self, "updateAudioSessionsInfoFromSessionsArray:", v7);

  AXLogLiveTranscription();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v10 = 0;
    _os_log_impl(&dword_22D27A000, v8, OS_LOG_TYPE_INFO, "registered for _someSessionIsPlayingDidChangeNotification", v10, 2u);
  }

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addObserver:selector:name:object:", self, sel__someSessionIsPlayingDidChangeNotification_, *MEMORY[0x24BE64920], 0);

}

- (void)unregisterForAVSystemContollerNotifications
{
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  uint8_t v8[16];

  if ((objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread") & 1) == 0)
  {
    AXLogLiveTranscription();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      -[AXLTAudioOutManager registerFirstTimeForAVSystemControllerNotifications].cold.1(v3, v4, v5);

  }
  AXLogLiveTranscription();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_22D27A000, v6, OS_LOG_TYPE_INFO, "unregistered for _someSessionIsPlayingDidChangeNotification", v8, 2u);
  }

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeObserver:name:object:", self, *MEMORY[0x24BE64920], 0);

  -[AXLTAudioOutManager _cleanupAllPids](self, "_cleanupAllPids");
  -[AXLTAudioOutManager setSubscribed:](self, "setSubscribed:", 0);
}

- (void)_someSessionIsPlayingDidChangeNotification:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  _QWORD v8[4];
  id v9;
  AXLTAudioOutManager *v10;
  uint8_t buf[16];

  v4 = a3;
  AXLogLiveTranscription();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_22D27A000, v5, OS_LOG_TYPE_INFO, "Audio Sessions states were changed", buf, 2u);
  }

  objc_msgSend(v4, "userInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x24BE64928]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __66__AXLTAudioOutManager__someSessionIsPlayingDidChangeNotification___block_invoke;
    v8[3] = &unk_24F874E58;
    v9 = v7;
    v10 = self;
    dispatch_async(MEMORY[0x24BDAC9B8], v8);

  }
}

uint64_t __66__AXLTAudioOutManager__someSessionIsPlayingDidChangeNotification___block_invoke(uint64_t a1)
{
  NSObject *v2;

  AXLogLiveTranscription();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __66__AXLTAudioOutManager__someSessionIsPlayingDidChangeNotification___block_invoke_cold_1(a1, v2);

  return objc_msgSend(*(id *)(a1 + 40), "updateAudioSessionsInfoFromSessionsArray:", *(_QWORD *)(a1 + 32));
}

- (void)_setupAVSystemNotificationSystem
{
  OUTLINED_FUNCTION_6_0(&dword_22D27A000, a1, a3, "failed to register for avSystemController for notifications", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_0();
}

- (void)_avSessionMediaServicesResetNotification:(id)a3
{
  NSObject *v4;

  AXLogLiveTranscription();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    -[AXLTAudioOutManager _avSessionMediaServicesResetNotification:].cold.1(v4);

  -[AXLTAudioOutManager _setupAVSystemNotificationSystem](self, "_setupAVSystemNotificationSystem");
}

- (void)updateAudioSessionsInfoFromSessionsArray:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  NSObject *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  NSObject *v15;
  NSObject *v16;
  NSObject *v17;
  NSObject *v18;
  void *v19;
  BOOL v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  _BOOL4 v26;
  id v27;
  NSObject *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  NSObject *v37;
  uint64_t v38;
  BOOL v39;
  NSObject *v40;
  uint64_t v41;
  id v42;
  id v43;
  NSObject *v44;
  AXLTAudioOutManager *v45;
  void *v46;
  uint64_t v47;
  uint64_t v48;
  id v49;
  id v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  _BYTE v55[16];
  uint8_t buf[4];
  void *v57;
  __int16 v58;
  void *v59;
  _BYTE v60[16];
  _BYTE v61[128];
  uint64_t v62;

  v62 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  AXLogLiveTranscription();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_22D27A000, v5, OS_LOG_TYPE_DEFAULT, "AudioManager: Updating Audio Sessions", buf, 2u);
  }

  if (-[AXLTAudioOutManager subscribed](self, "subscribed"))
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v6 = objc_claimAutoreleasedReturnValue();
    AXLogLiveTranscription();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      -[AXLTAudioOutManager updateAudioSessionsInfoFromSessionsArray:].cold.3(v4, v7);

    v53 = 0u;
    v54 = 0u;
    v51 = 0u;
    v52 = 0u;
    v42 = v4;
    v8 = v4;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v51, v61, 16);
    v44 = v6;
    v45 = self;
    if (v9)
    {
      v10 = v9;
      v46 = 0;
      v11 = (_QWORD *)MEMORY[0x24BE648B0];
      v48 = *(_QWORD *)v52;
      v43 = v8;
      do
      {
        v12 = 0;
        v47 = v10;
        do
        {
          if (*(_QWORD *)v52 != v48)
            objc_enumerationMutation(v8);
          objc_msgSend(*(id *)(*((_QWORD *)&v51 + 1) + 8 * v12), "objectForKeyedSubscript:", *v11, v42);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = objc_msgSend(v13, "intValue");
          AXLogLiveTranscription();
          v15 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 67109120;
            LODWORD(v57) = v14;
            _os_log_debug_impl(&dword_22D27A000, v15, OS_LOG_TYPE_DEBUG, "updateAudioSessionsInfoFromSessionsArray pid: %d", buf, 8u);
          }

          if ((_DWORD)v14)
          {
            if (-[AXLTAudioOutManager isTranscribingForPID:](self, "isTranscribingForPID:", v14))
            {
              -[NSObject setObject:forKeyedSubscript:](v6, "setObject:forKeyedSubscript:", CFSTR("playing"), v13);
              AXLogLiveTranscription();
              v16 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 67109120;
                LODWORD(v57) = v14;
                _os_log_debug_impl(&dword_22D27A000, v16, OS_LOG_TYPE_DEBUG, "isTranscribingForPID pid: %d", buf, 8u);
              }
            }
            else
            {
              AXLogLiveTranscription();
              v17 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 67109120;
                LODWORD(v57) = v14;
                _os_log_debug_impl(&dword_22D27A000, v17, OS_LOG_TYPE_DEBUG, "start transcribing pid: %d", buf, 8u);
              }

              -[AXLTAudioOutManager appInfoFromPid:](self, "appInfoFromPid:", v14);
              v16 = objc_claimAutoreleasedReturnValue();
              AXLogLiveTranscription();
              v18 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
                -[AXLTAudioOutManager updateAudioSessionsInfoFromSessionsArray:].cold.2((uint64_t)v60, (uint64_t)v16);

              -[NSObject objectForKeyedSubscript:](v16, "objectForKeyedSubscript:", CFSTR("AppIDKey"));
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              v20 = +[AXLTAudioOutManager isExcludedAppID:](AXLTAudioOutManager, "isExcludedAppID:", v19);

              if (!v20)
              {
                AXLogLiveTranscription();
                v21 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
                {
                  -[NSObject objectForKeyedSubscript:](v16, "objectForKeyedSubscript:", CFSTR("AppNameKey"));
                  v22 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v14);
                  v23 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138412546;
                  v57 = v22;
                  v58 = 2112;
                  v59 = v23;
                  _os_log_impl(&dword_22D27A000, v21, OS_LOG_TYPE_DEFAULT, "AudioManager Sessions: Starting transcription for app: %@, pid: %@", buf, 0x16u);

                }
                -[NSObject objectForKeyedSubscript:](v16, "objectForKeyedSubscript:", CFSTR("AppIDKey"));
                v24 = (void *)objc_claimAutoreleasedReturnValue();
                -[NSObject objectForKeyedSubscript:](v16, "objectForKeyedSubscript:", CFSTR("AppNameKey"));
                v25 = (void *)objc_claimAutoreleasedReturnValue();
                v50 = v46;
                v26 = -[AXLTAudioOutManager _startTranscriptionForPID:appID:appName:error:](self, "_startTranscriptionForPID:appID:appName:error:", v14, v24, v25, &v50);
                v27 = v50;

                if (v26)
                {
                  v6 = v44;
                  -[NSObject setObject:forKeyedSubscript:](v44, "setObject:forKeyedSubscript:", CFSTR("playing"), v13);
                  AXLogLiveTranscription();
                  v28 = objc_claimAutoreleasedReturnValue();
                  v8 = v43;
                  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
                  {
                    *(_DWORD *)buf = 67109120;
                    LODWORD(v57) = v14;
                    _os_log_debug_impl(&dword_22D27A000, v28, OS_LOG_TYPE_DEBUG, "isTranscribingForPID pid: %d", buf, 8u);
                  }
                }
                else
                {
                  AXLogLiveTranscription();
                  v28 = objc_claimAutoreleasedReturnValue();
                  v8 = v43;
                  v6 = v44;
                  if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)buf = 67109120;
                    LODWORD(v57) = v14;
                    _os_log_error_impl(&dword_22D27A000, v28, OS_LOG_TYPE_ERROR, "failed to start transcription for pid: %d\n", buf, 8u);
                  }
                }
                self = v45;

                v46 = v27;
              }
              v10 = v47;
            }

          }
          ++v12;
        }
        while (v10 != v12);
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v51, v61, 16);
      }
      while (v10);
    }
    else
    {
      v46 = 0;
    }

    -[AXLTAudioOutManager processToTranscriberMap](self, "processToTranscriberMap");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = (void *)objc_msgSend(v29, "copy");

    objc_msgSend(v30, "keyEnumerator");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "nextObject");
    v32 = objc_claimAutoreleasedReturnValue();
    if (v32)
    {
      v33 = (void *)v32;
      v4 = v42;
      v34 = v46;
      do
      {
        -[NSObject objectForKeyedSubscript:](v6, "objectForKeyedSubscript:", v33, v42);
        v35 = (void *)objc_claimAutoreleasedReturnValue();

        if (v35)
        {
          v36 = v34;
        }
        else
        {
          AXLogLiveTranscription();
          v37 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v57 = v33;
            _os_log_impl(&dword_22D27A000, v37, OS_LOG_TYPE_DEFAULT, "AudioManager Sessions: Stopping transcription for pid: %@", buf, 0xCu);
          }

          v38 = objc_msgSend(v33, "intValue");
          v49 = v34;
          v39 = -[AXLTAudioOutManager _stopTranscriptionForPID:error:](v45, "_stopTranscriptionForPID:error:", v38, &v49);
          v36 = v49;

          if (!v39)
          {
            AXLogLiveTranscription();
            v40 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
              -[AXLTAudioOutManager updateAudioSessionsInfoFromSessionsArray:].cold.1((uint64_t)v55, (uint64_t)v33);

            v6 = v44;
          }
        }
        objc_msgSend(v31, "nextObject");
        v41 = objc_claimAutoreleasedReturnValue();

        v33 = (void *)v41;
        v34 = v36;
      }
      while (v41);
    }
    else
    {
      v36 = v46;
      v4 = v42;
    }

  }
  else
  {
    AXLogLiveTranscription();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_22D27A000, v6, OS_LOG_TYPE_DEFAULT, "AudioManager: Not subscribed to audio session updates, skip", buf, 2u);
    }
  }

}

- (id)appInfoFromPid:(int)a3
{
  uint64_t v3;
  __CFString *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v13;
  __CFString *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  NSObject *v22;
  NSObject *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  id v31;
  id v32;
  id v33;
  _QWORD v34[2];
  _QWORD v35[3];

  v3 = *(_QWORD *)&a3;
  v35[2] = *MEMORY[0x24BDAC8D0];
  v4 = CFSTR("System");
  AXLCLocString(CFSTR("liveCaptions.system"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x24BE80C78];
  objc_msgSend(MEMORY[0x24BE80C90], "identifierWithPid:", v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = 0;
  objc_msgSend(v6, "handleForIdentifier:error:", v7, &v33);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v33;

  if (v9)
  {
    AXLogLiveTranscription();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[AXLTAudioOutManager appInfoFromPid:].cold.5(v9, v10);
    goto LABEL_4;
  }
  objc_msgSend(v8, "bundle");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "identifier");
  v14 = (__CFString *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "hostProcess");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "bundle");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "identifier");
  v10 = objc_claimAutoreleasedReturnValue();

  AXLogLiveTranscription();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    -[AXLTAudioOutManager appInfoFromPid:].cold.4();

  AXLogLiveTranscription();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    -[AXLTAudioOutManager appInfoFromPid:].cold.3();

  if (v10)
  {
    v32 = 0;
    v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDC1540]), "initWithBundleIdentifier:allowPlaceholder:error:", v10, 0, &v32);
    v9 = v32;
    v4 = v10;

    if (!v19)
      goto LABEL_4;
LABEL_14:
    objc_msgSend(v19, "localizedName");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (v20)
    {
      objc_msgSend(v19, "localizedName");
      v21 = objc_claimAutoreleasedReturnValue();

      v5 = (void *)v21;
    }
    else
    {
      AXLogLiveTranscription();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        -[AXLTAudioOutManager appInfoFromPid:].cold.2(v9, v22);

    }
    goto LABEL_4;
  }
  if (v14)
  {
    v31 = 0;
    v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDC1540]), "initWithBundleIdentifier:allowPlaceholder:error:", v14, 0, &v31);
    v9 = v31;
    v4 = v14;
    if (!v19)
      goto LABEL_4;
    goto LABEL_14;
  }
  AXLogLiveTranscription();
  v23 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    -[AXLTAudioOutManager appInfoFromPid:].cold.1(v23, v24, v25, v26, v27, v28, v29, v30);

  v4 = v4;
  v9 = 0;
LABEL_4:

  v34[0] = CFSTR("AppIDKey");
  v34[1] = CFSTR("AppNameKey");
  v35[0] = v4;
  v35[1] = v5;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v35, v34, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (BOOL)isTranscribing
{
  return self->_isTranscribing;
}

- (void)setIsTranscribing:(BOOL)a3
{
  self->_isTranscribing = a3;
}

- (AXLTTranscriberDelegateProtocol)delegate
{
  return (AXLTTranscriberDelegateProtocol *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (OS_dispatch_queue)bufferQueue
{
  return self->_bufferQueue;
}

- (void)setBufferQueue:(id)a3
{
  objc_storeStrong((id *)&self->_bufferQueue, a3);
}

- (NSMapTable)processToTranscriberMap
{
  return (NSMapTable *)objc_getProperty(self, a2, 32, 1);
}

- (AVSystemController)avSystemController
{
  return self->_avSystemController;
}

- (void)setAvSystemController:(id)a3
{
  objc_storeStrong((id *)&self->_avSystemController, a3);
}

- (BOOL)subscribed
{
  return self->_subscribed;
}

- (void)setSubscribed:(BOOL)a3
{
  self->_subscribed = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_avSystemController, 0);
  objc_storeStrong((id *)&self->_processToTranscriberMap, 0);
  objc_storeStrong((id *)&self->_bufferQueue, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)_reportErrorWithCode:debugErrorString:cleanupForPID:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_3(&dword_22D27A000, v0, v1, "%@", v2);
  OUTLINED_FUNCTION_1();
}

void __66__AXLTAudioOutManager__someSessionIsPlayingDidChangeNotification___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v3;
  uint8_t v4[24];
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "count");
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_1(&dword_22D27A000, a2, v3, "_someSessionIsPlayingDidChangeNotification [session count]: %lu", v4);
  OUTLINED_FUNCTION_9();
}

- (void)_avSessionMediaServicesResetNotification:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_22D27A000, log, OS_LOG_TYPE_DEBUG, "_avSessionMediaServicesResetNotification callback", v1, 2u);
  OUTLINED_FUNCTION_1_0();
}

- (void)updateAudioSessionsInfoFromSessionsArray:(uint64_t)a1 .cold.1(uint64_t a1, uint64_t a2)
{
  NSObject *v2;
  _DWORD *v3;
  uint8_t *v4;
  int v5;

  v5 = objc_msgSend((id)OUTLINED_FUNCTION_8_0(a1, a2), "intValue");
  *(_DWORD *)v4 = 67109120;
  *v3 = v5;
  _os_log_error_impl(&dword_22D27A000, v2, OS_LOG_TYPE_ERROR, "failed to stop transcription for pid: %d\n", v4, 8u);
  OUTLINED_FUNCTION_7_0();
}

- (void)updateAudioSessionsInfoFromSessionsArray:(uint64_t)a1 .cold.2(uint64_t a1, uint64_t a2)
{
  NSObject *v2;
  _QWORD *v3;
  uint8_t *v4;
  void *v5;

  objc_msgSend((id)OUTLINED_FUNCTION_8_0(a1, a2), "description");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)v4 = 138412290;
  *v3 = v5;
  _os_log_debug_impl(&dword_22D27A000, v2, OS_LOG_TYPE_DEBUG, "appInfo: %@", v4, 0xCu);

  OUTLINED_FUNCTION_7_0();
}

- (void)updateAudioSessionsInfoFromSessionsArray:(void *)a1 .cold.3(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_1(&dword_22D27A000, a2, v4, "sessions: %@", v5);

  OUTLINED_FUNCTION_9();
}

- (void)appInfoFromPid:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_6_0(&dword_22D27A000, a1, a3, "Couldn't get appID", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_0();
}

- (void)appInfoFromPid:(void *)a1 .cold.2(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_3(&dword_22D27A000, a2, v4, "Couldn't read appName from record, error = %@", v5);

  OUTLINED_FUNCTION_9();
}

- (void)appInfoFromPid:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_1(&dword_22D27A000, v0, v1, "Host AppID: %@", v2);
  OUTLINED_FUNCTION_1();
}

- (void)appInfoFromPid:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_1(&dword_22D27A000, v0, v1, "Process AppID: %@", v2);
  OUTLINED_FUNCTION_1();
}

- (void)appInfoFromPid:(void *)a1 .cold.5(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_3(&dword_22D27A000, a2, v4, "Couldn't get process handle, error = %@", v5);

  OUTLINED_FUNCTION_9();
}

@end
