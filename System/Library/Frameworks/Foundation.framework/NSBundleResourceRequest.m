@implementation NSBundleResourceRequest

+ (id)_connection
{
  id result;

  result = (id)qword_1ECD056B8;
  if (!qword_1ECD056B8)
  {
    if (qword_1ECD056C8 != -1)
      dispatch_once(&qword_1ECD056C8, &__block_literal_global_212);
    return (id)qword_1ECD056C0;
  }
  return result;
}

void __38__NSBundleResourceRequest__connection__block_invoke()
{
  qword_1ECD056C0 = -[NSXPCConnection initWithMachServiceName:options:]([NSXPCConnection alloc], "initWithMachServiceName:options:", CFSTR("com.apple.ondemandd.client"), 0);
  _setupConnection((void *)qword_1ECD056C0);
}

+ (void)_setConnection:(id)a3
{
  id v4;

  if (qword_1ECD056B8)
  {
    objc_msgSend((id)qword_1ECD056B8, "invalidate");

  }
  v4 = a3;
  qword_1ECD056B8 = (uint64_t)v4;
  if (a3)
    _setupConnection(v4);
}

+ (void)_flushCacheForBundle:(id)a3
{
  objc_opt_self();
  os_unfair_lock_lock((os_unfair_lock_t)&_MergedGlobals_1_0);
  if (qword_1ECD05698)
    objc_msgSend((id)qword_1ECD05698, "removeObjectForKey:", a3);
  os_unfair_lock_unlock((os_unfair_lock_t)&_MergedGlobals_1_0);
}

- (NSBundleResourceRequest)init
{
  objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("init is unavailable"), 0));
}

- (NSBundleResourceRequest)initWithTag:(id)a3
{
  return -[NSBundleResourceRequest initWithTags:bundle:](self, "initWithTags:bundle:", objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", a3), +[NSBundle mainBundle](NSBundle, "mainBundle"));
}

- (NSBundleResourceRequest)initWithTags:(NSSet *)tags
{
  return -[NSBundleResourceRequest initWithTags:bundle:](self, "initWithTags:bundle:", tags, +[NSBundle mainBundle](NSBundle, "mainBundle"));
}

- (NSBundleResourceRequest)initWithTags:(NSSet *)tags bundle:(NSBundle *)bundle
{
  NSBundleResourceRequest *v6;
  NSProgress *v7;
  objc_super v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v9.receiver = self;
  v9.super_class = (Class)NSBundleResourceRequest;
  v6 = -[NSBundleResourceRequest init](&v9, sel_init);
  if (v6)
  {
    v6->_tags = (NSSet *)-[NSSet copy](tags, "copy");
    v6->_priority = 0.5;
    v6->_bundle = bundle;
    v7 = -[NSProgress initWithParent:userInfo:]([NSProgress alloc], "initWithParent:userInfo:", 0, 0);
    v6->_progress = v7;
    -[NSProgress set_adoptChildUserInfo:](v7, "set_adoptChildUserInfo:", 1);
    -[NSProgress setTotalUnitCount:](v6->_progress, "setTotalUnitCount:", 1);
    -[NSProgress setUserInfoObject:forKey:](v6->_progress, "setUserInfoObject:forKey:", CFSTR("NSProgressFileOperationKindDownloading"), CFSTR("NSProgressFileOperationKindKey"));
    v6->_fetchState = 0;
  }
  return v6;
}

- (void)dealloc
{
  int64_t fetchState;
  objc_super v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  fetchState = self->_fetchState;
  if ((unint64_t)(fetchState - 3) >= 2)
  {
    if (fetchState == 2)
      objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], CFSTR("There appears to have been an overrelease of the NSBundleResourceRequest object"), 0));
  }
  else
  {
    -[NSBundleResourceRequest endAccessingResources](self, "endAccessingResources");
  }

  v4.receiver = self;
  v4.super_class = (Class)NSBundleResourceRequest;
  -[NSBundleResourceRequest dealloc](&v4, sel_dealloc);
}

