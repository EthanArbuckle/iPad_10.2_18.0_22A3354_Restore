@implementation APCPlayerEngine

- (id)createAU:(AudioComponentDescription *)a3
{
  NSObject *v4;
  dispatch_time_t v5;
  intptr_t v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  __CFString *v10;
  _QWORD v12[7];
  AudioComponentDescription v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  dispatch_semaphore_t v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;
  uint8_t buf[4];
  __CFString *v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v26 = 0;
  v27 = &v26;
  v28 = 0x3032000000;
  v29 = __Block_byref_object_copy_;
  v30 = __Block_byref_object_dispose_;
  v31 = 0;
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy_;
  v24 = __Block_byref_object_dispose_;
  v25 = dispatch_semaphore_create(0);
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy_;
  v18 = __Block_byref_object_dispose_;
  v19 = 0;
  v13 = *a3;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __28__APCPlayerEngine_createAU___block_invoke;
  v12[3] = &unk_24F24B4A8;
  v12[4] = &v14;
  v12[5] = &v26;
  v12[6] = &v20;
  objc_msgSend(MEMORY[0x24BDB1888], "instantiateWithComponentDescription:options:completionHandler:", &v13, 0, v12);
  v4 = v21[5];
  v5 = dispatch_time(0, 5000000000);
  v6 = dispatch_semaphore_wait(v4, v5);
  if (v27[5] || v6)
  {
    APCLogObject();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v9 = v27[5];
      if (v9)
      {
        objc_msgSend((id)v27[5], "localizedDescription");
        v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v10 = CFSTR("AVAudioUnit instantiateWithComponentDescription timed out");
      }
      *(_DWORD *)buf = 138412290;
      v33 = v10;
      _os_log_impl(&dword_229580000, v8, OS_LOG_TYPE_ERROR, "AU instatiation failed with %@", buf, 0xCu);
      if (v9)

    }
    v7 = 0;
  }
  else
  {
    v7 = (id)v15[5];
  }
  _Block_object_dispose(&v14, 8);

  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(&v26, 8);

  return v7;
}

void __28__APCPlayerEngine_createAU___block_invoke(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(a1[4] + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v12 = v5;

  v9 = *(_QWORD *)(a1[5] + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;
  v11 = v6;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(_QWORD *)(a1[6] + 8) + 40));
}

+ (id)playerWithAssetURL:(id)a3 codecConfig:(id)a4 payload:(id)a5 error:(id *)a6
{
  id v9;
  id v10;
  id v11;
  APCPlayerEngine *v12;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = -[APCPlayerEngine initWithAssetURL:codecConfig:payload:error:]([APCPlayerEngine alloc], "initWithAssetURL:codecConfig:payload:error:", v9, v10, v11, a6);

  return v12;
}

