@implementation NSKeyedUnarchiver

- (id)_decodeArrayOfObjectsForKey:(id)a3
{
  char v5;
  __CFString *v6;
  unint64_t v7;
  __CFArray *containers;
  CFIndex Count;
  const __CFArray *ValueAtIndex;
  void *Value;
  id v12;
  const char *bytes;
  unint64_t len;
  const char *v15;
  unint64_t v16;
  char v17;
  _BYTE *v18;
  unint64_t v19;
  NSString *v20;
  const __CFString *v21;
  id v22;
  uint64_t v23;
  CFTypeID v24;
  unint64_t v25;
  unint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  _BOOL4 v30;
  CFIndex v31;
  const void *v32;
  CFIndex v33;
  const void *v34;
  CFTypeID v35;
  unint64_t v36;
  void *v37;
  id v38;
  uint64_t v39;
  uint64_t v40;
  id v41;
  void *v43;
  unint64_t v44;
  unint64_t v45;
  uint64_t v46;
  uint64_t v47;
  _QWORD v48[2];
  void (*v49)(uint64_t);
  void *v50;
  uint64_t *v51;
  uint64_t *v52;
  uint64_t v53;
  uint64_t *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;

  v61 = *MEMORY[0x1E0C80C00];
  v5 = atomic_load(&self->_flags);
  if ((v5 & 2) != 0)
  {
    v43 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", CFSTR("NSInvalidUnarchiveOperationException"), +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: unarchive already finished, %@"), _NSMethodExceptionProem((objc_class *)self, a2), CFSTR("cannot decode anything more")), 0);
    objc_exception_throw(v43);
  }
  v6 = (__CFString *)a3;
  v7 = atomic_load(&self->_flags);
  atomic_store(v7 | 8, &self->_flags);
  if (a3 && CFStringGetLength((CFStringRef)a3) >= 1 && CFStringGetCharacterAtIndex(v6, 0) == 36)
    v6 = (__CFString *)-[__CFString substringFromIndex:](v6, "substringFromIndex:", 1);
  v57 = 0;
  v58 = &v57;
  v59 = 0x2020000000;
  v60 = 0;
  v53 = 0;
  v54 = &v53;
  v55 = 0x2020000000;
  v56 = 0;
  v47 = 0;
  v48[0] = MEMORY[0x1E0C809B0];
  v48[1] = 3221225472;
  v49 = __49__NSKeyedUnarchiver__decodeArrayOfObjectsForKey___block_invoke;
  v50 = &unk_1E0F4F308;
  v51 = &v53;
  v52 = &v57;
  containers = self->_containers;
  if (!containers)
  {
    bytes = self->_bytes;
    len = self->_len;
    v46 = 0;
    if ((__CFBinaryPlistGetOffsetForValueFromDictionary3() & 1) == 0)
      goto LABEL_36;
    v15 = &bytes[v46];
    if (__CFADD__(bytes, v46))
      goto LABEL_28;
    v16 = (unint64_t)&bytes[len - 1];
    if (v16 < (unint64_t)v15)
      goto LABEL_28;
    v17 = *v15;
    if ((*v15 & 0xF0) != 0xA0)
    {
      -[NSCoder __failWithExceptionName:errorCode:format:](self, "__failWithExceptionName:errorCode:format:", CFSTR("NSInvalidUnarchiveOperationException"), 4864, CFSTR("%@: value for key (%@) is not an array"), _NSMethodExceptionProem((objc_class *)self, a2), v6);
      goto LABEL_36;
    }
    v18 = v15 + 1;
    if (v15 == (const char *)-1 || v16 < (unint64_t)v18)
    {
LABEL_28:
      v20 = _NSMethodExceptionProem((objc_class *)self, a2);
      v21 = CFSTR("%@: data is corrupt");
    }
    else
    {
      v19 = v17 & 0xF;
      if ((v17 & 0xF) != 0xF)
        goto LABEL_38;
      v45 = 0x1FFFFFFFLL;
      if ((_readInt(self, v18, v16, &v45, 0) & 1) == 0)
      {
        v20 = _NSMethodExceptionProem((objc_class *)self, a2);
        v21 = CFSTR("%@: data is corrupt");
        goto LABEL_29;
      }
      v19 = v45;
      if (!(v45 >> 29))
      {
LABEL_38:
        v39 = _CFCreateArrayStorage();
        v54[3] = v39;
        if (v39)
        {
          v58[3] = 0;
          if (!v19)
            goto LABEL_44;
          while (1)
          {
            v45 = 0;
            if ((__CFBinaryPlistGetOffsetForValueFromArray2() & 1) == 0)
            {
              v49((uint64_t)v48);
              -[NSCoder __failWithExceptionName:errorCode:format:](self, "__failWithExceptionName:errorCode:format:", CFSTR("NSArchiverArchiveInconsistency"), 4864, CFSTR("%@: data is corrupt or object is too large to decode"), _NSMethodExceptionProem((objc_class *)self, a2));
              goto LABEL_36;
            }
            v44 = 0;
            if ((_getUIDFromData(self, &bytes[v45], v16, &v44) & 1) == 0)
              break;
            _decodeObjectBinary((uint64_t)self, v44, (uint64_t)v6, (CFTypeRef *)(v54[3] + 8 * v58[3]));
            v40 = v58[3];
            if (!*(_QWORD *)(v54[3] + 8 * v40))
              goto LABEL_34;
            v58[3] = v40 + 1;
            if (v40 + 1 >= v19)
              goto LABEL_44;
          }
          v49((uint64_t)v48);
          -[NSCoder __failWithExceptionName:errorCode:format:](self, "__failWithExceptionName:errorCode:format:", CFSTR("NSArchiverArchiveInconsistency"), 4864, CFSTR("%@: data is corrupt or value is not an object"), _NSMethodExceptionProem((objc_class *)self, a2));
          goto LABEL_36;
        }
      }
      v20 = _NSMethodExceptionProem((objc_class *)self, a2);
      v21 = CFSTR("%@: array is too large to decode");
    }
LABEL_29:
    -[NSCoder __failWithExceptionName:errorCode:format:](self, "__failWithExceptionName:errorCode:format:", CFSTR("NSArchiverArchiveInconsistency"), 4864, v21, v20);
    goto LABEL_36;
  }
  Count = CFArrayGetCount(containers);
  ValueAtIndex = (const __CFArray *)CFArrayGetValueAtIndex(self->_containers, Count - 1);
  if (CFGetTypeID(ValueAtIndex) == 19)
  {
    Value = (void *)CFArrayGetValueAtIndex(ValueAtIndex, 0);
    v12 = Value;
    CFArrayRemoveValueAtIndex(ValueAtIndex, 0);
  }
  else
  {
    Value = (void *)CFDictionaryGetValue(ValueAtIndex, v6);
    v22 = Value;
  }
  if (Value)
  {
    v19 = objc_msgSend(Value, "count");
    v23 = _CFCreateArrayStorage();
    v54[3] = v23;
    if (v23)
    {
      CFRetain(Value);
      CFArrayAppendValue(self->_containers, Value);
      v24 = CFGetTypeID(Value);
      v25 = atomic_load(&self->_flags);
      atomic_store(v25 & 0xFFFFFFFFFFFFFFFELL | (v24 == 19), &self->_flags);
      v58[3] = 0;
      if (v19)
      {
        v26 = 0;
        v27 = v54[3];
        do
        {
          _decodeObjectXML((uint64_t)self, &stru_1E0F56070, (_QWORD *)(v27 + 8 * v26));
          v27 = v54[3];
          v28 = v58[3];
          v29 = *(_QWORD *)(v27 + 8 * v28);
          v30 = v29 == 0;
          if (!v29)
            break;
          v26 = v28 + 1;
          v58[3] = v26;
        }
        while (v26 < v19);
      }
      else
      {
        v30 = 0;
      }
      v31 = CFArrayGetCount(self->_containers);
      v32 = CFArrayGetValueAtIndex(self->_containers, v31 - 1);
      CFArrayRemoveValueAtIndex(self->_containers, v31 - 1);
      CFRelease(v32);
      v33 = v31 - 2;
      if (v31 >= 2)
      {
        v34 = CFArrayGetValueAtIndex(self->_containers, v33);
        v35 = CFGetTypeID(v34);
        v36 = atomic_load(&self->_flags);
        atomic_store(v36 & 0xFFFFFFFFFFFFFFFELL | (v35 == 19), &self->_flags);
      }
      if (v30)
      {
LABEL_34:
        ((void (*)(_QWORD *, CFIndex))v49)(v48, v33);
        v37 = 0;
LABEL_45:
        v38 = v37;
        goto LABEL_46;
      }
LABEL_44:
      v41 = objc_allocWithZone(MEMORY[0x1E0C99D20]);
      v37 = (void *)objc_msgSend(v41, "_initByAdoptingBuffer:count:size:", v54[3], v19, v47);
      goto LABEL_45;
    }
    -[NSCoder __failWithExceptionName:errorCode:format:](self, "__failWithExceptionName:errorCode:format:", CFSTR("NSArchiverArchiveInconsistency"), 4864, CFSTR("%@: array is too large to decode"), _NSMethodExceptionProem((objc_class *)self, a2));
  }
LABEL_36:
  v38 = 0;
LABEL_46:
  _Block_object_dispose(&v53, 8);
  _Block_object_dispose(&v57, 8);
  return v38;
}

- (BOOL)requiresSecureCoding
{
  unint64_t v2;

  v2 = atomic_load(&self->_flags);
  return (v2 >> 2) & 1;
}

- (uint64_t)_validatePropertyListClass:(uint64_t)a3 forKey:
{
  unint64_t *v5;
  void *v6;
  unint64_t v7;
  unint64_t v8;
  int v9;
  int v10;
  unsigned __int8 v11;
  unint64_t v12;
  int v13;
  NSString *v14;
  id v15;
  const __CFString *v16;
  NSObject *v17;
  NSString *v18;
  uint8_t buf[4];
  NSString *v20;
  __int16 v21;
  const __CFString *v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    if (!a2)
    {
      v18 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Attempt to decode an object with no class for key '%@'."), a3);
      objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", CFSTR("NSInvalidUnarchiveOperationException"), v18, 0));
    }
    v5 = (unint64_t *)result;
    v6 = (void *)objc_msgSend((id)result, "allowedClasses");
    v7 = atomic_load(v5 + 2);
    if ((-[NSCoder _walkAllowedClassListLookingForClass:forKey:allowedClasses:strictModeEnabled:alwaysEnforceExplicitSubclasses:specialCaseObject:]((uint64_t)v5, a2, a3, v6, (v7 >> 5) & 1, 0, 0) & 1) != 0|| *(_QWORD *)(v5[15] + 32))
    {
      return 1;
    }
    v8 = v7 & 0x20;
    v9 = _os_feature_enabled_impl();
    v10 = dyld_program_sdk_at_least();
    v11 = atomic_load(v5 + 2);
    v12 = v11 & 0x80 | v8;
    if (v12)
      v13 = 1;
    else
      v13 = v9 & v10;
    if (v10 && !v12)
      -[NSCoder _warnAboutPlistType:forKey:missingInAllowedClasses:]((objc_class *)v5, (uint64_t)a2, a3, v6);
    if (!v13
      || !v12
      && _os_feature_enabled_impl()
      && -[NSCoder _shouldExemptProcessBasedOnArchivingExceptionRules:]((_BOOL8)v5, (uint64_t)"/System/Library/CoreServices/ArchivingExceptions.bundle/PlistTypeExceptions.plist"))
    {
      return 1;
    }
    else
    {
      v14 = -[NSCoder __allowedClassesDescriptionForClass:]((NSString *)v5, (uint64_t)a2);
      v15 = -[NSCoder _allowedClassesDescriptionForClasses:]((uint64_t)v5, v6);
      if (a3)
        v16 = (const __CFString *)a3;
      else
        v16 = CFSTR("(no key, possibly an argument to a message)");
      v17 = _NSRuntimeIssuesLog();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138543874;
        v20 = v14;
        v21 = 2114;
        v22 = v16;
        v23 = 2112;
        v24 = v15;
      }
      objc_msgSend(v5, "__failWithExceptionName:errorCode:format:", CFSTR("NSInvalidUnarchiveOperationException"), 4864, CFSTR("value for key '%@' was of unexpected class %@.\nAllowed classes are:\n %@"), v16, v14, v15);
      return 0;
    }
  }
  return result;
}

