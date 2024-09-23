@implementation NSObject

- (id)newTaggedNSStringWithASCIIBytes_:(const char *)a3 length_:(int64_t)a4
{
  return (id)_CFStringCreateTaggedPointerString();
}

- (id)valueForKey:(NSString *)key
{
  const void *(__cdecl *Class)(CFAllocatorRef, const void *);
  __int128 v6;
  id Value;
  void *v9;
  CFSetCallBacks callBacks;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if (!key)
  {
    v9 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: attempt to retrieve a value for a nil key"), _NSMethodExceptionProem((objc_class *)self, a2)), 0);
    objc_exception_throw(v9);
  }
  Class = (const void *(__cdecl *)(CFAllocatorRef, const void *))object_getClass(self);
  os_unfair_lock_lock((os_unfair_lock_t)&NSKeyValueCachedAccessorLock);
  if (!_MergedGlobals_98)
  {
    v6 = *(_OWORD *)(MEMORY[0x1E0C9B3B0] + 16);
    *(_OWORD *)&callBacks.version = *MEMORY[0x1E0C9B3B0];
    *(_OWORD *)&callBacks.release = v6;
    callBacks.equal = (CFSetEqualCallBack)NSKeyValueAccessorIsEqual;
    callBacks.hash = (CFSetHashCallBack)NSKeyValueAccessorHash;
    _MergedGlobals_98 = (uint64_t)CFSetCreateMutable(0, 0, &callBacks);
  }
  callBacks.version = 0;
  callBacks.copyDescription = 0;
  callBacks.retain = Class;
  callBacks.release = (CFSetReleaseCallBack)key;
  callBacks.copyDescription = (CFSetCopyDescriptionCallBack)(CFHash(key) ^ (unint64_t)Class);
  Value = (id)CFSetGetValue((CFSetRef)_MergedGlobals_98, &callBacks);
  if (!Value)
  {
    Value = objc_msgSend(Class, sel__createValueGetterWithContainerClassID_key_, Class, key);
    CFSetAddValue((CFMutableSetRef)_MergedGlobals_98, Value);

  }
  os_unfair_lock_unlock((os_unfair_lock_t)&NSKeyValueCachedAccessorLock);
  return (id)_NSGetUsingKeyValueGetter((uint64_t)self, (uint64_t)Value);
}

- (BOOL)_allowsDirectEncoding
{
  return 0;
}

- (id)replacementObjectForKeyedArchiver:(NSKeyedArchiver *)archiver
{
  if ((dyld_program_sdk_at_least() & 1) != 0 || dyld_program_sdk_at_least())
    return -[NSObject replacementObjectForCoder:](self, "replacementObjectForCoder:", archiver);
  else
    return -[NSObject replacementObjectForArchiver:](self, "replacementObjectForArchiver:", 0);
}

+ (NSArray)classFallbacksForKeyedArchiver
{
  return (NSArray *)MEMORY[0x1E0C9AA60];
}

- (id)_implicitObservationInfo
{
  unint64_t Value;

  Value = (unint64_t)self;
  if (self)
  {
    os_unfair_lock_lock(&NSKeyValueObservationInfoLock);
    if (NSKeyValueSharedObservationInfoPerObject)
      Value = (unint64_t)CFDictionaryGetValue((CFDictionaryRef)NSKeyValueSharedObservationInfoPerObject, (const void *)~Value);
    else
      Value = 0;
    os_unfair_lock_unlock(&NSKeyValueObservationInfoLock);
  }
  return (id)Value;
}

- (void)observationInfo
{
  if (NSKeyValueObservationInfoPerObject)
    return (void *)CFDictionaryGetValue((CFDictionaryRef)NSKeyValueObservationInfoPerObject, (const void *)~(unint64_t)self);
  else
    return 0;
}

- (id)_pendingChangeNotificationsArrayForKey:(id)a3 create:(BOOL)a4
{
  return NSKVOPendingPerThreadNotificationStack(a4);
}

- (void)didChangeValueForKey:(NSString *)key
{
  NSKeyValueDidChangeWithPerThreadPendingNotifications(self, (uint64_t)key, 0, (void (*)(__int128 *__return_ptr, uint64_t, uint64_t, uint64_t, BOOL, uint64_t, _OWORD *))NSKeyValueDidChangeBySetting, 0);
}

+ (id)_createMutableOrderedSetValueGetterWithContainerClassID:(id)a3 key:(id)a4
{
  const void *(__cdecl *v7)(CFAllocatorRef, const void *);
  const __CFSet *v8;
  __int128 v9;
  CFHashCode v10;
  uint64_t v11;
  unint64_t v12;
  double v13;
  uint64_t *v14;
  unint64_t v15;
  const __CFSet *v16;
  __int128 v17;
  CFHashCode v18;
  id Value;
  void *v20;
  id v21;
  Method v22;
  Method v23;
  Method v24;
  Method v25;
  objc_method *v26;
  NSKeyValueMutatingOrderedSetMethodSet *v27;
  NSKeyValueFastMutableCollection1Getter *v28;
  uint64_t v29;
  uint64_t v30;
  const __CFSet *v31;
  __int128 v32;
  id v33;
  CFHashCode v34;
  id v35;
  NSKeyValueIvarMutableCollectionGetter *v36;
  NSKeyValueFastMutableCollection2Getter *v38;
  uint64_t v39;
  id v40;
  CFSetCallBacks callBacks;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  if (_NSKVONotifyingMutatorsShouldNotifyForIsaAndKey((objc_class *)a1, a4))
  {
    v7 = (const void *(__cdecl *)(CFAllocatorRef, const void *))_NSKVONotifyingOriginalClassForIsa((objc_class *)a1);
    v8 = (const __CFSet *)NSKeyValueCachedMutableOrderedSetGetters;
    if (!NSKeyValueCachedMutableOrderedSetGetters)
    {
      v9 = *(_OWORD *)(MEMORY[0x1E0C9B3B0] + 16);
      *(_OWORD *)&callBacks.version = *MEMORY[0x1E0C9B3B0];
      *(_OWORD *)&callBacks.release = v9;
      callBacks.equal = (CFSetEqualCallBack)NSKeyValueAccessorIsEqual;
      callBacks.hash = (CFSetHashCallBack)NSKeyValueAccessorHash;
      v8 = CFSetCreateMutable(0, 0, &callBacks);
      NSKeyValueCachedMutableOrderedSetGetters = (uint64_t)v8;
    }
    callBacks.version = 0;
    callBacks.retain = v7;
    callBacks.release = (CFSetReleaseCallBack)a4;
    if (a4)
    {
      v10 = CFHash(a4);
      v8 = (const __CFSet *)NSKeyValueCachedMutableOrderedSetGetters;
    }
    else
    {
      v10 = 0;
    }
    callBacks.copyDescription = (CFSetCopyDescriptionCallBack)(v10 ^ (unint64_t)v7);
    Value = (id)CFSetGetValue(v8, &callBacks);
    if (!Value)
    {
      Value = objc_msgSend(v7, sel__createMutableOrderedValueGetterWithContainerClassID_key_, v7, a4);
      CFSetAddValue((CFMutableSetRef)NSKeyValueCachedMutableOrderedSetGetters, Value);

    }
    return -[NSKeyValueNotifyingMutableCollectionGetter initWithContainerClassID:key:mutableCollectionGetter:proxyClass:]([NSKeyValueNotifyingMutableCollectionGetter alloc], "initWithContainerClassID:key:mutableCollectionGetter:proxyClass:", a3, a4, Value, objc_opt_self());
  }
  v11 = objc_msgSend(a4, "lengthOfBytesUsingEncoding:", 4);
  v12 = v11 + 1;
  if (v11 == -1)
  {
    *(_QWORD *)&v13 = MEMORY[0x1E0C80A78](-1).n128_u64[0];
    v14 = &v39;
    LOBYTE(v39) = 0;
  }
  else
  {
    v14 = (uint64_t *)malloc_type_malloc(v11 + 1, 0x100004077774924uLL);
  }
  objc_msgSend(a4, "getCString:maxLength:encoding:", v14, v12, 4, v13);
  if (v12 <= 1)
    v15 = 1;
  else
    v15 = v12;
  if (v15 >= 2 && v14 && memchr(v14, 0, v15 - 1))
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("Attempted to use a key or key path whose UTF-8 representation contains a NUL character"), 0));
  if (objc_msgSend(a4, "length"))
    *(_BYTE *)v14 = __toupper(*(char *)v14);
  v16 = (const __CFSet *)_MergedGlobals_98;
  if (!_MergedGlobals_98)
  {
    v17 = *(_OWORD *)(MEMORY[0x1E0C9B3B0] + 16);
    *(_OWORD *)&callBacks.version = *MEMORY[0x1E0C9B3B0];
    *(_OWORD *)&callBacks.release = v17;
    callBacks.equal = (CFSetEqualCallBack)NSKeyValueAccessorIsEqual;
    callBacks.hash = (CFSetHashCallBack)NSKeyValueAccessorHash;
    v16 = CFSetCreateMutable(0, 0, &callBacks);
    _MergedGlobals_98 = (uint64_t)v16;
  }
  callBacks.version = 0;
  callBacks.retain = (CFSetRetainCallBack)a1;
  callBacks.release = (CFSetReleaseCallBack)a4;
  if (a4)
  {
    v18 = CFHash(a4);
    v16 = (const __CFSet *)_MergedGlobals_98;
  }
  else
  {
    v18 = 0;
  }
  callBacks.copyDescription = (CFSetCopyDescriptionCallBack)(v18 ^ (unint64_t)a1);
  v21 = (id)CFSetGetValue(v16, &callBacks);
  if (!v21)
  {
    v21 = objc_msgSend(a1, sel__createValueGetterWithContainerClassID_key_, a1, a4);
    CFSetAddValue((CFMutableSetRef)_MergedGlobals_98, v21);

  }
  v22 = NSKeyValueMethodForPattern(a1, "insertObject:in%sAtIndex:", (const char *)v14);
  v23 = NSKeyValueMethodForPattern(a1, "insert%s:atIndexes:", (const char *)v14);
  v24 = NSKeyValueMethodForPattern(a1, "removeObjectFrom%sAtIndex:", (const char *)v14);
  v25 = NSKeyValueMethodForPattern(a1, "remove%sAtIndexes:", (const char *)v14);
  if ((unint64_t)v22 | (unint64_t)v23)
  {
    v26 = v25;
    if ((unint64_t)v24 | (unint64_t)v25)
    {
      v40 = a3;
      v27 = objc_alloc_init(NSKeyValueMutatingOrderedSetMethodSet);
      v27->insertObjectAtIndex = v22;
      v27->insertObjectsAtIndexes = v23;
      v27->removeObjectAtIndex = v24;
      v27->removeObjectsAtIndexes = v26;
      v27->replaceObjectAtIndex = NSKeyValueMethodForPattern(a1, "replaceObjectIn%sAtIndex:withObject:", (const char *)v14);
      v27->replaceObjectsAtIndexes = NSKeyValueMethodForPattern(a1, "replace%sAtIndexes:with%s:", (const char *)v14, (const char *)v14);
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v28 = [NSKeyValueFastMutableCollection1Getter alloc];
        v29 = objc_msgSend(v21, "methods");
        v30 = -[NSKeyValueFastMutableCollection1Getter initWithContainerClassID:key:nonmutatingMethods:mutatingMethods:proxyClass:](v28, "initWithContainerClassID:key:nonmutatingMethods:mutatingMethods:proxyClass:", v40, a4, v29, v27, objc_opt_self());
      }
      else
      {
        v38 = [NSKeyValueFastMutableCollection2Getter alloc];
        v30 = -[NSKeyValueFastMutableCollection2Getter initWithContainerClassID:key:baseGetter:mutatingMethods:proxyClass:](v38, "initWithContainerClassID:key:baseGetter:mutatingMethods:proxyClass:", v40, a4, v21, v27, objc_opt_self());
      }
      v20 = (void *)v30;

      if (!v12)
        return v20;
LABEL_43:
      free(v14);
      return v20;
    }
  }
  v31 = (const __CFSet *)NSKeyValueCachedSetters;
  if (!NSKeyValueCachedSetters)
  {
    v32 = *(_OWORD *)(MEMORY[0x1E0C9B3B0] + 16);
    *(_OWORD *)&callBacks.version = *MEMORY[0x1E0C9B3B0];
    *(_OWORD *)&callBacks.release = v32;
    callBacks.equal = (CFSetEqualCallBack)NSKeyValueAccessorIsEqual;
    callBacks.hash = (CFSetHashCallBack)NSKeyValueAccessorHash;
    v31 = CFSetCreateMutable(0, 0, &callBacks);
    NSKeyValueCachedSetters = (uint64_t)v31;
  }
  callBacks.version = 0;
  callBacks.retain = (CFSetRetainCallBack)a1;
  callBacks.release = (CFSetReleaseCallBack)a4;
  v33 = a3;
  if (a4)
  {
    v34 = CFHash(a4);
    v31 = (const __CFSet *)NSKeyValueCachedSetters;
  }
  else
  {
    v34 = 0;
  }
  callBacks.copyDescription = (CFSetCopyDescriptionCallBack)(v34 ^ (unint64_t)a1);
  v35 = (id)CFSetGetValue(v31, &callBacks);
  if (!v35)
  {
    v35 = objc_msgSend(a1, sel__createValueSetterWithContainerClassID_key_, a1, a4);
    CFSetAddValue((CFMutableSetRef)NSKeyValueCachedSetters, v35);

  }
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v36 = -[NSKeyValueIvarMutableCollectionGetter initWithContainerClassID:key:containerIsa:ivar:proxyClass:]([NSKeyValueIvarMutableCollectionGetter alloc], "initWithContainerClassID:key:containerIsa:ivar:proxyClass:", v33, a4, a1, objc_msgSend(v35, "ivar"), objc_opt_self());
  else
    v36 = -[NSKeyValueSlowMutableCollectionGetter initWithContainerClassID:key:baseGetter:baseSetter:containerIsa:proxyClass:]([NSKeyValueSlowMutableCollectionGetter alloc], "initWithContainerClassID:key:baseGetter:baseSetter:containerIsa:proxyClass:", v33, a4, v21, v35, a1, objc_opt_self());
  v20 = v36;
  if (v12)
    goto LABEL_43;
  return v20;
}

