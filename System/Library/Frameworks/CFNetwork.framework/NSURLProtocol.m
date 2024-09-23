@implementation NSURLProtocol

+ (void)setProperty:(id)value forKey:(NSString *)key inRequest:(NSMutableURLRequest *)request
{
  uint8_t v8[16];
  uint8_t buf[16];

  if (!key && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_fault_impl(&dword_183ECA000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "assertion failure", buf, 2u);
    if (request)
      goto LABEL_6;
  }
  else if (request)
  {
    goto LABEL_6;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)v8 = 0;
    _os_log_fault_impl(&dword_183ECA000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "assertion failure", v8, 2u);
  }
LABEL_6:
  -[NSURLRequest _setProperty:forKey:](request, "_setProperty:forKey:", value, key);
}

+ (BOOL)canInitWithTask:(NSURLSessionTask *)task
{
  return objc_msgSend(a1, "canInitWithRequest:", -[NSURLSessionTask currentRequest](task, "currentRequest"));
}

+ (id)propertyForKey:(NSString *)key inRequest:(NSURLRequest *)request
{
  uint8_t v7[16];
  uint8_t buf[16];

  if (!key && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_fault_impl(&dword_183ECA000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "assertion failure", buf, 2u);
    if (request)
      return -[NSURLRequest _propertyForKey:](request, "_propertyForKey:", key);
  }
  else if (request)
  {
    return -[NSURLRequest _propertyForKey:](request, "_propertyForKey:", key);
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_fault_impl(&dword_183ECA000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "assertion failure", v7, 2u);
  }
  return -[NSURLRequest _propertyForKey:](request, "_propertyForKey:", key);
}

+ (BOOL)registerClass:(Class)protocolClass
{
  uint64_t v4;
  void *v5;

  objc_opt_self();
  v4 = -[objc_class superclass](protocolClass, "superclass");
  if (v4)
  {
    v5 = (void *)v4;
    while (v5 != (void *)objc_opt_self())
    {
      v4 = objc_msgSend(v5, "superclass");
      v5 = (void *)v4;
      if (!v4)
        return v4;
    }
    os_unfair_lock_lock((os_unfair_lock_t)&_localProtocolClassesForDefaultSessionLock);
    if (_localProtocolClassesForDefaultSession)
      objc_msgSend((id)_localProtocolClassesForDefaultSession, "insertObject:atIndex:", protocolClass, 0);
    else
      _localProtocolClassesForDefaultSession = (uint64_t)(id)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithObject:", protocolClass);
    os_unfair_lock_unlock((os_unfair_lock_t)&_localProtocolClassesForDefaultSessionLock);
    LOBYTE(v4) = 1;
  }
  return v4;
}

+ (Class)_protocolClassForRequest:(id)a3 skipAppSSO:(BOOL)a4
{
  _BOOL4 v4;
  void *v6;
  NSURLSessionTask *v7;
  objc_class *v8;

  v4 = a4;
  v6 = (void *)+[NSURLSession _sharedSessionForConnection]();
  v7 = -[NSURLSessionTask initWithOriginalRequest:ident:taskGroup:]([NSURLSessionTask alloc], "initWithOriginalRequest:ident:taskGroup:", a3, 0, objc_msgSend(v6, "defaultTaskGroup"));
  v8 = (objc_class *)-[__NSURLSessionLocal _protocolClassForTask:skipAppSSO:]((uint64_t)v6, v7, v4);

  return v8;
}

- (NSURLProtocol)init
{
  return -[NSURLProtocol initWithRequest:cachedResponse:client:](self, "initWithRequest:cachedResponse:client:", +[NSURLRequest requestWithURL:](NSURLRequest, "requestWithURL:", 0), 0, 0);
}

- (NSURLProtocol)initWithRequest:(NSURLRequest *)request cachedResponse:(NSCachedURLResponse *)cachedResponse client:(id)client
{
  NSURLProtocol *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)NSURLProtocol;
  v8 = -[NSURLProtocol init](&v10, sel_init);
  if (v8)
    v8->_internal = (NSURLProtocolInternal *)-[NSURLProtocolInternal initWithRequest:cachedResponse:client:]([NSURLProtocolInternal alloc], request, cachedResponse, client);
  return v8;
}

- (id)client
{
  NSURLProtocolInternal *internal;

  internal = self->_internal;
  if (internal)
    return internal->client;
  else
    return 0;
}

- (NSURLRequest)request
{
  NSURLProtocolInternal *internal;

  internal = self->_internal;
  if (internal)
    return internal->request;
  else
    return 0;
}

- (NSCachedURLResponse)cachedResponse
{
  NSURLProtocolInternal *internal;

  internal = self->_internal;
  if (internal)
    return internal->cachedResponse;
  else
    return 0;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NSURLProtocol;
  -[NSURLProtocol dealloc](&v3, sel_dealloc);
}

- (void)startLoading
{
  objc_class *v4;

  v4 = (objc_class *)objc_opt_class();
  NSRequestConcreteImplementation((uint64_t)self, a2, v4);
}

