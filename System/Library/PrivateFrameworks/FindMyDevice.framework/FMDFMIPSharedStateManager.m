@implementation FMDFMIPSharedStateManager

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_0 != -1)
    dispatch_once(&sharedInstance_onceToken_0, &__block_literal_global_3);
  return (id)sharedInstance__instance_0;
}

void __43__FMDFMIPSharedStateManager_sharedInstance__block_invoke()
{
  FMDFMIPSharedStateManager *v0;
  void *v1;

  v0 = objc_alloc_init(FMDFMIPSharedStateManager);
  v1 = (void *)sharedInstance__instance_0;
  sharedInstance__instance_0 = (uint64_t)v0;

}

- (FMDFMIPSharedStateManager)init
{
  FMDFMIPSharedStateManager *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *stateManagerQueue;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)FMDFMIPSharedStateManager;
  v2 = -[FMDFMIPSharedStateManager init](&v6, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("com.apple.icloud.FindMyDevice.stateManager", 0);
    stateManagerQueue = v2->_stateManagerQueue;
    v2->_stateManagerQueue = (OS_dispatch_queue *)v3;

  }
  return v2;
}

- (void)setFMiPActive:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  uint8_t v11[8];
  const __CFString *v12;
  _QWORD v13[2];

  v3 = a3;
  v13[1] = *MEMORY[0x1E0C80C00];
  -[FMDFMIPSharedStateManager _fmipSharedFileURL](self, "_fmipSharedFileURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[FMDFMIPSharedStateManager _readSharedInfo](self, "_readSharedInfo");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v6)
    {
      v12 = CFSTR("fmipActive");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v13[0] = v7;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
      v6 = (void *)objc_claimAutoreleasedReturnValue();

    }
    LogCategory_Unspecified();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v11 = 0;
      _os_log_impl(&dword_1C9939000, v8, OS_LOG_TYPE_DEFAULT, "Shared file present. Writing new FMiP sate.", v11, 2u);
    }

    v9 = (void *)objc_msgSend(v6, "mutableCopy");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKey:", v10, CFSTR("fmipActive"));

    -[FMDFMIPSharedStateManager _writeSharedInfo:](self, "_writeSharedInfo:", v9);
  }

}

- (void)recalculateLostMode
{
  void *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint8_t buf[4];
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  +[FMDFMIPManager sharedInstance](FMDFMIPManager, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lostModeInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  LogCategory_Unspecified();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v13 = objc_msgSend(v4, "lostModeType");
    _os_log_impl(&dword_1C9939000, v5, OS_LOG_TYPE_DEFAULT, "Updating shared file with lost mode - %lu", buf, 0xCu);
  }

  -[FMDFMIPSharedStateManager _readSharedInfo](self, "_readSharedInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    v8 = (void *)objc_msgSend(v6, "mutableCopy");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v4, "lostModeType"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKey:", v9, CFSTR("fmipLostModeType"));
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v4, "lostModeType", CFSTR("fmipLostModeType")));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v9;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v11, &v10, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }

  -[FMDFMIPSharedStateManager _writeSharedInfo:](self, "_writeSharedInfo:", v8);
}

- (BOOL)fmipActive
{
  void *v2;
  void *v3;
  void *v4;
  int v5;
  NSObject *v6;
  _DWORD v8[2];
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  -[FMDFMIPSharedStateManager _readSharedInfo](self, "_readSharedInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "objectForKey:", CFSTR("fmipActive"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "BOOLValue");

    LogCategory_Unspecified();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v8[0] = 67109120;
      v8[1] = v5;
      _os_log_impl(&dword_1C9939000, v6, OS_LOG_TYPE_DEFAULT, "Shared file found. Returning FMiP active - %i", (uint8_t *)v8, 8u);
    }
  }
  else
  {
    LogCategory_Unspecified();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v8[0]) = 0;
      _os_log_impl(&dword_1C9939000, v6, OS_LOG_TYPE_DEFAULT, "Shared file not found. Returning FMiP active as - NO", (uint8_t *)v8, 2u);
    }
    LOBYTE(v5) = 0;
  }

  return v5;
}

- (unint64_t)lostModeType
{
  void *v2;
  void *v3;
  void *v4;
  unint64_t v5;
  NSObject *v6;
  int v8;
  unint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  -[FMDFMIPSharedStateManager _readSharedInfo](self, "_readSharedInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "objectForKey:", CFSTR("fmipLostModeType"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "integerValue");

    LogCategory_Unspecified();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v8 = 134217984;
      v9 = v5;
      _os_log_impl(&dword_1C9939000, v6, OS_LOG_TYPE_DEFAULT, "Shared file found. Returning lost mode type as - %lu", (uint8_t *)&v8, 0xCu);
    }
  }
  else
  {
    LogCategory_Unspecified();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v8) = 0;
      _os_log_impl(&dword_1C9939000, v6, OS_LOG_TYPE_DEFAULT, "Shared file not found. Returning lost mode type as - FMDLostModeTypeNone", (uint8_t *)&v8, 2u);
    }
    v5 = 0;
  }

  return v5;
}