- (id)allowedClasses
{
  char v2;
  objc_super v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v2 = atomic_load(&self->_flags);
  if ((v2 & 4) != 0)
    return (id)-[NSMutableArray lastObject](self->_helper->_allowedClasses, "lastObject");
  v4.receiver = self;
  v4.super_class = (Class)NSKeyedUnarchiver;
  return -[NSCoder allowedClasses](&v4, sel_allowedClasses);
}

- (Class)classForClassName:(NSString *)codedName
{
  Class result;

  result = self->_nameClassMap;
  if (result)
    return (Class)CFDictionaryGetValue(result, codedName);
  return result;
}

- (void)_replaceObject:(id)a3 withObject:(id)a4
{
  char v5;
  __CFDictionary *objRefMap;
  const void *Value;
  __CFDictionary *replacementMap;
  void *v11;
  CFDictionaryKeyCallBacks keyCallBacks;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v5 = atomic_load(&self->_flags);
  if ((v5 & 2) != 0)
  {
    v11 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", CFSTR("NSInvalidUnarchiveOperationException"), +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: unarchive already finished, %@"), _NSMethodExceptionProem((objc_class *)self, a2), CFSTR("cannot replace")), 0);
    objc_exception_throw(v11);
  }
  if (a3 != a4)
  {
    if (self->_delegate && (objc_opt_respondsToSelector() & 1) != 0)
      -[NSKeyedUnarchiverDelegate unarchiver:willReplaceObject:withObject:](self->_delegate, "unarchiver:willReplaceObject:withObject:", self, a3, a4);
    objRefMap = self->_objRefMap;
    if (objRefMap)
    {
      Value = CFDictionaryGetValue(objRefMap, a3);
      CFDictionaryRemoveValue(self->_objRefMap, a3);
      CFDictionarySetValue(self->_objRefMap, a4, Value);
      CFDictionarySetValue(self->_refObjMap, Value, a4);
    }
    -[NSKeyedUnarchiver _temporaryMapReplaceObject:withObject:](self, "_temporaryMapReplaceObject:withObject:", a3, a4);
  }
  replacementMap = self->_replacementMap;
  if (!replacementMap)
  {
    keyCallBacks.version = 0;
    *(_OWORD *)&keyCallBacks.retain = *(_OWORD *)(MEMORY[0x1E0C9B390] + 8);
    memset(&keyCallBacks.copyDescription, 0, 24);
    self->_replacementMap = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, &keyCallBacks, 0);
    _CFDictionarySetCapacity();
    replacementMap = self->_replacementMap;
  }
  CFDictionarySetValue(replacementMap, a3, a4);
}

+ (Class)classForClassName:(NSString *)codedName
{
  objc_class *Value;

  os_unfair_lock_lock(&stru_1ECD09674);
  if (qword_1ECD09680)
    Value = (objc_class *)CFDictionaryGetValue((CFDictionaryRef)qword_1ECD09680, codedName);
  else
    Value = 0;
  os_unfair_lock_unlock(&stru_1ECD09674);
  return Value;
}

- (BOOL)_validateAllowedClassesContainsClass:(Class)a3 forKey:(id)a4
{
  id v7;
  unint64_t v8;
  char v9;
  char v10;
  NSString *v12;

  if (!a3)
  {
    v12 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Attempt to decode an object with no class for key '%@'."), a4);
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", CFSTR("NSInvalidUnarchiveOperationException"), v12, 0));
  }
  v7 = -[NSKeyedUnarchiver allowedClasses](self, "allowedClasses");
  v8 = atomic_load(&self->_flags);
  v9 = atomic_load(&self->_flags);
  v10 = -[NSCoder _walkAllowedClassListLookingForClass:forKey:allowedClasses:strictModeEnabled:alwaysEnforceExplicitSubclasses:specialCaseObject:]((uint64_t)self, a3, (uint64_t)a4, v7, (v8 >> 5) & 1, (v9 & 0x40) != 0, 0);
  if ((v10 & 1) == 0 && !self->_helper->_decodeError)
    -[NSCoder __failWithUnexpectedClass:forKey:allowedClasses:]((NSString *)self, (uint64_t)a3, (const __CFString *)a4, v7);
  return v10;
}

- (void)_temporaryMapReplaceObject:(id)a3 withObject:(id)a4
{
  __CFDictionary *tmpRefObjMap;
  CFIndex Count;
  uint64_t v9;
  size_t v10;
  char *v11;
  const void **v12;
  uint64_t v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  tmpRefObjMap = self->_tmpRefObjMap;
  if (tmpRefObjMap)
  {
    Count = CFDictionaryGetCount(tmpRefObjMap);
    v9 = Count;
    v10 = 8 * Count;
    if ((unint64_t)(8 * Count) <= 0x200)
    {
      if (Count <= 0)
      {
        CFDictionaryGetKeysAndValues(self->_tmpRefObjMap, 0, 0);
        return;
      }
      v11 = (char *)v14 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
      bzero(v11, v10);
      v12 = (const void **)v11;
      bzero(v11, v10);
      CFDictionaryGetKeysAndValues(self->_tmpRefObjMap, (const void **)v11, (const void **)v11);
    }
    else
    {
      v11 = (char *)malloc_type_malloc(8 * Count, 0x100004000313F17uLL);
      v12 = (const void **)malloc_type_malloc(v10, 0x80040B8603338uLL);
      CFDictionaryGetKeysAndValues(self->_tmpRefObjMap, (const void **)v11, v12);
      if (v9 < 1)
      {
LABEL_13:
        free(v12);
        free(v11);
        return;
      }
    }
    v13 = 0;
    while (v12[v13] != a3)
    {
      if (v9 == ++v13)
        goto LABEL_12;
    }
    CFDictionarySetValue(self->_tmpRefObjMap, *(const void **)&v11[8 * v13], a4);
LABEL_12:
    if (v10 >= 0x201)
      goto LABEL_13;
  }
}

- (BOOL)allowsKeyedCoding
{
  return 1;
}

- (BOOL)containsValueForKey:(NSString *)key
{
  char v4;
  __CFString *v5;
  __CFArray *containers;
  CFIndex Count;
  const __CFArray *ValueAtIndex;
  void *Value;
  id v10;
  id v12;
  void *v13;

  v4 = atomic_load(&self->_flags);
  if ((v4 & 2) != 0)
  {
    v13 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", CFSTR("NSInvalidUnarchiveOperationException"), +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: unarchive already finished, %@"), _NSMethodExceptionProem((objc_class *)self, a2), CFSTR("cannot decode anything more")), 0);
    objc_exception_throw(v13);
  }
  v5 = (__CFString *)key;
  if (key && CFStringGetLength((CFStringRef)key) >= 1 && CFStringGetCharacterAtIndex(v5, 0) == 36)
    v5 = (__CFString *)-[__CFString substringFromIndex:](v5, "substringFromIndex:", 1);
  containers = self->_containers;
  if (!containers)
    return __CFBinaryPlistGetOffsetForValueFromDictionary3();
  Count = CFArrayGetCount(containers);
  ValueAtIndex = (const __CFArray *)CFArrayGetValueAtIndex(self->_containers, Count - 1);
  if (CFGetTypeID(ValueAtIndex) == 19)
  {
    Value = (void *)CFArrayGetValueAtIndex(ValueAtIndex, 0);
    v10 = Value;
    CFArrayRemoveValueAtIndex(ValueAtIndex, 0);
  }
  else
  {
    Value = (void *)CFDictionaryGetValue(ValueAtIndex, v5);
    v12 = Value;
  }
  return Value != 0;
}

- (id)decodeObjectOfClasses:(id)a3 forKey:(id)a4
{
  id v4;
  char v8;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v16;
  objc_super v17;
  _BYTE v18[128];
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  if (self->_helper->_decodeError)
    return 0;
  v8 = atomic_load(&self->_flags);
  if ((v8 & 4) == 0)
  {
    v17.receiver = self;
    v17.super_class = (Class)NSKeyedUnarchiver;
    return -[NSCoder decodeObjectOfClasses:forKey:](&v17, sel_decodeObjectOfClasses_forKey_, a3, a4);
  }
  if (a3)
  {
    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    v10 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v19, v18, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v20;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v20 != v12)
            objc_enumerationMutation(a3);
          v14 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
          if (!object_isClass(v14))
          {
            v16 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ object in classes '%@' is not an Objective-C class!"), _NSMethodExceptionProem((objc_class *)self, a2), v14), 0);
            objc_exception_throw(v16);
          }
        }
        v11 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v19, v18, 16);
      }
      while (v11);
    }
    -[NSMutableArray addObject:](self->_helper->_allowedClasses, "addObject:", a3);
    v4 = -[NSKeyedUnarchiver decodeObjectForKey:](self, "decodeObjectForKey:", a4);
    -[NSMutableArray removeLastObject](self->_helper->_allowedClasses, "removeLastObject");
    return v4;
  }
  return -[NSKeyedUnarchiver decodeObjectForKey:](self, "decodeObjectForKey:", a4);
}

- (id)decodeObjectForKey:(NSString *)key
{
  char v4;
  __CFString *v6;
  void *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v4 = atomic_load(&self->_flags);
  if ((v4 & 2) != 0)
  {
    v7 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", CFSTR("NSInvalidUnarchiveOperationException"), +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: unarchive already finished, %@"), _NSMethodExceptionProem((objc_class *)self, a2), CFSTR("cannot decode anything more")), 0);
    objc_exception_throw(v7);
  }
  if (self->_helper->_decodeError)
    return 0;
  v6 = (__CFString *)key;
  if (key && CFStringGetLength((CFStringRef)key) >= 1 && CFStringGetCharacterAtIndex(v6, 0) == 36)
    v6 = (__CFString *)-[__CFString substringFromIndex:](v6, "substringFromIndex:", 1);
  v8[0] = 0;
  _decodeObject((unint64_t *)self, v6, v8);
  return (id)v8[0];
}

- (id)error
{
  return self->_helper->_decodeError;
}

- (NSDecodingFailurePolicy)decodingFailurePolicy
{
  unsigned int v2;

  v2 = atomic_load(&self->_flags);
  return ~(v2 >> 4) & 1;
}

uint64_t __91__NSKeyedUnarchiver_unarchivedDictionaryWithKeysOfClasses_objectsOfClasses_fromData_error___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "decodeDictionaryWithKeysOfClasses:objectsOfClasses:forKey:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), CFSTR("root"));
}

uint64_t __70__NSKeyedUnarchiver_unarchivedArrayOfObjectsOfClasses_fromData_error___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "decodeArrayOfObjectsOfClasses:forKey:", *(_QWORD *)(a1 + 40), CFSTR("root"));
}

