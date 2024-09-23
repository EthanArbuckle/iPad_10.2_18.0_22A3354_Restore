@implementation CKNanoCryptographer

+ (id)sharedCryptographer
{
  if (sharedCryptographer_onceToken != -1)
    dispatch_once(&sharedCryptographer_onceToken, &__block_literal_global_33);
  return (id)sharedCryptographer___sharedInstance;
}

void __42__CKNanoCryptographer_sharedCryptographer__block_invoke()
{
  CKNanoCryptographer *v0;
  void *v1;

  v0 = objc_alloc_init(CKNanoCryptographer);
  v1 = (void *)sharedCryptographer___sharedInstance;
  sharedCryptographer___sharedInstance = (uint64_t)v0;

}

- (CKNanoCryptographer)init
{
  CKNanoCryptographer *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *dispatchQueue;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CKNanoCryptographer;
  v2 = -[CKNanoCryptographer init](&v6, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("com.apple.TextInput.crypto", 0);
    dispatchQueue = v2->_dispatchQueue;
    v2->_dispatchQueue = (OS_dispatch_queue *)v3;

  }
  return v2;
}

- (void)prewarmDeviceSalt
{
  NSObject *v3;
  _QWORD block[5];

  if (!self->_deviceSalt)
  {
    -[CKNanoCryptographer dispatchQueue](self, "dispatchQueue");
    v3 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __40__CKNanoCryptographer_prewarmDeviceSalt__block_invoke;
    block[3] = &unk_1E274A208;
    block[4] = self;
    dispatch_sync(v3, block);

  }
}

id __40__CKNanoCryptographer_prewarmDeviceSalt__block_invoke(uint64_t a1)
{
  return (id)objc_msgSend(*(id *)(a1 + 32), "deviceSalt");
}

- (NSData)deviceSalt
{
  NSObject *v3;
  NSData *deviceSalt;
  const __CFAllocator *v5;
  __CFDictionary *Mutable;
  OSStatus v7;
  NSData *v8;
  NSData *v9;
  const __CFString *v10;
  uint64_t v11;
  _BOOL8 v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  NSData *v21;
  NSData *v22;
  NSData *v23;
  OSStatus v24;
  int v25;
  NSData *v26;
  _BOOL8 v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  CFTypeRef result;
  _BYTE buf[22];
  __int16 v37;
  OSStatus v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  -[CKNanoCryptographer dispatchQueue](self, "dispatchQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  deviceSalt = self->_deviceSalt;
  if (!deviceSalt)
  {
    v5 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
    Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, 0, 0);
    CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E0CD6C98], (const void *)*MEMORY[0x1E0CD6CC0]);
    CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E0CD7018], (const void *)*MEMORY[0x1E0C9AE50]);
    CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E0CD68A0], (const void *)*MEMORY[0x1E0CD68E8]);
    CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E0CD6900], CFSTR("deviceSalt"));
    CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E0CD6898], CFSTR("com.apple.TextInput"));
    result = 0;
    v7 = SecItemCopyMatching(Mutable, &result);
    v8 = self->_deviceSalt;
    self->_deviceSalt = (NSData *)result;

    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      v9 = self->_deviceSalt;
      if (v9)
        v10 = CFSTR("NO");
      else
        v10 = CFSTR("YES");
      v11 = -[NSData length](v9, "length");
      *(_DWORD *)buf = 138412802;
      *(_QWORD *)&buf[4] = v10;
      *(_WORD *)&buf[12] = 2048;
      *(_QWORD *)&buf[14] = v11;
      v37 = 1024;
      v38 = v7;
      _os_log_impl(&dword_18DFCD000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "CKNanoCryptographer Received _deviceSalt is nil? %@, length? %lu, with status: %d", buf, 0x1Cu);
    }
    if (!self->_deviceSalt)
    {
      v13 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
      if (v13)
        -[CKNanoCryptographer deviceSalt].cold.3(v13, v14, v15, v16, v17, v18, v19, v20);
      memset(buf, 0, 20);
      arc4random_buf(buf, 0x14uLL);
      v21 = (NSData *)CFDataCreate(v5, buf, 20);
      v22 = self->_deviceSalt;
      self->_deviceSalt = v21;

      v23 = self->_deviceSalt;
      if (v23)
      {
        CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E0CD70D8], v23);
        v24 = SecItemAdd(Mutable, 0);
        if (v24)
        {
          v25 = v24;
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
            -[CKNanoCryptographer deviceSalt].cold.2(v25);
          v26 = self->_deviceSalt;
          self->_deviceSalt = 0;

        }
      }
      else
      {
        v27 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
        if (v27)
          -[CKNanoCryptographer deviceSalt].cold.1(v27, v28, v29, v30, v31, v32, v33, v34);
      }
    }
    CFRelease(Mutable);
    deviceSalt = self->_deviceSalt;
  }
  return deviceSalt;
}