- (id)_readSharedInfo
{
  void *v2;
  void *v3;
  void *v4;
  int v5;
  void *v6;

  -[FMDFMIPSharedStateManager _fmipSharedFileURL](self, "_fmipSharedFileURL");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2
    && (objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager"),
        v3 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v2, "path"),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        v5 = objc_msgSend(v3, "fileExistsAtPath:", v4),
        v4,
        v3,
        v5))
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithContentsOfURL:", v2);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)_writeSharedInfo:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  BOOL v15;
  id v17;

  v4 = a3;
  -[FMDFMIPSharedStateManager _fmipSharedFileURL](self, "_fmipSharedFileURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5 && (v17 = 0, objc_msgSend(v4, "writeToURL:error:", v5, &v17), (v6 = v17) != 0))
  {
    v7 = v6;
    LogCategory_Unspecified();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[FMDFMIPSharedStateManager _writeSharedInfo:].cold.1((uint64_t)v7, v8, v9, v10, v11, v12, v13, v14);

    v15 = 0;
  }
  else
  {
    v15 = 1;
  }

  return v15;
}

- (BOOL)_removeSharedInfo
{
  void *v2;
  void *v3;
  id v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v13;

  -[FMDFMIPSharedStateManager _fmipSharedFileURL](self, "_fmipSharedFileURL");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0;
  objc_msgSend(v3, "removeItemAtURL:error:", v2, &v13);
  v4 = v13;

  if (v4)
  {
    LogCategory_Unspecified();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      -[FMDFMIPSharedStateManager _removeSharedInfo].cold.1((uint64_t)v4, v5, v6, v7, v8, v9, v10, v11);

  }
  return v4 == 0;
}

- (id)_fmipSharedFileURL
{
  NSObject *stateManagerQueue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__1;
  v10 = __Block_byref_object_dispose__1;
  v11 = 0;
  stateManagerQueue = self->_stateManagerQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __47__FMDFMIPSharedStateManager__fmipSharedFileURL__block_invoke;
  v5[3] = &unk_1E829C6E8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(stateManagerQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __47__FMDFMIPSharedStateManager__fmipSharedFileURL__block_invoke(uint64_t a1)
{
  id *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;

  v2 = (id *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 32), "fmipSharedFileStaticURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    v4 = objc_alloc(MEMORY[0x1E0D20210]);
    v5 = (void *)objc_msgSend(v4, "initWithIdentifier:", FMDManagedSystemGroupContainerIdentifier);
    objc_msgSend(v5, "url");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "fm_preferencesPathURLForDomain:", CFSTR("FMIPStateInfo"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*v2, "setFmipSharedFileStaticURL:", v7);

    LogCategory_Unspecified();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      __47__FMDFMIPSharedStateManager__fmipSharedFileURL__block_invoke_cold_1(v2, v8);

  }
  objc_msgSend(*(id *)(a1 + 32), "fmipSharedFileStaticURL");
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v11 = *(void **)(v10 + 40);
  *(_QWORD *)(v10 + 40) = v9;

}

- (NSURL)fmipSharedFileStaticURL
{
  return (NSURL *)objc_getProperty(self, a2, 8, 1);
}

- (void)setFmipSharedFileStaticURL:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (OS_dispatch_queue)stateManagerQueue
{
  return self->_stateManagerQueue;
}

- (void)setStateManagerQueue:(id)a3
{
  objc_storeStrong((id *)&self->_stateManagerQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stateManagerQueue, 0);
  objc_storeStrong((id *)&self->_fmipSharedFileStaticURL, 0);
}

- (void)_writeSharedInfo:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1C9939000, a2, a3, "Could not write the shared file. Error - %@", a5, a6, a7, a8, 2u);
}

- (void)_removeSharedInfo
{
  OUTLINED_FUNCTION_0(&dword_1C9939000, a2, a3, "Could not remove the shared file. Error - %@", a5, a6, a7, a8, 2u);
}

void __47__FMDFMIPSharedStateManager__fmipSharedFileURL__block_invoke_cold_1(id *a1, NSObject *a2)
{
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*a1, "fmipSharedFileStaticURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 138412290;
  v5 = v3;
  _os_log_debug_impl(&dword_1C9939000, a2, OS_LOG_TYPE_DEBUG, "Container path URL %@", (uint8_t *)&v4, 0xCu);

}

@end