- (APCPlayerEngine)initWithAssetURL:(id)a3 codecConfig:(id)a4 payload:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  APCPlayerEngine *v13;
  APCPlayerEngine *v14;
  uint64_t v15;
  AVAudioUnit *encoderAUNode;
  AVAudioUnit *v17;
  void *v18;
  uint64_t v19;
  AUPasscodeEncoder *encoderAU;
  void *v21;
  id v22;
  id v23;
  NSObject *v24;
  int v25;
  NSObject *v26;
  id v27;
  NSObject *v28;
  APCPlayerEngine *v29;
  NSObject *v30;
  objc_class *v31;
  void *v32;
  id v33;
  void *v34;
  uint64_t v35;
  AVAudioPCMBuffer *assetBuffer;
  void *v37;
  double v38;
  AVAudioPlayerNode *v39;
  AVAudioPlayerNode *player;
  AVAudioPCMBuffer *v41;
  NSObject *v42;
  OS_dispatch_source *callbackDispatchSrc;
  id v45;
  _QWORD v46[4];
  id v47;
  id location;
  id v49;
  char v50[20];
  objc_super v51;
  uint8_t buf[4];
  id v53;
  uint64_t v54;

  v54 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v51.receiver = self;
  v51.super_class = (Class)APCPlayerEngine;
  v13 = -[APCPlayerEngine init](&v51, sel_init);
  v14 = v13;
  if (!v13)
    goto LABEL_37;
  if (v10 && v11 && v12)
  {
    v13->_isRunning = 0;
    v13->_prePlayVolume = 0.5;
    +[AUPasscodeEncoder registerAU](AUPasscodeEncoder, "registerAU");
    +[AUPasscodeEncoder getAUDesc](AUPasscodeEncoder, "getAUDesc");
    -[APCPlayerEngine createAU:](v14, "createAU:", v50);
    v15 = objc_claimAutoreleasedReturnValue();
    encoderAUNode = v14->_encoderAUNode;
    v14->_encoderAUNode = (AVAudioUnit *)v15;

    v17 = v14->_encoderAUNode;
    if (v17)
    {
      -[AVAudioUnit AUAudioUnit](v17, "AUAudioUnit");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        APCLogObject();
        v30 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
        {
          v31 = (objc_class *)objc_opt_class();
          NSStringFromClass(v31);
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v53 = v32;
          _os_log_impl(&dword_229580000, v30, OS_LOG_TYPE_ERROR, "Encoder AU is not the expected class, it is a %@", buf, 0xCu);

        }
        if (a6)
        {
          objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("AudioPasscodeDomain"), 0, 0);
          *a6 = (id)objc_claimAutoreleasedReturnValue();
        }

        goto LABEL_36;
      }
      -[AVAudioUnit AUAudioUnit](v14->_encoderAUNode, "AUAudioUnit");
      v19 = objc_claimAutoreleasedReturnValue();
      encoderAU = v14->_encoderAU;
      v14->_encoderAU = (AUPasscodeEncoder *)v19;

      v49 = 0;
      v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDB1810]), "initForReading:error:", v10, &v49);
      v22 = v49;
      if (v22)
      {
        v23 = v22;
        APCLogObject();
        v24 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v53 = v23;
          _os_log_impl(&dword_229580000, v24, OS_LOG_TYPE_ERROR, "Failed to open the player asset: %@", buf, 0xCu);
        }

        if (a6)
        {
          v23 = objc_retainAutorelease(v23);
          *a6 = v23;
        }
        v25 = 1;
      }
      else
      {
        v33 = objc_alloc(MEMORY[0x24BDB1838]);
        objc_msgSend(v21, "processingFormat");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v35 = objc_msgSend(v33, "initWithPCMFormat:frameCapacity:", v34, objc_msgSend(v21, "length"));
        assetBuffer = v14->_assetBuffer;
        v14->_assetBuffer = (AVAudioPCMBuffer *)v35;

        objc_msgSend(v11, "setPayloadLengthBytes:", objc_msgSend(v12, "length"));
        objc_msgSend(v21, "processingFormat");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "sampleRate");
        objc_msgSend(v11, "setSampleRate:", (uint64_t)v38);

        -[AUPasscodeEncoder setPayload:](v14->_encoderAU, "setPayload:", v12);
        -[AUPasscodeEncoder setCodecConfig:](v14->_encoderAU, "setCodecConfig:", v11);
        -[AUPasscodeEncoder setAssetLength:](v14->_encoderAU, "setAssetLength:", objc_msgSend(v21, "length"));
        objc_initWeak(&location, v14);
        v46[0] = MEMORY[0x24BDAC760];
        v46[1] = 3221225472;
        v46[2] = __62__APCPlayerEngine_initWithAssetURL_codecConfig_payload_error___block_invoke;
        v46[3] = &unk_24F24B4D0;
        objc_copyWeak(&v47, &location);
        -[AUPasscodeEncoder setAssetEndedAndSilencedHandler:](v14->_encoderAU, "setAssetEndedAndSilencedHandler:", v46);
        v39 = (AVAudioPlayerNode *)objc_alloc_init(MEMORY[0x24BDB1850]);
        player = v14->_player;
        v14->_player = v39;

        v41 = v14->_assetBuffer;
        v45 = 0;
        objc_msgSend(v21, "readIntoBuffer:error:", v41, &v45);
        v23 = v45;
        if (v23)
        {
          APCLogObject();
          v42 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v53 = v23;
            _os_log_impl(&dword_229580000, v42, OS_LOG_TYPE_ERROR, "Failed to read the asset file into the PCM buffer (Error=%@)", buf, 0xCu);
          }

          if (a6)
            *a6 = objc_retainAutorelease(v23);
          v25 = 1;
        }
        else
        {
          -[APCPlayerEngine setupAudioSession](v14, "setupAudioSession");
          -[APCPlayerEngine createEngineAndAttachNodes](v14, "createEngineAndAttachNodes");
          -[APCPlayerEngine makeEngineConnections](v14, "makeEngineConnections");
          callbackDispatchSrc = v14->_callbackDispatchSrc;
          v14->_callbackDispatchSrc = 0;

          v25 = 0;
        }
        objc_destroyWeak(&v47);
        objc_destroyWeak(&location);
      }

      if (v25)
      {
LABEL_36:
        v29 = 0;
        goto LABEL_38;
      }
