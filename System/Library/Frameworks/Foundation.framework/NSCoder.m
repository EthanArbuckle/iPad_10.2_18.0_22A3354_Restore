@implementation NSCoder

- (uint64_t)_walkAllowedClassListLookingForClass:(uint64_t)a3 forKey:(id)obj allowedClasses:(int)a5 strictModeEnabled:(char)a6 alwaysEnforceExplicitSubclasses:(int)a7 specialCaseObject:
{
  id v10;
  uint64_t v13;
  int v14;
  char v15;
  unint64_t v16;
  void *v17;
  int v18;
  int v19;
  IMP MethodImplementation;
  void (*v21)(void);
  objc_class *v22;
  objc_method *InstanceMethod;
  objc_class *Superclass;
  objc_method *v25;
  const void *Value;
  const void *v27;
  const void *v28;
  NSObject *v29;
  objc_class *v30;
  void *v31;
  NSString *v32;
  uint64_t v33;
  char v34;
  objc_class *v35;
  char v36;
  uint64_t v37;
  uint8_t buf[4];
  void *v39;
  __int16 v40;
  objc_class *v41;
  __int16 v42;
  uint64_t v43;
  __int16 v44;
  void *v45;
  __int16 v46;
  NSString *v47;
  __int16 v48;
  uint64_t v49;
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v10 = obj;
    v13 = result;
    if (object_isClass(obj))
      v10 = (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v10);
    if (v10)
    {
      if (!object_isClass(a2))
      {
        v30 = (objc_class *)v13;
LABEL_55:
        v31 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ object in class list '%@' is not an Objective-C class!"), _NSMethodExceptionProem(v30, sel_validateAllowedClass_forKey_), a2), 0);
        objc_exception_throw(v31);
      }
      if (a5)
        return objc_msgSend(v10, "containsObject:", a2);
      v14 = objc_msgSend(v10, "containsObject:", MEMORY[0x1E0DE7910]);
      if (v14)
      {
        v15 = -[NSCoder _warnAboutNSObjectInAllowedClassesWithException:](v13, a7 ^ 1u);
        result = 0;
        if (!a2)
          return result;
        v36 = v14;
        v33 = a3;
        v34 = a7;
        v35 = (objc_class *)v13;
        v16 = 0x1E0DE7000;
        if ((v15 & 1) == 0)
          return result;
        goto LABEL_13;
      }
      v36 = 0;
      v33 = a3;
      v34 = a7;
      v35 = (objc_class *)v13;
      v16 = 0x1E0DE7000uLL;
      if (a2)
      {
LABEL_13:
        v17 = a2;
        while (1)
        {
          if (!object_isClass(v17))
          {
            v30 = v35;
            goto LABEL_55;
          }
          if ((objc_msgSend(v10, "containsObject:", v17) & 1) != 0)
            return 1;
          if ((objc_opt_respondsToSelector() & 1) != 0)
          {
            v18 = objc_msgSend(v17, "_subclassesMustBeExplicitlyMentionedWhenDecoded");
            if ((a6 & 1) != 0)
              goto LABEL_20;
          }
          else
          {
            v18 = 0;
            if ((a6 & 1) != 0)
            {
LABEL_20:
              v19 = 1;
              goto LABEL_21;
            }
          }
          v19 = _os_feature_enabled_impl();
LABEL_21:
          if ((dyld_program_sdk_at_least() & v18) == 1)
          {
            MethodImplementation = class_getMethodImplementation(*(Class *)(v16 + 2320), sel_classForCoder);
            v21 = class_getMethodImplementation((Class)v17, sel_classForCoder);
            if (object_getClass(v17) != *(Class *)(v16 + 2320))
            {
              v22 = *(objc_class **)(v16 + 2320);
              if (v21 == MethodImplementation
                && (InstanceMethod = class_getInstanceMethod((Class)v17, sel_classForCoder),
                    InstanceMethod == class_getInstanceMethod(v22, sel_classForCoder))
                || (Superclass = class_getSuperclass((Class)v17),
                    v21 == class_getMethodImplementation(Superclass, sel_classForCoder))
                && (v25 = class_getInstanceMethod((Class)v17, sel_classForCoder),
                    v25 == class_getInstanceMethod(Superclass, sel_classForCoder)))
              {
                v16 = 0x1E0DE7000;
              }
              else
              {
                if (qword_1ECD09B88 != -1)
                  dispatch_once(&qword_1ECD09B88, &__block_literal_global_237);
                Value = CFDictionaryGetValue((CFDictionaryRef)qword_1ECD09B80, v17);
                v16 = 0x1E0DE7000;
                if (!Value)
                  goto LABEL_37;
                v27 = Value;
                if ((objc_msgSend(v10, "containsObject:", Value) & 1) != 0)
                  return 1;
                if (qword_1ECD09B88 != -1)
                  dispatch_once(&qword_1ECD09B88, &__block_literal_global_237);
                v28 = CFDictionaryGetValue((CFDictionaryRef)qword_1ECD09B80, v27);
                if (v28)
                {
                  result = objc_msgSend(v10, "containsObject:", v28);
                  if ((result & 1) != 0 || (a6 & 1) != 0)
                    return result;
                }
                else
                {
LABEL_37:
                  if ((a6 & 1) != 0)
                    return 0;
                }
                if (qword_1ECD09B60 != -1)
                  dispatch_once(&qword_1ECD09B60, &__block_literal_global_5);
                if (dword_1ECD09B5C != 2)
                {
                  if ((v36 & 1) == 0)
                  {
                    v37 = -[objc_class __decoderInfoForAllowedClassesWarning](v35, "__decoderInfoForAllowedClassesWarning");
                    v16 = 0x1E0DE7000;
                    v32 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("'%@' (%p) [%@]"), a2, a2, -[NSURL path](-[NSBundle bundleURL](+[NSBundle bundleForClass:](NSBundle, "bundleForClass:", a2), "bundleURL"), "path"));
                    v29 = _NSRuntimeIssuesLog();
                    if (os_log_type_enabled(v29, OS_LOG_TYPE_FAULT))
                    {
                      *(_DWORD *)buf = 138544642;
                      v39 = v17;
                      v40 = 2114;
                      v41 = Superclass;
                      v42 = 2114;
                      v43 = v33;
                      v44 = 2114;
                      v45 = v17;
                      v46 = 2114;
                      v47 = v32;
                      v48 = 2114;
                      v49 = v37;
                      _os_log_fault_impl(&dword_1817D9000, v29, OS_LOG_TYPE_FAULT, "Attempted to decode a collection type '%{public}@' (subclass of '%{public}@') for key '%{public}@'. '%{public}@' requires its subclasses to be explicitly added to the allowed classes list but it is not present. Allowing this has been a source of security issues. Please ensure you meant this type to be in archives: %{public}@%{public}@", buf, 0x3Eu);
                    }
                  }
                  v36 = 1;
                  if (v19)
                  {
                    if ((v34 & 1) == 0)
                      return -[NSCoder _shouldExemptProcessBasedOnArchivingExceptionRules:]((_BOOL8)v35, (uint64_t)"/System/Library/CoreServices/ArchivingExceptions.bundle/CollectionSubclasses.plist");
                  }
                }
              }
            }
          }
          result = (uint64_t)class_getSuperclass((Class)v17);
          v17 = (void *)result;
          if (!result)
            return result;
        }
      }
    }
    return 0;
  }
  return result;
}

- (id)decodeObjectOfClasses:(NSSet *)classes forKey:(NSString *)key
{
  objc_class *v8;
  void *v9;

  if (!-[NSCoder allowsKeyedCoding](self, "allowsKeyedCoding", classes))
  {
    v9 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: This method is only implemented for coders which allowKeyedCoding."), _NSMethodExceptionProem((objc_class *)self, a2)), 0);
    objc_exception_throw(v9);
  }
  if (-[NSCoder requiresSecureCoding](self, "requiresSecureCoding"))
  {
    v8 = NSClassFromString((NSString *)CFSTR("NSCoder"));
    NSRequestConcreteImplementation((uint64_t)self, a2, v8);
  }
  return -[NSCoder decodeObjectForKey:](self, "decodeObjectForKey:", key);
}

