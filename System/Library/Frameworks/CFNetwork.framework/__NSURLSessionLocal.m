@implementation __NSURLSessionLocal

- (uint64_t)_getCookieHeadersForTask:(uint64_t)a3 completionHandler:
{
  uint64_t v5;
  void *v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;
  const void *v10;
  CFTypeRef v11;
  const void *v12;
  const __CFAllocator *v13;
  char *v14;
  _QWORD *v15;
  OpaqueCFHTTPCookieStorage *v16;
  uint64_t v17;

  if (result)
  {
    if (nw_settings_get_signposts_enabled())
      kdebug_trace();
    v5 = objc_msgSend(a2, "currentRequest", MEMORY[0x1E0C809B0], 3221225472, __66____NSURLSessionLocal__getCookieHeadersForTask_completionHandler___block_invoke, &unk_1E14F6270, a2, a3);
    if (v5
      && (v6 = (void *)v5, objc_msgSend(a2, "shouldHandleCookiesAndSchemeIsAppropriate"))
      && (v7 = objc_msgSend(a2, "_createXCookieStorage")) != 0)
    {
      v8 = (_QWORD *)v7;
      v9 = *(_QWORD *)(objc_msgSend(v6, "_inner") + 56);
      if (v9)
      {
        v10 = *(const void **)(v9 + 184);
        if (v10)
        {
          v11 = CFRetain(v10);
          if (v11)
          {
            v12 = v11;
            v13 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
            v14 = (char *)CFAllocatorAllocate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 40, 0);
            *(_QWORD *)(v14 + 28) = 0;
            *(_QWORD *)(v14 + 20) = 0;
            *((_DWORD *)v14 + 9) = 0;
            *(_QWORD *)v14 = off_1E14EF578;
            *((_QWORD *)v14 + 1) = v13;
            *((_DWORD *)v14 + 4) = 1;
            if (((unint64_t)(v14 + 16) & 3) != 0)
              __assert_rtn("CFAllocatedReferenceCountedObject", "CFObject.cpp", 25, "(ptrdiff_t(&fRetainCount) & 3) == 0");
            v15 = v14;
            *(_QWORD *)v14 = off_1E14E8F98;
            *((_QWORD *)v14 + 3) = v8;
            (*(void (**)(_QWORD *))(*v8 + 40))(v8);
            v15[4] = _CookieStorageCreateInMemory(v13, v16);
            (*(void (**)(_QWORD *))(*v8 + 48))(v8);
            (*(void (**)(_QWORD *, const void *))(*v15 + 80))(v15, v12);
            CFRelease(v12);
            v8 = v15;
          }
        }
      }
      (*(void (**)(_QWORD *, void *, uint64_t *))(*v8 + 88))(v8, a2, &v17);
      return (*(uint64_t (**)(_QWORD *))(*v8 + 48))(v8);
    }
    else
    {
      return __66____NSURLSessionLocal__getCookieHeadersForTask_completionHandler___block_invoke((uint64_t)&v17, 0);
    }
  }
  return result;
}

- (void)removeUnresumedTask:(uint64_t)a1
{
  uint64_t v4;
  NSObject *v5;
  _QWORD block[5];

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 400));
    objc_msgSend(*(id *)(a1 + 184), "removeObject:", a2);
    v4 = objc_msgSend(*(id *)(a1 + 184), "anyObject");
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 400));
    if (!v4)
    {
      v5 = *(NSObject **)(a1 + 120);
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __43____NSURLSessionLocal_removeUnresumedTask___block_invoke;
      block[3] = &unk_1E14FE118;
      block[4] = a1;
      dispatch_async(v5, block);
    }
  }
}

- (void)_protocolClassForTask:(int)a3 skipAppSSO:
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v5 = -[__NSURLSessionLocal _protocolClassesForTask:](a1, a2);
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v13;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v13 != v8)
            objc_enumerationMutation(v5);
          v10 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * v9);
          if (!a3 || (objc_msgSend(v10, "isSubclassOfClass:", objc_opt_class(), (_QWORD)v12) & 1) == 0)
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0
              && (objc_msgSend(v10, "isSubclassOfClass:", objc_opt_class()) & 1) == 0)
            {
              if ((objc_msgSend(v10, "canInitWithRequest:", objc_msgSend(a2, "currentRequest")) & 1) != 0)
                return v10;
            }
            else if ((objc_msgSend(v10, "canInitWithTask:", a2, (_QWORD)v12) & 1) != 0)
            {
              return v10;
            }
          }
          ++v9;
        }
        while (v7 != v9);
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v7);
    }
  }
  return 0;
}

- (id)_protocolClassesForTask:(uint64_t)a1
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    if ((*(_BYTE *)(a1 + 68) & 1) != 0)
    {
      os_unfair_lock_lock((os_unfair_lock_t)&_localProtocolClassesForDefaultSessionLock);
      if (_localProtocolClassesForDefaultSession)
      {
        v4 = (id)objc_msgSend((id)_localProtocolClassesForDefaultSession, "arrayByAddingObjectsFromArray:", +[NSURLSessionConfiguration _defaultProtocolClasses](NSURLSessionConfiguration, "_defaultProtocolClasses"));
        os_unfair_lock_unlock((os_unfair_lock_t)&_localProtocolClassesForDefaultSessionLock);
        return v4;
      }
      os_unfair_lock_unlock((os_unfair_lock_t)&_localProtocolClassesForDefaultSessionLock);
    }
    if (!a2)
    {
      v5 = *(void **)(a1 + 112);
      goto LABEL_9;
    }
  }
  else if (!a2)
  {
    v5 = 0;
    goto LABEL_9;
  }
  v5 = (void *)objc_msgSend(a2, "_effectiveConfiguration");
LABEL_9:
  v6 = (void *)objc_msgSend(v5, "protocolClasses");
  v4 = +[NSURLSessionConfiguration _defaultProtocolClasses](NSURLSessionConfiguration, "_defaultProtocolClasses");
  if (v6 && (objc_msgSend(v6, "isEqualToArray:", v4) & 1) == 0)
  {
    v7 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithArray:", v6);
    v8 = (void *)objc_msgSend(MEMORY[0x1E0C99E20], "setWithArray:", v7);
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v9 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v9)
    {
      v10 = *(_QWORD *)v15;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v15 != v10)
            objc_enumerationMutation(v4);
          v12 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i);
          if ((objc_msgSend(v8, "containsObject:", v12) & 1) == 0)
          {
            objc_msgSend(v8, "addObject:", v12);
            objc_msgSend(v7, "addObject:", v12);
          }
        }
        v9 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v9);
    }
    return v7;
  }
  return v4;
}

- (uint64_t)_newURLProtocolForTask:(uint64_t)a1 client:(uint64_t)a2 protocolClass:(void *)a3
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t Instance;

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v6 = objc_msgSend(a3, "_cf_internalImpl");
    v7 = (*(uint64_t (**)(_QWORD, uint64_t, uint64_t, uint64_t))(v6 + 64))(*MEMORY[0x1E0C9AE00], a1, a2, v6);
    if (v7)
    {
      v8 = v7;
      if (TCFObject<URLProtocol>::Class(void)::sOnce != -1)
        dispatch_once(&TCFObject<URLProtocol>::Class(void)::sOnce, &__block_literal_global_360);
      return v8 + 16;
    }
    else
    {
      return 0;
    }
  }
  else
  {
    if (TCFObject<URLProtocol>::Class(void)::sOnce != -1)
      dispatch_once(&TCFObject<URLProtocol>::Class(void)::sOnce, &__block_literal_global_360);
    Instance = _CFRuntimeCreateInstance();
    v9 = Instance;
    if (Instance)
    {
      *(_OWORD *)(Instance + 16) = 0u;
      v9 = Instance + 16;
      *(_QWORD *)(Instance + 160) = 0;
      *(_OWORD *)(Instance + 128) = 0u;
      *(_OWORD *)(Instance + 144) = 0u;
      *(_OWORD *)(Instance + 96) = 0u;
      *(_OWORD *)(Instance + 112) = 0u;
      *(_OWORD *)(Instance + 64) = 0u;
      *(_OWORD *)(Instance + 80) = 0u;
      *(_OWORD *)(Instance + 32) = 0u;
      *(_OWORD *)(Instance + 48) = 0u;
    }
    *(_QWORD *)v9 = &off_1E14E7EA8;
    *(_QWORD *)(v9 + 8) = &unk_1E14E7FB0;
    *(_QWORD *)(v9 + 16) = &unk_1E14E7FD0;
    *(_DWORD *)(v9 + 140) = 0;
    *(_QWORD *)(v9 + 112) = a3;
    *(_QWORD *)(v9 + 144) = _copyPrivateProtocolSchedulingSet();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)v9 + 56))(v9, a1, a2);
  }
  return v9;
}

- (id)_createCanonicalRequestForTask:(id)result
{
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;

  if (result)
  {
    v3 = (uint64_t)result;
    objc_msgSend(a2, "set_protocolForTask:", 0);
    v6 = (id)objc_msgSend(a2, "currentRequest");
    v4 = -[__NSURLSessionLocal _protocolClassForTask:skipAppSSO:](v3, a2, 0);
    if (v4)
    {
      v5 = v4;
      v6 = (id)objc_msgSend(v4, "canonicalRequestForRequest:task:", v6, a2);
      objc_msgSend(a2, "set_protocolForTask:", v5);
    }
    return v6;
  }
  return result;
}

- (void)_protocolClassForRequest:(uint64_t)a1
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v3 = -[__NSURLSessionLocal _protocolClassesForTask:](a1, 0);
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (!v4)
    return 0;
  v5 = v4;
  v6 = *(_QWORD *)v11;
LABEL_4:
  v7 = 0;
  while (1)
  {
    if (*(_QWORD *)v11 != v6)
      objc_enumerationMutation(v3);
    v8 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * v7);
    if ((objc_msgSend(v8, "canInitWithRequest:", a2, (_QWORD)v10) & 1) != 0)
      return v8;
    if (v5 == ++v7)
    {
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      if (v5)
        goto LABEL_4;
      return 0;
    }
  }
}