+ (id)_createMutableArrayValueGetterWithContainerClassID:(id)a3 key:(id)a4
{
  const void *(__cdecl *v7)(CFAllocatorRef, const void *);
  const __CFSet *v8;
  __int128 v9;
  CFHashCode v10;
  uint64_t v11;
  unint64_t v12;
  double v13;
  uint64_t *v14;
  unint64_t v15;
  const __CFSet *v16;
  __int128 v17;
  CFHashCode v18;
  id Value;
  void *v20;
  id v21;
  Method v22;
  Method v23;
  Method v24;
  Method v25;
  objc_method *v26;
  NSKeyValueMutatingArrayMethodSet *v27;
  NSKeyValueFastMutableCollection1Getter *v28;
  uint64_t v29;
  uint64_t v30;
  const __CFSet *v31;
  __int128 v32;
  id v33;
  CFHashCode v34;
  id v35;
  NSKeyValueIvarMutableCollectionGetter *v36;
  NSKeyValueFastMutableCollection2Getter *v38;
  uint64_t v39;
  id v40;
  CFSetCallBacks callBacks;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  if (_NSKVONotifyingMutatorsShouldNotifyForIsaAndKey((objc_class *)a1, a4))
  {
    v7 = (const void *(__cdecl *)(CFAllocatorRef, const void *))_NSKVONotifyingOriginalClassForIsa((objc_class *)a1);
    v8 = (const __CFSet *)NSKeyValueCachedMutableArrayGetters;
    if (!NSKeyValueCachedMutableArrayGetters)
    {
      v9 = *(_OWORD *)(MEMORY[0x1E0C9B3B0] + 16);
      *(_OWORD *)&callBacks.version = *MEMORY[0x1E0C9B3B0];
      *(_OWORD *)&callBacks.release = v9;
      callBacks.equal = (CFSetEqualCallBack)NSKeyValueAccessorIsEqual;
      callBacks.hash = (CFSetHashCallBack)NSKeyValueAccessorHash;
      v8 = CFSetCreateMutable(0, 0, &callBacks);
      NSKeyValueCachedMutableArrayGetters = (uint64_t)v8;
    }
    callBacks.version = 0;
    callBacks.retain = v7;
    callBacks.release = (CFSetReleaseCallBack)a4;
    if (a4)
    {
      v10 = CFHash(a4);
      v8 = (const __CFSet *)NSKeyValueCachedMutableArrayGetters;
    }
    else
    {
      v10 = 0;
    }
    callBacks.copyDescription = (CFSetCopyDescriptionCallBack)(v10 ^ (unint64_t)v7);
    Value = (id)CFSetGetValue(v8, &callBacks);
    if (!Value)
    {
      Value = objc_msgSend(v7, sel__createMutableArrayValueGetterWithContainerClassID_key_, v7, a4);
      CFSetAddValue((CFMutableSetRef)NSKeyValueCachedMutableArrayGetters, Value);

    }
    return -[NSKeyValueNotifyingMutableCollectionGetter initWithContainerClassID:key:mutableCollectionGetter:proxyClass:]([NSKeyValueNotifyingMutableCollectionGetter alloc], "initWithContainerClassID:key:mutableCollectionGetter:proxyClass:", a3, a4, Value, objc_opt_self());
  }
  v11 = objc_msgSend(a4, "lengthOfBytesUsingEncoding:", 4);
  v12 = v11 + 1;
  if (v11 == -1)
  {
    *(_QWORD *)&v13 = MEMORY[0x1E0C80A78](-1).n128_u64[0];
    v14 = &v39;
    LOBYTE(v39) = 0;
  }
  else
  {
    v14 = (uint64_t *)malloc_type_malloc(v11 + 1, 0x100004077774924uLL);
  }
  objc_msgSend(a4, "getCString:maxLength:encoding:", v14, v12, 4, v13);
  if (v12 <= 1)
    v15 = 1;
  else
    v15 = v12;
  if (v15 >= 2 && v14 && memchr(v14, 0, v15 - 1))
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("Attempted to use a key or key path whose UTF-8 representation contains a NUL character"), 0));
  if (objc_msgSend(a4, "length"))
    *(_BYTE *)v14 = __toupper(*(char *)v14);
  v16 = (const __CFSet *)_MergedGlobals_98;
  if (!_MergedGlobals_98)
  {
    v17 = *(_OWORD *)(MEMORY[0x1E0C9B3B0] + 16);
    *(_OWORD *)&callBacks.version = *MEMORY[0x1E0C9B3B0];
    *(_OWORD *)&callBacks.release = v17;
    callBacks.equal = (CFSetEqualCallBack)NSKeyValueAccessorIsEqual;
    callBacks.hash = (CFSetHashCallBack)NSKeyValueAccessorHash;
    v16 = CFSetCreateMutable(0, 0, &callBacks);
    _MergedGlobals_98 = (uint64_t)v16;
  }
  callBacks.version = 0;
  callBacks.retain = (CFSetRetainCallBack)a1;
  callBacks.release = (CFSetReleaseCallBack)a4;
  if (a4)
  {
    v18 = CFHash(a4);
    v16 = (const __CFSet *)_MergedGlobals_98;
  }
  else
  {
    v18 = 0;
  }
  callBacks.copyDescription = (CFSetCopyDescriptionCallBack)(v18 ^ (unint64_t)a1);
  v21 = (id)CFSetGetValue(v16, &callBacks);
  if (!v21)
  {
    v21 = objc_msgSend(a1, sel__createValueGetterWithContainerClassID_key_, a1, a4);
    CFSetAddValue((CFMutableSetRef)_MergedGlobals_98, v21);

  }
  v22 = NSKeyValueMethodForPattern(a1, "insertObject:in%sAtIndex:", (const char *)v14);
  v23 = NSKeyValueMethodForPattern(a1, "insert%s:atIndexes:", (const char *)v14);
  v24 = NSKeyValueMethodForPattern(a1, "removeObjectFrom%sAtIndex:", (const char *)v14);
  v25 = NSKeyValueMethodForPattern(a1, "remove%sAtIndexes:", (const char *)v14);
  if ((unint64_t)v22 | (unint64_t)v23)
  {
    v26 = v25;
    if ((unint64_t)v24 | (unint64_t)v25)
    {
      v40 = a3;
      v27 = objc_alloc_init(NSKeyValueMutatingArrayMethodSet);
      v27->insertObjectAtIndex = v22;
      v27->insertObjectsAtIndexes = v23;
      v27->removeObjectAtIndex = v24;
      v27->removeObjectsAtIndexes = v26;
      v27->replaceObjectAtIndex = NSKeyValueMethodForPattern(a1, "replaceObjectIn%sAtIndex:withObject:", (const char *)v14);
      v27->replaceObjectsAtIndexes = NSKeyValueMethodForPattern(a1, "replace%sAtIndexes:with%s:", (const char *)v14, (const char *)v14);
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v28 = [NSKeyValueFastMutableCollection1Getter alloc];
        v29 = objc_msgSend(v21, "methods");
        v30 = -[NSKeyValueFastMutableCollection1Getter initWithContainerClassID:key:nonmutatingMethods:mutatingMethods:proxyClass:](v28, "initWithContainerClassID:key:nonmutatingMethods:mutatingMethods:proxyClass:", v40, a4, v29, v27, objc_opt_self());
      }
      else
      {
        v38 = [NSKeyValueFastMutableCollection2Getter alloc];
        v30 = -[NSKeyValueFastMutableCollection2Getter initWithContainerClassID:key:baseGetter:mutatingMethods:proxyClass:](v38, "initWithContainerClassID:key:baseGetter:mutatingMethods:proxyClass:", v40, a4, v21, v27, objc_opt_self());
      }
      v20 = (void *)v30;

      if (!v12)
        return v20;
LABEL_43:
      free(v14);
      return v20;
    }
  }
  v31 = (const __CFSet *)NSKeyValueCachedSetters;
  if (!NSKeyValueCachedSetters)
  {
    v32 = *(_OWORD *)(MEMORY[0x1E0C9B3B0] + 16);
    *(_OWORD *)&callBacks.version = *MEMORY[0x1E0C9B3B0];
    *(_OWORD *)&callBacks.release = v32;
    callBacks.equal = (CFSetEqualCallBack)NSKeyValueAccessorIsEqual;
    callBacks.hash = (CFSetHashCallBack)NSKeyValueAccessorHash;
    v31 = CFSetCreateMutable(0, 0, &callBacks);
    NSKeyValueCachedSetters = (uint64_t)v31;
  }
  callBacks.version = 0;
  callBacks.retain = (CFSetRetainCallBack)a1;
  callBacks.release = (CFSetReleaseCallBack)a4;
  v33 = a3;
  if (a4)
  {
    v34 = CFHash(a4);
    v31 = (const __CFSet *)NSKeyValueCachedSetters;
  }
  else
  {
    v34 = 0;
  }
  callBacks.copyDescription = (CFSetCopyDescriptionCallBack)(v34 ^ (unint64_t)a1);
  v35 = (id)CFSetGetValue(v31, &callBacks);
  if (!v35)
  {
    v35 = objc_msgSend(a1, sel__createValueSetterWithContainerClassID_key_, a1, a4);
    CFSetAddValue((CFMutableSetRef)NSKeyValueCachedSetters, v35);

  }
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v36 = -[NSKeyValueIvarMutableCollectionGetter initWithContainerClassID:key:containerIsa:ivar:proxyClass:]([NSKeyValueIvarMutableCollectionGetter alloc], "initWithContainerClassID:key:containerIsa:ivar:proxyClass:", v33, a4, a1, objc_msgSend(v35, "ivar"), objc_opt_self());
  else
    v36 = -[NSKeyValueSlowMutableCollectionGetter initWithContainerClassID:key:baseGetter:baseSetter:containerIsa:proxyClass:]([NSKeyValueSlowMutableCollectionGetter alloc], "initWithContainerClassID:key:baseGetter:baseSetter:containerIsa:proxyClass:", v33, a4, v21, v35, a1, objc_opt_self());
  v20 = v36;
  if (v12)
    goto LABEL_43;
  return v20;
}

+ (id)_createMutableSetValueGetterWithContainerClassID:(id)a3 key:(id)a4
{
  const void *(__cdecl *v7)(CFAllocatorRef, const void *);
  const __CFSet *v8;
  __int128 v9;
  CFHashCode v10;
  uint64_t v11;
  unint64_t v12;
  double v13;
  uint64_t *v14;
  unint64_t v15;
  const __CFSet *v16;
  __int128 v17;
  CFHashCode v18;
  id Value;
  void *v20;
  id v21;
  Method v22;
  Method v23;
  Method v24;
  Method v25;
  objc_method *v26;
  NSKeyValueMutatingSetMethodSet *v27;
  NSKeyValueFastMutableCollection1Getter *v28;
  uint64_t v29;
  uint64_t v30;
  const __CFSet *v31;
  __int128 v32;
  id v33;
  CFHashCode v34;
  id v35;
  NSKeyValueIvarMutableCollectionGetter *v36;
  NSKeyValueFastMutableCollection2Getter *v38;
  uint64_t v39;
  id v40;
  CFSetCallBacks callBacks;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  if (_NSKVONotifyingMutatorsShouldNotifyForIsaAndKey((objc_class *)a1, a4))
  {
    v7 = (const void *(__cdecl *)(CFAllocatorRef, const void *))_NSKVONotifyingOriginalClassForIsa((objc_class *)a1);
    v8 = (const __CFSet *)NSKeyValueCachedMutableSetGetters;
    if (!NSKeyValueCachedMutableSetGetters)
    {
      v9 = *(_OWORD *)(MEMORY[0x1E0C9B3B0] + 16);
      *(_OWORD *)&callBacks.version = *MEMORY[0x1E0C9B3B0];
      *(_OWORD *)&callBacks.release = v9;
      callBacks.equal = (CFSetEqualCallBack)NSKeyValueAccessorIsEqual;
      callBacks.hash = (CFSetHashCallBack)NSKeyValueAccessorHash;
      v8 = CFSetCreateMutable(0, 0, &callBacks);
      NSKeyValueCachedMutableSetGetters = (uint64_t)v8;
    }
    callBacks.version = 0;
    callBacks.retain = v7;
    callBacks.release = (CFSetReleaseCallBack)a4;
    if (a4)
    {
      v10 = CFHash(a4);
      v8 = (const __CFSet *)NSKeyValueCachedMutableSetGetters;
    }
    else
    {
      v10 = 0;
    }
    callBacks.copyDescription = (CFSetCopyDescriptionCallBack)(v10 ^ (unint64_t)v7);
    Value = (id)CFSetGetValue(v8, &callBacks);
    if (!Value)
    {
      Value = objc_msgSend(v7, sel__createMutableSetValueGetterWithContainerClassID_key_, v7, a4);
      CFSetAddValue((CFMutableSetRef)NSKeyValueCachedMutableSetGetters, Value);

    }
    return -[NSKeyValueNotifyingMutableCollectionGetter initWithContainerClassID:key:mutableCollectionGetter:proxyClass:]([NSKeyValueNotifyingMutableCollectionGetter alloc], "initWithContainerClassID:key:mutableCollectionGetter:proxyClass:", a3, a4, Value, objc_opt_self());
  }
  v11 = objc_msgSend(a4, "lengthOfBytesUsingEncoding:", 4);
  v12 = v11 + 1;
  if (v11 == -1)
  {
    *(_QWORD *)&v13 = MEMORY[0x1E0C80A78](-1).n128_u64[0];
    v14 = &v39;
    LOBYTE(v39) = 0;
  }
  else
  {
    v14 = (uint64_t *)malloc_type_malloc(v11 + 1, 0x100004077774924uLL);
  }
  objc_msgSend(a4, "getCString:maxLength:encoding:", v14, v12, 4, v13);
  if (v12 <= 1)
    v15 = 1;
  else
    v15 = v12;
  if (v15 >= 2 && v14 && memchr(v14, 0, v15 - 1))
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("Attempted to use a key or key path whose UTF-8 representation contains a NUL character"), 0));
  if (objc_msgSend(a4, "length"))
    *(_BYTE *)v14 = __toupper(*(char *)v14);
  v16 = (const __CFSet *)_MergedGlobals_98;
  if (!_MergedGlobals_98)
  {
    v17 = *(_OWORD *)(MEMORY[0x1E0C9B3B0] + 16);
    *(_OWORD *)&callBacks.version = *MEMORY[0x1E0C9B3B0];
    *(_OWORD *)&callBacks.release = v17;
    callBacks.equal = (CFSetEqualCallBack)NSKeyValueAccessorIsEqual;
    callBacks.hash = (CFSetHashCallBack)NSKeyValueAccessorHash;
    v16 = CFSetCreateMutable(0, 0, &callBacks);
    _MergedGlobals_98 = (uint64_t)v16;
  }
  callBacks.version = 0;
  callBacks.retain = (CFSetRetainCallBack)a1;
  callBacks.release = (CFSetReleaseCallBack)a4;
  if (a4)
  {
    v18 = CFHash(a4);
    v16 = (const __CFSet *)_MergedGlobals_98;
  }
  else
  {
    v18 = 0;
  }
  callBacks.copyDescription = (CFSetCopyDescriptionCallBack)(v18 ^ (unint64_t)a1);
  v21 = (id)CFSetGetValue(v16, &callBacks);
  if (!v21)
  {
    v21 = objc_msgSend(a1, sel__createValueGetterWithContainerClassID_key_, a1, a4);
    CFSetAddValue((CFMutableSetRef)_MergedGlobals_98, v21);

  }
  v22 = NSKeyValueMethodForPattern(a1, "add%sObject:", (const char *)v14);
  v23 = NSKeyValueMethodForPattern(a1, "remove%s:", (const char *)v14);
  v24 = NSKeyValueMethodForPattern(a1, "remove%sObject:", (const char *)v14);
  v25 = NSKeyValueMethodForPattern(a1, "add%s:", (const char *)v14);
  if ((unint64_t)v22 | (unint64_t)v25 && (unint64_t)v24 | (unint64_t)v23)
  {
    v26 = v25;
    v40 = a3;
    v27 = objc_alloc_init(NSKeyValueMutatingSetMethodSet);
    v27->addObject = v22;
    v27->intersectSet = NSKeyValueMethodForPattern(a1, "intersect%s:", (const char *)v14);
    v27->minusSet = v23;
    v27->removeObject = v24;
    v27->setSet = NSKeyValueMethodForPattern(a1, "set%s:", (const char *)v14);
    v27->unionSet = v26;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v28 = [NSKeyValueFastMutableCollection1Getter alloc];
      v29 = objc_msgSend(v21, "methods");
      v30 = -[NSKeyValueFastMutableCollection1Getter initWithContainerClassID:key:nonmutatingMethods:mutatingMethods:proxyClass:](v28, "initWithContainerClassID:key:nonmutatingMethods:mutatingMethods:proxyClass:", v40, a4, v29, v27, objc_opt_self());
    }
    else
    {
      v38 = [NSKeyValueFastMutableCollection2Getter alloc];
      v30 = -[NSKeyValueFastMutableCollection2Getter initWithContainerClassID:key:baseGetter:mutatingMethods:proxyClass:](v38, "initWithContainerClassID:key:baseGetter:mutatingMethods:proxyClass:", v40, a4, v21, v27, objc_opt_self());
    }
    v20 = (void *)v30;

    if (!v12)
      return v20;
LABEL_43:
    free(v14);
    return v20;
  }
  v31 = (const __CFSet *)NSKeyValueCachedSetters;
  if (!NSKeyValueCachedSetters)
  {
    v32 = *(_OWORD *)(MEMORY[0x1E0C9B3B0] + 16);
    *(_OWORD *)&callBacks.version = *MEMORY[0x1E0C9B3B0];
    *(_OWORD *)&callBacks.release = v32;
    callBacks.equal = (CFSetEqualCallBack)NSKeyValueAccessorIsEqual;
    callBacks.hash = (CFSetHashCallBack)NSKeyValueAccessorHash;
    v31 = CFSetCreateMutable(0, 0, &callBacks);
    NSKeyValueCachedSetters = (uint64_t)v31;
  }
  callBacks.version = 0;
  callBacks.retain = (CFSetRetainCallBack)a1;
  callBacks.release = (CFSetReleaseCallBack)a4;
  v33 = a3;
  if (a4)
  {
    v34 = CFHash(a4);
    v31 = (const __CFSet *)NSKeyValueCachedSetters;
  }
  else
  {
    v34 = 0;
  }
  callBacks.copyDescription = (CFSetCopyDescriptionCallBack)(v34 ^ (unint64_t)a1);
  v35 = (id)CFSetGetValue(v31, &callBacks);
  if (!v35)
  {
    v35 = objc_msgSend(a1, sel__createValueSetterWithContainerClassID_key_, a1, a4);
    CFSetAddValue((CFMutableSetRef)NSKeyValueCachedSetters, v35);

  }
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v36 = -[NSKeyValueIvarMutableCollectionGetter initWithContainerClassID:key:containerIsa:ivar:proxyClass:]([NSKeyValueIvarMutableCollectionGetter alloc], "initWithContainerClassID:key:containerIsa:ivar:proxyClass:", v33, a4, a1, objc_msgSend(v35, "ivar"), objc_opt_self());
  else
    v36 = -[NSKeyValueSlowMutableCollectionGetter initWithContainerClassID:key:baseGetter:baseSetter:containerIsa:proxyClass:]([NSKeyValueSlowMutableCollectionGetter alloc], "initWithContainerClassID:key:baseGetter:baseSetter:containerIsa:proxyClass:", v33, a4, v21, v35, a1, objc_opt_self());
  v20 = v36;
  if (v12)
    goto LABEL_43;
  return v20;
}

+ (id)_createValueSetterWithContainerClassID:(id)a3 key:(id)a4
{
  uint64_t v7;
  size_t v8;
  double v9;
  _BYTE *v10;
  unint64_t v11;
  BOOL v12;
  char v13;
  uint64_t v14;
  char *v15;
  Method v16;
  NSKeyValueMethodSetter *v17;
  NSKeyValueMethodSetter *v18;
  Ivar v20;
  _QWORD v21[4];

  v21[3] = *MEMORY[0x1E0C80C00];
  v7 = objc_msgSend(a4, "lengthOfBytesUsingEncoding:", 4);
  v8 = v7 + 1;
  if (v7 == -1)
  {
    *(_QWORD *)&v9 = MEMORY[0x1E0C80A78](-1).n128_u64[0];
    v10 = v21;
    LOBYTE(v21[0]) = 0;
  }
  else
  {
    v10 = malloc_type_malloc(v7 + 1, 0x100004077774924uLL);
  }
  objc_msgSend(a4, "getCString:maxLength:encoding:", v10, v8, 4, v9);
  if (v8 <= 1)
    v11 = 1;
  else
    v11 = v8;
  v12 = v11 < 2 || v10 == 0;
  v13 = v12;
  if (!v12 && memchr(v10, 0, v11 - 1))
    goto LABEL_37;
  v14 = objc_msgSend(a4, "length");
  if (v14)
  {
    v14 = __toupper((char)*v10);
    *v10 = v14;
  }
  if (v8)
  {
    v15 = (char *)malloc_type_malloc(v8, 0x100004077774924uLL);
  }
  else
  {
    MEMORY[0x1E0C80A78](v14);
    v15 = (char *)v21;
    LOBYTE(v21[0]) = 0;
  }
  objc_msgSend(a4, "getCString:maxLength:encoding:", v15, v8, 4);
  if ((v13 & 1) == 0)
  {
    if (memchr(v10, 0, v11 - 1))
LABEL_37:
      objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("Attempted to use a key or key path whose UTF-8 representation contains a NUL character"), 0));
  }
  v16 = NSKeyValueMethodForPattern(a1, "set%s:", v10);
  if (v16
    || (v16 = NSKeyValueMethodForPattern(a1, "_set%s:", v10)) != 0
    || (v16 = NSKeyValueMethodForPattern(a1, "setIs%s:", v10)) != 0)
  {
    v17 = -[NSKeyValueMethodSetter initWithContainerClassID:key:method:]([NSKeyValueMethodSetter alloc], "initWithContainerClassID:key:method:", a3, a4, v16);
    goto LABEL_26;
  }
  if (objc_msgSend(a1, "accessInstanceVariablesDirectly"))
  {
    v20 = NSKeyValueIvarForPattern((objc_class *)a1, "_%s", v15);
    if (v20
      || (v20 = NSKeyValueIvarForPattern((objc_class *)a1, "_is%s", v10)) != 0
      || (v20 = NSKeyValueIvarForPattern((objc_class *)a1, "%s", v15)) != 0
      || (v20 = NSKeyValueIvarForPattern((objc_class *)a1, "is%s", v10)) != 0)
    {
      v17 = -[NSKeyValueIvarSetter initWithContainerClassID:key:containerIsa:ivar:]([NSKeyValueIvarSetter alloc], "initWithContainerClassID:key:containerIsa:ivar:", a3, a4, a1, v20);
LABEL_26:
      v18 = v17;
      if (v17)
        goto LABEL_28;
    }
  }
  v18 = (NSKeyValueMethodSetter *)objc_msgSend(a1, "_createValuePrimitiveSetterWithContainerClassID:key:", a3, a4);
