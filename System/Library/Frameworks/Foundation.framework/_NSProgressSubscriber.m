@implementation _NSProgressSubscriber

- (void)stop
{
  NSObject *v3;
  NSObject *v4;
  NSString *subscriberID;
  int v6;
  _NSProgressSubscriber *v7;
  __int16 v8;
  NSString *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = _NSProgressIPCDebugLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    v4 = _NSProgressIPCDebugLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      subscriberID = self->_subscriberID;
      v6 = 134218242;
      v7 = self;
      v8 = 2114;
      v9 = subscriberID;
      _os_log_debug_impl(&dword_1817D9000, v4, OS_LOG_TYPE_DEBUG, "<NSProgressSubscriber %p> Stop for ID %{public}@", (uint8_t *)&v6, 0x16u);
    }
  }
  -[NSLock lock](self->_lock, "lock");
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](self->_proxiesByPublisherID, "enumerateKeysAndObjectsUsingBlock:", &__block_literal_global_17);
  -[NSMutableDictionary removeAllObjects](self->_proxiesByPublisherID, "removeAllObjects");
  objc_msgSend((id)objc_msgSend(+[NSProgress _serverConnection](NSProgress, "_serverConnection"), "remoteObjectProxy"), "removeSubscriberForID:", self->_subscriberID);
  self->_started = 0;
  -[NSLock unlock](self->_lock, "unlock");
}

- (void)startForFileURL:(id)a3
{
  NSString *v5;
  NSObject *v6;
  uint64_t v7;
  NSObject *v8;
  NSString *subscriberID;
  int v10;
  _NSProgressSubscriber *v11;
  __int16 v12;
  NSString *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  -[NSLock lock](self->_lock, "lock");
  if (!self->_started)
  {
    self->_started = 1;
    v5 = -[NSBundle bundleIdentifier](+[NSBundle mainBundle](NSBundle, "mainBundle"), "bundleIdentifier");
    v6 = _NSProgressIPCDebugLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      v8 = _NSProgressIPCDebugLog();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      {
        subscriberID = self->_subscriberID;
        v10 = 134218499;
        v11 = self;
        v12 = 2114;
        v13 = subscriberID;
        v14 = 2113;
        v15 = a3;
        _os_log_debug_impl(&dword_1817D9000, v8, OS_LOG_TYPE_DEBUG, "<NSProgressSubscriber %p> Start for ID %{public}@ URL %{private}@", (uint8_t *)&v10, 0x20u);
      }
    }
    objc_msgSend((id)objc_msgSend(+[NSProgress _serverConnection](NSProgress, "_serverConnection", v7), "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_14_1), "addSubscriber:forID:appBundleID:fileURL:completionHandler:", self, self->_subscriberID, -[NSString lowercaseString](v5, "lowercaseString"), a3, &__block_literal_global_15);
  }
  -[NSLock unlock](self->_lock, "unlock");
}

- (void)observePublisherUserInfoForID:(id)a3 value:(id)a4 forKey:(id)a5
{
  id v9;

  -[NSLock lock](self->_lock, "lock");
  v9 = (id)-[NSMutableDictionary objectForKey:](self->_proxiesByPublisherID, "objectForKey:", a3);
  -[NSLock unlock](self->_lock, "unlock");
  objc_msgSend(v9, "_setRemoteUserInfoValue:forKey:", a4, a5);

}

- (_NSProgressSubscriber)initWithPublishingHandler:(id)a3
{
  _NSProgressSubscriber *v4;
  objc_super v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v6.receiver = self;
  v6.super_class = (Class)_NSProgressSubscriber;
  v4 = -[_NSProgressSubscriber init](&v6, sel_init);
  if (v4)
  {
    v4->_publishingHandler = (id)objc_msgSend(a3, "copy");
    v4->_subscriberID = -[NSUUID UUIDString](+[NSUUID UUID](NSUUID, "UUID"), "UUIDString");
    v4->_proxiesByPublisherID = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    v4->_lock = (NSLock *)objc_opt_new();
  }
  return v4;
}

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  if (self->_started)
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("NSProgress: you invoked +[NSProgress addSubscriber...] but then didn't pass the result to +[NSProgress removeSubscriber:] before it was released. Not allowed."), 0));

  v3.receiver = self;
  v3.super_class = (Class)_NSProgressSubscriber;
  -[_NSProgressSubscriber dealloc](&v3, sel_dealloc);
}