- (__NSURLSessionLocal)initWithConfiguration:(id)a3 delegate:(id)a4 delegateQueue:(id)a5 delegateDispatchQueue:(id)a6
{
  __NSURLSessionLocal *v7;
  __NSURLSessionLocal *v8;
  void *v9;
  SEL v10;
  const __CFAllocator *v11;
  _OWORD *v12;
  _OWORD *v13;
  CFMutableDictionaryRef Mutable;
  _QWORD *v15;
  uint64_t v16;
  std::__shared_weak_count *v17;
  unint64_t *p_shared_owners;
  unint64_t v19;
  unint64_t v20;
  __int128 v22;
  __int128 v23;
  uint64_t v24;
  objc_super v25;
  pthread_mutexattr_t v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v25.receiver = self;
  v25.super_class = (Class)__NSURLSessionLocal;
  v7 = -[NSURLSession initWithConfiguration:delegate:delegateQueue:delegateDispatchQueue:](&v25, sel_initWithConfiguration_delegate_delegateQueue_delegateDispatchQueue_, a3, a4, a5, a6);
  v8 = v7;
  if (v7)
  {
    *((_QWORD *)v7 + 20) = 1;
    *((_QWORD *)v7 + 22) = objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 0);
    if (a3)
    {
      objc_msgSend(a3, "getConnectionCacheLimits");
    }
    else
    {
      v24 = 0;
      v22 = 0u;
      v23 = 0u;
    }
    v9 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    objc_setProperty_atomic(v8, v10, v9, 152);
    v11 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
    v12 = CFAllocatorAllocate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 160, 0);
    v13 = v12;
    *v12 = 0u;
    v12[2] = 0u;
    v12[3] = 0u;
    v12[8] = 0u;
    v12[9] = 0u;
    v12[6] = 0u;
    v12[7] = 0u;
    v12[4] = 0u;
    v12[5] = 0u;
    v12[1] = 0u;
    *(_QWORD *)v12 = off_1E14EF578;
    *((_QWORD *)v12 + 1) = v11;
    *((_DWORD *)v12 + 4) = 1;
    if (((unint64_t)(v12 + 1) & 3) != 0)
      __assert_rtn("CFAllocatedReferenceCountedObject", "CFObject.cpp", 25, "(ptrdiff_t(&fRetainCount) & 3) == 0");
    *(_QWORD *)v12 = off_1E14E65B8;
    *((_QWORD *)v12 + 3) = &off_1E14EA468;
    Mutable = CFDictionaryCreateMutable(v11, 0, &CFAllocatedReferenceCountedObject::skCFTypeDictionaryKeyCallBacks, &CFAllocatedReferenceCountedObject::skCFTypeDictionaryValueCallBacks);
    *((_QWORD *)v13 + 18) = 0;
    v15 = v13 + 9;
    *((_QWORD *)v13 + 4) = Mutable;
    *(_OWORD *)((char *)v13 + 104) = v22;
    *(_OWORD *)((char *)v13 + 120) = v23;
    *((_QWORD *)v13 + 17) = v24;
    *((_QWORD *)v13 + 19) = 0;
    pthread_mutexattr_init(&v26);
    pthread_mutexattr_settype(&v26, 0);
    pthread_mutex_init((pthread_mutex_t *)((char *)v13 + 40), &v26);
    pthread_mutexattr_destroy(&v26);
    *((_QWORD *)v8 + 21) = v13;
    v16 = *((_QWORD *)v8 + 2);
    v17 = (std::__shared_weak_count *)*((_QWORD *)v8 + 3);
    if (v17)
    {
      p_shared_owners = (unint64_t *)&v17->__shared_owners_;
      do
        v19 = __ldxr(p_shared_owners);
      while (__stxr(v19 + 1, p_shared_owners));
      std::shared_ptr<__CFString const>::operator=[abi:nn180100](v15, v16, (uint64_t)v17);
      do
        v20 = __ldaxr(p_shared_owners);
      while (__stlxr(v20 - 1, p_shared_owners));
      if (!v20)
      {
        ((void (*)(std::__shared_weak_count *))v17->__on_zero_shared)(v17);
        std::__shared_weak_count::__release_weak(v17);
      }
    }
    else
    {
      std::shared_ptr<__CFString const>::operator=[abi:nn180100](v15, v16, 0);
    }
    *((_BYTE *)v8 + 224) = 0;
    *((_BYTE *)v8 + 225) = 0;
    *((_QWORD *)v8 + 23) = (id)objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable", v22, v23, v24);
    *((_DWORD *)v8 + 100) = 0;
  }
  return v8;
}

- (void)_onqueue_connectUploadTask:(void *)a3 strippedRequest:(uint64_t)a4 bodyStream:(const __CFArray *)a5 bodyParts:
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  _QWORD v14[7];

  if (!a1)
    return;
  v10 = objc_msgSend(a2, "resumableUploadState");
  if (v10 && *(_DWORD *)(v10 + 16) == 2)
    a4 = objc_msgSend(MEMORY[0x1E0C99DB0], "inputStreamWithData:", objc_msgSend(MEMORY[0x1E0C99D50], "data"));
  if ((unint64_t)a5 | a4)
  {
    if (a4)
    {
      v12 = objc_msgSend(a2, "resumableUploadState");
      if (v12)
        *(_DWORD *)(v12 + 16) = 2;
      CFURLRequestSetHTTPRequestBodyStream(a3, (CFTypeRef)a4);
    }
    else if (a5 && FormContentLengthWithArray(a5) >= 1)
    {
      URLRequest::_setHTTPBodyParts((URLRequest *)objc_msgSend(a3, "_inner"), a5, 0);
    }
    goto LABEL_16;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
LABEL_16:
    v13 = -[NSURLRequest _initWithCFURLRequest:]([NSURLRequest alloc], "_initWithCFURLRequest:", a3);
    objc_msgSend(a2, "updateCurrentRequest:", v13);

    -[__NSURLSessionLocal _onqueue_canonicalizeTaskAndCreateConnection:](a1, a2);
    return;
  }
  if (a2)
  {
    v11 = a2[88];
    if (!v11)
      v11 = a2[87];
  }
  else
  {
    v11 = 0;
  }
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __87____NSURLSessionLocal__onqueue_connectUploadTask_strippedRequest_bodyStream_bodyParts___block_invoke;
  v14[3] = &unk_1E14F6130;
  v14[4] = a2;
  v14[5] = a1;
  v14[6] = a3;
  -[__NSCFURLSessionDelegateWrapper task:needNewBodyStream:](v11, a2, v14);
}

- (void)_onqueue_canonicalizeTaskAndCreateConnection:(uint64_t)a1
{
  id v4;
  void *v5;
  uint64_t v6;
  _QWORD v7[6];

  if (a1)
  {
    v4 = -[__NSURLSessionLocal _createCanonicalRequestForTask:]((id)objc_msgSend(a2, "session"), a2);
    v5 = (void *)objc_msgSend((id)objc_msgSend(a2, "currentRequest"), "URL");
    if (objc_msgSend((id)objc_msgSend((id)objc_msgSend(v4, "URL"), "scheme"), "isEqualToString:", CFSTR("https"))&& (objc_msgSend((id)objc_msgSend(v5, "scheme"), "isEqualToString:", CFSTR("http")) & 1) != 0)
    {
      if (a2)
      {
        v6 = a2[88];
        if (!v6)
          v6 = a2[87];
      }
      else
      {
        v6 = 0;
      }
      v7[0] = MEMORY[0x1E0C809B0];
      v7[1] = 3221225472;
      v7[2] = __68____NSURLSessionLocal__onqueue_canonicalizeTaskAndCreateConnection___block_invoke;
      v7[3] = &unk_1E14F6158;
      v7[4] = a1;
      v7[5] = a2;
      -[__NSCFURLSessionDelegateWrapper task:_schemeUpgraded:completionHandler:](v6, a2, v4, v7);
    }
    else
    {
      -[__NSURLSessionLocal _onqueue_configureAndCreateConnection:task:](a1, (uint64_t)v4, a2);
    }
  }
}

- (uint64_t)_cfurlRequest:(CFTypeRef)cf2 isCacheEquivalentTo:
{
  id v7;
  id v8;
  uint64_t v9;

  if (!cf1)
    __assert_rtn("-[__NSURLSessionLocal _cfurlRequest:isCacheEquivalentTo:]", "LocalSession.mm", 1818, "a");
  if (cf1 == cf2 || CFEqual(cf1, cf2))
    return 1;
  v7 = -[NSURLRequest _initWithCFURLRequest:]([NSURLRequest alloc], "_initWithCFURLRequest:", cf1);
  v8 = -[NSURLRequest _initWithCFURLRequest:]([NSURLRequest alloc], "_initWithCFURLRequest:", cf2);
  v9 = -[__NSURLSessionLocal _request:isCacheEquivalentTo:](a1, (uint64_t)v7, (uint64_t)v8);

  return v9;
}

- (uint64_t)_request:(uint64_t)a3 isCacheEquivalentTo:
{
  void *v6;
  void *v7;

  if (!a1)
    return 0;
  if (!a2)
    __assert_rtn("-[__NSURLSessionLocal _request:isCacheEquivalentTo:]", "LocalSession.mm", 1797, "a");
  if (!a3)
    __assert_rtn("-[__NSURLSessionLocal _request:isCacheEquivalentTo:]", "LocalSession.mm", 1798, "b");
  v6 = -[__NSURLSessionLocal _protocolClassForRequest:](a1, a2);
  v7 = -[__NSURLSessionLocal _protocolClassForRequest:](a1, a3);
  if (!v6 || !v7 || v6 != v7)
    return 0;
  if (v6 == (void *)objc_opt_class())
    return objc_msgSend(v6, "requestIsCacheEquivalent:toRequest:", a2, a3);
  return objc_msgSend((id)objc_msgSend((id)objc_msgSend(v6, "canonicalRequestForRequest:", a2), "URL"), "isEqual:", objc_msgSend((id)objc_msgSend(v6, "canonicalRequestForRequest:", a3), "URL"));
}

