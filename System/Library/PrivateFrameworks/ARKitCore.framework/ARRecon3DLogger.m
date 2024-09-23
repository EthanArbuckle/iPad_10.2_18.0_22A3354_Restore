@implementation ARRecon3DLogger

- (ARRecon3DLogger)initWithInternalLogging:(BOOL)a3
{
  _BOOL4 v3;
  ARRecon3DLogger *v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  uint64_t v8;
  CV3DReconLoggingHandle *v9;
  unsigned __int8 v10;
  char v11;
  NSObject *v12;
  NSObject *v13;
  const char *v14;
  NSObject *v15;
  os_log_type_t v16;
  uint32_t v17;
  uint64_t v18;
  unsigned __int8 v19;
  char v20;
  NSObject *v21;
  NSObject *v22;
  const char *v23;
  NSObject *v24;
  os_log_type_t v25;
  uint32_t v26;
  uint64_t v27;
  ARRecon3DLogger *v28;
  _QWORD v30[2];
  void (*v31)(uint64_t);
  void *v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t v37;
  objc_super v38;
  uint8_t buf[4];
  uint64_t v40;
  uint64_t v41;

  v3 = a3;
  v41 = *MEMORY[0x1E0C80C00];
  v38.receiver = self;
  v38.super_class = (Class)ARRecon3DLogger;
  v4 = -[ARRecon3DLogger init](&v38, sel_init);
  if (!v4)
    goto LABEL_23;
  v34 = 0;
  v35 = &v34;
  v36 = 0x2020000000;
  v37 = 0;
  v30[0] = MEMORY[0x1E0C809B0];
  v30[1] = 3221225472;
  v31 = __43__ARRecon3DLogger_initWithInternalLogging___block_invoke;
  v32 = &unk_1E6672490;
  v33 = &v34;
  v5 = CV3DReconLoggingHandleCreate();
  v6 = v35[3];
  if (!v6)
  {
    v9 = (CV3DReconLoggingHandle *)v5;
    v10 = +[ARKitUserDefaults integerForKey:](ARKitUserDefaults, "integerForKey:", CFSTR("com.apple.arkit.sceneReconstruction.recon3DLoggingLevel.api"));
    v11 = CV3DReconLoggingHandleEnable();
    _ARLogGeneral_25();
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if ((v11 & 1) != 0)
    {
      if (!os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
        goto LABEL_12;
      *(_DWORD *)buf = 67109120;
      LODWORD(v40) = v10;
      v14 = "Recon3D API logging level enabled: %i";
      v15 = v13;
      v16 = OS_LOG_TYPE_INFO;
      v17 = 8;
    }
    else
    {
      if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        goto LABEL_12;
      v18 = v35[3];
      *(_DWORD *)buf = 138412290;
      v40 = v18;
      v14 = "Error enabling Recon3D API logging: %@";
      v15 = v13;
      v16 = OS_LOG_TYPE_ERROR;
      v17 = 12;
    }
    _os_log_impl(&dword_1B3A68000, v15, v16, v14, buf, v17);
LABEL_12:

    if (!v3)
    {
LABEL_20:
      v4->_loggingHandle = v9;
      goto LABEL_21;
    }
    v19 = +[ARKitUserDefaults integerForKey:](ARKitUserDefaults, "integerForKey:", CFSTR("com.apple.arkit.sceneReconstruction.recon3DLoggingLevel.internal"));
    v20 = CV3DReconLoggingHandleEnableInternal();
    _ARLogGeneral_25();
    v21 = objc_claimAutoreleasedReturnValue();
    v22 = v21;
    if ((v20 & 1) != 0)
    {
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109120;
        LODWORD(v40) = v19;
        v23 = "Recon3D internal logging level enabled: %i";
        v24 = v22;
        v25 = OS_LOG_TYPE_INFO;
        v26 = 8;
LABEL_18:
        _os_log_impl(&dword_1B3A68000, v24, v25, v23, buf, v26);
      }
    }
    else if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      v27 = v35[3];
      *(_DWORD *)buf = 138412290;
      v40 = v27;
      v23 = "Error enabling Recon3D internal logging: %@";
      v24 = v22;
      v25 = OS_LOG_TYPE_ERROR;
      v26 = 12;
      goto LABEL_18;
    }

    goto LABEL_20;
  }
  _ARLogGeneral_25();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    v8 = v35[3];
    *(_DWORD *)buf = 138412290;
    v40 = v8;
    _os_log_impl(&dword_1B3A68000, v7, OS_LOG_TYPE_ERROR, "Error creating recon logging handle: %@", buf, 0xCu);
  }

LABEL_21:
  v31((uint64_t)v30);
  _Block_object_dispose(&v34, 8);
  if (!v6)
  {
LABEL_23:
    v28 = v4;
    goto LABEL_24;
  }
  v28 = 0;
LABEL_24:

  return v28;
}

void __43__ARRecon3DLogger_initWithInternalLogging___block_invoke(uint64_t a1)
{
  const void *v1;

  v1 = *(const void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  if (v1)
    CFRelease(v1);
}

- (void)dealloc
{
  objc_super v3;

  CV3DReconLoggingHandleRelease();
  v3.receiver = self;
  v3.super_class = (Class)ARRecon3DLogger;
  -[ARRecon3DLogger dealloc](&v3, sel_dealloc);
}

@end
