@implementation NSObject(CPLCodingProxy)

- (id)cplDeepCopy
{
  if (objc_msgSend(a1, "conformsToProtocol:", &unk_1EEEB90A8))
    return (id)objc_msgSend(a1, "copy");
  else
    return a1;
}

- (void)cplEncodePropertiesWithCoder:()CPLCodingProxy
{
  id v4;
  id v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  objc_msgSend((id)objc_opt_class(), "_cplPropertyAttributeMap");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __57__NSObject_CPLCodingProxy__cplEncodePropertiesWithCoder___block_invoke;
  v7[3] = &unk_1E60DA590;
  v7[4] = a1;
  v8 = v4;
  v5 = v4;
  objc_msgSend(v6, "enumerateKeysAndObjectsUsingBlock:", v7);

}

- (void)cplDecodePropertiesFromCoder:()CPLCodingProxy
{
  id v4;
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  uint64_t v9;

  v4 = a3;
  objc_msgSend((id)objc_opt_class(), "_cplPropertyAttributeMap");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __57__NSObject_CPLCodingProxy__cplDecodePropertiesFromCoder___block_invoke;
  v7[3] = &unk_1E60DA590;
  v8 = v4;
  v9 = a1;
  v5 = v4;
  objc_msgSend(v6, "enumerateKeysAndObjectsUsingBlock:", v7);

}

- (uint64_t)cplIsEqual:()CPLCodingProxy
{
  return objc_msgSend(a1, "cplIsEqual:withEqualityBlock:", a3, 0);
}

- (uint64_t)cplIsEqual:()CPLCodingProxy withEqualityBlock:
{
  return objc_msgSend(a1, "cplProperties:areEqualToPropertiesOf:withEqualityBlock:", 0, a3, a4);
}

- (BOOL)cplProperties:()CPLCodingProxy areEqualToPropertiesOf:diffTracker:withEqualityBlock:
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  char v15;
  void *v16;
  _BOOL8 v17;
  _QWORD v19[4];
  id v20;
  void *v21;
  id v22;
  id v23;
  id v24;
  uint64_t *v25;
  void *v26;
  char v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  char v31;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (v11 == a1)
  {
    v17 = 1;
  }
  else
  {
    v14 = (void *)objc_opt_class();
    if ((objc_msgSend(v11, "isMemberOfClass:", v14) & 1) != 0)
    {
      v28 = 0;
      v29 = &v28;
      v30 = 0x2020000000;
      v15 = 1;
      v31 = 1;
      if (v12)
        v15 = objc_msgSend(v12, "shouldCompareAllProperties") ^ 1;
      objc_msgSend(v14, "_cplPropertyAttributeMap");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v19[0] = MEMORY[0x1E0C809B0];
      v19[1] = 3221225472;
      v19[2] = __95__NSObject_CPLCodingProxy__cplProperties_areEqualToPropertiesOf_diffTracker_withEqualityBlock___block_invoke;
      v19[3] = &unk_1E60DA5B8;
      v20 = v10;
      v26 = v14;
      v24 = v13;
      v21 = a1;
      v22 = v11;
      v25 = &v28;
      v23 = v12;
      v27 = v15;
      objc_msgSend(v16, "enumerateKeysAndObjectsUsingBlock:", v19);
      v17 = *((_BYTE *)v29 + 24) != 0;

      _Block_object_dispose(&v28, 8);
    }
    else
    {
      objc_msgSend(v12, "noteObjectAreTotallyDifferent");
      v17 = 0;
    }
  }

  return v17;
}

- (uint64_t)cplProperties:()CPLCodingProxy areEqualToPropertiesOf:withEqualityBlock:
{
  return objc_msgSend(a1, "cplProperties:areEqualToPropertiesOf:diffTracker:withEqualityBlock:", a3, a4, 0, a5);
}

- (uint64_t)cplHash
{
  void *v2;
  void *v3;
  uint64_t v4;
  _QWORD v6[7];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;

  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = -1;
  v2 = (void *)objc_opt_class();
  objc_msgSend(v2, "_cplPropertyAttributeMap");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __35__NSObject_CPLCodingProxy__cplHash__block_invoke;
  v6[3] = &unk_1E60DA5E0;
  v6[4] = a1;
  v6[5] = &v7;
  v6[6] = v2;
  objc_msgSend(v3, "enumerateKeysAndObjectsUsingBlock:", v6);
  v4 = v8[3];

  _Block_object_dispose(&v7, 8);
  return v4;
}