LABEL_37:
      v29 = v14;
      goto LABEL_38;
    }
    APCLogObject();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_229580000, v28, OS_LOG_TYPE_ERROR, "Failed to create the encoder AU", buf, 2u);
    }

    if (!a6)
      goto LABEL_36;
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("AudioPasscodeDomain"), 0, 0);
    v27 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    APCLogObject();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_229580000, v26, OS_LOG_TYPE_ERROR, "Bad arguments to APCPlayerEngine", buf, 2u);
    }

    if (!a6)
      goto LABEL_36;
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("AudioPasscodeDomain"), 1, 0);
    v27 = (id)objc_claimAutoreleasedReturnValue();
  }
  v29 = 0;
  *a6 = v27;
LABEL_38:

  return v29;
}

void __62__APCPlayerEngine_initWithAssetURL_codecConfig_payload_error___block_invoke(uint64_t a1)
{
  id *v1;
  void *v2;
  void (**v3)(void);
  id WeakRetained;
  id v5;
  id v6;

  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_stopAudioEngineAndSession");

  v5 = objc_loadWeakRetained(v1);
  objc_msgSend(v5, "stopEngineCompletion");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    v6 = objc_loadWeakRetained(v1);
    objc_msgSend(v6, "stopEngineCompletion");
    v3 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v3[2]();

  }
}

- (void)setupAudioSession
{
  AVAudioSession *v3;
  AVAudioSession *session;
  AVAudioSession *v5;
  uint64_t v6;
  id v7;
  NSObject *v8;
  AVAudioSession *v9;
  uint64_t v10;
  id v11;
  NSObject *v12;
  AVAudioSession *v13;
  void *v14;
  id v15;
  NSObject *v16;
  void *v17;
  uint64_t v18;
  NSInteger v19;
  void *v20;
  id v21;
  AVAudioSession *v22;
  void *v23;
  NSObject *v24;
  void *v25;
  uint64_t v26;
  AVAudioSession *v27;
  double v28;
  double v29;
  BOOL v30;
  id v31;
  NSObject *v32;
  void *v33;
  id v34;
  id v35;
  id v36;
  id v37;
  id v38;
  uint8_t buf[4];
  unint64_t v40;
  __int16 v41;
  id v42;
  uint64_t v43;

  v43 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDB1858], "auxiliarySession");
  v3 = (AVAudioSession *)objc_claimAutoreleasedReturnValue();
  session = self->_session;
  self->_session = v3;

  v5 = self->_session;
  v6 = *MEMORY[0x24BDB15A8];
  v38 = 0;
  -[AVAudioSession setCategory:error:](v5, "setCategory:error:", v6, &v38);
  v7 = v38;
  if (v7)
  {
    APCLogObject();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v40 = (unint64_t)v7;
      _os_log_impl(&dword_229580000, v8, OS_LOG_TYPE_ERROR, "Error setting session category to record: %@", buf, 0xCu);
    }

  }
  v9 = self->_session;
  v10 = *MEMORY[0x24BDB1620];
  v37 = 0;
  -[AVAudioSession setMode:error:](v9, "setMode:error:", v10, &v37);
  v11 = v37;
  if (v11)
  {
    APCLogObject();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v40 = (unint64_t)v11;
      _os_log_impl(&dword_229580000, v12, OS_LOG_TYPE_ERROR, "Error setting session mode to measurement: %@", buf, 0xCu);
    }

  }
  v13 = self->_session;
  -[AUPasscodeEncoder codecConfig](self->_encoderAU, "codecConfig");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = 0;
  -[AVAudioSession setPreferredSampleRate:error:](v13, "setPreferredSampleRate:error:", &v36, (double)objc_msgSend(v14, "sampleRate"));
  v15 = v36;

  if (v15)
  {
    APCLogObject();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      -[AUPasscodeEncoder codecConfig](self->_encoderAU, "codecConfig");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "sampleRate");
      *(_DWORD *)buf = 134218242;
      v40 = llround((double)v18);
      v41 = 2112;
      v42 = v15;
      _os_log_impl(&dword_229580000, v16, OS_LOG_TYPE_ERROR, "Error setting preferred sample rate to %ld: %@", buf, 0x16u);

    }
  }
  v19 = -[AVAudioSession outputNumberOfChannels](self->_session, "outputNumberOfChannels");
  -[AUPasscodeEncoder codecConfig](self->_encoderAU, "codecConfig");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v19) = v19 == objc_msgSend(v20, "numChannels");

  if ((v19 & 1) != 0)
  {
    v21 = v15;
  }
  else
  {
    v22 = self->_session;
    -[AUPasscodeEncoder codecConfig](self->_encoderAU, "codecConfig");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = v15;
    -[AVAudioSession setPreferredOutputNumberOfChannels:error:](v22, "setPreferredOutputNumberOfChannels:error:", objc_msgSend(v23, "numChannels"), &v35);
    v21 = v35;

    if (v21)
    {
      APCLogObject();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        -[AUPasscodeEncoder codecConfig](self->_encoderAU, "codecConfig");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = objc_msgSend(v25, "numChannels");
        *(_DWORD *)buf = 134218242;
        v40 = v26;
        v41 = 2112;
        v42 = v21;
        _os_log_impl(&dword_229580000, v24, OS_LOG_TYPE_ERROR, "Could not set preferred number of output channels to %ld (AU will handle the mapping): %@", buf, 0x16u);

      }
    }
  }
  -[AVAudioSession sampleRate](self->_session, "sampleRate");
  v27 = self->_session;
  v34 = v21;
  v29 = 256.0 / v28;
  v30 = -[AVAudioSession setPreferredIOBufferDuration:error:](v27, "setPreferredIOBufferDuration:error:", &v34, 256.0 / v28);
  v31 = v34;

  if (!v30)
  {
    APCLogObject();
    v32 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v31, "localizedDescription");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218242;
      v40 = *(_QWORD *)&v29;
      v41 = 2112;
      v42 = v33;
      _os_log_impl(&dword_229580000, v32, OS_LOG_TYPE_ERROR, "Error setting preferred io buffer duration to %0.3f seconds: %@", buf, 0x16u);

    }
  }

}