+ (id)_assetPackBundleForBundle:(id)a3 withAssetPackID:(id)a4
{
  _NSBundleODRDataForApplications *v6;
  _NSBundleODRDataForApplications *v7;
  uint64_t v8;
  _NSBundleODRDataForExtensions *v9;
  _NSBundleODRDataForExtensions *v10;

  v6 = +[_NSBundleODRDataForApplications dataForBundle:createIfRequired:]((uint64_t)_NSBundleODRDataForApplications, (uint64_t)a3, 0);
  if (v6)
  {
    v7 = v6;
    -[NSLock lock](v6->super._lock, "lock");
    v8 = -[NSMutableDictionary objectForKey:](v7->super._assetPackToURL, "objectForKey:", a4);
    -[NSLock unlock](v7->super._lock, "unlock");
    if (v8)
      return +[NSBundle bundleWithURL:](NSBundle, "bundleWithURL:", v8);
  }
  v9 = +[_NSBundleODRDataForExtensions dataForBundle:createIfRequired:]((uint64_t)_NSBundleODRDataForExtensions, (uint64_t)a3, 0);
  if (v9
    && (v10 = v9,
        -[NSLock lock](v9->super._lock, "lock"),
        v8 = -[NSMutableDictionary objectForKey:](v10->super._assetPackToURL, "objectForKey:", a4),
        -[NSLock unlock](v10->super._lock, "unlock"),
        v8))
  {
    return +[NSBundle bundleWithURL:](NSBundle, "bundleWithURL:", v8);
  }
  else
  {
    return 0;
  }
}

+ (id)_manifestWithBundle:(id)a3 error:(id *)a4
{
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const __CFString *v11;
  _QWORD v13[6];
  id v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  if (!a3)
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("The bundle was nil"), 0));
  v5 = objc_msgSend(a3, "URLForResource:withExtension:", CFSTR("OnDemandResources.plist"), 0);
  if (!v5)
  {
    if (a4)
    {
      v8 = 100;
      v9 = 0;
LABEL_13:
      v6 = 0;
      *a4 = +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("_NSBundleResourceRequestErrorDomain"), v8, v9);
      return v6;
    }
    return 0;
  }
  v15[0] = 0;
  if (!objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfURL:options:error:", v5, 0, v15))
  {
    if (a4)
    {
      v9 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObject:forKey:", v15[0], CFSTR("NSUnderlyingError"));
      v8 = 101;
      goto LABEL_13;
    }
    return 0;
  }
  v13[5] = 0;
  v14 = 0;
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", CFSTR("NSBundleResourceRequestTags"));
  if ((_CFPropertyListCreateFiltered() & 1) == 0)
    return 0;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if (a4)
    {
      v10 = (void *)MEMORY[0x1E0C99D80];
      v11 = CFSTR("Manifest is not a dictionary");
LABEL_18:
      *a4 = +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("_NSBundleResourceRequestErrorDomain"), 101, objc_msgSend(v10, "dictionaryWithObject:forKey:", v11, CFSTR("NSDebugDescription")));
    }
LABEL_19:

    return 0;
  }
  v6 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v7 = (void *)objc_msgSend(v14, "objectForKey:", CFSTR("NSBundleResourceRequestTags"));
  if (!v7)
  {
    if (a4)
    {
      v10 = (void *)MEMORY[0x1E0C99D80];
      v11 = CFSTR("Manifest has no tags");
      goto LABEL_18;
    }
    goto LABEL_19;
  }
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __53__NSBundleResourceRequest__manifestWithBundle_error___block_invoke;
  v13[3] = &unk_1E0F50DB8;
  v13[4] = v6;
  objc_msgSend(v7, "enumerateKeysAndObjectsUsingBlock:", v13);

  return v6;
}

uint64_t __53__NSBundleResourceRequest__manifestWithBundle_error___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5;

  v5 = objc_msgSend(a3, "objectForKey:", CFSTR("NSAssetPacks"));
  if (!v5)
    v5 = objc_msgSend(MEMORY[0x1E0C99D20], "array");
  return objc_msgSend(*(id *)(a1 + 32), "setObject:forKey:", v5, a2);
}

- (NSProgress)progress
{
  return self->_progress;
}

- (double)loadingPriority
{
  return self->_priority;
}

- (void)setLoadingPriority:(double)loadingPriority
{
  double v3;
  BOOL v5;
  double v6;

  if (self->_priority != loadingPriority)
  {
    v3 = 1.0;
    if (loadingPriority == 1.79769313e308 || loadingPriority <= 1.0)
      v3 = loadingPriority;
    v5 = loadingPriority < 0.0;
    v6 = 0.0;
    if (!v5)
      v6 = v3;
    self->_priority = v6;
    if (self->_fetchState == 2)
      objc_msgSend((id)objc_msgSend(+[NSBundleResourceRequest _connection](NSBundleResourceRequest, "_connection"), "remoteObjectProxy"), "setLoadingPriority:forTags:inBundle:", self->_tags, -[NSBundle bundleURL](self->_bundle, "bundleURL"), self->_priority);
  }
}

- (NSSet)tags
{
  return (NSSet *)(id)-[NSSet copy](self->_tags, "copy");
}

- (NSBundle)bundle
{
  return self->_bundle;
}

