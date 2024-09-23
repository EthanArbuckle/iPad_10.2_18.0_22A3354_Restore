@implementation AXLTLiveTranscription

+ (AXLTLiveTranscription)sharedInstance
{
  if (sharedInstance_onceToken_1 != -1)
    dispatch_once(&sharedInstance_onceToken_1, &__block_literal_global_3);
  return (AXLTLiveTranscription *)(id)sharedInstance__shared;
}

void __39__AXLTLiveTranscription_sharedInstance__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)sharedInstance__shared;
  sharedInstance__shared = v0;

}

- (AXLTLiveTranscription)init
{
  AXLTLiveTranscription *v2;
  AXLTTestTranscriber *v3;
  AXLTTestTranscriber *testTranscriber;
  AXLTSpeechTranscriber *v5;
  AXLTSpeechTranscriber *speechTranscriber;
  void *v7;
  uint64_t v8;
  NSMutableDictionary *dataReceivers;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)AXLTLiveTranscription;
  v2 = -[AXLTLiveTranscription init](&v11, sel_init);
  if (v2)
  {
    v3 = -[AXLTTestTranscriber initWithDelegate:]([AXLTTestTranscriber alloc], "initWithDelegate:", v2);
    testTranscriber = v2->_testTranscriber;
    v2->_testTranscriber = v3;

    v5 = -[AXLTSpeechTranscriber initWithDelegate:]([AXLTSpeechTranscriber alloc], "initWithDelegate:", v2);
    speechTranscriber = v2->_speechTranscriber;
    v2->_speechTranscriber = v5;

    +[AXLTAudioOutManager sharedInstance](AXLTAudioOutManager, "sharedInstance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setDelegate:", v2);

    v8 = objc_opt_new();
    dataReceivers = v2->_dataReceivers;
    v2->_dataReceivers = (NSMutableDictionary *)v8;

  }
  return v2;
}

- (BOOL)startTranscribing:(int64_t)a3 callbackBlock:(id)a4 error:(id *)a5
{
  return -[AXLTLiveTranscription startTranscribing:targetPID:callbackBlock:error:](self, "startTranscribing:targetPID:callbackBlock:error:", a3, 0xFFFFFFFFLL, a4, a5);
}

- (BOOL)startTranscribing:(int64_t)a3 excludingPIDs:(id)a4 callbackBlock:(id)a5 error:(id *)a6
{
  return -[AXLTLiveTranscription startTranscribing:targetPID:excludingPIDs:callbackBlock:audioInfoBlock:error:](self, "startTranscribing:targetPID:excludingPIDs:callbackBlock:audioInfoBlock:error:", a3, 0xFFFFFFFFLL, a4, a5, 0, a6);
}

- (BOOL)startTranscribing:(int64_t)a3 targetPID:(int)a4 callbackBlock:(id)a5 error:(id *)a6
{
  return -[AXLTLiveTranscription startTranscribing:targetPID:excludingPIDs:callbackBlock:audioInfoBlock:error:](self, "startTranscribing:targetPID:excludingPIDs:callbackBlock:audioInfoBlock:error:", a3, *(_QWORD *)&a4, 0, a5, 0, a6);
}

- (BOOL)startTranscribing:(int64_t)a3 targetPID:(int)a4 callbackBlock:(id)a5 audioInfoBlock:(id)a6 error:(id *)a7
{
  return -[AXLTLiveTranscription startTranscribing:targetPID:excludingPIDs:callbackBlock:audioInfoBlock:error:](self, "startTranscribing:targetPID:excludingPIDs:callbackBlock:audioInfoBlock:error:", a3, *(_QWORD *)&a4, 0, a5, a6, a7);
}