- (BOOL)validateClassSupportsSecureCoding:(Class)a3
{
  objc_class *Superclass;
  objc_class *Class;
  const char *Name;
  uint64_t v9;

  if ((-[objc_class conformsToProtocol:](a3, "conformsToProtocol:", &unk_1EDCC2CC8) & 1) == 0)
  {
    -[NSCoder __failWithExceptionName:errorCode:format:](self, "__failWithExceptionName:errorCode:format:", CFSTR("NSInvalidUnarchiveOperationException"), 4864, CFSTR("This decoder will only decode classes that adopt NSSecureCoding. Class '%s' does not adopt it."), class_getName(a3), v9);
    return 0;
  }
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    -[NSCoder __failWithExceptionName:errorCode:format:](self, "__failWithExceptionName:errorCode:format:", CFSTR("NSInvalidUnarchiveOperationException"), 4864, CFSTR("Class '%s' disallows secure coding. It must implement supportsSecureCoding and return YES."), class_getName(a3), v9);
    return 0;
  }
  if (!-[objc_class supportsSecureCoding](a3, "supportsSecureCoding"))
  {
    -[NSCoder __failWithExceptionName:errorCode:format:](self, "__failWithExceptionName:errorCode:format:", CFSTR("NSInvalidUnarchiveOperationException"), 4864, CFSTR("Class '%s' disallows secure coding. It must return YES from supportsSecureCoding."), class_getName(a3), v9);
    return 0;
  }
  if (!a3)
  {
LABEL_8:
    -[NSCoder __failWithExceptionName:errorCode:format:](self, "__failWithExceptionName:errorCode:format:", CFSTR("NSInvalidUnarchiveOperationException"), 4864, CFSTR("Class '%s' does not implement initWithCoder:."), class_getName(a3), v9);
    return 0;
  }
  Superclass = a3;
  while ((_classOverridesSelector(Superclass, sel_initWithCoder_) & 1) == 0)
  {
    Superclass = class_getSuperclass(Superclass);
    if (!Superclass)
      goto LABEL_8;
  }
  Class = object_getClass(Superclass);
  if ((_classOverridesSelector(Class, sel_supportsSecureCoding) & 1) == 0)
  {
    Name = class_getName(a3);
    -[NSCoder __failWithExceptionName:errorCode:format:](self, "__failWithExceptionName:errorCode:format:", CFSTR("NSInvalidUnarchiveOperationException"), 4864, CFSTR("Class '%s' has a superclass that supports secure coding, but '%s' overrides -initWithCoder: and does not override +supportsSecureCoding. The class must implement +supportsSecureCoding and return YES to verify that its implementation of -initWithCoder: is secure coding compliant."), Name, class_getName(a3));
    return 0;
  }
  return 1;
}

- (Class)_isPossibleNestedCollectionClass:(uint64_t)a1
{
  Class result;
  objc_class *v4;

  result = 0;
  if (a1)
  {
    v4 = a2;
    if (a2)
    {
      while (1)
      {
        if (v4 == (objc_class *)MEMORY[0x1E0DE7910])
          return 0;
        if (qword_1ECD09B78 != -1)
          dispatch_once(&qword_1ECD09B78, &__block_literal_global_236);
        if ((objc_msgSend((id)qword_1ECD09B70, "containsObject:", v4) & 1) != 0)
          break;
        result = class_getSuperclass(v4);
        v4 = result;
        if (!result)
          return result;
      }
      return (Class)1;
    }
  }
  return result;
}

- (BOOL)validateAllowedClass:(Class)a3 forKey:(id)a4
{
  return -[NSCoder _validateAllowedClass:forKey:allowingInvocations:](self, "_validateAllowedClass:forKey:allowingInvocations:", a3, a4, 0);
}

- (BOOL)_validateAllowedClass:(Class)a3 forKey:(id)a4 allowingInvocations:(BOOL)a5
{
  _BOOL4 v5;

  v5 = a5;
  return -[NSCoder _validateAllowedClassesContainsClass:forKey:](self, "_validateAllowedClassesContainsClass:forKey:", a3, a4)&& (!v5 || (Class)MEMORY[0x1E0C99DB8] != a3 && (Class)MEMORY[0x1E0C99D30] != a3)&& -[NSCoder validateClassSupportsSecureCoding:](self, "validateClassSupportsSecureCoding:", a3);
}

- (BOOL)requiresSecureCoding
{
  return 0;
}

- (BOOL)_shouldExemptProcessBasedOnArchivingExceptionRules:(_BOOL8)result
{
  _QWORD v2[6];

  v2[5] = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v2[0] = MEMORY[0x1E0C809B0];
    v2[1] = 3221225472;
    v2[2] = __62__NSCoder__shouldExemptProcessBasedOnArchivingExceptionRules___block_invoke;
    v2[3] = &__block_descriptor_40_e5_v8__0l;
    v2[4] = a2;
    if (qword_1ECD09B68 != -1)
      dispatch_once(&qword_1ECD09B68, v2);
    return _MergedGlobals_93 != 0;
  }
  return result;
}

- (void)encodeRect:(NSRect)rect forKey:(NSString *)key
{
  -[NSCoder encodeObject:forKey:](self, "encodeObject:forKey:", NSStringFromRect(rect), key);
}

- (uint64_t)__tryDecodeObjectForKey:(_QWORD *)a3 error:(uint64_t)a4 decodeBlock:
{
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  NSString *v12;
  uint64_t v13;

  if (!a1)
    return 0;
  if (!a4)
    -[NSAssertionHandler handleFailureInFunction:file:lineNumber:description:](+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[NSCoder(Exceptions) __tryDecodeObjectForKey:error:decodeBlock:]"), CFSTR("NSCoder.m"), 1370, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("decodeBlock != nil"));
  v8 = objc_msgSend(a1, "decodingFailurePolicy");
  v9 = (*(uint64_t (**)(uint64_t))(a4 + 16))(a4);
  if (v8 && (v10 = (void *)objc_msgSend(a1, "error")) != 0)
  {
    if (a3)
      *a3 = v10;
    objc_msgSend(a1, "__setError:", 0);
    return 0;
  }
  else if (a3 && !v9)
  {
    if (a2)
    {
      v11 = (void *)MEMORY[0x1E0C99D80];
      v12 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("requested key: '%@'"), a2);
      v13 = objc_msgSend(v11, "dictionaryWithObject:forKey:", v12, *MEMORY[0x1E0C9AFA8]);
    }
    else
    {
      v13 = 0;
    }
    v9 = 0;
    *a3 = +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("NSCocoaErrorDomain"), 4865, v13);
  }
  return v9;
}

uint64_t __54__NSCoder_decodeTopLevelObjectOfClasses_forKey_error___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "decodeObjectOfClasses:forKey:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

uint64_t __44__NSCoder_decodeTopLevelObjectForKey_error___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "decodeObjectForKey:", *(_QWORD *)(a1 + 40));
}

