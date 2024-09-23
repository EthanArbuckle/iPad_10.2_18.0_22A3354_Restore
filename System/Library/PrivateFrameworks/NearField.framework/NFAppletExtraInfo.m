@implementation NFAppletExtraInfo

+ (id)infoWithDictionary:(id)a3 applet:(id)a4
{
  id v7;
  id v8;
  id *v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id *v17;
  const void **v18;
  uint64_t Logger;
  void (*v20)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  uint64_t v24;
  NSObject *v25;
  objc_class *v26;
  int v27;
  const char *Name;
  uint8_t buf[4];
  int v31;
  __int16 v32;
  const char *v33;
  __int16 v34;
  const char *v35;
  __int16 v36;
  int v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = (id *)objc_opt_new();
  objc_storeStrong(v9 + 1, a4);
  objc_msgSend(v8, "identifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("appletAid"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v10, "isEqual:", v11);

  if ((v12 & 1) != 0)
  {
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("associatedSSD"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(MEMORY[0x1E0C99D50], "NF_dataWithHexString:", v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (v14)
          objc_storeStrong(v9 + 2, v14);

      }
    }
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("obgk"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(MEMORY[0x1E0C99D50], "NF_dataWithHexString:", v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        if (v16)
          objc_storeStrong(v9 + 3, v16);

      }
    }
    v17 = v9;

  }
  else
  {
    v18 = (const void **)MEMORY[0x1E0DE7900];
    dispatch_get_specific((const void *)*MEMORY[0x1E0DE7900]);
    Logger = NFLogGetLogger();
    if (Logger)
    {
      v20 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(a1);
      isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(a1);
      Name = sel_getName(a2);
      v24 = 45;
      if (isMetaClass)
        v24 = 43;
      v20(3, "%c[%{public}s %{public}s]:%i AID does not match", v24, ClassName, Name, 668);
    }
    dispatch_get_specific(*v18);
    NFSharedLogGetLogger();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      v26 = object_getClass(a1);
      if (class_isMetaClass(v26))
        v27 = 43;
      else
        v27 = 45;
      *(_DWORD *)buf = 67109890;
      v31 = v27;
      v32 = 2082;
      v33 = object_getClassName(a1);
      v34 = 2082;
      v35 = sel_getName(a2);
      v36 = 1024;
      v37 = 668;
      _os_log_impl(&dword_19B5EB000, v25, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i AID does not match", buf, 0x22u);
    }

    v17 = 0;
  }

  return v17;
}

- (id)debugDescription
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)objc_opt_new();
  -[NFApplet debugDescription](self->_applet, "debugDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("%@"), v4);

  -[NSData NF_asHexString](self->_ssdAID, "NF_asHexString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSData NF_asHexString](self->_obgk, "NF_asHexString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", { ssdID=%@, OBGK=%@ }"), v5, v6);

  return v3;
}

- (NFApplet)applet
{
  return self->_applet;
}

- (NSData)ssdAID
{
  return self->_ssdAID;
}

- (NSData)obgk
{
  return self->_obgk;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_obgk, 0);
  objc_storeStrong((id *)&self->_ssdAID, 0);
  objc_storeStrong((id *)&self->_applet, 0);
}

@end
