@implementation NSUserActivity(CoreNFCPrivate)

- (void)setNdefMessagePayload:()CoreNFCPrivate
{
  id v5;
  void *v6;
  NSObject *v7;
  uint64_t Logger;
  void (*v9)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  uint64_t v12;
  NSObject *v13;
  objc_class *v14;
  int v15;
  const char *v16;
  const char *v17;
  uint64_t v18;
  void (*v19)(uint64_t, const char *, ...);
  objc_class *v20;
  _BOOL4 v21;
  const char *v22;
  uint64_t v23;
  objc_class *v24;
  int v25;
  const char *ClassName;
  const char *Name;
  const char *v28;
  id v29;
  uint8_t buf[4];
  int v31;
  __int16 v32;
  const char *v33;
  __int16 v34;
  const char *v35;
  __int16 v36;
  int v37;
  __int16 v38;
  NSObject *v39;
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v29 = 0;
    objc_msgSend(MEMORY[0x24BDD1618], "archivedDataWithRootObject:requiringSecureCoding:error:", v5, 1, &v29);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v29;
    if (v7)
    {
      Logger = NFLogGetLogger();
      if (Logger)
      {
        v9 = (void (*)(uint64_t, const char *, ...))Logger;
        Class = object_getClass(a1);
        isMetaClass = class_isMetaClass(Class);
        ClassName = object_getClassName(a1);
        Name = sel_getName(a2);
        v12 = 45;
        if (isMetaClass)
          v12 = 43;
        v9(3, "%c[%{public}s %{public}s]:%i Archive error: %@", v12, ClassName, Name, 56, v7);
      }
      NFSharedLogGetLogger();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        v14 = object_getClass(a1);
        if (class_isMetaClass(v14))
          v15 = 43;
        else
          v15 = 45;
        v16 = object_getClassName(a1);
        v17 = sel_getName(a2);
        *(_DWORD *)buf = 67110146;
        v31 = v15;
        v32 = 2082;
        v33 = v16;
        v34 = 2082;
        v35 = v17;
        v36 = 1024;
        v37 = 56;
        v38 = 2112;
        v39 = v7;
        _os_log_impl(&dword_215BBD000, v13, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Archive error: %@", buf, 0x2Cu);
      }

    }
    else
    {
      objc_msgSend(a1, "_setPayload:object:identifier:dirty:", v6, 0, CFSTR("com.apple.corenfc.useractivity.ndefmessagepayload"), 0);
    }

  }
  else
  {
    v18 = NFLogGetLogger();
    if (v18)
    {
      v19 = (void (*)(uint64_t, const char *, ...))v18;
      v20 = object_getClass(a1);
      v21 = class_isMetaClass(v20);
      v22 = object_getClassName(a1);
      v28 = sel_getName(a2);
      v23 = 45;
      if (v21)
        v23 = 43;
      v19(3, "%c[%{public}s %{public}s]:%i Unexpected class type for the message", v23, v22, v28, 47);
    }
    NFSharedLogGetLogger();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v24 = object_getClass(a1);
      if (class_isMetaClass(v24))
        v25 = 43;
      else
        v25 = 45;
      *(_DWORD *)buf = 67109890;
      v31 = v25;
      v32 = 2082;
      v33 = object_getClassName(a1);
      v34 = 2082;
      v35 = sel_getName(a2);
      v36 = 1024;
      v37 = 47;
      _os_log_impl(&dword_215BBD000, v7, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Unexpected class type for the message", buf, 0x22u);
    }
  }

}

@end
