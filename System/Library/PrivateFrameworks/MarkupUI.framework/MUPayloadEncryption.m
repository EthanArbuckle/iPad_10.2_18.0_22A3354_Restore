@implementation MUPayloadEncryption

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __37__MUPayloadEncryption_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken != -1)
    dispatch_once(&sharedInstance_onceToken, block);
  return (id)_sharedInstance;
}

void __37__MUPayloadEncryption_sharedInstance__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)_sharedInstance;
  _sharedInstance = (uint64_t)v1;

}

- (MUPayloadEncryption)init
{
  MUPayloadEncryption *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MUPayloadEncryption;
  result = -[MUPayloadEncryption init](&v3, sel_init);
  if (result)
    *(_WORD *)&result->_keyInitialized = 0;
  return result;
}

- (id)encryptData:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  size_t v7;
  void *v8;
  unsigned __int8 *key;
  id v10;
  const void *v11;
  id v12;
  CCCryptorStatus v13;
  id v14;
  void *dataOut;
  size_t v17;
  _QWORD __buf[3];

  __buf[2] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (!v4)
    goto LABEL_7;
  if (!self->_keyInitialized)
    -[MUPayloadEncryption initializeKey](self, "initializeKey");
  if (self->_haveKey)
  {
    dataOut = (void *)objc_msgSend(v4, "length");
    AKLog();
    generateRandomKey(__buf);
    objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", __buf, 16, dataOut);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v4, "length");
    v7 = objc_msgSend(v5, "length") + v6;
    objc_msgSend(MEMORY[0x24BDBCEC8], "dataWithCapacity:", (v7 + 31) & 0xFFFFFFFFFFFFFFF0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "appendData:", v5);
    objc_msgSend(v8, "appendData:", v4);
    objc_msgSend(v8, "setLength:", (v7 + 31) & 0xFFFFFFFFFFFFFFF0);
    v17 = 0;
    key = self->_key;
    v10 = objc_retainAutorelease(v8);
    v11 = (const void *)objc_msgSend(v10, "mutableBytes");
    v12 = objc_retainAutorelease(v10);
    v13 = CCCrypt(0, 0, 1u, key, 0x10uLL, 0, v11, v7, (void *)objc_msgSend(v12, "mutableBytes"), (v7 + 31) & 0xFFFFFFFFFFFFFFF0, &v17);
    if (v13)
    {
      NSLog(CFSTR("MUPayloadEncryption: Failed to encrypt with error code: %ld"), v13);
      v14 = 0;
    }
    else
    {
      objc_msgSend(v12, "length");
      AKLog();
      v14 = v12;
    }

  }
  else
  {
LABEL_7:
    AKLog();
    v14 = 0;
  }

  return v14;
}

- (id)decryptData:(id)a3
{
  id v4;
  void *v5;
  char *v6;
  id v7;
  CCCryptorStatus v8;
  void *v9;
  void *dataOut;
  size_t v12;

  v4 = a3;
  v5 = v4;
  if (!v4 || !objc_msgSend(v4, "length"))
    goto LABEL_8;
  if (!self->_keyInitialized)
    -[MUPayloadEncryption initializeKey](self, "initializeKey");
  if (self->_haveKey)
  {
    dataOut = (void *)objc_msgSend(v5, "length");
    AKLog();
    v12 = 0;
    v6 = (char *)malloc_type_malloc(objc_msgSend(v5, "length", dataOut), 0x29A200FFuLL);
    v7 = objc_retainAutorelease(v5);
    v8 = CCCrypt(1u, 0, 1u, self->_key, 0x10uLL, 0, (const void *)objc_msgSend(v7, "bytes"), objc_msgSend(v7, "length") - 16, v6, objc_msgSend(v7, "length") - 16, &v12);
    if (v8)
    {
      NSLog(CFSTR("MUPayloadEncryption: Failed to decrypt with error code: %ld"), v8);
      v9 = 0;
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", v6 + 16, v12 - 16);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "length");
      AKLog();
    }
    free(v6);
  }
  else
  {
LABEL_8:
    AKLog();
    v9 = 0;
  }

  return v9;
}

