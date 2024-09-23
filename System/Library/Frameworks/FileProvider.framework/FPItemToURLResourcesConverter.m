@implementation FPItemToURLResourcesConverter

- (id)_dictionaryFromItem:(id)a3 requestedKeys:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  char v10;
  _QWORD *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  id v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t i;
  uint64_t v29;
  void *v30;
  void (*v31)(void *, SEL);
  void *v32;
  NSString *v33;
  void *v34;
  SEL v35;
  id v36;
  int v37;
  uint64_t v38;
  NSObject *v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  void *v43;
  int v44;
  void *v45;
  int v46;
  id *v47;
  id v48;
  NSObject *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  void *v57;
  void *v58;
  void *v59;
  NSObject *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  void *v68;
  void *v69;
  NSObject *v70;
  _BOOL4 v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  void *v88;
  uint64_t v89;
  void *v91;
  id obj;
  void *v93;
  void *v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  uint8_t buf[4];
  id v100;
  __int16 v101;
  NSString *v102;
  _BYTE v103[128];
  uint64_t v104;

  v104 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_opt_new();
  objc_msgSend(v6, "filename");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v9, *MEMORY[0x1E0C99A90]);

  v10 = objc_opt_respondsToSelector();
  v11 = (_QWORD *)MEMORY[0x1E0C99AD0];
  if ((v10 & 1) != 0)
  {
    objc_msgSend(v6, "contentType");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v12, *MEMORY[0x1E0C998E0]);

    objc_msgSend(v6, "contentType");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "identifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v14, *v11);

  }
  else
  {
    v15 = *MEMORY[0x1E0C99AD0];
    objc_msgSend(v6, "typeIdentifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v13, v15);
  }

  v89 = *MEMORY[0x1E0C99B18];
  if (objc_msgSend(v7, "containsObject:"))
  {
    v16 = *MEMORY[0x1E0C99B00];
    if ((objc_msgSend(v7, "containsObject:", *MEMORY[0x1E0C99B00]) & 1) == 0)
    {
      objc_msgSend(v7, "arrayByAddingObject:", v16);
      v17 = objc_claimAutoreleasedReturnValue();

      v7 = (id)v17;
    }
  }
  v18 = *MEMORY[0x1E0C99B90];
  if (objc_msgSend(v7, "containsObject:", *MEMORY[0x1E0C99B90]))
  {
    objc_msgSend(v7, "arrayByAddingObject:", *MEMORY[0x1E0C99B58]);
    v19 = objc_claimAutoreleasedReturnValue();

    v7 = (id)v19;
  }
  v86 = *MEMORY[0x1E0C99B70];
  if (objc_msgSend(v7, "containsObject:"))
  {
    objc_msgSend(v7, "arrayByAddingObject:", *MEMORY[0x1E0C99B68]);
    v20 = objc_claimAutoreleasedReturnValue();

    v7 = (id)v20;
  }
  v87 = *MEMORY[0x1E0C99A38];
  if (objc_msgSend(v7, "containsObject:"))
  {
    v21 = *MEMORY[0x1E0C99B00];
    if ((objc_msgSend(v7, "containsObject:", *MEMORY[0x1E0C99B00]) & 1) == 0)
    {
      objc_msgSend(v7, "arrayByAddingObject:", v21);
      v22 = objc_claimAutoreleasedReturnValue();

      v7 = (id)v22;
    }
  }
  v91 = v8;
  v93 = v6;
  v88 = v7;
  v85 = v18;
  if (v7)
  {
    v23 = v7;
  }
  else
  {
    -[NSMutableDictionary allKeys](self->_gettersByURLKey, "allKeys");
    v23 = (id)objc_claimAutoreleasedReturnValue();
  }
  v24 = v23;
  FPItemPropertyNamesByURLResourceKey();
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  v95 = 0u;
  v96 = 0u;
  v97 = 0u;
  v98 = 0u;
  obj = v24;
  v25 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v95, v103, 16);
  if (v25)
  {
    v26 = v25;
    v27 = *(_QWORD *)v96;
    do
    {
      for (i = 0; i != v26; ++i)
      {
        if (*(_QWORD *)v96 != v27)
          objc_enumerationMutation(obj);
        v29 = *(_QWORD *)(*((_QWORD *)&v95 + 1) + 8 * i);
        -[NSMutableDictionary objectForKeyedSubscript:](self->_gettersByURLKey, "objectForKeyedSubscript:", v29);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = (void (*)(void *, SEL))objc_msgSend(v30, "pointerValue");

        -[NSMutableDictionary objectForKeyedSubscript:](self->_typesByURLKey, "objectForKeyedSubscript:", v29);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        if (v31)
        {
          objc_msgSend(v94, "objectForKeyedSubscript:", v29);
          v33 = (NSString *)objc_claimAutoreleasedReturnValue();
          if (!v33)
          {
            objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v34, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("FPItemConversion.m"), 404, CFSTR("property doesn't exist"));

          }
          v35 = NSSelectorFromString(v33);
          v36 = objc_retainAutorelease(v32);
          v37 = *(char *)objc_msgSend(v36, "UTF8String");
          if (v37 <= 80)
          {
            switch(v37)
            {
              case '@':
                v31(v93, v35);
                v38 = objc_claimAutoreleasedReturnValue();
                break;
              case 'B':
                objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", ((uint64_t (*)(void *, SEL))v31)(v93, v35));
                v38 = objc_claimAutoreleasedReturnValue();
                break;
              case 'L':
                objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", ((uint64_t (*)(void *, SEL))v31)(v93, v35));
                v38 = objc_claimAutoreleasedReturnValue();
                break;
              default:
                goto LABEL_40;
            }
          }
          else if (v37 > 107)
          {
            if (v37 == 108)
            {
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLong:", ((uint64_t (*)(void *, SEL))v31)(v93, v35));
              v38 = objc_claimAutoreleasedReturnValue();
            }
            else
            {
              if (v37 != 113)
                goto LABEL_40;
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", ((uint64_t (*)(void *, SEL))v31)(v93, v35));
              v38 = objc_claimAutoreleasedReturnValue();
            }
          }
          else
          {
            if (v37 != 81)
            {
              if (v37 == 99)
              {
                objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithChar:", ((uint64_t (*)(void *, SEL))v31)(v93, v35));
                v38 = objc_claimAutoreleasedReturnValue();
                goto LABEL_43;
              }
LABEL_40:
              fp_current_or_default_log();
              v39 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138412546;
                v100 = v36;
                v101 = 2112;
                v102 = v33;
                _os_log_error_impl(&dword_1A0A34000, v39, OS_LOG_TYPE_ERROR, "[ERROR] unsupported type '%@' for property: %@", buf, 0x16u);
              }
LABEL_45:

              goto LABEL_46;
            }
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", ((uint64_t (*)(void *, SEL))v31)(v93, v35));
            v38 = objc_claimAutoreleasedReturnValue();
          }
LABEL_43:
          v39 = v38;
          if (v38)
          {
            objc_msgSend(v91, "setObject:forKeyedSubscript:", v38, v29);
            goto LABEL_45;
          }
LABEL_46:

        }
      }
      v26 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v95, v103, 16);
    }
    while (v26);
  }

  v40 = *MEMORY[0x1E0C99A50];
  objc_msgSend(v91, "objectForKeyedSubscript:", *MEMORY[0x1E0C99A50]);
  v41 = objc_claimAutoreleasedReturnValue();
  if (v41)
  {
    v42 = (void *)v41;
    objc_msgSend(v91, "objectForKeyedSubscript:", *MEMORY[0x1E0C99B30]);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = objc_msgSend(v43, "BOOLValue");

    if (v44)
    {
      objc_msgSend(v91, "objectForKeyedSubscript:", v40);
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      v46 = objc_msgSend(v45, "BOOLValue");

      v47 = (id *)MEMORY[0x1E0C99B80];
      if (v46)
        v47 = (id *)MEMORY[0x1E0C99B88];
      v48 = *v47;
      objc_msgSend(v91, "setObject:forKeyedSubscript:", v48, *MEMORY[0x1E0C99B50]);

    }
  }
  if (objc_msgSend(v88, "containsObject:", v89))
  {
    fp_current_or_default_log();
    v49 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v49, OS_LOG_TYPE_DEBUG))
      -[FPItemToURLResourcesConverter _dictionaryFromItem:requestedKeys:].cold.4(v49, v50, v51, v52, v53, v54, v55, v56);

    objc_msgSend(v91, "objectForKeyedSubscript:", *MEMORY[0x1E0C99B00]);
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    v58 = v57;
    if (v57)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v57, "isEqual:", *MEMORY[0x1E0C99B08]) ^ 1);
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v91, "setObject:forKeyedSubscript:", v59, v89);

    }
  }
  if (objc_msgSend(v88, "containsObject:", v85))
  {
    fp_current_or_default_log();
    v60 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v60, OS_LOG_TYPE_DEBUG))
      -[FPItemToURLResourcesConverter _dictionaryFromItem:requestedKeys:].cold.3(v60, v61, v62, v63, v64, v65, v66, v67);

    objc_msgSend(v91, "objectForKeyedSubscript:", *MEMORY[0x1E0C99B58]);
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v91, "setObject:forKeyedSubscript:", v68, v85);

  }
  if (objc_msgSend(v88, "containsObject:", v86))
  {
    objc_msgSend(v91, "objectForKeyedSubscript:", *MEMORY[0x1E0C99B68]);
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    fp_current_or_default_log();
    v70 = objc_claimAutoreleasedReturnValue();
    v71 = os_log_type_enabled(v70, OS_LOG_TYPE_DEBUG);
    if (v69)
    {
      if (v71)
        -[FPItemToURLResourcesConverter _dictionaryFromItem:requestedKeys:].cold.2(v70, v72, v73, v74, v75, v76, v77, v78);

      objc_msgSend(MEMORY[0x1E0CB3858], "localizedStringFromPersonNameComponents:style:options:", v69, 0, 0);
      v79 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v91, "setObject:forKeyedSubscript:", v79, v86);

    }
    else
    {
      if (v71)
        -[FPItemToURLResourcesConverter _dictionaryFromItem:requestedKeys:].cold.1((uint64_t)v93, v70);

      objc_msgSend(v91, "setObject:forKeyedSubscript:", 0, v86);
    }

  }
  if (objc_msgSend(v88, "containsObject:", v87))
  {
    objc_msgSend(v91, "objectForKeyedSubscript:", v87);
    v80 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v80)
    {
      v81 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v91, "objectForKeyedSubscript:", *MEMORY[0x1E0C99B00]);
      v82 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v81, "numberWithInt:", v82 != 0);
      v83 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v91, "setObject:forKeyedSubscript:", v83, v87);

    }
  }

  return v91;
}

