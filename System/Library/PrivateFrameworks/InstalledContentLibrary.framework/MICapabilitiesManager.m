@implementation MICapabilitiesManager

+ (id)defaultManager
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __39__MICapabilitiesManager_defaultManager__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (defaultManager_onceToken_0 != -1)
    dispatch_once(&defaultManager_onceToken_0, block);
  return (id)defaultManager_defaultManager_0;
}

void __39__MICapabilitiesManager_defaultManager__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init((Class)objc_opt_class());
  v1 = (void *)defaultManager_defaultManager_0;
  defaultManager_defaultManager_0 = (uint64_t)v0;

}

- (id)checkCapabilities:(id)a3 withOptions:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  int v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  const void *v21;
  void *v22;
  id v23;
  id v24;
  uint64_t v25;
  void *v26;
  const void *v27;
  const void *v28;
  void *v29;
  void *v30;
  uint64_t *v31;
  const __CFString **v32;
  uint64_t v33;
  uint64_t v35;
  uint64_t v36;
  id v37;
  id *v38;
  void *v39;
  id v40;
  const __CFString *v41;
  uint64_t v42;
  _QWORD v43[2];
  _QWORD v44[2];
  _QWORD v45[3];
  _QWORD v46[5];

  v46[3] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = (void *)objc_opt_new();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v40 = v7;
    v10 = 0;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      _CreateAndLogError((uint64_t)"-[MICapabilitiesManager checkCapabilities:withOptions:error:]", 65, CFSTR("MIInstallerErrorDomain"), 66, 0, 0, CFSTR("UIRequiredDeviceCapabilties in Info.plist does not have an array or dictionary value."), v11, v35);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = 0;
      v10 = 0;
      v40 = 0;
      if (!a5)
        goto LABEL_47;
      goto LABEL_45;
    }
    objc_msgSend(v7, "allKeys");
    v40 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "allValues");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v37 = v7;
  v38 = a5;
  v39 = v9;
  if (v8)
  {
    objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x1E0C9AE78]);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12
      && (+[MIDaemonConfiguration sharedInstance](MIDaemonConfiguration, "sharedInstance"),
          v13 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v13, "installationBlacklist"),
          v14 = (void *)objc_claimAutoreleasedReturnValue(),
          v15 = objc_msgSend(v14, "containsObject:", v12),
          v14,
          v13,
          v15))
    {
      if (!gLogHandle || *(int *)(gLogHandle + 44) >= 5)
      {
        v35 = (uint64_t)v12;
        MOLogWrite();
      }
      v16 = 1;
    }
    else
    {
      v16 = 0;
    }

  }
  else
  {
    v16 = 0;
  }
  v17 = objc_msgSend(v40, "count", v35);
  if (!v17)
  {
LABEL_34:
    if (v16)
    {
      v45[0] = CFSTR("CapabilitiesMatch");
      v45[1] = CFSTR("MismatchedCapabilities");
      v9 = v39;
      v46[0] = MEMORY[0x1E0C9AAA0];
      v46[1] = v39;
      v45[2] = CFSTR("AppBlacklisted");
      v46[2] = MEMORY[0x1E0C9AAB0];
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v46, v45, 3);
      v24 = (id)objc_claimAutoreleasedReturnValue();
      v29 = 0;
      v7 = v37;
      a5 = v38;
      if (!v38)
        goto LABEL_47;
    }
    else
    {
      v9 = v39;
      a5 = v38;
      if (objc_msgSend(v39, "count"))
      {
        v43[0] = CFSTR("CapabilitiesMatch");
        v43[1] = CFSTR("MismatchedCapabilities");
        v44[0] = MEMORY[0x1E0C9AAA0];
        v44[1] = v39;
        v30 = (void *)MEMORY[0x1E0C99D80];
        v31 = v44;
        v32 = (const __CFString **)v43;
        v33 = 2;
      }
      else
      {
        v41 = CFSTR("CapabilitiesMatch");
        v42 = MEMORY[0x1E0C9AAB0];
        v30 = (void *)MEMORY[0x1E0C99D80];
        v31 = &v42;
        v32 = &v41;
        v33 = 1;
      }
      objc_msgSend(v30, "dictionaryWithObjects:forKeys:count:", v31, v32, v33);
      v24 = (id)objc_claimAutoreleasedReturnValue();
      v29 = 0;
      v7 = v37;
      if (!v38)
        goto LABEL_47;
    }
LABEL_45:
    if (!v24)
      *a5 = objc_retainAutorelease(v29);
    goto LABEL_47;
  }
  v18 = v17;
  v19 = 0;
  v20 = (void *)*MEMORY[0x1E0C9AE50];
  v21 = (const void *)*MEMORY[0x1E0C9AE40];
  while (1)
  {
    objc_msgSend(v40, "objectAtIndexedSubscript:", v19);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v23 = v22;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v24 = v23;
    else
      v24 = 0;

    v26 = v20;
    if (v10)
    {
      objc_msgSend(v10, "objectAtIndexedSubscript:", v19);
      v26 = (void *)objc_claimAutoreleasedReturnValue();

    }
    if (!v24)
      break;
    if (v16)
    {
      if (CFEqual(v20, v26))
        v27 = v21;
      else
        v27 = v20;
      objc_msgSend(v39, "setObject:forKeyedSubscript:", v27, v24);
    }
    else
    {
      v28 = (const void *)MGCopyAnswer();
      if (!v28)
      {
        CFRetain(v21);
        v28 = v21;
      }
      if (!CFEqual(v28, v26))
        objc_msgSend(v39, "setObject:forKeyedSubscript:", v28, v24);
      CFRelease(v28);
    }

    if (v18 == ++v19)
      goto LABEL_34;
  }
  _CreateAndLogError((uint64_t)"-[MICapabilitiesManager checkCapabilities:withOptions:error:]", 92, CFSTR("MIInstallerErrorDomain"), 66, 0, 0, CFSTR("UIRequiredDeviceCapabilties in Info.plist has a key that is not a string"), v25, v36);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v37;
  a5 = v38;
  v9 = v39;
  if (v38)
    goto LABEL_45;
LABEL_47:

  return v24;
}

@end