LABEL_28:
  if (v8)
  {
    free(v10);
    free(v15);
  }
  return v18;
}

+ (id)_createValuePrimitiveSetterWithContainerClassID:(id)a3 key:(id)a4
{
  uint64_t v7;
  size_t v8;
  double v9;
  _BYTE *v10;
  unint64_t v11;
  BOOL v12;
  char v13;
  uint64_t v14;
  char *v15;
  Method v16;
  NSKeyValueMethodSetter *v17;
  Ivar v18;
  NSKeyValueMethodSetter *v19;
  _QWORD v21[4];

  v21[3] = *MEMORY[0x1E0C80C00];
  v7 = objc_msgSend(a4, "lengthOfBytesUsingEncoding:", 4);
  v8 = v7 + 1;
  if (v7 == -1)
  {
    *(_QWORD *)&v9 = MEMORY[0x1E0C80A78](-1).n128_u64[0];
    v10 = v21;
    LOBYTE(v21[0]) = 0;
  }
  else
  {
    v10 = malloc_type_malloc(v7 + 1, 0x100004077774924uLL);
  }
  objc_msgSend(a4, "getCString:maxLength:encoding:", v10, v8, 4, v9);
  if (v8 <= 1)
    v11 = 1;
  else
    v11 = v8;
  v12 = v11 < 2 || v10 == 0;
  v13 = v12;
  if (!v12 && memchr(v10, 0, v11 - 1))
    goto LABEL_35;
  v14 = objc_msgSend(a4, "length");
  if (v14)
  {
    v14 = __toupper((char)*v10);
    *v10 = v14;
  }
  if (v8)
  {
    v15 = (char *)malloc_type_malloc(v8, 0x100004077774924uLL);
  }
  else
  {
    MEMORY[0x1E0C80A78](v14);
    v15 = (char *)v21;
    LOBYTE(v21[0]) = 0;
  }
  objc_msgSend(a4, "getCString:maxLength:encoding:", v15, v8, 4);
  if ((v13 & 1) == 0)
  {
    if (memchr(v10, 0, v11 - 1))
LABEL_35:
      objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("Attempted to use a key or key path whose UTF-8 representation contains a NUL character"), 0));
  }
  v16 = NSKeyValueMethodForPattern(a1, "setPrimitive%s:", v10);
  if (v16)
  {
    v17 = -[NSKeyValueMethodSetter initWithContainerClassID:key:method:]([NSKeyValueMethodSetter alloc], "initWithContainerClassID:key:method:", a3, a4, v16);
    goto LABEL_30;
  }
  if (objc_msgSend(a1, "accessInstanceVariablesDirectly"))
  {
    v18 = NSKeyValueIvarForPattern((objc_class *)a1, "_%s", v15);
    if (v18
      || (v18 = NSKeyValueIvarForPattern((objc_class *)a1, "_is%s", v10)) != 0
      || (v18 = NSKeyValueIvarForPattern((objc_class *)a1, "%s", v15)) != 0
      || (v18 = NSKeyValueIvarForPattern((objc_class *)a1, "is%s", v10)) != 0)
    {
      v17 = -[NSKeyValueIvarSetter initWithContainerClassID:key:containerIsa:ivar:]([NSKeyValueIvarSetter alloc], "initWithContainerClassID:key:containerIsa:ivar:", a3, a4, a1, v18);
LABEL_30:
      v19 = v17;
      if (v17)
        goto LABEL_32;
    }
  }
  v19 = (NSKeyValueMethodSetter *)objc_msgSend(a1, "_createOtherValueSetterWithContainerClassID:key:", a3, a4);
LABEL_32:
  if (v8)
  {
    free(v10);
    free(v15);
  }
  return v19;
}

+ (id)_createValuePrimitiveGetterWithContainerClassID:(id)a3 key:(id)a4
{
  uint64_t v7;
  size_t v8;
  double v9;
  _BYTE *v10;
  unint64_t v11;
  BOOL v12;
  char v13;
  uint64_t v14;
  char *v15;
  Method v16;
  NSKeyValueMethodGetter *v17;
  NSKeyValueMethodGetter *v18;
  Ivar v20;
  _QWORD v21[4];

  v21[3] = *MEMORY[0x1E0C80C00];
  v7 = objc_msgSend(a4, "lengthOfBytesUsingEncoding:", 4);
  v8 = v7 + 1;
  if (v7 == -1)
  {
    *(_QWORD *)&v9 = MEMORY[0x1E0C80A78](-1).n128_u64[0];
    v10 = v21;
    LOBYTE(v21[0]) = 0;
  }
  else
  {
    v10 = malloc_type_malloc(v7 + 1, 0x100004077774924uLL);
  }
  objc_msgSend(a4, "getCString:maxLength:encoding:", v10, v8, 4, v9);
  if (v8 <= 1)
    v11 = 1;
  else
    v11 = v8;
  v12 = v11 < 2 || v10 == 0;
  v13 = v12;
  if (!v12 && memchr(v10, 0, v11 - 1))
    goto LABEL_36;
  v14 = objc_msgSend(a4, "length");
  if (v14)
  {
    v14 = __toupper((char)*v10);
    *v10 = v14;
  }
  if (v8)
  {
    v15 = (char *)malloc_type_malloc(v8, 0x100004077774924uLL);
  }
  else
  {
    MEMORY[0x1E0C80A78](v14);
    v15 = (char *)v21;
    LOBYTE(v21[0]) = 0;
  }
  objc_msgSend(a4, "getCString:maxLength:encoding:", v15, v8, 4);
  if ((v13 & 1) == 0)
  {
    if (memchr(v10, 0, v11 - 1))
LABEL_36:
      objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("Attempted to use a key or key path whose UTF-8 representation contains a NUL character"), 0));
  }
  v16 = NSKeyValueMethodForPattern(a1, "getPrimitive%s", v10);
  if (v16 || (v16 = NSKeyValueMethodForPattern(a1, "primitive%s", v10)) != 0)
  {
    v17 = -[NSKeyValueMethodGetter initWithContainerClassID:key:method:]([NSKeyValueMethodGetter alloc], "initWithContainerClassID:key:method:", a3, a4, v16);
    goto LABEL_25;
  }
  if (objc_msgSend(a1, "accessInstanceVariablesDirectly"))
  {
    v20 = NSKeyValueIvarForPattern((objc_class *)a1, "_%s", v15);
    if (v20
      || (v20 = NSKeyValueIvarForPattern((objc_class *)a1, "_is%s", v10)) != 0
      || (v20 = NSKeyValueIvarForPattern((objc_class *)a1, "%s", v15)) != 0
      || (v20 = NSKeyValueIvarForPattern((objc_class *)a1, "is%s", v10)) != 0)
    {
      v17 = -[NSKeyValueIvarGetter initWithContainerClassID:key:containerIsa:ivar:]([NSKeyValueIvarGetter alloc], "initWithContainerClassID:key:containerIsa:ivar:", a3, a4, a1, v20);
LABEL_25:
      v18 = v17;
      if (v17)
        goto LABEL_27;
    }
  }
  v18 = (NSKeyValueMethodGetter *)objc_msgSend(a1, "_createOtherValueGetterWithContainerClassID:key:", a3, a4);
LABEL_27:
  if (v8)
  {
    free(v10);
    free(v15);
  }
  return v18;
}

+ (BOOL)accessInstanceVariablesDirectly
{
  return 1;
}

+ (id)_createValueGetterWithContainerClassID:(id)a3 key:(id)a4
{
  uint64_t v7;
  size_t v8;
  double v9;
  _BYTE *v10;
  unint64_t v11;
  BOOL v12;
  char v13;
  uint64_t v14;
  char *v15;
  Method v16;
  Method v17;
  NSKeyValueMethodGetter *v18;
  NSKeyValueCollectionGetter *v19;
  Method v21;
  Method v22;
  Method v23;
  Method v24;
  objc_method *v25;
  NSKeyValueNonmutatingOrderedSetMethodSet *v26;
  NSKeyValueNonmutatingOrderedSetMethodSet *v27;
  NSKeyValueNonmutatingArrayMethodSet *v28;
  NSKeyValueCollectionGetter *v29;
  Method v30;
  Method v31;
  objc_method *v32;
  Ivar v33;
  _QWORD v34[4];

  v34[3] = *MEMORY[0x1E0C80C00];
  v7 = objc_msgSend(a4, "lengthOfBytesUsingEncoding:", 4);
  v8 = v7 + 1;
  if (v7 == -1)
  {
    *(_QWORD *)&v9 = MEMORY[0x1E0C80A78](-1).n128_u64[0];
    v10 = v34;
    LOBYTE(v34[0]) = 0;
  }
  else
  {
    v10 = malloc_type_malloc(v7 + 1, 0x100004077774924uLL);
  }
  objc_msgSend(a4, "getCString:maxLength:encoding:", v10, v8, 4, v9);
  if (v8 <= 1)
    v11 = 1;
  else
    v11 = v8;
  v12 = v11 < 2 || v10 == 0;
  v13 = v12;
  if (!v12 && memchr(v10, 0, v11 - 1))
    goto LABEL_53;
  v14 = objc_msgSend(a4, "length");
  if (v14)
  {
    v14 = __toupper((char)*v10);
    *v10 = v14;
  }
  if (v8)
  {
    v15 = (char *)malloc_type_malloc(v8, 0x100004077774924uLL);
  }
  else
  {
    MEMORY[0x1E0C80A78](v14);
    v15 = (char *)v34;
    LOBYTE(v34[0]) = 0;
  }
  objc_msgSend(a4, "getCString:maxLength:encoding:", v15, v8, 4);
  if ((v13 & 1) == 0)
  {
    if (memchr(v10, 0, v11 - 1))
LABEL_53:
      objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("Attempted to use a key or key path whose UTF-8 representation contains a NUL character"), 0));
  }
  v16 = NSKeyValueMethodForPattern(a1, "get%s", v10);
  if (v16
    || (v17 = NSKeyValueMethodForPattern(a1, "%s", v15)) != 0
    && (v16 = v17, !objc_msgSend(&unk_1E0FCCAD8, "containsObject:", a4))
    || (v16 = NSKeyValueMethodForPattern(a1, "is%s", v10)) != 0
    || (v16 = NSKeyValueMethodForPattern(a1, "_get%s", v10)) != 0
    || (v16 = NSKeyValueMethodForPattern(a1, "_%s", v15)) != 0)
  {
    v18 = -[NSKeyValueMethodGetter initWithContainerClassID:key:method:]([NSKeyValueMethodGetter alloc], "initWithContainerClassID:key:method:", a3, a4, v16);
LABEL_29:
    v19 = (NSKeyValueCollectionGetter *)v18;
    goto LABEL_30;
  }
  v21 = NSKeyValueMethodForPattern(a1, "countOf%s", v10);
  v22 = NSKeyValueMethodForPattern(a1, "objectIn%sAtIndex:", v10);
  v23 = NSKeyValueMethodForPattern(a1, "%sAtIndexes:", v15);
  v24 = NSKeyValueMethodForPattern(a1, "indexIn%sOfObject:", v10);
  if (v24 && v21)
  {
    if ((unint64_t)v22 | (unint64_t)v23)
    {
      v25 = v24;
      v26 = objc_alloc_init(NSKeyValueNonmutatingOrderedSetMethodSet);
      v26->count = v21;
      v26->objectAtIndex = v22;
      v26->indexOfObject = v25;
      v26->objectsAtIndexes = v23;
      v27 = v26;
      v26->getObjectsRange = NSKeyValueMethodForPattern(a1, "get%s:range:", v10);
      v19 = -[NSKeyValueCollectionGetter initWithContainerClassID:key:methods:proxyClass:]([NSKeyValueCollectionGetter alloc], "initWithContainerClassID:key:methods:proxyClass:", a3, a4, v27, objc_opt_self());

      goto LABEL_30;
    }
  }
  else if (!v21)
  {
    goto LABEL_42;
  }
  if ((unint64_t)v22 | (unint64_t)v23)
  {
    v28 = objc_alloc_init(NSKeyValueNonmutatingArrayMethodSet);
    v28->count = v21;
    v28->objectAtIndex = v22;
    v28->objectsAtIndexes = v23;
    v28->getObjectsRange = NSKeyValueMethodForPattern(a1, "get%s:range:", v10);
    v29 = [NSKeyValueCollectionGetter alloc];
LABEL_46:
    v19 = -[NSKeyValueCollectionGetter initWithContainerClassID:key:methods:proxyClass:](v29, "initWithContainerClassID:key:methods:proxyClass:", a3, a4, v28, objc_opt_self());

LABEL_30:
    if (v19)
      goto LABEL_32;
    goto LABEL_31;
  }
LABEL_42:
  v30 = NSKeyValueMethodForPattern(a1, "enumeratorOf%s", v10);
  v31 = NSKeyValueMethodForPattern(a1, "memberOf%s:", v10);
  if (v21)
  {
    if (v30)
    {
      v32 = v31;
      if (v31)
      {
        v28 = objc_alloc_init(NSKeyValueNonmutatingSetMethodSet);
        v28->count = v21;
        v28->objectAtIndex = v30;
        v28->getObjectsRange = v32;
        v29 = [NSKeyValueCollectionGetter alloc];
        goto LABEL_46;
      }
    }
  }
  if (objc_msgSend(a1, "accessInstanceVariablesDirectly"))
  {
    v33 = NSKeyValueIvarForPattern((objc_class *)a1, "_%s", v15);
    if (v33
      || (v33 = NSKeyValueIvarForPattern((objc_class *)a1, "_is%s", v10)) != 0
      || (v33 = NSKeyValueIvarForPattern((objc_class *)a1, "%s", v15)) != 0
      || (v33 = NSKeyValueIvarForPattern((objc_class *)a1, "is%s", v10)) != 0)
    {
      v18 = -[NSKeyValueIvarGetter initWithContainerClassID:key:containerIsa:ivar:]([NSKeyValueIvarGetter alloc], "initWithContainerClassID:key:containerIsa:ivar:", a3, a4, a1, v33);
      goto LABEL_29;
    }
  }
LABEL_31:
  v19 = (NSKeyValueCollectionGetter *)objc_msgSend(a1, "_createValuePrimitiveGetterWithContainerClassID:key:", a3, a4);
LABEL_32:
  if (v8)
  {
    free(v10);
    free(v15);
  }
  return v19;
}

uint64_t __84__NSObject_NSKeyValueObservingCustomization__keyPathsForValuesAffectingValueForKey___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v4;
  unint64_t v5;
  double v6;
  uint64_t *v7;
  unint64_t v8;
  BOOL v9;
  size_t v10;
  uint64_t v11;
  char *v12;
  size_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  v4 = objc_msgSend(a2, "lengthOfBytesUsingEncoding:", 4);
  v5 = v4 + 1;
  if (v4 == -1)
  {
    *(_QWORD *)&v6 = MEMORY[0x1E0C80A78](-1).n128_u64[0];
    v7 = &v18;
    LOBYTE(v18) = 0;
  }
  else
  {
    v7 = (uint64_t *)malloc_type_malloc(v4 + 1, 0x100004077774924uLL);
  }
  objc_msgSend(a2, "getCString:maxLength:encoding:", v7, v5, 4, v6);
  if (v5 <= 1)
    v8 = 1;
  else
    v8 = v5;
  v9 = v8 < 2 || v7 == 0;
  if (!v9 && memchr(v7, 0, v8 - 1))
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("Attempted to use a key or key path whose UTF-8 representation contains a NUL character"), 0));
  if (objc_msgSend(a2, "length"))
    *(_BYTE *)v7 = __toupper(*(char *)v7);
  v10 = strlen((const char *)v7);
  MEMORY[0x1E0C80A78](v10);
  v12 = (char *)v19 - ((v11 + 44) & 0xFFFFFFFFFFFFFFF0);
  snprintf(v12, v13, "keyPathsForValuesAffecting%s", (const char *)v7);
  v14 = NSResolvedSelectorForName(*(void **)(a1 + 32), v12);
  if (v14 && class_getClassMethod(*(Class *)(a1 + 32), v14))
    method_invoke();
  else
    v15 = objc_msgSend(*(id *)(a1 + 32), "_keysForValuesAffectingValueForKey:", a2);
  v16 = v15;
  if (v5)
    free(v7);
  return v16;
}

+ (id)_createOtherValueGetterWithContainerClassID:(id)a3 key:(id)a4
{
  return -[NSKeyValueUndefinedGetter initWithContainerClassID:key:containerIsa:]([NSKeyValueUndefinedGetter alloc], "initWithContainerClassID:key:containerIsa:", a3, a4, a1);
}

+ (id)_createOtherValueSetterWithContainerClassID:(id)a3 key:(id)a4
{
  return -[NSKeyValueUndefinedSetter initWithContainerClassID:key:containerIsa:]([NSKeyValueUndefinedSetter alloc], "initWithContainerClassID:key:containerIsa:", a3, a4, a1);
}

