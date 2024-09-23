@implementation WFDiskCache

- (WFDiskCache)init
{
  return -[WFDiskCache initWithName:](self, "initWithName:", 0);
}

- (WFDiskCache)initWithName:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  WFDiskCache *v9;

  v4 = (void *)MEMORY[0x24BDBCF48];
  v5 = a3;
  NSSearchPathForDirectoriesInDomains(NSCachesDirectory, 1uLL, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "firstObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "fileURLWithPath:isDirectory:", v7, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = -[WFDiskCache initWithCacheDirectory:name:](self, "initWithCacheDirectory:name:", v8, v5);
  return v9;
}

- (WFDiskCache)initWithApplicationGroupIdentifier:(id)a3 name:(id)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  WFDiskCache *v13;

  v6 = a4;
  v7 = (void *)MEMORY[0x24BDD1580];
  v8 = a3;
  objc_msgSend(v7, "defaultManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "containerURLForSecurityApplicationGroupIdentifier:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "URLByAppendingPathComponent:isDirectory:", CFSTR("Library"), 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "URLByAppendingPathComponent:isDirectory:", CFSTR("Caches"), 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    self = -[WFDiskCache initWithCacheDirectory:name:](self, "initWithCacheDirectory:name:", v12, v6);
    v13 = self;
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (WFDiskCache)initWithCacheDirectory:(id)a3 name:(id)a4
{
  const __CFString *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  WFDiskCache *v11;

  if (a4)
    v6 = (const __CFString *)a4;
  else
    v6 = CFSTR("default");
  v7 = a4;
  v8 = a3;
  objc_msgSend(CFSTR("is.workflow.WFDiskCache."), "stringByAppendingString:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "URLByAppendingPathComponent:isDirectory:", v9, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = -[WFDiskCache initWithCacheURL:name:](self, "initWithCacheURL:name:", v10, v7);
  return v11;
}

- (WFDiskCache)initWithCacheURL:(id)a3 name:(id)a4
{
  id v7;
  __CFString *v8;
  WFDiskCache *v9;
  void *v10;
  char v11;
  id v12;
  NSObject *v13;
  const __CFString *v14;
  id v15;
  dispatch_queue_t v16;
  OS_dispatch_queue *queue;
  uint64_t v18;
  NSURL *cacheURL;
  uint64_t v20;
  NSMutableDictionary *overridingClassMap;
  WFDiskCache *v22;
  void *v24;
  id v25;
  objc_super v26;

  v7 = a3;
  v8 = (__CFString *)a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFDiskCache.m"), 69, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("cacheURL"));

  }
  v26.receiver = self;
  v26.super_class = (Class)WFDiskCache;
  v9 = -[WFDiskCache init](&v26, sel_init);
  if (v9)
  {
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = 0;
    v11 = objc_msgSend(v10, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v7, 1, 0, &v25);
    v12 = v25;

    if ((v11 & 1) != 0)
    {
      dispatch_queue_attr_make_with_qos_class(MEMORY[0x24BDAC9C0], QOS_CLASS_BACKGROUND, 0);
      v13 = objc_claimAutoreleasedReturnValue();
      if (v8)
        v14 = v8;
      else
        v14 = CFSTR("default");
      objc_msgSend(CFSTR("is.workflow.WFDiskCache."), "stringByAppendingString:", v14);
      v15 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v16 = dispatch_queue_create((const char *)objc_msgSend(v15, "UTF8String"), v13);
      queue = v9->_queue;
      v9->_queue = (OS_dispatch_queue *)v16;

      v18 = objc_msgSend(v7, "copy");
      cacheURL = v9->_cacheURL;
      v9->_cacheURL = (NSURL *)v18;

      v20 = objc_opt_new();
      overridingClassMap = v9->_overridingClassMap;
      v9->_overridingClassMap = (NSMutableDictionary *)v20;

      v22 = v9;
    }
    else
    {
      NSLog(CFSTR("%@: Error: %@"), v9, v12);
      v22 = 0;
    }

  }
  else
  {
    v22 = 0;
  }

  return v22;
}

- (void)setObject:(id)a3 forKey:(id)a4
{
  id v7;
  id v8;
  void *v9;
  NSObject *queue;
  id v11;
  void *v12;
  void *v13;
  id v14;
  _QWORD block[5];
  id v16;
  id v17;

  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFDiskCache.m"), 89, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("object"));

    if (v9)
      goto LABEL_3;
LABEL_5:
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFDiskCache.m"), 90, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("key"));

    goto LABEL_3;
  }
  if (!v8)
    goto LABEL_5;
LABEL_3:
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __32__WFDiskCache_setObject_forKey___block_invoke;
  block[3] = &unk_24F8BB0A0;
  block[4] = self;
  v16 = v7;
  v17 = v9;
  v11 = v9;
  v14 = v7;
  dispatch_barrier_sync(queue, block);

}