- (void)cplClearProperties:()CPLCodingProxy
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;
  _QWORD v19[4];
  void *v20;
  _QWORD v21[5];

  v4 = a3;
  v5 = (void *)objc_opt_class();
  v6 = MEMORY[0x1E0C809B0];
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __47__NSObject_CPLCodingProxy__cplClearProperties___block_invoke;
  v21[3] = &unk_1E60DA608;
  v21[4] = a1;
  v7 = (void *)MEMORY[0x1B5E08DC4](v21);
  objc_msgSend(v5, "_cplPropertyAttributeMap");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "allObjects");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectsForKeys:notFoundMarker:", v10, v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = v6;
    v15[1] = 3221225472;
    v15[2] = __47__NSObject_CPLCodingProxy__cplClearProperties___block_invoke_2;
    v15[3] = &unk_1E60DA658;
    v17 = v10;
    v18 = v7;
    v16 = v9;
    v12 = v10;
    v13 = v7;
    v14 = v9;
    objc_msgSend(v11, "enumerateObjectsUsingBlock:", v15);

  }
  else
  {
    v19[0] = v6;
    v19[1] = 3221225472;
    v19[2] = __47__NSObject_CPLCodingProxy__cplClearProperties___block_invoke_117;
    v19[3] = &unk_1E60DA630;
    v20 = v7;
    v14 = v7;
    objc_msgSend(v8, "enumerateKeysAndObjectsUsingBlock:", v19);
    v13 = v20;
  }

}

- (void)_cplCopyProperties:()CPLCodingProxy fromOtherObject:withCopyBlock:
{
  id v9;
  id v10;
  id v11;
  void *v12;
  uint64_t v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  id v23;
  NSObject *v24;
  id v25;
  void *v26;
  void *v27;
  _QWORD v28[4];
  id v29;
  id v30;
  id v31;
  _QWORD v32[4];
  void *v33;
  _QWORD v34[5];
  id v35;
  id v36;
  uint8_t buf[4];
  id v38;
  __int16 v39;
  void *v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = (void *)objc_opt_class();
  if (v12 != (void *)objc_opt_class())
  {
    if (!_CPLSilentLogging)
    {
      __CPLCodingOSLogDomain();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        v38 = (id)objc_opt_class();
        v39 = 2112;
        v40 = v12;
        v25 = v38;
        _os_log_impl(&dword_1B03C2000, v24, OS_LOG_TYPE_ERROR, "Trying to copy properties from an instance of %@ to an instance of %@", buf, 0x16u);

      }
    }
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Framework/Sources/NSObject+CPLCodingProxy.m");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, v27, 962, CFSTR("Trying to copy properties from an instance of %@ to an instance of %@"), objc_opt_class(), v12);

    abort();
  }
  v13 = MEMORY[0x1E0C809B0];
  v34[0] = MEMORY[0x1E0C809B0];
  v34[1] = 3221225472;
  v34[2] = __77__NSObject_CPLCodingProxy___cplCopyProperties_fromOtherObject_withCopyBlock___block_invoke;
  v34[3] = &unk_1E60DA680;
  v14 = v11;
  v36 = v14;
  v34[4] = a1;
  v15 = v10;
  v35 = v15;
  v16 = (void *)MEMORY[0x1B5E08DC4](v34);
  objc_msgSend(v12, "_cplPropertyAttributeMap");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "allObjects");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "objectsForKeys:notFoundMarker:", v19, v18);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v28[0] = v13;
    v28[1] = 3221225472;
    v28[2] = __77__NSObject_CPLCodingProxy___cplCopyProperties_fromOtherObject_withCopyBlock___block_invoke_2;
    v28[3] = &unk_1E60DA658;
    v30 = v19;
    v31 = v16;
    v29 = v18;
    v21 = v19;
    v22 = v16;
    v23 = v18;
    objc_msgSend(v20, "enumerateObjectsUsingBlock:", v28);

  }
  else
  {
    v32[0] = v13;
    v32[1] = 3221225472;
    v32[2] = __77__NSObject_CPLCodingProxy___cplCopyProperties_fromOtherObject_withCopyBlock___block_invoke_124;
    v32[3] = &unk_1E60DA630;
    v33 = v16;
    v23 = v16;
    objc_msgSend(v17, "enumerateKeysAndObjectsUsingBlock:", v32);
    v22 = v33;
  }

}

- (uint64_t)cplCopyPropertiesFromObject:()CPLCodingProxy withCopyBlock:
{
  return objc_msgSend(a1, "_cplCopyProperties:fromOtherObject:withCopyBlock:", 0, a3, a4);
}

