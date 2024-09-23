@implementation NSXPCInterface

- (BOOL)_specialCaseObject
{
  return self->_specialCaseObject;
}

- (Protocol)protocol
{
  return self->_protocol;
}

+ (NSXPCInterface)interfaceWithProtocol:(Protocol *)protocol
{
  void *v4;

  v4 = (void *)objc_opt_new();
  objc_msgSend(v4, "setProtocol:", protocol);
  return (NSXPCInterface *)v4;
}

- (NSXPCInterface)init
{
  NSXPCInterface *result;
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v3.receiver = self;
  v3.super_class = (Class)NSXPCInterface;
  result = -[NSXPCInterface init](&v3, sel_init);
  if (result)
  {
    result->_remoteVersion = 1;
    result->_knownSelectorsLock._os_unfair_lock_opaque = 0;
  }
  return result;
}

- (void)setProtocol:(Protocol *)protocol
{
  void *v5;
  char *Name;
  const __CFString *v7;
  const char *v8;
  Class v9;
  objc_class *v10;
  __CFDictionary *methodInfo;
  objc_class *v12;
  Class cls[387];

  cls[386] = *(Class *)MEMORY[0x1E0C80C00];
  if (self->_protocol != protocol)
  {
    v5 = (void *)MEMORY[0x186DA8F78]();
    os_unfair_lock_lock(&self->_knownSelectorsLock);
    os_unfair_lock_lock_with_options();
    Name = (char *)protocol_getName(protocol);
    if (!strncmp(Name, "EXExtensionContextHosting", 0x19uLL))
      self->_specialCaseObject = 1;
    if (strchr(Name, 46))
      v7 = CFSTR("..__NSXPCInterfaceProxy_%s");
    else
      v7 = CFSTR("__NSXPCInterfaceProxy_%s");
    v8 = -[NSString UTF8String](+[NSString stringWithFormat:](NSString, "stringWithFormat:", v7, Name), "UTF8String");
    v9 = objc_lookUpClass(v8);
    bzero(cls, 0xC10uLL);
    if (!v9)
    {
      v10 = (objc_class *)objc_opt_class();
      cls[0] = objc_allocateClassPair(v10, v8, 0);
    }
    methodInfo = self->_methodInfo;
    if (methodInfo)
      CFRelease(methodInfo);
    self->_methodInfo = 0;
    setProtocolMetadata(protocol, (uint64_t)cls);
    if (cls[0])
    {
      setProtocolContextFlush((uint64_t)cls);
      objc_registerClassPair(cls[0]);
    }
    os_unfair_lock_unlock((os_unfair_lock_t)&setProtocol__globalRuntimeLockForObjC);
    v12 = cls[0];
    if (v9)
      v12 = v9;
    self->_xpcDOSubclass = v12;
    os_unfair_lock_unlock(&self->_knownSelectorsLock);
    self->_protocol = protocol;
    objc_autoreleasePoolPop(v5);
  }
}

- (BOOL)_selectorIsAllowed:(SEL)a3 isReply:(BOOL)a4 methodSignature:(id *)a5 allowedClasses:(id *)a6
{
  _BOOL4 v8;
  os_unfair_lock_s *p_knownSelectorsLock;
  void **v12;
  void **v13;
  void *Value;
  __CFDictionary *knownSelectors;
  id v16;
  uint64_t v17;

  v8 = a4;
  p_knownSelectorsLock = &self->_knownSelectorsLock;
  os_unfair_lock_lock(&self->_knownSelectorsLock);
  v12 = (void **)-[NSXPCInterface _locked_methodInfoForSelector:createIfNecessary:]((uint64_t)self, (void *)a3, 1);
  v13 = v12;
  if (v12)
  {
    if (v8)
    {
      Value = *v12;
    }
    else
    {
      knownSelectors = self->_knownSelectors;
      if (!knownSelectors)
      {
        knownSelectors = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE30], 0, &kNSXPCSelKeyCallbacks, MEMORY[0x1E0C9B3A0]);
        self->_knownSelectors = knownSelectors;
      }
      Value = (void *)CFDictionaryGetValue(knownSelectors, a3);
    }
    v16 = Value;
    v17 = 2;
    if (v8)
      v17 = 1;
    *a6 = (id)objc_msgSend(v13[v17], "copy");
    os_unfair_lock_unlock(p_knownSelectorsLock);
    if (!v16)
      v16 = -[NSXPCInterface _generateAndCacheMethodSignatureForRemoteSelector:](self, "_generateAndCacheMethodSignatureForRemoteSelector:", a3);
    *a5 = v16;
  }
  else
  {
    os_unfair_lock_unlock(p_knownSelectorsLock);
  }
  return v13 != 0;
}

- (id)_interfaceForArgument:(unint64_t)a3 ofSelector:(SEL)a4 reply:(BOOL)a5
{
  _BOOL4 v5;
  os_unfair_lock_s *p_knownSelectorsLock;
  _QWORD *v10;
  uint64_t v11;
  void *v12;
  id v13;

  v5 = a5;
  p_knownSelectorsLock = &self->_knownSelectorsLock;
  os_unfair_lock_lock(&self->_knownSelectorsLock);
  v10 = -[NSXPCInterface _locked_methodInfoForSelector:createIfNecessary:]((uint64_t)self, (void *)a4, 0);
  if (v10)
  {
    v11 = 2;
    if (v5)
      v11 = 1;
    v12 = (void *)v10[v11];
  }
  else
  {
    v12 = 0;
  }
  if (objc_msgSend(v12, "count") <= a3)
  {
    v13 = 0;
  }
  else
  {
    v13 = (id)objc_msgSend(v12, "objectAtIndex:", a3);
    if ((objc_opt_isKindOfClass() & 1) == 0)
      v13 = 0;
  }
  os_unfair_lock_unlock(p_knownSelectorsLock);
  return v13;
}