- (void)beginAccessingResourcesWithCompletionHandler:(void *)completionHandler
{
  int64_t *p_fetchState;
  NSObject *v7;
  _NSBundleODRDataForApplications *v8;
  id v9;
  NSObject *initialStateGroup;
  dispatch_time_t v11;
  NSProgress *v12;
  uint64_t v13;
  void *v14;
  NSSet *tags;
  NSURL *v16;
  double priority;
  NSBundle *bundle;
  NSString *v19;
  _QWORD v20[7];
  _QWORD v21[6];
  uint8_t buf[4];
  NSBundleResourceRequest *v23;
  __int16 v24;
  NSBundle *v25;
  __int16 v26;
  NSString *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  p_fetchState = &self->_fetchState;
  do
  {
    if (__ldxr((unint64_t *)p_fetchState))
    {
      __clrex();
      objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("beginAccessingResources was called more than once or at the wrong time (%ld)"), *p_fetchState), 0));
    }
  }
  while (__stxr(2uLL, (unint64_t *)p_fetchState));
  if (qword_1ECD056F0 != -1)
    dispatch_once(&qword_1ECD056F0, &__block_literal_global_300);
  v7 = qword_1ECD056E8;
  if (os_log_type_enabled((os_log_t)qword_1ECD056E8, OS_LOG_TYPE_DEBUG))
  {
    bundle = self->_bundle;
    v19 = -[NSArray componentsJoinedByString:](-[NSSet allObjects](self->_tags, "allObjects"), "componentsJoinedByString:", CFSTR(","));
    *(_DWORD *)buf = 134218498;
    v23 = self;
    v24 = 2048;
    v25 = bundle;
    v26 = 2114;
    v27 = v19;
    _os_log_debug_impl(&dword_1817D9000, v7, OS_LOG_TYPE_DEBUG, "Begin: Request 0x%p / Bundle 0x%p / Tags: \"%{public}@\", buf, 0x20u);
  }
  v8 = +[_NSBundleODRDataForApplications dataForBundle:createIfRequired:]((uint64_t)_NSBundleODRDataForApplications, (uint64_t)self->_bundle, 1);
  v9 = +[NSBundleResourceRequest _connection](NSBundleResourceRequest, "_connection");
  if (v8)
  {
    initialStateGroup = v8->_initialStateGroup;
    v11 = dispatch_time(0, 3000000000);
    dispatch_group_wait(initialStateGroup, v11);
  }
  v12 = +[NSProgress progressWithTotalUnitCount:parent:pendingUnitCount:](NSProgress, "progressWithTotalUnitCount:parent:pendingUnitCount:", 1, self->_progress, 1);
  -[NSProgress set_adoptChildUserInfo:](v12, "set_adoptChildUserInfo:", 1);
  -[NSProgress becomeCurrentWithPendingUnitCount:](v12, "becomeCurrentWithPendingUnitCount:", 1);
  v13 = MEMORY[0x1E0C809B0];
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __72__NSBundleResourceRequest_beginAccessingResourcesWithCompletionHandler___block_invoke;
  v21[3] = &unk_1E0F50DE0;
  v21[4] = self;
  v21[5] = completionHandler;
  v14 = (void *)objc_msgSend(v9, "remoteObjectProxyWithErrorHandler:", v21);
  tags = self->_tags;
  v16 = -[NSBundle bundleURL](self->_bundle, "bundleURL");
  priority = self->_priority;
  v20[0] = v13;
  v20[1] = 3221225472;
  v20[2] = __72__NSBundleResourceRequest_beginAccessingResourcesWithCompletionHandler___block_invoke_242;
  v20[3] = &unk_1E0F50E08;
  v20[4] = v8;
  v20[5] = self;
  v20[6] = completionHandler;
  objc_msgSend(v14, "pinTags:inBundle:priority:completionHandler:", tags, v16, v20, priority);
  -[NSProgress resignCurrent](v12, "resignCurrent");
}

uint64_t __72__NSBundleResourceRequest_beginAccessingResourcesWithCompletionHandler___block_invoke(uint64_t a1)
{
  unint64_t *v2;
  unint64_t v3;
  NSObject *v4;
  uint64_t v6;
  int v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v2 = (unint64_t *)(*(_QWORD *)(a1 + 32) + 40);
  while (1)
  {
    v3 = __ldxr(v2);
    if (v3 != 2)
      break;
    if (!__stxr(4uLL, v2))
      return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  __clrex();
  if (qword_1ECD056F0 != -1)
    dispatch_once(&qword_1ECD056F0, &__block_literal_global_300);
  v4 = qword_1ECD056E8;
  if (os_log_type_enabled((os_log_t)qword_1ECD056E8, OS_LOG_TYPE_ERROR))
  {
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40);
    v7 = 134217984;
    v8 = v6;
    _os_log_error_impl(&dword_1817D9000, v4, OS_LOG_TYPE_ERROR, "Unexpected state upon completion of beginAccessingResourcesWithCompletionHandler (error handler) (%lld)", (uint8_t *)&v7, 0xCu);
  }
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40) = 4;
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