- (void)removeObjectForKey:(id)a3
{
  id v5;
  NSObject *queue;
  void *v7;
  id v8;
  _QWORD block[5];
  id v10;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFDiskCache.m"), 97, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("key"));

  }
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __34__WFDiskCache_removeObjectForKey___block_invoke;
  block[3] = &unk_24F8BA480;
  block[4] = self;
  v10 = v5;
  v8 = v5;
  dispatch_barrier_sync(queue, block);

}

- (id)objectOfClasses:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;
  NSObject *queue;
  id v9;
  _QWORD v11[5];
  id v12;
  id v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  v6 = a3;
  v7 = a4;
  if (v7)
  {
    v15 = 0;
    v16 = &v15;
    v17 = 0x3032000000;
    v18 = __Block_byref_object_copy__7106;
    v19 = __Block_byref_object_dispose__7107;
    v20 = 0;
    queue = self->_queue;
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __38__WFDiskCache_objectOfClasses_forKey___block_invoke;
    v11[3] = &unk_24F8B64A8;
    v14 = &v15;
    v11[4] = self;
    v12 = v6;
    v13 = v7;
    dispatch_barrier_sync(queue, v11);
    v9 = (id)v16[5];

    _Block_object_dispose(&v15, 8);
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (void)setObject:(id)a3 forKey:(id)a4 completion:(id)a5
{
  id v9;
  id v10;
  id v11;
  NSObject *queue;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  _QWORD block[5];
  id v19;
  id v20;
  id v21;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFDiskCache.m"), 115, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("object"));

    if (v10)
      goto LABEL_3;
LABEL_5:
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFDiskCache.m"), 116, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("key"));

    goto LABEL_3;
  }
  if (!v10)
    goto LABEL_5;
LABEL_3:
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __43__WFDiskCache_setObject_forKey_completion___block_invoke;
  block[3] = &unk_24F8BA1A0;
  block[4] = self;
  v19 = v9;
  v20 = v10;
  v21 = v11;
  v13 = v11;
  v14 = v10;
  v15 = v9;
  dispatch_async(queue, block);

}

- (void)removeObjectForKey:(id)a3 completion:(id)a4
{
  id v7;
  id v8;
  NSObject *queue;
  id v10;
  id v11;
  void *v12;
  _QWORD block[5];
  id v14;
  id v15;

  v7 = a3;
  v8 = a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFDiskCache.m"), 125, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("key"));

  }
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __45__WFDiskCache_removeObjectForKey_completion___block_invoke;
  block[3] = &unk_24F8BA298;
  block[4] = self;
  v14 = v7;
  v15 = v8;
  v10 = v8;
  v11 = v7;
  dispatch_async(queue, block);

}

- (void)objectOfClasses:(id)a3 forKey:(id)a4 completion:(id)a5
{
  id v9;
  id v10;
  id v11;
  NSObject *queue;
  id v13;
  id v14;
  id v15;
  void *v16;
  _QWORD block[5];
  id v18;
  id v19;
  id v20;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (!v10)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFDiskCache.m"), 134, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("key"));

  }
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __49__WFDiskCache_objectOfClasses_forKey_completion___block_invoke;
  block[3] = &unk_24F8BA1A0;
  block[4] = self;
  v18 = v9;
  v19 = v10;
  v20 = v11;
  v13 = v11;
  v14 = v10;
  v15 = v9;
  dispatch_async(queue, block);

}