- (void)createEngineAndAttachNodes
{
  AVAudioEngine *v3;
  AVAudioEngine *engine;
  void *v5;
  OpaqueAudioComponentInstance *v6;
  OSStatus v7;
  NSObject *v8;
  int inData;
  uint8_t buf[4];
  OSStatus v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v3 = (AVAudioEngine *)objc_alloc_init(MEMORY[0x24BDB1800]);
  engine = self->_engine;
  self->_engine = v3;

  -[AVAudioEngine attachNode:](self->_engine, "attachNode:", self->_encoderAUNode);
  -[AVAudioEngine attachNode:](self->_engine, "attachNode:", self->_player);
  -[AVAudioEngine outputNode](self->_engine, "outputNode");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (OpaqueAudioComponentInstance *)objc_msgSend(v5, "audioUnit");

  inData = -[AVAudioSession opaqueSessionID](self->_session, "opaqueSessionID");
  v7 = AudioUnitSetProperty(v6, 0x7E7u, 0, 0, &inData, 4u);
  if (v7)
  {
    APCLogObject();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      v11 = v7;
      _os_log_impl(&dword_229580000, v8, OS_LOG_TYPE_ERROR, "Setting the audio session ID for the player's output node failed: %d", buf, 8u);
    }

  }
}

- (void)makeEngineConnections
{
  AVAudioEngine *engine;
  AVAudioUnit *encoderAUNode;
  void *v5;
  id v6;

  -[AVAudioPCMBuffer format](self->_assetBuffer, "format");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[AVAudioEngine connect:to:format:](self->_engine, "connect:to:format:", self->_player, self->_encoderAUNode);
  engine = self->_engine;
  encoderAUNode = self->_encoderAUNode;
  -[AVAudioEngine outputNode](engine, "outputNode");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVAudioEngine connect:to:format:](engine, "connect:to:format:", encoderAUNode, v5, v6);

}

- (float)evaluateAsset
{
  void *v3;
  AVAudioPCMBuffer *assetBuffer;
  float v5;
  float v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  APCPlayerEmbedInfo *v17;
  APCPlayerEmbedInfo *embeddingInfo;
  id v20;

  -[AUPasscodeEncoder codecConfig](self->_encoderAU, "codecConfig");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  assetBuffer = self->_assetBuffer;
  v20 = 0;
  +[APCCodecFactory evaluateCarrierWithConfig:carrier:embeddingResult:](APCCodecFactory, "evaluateCarrierWithConfig:carrier:embeddingResult:", v3, assetBuffer, &v20);
  v6 = v5;
  v7 = v20;

  if (v7)
  {
    -[AVAudioUnit AUAudioUnit](self->_encoderAUNode, "AUAudioUnit");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setPasscodeEmbedInfo:", v7);
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 108);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKey:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "unsignedIntegerValue");

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 1000);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKey:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "unsignedIntegerValue");

    -[AUPasscodeEncoder codecConfig](self->_encoderAU, "codecConfig");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "sampleRate");

    v17 = -[APCPlayerEmbedInfo initWithPasscodeDurationNSec:]([APCPlayerEmbedInfo alloc], "initWithPasscodeDurationNSec:", (unint64_t)((double)(unint64_t)(v14 + v11) / (double)v16 * 1000000000.0));
    embeddingInfo = self->_embeddingInfo;
    self->_embeddingInfo = v17;

  }
  return v6;
}