- (float)decodeFloatForKey:(NSString *)key
{
  char v4;
  float result;
  __CFString *v6;
  void *v7;
  float v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = atomic_load(&self->_flags);
  if ((v4 & 2) != 0)
  {
    v7 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", CFSTR("NSInvalidUnarchiveOperationException"), +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: unarchive already finished, %@"), _NSMethodExceptionProem((objc_class *)self, a2), CFSTR("cannot decode anything more")), 0);
    objc_exception_throw(v7);
  }
  result = 0.0;
  if (!self->_helper->_decodeError)
  {
    v6 = (__CFString *)key;
    if (key && CFStringGetLength((CFStringRef)key) >= 1 && CFStringGetCharacterAtIndex(v6, 0) == 36)
      v6 = (__CFString *)-[__CFString substringFromIndex:](v6, "substringFromIndex:", 1);
    v8 = 0.0;
    _decodeFloat(self, v6, &v8);
    return v8;
  }
  return result;
}

- (double)decodeDoubleForKey:(NSString *)key
{
  char v4;
  double result;
  __CFString *v6;
  void *v7;
  double v8[2];

  v8[1] = *(double *)MEMORY[0x1E0C80C00];
  v4 = atomic_load(&self->_flags);
  if ((v4 & 2) != 0)
  {
    v7 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", CFSTR("NSInvalidUnarchiveOperationException"), +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: unarchive already finished, %@"), _NSMethodExceptionProem((objc_class *)self, a2), CFSTR("cannot decode anything more")), 0);
    objc_exception_throw(v7);
  }
  result = 0.0;
  if (!self->_helper->_decodeError)
  {
    v6 = (__CFString *)key;
    if (key && CFStringGetLength((CFStringRef)key) >= 1 && CFStringGetCharacterAtIndex(v6, 0) == 36)
      v6 = (__CFString *)-[__CFString substringFromIndex:](v6, "substringFromIndex:", 1);
    v8[0] = 0.0;
    _decodeDouble((uint64_t)self, v6, v8);
    return v8[0];
  }
  return result;
}

- (id)decodeObjectOfClass:(Class)a3 forKey:(id)a4
{
  char v7;
  objc_super v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if (self->_helper->_decodeError)
    return 0;
  v7 = atomic_load(&self->_flags);
  if ((v7 & 4) != 0)
  {
    if (a3)
      a3 = (Class)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:");
    return -[NSKeyedUnarchiver decodeObjectOfClasses:forKey:](self, "decodeObjectOfClasses:forKey:", a3, a4);
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)NSKeyedUnarchiver;
    return -[NSCoder decodeObjectOfClass:forKey:](&v8, sel_decodeObjectOfClass_forKey_, a3, a4);
  }
}

- (id)delegate
{
  return self->_delegate;
}

- (void)decodeBytesWithReturnedLength:(unint64_t *)a3
{
  NSString *v6;
  char v7;
  void *result;
  uint64_t genericKey;
  NSString *v10;
  const UInt8 *v11;
  void *v12;
  uint64_t v13;
  NSString *v14;
  void *v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v16[0] = 0;
  if (_warnArchiverCompat == 1)
  {
    v6 = _NSMethodExceptionProem((objc_class *)self, a2);
    NSLog((NSString *)CFSTR("%@: warning: old archiving compatibility method called"), v6);
  }
  v7 = atomic_load(&self->_flags);
  if ((v7 & 2) != 0)
  {
    v15 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", CFSTR("NSInvalidUnarchiveOperationException"), +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: unarchive already finished, %@"), _NSMethodExceptionProem((objc_class *)self, a2), CFSTR("cannot decode anything more")), 0);
    objc_exception_throw(v15);
  }
  if (self->_helper->_decodeError)
  {
    if (a3)
    {
      result = 0;
      *a3 = 0;
      return result;
    }
  }
  else
  {
    genericKey = self->_genericKey;
    self->_genericKey = genericKey + 1;
    if (genericKey > 0x27)
      v10 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("$%ld"), genericKey);
    else
      v10 = (NSString *)generic_keys[genericKey];
    v11 = _decodeBytes((uint64_t)self, v10, v16);
    if (a3)
      *a3 = v16[0];
    if (v11)
    {
      v12 = (void *)objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithBytes:length:", v11, v16[0]);
      if (v12)
        return (void *)objc_msgSend(v12, "mutableBytes");
      v13 = *MEMORY[0x1E0C99850];
      v14 = _NSMethodExceptionProem((objc_class *)self, sel_decodeBytesWithReturnedLength_);
      -[NSCoder __failWithExceptionName:errorCode:format:](self, "__failWithExceptionName:errorCode:format:", v13, 4864, CFSTR("%@: unable to allocate memory for length (%ld)"), v14, v16[0]);
    }
  }
  return 0;
}

- (const)decodeBytesForKey:(NSString *)key returnedLength:(NSUInteger *)lengthp
{
  char v5;
  __CFString *v8;
  void *v9;

  v5 = atomic_load(&self->_flags);
  if ((v5 & 2) != 0)
  {
    v9 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", CFSTR("NSInvalidUnarchiveOperationException"), +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: unarchive already finished, %@"), _NSMethodExceptionProem((objc_class *)self, a2), CFSTR("cannot decode anything more")), 0);
    objc_exception_throw(v9);
  }
  if (self->_helper->_decodeError)
  {
    if (lengthp)
      *lengthp = 0;
    return 0;
  }
  else
  {
    v8 = (__CFString *)key;
    if (key && CFStringGetLength((CFStringRef)key) >= 1 && CFStringGetCharacterAtIndex(v8, 0) == 36)
      v8 = (__CFString *)-[__CFString substringFromIndex:](v8, "substringFromIndex:", 1);
    return _decodeBytes((uint64_t)self, v8, lengthp);
  }
}

- (int32_t)decodeInt32ForKey:(NSString *)key
{
  char v4;
  __CFString *v6;
  void *v7;
  int32_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = atomic_load(&self->_flags);
  if ((v4 & 2) != 0)
  {
    v7 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", CFSTR("NSInvalidUnarchiveOperationException"), +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: unarchive already finished, %@"), _NSMethodExceptionProem((objc_class *)self, a2), CFSTR("cannot decode anything more")), 0);
    objc_exception_throw(v7);
  }
  if (self->_helper->_decodeError)
    return 0;
  v6 = (__CFString *)key;
  if (key && CFStringGetLength((CFStringRef)key) >= 1 && CFStringGetCharacterAtIndex(v6, 0) == 36)
    v6 = (__CFString *)-[__CFString substringFromIndex:](v6, "substringFromIndex:", 1);
  v8 = 0;
  _decodeInt32(self, v6, &v8);
  return v8;
}

- (int)decodeIntForKey:(NSString *)key
{
  char v4;
  int v5;
  __CFString *v6;
  unint64_t v7;
  int v8;
  void *v10;
  unint64_t v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v4 = atomic_load(&self->_flags);
  if ((v4 & 2) != 0)
  {
    v10 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", CFSTR("NSInvalidUnarchiveOperationException"), +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: unarchive already finished, %@"), _NSMethodExceptionProem((objc_class *)self, a2), CFSTR("cannot decode anything more")), 0);
    objc_exception_throw(v10);
  }
  if (self->_helper->_decodeError)
    return 0;
  v6 = (__CFString *)key;
  v7 = atomic_load(&self->_flags);
  atomic_store(v7 | 8, &self->_flags);
  if (key && CFStringGetLength((CFStringRef)key) >= 1 && CFStringGetCharacterAtIndex(v6, 0) == 36)
    v6 = (__CFString *)-[__CFString substringFromIndex:](v6, "substringFromIndex:", 1);
  v11[0] = 0;
  v8 = _decodeInt64((uint64_t)self, v6, v11);
  v5 = v11[0];
  if (v8 && v11[0] - 0x80000000 <= 0xFFFFFFFEFFFFFFFFLL)
    -[NSCoder __failWithExceptionName:errorCode:format:](self, "__failWithExceptionName:errorCode:format:", *MEMORY[0x1E0C99858], 4864, CFSTR("%@: value (%lld) for key (%@) too large to fit in a native integer"), _NSMethodExceptionProem((objc_class *)self, sel_decodeIntForKey_), v11[0], v6);
  return v5;
}

- (int64_t)decodeInt64ForKey:(NSString *)key
{
  char v4;
  __CFString *v6;
  void *v7;
  unint64_t v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v4 = atomic_load(&self->_flags);
  if ((v4 & 2) != 0)
  {
    v7 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", CFSTR("NSInvalidUnarchiveOperationException"), +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: unarchive already finished, %@"), _NSMethodExceptionProem((objc_class *)self, a2), CFSTR("cannot decode anything more")), 0);
    objc_exception_throw(v7);
  }
  if (self->_helper->_decodeError)
    return 0;
  v6 = (__CFString *)key;
  if (key && CFStringGetLength((CFStringRef)key) >= 1 && CFStringGetCharacterAtIndex(v6, 0) == 36)
    v6 = (__CFString *)-[__CFString substringFromIndex:](v6, "substringFromIndex:", 1);
  v8[0] = 0;
  _decodeInt64((uint64_t)self, v6, v8);
  return v8[0];
}

+ (id)unarchivedObjectOfClass:(Class)cls fromData:(NSData *)data error:(NSError *)error
{
  void *v8;
  void *v9;
  Class v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v11 = cls;
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:count:", &v11, 1);
  v9 = (void *)objc_msgSend(a1, "unarchivedObjectOfClasses:fromData:error:", v8, data, error, v11, v12);

  return v9;
}

+ (id)unarchivedObjectOfClasses:(NSSet *)classes fromData:(NSData *)data error:(NSError *)error
{
  void *v7;
  void *v8;
  void *v9;

  v7 = (void *)objc_msgSend(objc_alloc((Class)a1), "initForReadingFromData:error:", data, error);
  if (!v7)
    return 0;
  v8 = v7;
  objc_msgSend(v7, "setRequiresSecureCoding:", 1);
  objc_msgSend(v8, "setDecodingFailurePolicy:", 1);
  v9 = (void *)objc_msgSend(v8, "decodeTopLevelObjectOfClasses:forKey:error:", classes, CFSTR("root"), error);

  return v9;
}