- (id)cplFullDescription
{
  return +[CPLArchiver fullDescriptionForObject:](CPLArchiver, "fullDescriptionForObject:", a1);
}

+ (uint64_t)cplAdditionalSecureClassesForProperty:()CPLCodingProxy
{
  return 0;
}

+ (uint64_t)cplShouldIgnorePropertyForCoding:()CPLCodingProxy
{
  uint64_t v3;
  id v4;
  uint64_t v5;

  v3 = cplShouldIgnorePropertyForCoding__onceToken;
  v4 = a3;
  if (v3 != -1)
    dispatch_once(&cplShouldIgnorePropertyForCoding__onceToken, &__block_literal_global_11433);
  v5 = objc_msgSend((id)cplShouldIgnorePropertyForCoding__baseIgnorableProperties, "containsObject:", v4);

  return v5;
}

+ (uint64_t)cplShouldIgnorePropertyForEquality:()CPLCodingProxy
{
  return 0;
}

+ (void)_addPropertyAttributeMapToPropertyMapLocked:()CPLCodingProxy
{
  id v4;
  objc_property_t *v5;
  objc_property_t *v6;
  uint64_t v7;
  void *v8;
  objc_property *v9;
  NSObject *v10;
  void *v11;
  CPLCodingPropertyEntry *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  __darwin_ct_rune_t v20;
  NSObject *v21;
  const char *v22;
  IMP v23;
  char v24;
  void *v25;
  void *v26;
  uint64_t v27;
  const char *v28;
  IMP MethodImplementation;
  void *v30;
  NSString *v31;
  Class v32;
  void *v33;
  NSObject *v34;
  void *v35;
  uint64_t v36;
  const char *v37;
  IMP v38;
  id v39;
  uint64_t v40;
  void *v41;
  NSString *v42;
  const char *v43;
  IMP v44;
  uint64_t v45;
  Ivar InstanceVariable;
  objc_property_t *v47;
  void *v48;
  NSObject *v49;
  void *v50;
  uint64_t v51;
  void *v52;
  NSString *aSelectorName;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  unsigned int outCount;
  uint8_t buf[4];
  void *v60;
  __int16 v61;
  NSString *v62;
  __int16 v63;
  Class v64;
  __int16 v65;
  void *v66;
  _BYTE v67[128];
  uint64_t v68;

  v68 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if ((void *)objc_opt_class() != a1)
  {
    objc_msgSend((id)objc_msgSend(a1, "superclass"), "_addPropertyAttributeMapToPropertyMapLocked:", v4);
    outCount = 0;
    v5 = class_copyPropertyList((Class)a1, &outCount);
    v6 = v5;
    if (outCount)
    {
      v7 = 0;
      v47 = v5;
      v48 = v4;
      v52 = a1;
      while (1)
      {
        v8 = (void *)MEMORY[0x1B5E08BF0]();
        v9 = v6[v7];
        aSelectorName = (NSString *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithCString:encoding:", property_getName(v9), 4);
        if (!objc_msgSend(a1, "cplShouldIgnorePropertyForCoding:"))
          break;
        if (!_CPLSilentLogging)
        {
          __CPLCodingOSLogDomain();
          v10 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412546;
            v60 = a1;
            v61 = 2112;
            v62 = aSelectorName;
            _os_log_impl(&dword_1B03C2000, v10, OS_LOG_TYPE_DEBUG, "Ignoring %@.%@ for coding", buf, 0x16u);
          }
LABEL_55:

        }
        objc_autoreleasePoolPop(v8);
        if (++v7 >= (unint64_t)outCount)
          goto LABEL_57;
      }
      v50 = v8;
      v51 = v7;
      v49 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithCString:encoding:", property_getAttributes(v9), 4);
      -[NSObject componentsSeparatedByString:](v49, "componentsSeparatedByString:", CFSTR(","));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_alloc_init(CPLCodingPropertyEntry);
      v54 = 0u;
      v55 = 0u;
      v56 = 0u;
      v57 = 0u;
      v13 = v11;
      v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v54, v67, 16);
      if (v14)
      {
        v15 = v14;
        v16 = 0;
        v17 = *(_QWORD *)v55;
LABEL_10:
        v18 = 0;
        while (2)
        {
          if (*(_QWORD *)v55 != v17)
            objc_enumerationMutation(v13);
          v19 = *(void **)(*((_QWORD *)&v54 + 1) + 8 * v18);
          v20 = __tolower(objc_msgSend(v19, "characterAtIndex:", 0));
          switch(v20)
          {
            case 'r':
              -[CPLCodingPropertyEntry setReadOnly:](v12, "setReadOnly:", 1);
              goto LABEL_23;
            case 's':
              objc_msgSend(v19, "substringFromIndex:", 1);
              v21 = objc_claimAutoreleasedReturnValue();
              v28 = NSSelectorFromString((NSString *)&v21->isa);
              MethodImplementation = class_getMethodImplementation((Class)a1, v28);
              -[CPLCodingPropertyEntry setPropertySetter:](v12, "setPropertySetter:", v28);
              -[CPLCodingPropertyEntry setPropertySetterIMP:](v12, "setPropertySetterIMP:", MethodImplementation);
              goto LABEL_22;
            case 't':
              v24 = objc_msgSend(v19, "characterAtIndex:", 1);
              -[CPLCodingPropertyEntry setPropertyType:](v12, "setPropertyType:", v24);
              if (v24 != 64)
              {
                if (v24 != 123)
                  goto LABEL_23;
                objc_msgSend(v19, "substringWithRange:", 2, objc_msgSend(v19, "length") - 3);
                v21 = objc_claimAutoreleasedReturnValue();
                -[NSObject componentsSeparatedByString:](v21, "componentsSeparatedByString:", CFSTR("="));
                v25 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v25, "objectAtIndex:", 0);
                v26 = (void *)objc_claimAutoreleasedReturnValue();
                -[CPLCodingPropertyEntry setStructName:](v12, "setStructName:", v26);

                goto LABEL_22;
              }
              if ((unint64_t)objc_msgSend(v19, "length") > 3)
              {
                objc_msgSend(v19, "substringWithRange:", 3, objc_msgSend(v19, "length") - 4);
                v30 = a1;
                v31 = (NSString *)objc_claimAutoreleasedReturnValue();
                v32 = NSClassFromString(v31);
                objc_msgSend(v30, "cplAdditionalSecureClassesForProperty:", aSelectorName);
                v33 = (void *)objc_claimAutoreleasedReturnValue();
                if (!_CPLSilentLogging)
                {
                  __CPLCodingOSLogDomain();
                  v34 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
                  {
                    *(_DWORD *)buf = 138413058;
                    v60 = v52;
                    v61 = 2112;
                    v62 = aSelectorName;
                    v63 = 2112;
                    v64 = v32;
                    v65 = 2112;
                    v66 = v33;
                    _os_log_impl(&dword_1B03C2000, v34, OS_LOG_TYPE_DEBUG, "Class for property %@.%@ is %@. Additional secure classes are %@", buf, 0x2Au);
                  }

                }
                if (v32)
                {
                  if (v33)
                    objc_msgSend(v33, "setByAddingObject:", v32);
                  else
                    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v32);
                  v35 = (void *)objc_claimAutoreleasedReturnValue();
                  -[CPLCodingPropertyEntry setPropertyClasses:](v12, "setPropertyClasses:", v35);

                }
                else if (v33)
                {
                  -[CPLCodingPropertyEntry setPropertyClasses:](v12, "setPropertyClasses:", v33);
                }

                a1 = v52;
              }
              else if (!_CPLSilentLogging)
              {
                __CPLCodingOSLogDomain();
                v21 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 138412546;
                  v60 = a1;
                  v61 = 2112;
                  v62 = aSelectorName;
                  _os_log_impl(&dword_1B03C2000, v21, OS_LOG_TYPE_ERROR, "Ignoring %@.%@ for coding as its type is too generic", buf, 0x16u);
                }
LABEL_22:

              }
LABEL_23:
              if (v15 != ++v18)
                continue;
              v36 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v54, v67, 16);
              v15 = v36;
              if (!v36)
                goto LABEL_44;
              goto LABEL_10;
            case 'u':
              goto LABEL_23;
            case 'v':
              objc_msgSend(v19, "substringFromIndex:", 1);
              v27 = objc_claimAutoreleasedReturnValue();

              v16 = (void *)v27;
              goto LABEL_23;
            default:
              if (v20 != 103)
                goto LABEL_23;
              objc_msgSend(v19, "substringFromIndex:", 1);
              v21 = objc_claimAutoreleasedReturnValue();
              v22 = NSSelectorFromString((NSString *)&v21->isa);
              v23 = class_getMethodImplementation((Class)a1, v22);
              -[CPLCodingPropertyEntry setPropertyGetter:](v12, "setPropertyGetter:", v22);
              -[CPLCodingPropertyEntry setPropertyGetterIMP:](v12, "setPropertyGetterIMP:", v23);
              goto LABEL_22;
          }
        }
      }
      v16 = 0;
