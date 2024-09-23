@implementation DTCPRemoteCache

+ (id)sharedDTCPRemoteCache
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = sub_222B7A584;
  block[3] = &unk_24EB29A28;
  block[4] = a1;
  if (qword_25576FBB0 != -1)
    dispatch_once(&qword_25576FBB0, block);
  return (id)qword_25576FBA8;
}

+ (id)kindToString:(int64_t)a3
{
  const __CFString *v3;

  v3 = CFSTR("unknown");
  if (a3 == 1)
    v3 = CFSTR("kpep");
  if (a3)
    return (id)v3;
  else
    return CFSTR("trace");
}

+ (id)allocWithZone:(_NSZone *)a3
{
  objc_msgSend(a1, "sharedDTCPRemoteCache", a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (DTCPRemoteCache)init
{
  DTCPRemoteCache *v2;
  dispatch_semaphore_t v3;
  void **locks;
  void *v5;
  dispatch_semaphore_t v6;
  id *v7;
  id v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)DTCPRemoteCache;
  v2 = -[DTCPRemoteCache init](&v10, sel_init);
  if (v2)
  {
    v2->_locks = (id *)malloc_type_calloc(2uLL, 8uLL, 0x80040B8603338uLL);
    v3 = dispatch_semaphore_create(1);
    locks = v2->_locks;
    v5 = *locks;
    *locks = v3;

    v6 = dispatch_semaphore_create(1);
    v7 = v2->_locks;
    v8 = v7[1];
    v7[1] = v6;

  }
  return v2;
}

- (void)dealloc
{
  id *locks;
  id v4;
  id *v5;
  id v6;
  id *v7;
  objc_super v8;

  locks = self->_locks;
  v4 = *locks;
  *locks = 0;

  v5 = self->_locks;
  v6 = v5[1];
  v5[1] = 0;

  v7 = self->_locks;
  if (v7)
  {
    free(v7);
    self->_locks = 0;
  }
  v8.receiver = self;
  v8.super_class = (Class)DTCPRemoteCache;
  -[DTCPRemoteCache dealloc](&v8, sel_dealloc);
}

- (id)_directoryForDevice:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x24BDD1580];
  v4 = a3;
  objc_msgSend(v3, "defaultManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "URLsForDirectory:inDomains:", 13, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "count"))
  {
    objc_msgSend(v6, "objectAtIndex:", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "URLByAppendingPathComponent:", CFSTR("com.apple.dt.Instruments/device_cache"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:", CFSTR("/tmp/instruments_device_cache"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v8, "URLByAppendingPathComponent:", v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)_filePathForKind:(int64_t)a3 fileType:(id)a4 directoryURL:(id)a5
{
  void *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;

  v7 = (void *)MEMORY[0x24BDD17C8];
  v8 = a5;
  v9 = a4;
  +[DTCPRemoteCache kindToString:](DTCPRemoteCache, "kindToString:", a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringWithFormat:", CFSTR("%@.%@"), v10, v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "URLByAppendingPathComponent:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (BOOL)accessFileKind:(int64_t)a3 device:(id)a4 fileType:(id)a5 block:(id)a6
{
  id v10;
  id v11;
  uint64_t (**v12)(id, void *, uint64_t);
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  uint64_t v19;
  char v20;
  void *v22;
  id v23;

  v10 = a4;
  v11 = a5;
  v12 = (uint64_t (**)(id, void *, uint64_t))a6;
  v22 = v10;
  -[DTCPRemoteCache _directoryForDevice:](self, "_directoryForDevice:", v10);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[DTCPRemoteCache _filePathForKind:fileType:directoryURL:](self, "_filePathForKind:fileType:directoryURL:", a3, v11, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  dispatch_semaphore_wait((dispatch_semaphore_t)self->_locks[a3], 0xFFFFFFFFFFFFFFFFLL);
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "path");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = 0;
  LODWORD(a6) = objc_msgSend(v15, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v16, 1, 0, &v23);
  v17 = v23;

  objc_msgSend(v14, "path");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if ((_DWORD)a6)
  {
    v19 = objc_msgSend(v15, "fileExistsAtPath:", v18);

    v20 = v12[2](v12, v14, v19);
  }
  else
  {
    NSLog(CFSTR("Failed to create the DTKP cache path at: %@."), v18);

    v20 = 0;
  }

  dispatch_semaphore_signal((dispatch_semaphore_t)self->_locks[a3]);
  return v20;
}

@end
