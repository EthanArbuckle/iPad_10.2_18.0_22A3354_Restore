@implementation BSAbstractDefaultDomain

+ (void)initialize
{
  uint64_t v3;
  _QWORD *v4;
  void *v5;
  BOOL v6;
  void *v7;
  id v8;
  void *v9;
  objc_class *v10;
  uint64_t v11;
  objc_property *v12;
  uint64_t v13;
  id v14;
  char v15;
  uint64_t v16;
  void *v17;
  id v18;
  char *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  char *v25;
  void *v26;
  uint64_t v27;
  char *v28;
  void *v29;
  char v30;
  void *v31;
  id v32;
  uint64_t v33;
  uint64_t v34;
  Class v35;
  void *v36;
  objc_class *v37;
  uint64_t v38;
  unsigned int v39;
  BSPropertyMetadata *v40;
  const char *v41;
  SEL v42;
  SEL v43;
  SEL v44;
  void *v45;
  id v46;
  void *v47;
  id v48;
  void *v49;
  id v50;
  void *v51;
  id v52;
  void *v53;
  id v54;
  void *v55;
  id v56;
  NSObject *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  objc_class *v64;
  id v65;
  void *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  void *v70;
  NSString *v71;
  const char *v72;
  void *v73;
  void *v74;
  id v75;
  NSString *v76;
  const char *v77;
  uint64_t v78;
  void (*v79)(void);
  void (*v80)(void);
  void *v81;
  uint64_t v82;
  uint64_t v83;
  id v84;
  const char *v85;
  id v86;
  const char *v87;
  uint64_t v88;
  objc_class *aClass;
  NSString *v90;
  uint64_t v91;
  _QWORD *v92;
  id v93;
  objc_property_t *v94;
  _QWORD *v95;
  uint64_t v96;
  id newValue;
  id newValuea;
  void *v99;
  uint64_t v100;
  uint8_t buf[16];
  __int128 v102;
  __int128 v103;
  __int128 v104;
  unsigned int outCount[32];
  uint64_t v106;

  v106 = *MEMORY[0x1E0C80C00];
  v3 = objc_opt_class();
  if (v3 != objc_opt_class())
  {
    v4 = -[BSAbstractDefaultDomainClassMetadata initWithClass:]([BSAbstractDefaultDomainClassMetadata alloc], v3);
    v93 = v4;
    if (v4)
      v4 = (_QWORD *)v4[1];
    NSStringFromClass((Class)v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v93)
      v6 = v5 == 0;
    else
      v6 = 1;
    if (!v6)
    {
      pthread_mutex_lock(&__classNameToSelectorLock);
      v7 = (void *)qword_1ECD398C8;
      if (!qword_1ECD398C8)
      {
        v8 = objc_alloc_init(MEMORY[0x1E0C99E08]);
        v9 = (void *)qword_1ECD398C8;
        qword_1ECD398C8 = (uint64_t)v8;

        v7 = (void *)qword_1ECD398C8;
      }
      objc_msgSend(v7, "setObject:forKey:", v93, v5);
      pthread_mutex_unlock(&__classNameToSelectorLock);
    }

    if (objc_msgSend(a1, "__useDynamicMethodResolution"))
    {
      v95 = v93;
      v91 = objc_opt_self();
      if (v93)
        v10 = (objc_class *)v95[1];
      else
        v10 = 0;
      outCount[0] = 0;
      v94 = class_copyPropertyList(v10, outCount);
      if (outCount[0])
      {
        v11 = 0;
        aClass = v10;
        while (1)
        {
          v12 = v94[v11];
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", property_getName(v12));
          v13 = objc_claimAutoreleasedReturnValue();
          v99 = (void *)v13;
          objc_opt_self();
          if (qword_1ECD398C0 != -1)
            dispatch_once(&qword_1ECD398C0, &__block_literal_global_12);
          v14 = (id)_MergedGlobals_14;
          v15 = objc_msgSend(v14, "containsObject:", v13);

          if ((v15 & 1) != 0)
            goto LABEL_56;
          v16 = objc_opt_self();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", property_getName(v12));
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v17)
          {
            objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
            v58 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v58, "handleFailureInMethod:object:file:lineNumber:description:", sel___getPropertyMetadataForProperty_class_, v16, CFSTR("BSAbstractDefaultDomain.m"), 389, CFSTR("Property name required."));

            v17 = 0;
          }
          v18 = v17;
          v19 = property_copyAttributeValue(v12, "G");
          newValue = v18;
          if (v19)
          {
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v19);
            newValue = (id)objc_claimAutoreleasedReturnValue();

            free(v19);
          }
          v20 = (void *)MEMORY[0x1E0CB3940];
          objc_msgSend(v18, "substringToIndex:", 1);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "capitalizedString");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "substringFromIndex:", 1);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "stringWithFormat:", CFSTR("set%@%@"), v22, v23);
          v24 = (void *)objc_claimAutoreleasedReturnValue();

          v25 = property_copyAttributeValue(v12, "S");
          if (v25)
          {
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v25);
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v26, "substringToIndex:", objc_msgSend(v26, "length") - 1);
            v27 = objc_claimAutoreleasedReturnValue();

            free(v25);
            v24 = (void *)v27;
          }
          v28 = property_copyAttributeValue(v12, "T");
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v28);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v28)
          {
            objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
            v59 = (void *)objc_claimAutoreleasedReturnValue();
            NSStringFromClass(aClass);
            v60 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v59, "handleFailureInMethod:object:file:lineNumber:description:", sel___getPropertyMetadataForProperty_class_, v16, CFSTR("BSAbstractDefaultDomain.m"), 411, CFSTR("Property type must be non-nil for property: %@ on class: %@"), v18, v60);

          }
          v30 = objc_msgSend(v29, "characterAtIndex:", 0);
          objc_msgSend(v29, "substringFromIndex:", 1);
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          if (v30 == 99)
            break;
          if (v30 != 64 || (unint64_t)objc_msgSend(v29, "length") < 2)
            goto LABEL_59;
          v32 = v31;
          v33 = objc_opt_self();
          v34 = objc_msgSend(v32, "length");
          if (objc_msgSend(v32, "characterAtIndex:", 0) != 34
            || objc_msgSend(v32, "characterAtIndex:", v34 - 1) != 34
            || (objc_msgSend(v32, "substringWithRange:", 1, v34 - 2),
                v90 = (NSString *)objc_claimAutoreleasedReturnValue(),
                v35 = NSClassFromString(v90),
                v90,
                !v35))
          {
            objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v36, "handleFailureInMethod:object:file:lineNumber:description:", sel___classFromPropertyType_, v33, CFSTR("BSAbstractDefaultDomain.m"), 493, CFSTR("Expected a class from property type attribute, but found none <propertyType = %@>"), v32);

            v35 = 0;
          }
          v37 = v35;

          if (!v28)
            goto LABEL_36;
