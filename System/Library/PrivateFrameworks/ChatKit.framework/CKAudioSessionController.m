@implementation CKAudioSessionController

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)CKAudioSessionController;
  -[CKAudioSessionController dealloc](&v4, sel_dealloc);
}

- (CKAudioSessionController)init
{
  CKAudioSessionController *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CKAudioSessionController;
  v2 = -[CKAudioSessionController init](&v5, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObserver:selector:name:object:", v2, sel_audioSessionInterruption_, *MEMORY[0x1E0C896F0], 0);
    objc_msgSend(v3, "addObserver:selector:name:object:", v2, sel_audioSessionRouteChange_, *MEMORY[0x1E0C89870], 0);
    objc_msgSend(v3, "addObserver:selector:name:object:", v2, sel_audioSessionMediaServicesWereLost_, *MEMORY[0x1E0C89730], 0);
    objc_msgSend(v3, "addObserver:selector:name:object:", v2, sel_audioSessionMediaServicesWereReset_, *MEMORY[0x1E0C89738], 0);

  }
  return v2;
}

+ (id)shareInstance
{
  if (shareInstance_once != -1)
    dispatch_once(&shareInstance_once, &__block_literal_global_248);
  return (id)shareInstance_sAudioSessionController;
}

void __41__CKAudioSessionController_shareInstance__block_invoke()
{
  CKAudioSessionController *v0;
  void *v1;

  v0 = objc_alloc_init(CKAudioSessionController);
  v1 = (void *)shareInstance_sAudioSessionController;
  shareInstance_sAudioSessionController = (uint64_t)v0;

}

+ (id)queue
{
  if (queue_once != -1)
    dispatch_once(&queue_once, &__block_literal_global_15);
  return (id)queue_sQueue;
}

void __33__CKAudioSessionController_queue__block_invoke()
{
  dispatch_queue_t v0;
  void *v1;
  NSObject *v2;

  dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INTERACTIVE, 0);
  v2 = objc_claimAutoreleasedReturnValue();
  v0 = dispatch_queue_create("CKAudioSessionControllerQueue", v2);
  v1 = (void *)queue_sQueue;
  queue_sQueue = (uint64_t)v0;

}

- (void)activateWithOptions:(unint64_t)a3 completion:(id)a4
{
  -[CKAudioSessionController setActive:options:completion:](self, "setActive:options:completion:", 1, a3, a4);
}

- (void)deactivate
{
  -[CKAudioSessionController setActive:options:completion:](self, "setActive:options:completion:", 0, 0, 0);
}

- (BOOL)shouldUseSpeaker
{
  return -[CKAudioSessionController options](self, "options") & 1;
}

- (BOOL)shouldStopPlayingWhenSilent
{
  return (-[CKAudioSessionController options](self, "options") >> 1) & 1;
}

- (BOOL)shouldDuckOthers
{
  return (-[CKAudioSessionController options](self, "options") >> 2) & 1;
}

- (void)setActive:(BOOL)a3 options:(unint64_t)a4 completion:(id)a5
{
  _BOOL4 v6;
  id v8;
  NSObject *v9;
  void *v10;
  NSObject *v11;
  id v12;
  _QWORD v13[5];
  id v14;
  unint64_t v15;
  BOOL v16;
  char v17;
  uint8_t buf[4];
  _BOOL4 v19;
  __int16 v20;
  int v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v6 = a3;
  v24 = *MEMORY[0x1E0C80C00];
  v8 = a5;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      v10 = _Block_copy(v8);
      *(_DWORD *)buf = 67109632;
      v19 = v6;
      v20 = 1024;
      v21 = a4 & 1;
      v22 = 2048;
      v23 = v10;
      _os_log_impl(&dword_18DFCD000, v9, OS_LOG_TYPE_INFO, "setActive:%d shouldUseSpeaker:%d completion:%p", buf, 0x18u);

    }
  }
  +[CKAudioSessionController queue](CKAudioSessionController, "queue");
  v11 = objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __57__CKAudioSessionController_setActive_options_completion___block_invoke;
  v13[3] = &unk_1E275A1A0;
  v16 = v6;
  v17 = a4 & 1;
  v13[4] = self;
  v14 = v8;
  v15 = a4;
  v12 = v8;
  dispatch_async(v11, v13);

}