uint64_t __72__NSBundleResourceRequest_beginAccessingResourcesWithCompletionHandler___block_invoke_242(uint64_t a1, void *a2, NSError *a3)
{
  uint64_t v6;
  id v7;
  unint64_t *v8;
  unint64_t v9;
  unint64_t *v10;
  unint64_t v11;
  NSObject *v12;
  uint64_t (*v13)(void);
  unint64_t v14;
  char v15;
  NSObject *v16;
  NSObject *v17;
  uint64_t v18;
  NSObject *v19;
  NSString *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  NSString *v25;
  uint64_t v27;
  NSObject *v28;
  NSObject *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  _BYTE buf[12];
  __int16 v38;
  uint64_t v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v6 = *(_QWORD *)(a1 + 32);
  if (v6)
  {
    objc_msgSend(*(id *)(v6 + 16), "lock");
    v7 = *(id *)(v6 + 56);
    objc_msgSend(*(id *)(v6 + 16), "unlock");
    if (v7)
    {
      v8 = (unint64_t *)(*(_QWORD *)(a1 + 40) + 40);
      while (1)
      {
        v9 = __ldxr(v8);
        if (v9 != 2)
          break;
        if (!__stxr(4uLL, v8))
          goto LABEL_16;
      }
      __clrex();
      if (qword_1ECD056F0 != -1)
        dispatch_once(&qword_1ECD056F0, &__block_literal_global_300);
      v12 = qword_1ECD056E8;
      if (os_log_type_enabled((os_log_t)qword_1ECD056E8, OS_LOG_TYPE_ERROR))
      {
        v31 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 40);
        *(_DWORD *)buf = 134217984;
        *(_QWORD *)&buf[4] = v31;
        _os_log_error_impl(&dword_1817D9000, v12, OS_LOG_TYPE_ERROR, "Unexpected state upon completion of beginAccessingResourcesWithCompletionHandler (error case) (%lld)", buf, 0xCu);
      }
      *(_QWORD *)(*(_QWORD *)(a1 + 40) + 40) = 4;
LABEL_16:
      v13 = *(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16);
      return v13();
    }
  }
  v10 = (unint64_t *)(*(_QWORD *)(a1 + 40) + 40);
  if (a3)
  {
    while (1)
    {
      v11 = __ldxr(v10);
      if (v11 != 2)
        break;
      if (!__stxr(4uLL, v10))
        goto LABEL_25;
    }
    __clrex();
    if (qword_1ECD056F0 != -1)
      dispatch_once(&qword_1ECD056F0, &__block_literal_global_300);
    v16 = qword_1ECD056E8;
    if (os_log_type_enabled((os_log_t)qword_1ECD056E8, OS_LOG_TYPE_ERROR))
    {
      v35 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 40);
      *(_DWORD *)buf = 134217984;
      *(_QWORD *)&buf[4] = v35;
      _os_log_error_impl(&dword_1817D9000, v16, OS_LOG_TYPE_ERROR, "Unexpected state upon completion of beginAccessingResourcesWithCompletionHandler (error case) (%lld)", buf, 0xCu);
    }
    *(_QWORD *)(*(_QWORD *)(a1 + 40) + 40) = 4;