- (void)dealloc
{
  __CFData *data;
  __CFArray *containers;
  CFIndex i;
  CFIndex Count;
  const void *ValueAtIndex;
  const void *v8;
  CFTypeID v9;
  unint64_t v10;
  __CFArray *objects;
  __CFDictionary *objRefMap;
  __CFDictionary *replacementMap;
  __CFDictionary *nameClassMap;
  __CFDictionary *tmpRefObjMap;
  __CFDictionary *refObjMap;
  $02305E47CAA2D936086EFC4D3EC0EBCE *offsetData;
  __CFDictionary *offsetObjMap;
  objc_super v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  data = self->_data;
  if (data)
    CFRelease(data);
  containers = self->_containers;
  if (containers)
  {
    for (i = CFArrayGetCount(containers); i >= 1; i = CFArrayGetCount(self->_containers))
    {
      if (!CFArrayGetValueAtIndex(self->_containers, i - 1))
        break;
      Count = CFArrayGetCount(self->_containers);
      ValueAtIndex = CFArrayGetValueAtIndex(self->_containers, Count - 1);
      CFArrayRemoveValueAtIndex(self->_containers, Count - 1);
      CFRelease(ValueAtIndex);
      if (Count > 1)
      {
        v8 = CFArrayGetValueAtIndex(self->_containers, Count - 2);
        v9 = CFGetTypeID(v8);
        v10 = atomic_load(&self->_flags);
        atomic_store(v10 & 0xFFFFFFFFFFFFFFFELL | (v9 == 19), &self->_flags);
      }
    }
    CFRelease(self->_containers);
  }
  objects = self->_objects;
  if (objects)
    CFRelease(objects);
  objRefMap = self->_objRefMap;
  if (objRefMap)
    CFRelease(objRefMap);
  replacementMap = self->_replacementMap;
  if (replacementMap)
    CFRelease(replacementMap);
  nameClassMap = self->_nameClassMap;
  if (nameClassMap)
    CFRelease(nameClassMap);
  tmpRefObjMap = self->_tmpRefObjMap;
  if (tmpRefObjMap)
    CFRelease(tmpRefObjMap);
  refObjMap = self->_refObjMap;
  if (refObjMap)
    CFRelease(refObjMap);
  offsetData = self->_offsetData;
  if (offsetData)
    CFAllocatorDeallocate((CFAllocatorRef)*MEMORY[0x1E0C9AE30], offsetData);

  offsetObjMap = self->_offsetObjMap;
  if (offsetObjMap)
    CFRelease(offsetObjMap);
  v19.receiver = self;
  v19.super_class = (Class)NSKeyedUnarchiver;
  -[NSKeyedUnarchiver dealloc](&v19, sel_dealloc);
}

- (id)_initForReadingFromData:(id)a3 error:(id *)a4 throwLegacyExceptions:(BOOL)a5
{
  NSKeyedUnarchiver *v6;
  unint64_t *p_flags;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  id v15;
  NSString *v16;
  const __CFAllocator *v17;
  $02305E47CAA2D936086EFC4D3EC0EBCE *v18;
  __int128 v19;
  $02305E47CAA2D936086EFC4D3EC0EBCE *offsetData;
  const __CFDictionary *v21;
  CFTypeID TypeID;
  void *Value;
  CFTypeID v24;
  const void *v25;
  const void *v26;
  const void *v27;
  CFTypeID v28;
  unint64_t v29;
  uint64_t v30;
  NSString *v31;
  NSString *v32;
  NSString *v34;
  __CFDictionary *offsetObjMap;
  __CFDictionary *v36;
  __CFDictionary *v37;
  CFTypeID v38;
  _BOOL4 v39;
  unsigned int valuePtr;
  id v43;
  __int128 v44;
  __int128 v45;
  uint64_t v46;
  const __CFString *v47;
  NSString *v48;
  const __CFString *v49;
  _QWORD v50[3];

  v39 = a5;
  v6 = self;
  v50[1] = *MEMORY[0x1E0C80C00];
  v43 = 0;
  valuePtr = -1;
  v44 = 0u;
  v45 = 0u;
  self->_data = 0;
  p_flags = &self->_flags;
  atomic_store(0x10uLL, &self->_flags);
  self->_delegate = 0;
  self->_containers = 0;
  self->_objects = 0;
  self->_objRefMap = 0;
  self->_replacementMap = 0;
  self->_nameClassMap = 0;
  self->_tmpRefObjMap = 0;
  self->_refObjMap = 0;
  self->_genericKey = 0;
  self->_helper = objc_alloc_init(_NSKeyedUnarchiverHelper);
  v6->_offsetObjMap = 0;
  v8 = atomic_load(p_flags);
  atomic_store(v8 | 4, p_flags);
  v9 = atomic_load(p_flags);
  atomic_store(v9 & 0xFFFFFFFFFFFFFFEFLL, p_flags);
  if (!a3)
  {
    if (a4)
    {
      v16 = -[NSString initWithFormat:]([NSString alloc], "initWithFormat:", CFSTR("%@: data is NULL"), _NSMethodExceptionProem((objc_class *)v6, a2));
      v49 = CFSTR("NSDebugDescription");
      v50[0] = v16;
      *a4 = +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("NSCocoaErrorDomain"), 4864, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v50, &v49, 1));

    }
    goto LABEL_62;
  }
  v10 = objc_msgSend(a3, "bytes");
  v11 = objc_msgSend(a3, "length");
  v12 = v11;
  if (!v11 || !v10)
  {
    if (v39)
      -[NSKeyedUnarchiver setDecodingFailurePolicy:](v6, "setDecodingFailurePolicy:", 0);
    -[NSCoder __failWithExceptionName:errorCode:format:](v6, "__failWithExceptionName:errorCode:format:", *MEMORY[0x1E0C99778], 4864, CFSTR("%@: data is empty; did you forget to send -finishEncoding to the NSKeyedArchiver?"),
      _NSMethodExceptionProem((objc_class *)v6, a2));
    if (!a4)
      goto LABEL_62;
    goto LABEL_18;
  }
  if (v11 >= 0xD)
  {
    if (*(_BYTE *)(v10 + 1) != 11)
      goto LABEL_26;
    if ((*(_QWORD *)(v10 + 2) != 0x7274736465707974 || *(_QWORD *)(v10 + 5) != 0x6D61657274736465)
      && (*(_QWORD *)(v10 + 2) != 0x79746D6165727473 || *(_QWORD *)(v10 + 5) != 0x64657079746D6165))
    {
      goto LABEL_26;
    }
    if (v39)
      -[NSKeyedUnarchiver setDecodingFailurePolicy:](v6, "setDecodingFailurePolicy:", 0);
    -[NSCoder __failWithExceptionName:errorCode:format:](v6, "__failWithExceptionName:errorCode:format:", *MEMORY[0x1E0C99778], 4864, CFSTR("%@: non-keyed archive cannot be decoded by NSKeyedUnarchiver"), _NSMethodExceptionProem((objc_class *)v6, a2));
    if (!a4)
      goto LABEL_62;
LABEL_18:
    v15 = -[NSKeyedUnarchiver error](v6, "error");
LABEL_61:
    *a4 = v15;
    goto LABEL_62;
  }
  if (v11 < 8)
    goto LABEL_49;
LABEL_26:
  if (!__CFBinaryPlistGetTopLevelInfo()
    || (offsetObjMap = v6->_offsetObjMap, !__CFBinaryPlistGetOffsetForValueFromDictionary3())
    || !__CFBinaryPlistCreateObject()
    || !v43
    || (v38 = CFGetTypeID(v43), v38 != CFNumberGetTypeID())
    || !CFNumberGetValue((CFNumberRef)v43, kCFNumberSInt32Type, &valuePtr)
    || valuePtr != 100000)
  {
    if (v12 >= 0x78)
    {
      v21 = (const __CFDictionary *)CFPropertyListCreateWithData((CFAllocatorRef)*MEMORY[0x1E0C9AE30], (CFDataRef)a3, 1uLL, 0, 0);
      if (v21)
      {
        TypeID = CFDictionaryGetTypeID();
        if (TypeID == CFGetTypeID(v21))
        {
          Value = (void *)CFDictionaryGetValue(v21, CFSTR("$version"));
          v43 = Value;
          if (Value)
          {
            v24 = CFGetTypeID(Value);
            if (v24 == CFNumberGetTypeID()
              && CFNumberGetValue((CFNumberRef)v43, kCFNumberSInt32Type, &valuePtr)
              && valuePtr == 100000)
            {
              v25 = CFDictionaryGetValue(v21, CFSTR("$top"));
              v26 = CFDictionaryGetValue(v21, CFSTR("$objects"));
              if (v25)
              {
                v27 = v26;
                if (v26)
                {
                  if (CFGetTypeID(v26) == 19)
                  {
                    v6->_containers = CFArrayCreateMutable(0, 0, 0);
                    CFRetain(v25);
                    CFArrayAppendValue(v6->_containers, v25);
                    v28 = CFGetTypeID(v25);
                    v29 = atomic_load(&v6->_flags);
                    atomic_store(v29 & 0xFFFFFFFFFFFFFFFELL | (v28 == 19), &v6->_flags);
                    v6->_objects = (__CFArray *)CFRetain(v27);
                    -[NSKeyedUnarchiver _initWithStream:data:topDict:](v6, "_initWithStream:data:topDict:", 0, 0, v21);
                    CFRelease(v21);
                    return v6;
                  }
                }
              }
              CFRelease(v21);
              if (v39)
                -[NSKeyedUnarchiver setDecodingFailurePolicy:](v6, "setDecodingFailurePolicy:", 0);
              -[NSCoder __failWithExceptionName:errorCode:format:](v6, "__failWithExceptionName:errorCode:format:", CFSTR("NSArchiverArchiveInconsistency"), 4864, CFSTR("%@: data is corrupt or archive is missing key components or object is too large to decode"), _NSMethodExceptionProem((objc_class *)v6, a2));
              if (!a4)
              {
LABEL_62:

                return 0;
              }
              goto LABEL_60;
            }
          }
        }
        else
        {
          v43 = 0;
        }
        CFRelease(v21);
        if (v39)
          -[NSKeyedUnarchiver setDecodingFailurePolicy:](v6, "setDecodingFailurePolicy:", 0);
        v32 = _NSMethodExceptionProem((objc_class *)v6, a2);
        -[NSCoder __failWithExceptionName:errorCode:format:](v6, "__failWithExceptionName:errorCode:format:", *MEMORY[0x1E0C99778], 4864, CFSTR("%@: incomprehensible archive version (%d)"), v32, valuePtr);
        if (!a4)
          goto LABEL_62;
LABEL_60:
        v15 = -[NSKeyedUnarchiver error](v6, "error");
        goto LABEL_61;
      }
      v43 = 0;
    }
LABEL_49:
    v46 = 0;
    if (v12 >= 8)
      v30 = 8;
    else
      v30 = v12;
    objc_msgSend(a3, "getBytes:range:", &v46, 0, v30, offsetObjMap);
    if (v39)
      -[NSKeyedUnarchiver setDecodingFailurePolicy:](v6, "setDecodingFailurePolicy:", 0);
    v31 = _NSMethodExceptionProem((objc_class *)v6, a2);
    -[NSCoder __failWithExceptionName:errorCode:format:](v6, "__failWithExceptionName:errorCode:format:", *MEMORY[0x1E0C99778], 4864, CFSTR("%@: incomprehensible archive (0x%x, 0x%x, 0x%x, 0x%x, 0x%x, 0x%x, 0x%x, 0x%x)"), v31, (char)v46, SBYTE1(v46), SBYTE2(v46), SBYTE3(v46), SBYTE4(v46), SBYTE5(v46), SBYTE6(v46), SHIBYTE(v46));
    if (!a4)
      goto LABEL_62;
    goto LABEL_60;
  }
  v36 = v6->_offsetObjMap;
  if ((__CFBinaryPlistGetOffsetForValueFromDictionary3() & 1) == 0)
  {
    if (v39)
      -[NSKeyedUnarchiver setDecodingFailurePolicy:](v6, "setDecodingFailurePolicy:", 0, v36);
    -[NSCoder __failWithExceptionName:errorCode:format:](v6, "__failWithExceptionName:errorCode:format:", CFSTR("NSArchiverArchiveInconsistency"), 4864, CFSTR("%@: data is corrupt or archive is missing key components or object is too large to decode"), _NSMethodExceptionProem((objc_class *)v6, a2));
    if (!a4)
      goto LABEL_62;
    goto LABEL_60;
  }
  v37 = v6->_offsetObjMap;
  if ((__CFBinaryPlistGetOffsetForValueFromDictionary3() & 1) == 0)
  {
    if (v39)
      -[NSKeyedUnarchiver setDecodingFailurePolicy:](v6, "setDecodingFailurePolicy:", 0, v37);
    -[NSCoder __failWithExceptionName:errorCode:format:](v6, "__failWithExceptionName:errorCode:format:", CFSTR("NSArchiverArchiveInconsistency"), 4864, CFSTR("%@: data is corrupt or archive is missing key components or object is too large to decode"), _NSMethodExceptionProem((objc_class *)v6, a2));
    if (!a4)
      goto LABEL_62;
    goto LABEL_60;
  }
  if ((*(_BYTE *)v10 & 0xF0) != 0xA0)
  {
    if (a4)
    {
      v34 = -[NSString initWithFormat:]([NSString alloc], "initWithFormat:", CFSTR("%@: data is corrupt or archive is missing key components or object is too large to decode"), _NSMethodExceptionProem((objc_class *)v6, a2));
      v47 = CFSTR("NSDebugDescription");
      v48 = v34;
      *a4 = +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("NSCocoaErrorDomain"), 4864, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v48, &v47, 1));

    }
    goto LABEL_62;
  }
  v17 = (const __CFAllocator *)*MEMORY[0x1E0C9AE30];
  v18 = ($02305E47CAA2D936086EFC4D3EC0EBCE *)MEMORY[0x186DA6248](*MEMORY[0x1E0C9AE30], 48, 0x1000040EED21634, 0);
  v6->_offsetData = v18;
  v19 = v45;
  *(_OWORD *)v18->var0.var0 = v44;
  *(_OWORD *)&v18->var0.var5 = v19;
  offsetData = v6->_offsetData;
  offsetData->var1 = 0;
  offsetData->var2 = 0;
  v6->_data = (__CFData *)CFRetain(a3);
  v6->_bytes = (const char *)v10;
  v6->_len = v12;
  v6->_objRefMap = CFDictionaryCreateMutable(0, 0, 0, 0);
  v6->_tmpRefObjMap = CFDictionaryCreateMutable(v17, 0, 0, 0);
  v6->_refObjMap = CFDictionaryCreateMutable(0, 0, 0, MEMORY[0x1E0C9B3A0]);
  _CFDictionarySetCapacity();
  _CFDictionarySetCapacity();
  v6->_offsetObjMap = CFDictionaryCreateMutable(0, 0, 0, MEMORY[0x1E0C9B3A0]);
  return v6;
}

