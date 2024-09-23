@implementation MDKeyRing

- (id)createRandomUUID
{
  uint64_t v2;
  _QWORD v4[3];

  v2 = 0;
  v4[2] = *MEMORY[0x24BDAC8D0];
  v4[0] = 0;
  v4[1] = 0;
  do
  {
    *(_DWORD *)((char *)v4 + v2) = arc4random();
    v2 += 4;
  }
  while (v2 != 16);
  return (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDBytes:", v4);
}

- (__CFUUID)_createKeyUUIDWithAccount:(id)a3 password:(id)a4
{
  const char *v6;
  int v7;
  const char *v8;
  CC_LONG v9;
  CC_MD5_CTX v11;
  CFUUIDBytes md;

  *(_QWORD *)&md.byte0 = 0;
  *(_QWORD *)&md.byte8 = 0;
  memset(&v11, 0, sizeof(v11));
  CC_MD5_Init(&v11);
  CC_MD5_Update(&v11, "obvious", 8u);
  v6 = (const char *)objc_msgSend(a3, "UTF8String");
  v7 = strlen(v6);
  CC_MD5_Update(&v11, v6, v7 + 1);
  v8 = (const char *)objc_msgSend(a4, "UTF8String");
  v9 = strlen(v8);
  CC_MD5_Update(&v11, v8, v9);
  CC_MD5_Final(&md.byte0, &v11);
  md.byte6 = md.byte6 & 0xF | 0x30;
  md.byte8 = md.byte8 & 0x3F | 0x80;
  return CFUUIDCreateFromUUIDBytes((CFAllocatorRef)*MEMORY[0x24BDBD240], md);
}

- (MDKeyRing)init
{
  MDKeyRing *v2;
  id v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD v9[6];
  _QWORD v10[6];
  objc_super v11;
  CFTypeRef result;

  v11.receiver = self;
  v11.super_class = (Class)MDKeyRing;
  result = 0;
  v2 = -[MDKeyRing init](&v11, sel_init);
  if (v2)
  {
    v2->_keysByUUID = (NSMutableDictionary *)objc_opt_new();
    v3 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    objc_msgSend(v3, "setObject:forKey:", *MEMORY[0x24BDE9248], *MEMORY[0x24BDE9220]);
    objc_msgSend(v3, "setObject:forKey:", *MEMORY[0x24BDE93B8], *MEMORY[0x24BDE93B0]);
    objc_msgSend(v3, "setObject:forKey:", *MEMORY[0x24BDBD270], *MEMORY[0x24BDE94C0]);
    addStandardKeychainAttributesToDictionary(v3);
    v4 = SecItemCopyMatching((CFDictionaryRef)v3, &result);

    v5 = (void *)result;
    if (result)
    {
      if ((_DWORD)v4)
      {
        NSLog(CFSTR("SecItemCopyMatching osErr:%d"), v4);
        v5 = (void *)result;
      }
      v6 = objc_msgSend(v5, "indexesOfObjectsPassingTest:", &__block_literal_global_1);
      v10[0] = 0;
      v10[1] = v10;
      v10[2] = 0x3052000000;
      v10[3] = __Block_byref_object_copy_;
      v10[4] = __Block_byref_object_dispose_;
      v10[5] = 0;
      v9[0] = MEMORY[0x24BDAC760];
      v9[1] = 3221225472;
      v9[2] = __17__MDKeyRing_init__block_invoke_8;
      v9[3] = &unk_2508E1108;
      v9[4] = v2;
      v9[5] = v10;
      objc_msgSend((id)result, "enumerateObjectsAtIndexes:options:usingBlock:", v6, 0, v9);
      CFRelease(result);
      result = 0;
      _Block_object_dispose(v10, 8);
    }
    if (!v2->_designatedKeyUUID)
    {
      v7 = -[MDKeyRing createRandomUUID](v2, "createRandomUUID");
      v2->_designatedKeyUUID = (NSUUID *)v7;
      -[MDKeyRing fetchKeyFromKeychain:](v2, "fetchKeyFromKeychain:", v7);
    }
    v2->_queue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.metadata.MDRemoteKeyRing", 0);
  }
  if (result)
    CFRelease(result);
  return v2;
}

uint64_t __17__MDKeyRing_init__block_invoke(uint64_t a1, void *a2)
{
  void *v2;

  v2 = (void *)objc_msgSend(a2, "objectForKey:", *MEMORY[0x24BDE90A0]);
  if (v2 == (void *)*MEMORY[0x24BDBD430])
    v2 = 0;
  return objc_msgSend(v2, "hasPrefix:", CFSTR("Spotlight Metadata Privacy"));
}

void __17__MDKeyRing_init__block_invoke_8(uint64_t a1, void *a2)
{
  uint64_t v4;
  uint64_t v5;
  BOOL v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;

  v4 = objc_msgSend(a2, "objectForKey:", *MEMORY[0x24BDE8FB0]);
  v5 = *MEMORY[0x24BDBD430];
  if (v4)
    v6 = v4 == v5;
  else
    v6 = 1;
  if (!v6)
  {
    v7 = (void *)v4;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v8 = objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDString:", v7);
      goto LABEL_10;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      if (objc_msgSend(v7, "length") != 16)
      {
        v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithData:encoding:", v7, 4);
        v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDString:", v10);

        goto LABEL_11;
      }
      v8 = objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDBytes:", objc_msgSend(v7, "bytes"));
LABEL_10:
      v9 = (void *)v8;
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "setObject:forKey:", v5, v8);
LABEL_11:
      updateDesignatedUUIDIfNewer(*(_QWORD *)(a1 + 32), a2, v9, (id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
    }
  }
}

+ (id)defaultKeyRing
{
  id result;
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __27__MDKeyRing_defaultKeyRing__block_invoke;
  block[3] = &unk_2508E1130;
  block[4] = a1;
  if (defaultKeyRing_once != -1)
    dispatch_once(&defaultKeyRing_once, block);
  result = (id)defaultKeyRing_sKeyRing;
  if (!defaultKeyRing_sKeyRing)
    return objc_alloc_init((Class)a1);
  return result;
}

id __27__MDKeyRing_defaultKeyRing__block_invoke(uint64_t a1)
{
  id result;

  result = objc_alloc_init(*(Class *)(a1 + 32));
  defaultKeyRing_sKeyRing = (uint64_t)result;
  return result;
}

- (void)dealloc
{
  NSUUID *designatedKeyUUID;
  NSMutableDictionary *keysByUUID;
  NSObject *queue;
  objc_super v6;

  designatedKeyUUID = self->_designatedKeyUUID;
  if (designatedKeyUUID)

  keysByUUID = self->_keysByUUID;
  if (keysByUUID)

  queue = self->_queue;
  if (queue)
    dispatch_release(queue);
  v6.receiver = self;
  v6.super_class = (Class)MDKeyRing;
  -[MDKeyRing dealloc](&v6, sel_dealloc);
}

- (id)allKeyUUIDs
{
  NSObject *queue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  void (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  uint64_t v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3052000000;
  v9 = __Block_byref_object_copy_;
  v10 = __Block_byref_object_dispose_;
  v11 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __24__MDKeyRing_allKeyUUIDs__block_invoke;
  v5[3] = &unk_2508E1158;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

id __24__MDKeyRing_allKeyUUIDs__block_invoke(uint64_t a1)
{
  id result;

  result = (id)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "allKeys");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (id)copyDesignatedKeyUUID
{
  return self->_designatedKeyUUID;
}

- (__SecKey)getKey:(id)a3
{
  NSObject *queue;
  __SecKey *v4;
  _QWORD block[7];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;

  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  if (a3)
  {
    queue = self->_queue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __20__MDKeyRing_getKey___block_invoke;
    block[3] = &unk_2508E1180;
    block[5] = a3;
    block[6] = &v7;
    block[4] = self;
    dispatch_sync(queue, block);
    v4 = (__SecKey *)v8[3];
  }
  else
  {
    v4 = 0;
  }
  _Block_object_dispose(&v7, 8);
  return v4;
}

void __20__MDKeyRing_getKey___block_invoke(uint64_t a1)
{
  void *v2;
  const __CFDictionary *v3;
  uint64_t v4;
  _QWORD v5[3];

  v5[2] = *MEMORY[0x24BDAC8D0];
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "objectForKey:", *(_QWORD *)(a1 + 40));
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) == *MEMORY[0x24BDBD430])
  {
    v5[0] = 0;
    v5[1] = 0;
    objc_msgSend(*(id *)(a1 + 40), "getUUIDBytes:", v5);
    v2 = (void *)objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", v5, 16);
    v3 = (const __CFDictionary *)objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjectsAndKeys:", *MEMORY[0x24BDE93C0], *MEMORY[0x24BDE93B0], *MEMORY[0x24BDE9248], *MEMORY[0x24BDE9220], *MEMORY[0x24BDE9040], *MEMORY[0x24BDE9028], v2, *MEMORY[0x24BDE8FB0], *MEMORY[0x24BDBD270], *MEMORY[0x24BDE94D8], 0, 0);

    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 0;
    SecItemCopyMatching(v3, (CFTypeRef *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24));
    v4 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
    if (v4)
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "setObject:forKey:", v4, *(_QWORD *)(a1 + 40));
      CFRelease(*(CFTypeRef *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24));
    }
  }
}