- (id)decodeObjectOfClass:(Class)aClass forKey:(NSString *)key
{
  return -[NSCoder decodeObjectOfClasses:forKey:](self, "decodeObjectOfClasses:forKey:", objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", aClass), key);
}

- (NSError)error
{
  return 0;
}

- (NSRect)decodeRectForKey:(NSString *)key
{
  id v3;
  double v4;
  double v5;
  double v6;
  double v7;
  __int128 v8;
  double v9[3];
  uint64_t v10;
  NSRect result;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = -[NSCoder decodeObjectOfClass:forKey:](self, "decodeObjectOfClass:forKey:", objc_opt_class(), key);
  if (v3)
  {
    v8 = 0u;
    *(_OWORD *)v9 = 0u;
    parseFloats(v3, 4, (uint64_t)&v8);
    v5 = *((double *)&v8 + 1);
    v4 = *(double *)&v8;
    v7 = v9[1];
    v6 = v9[0];
  }
  else
  {
    v4 = 0.0;
    v5 = 0.0;
    v6 = 0.0;
    v7 = 0.0;
  }
  result.size.height = v7;
  result.size.width = v6;
  result.origin.y = v5;
  result.origin.x = v4;
  return result;
}

- (NSSize)decodeSizeForKey:(NSString *)key
{
  id v3;
  double v4;
  double v5;
  double v6;
  double v7;
  uint64_t v8;
  NSSize result;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = -[NSCoder decodeObjectOfClass:forKey:](self, "decodeObjectOfClass:forKey:", objc_opt_class(), key);
  if (v3)
  {
    v6 = 0.0;
    v7 = 0.0;
    parseFloats(v3, 2, (uint64_t)&v6);
    v4 = v6;
    v5 = v7;
  }
  else
  {
    v4 = 0.0;
    v5 = 0.0;
  }
  result.height = v5;
  result.width = v4;
  return result;
}

- (id)decodeTopLevelObjectOfClasses:(NSSet *)classes forKey:(NSString *)key error:(NSError *)error
{
  _QWORD v6[8];

  v6[7] = *MEMORY[0x1E0C80C00];
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __54__NSCoder_decodeTopLevelObjectOfClasses_forKey_error___block_invoke;
  v6[3] = &unk_1E0F4CE30;
  v6[4] = self;
  v6[5] = classes;
  v6[6] = key;
  return (id)-[NSCoder __tryDecodeObjectForKey:error:decodeBlock:](self, (uint64_t)key, error, (uint64_t)v6);
}

- (id)decodePropertyListForKey:(NSString *)key
{
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v13;

  if (!-[NSCoder allowsKeyedCoding](self, "allowsKeyedCoding"))
  {
    v13 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: This method is only implemented for coders which allowKeyedCoding."), _NSMethodExceptionProem((objc_class *)self, a2)), 0);
    objc_exception_throw(v13);
  }
  v6 = (void *)MEMORY[0x1E0C99E60];
  v7 = objc_opt_class();
  v8 = objc_opt_class();
  v9 = objc_opt_class();
  v10 = objc_opt_class();
  v11 = objc_opt_class();
  return -[NSCoder decodeObjectOfClasses:forKey:](self, "decodeObjectOfClasses:forKey:", objc_msgSend(v6, "setWithObjects:", v7, v8, v9, v10, v11, objc_opt_class(), 0), key);
}

- (id)decodeTopLevelObjectForKey:(NSString *)key error:(NSError *)error
{
  _QWORD v5[7];

  v5[6] = *MEMORY[0x1E0C80C00];
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __44__NSCoder_decodeTopLevelObjectForKey_error___block_invoke;
  v5[3] = &unk_1E0F4CE08;
  v5[4] = self;
  v5[5] = key;
  return (id)-[NSCoder __tryDecodeObjectForKey:error:decodeBlock:](self, (uint64_t)key, error, (uint64_t)v5);
}

void __62__NSCoder__shouldExemptProcessBasedOnArchivingExceptionRules___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  NSString *v4;
  void *v5;
  char v6;
  BOOL v7;
  uint64_t v8;
  uint8_t buf[8];
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  getpid();
  v8 = *(_QWORD *)(a1 + 32);
  if (sandbox_check()
    || (v4 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", *(_QWORD *)(a1 + 32), 4, v8), (v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithContentsOfFile:", v4)) == 0))
  {
    byte_1ECD09B59 = 1;
    v2 = _NSOSLog();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1817D9000, v2, OS_LOG_TYPE_ERROR, "No ArchivingExceptions available / readable. Allowing all.", buf, 2u);
    }
    v3 = 0;
  }
  else
  {
    v3 = v5;
    byte_1ECD09B59 = objc_msgSend(v5, "containsObject:", -[NSProcessInfo processName](+[NSProcessInfo processInfo](NSProcessInfo, "processInfo"), "processName"));
  }

  if (byte_1ECD09B59)
  {
    v6 = 1;
  }
  else
  {
    if (qword_1ECD09B60 != -1)
      dispatch_once(&qword_1ECD09B60, &__block_literal_global_5);
    if (byte_1ECD09B59)
      v7 = 1;
    else
      v7 = dword_1ECD09B5C == 2;
    v6 = v7;
  }
  _MergedGlobals_93 = v6;
}

- (NSDictionary)decodeDictionaryWithKeysOfClass:(Class)keyCls objectsOfClass:(Class)objectCls forKey:(NSString *)key
{
  void *v10;
  NSString *v11;
  uint64_t v12;
  _QWORD v14[3];

  v14[2] = *MEMORY[0x1E0C80C00];
  v14[0] = keyCls;
  v14[1] = objectCls;
  v10 = (void *)objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 2));
  v11 = _NSMethodExceptionProem((objc_class *)self, a2);
  if (!-[NSCoder _validateDecodeCollectionAllowedClassesRequirementsWithClasses:forMethodExceptionProem:](self, v10, (uint64_t)v11))return 0;
  v12 = objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", keyCls);
  return -[NSCoder decodeDictionaryWithKeysOfClasses:objectsOfClasses:forKey:](self, "decodeDictionaryWithKeysOfClasses:objectsOfClasses:forKey:", v12, objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", objectCls), key);
}

- (NSArray)decodeArrayOfObjectsOfClass:(Class)cls forKey:(NSString *)key
{
  void *v7;
  NSString *v8;

  v7 = (void *)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", cls);
  v8 = _NSMethodExceptionProem((objc_class *)self, a2);
  if (-[NSCoder _validateDecodeCollectionAllowedClassesRequirementsWithClasses:forMethodExceptionProem:](self, v7, (uint64_t)v8))
  {
    return -[NSCoder decodeArrayOfObjectsOfClasses:forKey:](self, "decodeArrayOfObjectsOfClasses:forKey:", v7, key);
  }
  else
  {
    return 0;
  }
}

- (BOOL)_validateDecodeCollectionAllowedClassesRequirementsWithClasses:(uint64_t)a3 forMethodExceptionProem:
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  _BOOL8 v11;
  NSString *v12;
  NSString *v14;
  _QWORD v15[6];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  void (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  uint64_t v21;
  _BYTE v22[128];
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v6 = objc_msgSend(a2, "countByEnumeratingWithState:objects:count:", &v23, v22, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v24;
LABEL_4:
    v8 = 0;
    while (1)
    {
      if (*(_QWORD *)v24 != v7)
        objc_enumerationMutation(a2);
      v9 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * v8);
      if (!object_isClass(v9))
      {
        v14 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ object in class list '%@' is not an Objective-C class!"), a3, v9);
        objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], v14, 0));
      }
      if (v9 == (void *)MEMORY[0x1E0DE7910]
        && !-[NSCoder _warnAboutNSObjectInAllowedClassesWithException:]((uint64_t)a1, 1))
      {
        return 0;
      }
      if (v6 == ++v8)
      {
        v6 = objc_msgSend(a2, "countByEnumeratingWithState:objects:count:", &v23, v22, 16);
        if (v6)
          goto LABEL_4;
        break;
      }
    }
  }
  v16 = 0;
  v17 = &v16;
  v18 = 0x3052000000;
  v19 = __Block_byref_object_copy__0;
  v20 = __Block_byref_object_dispose__0;
  v21 = 0;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __98__NSCoder__validateDecodeCollectionAllowedClassesRequirementsWithClasses_forMethodExceptionProem___block_invoke;
  v15[3] = &unk_1E0F4CE58;
  v15[4] = a1;
  v15[5] = &v16;
  objc_msgSend(a2, "enumerateObjectsUsingBlock:", v15);
  v10 = (void *)v17[5];
  v11 = v10 == 0;
  if (v10)
  {
    objc_msgSend(v10, "appendString:", CFSTR("\n\t)\n"));
    v12 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: This method only supports decoding non-nested collections. Please remove the following or use '-decodeObjectOfClasses: forKey:' instead: %@"), a3, v17[5]);

    objc_msgSend(a1, "__failWithExceptionName:errorCode:format:", CFSTR("NSInvalidUnarchiveOperationException"), 4864, CFSTR("%@"), v12);
  }
  _Block_object_dispose(&v16, 8);
  return v11;
}

NSMutableString *__98__NSCoder__validateDecodeCollectionAllowedClassesRequirementsWithClasses_forMethodExceptionProem___block_invoke(uint64_t a1, objc_class *a2)
{
  NSMutableString *result;
  NSString *v5;
  void *v6;

  result = (NSMutableString *)-[NSCoder _isPossibleNestedCollectionClass:](*(_QWORD *)(a1 + 32), a2);
  if ((_DWORD)result)
  {
    v5 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("\n\t\t%@"), -[NSCoder __allowedClassesDescriptionForClass:](*(NSString **)(a1 + 32), (uint64_t)a2));
    v6 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    if (v6)
    {
      return (NSMutableString *)objc_msgSend(v6, "appendString:", v5);
    }
    else
    {
      result = -[NSString initWithFormat:]([NSMutableString alloc], "initWithFormat:", CFSTR("\n\t(%@"), v5);
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = result;
    }
  }
  return result;
}

