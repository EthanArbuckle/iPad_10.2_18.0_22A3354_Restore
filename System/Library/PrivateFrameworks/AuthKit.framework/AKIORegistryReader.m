@implementation AKIORegistryReader

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_4 != -1)
    dispatch_once(&sharedInstance_onceToken_4, &__block_literal_global_54);
  return (id)sharedInstance_reader;
}

void __36__AKIORegistryReader_sharedInstance__block_invoke()
{
  AKIORegistryReader *v0;
  void *v1;

  v0 = objc_alloc_init(AKIORegistryReader);
  v1 = (void *)sharedInstance_reader;
  sharedInstance_reader = (uint64_t)v0;

}

- (id)copyDeviceTreeProperty:(id)a3 key:(id)a4
{
  __CFString *v5;
  __CFString *v6;
  CFTypeRef CFProperty;
  io_registry_entry_t v8;
  io_object_t v9;

  v5 = (__CFString *)a4;
  v6 = v5;
  CFProperty = 0;
  if (a3 && v5)
  {
    v8 = IORegistryEntryFromPath(*MEMORY[0x1E0CBBAA8], (const char *)objc_msgSend(objc_retainAutorelease(a3), "fileSystemRepresentation"));
    if (v8)
    {
      v9 = v8;
      CFProperty = IORegistryEntryCreateCFProperty(v8, v6, 0, 0);
      IOObjectRelease(v9);
    }
    else
    {
      CFProperty = 0;
    }
  }

  return (id)CFProperty;
}

- (id)copyDeviceTreeInt:(id)a3 key:(id)a4 defaultValue:(int)a5
{
  uint64_t v5;
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  id v15;
  unsigned int v17;

  v5 = *(_QWORD *)&a5;
  v8 = a3;
  v9 = a4;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  v17 = v5;
  if (v8 && v9)
  {
    v12 = -[AKIORegistryReader copyDeviceTreeProperty:key:](self, "copyDeviceTreeProperty:key:", v8, v9);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
        goto LABEL_11;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      if (objc_msgSend(v12, "length") != 4)
      {
LABEL_11:
        v14 = v11;

        goto LABEL_12;
      }
      objc_msgSend(v12, "getBytes:length:", &v17, 4);
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v17);
      v13 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v13 = v12;
    }
    v15 = v13;

    v11 = v15;
    goto LABEL_11;
  }
  v14 = v10;
LABEL_12:

  return v14;
}

- (id)sfrManifest
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __33__AKIORegistryReader_sfrManifest__block_invoke;
  block[3] = &unk_1E2E5E1D0;
  block[4] = self;
  if (sfrManifest_onceToken != -1)
    dispatch_once(&sfrManifest_onceToken, block);
  return (id)sfrManifest_sfrManifest;
}

void __33__AKIORegistryReader_sfrManifest__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "IODeviceTree");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingString:", CFSTR(":/chosen/iBoot"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v2, "copyDeviceTreeInt:key:defaultValue:", v4, CFSTR("sfr-manifest-size"), 0);

  if (!v5 || !objc_msgSend(v5, "unsignedIntValue"))
  {
    _AKLogSystem();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      __33__AKIORegistryReader_sfrManifest__block_invoke_cold_1(v13, v21, v22, v23, v24, v25, v26, v27);
    goto LABEL_12;
  }
  v6 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "IODeviceTree");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringByAppendingString:", CFSTR(":/chosen/iBoot"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v6, "copyDeviceTreeProperty:key:", v8, CFSTR("sfr-manifest-data"));
  v10 = (void *)sfrManifest_sfrManifest;
  sfrManifest_sfrManifest = v9;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0 || !objc_msgSend((id)sfrManifest_sfrManifest, "length"))
  {
    _AKLogSystem();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      __33__AKIORegistryReader_sfrManifest__block_invoke_cold_2(v13, v28, v29, v30, v31, v32, v33, v34);
    goto LABEL_12;
  }
  objc_msgSend((id)sfrManifest_sfrManifest, "subdataWithRange:", 0, objc_msgSend(v5, "unsignedIntValue"));
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = (void *)sfrManifest_sfrManifest;
  sfrManifest_sfrManifest = v11;

  if (!sfrManifest_sfrManifest)
  {
    _AKLogSystem();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      __33__AKIORegistryReader_sfrManifest__block_invoke_cold_3(v13, v14, v15, v16, v17, v18, v19, v20);
LABEL_12:

  }
}

void __33__AKIORegistryReader_sfrManifest__block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_19202F000, a1, a3, "SFRManifest length is 0", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_7();
}

void __33__AKIORegistryReader_sfrManifest__block_invoke_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_19202F000, a1, a3, "Either SFRManifest is not NSData type or its length is 0", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_7();
}

void __33__AKIORegistryReader_sfrManifest__block_invoke_cold_3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_19202F000, a1, a3, "Retrieved SFRManifest is nil", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_7();
}

@end
