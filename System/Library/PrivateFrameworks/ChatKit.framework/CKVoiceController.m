@implementation CKVoiceController

- (void)dealloc
{
  objc_super v3;

  -[CKVoiceController cleanup](self, "cleanup");
  v3.receiver = self;
  v3.super_class = (Class)CKVoiceController;
  -[CKVoiceController dealloc](&v3, sel_dealloc);
}

- (void)cleanup
{
  void *v3;
  void *v4;
  NSObject *v5;
  _QWORD block[5];
  _QWORD v7[5];
  id v8;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  -[CKVoiceController voiceController](self, "voiceController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v7[0] = 0;
    v7[1] = v7;
    v7[2] = 0x3032000000;
    v7[3] = __Block_byref_object_copy__41;
    v7[4] = __Block_byref_object_dispose__41;
    v8 = 0;
    -[CKVoiceController voiceController](self, "voiceController");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    -[CKVoiceController setVoiceController:](self, "setVoiceController:", 0);
    -[CKVoiceController queue](self, "queue");
    v5 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __28__CKVoiceController_cleanup__block_invoke;
    block[3] = &unk_1E274A178;
    block[4] = v7;
    dispatch_async(v5, block);

    _Block_object_dispose(v7, 8);
  }
}

void __28__CKVoiceController_cleanup__block_invoke(uint64_t a1)
{
  void *v1;
  id v2;
  NSObject *v3;
  id v4;
  uint8_t buf[4];
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v1 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  v4 = 0;
  objc_msgSend(v1, "teardownWithError:", &v4);
  v2 = v4;
  if (v2 && IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v6 = v2;
      _os_log_impl(&dword_18DFCD000, v3, OS_LOG_TYPE_INFO, "-[AVVoiceController teardownWithError:...] failed with error %@", buf, 0xCu);
    }

  }
}

- (CKVoiceController)initWithActivationMode:(int64_t)a3 recordSettings:(id)a4 queue:(id)a5
{
  id v8;
  id v9;
  CKVoiceController *v10;
  CKVoiceController *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  _QWORD v16[4];
  CKVoiceController *v17;
  int64_t v18;
  objc_super v19;

  v8 = a4;
  v9 = a5;
  v19.receiver = self;
  v19.super_class = (Class)CKVoiceController;
  v10 = -[CKVoiceController init](&v19, sel_init);
  v11 = v10;
  if (v10)
  {
    -[CKVoiceController setQueue:](v10, "setQueue:", v9);
    -[CKVoiceController setRecordSettings:](v11, "setRecordSettings:", v8);
    -[CKVoiceController _setActivationMode:](v11, "_setActivationMode:", a3);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addObserver:selector:name:object:", v11, sel_messageSent_, *MEMORY[0x1E0D354B0], 0);

    objc_msgSend(MEMORY[0x1E0D35798], "sharedRegistry");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "_setPostMessageSentNotifications:", 1);

    -[CKVoiceController queue](v11, "queue");
    v14 = objc_claimAutoreleasedReturnValue();
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __65__CKVoiceController_initWithActivationMode_recordSettings_queue___block_invoke;
    v16[3] = &unk_1E274C9C0;
    v17 = v11;
    v18 = a3;
    dispatch_async(v14, v16);

  }
  return v11;
}