+ (id)dictionaryFromItem:(id)a3 requestedKeys:(id)a4
{
  id v7;
  id v8;
  objc_class *v9;
  void *v10;
  NSObject *v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t block;
  uint64_t v17;
  void (*v18)(_QWORD *);
  void *v19;
  id v20;
  uint64_t *v21;
  objc_class *v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;

  v7 = a3;
  v8 = a4;
  if (v7)
  {
    if (dictionaryFromItem_requestedKeys__once != -1)
      dispatch_once(&dictionaryFromItem_requestedKeys__once, &__block_literal_global_308);
    v23 = 0;
    v24 = &v23;
    v25 = 0x3032000000;
    v26 = __Block_byref_object_copy__31;
    v27 = __Block_byref_object_dispose__31;
    v28 = 0;
    v9 = (objc_class *)objc_opt_class();
    NSStringFromClass(v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = dictionaryFromItem_requestedKeys__queue;
    block = MEMORY[0x1E0C809B0];
    v17 = 3221225472;
    v18 = __66__FPItemToURLResourcesConverter_dictionaryFromItem_requestedKeys___block_invoke_310;
    v19 = &unk_1E444FFA0;
    v21 = &v23;
    v12 = v10;
    v20 = v12;
    v22 = v9;
    dispatch_sync(v11, &block);
    objc_msgSend((id)v24[5], "_dictionaryFromItem:requestedKeys:", v7, v8);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v13)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("FPItemConversion.m"), 524, CFSTR("couldn't convert item: %@"), v7, block, v17, v18, v19);

    }
    _Block_object_dispose(&v23, 8);

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (FPItemToURLResourcesConverter)initWithItemClass:(Class)a3
{
  FPItemToURLResourcesConverter *v4;
  NSObject *v5;
  uint64_t v6;
  NSMutableDictionary *gettersByURLKey;
  uint64_t v8;
  NSMutableDictionary *typesByURLKey;
  uint64_t section;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)FPItemToURLResourcesConverter;
  v4 = -[FPItemToURLResourcesConverter init](&v12, sel_init);
  if (v4)
  {
    section = __fp_create_section();
    fp_current_or_default_log();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      -[FPItemToURLResourcesConverter initWithItemClass:].cold.1();

    v6 = objc_opt_new();
    gettersByURLKey = v4->_gettersByURLKey;
    v4->_gettersByURLKey = (NSMutableDictionary *)v6;

    v8 = objc_opt_new();
    typesByURLKey = v4->_typesByURLKey;
    v4->_typesByURLKey = (NSMutableDictionary *)v8;

    -[FPItemToURLResourcesConverter _addHelperMethodsToClass:](v4, "_addHelperMethodsToClass:", a3);
    -[FPItemToURLResourcesConverter _cacheImplementedPropertiesForClass:](v4, "_cacheImplementedPropertiesForClass:", a3);
    __fp_leave_section_Debug((uint64_t)&section);
  }
  return v4;
}