- (id)_downloadTaskWithTaskForClass:(id)a3
{
  NSObject *v3;
  NSString *v4;
  const char *v8;
  id Property;
  __NSCFLocalDownloadTask *v10;
  const char *v11;
  id v12;
  id v13;
  unint64_t v14;
  const char *v15;
  unint64_t v16;
  id v17;
  void *v18;
  NSMutableURLRequest *v19;
  NSMutableURLRequest *v20;
  __NSURLSessionLocal *v21;
  id v22;
  uint64_t v23;
  NSObject *v24;
  uint64_t v25;
  NSString *v26;
  NSString *v27;
  uint64_t v28;
  const char *v29;
  void *v30;
  id v31;
  __NSCFLocalDownloadTask *v32;
  SEL v33;
  id v34;
  SEL v35;
  id v36;
  uint64_t v37;
  __NSCFLocalDownloadTask *v38;
  uint64_t v39;
  uint64_t v40;
  id v41;
  SEL v42;
  SEL v43;
  const char *v44;
  id v45;
  void *v46;
  SEL v47;
  uint64_t v48;
  SEL v49;
  uint64_t v50;
  NSObject *v51;
  void *v52;
  NSObject *v53;
  NSObject *v54;
  uint64_t v55;
  NSObject *v56;
  uint64_t v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  uint64_t v64;
  uint64_t v65;
  NSObject *v66;
  uint64_t v67;
  uint64_t v68;
  void *v69;
  __NSCFLocalDownloadFile *v70;
  _QWORD *v71;
  _QWORD *v72;
  _QWORD *v73;
  __NSCFLocalDownloadFile *v74;
  _DWORD *v75;
  int v76;
  NSObject *v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  NSObject *v82;
  uint64_t v83;
  NSObject *v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  int v89;
  void *v90;
  void *v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  _QWORD block[5];
  _QWORD v96[5];
  _QWORD newValue[6];
  uint8_t buf[8];
  uint64_t v99;
  intptr_t (*v100)(uint64_t, void *, void *);
  void *v101;
  NSMutableURLRequest *v102;
  __NSURLSessionLocal *v103;
  NSObject *v104;
  _BYTE *v105;
  _BYTE *v106;
  objc_super v107;
  uint8_t v108[4];
  uint64_t v109;
  __int16 v110;
  NSString *v111;
  _BYTE v112[24];
  char v113;
  _BYTE v114[24];
  uint64_t v115;
  uint64_t v116;

  v116 = *MEMORY[0x1E0C80C00];
  if (*((_BYTE *)self + 360))
  {
    if (CFNLog::onceToken != -1)
      dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4755);
    v3 = CFNLog::logger;
    if (os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_183ECA000, v3, OS_LOG_TYPE_ERROR, "Attempted to create a task in a session that has been invalidated", buf, 2u);
    }
    v4 = (NSString *)dyld_program_sdk_at_least();
    if ((_DWORD)v4)
      __URLSESSION_CLIENT_API_MISUSE_INVALIDATED_SESSION__(v4);
    return 0;
  }
  if (!a3 || !objc_getProperty(a3, a2, 16, 1) && !objc_getProperty(a3, v8, 64, 1))
  {
    if (dyld_program_sdk_at_least())
      __URLSESSION_CLIENT_API_MISUSE_NIL_ARGUMENT__(CFSTR("Cannot create download task without request or resume data"));
    return 0;
  }
  Property = objc_getProperty(a3, v8, 64, 1);
  v10 = [__NSCFLocalDownloadTask alloc];
  v12 = -[NSURLSession defaultTaskGroup](self, "defaultTaskGroup");
  if (!Property)
  {
    v41 = objc_getProperty(a3, v11, 16, 1);
    v36 = objc_getProperty(a3, v42, 56, 1);
    v37 = -[__NSURLSessionLocal nextSeed](self, "nextSeed");
    v38 = v10;
    v39 = (uint64_t)v12;
    v40 = (uint64_t)v41;
    goto LABEL_34;
  }
  v13 = objc_getProperty(a3, v11, 64, 1);
  v14 = -[__NSURLSessionLocal nextSeed](self, "nextSeed");
  if (v10)
  {
    v16 = v14;
    v10->_initialResumeSize = -1;
    v17 = +[__NSCFLocalDownloadTask _expandResumeData:](__NSCFLocalDownloadTask, "_expandResumeData:", v13);
    if (!v17
      || (v18 = v17,
          (v19 = +[__NSCFLocalDownloadTask _requestFromResumeDataDictionary:]((uint64_t)__NSCFLocalDownloadTask, v17)) == 0))
    {

      goto LABEL_30;
    }
    v20 = v19;
    v107.receiver = v10;
    v107.super_class = (Class)__NSCFLocalDownloadTask;
    v21 = -[__NSURLSessionLocal initWithOriginalRequest:ident:taskGroup:](&v107, sel_initWithOriginalRequest_ident_taskGroup_, v19, v16, v12);
    if (!v21)
      goto LABEL_30;
    v22 = +[__NSCFLocalDownloadTask _requestFromResumeDataDictionary:key:]((uint64_t)__NSCFLocalDownloadTask, v18, (uint64_t)CFSTR("NSURLSessionResumeOriginalRequest"));
    if (v22)
      -[__NSURLSessionLocal setOriginalRequest:](v21, "setOriginalRequest:", v22);
    v23 = objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("NSURLSessionResumeResponse"));
    if (v23)
    {
      *(_QWORD *)v112 = 0;
      -[__NSURLSessionLocal setResponse:](v21, "setResponse:", objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v23, v112));
      if (!-[__NSURLSessionLocal response](v21, "response"))
      {
        if (CFNLog::onceToken != -1)
          dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4755);
        v24 = CFNLog::logger;
        if (os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_ERROR))
        {
          v86 = -[__NSURLSessionLocal _loggableDescription](v21, "_loggableDescription");
          *(_DWORD *)v114 = 138543618;
          *(_QWORD *)&v114[4] = v86;
          *(_WORD *)&v114[12] = 2112;
          *(_QWORD *)&v114[14] = *(_QWORD *)v112;
          _os_log_error_impl(&dword_183ECA000, v24, OS_LOG_TYPE_ERROR, "%{public}@ failed to unarchive response: %@", v114, 0x16u);
        }
      }
    }
    *(_QWORD *)v114 = 0;
    *(_QWORD *)&v114[8] = v114;
    *(_QWORD *)&v114[16] = 0x2020000000;
    v115 = -1;
    v25 = objc_msgSend(v18, "objectForKey:", CFSTR("NSURLSessionResumeInfoLocalPath"));
    v26 = (NSString *)v25;
    if (!v25)
    {
      v27 = (NSString *)objc_msgSend(-[__NSCFLocalDownloadTask explicitDownloadDirectory](v21), "path");
      if (!v27)
        v27 = NSTemporaryDirectory();
      v28 = objc_msgSend(v18, "objectForKey:", CFSTR("NSURLSessionResumeInfoTempFileName"));
      if (v28)
        v26 = -[NSString stringByAppendingPathComponent:](v27, "stringByAppendingPathComponent:", v28);
      else
        v26 = 0;
    }
    v52 = (void *)objc_msgSend(v18, "objectForKey:", CFSTR("NSURLSessionResumeExtractor"));
    if (v52)
    {
      -[__NSURLSessionLocal set_extractor:](v21, "set_extractor:", v52);
      *(_QWORD *)v112 = 0;
      *(_QWORD *)&v112[8] = v112;
      *(_QWORD *)&v112[16] = 0x2020000000;
      v113 = 1;
      if (v26)
      {
        v53 = dispatch_semaphore_create(0);
        if (CFNLog::onceToken != -1)
          dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4755);
        v54 = CFNLog::logger;
        if (os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_DEFAULT))
        {
          v55 = -[__NSURLSessionLocal _loggableDescription](v21, "_loggableDescription");
          *(_DWORD *)v108 = 138543619;
          v109 = v55;
          v110 = 2113;
          v111 = v26;
          _os_log_impl(&dword_183ECA000, v54, OS_LOG_TYPE_DEFAULT, "%{public}@ StreamingZip preparing extraction to %{private}@", v108, 0x16u);
        }
        *(_QWORD *)buf = MEMORY[0x1E0C809B0];
        v99 = 3221225472;
        v100 = __62____NSCFLocalDownloadTask_initWithTaskGroup_resumeData_ident___block_invoke;
        v101 = &unk_1E14F6978;
        v106 = v112;
        v102 = v20;
        v103 = v21;
        v104 = v53;
        v105 = v114;
        objc_msgSend(v52, "prepareForExtractionToPath:completionBlock:", v26, buf);
        if (dispatch_semaphore_wait(v53, 0xFFFFFFFFFFFFFFFFLL))
        {
          if (CFNLog::onceToken != -1)
            dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4755);
          v56 = CFNLog::logger;
          if (os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_ERROR))
          {
            v85 = -[__NSURLSessionLocal _loggableDescription](v21, "_loggableDescription");
            *(_DWORD *)v108 = 138543362;
            v109 = v85;
            _os_log_error_impl(&dword_183ECA000, v56, OS_LOG_TYPE_ERROR, "%{public}@ StreamingZip Error - timed out waiting for return from prepareForExtraction.", v108, 0xCu);
          }
          *(_BYTE *)(*(_QWORD *)&v112[8] + 24) = 0;
        }
        dispatch_release(v53);
        if (!*(_BYTE *)(*(_QWORD *)&v112[8] + 24))
        {

          _Block_object_dispose(v112, 8);
LABEL_112:
          _Block_object_dispose(v114, 8);
          goto LABEL_30;
        }
      }
      _Block_object_dispose(v112, 8);
