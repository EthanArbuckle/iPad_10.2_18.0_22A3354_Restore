@implementation CRXFKeychainAccess

- (CRXFKeychainAccess)initWithDeviceModel:(id)a3
{
  id v4;
  CRXFKeychainAccess *v5;
  os_log_t v6;
  OS_os_log *log;
  uint64_t v8;
  NSString *deviceModel;
  __CFDictionary *Mutable;
  const void *v11;
  const void *v12;
  __CFDictionary *v13;
  const void *v14;
  const void *v15;
  const void *v16;
  const void *v17;
  const void *v18;
  const void *v19;
  const void *v20;
  const void *v21;
  __CFDictionary *v22;
  const void *v23;
  uint64_t v24;
  CRXUDispatchQueue *queue;
  void *v27;
  void *key;
  void *v29;
  id v30;
  int valuePtr;
  objc_super v32;

  v4 = a3;
  v32.receiver = self;
  v32.super_class = (Class)CRXFKeychainAccess;
  v5 = -[CRXFKeychainAccess init](&v32, sel_init);
  if (v5)
  {
    v6 = os_log_create(CRXFLoggingSubsystem, CRXFLoggingCategory);
    log = v5->_log;
    v5->_log = (OS_os_log *)v6;

    v8 = objc_msgSend(v4, "copy");
    deviceModel = v5->_deviceModel;
    v5->_deviceModel = (NSString *)v8;

    v5->_keyType = (__CFString *)*MEMORY[0x24BDE9060];
    valuePtr = 384;
    v5->_keySizeInBits = CFNumberCreate(0, kCFNumberIntType, &valuePtr);
    Mutable = CFDictionaryCreateMutable(0, 0, 0, 0);
    v11 = (const void *)*MEMORY[0x24BDE9050];
    key = (void *)*MEMORY[0x24BDE9050];
    CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x24BDE9050], v5->_keyType);
    v12 = (const void *)*MEMORY[0x24BDE9048];
    v27 = (void *)*MEMORY[0x24BDE9048];
    CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x24BDE9048], v5->_keySizeInBits);
    v5->_createQuery = CFDictionaryCreateCopy(0, Mutable);
    CFRelease(Mutable);
    v13 = CFDictionaryCreateMutable(0, 0, 0, 0);
    v14 = (const void *)*MEMORY[0x24BDE9220];
    v15 = (const void *)*MEMORY[0x24BDE9248];
    CFDictionarySetValue(v13, (const void *)*MEMORY[0x24BDE9220], (const void *)*MEMORY[0x24BDE9248]);
    v16 = (const void *)*MEMORY[0x24BDE9028];
    v17 = (const void *)*MEMORY[0x24BDE9030];
    CFDictionarySetValue(v13, (const void *)*MEMORY[0x24BDE9028], (const void *)*MEMORY[0x24BDE9030]);
    CFDictionarySetValue(v13, v11, v5->_keyType);
    CFDictionarySetValue(v13, v12, v5->_keySizeInBits);
    v30 = v4;
    v18 = (const void *)*MEMORY[0x24BDE9018];
    v19 = (const void *)*MEMORY[0x24BDBD270];
    CFDictionarySetValue(v13, (const void *)*MEMORY[0x24BDE9018], (const void *)*MEMORY[0x24BDBD270]);
    v20 = (const void *)*MEMORY[0x24BDE9140];
    CFDictionarySetValue(v13, (const void *)*MEMORY[0x24BDE9140], v19);
    v21 = (const void *)*MEMORY[0x24BDE8F50];
    CFDictionarySetValue(v13, (const void *)*MEMORY[0x24BDE8F50], CFSTR("com.apple.RealityDevice"));
    v29 = (void *)*MEMORY[0x24BDE94D8];
    CFDictionarySetValue(v13, (const void *)*MEMORY[0x24BDE94D8], v19);
    v5->_addQuery = CFDictionaryCreateCopy(0, v13);
    CFRelease(v13);
    v22 = CFDictionaryCreateMutable(0, 0, 0, 0);
    CFDictionarySetValue(v22, v14, v15);
    CFDictionarySetValue(v22, v16, v17);
    CFDictionarySetValue(v22, key, v5->_keyType);
    CFDictionarySetValue(v22, v27, v5->_keySizeInBits);
    v23 = v18;
    v4 = v30;
    CFDictionarySetValue(v22, v23, v19);
    CFDictionarySetValue(v22, v20, v19);
    CFDictionarySetValue(v22, v21, CFSTR("com.apple.RealityDevice"));
    v5->_deleteOrUpdateQuery = CFDictionaryCreateCopy(0, v22);
    CFDictionarySetValue(v22, (const void *)*MEMORY[0x24BDE94C0], v19);
    CFDictionarySetValue(v22, (const void *)*MEMORY[0x24BDE94C8], v19);
    CFDictionarySetValue(v22, v29, v19);
    CFDictionarySetValue(v22, (const void *)*MEMORY[0x24BDE93B0], (const void *)*MEMORY[0x24BDE93B8]);
    v5->_findAllQuery = CFDictionaryCreateCopy(0, v22);
    CFRelease(v22);
    +[CRXUDispatchQueue serialQueueWithName:](CRXUDispatchQueue, "serialQueueWithName:", CFSTR("CRXFKeychainAccessQueue"));
    v24 = objc_claimAutoreleasedReturnValue();
    queue = v5->_queue;
    v5->_queue = (CRXUDispatchQueue *)v24;

  }
  return v5;
}