- (void)decodeValueOfObjCType:(const char *)type at:(void *)data size:(NSUInteger)size
{
  void *v10;
  uint64_t v11;
  uint64_t v12;
  objc_class *v13;
  NSString *v14;
  NSUInteger sizep[2];

  sizep[1] = *MEMORY[0x1E0C80C00];
  v10 = (void *)objc_opt_class();
  sizep[0] = 0;
  NSGetSizeAndAlignment(type, sizep, 0);
  if (sizep[0] != size)
  {
    v14 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Cannot get decode with size %zu. The type encoded as %s is expected to be %zu bytes"), size, type, sizep[0]);
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], v14, 0));
  }
  v11 = objc_msgSend(v10, "instanceMethodForSelector:", sel_decodeValueOfObjCType_at_);
  if (v11 == +[NSCoder instanceMethodForSelector:](NSCoder, "instanceMethodForSelector:", sel_decodeValueOfObjCType_at_)|| (v12 = objc_msgSend(v10, "instanceMethodForSelector:", sel_decodeValueOfObjCType_at_size_), v12 != +[NSCoder instanceMethodForSelector:](NSCoder, "instanceMethodForSelector:", sel_decodeValueOfObjCType_at_size_)))
  {
    v13 = NSClassFromString((NSString *)CFSTR("NSCoder"));
    NSRequestConcreteImplementation((uint64_t)self, a2, v13);
  }
  -[NSCoder decodeValueOfObjCType:at:](self, "decodeValueOfObjCType:at:", type, data);
}

- (BOOL)allowsKeyedCoding
{
  return 0;
}

uint64_t __48__NSCoder__allowedClassesDescriptionForClasses___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", -[NSCoder __allowedClassesDescriptionForClass:](*(NSString **)(a1 + 40), a2));
}

- (void)_warnAboutPlistType:(uint64_t)a3 forKey:(void *)a4 missingInAllowedClasses:
{
  NSObject *v8;
  uint8_t buf[4];
  NSString *v10;
  __int16 v11;
  NSString *v12;
  __int16 v13;
  uint64_t v14;
  __int16 v15;
  id v16;
  __int16 v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v8 = _NSOSLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138544386;
      v10 = _NSMethodExceptionProem(a1, sel_validateAllowedClass_forKey_);
      v11 = 2114;
      v12 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("'%@' (%p) [%@]"), a2, a2, -[NSURL path](-[NSBundle bundleURL](+[NSBundle bundleForClass:](NSBundle, "bundleForClass:", a2), "bundleURL"), "path"));
      v13 = 2114;
      v14 = a3;
      v15 = 2114;
      v16 = -[NSCoder _allowedClassesDescriptionForClasses:]((uint64_t)a1, a4);
      v17 = 2114;
      v18 = -[objc_class __decoderInfoForAllowedClassesWarning](a1, "__decoderInfoForAllowedClassesWarning");
      _os_log_fault_impl(&dword_1817D9000, v8, OS_LOG_TYPE_FAULT, "%{public}@ allowed unarchiving safe plist type '%{public}@' for key '%{public}@', even though it was not explicitly included in the client allowed classes set: '%{public}@'. This will be disallowed in the future.%{public}@", buf, 0x34u);
    }
  }
}

- (id)__decoderInfoForAllowedClassesWarning
{
  return &stru_1E0F56070;
}

- (id)_allowedClassesDescriptionForClasses:(uint64_t)a1
{
  id v4;
  _QWORD v6[7];

  v6[6] = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  v4 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __48__NSCoder__allowedClassesDescriptionForClasses___block_invoke;
  v6[3] = &unk_1E0F4CE80;
  v6[4] = v4;
  v6[5] = a1;
  objc_msgSend(a2, "enumerateObjectsUsingBlock:", v6);
  return v4;
}

- (NSString)__allowedClassesDescriptionForClass:(NSString *)result
{
  if (result)
    return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("'%@' (%p) [%@]"), a2, a2, -[NSURL path](-[NSBundle bundleURL](+[NSBundle bundleForClass:](NSBundle, "bundleForClass:", a2), "bundleURL"), "path"));
  return result;
}

- (void)encodeSize:(NSSize)size forKey:(NSString *)key
{
  -[NSCoder encodeObject:forKey:](self, "encodeObject:forKey:", NSStringFromSize(size), key);
}

- (id)decodeTopLevelObjectOfClass:(Class)aClass forKey:(NSString *)key error:(NSError *)error
{
  return -[NSCoder decodeObjectOfClasses:forKey:error:](self, "decodeObjectOfClasses:forKey:error:", objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", aClass), key, error);
}

- (void)encodeValueOfObjCType:(const char *)type at:(const void *)addr
{
  objc_class *v6;

  v6 = NSClassFromString((NSString *)CFSTR("NSCoder"));
  NSRequestConcreteImplementation((uint64_t)self, a2, v6);
}

- (void)encodeDataObject:(NSData *)data
{
  objc_class *v5;

  v5 = NSClassFromString((NSString *)CFSTR("NSCoder"));
  NSRequestConcreteImplementation((uint64_t)self, a2, v5);
}

- (void)decodeValueOfObjCType:(const char *)type at:(void *)data
{
  void *v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  objc_class *v12;
  _BYTE v13[24];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v8 = (void *)objc_opt_class();
  v9 = objc_msgSend(v8, "instanceMethodForSelector:", sel_decodeValueOfObjCType_at_size_);
  if (v9 == +[NSCoder instanceMethodForSelector:](NSCoder, "instanceMethodForSelector:", sel_decodeValueOfObjCType_at_size_)|| (v10 = objc_msgSend(v8, "instanceMethodForSelector:", sel_decodeValueOfObjCType_at_), v10 != +[NSCoder instanceMethodForSelector:](NSCoder, "instanceMethodForSelector:", sel_decodeValueOfObjCType_at_)))
  {
    v12 = NSClassFromString((NSString *)CFSTR("NSCoder"));
    NSRequestConcreteImplementation((uint64_t)self, a2, v12);
  }
  v11 = _NSOSLog();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
  {
    *(_DWORD *)v13 = 138412290;
    *(_QWORD *)&v13[4] = v8;
    _os_log_fault_impl(&dword_1817D9000, v11, OS_LOG_TYPE_FAULT, "%@ overrode the default implementation of '-decodeValueOfObjCType:at:', which is insecure and deprecated, but not '-decodeValueOfObjCType:at:size:' which is insecure as it can lead to potential buffer overflows. Use the safer '-decodeValueOfObjCType:at:size:' method", v13, 0xCu);
  }
  *(_QWORD *)v13 = 0;
  NSGetSizeAndAlignment(type, (NSUInteger *)v13, 0);
  -[NSCoder decodeValueOfObjCType:at:size:](self, "decodeValueOfObjCType:at:size:", type, data, *(_QWORD *)v13);
}

- (NSData)decodeDataObject
{
  objc_class *v4;

  v4 = NSClassFromString((NSString *)CFSTR("NSCoder"));
  NSRequestConcreteImplementation((uint64_t)self, a2, v4);
}

- (NSInteger)versionForClassName:(NSString *)className
{
  objc_class *v5;

  v5 = NSClassFromString((NSString *)CFSTR("NSCoder"));
  NSRequestConcreteImplementation((uint64_t)self, a2, v5);
}

- (void)encodeObject:(id)object
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = object;
  -[NSCoder encodeValueOfObjCType:at:](self, "encodeValueOfObjCType:at:", "@", v3);
}

- (void)encodeValuesOfObjCTypes:(const char *)types
{
  const char *v3;
  va_list v6;
  va_list va;

  va_start(va, types);
  va_copy(v6, va);
  if (*types)
  {
    v3 = types;
    do
      -[NSCoder encodeValueOfObjCType:at:](self, "encodeValueOfObjCType:at:", v3, *(_QWORD *)v6, v6 + 8);
    while (*(unsigned __int8 *)++v3);
  }
}

