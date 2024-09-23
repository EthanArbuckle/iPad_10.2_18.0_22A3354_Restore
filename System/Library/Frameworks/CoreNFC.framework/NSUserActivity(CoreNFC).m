@implementation NSUserActivity(CoreNFC)

- (NFCNDEFMessage)ndefMessagePayload
{
  void *v4;
  void *v5;
  id v6;
  uint64_t Logger;
  void (*v8)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  uint64_t v11;
  NSObject *v12;
  objc_class *v13;
  int v14;
  const char *v15;
  const char *v16;
  NFCNDEFMessage *v17;
  NFCNDEFMessage *v18;
  const char *ClassName;
  const char *Name;
  id v22;
  uint8_t buf[4];
  int v24;
  __int16 v25;
  const char *v26;
  __int16 v27;
  const char *v28;
  __int16 v29;
  int v30;
  __int16 v31;
  id v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "_payloadForIdentifier:", CFSTR("com.apple.corenfc.useractivity.ndefmessagepayload"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = 0;
  objc_msgSend(MEMORY[0x24BDD1620], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v4, &v22);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v22;
  if (v6)
  {
    Logger = NFLogGetLogger();
    if (Logger)
    {
      v8 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(a1);
      isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(a1);
      Name = sel_getName(a2);
      v11 = 45;
      if (isMetaClass)
        v11 = 43;
      v8(3, "%c[%{public}s %{public}s]:%i Unarchive error: %@", v11, ClassName, Name, 29, v6);
    }
    NFSharedLogGetLogger();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v13 = object_getClass(a1);
      if (class_isMetaClass(v13))
        v14 = 43;
      else
        v14 = 45;
      v15 = object_getClassName(a1);
      v16 = sel_getName(a2);
      *(_DWORD *)buf = 67110146;
      v24 = v14;
      v25 = 2082;
      v26 = v15;
      v27 = 2082;
      v28 = v16;
      v29 = 1024;
      v30 = 29;
      v31 = 2112;
      v32 = v6;
      _os_log_impl(&dword_215BBD000, v12, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Unarchive error: %@", buf, 0x2Cu);
    }

    v17 = -[NFCNDEFMessage initWithEmptyNdefMessage]([NFCNDEFMessage alloc], "initWithEmptyNdefMessage");
  }
  else
  {
    v17 = v5;
  }
  v18 = v17;

  return v18;
}

@end