- (void)scheduleAccessToKey:(__CFUUID *)a3 onQueue:(id)global_queue usingBlock:(id)a5
{
  qos_class_t v8;
  _QWORD block[7];

  if (!global_queue)
  {
    v8 = qos_class_self();
    global_queue = dispatch_get_global_queue(v8, 0);
  }
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __52__MDKeyRing_scheduleAccessToKey_onQueue_usingBlock___block_invoke;
  block[3] = &unk_2508E11A8;
  block[5] = a5;
  block[6] = a3;
  block[4] = self;
  dispatch_async((dispatch_queue_t)global_queue, block);
}

uint64_t __52__MDKeyRing_scheduleAccessToKey_onQueue_usingBlock___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "getKey:", *(_QWORD *)(a1 + 48));
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (int)restoreFromExistingKey:(id)a3
{
  const __CFDictionary *v5;
  OSStatus v6;
  NSMutableDictionary *v7;
  uint64_t v8;
  void *v9;
  CFTypeRef v10;
  CFTypeRef result;

  result = 0;
  v5 = -[MDKeyRing copyPrivateKeyQuery:](self, "copyPrivateKeyQuery:");
  v6 = SecItemCopyMatching(v5, &result);

  v7 = -[MDKeyRing keysByUUID](self, "keysByUUID");
  if (!v7)
  {
    v7 = (NSMutableDictionary *)objc_opt_new();
    -[MDKeyRing setKeysByUUID:](self, "setKeysByUUID:", v7);
  }
  v8 = -[NSMutableDictionary objectForKey:](v7, "objectForKey:", a3);
  if (!v8 || (v9 = (void *)v8, v8 == *MEMORY[0x24BDBD430]))
  {
    v9 = (void *)objc_opt_new();
    -[NSMutableDictionary setObject:forKey:](v7, "setObject:forKey:", v9, a3);

  }
  v10 = result;
  if (!v6 && result)
  {
    objc_msgSend(v9, "setObject:forKey:", result, *MEMORY[0x24BDE9550]);
    v10 = result;
  }
  if (v10)
    CFRelease(v10);
  return v6;
}

