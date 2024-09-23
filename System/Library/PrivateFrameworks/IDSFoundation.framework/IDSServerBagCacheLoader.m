@implementation IDSServerBagCacheLoader

- (id)loadFromCacheWithError:(id *)a3
{
  double v3;
  void *v6;
  const char *v7;
  uint64_t v8;
  double v9;
  __CFString *v10;
  const __CFString *v11;
  const __CFString *v12;
  __CFNotificationCenter *DarwinNotifyCenter;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  void *v21;
  double v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  double v26;
  void *v27;
  void *Date_timeToLive_serverSignature_serverCerts_signedBag;
  IDSServerBagRawContents *v29;
  const char *v30;
  uint64_t v31;
  double v32;
  const char *v33;
  double v34;

  objc_msgSend_config(self, a2, (uint64_t)a3, v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_defaultsDomain(v6, v7, v8, v9);
  v10 = (__CFString *)objc_claimAutoreleasedReturnValue();

  v11 = (const __CFString *)*MEMORY[0x1E0C9B260];
  v12 = (const __CFString *)*MEMORY[0x1E0C9B230];
  CFPreferencesSynchronize(v10, (CFStringRef)*MEMORY[0x1E0C9B260], (CFStringRef)*MEMORY[0x1E0C9B230]);
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, self, (CFNotificationCallback)sub_19BA24024, CFSTR("__k_IDSServerBagFinishedLoadingDistributedNotification"), 0, CFNotificationSuspensionBehaviorCoalesce);
  v14 = (void *)CFPreferencesCopyValue(CFSTR("CachedBag"), v10, v11, v12);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v15 = v14;
    v16 = (void *)CFPreferencesCopyValue(CFSTR("CacheTime"), v10, v11, v12);
    v17 = (void *)CFPreferencesCopyValue(CFSTR("Date"), v10, v11, v12);
    v18 = (void *)CFPreferencesCopyValue(CFSTR("CachedSignature"), v10, v11, v12);
    v21 = (void *)CFPreferencesCopyValue(CFSTR("CacheCertificate"), v10, v11, v12);
    if (v17)
    {
      v23 = (void *)MEMORY[0x1E0C99D68];
      objc_msgSend_doubleValue(v17, v19, v20, v22);
      objc_msgSend_dateWithTimeIntervalSinceReferenceDate_(v23, v24, v25, v26);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v27 = 0;
    }
    v29 = [IDSServerBagRawContents alloc];
    objc_msgSend_doubleValue(v16, v30, v31, v32);
    Date_timeToLive_serverSignature_serverCerts_signedBag = (void *)objc_msgSend_initWithLoadDate_timeToLive_serverSignature_serverCerts_signedBag_(v29, v33, (uint64_t)v27, v34, v18, v21, v15);

  }
  else if (a3)
  {
    IDSServerBagContentErrorWithUnderlyingError(300, 0);
    Date_timeToLive_serverSignature_serverCerts_signedBag = 0;
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    Date_timeToLive_serverSignature_serverCerts_signedBag = 0;
  }

  return Date_timeToLive_serverSignature_serverCerts_signedBag;
}

