@implementation NFFieldNotification

- (unsigned)rfTechnology
{
  return self->_rfTechnology;
}

- (unint64_t)notificationType
{
  return self->_notificationType;
}

- (NFFieldNotification)initWithCoder:(id)a3
{
  id v4;
  NFFieldNotification *v5;
  uint64_t v6;
  NSDate *creationDate;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)NFFieldNotification;
  v5 = -[NFFieldNotification init](&v9, sel_init);
  if (v5)
  {
    v5->_rfTechnology = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("rfTechnology"));
    v5->_typeFSystemCode = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("typeFSystemCode"));
    v5->_notificationType = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("notificationType"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("creationDate"));
    v6 = objc_claimAutoreleasedReturnValue();
    creationDate = v5->_creationDate;
    v5->_creationDate = (NSDate *)v6;

    v5->_cachedBeforeRFReset = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("cachedBeforeRFReset"));
    v5->_category = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("category"));
  }

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_creationDate, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)fieldNotificationFromXPCObject:(id)a3
{
  id v5;
  const void **v6;
  uint64_t Logger;
  void (*v8)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  uint64_t v11;
  NSObject *v12;
  objc_class *v13;
  int v14;
  id v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  id v22;
  const void **v23;
  uint64_t v24;
  void (*v25)(uint64_t, const char *, ...);
  objc_class *v26;
  _BOOL4 v27;
  const char *v28;
  BOOL v29;
  uint64_t v30;
  NSObject *v31;
  objc_class *v32;
  int v33;
  const char *v34;
  const char *v35;
  const void **v36;
  uint64_t v37;
  void (*v38)(uint64_t, const char *, ...);
  objc_class *v39;
  _BOOL4 v40;
  uint64_t v41;
  objc_class *v42;
  int v43;
  const char *ClassName;
  const char *v46;
  const char *Name;
  const char *v48;
  const char *v49;
  id v50;
  uint8_t buf[4];
  int v52;
  __int16 v53;
  const char *v54;
  __int16 v55;
  const char *v56;
  __int16 v57;
  int v58;
  __int16 v59;
  id v60;
  uint64_t v61;

  v61 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (object_getClass(v5) != (Class)MEMORY[0x1E0C812E8])
  {
    v6 = (const void **)MEMORY[0x1E0DE7900];
    dispatch_get_specific((const void *)*MEMORY[0x1E0DE7900]);
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
      v8(3, "%c[%{public}s %{public}s]:%i Unexpected parameter: %@", v11, ClassName, Name, 98, v5);
    }
    dispatch_get_specific(*v6);
    NFSharedLogGetLogger();
    v12 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      goto LABEL_12;
    v13 = object_getClass(a1);
    if (class_isMetaClass(v13))
      v14 = 43;
    else
      v14 = 45;
    *(_DWORD *)buf = 67110146;
    v52 = v14;
    v53 = 2082;
    v54 = object_getClassName(a1);
    v55 = 2082;
    v56 = sel_getName(a2);
    v57 = 1024;
    v58 = 98;
    v59 = 2112;
    v60 = v5;
LABEL_11:
    _os_log_impl(&dword_19B5EB000, v12, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Unexpected parameter: %@", buf, 0x2Cu);
LABEL_12:
    v15 = 0;
    goto LABEL_36;
  }
  v16 = _CFXPCCreateCFObjectFromXPCObject();
  if (!v16)
  {
    v36 = (const void **)MEMORY[0x1E0DE7900];
    dispatch_get_specific((const void *)*MEMORY[0x1E0DE7900]);
    v37 = NFLogGetLogger();
    if (v37)
    {
      v38 = (void (*)(uint64_t, const char *, ...))v37;
      v39 = object_getClass(a1);
      v40 = class_isMetaClass(v39);
      v46 = object_getClassName(a1);
      v49 = sel_getName(a2);
      v41 = 45;
      if (v40)
        v41 = 43;
      v38(3, "%c[%{public}s %{public}s]:%i Unexpected parameter: %@", v41, v46, v49, 104, v5);
    }
    dispatch_get_specific(*v36);
    NFSharedLogGetLogger();
    v12 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      goto LABEL_12;
    v42 = object_getClass(a1);
    if (class_isMetaClass(v42))
      v43 = 43;
    else
      v43 = 45;
    *(_DWORD *)buf = 67110146;
    v52 = v43;
    v53 = 2082;
    v54 = object_getClassName(a1);
    v55 = 2082;
    v56 = sel_getName(a2);
    v57 = 1024;
    v58 = 104;
    v59 = 2112;
    v60 = v5;
    goto LABEL_11;
  }
  v12 = v16;
  v17 = (void *)MEMORY[0x1E0C99E60];
  v18 = objc_opt_class();
  v19 = objc_opt_class();
  objc_msgSend(v17, "setWithObjects:", v18, v19, objc_opt_class(), 0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v50 = 0;
  objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedArrayOfObjectsOfClasses:fromData:error:", v20, v12, &v50);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v50;
  if (v22)
  {
    v23 = (const void **)MEMORY[0x1E0DE7900];
    dispatch_get_specific((const void *)*MEMORY[0x1E0DE7900]);
    v24 = NFLogGetLogger();
    if (v24)
    {
      v25 = (void (*)(uint64_t, const char *, ...))v24;
      v26 = object_getClass(a1);
      v27 = class_isMetaClass(v26);
      v28 = object_getClassName(a1);
      v48 = sel_getName(a2);
      v29 = !v27;
      v23 = (const void **)MEMORY[0x1E0DE7900];
      v30 = 45;
      if (!v29)
        v30 = 43;
      v25(3, "%c[%{public}s %{public}s]:%i Fail to decode: %@", v30, v28, v48, 119, v22);
    }
    dispatch_get_specific(*v23);
    NFSharedLogGetLogger();
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      v32 = object_getClass(a1);
      if (class_isMetaClass(v32))
        v33 = 43;
      else
        v33 = 45;
      v34 = object_getClassName(a1);
      v35 = sel_getName(a2);
      *(_DWORD *)buf = 67110146;
      v52 = v33;
      v53 = 2082;
      v54 = v34;
      v55 = 2082;
      v56 = v35;
      v57 = 1024;
      v58 = 119;
      v59 = 2112;
      v60 = v22;
      _os_log_impl(&dword_19B5EB000, v31, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Fail to decode: %@", buf, 0x2Cu);
    }

    v15 = 0;
  }
  else
  {
    v15 = v21;
  }

LABEL_36:
  return v15;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t rfTechnology;
  id v5;

  rfTechnology = self->_rfTechnology;
  v5 = a3;
  objc_msgSend(v5, "encodeInteger:forKey:", rfTechnology, CFSTR("rfTechnology"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_typeFSystemCode, CFSTR("typeFSystemCode"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_notificationType, CFSTR("notificationType"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_creationDate, CFSTR("creationDate"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_cachedBeforeRFReset, CFSTR("cachedBeforeRFReset"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_category, CFSTR("category"));

}

+ (id)notificationWithDictionary:(id)a3
{
  id v5;
  void *v6;
  id v7;
  _BYTE *v8;
  _QWORD *v9;
  int v10;
  __objc2_class *v11;
  void *v12;
  NFFieldNotificationECP1_0 *v13;
  const void **v14;
  uint64_t v15;
  void (*v16)(uint64_t, const char *, ...);
  objc_class *v17;
  _BOOL4 v18;
  const char *v19;
  uint64_t v20;
  NSObject *v21;
  objc_class *v22;
  int v23;
  const char *v24;
  const void **v25;
  uint64_t Logger;
  void (*v27)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  uint64_t v31;
  objc_class *v32;
  int v33;
  NFFieldNotificationECP1_0 *v34;
  const char *v36;
  const char *Name;
  uint8_t buf[4];
  int v39;
  __int16 v40;
  const char *v41;
  __int16 v42;
  const char *v43;
  __int16 v44;
  int v45;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (objc_msgSend(v5, "count"))
  {
    objc_msgSend(v5, "objectForKey:", CFSTR("ECPData"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if ((unint64_t)objc_msgSend(v6, "length") < 3)
    {
LABEL_31:
      v11 = NFFieldNotification;
      goto LABEL_32;
    }
    v7 = objc_retainAutorelease(v6);
    v8 = (_BYTE *)objc_msgSend(v7, "bytes");
    if (*v8 == 106)
    {
      v9 = v8;
      v10 = v8[1];
      if (v10 == 2)
      {
        if (objc_msgSend(v7, "length") == 8 && *v9 == 0x820202C3026ALL)
        {
          v34 = -[NFFieldNotificationECP1_0 initWithDictionaryForDavenport:]([NFFieldNotificationECP1_0 alloc], "initWithDictionaryForDavenport:", v5);
          goto LABEL_33;
        }
        v11 = NFFieldNotificationECP2_0;
LABEL_32:
        v34 = (NFFieldNotificationECP1_0 *)objc_msgSend([v11 alloc], "initWithDictionary:", v5);
LABEL_33:
        v13 = v34;

        goto LABEL_34;
      }
      if (v10 == 1)
      {
        v11 = NFFieldNotificationECP1_0;
        goto LABEL_32;
      }
      v25 = (const void **)MEMORY[0x1E0DE7900];
      dispatch_get_specific((const void *)*MEMORY[0x1E0DE7900]);
      Logger = NFLogGetLogger();
      if (Logger)
      {
        v27 = (void (*)(uint64_t, const char *, ...))Logger;
        Class = object_getClass(a1);
        isMetaClass = class_isMetaClass(Class);
        ClassName = object_getClassName(a1);
        Name = sel_getName(a2);
        v31 = 45;
        if (isMetaClass)
          v31 = 43;
        v27(4, "%c[%{public}s %{public}s]:%i Unexpected ECP version; initialized to non ECP",
          v31,
          ClassName,
          Name,
          85);
      }
      dispatch_get_specific(*v25);
      NFSharedLogGetLogger();
      v21 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        goto LABEL_30;
      v32 = object_getClass(a1);
      if (class_isMetaClass(v32))
        v33 = 43;
      else
        v33 = 45;
      *(_DWORD *)buf = 67109890;
      v39 = v33;
      v40 = 2082;
      v41 = object_getClassName(a1);
      v42 = 2082;
      v43 = sel_getName(a2);
      v44 = 1024;
      v45 = 85;
      v24 = "%c[%{public}s %{public}s]:%i Unexpected ECP version; initialized to non ECP";
    }
    else
    {
      v14 = (const void **)MEMORY[0x1E0DE7900];
      dispatch_get_specific((const void *)*MEMORY[0x1E0DE7900]);
      v15 = NFLogGetLogger();
      if (v15)
      {
        v16 = (void (*)(uint64_t, const char *, ...))v15;
        v17 = object_getClass(a1);
        v18 = class_isMetaClass(v17);
        v19 = object_getClassName(a1);
        v36 = sel_getName(a2);
        v20 = 45;
        if (v18)
          v20 = 43;
        v16(4, "%c[%{public}s %{public}s]:%i Unexpected ECP command; initialized to non ECP", v20, v19, v36, 88);
      }
      dispatch_get_specific(*v14);
      NFSharedLogGetLogger();
      v21 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        goto LABEL_30;
      v22 = object_getClass(a1);
      if (class_isMetaClass(v22))
        v23 = 43;
      else
        v23 = 45;
      *(_DWORD *)buf = 67109890;
      v39 = v23;
      v40 = 2082;
      v41 = object_getClassName(a1);
      v42 = 2082;
      v43 = sel_getName(a2);
      v44 = 1024;
      v45 = 88;
      v24 = "%c[%{public}s %{public}s]:%i Unexpected ECP command; initialized to non ECP";
    }
    _os_log_impl(&dword_19B5EB000, v21, OS_LOG_TYPE_ERROR, v24, buf, 0x22u);
LABEL_30:

    goto LABEL_31;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("NFFieldNotification.m"), 63, CFSTR("Empty dictionary"));

  v13 = 0;
LABEL_34:

  return v13;
}

- (NFFieldNotification)initWithNotificationType:(unint64_t)a3 rfTechnology:(unsigned int)a4 typeFSystemCode:(unsigned __int16)a5 creationDate:(id)a6 cachedBeforeRFReset:(BOOL)a7
{
  id v13;
  NFFieldNotification *v14;
  NFFieldNotification *v15;
  NFFieldNotification *v16;
  objc_super v18;

  v13 = a6;
  v18.receiver = self;
  v18.super_class = (Class)NFFieldNotification;
  v14 = -[NFFieldNotification init](&v18, sel_init);
  v15 = v14;
  if (v14)
  {
    v14->_notificationType = a3;
    v14->_rfTechnology = a4;
    v14->_typeFSystemCode = a5;
    objc_storeStrong((id *)&v14->_creationDate, a6);
    v15->_cachedBeforeRFReset = a7;
    v16 = v15;
  }

  return v15;
}

- (NFFieldNotification)initWithDictionary:(id)a3
{
  id v4;
  NFFieldNotification *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  NSDate *creationDate;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)NFFieldNotification;
  v5 = -[NFFieldNotification init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKey:", CFSTR("FieldTechnology"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_rfTechnology = objc_msgSend(v6, "integerValue");

    objc_msgSend(v4, "objectForKey:", CFSTR("SystemCode"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_typeFSystemCode = objc_msgSend(v7, "integerValue");

    v5->_notificationType = 1;
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v8 = objc_claimAutoreleasedReturnValue();
    creationDate = v5->_creationDate;
    v5->_creationDate = (NSDate *)v8;

  }
  return v5;
}

- (void)setNotificationType:(unint64_t)a3
{
  self->_notificationType = a3;
}

- (id)description
{
  void *v3;
  void *v4;
  unsigned int rfTechnology;
  id v6;
  const char *ClassName;
  uint64_t v8;
  void *v9;
  void *v10;

  v3 = (void *)objc_opt_new();
  v4 = v3;
  rfTechnology = self->_rfTechnology;
  if ((rfTechnology & 1) != 0)
  {
    objc_msgSend(v3, "appendString:", CFSTR("A,"));
    rfTechnology = self->_rfTechnology;
    if ((rfTechnology & 2) == 0)
    {
LABEL_3:
      if ((rfTechnology & 4) == 0)
        goto LABEL_4;
      goto LABEL_12;
    }
  }
  else if ((rfTechnology & 2) == 0)
  {
    goto LABEL_3;
  }
  objc_msgSend(v4, "appendString:", CFSTR("B,"));
  rfTechnology = self->_rfTechnology;
  if ((rfTechnology & 4) == 0)
  {
LABEL_4:
    if ((rfTechnology & 0x10) == 0)
      goto LABEL_5;
    goto LABEL_13;
  }
LABEL_12:
  objc_msgSend(v4, "appendString:", CFSTR("F,"));
  rfTechnology = self->_rfTechnology;
  if ((rfTechnology & 0x10) == 0)
  {
LABEL_5:
    if ((rfTechnology & 8) == 0)
      goto LABEL_7;
    goto LABEL_6;
  }
LABEL_13:
  objc_msgSend(v4, "appendString:", CFSTR("V,"));
  if ((self->_rfTechnology & 8) != 0)
LABEL_6:
    objc_msgSend(v4, "appendString:", CFSTR("ECP,"));
LABEL_7:
  if (!objc_msgSend(v4, "length"))
    objc_msgSend(v4, "appendString:", CFSTR("None"));
  v6 = objc_alloc(MEMORY[0x1E0CB3940]);
  ClassName = object_getClassName(self);
  v8 = bswap32(self->_typeFSystemCode) >> 16;
  -[NFFieldNotification _creationDateString](self, "_creationDateString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v6, "initWithFormat:", CFSTR("<%s: tech=%@ sc=0x%X date=%@ cached=%d>"), ClassName, v4, v8, v9, self->_cachedBeforeRFReset);

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  NFFieldNotification *v4;
  NFFieldNotification *v5;
  unsigned int v6;
  int v7;
  uint64_t v8;
  BOOL v9;

  v4 = (NFFieldNotification *)a3;
  if (v4 == self)
  {
    v9 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      v6 = -[NFFieldNotification rfTechnology](v5, "rfTechnology");
      if (v6 == -[NFFieldNotification rfTechnology](self, "rfTechnology")
        && (v7 = -[NFFieldNotification typeFSystemCode](v5, "typeFSystemCode"),
            v7 == -[NFFieldNotification typeFSystemCode](self, "typeFSystemCode")))
      {
        v8 = -[NFFieldNotification notificationType](v5, "notificationType");
        v9 = v8 == -[NFFieldNotification notificationType](self, "notificationType");
      }
      else
      {
        v9 = 0;
      }

    }
    else
    {
      v9 = 0;
    }
  }

  return v9;
}

- (BOOL)isEqualWithoutRFTech:(id)a3
{
  NFFieldNotification *v4;
  uint64_t v5;
  BOOL v6;

  v4 = (NFFieldNotification *)a3;
  if (v4 == self)
  {
    v6 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = -[NFFieldNotification notificationType](v4, "notificationType");
      v6 = v5 == -[NFFieldNotification notificationType](self, "notificationType");
    }
    else
    {
      v6 = 0;
    }
  }

  return v6;
}

- (BOOL)isEqualTerminalInfo:(id)a3
{
  id v4;
  unint64_t v5;
  int v6;
  int v7;
  uint64_t v8;
  BOOL v9;

  v4 = a3;
  v5 = -[NFFieldNotification notificationType](self, "notificationType");
  if (v5 != objc_msgSend(v4, "notificationType"))
    goto LABEL_8;
  if (-[NFFieldNotification notificationType](self, "notificationType") != 2)
  {
    if (-[NFFieldNotification notificationType](self, "notificationType") == 3)
    {
      v8 = -[NFFieldNotification terminalType](self, "terminalType");
      if (v8 == objc_msgSend(v4, "terminalType"))
      {
        v6 = -[NFFieldNotification terminalSubType](self, "terminalSubType");
        v7 = objc_msgSend(v4, "terminalSubType");
        goto LABEL_7;
      }
    }
LABEL_8:
    v9 = 0;
    goto LABEL_9;
  }
  v6 = -[NFFieldNotification terminalType](self, "terminalType");
  v7 = objc_msgSend(v4, "terminalType");
LABEL_7:
  v9 = v6 == v7;
LABEL_9:

  return v9;
}

- (id)asXPCObject
{
  void *v4;
  id v5;
  const void **v6;
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
  id v17;
  const char *ClassName;
  const char *Name;
  id v21;
  uint8_t buf[4];
  int v23;
  __int16 v24;
  const char *v25;
  __int16 v26;
  const char *v27;
  __int16 v28;
  int v29;
  __int16 v30;
  id v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v21 = 0;
  objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", self, 1, &v21);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v21;
  if (v5)
  {
    v6 = (const void **)MEMORY[0x1E0DE7900];
    dispatch_get_specific((const void *)*MEMORY[0x1E0DE7900]);
    Logger = NFLogGetLogger();
    if (Logger)
    {
      v8 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(self);
      isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(self);
      Name = sel_getName(a2);
      v11 = 45;
      if (isMetaClass)
        v11 = 43;
      v8(3, "%c[%{public}s %{public}s]:%i Failed to encode: %@", v11, ClassName, Name, 233, v5);
    }
    dispatch_get_specific(*v6);
    NFSharedLogGetLogger();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v13 = object_getClass(self);
      if (class_isMetaClass(v13))
        v14 = 43;
      else
        v14 = 45;
      v15 = object_getClassName(self);
      v16 = sel_getName(a2);
      *(_DWORD *)buf = 67110146;
      v23 = v14;
      v24 = 2082;
      v25 = v15;
      v26 = 2082;
      v27 = v16;
      v28 = 1024;
      v29 = 233;
      v30 = 2112;
      v31 = v5;
      _os_log_impl(&dword_19B5EB000, v12, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed to encode: %@", buf, 0x2Cu);
    }

    v17 = 0;
  }
  else
  {
    v17 = v4;
  }

  return v17;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[NFFieldNotification initWithNotificationType:rfTechnology:typeFSystemCode:creationDate:cachedBeforeRFReset:]([NFFieldNotification alloc], "initWithNotificationType:rfTechnology:typeFSystemCode:creationDate:cachedBeforeRFReset:", self->_notificationType, self->_rfTechnology, self->_typeFSystemCode, self->_creationDate, self->_cachedBeforeRFReset);
}

- (id)_creationDateString
{
  void *v3;
  void *v4;

  v3 = (void *)objc_opt_new();
  objc_msgSend(v3, "setDateFormat:", CFSTR("yyyy-MM-dd HH:mm:ss.SSSS"));
  objc_msgSend(v3, "stringFromDate:", self->_creationDate);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (unsigned)typeFSystemCode
{
  return self->_typeFSystemCode;
}

- (NSDate)creationDate
{
  return self->_creationDate;
}

- (void)setCreationDate:(id)a3
{
  objc_storeStrong((id *)&self->_creationDate, a3);
}

- (BOOL)cachedBeforeRFReset
{
  return self->_cachedBeforeRFReset;
}

- (void)setCachedBeforeRFReset:(BOOL)a3
{
  self->_cachedBeforeRFReset = a3;
}

- (int64_t)category
{
  return self->_category;
}

- (void)setCategory:(int64_t)a3
{
  self->_category = a3;
}

- (BOOL)isCHTerminal
{
  NFFieldNotification *v3;
  BOOL v4;

  if (-[NFFieldNotification notificationType](self, "notificationType") != 3)
    return 0;
  v3 = self;
  v4 = -[NFFieldNotification terminalType](v3, "terminalType") == 5
    && -[NFFieldNotification terminalSubType](v3, "terminalSubType") == 0;

  return v4;
}

- (BOOL)isCHInitiatorDetected
{
  return -[NFFieldNotification chFieldType](self, "chFieldType") == 2;
}

- (BOOL)isCHReceiverDetected
{
  return -[NFFieldNotification chFieldType](self, "chFieldType") == 3;
}

- (BOOL)isCHAutoNegotiationField
{
  NFFieldNotification *v3;
  void *v4;
  void *v5;
  void *v6;

  if (-[NFFieldNotification isCHTerminal](self, "isCHTerminal"))
  {
    v3 = self;
    -[NFFieldNotification userInfo](v3, "userInfo");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      -[NFFieldNotification userInfo](v3, "userInfo");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("CHCfgBytes"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      v4 = (void *)(objc_msgSend(v6, "unsignedShortValue") & 1);
    }

  }
  else
  {
    LOBYTE(v4) = 0;
  }
  return (char)v4;
}

- (unint64_t)chFieldType
{
  NFFieldNotification *v4;
  void *v5;
  void *v6;
  void *v7;
  const void **v8;
  uint64_t v9;
  void (*v10)(uint64_t, const char *, ...);
  objc_class *v11;
  _BOOL4 v12;
  const char *v13;
  const char *v14;
  void *v15;
  uint64_t v16;
  NSObject *v17;
  objc_class *v18;
  int v19;
  const char *v20;
  const char *v21;
  void *v22;
  unint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  const void **v28;
  uint64_t Logger;
  void (*v30)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  uint64_t v34;
  objc_class *v35;
  int v36;
  void *v38;
  void *v39;
  const char *Name;
  uint8_t buf[4];
  int v42;
  __int16 v43;
  const char *v44;
  __int16 v45;
  const char *v46;
  __int16 v47;
  int v48;
  __int16 v49;
  void *v50;
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  if (-[NFFieldNotification isCHTerminal](self, "isCHTerminal"))
  {
    v4 = self;
    -[NFFieldNotification userInfo](v4, "userInfo");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v5)
    {
      v23 = 4;
LABEL_33:

      return v23;
    }
    -[NFFieldNotification userInfo](v4, "userInfo");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("CHCfgBytes"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v7, "unsignedShortValue"))
    {
      if ((objc_msgSend(v7, "unsignedShortValue") & 1) != 0)
      {
        -[NFFieldNotification userInfo](v4, "userInfo");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "objectForKey:", CFSTR("CHRemoteRandom"));
        v25 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v25)
        {
          v28 = (const void **)MEMORY[0x1E0DE7900];
          dispatch_get_specific((const void *)*MEMORY[0x1E0DE7900]);
          Logger = NFLogGetLogger();
          if (Logger)
          {
            v30 = (void (*)(uint64_t, const char *, ...))Logger;
            Class = object_getClass(v4);
            isMetaClass = class_isMetaClass(Class);
            ClassName = object_getClassName(v4);
            Name = sel_getName(a2);
            v34 = 45;
            if (isMetaClass)
              v34 = 43;
            v30(4, "%c[%{public}s %{public}s]:%i Unexpected state; missing randome value",
              v34,
              ClassName,
              Name,
              1015);
          }
          dispatch_get_specific(*v28);
          NFSharedLogGetLogger();
          v17 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
          {
            v35 = object_getClass(v4);
            if (class_isMetaClass(v35))
              v36 = 43;
            else
              v36 = 45;
            *(_DWORD *)buf = 67109890;
            v42 = v36;
            v43 = 2082;
            v44 = object_getClassName(v4);
            v45 = 2082;
            v46 = sel_getName(a2);
            v47 = 1024;
            v48 = 1015;
            _os_log_impl(&dword_19B5EB000, v17, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Unexpected state; missing randome value",
              buf,
              0x22u);
          }
          goto LABEL_31;
        }
        -[NFFieldNotification userInfo](v4, "userInfo");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "objectForKey:", CFSTR("CHInitiatorDetected"));
        v27 = (void *)objc_claimAutoreleasedReturnValue();

        if (v27)
        {
          v23 = 2;
          goto LABEL_32;
        }
        -[NFFieldNotification userInfo](v4, "userInfo");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "objectForKey:", CFSTR("CHReceiverDetected"));
        v39 = (void *)objc_claimAutoreleasedReturnValue();

        if (v39)
        {
          v23 = 3;
          goto LABEL_32;
        }
      }
      if ((objc_msgSend(v7, "unsignedShortValue") & 2) == 0)
      {
        v8 = (const void **)MEMORY[0x1E0DE7900];
        dispatch_get_specific((const void *)*MEMORY[0x1E0DE7900]);
        v9 = NFLogGetLogger();
        if (v9)
        {
          v10 = (void (*)(uint64_t, const char *, ...))v9;
          v11 = object_getClass(v4);
          v12 = class_isMetaClass(v11);
          v13 = object_getClassName(v4);
          v14 = sel_getName(a2);
          -[NFFieldNotification debugDescription](v4, "debugDescription");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = 45;
          if (v12)
            v16 = 43;
          v10(4, "%c[%{public}s %{public}s]:%i Unexpected state; %{public}@", v16, v13, v14, 1032, v15);

        }
        dispatch_get_specific(*v8);
        NFSharedLogGetLogger();
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        {
          v18 = object_getClass(v4);
          if (class_isMetaClass(v18))
            v19 = 43;
          else
            v19 = 45;
          v20 = object_getClassName(v4);
          v21 = sel_getName(a2);
          -[NFFieldNotification debugDescription](v4, "debugDescription");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 67110146;
          v42 = v19;
          v43 = 2082;
          v44 = v20;
          v45 = 2082;
          v46 = v21;
          v47 = 1024;
          v48 = 1032;
          v49 = 2114;
          v50 = v22;
          _os_log_impl(&dword_19B5EB000, v17, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Unexpected state; %{public}@",
            buf,
            0x2Cu);

        }
LABEL_31:

        v23 = 1;
        goto LABEL_32;
      }
      v23 = 5;
    }
    else
    {
      v23 = 4;
    }
LABEL_32:

    goto LABEL_33;
  }
  return 1;
}

- (id)chRandomData
{
  NFFieldNotification *v3;
  void *v4;
  void *v5;

  if (-[NFFieldNotification isCHTerminal](self, "isCHTerminal"))
  {
    v3 = self;
    -[NFFieldNotification userInfo](v3, "userInfo");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      -[NFFieldNotification userInfo](v3, "userInfo");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("CHRemoteRandom"));
      v4 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

@end