LABEL_25:
    if (-[NSString isEqualToString:](-[NSError domain](a3, "domain"), "isEqualToString:", CFSTR("NSCocoaErrorDomain"))
      && -[NSError code](a3, "code") == 3072)
    {
      if (qword_1ECD056F0 != -1)
        dispatch_once(&qword_1ECD056F0, &__block_literal_global_300);
      v17 = qword_1ECD056E8;
      if (os_log_type_enabled((os_log_t)qword_1ECD056E8, OS_LOG_TYPE_DEBUG))
      {
        v18 = *(_QWORD *)(a1 + 40);
        *(_DWORD *)buf = 134218242;
        *(_QWORD *)&buf[4] = v18;
        v38 = 2112;
        v39 = (uint64_t)a3;
        _os_log_debug_impl(&dword_1817D9000, v17, OS_LOG_TYPE_DEBUG, "Begin: Request 0x%p was cancelled (error: %@)", buf, 0x16u);
      }
    }
    else
    {
      if (qword_1ECD056F0 != -1)
        dispatch_once(&qword_1ECD056F0, &__block_literal_global_300);
      v19 = qword_1ECD056E8;
      if (os_log_type_enabled((os_log_t)qword_1ECD056E8, OS_LOG_TYPE_ERROR))
      {
        v32 = *(_QWORD *)(a1 + 40);
        *(_DWORD *)buf = 134218242;
        *(_QWORD *)&buf[4] = v32;
        v38 = 2112;
        v39 = (uint64_t)a3;
        _os_log_error_impl(&dword_1817D9000, v19, OS_LOG_TYPE_ERROR, "Begin: Request 0x%p response: Error: %@", buf, 0x16u);
      }
    }
    if (-[NSString isEqualToString:](-[NSError domain](a3, "domain"), "isEqualToString:", CFSTR("_NSBundleResourceRequestErrorDomain"))&& -[NSError code](a3, "code") == 101)
    {
      v20 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("At least one of the set of tags was not found in your application: %@"), *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8));
      a3 = +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("NSCocoaErrorDomain"), 4994, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObject:forKey:", v20, *MEMORY[0x1E0C9AFA8]));
    }
    if (-[NSString isEqualToString:](-[NSError domain](a3, "domain"), "isEqualToString:", CFSTR("NSCocoaErrorDomain")))
    {
      if (-[NSError code](a3, "code") == 4995)
      {
        v21 = objc_msgSend(-[NSDictionary objectForKey:](-[NSError userInfo](a3, "userInfo"), "objectForKey:", CFSTR("_NSBundleResourceRequestServerBusyTimeIntervalKey")), "integerValue");
        if (v21)
        {
          v22 = v21;
          v23 = (void *)objc_opt_new();
          objc_msgSend(v23, "setSecond:", v22);
          v24 = (void *)objc_opt_new();
          objc_msgSend(v24, "setUnitsStyle:", 3);
          objc_msgSend(v24, "setAllowedUnits:", 240);
          v25 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", objc_msgSend((id)_NSFoundationBundle(), "localizedStringForKey:value:table:", CFSTR("DetailedRecoverySuggestion4995"), CFSTR("Try again in %@."), CFSTR("FoundationErrors")), objc_msgSend(v24, "stringFromDateComponents:", v23));

          +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("NSCocoaErrorDomain"), 4995, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObject:forKey:", v25, CFSTR("NSLocalizedRecoverySuggestion")));
        }
      }
    }
    v13 = *(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16);
    return v13();
  }
  while (1)
  {
    v14 = __ldxr(v10);
    if (v14 != 2)
      break;
    if (!__stxr(3uLL, v10))
    {
      v15 = 1;
      goto LABEL_45;
    }
  }
  v15 = 0;
  __clrex();
LABEL_45:
  v27 = qword_1ECD056F0;
  if ((v15 & 1) == 0)
  {
    if (qword_1ECD056F0 != -1)
      dispatch_once(&qword_1ECD056F0, &__block_literal_global_300);
    v28 = qword_1ECD056E8;
    if (os_log_type_enabled((os_log_t)qword_1ECD056E8, OS_LOG_TYPE_ERROR))
    {
      v36 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 40);
      *(_DWORD *)buf = 134217984;
      *(_QWORD *)&buf[4] = v36;
      _os_log_error_impl(&dword_1817D9000, v28, OS_LOG_TYPE_ERROR, "Unexpected state upon completion of beginAccessingResourcesWithCompletionHandler (success case) (%lld)", buf, 0xCu);
      v27 = qword_1ECD056F0;
    }
    else
    {
      v27 = -1;
    }
    *(_QWORD *)(*(_QWORD *)(a1 + 40) + 40) = 3;
  }
  if (v27 != -1)
    dispatch_once(&qword_1ECD056F0, &__block_literal_global_300);
  v29 = qword_1ECD056E8;
  if (os_log_type_enabled((os_log_t)qword_1ECD056E8, OS_LOG_TYPE_DEBUG))
  {
    v33 = *(_QWORD *)(a1 + 40);
    v34 = objc_msgSend(a2, "count");
    *(_DWORD *)buf = 134218240;
    *(_QWORD *)&buf[4] = v33;
    v38 = 2048;
    v39 = v34;
    _os_log_debug_impl(&dword_1817D9000, v29, OS_LOG_TYPE_DEBUG, "Begin: Request 0x%p response: %lu packs now available", buf, 0x16u);
  }
  *(_QWORD *)buf = 0;
  if (objc_msgSend(*(id *)(a1 + 32), "assetPacksBecameAvailable:error:", a2, buf))
    v30 = 0;
  else
    v30 = *(_QWORD *)buf;
  return (*(uint64_t (**)(_QWORD, uint64_t))(*(_QWORD *)(a1 + 48) + 16))(*(_QWORD *)(a1 + 48), v30);
}