- (BOOL)startTranscribing:(int64_t)a3 targetPID:(int)a4 excludingPIDs:(id)a5 callbackBlock:(id)a6 audioInfoBlock:(id)a7 error:(id *)a8
{
  uint64_t v11;
  id v14;
  id v15;
  id v16;
  NSObject *v17;
  _BOOL8 v18;
  void *v19;
  int64_t v20;
  void *v21;
  NSObject *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  int v31;
  id v32;
  void *v33;
  BOOL v34;
  NSObject *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  char v44;
  void *v45;
  NSObject *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  __CFString *v54;
  __CFString *v55;
  __CFString *v56;
  void *v57;
  void *v58;
  AXLTTranscribedDataReceiver *v59;
  void *v60;
  void *v61;
  NSObject *v62;
  void *v64;
  char v65;
  void *v66;
  id v67;
  void *v68;
  id v69;
  uint8_t buf[4];
  _BYTE v71[14];
  __int16 v72;
  void *v73;
  uint64_t v74;
  _QWORD v75[2];

  v11 = *(_QWORD *)&a4;
  v75[1] = *MEMORY[0x24BDAC8D0];
  v14 = a5;
  v15 = a6;
  v16 = a7;
  AXLogLiveTranscription();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218240;
    *(_QWORD *)v71 = a3;
    *(_WORD *)&v71[8] = 1024;
    *(_DWORD *)&v71[10] = v11;
    _os_log_impl(&dword_22D27A000, v17, OS_LOG_TYPE_DEFAULT, "API startTranscribing request: %ld, targetPID: %d", buf, 0x12u);
  }

  v18 = -[AXLTLiveTranscription noPunctuation](self, "noPunctuation");
  +[AXLTTranscriber sharedInstance](AXLTTranscriber, "sharedInstance");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setNoPunctuation:", v18);

  v20 = -[AXLTLiveTranscription taskHint](self, "taskHint");
  +[AXLTTranscriber sharedInstance](AXLTTranscriber, "sharedInstance");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setTaskHint:", v20);

  if (v15)
  {
    switch(a3)
    {
      case 2:
        AXLogLiveTranscription();
        v35 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
          -[AXLTLiveTranscription startTranscribing:targetPID:excludingPIDs:callbackBlock:audioInfoBlock:error:].cold.3(v35, v36, v37, v38, v39, v40, v41, v42);

        -[AXLTLiveTranscription testTranscriber](self, "testTranscriber");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        v66 = 0;
        v44 = objc_msgSend(v43, "startTranscription:", &v66);
        v45 = v66;
        break;
      case 1:
        AXLogLiveTranscription();
        v46 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v46, OS_LOG_TYPE_DEBUG))
          -[AXLTLiveTranscription startTranscribing:targetPID:excludingPIDs:callbackBlock:audioInfoBlock:error:].cold.2(v46, v47, v48, v49, v50, v51, v52, v53);

        if (!-[AXLTLiveTranscription _pidSupportsCoreMediaNotifications:](self, "_pidSupportsCoreMediaNotifications:", v11))
        {
          v54 = CFSTR("Call");
          if ((_DWORD)v11 == -1)
          {
            v54 = CFSTR("System");
            v55 = CFSTR("liveCaptions.system");
          }
          else
          {
            v55 = CFSTR("liveCaptions.call");
          }
          v56 = v54;
          AXLCLocString(v55);
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          +[AXLTAudioOutManager sharedInstance](AXLTAudioOutManager, "sharedInstance");
          v58 = (void *)objc_claimAutoreleasedReturnValue();
          v67 = 0;
          v65 = objc_msgSend(v58, "_startTranscriptionForPID:appID:appName:excludingPIDs:error:", v11, v56, v57, v14, &v67);

          v32 = v67;
          if ((v65 & 1) != 0)
            goto LABEL_26;
          goto LABEL_29;
        }
        +[AXLTAudioOutManager sharedInstance](AXLTAudioOutManager, "sharedInstance");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        v68 = 0;
        v44 = objc_msgSend(v43, "startTranscription:", &v68);
        v45 = v68;
        break;
      case 0:
        AXLogLiveTranscription();
        v22 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
          -[AXLTLiveTranscription startTranscribing:targetPID:excludingPIDs:callbackBlock:audioInfoBlock:error:].cold.1(v22, v23, v24, v25, v26, v27, v28, v29);

        -[AXLTLiveTranscription speechTranscriber](self, "speechTranscriber");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v69 = 0;
        v31 = objc_msgSend(v30, "startTranscription:", &v69);
        v32 = v69;

        if (!v31)
          goto LABEL_29;