- (void)stopLoading
{
  objc_class *v4;

  v4 = (objc_class *)objc_opt_class();
  NSRequestConcreteImplementation((uint64_t)self, a2, v4);
}

- (NSURLProtocol)initWithTask:(NSURLSessionTask *)task cachedResponse:(NSCachedURLResponse *)cachedResponse client:(id)client
{
  NSURLProtocol *v9;
  objc_super v11;

  if (self->_inInitWithTask)
  {
    v11.receiver = self;
    v11.super_class = (Class)NSURLProtocol;
    v9 = -[NSURLProtocol init](&v11, sel_init);
    if (v9)
      v9->_internal = (NSURLProtocolInternal *)-[NSURLProtocolInternal initWithRequest:cachedResponse:client:]([NSURLProtocolInternal alloc], -[NSURLSessionTask currentRequest](task, "currentRequest"), cachedResponse, client);
    return v9;
  }
  else
  {
    self->_task = task;
    self->_inInitWithTask = 1;
    return -[NSURLProtocol initWithRequest:cachedResponse:client:](self, "initWithRequest:cachedResponse:client:", -[NSURLSessionTask currentRequest](task, "currentRequest"), cachedResponse, client);
  }
}

- (NSURLSessionTask)task
{
  return self->_task;
}

+ (BOOL)canInitWithRequest:(NSURLRequest *)request
{
  objc_class *v5;

  v5 = (objc_class *)objc_opt_class();
  NSRequestConcreteImplementation((uint64_t)a1, a2, v5);
  return 0;
}

+ (NSURLRequest)canonicalRequestForRequest:(NSURLRequest *)request
{
  void *v6;
  objc_class *v8;

  if ((id)objc_opt_self() == a1)
  {
    v6 = (void *)objc_msgSend(a1, "_protocolClassForRequest:", request);
    if (v6)
      return (NSURLRequest *)objc_msgSend(v6, "canonicalRequestForRequest:", request);
  }
  else
  {
    v8 = (objc_class *)objc_opt_class();
    NSRequestConcreteImplementation((uint64_t)a1, a2, v8);
  }
  return request;
}

+ (id)canonicalRequestForRequest:(id)a3 task:(id)a4
{
  uint64_t v8;
  void *v9;

  if ((id)objc_opt_self() != a1)
    return (id)objc_msgSend(a1, "canonicalRequestForRequest:", a3);
  v8 = objc_msgSend(a4, "session");
  if (v8 && (v9 = -[__NSURLSessionLocal _protocolClassForTask:skipAppSSO:](v8, a4, 0)) != 0)
    return (id)objc_msgSend(v9, "canonicalRequestForRequest:task:", a3, a4);
  else
    return a3;
}

+ (BOOL)requestIsCacheEquivalent:(NSURLRequest *)a toRequest:(NSURLRequest *)b
{
  uint64_t v6;
  uint8_t v8[16];
  uint8_t buf[16];

  if (!a && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_fault_impl(&dword_183ECA000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "assertion failure", buf, 2u);
    if (b)
      goto LABEL_6;
  }
  else if (b)
  {
    goto LABEL_6;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)v8 = 0;
    _os_log_fault_impl(&dword_183ECA000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "assertion failure", v8, 2u);
  }
LABEL_6:
  if (a == b)
    return 1;
  v6 = +[NSURLSession _sharedSessionForConnection]();
  return -[__NSURLSessionLocal _request:isCacheEquivalentTo:](v6, (uint64_t)a, (uint64_t)b);
}

+ (void)unregisterClass:(Class)protocolClass
{
  objc_opt_self();
  os_unfair_lock_lock((os_unfair_lock_t)&_localProtocolClassesForDefaultSessionLock);
  if (_localProtocolClassesForDefaultSession)
  {
    objc_msgSend((id)_localProtocolClassesForDefaultSession, "removeObject:", protocolClass);
    if (!objc_msgSend((id)_localProtocolClassesForDefaultSession, "count"))
    {

      _localProtocolClassesForDefaultSession = 0;
    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&_localProtocolClassesForDefaultSessionLock);
}

+ (void)removePropertyForKey:(NSString *)key inRequest:(NSMutableURLRequest *)request
{
  uint8_t v6[16];
  uint8_t buf[16];

  if (!key && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_fault_impl(&dword_183ECA000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "assertion failure", buf, 2u);
    if (request)
      goto LABEL_6;
  }
  else if (request)
  {
    goto LABEL_6;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_fault_impl(&dword_183ECA000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "assertion failure", v6, 2u);
  }
LABEL_6:
  -[NSURLRequest _removePropertyForKey:](request, "_removePropertyForKey:", key);
}

+ (Class)_protocolClassForRequest:(id)a3
{
  return +[NSURLProtocol _protocolClassForRequest:skipAppSSO:](NSURLProtocol, "_protocolClassForRequest:skipAppSSO:", a3, 0);
}

+ (id)_makeRequestCanonicalByMakingRequestURLCanonical:(id)a3
{
  return a3;
}

@end