void __65__CKVoiceController_initWithActivationMode_recordSettings_queue___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  BOOL v4;
  int v5;
  int v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  id v14;
  uint64_t v15;
  id v16;
  uint8_t buf[4];
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v16 = 0;
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C89C10]), "initVoiceControllerForClient:withError:", 2, &v16);
  v3 = v16;
  if (v3)
    v4 = 1;
  else
    v4 = v2 == 0;
  v5 = v4;
  v6 = IMOSLoggingEnabled();
  if (v5)
  {
    if (v6)
    {
      OSLogHandleForIMFoundationCategory();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v18 = v3;
        _os_log_impl(&dword_18DFCD000, v7, OS_LOG_TYPE_INFO, "-[AVVoiceController initWithContext:...] failed with error %@", buf, 0xCu);
      }

    }
    objc_msgSend(*(id *)(a1 + 32), "voiceControllerDidStopRecordingForClientError");
  }
  else
  {
    if (v6)
    {
      OSLogHandleForIMFoundationCategory();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18DFCD000, v8, OS_LOG_TYPE_INFO, "-[AVVoiceController initWithContext:...] setting up.", buf, 2u);
      }

    }
    objc_msgSend(v2, "setRecordDelegate:", *(_QWORD *)(a1 + 32));
    objc_msgSend(MEMORY[0x1E0C99E98], "ckURLForResource:withExtension:", CFSTR("MessageRecordStart"), CFSTR("caf"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setAlertSoundFromURL:forType:", v9, 1);
    objc_msgSend(MEMORY[0x1E0C99E98], "ckURLForResource:withExtension:", CFSTR("MessageRecordStop"), CFSTR("caf"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setAlertSoundFromURL:forType:", v10, 2);
    objc_msgSend(*(id *)(a1 + 32), "setVoiceController:", v2);
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C89BC8]), "initWithMode:deviceUID:", *(_QWORD *)(a1 + 40), 0);
    v14 = 0;
    v15 = 0;
    v12 = objc_msgSend(v2, "setContext:streamType:error:", v11, &v15, &v14);
    v3 = v14;
    if (v3)
    {
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v18 = v3;
          _os_log_impl(&dword_18DFCD000, v13, OS_LOG_TYPE_INFO, "[voiceController setContext:streamType:error:] failed with error: %@", buf, 0xCu);
        }

      }
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "setStreamID:", v12);
    }

  }
}

- (void)setActivationMode:(int64_t)a3
{
  NSObject *v5;
  _QWORD v6[6];

  -[CKVoiceController _setActivationMode:](self, "_setActivationMode:");
  -[CKVoiceController queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __39__CKVoiceController_setActivationMode___block_invoke;
  v6[3] = &unk_1E274C9C0;
  v6[4] = self;
  v6[5] = a3;
  dispatch_async(v5, v6);

}

void __39__CKVoiceController_setActivationMode___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  id v5;
  NSObject *v6;
  id v7;
  uint64_t v8;
  uint8_t buf[4];
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "voiceController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C89BC8]), "initWithMode:deviceUID:", *(_QWORD *)(a1 + 40), 0);
  v7 = 0;
  v8 = 0;
  v4 = objc_msgSend(v2, "setContext:streamType:error:", v3, &v8, &v7);
  v5 = v7;
  if (v5 || (objc_msgSend(*(id *)(a1 + 32), "setStreamID:", v4), !v2))
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v10 = v5;
        _os_log_impl(&dword_18DFCD000, v6, OS_LOG_TYPE_INFO, "-[AVVoiceController setCurrentContext:] failed with error %@", buf, 0xCu);
      }

    }
    objc_msgSend(*(id *)(a1 + 32), "voiceControllerDidStopRecordingForClientError");
  }

}