- (void)_addMethod:(SEL)a3 toClass:(Class)a4
{
  objc_class *v6;
  void (*MethodImplementation)(void);
  objc_class *v8;
  objc_method *InstanceMethod;
  const char *TypeEncoding;

  v6 = (objc_class *)objc_opt_class();
  MethodImplementation = class_getMethodImplementation(v6, a3);
  v8 = (objc_class *)objc_opt_class();
  InstanceMethod = class_getInstanceMethod(v8, a3);
  TypeEncoding = method_getTypeEncoding(InstanceMethod);
  class_addMethod(a4, a3, MethodImplementation, TypeEncoding);
}

- (void)_addHelperMethodsToClass:(Class)a3
{
  -[FPItemToURLResourcesConverter _addMethod:toClass:](self, "_addMethod:toClass:", sel_fp_downloadingStatus, a3);
  -[FPItemToURLResourcesConverter _addMethod:toClass:](self, "_addMethod:toClass:", sel_fp_isReadable, a3);
  -[FPItemToURLResourcesConverter _addMethod:toClass:](self, "_addMethod:toClass:", sel_fp_isWritable, a3);
  -[FPItemToURLResourcesConverter _addMethod:toClass:](self, "_addMethod:toClass:", sel_fp_sharingCurrentUserRole, a3);
  -[FPItemToURLResourcesConverter _addMethod:toClass:](self, "_addMethod:toClass:", sel_fp_sharingCurrentUserPermissions, a3);
}