- (void)setObject:(id)a3 forKeyComponents:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFDiskCache.m"), 144, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("key"));

    v8 = 0;
  }
  WFDiskCacheKeyArgs(v8, &v12);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFDiskCache setObject:forKey:](self, "setObject:forKey:", v7, v10);

}

- (void)removeObjectForKeyComponents:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v5 = a3;
  v6 = v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFDiskCache.m"), 153, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("key"));

    v5 = 0;
  }
  WFDiskCacheKeyArgs(v5, &v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFDiskCache removeObjectForKey:](self, "removeObjectForKey:", v7);

}

- (id)objectOfClasses:(id)a3 forKeyComponents:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v10;

  if (a4)
  {
    v6 = a3;
    WFDiskCacheKeyArgs(a4, &v10);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFDiskCache objectOfClasses:forKey:](self, "objectOfClasses:forKey:", v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }
  return v8;
}

- (id)fileURLForKey:(id)a3
{
  id v4;
  void *v5;
  uint64_t i;
  void *v7;
  void *v8;
  unsigned __int8 md[20];
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a3, "dataUsingEncoding:", 4);
  v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  CC_SHA1((const void *)objc_msgSend(v4, "bytes"), objc_msgSend(v4, "length"), md);
  v5 = (void *)objc_opt_new();
  for (i = 0; i != 20; ++i)
    objc_msgSend(v5, "appendFormat:", CFSTR("%02x"), md[i]);
  -[WFDiskCache cacheURL](self, "cacheURL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "URLByAppendingPathComponent:isDirectory:", v5, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)actuallySetObject:(id)a3 forKey:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;

  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (v7)
  {
    if (v8)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFDiskCache.m"), 186, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("object"));

    if (v9)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFDiskCache.m"), 187, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("key"));

LABEL_3:
  -[WFDiskCache fileURLForKey:](self, "fileURLForKey:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0;
  objc_msgSend(MEMORY[0x24BDD1618], "archivedDataWithRootObject:requiringSecureCoding:error:", v7, 1, &v21);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v21;
  v13 = v12;
  if (v11)
  {
    v14 = objc_retainAutorelease(v10);
    v15 = open((const char *)objc_msgSend(v14, "fileSystemRepresentation"), 1569, 420);
    if ((_DWORD)v15 == -1)
    {
      objc_msgSend(v14, "absoluteString");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1128], *__error(), 0);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      NSLog(CFSTR("%@: Error: File URL \"%@\" for key \"%@\" is not writeable: \"%@\"), self, v17, v9, v18);

    }
    else
    {
      v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1578]), "initWithFileDescriptor:closeOnDealloc:", v15, 1);
      objc_msgSend(v16, "writeData:", v11);
      objc_msgSend(v16, "closeFile");

    }
  }
  else
  {
    NSLog(CFSTR("%@: Error: Could not archive object: %@"), self, v12);
  }

}

- (void)actuallyRemoveObjectForKey:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v5 = a3;
  v9 = v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFDiskCache.m"), 210, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("key"));

    v5 = 0;
  }
  -[WFDiskCache fileURLForKey:](self, "fileURLForKey:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeItemAtURL:error:", v6, 0);

}

- (id)actuallyGetObjectOfClasses:(id)a3 forKey:(id)a4
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v21;
  _QWORD v22[4];
  id v23;
  id v24;

  v7 = a3;
  v8 = a4;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFDiskCache.m"), 217, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("key"));

  }
  -[WFDiskCache fileURLForKey:](self, "fileURLForKey:", v8);
  v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v10 = open((const char *)objc_msgSend(v9, "fileSystemRepresentation"), 16);
  if ((_DWORD)v10 == -1)
  {
    if (*__error() != 2)
    {
      objc_msgSend(v9, "absoluteString");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1128], *__error(), 0);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      NSLog(CFSTR("%@: Error: File URL \"%@\" for key \"%@\" is not readable: \"%@\"), self, v18, v8, v19);

    }
    v17 = 0;
  }
  else
  {
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1578]), "initWithFileDescriptor:closeOnDealloc:", v10, 1);
    objc_msgSend(v11, "readDataToEndOfFile");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "closeFile");
    v24 = 0;
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1620]), "initForReadingFromData:error:", v12, &v24);
    v14 = v24;
    objc_msgSend(v13, "setRequiresSecureCoding:", 1);
    objc_msgSend(v13, "setDecodingFailurePolicy:", 1);
    -[WFDiskCache overridingClassMap](self, "overridingClassMap");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v22[0] = MEMORY[0x24BDAC760];
    v22[1] = 3221225472;
    v22[2] = __49__WFDiskCache_actuallyGetObjectOfClasses_forKey___block_invoke;
    v22[3] = &unk_24F8B1750;
    v16 = v13;
    v23 = v16;
    objc_msgSend(v15, "enumerateKeysAndObjectsUsingBlock:", v22);

    if (v16)
    {
      objc_msgSend(v16, "decodeObjectOfClasses:forKey:", v7, *MEMORY[0x24BDD0E88]);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "finishDecoding");
    }
    else
    {
      NSLog(CFSTR("%@: Error: Could not unarchive object: %@"), self, v14);
      v17 = 0;
    }

  }
  return v17;
}