- (void)setClasses:(NSSet *)classes forSelector:(SEL)sel argumentIndex:(NSUInteger)arg ofReply:(BOOL)ofReply
{
  Protocol *protocol;
  _BOOL4 v10;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  _QWORD *v16;
  _QWORD *v17;
  uint64_t v18;
  id v19;
  void *v20;
  void *v21;
  NSString *v22;
  const char *v23;
  const __CFString *v24;
  NSString *v25;
  const __CFString *v26;
  NSString *v27;
  NSString *v28;
  NSString *v29;
  void *v30;
  NSString *v31;
  const char *Name;
  const char *v33;
  _BYTE v34[128];
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  protocol = self->_protocol;
  if (!protocol)
  {
    v31 = _NSMethodExceptionProem((objc_class *)self, a2);
    v26 = CFSTR("%@: Protocol must be set before calling this method.");
    goto LABEL_29;
  }
  if (!sel)
  {
    v31 = _NSMethodExceptionProem((objc_class *)self, a2);
    v26 = CFSTR("%@: Selector argument must be non-NULL.");
    goto LABEL_29;
  }
  v10 = ofReply;
  if (!selectorInProtocol(sel, protocol))
  {
    v27 = _NSMethodExceptionProem((objc_class *)self, a2);
    Name = sel_getName(sel);
    v33 = protocol_getName(protocol);
    v31 = v27;
    v26 = CFSTR("%@: Selector '%s' is not in protocol '%s', or is not an instance method.");
LABEL_29:
    v28 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v26, v31, Name, v33);
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], v28, 0));
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
LABEL_22:
    v21 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: Classes argument must be an NSSet of Class objects."), _NSMethodExceptionProem((objc_class *)self, a2)), 0);
    objc_exception_throw(v21);
  }
  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  v13 = -[NSSet countByEnumeratingWithState:objects:count:](classes, "countByEnumeratingWithState:objects:count:", &v35, v34, 16);
  if (v13)
  {
    v14 = *(_QWORD *)v36;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v36 != v14)
          objc_enumerationMutation(classes);
        if (!class_getName(*(Class *)(*((_QWORD *)&v35 + 1) + 8 * i)))
          goto LABEL_22;
      }
      v13 = -[NSSet countByEnumeratingWithState:objects:count:](classes, "countByEnumeratingWithState:objects:count:", &v35, v34, 16);
    }
    while (v13);
  }
  os_unfair_lock_lock(&self->_knownSelectorsLock);
  v16 = -[NSXPCInterface _locked_methodInfoForSelector:createIfNecessary:]((uint64_t)self, (void *)sel, 1);
  v17 = v16;
  if (!v16)
    goto LABEL_23;
  v18 = 2;
  if (v10)
    v18 = 1;
  v19 = (id)objc_msgSend((id)v16[v18], "mutableCopy");
  v20 = v19;
  if (!v19)
  {
LABEL_23:
    v22 = _NSMethodExceptionProem((objc_class *)self, a2);
    v23 = sel_getName(sel);
    v24 = CFSTR("selector");
    if (v10)
      v24 = CFSTR("reply block of selector");
    v25 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: No arguments were detected for %@ %s"), v22, v24, v23);
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], v25, 0));
  }
  if (objc_msgSend(v19, "count") <= arg)
  {
    v29 = _NSMethodExceptionProem((objc_class *)self, a2);
    v30 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: Argument index  '%ld' is out of range for selector %s. The maximum index is %ld."), v29, arg, sel_getName(sel), objc_msgSend(v20, "count") - 1), 0);
    objc_exception_throw(v30);
  }
  objc_msgSend(v20, "replaceObjectAtIndex:withObject:", arg, classes);
  if (v10)
  {

    v17[1] = objc_msgSend(v20, "copy");
  }
  else
  {

    v17[2] = objc_msgSend(v20, "copy");
  }
  os_unfair_lock_unlock(&self->_knownSelectorsLock);
}

- (_QWORD)_locked_methodInfoForSelector:(int)a3 createIfNecessary:
{
  const __CFDictionary *Mutable;
  _QWORD *Value;
  BOOL v8;
  uint64_t MethodTypeEncoding;
  Protocol *v10;
  const char *v11;
  _BOOL8 v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  const char *v17;
  NSString *v18;
  const char *Name;

  if (!a1)
    return 0;
  Mutable = *(const __CFDictionary **)(a1 + 32);
  if (!Mutable)
  {
    Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE30], 0, &kNSXPCSelKeyCallbacks, 0);
    *(_QWORD *)(a1 + 32) = Mutable;
  }
  Value = CFDictionaryGetValue(Mutable, key);
  if (Value)
    v8 = 1;
  else
    v8 = a3 == 0;
  if (!v8)
  {
    MethodTypeEncoding = _protocol_getMethodTypeEncoding();
    v10 = *(Protocol **)(a1 + 8);
    v11 = (const char *)key;
    if (MethodTypeEncoding)
    {
      v12 = 1;
    }
    else
    {
      MethodTypeEncoding = _protocol_getMethodTypeEncoding();
      v10 = *(Protocol **)(a1 + 8);
      v11 = (const char *)key;
      if (!MethodTypeEncoding)
      {
        if ((unint64_t)protocol_getMethodDescription(v10, (SEL)key, 1, 1).name
          || (unint64_t)protocol_getMethodDescription((Protocol *)*(_QWORD *)(a1 + 8), (SEL)key, 0, 1).name)
        {
          Name = protocol_getName(*(Protocol **)(a1 + 8));
          v18 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("NSXPCInterface: Unable to get extended method signature from Protocol data (%s / %s). Use of clang is required for NSXPCInterface."), Name, sel_getName((SEL)key));
          goto LABEL_21;
        }
        return 0;
      }
      v12 = 0;
    }
    if (!isMethodFromNSObjectProtocol(v10, v11, v12))
    {
      v13 = objc_msgSend(MEMORY[0x1E0C99DD8], "signatureWithObjCTypes:", MethodTypeEncoding);
      if (v13)
      {
        v14 = (void *)v13;
        Value = malloc_type_malloc(0x30uLL, 0x10800402B8B78F1uLL);
        *Value = 0;
        Value[1] = 0;
        Value[2] = 0;
        Value[3] = 1;
        Value[4] = 0;
        *((_DWORD *)Value + 10) = -1;
        *((_WORD *)Value + 22) = 0;
        CFDictionarySetValue(*(CFMutableDictionaryRef *)(a1 + 32), key, Value);
        v15 = protocol_getName(*(Protocol **)(a1 + 8));
        setProtocolMetadataWithSignature((const char *)key, (uint64_t)v15, v14, (uint64_t)Value, 0);
        return Value;
      }
      v17 = protocol_getName(*(Protocol **)(a1 + 8));
      v18 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("NSXPCInterface: Unable to get method signature from Protocol data (%s / %s)"), v17, sel_getName((SEL)key));