LABEL_74:
      v68 = objc_msgSend(v18, "objectForKey:", CFSTR("NSURLSessionResumeEntityTag"));
      if (!v68)
        v68 = objc_msgSend(v18, "objectForKey:", CFSTR("NSURLSessionResumeServerDownloadDate"));
      -[NSMutableURLRequest setValue:forHTTPHeaderField:](v20, "setValue:forHTTPHeaderField:", v68, 0x1EDCFD158);
      -[__NSURLSessionLocal updateCurrentRequest:](v21, "updateCurrentRequest:", v20);
      *((_QWORD *)v21 + 123) = *(_QWORD *)(*(_QWORD *)&v114[8] + 24);
      *((_QWORD *)v21 + 121) = *(_QWORD *)(*(_QWORD *)&v114[8] + 24);
      v69 = (void *)objc_msgSend((id)-[__NSURLSessionLocal _taskGroup](v21, "_taskGroup"), "_groupConfiguration");
      if (objc_msgSend(v69, "_requiresClientToOpenFiles"))
      {
        v70 = [__NSCFLocalDownloadFile alloc];
        if (v70)
        {
          v71 = -[__NSCFLocalDownloadFile initQueues](v70);
          v72 = v71;
          if (v71)
          {
            objc_msgSend(v71, "setPath:", v26);
            v72[24] = v21;
          }
        }
        else
        {
          v72 = 0;
        }
        v73 = v72;
      }
      else
      {
        v74 = [__NSCFLocalDownloadFile alloc];
        if (v74)
        {
          v75 = -[__NSCFLocalDownloadFile initQueues](v74);
          if (v75)
          {
            v76 = open(-[NSString UTF8String](v26, "UTF8String"), 9, 438);
            if (v76 < 0)
            {
              v75[47] = *__error();
              if (CFNLog::onceToken != -1)
                dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4755);
              v77 = CFNLog::logger;
              if (os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_ERROR))
              {
                v89 = v75[47];
                *(_DWORD *)v112 = 67109378;
                *(_DWORD *)&v112[4] = v89;
                *(_WORD *)&v112[8] = 2112;
                *(_QWORD *)&v112[10] = v26;
                _os_log_error_impl(&dword_183ECA000, v77, OS_LOG_TYPE_ERROR, "__NSCFLocalDownloadFile: error %d opening resume file: %@", v112, 0x12u);
              }
            }
            else
            {
              objc_msgSend(v75, "setPath:", v26);
              close(v76);
            }
          }
        }
        else
        {
          v75 = 0;
        }
        -[__NSURLSessionLocal setDownloadFile:](v21, "setDownloadFile:", v75);
        v78 = -[__NSURLSessionLocal downloadFile](v21, "downloadFile");
        if (!v78 || !*(_DWORD *)(v78 + 188))
          goto LABEL_98;
        if (-[__NSURLSessionLocal _extractor](v21, "_extractor"))
        {
          v79 = -[__NSURLSessionLocal downloadFile](v21, "downloadFile");
          if (v79)
          {
            if (*(_DWORD *)(v79 + 188) == 21)
            {
              objc_msgSend((id)-[__NSURLSessionLocal downloadFile](v21, "downloadFile"), "setPath:", v26);
LABEL_98:
              if (-[__NSURLSessionLocal downloadFile](v21, "downloadFile"))
              {
                if (v25)
                  LOBYTE(v80) = 1;
                else
                  v80 = objc_msgSend(v69, "skip_download_unlink");
                v81 = -[__NSURLSessionLocal downloadFile](v21, "downloadFile");
                if (v81)
                  *(_BYTE *)(v81 + 185) = v80;
                *((_BYTE *)v21 + 1028) = -[__NSURLSessionLocal downloadFile](v21, "downloadFile") != 0;
                *((_QWORD *)v21 + 124) = v18;
              }
              -[__NSURLSessionLocal set_backgroundPublishingURL:](v21, "set_backgroundPublishingURL:", objc_msgSend(v18, "objectForKey:", CFSTR("PublishingURL")));
              if (-[__NSURLSessionLocal downloadFile](v21, "downloadFile"))
              {
                _Block_object_dispose(v114, 8);
                -[__NSURLSessionLocal set_suspensionThreshhold:](v21, "set_suspensionThreshhold:", 0x80000);
                goto LABEL_35;
              }
              if (CFNLog::onceToken != -1)
                dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4755);
              v82 = CFNLog::logger;
              if (os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_ERROR))
              {
                v83 = -[__NSURLSessionLocal _loggableDescription](v21, "_loggableDescription");
                *(_DWORD *)v112 = 138543362;
                *(_QWORD *)&v112[4] = v83;
                _os_log_error_impl(&dword_183ECA000, v82, OS_LOG_TYPE_ERROR, "%{public}@ cannot create download file from resume data", v112, 0xCu);
              }

              goto LABEL_112;
            }
          }
        }
        v73 = 0;
      }
      -[__NSURLSessionLocal setDownloadFile:](v21, "setDownloadFile:", v73);
      goto LABEL_98;
    }
    v57 = objc_msgSend((id)objc_msgSend(v18, "objectForKey:", CFSTR("NSURLSessionResumeBytesReceived")), "longLongValue");
    *(_QWORD *)(*(_QWORD *)&v114[8] + 24) = v57;
    v58 = (void *)objc_msgSend(v22, "valueForHTTPHeaderField:", 0x1EDCFD4A0);
    if (objc_msgSend(v58, "hasPrefix:", CFSTR("bytes="))
      && (v59 = (void *)objc_msgSend(v58, "componentsSeparatedByString:", CFSTR("=")), (v60 = v59) != 0)
      && (unint64_t)objc_msgSend(v59, "count") >= 2
      && (v61 = (void *)objc_msgSend(v60, "objectAtIndexedSubscript:", 1), (v62 = v61) != 0))
    {
      v63 = (void *)objc_msgSend(v61, "componentsSeparatedByString:", CFSTR("-"));
      if (objc_msgSend(v63, "count") != 2)
      {
        if (CFNLog::onceToken != -1)
          dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4755);
        v84 = CFNLog::logger;
        if (os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)v112 = 138412290;
          *(_QWORD *)&v112[4] = v62;
          _os_log_impl(&dword_183ECA000, v84, OS_LOG_TYPE_DEFAULT, "Unsupported Range header value, restarting: %@", v112, 0xCu);
        }
        objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99D50], "data"), "writeToFile:atomically:", v26, 0);
        goto LABEL_74;
      }
      if (objc_msgSend(v62, "hasPrefix:", CFSTR("-")))
      {
        v64 = objc_msgSend((id)objc_msgSend(v63, "objectAtIndexedSubscript:", 1), "longLongValue");
        v65 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("bytes=-%lld"), v64 - *(_QWORD *)(*(_QWORD *)&v114[8] + 24));
        -[NSMutableURLRequest setValue:forHTTPHeaderField:](v20, "setValue:forHTTPHeaderField:", v65, 0x1EDCFD4A0);
        if (CFNLog::onceToken != -1)
          dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4755);
        v66 = CFNLog::logger;
        if (!os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_DEBUG))
          goto LABEL_74;
        *(_DWORD *)v112 = 138412290;
        *(_QWORD *)&v112[4] = v65;
      }
      else if (objc_msgSend(v62, "hasSuffix:", CFSTR("-")))
      {
        v87 = objc_msgSend((id)objc_msgSend(v63, "objectAtIndexedSubscript:", 0), "longLongValue");
        v88 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("bytes=%lld-"), *(_QWORD *)(*(_QWORD *)&v114[8] + 24) + v87);
        -[NSMutableURLRequest setValue:forHTTPHeaderField:](v20, "setValue:forHTTPHeaderField:", v88, 0x1EDCFD4A0);
        if (CFNLog::onceToken != -1)
          dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4755);
        v66 = CFNLog::logger;
        if (!os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_DEBUG))
          goto LABEL_74;
        *(_DWORD *)v112 = 138412290;
        *(_QWORD *)&v112[4] = v88;
      }
      else
      {
        v90 = (void *)objc_msgSend(v63, "objectAtIndexedSubscript:", 0);
        v91 = (void *)objc_msgSend(v63, "objectAtIndexedSubscript:", 1);
        v92 = objc_msgSend(v90, "longLongValue");
        v93 = objc_msgSend(v91, "longLongValue");
        v94 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("bytes=%lld-%lld"), *(_QWORD *)(*(_QWORD *)&v114[8] + 24) + v92, v93);
        -[NSMutableURLRequest setValue:forHTTPHeaderField:](v20, "setValue:forHTTPHeaderField:", v94, 0x1EDCFD4A0);
        if (CFNLog::onceToken != -1)
          dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4755);
        v66 = CFNLog::logger;
        if (!os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_DEBUG))
          goto LABEL_74;
        *(_DWORD *)v112 = 138412290;
        *(_QWORD *)&v112[4] = v94;
      }
    }
    else
    {
      v67 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("bytes=%lld-"), *(_QWORD *)(*(_QWORD *)&v114[8] + 24));
      -[NSMutableURLRequest setValue:forHTTPHeaderField:](v20, "setValue:forHTTPHeaderField:", v67, 0x1EDCFD4A0);
      if (CFNLog::onceToken != -1)
        dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4755);
      v66 = CFNLog::logger;
      if (!os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_DEBUG))
        goto LABEL_74;
      *(_DWORD *)v112 = 138412290;
      *(_QWORD *)&v112[4] = v67;
    }
    _os_log_debug_impl(&dword_183ECA000, v66, OS_LOG_TYPE_DEBUG, "Request Range header value: %@", v112, 0xCu);
    goto LABEL_74;
  }
LABEL_30:
  v30 = objc_getProperty(a3, v15, 16, 1);
  if (!v30)
  {
    v31 = +[__NSCFLocalDownloadTask _expandResumeData:](__NSCFLocalDownloadTask, "_expandResumeData:", objc_getProperty(a3, v29, 64, 1));
    v30 = +[__NSCFLocalDownloadTask _requestFromResumeDataDictionary:]((uint64_t)__NSCFLocalDownloadTask, v31);
    if (!v30)
    {
      if (dyld_program_sdk_at_least())
        objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("Cannot create download task with corrupt resume data"), 0));
      return 0;
    }
  }
  v32 = [__NSCFLocalDownloadTask alloc];
  v34 = objc_getProperty(a3, v33, 88, 1);
  v36 = objc_getProperty(a3, v35, 56, 1);
  v37 = -[__NSURLSessionLocal nextSeed](self, "nextSeed");
  v38 = v32;
  v39 = (uint64_t)v34;
  v40 = (uint64_t)v30;
LABEL_34:
  v21 = (__NSURLSessionLocal *)-[__NSCFLocalDownloadTask initWithTaskGroup:request:filePath:ident:](v38, v39, v40, (uint64_t)v36, v37);
  if (v21)
  {
LABEL_35:
    os_unfair_lock_lock((os_unfair_lock_t)self + 100);
    objc_msgSend(*((id *)self + 23), "addObject:", v21);
    os_unfair_lock_unlock((os_unfair_lock_t)self + 100);
    if (objc_getProperty(a3, v43, 72, 1))
    {
      v45 = objc_getProperty(a3, v44, 72, 1);
      v46 = _Block_copy(v45);
      newValue[0] = MEMORY[0x1E0C809B0];
      newValue[1] = 3221225472;
      newValue[2] = __53____NSURLSessionLocal__downloadTaskWithTaskForClass___block_invoke;
      newValue[3] = &unk_1E14F6220;
      newValue[4] = self;
      newValue[5] = v46;
      objc_setProperty_atomic_copy(v21, v47, newValue, 936);
    }
    v48 = MEMORY[0x1E0C809B0];
    v96[0] = MEMORY[0x1E0C809B0];
    v96[1] = 3221225472;
    v96[2] = __53____NSURLSessionLocal__downloadTaskWithTaskForClass___block_invoke_2;
    v96[3] = &unk_1E14F6248;
    v96[4] = self;
    objc_setProperty_atomic_copy(v21, v44, v96, 808);
    -[__NSURLSessionLocal setDelegate:](v21, "setDelegate:", objc_getProperty(a3, v49, 80, 1));
    v50 = *((_QWORD *)v21 + 88);
    if (!v50)
      v50 = *((_QWORD *)v21 + 87);
    -[__NSCFURLSessionDelegateWrapper didCreateTask:](v50, v21);
    if (-[__NSURLSessionLocal state](v21, "state") != 1)
    {
      v51 = *((_QWORD *)self + 15);
      block[0] = v48;
      block[1] = 3221225472;
      block[2] = __53____NSURLSessionLocal__downloadTaskWithTaskForClass___block_invoke_3;
      block[3] = &unk_1E14FE118;
      block[4] = v21;
      dispatch_async(v51, block);
    }
  }
  return v21;
}