+ (id)_keysForValuesAffectingValueForKey:(id)a3
{
  const __CFDictionary *v4;
  const void *v5;
  const __CFDictionary *v6;
  void *Value;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  uint64_t v14;
  _BYTE v16[128];
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  os_unfair_lock_lock_with_options();
  v4 = (const __CFDictionary *)qword_1ECD09CC0;
  if (qword_1ECD09CC0
    && (v5 = (const void *)objc_opt_class(), (v6 = (const __CFDictionary *)CFDictionaryGetValue(v4, v5)) != 0))
  {
    Value = (void *)CFDictionaryGetValue(v6, a3);
  }
  else
  {
    Value = 0;
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&_MergedGlobals_103);
  v8 = (void *)objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v9 = objc_msgSend(Value, "countByEnumeratingWithState:objects:count:", &v17, v16, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v18 != v11)
          objc_enumerationMutation(Value);
        v13 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        objc_msgSend(v13, "rangeOfString:", CFSTR("."));
        if (!v14)
          objc_msgSend(v8, "addObject:", v13);
      }
      v10 = objc_msgSend(Value, "countByEnumeratingWithState:objects:count:", &v17, v16, 16);
    }
    while (v10);
  }
  return v8;
}

- (void)performSelector:(SEL)aSelector onThread:(NSThread *)thr withObject:(id)arg waitUntilDone:(BOOL)wait
{
  _BOOL8 v6;
  id v11;
  id v12;

  v6 = wait;
  v11 = objc_allocWithZone(MEMORY[0x1E0C99D20]);
  v12 = (id)objc_msgSend(v11, "initWithObjects:count:", MEMORY[0x1E0C9B270], 1);
  -[NSObject performSelector:onThread:withObject:waitUntilDone:modes:](self, "performSelector:onThread:withObject:waitUntilDone:modes:", aSelector, thr, arg, v6, v12);

}

- (void)performSelectorOnMainThread:(SEL)aSelector withObject:(id)arg waitUntilDone:(BOOL)wait
{
  _BOOL8 v5;
  id v9;
  id v10;

  v5 = wait;
  v9 = objc_allocWithZone(MEMORY[0x1E0C99D20]);
  v10 = (id)objc_msgSend(v9, "initWithObjects:count:", MEMORY[0x1E0C9B270], 1);
  -[NSObject performSelector:onThread:withObject:waitUntilDone:modes:](self, "performSelector:onThread:withObject:waitUntilDone:modes:", aSelector, +[NSThread mainThread](NSThread, "mainThread"), arg, v5, v10);

}

- (void)performSelector:(SEL)aSelector onThread:(NSThread *)thr withObject:(id)arg waitUntilDone:(BOOL)wait modes:(NSArray *)array
{
  _BOOL4 v8;
  NSUInteger v13;
  _NSThreadPerformInfo *v14;
  NSObject *v15;
  NSObject *v16;
  objc_class *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  uint64_t i;
  void *v24;
  void *v25;
  NSQualityOfService v26;
  uint64_t v27;
  NSQualityOfService v28;
  uint64_t v29;
  pthread_override_s *v30;
  int v31;
  NSObject *v32;
  id v33;
  void *v34;
  const char *v35;
  NSObject *v36;
  NSThread *v37;
  objc_super v39;
  _BYTE v40[128];
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  uint64_t v45;

  v8 = wait;
  v45 = *MEMORY[0x1E0C80C00];
  if ((performSelector_onThread_withObject_waitUntilDone_modes__sInvalidSystem & 1) == 0)
    performSelector_onThread_withObject_waitUntilDone_modes__sInvalidSystem = 1;
  v13 = -[NSArray count](array, "count");
  if (array && v13)
  {
    if (v8 && +[NSThread currentThread](NSThread, "currentThread") == thr)
    {
      v32 = self;
      v33 = arg;
      objc_msgSend(self, aSelector, arg);

      return;
    }
    v14 = [_NSThreadPerformInfo alloc];
    v35 = a2;
    v36 = self;
    if (v14)
    {
      v39.receiver = v14;
      v39.super_class = (Class)_NSThreadPerformInfo;
      v15 = -[NSObject init](&v39, sel_init);
      if (isBlock(self))
        v16 = -[NSObject copy](self, "copy");
      else
        v16 = self;
      v15[1].isa = (Class)v16;
      v15[2].isa = (Class)aSelector;
      v37 = thr;
      if (isBlock(arg))
        v17 = (objc_class *)objc_msgSend(arg, "copy");
      else
        v17 = (objc_class *)arg;
      v15[3].isa = v17;
      LODWORD(v15[6].isa) = 0;
      v18 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v41 = 0u;
      v42 = 0u;
      v43 = 0u;
      v44 = 0u;
      v19 = -[NSArray countByEnumeratingWithState:objects:count:](array, "countByEnumeratingWithState:objects:count:", &v41, v40, 16);
      if (v19)
      {
        v20 = v19;
        v21 = *(_QWORD *)v42;
        v22 = (void *)*MEMORY[0x1E0C9B280];
        do
        {
          for (i = 0; i != v20; ++i)
          {
            if (*(_QWORD *)v42 != v21)
              objc_enumerationMutation(array);
            v24 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * i);
            if (objc_msgSend(v24, "isEqual:", CFSTR("NSDefaultRunLoopMode")))
              v25 = v22;
            else
              v25 = v24;
            objc_msgSend(v18, "addObject:", v25);
          }
          v20 = -[NSArray countByEnumeratingWithState:objects:count:](array, "countByEnumeratingWithState:objects:count:", &v41, v40, 16);
        }
        while (v20);
      }
      v15[4].isa = (Class)objc_msgSend(v18, "copy");
      if (v8)
        v15[5].isa = (Class)objc_alloc_init(NSCondition);

      thr = v37;
      if (v8)
        goto LABEL_27;
    }
    else
    {
      v15 = 0;
      if (v8)
      {
LABEL_27:
        v26 = -[NSThread qualityOfService](thr, "qualityOfService");
        if (v26 == NSQualityOfServiceDefault)
          v27 = 25;
        else
          v27 = v26;
        v28 = -[NSThread qualityOfService](+[NSThread currentThread](NSThread, "currentThread"), "qualityOfService");
        if (v28 == NSQualityOfServiceDefault)
          v29 = 25;
        else
          v29 = v28;
        if (v29 <= v27)
          v30 = 0;
        else
          v30 = -[NSThread _beginQoSOverride:relativePriority:](thr, "_beginQoSOverride:relativePriority:");
        -[NSThread _nq:](thr, "_nq:", v15);
        v31 = -[NSObject wait](v15, "wait");
        -[NSThread _endQoSOverride:](thr, "_endQoSOverride:", v30);

        if (v31 == 1)
        {
          v34 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", CFSTR("NSDestinationInvalidException"), +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: target thread exited while waiting for the perform"), _NSMethodExceptionProem((objc_class *)v36, v35)), 0);
          objc_exception_throw(v34);
        }
        return;
      }
    }
    -[NSThread _nq:](thr, "_nq:", v15);

  }
}

uint64_t __98__NSObject_NSKeyValueObservingPrivate___notifyObserversOfChangeFromValuesForKeys_toValuesForKeys___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t result;
  uint64_t v7;

  result = objc_msgSend(*(id *)(a1 + 32), "objectForKey:", a2);
  if (!result)
  {
    --*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
    *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8 * *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24)) = a2;
    v7 = *(_QWORD *)(a1 + 56);
    goto LABEL_6;
  }
  if ((void *)result != a3)
  {
    result = objc_msgSend(a3, "isEqual:", result);
    if ((result & 1) == 0)
    {
      *(_QWORD *)(*(_QWORD *)(a1 + 64)
                + 8 * (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) + *(_QWORD *)(a1 + 72))) = a2;
      v7 = *(_QWORD *)(a1 + 40);
LABEL_6:
      ++*(_QWORD *)(*(_QWORD *)(v7 + 8) + 24);
    }
  }
  return result;
}

- (id)valueForKeyPath:(NSString *)keyPath
{
  size_t v5;
  CFStringEncoding *v6;
  CFStringEncoding v7;
  char *CStringPtr;
  char *v9;
  char *v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  id v15;
  id v16;
  void *v17;

  v5 = -[NSString length](keyPath, "length");
  if (!keyPath)
    goto LABEL_7;
  v6 = (CFStringEncoding *)MEMORY[0x1E0C9A950];
  v7 = *MEMORY[0x1E0C9A950];
  if (*MEMORY[0x1E0C9A950] == -1)
  {
    __CFStringComputeEightBitStringEncoding();
    v7 = *v6;
  }
  CStringPtr = (char *)CFStringGetCStringPtr((CFStringRef)keyPath, v7);
  if (CStringPtr)
  {
    v9 = CStringPtr;
    v10 = (char *)memchr(CStringPtr, 46, v5);
    if (v10)
    {
      v11 = (char *)(v10 - v9);
LABEL_9:
      v14 = v11 + 1;
      v15 = -[NSString _newSubstringWithRange:zone:](keyPath, "_newSubstringWithRange:zone:", 0);
      v16 = -[NSString _newSubstringWithRange:zone:](keyPath, "_newSubstringWithRange:zone:", v14, v5 - (_QWORD)v14, 0);
      v17 = (void *)objc_msgSend(-[NSObject valueForKey:](self, "valueForKey:", v15), "valueForKeyPath:", v16);

      return v17;
    }
  }
  else
  {
LABEL_7:
    v12 = -[NSString rangeOfString:options:range:](keyPath, "rangeOfString:options:range:", CFSTR("."), 2, 0, v5);
    if (v13)
    {
      v11 = (char *)v12;
      goto LABEL_9;
    }
  }
  return -[NSObject valueForKey:](self, "valueForKey:", keyPath);
}

- (void)setValue:(id)value forKeyPath:(NSString *)keyPath
{
  size_t v7;
  CFStringEncoding *v8;
  CFStringEncoding v9;
  char *CStringPtr;
  char *v11;
  char *v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  id v17;
  id v18;

  v7 = -[NSString length](keyPath, "length");
  if (!keyPath)
    goto LABEL_7;
  v8 = (CFStringEncoding *)MEMORY[0x1E0C9A950];
  v9 = *MEMORY[0x1E0C9A950];
  if (*MEMORY[0x1E0C9A950] == -1)
  {
    __CFStringComputeEightBitStringEncoding();
    v9 = *v8;
  }
  CStringPtr = (char *)CFStringGetCStringPtr((CFStringRef)keyPath, v9);
  if (CStringPtr)
  {
    v11 = CStringPtr;
    v12 = (char *)memchr(CStringPtr, 46, v7);
    if (v12)
    {
      v13 = (char *)(v12 - v11);
LABEL_9:
      v16 = v13 + 1;
      v18 = -[NSString _newSubstringWithRange:zone:](keyPath, "_newSubstringWithRange:zone:", 0);
      v17 = -[NSString _newSubstringWithRange:zone:](keyPath, "_newSubstringWithRange:zone:", v16, v7 - (_QWORD)v16, 0);
      objc_msgSend(-[NSObject valueForKey:](self, "valueForKey:", v18), "setValue:forKeyPath:", value, v17);

      return;
    }
  }
  else
  {
LABEL_7:
    v14 = -[NSString rangeOfString:options:range:](keyPath, "rangeOfString:options:range:", CFSTR("."), 2, 0, v7);
    if (v15)
    {
      v13 = (char *)v14;
      goto LABEL_9;
    }
  }
  -[NSObject setValue:forKey:](self, "setValue:forKey:", value, keyPath);
}

- (void)setValue:(id)value forKey:(NSString *)key
{
  const void *(__cdecl *Class)(CFAllocatorRef, const void *);
  __int128 v8;
  id v9;
  void *v10;
  CFSetCallBacks callBacks;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if (!key)
  {
    v10 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: attempt to set a value for a nil key"), _NSMethodExceptionProem((objc_class *)self, a2)), 0);
    objc_exception_throw(v10);
  }
  Class = (const void *(__cdecl *)(CFAllocatorRef, const void *))object_getClass(self);
  os_unfair_lock_lock((os_unfair_lock_t)&NSKeyValueCachedAccessorLock);
  if (!NSKeyValueCachedSetters)
  {
    v8 = *(_OWORD *)(MEMORY[0x1E0C9B3B0] + 16);
    *(_OWORD *)&callBacks.version = *MEMORY[0x1E0C9B3B0];
    *(_OWORD *)&callBacks.release = v8;
    callBacks.equal = (CFSetEqualCallBack)NSKeyValueAccessorIsEqual;
    callBacks.hash = (CFSetHashCallBack)NSKeyValueAccessorHash;
    NSKeyValueCachedSetters = (uint64_t)CFSetCreateMutable(0, 0, &callBacks);
  }
  callBacks.version = 0;
  callBacks.copyDescription = 0;
  callBacks.retain = Class;
  callBacks.release = (CFSetReleaseCallBack)key;
  callBacks.copyDescription = (CFSetCopyDescriptionCallBack)(CFHash(key) ^ (unint64_t)Class);
  v9 = (id)CFSetGetValue((CFSetRef)NSKeyValueCachedSetters, &callBacks);
  if (!v9)
  {
    v9 = objc_msgSend(Class, sel__createValueSetterWithContainerClassID_key_, Class, key);
    CFSetAddValue((CFMutableSetRef)NSKeyValueCachedSetters, v9);

  }
  os_unfair_lock_unlock((os_unfair_lock_t)&NSKeyValueCachedAccessorLock);
  _NSSetUsingKeyValueSetter((uint64_t)self, (uint64_t)v9, (uint64_t)value);
}

- (void)addObserver:(NSObject *)observer forKeyPath:(NSString *)keyPath options:(NSKeyValueObservingOptions)options context:(void *)context
{
  os_unfair_lock_s *v11;
  objc_class *Class;

  v11 = (os_unfair_lock_s *)_NSKeyValueDebugger();
  -[_NSKeyValueDebugging object:willAddObserver:forKeyPath:context:](v11, self, observer, keyPath, (uint64_t)context);
  os_unfair_recursive_lock_lock_with_options();
  Class = object_getClass(self);
  -[NSObject _addObserver:forProperty:options:context:](self, "_addObserver:forProperty:options:context:", observer, NSKeyValuePropertyForIsaAndKeyPath(Class, keyPath), options, context);
  os_unfair_recursive_lock_unlock();
}

- (void)_addObserver:(id)a3 forProperty:(id)a4 options:(unint64_t)a5 context:(void *)a6
{
  uint64_t v11;
  id v12;
  NSKeyValueObservationInfo *v13;
  uint64_t v14;
  NSObject *v15;
  id *v16;
  objc_class *Class;
  objc_class *v18;
  uint64_t v19;
  objc_class *v20;
  char v21;
  _QWORD v22[5];
  id v23[2];

  v23[1] = *(id *)MEMORY[0x1E0C80C00];
  if ((a5 & 4) != 0)
  {
    v23[0] = 0;
    v11 = objc_msgSend(a4, "keyPath");
    os_unfair_recursive_lock_unlock();
    if ((a5 & 1) != 0)
    {
      v12 = -[NSObject valueForKeyPath:](self, "valueForKeyPath:", v11);
      if (!v12)
        v12 = (id)objc_msgSend(MEMORY[0x1E0C99E38], "null");
    }
    else
    {
      v12 = 0;
    }
    v22[0] = 1;
    v22[1] = 0;
    v22[3] = 0;
    v22[4] = 0;
    v22[2] = v12;
    NSKeyValueNotifyObserver(a3, v11, (uint64_t)self, (uint64_t)a6, 0, 0, v22, (uint64_t *)v23);

    os_unfair_recursive_lock_lock_with_options();
  }
  v13 = (NSKeyValueObservationInfo *)_NSKeyValueRetainedObservationInfoForObject(self, *((_QWORD *)a4 + 1));
  if ((a5 & 0x100) != 0 && (v14 = _CFGetTSD()) != 0)
    v15 = *(NSObject **)(v14 + 16);
  else
    v15 = 0;
  +[_NSKVODeallocSentinel _havingRegistrationLockHeldAttachSentinelToObjectIfNeeded:](_NSKVODeallocSentinel, "_havingRegistrationLockHeldAttachSentinelToObjectIfNeeded:", self);
  v23[0] = 0;
  v21 = 0;
  v16 = _NSKeyValueObservationInfoCreateByAdding(v13, a3, (NSKeyValueProperty *)a4, a5, a6, v15, &v21, v23);
  _NSKeyValueReplaceObservationInfoForObject(self, *((_QWORD *)a4 + 1), v13, v16);
  objc_msgSend(a4, "object:didAddObservance:recurse:", self, v23[0], 1);
  if (((unint64_t)self & 0x8000000000000000) == 0)
  {
    Class = object_getClass(self);
    v18 = (objc_class *)objc_msgSend(a4, "isaForAutonotifying");
    if (!v18 || Class == v18)
    {
      if (!_NSKVOUsesBaseClassObservationInfoImplementationForClass(Class))
      {
        v19 = _NSKeyValueContainerClassForIsa(Class);
        v20 = (objc_class *)_NSKeyValueContainerClassGetNotifyingInfo(v19)[1];
        if (v20)
        {
          if (v20 != Class)
            object_setClass(self, v20);
        }
      }
    }
    else
    {
      object_setClass(self, v18);
      objc_setAssociatedObject(self, &_NSKeyValueObservingObservationInfoOverriderMayThrowOnDealloc, MEMORY[0x1E0C9AAB0], (void *)1);
    }
  }

  if (v13)
}

- (void)setObservationInfo:(void *)observationInfo
{
  __CFDictionary *Mutable;
  unint64_t v6;

  Mutable = (__CFDictionary *)NSKeyValueObservationInfoPerObject;
  if (!NSKeyValueObservationInfoPerObject)
  {
    Mutable = CFDictionaryCreateMutable(0, 0, 0, 0);
    NSKeyValueObservationInfoPerObject = (uint64_t)Mutable;
  }
  v6 = ~(unint64_t)self;
  if (observationInfo)
    CFDictionarySetValue(Mutable, (const void *)v6, observationInfo);
  else
    CFDictionaryRemoveValue(Mutable, (const void *)v6);
}