- (BOOL)startEngine
{
  return -[APCPlayerEngine startEngineAtTime:withBeginning:](self, "startEngineAtTime:withBeginning:", 0, 0);
}

- (BOOL)startEngineAtTime:(unint64_t)a3
{
  return -[APCPlayerEngine startEngineAtTime:withBeginning:](self, "startEngineAtTime:withBeginning:", a3, 0);
}

- (BOOL)startEngineAtTime:(unint64_t)a3 withBeginning:(id)a4
{
  return -[APCPlayerEngine startEngineAtTime:withBeginning:callbackTime:](self, "startEngineAtTime:withBeginning:callbackTime:", a3, 0, 300);
}

- (BOOL)startEngineAtTime:(unint64_t)a3 withBeginning:(id)a4 callbackTime:(unint64_t)a5
{
  id v7;
  AVAudioEngine *engine;
  char v9;
  NSObject *v10;
  const char *v11;
  AVAudioSession *session;
  NSObject *v13;
  char v14;
  NSObject *v15;
  AVAudioEngine *v16;
  char v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  NSObject *v21;
  NSObject *v22;
  const char *v23;
  NSObject *v24;
  uint32_t v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  NSObject *v30;
  OS_dispatch_source *v31;
  OS_dispatch_source *callbackDispatchSrc;
  void *v33;
  id beginningCallback;
  NSObject *v35;
  dispatch_time_t v36;
  int64_t v37;
  void *v38;
  NSObject *v39;
  _QWORD handler[5];
  id v42;
  id v43;
  uint8_t buf[4];
  unint64_t v45;
  __int16 v46;
  uint64_t v47;
  __int16 v48;
  uint64_t v49;
  uint64_t v50;

  v50 = *MEMORY[0x24BDAC8D0];
  v7 = a4;
  engine = self->_engine;
  if (!engine)
  {
    APCLogObject();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v11 = "Audio engine is nil while trying to start it!";
LABEL_9:
      _os_log_impl(&dword_229580000, v10, OS_LOG_TYPE_ERROR, v11, buf, 2u);
    }
LABEL_10:
    v9 = 0;
LABEL_45:

    goto LABEL_46;
  }
  if (!self->_player)
  {
    APCLogObject();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v11 = "Encoded asset player is nil while trying to start the audio engine!";
      goto LABEL_9;
    }
    goto LABEL_10;
  }
  if (!-[AVAudioEngine isRunning](engine, "isRunning"))
  {
    session = self->_session;
    v43 = 0;
    v9 = -[AVAudioSession setActive:error:](session, "setActive:error:", 1, &v43);
    v13 = v43;
    if (v13)
      v14 = 0;
    else
      v14 = v9;
    if ((v14 & 1) == 0)
    {
      v10 = v13;
      APCLogObject();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v45 = (unint64_t)v10;
        _os_log_impl(&dword_229580000, v15, OS_LOG_TYPE_ERROR, "Error activating session: %@", buf, 0xCu);
      }
      goto LABEL_44;
    }
    objc_msgSend(MEMORY[0x24BE64988], "sharedAVSystemController");
    v15 = objc_claimAutoreleasedReturnValue();
    -[NSObject getActiveCategoryVolume:andName:](v15, "getActiveCategoryVolume:andName:", &self->_prePlayVolume, 0);
    +[APCDefaults floatForDefault:](APCDefaults, "floatForDefault:", 0);
    -[NSObject setActiveCategoryVolumeTo:](v15, "setActiveCategoryVolumeTo:");
    v16 = self->_engine;
    v42 = 0;
    v9 = -[AVAudioEngine startAndReturnError:](v16, "startAndReturnError:", &v42);
    v10 = v42;
    if (v10)
      v17 = 0;
    else
      v17 = v9;
    if ((v17 & 1) == 0)
    {
      APCLogObject();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        -[NSObject localizedDescription](v10, "localizedDescription");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v45 = (unint64_t)v26;
        _os_log_impl(&dword_229580000, v22, OS_LOG_TYPE_ERROR, "Couldn't start audio engine, %@", buf, 0xCu);

      }
      goto LABEL_43;
    }
    if (v7)
    {
      v18 = __udivti3();
      v19 = mach_absolute_time();
      v20 = v19;
      if (a3 && v19 + v18 > a3)
      {
        APCLogObject();
        v21 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_229580000, v21, OS_LOG_TYPE_ERROR, "APCPlayer start time is too early to set up a beginning callback", buf, 2u);
        }

        APCLogObject();
        v22 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
          goto LABEL_42;
        *(_DWORD *)buf = 134218496;
        v45 = a3;
        v46 = 2048;
        v47 = v20;
        v48 = 2048;
        v49 = v20 + v18;
        v23 = "- Input hostTime: %llu, Current Time: %llu, Min expected Time: %llu";
        v24 = v22;
        v25 = 32;
        goto LABEL_41;
      }
      v27 = __udivti3();
      if (a3 - v18 >= v20)
        v28 = v27;
      else
        v28 = -v27;
      -[APCPlayerEngine dispatchQueue](self, "dispatchQueue");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      if (v29)
        -[APCPlayerEngine dispatchQueue](self, "dispatchQueue");
      else
        dispatch_get_global_queue(0, 0);
      v30 = objc_claimAutoreleasedReturnValue();
      v31 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x24BDACA18], 0, 0, v30);
      callbackDispatchSrc = self->_callbackDispatchSrc;
      self->_callbackDispatchSrc = v31;

      if (!self->_callbackDispatchSrc)
      {
        APCLogObject();
        v22 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        {
LABEL_42:
          v9 = 0;
LABEL_43:

          goto LABEL_44;
        }
        *(_WORD *)buf = 0;
        v23 = "APCPlayer can't schedule the beginning callback timer";
        v24 = v22;
        v25 = 2;
LABEL_41:
        _os_log_impl(&dword_229580000, v24, OS_LOG_TYPE_ERROR, v23, buf, v25);
        goto LABEL_42;
      }
      v33 = (void *)MEMORY[0x22E2CB86C](v7);
      beginningCallback = self->_beginningCallback;
      self->_beginningCallback = v33;

      v35 = self->_callbackDispatchSrc;
      v36 = dispatch_time(0, v28 & ~(v28 >> 63));
      v37 = -[AUPasscodeEncoder assetLength](self->_encoderAU, "assetLength");
      -[AUPasscodeEncoder codecConfig](self->_encoderAU, "codecConfig");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      dispatch_source_set_timer(v35, v36, 1000000000 * v37 / (unint64_t)objc_msgSend(v38, "sampleRate"), 0);

      v39 = self->_callbackDispatchSrc;
      handler[0] = MEMORY[0x24BDAC760];
      handler[1] = 3221225472;
      handler[2] = __64__APCPlayerEngine_startEngineAtTime_withBeginning_callbackTime___block_invoke;
      handler[3] = &unk_24F24B4F8;
      handler[4] = self;
      dispatch_source_set_event_handler(v39, handler);
      dispatch_resume((dispatch_object_t)self->_callbackDispatchSrc);
    }
    -[APCPlayerEngine startAPCPlayLoopAtTime:](self, "startAPCPlayLoopAtTime:", a3);
    -[AVAudioPlayerNode play](self->_player, "play");
    v9 = 1;