- (void)initializeKey
{
  MUPayloadEncryption *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  OSStatus v13;
  const __CFDictionary *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  OSStatus v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  const __CFDictionary *query;
  CFTypeRef cf;
  CFTypeRef result;
  _QWORD v29[8];
  _QWORD v30[8];
  _QWORD v31[7];
  _QWORD v32[9];

  v32[7] = *MEMORY[0x24BDAC8D0];
  v2 = self;
  objc_sync_enter(v2);
  if (!v2->_keyInitialized)
  {
    v2->_haveKey = 0;
    result = 0;
    v3 = *MEMORY[0x24BDE9220];
    v4 = *MEMORY[0x24BDE9230];
    v5 = *MEMORY[0x24BDE94C0];
    v31[0] = *MEMORY[0x24BDE9220];
    v31[1] = v5;
    v6 = *MEMORY[0x24BDBD270];
    v32[0] = v4;
    v32[1] = v6;
    v7 = *MEMORY[0x24BDE8F50];
    v8 = *MEMORY[0x24BDE9140];
    v31[2] = *MEMORY[0x24BDE8F50];
    v31[3] = v8;
    v32[2] = CFSTR("com.apple.Markup");
    v32[3] = v6;
    v9 = *MEMORY[0x24BDE9128];
    v10 = *MEMORY[0x24BDE8FA8];
    v31[4] = *MEMORY[0x24BDE9128];
    v31[5] = v10;
    v25 = v10;
    v32[4] = CFSTR("Sketch Service Privacy");
    v32[5] = CFSTR("Sketch Service");
    v11 = *MEMORY[0x24BDE93B0];
    v31[6] = *MEMORY[0x24BDE93B0];
    v12 = *MEMORY[0x24BDE93C0];
    v32[6] = *MEMORY[0x24BDE93C0];
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v32, v31, 7);
    query = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
    v13 = SecItemCopyMatching(query, &result);
    if (v13 == -25300)
    {
      generateRandomKey(v2->_key);
      objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", v2->_key, 16);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "base64EncodedDataWithOptions:", 0);
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      v29[0] = v3;
      v29[1] = v9;
      v30[0] = v4;
      v30[1] = CFSTR("Sketch Service Privacy");
      v29[2] = *MEMORY[0x24BDE90A0];
      v29[3] = v7;
      v30[2] = CFSTR("Sketch Service Privacy");
      v30[3] = CFSTR("com.apple.Markup");
      v30[4] = v6;
      v17 = *MEMORY[0x24BDE8FD8];
      v29[4] = v8;
      v29[5] = v17;
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "localizedStringForKey:value:table:", CFSTR("Used for the encryption of image edit state metadata for the Markup service. Deletion will make it impossible for Markup to modify annotations that were previously placed on an image using Markup."), &stru_24E5D4C60, CFSTR("MUPayloadEncryption"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v30[5] = v19;
      v30[6] = CFSTR("Sketch Service");
      v20 = *MEMORY[0x24BDE9550];
      v29[6] = v25;
      v29[7] = v20;
      v30[7] = v24;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v30, v29, 8);
      v14 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();

      cf = 0;
      v21 = SecItemAdd(v14, &cf);
      if (v21)
        NSLog(CFSTR("Couldn't add key to keychain! [osErr:%ld]"), v21);
      else
        v2->_haveKey = 1;
      if (cf)
        CFRelease(cf);
    }
    else
    {
      if (v13)
      {
        NSLog(CFSTR("SecItemCopyMatching() returned error %ld: %@"), v13, &stru_24E5D4C60);
LABEL_16:
        v2->_keyInitialized = 1;

        goto LABEL_17;
      }
      v24 = (void *)objc_msgSend((id)result, "mutableCopy");
      objc_msgSend(v24, "objectForKey:", v25);
      v14 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithDictionary:", query);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "removeObjectForKey:", v5);
      objc_msgSend(v15, "setObject:forKey:", v6, *MEMORY[0x24BDE94C8]);
      objc_msgSend(v15, "setObject:forKey:", v12, v11);
      objc_msgSend(v15, "setObject:forKey:", v4, v3);
      objc_msgSend(v15, "setValue:forKey:", v14, v25);
      cf = 0;
      if (!SecItemCopyMatching((CFDictionaryRef)v15, &cf))
      {
        v22 = (void *)cf;
        if (cf)
        {
          v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE50]), "initWithBase64EncodedData:options:", cf, 0);

          if (v23)
          {
            objc_msgSend(v23, "getBytes:length:", v2->_key, 16);
            v2->_haveKey = 1;

          }
        }
      }

    }
    goto LABEL_16;
  }
LABEL_17:
  objc_sync_exit(v2);

}

@end