- (void)conditionallyBeginAccessingResourcesWithCompletionHandler:(void *)completionHandler
{
  _NSBundleODRDataForApplications *v5;
  int64_t *p_fetchState;
  NSObject *v8;
  id v9;
  uint64_t v10;
  void *v11;
  NSSet *tags;
  NSURL *v13;
  NSBundle *bundle;
  NSString *v15;
  _QWORD v16[7];
  _QWORD v17[6];
  uint8_t buf[4];
  NSBundleResourceRequest *v19;
  __int16 v20;
  NSBundle *v21;
  __int16 v22;
  NSString *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v5 = +[_NSBundleODRDataForApplications dataForBundle:createIfRequired:]((uint64_t)_NSBundleODRDataForApplications, (uint64_t)self->_bundle, 1);
  p_fetchState = &self->_fetchState;
  do
  {
    if (__ldxr((unint64_t *)p_fetchState))
    {
      __clrex();
      objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("beginAccessingResources was called more than once or at the wrong time (%ld)"), *p_fetchState), 0));
    }
  }
  while (__stxr(1uLL, (unint64_t *)p_fetchState));
  if (qword_1ECD056F0 != -1)
    dispatch_once(&qword_1ECD056F0, &__block_literal_global_300);
  v8 = qword_1ECD056E8;
  if (os_log_type_enabled((os_log_t)qword_1ECD056E8, OS_LOG_TYPE_DEBUG))
  {
    bundle = self->_bundle;
    v15 = -[NSArray componentsJoinedByString:](-[NSSet allObjects](self->_tags, "allObjects"), "componentsJoinedByString:", CFSTR(","));
    *(_DWORD *)buf = 134218498;
    v19 = self;
    v20 = 2048;
    v21 = bundle;
    v22 = 2114;
    v23 = v15;
    _os_log_debug_impl(&dword_1817D9000, v8, OS_LOG_TYPE_DEBUG, "Begin: Request (Conditional) 0x%p / Bundle 0x%p / Tags: \"%{public}@\", buf, 0x20u);
  }
  v9 = +[NSBundleResourceRequest _connection](NSBundleResourceRequest, "_connection");
  v10 = MEMORY[0x1E0C809B0];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __85__NSBundleResourceRequest_conditionallyBeginAccessingResourcesWithCompletionHandler___block_invoke;
  v17[3] = &unk_1E0F50DE0;
  v17[4] = self;
  v17[5] = completionHandler;
  v11 = (void *)objc_msgSend(v9, "remoteObjectProxyWithErrorHandler:", v17);
  tags = self->_tags;
  v13 = -[NSBundle bundleURL](self->_bundle, "bundleURL");
  v16[0] = v10;
  v16[1] = 3221225472;
  v16[2] = __85__NSBundleResourceRequest_conditionallyBeginAccessingResourcesWithCompletionHandler___block_invoke_253;
  v16[3] = &unk_1E0F50E30;
  v16[5] = v5;
  v16[6] = completionHandler;
  v16[4] = self;
  objc_msgSend(v11, "conditionallyPinTags:inBundle:completionHandler:", tags, v13, v16);
}

uint64_t __85__NSBundleResourceRequest_conditionallyBeginAccessingResourcesWithCompletionHandler___block_invoke(uint64_t a1)
{
  unint64_t *v2;
  unint64_t v3;
  NSObject *v4;
  uint64_t v6;
  int v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v2 = (unint64_t *)(*(_QWORD *)(a1 + 32) + 40);
  while (1)
  {
    v3 = __ldxr(v2);
    if (v3 != 1)
      break;
    if (!__stxr(0, v2))
      return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  __clrex();
  if (qword_1ECD056F0 != -1)
    dispatch_once(&qword_1ECD056F0, &__block_literal_global_300);
  v4 = qword_1ECD056E8;
  if (os_log_type_enabled((os_log_t)qword_1ECD056E8, OS_LOG_TYPE_ERROR))
  {
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40);
    v7 = 134217984;
    v8 = v6;
    _os_log_error_impl(&dword_1817D9000, v4, OS_LOG_TYPE_ERROR, "Unexpected state upon completion of conditionallyBeginAccessingResourcesWithCompletionHandler (error handler) (%lld)", (uint8_t *)&v7, 0xCu);
  }
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40) = 0;
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

