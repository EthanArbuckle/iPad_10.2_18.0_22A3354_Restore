@implementation NSArray

void __43__NSArray_NFTransportService__encodeToCBOR__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  NSObject *v5;
  const void **v6;
  uint64_t Logger;
  void (*v8)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  const char *Name;
  void *v13;
  uint64_t v14;
  objc_class *v15;
  int v16;
  const char *v17;
  const char *v18;
  void *v19;
  uint8_t buf[4];
  int v21;
  __int16 v22;
  const char *v23;
  __int16 v24;
  const char *v25;
  __int16 v26;
  int v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_opt_class();
  if (((objc_opt_isKindOfClass() & 1) != 0
     || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
     || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
     || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
     || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
     || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    && (objc_msgSend(v3, "encodeToCBOR"), (v4 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v5 = v4;
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v4);
  }
  else
  {
    v6 = (const void **)MEMORY[0x1E0DE7900];
    dispatch_get_specific((const void *)*MEMORY[0x1E0DE7900]);
    Logger = NFLogGetLogger();
    if (Logger)
    {
      v8 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(*(id *)(a1 + 32));
      isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(*(id *)(a1 + 32));
      Name = sel_getName(*(SEL *)(a1 + 48));
      objc_msgSend(v3, "description");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 45;
      if (isMetaClass)
        v14 = 43;
      v8(6, "%c[%{public}s %{public}s]:%i Invalid element type: %@", v14, ClassName, Name, 230, v13);

    }
    dispatch_get_specific(*v6);
    NFSharedLogGetLogger();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v15 = object_getClass(*(id *)(a1 + 32));
      if (class_isMetaClass(v15))
        v16 = 43;
      else
        v16 = 45;
      v17 = object_getClassName(*(id *)(a1 + 32));
      v18 = sel_getName(*(SEL *)(a1 + 48));
      objc_msgSend(v3, "description");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 67110146;
      v21 = v16;
      v22 = 2082;
      v23 = v17;
      v24 = 2082;
      v25 = v18;
      v26 = 1024;
      v27 = 230;
      v28 = 2112;
      v29 = v19;
      _os_log_impl(&dword_19B5EB000, v5, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Invalid element type: %@", buf, 0x2Cu);

    }
  }

}

@end