LABEL_26:
        v59 = -[AXLTTranscribedDataReceiver initWithRequestType:targetPID:handler:audioInfoBlock:]([AXLTTranscribedDataReceiver alloc], "initWithRequestType:targetPID:handler:audioInfoBlock:", a3, v11, v15, v16);
        -[AXLTLiveTranscription _receiverKeyForRequestType:targetPID:](self, "_receiverKeyForRequestType:targetPID:", a3, v11);
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        -[AXLTLiveTranscription dataReceivers](self, "dataReceivers");
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v61, "setObject:forKeyedSubscript:", v59, v60);

        AXLogLiveTranscription();
        v62 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v62, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 67109634;
          *(_DWORD *)v71 = v11;
          *(_WORD *)&v71[4] = 2048;
          *(_QWORD *)&v71[6] = a3;
          v72 = 2112;
          v73 = v60;
          _os_log_debug_impl(&dword_22D27A000, v62, OS_LOG_TYPE_DEBUG, "registered pid: %d to receive transcription updates for: %ld, key: %@", buf, 0x1Cu);
        }

        v34 = 1;
        goto LABEL_32;
      default:
        v32 = 0;
LABEL_29:
        AXLogLiveTranscription();
        v59 = (AXLTTranscribedDataReceiver *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(&v59->super, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(v32, "localizedDescription");
          v64 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 67109634;
          *(_DWORD *)v71 = v11;
          *(_WORD *)&v71[4] = 2048;
          *(_QWORD *)&v71[6] = a3;
          v72 = 2112;
          v73 = v64;
          _os_log_error_impl(&dword_22D27A000, &v59->super, OS_LOG_TYPE_ERROR, "fail to register pid: %d to receive transcription updates for: %ld, error: %@", buf, 0x1Cu);

        }
        v34 = 0;
LABEL_32:

        goto LABEL_33;
    }
    v32 = v45;

    if ((v44 & 1) != 0)
      goto LABEL_26;
    goto LABEL_29;
  }
  v33 = (void *)MEMORY[0x24BDD1540];
  v74 = *MEMORY[0x24BDD0BA0];
  v75[0] = CFSTR("callback handler is nil");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v75, &v74, 1);
  v32 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "errorWithDomain:code:userInfo:", CFSTR("com.apple.accessibility.LiveTranscription"), 1, v32);
  v34 = 0;
  *a8 = (id)objc_claimAutoreleasedReturnValue();
LABEL_33:

  return v34;
}

- (BOOL)stopTranscribing:(int64_t)a3 error:(id *)a4
{
  return -[AXLTLiveTranscription stopTranscribing:targetPID:error:](self, "stopTranscribing:targetPID:error:", a3, 0xFFFFFFFFLL, a4);
}