- (id)stringDigestForName:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[5];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__13;
  v15 = __Block_byref_object_dispose__13;
  v16 = 0;
  if (objc_msgSend(v4, "length"))
  {
    -[CKNanoCryptographer dispatchQueue](self, "dispatchQueue");
    v5 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __43__CKNanoCryptographer_stringDigestForName___block_invoke;
    block[3] = &unk_1E274B950;
    block[4] = self;
    v9 = v4;
    v10 = &v11;
    dispatch_sync(v5, block);

  }
  v6 = (id)v12[5];
  _Block_object_dispose(&v11, 8);

  return v6;
}

void __43__CKNanoCryptographer_stringDigestForName___block_invoke(uint64_t a1)
{
  void *v2;
  int v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  const __CFString *v9;
  const __CFData *v10;
  const __CFData *StringDigest;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  _BOOL8 v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;

  objc_msgSend(*(id *)(a1 + 32), "cachedRecipientName");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", *(_QWORD *)(a1 + 40));

  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "cachedRecipientDigest");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "copy");
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v7 = *(void **)(v6 + 40);
    *(_QWORD *)(v6 + 40) = v5;

  }
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
  {
    objc_msgSend(*(id *)(a1 + 32), "deviceSalt");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      v9 = *(const __CFString **)(a1 + 40);
      objc_msgSend(*(id *)(a1 + 32), "deviceSalt");
      v10 = (const __CFData *)objc_claimAutoreleasedReturnValue();
      StringDigest = TICryptographerCreateStringDigest(v9, v10);
      v12 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      v13 = *(void **)(v12 + 40);
      *(_QWORD *)(v12 + 40) = StringDigest;

      v14 = *(_QWORD *)(a1 + 40);
      if (!v14 || !*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
      {
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
          __43__CKNanoCryptographer_stringDigestForName___block_invoke_cold_2(a1 + 48, (uint64_t *)(a1 + 40));
        v14 = *(_QWORD *)(a1 + 40);
      }
      objc_msgSend(*(id *)(a1 + 32), "setCachedRecipientName:", v14);
      objc_msgSend(*(id *)(a1 + 32), "setCachedRecipientDigest:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));
    }
    else
    {
      v15 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
      if (v15)
        __43__CKNanoCryptographer_stringDigestForName___block_invoke_cold_1(v15, v16, v17, v18, v19, v20, v21, v22);
    }
  }
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (NSString)cachedRecipientName
{
  return self->_cachedRecipientName;
}

- (void)setCachedRecipientName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)cachedRecipientDigest
{
  return self->_cachedRecipientDigest;
}

- (void)setCachedRecipientDigest:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedRecipientDigest, 0);
  objc_storeStrong((id *)&self->_cachedRecipientName, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_deviceSalt, 0);
}

- (void)deviceSalt
{
  OUTLINED_FUNCTION_0(&dword_18DFCD000, MEMORY[0x1E0C81028], a3, "CKNanoCryptographer -- device salt doesn't exist in the keychain", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_3();
}

void __43__CKNanoCryptographer_stringDigestForName___block_invoke_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_18DFCD000, MEMORY[0x1E0C81028], a3, "CKNanoCryptographer - Do not have deviceSalt when creating digest for name.", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_3();
}

void __43__CKNanoCryptographer_stringDigestForName___block_invoke_cold_2(uint64_t a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)a1 + 8) + 40);
  v3 = *a2;
  v4 = 138412546;
  v5 = v2;
  v6 = 2112;
  v7 = v3;
  _os_log_error_impl(&dword_18DFCD000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "CKNanoCryptographer - Something wrong when creating stringDigest: %@ for: %@", (uint8_t *)&v4, 0x16u);
}

@end