LABEL_21:
      objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], v18, 0));
    }
    return 0;
  }
  return Value;
}

- (BOOL)_hasProxiesInReplyBlockArgumentsOfSelector:(SEL)a3
{
  os_unfair_lock_s *p_knownSelectorsLock;
  _QWORD *v6;
  BOOL v7;
  void *v9;

  if (!self->_protocol)
  {
    v9 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: No protocol has been set on interface"), _NSMethodExceptionProem((objc_class *)self, a2)), 0);
    objc_exception_throw(v9);
  }
  p_knownSelectorsLock = &self->_knownSelectorsLock;
  os_unfair_lock_lock(&self->_knownSelectorsLock);
  v6 = -[NSXPCInterface _locked_methodInfoForSelector:createIfNecessary:]((uint64_t)self, (void *)a3, 1);
  if (v6)
    v7 = *((_BYTE *)v6 + 45) != 0;
  else
    v7 = 0;
  os_unfair_lock_unlock(p_knownSelectorsLock);
  return v7;
}

- (Class)_returnClassForSelector:(SEL)a3
{
  os_unfair_lock_s *p_knownSelectorsLock;
  _QWORD *v6;
  objc_class *v7;

  p_knownSelectorsLock = &self->_knownSelectorsLock;
  os_unfair_lock_lock(&self->_knownSelectorsLock);
  v6 = -[NSXPCInterface _locked_methodInfoForSelector:createIfNecessary:]((uint64_t)self, (void *)a3, 1);
  if (v6)
    v7 = (objc_class *)v6[4];
  else
    v7 = 0;
  os_unfair_lock_unlock(p_knownSelectorsLock);
  return v7;
}