- (void)record
{
  NSObject *v3;
  _QWORD block[5];

  -[CKVoiceController queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __27__CKVoiceController_record__block_invoke;
  block[3] = &unk_1E274A208;
  block[4] = self;
  dispatch_async(v3, block);

}

void __27__CKVoiceController_record__block_invoke(uint64_t a1)
{
  id *v2;
  void *v3;
  uint64_t v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  id v12;
  char v13;
  NSObject *v14;
  void *v15;
  void *v16;
  id v17;
  NSObject *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  NSObject *v22;
  id v23;
  id v24;
  id v25;
  id v26;
  uint8_t buf[4];
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v2 = (id *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 32), "voiceController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(*v2, "streamID");
  v26 = 0;
  objc_msgSend(v3, "activateAudioSessionForStream:isPrewarm:recordMode:error:", v4, 0, 1, &v26);
  v5 = v26;

  v6 = objc_alloc(MEMORY[0x1E0C89BE0]);
  v7 = objc_msgSend(*v2, "streamID");
  objc_msgSend(*v2, "recordSettings");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v6, "initWithStreamID:settings:bufferDuration:", v7, v8, 0.1);

  objc_msgSend(v9, "setMeteringEnabled:", 1);
  objc_msgSend(*v2, "voiceController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = v5;
  v11 = objc_msgSend(v10, "prepareRecordForStream:error:", v9, &v25);
  v12 = v25;

  if (v12)
    v13 = 0;
  else
    v13 = v11;
  if ((v13 & 1) != 0)
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18DFCD000, v14, OS_LOG_TYPE_INFO, "-[AVVoiceController prepareRecordWithSettings:...] succeeded, about to start recording", buf, 2u);
      }

    }
    v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C89BB8]), "initWithStreamID:", objc_msgSend(*(id *)(a1 + 32), "streamID"));
    objc_msgSend(*(id *)(a1 + 32), "voiceController");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = 0;
    objc_msgSend(v16, "configureAlertBehaviorForStream:error:", v15, &v24);
    v17 = v24;

    if (v17 && IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v28 = v17;
        _os_log_impl(&dword_18DFCD000, v18, OS_LOG_TYPE_INFO, "[voiceController configureAlertBehaviorForStream] failed with error: %@", buf, 0xCu);
      }

    }
    v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C89BF8]), "initWithStreamID:atStartHostTime:", objc_msgSend(*(id *)(a1 + 32), "streamID"), 0);
    objc_msgSend(v19, "setStartAlert:", 2);

    objc_msgSend(*(id *)(a1 + 32), "voiceController");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = 0;
    objc_msgSend(v20, "startRecordForStream:error:", v19, &v23);
    v12 = v23;

    if (v12 && IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v28 = v12;
        _os_log_impl(&dword_18DFCD000, v21, OS_LOG_TYPE_INFO, "[voiceController startRecordForStream] failed with error: %@", buf, 0xCu);
      }

    }
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "voiceControllerDidStopRecordingForClientError");
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v28 = v12;
        _os_log_impl(&dword_18DFCD000, v22, OS_LOG_TYPE_INFO, "[voiceController prepareRecordForStream:...] failed with error:%@", buf, 0xCu);
      }

    }
  }

}

- (void)stop
{
  NSObject *v3;
  _QWORD block[5];

  -[CKVoiceController stopUpdatingPower](self, "stopUpdatingPower");
  -[CKVoiceController queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __25__CKVoiceController_stop__block_invoke;
  block[3] = &unk_1E274A208;
  block[4] = self;
  dispatch_async(v3, block);

}

void __25__CKVoiceController_stop__block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint8_t v4[16];

  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v4 = 0;
      _os_log_impl(&dword_18DFCD000, v2, OS_LOG_TYPE_INFO, "-[AVVoiceController stop] about to stop recording", v4, 2u);
    }

  }
  objc_msgSend(*(id *)(a1 + 32), "voiceController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stopRecordForStream:error:", objc_msgSend(*(id *)(a1 + 32), "streamID"), 0);

}

- (void)playAlertSoundForType:(int)a3
{
  int64_t v5;
  NSObject *v6;
  _QWORD block[6];
  int v8;

  v5 = -[CKVoiceController _activationMode](self, "_activationMode");
  -[CKVoiceController queue](self, "queue");
  v6 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __43__CKVoiceController_playAlertSoundForType___block_invoke;
  block[3] = &unk_1E2755B98;
  v8 = a3;
  block[4] = self;
  block[5] = v5;
  dispatch_async(v6, block);

}