- (void)setClass:(Class)a3 forCachedClassName:(id)a4
{
  id v6;
  id v7;

  v6 = a4;
  -[WFDiskCache overridingClassMap](self, "overridingClassMap");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", a3, v6);

}

- (NSURL)cacheURL
{
  return self->_cacheURL;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (NSMutableDictionary)overridingClassMap
{
  return self->_overridingClassMap;
}

- (void)setOverridingClassMap:(id)a3
{
  objc_storeStrong((id *)&self->_overridingClassMap, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_overridingClassMap, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_cacheURL, 0);
}

uint64_t __49__WFDiskCache_actuallyGetObjectOfClasses_forKey___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "setClass:forClassName:", a3, a2);
}

void __49__WFDiskCache_objectOfClasses_forKey_completion___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;

  objc_msgSend(*(id *)(a1 + 32), "actuallyGetObjectOfClasses:forKey:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  dispatch_get_global_queue(-32768, 0);
  v3 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __49__WFDiskCache_objectOfClasses_forKey_completion___block_invoke_2;
  v6[3] = &unk_24F8BB5E0;
  v4 = *(id *)(a1 + 56);
  v7 = v2;
  v8 = v4;
  v5 = v2;
  dispatch_async(v3, v6);

}

uint64_t __49__WFDiskCache_objectOfClasses_forKey_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __45__WFDiskCache_removeObjectForKey_completion___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;

  objc_msgSend(*(id *)(a1 + 32), "actuallyRemoveObjectForKey:", *(_QWORD *)(a1 + 40));
  v2 = *(void **)(a1 + 48);
  if (v2)
  {
    dispatch_get_global_queue(-32768, 0);
    v3 = objc_claimAutoreleasedReturnValue();
    dispatch_async(v3, v2);

  }
}

void __43__WFDiskCache_setObject_forKey_completion___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;

  objc_msgSend(*(id *)(a1 + 32), "actuallySetObject:forKey:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  v2 = *(void **)(a1 + 56);
  if (v2)
  {
    dispatch_get_global_queue(-32768, 0);
    v3 = objc_claimAutoreleasedReturnValue();
    dispatch_async(v3, v2);

  }
}

void __38__WFDiskCache_objectOfClasses_forKey___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "actuallyGetObjectOfClasses:forKey:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

uint64_t __34__WFDiskCache_removeObjectForKey___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "actuallyRemoveObjectForKey:", *(_QWORD *)(a1 + 40));
}

uint64_t __32__WFDiskCache_setObject_forKey___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "actuallySetObject:forKey:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

+ (id)workflowCache
{
  if (workflowCache_onceToken != -1)
    dispatch_once(&workflowCache_onceToken, &__block_literal_global_49269);
  return (id)workflowCache_workflowCache;
}

void __38__WFDiskCache_Workflow__workflowCache__block_invoke()
{
  WFDiskCache *v0;
  uint64_t v1;
  void *v2;
  id v3;

  v0 = [WFDiskCache alloc];
  objc_msgSend(MEMORY[0x24BE19628], "appGroupIdentifier");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v1 = -[WFDiskCache initWithApplicationGroupIdentifier:name:](v0, "initWithApplicationGroupIdentifier:name:", v3, 0);
  v2 = (void *)workflowCache_workflowCache;
  workflowCache_workflowCache = v1;

}

@end