- (id)copyPrivateKeyQuery:(id)a3
{
  id v4;
  uint64_t v5;

  v4 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  objc_msgSend(v4, "setObject:forKey:", *MEMORY[0x24BDE9248], *MEMORY[0x24BDE9220]);
  v5 = objc_msgSend(a3, "MDUUIDData");
  objc_msgSend(v4, "setObject:forKey:", v5, *MEMORY[0x24BDE8FB0]);
  addStandardKeychainAttributesToDictionary(v4);
  return v4;
}

- (id)fetchKeyFromKeychain:(id)a3
{
  int v5;
  void *v6;
  _BOOL8 v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v5 = -[MDKeyRing restoreFromExistingKey:](self, "restoreFromExistingKey:");
  if (!v5)
    goto LABEL_5;
  if (v5 == -25300)
  {
    if (-[MDKeyRing createKeychainItemForKey:](self, "createKeychainItemForKey:", a3))
    {
      -[MDKeyRing writeToKeychain:](self, "writeToKeychain:", a3);
      -[MDKeyRing restoreFromExistingKey:](self, "restoreFromExistingKey:", a3);
LABEL_5:
      v6 = (void *)-[NSMutableDictionary objectForKey:](-[MDKeyRing keysByUUID](self, "keysByUUID"), "objectForKey:", a3);
      return (id)objc_msgSend(v6, "objectForKey:", *MEMORY[0x24BDE9550]);
    }
  }
  else
  {
    v8 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v8)
      -[MDKeyRing fetchKeyFromKeychain:].cold.1(v8, v9, v10, v11, v12, v13, v14, v15);
  }
  return 0;
}