- (id)_uploadTaskWithTaskForClass:(id)a3
{
  void *v5;
  const char *v6;
  const char *v7;
  NSObject *v8;
  NSString *v9;
  const char *v11;
  const char *v12;
  NSObject *v13;
  id Property;
  SEL v15;
  const char *v16;
  id v17;
  id v18;
  unint64_t v19;
  SEL v20;
  uint64_t v21;
  NSObject *v22;
  id v23;
  unint64_t v24;
  SEL v25;
  SEL v26;
  const char *v27;
  id v28;
  const char *v29;
  uint64_t v30;
  id v31;
  const char *v32;
  void *v33;
  const char *v34;
  id v35;
  uint64_t v36;
  int v37;
  _DWORD *v38;
  id v39;
  id v40;
  ptrdiff_t v41;
  const char *v42;
  id v43;
  uint64_t v44;
  const char *v45;
  NSObject *v46;
  void *v47;
  const char *v48;
  const char *v49;
  SEL v50;
  id v51;
  const char *v52;
  uint64_t v53;
  const char *v54;
  id v55;
  const char *v56;
  SEL v57;
  uint64_t v58;
  NSObject *v59;
  uint64_t v60;
  void *v61;
  uint64_t v62;
  _QWORD v63[5];
  _QWORD v64[8];
  _QWORD applier[5];
  _QWORD newValue[6];
  uint8_t buf[16];

  v5 = (void *)objc_opt_class();
  if (!a3)
  {
    if (*((_BYTE *)self + 360))
      goto LABEL_3;
    goto LABEL_41;
  }
  objc_setProperty_atomic(a3, v6, v5, 8);
  if (*((_BYTE *)self + 360))
  {
LABEL_3:
    if (CFNLog::onceToken != -1)
      dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4755);
    v8 = CFNLog::logger;
    if (os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_183ECA000, v8, OS_LOG_TYPE_ERROR, "Attempted to create a task in a session that has been invalidated", buf, 2u);
    }
    v9 = (NSString *)dyld_program_sdk_at_least();
    if ((_DWORD)v9)
      __URLSESSION_CLIENT_API_MISUSE_INVALIDATED_SESSION__(v9);
    return 0;
  }
  if (!objc_getProperty(a3, v7, 16, 1) && !objc_getProperty(a3, v11, 64, 1))
  {
LABEL_41:
    if (dyld_program_sdk_at_least())
      __URLSESSION_CLIENT_API_MISUSE_NIL_ARGUMENT__(CFSTR("Cannot create upload task without request or resume data"));
    return 0;
  }
  if (__CFNIsRunningInXcode::envCheckOnce != -1)
    dispatch_once(&__CFNIsRunningInXcode::envCheckOnce, &__block_literal_global_29);
  if (__CFNIsRunningInXcode::runningInXcode == 1
    && (objc_msgSend(objc_getProperty(a3, v11, 16, 1), "HTTPBody")
     || objc_msgSend(objc_getProperty(a3, v12, 16, 1), "HTTPBodyStream")))
  {
    if (__CFNRuntimeIssuesLogHandle::onceToken != -1)
      dispatch_once(&__CFNRuntimeIssuesLogHandle::onceToken, &__block_literal_global_4_4760);
    v13 = __CFNRuntimeIssuesLogHandle::logger;
    if (os_log_type_enabled((os_log_t)__CFNRuntimeIssuesLogHandle::logger, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
    }
  }
  Property = objc_getProperty(a3, v11, 64, 1);
  v17 = objc_alloc((Class)objc_getProperty(a3, v15, 8, 1));
  if (Property)
  {
    v18 = objc_getProperty(a3, v16, 64, 1);
    v19 = -[__NSURLSessionLocal nextSeed](self, "nextSeed");
    v21 = objc_msgSend(v17, "initWithResumeData:ident:taskGroup:", v18, v19, objc_getProperty(a3, v20, 88, 1));
    if (!v21)
    {
      if (CFNLog::onceToken != -1)
        dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4755);
      v22 = CFNLog::logger;
      if (os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_183ECA000, v22, OS_LOG_TYPE_ERROR, "Cannot create upload task with corrupt resume data", buf, 2u);
      }
      return 0;
    }
  }
  else
  {
    v23 = objc_getProperty(a3, v16, 16, 1);
    v24 = -[__NSURLSessionLocal nextSeed](self, "nextSeed");
    v21 = objc_msgSend(v17, "initWithOriginalRequest:ident:taskGroup:", v23, v24, objc_getProperty(a3, v25, 88, 1));
  }
  os_unfair_lock_lock((os_unfair_lock_t)self + 100);
  objc_msgSend(*((id *)self + 23), "addObject:", v21);
  os_unfair_lock_unlock((os_unfair_lock_t)self + 100);
  if (objc_getProperty(a3, v26, 24, 1))
    objc_msgSend((id)v21, "set_uniqueIdentifier:", objc_getProperty(a3, v27, 24, 1));
  v28 = objc_getProperty(a3, v27, 48, 1);
  v30 = MEMORY[0x1E0C809B0];
  if (v28)
  {
    v31 = objc_getProperty(a3, v29, 48, 1);
    newValue[0] = v30;
    newValue[1] = 3221225472;
    newValue[2] = __51____NSURLSessionLocal__uploadTaskWithTaskForClass___block_invoke;
    newValue[3] = &unk_1E14F6180;
    newValue[4] = self;
    newValue[5] = _Block_copy(v31);
    if (v21)
    {
      objc_setProperty_atomic_copy((id)v21, v29, newValue, 784);
      *(_BYTE *)(v21 + 69) = 0;
    }
  }
  if (!objc_getProperty(a3, v29, 64, 1))
    goto LABEL_50;
  v33 = (void *)objc_msgSend((id)v21, "resumableUploadState");
  if (v33)
    v35 = objc_getProperty(v33, v34, 32, 1);
  else
    v35 = 0;
  objc_setProperty_atomic(a3, v34, v35, 16);
  v36 = objc_msgSend((id)v21, "resumableUploadState");
  if (!v36)
  {
    v38 = (_DWORD *)objc_msgSend((id)v21, "resumableUploadState");
    goto LABEL_46;
  }
  v37 = *(_DWORD *)(v36 + 16);
  v38 = (_DWORD *)objc_msgSend((id)v21, "resumableUploadState");
  if (!v37)
  {
LABEL_46:
    if (v38)
      v39 = objc_getProperty(v38, v32, 40, 1);
    else
      v39 = 0;
    v40 = a3;
    v41 = 40;
    goto LABEL_49;
  }
  if (v38 && v38[4] == 1)
  {
    v39 = (id)objc_msgSend((id)objc_msgSend((id)v21, "resumableUploadState"), "uploadFile");
    v40 = a3;
    v41 = 32;
LABEL_49:
    objc_setProperty_atomic(v40, v32, v39, v41);
  }
LABEL_50:
  if (objc_getProperty(a3, v32, 40, 1))
  {
    v43 = (id)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", objc_getProperty(a3, v42, 40, 1));
    v44 = objc_msgSend((id)v21, "resumableUploadState");
    if (v44)
      *(_DWORD *)(v44 + 16) = 0;
    v46 = objc_getProperty(a3, v45, 40, 1);
LABEL_54:
    v47 = (void *)objc_msgSend((id)v21, "resumableUploadState");
    if (v47)
      objc_setProperty_atomic(v47, v48, v46, 40);
    goto LABEL_64;
  }
  if (objc_getProperty(a3, v42, 32, 1))
  {
    v43 = (id)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", objc_msgSend(objc_getProperty(a3, v49, 32, 1), "fileSystemRepresentation")));
    v51 = objc_getProperty(a3, v50, 32, 1);
    if (v21)
      objc_setProperty_atomic((id)v21, v52, v51, 768);
    v53 = objc_msgSend((id)v21, "resumableUploadState");
    if (v53)
      *(_DWORD *)(v53 + 16) = 1;
    if (v21)
      v55 = objc_getProperty((id)v21, v54, 768, 1);
    else
      v55 = 0;
    objc_msgSend((id)objc_msgSend((id)v21, "resumableUploadState"), "setUploadFile:", v55);
    goto LABEL_64;
  }
  v60 = objc_msgSend(objc_getProperty(a3, v49, 16, 1), "HTTPBodyStream");
  if (v60)
  {
    v46 = v60;
LABEL_73:
    v43 = 0;
    goto LABEL_65;
  }
  v46 = objc_msgSend(objc_getProperty(a3, v48, 16, 1), "HTTPBody");
  if (!v46)
    goto LABEL_73;
  objc_getClass("OS_dispatch_data");
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v43 = (id)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", v46);
    v62 = objc_msgSend((id)v21, "resumableUploadState");
    if (v62)
      *(_DWORD *)(v62 + 16) = 0;
    goto LABEL_54;
  }
  v61 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  applier[0] = v30;
  applier[1] = 3221225472;
  applier[2] = __51____NSURLSessionLocal__uploadTaskWithTaskForClass___block_invoke_2;
  applier[3] = &unk_1E14F61A8;
  applier[4] = v61;
  dispatch_data_apply(v46, applier);
  v43 = (id)objc_msgSend(v61, "copy");
LABEL_64:
  v46 = 0;
LABEL_65:
  v64[0] = v30;
  v64[1] = 3221225472;
  v64[2] = __51____NSURLSessionLocal__uploadTaskWithTaskForClass___block_invoke_3;
  v64[3] = &unk_1E14F61D0;
  v64[4] = objc_getProperty(a3, v48, 32, 1);
  v64[5] = self;
  v64[6] = v46;
  v64[7] = v43;
  if (v21)
  {
    objc_setProperty_atomic_copy((id)v21, v56, v64, 808);
    objc_msgSend((id)v21, "setDelegate:", objc_getProperty(a3, v57, 80, 1));
    v58 = *(_QWORD *)(v21 + 704);
    if (!v58)
      v58 = *(_QWORD *)(v21 + 696);
  }
  else
  {
    objc_msgSend(0, "setDelegate:", objc_getProperty(a3, v56, 80, 1));
    v58 = 0;
  }
  -[__NSCFURLSessionDelegateWrapper didCreateTask:](v58, (void *)v21);
  if (objc_msgSend((id)v21, "state") != 1)
  {
    v59 = *((_QWORD *)self + 15);
    v63[0] = v30;
    v63[1] = 3221225472;
    v63[2] = __51____NSURLSessionLocal__uploadTaskWithTaskForClass___block_invoke_4;
    v63[3] = &unk_1E14FE118;
    v63[4] = v21;
    dispatch_async(v59, v63);
  }
  return (id)v21;
}