- (NSKeyedUnarchiver)initForReadingFromData:(NSData *)data error:(NSError *)error
{
  return (NSKeyedUnarchiver *)-[NSKeyedUnarchiver _initForReadingFromData:error:throwLegacyExceptions:](self, "_initForReadingFromData:error:throwLegacyExceptions:", data, error, 0);
}

- (void)setRequiresSecureCoding:(BOOL)requiresSecureCoding
{
  char v3;
  unint64_t v4;
  unint64_t v5;
  uint64_t v6;
  void *v7;

  v3 = atomic_load(&self->_flags);
  if ((v3 & 8) != 0)
  {
    v7 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", CFSTR("NSInvalidUnarchiveOperationException"), +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: unarchiver has started; cannot change secure coding state"),
                     _NSMethodExceptionProem((objc_class *)self, a2)),
                   0);
    objc_exception_throw(v7);
  }
  v4 = atomic_load(&self->_flags);
  v5 = v4 & 0xFFFFFFFFFFFFFFFBLL;
  v6 = 4;
  if (!requiresSecureCoding)
    v6 = 0;
  atomic_store(v5 | v6, &self->_flags);
}

- (void)setDecodingFailurePolicy:(NSDecodingFailurePolicy)decodingFailurePolicy
{
  char v3;
  unint64_t v4;
  NSString *v5;
  uint64_t v6;

  if ((unint64_t)decodingFailurePolicy >= 2)
  {
    v5 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: invalid decoding error policy %lu"), _NSMethodExceptionProem((objc_class *)self, a2), decodingFailurePolicy);
    goto LABEL_6;
  }
  v3 = atomic_load(&self->_flags);
  if ((v3 & 8) != 0)
  {
    v5 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: unarchiver has started; cannot change decoding error policy"),
           _NSMethodExceptionProem((objc_class *)self, a2),
           v6);
LABEL_6:
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", CFSTR("NSInvalidUnarchiveOperationException"), v5, 0));
  }
  v4 = atomic_load(&self->_flags);
  atomic_store(v4 & 0xFFFFFFFFFFFFFFEFLL | (16 * (decodingFailurePolicy == NSDecodingFailurePolicyRaiseException)), &self->_flags);
}

- (BOOL)decodeBoolForKey:(NSString *)key
{
  char v4;
  __CFString *v6;
  void *v7;
  BOOL v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = atomic_load(&self->_flags);
  if ((v4 & 2) != 0)
  {
    v7 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", CFSTR("NSInvalidUnarchiveOperationException"), +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: unarchive already finished, %@"), _NSMethodExceptionProem((objc_class *)self, a2), CFSTR("cannot decode anything more")), 0);
    objc_exception_throw(v7);
  }
  if (self->_helper->_decodeError)
    return 0;
  v6 = (__CFString *)key;
  if (key && CFStringGetLength((CFStringRef)key) >= 1 && CFStringGetCharacterAtIndex(v6, 0) == 36)
    v6 = (__CFString *)-[__CFString substringFromIndex:](v6, "substringFromIndex:", 1);
  v8 = 0;
  _decodeBool((uint64_t)self, v6, &v8);
  return v8;
}

+ (id)unarchiveTopLevelObjectWithData:(NSData *)data error:(NSError *)error
{
  void *v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  id v15[2];

  v15[1] = *(id *)MEMORY[0x1E0C80C00];
  v15[0] = 0;
  v7 = (void *)MEMORY[0x186DA8F78](a1, a2);
  v8 = (void *)objc_msgSend(objc_alloc((Class)a1), "initForReadingWithData:", data);
  v9 = (id)objc_msgSend(v8, "decodeTopLevelObjectForKey:error:", CFSTR("root"), v15);
  v10 = v9;
  if (!error || v9)
  {
    objc_msgSend(v8, "finishDecoding");

    objc_autoreleasePoolPop(v7);
  }
  else
  {
    v11 = v15[0];
    objc_msgSend(v8, "finishDecoding");

    objc_autoreleasePoolPop(v7);
    v12 = v15[0];
    *error = (NSError *)v15[0];
    v13 = v12;
  }
  return v10;
}

+ (id)unarchiveObjectWithFile:(NSString *)path
{
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;

  if (!path)
    return 0;
  v5 = (void *)MEMORY[0x186DA8F78](a1, a2);
  v6 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0C99D50]), "initWithContentsOfFile:options:error:", path, 0, 0);
  if (v6)
  {
    v7 = (void *)v6;
    v8 = (void *)objc_msgSend(objc_alloc((Class)a1), "initForReadingWithData:", v6);
    v9 = (id)objc_msgSend(v8, "decodeObjectForKey:", CFSTR("root"));
    objc_msgSend(v8, "finishDecoding");

  }
  else
  {
    v9 = 0;
  }
  objc_autoreleasePoolPop(v5);
  return v9;
}

+ (id)unarchiveObjectWithData:(NSData *)data
{
  void *v5;
  void *v6;
  id v7;

  v5 = (void *)MEMORY[0x186DA8F78](a1, a2);
  v6 = (void *)objc_msgSend(objc_alloc((Class)a1), "initForReadingWithData:", data);
  v7 = (id)objc_msgSend(v6, "decodeObjectForKey:", CFSTR("root"));
  objc_msgSend(v6, "finishDecoding");

  objc_autoreleasePoolPop(v5);
  return v7;
}

- (void)finishDecoding
{
  char v2;
  unint64_t v4;

  v2 = atomic_load(&self->_flags);
  if ((v2 & 2) == 0)
  {
    if (self->_delegate && (objc_opt_respondsToSelector() & 1) != 0)
      -[NSKeyedUnarchiverDelegate unarchiverWillFinish:](self->_delegate, "unarchiverWillFinish:", self);
    v4 = atomic_load(&self->_flags);
    atomic_store(v4 | 2, &self->_flags);
    if (self->_delegate)
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        -[NSKeyedUnarchiverDelegate unarchiverDidFinish:](self->_delegate, "unarchiverDidFinish:", self);
    }
  }
}

- (NSKeyedUnarchiver)initForReadingWithData:(NSData *)data
{
  NSKeyedUnarchiver *v3;
  NSKeyedUnarchiver *v4;
  unint64_t v5;
  char v6;
  int v7;

  v3 = -[NSKeyedUnarchiver _initForReadingFromData:error:throwLegacyExceptions:](self, "_initForReadingFromData:error:throwLegacyExceptions:", data, 0, dyld_program_sdk_at_least() ^ 1);
  v4 = v3;
  if (v3)
  {
    -[NSKeyedUnarchiver setDecodingFailurePolicy:](v3, "setDecodingFailurePolicy:", 0);
    v5 = atomic_load(&v4->_flags);
    atomic_store(v5 & 0xFFFFFFFFFFFFFFFBLL, &v4->_flags);
    if (_NSCoderGetTrustRestrictions() != 2)
    {
      v6 = _os_feature_enabled_impl();
      v7 = _os_feature_enabled_impl();
      if ((v6 & 1) != 0)
      {
        -[NSCoder __failWithExceptionName:errorCode:format:](v4, "__failWithExceptionName:errorCode:format:", CFSTR("NSInvalidUnarchiveOperationException"), 4864, CFSTR("%@: NSKeyedUnarchiver was used with secure coding disabled."), _NSMethodExceptionProem((objc_class *)v4, sel_initForReadingWithData_));

        return 0;
      }
      else if (v7 && initForReadingWithData__onceToken != -1)
      {
        dispatch_once(&initForReadingWithData__onceToken, &__block_literal_global_21);
      }
    }
  }
  return v4;
}

- (BOOL)_validateAllowedClassesContainsClassOfReference:(id)a3 forKey:(id)a4
{
  id v7;
  unint64_t v8;
  char v9;
  char v10;
  uint64_t v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v12[0] = 0;
  v7 = -[NSKeyedUnarchiver allowedClasses](self, "allowedClasses");
  v8 = atomic_load(&self->_flags);
  v9 = atomic_load(&self->_flags);
  v10 = -[NSCoder _walkAllowedClassListValidatingInstance:forKey:allowedClasses:strictModeEnabled:alwaysEnforceExplicitSubclasses:specialCaseObject:invalidElementClass:](self, a3, (uint64_t)a4, v7, (v8 >> 5) & 1, (v9 & 0x40) != 0, 0, v12);
  if ((v10 & 1) == 0 && !self->_helper->_decodeError)
  {
    if (v12[0])
      -[NSCoder __failWithUnexpectedElementClass:forContainerKey:allowedClasses:]((NSString *)self, v12[0], (const __CFString *)a4, v7);
    else
      -[NSCoder __failWithUnexpectedClass:forKey:allowedClasses:]((NSString *)self, objc_msgSend(a3, "classForCoder"), (const __CFString *)a4, v7);
  }
  return v10;
}