void __43__CKVoiceController_playAlertSoundForType___block_invoke(uint64_t a1)
{
  NSObject *v2;
  int v3;
  unsigned int v4;
  NSObject *v6;
  void *v7;
  void *v8;
  _DWORD v9[2];
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      v3 = *(_DWORD *)(a1 + 48);
      v9[0] = 67109120;
      v9[1] = v3;
      _os_log_impl(&dword_18DFCD000, v2, OS_LOG_TYPE_INFO, "-[AVVoiceController playAlertSoundForType:...] playing alert type: %u", (uint8_t *)v9, 8u);
    }

  }
  v4 = *(_DWORD *)(a1 + 48) & 0xFFFFFFFE;
  if (*(_QWORD *)(a1 + 40) == 1768764005 && v4 == 2)
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        LOWORD(v9[0]) = 0;
        _os_log_impl(&dword_18DFCD000, v6, OS_LOG_TYPE_INFO, "-[AVVoiceController playAlertSoundForType:...] activation mode was raise, resetting activation context", (uint8_t *)v9, 2u);
      }

    }
    objc_msgSend(MEMORY[0x1E0C89AE8], "sharedInstance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setActivationContext:error:", MEMORY[0x1E0C9AA70], 0);

  }
  objc_msgSend(*(id *)(a1 + 32), "voiceController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "playAlertSoundForType:overrideMode:", *(unsigned int *)(a1 + 48), -1);

  if (v4 == 2)
    usleep(0xB71B0u);
}

- (void)releaseAudioSession
{
  NSObject *v3;
  _QWORD block[5];

  -[CKVoiceController queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __40__CKVoiceController_releaseAudioSession__block_invoke;
  block[3] = &unk_1E274A208;
  block[4] = self;
  dispatch_async(v3, block);

}

void __40__CKVoiceController_releaseAudioSession__block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  char v7;
  id v8;
  NSObject *v9;
  uint8_t v10[8];
  id v11;
  uint8_t buf[16];

  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18DFCD000, v2, OS_LOG_TYPE_INFO, "-[AVVoiceController releaseAudioSession]", buf, 2u);
    }

  }
  objc_msgSend(*(id *)(a1 + 32), "voiceController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "deactivateAudioSessionForStream:withOptions:error:", objc_msgSend(*(id *)(a1 + 32), "streamID"), 1, 0);

  objc_msgSend(MEMORY[0x1E0C89AE8], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setActivationContext:error:", MEMORY[0x1E0C9AA70], 0);

  objc_msgSend(MEMORY[0x1E0C89AE8], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *MEMORY[0x1E0C89748];
  v11 = 0;
  v7 = objc_msgSend(v5, "setMode:error:", v6, &v11);
  v8 = v11;

  if ((v7 & 1) == 0)
  {
    IMLogHandleForCategory();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      __40__CKVoiceController_releaseAudioSession__block_invoke_cold_1((uint64_t)v8, v9);
    goto LABEL_11;
  }
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl(&dword_18DFCD000, v9, OS_LOG_TYPE_INFO, "reverted audio session back to AVAudioSessionModeDefault", v10, 2u);
    }
LABEL_11:

  }
}

- (void)voiceControllerDidStartRecording:(id)a3 forStream:(unint64_t)a4 successfully:(BOOL)a5 error:(id)a6
{
  _BOOL4 v7;
  id v9;
  id v10;
  NSObject *v11;
  _QWORD block[5];
  uint8_t buf[4];
  _BOOL4 v14;
  uint64_t v15;

  v7 = a5;
  v15 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a6;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109120;
      v14 = v7;
      _os_log_impl(&dword_18DFCD000, v11, OS_LOG_TYPE_INFO, "voiceControllerDidStartRecording:successfully: %d", buf, 8u);
    }

  }
  if (v7)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __83__CKVoiceController_voiceControllerDidStartRecording_forStream_successfully_error___block_invoke;
    block[3] = &unk_1E274A208;
    block[4] = self;
    dispatch_async(MEMORY[0x1E0C80D38], block);
  }
  else
  {
    -[CKVoiceController voiceControllerDidStopRecordingForClientError](self, "voiceControllerDidStopRecordingForClientError");
  }

}

void __83__CKVoiceController_voiceControllerDidStartRecording_forStream_successfully_error___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint8_t v4[16];

  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v4 = 0;
      _os_log_impl(&dword_18DFCD000, v2, OS_LOG_TYPE_INFO, "voiceControllerDidStartRecording:successfully:..., about to start updating power", v4, 2u);
    }

  }
  objc_msgSend(*(id *)(a1 + 32), "startUpdatingPower");
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "voiceControllerDidStartRecording:", *(_QWORD *)(a1 + 32));

}

