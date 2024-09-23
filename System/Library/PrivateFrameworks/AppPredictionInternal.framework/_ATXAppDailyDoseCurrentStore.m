@implementation _ATXAppDailyDoseCurrentStore

- (id)_getCacheFromFile
{
  NSMutableDictionary *cache;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  cache = self->_cache;
  if (!cache)
  {
    -[_ATXAppDailyDoseCurrentStore _readCacheAndExpiration](self, "_readCacheAndExpiration");
    cache = self->_cache;
  }
  return cache;
}

- (BOOL)isExpiredAt:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD block[5];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __44___ATXAppDailyDoseCurrentStore_isExpiredAt___block_invoke;
  block[3] = &unk_1E82E0520;
  v9 = v4;
  v10 = &v11;
  block[4] = self;
  v6 = v4;
  dispatch_sync(queue, block);
  LOBYTE(queue) = *((_BYTE *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)queue;
}

- (void)increaseDoseFor:(id)a3 by:(double)a4
{
  id v7;
  void *v8;
  NSObject *queue;
  id v10;
  id v11;
  _QWORD block[5];
  id v13;
  id v14;
  double v15;

  v7 = a3;
  sel_getName(a2);
  v8 = (void *)os_transaction_create();
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __51___ATXAppDailyDoseCurrentStore_increaseDoseFor_by___block_invoke;
  block[3] = &unk_1E82DEC98;
  block[4] = self;
  v13 = v7;
  v15 = a4;
  v14 = v8;
  v10 = v8;
  v11 = v7;
  dispatch_sync(queue, block);

}

- (void)_overwrite
{
  void *v3;
  void *v4;
  void *v5;
  NSMutableDictionary *cache;
  void *v7;
  void *v8;
  id v9;
  int *p_fd;
  int v11;
  id v12;
  ssize_t v13;
  NSObject *v14;
  int v15;
  int *v16;
  char *v17;
  const char *v18;
  NSObject *v19;
  uint32_t v20;
  id v21;
  uint8_t buf[4];
  _QWORD v23[2];
  _QWORD v24[3];
  _QWORD v25[4];

  v25[3] = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v3 = (void *)MEMORY[0x1CAA48B6C]();
  v25[0] = &unk_1E83CC808;
  v24[0] = CFSTR("version");
  v24[1] = CFSTR("expires");
  v4 = (void *)MEMORY[0x1E0CB37E8];
  -[NSDate timeIntervalSinceReferenceDate](self->_expires, "timeIntervalSinceReferenceDate");
  objc_msgSend(v4, "numberWithDouble:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v24[2] = CFSTR("doses");
  cache = self->_cache;
  v25[1] = v5;
  v25[2] = cache;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v25, v24, 3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v21 = 0;
  objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", v7, 0, &v21);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v21;
  if (!v8)
  {
    __atxlog_handle_default();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v23[0] = v9;
      v18 = "Could not serialize daily dose: %@";
      v19 = v14;
      v20 = 12;
      goto LABEL_7;
    }
LABEL_8:

    goto LABEL_9;
  }
  p_fd = &self->_fd;
  v11 = atomic_load((unsigned int *)p_fd);
  ftruncate(v11, 0);
  LODWORD(p_fd) = atomic_load((unsigned int *)p_fd);
  v12 = objc_retainAutorelease(v8);
  v13 = pwrite((int)p_fd, (const void *)objc_msgSend(v12, "bytes"), objc_msgSend(v12, "length"), 0);
  if (v13 != objc_msgSend(v12, "length"))
  {
    __atxlog_handle_default();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v15 = *__error();
      v16 = __error();
      v17 = strerror(*v16);
      *(_DWORD *)buf = 67109378;
      LODWORD(v23[0]) = v15;
      WORD2(v23[0]) = 2080;
      *(_QWORD *)((char *)v23 + 6) = v17;
      v18 = "Could not write daily dose (errno=%i): %s";
      v19 = v14;
      v20 = 18;
LABEL_7:
      _os_log_impl(&dword_1C9A3B000, v19, OS_LOG_TYPE_DEFAULT, v18, buf, v20);
      goto LABEL_8;
    }
    goto LABEL_8;
  }
LABEL_9:

  objc_autoreleasePoolPop(v3);
}

- (_ATXAppDailyDoseCurrentStore)initWithPath:(id)a3
{
  id v5;
  _ATXAppDailyDoseCurrentStore *v6;
  objc_class *v7;
  id v8;
  const char *v9;
  NSObject *v10;
  dispatch_queue_t v11;
  OS_dispatch_queue *queue;
  objc_super v14;

  v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)_ATXAppDailyDoseCurrentStore;
  v6 = -[_ATXAppDailyDoseCurrentStore init](&v14, sel_init);
  if (v6)
  {
    v7 = (objc_class *)objc_opt_class();
    NSStringFromClass(v7);
    v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v9 = (const char *)objc_msgSend(v8, "UTF8String");
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = dispatch_queue_create(v9, v10);
    queue = v6->_queue;
    v6->_queue = (OS_dispatch_queue *)v11;

    objc_storeStrong((id *)&v6->_path, a3);
    -[_ATXAppDailyDoseCurrentStore _openFd](v6, "_openFd");
  }

  return v6;
}

- (void)_openFd
{
  atomic_store(open_dprotected_np(-[NSString UTF8String](self->_path, "UTF8String"), 514, 3, 0, 384), (unsigned int *)&self->_fd);
}