- (void)setClass:(Class)a3 forSelector:(SEL)a4 argumentIndex:(unint64_t)a5 ofReply:(BOOL)a6
{
  -[NSXPCInterface setClasses:forSelector:argumentIndex:ofReply:](self, "setClasses:forSelector:argumentIndex:ofReply:", objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", a3), a4, a5, a6);
}

- (id)_methodSignatureForReplyBlockOfSelector:(SEL)a3
{
  os_unfair_lock_s *p_knownSelectorsLock;
  id *v6;
  id v7;

  if (!self->_protocol)
    return 0;
  p_knownSelectorsLock = &self->_knownSelectorsLock;
  os_unfair_lock_lock(&self->_knownSelectorsLock);
  v6 = (id *)-[NSXPCInterface _locked_methodInfoForSelector:createIfNecessary:]((uint64_t)self, (void *)a3, 1);
  if (v6)
    v7 = *v6;
  else
    v7 = 0;
  os_unfair_lock_unlock(p_knownSelectorsLock);
  return v7;
}

- (void)dealloc
{
  __CFDictionary *methodInfo;
  __CFDictionary *knownSelectors;
  objc_super v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  methodInfo = self->_methodInfo;
  if (methodInfo)
  {
    CFDictionaryApplyFunction(methodInfo, (CFDictionaryApplierFunction)_NSXPCInterfaceMethodInfoDealloc, 0);
    CFRelease(self->_methodInfo);
  }
  knownSelectors = self->_knownSelectors;
  if (knownSelectors)
    CFRelease(knownSelectors);
  v5.receiver = self;
  v5.super_class = (Class)NSXPCInterface;
  -[NSXPCInterface dealloc](&v5, sel_dealloc);
}

- (void)setInterface:(NSXPCInterface *)ifc forSelector:(SEL)sel argumentIndex:(NSUInteger)arg ofReply:(BOOL)ofReply
{
  Protocol *protocol;
  _BOOL4 v10;
  _QWORD *v13;
  _QWORD *v14;
  uint64_t v15;
  id v16;
  void *v17;
  id v18;
  _WORD *v19;
  __int16 v20;
  NSString *v21;
  void *v22;
  void *v23;
  void *v24;
  _WORD *v25;
  __int16 v26;
  NSString *v27;
  const char *v28;
  const __CFString *v29;
  NSString *v30;
  const __CFString *v31;
  NSString *v32;
  const char *Name;
  NSString *v34;
  NSString *v35;
  void *v36;
  NSString *v37;
  void *v38;
  NSString *v39;
  void *v40;
  NSString *v41;
  void *v42;
  NSString *v43;
  const char *v44;
  void *v45;
  NSString *v46;
  void *v47;
  NSString *v48;
  uint64_t v49;
  uint64_t v50;

  protocol = self->_protocol;
  if (!protocol)
  {
    v48 = _NSMethodExceptionProem((objc_class *)self, a2);
    v31 = CFSTR("%@: Protocol must be set before calling this method.");
LABEL_35:
    v34 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v31, v48, v49, v50);
LABEL_36:
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], v34, 0));
  }
  if (!sel)
  {
    v48 = _NSMethodExceptionProem((objc_class *)self, a2);
    v31 = CFSTR("%@: Selector argument must be non-NULL.");
    goto LABEL_35;
  }
  v10 = ofReply;
  if (!selectorInProtocol(sel, protocol))
  {
    v32 = _NSMethodExceptionProem((objc_class *)self, a2);
    Name = sel_getName(sel);
    v34 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: Selector '%s' is not in protocol '%s', or is not an instance method."), v32, Name, protocol_getName(protocol));
    goto LABEL_36;
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v48 = _NSMethodExceptionProem((objc_class *)self, a2);
    v31 = CFSTR("%@: Invalid value for interface argument.");
    goto LABEL_35;
  }
  os_unfair_lock_lock(&self->_knownSelectorsLock);
  v13 = -[NSXPCInterface _locked_methodInfoForSelector:createIfNecessary:]((uint64_t)self, (void *)sel, 1);
  v14 = v13;
  if (!v13)
    goto LABEL_28;
  v15 = 2;
  if (v10)
    v15 = 1;
  v16 = (id)objc_msgSend((id)v13[v15], "mutableCopy");
  v17 = v16;
  if (!v16)
  {
LABEL_28:
    v27 = _NSMethodExceptionProem((objc_class *)self, a2);
    v28 = sel_getName(sel);
    v29 = CFSTR("selector");
    if (v10)
      v29 = CFSTR("reply block of selector");
    v30 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: No arguments were detected for %@ %s"), v27, v29, v28);
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], v30, 0));
  }
  if (objc_msgSend(v16, "count") <= arg)
  {
    v35 = _NSMethodExceptionProem((objc_class *)self, a2);
    v36 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: Argument index %ld is out of range for selector (%s). The maximum index is %ld."), v35, arg, sel_getName(sel), objc_msgSend(v17, "count") - 1), 0);
    objc_exception_throw(v36);
  }
  if (v10)
  {
    v18 = (id)*v14;
    if (!*v14)
    {
      v41 = _NSMethodExceptionProem((objc_class *)self, a2);
      v42 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: No reply block signature has been set for selector %s"), v41, sel_getName(sel)), 0);
      objc_exception_throw(v42);
    }
    if ((unint64_t)objc_msgSend((id)*v14, "numberOfArguments") < 2
      || arg + 1 >= objc_msgSend(v18, "numberOfArguments"))
    {
      v37 = _NSMethodExceptionProem((objc_class *)self, a2);
      v38 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: Argument '%ld' of selector '%s' does not exist."), v37, arg, sel_getName(sel)), 0);
      objc_exception_throw(v38);
    }
    v19 = (_WORD *)objc_msgSend(v18, "_argInfo:");
    v20 = v19[17];
    if ((v20 & 0x80) != 0)
      v20 = *(_WORD *)(*(_QWORD *)v19 + 34);
    if ((v20 & 0x2000) == 0)
    {
      v21 = _NSMethodExceptionProem((objc_class *)self, a2);
      v22 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: Argument '%ld' of selector '%s' is not an object."), v21, arg, sel_getName(sel)), 0);
      objc_exception_throw(v22);
    }
  }
  else
  {
    v23 = (void *)methodSignatureForSelectorInProtocol(sel, self->_protocol);
    v24 = v23;
    if (!v23)
    {
      v43 = _NSMethodExceptionProem((objc_class *)self, a2);
      v44 = sel_getName(sel);
      v45 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: Selector '%s' not found in protocol '%s'."), v43, v44, protocol_getName(self->_protocol)), 0);
      objc_exception_throw(v45);
    }
    if ((unint64_t)objc_msgSend(v23, "numberOfArguments") < 3
      || arg + 2 >= objc_msgSend(v24, "numberOfArguments"))
    {
      v39 = _NSMethodExceptionProem((objc_class *)self, a2);
      v40 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: Argument '%ld' of selector '%s' does not exist."), v39, arg, sel_getName(sel)), 0);
      objc_exception_throw(v40);
    }
    v25 = (_WORD *)objc_msgSend(v24, "_argInfo:");
    v26 = v25[17];
    if ((v26 & 0x80) != 0)
      v26 = *(_WORD *)(*(_QWORD *)v25 + 34);
    if ((v26 & 0x2000) == 0)
    {
      v46 = _NSMethodExceptionProem((objc_class *)self, a2);
      v47 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: Argument '%ld' of selector '%s' is not an object."), v46, arg, sel_getName(sel)), 0);
      objc_exception_throw(v47);
    }
  }
  objc_msgSend(v17, "replaceObjectAtIndex:withObject:", arg, ifc);
  if (v10)
  {

    v14[1] = objc_msgSend(v17, "copy");
    *((_BYTE *)v14 + 45) = 1;
  }
  else
  {

    v14[2] = objc_msgSend(v17, "copy");
    *((_BYTE *)v14 + 44) = 1;
  }
  os_unfair_lock_unlock(&self->_knownSelectorsLock);
}

- (id)_methodSignatureForRemoteSelector:(SEL)a3
{
  __CFDictionary *knownSelectors;
  void *Value;
  void *v8;

  if (!self->_protocol)
  {
    v8 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: No protocol has been set on interface"), _NSMethodExceptionProem((objc_class *)self, a2)), 0);
    objc_exception_throw(v8);
  }
  if (!a3)
    return 0;
  os_unfair_lock_lock(&self->_knownSelectorsLock);
  knownSelectors = self->_knownSelectors;
  if (!knownSelectors)
  {
    knownSelectors = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE30], 0, &kNSXPCSelKeyCallbacks, MEMORY[0x1E0C9B3A0]);
    self->_knownSelectors = knownSelectors;
  }
  Value = (void *)CFDictionaryGetValue(knownSelectors, a3);
  os_unfair_lock_unlock(&self->_knownSelectorsLock);
  if (!Value)
    return -[NSXPCInterface _generateAndCacheMethodSignatureForRemoteSelector:](self, "_generateAndCacheMethodSignatureForRemoteSelector:", a3);
  return Value;
}