- (BOOL)stopTranscribing:(int64_t)a3 targetPID:(int)a4 error:(id *)a5
{
  uint64_t v5;
  NSObject *v8;
  _BOOL4 v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  void *v14;
  int v15;
  id v16;
  NSObject *v17;
  NSObject *v18;
  void *v19;
  BOOL v20;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  uint8_t buf[4];
  _BYTE v28[14];
  __int16 v29;
  NSObject *v30;
  uint64_t v31;

  v5 = *(_QWORD *)&a4;
  v31 = *MEMORY[0x24BDAC8D0];
  AXLogLiveTranscription();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218240;
    *(_QWORD *)v28 = a3;
    *(_WORD *)&v28[8] = 1024;
    *(_DWORD *)&v28[10] = v5;
    _os_log_impl(&dword_22D27A000, v8, OS_LOG_TYPE_DEFAULT, "API stopTranscribing request: %ld, targetPID: %d", buf, 0x12u);
  }

  if (!a3)
  {
    -[AXLTLiveTranscription speechTranscriber](self, "speechTranscriber");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = 0;
    v15 = objc_msgSend(v14, "stopTranscription:", &v26);
    v16 = v26;

    if (!v15)
      goto LABEL_17;
LABEL_14:
    -[AXLTLiveTranscription _receiverKeyForRequestType:targetPID:](self, "_receiverKeyForRequestType:targetPID:", a3, v5);
    v17 = objc_claimAutoreleasedReturnValue();
    AXLogLiveTranscription();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 67109634;
      *(_DWORD *)v28 = v5;
      *(_WORD *)&v28[4] = 2048;
      *(_QWORD *)&v28[6] = a3;
      v29 = 2112;
      v30 = v17;
      _os_log_debug_impl(&dword_22D27A000, v18, OS_LOG_TYPE_DEBUG, "removed pid: %d to receive transcription updates for: %ld, key: %@", buf, 0x1Cu);
    }

    -[AXLTLiveTranscription dataReceivers](self, "dataReceivers");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "removeObjectForKey:", v17);

    v20 = 1;
    goto LABEL_20;
  }
  if (a3 == 2)
  {
    -[AXLTLiveTranscription testTranscriber](self, "testTranscriber");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = 0;
    v12 = objc_msgSend(v11, "stopTranscription:", &v23);
    v13 = v23;
    goto LABEL_13;
  }
  if (a3 != 1)
  {
    v16 = 0;
    goto LABEL_14;
  }
  v9 = -[AXLTLiveTranscription _pidSupportsCoreMediaNotifications:](self, "_pidSupportsCoreMediaNotifications:", v5);
  +[AXLTAudioOutManager sharedInstance](AXLTAudioOutManager, "sharedInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v9)
  {
    v25 = 0;
    v12 = objc_msgSend(v10, "stopTranscription:", &v25);
    v13 = v25;
  }
  else
  {
    v24 = 0;
    v12 = objc_msgSend(v10, "_stopTranscriptionForPID:error:", v5, &v24);
    v13 = v24;
  }
LABEL_13:
  v16 = v13;

  if ((v12 & 1) != 0)
    goto LABEL_14;
LABEL_17:
  AXLogLiveTranscription();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(v16, "localizedDescription");
    v22 = objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 67109634;
    *(_DWORD *)v28 = v5;
    *(_WORD *)&v28[4] = 2048;
    *(_QWORD *)&v28[6] = a3;
    v29 = 2112;
    v30 = v22;
    _os_log_error_impl(&dword_22D27A000, v17, OS_LOG_TYPE_ERROR, "fail to remove pid: %d to receive transcription updates for: %ld, error: %@", buf, 0x1Cu);

  }
  v20 = 0;
LABEL_20:

  return v20;
}

- (void)resetTranscribing:(int64_t)a3
{
  NSObject *v5;
  void *v6;
  void *v7;

  AXLogLiveTranscription();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[AXLTLiveTranscription resetTranscribing:].cold.1(a3, v5);

  if (a3 == 2)
  {
    -[AXLTLiveTranscription testTranscriber](self, "testTranscriber");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else if (a3 == 1)
  {
    +[AXLTAudioOutManager sharedInstance](AXLTAudioOutManager, "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (a3)
      return;
    -[AXLTLiveTranscription speechTranscriber](self, "speechTranscriber");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v7 = v6;
  objc_msgSend(v6, "resetTranscription");

}

- (void)transcriberOutputData:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void (**v9)(_QWORD, _QWORD);

  v4 = a3;
  -[AXLTLiveTranscription _receiverKeyForRequestType:targetPID:](self, "_receiverKeyForRequestType:targetPID:", objc_msgSend(v4, "requestType"), objc_msgSend(v4, "pid"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  AXLogLiveTranscription();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    -[AXLTLiveTranscription transcriberOutputData:].cold.1();

  -[AXLTLiveTranscription dataReceivers](self, "dataReceivers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(v8, "callbackBlock");
    v9 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id))v9)[2](v9, v4);

  }
}

- (void)audioInfoData:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void (**v10)(_QWORD, _QWORD);
  void *v11;
  void *v12;

  v4 = a3;
  -[AXLTLiveTranscription _receiverKeyForRequestType:targetPID:](self, "_receiverKeyForRequestType:targetPID:", objc_msgSend(v4, "requestType"), objc_msgSend(v4, "pid"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  AXLogLiveTranscription();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    -[AXLTLiveTranscription audioInfoData:].cold.1();

  -[AXLTLiveTranscription dataReceivers](self, "dataReceivers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(v8, "audioInfoBlock");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      objc_msgSend(v8, "audioInfoBlock");
      v10 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, id))v10)[2](v10, v4);

    }
  }
  -[AXLTLiveTranscription delegate](self, "delegate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    -[AXLTLiveTranscription delegate](self, "delegate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "liveTranscriptionAudioInfoDataArrived:", v4);

  }
}