- (void)dealloc
{
  objc_super v3;

  CFRelease(self->_keySizeInBits);
  CFRelease(self->_createQuery);
  CFRelease(self->_addQuery);
  CFRelease(self->_findAllQuery);
  CFRelease(self->_deleteOrUpdateQuery);
  v3.receiver = self;
  v3.super_class = (Class)CRXFKeychainAccess;
  -[CRXFKeychainAccess dealloc](&v3, sel_dealloc);
}

- (void)fetchASAKeysWithCompletion:(id)a3
{
  id v4;
  CRXUDispatchQueue *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __49__CRXFKeychainAccess_fetchASAKeysWithCompletion___block_invoke;
  v7[3] = &unk_250B042D0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  -[CRXUDispatchQueue dispatchAsync:](queue, "dispatchAsync:", v7);

}

void __49__CRXFKeychainAccess_fetchASAKeysWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  __int128 v3;
  CFIndex v4;
  const void *v5;
  const void *v6;
  const __CFDictionary *ValueAtIndex;
  void *Value;
  void *v9;
  CFTypeID v10;
  void *v11;
  __SecKey *v12;
  __SecKey *v13;
  void *v14;
  NSObject *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  CFTypeID v20;
  id v21;
  void *v22;
  id v23;
  CFTypeID v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  const void *v29;
  const void *v30;
  CRXFASAKey *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  NSObject *v36;
  void *v37;
  __int128 v38;
  uint64_t v39;
  void *v40;
  void *v41;
  void *key;
  CFErrorRef error;
  CFTypeRef result;
  void *v45;
  uint8_t buf[4];
  const char *v47;
  __int16 v48;
  int v49;
  __int16 v50;
  void *v51;
  uint64_t v52;

  v1 = a1;
  v52 = *MEMORY[0x24BDAC8D0];
  result = 0;
  v2 = SecItemCopyMatching(*(CFDictionaryRef *)(*(_QWORD *)(a1 + 32) + 32), &result);
  switch((_DWORD)v2)
  {
    case 0:
      objc_msgSend(MEMORY[0x24BDBCEB8], "array");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      if (CFArrayGetCount((CFArrayRef)result) < 1)
      {
LABEL_34:
        objc_msgSend(MEMORY[0x24BDD17C0], "sortDescriptorWithKey:ascending:", CFSTR("name"), 1, v38);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v45 = v32;
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v45, 1);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "sortUsingDescriptors:", v33);

        v34 = *(_QWORD *)(v1 + 40);
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithArray:", v40);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        (*(void (**)(uint64_t, void *, _QWORD))(v34 + 16))(v34, v35, 0);

        return;
      }
      v4 = 0;
      v5 = (const void *)*MEMORY[0x24BDE9550];
      v6 = (const void *)*MEMORY[0x24BDE9560];
      key = (void *)*MEMORY[0x24BDE90A0];
      v41 = (void *)*MEMORY[0x24BDE8FE0];
      *(_QWORD *)&v3 = 136315651;
      v38 = v3;
      v39 = v1;
      while (1)
      {
        ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex((CFArrayRef)result, v4);
        Value = (void *)CFDictionaryGetValue(ValueAtIndex, v5);
        if (Value)
        {
          v9 = Value;
          v10 = CFGetTypeID(Value);
          if (v10 == CFDataGetTypeID())
            v11 = v9;
          else
            v11 = 0;
        }
        else
        {
          v11 = 0;
        }
        v12 = (__SecKey *)CFDictionaryGetValue(ValueAtIndex, v6);
        v13 = SecKeyCopyPublicKey(v12);
        error = 0;
        SecKeyCopyExternalRepresentation(v13, &error);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (v14)
        {
          v15 = *(NSObject **)(*(_QWORD *)(v1 + 32) + 8);
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
          {
            v16 = v15;
            objc_msgSend(v14, "crxu_asHexString");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = v38;
            v47 = "-[CRXFKeychainAccess fetchASAKeysWithCompletion:]_block_invoke";
            v48 = 1024;
            v49 = 253;
            v50 = 2113;
            v51 = v17;
            _os_log_debug_impl(&dword_239FC4000, v16, OS_LOG_TYPE_DEBUG, "%s @%d: Public Key: %{private}@", buf, 0x1Cu);

          }
        }
        else
        {
          CFRelease(v13);
        }
        CFRelease(v12);
        v18 = (void *)CFDictionaryGetValue(ValueAtIndex, key);
        if (v18 && (v19 = v18, v20 = CFGetTypeID(v18), v20 == CFStringGetTypeID()))
          v21 = v19;
        else
          v21 = 0;
        v22 = (void *)CFDictionaryGetValue(ValueAtIndex, v41);
        v23 = v22;
        if (!v22)
          goto LABEL_24;
        v24 = CFGetTypeID(v22);
        if (v24 == CFDateGetTypeID())
          break;
        v23 = 0;
        if (v14)
        {
LABEL_27:
          if (v11)
          {
            if (v21)
            {
              v25 = objc_msgSend(v21, "rangeOfString:", CFSTR(":"));
              if (v25 != 0x7FFFFFFFFFFFFFFFLL)
              {
                v26 = v25;
                objc_msgSend(v21, "substringToIndex:", v25);
                v27 = (void *)objc_claimAutoreleasedReturnValue();
                if (objc_msgSend(v27, "isEqualToString:", *(_QWORD *)(*(_QWORD *)(v1 + 32) + 72)))
                {
                  objc_msgSend(v21, "substringFromIndex:", v26 + 1);
                  v28 = (void *)objc_claimAutoreleasedReturnValue();
                  v29 = v6;
                  v30 = v5;
                  v31 = -[CRXFASAKey initWithName:privateKey:publicKey:creationDate:]([CRXFASAKey alloc], "initWithName:privateKey:publicKey:creationDate:", v28, v11, v14, v23);
                  objc_msgSend(v40, "addObject:", v31);

                  v5 = v30;
                  v6 = v29;
                  v1 = v39;

                }
              }
            }
          }
        }
LABEL_33:

        if (CFArrayGetCount((CFArrayRef)result) <= ++v4)
          goto LABEL_34;
      }
      v23 = v23;