- (id)_generateAndCacheMethodSignatureForRemoteSelector:(SEL)a3
{
  uint64_t v5;
  const void *v6;
  __CFDictionary *knownSelectors;
  void *Value;
  __CFDictionary *Mutable;

  v5 = methodSignatureForSelectorInProtocol(a3, self->_protocol);
  if (!v5)
    return 0;
  v6 = (const void *)v5;
  os_unfair_lock_lock(&self->_knownSelectorsLock);
  knownSelectors = self->_knownSelectors;
  if (!knownSelectors)
  {
    knownSelectors = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE30], 0, &kNSXPCSelKeyCallbacks, MEMORY[0x1E0C9B3A0]);
    self->_knownSelectors = knownSelectors;
  }
  Value = (void *)CFDictionaryGetValue(knownSelectors, a3);
  if (!Value)
  {
    Mutable = self->_knownSelectors;
    if (!Mutable)
    {
      Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE30], 0, &kNSXPCSelKeyCallbacks, MEMORY[0x1E0C9B3A0]);
      self->_knownSelectors = Mutable;
    }
    CFDictionarySetValue(Mutable, a3, v6);
    Value = (void *)v6;
  }
  os_unfair_lock_unlock(&self->_knownSelectorsLock);
  return Value;
}

- (Class)_customSubclass
{
  os_unfair_lock_s *p_knownSelectorsLock;
  objc_class *xpcDOSubclass;

  p_knownSelectorsLock = &self->_knownSelectorsLock;
  os_unfair_lock_lock(&self->_knownSelectorsLock);
  xpcDOSubclass = self->_xpcDOSubclass;
  os_unfair_lock_unlock(p_knownSelectorsLock);
  if (xpcDOSubclass)
    return xpcDOSubclass;
  else
    return (Class)objc_opt_class();
}

- (id)replyBlockSignatureForSelector:(SEL)a3
{
  Protocol *protocol;
  id *v7;
  id *v8;
  void *v9;
  NSString *v10;
  void *v11;
  const __CFString *v13;
  NSString *v14;
  NSString *v15;
  NSString *v16;
  const char *Name;
  const char *v18;

  protocol = self->_protocol;
  if (!protocol)
  {
    v16 = _NSMethodExceptionProem((objc_class *)self, a2);
    v13 = CFSTR("%@: Protocol must be set before calling this method.");
    goto LABEL_12;
  }
  if (!a3)
  {
    v16 = _NSMethodExceptionProem((objc_class *)self, a2);
    v13 = CFSTR("%@: Selector argument must be non-NULL.");
    goto LABEL_12;
  }
  if (!selectorInProtocol(a3, protocol))
  {
    v14 = _NSMethodExceptionProem((objc_class *)self, a2);
    Name = sel_getName(a3);
    v18 = protocol_getName(protocol);
    v16 = v14;
    v13 = CFSTR("%@: Selector '%s' is not in protocol '%s', or is not an instance method.");
LABEL_12:
    v15 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v13, v16, Name, v18);
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], v15, 0));
  }
  os_unfair_lock_lock(&self->_knownSelectorsLock);
  v7 = (id *)-[NSXPCInterface _locked_methodInfoForSelector:createIfNecessary:]((uint64_t)self, (void *)a3, 1);
  v8 = v7;
  if (v7)
  {
    v9 = (void *)objc_msgSend(*v7, "_typeString");
    if (((_DWORD)v8[5] & 0x80000000) != 0)
    {
      v10 = _NSMethodExceptionProem((objc_class *)self, a2);
      v11 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: Selector %s has no reply block."), v10, sel_getName(a3)), 0);
      objc_exception_throw(v11);
    }
  }
  else
  {
    v9 = 0;
  }
  os_unfair_lock_unlock(&self->_knownSelectorsLock);
  return v9;
}

- (unint64_t)_respondsToRemoteSelector:(SEL)a3
{
  os_unfair_lock_s *p_knownSelectorsLock;
  _QWORD *v6;
  unint64_t v7;

  p_knownSelectorsLock = &self->_knownSelectorsLock;
  os_unfair_lock_lock(&self->_knownSelectorsLock);
  v6 = -[NSXPCInterface _locked_methodInfoForSelector:createIfNecessary:]((uint64_t)self, (void *)a3, 1);
  if (v6)
  {
    v7 = v6[3];
    os_unfair_lock_unlock(p_knownSelectorsLock);
    if (v7)
      return 2 * (-[NSXPCInterface _remoteVersion](self, "_remoteVersion") < v7);
  }
  else
  {
    os_unfair_lock_unlock(p_knownSelectorsLock);
  }
  return 1;
}

- (unint64_t)_remoteVersion
{
  return self->_remoteVersion;
}

- (Class)classForSelector:(SEL)a3 argumentIndex:(unint64_t)a4 ofReply:(BOOL)a5
{
  return (Class)-[NSSet anyObject](-[NSXPCInterface classesForSelector:argumentIndex:ofReply:](self, "classesForSelector:argumentIndex:ofReply:", a3, a4, a5), "anyObject");
}