- (void)_cacheImplementedPropertiesForClass:(Class)a3
{
  NSObject *v4;
  id v5;
  uint64_t v6;
  __int128 v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  NSString *v11;
  const char *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  __int128 v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint64_t section;
  uint8_t buf[4];
  NSString *v26;
  __int16 v27;
  Class v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  section = __fp_create_section();
  fp_current_or_default_log();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    -[FPItemToURLResourcesConverter _cacheImplementedPropertiesForClass:].cold.1();

  FPItemPropertyNamesByURLResourceKey();
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v20, v29, 16);
  if (v6)
  {
    v8 = *(_QWORD *)v21;
    *(_QWORD *)&v7 = 138412546;
    v18 = v7;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v21 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * i);
        objc_msgSend(v5, "objectForKeyedSubscript:", v10, v18);
        v11 = (NSString *)objc_claimAutoreleasedReturnValue();
        v12 = NSSelectorFromString(v11);
        if ((-[objc_class instancesRespondToSelector:](a3, "instancesRespondToSelector:", v12) & 1) != 0)
        {
          -[objc_class instanceMethodSignatureForSelector:](a3, "instanceMethodSignatureForSelector:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = (void *)MEMORY[0x1E0CB3940];
          v15 = objc_retainAutorelease(v13);
          objc_msgSend(v14, "stringWithUTF8String:", -[NSObject methodReturnType](v15, "methodReturnType"));
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableDictionary setObject:forKeyedSubscript:](self->_typesByURLKey, "setObject:forKeyedSubscript:", v16, v10);

          objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithPointer:", class_getMethodImplementation(a3, v12));
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableDictionary setObject:forKeyedSubscript:](self->_gettersByURLKey, "setObject:forKeyedSubscript:", v17, v10);

        }
        else
        {
          fp_current_or_default_log();
          v15 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = v18;
            v26 = v11;
            v27 = 2112;
            v28 = a3;
            _os_log_debug_impl(&dword_1A0A34000, v15, OS_LOG_TYPE_DEBUG, "[DEBUG] property %@ is unavailable on %@", buf, 0x16u);
          }
        }

      }
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v20, v29, 16);
    }
    while (v6);
  }

  __fp_leave_section_Debug((uint64_t)&section);
}