LABEL_44:

    goto LABEL_45;
  }
  v9 = 1;
LABEL_46:

  return v9;
}

uint64_t __64__APCPlayerEngine_startEngineAtTime_withBeginning_callbackTime___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 96) + 16))();
}

- (void)_playbackBufferLoopCompletionHdlr
{
  void *v3;
  NSObject *v4;
  _QWORD block[5];

  if (self->_requestingStop)
  {
    -[APCPlayerEngine _stopAudioEngineAndSession](self, "_stopAudioEngineAndSession");
    self->_requestingStop = 0;
    if (self->_stopEngineCompletion)
    {
      -[APCPlayerEngine dispatchQueue](self, "dispatchQueue");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      if (v3)
        -[APCPlayerEngine dispatchQueue](self, "dispatchQueue");
      else
        dispatch_get_global_queue(0, 0);
      v4 = objc_claimAutoreleasedReturnValue();

      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __52__APCPlayerEngine__playbackBufferLoopCompletionHdlr__block_invoke;
      block[3] = &unk_24F24B4F8;
      block[4] = self;
      dispatch_async(v4, block);

    }
  }
  else
  {
    -[APCPlayerEngine startAPCPlayLoop](self, "startAPCPlayLoop");
  }
}

uint64_t __52__APCPlayerEngine__playbackBufferLoopCompletionHdlr__block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 104) + 16))();
}