- (NSSet)classesForSelector:(SEL)sel argumentIndex:(NSUInteger)arg ofReply:(BOOL)ofReply
{
  Protocol *protocol;
  _BOOL4 v9;
  _QWORD *v11;
  uint64_t v12;
  void *v13;
  NSSet *v14;
  objc_class *Class;
  NSString *v17;
  const char *v18;
  const __CFString *v19;
  NSString *v20;
  const __CFString *v21;
  NSString *v22;
  NSString *v23;
  NSString *v24;
  void *v25;
  NSString *v26;
  const char *Name;
  const char *v28;

  protocol = self->_protocol;
  if (!protocol)
  {
    v26 = _NSMethodExceptionProem((objc_class *)self, a2);
    v21 = CFSTR("%@: Protocol must be set before calling this method.");
    goto LABEL_21;
  }
  if (!sel)
  {
    v26 = _NSMethodExceptionProem((objc_class *)self, a2);
    v21 = CFSTR("%@: Selector argument must be non-NULL.");
    goto LABEL_21;
  }
  v9 = ofReply;
  if (!selectorInProtocol(sel, protocol))
  {
    v22 = _NSMethodExceptionProem((objc_class *)self, a2);
    Name = sel_getName(sel);
    v28 = protocol_getName(protocol);
    v26 = v22;
    v21 = CFSTR("%@: Selector '%s' is not in protocol '%s', or is not an instance method.");
LABEL_21:
    v23 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v21, v26, Name, v28);
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], v23, 0));
  }
  os_unfair_lock_lock(&self->_knownSelectorsLock);
  v11 = -[NSXPCInterface _locked_methodInfoForSelector:createIfNecessary:]((uint64_t)self, (void *)sel, 1);
  if (!v11)
    goto LABEL_15;
  v12 = 2;
  if (v9)
    v12 = 1;
  v13 = (void *)v11[v12];
  if (!v13)
  {
LABEL_15:
    v17 = _NSMethodExceptionProem((objc_class *)self, a2);
    v18 = sel_getName(sel);
    v19 = CFSTR("selector");
    if (v9)
      v19 = CFSTR("reply block of selector");
    v20 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: No arguments were detected for %@ %s"), v17, v19, v18);
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], v20, 0));
  }
  if (objc_msgSend((id)v11[v12], "count") <= arg)
  {
    v24 = _NSMethodExceptionProem((objc_class *)self, a2);
    v25 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: Argument index  '%ld' is out of range for selector %s. The maximum index is %ld."), v24, arg, sel_getName(sel), objc_msgSend(v13, "count") - 1), 0);
    objc_exception_throw(v25);
  }
  v14 = (NSSet *)(id)objc_msgSend(v13, "objectAtIndex:", arg);
  os_unfair_lock_unlock(&self->_knownSelectorsLock);
  if (!v14 || (objc_opt_isKindOfClass() & 1) != 0)
    return (NSSet *)objc_msgSend(MEMORY[0x1E0C99E60], "set");
  Class = object_getClass(v14);
  if (class_isMetaClass(Class))
    return (NSSet *)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v14);
  else
    return v14;
}

- (void)setXPCType:(xpc_type_t)type forSelector:(SEL)sel argumentIndex:(NSUInteger)arg ofReply:(BOOL)ofReply
{
  Protocol *protocol;
  _BOOL4 v10;
  _QWORD *v13;
  _QWORD *v14;
  uint64_t v15;
  id v16;
  void *v17;
  uint64_t v18;
  void *v19;
  NSString *v20;
  const char *v21;
  const __CFString *v22;
  NSString *v23;
  const __CFString *v24;
  NSString *v25;
  NSString *v26;
  NSString *v27;
  void *v28;
  NSString *v29;
  const char *Name;
  const char *v31;

  protocol = self->_protocol;
  if (!protocol)
  {
    v29 = _NSMethodExceptionProem((objc_class *)self, a2);
    v24 = CFSTR("%@: Protocol must be set before calling this method.");
    goto LABEL_21;
  }
  if (!sel)
  {
    v29 = _NSMethodExceptionProem((objc_class *)self, a2);
    v24 = CFSTR("%@: Selector argument must be non-NULL.");
    goto LABEL_21;
  }
  v10 = ofReply;
  if (!selectorInProtocol(sel, protocol))
  {
    v25 = _NSMethodExceptionProem((objc_class *)self, a2);
    Name = sel_getName(sel);
    v31 = protocol_getName(protocol);
    v29 = v25;
    v24 = CFSTR("%@: Selector '%s' is not in protocol '%s', or is not an instance method.");
LABEL_21:
    v26 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v24, v29, Name, v31);
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], v26, 0));
  }
  os_unfair_lock_lock(&self->_knownSelectorsLock);
  v13 = -[NSXPCInterface _locked_methodInfoForSelector:createIfNecessary:]((uint64_t)self, (void *)sel, 1);
  v14 = v13;
  if (!v13)
    goto LABEL_15;
  v15 = 2;
  if (v10)
    v15 = 1;
  v16 = (id)objc_msgSend((id)v13[v15], "mutableCopy");
  v17 = v16;
  if (!v16)
  {
LABEL_15:
    v20 = _NSMethodExceptionProem((objc_class *)self, a2);
    v21 = sel_getName(sel);
    v22 = CFSTR("selector");
    if (v10)
      v22 = CFSTR("reply block of selector");
    v23 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: No arguments were detected for %@ %s"), v20, v22, v21);
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], v23, 0));
  }
  if (objc_msgSend(v16, "count") <= arg)
  {
    v27 = _NSMethodExceptionProem((objc_class *)self, a2);
    v28 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: Argument index  '%ld' is out of range for selector %s. The maximum index is %ld."), v27, arg, sel_getName(sel), objc_msgSend(v17, "count") - 1), 0);
    objc_exception_throw(v28);
  }
  v18 = objc_opt_new();
  v19 = (void *)v18;
  if (v18)
    *(_QWORD *)(v18 + 8) = type;
  objc_msgSend(v17, "replaceObjectAtIndex:withObject:", arg, v18);

  if (v10)
  {

    v14[1] = objc_msgSend(v17, "copy");
  }
  else
  {

    v14[2] = objc_msgSend(v17, "copy");
  }
  os_unfair_lock_unlock(&self->_knownSelectorsLock);
}