- (unint64_t)_decodeCollectionOfClass:(void *)a3 allowedClasses:(__CFString *)a4 forKey:
{
  unint64_t *v4;
  char v5;
  unint64_t v7;
  uint64_t Length;
  unint64_t v9;
  void *v10;
  void *v11;
  unint64_t v12;
  uint64_t v13;
  id v14[2];

  v14[1] = *(id *)MEMORY[0x1E0C80C00];
  if (result)
  {
    v4 = result;
    if (*(_QWORD *)(result[15] + 32))
    {
      return 0;
    }
    else
    {
      v5 = atomic_load(result + 2);
      if ((v5 & 4) == 0)
      {
        v11 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", CFSTR("NSInvalidUnarchiveOperationException"), +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: This method only supports secure coding."), _NSMethodExceptionProem((objc_class *)result, sel__decodeCollectionOfClass_allowedClasses_forKey_)), 0);
        objc_exception_throw(v11);
      }
      v7 = result[15];
      Length = objc_msgSend(*(id *)(v7 + 24), "addObject:", objc_msgSend(a3, "setByAddingObject:", a2));
      *(_WORD *)(v7 + 40) = 1;
      if (a4)
      {
        Length = CFStringGetLength(a4);
        if (Length >= 1)
        {
          Length = CFStringGetCharacterAtIndex(a4, 0);
          if ((_DWORD)Length == 36)
          {
            Length = -[__CFString substringFromIndex:](a4, "substringFromIndex:", 1);
            a4 = (__CFString *)Length;
          }
        }
      }
      v14[0] = 0;
      v9 = atomic_load(v4 + 2);
      atomic_store(v9 | 8, v4 + 2);
      v10 = (void *)MEMORY[0x186DA8F78](Length);
      if (v4[10])
      {
        _decodeObjectXML((uint64_t)v4, a4, v14);
      }
      else
      {
        v12 = 0;
        v13 = 0;
        if (_decodeOffsetAndRef((objc_class *)v4, (uint64_t)a4, &v13, &v12))
          _decodeObjectBinary((uint64_t)v4, v12, (uint64_t)a4, (CFTypeRef *)v14);
      }
      objc_autoreleasePoolPop(v10);
      *(_WORD *)(v7 + 40) = 0;
      objc_msgSend(*(id *)(v7 + 24), "removeLastObject");
      return (unint64_t *)v14[0];
    }
  }
  return result;
}

- (id)decodeArrayOfObjectsOfClasses:(id)a3 forKey:(id)a4
{
  NSString *v7;

  v7 = _NSMethodExceptionProem((objc_class *)self, a2);
  if (-[NSCoder _validateDecodeCollectionAllowedClassesRequirementsWithClasses:forMethodExceptionProem:](self, a3, (uint64_t)v7))
  {
    return -[NSKeyedUnarchiver _decodeCollectionOfClass:allowedClasses:forKey:]((unint64_t *)self, MEMORY[0x1E0C99D20], a3, (__CFString *)a4);
  }
  else
  {
    return 0;
  }
}

- (id)decodeDictionaryWithKeysOfClasses:(id)a3 objectsOfClasses:(id)a4 forKey:(id)a5
{
  void *v8;
  NSString *v9;

  v8 = (void *)objc_msgSend(a3, "setByAddingObjectsFromSet:", a4);
  v9 = _NSMethodExceptionProem((objc_class *)self, a2);
  if (-[NSCoder _validateDecodeCollectionAllowedClassesRequirementsWithClasses:forMethodExceptionProem:](self, v8, (uint64_t)v9))
  {
    return -[NSKeyedUnarchiver _decodeCollectionOfClass:allowedClasses:forKey:]((unint64_t *)self, MEMORY[0x1E0C99D80], v8, (__CFString *)a5);
  }
  else
  {
    return 0;
  }
}

- (void)setDelegate:(id)delegate
{
  self->_delegate = (NSKeyedUnarchiverDelegate *)delegate;
}

- (void)decodeValueOfObjCType:(const char *)a3 at:(void *)a4
{
  NSString *v8;
  char v9;
  unint64_t v10;
  int v11;
  unsigned int v12;
  const char *v13;
  unsigned int v14;
  uint64_t v15;
  unsigned int v16;
  NSString *v17;
  void *v18;
  const __CFString *v19;
  NSString *v20;

  if (_warnArchiverCompat == 1)
  {
    v8 = _NSMethodExceptionProem((objc_class *)self, a2);
    NSLog((NSString *)CFSTR("%@: warning: old archiving compatibility method called"), v8);
  }
  v9 = atomic_load(&self->_flags);
  if ((v9 & 2) != 0)
  {
    v17 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: unarchive already finished, %@"), _NSMethodExceptionProem((objc_class *)self, a2), CFSTR("cannot decode anything more"));
    v18 = (void *)MEMORY[0x1E0C99DA0];
    v19 = CFSTR("NSInvalidUnarchiveOperationException");
    goto LABEL_23;
  }
  if (!self->_helper->_decodeError)
  {
    v10 = atomic_load(&self->_flags);
    atomic_store(v10 | 8, &self->_flags);
    if (!a3 || !a4)
    {
      v20 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: null type or address pointer"), _NSMethodExceptionProem((objc_class *)self, a2));
LABEL_22:
      v17 = v20;
      v18 = (void *)MEMORY[0x1E0C99DA0];
      v19 = (const __CFString *)*MEMORY[0x1E0C99778];
LABEL_23:
      objc_exception_throw((id)objc_msgSend(v18, "exceptionWithName:reason:userInfo:", v19, v17, 0));
    }
    v11 = *(unsigned __int8 *)a3;
    if (v11 != 91)
    {
      if (v11 != 123)
      {
        _compatDecodeValueOfObjCType((uint64_t)self, (NSString *)(char)v11, (BOOL *)a4, a2);
        return;
      }
      v20 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: this unarchiver cannot decode structs"), _NSMethodExceptionProem((objc_class *)self, a2));
      goto LABEL_22;
    }
    v14 = *((unsigned __int8 *)a3 + 1);
    v13 = a3 + 1;
    v12 = v14;
    if (v14 - 48 > 9)
      goto LABEL_16;
    v15 = 0;
    do
    {
      v15 = 10 * v15 + v12 - 48;
      v16 = *(unsigned __int8 *)++v13;
      v12 = v16;
    }
    while (v16 - 48 < 0xA);
    if (v15)
    {
      if (v12 == 93)
        -[NSCoder __failWithExceptionName:errorCode:format:](self, "__failWithExceptionName:errorCode:format:", *MEMORY[0x1E0C99778], 4864, CFSTR("%@: array type is missing"), _NSMethodExceptionProem((objc_class *)self, a2));
      else
        -[NSKeyedUnarchiver decodeArrayOfObjCType:count:at:](self, "decodeArrayOfObjCType:count:at:", v13);
    }
    else
    {
LABEL_16:
      -[NSCoder __failWithExceptionName:errorCode:format:](self, "__failWithExceptionName:errorCode:format:", *MEMORY[0x1E0C99778], 4864, CFSTR("%@: array count is missing or zero"), _NSMethodExceptionProem((objc_class *)self, a2));
    }
  }
}

- (id)_decodePropertyListForKey:(id)a3
{
  char v5;
  __CFString *v6;
  unint64_t v7;
  __CFArray *containers;
  CFIndex Count;
  const __CFArray *ValueAtIndex;
  void *Value;
  id v12;
  id v13;
  void *v15;

  v5 = atomic_load(&self->_flags);
  if ((v5 & 2) != 0)
  {
    v15 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", CFSTR("NSInvalidUnarchiveOperationException"), +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: unarchive already finished, %@"), _NSMethodExceptionProem((objc_class *)self, a2), CFSTR("cannot decode anything more")), 0);
    objc_exception_throw(v15);
  }
  v6 = (__CFString *)a3;
  v7 = atomic_load(&self->_flags);
  atomic_store(v7 | 8, &self->_flags);
  if (a3 && CFStringGetLength((CFStringRef)a3) >= 1 && CFStringGetCharacterAtIndex(v6, 0) == 36)
    v6 = (__CFString *)-[__CFString substringFromIndex:](v6, "substringFromIndex:", 1);
  containers = self->_containers;
  if (containers)
  {
    Count = CFArrayGetCount(containers);
    ValueAtIndex = (const __CFArray *)CFArrayGetValueAtIndex(self->_containers, Count - 1);
    if (CFGetTypeID(ValueAtIndex) == 19)
    {
      Value = (void *)CFArrayGetValueAtIndex(ValueAtIndex, 0);
      v12 = Value;
      CFArrayRemoveValueAtIndex(ValueAtIndex, 0);
    }
    else
    {
      Value = (void *)CFDictionaryGetValue(ValueAtIndex, v6);
      v13 = Value;
    }
  }
  else if (__CFBinaryPlistGetOffsetForValueFromDictionary3()
         && !__CFBinaryPlistCreateObject())
  {
    -[NSCoder __failWithExceptionName:errorCode:format:](self, "__failWithExceptionName:errorCode:format:", CFSTR("NSInvalidUnarchiveOperationException"), 4864, CFSTR("%@: data is corrupt or object is too large to decode"), _NSMethodExceptionProem((objc_class *)self, a2));
    return 0;
  }
  else
  {
    return 0;
  }
  return Value;
}

- (void)_allowDecodingCyclesInSecureMode
{
  unint64_t *p_flags;
  unint64_t v3;

  p_flags = &self->_flags;
  do
    v3 = __ldaxr(p_flags);
  while (__stlxr(v3 | 0x100, p_flags));
}

- (void)setClass:(Class)cls forClassName:(NSString *)codedName
{
  __CFDictionary *nameClassMap;

  nameClassMap = self->_nameClassMap;
  if (!nameClassMap)
  {
    nameClassMap = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, MEMORY[0x1E0C9B390], 0);
    self->_nameClassMap = nameClassMap;
  }
  if (cls)
    CFDictionarySetValue(nameClassMap, codedName, cls);
  else
    CFDictionaryRemoveValue(nameClassMap, codedName);
}

+ (void)setClass:(Class)cls forClassName:(NSString *)codedName
{
  __CFDictionary *Mutable;

  os_unfair_lock_lock(&stru_1ECD09674);
  Mutable = (__CFDictionary *)qword_1ECD09680;
  if (!qword_1ECD09680)
  {
    Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, MEMORY[0x1E0C9B390], 0);
    qword_1ECD09680 = (uint64_t)Mutable;
  }
  if (cls)
    CFDictionarySetValue(Mutable, codedName, cls);
  else
    CFDictionaryRemoveValue(Mutable, codedName);
  os_unfair_lock_unlock(&stru_1ECD09674);
}

+ (NSDictionary)unarchivedDictionaryWithKeysOfClass:(Class)keyCls objectsOfClass:(Class)valueCls fromData:(NSData *)data error:(NSError *)error
{
  void *v9;
  void *v10;
  NSDictionary *v11;
  Class v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v13 = valueCls;
  v14[0] = keyCls;
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:count:", v14, 1);
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:count:", &v13, 1);
  v11 = (NSDictionary *)objc_msgSend(a1, "unarchivedDictionaryWithKeysOfClasses:objectsOfClasses:fromData:error:", v9, v10, data, error);

  return v11;
}

