@implementation _WKRemoteObjectRegistry

- (id).cxx_construct
{
  *(_OWORD *)((char *)self + 24) = 0u;
  *(_OWORD *)((char *)self + 8) = 0u;
  return self;
}

- (void)_sendInvocation:(id)a3 interface:(id)a4
{
  void *v7;
  uint64_t v8;
  uint64_t i;
  WKRemoteObjectEncoder *v10;
  RemoteObjectRegistry *value;
  uint64_t v12;
  uint64_t v13;
  WTF::StringImpl *v14;
  WTF *v15;
  WTF *v16;
  uint64_t v17;
  WTF::StringImpl *v18;
  WTF::StringImpl *v19;
  WTF *v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  WTF *v25;
  WTF::StringImpl *v26;
  WTF *v27;
  WTF::StringImpl *v28;
  uint64_t *v29;
  objc_selector *v30;
  WTF::StringImpl *v31[3];
  WTF::StringImpl *v32;
  uint64_t v33;
  WTF *v34;
  uint64_t v35;
  void *aBlock;
  WTF *v37;

  v37 = 0;
  v7 = (void *)objc_msgSend(a3, "methodSignature");
  v8 = objc_msgSend(v7, "numberOfArguments");
  if (v8)
  {
    for (i = 0; i != v8; ++i)
    {
      if (!strcmp((const char *)objc_msgSend(v7, "getArgumentTypeAtIndex:", i), "@?"))
      {
        v21 = *MEMORY[0x1E0C99778];
        if (v37)
          objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", v21, CFSTR("Only one reply block is allowed per message send. (%s)"), sel_getName((SEL)objc_msgSend(a3, "selector")));
        aBlock = 0;
        objc_msgSend(a3, "getArgument:atIndex:", &aBlock, i);
        v22 = aBlock;
        if (!aBlock)
        {
          objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", v21, CFSTR("A NULL reply block was passed into a message. (%s)"), sel_getName((SEL)objc_msgSend(a3, "selector")));
          v22 = aBlock;
        }
        v23 = _Block_signature(v22);
        if (strcmp((const char *)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99DD8], "signatureWithObjCTypes:", v23), "methodReturnType"), "v"))
        {
          objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", v21, CFSTR("Return value of block argument must be 'void'. (%s)"), sel_getName((SEL)objc_msgSend(a3, "selector")));
        }
        v24 = ++generateReplyIdentifier(void)::identifier;
        WTF::String::String((WTF::String *)v31, v23);
        v25 = (WTF *)WTF::fastMalloc((WTF *)0x10);
        *(_QWORD *)v25 = v24;
        v26 = v31[0];
        v31[0] = 0;
        *((_QWORD *)v25 + 1) = v26;
        v32 = 0;
        v27 = v37;
        v37 = v25;
        if (v27)
        {
          std::default_delete<WebKit::RemoteObjectInvocation::ReplyInfo>::operator()[abi:sn180100]((int)&v37, v27);
          v27 = v32;
          v32 = 0;
          if (v27)
            std::default_delete<WebKit::RemoteObjectInvocation::ReplyInfo>::operator()[abi:sn180100]((int)&v32, v27);
        }
        v28 = v31[0];
        v31[0] = 0;
        if (v28)
        {
          if (*(_DWORD *)v28 == 2)
            WTF::StringImpl::destroy(v28, v27);
          else
            *(_DWORD *)v28 -= 2;
        }
        v35 = 0;
        objc_msgSend(a3, "setArgument:atIndex:", &v35, i);
        v29 = (uint64_t *)v37;
        v30 = (objc_selector *)objc_msgSend(a3, "selector");
        PendingReply::PendingReply((PendingReply *)&v32, a4, v30, (objc_object *)aBlock);
        WTF::HashMap<unsigned long long,PendingReply,WTF::DefaultHash<unsigned long long>,WTF::HashTraits<unsigned long long>,WTF::HashTraits<PendingReply>,WTF::HashTableTraits>::add<PendingReply>((uint64_t)v31, (uint64_t *)&self->_pendingReplies, v29, (uint64_t *)&v32);
        PendingReply::~PendingReply((PendingReply *)&v32);
      }
    }
  }
  v10 = objc_alloc_init(WKRemoteObjectEncoder);
  -[WKRemoteObjectEncoder encodeObject:forKey:](v10, "encodeObject:forKey:", a3, CFSTR("invocation"));
  value = self->_remoteObjectRegistry.__ptr_.__value_;
  if (value)
  {
    MEMORY[0x19AEABCC8](v31, objc_msgSend(a4, "identifier"));
    v12 = -[WKRemoteObjectEncoder rootObjectDictionary](v10, "rootObjectDictionary");
    v13 = v12;
    if (v12)
      CFRetain(*(CFTypeRef *)(v12 + 8));
    v14 = v31[0];
    if (v31[0])
      *(_DWORD *)v31[0] += 2;
    v32 = v14;
    v33 = v13;
    v15 = v37;
    v37 = 0;
    v34 = v15;
    (*(void (**)(RemoteObjectRegistry *, WTF::StringImpl **))(*(_QWORD *)value + 40))(value, &v32);
    v16 = v34;
    v34 = 0;
    if (v16)
      std::default_delete<WebKit::RemoteObjectInvocation::ReplyInfo>::operator()[abi:sn180100]((int)&v34, v16);
    v17 = v33;
    v33 = 0;
    if (v17)
      CFRelease(*(CFTypeRef *)(v17 + 8));
    v18 = v32;
    v32 = 0;
    if (v18)
    {
      if (*(_DWORD *)v18 == 2)
        WTF::StringImpl::destroy(v18, v16);
      else
        *(_DWORD *)v18 -= 2;
    }
    v19 = v31[0];
    v31[0] = 0;
    if (v19)
    {
      if (*(_DWORD *)v19 == 2)
        WTF::StringImpl::destroy(v19, v16);
      else
        *(_DWORD *)v19 -= 2;
    }
  }
  if (v10)
    CFRelease(v10);
  v20 = v37;
  v37 = 0;
  if (v20)
    std::default_delete<WebKit::RemoteObjectInvocation::ReplyInfo>::operator()[abi:sn180100]((int)&v37, v20);
}