+ (NSSet)keyPathsForValuesAffectingValueForKey:(NSString *)key
{
  _QWORD v6[6];

  v6[5] = *MEMORY[0x1E0C80C00];
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __84__NSObject_NSKeyValueObservingCustomization__keyPathsForValuesAffectingValueForKey___block_invoke;
  v6[3] = &unk_1E0F4F030;
  v6[4] = a1;
  if (_class_isSwift() && (objc_opt_respondsToSelector() & 1) != 0)
    return (NSSet *)objc_msgSend(a1, "__NS_swiftOverlay_keyPathsForValuesAffectingValueForKey:foundationImplementation:", key, v6);
  else
    return (NSSet *)__84__NSObject_NSKeyValueObservingCustomization__keyPathsForValuesAffectingValueForKey___block_invoke((uint64_t)v6, key);
}

+ (BOOL)automaticallyNotifiesObserversForKey:(NSString *)key
{
  _QWORD v6[6];

  v6[5] = *MEMORY[0x1E0C80C00];
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __83__NSObject_NSKeyValueObservingCustomization__automaticallyNotifiesObserversForKey___block_invoke;
  v6[3] = &unk_1E0F4F058;
  v6[4] = a1;
  if (_class_isSwift() && (objc_opt_respondsToSelector() & 1) != 0)
    return objc_msgSend(a1, "__NS_swiftOverlay_automaticallyNotifiesObserversForKey:foundationImplementation:", key, v6);
  else
    return __83__NSObject_NSKeyValueObservingCustomization__automaticallyNotifiesObserversForKey___block_invoke((uint64_t)v6, key);
}

uint64_t __83__NSObject_NSKeyValueObservingCustomization__automaticallyNotifiesObserversForKey___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v4;
  unint64_t v5;
  double v6;
  uint64_t *v7;
  unint64_t v8;
  BOOL v9;
  size_t v10;
  size_t v11;
  char *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  v4 = objc_msgSend(a2, "lengthOfBytesUsingEncoding:", 4);
  v5 = v4 + 1;
  if (v4 == -1)
  {
    *(_QWORD *)&v6 = MEMORY[0x1E0C80A78](-1).n128_u64[0];
    v7 = &v17;
    LOBYTE(v17) = 0;
  }
  else
  {
    v7 = (uint64_t *)malloc_type_malloc(v4 + 1, 0x100004077774924uLL);
  }
  objc_msgSend(a2, "getCString:maxLength:encoding:", v7, v5, 4, v6);
  if (v5 <= 1)
    v8 = 1;
  else
    v8 = v5;
  v9 = v8 < 2 || v7 == 0;
  if (!v9 && memchr(v7, 0, v8 - 1))
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("Attempted to use a key or key path whose UTF-8 representation contains a NUL character"), 0));
  if (objc_msgSend(a2, "length"))
    *(_BYTE *)v7 = __toupper(*(char *)v7);
  v10 = strlen((const char *)v7);
  v11 = v10 + 35;
  if (v10 + 35 < 0x101)
  {
    if (v10 == -35)
    {
      v12 = 0;
    }
    else
    {
      MEMORY[0x1E0C80A78](v10);
      v12 = (char *)v18 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
      bzero(v12, v11);
    }
  }
  else
  {
    v12 = (char *)malloc_type_malloc(v10 + 35, 0x100004077774924uLL);
  }
  snprintf(v12, v11, "automaticallyNotifiesObserversOf%s", (const char *)v7);
  v13 = NSResolvedSelectorForName(*(void **)(a1 + 32), v12);
  if (!v13 || !class_getClassMethod(*(Class *)(a1 + 32), v13))
  {
    v15 = 1;
    if (!v5)
      goto LABEL_25;
    goto LABEL_24;
  }
  method_invoke();
  v15 = v14;
  if (v5)
LABEL_24:
    free(v7);
LABEL_25:
  if (v11 >= 0x101)
    free(v12);
  return v15;
}

+ (void)cancelPreviousPerformRequestsWithTarget:(id)aTarget
{
  void *v4;
  void *v5;
  CFIndex Count;
  const __CFString *v7;
  const __CFString *v8;
  __CFRunLoopTimer *ValueAtIndex;
  _QWORD *info;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  const __CFString *v15;
  const __CFString *v16;
  id v17;
  _QWORD *v18;
  CFIndex v19;
  CFRunLoopTimerContext context;
  _BYTE v21[128];
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = (void *)objc_msgSend(MEMORY[0x1E0C99E58], "currentRunLoop");
  if (v4)
  {
    v5 = v4;
    objc_sync_enter(v4);
    Count = CFArrayGetCount((CFArrayRef)objc_msgSend(v5, "_dperf"));
    if (Count)
    {
      v7 = (const __CFString *)*MEMORY[0x1E0C99860];
      v8 = (const __CFString *)*MEMORY[0x1E0C9B270];
      v17 = aTarget;
      do
      {
        memset(&context, 0, sizeof(context));
        ValueAtIndex = (__CFRunLoopTimer *)CFArrayGetValueAtIndex((CFArrayRef)objc_msgSend(v5, "_dperf"), --Count);
        if (CFRunLoopTimerIsValid(ValueAtIndex))
        {
          context.version = 0;
          CFRunLoopTimerGetContext(ValueAtIndex, &context);
          info = context.info;
          if (*(id *)context.info == aTarget || objc_msgSend(*(id *)context.info, "isEqual:", aTarget))
          {
            CFRetain(ValueAtIndex);
            v18 = info;
            v19 = Count;
            v24 = 0u;
            v25 = 0u;
            v22 = 0u;
            v23 = 0u;
            v11 = (void *)info[3];
            v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v22, v21, 16);
            if (v12)
            {
              v13 = *(_QWORD *)v23;
              do
              {
                for (i = 0; i != v12; ++i)
                {
                  if (*(_QWORD *)v23 != v13)
                    objc_enumerationMutation(v11);
                  v15 = *(const __CFString **)(*((_QWORD *)&v22 + 1) + 8 * i);
                  v16 = v8;
                  if (v15 != v7)
                  {
                    if (objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * i), "isEqual:", CFSTR("kCFRunLoopCommonModes")))v16 = v8;
                    else
                      v16 = v15;
                  }
                  CFRunLoopRemoveTimer((CFRunLoopRef)objc_msgSend(v5, "getCFRunLoop"), ValueAtIndex, v16);
                }
                v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v22, v21, 16);
              }
              while (v12);
            }
            aTarget = v17;
            Count = v19;
            if (v18[6])
              -[NSProcessInfo endActivity:](+[NSProcessInfo processInfo](NSProcessInfo, "processInfo"), "endActivity:", v18[6]);
            CFRunLoopTimerInvalidate(ValueAtIndex);
            CFRelease(ValueAtIndex);
            CFArrayRemoveValueAtIndex((CFMutableArrayRef)objc_msgSend(v5, "_dperf"), v19);
          }
        }
      }
      while (Count);
    }
    objc_sync_exit(v5);
  }
}

+ (void)cancelPreviousPerformRequestsWithTarget:(id)aTarget selector:(SEL)aSelector object:(id)anArgument
{
  void *v8;
  void *v9;
  CFIndex Count;
  const __CFString *v11;
  const __CFString *v12;
  __CFRunLoopTimer *ValueAtIndex;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  const __CFString *v19;
  const __CFString *v20;
  id v21;
  const char *v22;
  id v23;
  CFIndex v24;
  uint64_t v25;
  CFRunLoopTimerContext context;
  _BYTE v27[128];
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v8 = (void *)objc_msgSend(MEMORY[0x1E0C99E58], "currentRunLoop");
  if (v8)
  {
    v9 = v8;
    objc_sync_enter(v8);
    Count = CFArrayGetCount((CFArrayRef)objc_msgSend(v9, "_dperf"));
    if (Count)
    {
      v11 = (const __CFString *)*MEMORY[0x1E0C99860];
      v12 = (const __CFString *)*MEMORY[0x1E0C9B270];
      v22 = aSelector;
      v23 = anArgument;
      v21 = aTarget;
      do
      {
        memset(&context, 0, sizeof(context));
        ValueAtIndex = (__CFRunLoopTimer *)CFArrayGetValueAtIndex((CFArrayRef)objc_msgSend(v9, "_dperf"), --Count);
        if (CFRunLoopTimerIsValid(ValueAtIndex))
        {
          context.version = 0;
          CFRunLoopTimerGetContext(ValueAtIndex, &context);
          if (*((SEL *)context.info + 1) == aSelector)
          {
            v15 = (id)*((_QWORD *)context.info + 2);
            v14 = (void *)*((_QWORD *)context.info + 3);
            v25 = *((_QWORD *)context.info + 6);
            if ((*(id *)context.info == aTarget || objc_msgSend(*(id *)context.info, "isEqual:", aTarget))
              && (v15 == anArgument || objc_msgSend(v15, "isEqual:", anArgument)))
            {
              CFRetain(ValueAtIndex);
              v24 = Count;
              v30 = 0u;
              v31 = 0u;
              v28 = 0u;
              v29 = 0u;
              v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v28, v27, 16);
              if (v16)
              {
                v17 = *(_QWORD *)v29;
                do
                {
                  for (i = 0; i != v16; ++i)
                  {
                    if (*(_QWORD *)v29 != v17)
                      objc_enumerationMutation(v14);
                    v19 = *(const __CFString **)(*((_QWORD *)&v28 + 1) + 8 * i);
                    v20 = v12;
                    if (v19 != v11)
                    {
                      if (objc_msgSend(*(id *)(*((_QWORD *)&v28 + 1) + 8 * i), "isEqual:", CFSTR("kCFRunLoopCommonModes")))v20 = v12;
                      else
                        v20 = v19;
                    }
                    CFRunLoopRemoveTimer((CFRunLoopRef)objc_msgSend(v9, "getCFRunLoop"), ValueAtIndex, v20);
                  }
                  v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v28, v27, 16);
                }
                while (v16);
              }
              aSelector = v22;
              anArgument = v23;
              aTarget = v21;
              Count = v24;
              if (v25)
                -[NSProcessInfo endActivity:](+[NSProcessInfo processInfo](NSProcessInfo, "processInfo"), "endActivity:", v25);
              CFRunLoopTimerInvalidate(ValueAtIndex);
              CFRelease(ValueAtIndex);
              CFArrayRemoveValueAtIndex((CFMutableArrayRef)objc_msgSend(v9, "_dperf"), v24);
            }
          }
        }
      }
      while (Count);
    }
    objc_sync_exit(v9);
  }
}

- (void)performSelector:(SEL)aSelector withObject:(id)anArgument afterDelay:(NSTimeInterval)delay inModes:(NSArray *)modes
{
  malloc_zone_t *v11;
  _QWORD *v12;
  double Current;
  double v14;
  __CFRunLoopTimer *v15;
  NSArray *v16;
  uint64_t v17;
  uint64_t v18;
  __CFString *v19;
  __CFString *v20;
  __CFString *v21;
  uint64_t i;
  __CFString *v23;
  id obj;
  CFRunLoopTimerContext context;
  _BYTE v26[128];
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  obj = (id)objc_msgSend(MEMORY[0x1E0C99E58], "currentRunLoop");
  if (obj)
  {
    *(_OWORD *)&context.version = xmmword_1E0F50AE8;
    *(_OWORD *)&context.retain = *(_OWORD *)algn_1E0F50AF8;
    context.copyDescription = 0;
    if (-[NSArray count](modes, "count"))
    {
      objc_sync_enter(obj);
      v11 = malloc_default_zone();
      v12 = malloc_type_zone_calloc(v11, 1uLL, 0x38uLL, 0xC2E5A2B2uLL);
      context.info = v12;
      *v12 = self;
      v12[1] = aSelector;
      v12[2] = anArgument;
      v12[3] = -[NSArray copyWithZone:](modes, "copyWithZone:", 0);
      v12[5] = obj;
      if (delay == 0.0)
        v12[6] = -[NSProcessInfo beginActivityWithOptions:reason:](+[NSProcessInfo processInfo](NSProcessInfo, "processInfo"), "beginActivityWithOptions:reason:", 0x400000000FFLL, CFSTR("Delayed perform with delay 0"));
      Current = CFAbsoluteTimeGetCurrent();
      v14 = 0.0;
      if (delay >= 0.0)
        v14 = delay;
      v15 = CFRunLoopTimerCreate(0, v14 + Current, 0.0, 0, 0, (CFRunLoopTimerCallBack)__NSFireDelayedPerform, &context);
      v12[4] = v15;
      v27 = 0u;
      v28 = 0u;
      v29 = 0u;
      v30 = 0u;
      v16 = modes;
      v17 = -[NSArray countByEnumeratingWithState:objects:count:](modes, "countByEnumeratingWithState:objects:count:", &v27, v26, 16);
      if (v17)
      {
        v18 = *(_QWORD *)v28;
        v19 = (__CFString *)*MEMORY[0x1E0C9B280];
        v20 = (__CFString *)*MEMORY[0x1E0C99860];
        v21 = (__CFString *)*MEMORY[0x1E0C9B270];
        do
        {
          for (i = 0; i != v17; ++i)
          {
            if (*(_QWORD *)v28 != v18)
              objc_enumerationMutation(v16);
            v23 = *(__CFString **)(*((_QWORD *)&v27 + 1) + 8 * i);
            if (-[__CFString isEqual:](v23, "isEqual:", CFSTR("NSDefaultRunLoopMode")))
              v23 = v19;
            if (v23 == v20 || -[__CFString isEqual:](v23, "isEqual:", CFSTR("kCFRunLoopCommonModes")))
              v23 = v21;
            CFRunLoopAddTimer((CFRunLoopRef)objc_msgSend(obj, "getCFRunLoop"), v15, v23);
          }
          v17 = -[NSArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v27, v26, 16);
        }
        while (v17);
      }
      CFArrayAppendValue((CFMutableArrayRef)objc_msgSend(obj, "_dperf"), v15);
      CFRelease(v15);
      objc_sync_exit(obj);
    }
  }
}

- (void)willChangeValueForKey:(NSString *)key
{
  NSKeyValueWillChangeWithPerThreadPendingNotifications(self, (uint64_t)key, 0, (void (*)(__int128 *__return_ptr, uint64_t, uint64_t, _QWORD, _QWORD, uint64_t, char *))NSKeyValueWillChangeBySetting, 0, 0);
}

+ (void)setVersion:(NSInteger)aVersion
{
  class_setVersion((Class)a1, aVersion);
}