- (void)setCacheDidReloadBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (id)loadOverrideValuesIfPresent
{
  uint64_t v2;
  double v3;
  void *v5;
  const char *v6;
  uint64_t v7;
  double v8;
  int isInternalInstall;
  const char *v10;
  uint64_t v11;
  double v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  double v16;
  __CFString *v17;
  void *v18;

  objc_msgSend_sharedInstance(MEMORY[0x1E0D36A50], a2, v2, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  isInternalInstall = objc_msgSend_isInternalInstall(v5, v6, v7, v8);

  if (!isInternalInstall)
    goto LABEL_4;
  objc_msgSend_config(self, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_defaultsDomain(v13, v14, v15, v16);
  v17 = (__CFString *)objc_claimAutoreleasedReturnValue();

  v18 = (void *)CFPreferencesCopyValue(CFSTR("OverrideValues"), v17, (CFStringRef)*MEMORY[0x1E0C9B260], (CFStringRef)*MEMORY[0x1E0C9B230]);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

LABEL_4:
    v18 = 0;
  }
  return v18;
}

- (IDSServerBagCacheLoader)initWithConfig:(id)a3 queue:(id)a4
{
  id v7;
  id v8;
  IDSServerBagCacheLoader *v9;
  IDSServerBagCacheLoader *v10;
  id v11;
  const char *v12;
  double v13;
  uint64_t v14;
  CUTDeferredTaskQueue *handleExternalLoadTaskQueue;
  IDSServerBagCacheLoader *v16;
  objc_super v18;

  v7 = a3;
  v8 = a4;
  if (v7)
  {
    v18.receiver = self;
    v18.super_class = (Class)IDSServerBagCacheLoader;
    v9 = -[IDSServerBagCacheLoader init](&v18, sel_init);
    v10 = v9;
    if (v9)
    {
      objc_storeStrong((id *)&v9->_config, a3);
      objc_storeStrong((id *)&v10->_queue, a4);
      v11 = objc_alloc(MEMORY[0x1E0D13200]);
      v14 = objc_msgSend_initWithCapacity_queue_block_(v11, v12, 1, v13, v8, &unk_1E3C1B770);
      handleExternalLoadTaskQueue = v10->_handleExternalLoadTaskQueue;
      v10->_handleExternalLoadTaskQueue = (CUTDeferredTaskQueue *)v14;

    }
    self = v10;
    v16 = self;
  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (IDSServerBagConfig)config
{
  return self->_config;
}

- (id)writeRawContents:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  double v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  double v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  double v15;
  NSObject *v16;
  id v17;
  _QWORD block[4];
  id v20;
  IDSServerBagCacheLoader *v21;
  void *v22;

  v4 = a3;
  objc_msgSend_config(self, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_defaultsDomain(v8, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_queue(self, v13, v14, v15);
  v16 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_19BA240F8;
  block[3] = &unk_1E3C20248;
  v21 = self;
  v22 = v12;
  v20 = v4;
  v17 = v4;
  dispatch_async(v16, block);

  return 0;
}

- (void)dealloc
{
  __CFNotificationCenter *DarwinNotifyCenter;
  objc_super v4;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, CFSTR("__k_IDSServerBagFinishedLoadingDistributedNotification"), 0);
  v4.receiver = self;
  v4.super_class = (Class)IDSServerBagCacheLoader;
  -[IDSServerBagCacheLoader dealloc](&v4, sel_dealloc);
}

- (id)writeOverrideValues:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  double v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  double v11;
  __CFString *v12;
  const char *v13;
  uint64_t v14;
  double v15;
  void *v16;
  id v17;
  const __CFString *v18;
  const __CFString *v19;
  const char *v20;
  uint64_t v21;
  double v22;
  NSObject *v23;
  _QWORD block[5];

  v4 = a3;
  objc_msgSend_config(self, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_defaultsDomain(v8, v9, v10, v11);
  v12 = (__CFString *)objc_claimAutoreleasedReturnValue();

  v16 = (void *)objc_msgSend_copy(v4, v13, v14, v15);
  v17 = v16;
  v18 = (const __CFString *)*MEMORY[0x1E0C9B260];
  v19 = (const __CFString *)*MEMORY[0x1E0C9B230];
  CFPreferencesSetValue(CFSTR("OverrideValues"), v17, v12, (CFStringRef)*MEMORY[0x1E0C9B260], (CFStringRef)*MEMORY[0x1E0C9B230]);

  CFPreferencesSynchronize(v12, v18, v19);
  objc_msgSend_queue(self, v20, v21, v22);
  v23 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_19BA2452C;
  block[3] = &unk_1E3C1F898;
  block[4] = self;
  dispatch_async(v23, block);

  return 0;
}

- (id)clearOverrideValues
{
  uint64_t v2;
  double v3;
  void *v5;
  const char *v6;
  uint64_t v7;
  double v8;
  __CFString *v9;
  const __CFString *v10;
  const __CFString *v11;
  const char *v12;
  uint64_t v13;
  double v14;
  NSObject *v15;
  _QWORD block[5];

  objc_msgSend_config(self, a2, v2, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_defaultsDomain(v5, v6, v7, v8);
  v9 = (__CFString *)objc_claimAutoreleasedReturnValue();

  v10 = (const __CFString *)*MEMORY[0x1E0C9B260];
  v11 = (const __CFString *)*MEMORY[0x1E0C9B230];
  CFPreferencesSetValue(CFSTR("OverrideValues"), 0, v9, (CFStringRef)*MEMORY[0x1E0C9B260], (CFStringRef)*MEMORY[0x1E0C9B230]);
  CFPreferencesSynchronize(v9, v10, v11);
  objc_msgSend_queue(self, v12, v13, v14);
  v15 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_19BA24614;
  block[3] = &unk_1E3C1F898;
  block[4] = self;
  dispatch_async(v15, block);

  return 0;
}

- (id)cacheDidReloadBlock
{
  return self->_cacheDidReloadBlock;
}

- (void)setConfig:(id)a3
{
  objc_storeStrong((id *)&self->_config, a3);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (BOOL)postingNotification
{
  return self->_postingNotification;
}

- (void)setPostingNotification:(BOOL)a3
{
  self->_postingNotification = a3;
}

- (CUTDeferredTaskQueue)handleExternalLoadTaskQueue
{
  return self->_handleExternalLoadTaskQueue;
}

- (void)setHandleExternalLoadTaskQueue:(id)a3
{
  objc_storeStrong((id *)&self->_handleExternalLoadTaskQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_handleExternalLoadTaskQueue, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_config, 0);
  objc_storeStrong(&self->_cacheDidReloadBlock, 0);
}

@end