- (id)remoteObjectProxyWithInterface:(id)a3
{
  void *m_ptr;
  RetainPtr<NSMapTable> *p_remoteObjectProxies;
  CFTypeRef v7;
  const void *v9;
  id v10;

  p_remoteObjectProxies = &self->_remoteObjectProxies;
  m_ptr = self->_remoteObjectProxies.m_ptr;
  if (!m_ptr)
  {
    WTF::RetainPtr<NSURLSession>::operator=((const void **)&p_remoteObjectProxies->m_ptr, (CFTypeRef)objc_msgSend(MEMORY[0x1E0CB3748], "strongToWeakObjectsMapTable"));
    m_ptr = p_remoteObjectProxies->m_ptr;
  }
  v7 = (CFTypeRef)objc_msgSend(m_ptr, "objectForKey:", objc_msgSend(a3, "identifier"));
  if (!v7)
  {
    v9 = (const void *)objc_msgSend((id)objc_msgSend(a3, "identifier"), "copy");
    v10 = -[WKRemoteObject _initWithObjectRegistry:interface:]([WKRemoteObject alloc], "_initWithObjectRegistry:interface:", self, a3);
    objc_msgSend(p_remoteObjectProxies->m_ptr, "setObject:forKey:", v10, v9);
    v7 = (id)CFMakeCollectable(v10);
    if (v9)
      CFRelease(v9);
  }
  return (id)v7;
}