- (id)_receiverKeyForRequestType:(int64_t)a3 targetPID:(int)a4
{
  uint64_t v4;
  uint64_t v7;

  if (a3)
  {
    v4 = *(_QWORD *)&a4;
    if (-[AXLTLiveTranscription _pidSupportsCoreMediaNotifications:](self, "_pidSupportsCoreMediaNotifications:", *(_QWORD *)&a4))
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%ld_%ld"), a3, -1);
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%ld_%d"), a3, v4);
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%ld"), 0, v7);
  }
  return (id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)_pidSupportsCoreMediaNotifications:(int)a3
{
  return (a3 + 1) < 0xFFFFFFFE;
}

- (AXLTLiveTranscriptionDelegate)delegate
{
  return (AXLTLiveTranscriptionDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)noPunctuation
{
  return self->_noPunctuation;
}

- (void)setNoPunctuation:(BOOL)a3
{
  self->_noPunctuation = a3;
}

- (int64_t)taskHint
{
  return self->_taskHint;
}

- (void)setTaskHint:(int64_t)a3
{
  self->_taskHint = a3;
}

- (AXLTSpeechTranscriber)speechTranscriber
{
  return self->_speechTranscriber;
}

- (void)setSpeechTranscriber:(id)a3
{
  objc_storeStrong((id *)&self->_speechTranscriber, a3);
}

- (AXLTTestTranscriber)testTranscriber
{
  return self->_testTranscriber;
}

- (void)setTestTranscriber:(id)a3
{
  objc_storeStrong((id *)&self->_testTranscriber, a3);
}

- (NSMutableDictionary)dataReceivers
{
  return self->_dataReceivers;
}

- (void)setDataReceivers:(id)a3
{
  objc_storeStrong((id *)&self->_dataReceivers, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataReceivers, 0);
  objc_storeStrong((id *)&self->_testTranscriber, 0);
  objc_storeStrong((id *)&self->_speechTranscriber, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)startTranscribing:(uint64_t)a3 targetPID:(uint64_t)a4 excludingPIDs:(uint64_t)a5 callbackBlock:(uint64_t)a6 audioInfoBlock:(uint64_t)a7 error:(uint64_t)a8 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3(&dword_22D27A000, a1, a3, "startTranscriptionWithRequestType:AXLiveTranscriptionRequestSpeech", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_0();
}

- (void)startTranscribing:(uint64_t)a3 targetPID:(uint64_t)a4 excludingPIDs:(uint64_t)a5 callbackBlock:(uint64_t)a6 audioInfoBlock:(uint64_t)a7 error:(uint64_t)a8 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3(&dword_22D27A000, a1, a3, "startTranscriptionWithRequestType:AXLiveTranscriptionRequestAudio", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_0();
}

- (void)startTranscribing:(uint64_t)a3 targetPID:(uint64_t)a4 excludingPIDs:(uint64_t)a5 callbackBlock:(uint64_t)a6 audioInfoBlock:(uint64_t)a7 error:(uint64_t)a8 .cold.3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3(&dword_22D27A000, a1, a3, "startTranscriptionWithRequestType:AXLiveTranscriptionRequestTest", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_0();
}

- (void)resetTranscribing:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 134217984;
  v3 = a1;
  _os_log_debug_impl(&dword_22D27A000, a2, OS_LOG_TYPE_DEBUG, "API resetTranscribing for type: %ld", (uint8_t *)&v2, 0xCu);
  OUTLINED_FUNCTION_1();
}

- (void)transcriberOutputData:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_1_1(&dword_22D27A000, v0, v1, "receiver: %@, data: %@");
  OUTLINED_FUNCTION_1();
}

- (void)audioInfoData:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_1_1(&dword_22D27A000, v0, v1, "receiver: %@, audio data: %@");
  OUTLINED_FUNCTION_1();
}

@end