- (void)voiceControllerAudioCallback:(id)a3 forStream:(unint64_t)a4 buffer:(id)a5
{
  id v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v6 = a5;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __67__CKVoiceController_voiceControllerAudioCallback_forStream_buffer___block_invoke;
  v8[3] = &unk_1E274A108;
  v8[4] = self;
  v9 = v6;
  v7 = v6;
  dispatch_async(MEMORY[0x1E0C80D38], v8);

}

void __67__CKVoiceController_voiceControllerAudioCallback_forStream_buffer___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "voiceControllerRecordBufferAvailable:buffer:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)voiceControllerDidStopRecording:(id)a3 forStream:(unint64_t)a4 forReason:(int64_t)a5
{
  id v7;
  NSObject *v8;
  _QWORD v9[6];
  uint8_t buf[4];
  int v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109120;
      v11 = a5;
      _os_log_impl(&dword_18DFCD000, v8, OS_LOG_TYPE_INFO, "voiceControllerDidStopRecording:forReason: %d", buf, 8u);
    }

  }
  -[CKVoiceController stopUpdatingPower](self, "stopUpdatingPower");
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __73__CKVoiceController_voiceControllerDidStopRecording_forStream_forReason___block_invoke;
  v9[3] = &unk_1E274C9C0;
  v9[4] = self;
  v9[5] = a5;
  dispatch_async(MEMORY[0x1E0C80D38], v9);

}

void __73__CKVoiceController_voiceControllerDidStopRecording_forStream_forReason___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  BOOL v4;
  uint64_t v5;
  void *v6;
  uint8_t v7[16];

  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_18DFCD000, v2, OS_LOG_TYPE_INFO, "voiceControllerDidStopRecording:forReason: block run", v7, 2u);
    }

  }
  v3 = *(_QWORD *)(a1 + 40);
  if (v3)
    v4 = v3 == -11786;
  else
    v4 = 1;
  v5 = v4;
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "voiceControllerDidFinishRecording:successfully:", *(_QWORD *)(a1 + 32), v5);

}

- (void)voiceControllerStreamInvalidated:(id)a3 forStream:(unint64_t)a4
{
  -[CKVoiceController setStreamID:](self, "setStreamID:", *MEMORY[0x1E0C899D8], a4);
  -[CKVoiceController setActivationMode:](self, "setActivationMode:", -[CKVoiceController _activationMode](self, "_activationMode"));
}

- (float)averagePower
{
  void *v3;
  void *v4;
  float v5;
  float v6;
  double v7;

  -[CKVoiceController powerUpdateTimer](self, "powerUpdateTimer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[CKVoiceController voiceController](self, "voiceController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "updateMeterForStream:", -[CKVoiceController streamID](self, "streamID"));
    objc_msgSend(v4, "getAveragePowerForStream:forChannel:", -[CKVoiceController streamID](self, "streamID"), 0);
    v6 = v5;
  }
  else
  {
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "audioRecordingViewMinimumDBLevel");
    v6 = v7;
  }

  return v6;
}

- (void)voiceControllerDidStopRecordingForClientError
{
  NSObject *v3;
  void *v4;
  uint8_t v5[16];

  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_18DFCD000, v3, OS_LOG_TYPE_INFO, "voiceControllerDidStopRecordingForClientError", v5, 2u);
    }

  }
  -[CKVoiceController voiceController](self, "voiceController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKVoiceController voiceControllerDidStopRecording:forStream:forReason:](self, "voiceControllerDidStopRecording:forStream:forReason:", v4, -[CKVoiceController streamID](self, "streamID"), -11799);

}

