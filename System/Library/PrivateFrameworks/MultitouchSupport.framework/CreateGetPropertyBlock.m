@implementation CreateGetPropertyBlock

id __mt_CreateGetPropertyBlock_block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  char v5;
  id v6;
  id v7;
  uint64_t v8;
  NSObject *v9;
  int v10;
  uint64_t v11;
  const char *v12;
  NSObject *v13;
  uint32_t v14;
  id v15;
  NSObject *v16;
  void *v17;
  uint64_t v18;
  int v20;
  NSObject *v21;
  void *v22;
  id v23;
  id v24;
  uint8_t buf[4];
  id v26;
  __int16 v27;
  _BYTE v28[18];
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v23 = 0;
  v24 = 0;
  v5 = objc_msgSend(v4, "getProperty:property:options:error:", v3, &v24, 0, &v23);
  v6 = v24;
  v7 = v23;
  v8 = *(_QWORD *)(a1 + 40);
  if ((v5 & 1) != 0)
  {
    if (v8)
    {
      if (*(_BYTE *)(v8 + 133))
        mt_CachePropertiesForDevice(v8);
      MTLoggingFramework();
      v9 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
        goto LABEL_8;
      v10 = objc_msgSend(v6, "length");
      v11 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 64);
      *(_DWORD *)buf = 138543874;
      v26 = v3;
      v27 = 1024;
      *(_DWORD *)v28 = v10;
      *(_WORD *)&v28[4] = 2048;
      *(_QWORD *)&v28[6] = v11;
      v12 = "Getting property '%{public}@' from bootloader: %u bytes (deviceID 0x%llX)";
      v13 = v9;
      v14 = 28;
    }
    else
    {
      MTLoggingFramework();
      v9 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
        goto LABEL_8;
      v20 = objc_msgSend(v6, "length");
      *(_DWORD *)buf = 138543618;
      v26 = v3;
      v27 = 1024;
      *(_DWORD *)v28 = v20;
      v12 = "Getting property '%{public}@' from bootloader: %u bytes";
      v13 = v9;
      v14 = 18;
    }
    _os_log_impl(&dword_21A1DE000, v13, OS_LOG_TYPE_DEBUG, v12, buf, v14);
LABEL_8:

    v15 = v6;
    goto LABEL_16;
  }
  if (v8)
  {
    if (*(_BYTE *)(v8 + 133))
      mt_CachePropertiesForDevice(v8);
    MTLoggingFramework();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v7, "localizedDescription");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 64);
      *(_DWORD *)buf = 138543874;
      v26 = v3;
      v27 = 2114;
      *(_QWORD *)v28 = v17;
      *(_WORD *)&v28[8] = 2048;
      *(_QWORD *)&v28[10] = v18;
      _os_log_impl(&dword_21A1DE000, v16, OS_LOG_TYPE_ERROR, "Error getting property '%{public}@' from bootloader: %{public}@ (deviceID 0x%llX)", buf, 0x20u);

    }
  }
  else
  {
    MTLoggingFramework();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v7, "localizedDescription");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v26 = v3;
      v27 = 2114;
      *(_QWORD *)v28 = v22;
      _os_log_impl(&dword_21A1DE000, v21, OS_LOG_TYPE_ERROR, "Error getting property '%{public}@' from bootloader: %{public}@", buf, 0x16u);

    }
  }
  v15 = 0;
LABEL_16:

  return v15;
}

@end