LABEL_35:
          free(v28);
LABEL_36:
          objc_opt_self();
          v38 = 0;
          v39 = v30 - 64;
          if (v39 <= 0x33)
          {
            if (((1 << v39) & 0xA1250000A1204) != 0)
              goto LABEL_38;
            if (v30 == 64)
            {
              if ((objc_class *)objc_opt_class() != v37
                && (objc_class *)objc_opt_class() != v37
                && (objc_class *)objc_opt_class() != v37
                && (objc_class *)objc_opt_class() != v37
                && (objc_class *)objc_opt_class() != v37
                && (objc_class *)objc_opt_class() != v37
                && (objc_class *)objc_opt_class() != v37)
              {
                if ((objc_class *)objc_opt_class() == v37)
                {
                  BSLogCommon();
                  v57 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR))
                  {
                    *(_WORD *)buf = 0;
                    _os_log_error_impl(&dword_18A184000, v57, OS_LOG_TYPE_ERROR, "Warning: NSObject not explicitly supported because must be a plistable type.", buf, 2u);
                  }

                }
                v38 = 0;
                goto LABEL_41;
              }
LABEL_38:
              v40 = objc_alloc_init(BSPropertyMetadata);
              v38 = (uint64_t)v40;
              if (v40)
              {
                objc_setProperty_nonatomic_copy(v40, v41, v18, 48);
                objc_setProperty_nonatomic_copy((id)v38, v42, newValue, 32);
                objc_setProperty_nonatomic_copy((id)v38, v43, v24, 40);
                *(_BYTE *)(v38 + 8) = v30;
                objc_setProperty_nonatomic_copy((id)v38, v44, v31, 16);
              }
              -[BSPropertyMetadata setClassType:](v38, v37);
            }
          }