uint64_t __85__NSBundleResourceRequest_conditionallyBeginAccessingResourcesWithCompletionHandler___block_invoke_253(uint64_t a1, int a2, void *a3)
{
  NSObject *v6;
  unint64_t *v7;
  unint64_t v8;
  unint64_t v9;
  NSObject *v10;
  uint64_t (*v11)(void);
  NSObject *v12;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  int v18;
  uint64_t v19;
  __int16 v20;
  uint64_t v21;
  __int16 v22;
  int v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  if (qword_1ECD056F0 != -1)
    dispatch_once(&qword_1ECD056F0, &__block_literal_global_300);
  v6 = qword_1ECD056E8;
  if (os_log_type_enabled((os_log_t)qword_1ECD056E8, OS_LOG_TYPE_DEBUG))
  {
    v14 = *(_QWORD *)(a1 + 32);
    if (a2)
      v15 = objc_msgSend(a3, "count");
    else
      v15 = 0;
    v18 = 134218496;
    v19 = v14;
    v20 = 2048;
    v21 = v15;
    v22 = 1024;
    v23 = a2;
    _os_log_debug_impl(&dword_1817D9000, v6, OS_LOG_TYPE_DEBUG, "Begin: Request (Conditional) 0x%p response: Available %lu : %d packs", (uint8_t *)&v18, 0x1Cu);
  }
  v7 = (unint64_t *)(*(_QWORD *)(a1 + 32) + 40);
  if ((a2 & 1) != 0)
  {
    while (1)
    {
      v8 = __ldxr(v7);
      if (v8 != 1)
        break;
      if (!__stxr(3uLL, v7))
        goto LABEL_16;
    }
    __clrex();
    if (qword_1ECD056F0 != -1)
      dispatch_once(&qword_1ECD056F0, &__block_literal_global_300);
    v10 = qword_1ECD056E8;
    if (os_log_type_enabled((os_log_t)qword_1ECD056E8, OS_LOG_TYPE_ERROR))
    {
      v16 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40);
      v18 = 134217984;
      v19 = v16;
      _os_log_error_impl(&dword_1817D9000, v10, OS_LOG_TYPE_ERROR, "Unexpected state upon completion of conditionallyBeginAccessingResourcesWithCompletionHandler (available case) (%lld)", (uint8_t *)&v18, 0xCu);
    }
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40) = 3;
LABEL_16:
    objc_msgSend(*(id *)(a1 + 40), "assetPacksBecameAvailable:error:", a3, 0);
    v11 = *(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16);
  }
  else
  {
    while (1)
    {
      v9 = __ldxr(v7);
      if (v9 != 1)
        break;
      if (!__stxr(0, v7))
        goto LABEL_22;
    }
    __clrex();
    if (qword_1ECD056F0 != -1)
      dispatch_once(&qword_1ECD056F0, &__block_literal_global_300);
    v12 = qword_1ECD056E8;
    if (os_log_type_enabled((os_log_t)qword_1ECD056E8, OS_LOG_TYPE_ERROR))
    {
      v17 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40);
      v18 = 134217984;
      v19 = v17;
      _os_log_error_impl(&dword_1817D9000, v12, OS_LOG_TYPE_ERROR, "Unexpected state upon completion of conditionallyBeginAccessingResourcesWithCompletionHandler (unavailable case) (%lld)", (uint8_t *)&v18, 0xCu);
    }
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40) = 0;
LABEL_22:
    v11 = *(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16);
  }
  return v11();
}

- (void)endAccessingResources
{
  NSObject *v3;
  int64_t *p_fetchState;
  unint64_t v5;
  NSSet *tags;
  NSBundle *bundle;
  NSSet *v8;
  NSBundle *v9;
  _NSBundleODRDataForApplications *v10;
  id v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  _QWORD v15[6];
  __int128 buf;
  void (*v17)(id *, void *);
  void *v18;
  _NSBundleODRDataForApplications *v19;
  id v20;
  NSSet *v21;
  NSBundle *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  if (qword_1ECD056F0 != -1)
    dispatch_once(&qword_1ECD056F0, &__block_literal_global_300);
  v3 = qword_1ECD056E8;
  if (os_log_type_enabled((os_log_t)qword_1ECD056E8, OS_LOG_TYPE_DEBUG))
  {
    LODWORD(buf) = 134217984;
    *(_QWORD *)((char *)&buf + 4) = self;
    _os_log_debug_impl(&dword_1817D9000, v3, OS_LOG_TYPE_DEBUG, "End: Request 0x%p", (uint8_t *)&buf, 0xCu);
  }
  p_fetchState = &self->_fetchState;
  while (1)
  {
    v5 = __ldxr((unint64_t *)p_fetchState);
    if (v5 != 3)
      break;
    if (!__stxr(5uLL, (unint64_t *)p_fetchState))
    {
      tags = self->_tags;
      bundle = self->_bundle;
      v8 = tags;
      v9 = bundle;
      v10 = +[_NSBundleODRDataForApplications dataForBundle:createIfRequired:]((uint64_t)_NSBundleODRDataForApplications, (uint64_t)bundle, 1);
      v11 = +[NSBundleResourceRequest _connection](NSBundleResourceRequest, "_connection");
      v12 = MEMORY[0x1E0C809B0];
      v15[0] = MEMORY[0x1E0C809B0];
      v15[1] = 3221225472;
      v15[2] = ___endAccessingResources_block_invoke;
      v15[3] = &unk_1E0F50E80;
      v15[4] = tags;
      v15[5] = bundle;
      v13 = (void *)objc_msgSend(v11, "remoteObjectProxyWithErrorHandler:", v15);
      v14 = -[NSBundle bundleURL](bundle, "bundleURL");
      *(_QWORD *)&buf = v12;
      *((_QWORD *)&buf + 1) = 3221225472;
      v17 = ___endAccessingResources_block_invoke_2;
      v18 = &unk_1E0F50EA8;
      v19 = v10;
      v20 = v11;
      v21 = tags;
      v22 = bundle;
      objc_msgSend(v13, "unpinTags:inBundle:completionHandler:", tags, v14, &buf);
      return;
    }
  }
  __clrex();
}