- (void)registerExportedObject:(id)a3 interface:(id)a4
{
  id v4;
  WTF::StringImpl *v7;
  const WTF::StringImpl *v8;
  uint64_t *p_exportedObjects;
  uint64_t v10;
  void *m_table;
  unsigned int v12;
  unsigned int v13;
  int v14;
  WTF::StringImpl **v15;
  int i;
  int v17;
  WTF::StringImpl **v18;
  WTF *v19;
  WTF::StringImpl *v20;
  WTF::StringImpl *v21;
  WTF::StringImpl *v22;
  WTF::StringImpl *v23;
  WTF::StringImpl *v24;
  uint64_t v25;
  int v26;
  uint64_t v27;
  int v28;
  uint64_t v29;
  unint64_t v30;
  WTF::StringImpl *v31;
  WTF::StringImpl *cf;
  WTF::StringImpl *v33;

  v4 = a4;
  MEMORY[0x19AEABCC8](&v33, objc_msgSend(a4, "identifier"));
  if (a3)
    CFRetain(a3);
  if (v4)
    CFRetain(v4);
  cf = (WTF::StringImpl *)a3;
  m_table = self->_exportedObjects.m_impl.var0.m_table;
  p_exportedObjects = (uint64_t *)&self->_exportedObjects;
  v10 = (uint64_t)m_table;
  if (m_table
    || (WTF::HashTable<WTF::String,WTF::KeyValuePair<WTF::String,std::pair<WTF::RetainPtr<objc_object *>,WTF::RetainPtr<_WKRemoteObjectInterface>>>,WTF::KeyValuePairKeyExtractor<WTF::KeyValuePair<WTF::String,std::pair<WTF::RetainPtr<objc_object *>,WTF::RetainPtr<_WKRemoteObjectInterface>>>>,WTF::DefaultHash<WTF::String>,WTF::HashMap<WTF::String,std::pair<WTF::RetainPtr<objc_object *>,WTF::RetainPtr<_WKRemoteObjectInterface>>,WTF::DefaultHash<WTF::String>,WTF::HashTraits<WTF::String>,WTF::HashTraits<std::pair<WTF::RetainPtr<objc_object *>,WTF::RetainPtr<_WKRemoteObjectInterface>>>,WTF::HashTableTraits>::KeyValuePairTraits,WTF::HashTraits<WTF::String>>::expand(p_exportedObjects),
        (v10 = *p_exportedObjects) != 0))
  {
    v12 = *(_DWORD *)(v10 - 8);
  }
  else
  {
    v12 = 0;
  }
  v13 = *((_DWORD *)v33 + 4);
  if (v13 >= 0x100)
    v14 = v13 >> 8;
  else
    v14 = WTF::StringImpl::hashSlowCase(v33);
  v15 = 0;
  for (i = 1; ; ++i)
  {
    v17 = v14 & v12;
    v18 = (WTF::StringImpl **)(v10 + 24 * (v14 & v12));
    v19 = *v18;
    if (!*v18)
      break;
    if (v19 != (WTF *)-1)
    {
      v18 = v15;
      if ((WTF::equal(v19, v33, v8) & 1) != 0)
        goto LABEL_44;
    }
    v14 = i + v17;
    v15 = v18;
  }
  if (v15)
  {
    *v15 = 0;
    v15[1] = 0;
    v15[2] = 0;
    --*(_DWORD *)(*p_exportedObjects - 16);
    v18 = v15;
  }
  v20 = v33;
  v33 = 0;
  v21 = *v18;
  *v18 = v20;
  if (v21)
  {
    if (*(_DWORD *)v21 == 2)
      WTF::StringImpl::destroy(v21, v7);
    else
      *(_DWORD *)v21 -= 2;
  }
  v22 = cf;
  cf = 0;
  v23 = v18[1];
  v18[1] = v22;
  if (v23)
    CFRelease(v23);
  v24 = v18[2];
  v18[2] = (WTF::StringImpl *)v4;
  if (v24)
    CFRelease(v24);
  v25 = *p_exportedObjects;
  if (*p_exportedObjects)
    v26 = *(_DWORD *)(v25 - 12) + 1;
  else
    v26 = 1;
  *(_DWORD *)(v25 - 12) = v26;
  v27 = *p_exportedObjects;
  if (*p_exportedObjects)
    v28 = *(_DWORD *)(v27 - 12);
  else
    v28 = 0;
  v29 = (*(_DWORD *)(v27 - 16) + v28);
  v30 = *(unsigned int *)(v27 - 4);
  if (v30 > 0x400)
  {
    if (v30 > 2 * v29)
      goto LABEL_29;
  }
  else if (3 * v30 > 4 * v29)
  {
    goto LABEL_29;
  }
  WTF::HashTable<WTF::String,WTF::KeyValuePair<WTF::String,std::pair<WTF::RetainPtr<objc_object *>,WTF::RetainPtr<_WKRemoteObjectInterface>>>,WTF::KeyValuePairKeyExtractor<WTF::KeyValuePair<WTF::String,std::pair<WTF::RetainPtr<objc_object *>,WTF::RetainPtr<_WKRemoteObjectInterface>>>>,WTF::DefaultHash<WTF::String>,WTF::HashMap<WTF::String,std::pair<WTF::RetainPtr<objc_object *>,WTF::RetainPtr<_WKRemoteObjectInterface>>,WTF::DefaultHash<WTF::String>,WTF::HashTraits<WTF::String>,WTF::HashTraits<std::pair<WTF::RetainPtr<objc_object *>,WTF::RetainPtr<_WKRemoteObjectInterface>>>,WTF::HashTableTraits>::KeyValuePairTraits,WTF::HashTraits<WTF::String>>::expand(p_exportedObjects);
  v4 = 0;
LABEL_44:
  if (v4)
    CFRelease(v4);
LABEL_29:
  if (cf)
    CFRelease(cf);
  v31 = v33;
  v33 = 0;
  if (v31)
  {
    if (*(_DWORD *)v31 == 2)
      WTF::StringImpl::destroy(v31, v7);
    else
      *(_DWORD *)v31 -= 2;
  }
}

- (void)remoteObjectRegistry
{
  return self->_remoteObjectRegistry.__ptr_.__value_;
}

- (id)_initWithWebPageProxy:(NakedRef<WebKit::WebPageProxy>)a3
{
  _WKRemoteObjectRegistry *v4;
  WebKit::RemoteObjectRegistry *v5;
  unsigned int *v6;
  unsigned int v7;
  RemoteObjectRegistry *value;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)_WKRemoteObjectRegistry;
  v4 = -[_WKRemoteObjectRegistry init](&v10, sel_init);
  if (v4)
  {
    v5 = (WebKit::RemoteObjectRegistry *)WTF::fastMalloc((WTF *)0x28);
    *(_QWORD *)WebKit::RemoteObjectRegistry::RemoteObjectRegistry(v5, v4) = off_1E34DC2A0;
    WTF::WeakPtrFactory<IPC::MessageReceiver,WTF::DefaultWeakPtrImpl>::initializeIfNeeded((unsigned int *)a3.var0 + 6, (uint64_t)a3.var0 + 16);
    v6 = (unsigned int *)*((_QWORD *)a3.var0 + 3);
    do
      v7 = __ldaxr(v6);
    while (__stlxr(v7 + 1, v6));
    *((_QWORD *)v5 + 4) = v6;
    value = v4->_remoteObjectRegistry.__ptr_.__value_;
    v4->_remoteObjectRegistry.__ptr_.__value_ = (RemoteObjectRegistry *)v5;
    if (value)
      (*(void (**)(RemoteObjectRegistry *))(*(_QWORD *)value + 8))(value);
  }
  return v4;
}

