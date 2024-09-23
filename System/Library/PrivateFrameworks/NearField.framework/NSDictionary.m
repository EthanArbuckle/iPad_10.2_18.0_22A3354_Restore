@implementation NSDictionary

void __48__NSDictionary_NFTransportService__encodeToCBOR__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  NSObject *v10;
  const void **v11;
  uint64_t v12;
  void (*v13)(uint64_t, const char *, ...);
  objc_class *v14;
  _BOOL4 v15;
  const char *v16;
  const char *v17;
  void *v18;
  uint64_t v19;
  objc_class *v20;
  int v21;
  const char *v22;
  const char *v23;
  void *v24;
  const void **v25;
  uint64_t Logger;
  void (*v27)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  const char *Name;
  void *v32;
  uint64_t v33;
  objc_class *v34;
  int v35;
  const char *v36;
  const char *v37;
  void *v38;
  uint8_t buf[4];
  int v40;
  __int16 v41;
  const char *v42;
  __int16 v43;
  const char *v44;
  __int16 v45;
  int v46;
  __int16 v47;
  void *v48;
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  objc_opt_class();
  if (((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    && (objc_msgSend(v5, "encodeToCBOR"), (v7 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v8 = v7;
    objc_opt_class();
    if (((objc_opt_isKindOfClass() & 1) != 0
       || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
       || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
       || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
       || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
       || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      && (objc_msgSend(v6, "encodeToCBOR"), (v9 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      v10 = v9;
      objc_msgSend(*(id *)(a1 + 40), "setObject:forKey:", v9, v8);
    }
    else
    {
      v25 = (const void **)MEMORY[0x1E0DE7900];
      dispatch_get_specific((const void *)*MEMORY[0x1E0DE7900]);
      Logger = NFLogGetLogger();
      if (Logger)
      {
        v27 = (void (*)(uint64_t, const char *, ...))Logger;
        Class = object_getClass(*(id *)(a1 + 32));
        isMetaClass = class_isMetaClass(Class);
        ClassName = object_getClassName(*(id *)(a1 + 32));
        Name = sel_getName(*(SEL *)(a1 + 48));
        objc_msgSend(v6, "description");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = 45;
        if (isMetaClass)
          v33 = 43;
        v27(6, "%c[%{public}s %{public}s]:%i Invalid value type: %@", v33, ClassName, Name, 289, v32);

      }
      dispatch_get_specific(*v25);
      NFSharedLogGetLogger();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        v34 = object_getClass(*(id *)(a1 + 32));
        if (class_isMetaClass(v34))
          v35 = 43;
        else
          v35 = 45;
        v36 = object_getClassName(*(id *)(a1 + 32));
        v37 = sel_getName(*(SEL *)(a1 + 48));
        objc_msgSend(v6, "description");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 67110146;
        v40 = v35;
        v41 = 2082;
        v42 = v36;
        v43 = 2082;
        v44 = v37;
        v45 = 1024;
        v46 = 289;
        v47 = 2112;
        v48 = v38;
        _os_log_impl(&dword_19B5EB000, v10, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Invalid value type: %@", buf, 0x2Cu);

      }
    }

  }
  else
  {
    v11 = (const void **)MEMORY[0x1E0DE7900];
    dispatch_get_specific((const void *)*MEMORY[0x1E0DE7900]);
    v12 = NFLogGetLogger();
    if (v12)
    {
      v13 = (void (*)(uint64_t, const char *, ...))v12;
      v14 = object_getClass(*(id *)(a1 + 32));
      v15 = class_isMetaClass(v14);
      v16 = object_getClassName(*(id *)(a1 + 32));
      v17 = sel_getName(*(SEL *)(a1 + 48));
      objc_msgSend(v5, "description");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 45;
      if (v15)
        v19 = 43;
      v13(6, "%c[%{public}s %{public}s]:%i Invalid key type: %@", v19, v16, v17, 270, v18);

    }
    dispatch_get_specific(*v11);
    NFSharedLogGetLogger();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v20 = object_getClass(*(id *)(a1 + 32));
      if (class_isMetaClass(v20))
        v21 = 43;
      else
        v21 = 45;
      v22 = object_getClassName(*(id *)(a1 + 32));
      v23 = sel_getName(*(SEL *)(a1 + 48));
      objc_msgSend(v5, "description");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 67110146;
      v40 = v21;
      v41 = 2082;
      v42 = v22;
      v43 = 2082;
      v44 = v23;
      v45 = 1024;
      v46 = 270;
      v47 = 2112;
      v48 = v24;
      _os_log_impl(&dword_19B5EB000, v8, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Invalid key type: %@", buf, 0x2Cu);

    }
  }

}

@end