+ (id)_extensionEndpoint
{
  return 0;
}

+ (id)_extensionEndpointForMainBundleOfHostApplication:(id)a3
{
  _QWORD v4[6];

  v4[5] = *MEMORY[0x1E0C80C00];
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __123__NSBundleResourceRequest__NSBundleResourceRequestAppExtensionAdditions___extensionEndpointForMainBundleOfHostApplication___block_invoke;
  v4[3] = &unk_1E0F4D2D8;
  v4[4] = a3;
  if (qword_1ECD056E0 != -1)
    dispatch_once(&qword_1ECD056E0, v4);
  return (id)objc_msgSend((id)qword_1ECD056D0, "endpoint");
}

uint64_t __123__NSBundleResourceRequest__NSBundleResourceRequestAppExtensionAdditions___extensionEndpointForMainBundleOfHostApplication___block_invoke(uint64_t a1)
{
  qword_1ECD056D0 = +[NSXPCListener anonymousListener](NSXPCListener, "anonymousListener");
  qword_1ECD056D8 = (uint64_t)+[_NSBundleODRDataForExtensions dataForBundle:createIfRequired:]((uint64_t)_NSBundleODRDataForExtensions, *(_QWORD *)(a1 + 32), 1);
  objc_msgSend((id)qword_1ECD056D0, "setDelegate:", qword_1ECD056D8);
  return objc_msgSend((id)qword_1ECD056D0, "resume");
}

+ (void)_addExtensionEndpoint:(id)a3
{
  _NSBundleODRDataForApplications *v4;
  _NSBundleODRDataForApplications *v5;
  NSXPCConnection *v6;
  NSMutableSet *extensionConnections;
  NSString *rootSandboxPath;
  _QWORD v9[7];

  v9[6] = *MEMORY[0x1E0C80C00];
  v4 = +[_NSBundleODRDataForApplications dataForBundle:createIfRequired:]((uint64_t)_NSBundleODRDataForApplications, (uint64_t)+[NSBundle mainBundle](NSBundle, "mainBundle"), 1);
  if (v4)
  {
    v5 = v4;
    v6 = -[NSXPCConnection initWithListenerEndpoint:]([NSXPCConnection alloc], "initWithListenerEndpoint:", a3);
    -[NSXPCConnection setRemoteObjectInterface:](v6, "setRemoteObjectInterface:", _appExtensionInterface());
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __56___NSBundleODRDataForApplications_addExtensionEndpoint___block_invoke;
    v9[3] = &unk_1E0F4C650;
    v9[4] = v5;
    v9[5] = v6;
    -[NSXPCConnection setInvalidationHandler:](v6, "setInvalidationHandler:", v9);
    -[NSXPCConnection resume](v6, "resume");
    -[NSLock lock](v5->super._lock, "lock");
    extensionConnections = v5->_extensionConnections;
    if (!extensionConnections)
    {
      extensionConnections = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
      v5->_extensionConnections = extensionConnections;
    }
    -[NSMutableSet addObject:](extensionConnections, "addObject:", v6);
    rootSandboxPath = v5->_rootSandboxPath;
    if (rootSandboxPath)
    {
      -[NSString UTF8String](rootSandboxPath, "UTF8String");
      objc_msgSend(-[NSXPCConnection remoteObjectProxy](v6, "remoteObjectProxy"), "accessSandboxExtension:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", sandbox_extension_issue_file()));
    }
    -[NSLock unlock](v5->super._lock, "unlock");
  }
}

@end