- (id)_initWithWebPage:(NakedRef<WebKit::WebPage>)a3
{
  _WKRemoteObjectRegistry *v4;
  WebKit::WebRemoteObjectRegistry *v5;
  RemoteObjectRegistry *value;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)_WKRemoteObjectRegistry;
  v4 = -[_WKRemoteObjectRegistry init](&v8, sel_init);
  if (v4)
  {
    v5 = (WebKit::WebRemoteObjectRegistry *)WTF::fastMalloc((WTF *)0x28);
    WebKit::WebRemoteObjectRegistry::WebRemoteObjectRegistry(v5, v4, (WebKit::WebPage *)a3.var0);
    value = v4->_remoteObjectRegistry.__ptr_.__value_;
    v4->_remoteObjectRegistry.__ptr_.__value_ = (RemoteObjectRegistry *)v5;
    if (value)
      (*(void (**)(RemoteObjectRegistry *))(*(_QWORD *)value + 8))(value);
  }
  return v4;
}

- (void)unregisterExportedObject:(id)a3 interface:(id)a4
{
  WTF::StringImpl *v5;
  const WTF::StringImpl *v6;
  uint64_t *p_exportedObjects;
  unsigned int *v8;
  unsigned int *m_tableForLLDB;
  int v10;
  unsigned int v11;
  int v12;
  int i;
  int v14;
  uint64_t v15;
  WTF *v16;
  uint64_t v17;
  const void *v18;
  const void *v19;
  uint64_t v20;
  int v21;
  uint64_t v22;
  unsigned int v23;
  unsigned int v24;
  WTF::StringImpl *v25;
  WTF::StringImpl *v26;

  MEMORY[0x19AEABCC8](&v26, objc_msgSend(a4, "identifier", a3));
  m_tableForLLDB = self->_exportedObjects.m_impl.var0.m_tableForLLDB;
  p_exportedObjects = (uint64_t *)&self->_exportedObjects;
  v8 = m_tableForLLDB;
  if (m_tableForLLDB)
  {
    v10 = *(v8 - 2);
    v11 = *((_DWORD *)v26 + 4);
    if (v11 >= 0x100)
      v12 = v11 >> 8;
    else
      v12 = WTF::StringImpl::hashSlowCase(v26);
    for (i = 0; ; v12 = i + v14)
    {
      v14 = v12 & v10;
      v15 = (uint64_t)&v8[6 * (v12 & v10)];
      v16 = *(WTF **)v15;
      if (*(_QWORD *)v15 != -1)
      {
        if (!v16)
        {
          v17 = *p_exportedObjects;
          if (!*p_exportedObjects)
            goto LABEL_25;
          v15 = v17 + 24 * *(unsigned int *)(v17 - 4);
          goto LABEL_13;
        }
        if ((WTF::equal(v16, v26, v6) & 1) != 0)
          break;
      }
      ++i;
    }
    v17 = *p_exportedObjects;
    if (!*p_exportedObjects)
      goto LABEL_14;
LABEL_13:
    v17 += 24 * *(unsigned int *)(v17 - 4);
    if (v17 == v15)
      goto LABEL_25;
LABEL_14:
    if (v17 != v15)
    {
      WTF::HashTraits<WTF::String>::customDeleteBucket((WTF::StringImpl **)v15, v5);
      v18 = *(const void **)(v15 + 16);
      *(_QWORD *)(v15 + 16) = 0;
      if (v18)
        CFRelease(v18);
      v19 = *(const void **)(v15 + 8);
      *(_QWORD *)(v15 + 8) = 0;
      if (v19)
        CFRelease(v19);
      ++*(_DWORD *)(*p_exportedObjects - 16);
      v20 = *p_exportedObjects;
      if (*p_exportedObjects)
        v21 = *(_DWORD *)(v20 - 12) - 1;
      else
        v21 = -1;
      *(_DWORD *)(v20 - 12) = v21;
      v22 = *p_exportedObjects;
      if (*p_exportedObjects)
      {
        v23 = 6 * *(_DWORD *)(v22 - 12);
        v24 = *(_DWORD *)(v22 - 4);
        if (v23 < v24 && v24 >= 9)
          WTF::HashTable<WTF::String,WTF::KeyValuePair<WTF::String,std::pair<WTF::RetainPtr<objc_object *>,WTF::RetainPtr<_WKRemoteObjectInterface>>>,WTF::KeyValuePairKeyExtractor<WTF::KeyValuePair<WTF::String,std::pair<WTF::RetainPtr<objc_object *>,WTF::RetainPtr<_WKRemoteObjectInterface>>>>,WTF::DefaultHash<WTF::String>,WTF::HashMap<WTF::String,std::pair<WTF::RetainPtr<objc_object *>,WTF::RetainPtr<_WKRemoteObjectInterface>>,WTF::DefaultHash<WTF::String>,WTF::HashTraits<WTF::String>,WTF::HashTraits<std::pair<WTF::RetainPtr<objc_object *>,WTF::RetainPtr<_WKRemoteObjectInterface>>>,WTF::HashTableTraits>::KeyValuePairTraits,WTF::HashTraits<WTF::String>>::rehash(p_exportedObjects, v24 >> 1);
      }
    }
  }
LABEL_25:
  v25 = v26;
  v26 = 0;
  if (v25)
  {
    if (*(_DWORD *)v25 == 2)
      WTF::StringImpl::destroy(v25, v5);
    else
      *(_DWORD *)v25 -= 2;
  }
}