LABEL_41:

          if (!v38)
          {
            objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
            v61 = (void *)objc_claimAutoreleasedReturnValue();
            NSStringFromClass(aClass);
            v62 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v61, "handleFailureInMethod:object:file:lineNumber:description:", sel___processPropertyMetadata_, v91, CFSTR("BSAbstractDefaultDomain.m"), 372, CFSTR("Metadata required but not obtained for property with name: %@ [class=%@]"), v99, v62);

          }
          if (v93)
            v45 = (void *)v95[2];
          else
            v45 = 0;
          v46 = v45;
          if (v38)
            v47 = *(void **)(v38 + 48);
          else
            v47 = 0;
          v48 = v47;
          objc_msgSend(v46, "setObject:forKey:", v38, v48);

          if (v93)
            v49 = (void *)v95[3];
          else
            v49 = 0;
          v50 = v49;
          if (v38)
            v51 = *(void **)(v38 + 32);
          else
            v51 = 0;
          v52 = v51;
          objc_msgSend(v50, "setObject:forKey:", v38, v52);

          if (v93)
            v53 = (void *)v95[3];
          else
            v53 = 0;
          v54 = v53;
          if (v38)
            v55 = *(void **)(v38 + 40);
          else
            v55 = 0;
          v56 = v55;
          objc_msgSend(v54, "setObject:forKey:", v38, v56);

LABEL_56:
          if (++v11 >= (unint64_t)outCount[0])
            goto LABEL_82;
        }
        objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("BSUnsupportedTypeException"), CFSTR("Character types are explicitly unsupported in the default domain at this time."));
LABEL_59:
        v37 = 0;
        if (!v28)
          goto LABEL_36;
        goto LABEL_35;
      }
      if (v94)