- (_BYTE)taskForClassInfo:(_BYTE *)result
{
  uint64_t v2;
  NSObject *v3;
  NSString *v4;
  const char *v6;
  id v7;
  SEL v8;
  id Property;
  uint64_t v10;
  SEL v11;
  uint64_t v12;
  SEL v13;
  const char *v14;
  const char *v15;
  int v16;
  NSObject *v17;
  NSObject *v18;
  CFDictionaryRef *v19;
  id v20;
  const char *v21;
  uint64_t v22;
  id v23;
  const char *v24;
  void *v25;
  id v26;
  void *v27;
  NSObject *v28;
  const char *v29;
  NSObject *v30;
  const char *v31;
  SEL v32;
  id v33;
  uint64_t v34;
  const char *v35;
  SEL v36;
  uint64_t v37;
  NSObject *v38;
  uint64_t v39;
  void *v40;
  _QWORD v41[5];
  _QWORD v42[8];
  _QWORD applier[5];
  _QWORD newValue[6];
  uint8_t buf[4];
  int v46;
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  if (!result)
    return result;
  v2 = (uint64_t)result;
  if (result[360])
  {
    if (CFNLog::onceToken != -1)
      dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4755);
    v3 = CFNLog::logger;
    if (os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_183ECA000, v3, OS_LOG_TYPE_ERROR, "Attempted to create a task in a session that has been invalidated", buf, 2u);
    }
    v4 = (NSString *)dyld_program_sdk_at_least();
    if ((_DWORD)v4)
      __URLSESSION_CLIENT_API_MISUSE_INVALIDATED_SESSION__(v4);
    return 0;
  }
  if (!self || !objc_getProperty(self, (SEL)self, 16, 1))
  {
    if (dyld_program_sdk_at_least())
      __URLSESSION_CLIENT_API_MISUSE_NIL_ARGUMENT__(CFSTR("Cannot create task from nil request"));
    return 0;
  }
  v7 = objc_alloc((Class)objc_getProperty(self, v6, 8, 1));
  Property = objc_getProperty(self, v8, 16, 1);
  v10 = objc_msgSend((id)v2, "nextSeed");
  v12 = objc_msgSend(v7, "initWithOriginalRequest:ident:taskGroup:", Property, v10, objc_getProperty(self, v11, 88, 1));
  os_unfair_lock_lock((os_unfair_lock_t)(v2 + 400));
  objc_msgSend(*(id *)(v2 + 184), "addObject:", v12);
  os_unfair_lock_unlock((os_unfair_lock_t)(v2 + 400));
  if (objc_getProperty(self, v13, 24, 1))
    objc_msgSend((id)v12, "set_uniqueIdentifier:", objc_getProperty(self, v14, 24, 1));
  if (objc_msgSend(*(id *)(v2 + 112), "_disableAPWakeOnIdleConnections"))
  {
    os_unfair_lock_lock((os_unfair_lock_t)(v2 + 48));
    v16 = *(_BYTE *)(v2 + 69) & 1;
    *(_BYTE *)(v2 + 69) = 0;
    os_unfair_lock_unlock((os_unfair_lock_t)(v2 + 48));
    if (CFNLog::onceToken != -1)
      dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4755);
    v17 = CFNLog::logger;
    if (os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      v46 = v16;
      _os_log_impl(&dword_183ECA000, v17, OS_LOG_TYPE_DEFAULT, "consumeSystemPowerNotification returns %d", buf, 8u);
    }
    if (v16)
    {
      if (CFNLog::onceToken != -1)
        dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4755);
      v18 = CFNLog::logger;
      if (os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_183ECA000, v18, OS_LOG_TYPE_DEFAULT, "Cleaning up session connections due to _disableAPWakeOnIdleConnections set", buf, 2u);
      }
      v19 = *(CFDictionaryRef **)(v2 + 168);
      if (v19)
        XTubeManager::invalidateAllConnections(v19, 0);
    }
  }
  v20 = objc_getProperty(self, v15, 48, 1);
  v22 = MEMORY[0x1E0C809B0];
  if (v20)
  {
    v23 = objc_getProperty(self, v21, 48, 1);
    newValue[0] = v22;
    newValue[1] = 3221225472;
    newValue[2] = __40____NSURLSessionLocal_taskForClassInfo___block_invoke;
    newValue[3] = &unk_1E14F6180;
    newValue[4] = v2;
    newValue[5] = _Block_copy(v23);
    if (v12)
    {
      objc_setProperty_atomic_copy((id)v12, v21, newValue, 784);
      *(_BYTE *)(v12 + 69) = 0;
    }
  }
  if (objc_getProperty(self, v21, 40, 1))
  {
    v25 = (void *)MEMORY[0x1E0C99D20];
    v26 = objc_getProperty(self, v24, 40, 1);
    v27 = v25;
    goto LABEL_30;
  }
  if (objc_getProperty(self, v24, 32, 1))
  {
    v30 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", objc_msgSend(objc_getProperty(self, v31, 32, 1), "fileSystemRepresentation")));
    v33 = objc_getProperty(self, v32, 32, 1);
    if (v12)
      objc_setProperty_atomic((id)v12, v29, v33, 768);
    goto LABEL_37;
  }
  v39 = objc_msgSend(objc_getProperty(self, v31, 16, 1), "HTTPBodyStream");
  if (v39)
  {
    v34 = v39;
    v30 = 0;
    goto LABEL_38;
  }
  v30 = objc_msgSend(objc_getProperty(self, v29, 16, 1), "HTTPBody");
  if (v30)
  {
    objc_getClass("OS_dispatch_data");
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v40 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      applier[0] = v22;
      applier[1] = 3221225472;
      applier[2] = __40____NSURLSessionLocal_taskForClassInfo___block_invoke_2;
      applier[3] = &unk_1E14F61A8;
      applier[4] = v40;
      dispatch_data_apply(v30, applier);
      v28 = (id)objc_msgSend(v40, "copy");
      goto LABEL_31;
    }
    v27 = (void *)MEMORY[0x1E0C99D20];
    v26 = v30;
LABEL_30:
    v28 = objc_msgSend(v27, "arrayWithObject:", v26);
LABEL_31:
    v30 = v28;
  }
LABEL_37:
  v34 = 0;
LABEL_38:
  v42[0] = v22;
  v42[1] = 3221225472;
  v42[2] = __40____NSURLSessionLocal_taskForClassInfo___block_invoke_3;
  v42[3] = &unk_1E14F61D0;
  v42[4] = objc_getProperty(self, v29, 32, 1);
  v42[5] = v2;
  v42[6] = v34;
  v42[7] = v30;
  if (v12)
  {
    objc_setProperty_atomic_copy((id)v12, v35, v42, 808);
    objc_msgSend((id)v12, "setDelegate:", objc_getProperty(self, v36, 80, 1));
    v37 = *(_QWORD *)(v12 + 704);
    if (!v37)
      v37 = *(_QWORD *)(v12 + 696);
  }
  else
  {
    objc_msgSend(0, "setDelegate:", objc_getProperty(self, v35, 80, 1));
    v37 = 0;
  }
  -[__NSCFURLSessionDelegateWrapper didCreateTask:](v37, (void *)v12);
  if (objc_msgSend((id)v12, "state") != 1)
  {
    v38 = *(NSObject **)(v2 + 120);
    v41[0] = v22;
    v41[1] = 3221225472;
    v41[2] = __40____NSURLSessionLocal_taskForClassInfo___block_invoke_4;
    v41[3] = &unk_1E14FE118;
    v41[4] = v12;
    dispatch_async(v38, v41);
  }
  return (id)v12;
}

- (unint64_t)nextSeed
{
  unint64_t v3;

  objc_sync_enter(self);
  v3 = *((_QWORD *)self + 20);
  *((_QWORD *)self + 20) = v3 + 1;
  objc_sync_exit(self);
  return v3;
}

- (void)task:(uint64_t)a1 terminatedConnection:(uint64_t)a2
{
  NSObject *v3;
  _QWORD block[5];

  if (a1)
  {
    objc_msgSend(*(id *)(a1 + 176), "removeObject:", a2);
    v3 = *(NSObject **)(a1 + 120);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __49____NSURLSessionLocal_task_terminatedConnection___block_invoke;
    block[3] = &unk_1E14FE118;
    block[4] = a1;
    dispatch_async(v3, block);
  }
}

- (uint64_t)_onqueue_configureAndCreateConnection:(void *)a3 task:
{
  uint64_t v5;
  uint64_t v6;
  _QWORD v7[7];

  if (result)
  {
    v5 = result;
    v6 = objc_opt_class();
    objc_msgSend(a3, "updateCurrentRequest:", a2);
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __66____NSURLSessionLocal__onqueue_configureAndCreateConnection_task___block_invoke;
    v7[3] = &unk_1E14FE1E0;
    v7[4] = v5;
    v7[5] = a3;
    v7[6] = v6;
    return objc_msgSend(a3, "_onqueue_setupNextEffectiveConfigurationWithCompletionHandler:", v7);
  }
  return result;
}

- (void)dealloc
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  objc_super v7;

  v3 = *((_QWORD *)self + 21);
  if (v3)
  {
    (*(void (**)(uint64_t, SEL))(*(_QWORD *)v3 + 48))(v3, a2);
    *((_QWORD *)self + 21) = 0;
  }
  v4 = (void *)*((_QWORD *)self + 22);
  if (v4)
  {

    *((_QWORD *)self + 22) = 0;
  }

  v5 = *((_QWORD *)self + 26);
  if (v5)
  {
    (*(void (**)(uint64_t))(*(_QWORD *)v5 + 48))(v5);
    *((_QWORD *)self + 26) = 0;
  }
  v6 = *((_QWORD *)self + 27);
  if (v6)
  {
    (*(void (**)(uint64_t))(*(_QWORD *)v6 + 48))(v6);
    *((_QWORD *)self + 27) = 0;
  }

  v7.receiver = self;
  v7.super_class = (Class)__NSURLSessionLocal;
  -[NSURLSession dealloc](&v7, sel_dealloc);
}

- (void)_onqueue_completeInvalidation:(BOOL)a3
{
  NSObject *v5;
  IONotificationPort *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t j;
  _QWORD aBlock[5];
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint8_t v27[128];
  uint8_t buf[136];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  if (self)
  {
    if ((objc_msgSend(*((id *)self + 14), "_disableAPWakeOnIdleConnections") & 1) != 0)
    {
      if (*((_DWORD *)self + 13))
      {
        IONotificationPortSetDispatchQueue(*((IONotificationPortRef *)self + 7), 0);
        if (*((_DWORD *)self + 16))
        {
          if (IODeregisterForSystemPower((io_object_t *)self + 16))
          {
            if (CFNLog::onceToken != -1)
              dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4755);
            v5 = CFNLog::logger;
            if (os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_ERROR))
            {
              *(_WORD *)buf = 0;
              _os_log_error_impl(&dword_183ECA000, v5, OS_LOG_TYPE_ERROR, "Failed to IODeregisterForSystemPower", buf, 2u);
            }
          }
          *((_DWORD *)self + 16) = 0;
        }
        IOServiceClose(*((_DWORD *)self + 13));
        *((_DWORD *)self + 13) = 0;
        v6 = (IONotificationPort *)*((_QWORD *)self + 7);
        if (v6)
        {
          IONotificationPortDestroy(v6);
          *((_QWORD *)self + 7) = 0;
        }
      }

    }
    v7 = *((_QWORD *)self + 15);
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __53____NSURLSessionLocal__onqueue_completeInvalidation___block_invoke;
    aBlock[3] = &unk_1E14F8A00;
    aBlock[4] = self;
    if (*((_QWORD *)self + 25))
    {
      __53____NSURLSessionLocal__onqueue_completeInvalidation___block_invoke((uint64_t)aBlock, 0);
    }
    else
    {
      *((_QWORD *)self + 25) = _Block_copy(aBlock);
      *((_QWORD *)self + 24) = v7;
      if (v7)
        dispatch_retain(v7);
      if (a3)
      {
        v8 = (void *)objc_msgSend(*((id *)self + 22), "mutableCopy");
        os_unfair_lock_lock((os_unfair_lock_t)self + 100);
        v25 = 0u;
        v26 = 0u;
        v23 = 0u;
        v24 = 0u;
        v9 = (void *)*((_QWORD *)self + 23);
        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v23, buf, 16);
        if (v10)
        {
          v11 = v10;
          v12 = *(_QWORD *)v24;
          do
          {
            for (i = 0; i != v11; ++i)
            {
              if (*(_QWORD *)v24 != v12)
                objc_enumerationMutation(v9);
              objc_msgSend(v8, "addObject:", *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * i));
            }
            v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v23, buf, 16);
          }
          while (v11);
        }
        os_unfair_lock_unlock((os_unfair_lock_t)self + 100);
        v19 = 0u;
        v20 = 0u;
        v21 = 0u;
        v22 = 0u;
        v14 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
        if (v14)
        {
          v15 = v14;
          v16 = *(_QWORD *)v20;
          do
          {
            for (j = 0; j != v15; ++j)
            {
              if (*(_QWORD *)v20 != v16)
                objc_enumerationMutation(v8);
              objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * j), "cancel");
            }
            v15 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
          }
          while (v15);
        }

      }
      -[__NSURLSessionLocal _onqueue_checkForCompletion]((uint64_t)self);
    }
  }
  else
  {
    objc_msgSend(0, "_disableAPWakeOnIdleConnections", a3);
  }
}