- (void)startAPCPlayLoop
{
  -[APCPlayerEngine startAPCPlayLoopAtTime:](self, "startAPCPlayLoopAtTime:", 0);
}

- (void)startAPCPlayLoopAtTime:(unint64_t)a3
{
  void *v3;
  AVAudioPlayerNode *player;
  AVAudioPCMBuffer *assetBuffer;
  _QWORD v7[5];

  v3 = (void *)a3;
  if (a3)
    v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDB1880]), "initWithHostTime:", a3);
  player = self->_player;
  assetBuffer = self->_assetBuffer;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __42__APCPlayerEngine_startAPCPlayLoopAtTime___block_invoke;
  v7[3] = &unk_24F24B4F8;
  v7[4] = self;
  -[AVAudioPlayerNode scheduleBuffer:atTime:options:completionHandler:](player, "scheduleBuffer:atTime:options:completionHandler:", assetBuffer, v3, 4, v7);

}

void __42__APCPlayerEngine_startAPCPlayLoopAtTime___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  id v4;
  _QWORD block[5];

  objc_msgSend(*(id *)(a1 + 32), "dispatchQueue");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "dispatchQueue");
    v3 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = MEMORY[0x24BDAC9B8];
    v4 = MEMORY[0x24BDAC9B8];
  }

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __42__APCPlayerEngine_startAPCPlayLoopAtTime___block_invoke_2;
  block[3] = &unk_24F24B4F8;
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_async(v3, block);

}

uint64_t __42__APCPlayerEngine_startAPCPlayLoopAtTime___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_playbackBufferLoopCompletionHdlr");
}

- (void)_stopAudioEngineAndSession
{
  void *v3;
  double v4;
  id v5;

  -[AVAudioPlayerNode pause](self->_player, "pause");
  -[AVAudioEngine pause](self->_engine, "pause");
  -[AUPasscodeEncoder reset](self->_encoderAU, "reset");
  -[AVAudioPlayerNode reset](self->_player, "reset");
  objc_msgSend(MEMORY[0x24BE64988], "sharedAVSystemController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  *(float *)&v4 = self->_prePlayVolume;
  v5 = v3;
  objc_msgSend(v3, "setActiveCategoryVolumeTo:", v4);
  -[AVAudioSession setActive:error:](self->_session, "setActive:error:", 0, 0);

}

- (void)endPasscodeEmbedding
{
  if (-[AVAudioEngine isRunning](self->_engine, "isRunning"))
    -[AUPasscodeEncoder setEmbedPasscode:](self->_encoderAU, "setEmbedPasscode:", 0);
}

- (void)stopEngine:(BOOL)a3 withCompletion:(id)a4
{
  _BOOL4 v4;
  void *v6;
  id stopEngineCompletion;
  NSObject *callbackDispatchSrc;
  id v9;

  v4 = a3;
  v9 = a4;
  if (v4)
    self->_requestingStop = 1;
  else
    -[AUPasscodeEncoder setSilenceOutputOnNextAssetEnding:](self->_encoderAU, "setSilenceOutputOnNextAssetEnding:", 1);
  v6 = (void *)MEMORY[0x22E2CB86C](v9);
  stopEngineCompletion = self->_stopEngineCompletion;
  self->_stopEngineCompletion = v6;

  callbackDispatchSrc = self->_callbackDispatchSrc;
  if (callbackDispatchSrc)
    dispatch_suspend(callbackDispatchSrc);

}

- (void)stopEngineWithFadeOut:(float)a3 completion:(id)a4
{
  void *v6;
  id stopEngineCompletion;
  double v8;
  void *v9;
  NSObject *v10;
  NSObject *callbackDispatchSrc;
  _QWORD block[5];

  v6 = (void *)MEMORY[0x22E2CB86C](a4, a2);
  stopEngineCompletion = self->_stopEngineCompletion;
  self->_stopEngineCompletion = v6;

  if (-[AVAudioEngine isRunning](self->_engine, "isRunning"))
  {
    *(float *)&v8 = a3;
    -[AUPasscodeEncoder setFadeOutTimeSeconds:](self->_encoderAU, "setFadeOutTimeSeconds:", v8);
    -[AUPasscodeEncoder setTriggerFadeOut:](self->_encoderAU, "setTriggerFadeOut:", 1);
  }
  else if (self->_stopEngineCompletion)
  {
    -[APCPlayerEngine dispatchQueue](self, "dispatchQueue");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
      -[APCPlayerEngine dispatchQueue](self, "dispatchQueue");
    else
      dispatch_get_global_queue(0, 0);
    v10 = objc_claimAutoreleasedReturnValue();

    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __52__APCPlayerEngine_stopEngineWithFadeOut_completion___block_invoke;
    block[3] = &unk_24F24B4F8;
    block[4] = self;
    dispatch_async(v10, block);

  }
  callbackDispatchSrc = self->_callbackDispatchSrc;
  if (callbackDispatchSrc)
    dispatch_suspend(callbackDispatchSrc);
}

uint64_t __52__APCPlayerEngine_stopEngineWithFadeOut_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 104) + 16))();
}