- (void)_invalidate
{
  RemoteObjectRegistry *value;

  value = self->_remoteObjectRegistry.__ptr_.__value_;
  self->_remoteObjectRegistry.__ptr_.__value_ = 0;
  if (value)
    (*(void (**)(RemoteObjectRegistry *))(*(_QWORD *)value + 8))(value);
}

- (void)_invokeMethod:(const void *)a3
{
  uint64_t v5;
  void *v6;
  WKRemoteObjectDecoder *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  const __CFString *v12;
  void *v13;
  char *v14;
  void *v15;
  WebKit *v16;
  WTF *v17;
  NSString *v18;
  NSString *v19;
  WTF *v20;
  unsigned int *v21;
  unsigned int v22;
  void *v23;
  WTF *v24[8];
  _QWORD v25[4];
  id v26;
  uint64_t v27;
  CFTypeRef v28;

  v5 = *((_QWORD *)a3 + 1);
  if (v5)
    CFRetain(*(CFTypeRef *)(v5 + 8));
  WTF::HashMap<WTF::String,std::pair<WTF::RetainPtr<objc_object *>,WTF::RetainPtr<_WKRemoteObjectInterface>>,WTF::DefaultHash<WTF::String>,WTF::HashTraits<WTF::String>,WTF::HashTraits<std::pair<WTF::RetainPtr<objc_object *>,WTF::RetainPtr<_WKRemoteObjectInterface>>>,WTF::HashTableTraits>::get<WTF::IdentityHashTranslator<WTF::HashMap<WTF::String,std::pair<WTF::RetainPtr<objc_object *>,WTF::RetainPtr<_WKRemoteObjectInterface>>,WTF::DefaultHash<WTF::String>,WTF::HashTraits<WTF::String>,WTF::HashTraits<std::pair<WTF::RetainPtr<objc_object *>,WTF::RetainPtr<_WKRemoteObjectInterface>>>,WTF::HashTableTraits>::KeyValuePairTraits,WTF::DefaultHash<WTF::String>>,WTF::String>(&v27, (uint64_t)self->_exportedObjects.m_impl.var0.m_table, (WTF::StringImpl **)a3);
  v6 = (void *)v28;
  if (!v28)
  {
    if (*(_QWORD *)a3)
      v12 = (const __CFString *)WTF::StringImpl::operator NSString *();
    else
      v12 = &stru_1E351F1B8;
    NSLog(CFSTR("Did not find a registered object for the interface \"%@\"), v12);
    goto LABEL_12;
  }
  CFRetain(v28);
  v7 = -[WKRemoteObjectDecoder initWithInterface:rootObjectDictionary:replyToSelector:]([WKRemoteObjectDecoder alloc], "initWithInterface:rootObjectDictionary:replyToSelector:", v6, v5, 0);
  v8 = (void *)-[WKRemoteObjectDecoder decodeObjectOfClass:forKey:](v7, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("invocation"));
  v9 = (void *)objc_msgSend(v8, "methodSignature");
  v10 = objc_msgSend(v9, "numberOfArguments");
  if (v10)
  {
    v11 = 0;
    while (strcmp((const char *)objc_msgSend(v9, "getArgumentTypeAtIndex:", v11), "@?"))
    {
      if (v10 == ++v11)
        goto LABEL_8;
    }
    if (!*((_QWORD *)a3 + 2))
    {
      NSLog(CFSTR("_invokeMethod: Expected reply block, but none provided"));
      goto LABEL_9;
    }
    v13 = (void *)MEMORY[0x1E0C99DD8];
    WTF::String::utf8();
    if (v24[0])
      v14 = (char *)v24[0] + 16;
    else
      v14 = 0;
    v16 = (WebKit *)objc_msgSend((id)objc_msgSend(v13, "signatureWithObjCTypes:", v14), "_typeString");
    v17 = v24[0];
    v24[0] = 0;
    if (v17)
    {
      if (*(_DWORD *)v17 == 1)
        WTF::fastFree(v17, v15);
      else
        --*(_DWORD *)v17;
    }
    v19 = (NSString *)replyBlockSignature((Protocol *)objc_msgSend(v6, "protocol"), (objc_selector *)objc_msgSend(v8, "selector"), v11);
    if (!v19)
    {
      NSLog(CFSTR("_invokeMethod: Failed to validate reply block signature: could not find local signature"));
      goto LABEL_9;
    }
    if (!WebKit::methodSignaturesAreCompatible(v16, v19, v18))
    {
      NSLog(CFSTR("_invokeMethod: Failed to validate reply block signature: %@ != %@"), v16, v19);
      goto LABEL_9;
    }
    if (self)
      CFRetain(self);
    v20 = (WTF *)**((_QWORD **)a3 + 2);
    -[_WKRemoteObjectRegistry _invokeMethod:]::ReplyBlockCallChecker::create((uint64_t *)v24, self, (uint64_t)v20);
    v21 = (unsigned int *)v24[0];
    v26 = 0;
    -[WebKit UTF8String](v16, "UTF8String");
    v24[4] = (WTF *)MEMORY[0x1E0C809B0];
    v24[5] = (WTF *)3321888768;
    v24[6] = (WTF *)__41___WKRemoteObjectRegistry__invokeMethod___block_invoke;
    v24[7] = (WTF *)&__block_descriptor_64_e8_32c54_ZTSKZ41___WKRemoteObjectRegistry__invokeMethod__E3__1_e22_v16__0__NSInvocation_8l;
    v24[0] = (WTF *)v6;
    CFRetain(v6);
    v24[1] = (WTF *)self;
    if (self)
      CFRetain(self);
    v24[2] = v20;
    if (v21)
    {
      do
        v22 = __ldaxr(v21);
      while (__stlxr(v22 + 1, v21));
    }
    v24[3] = (WTF *)v21;
    -[_WKRemoteObjectRegistry _invokeMethod:]::$_1::$_1(v25, (uint64_t)v24);
    v23 = (void *)__NSMakeSpecialForwardingCaptureBlock();
    -[_WKRemoteObjectRegistry _invokeMethod:]::$_1::~$_1((uint64_t)v24);
    v26 = v23;
    objc_msgSend(v8, "setArgument:atIndex:", &v26, v11);
    objc_setAssociatedObject(v8, (const void *)replyBlockKey, v26, (void *)0x301);

    -[_WKRemoteObjectRegistry _invokeMethod:]::$_1::~$_1((uint64_t)v25);
    if (v21)
      WTF::ThreadSafeRefCounted<-[_WKRemoteObjectRegistry _invokeMethod:]::ReplyBlockCallChecker,(WTF::DestructionThread)2>::deref(v21);
    if (self)
      CFRelease(self);
  }
LABEL_8:
  objc_msgSend(v8, "setTarget:", v27);
  objc_msgSend(v8, "invoke");
LABEL_9:
  if (v7)
    CFRelease(v7);
  CFRelease(v6);
LABEL_12:
  std::pair<WTF::RetainPtr<objc_object *>,WTF::RetainPtr<_WKRemoteObjectInterface>>::~pair((uint64_t)&v27);
  if (v5)
    CFRelease(*(CFTypeRef *)(v5 + 8));
}

- (uint64_t)_invokeMethod:(uint64_t)a3
{
  uint64_t result;
  uint64_t v7;

  result = WTF::fastMalloc((WTF *)0x20);
  v7 = result;
  *(_DWORD *)result = 1;
  *(_QWORD *)(result + 8) = a2;
  if (a2)
    result = (uint64_t)CFRetain(a2);
  *(_QWORD *)(v7 + 16) = a3;
  *(_BYTE *)(v7 + 24) = 0;
  *a1 = v7;
  return result;
}

- (_QWORD)_invokeMethod:(_QWORD *)a1
{
  const void *v4;
  const void *v5;
  unsigned int *v6;
  unsigned int v7;

  v4 = *(const void **)a2;
  *a1 = *(_QWORD *)a2;
  if (v4)
    CFRetain(v4);
  v5 = *(const void **)(a2 + 8);
  a1[1] = v5;
  if (v5)
    CFRetain(v5);
  v6 = *(unsigned int **)(a2 + 24);
  a1[2] = *(_QWORD *)(a2 + 16);
  if (v6)
  {
    do
      v7 = __ldaxr(v6);
    while (__stlxr(v7 + 1, v6));
  }
  a1[3] = v6;
  return a1;
}

- (uint64_t)_invokeMethod:(uint64_t)a1
{
  unsigned int *v2;
  const void *v3;
  const void *v4;

  v2 = *(unsigned int **)(a1 + 24);
  *(_QWORD *)(a1 + 24) = 0;
  if (v2)
    WTF::ThreadSafeRefCounted<-[_WKRemoteObjectRegistry _invokeMethod:]::ReplyBlockCallChecker,(WTF::DestructionThread)2>::deref(v2);
  v3 = *(const void **)(a1 + 8);
  *(_QWORD *)(a1 + 8) = 0;
  if (v3)
    CFRelease(v3);
  v4 = *(const void **)a1;
  *(_QWORD *)a1 = 0;
  if (v4)
    CFRelease(v4);
  return a1;
}

- (void)_callReplyWithID:(unint64_t)a3 blockInvocation:(const void *)a4
{
  CFTypeRef *v4;
  char *v7;
  uint64_t *p_pendingReplies;
  char *m_table;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  const void *v13;
  const void *v14;
  uint64_t v15;
  uint64_t v16;
  WKRemoteObjectDecoder *v17;
  void *v18;

  v4 = *(CFTypeRef **)a4;
  if (*(_QWORD *)a4)
  {
    CFRetain(v4[1]);
    if ((*((unsigned int (**)(CFTypeRef *))*v4 + 2))(v4) != 9
      || ((m_table = (char *)self->_pendingReplies.m_impl.var0.m_table,
           p_pendingReplies = (uint64_t *)&self->_pendingReplies,
           v7 = m_table,
           v10 = WTF::HashTable<unsigned long long,WTF::KeyValuePair<unsigned long long,PendingReply>,WTF::KeyValuePairKeyExtractor<WTF::KeyValuePair<unsigned long long,PendingReply>>,WTF::DefaultHash<unsigned long long>,WTF::HashMap<unsigned long long,PendingReply,WTF::DefaultHash<unsigned long long>,WTF::HashTraits<unsigned long long>,WTF::HashTraits<PendingReply>,WTF::HashTableTraits>::KeyValuePairTraits,WTF::HashTraits<unsigned long long>>::find<WTF::IdentityHashTranslator<WTF::HashMap<unsigned long long,PendingReply,WTF::DefaultHash<unsigned long long>,WTF::HashTraits<unsigned long long>,WTF::HashTraits<PendingReply>,WTF::HashTableTraits>::KeyValuePairTraits,WTF::DefaultHash<unsigned long long>>,unsigned long long>((uint64_t)m_table, a3), v11 = v10, !m_table)? (v12 = 0): (v12 = &v7[32 * *((unsigned int *)v7 - 1)]), v12 == (char *)v10))
    {
LABEL_24:
      CFRelease(v4[1]);
      return;
    }
    v13 = *(const void **)(v10 + 8);
    if (v13)
      CFRetain(*(CFTypeRef *)(v10 + 8));
    v15 = *(_QWORD *)(v11 + 16);
    v14 = *(const void **)(v11 + 24);
    if (v14)
      CFRetain(*(CFTypeRef *)(v11 + 24));
    if (*p_pendingReplies)
    {
      v16 = *p_pendingReplies + 32 * *(unsigned int *)(*p_pendingReplies - 4);
      if (v16 == v11)
        goto LABEL_18;
    }
    else
    {
      if (!v11)
      {
LABEL_18:
        v17 = -[WKRemoteObjectDecoder initWithInterface:rootObjectDictionary:replyToSelector:]([WKRemoteObjectDecoder alloc], "initWithInterface:rootObjectDictionary:replyToSelector:", v13, v4, v15);
        v18 = (void *)-[WKRemoteObjectDecoder decodeObjectOfClass:forKey:](v17, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("invocation"));
        objc_msgSend(v18, "setTarget:", v14);
        objc_msgSend(v18, "invoke");
        if (v17)
          CFRelease(v17);
        if (v14)
          CFRelease(v14);
        if (v13)
          CFRelease(v13);
        goto LABEL_24;
      }
      v16 = 0;
    }
    if (v16 != v11)
      WTF::HashTable<unsigned long long,WTF::KeyValuePair<unsigned long long,PendingReply>,WTF::KeyValuePairKeyExtractor<WTF::KeyValuePair<unsigned long long,PendingReply>>,WTF::DefaultHash<unsigned long long>,WTF::HashMap<unsigned long long,PendingReply,WTF::DefaultHash<unsigned long long>,WTF::HashTraits<unsigned long long>,WTF::HashTraits<PendingReply>,WTF::HashTableTraits>::KeyValuePairTraits,WTF::HashTraits<unsigned long long>>::remove(p_pendingReplies, (_QWORD *)v11);
    goto LABEL_18;
  }
}

- (void)_releaseReplyWithID:(unint64_t)a3
{
  uint64_t *p_pendingReplies;
  char *m_table;
  char *v5;
  char *v6;

  p_pendingReplies = (uint64_t *)&self->_pendingReplies;
  m_table = (char *)self->_pendingReplies.m_impl.var0.m_table;
  v5 = (char *)WTF::HashTable<unsigned long long,WTF::KeyValuePair<unsigned long long,PendingReply>,WTF::KeyValuePairKeyExtractor<WTF::KeyValuePair<unsigned long long,PendingReply>>,WTF::DefaultHash<unsigned long long>,WTF::HashMap<unsigned long long,PendingReply,WTF::DefaultHash<unsigned long long>,WTF::HashTraits<unsigned long long>,WTF::HashTraits<PendingReply>,WTF::HashTableTraits>::KeyValuePairTraits,WTF::HashTraits<unsigned long long>>::find<WTF::IdentityHashTranslator<WTF::HashMap<unsigned long long,PendingReply,WTF::DefaultHash<unsigned long long>,WTF::HashTraits<unsigned long long>,WTF::HashTraits<PendingReply>,WTF::HashTableTraits>::KeyValuePairTraits,WTF::DefaultHash<unsigned long long>>,unsigned long long>((uint64_t)m_table, a3);
  if (m_table)
  {
    v6 = &m_table[32 * *((unsigned int *)m_table - 1)];
    if (v6 == v5)
      return;
  }
  else
  {
    if (!v5)
      return;
    v6 = 0;
  }
  if (v6 != v5)
    WTF::HashTable<unsigned long long,WTF::KeyValuePair<unsigned long long,PendingReply>,WTF::KeyValuePairKeyExtractor<WTF::KeyValuePair<unsigned long long,PendingReply>>,WTF::DefaultHash<unsigned long long>,WTF::HashMap<unsigned long long,PendingReply,WTF::DefaultHash<unsigned long long>,WTF::HashTraits<unsigned long long>,WTF::HashTraits<PendingReply>,WTF::HashTableTraits>::KeyValuePairTraits,WTF::HashTraits<unsigned long long>>::remove(p_pendingReplies, v5);
}

- (void).cxx_destruct
{
  unsigned int *m_tableForLLDB;
  uint64_t v4;
  const void **v5;
  const void *v6;
  const void *v7;
  unsigned int *v8;
  uint64_t v9;
  WTF::StringImpl **m_table;
  WTF::StringImpl *v11;
  WTF::StringImpl *v12;
  WTF::StringImpl *v13;
  void *m_ptr;
  RemoteObjectRegistry *value;

  m_tableForLLDB = self->_pendingReplies.m_impl.var0.m_tableForLLDB;
  if (m_tableForLLDB)
  {
    v4 = *(m_tableForLLDB - 1);
    if ((_DWORD)v4)
    {
      v5 = (const void **)(m_tableForLLDB + 6);
      do
      {
        if (*(v5 - 3) != (const void *)-1)
        {
          v6 = *v5;
          *v5 = 0;
          if (v6)
            CFRelease(v6);
          v7 = *(v5 - 2);
          *(v5 - 2) = 0;
          if (v7)
            CFRelease(v7);
        }
        v5 += 4;
        --v4;
      }
      while (v4);
    }
    WTF::fastFree((WTF *)(m_tableForLLDB - 4), (void *)a2);
  }
  v8 = self->_exportedObjects.m_impl.var0.m_tableForLLDB;
  if (v8)
  {
    v9 = *(v8 - 1);
    if ((_DWORD)v9)
    {
      m_table = (WTF::StringImpl **)self->_exportedObjects.m_impl.var0.m_table;
      do
      {
        if (*m_table != (WTF::StringImpl *)-1)
        {
          v11 = m_table[2];
          m_table[2] = 0;
          if (v11)
            CFRelease(v11);
          v12 = m_table[1];
          m_table[1] = 0;
          if (v12)
            CFRelease(v12);
          v13 = *m_table;
          *m_table = 0;
          if (v13)
          {
            if (*(_DWORD *)v13 == 2)
              WTF::StringImpl::destroy(v13, (WTF::StringImpl *)a2);
            else
              *(_DWORD *)v13 -= 2;
          }
        }
        m_table += 3;
        --v9;
      }
      while (v9);
    }
    WTF::fastFree((WTF *)(v8 - 4), (void *)a2);
  }
  m_ptr = self->_remoteObjectProxies.m_ptr;
  self->_remoteObjectProxies.m_ptr = 0;
  if (m_ptr)
    CFRelease(m_ptr);
  value = self->_remoteObjectRegistry.__ptr_.__value_;
  self->_remoteObjectRegistry.__ptr_.__value_ = 0;
  if (value)
    (*(void (**)(RemoteObjectRegistry *))(*(_QWORD *)value + 8))(value);
}

- (unsigned)_invokeMethod:()WTF::DestructionThread
{
  unsigned int *v1;
  unsigned int v2;
  unsigned int v3;
  unsigned int *v4;
  unsigned int *v5;

  v1 = result;
  do
  {
    v2 = __ldaxr(result);
    v3 = v2 - 1;
  }
  while (__stlxr(v3, result));
  if (!v3)
  {
    atomic_store(1u, result);
    v4 = (unsigned int *)WTF::fastMalloc((WTF *)0x10);
    *(_QWORD *)v4 = off_1E34B71D8;
    *((_QWORD *)v4 + 1) = v1;
    v5 = v4;
    WTF::ensureOnMainRunLoop();
    result = v5;
    if (v5)
      return (unsigned int *)(*(uint64_t (**)(unsigned int *))(*(_QWORD *)v5 + 8))(v5);
  }
  return result;
}

- (uint64_t)_invokeMethod:()WTF::DestructionThread
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  const void *v5;
  uint64_t v6;
  __int128 v7;
  _QWORD v8[2];

  v2 = *(_QWORD *)(result + 8);
  if (v2)
  {
    if (!*(_BYTE *)(v2 + 24))
    {
      v3 = *(_QWORD *)(*(_QWORD *)(v2 + 8) + 8);
      if (v3)
      {
        v6 = *(_QWORD *)(v2 + 16);
        v8[0] = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v3 + 56))(v3);
        v8[1] = v4;
        *(_QWORD *)&v7 = &v6;
        *((_QWORD *)&v7 + 1) = v3;
        WTF::switchOn<std::variant<std::reference_wrapper<WebKit::WebProcessProxy>,std::reference_wrapper<WebKit::WebPage>>,void WebKit::RemoteObjectRegistry::send<Messages::RemoteObjectRegistry::ReleaseUnusedReplyBlock>(Messages::RemoteObjectRegistry::ReleaseUnusedReplyBlock &&)::{lambda(Messages::RemoteObjectRegistry::ReleaseUnusedReplyBlock)#1}>((uint64_t)v8, &v7);
      }
    }
    v5 = *(const void **)(v2 + 8);
    *(_QWORD *)(v2 + 8) = 0;
    if (v5)
      CFRelease(v5);
    return WTF::fastFree((WTF *)v2, a2);
  }
  return result;
}

@end