- (void)encodeArrayOfObjCType:(const char *)type count:(NSUInteger)count at:(const void *)array
{
  size_t v9;
  size_t v10;
  char *v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v9 = strlen(type);
  v10 = v9 + 16;
  if (v9 + 16 < 0x201)
  {
    if (v9 == -16)
    {
      v11 = 0;
    }
    else
    {
      v11 = (char *)v12 - ((v9 + 31) & 0xFFFFFFFFFFFFFFF0);
      bzero(v11, v10);
    }
  }
  else
  {
    v11 = (char *)malloc_type_malloc(v9 + 16, 0x100004077774924uLL);
  }
  snprintf(v11, v10, "[%lu%s]", count, type);
  -[NSCoder encodeValueOfObjCType:at:](self, "encodeValueOfObjCType:at:", v11, array);
  if (v10 >= 0x201)
    free(v11);
}

- (void)encodeBytes:(const void *)byteaddr length:(NSUInteger)length
{
  unsigned int v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v6 = length;
  -[NSCoder encodeValueOfObjCType:at:](self, "encodeValueOfObjCType:at:", "I", &v6);
  -[NSCoder encodeArrayOfObjCType:count:at:](self, "encodeArrayOfObjCType:count:at:", "c", v6, byteaddr);
}

- (id)decodeObject
{
  id v4[2];

  v4[1] = *(id *)MEMORY[0x1E0C80C00];
  if (-[NSCoder error](self, "error"))
    return 0;
  v4[0] = 0;
  -[NSCoder decodeValueOfObjCType:at:size:](self, "decodeValueOfObjCType:at:size:", "@", v4, 8);
  return v4[0];
}

- (id)decodeTopLevelObjectAndReturnError:(NSError *)error
{
  _QWORD v4[6];

  v4[5] = *MEMORY[0x1E0C80C00];
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __46__NSCoder_decodeTopLevelObjectAndReturnError___block_invoke;
  v4[3] = &unk_1E0F4CDE0;
  v4[4] = self;
  return (id)-[NSCoder __tryDecodeObjectForKey:error:decodeBlock:](self, 0, error, (uint64_t)v4);
}

uint64_t __46__NSCoder_decodeTopLevelObjectAndReturnError___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "decodeObject");
}

- (void)decodeValuesOfObjCTypes:(const char *)types
{
  const char *v3;
  va_list v6;
  va_list va;

  va_start(va, types);
  va_copy(v6, va);
  if (*types)
  {
    v3 = types;
    do
      -[NSCoder decodeValueOfObjCType:at:](self, "decodeValueOfObjCType:at:", v3, *(_QWORD *)v6, v6 + 8);
    while (*(unsigned __int8 *)++v3);
  }
}

- (void)decodeArrayOfObjCType:(const char *)itemType count:(NSUInteger)count at:(void *)array
{
  size_t v9;
  size_t v10;
  char *v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v9 = strlen(itemType);
  v10 = v9 + 23;
  if (v9 + 23 < 0x201)
  {
    if (v9 == -23)
    {
      v11 = 0;
    }
    else
    {
      v11 = (char *)v12 - ((v9 + 38) & 0xFFFFFFFFFFFFFFF0);
      bzero(v11, v10);
    }
  }
  else
  {
    v11 = (char *)malloc_type_malloc(v9 + 23, 0x100004077774924uLL);
  }
  snprintf(v11, v10, "[%lu%s]", count, itemType);
  -[NSCoder decodeValueOfObjCType:at:](self, "decodeValueOfObjCType:at:", v11, array);
  if (v10 >= 0x201)
    free(v11);
}

- (void)decodeBytesWithReturnedLength:(NSUInteger *)lengthp
{
  void *v5;
  unsigned int v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v7 = 0;
  -[NSCoder decodeValueOfObjCType:at:size:](self, "decodeValueOfObjCType:at:size:", "I", &v7, 4);
  v5 = (void *)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithLength:", v7), "mutableBytes");
  -[NSCoder decodeArrayOfObjCType:count:at:](self, "decodeArrayOfObjCType:count:at:", "c", v7, v5);
  *lengthp = v7;
  return v5;
}

- (BOOL)_allowsValueCoding
{
  return 0;
}

- (void)encodeObject:(id)object forKey:(NSString *)key
{
  objc_class *v6;

  v6 = NSClassFromString((NSString *)CFSTR("NSCoder"));
  NSRequestConcreteImplementation((uint64_t)self, a2, v6);
}

- (id)decodeObjectForKey:(NSString *)key
{
  objc_class *v5;

  v5 = NSClassFromString((NSString *)CFSTR("NSCoder"));
  NSRequestConcreteImplementation((uint64_t)self, a2, v5);
}

- (void)encodeConditionalObject:(id)object forKey:(NSString *)key
{
  objc_class *v6;

  v6 = NSClassFromString((NSString *)CFSTR("NSCoder"));
  NSRequestConcreteImplementation((uint64_t)self, a2, v6);
}

- (void)encodeBool:(BOOL)value forKey:(NSString *)key
{
  objc_class *v6;

  v6 = NSClassFromString((NSString *)CFSTR("NSCoder"));
  NSRequestConcreteImplementation((uint64_t)self, a2, v6);
}

- (void)encodeInt:(int)value forKey:(NSString *)key
{
  objc_class *v6;

  v6 = NSClassFromString((NSString *)CFSTR("NSCoder"));
  NSRequestConcreteImplementation((uint64_t)self, a2, v6);
}

- (void)encodeInt32:(int32_t)value forKey:(NSString *)key
{
  objc_class *v6;

  v6 = NSClassFromString((NSString *)CFSTR("NSCoder"));
  NSRequestConcreteImplementation((uint64_t)self, a2, v6);
}

- (void)encodeInt64:(int64_t)value forKey:(NSString *)key
{
  objc_class *v6;

  v6 = NSClassFromString((NSString *)CFSTR("NSCoder"));
  NSRequestConcreteImplementation((uint64_t)self, a2, v6);
}

- (void)encodeFloat:(float)value forKey:(NSString *)key
{
  objc_class *v6;

  v6 = NSClassFromString((NSString *)CFSTR("NSCoder"));
  NSRequestConcreteImplementation((uint64_t)self, a2, v6);
}

- (void)encodeDouble:(double)value forKey:(NSString *)key
{
  objc_class *v6;

  v6 = NSClassFromString((NSString *)CFSTR("NSCoder"));
  NSRequestConcreteImplementation((uint64_t)self, a2, v6);
}

- (void)encodeBytes:(const uint8_t *)bytes length:(NSUInteger)length forKey:(NSString *)key
{
  objc_class *v7;

  v7 = NSClassFromString((NSString *)CFSTR("NSCoder"));
  NSRequestConcreteImplementation((uint64_t)self, a2, v7);
}

- (BOOL)containsValueForKey:(NSString *)key
{
  objc_class *v5;

  v5 = NSClassFromString((NSString *)CFSTR("NSCoder"));
  NSRequestConcreteImplementation((uint64_t)self, a2, v5);
}

- (BOOL)decodeBoolForKey:(NSString *)key
{
  objc_class *v5;

  v5 = NSClassFromString((NSString *)CFSTR("NSCoder"));
  NSRequestConcreteImplementation((uint64_t)self, a2, v5);
}

- (int)decodeIntForKey:(NSString *)key
{
  objc_class *v5;

  v5 = NSClassFromString((NSString *)CFSTR("NSCoder"));
  NSRequestConcreteImplementation((uint64_t)self, a2, v5);
}

- (int32_t)decodeInt32ForKey:(NSString *)key
{
  objc_class *v5;

  v5 = NSClassFromString((NSString *)CFSTR("NSCoder"));
  NSRequestConcreteImplementation((uint64_t)self, a2, v5);
}

- (int64_t)decodeInt64ForKey:(NSString *)key
{
  objc_class *v5;

  v5 = NSClassFromString((NSString *)CFSTR("NSCoder"));
  NSRequestConcreteImplementation((uint64_t)self, a2, v5);
}

- (float)decodeFloatForKey:(NSString *)key
{
  objc_class *v5;

  v5 = NSClassFromString((NSString *)CFSTR("NSCoder"));
  NSRequestConcreteImplementation((uint64_t)self, a2, v5);
}

- (double)decodeDoubleForKey:(NSString *)key
{
  objc_class *v5;

  v5 = NSClassFromString((NSString *)CFSTR("NSCoder"));
  NSRequestConcreteImplementation((uint64_t)self, a2, v5);
}