- (void)_onqueue_checkForCompletion
{
  uint64_t v2;
  CFDictionaryRef *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  _QWORD block[5];

  if (a1)
  {
    if (*(_QWORD *)(a1 + 200))
    {
      os_unfair_lock_lock((os_unfair_lock_t)(a1 + 400));
      v2 = objc_msgSend(*(id *)(a1 + 184), "anyObject");
      os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 400));
      if (!v2 && !objc_msgSend(*(id *)(a1 + 176), "count"))
      {
        v3 = *(CFDictionaryRef **)(a1 + 168);
        if (v3)
          XTubeManager::invalidateAllConnections(v3, 0);
        v4 = *(_QWORD *)(a1 + 208);
        if (v4)
        {
          (*(void (**)(uint64_t))(*(_QWORD *)v4 + 48))(v4);
          *(_QWORD *)(a1 + 208) = 0;
        }
        v5 = *(_QWORD *)(a1 + 216);
        if (v5)
        {
          (*(void (**)(uint64_t))(*(_QWORD *)v5 + 48))(v5);
          *(_QWORD *)(a1 + 216) = 0;
        }
        *(_BYTE *)(a1 + 360) = 1;
        v6 = *(_QWORD *)(a1 + 200);
        if (v6)
        {
          if (*(_QWORD *)(a1 + 192))
          {
            *(_QWORD *)(a1 + 200) = 0;
            v7 = *(NSObject **)(a1 + 192);
            *(_QWORD *)(a1 + 192) = 0;
            block[0] = MEMORY[0x1E0C809B0];
            block[1] = 3221225472;
            block[2] = __56____NSURLSessionLocal__onqueue_invokeInvalidateCallback__block_invoke;
            block[3] = &unk_1E14FDEB0;
            block[4] = v6;
            dispatch_async(v7, block);
            dispatch_release(v7);
          }
        }
      }
    }
  }
}

- (void)_useTLSSessionCacheFromSession:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  std::__shared_weak_count *v6;
  unint64_t *p_shared_owners;
  unint64_t v8;
  unint64_t v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)__NSURLSessionLocal;
  -[NSURLSession _useTLSSessionCacheFromSession:](&v10, sel__useTLSSessionCacheFromSession_, a3);
  v4 = *((_QWORD *)self + 21);
  v5 = *((_QWORD *)self + 2);
  v6 = (std::__shared_weak_count *)*((_QWORD *)self + 3);
  if (v6)
  {
    p_shared_owners = (unint64_t *)&v6->__shared_owners_;
    do
      v8 = __ldxr(p_shared_owners);
    while (__stxr(v8 + 1, p_shared_owners));
    std::shared_ptr<__CFString const>::operator=[abi:nn180100]((_QWORD *)(v4 + 144), v5, (uint64_t)v6);
    do
      v9 = __ldaxr(p_shared_owners);
    while (__stlxr(v9 - 1, p_shared_owners));
    if (!v9)
    {
      ((void (*)(std::__shared_weak_count *))v6->__on_zero_shared)(v6);
      std::__shared_weak_count::__release_weak(v6);
    }
  }
  else
  {
    std::shared_ptr<__CFString const>::operator=[abi:nn180100]((_QWORD *)(v4 + 144), v5, 0);
  }
}

- (id)_dataTaskWithTaskForClass:(id)a3
{
  void *v5;
  const char *v6;
  __NSURLSessionLocal *v7;
  id v8;

  v5 = (void *)objc_opt_class();
  if (a3)
  {
    objc_setProperty_atomic(a3, v6, v5, 8);
    v7 = self;
    v8 = a3;
  }
  else
  {
    v7 = self;
    v8 = 0;
  }
  return -[__NSURLSessionLocal taskForClassInfo:](v7, v8);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 29) = 850045863;
  *((_OWORD *)self + 15) = 0u;
  *((_OWORD *)self + 16) = 0u;
  *((_OWORD *)self + 17) = 0u;
  *((_QWORD *)self + 36) = 0;
  *((_QWORD *)self + 37) = 850045863;
  *((_OWORD *)self + 19) = 0u;
  *((_OWORD *)self + 20) = 0u;
  *((_OWORD *)self + 21) = 0u;
  *((_QWORD *)self + 44) = 0;
  return self;
}

- (void).cxx_destruct
{
  std::mutex::~mutex((std::mutex *)((char *)self + 296));
  std::mutex::~mutex((std::mutex *)((char *)self + 232));
}

- (id)replaceTask:(void *)a3 withTask:
{
  id *v5;
  CFStringRef v6;
  CFStringRef v7;
  id v8;

  if (result)
  {
    v5 = result;
    if (objc_msgSend(a2, "_powerAssertion"))
    {
      objc_msgSend(a3, "set_powerAssertion:", objc_msgSend(a2, "_powerAssertion"));
      objc_msgSend(a2, "set_powerAssertion:", 0);
      v6 = CFStringCreateWithFormat((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, CFSTR("NSURLSessionTask %p"), a3);
      if (v6)
      {
        v7 = v6;
        IOPMAssertionSetProperty(objc_msgSend(a3, "_powerAssertion"), CFSTR("AssertName"), v6);
        CFRelease(v7);
      }
    }
    v8 = a2;
    objc_msgSend(v5[22], "addObject:", a3);
    objc_msgSend(v5[22], "removeObject:", a2);
    return (id *)a2;
  }
  return result;
}

- (id)_withXURLCache:(id *)result
{
  NSURLSession *v3;
  NSURLSession *v4;
  id *v5;

  if (result)
  {
    v3 = (NSURLSession *)result;
    result = (id *)objc_msgSend(result[14], "URLCache");
    if (result)
    {
      result = (id *)XURLCache::createNSXURLCache((XURLCache *)result, v3, v4);
      if (result)
      {
        v5 = result;
        (*(void (**)(uint64_t, id *))(a2 + 16))(a2, result);
        return (id *)(*((uint64_t (**)(id *))*v5 + 1))(v5);
      }
    }
  }
  return result;
}

- (uint64_t)_createXCredentialStorage
{
  uint64_t v1;
  std::mutex *v2;
  const void *v3;
  NSXCredentialStorage *v4;
  NSXCredentialStorage *EmptyXCredentialStorage;

  if (result)
  {
    v1 = result;
    v2 = (std::mutex *)(result + 296);
    std::mutex::lock((std::mutex *)(result + 296));
    if (!*(_BYTE *)(v1 + 225))
    {
      v3 = (const void *)objc_msgSend(*(id *)(v1 + 112), "URLCredentialStorage");
      if (v3)
      {
        v4 = (NSXCredentialStorage *)CFAllocatorAllocate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 32, 0);
        *(_OWORD *)v4 = 0u;
        *((_OWORD *)v4 + 1) = 0u;
        NSXCredentialStorage::NSXCredentialStorage(v4, v3);
      }
      else
      {
        EmptyXCredentialStorage = XCredentialStorage::createEmptyXCredentialStorage(0);
      }
      *(_QWORD *)(v1 + 216) = EmptyXCredentialStorage;
      *(_BYTE *)(v1 + 225) = 1;
    }
    std::mutex::unlock(v2);
    result = *(_QWORD *)(v1 + 216);
    if (result)
    {
      (*(void (**)(uint64_t))(*(_QWORD *)result + 40))(result);
      return *(_QWORD *)(v1 + 216);
    }
  }
  return result;
}

- (uint64_t)_createXCookieStorage
{
  uint64_t v1;
  std::mutex *v2;
  char *EmptyXCookieStorage;
  const XCookieStorage *v4;

  if (result)
  {
    v1 = result;
    v2 = (std::mutex *)(result + 232);
    std::mutex::lock((std::mutex *)(result + 232));
    if (!*(_BYTE *)(v1 + 224))
    {
      EmptyXCookieStorage = (char *)objc_msgSend(*(id *)(v1 + 112), "HTTPCookieStorage");
      if (!EmptyXCookieStorage
        || (XCookieStorage::createNSXCookieStorage((XCookieStorage *)EmptyXCookieStorage, v4), !EmptyXCookieStorage))
      {
        EmptyXCookieStorage = XCookieStorage::createEmptyXCookieStorage((XCookieStorage *)EmptyXCookieStorage, v4);
      }
      *(_QWORD *)(v1 + 208) = EmptyXCookieStorage;
      *(_BYTE *)(v1 + 224) = 1;
    }
    std::mutex::unlock(v2);
    result = *(_QWORD *)(v1 + 208);
    if (result)
    {
      (*(void (**)(uint64_t))(*(_QWORD *)result + 40))(result);
      return *(_QWORD *)(v1 + 208);
    }
  }
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  __NSURLSessionLocal *v4;

  v4 = self;
  return self;
}