- (NSDictionary)dictionaryWithValuesForKeys:(NSArray *)keys
{
  NSUInteger v5;
  uint64_t *v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t *v11;
  NSUInteger v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  NSDictionary *v16;

  v5 = -[NSArray count](keys, "count");
  v6 = (uint64_t *)malloc_type_malloc(8 * v5, 0x80040B8603338uLL);
  v7 = (uint64_t *)malloc_type_malloc(8 * v5, 0x80040B8603338uLL);
  -[NSArray getObjects:range:](keys, "getObjects:range:", v6, 0, v5);
  v8 = objc_msgSend(MEMORY[0x1E0C99E38], "null");
  if (v5)
  {
    v9 = v8;
    v10 = v6;
    v11 = v7;
    v12 = v5;
    do
    {
      v13 = *v10++;
      v14 = -[NSObject valueForKey:](self, "valueForKey:", v13);
      if (v14)
        v15 = (uint64_t)v14;
      else
        v15 = v9;
      *v11++ = v15;
      --v12;
    }
    while (v12);
  }
  v16 = (NSDictionary *)(id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithObjects:forKeys:count:", v7, v6, v5);
  free(v7);
  free(v6);
  return v16;
}

+ (BOOL)_shouldAddObservationForwardersForKey:(id)a3
{
  return 1;
}

- (void)performSelector:(SEL)aSelector withObject:(id)anArgument afterDelay:(NSTimeInterval)delay
{
  -[NSObject performSelector:withObject:afterDelay:inModes:](self, "performSelector:withObject:afterDelay:inModes:", aSelector, anArgument, objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", *MEMORY[0x1E0C9B280]), delay);
}

- (void)removeObserver:(NSObject *)observer forKeyPath:(NSString *)keyPath context:(void *)context
{
  os_unfair_lock_s *v9;
  uint64_t v10;
  malloc_zone_t *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char v17;
  void *v18;

  v9 = (os_unfair_lock_s *)_NSKeyValueDebugger();
  v18 = context;
  -[_NSKeyValueDebugging object:willRemoveObserver:forKeyPath:context:](v9, (uint64_t)self, observer, (uint64_t)keyPath, (uint64_t)context);
  v10 = _CFGetTSD();
  if (!v10)
  {
    v11 = malloc_default_zone();
    v10 = (uint64_t)malloc_type_zone_calloc(v11, 1uLL, 0x58uLL, 0xC2E5A2B2uLL);
    _CFSetTSD();
  }
  v12 = *(_QWORD *)(v10 + 32);
  v13 = *(_QWORD *)(v10 + 40);
  v15 = *(_QWORD *)(v10 + 48);
  v14 = *(_QWORD *)(v10 + 56);
  v16 = *(_QWORD *)(v10 + 64);
  v17 = *(_BYTE *)(v10 + 72);
  *(_QWORD *)(v10 + 32) = self;
  *(_QWORD *)(v10 + 40) = observer;
  *(_QWORD *)(v10 + 48) = keyPath;
  *(_QWORD *)(v10 + 56) = 0;
  *(_QWORD *)(v10 + 64) = v18;
  *(_BYTE *)(v10 + 72) = 1;
  -[NSObject removeObserver:forKeyPath:](self, "removeObserver:forKeyPath:", observer, keyPath);
  *(_QWORD *)(v10 + 32) = v12;
  *(_QWORD *)(v10 + 40) = v13;
  *(_QWORD *)(v10 + 48) = v15;
  *(_QWORD *)(v10 + 56) = v14;
  *(_QWORD *)(v10 + 64) = v16;
  *(_BYTE *)(v10 + 72) = v17;
}

- (void)removeObserver:(NSObject *)observer forKeyPath:(NSString *)keyPath
{
  uint64_t v7;
  os_unfair_lock_s *v8;
  uint64_t v9;
  uint64_t v10;
  objc_class *Class;

  v7 = _NSKeyValueDebugger();
  if (v7)
  {
    v8 = (os_unfair_lock_s *)v7;
    v9 = _CFGetTSD();
    if (v9)
      v10 = *(_QWORD *)(v9 + 64);
    else
      v10 = 0;
    -[_NSKeyValueDebugging object:willRemoveObserver:forKeyPath:context:](v8, (uint64_t)self, observer, (uint64_t)keyPath, v10);
  }
  os_unfair_recursive_lock_lock_with_options();
  Class = object_getClass(self);
  -[NSObject _removeObserver:forProperty:](self, "_removeObserver:forProperty:", observer, NSKeyValuePropertyForIsaAndKeyPath(Class, keyPath));
  os_unfair_recursive_lock_unlock();
}

- (void)_removeObserver:(id)a3 forProperty:(id)a4
{
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char v14;
  _BYTE *v15;
  void *v16;
  NSKeyValueObservance *v17;
  uint64_t v18;
  uint64_t v19;
  Class Class;
  objc_class *v21;
  uint64_t v22;
  void *v23;
  char v24;
  NSKeyValueObservance *v25[2];

  v25[1] = *(NSKeyValueObservance **)MEMORY[0x1E0C80C00];
  v7 = *((_QWORD *)a4 + 1);
  v8 = _NSKeyValueRetainedObservationInfoForObject(self, v7);
  if (v8)
  {
    v9 = v8;
    v10 = _CFGetTSD();
    if (v10
      && (v11 = v10, *(NSObject **)(v10 + 32) == self)
      && *(id *)(v10 + 40) == a3
      && objc_msgSend(*(id *)(v10 + 48), "isEqualToString:", objc_msgSend(a4, "keyPath")))
    {
      v13 = *(_QWORD *)(v11 + 56);
      v12 = *(_QWORD *)(v11 + 64);
      v14 = *(_BYTE *)(v11 + 72) != 0;
    }
    else
    {
      v13 = 0;
      v12 = 0;
      v14 = 0;
    }
    v25[0] = 0;
    v24 = 0;
    v15 = _NSKeyValueObservationInfoCreateByRemoving((uint64_t)v9, (uint64_t)a3, (uint64_t)a4, v12, v14, v13, &v24, v25);
    if (v25[0])
    {
      v16 = v15;
      v17 = v25[0];
      _NSKeyValueReplaceObservationInfoForObject(self, *((_QWORD *)a4 + 1), v9, v16);
      objc_msgSend(a4, "object:didRemoveObservance:recurse:", self, v25[0], 1);
      if (!v16)
      {
        Class = object_getClass(self);
        v21 = *(objc_class **)(v7 + 8);
        if (Class != v21)
        {
          if (_NSKVOUsesBaseClassObservationInfoImplementationForClass(v21))
            object_setClass(self, *(Class *)(v7 + 8));
          objc_setAssociatedObject(self, &_NSKeyValueObservingObservationInfoOverriderMayThrowOnDealloc, 0, (void *)1);
        }
      }

      return;
    }
LABEL_24:
    v22 = objc_opt_class();
    v23 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99858], +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Cannot remove an observer <%@ %p> for the key path \"%@\" from <%@ %p> because it is not registered as an observer."), v22, a3, objc_msgSend(a4, "keyPath"), objc_opt_class(), self), 0);
    objc_exception_throw(v23);
  }
  if ((objc_opt_respondsToSelector() & 1) == 0)
    goto LABEL_24;
  v18 = _CFGetTSD();
  if (v18)
  {
    v19 = *(_QWORD *)(v18 + 8);
    if (v19)
    {
      while (*(NSObject **)v19 != self)
      {
        v19 = *(_QWORD *)(v19 + 16);
        if (!v19)
          return;
      }

      *(_QWORD *)(v19 + 8) = 0;
    }
  }
}

- (void)_notifyObserversOfChangeFromValuesForKeys:(id)a3 toValuesForKeys:(id)a4
{
  id v5;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  CFStringRef v20;
  void *v21;
  uint64_t v22;
  NSObject *v23;
  char *v24;
  _QWORD v25[10];
  _QWORD v26[4];
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  _BYTE v36[128];
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  uint64_t v41;

  v5 = a3;
  v41 = *MEMORY[0x1E0C80C00];
  v7 = objc_msgSend(a3, "count");
  v8 = objc_msgSend(a4, "count");
  v9 = v8 + v7;
  if ((unint64_t)(v8 + v7) >> 60)
  {
    v20 = CFStringCreateWithFormat(0, 0, CFSTR("*** attempt to create a temporary id buffer which is too large or with a negative count (%lu) -- possibly data is corrupt"), v8 + v7);
    v21 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99750], v20, 0);
    CFRelease(v20);
    objc_exception_throw(v21);
  }
  if (v9 <= 1)
    v10 = 1;
  else
    v10 = v8 + v7;
  MEMORY[0x1E0C80A78](v10);
  v12 = (char *)&v22 - v11;
  v35 = 0;
  v23 = self;
  if (v9 >= 0x101)
  {
    v12 = (char *)_CFCreateArrayStorage();
    v24 = v12;
  }
  else
  {
    v24 = 0;
  }
  v39 = 0u;
  v40 = 0u;
  v37 = 0u;
  v38 = 0u;
  v13 = 0;
  v14 = objc_msgSend(a4, "countByEnumeratingWithState:objects:count:", &v37, v36, 16);
  if (v14)
  {
    v15 = *(_QWORD *)v38;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v38 != v15)
          objc_enumerationMutation(a4);
        v17 = *(_QWORD *)(*((_QWORD *)&v37 + 1) + 8 * i);
        if (!objc_msgSend(v5, "objectForKey:", v17))
          *(_QWORD *)&v12[8 * v13++] = v17;
      }
      v14 = objc_msgSend(a4, "countByEnumeratingWithState:objects:count:", &v37, v36, 16);
    }
    while (v14);
  }
  v31 = 0;
  v32 = &v31;
  v33 = 0x2020000000;
  v34 = 0;
  v27 = 0;
  v28 = &v27;
  v29 = 0x2020000000;
  v30 = 0;
  v26[0] = 0;
  v26[1] = v26;
  v26[2] = 0x2020000000;
  v26[3] = v9;
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __98__NSObject_NSKeyValueObservingPrivate___notifyObserversOfChangeFromValuesForKeys_toValuesForKeys___block_invoke;
  v25[3] = &unk_1E0F4F080;
  v25[8] = v12;
  v25[9] = v13;
  v25[4] = a4;
  v25[5] = &v31;
  v25[6] = v26;
  v25[7] = &v27;
  objc_msgSend(v5, "enumerateKeysAndObjectsUsingBlock:", v25);
  v18 = v28[3];
  v19 = v32[3] + v13;
  if (v9 < v18 + v19)
    __assert_rtn("-[NSObject(NSKeyValueObservingPrivate) _notifyObserversOfChangeFromValuesForKeys:toValuesForKeys:]", "NSKeyValueObserving.m", 2610, "changedKeyCount + removedKeyCount + addedKeyCount <= countSum");
  if (v19 + v18)
  {
    if (!v18)
    {
      if (v5)
      {
        if (a4)
        {
LABEL_29:
          -[NSObject _changeValueForKeys:count:maybeOldValuesDict:maybeNewValuesDict:usingBlock:](v23, "_changeValueForKeys:count:maybeOldValuesDict:maybeNewValuesDict:usingBlock:", v12, v19, v5, a4, 0);
          goto LABEL_30;
        }
      }
      else
      {
        v5 = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionary");
        if (a4)
          goto LABEL_29;
      }
      a4 = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionary");
      goto LABEL_29;
    }
    bzero(&v12[8 * v19], 8 * (v9 - (v18 + v19)));
    if (v5)
    {
      if (!a4)
        goto LABEL_27;
    }
    else
    {
      v5 = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionary");
      if (!a4)
LABEL_27:
        a4 = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionary");
    }
    v19 = v9;
    goto LABEL_29;
  }
LABEL_30:
  _Block_object_dispose(v26, 8);
  _Block_object_dispose(&v27, 8);
  _Block_object_dispose(&v31, 8);
  free(v24);
}

- (void)_changeValueForKey:(id)a3 key:(id)a4 key:(id)a5 usingBlock:(id)a6
{
  _QWORD v6[4];

  v6[3] = *MEMORY[0x1E0C80C00];
  v6[0] = a3;
  v6[1] = a4;
  v6[2] = a5;
  -[NSObject _changeValueForKeys:count:maybeOldValuesDict:maybeNewValuesDict:usingBlock:](self, "_changeValueForKeys:count:maybeOldValuesDict:maybeNewValuesDict:usingBlock:", v6, 3, 0, 0, a6);
}

- (void)_changeValueForKeys:(id *)a3 count:(unint64_t)a4 maybeOldValuesDict:(id)a5 maybeNewValuesDict:(id)a6 usingBlock:(id)a7
{
  uint64_t v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t *v18;
  id **v19;
  uint64_t v20;
  id *v21;
  id *v22;
  uint64_t v23;
  _QWORD *v24;
  uint64_t *v25;
  unint64_t v26;
  uint64_t *v27;
  id *v28;
  uint64_t v29;
  BOOL isClass;
  uint64_t v31;
  uint64_t v32;
  id v33;
  id v34;
  id *v35;
  id *v36;
  uint64_t v37;
  uint64_t v38;
  id v39;
  NSObject *v40;
  uint64_t v41;
  uint64_t v42;
  _QWORD *v43;
  __int128 v44;
  uint64_t v45;
  uint64_t v46;
  _QWORD v47[162];

  v39 = a5;
  v36 = a3;
  v47[160] = *MEMORY[0x1E0C80C00];
  bzero(v47, 0x500uLL);
  os_unfair_recursive_lock_lock_with_options();
  v11 = (uint64_t)_NSKeyValueRetainedObservationInfoForObject(self, 0);
  v40 = self;
  v12 = -[NSObject _implicitObservationInfo](self, "_implicitObservationInfo");
  v13 = (uint64_t)v12;
  if (v11)
  {
    v12 = (id)objc_msgSend(*(id *)(v11 + 8), "count");
    v14 = (uint64_t)v12;
    if (v13)
    {
LABEL_3:
      v12 = (id)objc_msgSend(*(id *)(v13 + 8), "count");
      v15 = (uint64_t)v12;
      goto LABEL_6;
    }
  }
  else
  {
    v14 = 0;
    if (v12)
      goto LABEL_3;
  }
  v15 = 0;
LABEL_6:
  v16 = v15 + v14;
  MEMORY[0x1E0C80A78](v12);
  v18 = (uint64_t *)((char *)&v32 - v17);
  if (v11)
    _NSKeyValueObservationInfoGetObservances(v11, (uint64_t)&v32 - v17, v14);
  if (v13)
    _NSKeyValueObservationInfoGetObservances(v13, (uint64_t)&v18[v14], v15);
  v37 = v13;
  v38 = v15;
  if (v16)
  {
    v19 = (id **)v18;
    v20 = v16;
    do
    {
      if (-[NSKeyValueObservance retainedObserver](*v19))
      {
        v21 = *v19;
        if (*v19)
        {
          if (((_BYTE)v21[5] & 0x20) != 0)
            v21 = (id *)v21[4];
          else
            v21 = 0;
        }
      }
      else
      {
        v21 = 0;
        *v19 = 0;
      }
      v22 = v21;
      ++v19;
      --v20;
    }
    while (v20);
  }
  v23 = v11 | v37;
  os_unfair_recursive_lock_unlock();
  v24 = v47;
  if (v23)
  {
    v33 = a7;
    v34 = a6;
    v35 = (id *)v11;
    v42 = 1;
    v44 = 0u;
    v41 = 16;
    v43 = v47;
    BYTE8(v44) = 1;
    v45 = 0;
    v46 = 0;
    if (a4 && v35)
    {
      v25 = (uint64_t *)v36;
      v26 = a4;
      do
      {
        if (*v25)
          NSKeyValueWillChange((uint64_t)v40, *v25, 0, v18, v14, (void (*)(__int128 *__return_ptr, uint64_t, uint64_t, _QWORD, _QWORD, uint64_t, char *))NSKeyValueWillChangeBySetting, (uint64_t)v39, (void (*)(uint64_t, uint64_t, uint64_t, __int128 *, uint64_t, uint64_t, uint64_t))NSKeyValuePushPendingNotificationLocal, (uint64_t)&v41, 0);
        ++v25;
        --v26;
      }
      while (v26);
    }
    a7 = v33;
    if (v37)
    {
      BYTE8(v44) = 0;
      if ((uint64_t)(a4 - 1) >= 0)
      {
        v27 = &v18[v14];
        v28 = v36 - 1;
        do
        {
          v29 = (uint64_t)v28[a4];
          if (v29)
            NSKeyValueWillChange((uint64_t)v40, v29, 0, v27, v38, (void (*)(__int128 *__return_ptr, uint64_t, uint64_t, _QWORD, _QWORD, uint64_t, char *))NSKeyValueWillChangeBySetting, (uint64_t)v39, (void (*)(uint64_t, uint64_t, uint64_t, __int128 *, uint64_t, uint64_t, uint64_t))NSKeyValuePushPendingNotificationLocal, (uint64_t)&v41, 0);
          --a4;
        }
        while ((uint64_t)a4 > 0);
      }
    }
    v24 = v43;
    v23 = v44;
    a6 = v34;
    v11 = (uint64_t)v35;
  }
  if (a7)
    (*((void (**)(id))a7 + 2))(a7);
  if (v23 >= 1)
  {
    v41 = (uint64_t)v24;
    v42 = v23;
    v43 = 0;
    v44 = 0uLL;
    v45 = v11;
    NSKeyValueDidChange((uint64_t)v40, 0, 0, (void (*)(__int128 *__return_ptr, uint64_t, uint64_t, uint64_t, BOOL, uint64_t, _OWORD *))NSKeyValueDidChangeBySetting, (uint64_t)a6, (uint64_t (*)(uint64_t, uint64_t, uint64_t *, __int128 *, uint64_t *, CFTypeRef *, uint64_t))NSKeyValuePopPendingNotificationLocal, (uint64_t)&v41);
  }
  for (; v16; --v16)
  {
    if (!*v18)
      goto LABEL_43;
    isClass = object_isClass((id)*v18);
    v31 = *v18;
    if (!isClass)
    {

      v31 = *v18;
    }
    if (!v31)
      goto LABEL_45;
    if ((*(_BYTE *)(v31 + 40) & 0x20) != 0)
      v31 = *(_QWORD *)(v31 + 32);
    else
LABEL_43:
      v31 = 0;
LABEL_45:

    ++v18;
  }

  if (v24 != v47)
    free(v24);
}

- (void)didChangeValueForKey:(NSString *)key withSetMutation:(NSKeyValueSetMutationKind)mutationKind usingObjects:(NSSet *)objects
{
  NSKeyValueDidChangeWithPerThreadPendingNotifications(self, (uint64_t)key, 0, (void (*)(__int128 *__return_ptr, uint64_t, uint64_t, uint64_t, BOOL, uint64_t, _OWORD *))NSKeyValueDidChangeBySetMutation, 0);
}

- (void)willChangeValueForKey:(NSString *)key withSetMutation:(NSKeyValueSetMutationKind)mutationKind usingObjects:(NSSet *)objects
{
  _QWORD v5[3];

  v5[2] = *MEMORY[0x1E0C80C00];
  v5[0] = mutationKind;
  v5[1] = objects;
  NSKeyValueWillChangeWithPerThreadPendingNotifications(self, (uint64_t)key, 0, (void (*)(__int128 *__return_ptr, uint64_t, uint64_t, _QWORD, _QWORD, uint64_t, char *))NSKeyValueWillChangeBySetMutation, (uint64_t)v5, 0);
}

- (void)_didChangeValuesForKeys:(id)a3
{
  NSKeyValueDidChangeWithPerThreadPendingNotifications(self, (uint64_t)a3, 1, (void (*)(__int128 *__return_ptr, uint64_t, uint64_t, uint64_t, BOOL, uint64_t, _OWORD *))NSKeyValueDidChangeBySetting, 0);
}

- (void)didChange:(NSKeyValueChange)changeKind valuesAtIndexes:(NSIndexSet *)indexes forKey:(NSString *)key
{
  NSKeyValueDidChangeWithPerThreadPendingNotifications(self, (uint64_t)key, 0, (void (*)(__int128 *__return_ptr, uint64_t, uint64_t, uint64_t, BOOL, uint64_t, _OWORD *))NSKeyValueDidChangeByOrderedToManyMutation, 0);
}

- (void)_willChangeValuesForKeys:(id)a3
{
  NSKeyValueWillChangeWithPerThreadPendingNotifications(self, (uint64_t)a3, 1, (void (*)(__int128 *__return_ptr, uint64_t, uint64_t, _QWORD, _QWORD, uint64_t, char *))NSKeyValueWillChangeBySetting, 0, 0);
}

- (void)willChange:(NSKeyValueChange)changeKind valuesAtIndexes:(NSIndexSet *)indexes forKey:(NSString *)key
{
  _QWORD v5[3];

  v5[2] = *MEMORY[0x1E0C80C00];
  v5[0] = changeKind;
  v5[1] = indexes;
  NSKeyValueWillChangeWithPerThreadPendingNotifications(self, (uint64_t)key, 0, (void (*)(__int128 *__return_ptr, uint64_t, uint64_t, _QWORD, _QWORD, uint64_t, char *))NSKeyValueWillChangeByOrderedToManyMutation, (uint64_t)v5, 0);
}