LABEL_82:
        free(v94);

      v92 = v95;
      v96 = objc_opt_self();
      if (v93)
      {
        v64 = (objc_class *)v92[1];
        v63 = (void *)v92[2];
      }
      else
      {
        v64 = 0;
        v63 = 0;
      }
      v65 = v63;
      objc_msgSend(v65, "allValues");
      v66 = (void *)objc_claimAutoreleasedReturnValue();

      v103 = 0u;
      v104 = 0u;
      *(_OWORD *)buf = 0u;
      v102 = 0u;
      newValuea = v66;
      v67 = objc_msgSend(newValuea, "countByEnumeratingWithState:objects:count:", buf, outCount, 16);
      if (v67)
      {
        v100 = *(_QWORD *)v102;
        do
        {
          v68 = 0;
          do
          {
            if (*(_QWORD *)v102 != v100)
              objc_enumerationMutation(newValuea);
            v69 = *(_QWORD *)(*(_QWORD *)&buf[8] + 8 * v68);
            if (v69)
              v70 = *(void **)(v69 + 32);
            else
              v70 = 0;
            v71 = v70;
            v72 = NSSelectorFromString(v71);

            if (v69)
              v73 = *(void **)(v69 + 40);
            else
              v73 = 0;
            v74 = (void *)MEMORY[0x1E0CB3940];
            v75 = v73;
            objc_msgSend(v74, "stringWithFormat:", CFSTR("%@:"), v75);
            v76 = (NSString *)objc_claimAutoreleasedReturnValue();
            v77 = NSSelectorFromString(v76);

            if (!v69)
            {
LABEL_110:
              objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
              v81 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v81, "handleFailureInMethod:object:file:lineNumber:description:", sel___assignPropertyImplementations_, v96, CFSTR("BSAbstractDefaultDomain.m"), 592, CFSTR("Should always have a getter and setter available."));

              goto LABEL_126;
            }
            v78 = *(char *)(v69 + 8);
            if ((int)v78 > 99)
            {
              switch(*(_BYTE *)(v69 + 8))
              {
                case 'd':
                  v79 = (void (*)(void))sbDefaults_getDouble;
                  v80 = (void (*)(void))sbDefaults_setDouble;
                  break;
                case 'e':
                case 'g':
                case 'h':
                case 'j':
                case 'k':
                  goto LABEL_110;
                case 'f':
                  v79 = (void (*)(void))sbDefaults_getFloat;
                  v80 = (void (*)(void))sbDefaults_setFloat;
                  break;
                case 'i':
                  v79 = (void (*)(void))sbDefaults_getInt;
                  v80 = (void (*)(void))sbDefaults_setInt;
                  break;
                case 'l':
                  v79 = (void (*)(void))sbDefaults_getLong;
                  v80 = (void (*)(void))sbDefaults_setLong;
                  break;
                default:
                  if ((_DWORD)v78 == 113)
                  {
                    v79 = (void (*)(void))sbDefaults_getLongLong;
                    v80 = (void (*)(void))sbDefaults_setLongLong;
                  }
                  else
                  {
                    if ((_DWORD)v78 != 115)
                      goto LABEL_110;
                    v79 = (void (*)(void))sbDefaults_getShort;
                    v80 = (void (*)(void))sbDefaults_setShort;
                  }
                  break;
              }
            }
            else if ((int)v78 > 75)
            {
              switch((_DWORD)v78)
              {
                case 'L':
                  v79 = (void (*)(void))sbDefaults_getUnsignedLong;
                  v80 = (void (*)(void))sbDefaults_setUnsignedLong;
                  break;
                case 'Q':
                  v79 = (void (*)(void))sbDefaults_getUnsignedLongLong;
                  v80 = (void (*)(void))sbDefaults_setUnsignedLongLong;
                  break;
                case 'S':
                  v79 = (void (*)(void))sbDefaults_getUnsignedShort;
                  v80 = (void (*)(void))sbDefaults_setUnsignedShort;
                  break;
                default:
                  goto LABEL_110;
              }
            }
            else
            {
              switch((_DWORD)v78)
              {
                case '@':
                  v82 = *(_QWORD *)(v69 + 24);
                  v83 = objc_opt_class();
                  if (v82 == v83)
                    v79 = (void (*)(void))sbDefaults_getURL;
                  else
                    v79 = (void (*)(void))sbDefaults_getObject;
                  if (v82 == v83)
                    v80 = (void (*)(void))sbDefaults_setURL;
                  else
                    v80 = (void (*)(void))sbDefaults_setObject;
                  v78 = *(char *)(v69 + 8);
                  break;
                case 'B':
                  v79 = (void (*)(void))sbDefaults_getBool;
                  v80 = (void (*)(void))sbDefaults_setBool;
                  break;
                case 'I':
                  v79 = (void (*)(void))sbDefaults_getUnsignedInt;
                  v80 = (void (*)(void))sbDefaults_setUnsignedInt;
                  break;
                default:
                  goto LABEL_110;
              }
            }
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%c@:"), v78);
            v84 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
            v85 = (const char *)objc_msgSend(v84, "UTF8String");

            class_addMethod(v64, v72, v79, v85);
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("v@:%c"), *(char *)(v69 + 8));
            v86 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
            v87 = (const char *)objc_msgSend(v86, "UTF8String");

            class_addMethod(v64, v77, v80, v87);
LABEL_126:
            ++v68;
          }
          while (v67 != v68);
          v88 = objc_msgSend(newValuea, "countByEnumeratingWithState:objects:count:", buf, outCount, 16);
          v67 = v88;
        }
        while (v88);
      }

    }
  }
}