- (void)dealloc
{
  objc_super v3;

  -[_ATXAppDailyDoseCurrentStore closePermanently](self, "closePermanently");
  v3.receiver = self;
  v3.super_class = (Class)_ATXAppDailyDoseCurrentStore;
  -[_ATXAppDailyDoseCurrentStore dealloc](&v3, sel_dealloc);
}

- (void)closePermanently
{
  int *p_fd;
  unsigned int v3;
  int v4;

  p_fd = &self->_fd;
  v3 = atomic_load((unsigned int *)&self->_fd);
  do
  {
    v4 = __ldaxr((unsigned int *)p_fd);
    if (v4 != v3)
    {
      __clrex();
      return;
    }
  }
  while (__stlxr(0xFFFFFFFF, (unsigned int *)p_fd));
  if ((v4 & 0x80000000) == 0)
    close(v4);
}

- (void)_readCacheAndExpiration
{
  void *v3;
  NSMutableDictionary *cache;
  NSDate *expires;
  unsigned int v6;
  int v7;
  void *v8;
  int v9;
  int v10;
  void *v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  NSMutableDictionary *v15;
  NSMutableDictionary *v16;
  NSDate *v17;
  NSObject *p_super;
  void *v19;
  NSDate *v20;
  int v21;
  NSDate *v22;
  double v23;
  NSMutableDictionary *v24;
  NSMutableDictionary *v25;
  NSDate *v26;
  NSDate *v27;
  id v28;
  uint8_t buf[4];
  NSObject *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v3 = (void *)MEMORY[0x1CAA48B6C]();
  cache = self->_cache;
  self->_cache = 0;

  expires = self->_expires;
  self->_expires = 0;

  v6 = atomic_load((unsigned int *)&self->_fd);
  if ((v6 & 0x80000000) != 0)
    goto LABEL_10;
  v7 = atomic_load((unsigned int *)&self->_fd);
  readWholeFile(v7, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    v9 = atomic_load((unsigned int *)&self->_fd);
    close(v9);
    -[_ATXAppDailyDoseCurrentStore _openFd](self, "_openFd");
    v10 = atomic_load((unsigned int *)&self->_fd);
    readWholeFile(v10, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v8)
    {
LABEL_10:
      __atxlog_handle_default();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        v21 = *__error();
        *(_DWORD *)buf = 67109120;
        LODWORD(v30) = v21;
        _os_log_impl(&dword_1C9A3B000, v12, OS_LOG_TYPE_DEFAULT, "Could not read daily dose (errno=%i)", buf, 8u);
      }
      v8 = 0;
      goto LABEL_17;
    }
  }
  if (objc_msgSend(v8, "length"))
  {
    v28 = 0;
    objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", v8, 1, &v28);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v28;
    if (v11)
    {
      objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("version"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "integerValue");

      if (v14 != 1)
      {
LABEL_16:

LABEL_17:
        goto LABEL_18;
      }
      objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("doses"));
      v15 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
      v16 = self->_cache;
      self->_cache = v15;

      objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("expires"));
      v17 = (NSDate *)objc_claimAutoreleasedReturnValue();
      p_super = &v17->super;
      if (v17)
      {
        v19 = (void *)MEMORY[0x1E0C99D68];
        -[NSDate doubleValue](v17, "doubleValue");
        objc_msgSend(v19, "dateWithTimeIntervalSinceReferenceDate:");
        v17 = (NSDate *)objc_claimAutoreleasedReturnValue();
      }
      v20 = self->_expires;
      self->_expires = v17;

    }
    else
    {
      __atxlog_handle_default();
      p_super = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(p_super, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v30 = v12;
        _os_log_impl(&dword_1C9A3B000, p_super, OS_LOG_TYPE_DEFAULT, "Could not parse daily dose: %@", buf, 0xCu);
      }
    }

    goto LABEL_16;
  }
LABEL_18:
  if (!self->_cache
    || (v22 = self->_expires) == 0
    || (-[NSDate timeIntervalSinceNow](v22, "timeIntervalSinceNow"), v23 < 0.0))
  {
    v24 = (NSMutableDictionary *)objc_opt_new();
    v25 = self->_cache;
    self->_cache = v24;

    objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
    v26 = (NSDate *)objc_claimAutoreleasedReturnValue();
    v27 = self->_expires;
    self->_expires = v26;

  }
  objc_autoreleasePoolPop(v3);
}

- (BOOL)isExpiredNow
{
  void *v3;

  v3 = (void *)objc_opt_new();
  LOBYTE(self) = -[_ATXAppDailyDoseCurrentStore isExpiredAt:](self, "isExpiredAt:", v3);

  return (char)self;
}

- (void)resetWithDurationMap:(id)a3 on:(id)a4
{
  id v6;
  id v7;
  NSObject *queue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __56___ATXAppDailyDoseCurrentStore_resetWithDurationMap_on___block_invoke;
  block[3] = &unk_1E82DB9D8;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_sync(queue, block);

}

- (double)currentDoseFor:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  double v7;
  _QWORD block[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  double *v13;
  uint64_t v14;
  uint64_t v15;

  v4 = a3;
  v12 = 0;
  v13 = (double *)&v12;
  v14 = 0x2020000000;
  v15 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __47___ATXAppDailyDoseCurrentStore_currentDoseFor___block_invoke;
  block[3] = &unk_1E82DF880;
  v10 = v4;
  v11 = &v12;
  block[4] = self;
  v6 = v4;
  dispatch_sync(queue, block);
  v7 = v13[3];

  _Block_object_dispose(&v12, 8);
  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_expires, 0);
  objc_storeStrong((id *)&self->_cache, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_path, 0);
}

@end