- (void)setValuesForKeysWithDictionary:(NSDictionary *)keyedValues
{
  uint64_t v5;
  NSUInteger v6;
  NSUInteger v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  id v11;
  id v12;
  _BYTE v13[128];
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v6 = -[NSDictionary countByEnumeratingWithState:objects:count:](keyedValues, "countByEnumeratingWithState:objects:count:", &v14, v13, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(keyedValues);
        v10 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i);
        v11 = -[NSDictionary objectForKey:](keyedValues, "objectForKey:", v10);
        if (v11 == (id)v5)
          v12 = 0;
        else
          v12 = v11;
        -[NSObject setValue:forKey:](self, "setValue:forKey:", v12, v10);
      }
      v7 = -[NSDictionary countByEnumeratingWithState:objects:count:](keyedValues, "countByEnumeratingWithState:objects:count:", &v14, v13, 16);
    }
    while (v7);
  }
}

- (void)performSelectorOnMainThread:(SEL)aSelector withObject:(id)arg waitUntilDone:(BOOL)wait modes:(NSArray *)array
{
  -[NSObject performSelector:onThread:withObject:waitUntilDone:modes:](self, "performSelector:onThread:withObject:waitUntilDone:modes:", aSelector, +[NSThread mainThread](NSThread, "mainThread"), arg, wait, array);
}

- (id)addObserver:(id)a3 forObservableKeyPath:(id)a4
{
  int v7;
  __objc2_class **v8;

  v7 = objc_msgSend(a3, "conformsToProtocol:", &unk_1EDCD14C0);
  v8 = off_1E0F114D8;
  if (!v7)
    v8 = off_1E0F114A8;
  return (id)objc_msgSend(objc_alloc(*v8), "initWithObservable:observer:keyPath:", self, a3, a4);
}

- (void)removeObservation:(id)a3 forObservableKeyPath:(id)a4
{
  -[NSObject removeObserver:forKeyPath:context:](self, "removeObserver:forKeyPath:context:", a3, *((_QWORD *)a4 + 2), &internalObservationContext);
}

- (void)setObservation:(id)a3 forObservingKeyPath:(id)a4
{
  NSMapTable *AssociatedObject;

  os_unfair_lock_lock((os_unfair_lock_t)&setObservation_forObservingKeyPath__lock);
  AssociatedObject = (NSMapTable *)objc_getAssociatedObject(self, "strongObservingKeyPathsAssociationKey");
  if (!AssociatedObject)
  {
    AssociatedObject = -[NSMapTable initWithKeyOptions:valueOptions:capacity:]([NSMapTable alloc], "initWithKeyOptions:valueOptions:capacity:", 0, 0, 0);
    objc_setAssociatedObject(self, "strongObservingKeyPathsAssociationKey", AssociatedObject, (void *)0x301);

  }
  if (a3)
    -[NSMapTable setObject:forKey:](AssociatedObject, "setObject:forKey:", a3, a4);
  else
    -[NSMapTable removeObjectForKey:](AssociatedObject, "removeObjectForKey:", a4);
  os_unfair_lock_unlock((os_unfair_lock_t)&setObservation_forObservingKeyPath__lock);
}

- (void)setSharedObservers:(id)a3
{
  if (a3)
    objc_msgSend(a3, "_assignToObject:", self);
  else
    -[NSObject _setSharedObservationInfo:]((uint64_t)self, 0);
}

- (BOOL)_overrideUseFastBlockObservers
{
  return 0;
}

- (void)finishObserving
{
  _QWORD *v2;

  v2 = +[_NSObserverList _copyObserversOfObject:creatingIfAbsent:]((uint64_t)_NSObserverList, self, 0);
  objc_msgSend(v2, "finishObserving");

}

- (id)addChainedObservers:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  _BYTE v12[128];
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v4 = (void *)objc_msgSend(a3, "reverseObjectEnumerator");
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v12, 16);
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    v8 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v4);
        v10 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        if (v7)
          v10 = (void *)objc_msgSend(v10, "addObserver:", v7);
        v7 = v10;
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v12, 16);
    }
    while (v6);
  }
  else
  {
    v7 = 0;
  }
  return -[NSObject addObserver:](self, "addObserver:", v7);
}

- (id)addObserverBlock:(id)a3
{
  objc_class *Class;
  NSObservation *v6;
  NSObservation *v7;

  if (qword_1ECD09430 != -1)
    dispatch_once(&qword_1ECD09430, &__block_literal_global_12);
  Class = object_getClass(self);
  if (class_getMethodImplementation(Class, sel_addObserver_) != (IMP)_MergedGlobals_19_1
    && !-[NSObject _overrideUseFastBlockObservers](self, "_overrideUseFastBlockObservers"))
  {
    return -[NSObject addObserver:](self, "addObserver:", +[NSObservationSink handleValuesWithBlock:](NSObservationSink, "handleValuesWithBlock:", a3));
  }
  v6 = (NSObservation *)+[_NSObserverList _copyObserversOfObject:creatingIfAbsent:]((uint64_t)_NSObserverList, self, 1);
  v7 = -[_NSObserverList addBlockSink:toObservableObject:forTag:](v6, (uint64_t)a3, (uint64_t)self, 1);

  return v7;
}

IMP __64__NSObject_DefaultObservationImplementations__addObserverBlock___block_invoke()
{
  objc_class *v0;
  IMP result;

  v0 = (objc_class *)objc_opt_class();
  result = class_getMethodImplementation(v0, sel_addObserver_);
  _MergedGlobals_19_1 = (uint64_t)result;
  return result;
}

- (id)addObservationTransformer:(id)a3
{
  _QWORD v4[6];

  v4[5] = *MEMORY[0x1E0C80C00];
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __73__NSObject_DefaultObservationImplementations__addObservationTransformer___block_invoke;
  v4[3] = &unk_1E0F4E520;
  v4[4] = a3;
  return -[NSObject addObserver:](self, "addObserver:", +[NSObservationTransformer mapValuesWithBlock:](NSObservationTransformer, "mapValuesWithBlock:", v4));
}

uint64_t __73__NSObject_DefaultObservationImplementations__addObservationTransformer___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (id)_observerStorage
{
  return 0;
}

- (void)_observerStorageOfSize:(unint64_t)a3
{
  return 0;
}

- (void)_destroyObserverList
{
  +[_NSObserverList destroyObserverListForObject:]((uint64_t)_NSObserverList, self);
}

- (BOOL)_isToManyChangeInformation
{
  return 0;
}

- (void)receiveObservedError:(id)a3
{
  uint64_t StackObservedValueClassAndBoxSize;
  uint64_t v6;
  Class v7;
  _DWORD *v8;
  _QWORD *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v10[0] = 0;
  StackObservedValueClassAndBoxSize = getStackObservedValueClassAndBoxSize(v10);
  MEMORY[0x1E0C80A78](StackObservedValueClassAndBoxSize);
  v8 = objc_constructInstance(v7, (char *)v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
  v8[6] = 2;
  *((_QWORD *)v8 + 1) = a3;
  *((_QWORD *)v8 + 2) = self;
  v9 = +[_NSObserverList _copyObserversOfObject:creatingIfAbsent:]((uint64_t)_NSObserverList, self, 0);
  objc_msgSend(v9, "_receiveBox:", v8);

}

- (void)receiveObservedValue:(id)a3
{
  uint64_t StackObservedValueClassAndBoxSize;
  uint64_t v6;
  Class v7;
  _DWORD *v8;
  _QWORD *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v10[0] = 0;
  StackObservedValueClassAndBoxSize = getStackObservedValueClassAndBoxSize(v10);
  MEMORY[0x1E0C80A78](StackObservedValueClassAndBoxSize);
  v8 = objc_constructInstance(v7, (char *)v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
  v8[6] = 1;
  *((_QWORD *)v8 + 1) = a3;
  *((_QWORD *)v8 + 2) = self;
  v9 = +[_NSObserverList _copyObserversOfObject:creatingIfAbsent:]((uint64_t)_NSObserverList, self, 0);
  objc_msgSend(v9, "_receiveBox:", v8);

}

- (id)addObserver:(id)a3
{
  NSObservation *v5;
  NSObservation *v6;

  v5 = (NSObservation *)+[_NSObserverList _copyObserversOfObject:creatingIfAbsent:]((uint64_t)_NSObserverList, self, 1);
  v6 = -[_NSObserverList addObserver:toObservableObject:](v5, a3, self);

  return v6;
}

- (void)removeObservation:(id)a3
{
  _QWORD *v4;

  v4 = +[_NSObserverList _copyObserversOfObject:creatingIfAbsent:]((uint64_t)_NSObserverList, self, 0);
  objc_msgSend(v4, "removeObservation:", a3);

}

- (void)_receiveBox:(id)a3
{
  int v3;

  v3 = *((_DWORD *)a3 + 6);
  switch(v3)
  {
    case 3:
      -[NSObject finishObserving](self, "finishObserving");
      break;
    case 2:
      -[NSObject receiveObservedError:](self, "receiveObservedError:", *((_QWORD *)a3 + 1));
      break;
    case 1:
      -[NSObject receiveObservedValue:](self, "receiveObservedValue:", *((_QWORD *)a3 + 1));
      break;
    default:
      abort();
  }
}

- (BOOL)validateValue:(id *)ioValue forKey:(NSString *)inKey error:(NSError *)outError
{
  NSUInteger v7;
  unint64_t v8;
  double v9;
  _BYTE *v10;
  unint64_t v11;
  BOOL v12;
  Class Class;
  BOOL v14;
  BOOL v15;
  _QWORD v17[4];

  v17[3] = *MEMORY[0x1E0C80C00];
  v7 = -[NSString lengthOfBytesUsingEncoding:](inKey, "lengthOfBytesUsingEncoding:", 4);
  v8 = v7 + 1;
  if (v7 == -1)
  {
    *(_QWORD *)&v9 = MEMORY[0x1E0C80A78](-1).n128_u64[0];
    v10 = v17;
    LOBYTE(v17[0]) = 0;
  }
  else
  {
    v10 = malloc_type_malloc(v7 + 1, 0x100004077774924uLL);
  }
  -[NSString getCString:maxLength:encoding:](inKey, "getCString:maxLength:encoding:", v10, v8, 4, v9);
  if (v8 <= 1)
    v11 = 1;
  else
    v11 = v8;
  v12 = v11 < 2 || v10 == 0;
  if (!v12 && memchr(v10, 0, v11 - 1))
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("Attempted to use a key or key path whose UTF-8 representation contains a NUL character"), 0));
  if (-[NSString length](inKey, "length"))
    *v10 = __toupper((char)*v10);
  Class = object_getClass(self);
  if (!NSKeyValueMethodForPattern(Class, "validate%s:error:", v10))
  {
    v15 = 1;
    if (!v8)
      return v15;
    goto LABEL_16;
  }
  method_invoke();
  v15 = v14;
  if (v8)
LABEL_16:
    free(v10);
  return v15;
}

- (NSMutableArray)mutableArrayValueForKey:(NSString *)key
{
  const void *(__cdecl *Class)(CFAllocatorRef, const void *);
  const __CFSet *v6;
  __int128 v7;
  CFHashCode v8;
  id Value;
  CFSetCallBacks v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  Class = (const void *(__cdecl *)(CFAllocatorRef, const void *))object_getClass(self);
  os_unfair_lock_lock((os_unfair_lock_t)&NSKeyValueCachedAccessorLock);
  v6 = (const __CFSet *)NSKeyValueCachedMutableArrayGetters;
  if (!NSKeyValueCachedMutableArrayGetters)
  {
    v7 = *(_OWORD *)(MEMORY[0x1E0C9B3B0] + 16);
    *(_OWORD *)&v11.version = *MEMORY[0x1E0C9B3B0];
    *(_OWORD *)&v11.release = v7;
    v11.equal = (CFSetEqualCallBack)NSKeyValueAccessorIsEqual;
    v11.hash = (CFSetHashCallBack)NSKeyValueAccessorHash;
    v6 = CFSetCreateMutable(0, 0, &v11);
    NSKeyValueCachedMutableArrayGetters = (uint64_t)v6;
  }
  v11.version = 0;
  v11.retain = Class;
  *(_OWORD *)&v11.release = (unint64_t)key;
  if (key)
  {
    v8 = CFHash(key);
    v6 = (const __CFSet *)NSKeyValueCachedMutableArrayGetters;
  }
  else
  {
    v8 = 0;
  }
  v11.copyDescription = (CFSetCopyDescriptionCallBack)(v8 ^ (unint64_t)Class);
  Value = (id)CFSetGetValue(v6, &v11);
  if (!Value)
  {
    Value = objc_msgSend(Class, sel__createMutableArrayValueGetterWithContainerClassID_key_, Class, key, *(_OWORD *)&v11.version, v11.release);
    CFSetAddValue((CFMutableSetRef)NSKeyValueCachedMutableArrayGetters, Value);

  }
  os_unfair_lock_unlock((os_unfair_lock_t)&NSKeyValueCachedAccessorLock);
  return (NSMutableArray *)_NSGetUsingKeyValueGetter((uint64_t)self, (uint64_t)Value);
}

- (NSMutableOrderedSet)mutableOrderedSetValueForKey:(NSString *)key
{
  const void *(__cdecl *Class)(CFAllocatorRef, const void *);
  const __CFSet *v6;
  __int128 v7;
  CFHashCode v8;
  id Value;
  CFSetCallBacks v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  Class = (const void *(__cdecl *)(CFAllocatorRef, const void *))object_getClass(self);
  os_unfair_lock_lock((os_unfair_lock_t)&NSKeyValueCachedAccessorLock);
  v6 = (const __CFSet *)NSKeyValueCachedMutableOrderedSetGetters;
  if (!NSKeyValueCachedMutableOrderedSetGetters)
  {
    v7 = *(_OWORD *)(MEMORY[0x1E0C9B3B0] + 16);
    *(_OWORD *)&v11.version = *MEMORY[0x1E0C9B3B0];
    *(_OWORD *)&v11.release = v7;
    v11.equal = (CFSetEqualCallBack)NSKeyValueAccessorIsEqual;
    v11.hash = (CFSetHashCallBack)NSKeyValueAccessorHash;
    v6 = CFSetCreateMutable(0, 0, &v11);
    NSKeyValueCachedMutableOrderedSetGetters = (uint64_t)v6;
  }
  v11.version = 0;
  v11.retain = Class;
  *(_OWORD *)&v11.release = (unint64_t)key;
  if (key)
  {
    v8 = CFHash(key);
    v6 = (const __CFSet *)NSKeyValueCachedMutableOrderedSetGetters;
  }
  else
  {
    v8 = 0;
  }
  v11.copyDescription = (CFSetCopyDescriptionCallBack)(v8 ^ (unint64_t)Class);
  Value = (id)CFSetGetValue(v6, &v11);
  if (!Value)
  {
    Value = objc_msgSend(Class, sel__createMutableOrderedSetValueGetterWithContainerClassID_key_, Class, key, *(_OWORD *)&v11.version, v11.release);
    CFSetAddValue((CFMutableSetRef)NSKeyValueCachedMutableOrderedSetGetters, Value);

  }
  os_unfair_lock_unlock((os_unfair_lock_t)&NSKeyValueCachedAccessorLock);
  return (NSMutableOrderedSet *)_NSGetUsingKeyValueGetter((uint64_t)self, (uint64_t)Value);
}

- (NSMutableSet)mutableSetValueForKey:(NSString *)key
{
  const void *(__cdecl *Class)(CFAllocatorRef, const void *);
  const __CFSet *v6;
  __int128 v7;
  CFHashCode v8;
  id Value;
  CFSetCallBacks v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  Class = (const void *(__cdecl *)(CFAllocatorRef, const void *))object_getClass(self);
  os_unfair_lock_lock((os_unfair_lock_t)&NSKeyValueCachedAccessorLock);
  v6 = (const __CFSet *)NSKeyValueCachedMutableSetGetters;
  if (!NSKeyValueCachedMutableSetGetters)
  {
    v7 = *(_OWORD *)(MEMORY[0x1E0C9B3B0] + 16);
    *(_OWORD *)&v11.version = *MEMORY[0x1E0C9B3B0];
    *(_OWORD *)&v11.release = v7;
    v11.equal = (CFSetEqualCallBack)NSKeyValueAccessorIsEqual;
    v11.hash = (CFSetHashCallBack)NSKeyValueAccessorHash;
    v6 = CFSetCreateMutable(0, 0, &v11);
    NSKeyValueCachedMutableSetGetters = (uint64_t)v6;
  }
  v11.version = 0;
  v11.retain = Class;
  *(_OWORD *)&v11.release = (unint64_t)key;
  if (key)
  {
    v8 = CFHash(key);
    v6 = (const __CFSet *)NSKeyValueCachedMutableSetGetters;
  }
  else
  {
    v8 = 0;
  }
  v11.copyDescription = (CFSetCopyDescriptionCallBack)(v8 ^ (unint64_t)Class);
  Value = (id)CFSetGetValue(v6, &v11);
  if (!Value)
  {
    Value = objc_msgSend(Class, sel__createMutableSetValueGetterWithContainerClassID_key_, Class, key, *(_OWORD *)&v11.version, v11.release);
    CFSetAddValue((CFMutableSetRef)NSKeyValueCachedMutableSetGetters, Value);

  }
  os_unfair_lock_unlock((os_unfair_lock_t)&NSKeyValueCachedAccessorLock);
  return (NSMutableSet *)_NSGetUsingKeyValueGetter((uint64_t)self, (uint64_t)Value);
}