+ (BOOL)__useDynamicMethodResolution
{
  return 1;
}

- (id)_initWithDomain:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  id v11;
  void *v13;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("BSAbstractDefaultDomain.m"), 135, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("domain"));

  }
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bundleIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v5, "isEqualToString:", v7);

  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99EA0]), "initWithSuiteName:", v5);
  }
  v10 = v9;
  objc_msgSend(v9, "bs_setDomain:", v5);
  v11 = -[BSAbstractDefaultDomain _initWithDefaults:](self, "_initWithDefaults:", v10);

  return v11;
}

- (id)_initWithDefaults:(id)a3
{
  id v5;
  BSAbstractDefaultDomain *v6;
  BSAbstractDefaultDomain *v7;
  NSMutableDictionary *v8;
  NSMutableDictionary *defaultKeyToDefaultValue;
  dispatch_queue_t Serial;
  OS_dispatch_queue *observerQueue;
  NSMutableSet *v12;
  NSMutableSet *observerQueue_observers;
  objc_class *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  id v25;
  _BOOL4 v26;
  void *v27;
  void *v28;
  id v29;
  uint64_t v30;
  objc_super v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v32.receiver = self;
  v32.super_class = (Class)BSAbstractDefaultDomain;
  v6 = -[BSAbstractDefaultDomain init](&v32, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_userDefaults, a3);
    v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    defaultKeyToDefaultValue = v7->_defaultKeyToDefaultValue;
    v7->_defaultKeyToDefaultValue = v8;

    Serial = BSDispatchQueueCreateSerial(CFSTR("observerQueue"));
    observerQueue = v7->_observerQueue;
    v7->_observerQueue = (OS_dispatch_queue *)Serial;

    v12 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    observerQueue_observers = v7->_observerQueue_observers;
    v7->_observerQueue_observers = v12;

    if (!v7->_boundDefaults)
    {
      if (objc_msgSend((id)objc_opt_class(), "__useDynamicMethodResolution"))
      {
        -[BSAbstractDefaultDomain _bindAndRegisterDefaults](v7, "_bindAndRegisterDefaults");
        v35 = 0u;
        v36 = 0u;
        v33 = 0u;
        v34 = 0u;
        v14 = (objc_class *)objc_opt_class();
        __getMetadataForClass(v14);
        v15 = objc_claimAutoreleasedReturnValue();
        v16 = (void *)v15;
        if (v15)
          v17 = *(void **)(v15 + 16);
        else
          v17 = 0;
        v18 = v17;
        objc_msgSend(v18, "allValues");
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
        if (v20)
        {
          v21 = *(_QWORD *)v34;
          do
          {
            v22 = 0;
            do
            {
              if (*(_QWORD *)v34 != v21)
                objc_enumerationMutation(v19);
              v23 = *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * v22);
              if (v23)
                v24 = *(void **)(v23 + 56);
              else
                v24 = 0;
              v25 = v24;
              v26 = v25 == 0;

              if (v26)
              {
                objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
                v27 = (void *)objc_claimAutoreleasedReturnValue();
                if (v23)
                  v28 = *(void **)(v23 + 48);
                else
                  v28 = 0;
                v29 = v28;
                objc_msgSend(v27, "handleFailureInMethod:object:file:lineNumber:description:", sel__bindDefaultsIfNecessary, v7, CFSTR("BSAbstractDefaultDomain.m"), 315, CFSTR("Expected default key specified for property: %@.  Use BIND_DEFAULT_AND_KEY to assign it."), v29);

              }
              ++v22;
            }
            while (v20 != v22);
            v30 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
            v20 = v30;
          }
          while (v30);
        }

        -[NSUserDefaults registerDefaults:](v7->_userDefaults, "registerDefaults:", v7->_defaultKeyToDefaultValue);
      }
      v7->_boundDefaults = 1;
    }
  }

  return v7;
}

- (id)_store
{
  return self->_userDefaults;
}