- (id)webSocketTaskForRequest:(id)a3
{
  void *v5;
  _QWORD *v6;
  void *v7;
  const char *v8;
  SEL v9;
  _BYTE __buf[16];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = (void *)objc_msgSend(a3, "allHTTPHeaderFields");
  if (!objc_msgSend(v5, "objectForKeyedSubscript:", 0x1EDCFD5F0))
    objc_msgSend(a3, "setValue:forHTTPHeaderField:", CFSTR("13"), 0x1EDCFD5F0);
  if (!objc_msgSend(v5, "objectForKeyedSubscript:", 0x1EDCFD7B0))
    objc_msgSend(a3, "setValue:forHTTPHeaderField:", 0x1EDCFE000, 0x1EDCFD7B0);
  if (!objc_msgSend(v5, "objectForKeyedSubscript:", 0x1EDCFCDA0))
    objc_msgSend(a3, "setValue:forHTTPHeaderField:", 0x1EDCFDFC8, 0x1EDCFCDA0);
  if (!objc_msgSend(v5, "objectForKeyedSubscript:", 0x1EDCFD580))
  {
    arc4random_buf(__buf, 0x10uLL);
    objc_msgSend(a3, "setValue:forHTTPHeaderField:", objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytesNoCopy:length:freeWhenDone:", __buf, 16, 0), "base64EncodedStringWithOptions:", 0), 0x1EDCFD580);
  }
  if (!objc_msgSend(v5, "objectForKeyedSubscript:", 0x1EDCFD548))
    objc_msgSend(a3, "setValue:forHTTPHeaderField:", 0x1EDCFDF20, 0x1EDCFD548);
  v6 = -[__NSCFTaskForClass initWithGroup:]([__NSCFTaskForClass alloc], -[NSURLSession defaultTaskGroup](self, "defaultTaskGroup"));
  v7 = (void *)objc_opt_class();
  if (v6)
  {
    objc_setProperty_atomic(v6, v8, v7, 8);
    objc_setProperty_atomic(v6, v9, a3, 16);
  }
  return -[__NSURLSessionLocal taskForClassInfo:](self, v6);
}

- (id)webSocketTaskForURL:(id)a3 protocols:(id)a4
{
  void *v6;
  int v7;
  uint64_t *v8;
  NSMutableURLRequest *v9;
  id v10;
  unint64_t v11;

  v6 = (void *)objc_msgSend(MEMORY[0x1E0CB3998], "componentsWithURL:resolvingAgainstBaseURL:", a3, 0);
  if ((objc_msgSend((id)objc_msgSend(v6, "scheme"), "isEqualToString:", 0x1EDD00BC0) & 1) == 0
    && !objc_msgSend((id)objc_msgSend(v6, "scheme"), "isEqualToString:", 0x1EDD00BF8))
  {
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99750], CFSTR("WebSocket tasks can only be created with ws or wss schemes"), 0));
  }
  v7 = objc_msgSend((id)objc_msgSend(v6, "scheme"), "isEqualToString:", 0x1EDD00BC0);
  v8 = &kCFURLSchemeHTTP;
  if (!v7)
    v8 = &kCFURLSchemeHTTPS;
  objc_msgSend(v6, "setScheme:", *v8);
  v9 = -[NSURLRequest initWithURL:]([NSMutableURLRequest alloc], "initWithURL:", objc_msgSend(v6, "URL"));
  -[NSMutableURLRequest setCachePolicy:](v9, "setCachePolicy:", 1);
  if (a4)
  {
    v10 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
    if (objc_msgSend(a4, "count"))
    {
      v11 = 0;
      do
      {
        if (v11)
          objc_msgSend(v10, "appendString:", CFSTR(", "));
        objc_msgSend(v10, "appendString:", objc_msgSend(a4, "objectAtIndexedSubscript:", v11++));
      }
      while (objc_msgSend(a4, "count") > v11);
    }
    -[NSMutableURLRequest addValue:forHTTPHeaderField:](v9, "addValue:forHTTPHeaderField:", v10, 0x1EDCFD5B8);
  }
  return -[NSURLSession webSocketTaskWithRequest:](self, "webSocketTaskWithRequest:", v9);
}

- (id)_AVAssetDownloadTaskForURL:(id)a3 destinationURL:(id)a4 options:(id)a5
{
  objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99750], CFSTR("Cannot create an NSURLSessionAVAssetDownloadTask in a non-background session"), 0));
}

- (id)AVAssetDownloadTaskForURLAsset:(id)a3 destinationURL:(id)a4 options:(id)a5
{
  objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99750], CFSTR("Cannot create an NSURLSessionAVAssetDownloadTask in a non-background session"), 0));
}

- (id)AVAssetDownloadTaskForURLAsset:(id)a3 assetTitle:(id)a4 assetArtworkData:(id)a5 options:(id)a6 downloadConfiguration:(id)a7
{
  objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99750], CFSTR("Cannot create an NSURLSessionAVAssetDownloadTask in a non-background session"), 0, a6, a7));
}

- (id)AVAggregateAssetDownloadTaskForURLAsset:(id)a3 mediaSelections:(id)a4 assetTitle:(id)a5 assetArtworkData:(id)a6 options:(id)a7
{
  objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99750], CFSTR("Cannot create an AVAggregateAssetDownloadTask in a non-background session"), 0, a6, a7));
}

- (void)_onqueue_handleConnectionsAtAPSleep
{
  uint64_t v3;
  CFDictionaryRef *v4;

  if (self)
  {
    v3 = *((_QWORD *)self + 21);
    if (v3)
    {
      pthread_mutex_lock((pthread_mutex_t *)(v3 + 40));
      CFDictionaryApplyFunction(*(CFDictionaryRef *)(v3 + 32), (CFDictionaryApplierFunction)RetainableTypedDict<CoreSchedulingSet const*,GlueTubeManager *>::_visit, &__block_literal_global_343);
      pthread_mutex_unlock((pthread_mutex_t *)(v3 + 40));
      v4 = (CFDictionaryRef *)*((_QWORD *)self + 21);
      if (v4)
        XTubeManager::invalidateAllConnections(v4, 1);
    }
  }
}

- (void)_onqueue_resetStorageWithCompletionHandler:(id)a3
{
  -[__NSURLSessionLocal _flushOrResetStorage:reset:]((uint64_t)self, (uint64_t)a3, 1);
}

- (void)_onqueue_flushWithCompletionHandler:(id)a3
{
  -[__NSURLSessionLocal _flushOrResetStorage:reset:]((uint64_t)self, (uint64_t)a3, 0);
}

- (void)_onqueue_getTasksWithCompletionHandler:(id)a3
{
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  _QWORD v12[6];
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = (void *)objc_msgSend(*((id *)self + 22), "copy");
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 0);
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v5);
        v11 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        if (objc_msgSend(v11, "state") <= 1)
          objc_msgSend(v6, "addObject:", v11);
      }
      v8 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }

  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __62____NSURLSessionLocal__onqueue_getTasksWithCompletionHandler___block_invoke;
  v12[3] = &unk_1E14FDF00;
  v12[4] = v6;
  v12[5] = a3;
  -[NSURLSession runDelegateBlock:]((uint64_t)self, v12);
}

- (void)_onqueue_markConnectionsReusedAfterAPSleepWake
{
  uint64_t v2;

  if (self)
  {
    v2 = *((_QWORD *)self + 21);
    if (v2)
    {
      pthread_mutex_lock((pthread_mutex_t *)(v2 + 40));
      CFDictionaryApplyFunction(*(CFDictionaryRef *)(v2 + 32), (CFDictionaryApplierFunction)RetainableTypedDict<CoreSchedulingSet const*,GlueTubeManager *>::_visit, &__block_literal_global_346);
      pthread_mutex_unlock((pthread_mutex_t *)(v2 + 40));
    }
  }
}

- (void)URLSession:(id)a3 didBecomeInvalidWithError:(id)a4
{
  if (a4)
  {

    *((_QWORD *)self + 47) = 0;
    *((_BYTE *)self + 384) = 1;
  }
}

- (void)_flushOrResetStorage:(uint64_t)a3 reset:
{
  void *v6;
  NSObject *v7;
  uint64_t XCookie;
  uint64_t v9;
  uint64_t v10;
  uint64_t XCredential;
  uint64_t v12;
  NSObject *v13;
  _QWORD block[5];
  _QWORD v15[5];
  char v16;
  _QWORD v17[6];
  _QWORD v18[6];

  if (a1)
  {
    v6 = (void *)MEMORY[0x186DB8C8C]();
    v7 = dispatch_group_create();
    XCookie = -[__NSURLSessionLocal _createXCookieStorage](a1);
    v9 = MEMORY[0x1E0C809B0];
    if (XCookie)
    {
      v10 = XCookie;
      dispatch_group_enter(v7);
      v18[0] = v9;
      v18[1] = 3221225472;
      v18[2] = __50____NSURLSessionLocal__flushOrResetStorage_reset___block_invoke;
      v18[3] = &unk_1E14FE140;
      v18[4] = v7;
      v18[5] = v10;
      (*(void (**)(uint64_t, uint64_t, _QWORD *))(*(_QWORD *)v10 + 72))(v10, a3, v18);
    }
    XCredential = -[__NSURLSessionLocal _createXCredentialStorage](a1);
    if (XCredential)
    {
      v12 = XCredential;
      dispatch_group_enter(v7);
      v17[0] = v9;
      v17[1] = 3221225472;
      v17[2] = __50____NSURLSessionLocal__flushOrResetStorage_reset___block_invoke_2;
      v17[3] = &unk_1E14FE140;
      v17[4] = v7;
      v17[5] = v12;
      (*(void (**)(uint64_t, uint64_t, _QWORD *))(*(_QWORD *)v12 + 96))(v12, a3, v17);
    }
    v15[0] = v9;
    v15[1] = 3221225472;
    v15[2] = __50____NSURLSessionLocal__flushOrResetStorage_reset___block_invoke_3;
    v15[3] = &unk_1E14F61F8;
    v15[4] = v7;
    v16 = a3;
    -[__NSURLSessionLocal _withXURLCache:]((id *)a1, (uint64_t)v15);
    v13 = *(NSObject **)(a1 + 120);
    block[0] = v9;
    block[1] = 3221225472;
    block[2] = __50____NSURLSessionLocal__flushOrResetStorage_reset___block_invoke_5;
    block[3] = &unk_1E14FDEB0;
    block[4] = a2;
    dispatch_group_notify(v7, v13, block);
    dispatch_release(v7);
    objc_autoreleasePoolPop(v6);
  }
}

- (void)addConnectionlessTask:(uint64_t)a1
{
  if (a1)
  {
    objc_msgSend(*(id *)(a1 + 176), "addObject:", a2);
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 400));
    objc_msgSend(*(id *)(a1 + 184), "removeObject:", a2);
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 400));
  }
}

- (void)removeConnectionlessTask:(uint64_t)a1
{
  NSObject *v3;
  _QWORD block[5];

  if (a1)
  {
    objc_msgSend(*(id *)(a1 + 176), "removeObject:", a2);
    if (!objc_msgSend(*(id *)(a1 + 176), "count"))
    {
      v3 = *(NSObject **)(a1 + 120);
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __48____NSURLSessionLocal_removeConnectionlessTask___block_invoke;
      block[3] = &unk_1E14FE118;
      block[4] = a1;
      dispatch_async(v3, block);
    }
  }
}

- (void)addUnresumedTask:(uint64_t)a1
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 400));
    objc_msgSend(*(id *)(a1 + 184), "addObject:", a2);
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 400));
  }
}

- (uint64_t)_withConnectionCache_setCurrentSSLMethod:(uint64_t)a3 forKey:(const void *)a4 scheduling:
{
  uint64_t result;
  _QWORD v5[6];

  result = *(_QWORD *)(a1 + 168);
  if (result)
  {
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = ___ZN12XTubeManager25setCurrentSSLMethodForKeyEPK22HTTPConnectionCacheKeyPK10__CFStringPK17CoreSchedulingSet_block_invoke;
    v5[3] = &__block_descriptor_48_e9_v16__0_v8l;
    v5[4] = a3;
    v5[5] = a2;
    return XTubeManager::withTubeManager(result, a4, (uint64_t)v5);
  }
  return result;
}

@end