- (void)stopEngineAfterMinimumLoops:(unint64_t)a3 withCompletion:(id)a4
{
  void *v6;
  id stopEngineCompletion;
  void *v8;
  NSObject *v9;
  NSObject *callbackDispatchSrc;
  _QWORD block[5];

  v6 = (void *)MEMORY[0x22E2CB86C](a4, a2);
  stopEngineCompletion = self->_stopEngineCompletion;
  self->_stopEngineCompletion = v6;

  if (-[AVAudioEngine isRunning](self->_engine, "isRunning"))
  {
    -[AUPasscodeEncoder setNumLoopsToStopAfter:](self->_encoderAU, "setNumLoopsToStopAfter:", a3);
  }
  else if (self->_stopEngineCompletion)
  {
    -[APCPlayerEngine dispatchQueue](self, "dispatchQueue");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
      -[APCPlayerEngine dispatchQueue](self, "dispatchQueue");
    else
      dispatch_get_global_queue(0, 0);
    v9 = objc_claimAutoreleasedReturnValue();

    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __62__APCPlayerEngine_stopEngineAfterMinimumLoops_withCompletion___block_invoke;
    block[3] = &unk_24F24B4F8;
    block[4] = self;
    dispatch_async(v9, block);

  }
  callbackDispatchSrc = self->_callbackDispatchSrc;
  if (callbackDispatchSrc)
    dispatch_suspend(callbackDispatchSrc);
}

uint64_t __62__APCPlayerEngine_stopEngineAfterMinimumLoops_withCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 104) + 16))();
}

- (void)setDispatchQueue:(id)a3
{
  AUPasscodeEncoder *encoderAU;
  id v6;

  v6 = a3;
  objc_storeStrong((id *)&self->_dispatchQueue, a3);
  encoderAU = self->_encoderAU;
  if (encoderAU)
    -[AUPasscodeEncoder setDispatchQueue:](encoderAU, "setDispatchQueue:", v6);

}

- (APCPlayerEmbedInfo)embeddingInfo
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  APCPlayerEmbedInfo *embeddingInfo;

  if (self->_embeddingInfo)
  {
    -[AVAudioUnit AUAudioUnit](self->_encoderAUNode, "AUAudioUnit");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "passcodeEmbedInfo");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 1001);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKey:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "unsignedIntegerValue");

    -[APCPlayerEmbedInfo setMeasPasscodeDuration:](self->_embeddingInfo, "setMeasPasscodeDuration:", v7);
    embeddingInfo = self->_embeddingInfo;
  }
  else
  {
    embeddingInfo = 0;
  }
  return embeddingInfo;
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setEmbeddingInfo:(id)a3
{
  objc_storeStrong((id *)&self->_embeddingInfo, a3);
}

- (id)beginningCallback
{
  return self->_beginningCallback;
}

- (void)setBeginningCallback:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (id)stopEngineCompletion
{
  return self->_stopEngineCompletion;
}

- (void)setStopEngineCompletion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_stopEngineCompletion, 0);
  objc_storeStrong(&self->_beginningCallback, 0);
  objc_storeStrong((id *)&self->_embeddingInfo, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_callbackDispatchSrc, 0);
  objc_storeStrong((id *)&self->_assetBuffer, 0);
  objc_storeStrong((id *)&self->_player, 0);
  objc_storeStrong((id *)&self->_encoderAU, 0);
  objc_storeStrong((id *)&self->_encoderAUNode, 0);
  objc_storeStrong((id *)&self->_engine, 0);
  objc_storeStrong((id *)&self->_session, 0);
}

@end