- (void)addPublisher:(id)a3 forID:(id)a4 withValues:(id)a5 isOld:(BOOL)a6
{
  id v9;
  _BOOL4 started;
  NSObject *v11;
  NSObject *v12;
  _BOOL4 v13;
  _QWORD v14[6];
  uint8_t buf[4];
  _NSProgressSubscriber *v16;
  __int16 v17;
  id v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v9 = -[_NSProgressProxy _initWithForwarder:values:isOld:]([_NSProgressProxy alloc], "_initWithForwarder:values:isOld:", a3, a5, a6);
  -[NSLock lock](self->_lock, "lock");
  started = self->_started;
  if (self->_started)
    -[NSMutableDictionary setObject:forKey:](self->_proxiesByPublisherID, "setObject:forKey:", v9, a4);
  -[NSLock unlock](self->_lock, "unlock");
  v11 = _NSProgressIPCDebugLog();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    v12 = _NSProgressIPCDebugLog();
    v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG);
    if (started)
    {
      if (v13)
      {
        *(_DWORD *)buf = 134218498;
        v16 = self;
        v17 = 2048;
        v18 = a3;
        v19 = 2114;
        v20 = a4;
        _os_log_debug_impl(&dword_1817D9000, v12, OS_LOG_TYPE_DEBUG, "<NSProgressSubscriber %p> Add publisher %p forID: %{public}@", buf, 0x20u);
      }
      goto LABEL_8;
    }
    if (v13)
    {
      *(_DWORD *)buf = 134218498;
      v16 = self;
      v17 = 2048;
      v18 = a3;
      v19 = 2114;
      v20 = a4;
      _os_log_debug_impl(&dword_1817D9000, v12, OS_LOG_TYPE_DEBUG, "<NSProgressSubscriber %p> Ignoring add publisher %p forID: %{public}@, because subscriber is stopped", buf, 0x20u);
    }
  }
  else if (started)
  {
LABEL_8:
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __61___NSProgressSubscriber_addPublisher_forID_withValues_isOld___block_invoke;
    v14[3] = &unk_1E0F55DE8;
    v14[4] = self;
    v14[5] = a4;
    objc_msgSend(v9, "_invokePublishingHandler:", v14);
  }

}

- (void)startForCategory:(id)a3
{
  NSString *v5;
  NSObject *v6;
  uint64_t v7;
  NSObject *v8;
  NSString *subscriberID;
  int v10;
  _NSProgressSubscriber *v11;
  __int16 v12;
  NSString *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  -[NSLock lock](self->_lock, "lock");
  if (!self->_started)
  {
    self->_started = 1;
    v5 = -[NSBundle bundleIdentifier](+[NSBundle mainBundle](NSBundle, "mainBundle"), "bundleIdentifier");
    v6 = _NSProgressIPCDebugLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      v8 = _NSProgressIPCDebugLog();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      {
        subscriberID = self->_subscriberID;
        v10 = 134218498;
        v11 = self;
        v12 = 2114;
        v13 = subscriberID;
        v14 = 2114;
        v15 = a3;
        _os_log_debug_impl(&dword_1817D9000, v8, OS_LOG_TYPE_DEBUG, "<NSProgressSubscriber %p> Start for ID %{public}@ category %{public}@", (uint8_t *)&v10, 0x20u);
      }
    }
    objc_msgSend((id)objc_msgSend(+[NSProgress _serverConnection](NSProgress, "_serverConnection", v7), "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_91), "addSubscriber:forID:appBundleID:category:completionHandler:", self, self->_subscriberID, -[NSString lowercaseString](v5, "lowercaseString"), objc_msgSend(a3, "lowercaseString"), &__block_literal_global_12);
  }
  -[NSLock unlock](self->_lock, "unlock");
}

- (void)observePublisherForID:(id)a3 values:(id)a4 forKeys:(id)a5
{
  id v9;

  -[NSLock lock](self->_lock, "lock");
  v9 = (id)-[NSMutableDictionary objectForKey:](self->_proxiesByPublisherID, "objectForKey:", a3);
  -[NSLock unlock](self->_lock, "unlock");
  objc_msgSend(v9, "_setRemoteValues:forKeys:", a4, a5);

}

- (void)removePublisherForID:(id)a3
{
  void *v5;
  NSObject *v6;
  NSObject *v7;
  int v8;
  _NSProgressSubscriber *v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  -[NSLock lock](self->_lock, "lock");
  v5 = (void *)-[NSMutableDictionary objectForKey:](self->_proxiesByPublisherID, "objectForKey:", a3);
  v6 = _NSProgressIPCDebugLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    v7 = _NSProgressIPCDebugLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      v8 = 134218242;
      v9 = self;
      v10 = 2114;
      v11 = a3;
      _os_log_debug_impl(&dword_1817D9000, v7, OS_LOG_TYPE_DEBUG, "<NSProgressSubscriber %p> Remove publisher forID: %{public}@", (uint8_t *)&v8, 0x16u);
    }
  }
  objc_msgSend(v5, "_invokeUnpublishingHandler");
  -[NSMutableDictionary removeObjectForKey:](self->_proxiesByPublisherID, "removeObjectForKey:", a3);
  -[NSLock unlock](self->_lock, "unlock");
}

@end