- (const)decodeBytesForKey:(NSString *)key returnedLength:(NSUInteger *)lengthp
{
  objc_class *v6;

  v6 = NSClassFromString((NSString *)CFSTR("NSCoder"));
  NSRequestConcreteImplementation((uint64_t)self, a2, v6);
}

- (unsigned)systemVersion
{
  return 1000;
}

- (NSArray)decodeArrayOfObjectsOfClasses:(NSSet *)classes forKey:(NSString *)key
{
  NSString *v7;
  objc_class *v9;
  NSString *v10;
  void *v11;
  const NSExceptionName *v12;

  v7 = _NSMethodExceptionProem((objc_class *)self, a2);
  if (-[NSCoder _validateDecodeCollectionAllowedClassesRequirementsWithClasses:forMethodExceptionProem:](self, classes, (uint64_t)v7))
  {
    if (-[NSCoder allowsKeyedCoding](self, "allowsKeyedCoding"))
    {
      if (-[NSCoder requiresSecureCoding](self, "requiresSecureCoding"))
      {
        v9 = NSClassFromString((NSString *)CFSTR("NSCoder"));
        NSRequestConcreteImplementation((uint64_t)self, a2, v9);
      }
      v10 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: This method only supports secure coding."), _NSMethodExceptionProem((objc_class *)self, a2));
      v11 = (void *)MEMORY[0x1E0C99DA0];
      v12 = &NSInvalidUnarchiveOperationException;
    }
    else
    {
      v10 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: This method is only implemented for coders which allowKeyedCoding."), _NSMethodExceptionProem((objc_class *)self, a2));
      v11 = (void *)MEMORY[0x1E0C99DA0];
      v12 = (const NSExceptionName *)MEMORY[0x1E0C99778];
    }
    objc_exception_throw((id)objc_msgSend(v11, "exceptionWithName:reason:userInfo:", *v12, v10, 0));
  }
  return 0;
}

- (NSDictionary)decodeDictionaryWithKeysOfClasses:(NSSet *)keyClasses objectsOfClasses:(NSSet *)objectClasses forKey:(NSString *)key
{
  NSSet *v7;
  NSString *v8;
  objc_class *v10;
  NSString *v11;
  void *v12;
  const NSExceptionName *v13;

  v7 = -[NSSet setByAddingObjectsFromSet:](keyClasses, "setByAddingObjectsFromSet:", objectClasses);
  v8 = _NSMethodExceptionProem((objc_class *)self, a2);
  if (-[NSCoder _validateDecodeCollectionAllowedClassesRequirementsWithClasses:forMethodExceptionProem:](self, v7, (uint64_t)v8))
  {
    if (-[NSCoder allowsKeyedCoding](self, "allowsKeyedCoding"))
    {
      if (-[NSCoder requiresSecureCoding](self, "requiresSecureCoding"))
      {
        v10 = NSClassFromString((NSString *)CFSTR("NSCoder"));
        NSRequestConcreteImplementation((uint64_t)self, a2, v10);
      }
      v11 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: This method only supports secure coding."), _NSMethodExceptionProem((objc_class *)self, a2));
      v12 = (void *)MEMORY[0x1E0C99DA0];
      v13 = &NSInvalidUnarchiveOperationException;
    }
    else
    {
      v11 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: This method is only implemented for coders which allowKeyedCoding."), _NSMethodExceptionProem((objc_class *)self, a2));
      v12 = (void *)MEMORY[0x1E0C99DA0];
      v13 = (const NSExceptionName *)MEMORY[0x1E0C99778];
    }
    objc_exception_throw((id)objc_msgSend(v12, "exceptionWithName:reason:userInfo:", *v13, v11, 0));
  }
  return 0;
}

- (NSSet)allowedClasses
{
  return 0;
}

- (uint64_t)_warnAboutNSObjectInAllowedClassesWithException:(uint64_t)result
{
  objc_class *v3;
  uint64_t v4;
  NSObject *v5;
  NSString *v6;
  uint8_t buf[4];
  NSString *v8;
  __int16 v9;
  id v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (!result)
    return result;
  v3 = (objc_class *)result;
  v4 = objc_msgSend((id)result, "__decoderInfoForAllowedClassesWarning");
  v5 = _NSRuntimeIssuesLog();
  if (!os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
  {
    if (a2)
      goto LABEL_4;
    return 1;
  }
  *(_DWORD *)buf = 138543874;
  v8 = _NSMethodExceptionProem(v3, sel_validateAllowedClass_forKey_);
  v9 = 2114;
  v10 = -[NSCoder _allowedClassesDescriptionForClasses:]((uint64_t)v3, (void *)-[objc_class allowedClasses](v3, "allowedClasses"));
  v11 = 2114;
  v12 = v4;
  _os_log_fault_impl(&dword_1817D9000, v5, OS_LOG_TYPE_FAULT, "%{public}@: NSSecureCoding allowed classes list contains [NSObject class], which bypasses security by allowing any Objective-C class to be implicitly decoded. Consider reducing the scope of allowed classes during decoding by listing only the classes you expect to decode, or a more specific base class than NSObject. This will become an error in the future. Allowed class list: %{public}@%{public}@", buf, 0x20u);
  if (!a2)
    return 1;
LABEL_4:
  if (!dyld_program_sdk_at_least())
    return 1;
  if (qword_1ECD09B60 != -1)
    dispatch_once(&qword_1ECD09B60, &__block_literal_global_5);
  if (dword_1ECD09B5C == 2)
    return 1;
  v6 = _NSMethodExceptionProem(v3, sel_validateAllowedClass_forKey_);
  -[objc_class __failWithExceptionName:errorCode:format:](v3, "__failWithExceptionName:errorCode:format:", CFSTR("NSInvalidUnarchiveOperationException"), 4864, CFSTR("%@: NSSecureCoding allowed classes list contains '[NSObject class]', which bypasses security by allowing any Objective-C class to be implicitly decoded. Consider reducing the scope of allowed classes during decoding by listing only the classes you expect to decode, or a more specific base class than NSObject. Allowed class list: %@%@"), v6, -[NSCoder _allowedClassesDescriptionForClasses:]((uint64_t)v3, (void *)-[objc_class allowedClasses](v3, "allowedClasses")), v4);
  return 0;
}

- (BOOL)_enforceCollectionTyping
{
  if (qword_1ECD09B60 != -1)
    dispatch_once(&qword_1ECD09B60, &__block_literal_global_5);
  return dword_1ECD09B5C == 0;
}

- (uint64_t)_walkAllowedClassListValidatingInstance:(uint64_t)a3 forKey:(void *)a4 allowedClasses:(int)a5 strictModeEnabled:(char)a6 alwaysEnforceExplicitSubclasses:(int)a7 specialCaseObject:(uint64_t *)a8 invalidElementClass:
{
  const __CFAllocator *v12;
  const __CFSet *v13;
  __CFArray *v14;
  CFIndex Count;
  CFIndex v16;
  void *ValueAtIndex;
  uint64_t v18;
  int v19;
  uint64_t v20;
  CFIndex v21;
  uint64_t i;
  uint64_t v23;
  uint64_t *v25;
  CFArrayCallBacks v26;
  CFSetCallBacks callBacks;
  void **newValues[2];
  __int128 v29;
  __int128 v30;
  __int128 v31;
  void *v32[130];
  CFRange v33;
  CFRange v34;

  v32[128] = *(void **)MEMORY[0x1E0C80C00];
  if (!a1
    || !-[NSCoder _walkAllowedClassListLookingForClass:forKey:allowedClasses:strictModeEnabled:alwaysEnforceExplicitSubclasses:specialCaseObject:]((uint64_t)a1, (void *)objc_msgSend(a2, "classForCoder"), a3, a4, a5, a6, a7))
  {
    return 0;
  }
  if (!objc_msgSend(a1, "_enforceCollectionTyping")
    || (_NSIsNSArray() & 1) == 0
    && (_NSIsNSSet() & 1) == 0
    && (_NSIsNSOrderedSet() & 1) == 0
    && !_NSIsNSDictionary())
  {
    return 1;
  }
  v12 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  memset(&callBacks, 0, sizeof(callBacks));
  v13 = CFSetCreateMutable(v12, 32, &callBacks);
  memset(&v26, 0, sizeof(v26));
  v14 = CFArrayCreateMutable(v12, 32, &v26);
  CFArrayAppendValue(v14, a2);
  Count = CFArrayGetCount(v14);
  if (!Count)
  {
LABEL_24:
    v23 = 1;
    goto LABEL_25;
  }
  v25 = a8;
  while (1)
  {
    v16 = Count - 1;
    ValueAtIndex = (void *)CFArrayGetValueAtIndex(v14, Count - 1);
    CFArrayRemoveValueAtIndex(v14, v16);
    if (!CFSetContainsValue(v13, ValueAtIndex))
      break;
LABEL_23:
    Count = CFArrayGetCount(v14);
    if (!Count)
      goto LABEL_24;
  }
  CFSetAddValue(v13, ValueAtIndex);
  v18 = objc_msgSend(ValueAtIndex, "classForCoder");
  if ((objc_msgSend(a1, "_validateAllowedClassesContainsClass:forKey:", v18, a3) & 1) != 0)
  {
    if ((_NSIsNSArray() & 1) != 0
      || (_NSIsNSSet() & 1) != 0
      || (_NSIsNSOrderedSet() & 1) != 0
      || _NSIsNSDictionary())
    {
      v19 = _NSIsNSDictionary();
      v30 = 0u;
      v31 = 0u;
      *(_OWORD *)newValues = 0u;
      v29 = 0u;
      v20 = objc_msgSend(ValueAtIndex, "countByEnumeratingWithState:objects:count:", newValues, v32, 128);
      if (v20)
      {
        v21 = v20;
        do
        {
          v33.location = v16;
          v33.length = 0;
          CFArrayReplaceValues(v14, v33, (const void **)newValues[1], v21);
          v16 += v21;
          if (v19)
          {
            for (i = 0; i != v21; ++i)
              v32[i] = (void *)objc_msgSend(ValueAtIndex, "objectForKey:", newValues[1][i]);
            v34.location = v16;
            v34.length = 0;
            CFArrayReplaceValues(v14, v34, (const void **)v32, v21);
            v16 += v21;
          }
          v21 = objc_msgSend(ValueAtIndex, "countByEnumeratingWithState:objects:count:", newValues, v32, 128);
        }
        while (v21);
      }
    }
    goto LABEL_23;
  }
  v23 = 0;
  if (v25)
    *v25 = v18;
LABEL_25:
  CFRelease(v13);
  CFRelease(v14);
  return v23;
}

- (NSString)__descriptionForUnexpectedClass:(const __CFString *)a3 forKey:(void *)a4 allowedClasses:
{
  const __CFString *v4;

  if (result)
  {
    if (a3)
      v4 = a3;
    else
      v4 = CFSTR("(no key, possibly an argument to a message)");
    return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("value for key '%@' was of unexpected class %@.\nAllowed classes are:\n %@"), v4, +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("'%@' (%p) [%@]"), a2, a2, -[NSURL path](-[NSBundle bundleURL](+[NSBundle bundleForClass:](NSBundle, "bundleForClass:", a2), "bundleURL"), "path")), -[NSCoder _allowedClassesDescriptionForClasses:]((uint64_t)result, a4));
  }
  return result;
}