LABEL_24:
      if (v14)
        goto LABEL_27;
      goto LABEL_33;
    case 0xFFFF9D35:
      v36 = *(NSObject **)(*(_QWORD *)(v1 + 32) + 8);
      if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315394;
        v47 = "-[CRXFKeychainAccess fetchASAKeysWithCompletion:]_block_invoke";
        v48 = 1024;
        v49 = 223;
        _os_log_impl(&dword_239FC4000, v36, OS_LOG_TYPE_INFO, "%s @%d: Keychain is not available (syncing of user items may be disabled)", buf, 0x12u);
      }
      goto LABEL_37;
    case 0xFFFF9D2C:
      if (os_log_type_enabled(*(os_log_t *)(*(_QWORD *)(v1 + 32) + 8), OS_LOG_TYPE_DEBUG))
        __49__CRXFKeychainAccess_fetchASAKeysWithCompletion___block_invoke_cold_2();
LABEL_37:
      (*(void (**)(void))(*(_QWORD *)(v1 + 40) + 16))();
      return;
  }
  objc_msgSend(*(id *)(v1 + 32), "createErrorForStatus:fromFunction:", v2, CFSTR("SecItemCopyMatching"));
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(*(os_log_t *)(*(_QWORD *)(v1 + 32) + 8), OS_LOG_TYPE_ERROR))
    __49__CRXFKeychainAccess_fetchASAKeysWithCompletion___block_invoke_cold_1();
  (*(void (**)(void))(*(_QWORD *)(v1 + 40) + 16))();

}