- (id)createRandomAESKey
{
  uint64_t v2;
  _QWORD v4[3];

  v2 = 0;
  v4[2] = *MEMORY[0x24BDAC8D0];
  v4[0] = 0;
  v4[1] = 0;
  do
  {
    *(_DWORD *)((char *)v4 + v2) = arc4random();
    v2 += 4;
  }
  while (v2 != 16);
  return (id)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE50]), "initWithBytes:length:", v4, 16);
}

- (BOOL)createKeychainItemForKey:(id)a3
{
  NSMutableDictionary *v5;
  void *v6;
  _BOOL8 v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  _BOOL8 v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  _QWORD v27[3];

  v27[2] = *MEMORY[0x24BDAC8D0];
  v5 = -[MDKeyRing keysByUUID](self, "keysByUUID");
  if (!v5)
  {
    v5 = (NSMutableDictionary *)objc_opt_new();
    -[MDKeyRing setKeysByUUID:](self, "setKeysByUUID:", v5);

  }
  v6 = (void *)-[NSMutableDictionary objectForKey:](v5, "objectForKey:", a3);
  if (!v6)
  {
    v6 = (void *)objc_opt_new();
    -[NSMutableDictionary setObject:forKey:](v5, "setObject:forKey:", v6, a3);

  }
  if (objc_msgSend(v6, "count"))
  {
    if (SecItemDelete((CFDictionaryRef)-[MDKeyRing dictionaryToSecItemFormat:](self, "dictionaryToSecItemFormat:", v6)))
    {
      v7 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
      if (v7)
        -[MDKeyRing createKeychainItemForKey:].cold.2(v7, v8, v9, v10, v11, v12, v13, v14);
    }
  }
  v15 = -[MDKeyRing createRandomAESKey](self, "createRandomAESKey");
  if (v15)
  {
    objc_msgSend(v6, "setObject:forKey:", v15, *MEMORY[0x24BDE9550]);
    addStandardKeychainAttributesToDictionary(v6);
    v16 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ (%@)"), CFSTR("Spotlight Metadata Privacy"), objc_msgSend(a3, "UUIDString"));
    objc_msgSend(v6, "setObject:forKey:", v16, *MEMORY[0x24BDE90A0]);
    v27[0] = 0;
    v27[1] = 0;
    objc_msgSend(a3, "getUUIDBytes:", v27);
    v17 = objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", v27, 16);
    objc_msgSend(v6, "setObject:forKey:", v17, *MEMORY[0x24BDE8FB0]);
  }
  else
  {
    v18 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v18)
      -[MDKeyRing createKeychainItemForKey:].cold.1(v18, v19, v20, v21, v22, v23, v24, v25);
  }
  return v15 != 0;
}