LABEL_44:

      if (!-[CPLCodingPropertyEntry propertyGetter](v12, "propertyGetter"))
      {
        v37 = NSSelectorFromString(aSelectorName);
        v38 = class_getMethodImplementation((Class)a1, v37);
        -[CPLCodingPropertyEntry setPropertyGetter:](v12, "setPropertyGetter:", v37);
        -[CPLCodingPropertyEntry setPropertyGetterIMP:](v12, "setPropertyGetterIMP:", v38);
      }
      if (!-[CPLCodingPropertyEntry propertySetter](v12, "propertySetter")
        && !-[CPLCodingPropertyEntry isReadOnly](v12, "isReadOnly"))
      {
        v39 = objc_alloc(MEMORY[0x1E0CB3940]);
        v40 = __toupper(-[NSString characterAtIndex:](aSelectorName, "characterAtIndex:", 0));
        -[NSString substringFromIndex:](aSelectorName, "substringFromIndex:", 1);
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        v42 = (NSString *)objc_msgSend(v39, "initWithFormat:", CFSTR("set%c%@:"), v40, v41);

        v43 = NSSelectorFromString(v42);
        v44 = class_getMethodImplementation((Class)a1, v43);
        -[CPLCodingPropertyEntry setPropertySetter:](v12, "setPropertySetter:", v43);
        -[CPLCodingPropertyEntry setPropertySetterIMP:](v12, "setPropertySetterIMP:", v44);

      }
      if (!objc_msgSend(v16, "length"))
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("_%@"), aSelectorName);
        v45 = objc_claimAutoreleasedReturnValue();

        v16 = (void *)v45;
      }
      v6 = v47;
      v4 = v48;
      v8 = v50;
      v7 = v51;
      if (objc_msgSend(v16, "length"))
      {
        InstanceVariable = class_getInstanceVariable((Class)a1, (const char *)objc_msgSend(objc_retainAutorelease(v16), "UTF8String"));
        if (InstanceVariable)
          -[CPLCodingPropertyEntry setIvar:](v12, "setIvar:", InstanceVariable);
      }
      objc_msgSend(v48, "setObject:forKey:", v12, aSelectorName);

      v10 = v49;
      goto LABEL_55;
    }