- (BOOL)validateValue:(id *)ioValue forKeyPath:(NSString *)inKeyPath error:(NSError *)outError
{
  size_t v9;
  CFStringEncoding *v10;
  CFStringEncoding v11;
  char *CStringPtr;
  char *v13;
  char *v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  id v19;
  id v20;
  char v21;

  v9 = -[NSString length](inKeyPath, "length");
  if (!inKeyPath)
    goto LABEL_7;
  v10 = (CFStringEncoding *)MEMORY[0x1E0C9A950];
  v11 = *MEMORY[0x1E0C9A950];
  if (*MEMORY[0x1E0C9A950] == -1)
  {
    __CFStringComputeEightBitStringEncoding();
    v11 = *v10;
  }
  CStringPtr = (char *)CFStringGetCStringPtr((CFStringRef)inKeyPath, v11);
  if (CStringPtr)
  {
    v13 = CStringPtr;
    v14 = (char *)memchr(CStringPtr, 46, v9);
    if (v14)
    {
      v15 = (char *)(v14 - v13);
LABEL_9:
      v18 = v15 + 1;
      v19 = -[NSString _newSubstringWithRange:zone:](inKeyPath, "_newSubstringWithRange:zone:", 0);
      v20 = -[NSString _newSubstringWithRange:zone:](inKeyPath, "_newSubstringWithRange:zone:", v18, v9 - (_QWORD)v18, 0);
      v21 = objc_msgSend(-[NSObject valueForKey:](self, "valueForKey:", v19), "validateValue:forKeyPath:error:", ioValue, v20, outError);

      return v21;
    }
  }
  else
  {
LABEL_7:
    v16 = -[NSString rangeOfString:options:range:](inKeyPath, "rangeOfString:options:range:", CFSTR("."), 2, 0, v9);
    if (v17)
    {
      v15 = (char *)v16;
      goto LABEL_9;
    }
  }
  return -[NSObject validateValue:forKey:error:](self, "validateValue:forKey:error:", ioValue, inKeyPath, outError);
}

- (NSMutableArray)mutableArrayValueForKeyPath:(NSString *)keyPath
{
  size_t v5;
  CFStringEncoding *v6;
  CFStringEncoding v7;
  char *CStringPtr;
  char *v9;
  char *v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  id v15;
  id v16;
  NSMutableArray *v17;

  v5 = -[NSString length](keyPath, "length");
  if (!keyPath)
    goto LABEL_7;
  v6 = (CFStringEncoding *)MEMORY[0x1E0C9A950];
  v7 = *MEMORY[0x1E0C9A950];
  if (*MEMORY[0x1E0C9A950] == -1)
  {
    __CFStringComputeEightBitStringEncoding();
    v7 = *v6;
  }
  CStringPtr = (char *)CFStringGetCStringPtr((CFStringRef)keyPath, v7);
  if (CStringPtr)
  {
    v9 = CStringPtr;
    v10 = (char *)memchr(CStringPtr, 46, v5);
    if (v10)
    {
      v11 = (char *)(v10 - v9);
LABEL_9:
      v14 = v11 + 1;
      v15 = -[NSString _newSubstringWithRange:zone:](keyPath, "_newSubstringWithRange:zone:", 0);
      v16 = -[NSString _newSubstringWithRange:zone:](keyPath, "_newSubstringWithRange:zone:", v14, v5 - (_QWORD)v14, 0);
      v17 = (NSMutableArray *)objc_msgSend(-[NSObject valueForKey:](self, "valueForKey:", v15), "mutableArrayValueForKeyPath:", v16);

      return v17;
    }
  }
  else
  {
LABEL_7:
    v12 = -[NSString rangeOfString:options:range:](keyPath, "rangeOfString:options:range:", CFSTR("."), 2, 0, v5);
    if (v13)
    {
      v11 = (char *)v12;
      goto LABEL_9;
    }
  }
  return -[NSObject mutableArrayValueForKey:](self, "mutableArrayValueForKey:", keyPath);
}

- (NSMutableOrderedSet)mutableOrderedSetValueForKeyPath:(NSString *)keyPath
{
  size_t v5;
  CFStringEncoding *v6;
  CFStringEncoding v7;
  char *CStringPtr;
  char *v9;
  char *v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  id v15;
  id v16;
  NSMutableOrderedSet *v17;

  v5 = -[NSString length](keyPath, "length");
  if (!keyPath)
    goto LABEL_7;
  v6 = (CFStringEncoding *)MEMORY[0x1E0C9A950];
  v7 = *MEMORY[0x1E0C9A950];
  if (*MEMORY[0x1E0C9A950] == -1)
  {
    __CFStringComputeEightBitStringEncoding();
    v7 = *v6;
  }
  CStringPtr = (char *)CFStringGetCStringPtr((CFStringRef)keyPath, v7);
  if (CStringPtr)
  {
    v9 = CStringPtr;
    v10 = (char *)memchr(CStringPtr, 46, v5);
    if (v10)
    {
      v11 = (char *)(v10 - v9);
LABEL_9:
      v14 = v11 + 1;
      v15 = -[NSString _newSubstringWithRange:zone:](keyPath, "_newSubstringWithRange:zone:", 0);
      v16 = -[NSString _newSubstringWithRange:zone:](keyPath, "_newSubstringWithRange:zone:", v14, v5 - (_QWORD)v14, 0);
      v17 = (NSMutableOrderedSet *)objc_msgSend(-[NSObject valueForKey:](self, "valueForKey:", v15), "mutableOrderedSetValueForKeyPath:", v16);

      return v17;
    }
  }
  else
  {
LABEL_7:
    v12 = -[NSString rangeOfString:options:range:](keyPath, "rangeOfString:options:range:", CFSTR("."), 2, 0, v5);
    if (v13)
    {
      v11 = (char *)v12;
      goto LABEL_9;
    }
  }
  return -[NSObject mutableOrderedSetValueForKey:](self, "mutableOrderedSetValueForKey:", keyPath);
}

- (NSMutableSet)mutableSetValueForKeyPath:(NSString *)keyPath
{
  size_t v5;
  CFStringEncoding *v6;
  CFStringEncoding v7;
  char *CStringPtr;
  char *v9;
  char *v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  id v15;
  id v16;
  NSMutableSet *v17;

  v5 = -[NSString length](keyPath, "length");
  if (!keyPath)
    goto LABEL_7;
  v6 = (CFStringEncoding *)MEMORY[0x1E0C9A950];
  v7 = *MEMORY[0x1E0C9A950];
  if (*MEMORY[0x1E0C9A950] == -1)
  {
    __CFStringComputeEightBitStringEncoding();
    v7 = *v6;
  }
  CStringPtr = (char *)CFStringGetCStringPtr((CFStringRef)keyPath, v7);
  if (CStringPtr)
  {
    v9 = CStringPtr;
    v10 = (char *)memchr(CStringPtr, 46, v5);
    if (v10)
    {
      v11 = (char *)(v10 - v9);
LABEL_9:
      v14 = v11 + 1;
      v15 = -[NSString _newSubstringWithRange:zone:](keyPath, "_newSubstringWithRange:zone:", 0);
      v16 = -[NSString _newSubstringWithRange:zone:](keyPath, "_newSubstringWithRange:zone:", v14, v5 - (_QWORD)v14, 0);
      v17 = (NSMutableSet *)objc_msgSend(-[NSObject valueForKey:](self, "valueForKey:", v15), "mutableSetValueForKeyPath:", v16);

      return v17;
    }
  }
  else
  {
LABEL_7:
    v12 = -[NSString rangeOfString:options:range:](keyPath, "rangeOfString:options:range:", CFSTR("."), 2, 0, v5);
    if (v13)
    {
      v11 = (char *)v12;
      goto LABEL_9;
    }
  }
  return -[NSObject mutableSetValueForKey:](self, "mutableSetValueForKey:", keyPath);
}

- (id)valueForUndefinedKey:(NSString *)key
{
  NSString *v3;
  NSString *v5;
  id v6;
  void *v7;
  void *v8;

  v3 = key;
  v5 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("[<%@ %p> valueForUndefinedKey:]: this class is not key value coding-compliant for the key %@."), objc_opt_class(), self, key);
  v6 = objc_alloc(MEMORY[0x1E0C99D80]);
  if (!v3)
    v3 = (NSString *)objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v7 = (void *)objc_msgSend(v6, "initWithObjectsAndKeys:", self, CFSTR("NSTargetObjectUserInfoKey"), v3, CFSTR("NSUnknownUserInfoKey"), 0);
  v8 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", CFSTR("NSUnknownKeyException"), v5, v7);

  objc_msgSend(v8, "raise");
  return 0;
}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key
{
  NSString *v4;
  NSString *v6;
  id v7;
  void *v8;
  void *v9;

  v4 = key;
  v6 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("[<%@ %p> setValue:forUndefinedKey:]: this class is not key value coding-compliant for the key %@."), objc_opt_class(), self, key);
  v7 = objc_alloc(MEMORY[0x1E0C99D80]);
  if (!v4)
    v4 = (NSString *)objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v8 = (void *)objc_msgSend(v7, "initWithObjectsAndKeys:", self, CFSTR("NSTargetObjectUserInfoKey"), v4, CFSTR("NSUnknownUserInfoKey"), 0);
  v9 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", CFSTR("NSUnknownKeyException"), v6, v8);

  objc_msgSend(v9, "raise");
}

- (void)setNilValueForKey:(NSString *)key
{
  void *v3;

  v3 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("[<%@ %p> setNilValueForKey]: could not set nil as the value for the key %@."), objc_opt_class(), self, key), 0);
  objc_exception_throw(v3);
}

- (BOOL)_isKVOA
{
  return 0;
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
  unsigned __int8 v6;
  NSString *v7;

  v6 = atomic_load(_NSKVO51127338RequiresSilencingExceptions);
  if ((v6 & 1) == 0)
  {
    v7 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: An -observeValueForKeyPath:ofObject:change:context: message was received but not handled.\nKey path: %@\nObserved object: %@\nChange: %@\nContext: %p"), self, keyPath, object, change, context);
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], v7, 0));
  }
  NSLog((NSString *)CFSTR("%@: An -observeValueForKeyPath:ofObject:change:context: message was received but not handled.\nKey path: %@\nObserved object: %@\nChange: %@\nContext: %p"), a2, self, keyPath, object, change, context);
}

+ (void)setKeys:(NSArray *)keys triggerChangeNotificationsForDependentKey:(NSString *)dependentKey
{
  void *v7;
  const __CFDictionary *Mutable;
  void *Value;

  os_unfair_lock_lock_with_options();
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithArray:", keys);
  Mutable = (const __CFDictionary *)qword_1ECD09CC0;
  if (!qword_1ECD09CC0)
  {
    Mutable = CFDictionaryCreateMutable(0, 0, 0, MEMORY[0x1E0C9B3A0]);
    qword_1ECD09CC0 = (uint64_t)Mutable;
  }
  Value = (void *)CFDictionaryGetValue(Mutable, a1);
  if (!Value)
  {
    Value = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
    CFDictionarySetValue((CFMutableDictionaryRef)qword_1ECD09CC0, a1, Value);

  }
  CFDictionarySetValue((CFMutableDictionaryRef)Value, dependentKey, v7);

  os_unfair_lock_unlock((os_unfair_lock_t)&_MergedGlobals_103);
}

- (void)_notifyObserversForKeyPath:(id)a3 change:(id)a4
{
  id *v6;
  id *v7;
  uint64_t v8;
  uint64_t v9;
  id **v10;
  id *v11;
  id *v12;
  id *v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  NSObject *v32;
  _QWORD *v33;
  void *v34;
  uint64_t v35;
  id *v36;
  _QWORD *v37;
  NSObject *v38;
  id v39;
  uint64_t v40;
  _QWORD v41[2];
  uint64_t v42;
  uint64_t v43;
  uint64_t v44[2];

  v44[1] = *MEMORY[0x1E0C80C00];
  v38 = self;
  v6 = (id *)_NSKeyValueRetainedObservationInfoForObject(self, 0);
  if (v6)
  {
    v7 = v6;
    v44[0] = 0;
    v8 = objc_msgSend(v6[1], "count");
    MEMORY[0x1E0C80A78](v8);
    v10 = (id **)((char *)&v35 - v9);
    _NSKeyValueObservationInfoGetObservances((uint64_t)v7, (uint64_t)&v35 - v9, v8);
    if (v8)
    {
      v35 = (uint64_t)&v35;
      v36 = v7;
      v37 = v41;
      v39 = a4;
      while (1)
      {
        v11 = *v10;
        v12 = -[NSKeyValueObservance retainedObserver](*v10);
        if (v12)
          break;
LABEL_29:
        ++v10;
        if (!--v8)
        {
          v34 = (void *)v44[0];
          v7 = v36;
          goto LABEL_32;
        }
      }
      v13 = v12;
      v14 = (void *)objc_msgSend(v11[2], "restOfKeyPathIfContainedByValueForKeyPath:", a3, v35);
      if (v14)
      {
        v15 = v14;
        v16 = a3;
        v17 = objc_msgSend(v14, "length");
        v18 = objc_msgSend((id)objc_msgSend(a4, "objectForKey:", CFSTR("kind")), "integerValue");
        if (((_BYTE)v11[5] & 2) != 0)
        {
          v24 = (void *)objc_msgSend(a4, "objectForKey:", CFSTR("old"));
          v19 = (uint64_t)v24;
          if (v17)
            v19 = objc_msgSend(v24, "valueForKeyPath:", v15);
          if (!v19)
            v19 = objc_msgSend(MEMORY[0x1E0C99E38], "null");
        }
        else
        {
          v19 = 0;
        }
        if (((_BYTE)v11[5] & 1) != 0)
        {
          v26 = (void *)objc_msgSend(a4, "objectForKey:", CFSTR("new"));
          v25 = (uint64_t)v26;
          if (v17)
            v25 = objc_msgSend(v26, "valueForKeyPath:", v15);
          if (!v25)
            v25 = objc_msgSend(MEMORY[0x1E0C99E38], "null");
        }
        else
        {
          v25 = 0;
        }
        v27 = objc_msgSend(v39, "objectForKey:", CFSTR("indexes"));
        v28 = objc_msgSend(v11[2], "keyPath");
        v29 = (uint64_t)v11[3];
        if (((_BYTE)v11[5] & 0x20) != 0)
          v30 = (uint64_t)v11[4];
        else
          v30 = 0;
        v40 = v18;
        v41[0] = v19;
        v41[1] = v25;
        v42 = v27;
        v43 = 0;
        NSKeyValueNotifyObserver(v13, v28, (uint64_t)v38, v29, v30, 0, &v40, v44);
        a3 = v16;
      }
      else
      {
        if (!objc_msgSend(v11[2], "matchesWithoutOperatorComponentsKeyPath:", a3))
        {
LABEL_28:

          goto LABEL_29;
        }
        v20 = objc_msgSend((id)objc_msgSend(a4, "objectForKey:", CFSTR("kind")), "integerValue");
        v21 = objc_msgSend(a4, "objectForKey:", CFSTR("indexes"));
        v22 = objc_msgSend(v11[2], "keyPath");
        if (((_BYTE)v11[5] & 0x20) != 0)
          v23 = (uint64_t)v11[4];
        else
          v23 = 0;
        v31 = (uint64_t)v11[3];
        v33 = v37;
        v32 = v38;
        *v37 = 0;
        v33[1] = 0;
        v40 = v20;
        v42 = v21;
        v43 = 0;
        NSKeyValueNotifyObserver(v13, v22, (uint64_t)v32, v31, v23, 0, &v40, v44);
      }
      a4 = v39;
      goto LABEL_28;
    }
    v34 = 0;
LABEL_32:

  }
}

- (void)_changeValueForKey:(id)a3 usingBlock:(id)a4
{
  _QWORD v4[2];

  v4[1] = *MEMORY[0x1E0C80C00];
  v4[0] = a3;
  -[NSObject _changeValueForKeys:count:maybeOldValuesDict:maybeNewValuesDict:usingBlock:](self, "_changeValueForKeys:count:maybeOldValuesDict:maybeNewValuesDict:usingBlock:", v4, 1, 0, 0, a4);
}

- (void)_setSharedObservationInfo:(uint64_t)a1
{
  __CFDictionary *Mutable;

  if (a1)
  {
    os_unfair_lock_lock(&NSKeyValueObservationInfoLock);
    Mutable = (__CFDictionary *)NSKeyValueSharedObservationInfoPerObject;
    if (NSKeyValueSharedObservationInfoPerObject)
    {
      if (!a2)
      {
        CFDictionaryRemoveValue((CFMutableDictionaryRef)NSKeyValueSharedObservationInfoPerObject, (const void *)~a1);
LABEL_8:
        os_unfair_lock_unlock(&NSKeyValueObservationInfoLock);
        return;
      }
    }
    else
    {
      if (!a2)
        goto LABEL_8;
      Mutable = CFDictionaryCreateMutable(0, 0, 0, MEMORY[0x1E0C9B3A0]);
      NSKeyValueSharedObservationInfoPerObject = (uint64_t)Mutable;
    }
    CFDictionarySetValue(Mutable, (const void *)~a1, a2);
    goto LABEL_8;
  }
}

+ (BOOL)instancesImplementSelector:(SEL)a3
{
  if (!a3)
    _NSObjectRaiseNullSelectorException((objc_class *)a1, a2);
  return class_getMethodImplementation((Class)a1, a3) != (IMP)MEMORY[0x1E0DE79B8];
}

+ (BOOL)implementsSelector:(SEL)a3
{
  objc_class *Class;

  if (!a3)
    _NSObjectRaiseNullSelectorException((objc_class *)a1, a2);
  Class = object_getClass(a1);
  return class_getMethodImplementation(Class, a3) != (IMP)MEMORY[0x1E0DE79B8];
}

- (BOOL)implementsSelector:(SEL)a3
{
  objc_class *v4;

  if (!a3)
    _NSObjectRaiseNullSelectorException((objc_class *)self, a2);
  v4 = (objc_class *)objc_opt_class();
  return class_getMethodImplementation(v4, a3) != (IMP)MEMORY[0x1E0DE79B8];
}

+ (NSInteger)version
{
  return class_getVersion((Class)a1);
}

- (id)autoContentAccessingProxy
{
  return +[NSAutoContentAccessingProxy proxyWithTarget:](NSAutoContentAccessingProxy, "proxyWithTarget:", self);
}

- (void)performSelectorInBackground:(SEL)aSelector withObject:(id)arg
{
  id v4;

  v4 = (id)objc_msgSend(objc_allocWithZone((Class)NSThread), "initWithTarget:selector:object:", self, aSelector, arg);
  objc_msgSend(v4, "setQualityOfService:", 17);
  objc_msgSend(v4, "start");
}

- (id)replacementObjectForPortCoder:(NSPortCoder *)coder
{
  id result;

  result = -[NSObject replacementObjectForCoder:](self, "replacementObjectForCoder:");
  if (result)
    return (id)-[NSPortCoder _proxyForLocalObject:](coder, "_proxyForLocalObject:", result);
  return result;
}

@end