- (NSXPCInterface)interfaceForSelector:(SEL)sel argumentIndex:(NSUInteger)arg ofReply:(BOOL)ofReply
{
  Protocol *protocol;
  _BOOL4 v9;
  _QWORD *v11;
  uint64_t v12;
  void *v13;
  NSXPCInterface *v14;
  const __CFString *v16;
  NSString *v17;
  NSString *v18;
  NSString *v19;
  const char *v20;
  const __CFString *v21;
  NSString *v22;
  NSString *v23;
  void *v24;
  NSString *v25;
  const char *Name;
  const char *v27;

  protocol = self->_protocol;
  if (!protocol)
  {
    v25 = _NSMethodExceptionProem((objc_class *)self, a2);
    v16 = CFSTR("%@: Protocol must be set before calling this method.");
    goto LABEL_16;
  }
  if (!sel)
  {
    v25 = _NSMethodExceptionProem((objc_class *)self, a2);
    v16 = CFSTR("%@: Selector argument must be non-NULL.");
    goto LABEL_16;
  }
  v9 = ofReply;
  if (!selectorInProtocol(sel, protocol))
  {
    v17 = _NSMethodExceptionProem((objc_class *)self, a2);
    Name = sel_getName(sel);
    v27 = protocol_getName(protocol);
    v25 = v17;
    v16 = CFSTR("%@: Selector '%s' is not in protocol '%s', or is not an instance method.");
LABEL_16:
    v18 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v16, v25, Name, v27);
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], v18, 0));
  }
  os_unfair_lock_lock(&self->_knownSelectorsLock);
  v11 = -[NSXPCInterface _locked_methodInfoForSelector:createIfNecessary:]((uint64_t)self, (void *)sel, 0);
  if (v11)
  {
    v12 = 2;
    if (v9)
      v12 = 1;
    v13 = (void *)v11[v12];
    if (!v13)
    {
      v19 = _NSMethodExceptionProem((objc_class *)self, a2);
      v20 = sel_getName(sel);
      v21 = CFSTR("selector");
      if (v9)
        v21 = CFSTR("reply block of selector");
      v22 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: No arguments were detected for %@ %s"), v19, v21, v20);
      objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], v22, 0));
    }
    if (objc_msgSend((id)v11[v12], "count") <= arg)
    {
      v23 = _NSMethodExceptionProem((objc_class *)self, a2);
      v24 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: Argument index %ld is out of range for selector (%s)"), v23, arg, sel_getName(sel)), 0);
      objc_exception_throw(v24);
    }
    v14 = (NSXPCInterface *)(id)objc_msgSend(v13, "objectAtIndex:", arg);
    os_unfair_lock_unlock(&self->_knownSelectorsLock);
    if ((objc_opt_isKindOfClass() & 1) != 0)
      return v14;
    else
      return 0;
  }
  else
  {
    os_unfair_lock_unlock(&self->_knownSelectorsLock);
    return 0;
  }
}

- (id)debugDescription
{
  Protocol *protocol;
  const char *Name;
  id v5;
  const char *v6;
  NSMutableString *v7;
  __CFDictionary *methodInfo;
  objc_super v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  protocol = self->_protocol;
  if (protocol)
    Name = protocol_getName(protocol);
  else
    Name = 0;
  v10.receiver = self;
  v10.super_class = (Class)NSXPCInterface;
  v5 = -[NSXPCInterface debugDescription](&v10, sel_debugDescription);
  v6 = "(none set)";
  if (Name)
    v6 = Name;
  v7 = +[NSString stringWithFormat:](NSMutableString, "stringWithFormat:", CFSTR("%@\nProtocol: %s\n"), v5, v6);
  os_unfair_lock_lock(&self->_knownSelectorsLock);
  methodInfo = self->_methodInfo;
  if (methodInfo)
    CFDictionaryApplyFunction(methodInfo, (CFDictionaryApplierFunction)_NSXPCInterfaceDebugDescriptionHelper, v7);
  os_unfair_lock_unlock(&self->_knownSelectorsLock);
  return v7;
}

+ (id)signatureForBlock:(id)a3
{
  if ((objc_opt_isKindOfClass() & 1) != 0)
    return +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", _Block_signature(a3));
  else
    return 0;
}

- (xpc_type_t)XPCTypeForSelector:(SEL)sel argumentIndex:(NSUInteger)arg ofReply:(BOOL)ofReply
{
  Protocol *protocol;
  _BOOL4 v9;
  _QWORD *v11;
  uint64_t v12;
  void *v13;
  id v14;
  char isKindOfClass;
  xpc_type_t result;
  const __CFString *v17;
  NSString *v18;
  NSString *v19;
  NSString *v20;
  const char *v21;
  const __CFString *v22;
  NSString *v23;
  NSString *v24;
  void *v25;
  NSString *v26;
  const char *Name;
  const char *v28;

  protocol = self->_protocol;
  if (!protocol)
  {
    v26 = _NSMethodExceptionProem((objc_class *)self, a2);
    v17 = CFSTR("%@: Protocol must be set before calling this method.");
    goto LABEL_17;
  }
  if (!sel)
  {
    v26 = _NSMethodExceptionProem((objc_class *)self, a2);
    v17 = CFSTR("%@: Selector argument must be non-NULL.");
    goto LABEL_17;
  }
  v9 = ofReply;
  if (!selectorInProtocol(sel, protocol))
  {
    v18 = _NSMethodExceptionProem((objc_class *)self, a2);
    Name = sel_getName(sel);
    v28 = protocol_getName(protocol);
    v26 = v18;
    v17 = CFSTR("%@: Selector '%s' is not in protocol '%s', or is not an instance method.");
LABEL_17:
    v19 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v17, v26, Name, v28);
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], v19, 0));
  }
  os_unfair_lock_lock(&self->_knownSelectorsLock);
  v11 = -[NSXPCInterface _locked_methodInfoForSelector:createIfNecessary:]((uint64_t)self, (void *)sel, 0);
  if (v11)
  {
    v12 = 2;
    if (v9)
      v12 = 1;
    v13 = (void *)v11[v12];
    if (!v13)
    {
      v20 = _NSMethodExceptionProem((objc_class *)self, a2);
      v21 = sel_getName(sel);
      v22 = CFSTR("selector");
      if (v9)
        v22 = CFSTR("reply block of selector");
      v23 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: No arguments were detected for %@ %s"), v20, v22, v21);
      objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], v23, 0));
    }
    if (objc_msgSend((id)v11[v12], "count") <= arg)
    {
      v24 = _NSMethodExceptionProem((objc_class *)self, a2);
      v25 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: Argument index  '%ld' is out of range for selector %s. The maximum index is %ld."), v24, arg, sel_getName(sel), objc_msgSend(v13, "count") - 1), 0);
      objc_exception_throw(v25);
    }
    v14 = (id)objc_msgSend(v13, "objectAtIndex:", arg);
    os_unfair_lock_unlock(&self->_knownSelectorsLock);
    isKindOfClass = objc_opt_isKindOfClass();
    result = 0;
    if ((isKindOfClass & 1) != 0)
    {
      if (v14)
        return (xpc_type_t)*((_QWORD *)v14 + 1);
    }
  }
  else
  {
    os_unfair_lock_unlock(&self->_knownSelectorsLock);
    return 0;
  }
  return result;
}