LABEL_57:
    free(v6);
  }

}

+ (id)_cplPropertyAttributeMap
{
  id v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__11416;
  v9 = __Block_byref_object_dispose__11417;
  v10 = 0;
  if (_cplPropertyAttributeMap_onceToken != -1)
    dispatch_once(&_cplPropertyAttributeMap_onceToken, &__block_literal_global_92);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __52__NSObject_CPLCodingProxy___cplPropertyAttributeMap__block_invoke_2;
  v4[3] = &unk_1E60DA568;
  v4[4] = &v5;
  v4[5] = a1;
  dispatch_sync((dispatch_queue_t)_cplPropertyAttributeMap_lock, v4);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v2;
}

+ (void)cplDumpProperties
{
  NSObject *v2;
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  if (!_CPLSilentLogging)
  {
    __CPLCodingOSLogDomain();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(a1, "_cplPropertyAttributeMap");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = 138412290;
      v5 = v3;
      _os_log_impl(&dword_1B03C2000, v2, OS_LOG_TYPE_DEBUG, "%@", (uint8_t *)&v4, 0xCu);

    }
  }
}

+ (id)cplAllPropertyNames
{
  id v2;
  _QWORD block[7];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;
  _QWORD v11[3];
  uint64_t v12;

  v11[0] = 0;
  v11[1] = v11;
  v11[2] = 0x2050000000;
  v12 = 0;
  v12 = objc_opt_class();
  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__11416;
  v9 = __Block_byref_object_dispose__11417;
  v10 = 0;
  if (cplAllPropertyNames_onceToken != -1)
    dispatch_once(&cplAllPropertyNames_onceToken, &__block_literal_global_125);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __47__NSObject_CPLCodingProxy__cplAllPropertyNames__block_invoke_2;
  block[3] = &unk_1E60DA6C8;
  block[4] = &v5;
  block[5] = v11;
  block[6] = a1;
  dispatch_sync((dispatch_queue_t)cplAllPropertyNames_lock, block);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  _Block_object_dispose(v11, 8);
  return v2;
}

@end