- (void)writeToKeychain:(id)a3
{
  id v5;
  CFTypeID TypeID;
  void *v7;
  uint64_t v8;
  id v9;
  _BOOL8 v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  OSStatus v19;
  _BOOL8 v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  CFTypeRef result;

  result = 0;
  v5 = -[MDKeyRing copyPrivateKeyQuery:](self, "copyPrivateKeyQuery:");
  if (!SecItemCopyMatching((CFDictionaryRef)v5, &result))
  {
    if (result)
    {
      TypeID = CFDictionaryGetTypeID();
      if (TypeID == CFGetTypeID(result))
      {
        v7 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithDictionary:", result);
        v8 = *MEMORY[0x24BDE9220];
        objc_msgSend(v7, "setObject:forKey:", objc_msgSend(v5, "objectForKey:", *MEMORY[0x24BDE9220]), *MEMORY[0x24BDE9220]);
        v9 = -[MDKeyRing dictionaryToSecItemFormat:](self, "dictionaryToSecItemFormat:", -[NSMutableDictionary objectForKey:](-[MDKeyRing keysByUUID](self, "keysByUUID"), "objectForKey:", a3));
        objc_msgSend(v9, "removeObjectForKey:", v8);
        if (SecItemUpdate((CFDictionaryRef)v7, (CFDictionaryRef)v9))
        {
          v10 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
          if (v10)
            -[MDKeyRing writeToKeychain:].cold.1(v10, v11, v12, v13, v14, v15, v16, v17);
        }
        goto LABEL_15;
      }
    }
  }
  v18 = -[NSMutableDictionary objectForKey:](-[MDKeyRing keysByUUID](self, "keysByUUID"), "objectForKey:", a3);
  v19 = SecItemAdd((CFDictionaryRef)-[MDKeyRing dictionaryToSecItemFormat:](self, "dictionaryToSecItemFormat:", v18), 0);
  if (v19 == -25299)
  {
    if (SecItemDelete((CFDictionaryRef)-[MDKeyRing dictionaryToSecItemFormat:](self, "dictionaryToSecItemFormat:", v18)))
      goto LABEL_11;
    v19 = SecItemAdd((CFDictionaryRef)-[MDKeyRing dictionaryToSecItemFormat:](self, "dictionaryToSecItemFormat:", v18), 0);
  }
  if (v19)
  {
LABEL_11:
    v20 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v20)
      -[MDKeyRing writeToKeychain:].cold.2(v20, v21, v22, v23, v24, v25, v26, v27);
  }
  if (result)
    CFRelease(result);
LABEL_15:

}

- (id)dictionaryToSecItemFormat:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;

  v4 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithDictionary:");
  objc_msgSend(v4, "setObject:forKey:", *MEMORY[0x24BDE9248], *MEMORY[0x24BDE9220]);
  v5 = *MEMORY[0x24BDE9550];
  v6 = objc_msgSend(a3, "objectForKey:", *MEMORY[0x24BDE9550]);
  if (v6)
    objc_msgSend(v4, "setObject:forKey:", v6, v5);
  return v4;
}