+ (NSDictionary)unarchivedDictionaryWithKeysOfClasses:(NSSet *)keyClasses objectsOfClasses:(NSSet *)valueClasses fromData:(NSData *)data error:(NSError *)error
{
  void *v9;
  void *v10;
  NSDictionary *v11;
  _QWORD v13[8];

  v13[7] = *MEMORY[0x1E0C80C00];
  v9 = (void *)objc_msgSend(objc_alloc((Class)a1), "initForReadingFromData:error:", data, error);
  if (!v9)
    return 0;
  v10 = v9;
  objc_msgSend(v9, "setRequiresSecureCoding:", 1);
  objc_msgSend(v10, "setDecodingFailurePolicy:", 1);
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __91__NSKeyedUnarchiver_unarchivedDictionaryWithKeysOfClasses_objectsOfClasses_fromData_error___block_invoke;
  v13[3] = &unk_1E0F4F2E0;
  v13[4] = v10;
  v13[5] = keyClasses;
  v13[6] = valueClasses;
  v11 = (NSDictionary *)-[NSCoder __tryDecodeObjectForKey:error:decodeBlock:](v10, (uint64_t)CFSTR("root"), error, (uint64_t)v13);

  return v11;
}

+ (void)initialize
{
  if (NSKeyedUnarchiver == a1)
  {
    if (getenv("NSWarnAboutOldStyleArchiverMethods"))
      _warnArchiverCompat = 1;
    +[NSKeyedUnarchiver setClass:forClassName:](NSKeyedUnarchiver, "setClass:forClassName:", objc_lookUpClass("__NSLocalTimeZone"), CFSTR("NSLocalTimeZone"));
  }
}

- (void)_enableStrictSecureDecodingMode
{
  unint64_t *p_flags;
  unint64_t v4;

  -[NSKeyedUnarchiver setRequiresSecureCoding:](self, "setRequiresSecureCoding:", 1);
  p_flags = &self->_flags;
  do
    v4 = __ldaxr(p_flags);
  while (__stlxr(v4 | 0x20, p_flags));
}

+ (id)_strictlyUnarchivedObjectOfClasses:(id)a3 fromData:(id)a4 error:(id *)a5
{
  unint64_t *v7;
  unint64_t *v8;
  unint64_t *v9;
  unint64_t v10;
  void *v11;

  v7 = (unint64_t *)objc_msgSend(objc_alloc((Class)a1), "initForReadingFromData:error:", a4, a5);
  if (!v7)
    return 0;
  v8 = v7;
  objc_msgSend(v7, "setRequiresSecureCoding:", 1);
  objc_msgSend(v8, "setDecodingFailurePolicy:", 1);
  v9 = v8 + 2;
  do
    v10 = __ldaxr(v9);
  while (__stlxr(v10 | 0x20, v9));
  v11 = (void *)objc_msgSend(v8, "decodeTopLevelObjectOfClasses:forKey:error:", a3, CFSTR("root"), a5);

  return v11;
}

+ (NSArray)unarchivedArrayOfObjectsOfClass:(Class)cls fromData:(NSData *)data error:(NSError *)error
{
  void *v8;
  NSArray *v9;
  Class v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v11 = cls;
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:count:", &v11, 1);
  v9 = (NSArray *)objc_msgSend(a1, "unarchivedArrayOfObjectsOfClasses:fromData:error:", v8, data, error, v11, v12);

  return v9;
}

+ (NSArray)unarchivedArrayOfObjectsOfClasses:(NSSet *)classes fromData:(NSData *)data error:(NSError *)error
{
  void *v7;
  void *v8;
  NSArray *v9;
  _QWORD v11[7];

  v11[6] = *MEMORY[0x1E0C80C00];
  v7 = (void *)objc_msgSend(objc_alloc((Class)a1), "initForReadingFromData:error:", data, error);
  if (!v7)
    return 0;
  v8 = v7;
  objc_msgSend(v7, "setRequiresSecureCoding:", 1);
  objc_msgSend(v8, "setDecodingFailurePolicy:", 1);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __70__NSKeyedUnarchiver_unarchivedArrayOfObjectsOfClasses_fromData_error___block_invoke;
  v11[3] = &unk_1E0F4F2B8;
  v11[4] = v8;
  v11[5] = classes;
  v9 = (NSArray *)-[NSCoder __tryDecodeObjectForKey:error:decodeBlock:](v8, (uint64_t)CFSTR("root"), error, (uint64_t)v11);

  return v9;
}

+ (int)_swift_checkClassAndWarnForKeyedArchiving:(Class)a3 operation:(int)a4
{
  unint64_t ObjCClassMetadata;

  ObjCClassMetadata = swift_getObjCClassMetadata();
  return specialized static NSKeyedUnarchiver.__swift_checkClassAndWarnForKeyedArchiving(_:operation:)(ObjCClassMetadata, a4);
}

- (id)_blobForCurrentObject
{
  __CFArray *containers;
  CFIndex Count;
  id result;
  int Object;

  containers = self->_containers;
  if (containers)
  {
    Count = CFArrayGetCount(containers);
    return (id)CFArrayGetValueAtIndex(self->_containers, Count - 1);
  }
  else
  {
    Object = __CFBinaryPlistCreateObject();
    result = 0;
    if (Object)
      return 0;
  }
  return result;
}

- (NSKeyedUnarchiver)init
{
  NSString *v3;

  v3 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: cannot use -init for initialization"), _NSMethodExceptionProem((objc_class *)self, a2));

  objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], v3, 0));
}

- (id)_initWithStream:(__CFReadStream *)a3 data:(id)a4 topDict:(__CFDictionary *)a5
{
  self->_objRefMap = CFDictionaryCreateMutable(0, 0, 0, 0);
  _CFDictionarySetCapacity();
  self->_tmpRefObjMap = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE30], 0, 0, 0);
  _CFDictionarySetCapacity();
  self->_refObjMap = CFDictionaryCreateMutable(0, 0, 0, MEMORY[0x1E0C9B3A0]);
  _CFDictionarySetCapacity();
  return self;
}

+ (id)_copyByArchiving:(id)a3
{
  unint64_t *v3;
  unint64_t *v4;
  unint64_t v5;
  id v6;

  v3 = (unint64_t *)objc_msgSend(objc_alloc((Class)a1), "initForReadingFromData:error:", +[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:](NSKeyedArchiver, "archivedDataWithRootObject:requiringSecureCoding:error:", a3, 0, 0), 0);
  if (!v3)
    return 0;
  v4 = v3;
  v5 = atomic_load(v3 + 2);
  atomic_store(v5 & 0xFFFFFFFFFFFFFFFBLL, v3 + 2);
  v6 = (id)objc_msgSend(v3, "decodeObjectForKey:", CFSTR("root"));

  return v6;
}

void __44__NSKeyedUnarchiver_initForReadingWithData___block_invoke()
{
  NSObject *v0;
  uint8_t v1[8];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v0 = _NSRuntimeIssuesLog();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_fault_impl(&dword_1817D9000, v0, OS_LOG_TYPE_FAULT, "NSKeyedUnarchiver was created with secure coding implicitly disabled. This simulated crash will soon turn into an actual crash. See rdar://104622435 for help.", v1, 2u);
  }
}

- (NSKeyedUnarchiver)initWithStream:(id)a3
{
  void *v3;
  const char *v4;
  const char *v5;
  objc_class *v6;
  void *v7;
  CFTypeID TypeID;
  int v9;
  const __CFAllocator *v10;
  int v11;
  char *v12;
  CFIndex v13;
  CFIndex v15;
  int v16;
  CFDataRef v17;
  NSKeyedUnarchiver *v18;
  objc_class *v20;
  NSString *v21;
  NSString *v22;
  objc_class *v23;
  _QWORD v24[5];
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  char v28;
  UInt8 buffer[8192];
  uint64_t v30;

  MEMORY[0x1E0C80A78](self);
  v5 = v4;
  v23 = v6;
  v30 = *MEMORY[0x1E0C80C00];
  if (!v3 || (v7 = v3, TypeID = CFReadStreamGetTypeID(), TypeID != CFGetTypeID(v7)))
  {
    v20 = v23;
    v21 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: stream argument is not a read stream"), _NSMethodExceptionProem(v23, v5));
    goto LABEL_27;
  }
  if ((unint64_t)(CFReadStreamGetStatus((CFReadStreamRef)v7) - 4) <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v20 = v23;
    v21 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: stream is not open"), _NSMethodExceptionProem(v23, v5));
LABEL_27:
    v22 = v21;

    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], v22, 0));
  }
  v9 = CFReadStreamRead((CFReadStreamRef)v7, buffer, 0x2000);
  v10 = (const __CFAllocator *)*MEMORY[0x1E0C9AE30];
  if (v9 < 1)
  {
    v15 = 0;
    v12 = 0;
  }
  else
  {
    v11 = 0;
    v12 = 0;
    LODWORD(v13) = 0;
    do
    {
      if ((v9 ^ 0x7FFFFFFF) < v11 || (int)v13 >= 0x40000000)
      {
        if (v12)
          CFAllocatorDeallocate(v10, v12);
LABEL_23:
        -[objc_class __failWithExceptionName:errorCode:format:](v23, "__failWithExceptionName:errorCode:format:", *MEMORY[0x1E0C99778], 4864, CFSTR("stream too big"));
        v12 = 0;
        v15 = 0;
        goto LABEL_24;
      }
      v15 = (v9 + v11);
      if ((int)v13 < (int)v15)
      {
        v13 = 2 * (int)v13 <= (int)v15 ? v15 : (2 * v13);
        v25 = 0;
        v26 = &v25;
        v27 = 0x2020000000;
        v28 = 0;
        v24[0] = MEMORY[0x1E0C809B0];
        v24[1] = 3221225472;
        v24[2] = ___NSConvertReadStreamToBytes_block_invoke;
        v24[3] = &unk_1E0F4F470;
        v24[4] = &v25;
        v12 = (char *)MEMORY[0x186DA80F0](v10, v12, v13, 3268606558, 0, v24);
        v16 = *((unsigned __int8 *)v26 + 24);
        _Block_object_dispose(&v25, 8);
        if (v16)
          goto LABEL_23;
      }
      memmove(&v12[v11], buffer, v9);
      v9 = CFReadStreamRead((CFReadStreamRef)v7, buffer, 0x2000);
      v11 = v15;
    }
    while (v9 >= 1);
    if (v12)
      goto LABEL_24;
  }
  -[objc_class __failWithExceptionName:errorCode:format:](v23, "__failWithExceptionName:errorCode:format:", *MEMORY[0x1E0C99778], 4864, CFSTR("stream has no or too few bytes (%lu)"), v15);
LABEL_24:
  v17 = CFDataCreateWithBytesNoCopy((CFAllocatorRef)*MEMORY[0x1E0C9AE00], (const UInt8 *)v12, v15, v10);
  v18 = (NSKeyedUnarchiver *)-[objc_class initForReadingWithData:](v23, "initForReadingWithData:", v17);
  CFRelease(v17);
  return v18;
}

- (id)description
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v3.receiver = self;
  v3.super_class = (Class)NSKeyedUnarchiver;
  return -[NSKeyedUnarchiver description](&v3, sel_description);
}

- (BOOL)_allowsValueCoding
{
  return 1;
}

- (id)_allowedClassNames
{
  return -[_NSKeyedUnarchiverHelper allowedClassNames](self->_helper, "allowedClassNames");
}

- (void)_setAllowedClassNames:(id)a3
{
  NSObject *v5;
  uint8_t v6[8];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v5 = _NSRuntimeIssuesLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)v6 = 0;
  }
  -[_NSKeyedUnarchiverHelper setAllowedClassNames:](self->_helper, "setAllowedClassNames:", a3);
}

- (void)replaceObject:(id)a3 withObject:(id)a4
{
  char v4;
  void *v5;

  v4 = atomic_load(&self->_flags);
  if ((v4 & 2) != 0)
  {
    v5 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", CFSTR("NSInvalidUnarchiveOperationException"), +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: unarchive already finished, %@"), _NSMethodExceptionProem((objc_class *)self, a2), CFSTR("cannot replace")), 0);
    objc_exception_throw(v5);
  }
  if (a3 != a4)
    -[NSKeyedUnarchiver _temporaryMapReplaceObject:withObject:](self, "_temporaryMapReplaceObject:withObject:");
}