void __57__CKAudioSessionController_setActive_options_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  int v3;
  int v4;
  void *v5;
  int v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  char v11;
  id v12;
  NSObject *v13;
  char v14;
  id v15;
  NSObject *v16;
  _QWORD block[4];
  id v18;
  id v19;
  id v20;
  uint8_t buf[4];
  _BYTE v22[10];
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      v3 = *(unsigned __int8 *)(a1 + 56);
      v4 = *(unsigned __int8 *)(a1 + 57);
      v5 = _Block_copy(*(const void **)(a1 + 40));
      *(_DWORD *)buf = 67109632;
      *(_DWORD *)v22 = v3;
      *(_WORD *)&v22[4] = 1024;
      *(_DWORD *)&v22[6] = v4;
      v23 = 2048;
      v24 = v5;
      _os_log_impl(&dword_18DFCD000, v2, OS_LOG_TYPE_INFO, "dispatching setActive:%d shouldUseSpeaker:%d completion:%p", buf, 0x18u);

    }
  }
  v6 = *(unsigned __int8 *)(a1 + 56);
  if (v6 != objc_msgSend(*(id *)(a1 + 32), "isActive")
    || *(_BYTE *)(a1 + 56) && (v7 = *(_QWORD *)(a1 + 48), v7 != objc_msgSend(*(id *)(a1 + 32), "options"))
    || objc_msgSend(*(id *)(a1 + 32), "isDirty"))
  {
    objc_msgSend(MEMORY[0x1E0C89AE8], "sharedInstance");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (*(_BYTE *)(a1 + 56))
    {
      objc_msgSend(*(id *)(a1 + 32), "configureAudioSessionWithOptions:", *(_QWORD *)(a1 + 48));
      v10 = *(unsigned __int8 *)(a1 + 56);
      v20 = 0;
      v11 = objc_msgSend(v9, "setActive:error:", v10, &v20);
      v12 = v20;
      if ((v11 & 1) == 0 && IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          *(_QWORD *)v22 = v12;
          _os_log_impl(&dword_18DFCD000, v13, OS_LOG_TYPE_INFO, "AudioSessionController: Failed to activate audio session: %@", buf, 0xCu);
        }

      }
    }
    else
    {
      v19 = 0;
      v14 = objc_msgSend(v8, "setActive:withOptions:error:", 0, 1, &v19);
      v15 = v19;
      if ((v14 & 1) == 0 && IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          *(_QWORD *)v22 = v15;
          _os_log_impl(&dword_18DFCD000, v16, OS_LOG_TYPE_INFO, "AudioSessionController: Failed to deactivate audio session: %@", buf, 0xCu);
        }

      }
    }
    objc_msgSend(*(id *)(a1 + 32), "setActive:", *(unsigned __int8 *)(a1 + 56));
    objc_msgSend(*(id *)(a1 + 32), "setOptions:", *(_QWORD *)(a1 + 48));
    objc_msgSend(*(id *)(a1 + 32), "setDirty:", 0);

  }
  if (*(_QWORD *)(a1 + 40))
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __57__CKAudioSessionController_setActive_options_completion___block_invoke_22;
    block[3] = &unk_1E274AED0;
    v18 = *(id *)(a1 + 40);
    dispatch_async(MEMORY[0x1E0C80D38], block);

  }
}