- (id)secItemFormatToDictionary:(id)a3
{
  void *v3;
  OSStatus v4;
  _BOOL8 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _BOOL8 v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  CFTypeRef result;

  v3 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithDictionary:", a3);
  objc_msgSend(v3, "setObject:forKey:", *MEMORY[0x24BDBD270], *MEMORY[0x24BDE94C8]);
  objc_msgSend(v3, "setObject:forKey:", *MEMORY[0x24BDE9248], *MEMORY[0x24BDE9220]);
  result = 0;
  v4 = SecItemCopyMatching((CFDictionaryRef)v3, &result);
  if (v4 == -25300)
  {
    v5 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v5)
      -[MDKeyRing secItemFormatToDictionary:].cold.2(v5, v6, v7, v8, v9, v10, v11, v12);
  }
  else if (v4)
  {
    v13 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v13)
      -[MDKeyRing secItemFormatToDictionary:].cold.1(v13, v14, v15, v16, v17, v18, v19, v20);
  }
  else
  {
    objc_msgSend(v3, "setObject:forKey:", result, *MEMORY[0x24BDE9550]);
  }
  return v3;
}

- (id)copyEncryptedData:(id)a3 withKeyUUID:(id)a4 iv1:(unsigned int)a5 iv2:(unsigned int)a6
{
  id v11;

  v11 = -[MDKeyRing fetchKeyFromKeychain:](self, "fetchKeyFromKeychain:", a4);
  if (v11)
    return _copyCryptedDataWithKey(0, (const void *)objc_msgSend(a3, "bytes"), objc_msgSend(a3, "length"), v11, a5, a6);
  -[MDKeyRing createKeychainItemForKey:](self, "createKeychainItemForKey:", a4);
  v11 = -[MDKeyRing fetchKeyFromKeychain:](self, "fetchKeyFromKeychain:", a4);
  if (v11)
    return _copyCryptedDataWithKey(0, (const void *)objc_msgSend(a3, "bytes"), objc_msgSend(a3, "length"), v11, a5, a6);
  NSLog(CFSTR("No key data for %@"), a4);
  return 0;
}

- (id)copyDecryptedData:(id)a3 withKeyUUID:(id)a4 iv1:(unsigned int)a5 iv2:(unsigned int)a6
{
  id v11;
  id result;

  v11 = -[MDKeyRing fetchKeyFromKeychain:](self, "fetchKeyFromKeychain:", a4);
  if (v11)
    return _copyCryptedDataWithKey(1u, (const void *)objc_msgSend(a3, "bytes"), objc_msgSend(a3, "length"), v11, a5, a6);
  -[MDKeyRing createKeychainItemForKey:](self, "createKeychainItemForKey:", a4);
  result = -[MDKeyRing fetchKeyFromKeychain:](self, "fetchKeyFromKeychain:", a4);
  v11 = result;
  if (result)
    return _copyCryptedDataWithKey(1u, (const void *)objc_msgSend(a3, "bytes"), objc_msgSend(a3, "length"), v11, a5, a6);
  return result;
}

- (NSMutableDictionary)keysByUUID
{
  return self->_keysByUUID;
}

- (void)setKeysByUUID:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 24);
}

- (void)fetchKeyFromKeychain:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_237593000, MEMORY[0x24BDACB70], a3, "Serious error in init keychain \n", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

- (void)createKeychainItemForKey:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_237593000, MEMORY[0x24BDACB70], a3, "Couldn't create random key", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

- (void)createKeychainItemForKey:(uint64_t)a3 .cold.2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_237593000, MEMORY[0x24BDACB70], a3, "Problem deleting current keychain item.", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

- (void)writeToKeychain:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_237593000, MEMORY[0x24BDACB70], a3, "Keychain Item update failed.", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

- (void)writeToKeychain:(uint64_t)a3 .cold.2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_237593000, MEMORY[0x24BDACB70], a3, "Keychain Item add failed", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

- (void)secItemFormatToDictionary:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_237593000, MEMORY[0x24BDACB70], a3, "Serious error.\n", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

- (void)secItemFormatToDictionary:(uint64_t)a3 .cold.2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_237593000, MEMORY[0x24BDACB70], a3, "Nothing was found in the keychain.\n", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

@end