- (id)_propertyFromSelector:(uint64_t)a1
{
  void *v4;
  uint64_t v5;
  objc_class *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v13;
  void *v14;
  objc_class *v15;
  void *v16;

  if (a1)
  {
    if (!aSelector)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", sel__propertyFromSelector_, a1, CFSTR("BSAbstractDefaultDomain.m"), 334, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("selector"));

    }
    NSStringFromSelector(aSelector);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "hasSuffix:", CFSTR(":")))
    {
      objc_msgSend(v4, "substringToIndex:", objc_msgSend(v4, "length") - 1);
      v5 = objc_claimAutoreleasedReturnValue();

      v4 = (void *)v5;
    }
    v6 = (objc_class *)objc_opt_class();
    __getMetadataForClass(v6);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = (void *)v7;
    if (v7)
      v9 = *(void **)(v7 + 24);
    else
      v9 = 0;
    v10 = v9;
    objc_msgSend(v10, "objectForKey:", v4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v11)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = (objc_class *)objc_opt_class();
      NSStringFromClass(v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", sel__propertyFromSelector_, a1, CFSTR("BSAbstractDefaultDomain.m"), 344, CFSTR("Unable to resolve property metadata for selector: '%@' on class: %@"), v4, v16);

    }
  }
  else
  {
    v11 = 0;
  }
  return v11;
}

- (void)dealloc
{
  objc_super v3;

  -[NSMutableSet removeAllObjects](self->_observerQueue_observers, "removeAllObjects");
  v3.receiver = self;
  v3.super_class = (Class)BSAbstractDefaultDomain;
  -[BSAbstractDefaultDomain dealloc](&v3, sel_dealloc);
}

- (void)_bindProperty:(id)a3 withDefaultKey:(id)a4 toDefaultValue:(id)a5 options:(unint64_t)a6
{
  id v11;
  id v12;
  _QWORD *v13;
  objc_class *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;
  const char *v19;
  void *v20;
  void *v21;
  void *v22;
  objc_class *v23;
  void *v24;
  id v25;

  v25 = a3;
  v11 = a4;
  v12 = a5;
  if (v25)
  {
    if (v11)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("BSAbstractDefaultDomain.m"), 217, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("propertyName"));

    if (v11)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("BSAbstractDefaultDomain.m"), 218, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("defaultKey"));

LABEL_3:
  if (!self->_boundDefaults)
  {
    v14 = (objc_class *)objc_opt_class();
    __getMetadataForClass(v14);
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = (void *)v15;
    if (v15)
      v17 = *(void **)(v15 + 16);
    else
      v17 = 0;
    v18 = v17;
    objc_msgSend(v18, "objectForKey:", v25);
    v13 = (_QWORD *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      objc_setProperty_nonatomic_copy(v13, v19, v11, 56);
      -[BSPropertyMetadata setDefaultValue:]((uint64_t)v13, v12);
      v13[9] = a6;
      if (!v12)
        goto LABEL_10;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = (objc_class *)objc_opt_class();
      NSStringFromClass(v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("BSAbstractDefaultDomain.m"), 228, CFSTR("Must have a property to bind to, but didn't find one for property: %@ [Class=%@]"), v25, v24);

      -[BSPropertyMetadata setDefaultValue:](0, v12);
      if (!v12)
        goto LABEL_10;
    }
    -[NSMutableDictionary setObject:forKey:](self->_defaultKeyToDefaultValue, "setObject:forKey:", v12, v11);
    goto LABEL_10;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v13 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("BSAbstractDefaultDomain.m"), 223, CFSTR("Cannot bind new defaults after we've registered them."));
LABEL_10:

}

void __47__BSAbstractDefaultDomain___excludedProperties__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", &unk_1E1EDA1E8);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_MergedGlobals_14;
  _MergedGlobals_14 = v0;

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_defaultKeyToDefaultValue, 0);
  objc_storeStrong((id *)&self->_observerQueue_observers, 0);
  objc_storeStrong((id *)&self->_observerQueue, 0);
  objc_storeStrong((id *)&self->_userDefaults, 0);
}