- (NSString)__descriptionForUnexpectedElementClass:(const __CFString *)a3 forContainerKey:(void *)a4 allowedClasses:
{
  const __CFString *v4;

  if (result)
  {
    if (a3)
      v4 = a3;
    else
      v4 = CFSTR("(no key, possibly an argument to a message)");
    return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("collection for key '%@' recursively contained an element of unexpected class %@.\nAllowed classes are:\n %@"), v4, +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("'%@' (%p) [%@]"), a2, a2, -[NSURL path](-[NSBundle bundleURL](+[NSBundle bundleForClass:](NSBundle, "bundleForClass:", a2), "bundleURL"), "path")), -[NSCoder _allowedClassesDescriptionForClasses:]((uint64_t)result, a4));
  }
  return result;
}

- (BOOL)_validateAllowedClassesContainsClass:(Class)a3 forKey:(id)a4
{
  const __CFString *v4;
  NSSet *v7;
  int v8;
  objc_class *Superclass;
  NSString *v10;
  NSString *v11;
  void *v12;
  const NSExceptionName *v13;

  v4 = (const __CFString *)a4;
  if (!a3)
  {
    v11 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Attempt to decode an object with no class for key '%@'."), a4);
    v12 = (void *)MEMORY[0x1E0C99DA0];
    v13 = &NSInvalidUnarchiveOperationException;
    goto LABEL_15;
  }
  if (!object_isClass(a3))
  {
    v11 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ object in class list '%@' is not an Objective-C class!"), _NSMethodExceptionProem((objc_class *)self, sel_validateAllowedClass_forKey_), a3);
    v12 = (void *)MEMORY[0x1E0C99DA0];
    v13 = (const NSExceptionName *)MEMORY[0x1E0C99778];
LABEL_15:
    objc_exception_throw((id)objc_msgSend(v12, "exceptionWithName:reason:userInfo:", *v13, v11, 0));
  }
  v7 = -[NSCoder allowedClasses](self, "allowedClasses");
  if (!-[NSSet containsObject:](v7, "containsObject:", MEMORY[0x1E0DE7910])
    || (v8 = -[NSCoder _warnAboutNSObjectInAllowedClassesWithException:]((uint64_t)self, 1)) != 0)
  {
    Superclass = a3;
    do
    {
      if (-[NSSet containsObject:](v7, "containsObject:", Superclass))
      {
        LOBYTE(v8) = 1;
        return v8;
      }
      Superclass = class_getSuperclass(Superclass);
    }
    while (Superclass);
    if (!v4)
      v4 = CFSTR("(no key, possibly an argument to a message)");
    v10 = -[NSCoder __allowedClassesDescriptionForClass:]((NSString *)self, (uint64_t)a3);
    -[NSCoder __failWithExceptionName:errorCode:format:](self, "__failWithExceptionName:errorCode:format:", CFSTR("NSInvalidUnarchiveOperationException"), 4864, CFSTR("value for key '%@' was of unexpected class %@.\nAllowed classes are:\n %@"), v4, v10, -[NSCoder _allowedClassesDescriptionForClasses:]((uint64_t)self, v7));
    LOBYTE(v8) = 0;
  }
  return v8;
}

- (void)failWithError:(NSError *)error
{
  uint64_t v5;
  const __CFString *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  if (error)
  {
    if (!self)
      return;
  }
  else
  {
    -[NSAssertionHandler handleFailureInFunction:file:lineNumber:description:](+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[NSCoder(Exceptions) failWithError:]"), CFSTR("NSCoder.m"), 1354, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("error != nil"));
    if (!self)
      return;
  }
  v6 = CFSTR("__NSCoderError");
  v7[0] = error;
  v5 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, &v6, 1);
  -[NSCoder __failWithException:](self, (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", CFSTR("NSInvalidUnarchiveOperationException"), -[NSError localizedDescription](error, "localizedDescription"), v5));
}

- (NSDecodingFailurePolicy)decodingFailurePolicy
{
  return 0;
}

- (void)__setError:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  __NSCoderInvalidState((uint64_t)CFSTR("Attempting to set decode error on throwing NSCoder %@"), (uint64_t)a2, (uint64_t)a3, v3, v4, v5, v6, v7, (uint64_t)self);
}

- (BOOL)__failWithException:(void *)a1
{
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    if (!objc_msgSend(a1, "decodingFailurePolicy")
      || (v5[0] = 0, !objc_msgSend((id)objc_opt_class(), "__categorizeException:intoError:", a2, v5)))
    {
      objc_exception_throw(a2);
    }
    objc_msgSend(a1, "__setError:", v5[0]);
  }
  return a1 != 0;
}

- (NSString)__failWithUnexpectedClass:(const __CFString *)a3 forKey:(void *)a4 allowedClasses:
{
  if (result)
    return (NSString *)-[NSString __failWithExceptionName:errorCode:format:](result, "__failWithExceptionName:errorCode:format:", CFSTR("NSInvalidUnarchiveOperationException"), 4864, CFSTR("%@"), -[NSCoder __descriptionForUnexpectedClass:forKey:allowedClasses:](result, a2, a3, a4));
  return result;
}