- (id)insertASAKey:(id)a3 withName:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  __CFDictionary *MutableCopy;
  void *v12;
  uint64_t v13;
  CRXFASAKey *v14;
  CFTypeRef v15;
  __SecKey *v16;
  __SecKey *v17;
  CFDataRef v18;
  CFErrorRef v20;
  CFTypeRef result;

  v8 = a3;
  v9 = a4;
  -[CRXFKeychainAccess prefixedNameForName:](self, "prefixedNameForName:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  MutableCopy = CFDictionaryCreateMutableCopy(0, 0, self->_addQuery);
  CFDictionarySetValue(MutableCopy, (const void *)*MEMORY[0x24BDE9550], v8);
  CFDictionarySetValue(MutableCopy, (const void *)*MEMORY[0x24BDE90A0], v10);
  objc_msgSend(v10, "dataUsingEncoding:", 4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  CFDictionarySetValue(MutableCopy, (const void *)*MEMORY[0x24BDE8FB0], v12);
  result = 0;
  v13 = SecItemAdd(MutableCopy, &result);
  CFRelease(MutableCopy);
  if (!(_DWORD)v13)
  {
    v15 = result;
    if (result)
    {
      v20 = 0;
      v16 = SecKeyCopyPublicKey((SecKeyRef)result);
      if (!v16)
      {
        *a5 = 0;
        if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR))
          -[CRXFKeychainAccess insertASAKey:withName:error:].cold.1();
        goto LABEL_4;
      }
      v17 = v16;
      v18 = SecKeyCopyExternalRepresentation(v16, &v20);
      CFRelease(v17);
      if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_DEBUG))
        -[CRXFKeychainAccess insertASAKey:withName:error:].cold.2();
      CFRelease(v15);
    }
    else
    {
      v18 = 0;
    }
    v14 = -[CRXFASAKey initWithName:privateKey:publicKey:creationDate:]([CRXFASAKey alloc], "initWithName:privateKey:publicKey:creationDate:", v9, v8, v18, 0);

    goto LABEL_12;
  }
  -[CRXFKeychainAccess createErrorForStatus:fromFunction:](self, "createErrorForStatus:fromFunction:", v13, CFSTR("SecItemAdd"));
  *a5 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR))
    -[CRXFKeychainAccess insertASAKey:withName:error:].cold.3();
LABEL_4:
  v14 = 0;
LABEL_12:

  return v14;
}

- (BOOL)deleteASAKeyWithName:(id)a3 error:(id *)a4
{
  __CFDictionary *deleteOrUpdateQuery;
  id v7;
  __CFDictionary *MutableCopy;
  void *v9;
  void *v10;
  uint64_t v11;

  deleteOrUpdateQuery = self->_deleteOrUpdateQuery;
  v7 = a3;
  MutableCopy = CFDictionaryCreateMutableCopy(0, 0, deleteOrUpdateQuery);
  -[CRXFKeychainAccess prefixedNameForName:](self, "prefixedNameForName:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "dataUsingEncoding:", 4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  CFDictionarySetValue(MutableCopy, (const void *)*MEMORY[0x24BDE8FB0], v10);
  v11 = SecItemDelete(MutableCopy);
  CFRelease(MutableCopy);
  if ((_DWORD)v11)
  {
    -[CRXFKeychainAccess createErrorForStatus:fromFunction:](self, "createErrorForStatus:fromFunction:", v11, CFSTR("SecItemDelete"));
    *a4 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR))
      -[CRXFKeychainAccess deleteASAKeyWithName:error:].cold.1();
  }

  return (_DWORD)v11 == 0;
}

- (BOOL)deleteAllASAKeysWithError:(id *)a3
{
  uint64_t v5;
  _BOOL4 v6;

  v5 = SecItemDelete(self->_deleteOrUpdateQuery);
  if (!(_DWORD)v5)
  {
LABEL_5:
    LOBYTE(v6) = 1;
    return v6;
  }
  if ((_DWORD)v5 == -25300)
  {
    if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_DEBUG))
      -[CRXFKeychainAccess deleteAllASAKeysWithError:].cold.2();
    goto LABEL_5;
  }
  -[CRXFKeychainAccess createErrorForStatus:fromFunction:](self, "createErrorForStatus:fromFunction:", v5, CFSTR("SecItemDelete"));
  *a3 = (id)objc_claimAutoreleasedReturnValue();
  v6 = os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR);
  if (v6)
  {
    -[CRXFKeychainAccess deleteAllASAKeysWithError:].cold.1();
    LOBYTE(v6) = 0;
  }
  return v6;
}

- (id)createASAKeyWithError:(id *)a3
{
  __SecKey *v5;
  __SecKey *v6;
  CFDataRef v7;
  CFErrorRef error;

  error = 0;
  v5 = SecKeyCreateRandomKey(self->_createQuery, &error);
  if (v5)
  {
    v6 = v5;
    v7 = SecKeyCopyExternalRepresentation(v5, &error);
    if (!v7)
    {
      *a3 = error;
      if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR))
        -[CRXFKeychainAccess createASAKeyWithError:].cold.2();
    }
    CFRelease(v6);
  }
  else
  {
    *a3 = error;
    if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR))
      -[CRXFKeychainAccess createASAKeyWithError:].cold.1();
    v7 = 0;
  }
  return v7;
}