- (BSAbstractDefaultDomain)init
{
  return (BSAbstractDefaultDomain *)-[BSAbstractDefaultDomain _initWithDomain:](self, "_initWithDomain:", 0);
}

- (void)synchronizeDefaults
{
  -[NSUserDefaults synchronize](self->_userDefaults, "synchronize");
}

- (id)observeDefault:(id)a3 onQueue:(id)a4 withBlock:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;

  v8 = a4;
  v9 = a5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[BSAbstractDefaultDomain observeDefaults:onQueue:withBlock:](self, "observeDefaults:onQueue:withBlock:", v10, v8, v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)observeDefaults:(id)a3 onQueue:(id)a4 withBlock:(id)a5
{
  id v8;
  id v9;
  id v10;
  id *v11;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = -[_BSDefaultObserver initWithAbstractDefaultDomain:defaultsToObserve:onQueue:withBlock:]([_BSDefaultObserver alloc], self, v8, v9, v10);

  return v11;
}

- (void)resetAllDefaults
{
  void *v2;
  objc_class *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  _QWORD *v12;
  _QWORD *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  -[BSAbstractDefaultDomain _store](self, "_store");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v3 = (objc_class *)objc_opt_class();
  __getMetadataForClass(v3);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  if (v4)
    v6 = *(void **)(v4 + 16);
  else
    v6 = 0;
  v7 = v6;
  objc_msgSend(v7, "allValues", (_QWORD)v14);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v15 != v10)
          objc_enumerationMutation(v8);
        v12 = *(_QWORD **)(*((_QWORD *)&v14 + 1) + 8 * i);
        if (v12)
          v12 = (_QWORD *)v12[7];
        v13 = v12;
        objc_msgSend(v2, "removeObjectForKey:", v13);

      }
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v9);
  }

}

- (void)_addObserver:(uint64_t)a1
{
  id v3;
  NSObject *v4;
  id v5;
  _QWORD block[5];
  id v7;

  v3 = a2;
  if (a1 && v3)
  {
    v4 = *(NSObject **)(a1 + 24);
    block[1] = 3221225472;
    block[2] = __40__BSAbstractDefaultDomain__addObserver___block_invoke;
    block[3] = &unk_1E1EBE700;
    block[4] = a1;
    v5 = v3;
    block[0] = MEMORY[0x1E0C809B0];
    v7 = v3;
    dispatch_sync(v4, block);

    v3 = v5;
  }

}

uint64_t __40__BSAbstractDefaultDomain__addObserver___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "addObject:", *(_QWORD *)(a1 + 40));
}

- (void)_removeObserver:(uint64_t)a1
{
  id v3;
  NSObject *v4;
  id v5;
  _QWORD block[5];
  id v7;

  v3 = a2;
  if (a1 && v3)
  {
    v4 = *(NSObject **)(a1 + 24);
    block[1] = 3221225472;
    block[2] = __43__BSAbstractDefaultDomain__removeObserver___block_invoke;
    block[3] = &unk_1E1EBE700;
    block[4] = a1;
    v5 = v3;
    block[0] = MEMORY[0x1E0C809B0];
    v7 = v3;
    dispatch_sync(v4, block);

    v3 = v5;
  }

}

uint64_t __43__BSAbstractDefaultDomain__removeObserver___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "containsObject:", *(_QWORD *)(a1 + 40));
  if ((_DWORD)result)
    return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "removeObject:", *(_QWORD *)(a1 + 40));
  return result;
}

- (void)_bindProperty:(id)a3 withDefaultKey:(id)a4
{
  -[BSAbstractDefaultDomain _bindProperty:withDefaultKey:toDefaultValue:](self, "_bindProperty:withDefaultKey:toDefaultValue:", a3, a4, 0);
}

- (void)_bindProperty:(id)a3 withDefaultKey:(id)a4 toDefaultValue:(id)a5
{
  -[BSAbstractDefaultDomain _bindProperty:withDefaultKey:toDefaultValue:options:](self, "_bindProperty:withDefaultKey:toDefaultValue:options:", a3, a4, a5, 1);
}