- (id)_decodeObjectOfClass:(Class)a3
{
  char v5;
  void *v8;
  NSString *v9;
  char v10;
  uint64_t genericKey;
  NSString *v12;
  NSString *v13;
  void *v14;
  const __CFString *v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  if (self->_helper->_decodeError)
    return 0;
  v5 = atomic_load(&self->_flags);
  if ((v5 & 4) == 0)
    return -[NSKeyedUnarchiver decodeObject](self, "decodeObject", a3);
  if (!a3 || !object_isClass(a3))
  {
    v13 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ '%@' is not an Objective-C class!"), _NSMethodExceptionProem((objc_class *)self, a2), a3);
    v14 = (void *)MEMORY[0x1E0C99DA0];
    v15 = (const __CFString *)*MEMORY[0x1E0C99778];
    goto LABEL_18;
  }
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", a3, 0);
  -[NSMutableArray addObject:](self->_helper->_allowedClasses, "addObject:", v8);

  if (_warnArchiverCompat == 1)
  {
    v9 = _NSMethodExceptionProem((objc_class *)self, a2);
    NSLog((NSString *)CFSTR("%@: warning: old archiving compatibility method called"), v9);
  }
  v10 = atomic_load(&self->_flags);
  if ((v10 & 2) != 0)
  {
    v13 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: unarchive already finished, %@"), _NSMethodExceptionProem((objc_class *)self, a2), CFSTR("cannot decode anything more"));
    v14 = (void *)MEMORY[0x1E0C99DA0];
    v15 = CFSTR("NSInvalidUnarchiveOperationException");
LABEL_18:
    objc_exception_throw((id)objc_msgSend(v14, "exceptionWithName:reason:userInfo:", v15, v13, 0));
  }
  if (self->_helper->_decodeError)
    return 0;
  v16[0] = 0;
  genericKey = self->_genericKey;
  self->_genericKey = genericKey + 1;
  if (genericKey > 0x27)
    v12 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("$%ld"), genericKey);
  else
    v12 = (NSString *)generic_keys[genericKey];
  _decodeObject((unint64_t *)self, v12, v16);
  -[NSMutableArray removeLastObject](self->_helper->_allowedClasses, "removeLastObject");
  return (id)v16[0];
}

- (BOOL)_strictSecureDecodingEnabled
{
  unint64_t v2;

  v2 = atomic_load(&self->_flags);
  return (v2 >> 5) & 1;
}

- (void)_enforceSubclassesMustBeExplicitlyMentionedWhenDecoded
{
  unint64_t *p_flags;
  unint64_t v3;

  p_flags = &self->_flags;
  do
    v3 = __ldaxr(p_flags);
  while (__stlxr(v3 | 0x40, p_flags));
}

- (void)_enforceExplicitPlistTypes
{
  unint64_t *p_flags;
  unint64_t v3;

  p_flags = &self->_flags;
  do
    v3 = __ldaxr(p_flags);
  while (__stlxr(v3 | 0x80, p_flags));
}

- (BOOL)_willEnforceExplicitPlistTypes
{
  char v2;

  v2 = atomic_load(&self->_flags);
  if (v2 < 0)
    return 1;
  else
    return _os_feature_enabled_impl();
}

- (void)__setError:(id)a3
{
  -[_NSKeyedUnarchiverHelper setDecodeError:](self->_helper, "setDecodeError:", a3);
}

void __49__NSKeyedUnarchiver__decodeArrayOfObjectsForKey___block_invoke(uint64_t a1)
{
  void *v2;
  int v3;
  uint64_t v4;
  void *v5;

  v2 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  if (v2)
  {
    v3 = *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
    v4 = (v3 - 1);
    if (v3 - 1 >= 0)
    {
      do
      {
        v5 = *(void **)(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) + 8 * v4);
        if (v5)

      }
      while (v4-- > 0);
      v2 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
    }
    free(v2);
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 0;
  }
}

- (unsigned)_currentUniqueIdentifier
{
  return self->_helper->_lastRef;
}

- (BOOL)_containsNextUnkeyedObject
{
  uint64_t genericKey;
  NSString *v4;
  __CFArray *containers;
  CFIndex Count;
  const __CFArray *ValueAtIndex;
  void *Value;
  id v9;
  id v11;

  genericKey = self->_genericKey;
  if (genericKey <= 0x27)
  {
    v4 = (NSString *)generic_keys[genericKey];
    if (v4)
      goto LABEL_3;
    return 0;
  }
  v4 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("$%ld"), genericKey);
  if (!v4)
    return 0;
LABEL_3:
  containers = self->_containers;
  if (!containers)
    return __CFBinaryPlistGetOffsetForValueFromDictionary3();
  Count = CFArrayGetCount(containers);
  ValueAtIndex = (const __CFArray *)CFArrayGetValueAtIndex(self->_containers, Count - 1);
  if (CFGetTypeID(ValueAtIndex) == 19)
  {
    Value = (void *)CFArrayGetValueAtIndex(ValueAtIndex, 0);
    v9 = Value;
    CFArrayRemoveValueAtIndex(ValueAtIndex, 0);
  }
  else
  {
    Value = (void *)CFDictionaryGetValue(ValueAtIndex, v4);
    v11 = Value;
  }
  return Value != 0;
}

+ (BOOL)_evaluateCycleSecurityRules:(NSKeyedUnarchiverCycleEvaluationRules *)a3
{
  uint64_t v3;

  v3 = *(unsigned int *)&a3->var0;
  if ((v3 & 0x10000) != 0)
    return 0;
  if ((v3 & 0x1000101) == 1)
    return ((v3 | ((unint64_t)a3->var4 << 32)) & 0x100000000) == 0;
  return 1;
}

- (id)decodeObject
{
  NSString *v4;
  char v5;
  uint64_t genericKey;
  NSString *v8;
  void *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  if (_warnArchiverCompat == 1)
  {
    v4 = _NSMethodExceptionProem((objc_class *)self, a2);
    NSLog((NSString *)CFSTR("%@: warning: old archiving compatibility method called"), v4);
  }
  v5 = atomic_load(&self->_flags);
  if ((v5 & 2) != 0)
  {
    v9 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", CFSTR("NSInvalidUnarchiveOperationException"), +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: unarchive already finished, %@"), _NSMethodExceptionProem((objc_class *)self, a2), CFSTR("cannot decode anything more")), 0);
    objc_exception_throw(v9);
  }
  if (self->_helper->_decodeError)
    return 0;
  v10[0] = 0;
  genericKey = self->_genericKey;
  self->_genericKey = genericKey + 1;
  if (genericKey > 0x27)
    v8 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("$%ld"), genericKey);
  else
    v8 = (NSString *)generic_keys[genericKey];
  _decodeObject((unint64_t *)self, v8, v10);
  return (id)v10[0];
}

- (void)decodeValuesOfObjCTypes:(const char *)a3
{
  NSString *v6;
  char v7;
  uint64_t *v8;
  NSString *v10;
  NSString *v11;
  void *v12;
  const __CFString *v13;
  uint64_t *v14;
  uint64_t v15;

  if (_warnArchiverCompat == 1)
  {
    v6 = _NSMethodExceptionProem((objc_class *)self, a2);
    NSLog((NSString *)CFSTR("%@: warning: old archiving compatibility method called"), v6);
  }
  v7 = atomic_load(&self->_flags);
  if ((v7 & 2) != 0)
  {
    v11 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: unarchive already finished, %@"), _NSMethodExceptionProem((objc_class *)self, a2), CFSTR("cannot decode anything more"), 0);
    v12 = (void *)MEMORY[0x1E0C99DA0];
    v13 = CFSTR("NSInvalidUnarchiveOperationException");
LABEL_11:
    objc_exception_throw((id)objc_msgSend(v12, "exceptionWithName:reason:userInfo:", v13, v11, 0));
  }
  if (!a3)
  {
    v10 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: null types pointer"), _NSMethodExceptionProem((objc_class *)self, a2));
LABEL_10:
    v11 = v10;
    v12 = (void *)MEMORY[0x1E0C99DA0];
    v13 = (const __CFString *)*MEMORY[0x1E0C99778];
    goto LABEL_11;
  }
  v14 = &v15;
  if (*a3)
  {
    while (1)
    {
      v8 = v14++;
      if (!*v8)
        break;
      -[NSKeyedUnarchiver decodeValueOfObjCType:at:](self, "decodeValueOfObjCType:at:", a3);
      if (!*(unsigned __int8 *)++a3)
        return;
    }
    v10 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: null address pointer"), _NSMethodExceptionProem((objc_class *)self, a2));
    goto LABEL_10;
  }
}

- (void)decodeArrayOfObjCType:(const char *)a3 count:(unint64_t)a4 at:(void *)a5
{
  uint64_t v10;
  NSString *v11;
  char v12;
  unint64_t v13;
  id v14;
  uint64_t v15;
  const __CFString *v16;
  void *v17;
  NSString *v18;

  v10 = objc_opt_class();
  if (_warnArchiverCompat == 1)
  {
    v11 = _NSMethodExceptionProem((objc_class *)self, a2);
    NSLog((NSString *)CFSTR("%@: warning: old archiving compatibility method called"), v11);
  }
  v12 = atomic_load(&self->_flags);
  if ((v12 & 2) != 0)
  {
    v17 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", CFSTR("NSInvalidUnarchiveOperationException"), +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: unarchive already finished, %@"), _NSMethodExceptionProem((objc_class *)self, a2), CFSTR("cannot decode anything more")), 0);
    objc_exception_throw(v17);
  }
  if (!self->_helper->_decodeError)
  {
    v13 = atomic_load(&self->_flags);
    atomic_store(v13 | 8, &self->_flags);
    if (a3 && a5)
    {
      if (a4)
      {
        v14 = -[NSKeyedUnarchiver _decodeObjectOfClass:](self, "_decodeObjectOfClass:", v10);
        if ((objc_opt_isKindOfClass() & 1) != 0)
          objc_msgSend(v14, "fillObjCType:count:at:", *a3, a4, a5);
        else
          -[NSCoder __failWithExceptionName:errorCode:format:](self, "__failWithExceptionName:errorCode:format:", CFSTR("NSInvalidUnarchiveOperationException"), 4864, CFSTR("%@: encoded entity at this point is not an array of ObjC type"), _NSMethodExceptionProem((objc_class *)self, a2));
        return;
      }
      v15 = *MEMORY[0x1E0C99778];
      v18 = _NSMethodExceptionProem((objc_class *)self, a2);
      v16 = CFSTR("%@: count is zero");
    }
    else
    {
      v15 = *MEMORY[0x1E0C99778];
      v18 = _NSMethodExceptionProem((objc_class *)self, a2);
      v16 = CFSTR("%@: null type or address pointer");
    }
    -[NSCoder __failWithExceptionName:errorCode:format:](self, "__failWithExceptionName:errorCode:format:", v15, 4864, v16, v18);
  }
}

- (int64_t)versionForClassName:(id)a3
{
  Class v3;

  v3 = NSClassFromString((NSString *)a3);
  if (v3)
    return -[objc_class version](v3, "version");
  else
    return 0x7FFFFFFFFFFFFFFFLL;
}

- (unsigned)systemVersion
{
  return 2000;
}

@end