- (void)setVersion:(unint64_t)a3 forSelector:(SEL)a4
{
  Protocol *protocol;
  _QWORD *v9;
  NSString *v10;
  NSString *v11;
  const char *Name;
  uint64_t v13;
  uint64_t v14;

  protocol = self->_protocol;
  if (!protocol)
  {
    v10 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: Protocol must be set before calling this method."), _NSMethodExceptionProem((objc_class *)self, a2), v13, v14);
    goto LABEL_10;
  }
  if (!a4)
  {
    v10 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: Selector argument must be non-NULL."), _NSMethodExceptionProem((objc_class *)self, a2), v13, v14);
    goto LABEL_10;
  }
  if (!selectorInProtocol(a4, protocol))
  {
    v11 = _NSMethodExceptionProem((objc_class *)self, a2);
    Name = sel_getName(a4);
    v10 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: Selector '%s' is not in protocol '%s', or is not an instance method."), v11, Name, protocol_getName(protocol));
LABEL_10:
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], v10, 0));
  }
  os_unfair_lock_lock(&self->_knownSelectorsLock);
  v9 = -[NSXPCInterface _locked_methodInfoForSelector:createIfNecessary:]((uint64_t)self, (void *)a4, 1);
  if (v9)
    v9[3] = a3;
  os_unfair_lock_unlock(&self->_knownSelectorsLock);
}

- (unint64_t)versionForSelector:(SEL)a3
{
  Protocol *protocol;
  _QWORD *v7;
  unint64_t v8;
  const __CFString *v10;
  NSString *v11;
  NSString *v12;
  NSString *v13;
  const char *Name;
  const char *v15;

  protocol = self->_protocol;
  if (!protocol)
  {
    v13 = _NSMethodExceptionProem((objc_class *)self, a2);
    v10 = CFSTR("%@: Protocol must be set before calling this method.");
    goto LABEL_11;
  }
  if (!a3)
  {
    v13 = _NSMethodExceptionProem((objc_class *)self, a2);
    v10 = CFSTR("%@: Selector argument must be non-NULL.");
    goto LABEL_11;
  }
  if (!selectorInProtocol(a3, protocol))
  {
    v11 = _NSMethodExceptionProem((objc_class *)self, a2);
    Name = sel_getName(a3);
    v15 = protocol_getName(protocol);
    v13 = v11;
    v10 = CFSTR("%@: Selector '%s' is not in protocol '%s', or is not an instance method.");
LABEL_11:
    v12 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v10, v13, Name, v15);
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], v12, 0));
  }
  os_unfair_lock_lock(&self->_knownSelectorsLock);
  v7 = -[NSXPCInterface _locked_methodInfoForSelector:createIfNecessary:]((uint64_t)self, (void *)a3, 0);
  if (v7)
    v8 = v7[3];
  else
    v8 = 1;
  os_unfair_lock_unlock(&self->_knownSelectorsLock);
  return v8;
}

- (unint64_t)version
{
  os_unfair_lock_s *p_knownSelectorsLock;
  __CFDictionary *methodInfo;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  v6[0] = 1;
  p_knownSelectorsLock = &self->_knownSelectorsLock;
  os_unfair_lock_lock(&self->_knownSelectorsLock);
  methodInfo = self->_methodInfo;
  if (methodInfo)
    CFDictionaryApplyFunction(methodInfo, (CFDictionaryApplierFunction)_maxVersionFinder, v6);
  os_unfair_lock_unlock(p_knownSelectorsLock);
  return v6[0];
}

- (void)set_remoteVersion:(unint64_t)a3
{
  self->_remoteVersion = a3;
}

- (BOOL)_hasProxiesInArgumentsOfSelector:(SEL)a3
{
  os_unfair_lock_s *p_knownSelectorsLock;
  _QWORD *v6;
  BOOL v7;
  void *v9;

  if (!self->_protocol)
  {
    v9 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: No protocol has been set on interface"), _NSMethodExceptionProem((objc_class *)self, a2)), 0);
    objc_exception_throw(v9);
  }
  p_knownSelectorsLock = &self->_knownSelectorsLock;
  os_unfair_lock_lock(&self->_knownSelectorsLock);
  v6 = -[NSXPCInterface _locked_methodInfoForSelector:createIfNecessary:]((uint64_t)self, (void *)a3, 1);
  if (v6)
    v7 = *((_BYTE *)v6 + 44) != 0;
  else
    v7 = 0;
  os_unfair_lock_unlock(p_knownSelectorsLock);
  return v7;
}

@end