uint64_t __57__CKAudioSessionController_setActive_options_completion___block_invoke_22(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)configureAudioSessionWithOptions:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  NSObject *v11;
  int v12;
  uint64_t v13;
  uint64_t v14;
  id *v15;
  id v16;
  id v17;
  char v18;
  id v19;
  NSObject *v20;
  char v21;
  id v22;
  NSObject *v23;
  NSObject *v24;
  void *v25;
  id v26;
  id v27;
  id v28;
  uint8_t buf[4];
  _QWORD v30[2];
  const __CFString *v31;
  _QWORD v32[2];

  v32[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = CFSTR("CKAudioSessionControllerSessionNotificationOptionsKey");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v32[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v32, &v31, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "postNotificationName:object:userInfo:", CFSTR("CKAudioSessionControllerSessionOptionsWillChangeNotification"), self, v7);

  objc_msgSend(MEMORY[0x1E0C89AE8], "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = *MEMORY[0x1E0C89748];
  v28 = 0;
  LOBYTE(self) = objc_msgSend(v8, "setMode:error:", v9, &v28);
  v10 = v28;
  if ((self & 1) == 0 && IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v30[0] = v10;
      _os_log_impl(&dword_18DFCD000, v11, OS_LOG_TYPE_INFO, "AudioSessionController: Failed setting the mode:%@", buf, 0xCu);
    }

  }
  v12 = a3 & 1;
  v13 = 44;
  if ((a3 & 1) == 0)
    v13 = 36;
  if ((a3 & 2) != 0)
    v14 = 0;
  else
    v14 = v13;
  v15 = (id *)MEMORY[0x1E0C89660];
  if ((a3 & 2) == 0)
    v15 = (id *)MEMORY[0x1E0C89688];
  v16 = *v15;
  if ((a3 & 8) != 0)
  {
    v17 = (id)*MEMORY[0x1E0C89690];

    v16 = v17;
  }

  v27 = 0;
  v18 = objc_msgSend(v8, "setCategory:withOptions:error:", v16, v14 | (a3 >> 1) & 2, &v27);
  v19 = v27;
  if ((v18 & 1) == 0 && IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v30[0] = v19;
      _os_log_impl(&dword_18DFCD000, v20, OS_LOG_TYPE_INFO, "AudioSessionController: Failed setting the category:%@", buf, 0xCu);
    }

  }
  v26 = 0;
  v21 = objc_msgSend(v8, "setActivationContext:error:", MEMORY[0x1E0C9AA70], &v26);
  v22 = v26;
  if ((v21 & 1) == 0 && IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v30[0] = v22;
      _os_log_impl(&dword_18DFCD000, v23, OS_LOG_TYPE_INFO, "AudioSessionController: Failed setting activation context:%@", buf, 0xCu);
    }

  }
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v8, "outputDataSources");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 67109378;
      LODWORD(v30[0]) = v12;
      WORD2(v30[0]) = 2112;
      *(_QWORD *)((char *)v30 + 6) = v25;
      _os_log_impl(&dword_18DFCD000, v24, OS_LOG_TYPE_INFO, "AudioSessionController: configureAudioSession using speaker = %d, %@", buf, 0x12u);

    }
  }

}

- (void)audioSessionRouteChange:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  int v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v10 = 138412290;
      v11 = v4;
      _os_log_impl(&dword_18DFCD000, v5, OS_LOG_TYPE_INFO, "audioSessionRouteChange: %@", (uint8_t *)&v10, 0xCu);
    }

  }
  -[CKAudioSessionController setDirty:](self, "setDirty:", 1);
  if (-[CKAudioSessionController isActive](self, "isActive"))
  {
    objc_msgSend(v4, "userInfo");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKey:", *MEMORY[0x1E0C89880]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "unsignedIntegerValue");

    if ((unint64_t)(v8 - 1) <= 1)
    {
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
        {
          LOWORD(v10) = 0;
          _os_log_impl(&dword_18DFCD000, v9, OS_LOG_TYPE_INFO, "Available audio routes changed", (uint8_t *)&v10, 2u);
        }

      }
      -[CKAudioSessionController activateWithOptions:completion:](self, "activateWithOptions:completion:", -[CKAudioSessionController options](self, "options"), 0);
    }
  }

}

- (void)audioSessionInterruption:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v6 = 138412290;
      v7 = v4;
      _os_log_impl(&dword_18DFCD000, v5, OS_LOG_TYPE_INFO, "audioSessionInterruption: %@", (uint8_t *)&v6, 0xCu);
    }

  }
  -[CKAudioSessionController setDirty:](self, "setDirty:", 1);

}

- (void)audioSessionMediaServicesWereLost:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v6 = 138412290;
      v7 = v4;
      _os_log_impl(&dword_18DFCD000, v5, OS_LOG_TYPE_INFO, "audioSessionMediaServicesWereLost: %@", (uint8_t *)&v6, 0xCu);
    }

  }
  -[CKAudioSessionController setDirty:](self, "setDirty:", 1);

}

- (void)audioSessionMediaServicesWereReset:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v6 = 138412290;
      v7 = v4;
      _os_log_impl(&dword_18DFCD000, v5, OS_LOG_TYPE_INFO, "audioSessionMediaServicesWereReset: %@", (uint8_t *)&v6, 0xCu);
    }

  }
  -[CKAudioSessionController setDirty:](self, "setDirty:", 1);

}

- (BOOL)isActive
{
  return self->_active;
}

- (void)setActive:(BOOL)a3
{
  self->_active = a3;
}

- (BOOL)isDirty
{
  return self->_dirty;
}

- (void)setDirty:(BOOL)a3
{
  self->_dirty = a3;
}

- (unint64_t)options
{
  return self->_options;
}

- (void)setOptions:(unint64_t)a3
{
  self->_options = a3;
}

@end