- (void)startUpdatingPower
{
  void *v3;
  NSObject *v4;
  NSObject *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(uint64_t);
  void *v10;
  CKVoiceController *v11;
  id v12;
  uint8_t buf[8];

  -[CKVoiceController powerUpdateTimer](self, "powerUpdateTimer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18DFCD000, v4, OS_LOG_TYPE_INFO, "Shouldn't have a power update timer already", buf, 2u);
      }

    }
    -[CKVoiceController stopUpdatingPower](self, "stopUpdatingPower");
  }
  -[CKVoiceController queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, v5);

  dispatch_source_set_timer(v6, 0, 0x3F940AAuLL, 0);
  *(_QWORD *)buf = 0;
  objc_initWeak((id *)buf, self);
  v7 = MEMORY[0x1E0C809B0];
  v8 = 3221225472;
  v9 = __39__CKVoiceController_startUpdatingPower__block_invoke;
  v10 = &unk_1E274D5D0;
  objc_copyWeak(&v12, (id *)buf);
  v11 = self;
  dispatch_source_set_event_handler(v6, &v7);
  -[CKVoiceController setPowerUpdateTimer:](self, "setPowerUpdateTimer:", v6, v7, v8, v9, v10);
  dispatch_resume(v6);
  objc_destroyWeak(&v12);
  objc_destroyWeak((id *)buf);

}

void __39__CKVoiceController_startUpdatingPower__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  int v4;
  id v5;
  _QWORD v6[4];
  id v7;
  int v8;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "voiceController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "updateMeterForStream:", objc_msgSend(*(id *)(a1 + 32), "streamID"));
  objc_msgSend(v3, "getAveragePowerForStream:forChannel:", objc_msgSend(*(id *)(a1 + 32), "streamID"), 0);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __39__CKVoiceController_startUpdatingPower__block_invoke_2;
  v6[3] = &unk_1E2755BC0;
  v7 = WeakRetained;
  v8 = v4;
  v5 = WeakRetained;
  dispatch_async(MEMORY[0x1E0C80D38], v6);

}

void __39__CKVoiceController_startUpdatingPower__block_invoke_2(uint64_t a1)
{
  double v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  LODWORD(v2) = *(_DWORD *)(a1 + 40);
  objc_msgSend(v3, "voiceController:didUpdateAveragePower:", *(_QWORD *)(a1 + 32), v2);

}

- (void)stopUpdatingPower
{
  NSObject *v3;
  NSObject *v4;

  -[CKVoiceController powerUpdateTimer](self, "powerUpdateTimer");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = v3;
    dispatch_source_cancel(v3);
    -[CKVoiceController setPowerUpdateTimer:](self, "setPowerUpdateTimer:", 0);
    v3 = v4;
  }

}

- (void)messageSent:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[4];
  id v8;

  v4 = a3;
  -[CKVoiceController queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __33__CKVoiceController_messageSent___block_invoke;
  block[3] = &unk_1E274A208;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, block);

}

uint64_t __33__CKVoiceController_messageSent___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      v3 = *(_QWORD *)(a1 + 32);
      v5 = 138412290;
      v6 = v3;
      _os_log_impl(&dword_18DFCD000, v2, OS_LOG_TYPE_INFO, "messageSent: %@", (uint8_t *)&v5, 0xCu);
    }

  }
  return usleep(0xB71B0u);
}

- (CKVoiceControllerDelegate)delegate
{
  return (CKVoiceControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (int64_t)_activationMode
{
  return self->__activationMode;
}

- (void)_setActivationMode:(int64_t)a3
{
  self->__activationMode = a3;
}

- (NSDictionary)recordSettings
{
  return self->_recordSettings;
}

- (void)setRecordSettings:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (OS_dispatch_source)powerUpdateTimer
{
  return self->_powerUpdateTimer;
}

- (void)setPowerUpdateTimer:(id)a3
{
  objc_storeStrong((id *)&self->_powerUpdateTimer, a3);
}

- (AVVoiceController)voiceController
{
  return self->_voiceController;
}

- (void)setVoiceController:(id)a3
{
  objc_storeStrong((id *)&self->_voiceController, a3);
}

- (unint64_t)streamID
{
  return self->_streamID;
}

- (void)setStreamID:(unint64_t)a3
{
  self->_streamID = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_voiceController, 0);
  objc_storeStrong((id *)&self->_powerUpdateTimer, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_recordSettings, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

void __40__CKVoiceController_releaseAudioSession__block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_18DFCD000, a2, OS_LOG_TYPE_ERROR, "failed to revert audio session back to AVAudioSessionModeDefault: %@", (uint8_t *)&v2, 0xCu);
}

@end