void __66__FPItemToURLResourcesConverter_dictionaryFromItem_requestedKeys___block_invoke()
{
  NSObject *v0;
  dispatch_queue_t v1;
  void *v2;
  uint64_t v3;
  void *v4;

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = dispatch_queue_create("NSFileProviderPropertyDictionary", v0);
  v2 = (void *)dictionaryFromItem_requestedKeys__queue;
  dictionaryFromItem_requestedKeys__queue = (uint64_t)v1;

  v3 = objc_opt_new();
  v4 = (void *)dictionaryFromItem_requestedKeys__convertersByItemClass;
  dictionaryFromItem_requestedKeys__convertersByItemClass = v3;

}

void __66__FPItemToURLResourcesConverter_dictionaryFromItem_requestedKeys___block_invoke_310(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  FPItemToURLResourcesConverter *v5;
  uint64_t v6;
  void *v7;

  objc_msgSend((id)dictionaryFromItem_requestedKeys__convertersByItemClass, "objectForKeyedSubscript:", a1[4]);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1[5] + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  if (!*(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 40))
  {
    v5 = -[FPItemToURLResourcesConverter initWithItemClass:]([FPItemToURLResourcesConverter alloc], "initWithItemClass:", a1[6]);
    v6 = *(_QWORD *)(a1[5] + 8);
    v7 = *(void **)(v6 + 40);
    *(_QWORD *)(v6 + 40) = v5;

    objc_msgSend((id)dictionaryFromItem_requestedKeys__convertersByItemClass, "setObject:forKeyedSubscript:", *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 40), a1[4]);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_typesByURLKey, 0);
  objc_storeStrong((id *)&self->_gettersByURLKey, 0);
}

- (void)initWithItemClass:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_9_3();
  OUTLINED_FUNCTION_0_5(&dword_1A0A34000, v0, v1, "[DEBUG] ┏%llx instantiating dictionary converter for %@");
  OUTLINED_FUNCTION_3();
}

- (void)_cacheImplementedPropertiesForClass:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_9_3();
  OUTLINED_FUNCTION_0_5(&dword_1A0A34000, v0, v1, "[DEBUG] ┏%llx caching properties of %@");
  OUTLINED_FUNCTION_3();
}

- (void)_dictionaryFromItem:(uint64_t)a1 requestedKeys:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_debug_impl(&dword_1A0A34000, a2, OS_LOG_TYPE_DEBUG, "[DEBUG] Deprecated NSURLUbiquitousSharedItemOwnerNameKey was called for item %@ that does not have name components", (uint8_t *)&v2, 0xCu);
  OUTLINED_FUNCTION_3();
}

- (void)_dictionaryFromItem:(uint64_t)a3 requestedKeys:(uint64_t)a4 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1A0A34000, a1, a3, "[DEBUG] Deprecated NSURLUbiquitousSharedItemOwnerNameKey was requested", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_30();
}

- (void)_dictionaryFromItem:(uint64_t)a3 requestedKeys:(uint64_t)a4 .cold.3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1A0A34000, a1, a3, "[DEBUG] Deprecated NSURLUbiquitousSharedItemRoleKey was requested", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_30();
}

- (void)_dictionaryFromItem:(uint64_t)a3 requestedKeys:(uint64_t)a4 .cold.4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1A0A34000, a1, a3, "[DEBUG] Deprecated NSURLUbiquitousItemIsDownloadedKey was requested", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_30();
}

@end