- (id)derivePublicKeyFromPrivateKey:(id)a3 error:(id *)a4
{
  const __CFData *v6;
  __CFDictionary *Mutable;
  __SecKey *v8;
  __SecKey *v10;
  __SecKey *v11;
  CFDataRef v12;
  CFDataRef v13;
  CFErrorRef error;

  v6 = (const __CFData *)a3;
  Mutable = CFDictionaryCreateMutable(0, 0, 0, 0);
  CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x24BDE9050], self->_keyType);
  CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x24BDE9028], (const void *)*MEMORY[0x24BDE9030]);
  error = 0;
  v8 = SecKeyCreateWithData(v6, Mutable, &error);

  CFRelease(Mutable);
  if (error)
  {
    *a4 = error;
    return 0;
  }
  v10 = SecKeyCopyPublicKey(v8);
  if (!v10)
  {
    v12 = 0;
LABEL_9:
    v12 = v12;
    v13 = v12;
    goto LABEL_10;
  }
  v11 = v10;
  v12 = SecKeyCopyExternalRepresentation(v10, &error);
  if (!error)
  {
    CFRelease(v11);
    if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_DEBUG))
      -[CRXFKeychainAccess derivePublicKeyFromPrivateKey:error:].cold.1();
    goto LABEL_9;
  }
  v13 = 0;
  *a4 = error;
LABEL_10:

  return v13;
}

- (id)createErrorForStatus:(int)a3 fromFunction:(id)a4
{
  id v5;
  __CFString *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  _QWORD v12[2];
  _QWORD v13[3];

  v13[2] = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  v6 = (__CFString *)SecCopyErrorMessageString(a3, 0);
  v7 = (void *)MEMORY[0x24BDD1540];
  v8 = *MEMORY[0x24BDD1100];
  v12[0] = *MEMORY[0x24BDD0FC8];
  v12[1] = CFSTR("keychainFunction");
  v13[0] = v6;
  v13[1] = v5;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v13, v12, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "errorWithDomain:code:userInfo:", v8, a3, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)prefixedNameForName:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@:%@"), self->_deviceModel, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceModel, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_log, 0);
}

void __49__CRXFKeychainAccess_fetchASAKeysWithCompletion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_2_0(&dword_239FC4000, v0, v1, "%s @%d: Keychain error: %{public}@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_3();
}

void __49__CRXFKeychainAccess_fetchASAKeysWithCompletion___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_7(&dword_239FC4000, v0, v1, "%s @%d: SecItemCopyMatching() found no matching keys", v2, v3, v4, v5, 2u);
}

- (void)insertASAKey:withName:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_5(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_2_0(&dword_239FC4000, v0, v1, "%s @%d: Error deriving public key: %{public}@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_3();
}

- (void)insertASAKey:withName:error:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_6(&dword_239FC4000, v0, v1, "%s @%d: public key: %{private}@", v2, v3, v4, v5, 3u);
  OUTLINED_FUNCTION_3();
}

- (void)insertASAKey:withName:error:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_5(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_2_0(&dword_239FC4000, v0, v1, "%s @%d: Keychain error: %{public}@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_3();
}

- (void)deleteASAKeyWithName:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_5(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_2_0(&dword_239FC4000, v0, v1, "%s @%d: Keychain error: %{public}@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_3();
}

- (void)deleteAllASAKeysWithError:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_5(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_2_0(&dword_239FC4000, v0, v1, "%s @%d: Keychain error: %{public}@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_3();
}

- (void)deleteAllASAKeysWithError:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_7(&dword_239FC4000, v0, v1, "%s @%d: SecItemDelete() found no matching keys", v2, v3, v4, v5, 2u);
}

- (void)createASAKeyWithError:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_5(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_2_0(&dword_239FC4000, v0, v1, "%s @%d: Keychain error: %{public}@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_3();
}

- (void)createASAKeyWithError:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_5(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_2_0(&dword_239FC4000, v0, v1, "%s @%d: Keychain error: %{public}@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_3();
}

- (void)derivePublicKeyFromPrivateKey:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_6(&dword_239FC4000, v0, v1, "%s @%d: public key: %{private}@", v2, v3, v4, v5, 3u);
  OUTLINED_FUNCTION_3();
}

@end