- (NSString)__failWithUnexpectedElementClass:(const __CFString *)a3 forContainerKey:(void *)a4 allowedClasses:
{
  if (result)
    return (NSString *)-[NSString __failWithExceptionName:errorCode:format:](result, "__failWithExceptionName:errorCode:format:", CFSTR("NSInvalidUnarchiveOperationException"), 4864, CFSTR("%@"), -[NSCoder __descriptionForUnexpectedElementClass:forContainerKey:allowedClasses:](result, a2, a3, a4));
  return result;
}

- (BOOL)__failWithExceptionName:(id)a3 errorCode:(int64_t)a4 format:(id)a5
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v9;
  NSString *v12;
  const __CFString *v14;
  _QWORD v15[2];
  uint64_t v16;

  v9 = a4;
  v15[1] = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    if (!a4)
      goto LABEL_5;
  }
  else
  {
    -[NSAssertionHandler handleFailureInFunction:file:lineNumber:description:](+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[NSCoder(Exceptions) __failWithExceptionName:errorCode:format:]"), CFSTR("NSCoder.m"), 1464, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("exceptionName != nil"));
    if (!v9)
      goto LABEL_5;
  }
  if (v9 >> 1 != 2432)
    __NSCoderInvalidState((uint64_t)CFSTR("invalid error code: %ld"), (uint64_t)a2, (uint64_t)a3, a4, (uint64_t)a5, v5, v6, v7, v9);
  v14 = CFSTR("__NSCoderInternalErrorCode");
  v15[0] = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v9);
  v9 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, &v14, 1);
LABEL_5:
  if (a5)
    v12 = -[NSString initWithFormat:arguments:]([NSString alloc], "initWithFormat:arguments:", a5, &v16);
  else
    v12 = (NSString *)&stru_1E0F56070;
  return -[NSCoder __failWithException:](self, (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", a3, v12, v9));
}

+ (BOOL)__categorizeException:(id)a3 intoError:(id *)a4
{
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  NSError *v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  objc_class *v37;
  NSString *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;

  if (a3)
  {
    if (a4)
      goto LABEL_3;
  }
  else
  {
    -[NSAssertionHandler handleFailureInFunction:file:lineNumber:description:](+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[NSCoder(Exceptions) __categorizeException:intoError:]"), CFSTR("NSCoder.m"), 1501, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("exception != nil"));
    if (a4)
      goto LABEL_3;
  }
  -[NSAssertionHandler handleFailureInFunction:file:lineNumber:description:](+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[NSCoder(Exceptions) __categorizeException:intoError:]"), CFSTR("NSCoder.m"), 1502, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("outError != NULL"));
LABEL_3:
  v6 = (void *)objc_msgSend(a3, "userInfo");
  if (v6)
  {
    v7 = v6;
    v8 = (void *)objc_msgSend(v6, "objectForKey:", CFSTR("__NSCoderInternalErrorCode"));
    v9 = objc_msgSend(v7, "objectForKey:", CFSTR("__NSCoderError"));
    v17 = (NSError *)v9;
    if (v8 && v9)
      __NSCoderInvalidState((uint64_t)CFSTR("expected only one of: internal error code (%@) or external error (%@) not both"), v10, v11, v12, v13, v14, v15, v16, (uint64_t)v8);
    if (v8)
    {
      if ((_NSIsNSNumber() & 1) == 0)
      {
        v29 = objc_opt_class();
        __NSCoderInvalidState((uint64_t)CFSTR("wrong type for error code value %@, expecting NSNumber"), v30, v31, v32, v33, v34, v35, v36, v29);
      }
      v18 = objc_msgSend(v8, "integerValue");
      v26 = v18;
      if (v18 >> 1 != 2432)
        __NSCoderInvalidState((uint64_t)CFSTR("invalid error code: %ld"), v19, v20, v21, v22, v23, v24, v25, v18);
      if (!a4)
        goto LABEL_19;
      v27 = (void *)objc_msgSend(a3, "reason");
      if (objc_msgSend(v27, "length"))
        v28 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObject:forKey:", v27, *MEMORY[0x1E0C9AFA8]);
      else
        v28 = 0;
      v17 = -[NSError initWithDomain:code:userInfo:]([NSError alloc], "initWithDomain:code:userInfo:", CFSTR("NSCocoaErrorDomain"), v26, v28);
LABEL_18:
      *a4 = v17;
LABEL_19:
      LOBYTE(v6) = 1;
      return (char)v6;
    }
    if (v9)
    {
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v37 = (objc_class *)objc_opt_class();
        v38 = NSStringFromClass(v37);
        __NSCoderInvalidState((uint64_t)CFSTR("expected external to be a kind of NSError, instead it is a '%@'"), v39, v40, v41, v42, v43, v44, v45, (uint64_t)v38);
      }
      if (!a4)
        goto LABEL_19;
      goto LABEL_18;
    }
    LOBYTE(v6) = 0;
  }
  return (char)v6;
}

- (void)encodePoint:(NSPoint)point
{
  float x;
  float y;
  float v5;
  float v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  x = point.x;
  v6 = x;
  y = point.y;
  v5 = y;
  -[NSCoder encodeValuesOfObjCTypes:](self, "encodeValuesOfObjCTypes:", "ff", &v6, &v5);
}

- (NSPoint)decodePoint
{
  double v2;
  double v3;
  float v4;
  float v5;
  uint64_t v6;
  NSPoint result;

  v6 = *MEMORY[0x1E0C80C00];
  v5 = 0.0;
  v4 = 0.0;
  -[NSCoder decodeValuesOfObjCTypes:](self, "decodeValuesOfObjCTypes:", "ff", &v5, &v4);
  v2 = v5;
  v3 = v4;
  result.y = v3;
  result.x = v2;
  return result;
}

- (void)encodeSize:(NSSize)size
{
  float width;
  float height;
  float v5;
  float v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  width = size.width;
  v6 = width;
  height = size.height;
  v5 = height;
  -[NSCoder encodeValuesOfObjCTypes:](self, "encodeValuesOfObjCTypes:", "ff", &v6, &v5);
}

- (NSSize)decodeSize
{
  double v2;
  double v3;
  float v4;
  float v5;
  uint64_t v6;
  NSSize result;

  v6 = *MEMORY[0x1E0C80C00];
  v5 = 0.0;
  v4 = 0.0;
  -[NSCoder decodeValuesOfObjCTypes:](self, "decodeValuesOfObjCTypes:", "ff", &v5, &v4);
  v2 = v5;
  v3 = v4;
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)encodeRect:(NSRect)rect
{
  float x;
  float y;
  float width;
  float height;
  float v7;
  float v8;
  float v9;
  float v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  x = rect.origin.x;
  y = rect.origin.y;
  v9 = y;
  v10 = x;
  width = rect.size.width;
  height = rect.size.height;
  v7 = height;
  v8 = width;
  -[NSCoder encodeValuesOfObjCTypes:](self, "encodeValuesOfObjCTypes:", "ffff", &v10, &v9, &v8, &v7);
}

- (NSRect)decodeRect
{
  double v2;
  double v3;
  double v4;
  double v5;
  uint64_t v6;
  _QWORD v7[2];
  NSRect result;

  v7[1] = *MEMORY[0x1E0C80C00];
  v6 = 0;
  v7[0] = 0;
  -[NSCoder decodeValuesOfObjCTypes:](self, "decodeValuesOfObjCTypes:", "ffff", (char *)v7 + 4, v7, (char *)&v6 + 4, &v6);
  v2 = *((float *)v7 + 1);
  v3 = *(float *)v7;
  v4 = *((float *)&v6 + 1);
  v5 = *(float *)&v6;
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)encodePoint:(NSPoint)point forKey:(NSString *)key
{
  -[NSCoder encodeObject:forKey:](self, "encodeObject:forKey:", NSStringFromPoint(point), key);
}

- (NSPoint)decodePointForKey:(NSString *)key
{
  id v3;
  double v4;
  double v5;
  double v6;
  double v7;
  uint64_t v8;
  NSPoint result;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = -[NSCoder decodeObjectOfClass:forKey:](self, "decodeObjectOfClass:forKey:", objc_opt_class(), key);
  if (v3)
  {
    v6 = 0.0;
    v7 = 0.0;
    parseFloats(v3, 2, (uint64_t)&v6);
    v4 = v6;
    v5 = v7;
  }
  else
  {
    v4 = 0.0;
    v5 = 0.0;
  }
  result.y = v5;
  result.x = v4;
  return result;
}

@end