- (id)description
{
  __CFString *v3;
  void *v4;
  id v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t);
  void *v14;
  BSAbstractDefaultDomain *v15;
  id v16;

  v3 = CFSTR("\t");
  if (self)
  {
    +[BSDescriptionBuilder builderWithObject:](BSDescriptionBuilder, "builderWithObject:", self);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = MEMORY[0x1E0C809B0];
    v12 = 3221225472;
    v13 = __65__BSAbstractDefaultDomain_descriptionBuilderWithMultilinePrefix___block_invoke;
    v14 = &unk_1E1EBE700;
    v15 = self;
    v5 = v4;
    v16 = v5;
    v6 = (id)objc_msgSend(v5, "modifyBody:", &v11);
    v7 = v16;
    v8 = v5;

    objc_msgSend(v8, "build", v11, v12, v13, v14, v15);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

void __65__BSAbstractDefaultDomain_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  objc_class *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  _BOOL4 v19;
  void *v20;
  id v21;
  id v22;
  uint64_t v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v2 = (objc_class *)objc_opt_class();
  __getMetadataForClass(v2);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  if (v3)
    v5 = *(void **)(v3 + 16);
  else
    v5 = 0;
  v6 = v5;
  objc_msgSend(v6, "allValues");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v8 = v7;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v25;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v25 != v10)
          objc_enumerationMutation(v8);
        v12 = *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * v11);
        if (v12)
          v13 = *(void **)(v12 + 48);
        else
          v13 = 0;
        v14 = v13;
        objc_msgSend(*(id *)(a1 + 32), "valueForKey:", v14, (_QWORD)v24);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = v15;
        if (v12 && *(_BYTE *)(v12 + 8) == 66)
        {
          v17 = (id)objc_msgSend(*(id *)(a1 + 40), "appendBool:withName:", objc_msgSend(v15, "BOOLValue"), v14);
        }
        else if (v15)
        {
          v18 = (id)objc_msgSend(*(id *)(a1 + 40), "appendObject:withName:", v15, v14);
        }
        else
        {
          v19 = -[BSPropertyMetadata isNumber](v12);
          v20 = *(void **)(a1 + 40);
          if (v19)
            v21 = (id)objc_msgSend(v20, "appendInt:withName:", 0, v14);
          else
            v22 = (id)objc_msgSend(v20, "appendObject:withName:", CFSTR("nil"), v14);
        }

        ++v11;
      }
      while (v9 != v11);
      v23 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
      v9 = v23;
    }
    while (v23);
  }

}

- (void)_setUserDefaults:(id)a3
{
  NSUserDefaults *v5;
  NSUserDefaults **p_userDefaults;
  NSUserDefaults *userDefaults;
  NSUserDefaults *v8;

  v5 = (NSUserDefaults *)a3;
  userDefaults = self->_userDefaults;
  p_userDefaults = &self->_userDefaults;
  if (userDefaults != v5)
  {
    v8 = v5;
    objc_storeStrong((id *)p_userDefaults, a3);
    v5 = v8;
  }

}

- (id)_defaultKeyFromPropertyName:(id)a1
{
  id v3;
  objc_class *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD *v9;
  void *v10;
  void *v12;
  objc_class *v13;
  void *v14;

  v3 = a2;
  if (a1)
  {
    v4 = (objc_class *)objc_opt_class();
    __getMetadataForClass(v4);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = (void *)v5;
    if (v5)
      v7 = *(void **)(v5 + 16);
    else
      v7 = 0;
    v8 = v7;
    objc_msgSend(v8, "objectForKey:", v3);
    v9 = (_QWORD *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      v10 = (void *)v9[7];
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = (objc_class *)objc_opt_class();
      NSStringFromClass(v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", sel__defaultKeyFromPropertyName_, a1, CFSTR("BSAbstractDefaultDomain.m"), 328, CFSTR("Must have property for default: '%@' on class: %@"), v3, v14);

      v10 = 0;
    }
    a1 = v10;

  }
  return a1;
}

@end
