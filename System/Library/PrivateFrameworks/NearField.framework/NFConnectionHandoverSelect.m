@implementation NFConnectionHandoverSelect

- (NFConnectionHandoverSelect)initWithVersion:(id)a3 applicationLabel:(id)a4 serivceList:(id)a5
{
  return -[NFConnectionHandoverSelect initWithVersion:applicationLabel:serviceList:userInfo:retryInMS:retryRandom:](self, "initWithVersion:applicationLabel:serviceList:userInfo:retryInMS:retryRandom:", a3, a4, a5, 0, 0, 0);
}

- (NFConnectionHandoverSelect)initWithVersion:(id)a3 applicationLabel:(id)a4 serivceList:(id)a5 userInfo:(id)a6
{
  return -[NFConnectionHandoverSelect initWithVersion:applicationLabel:serviceList:userInfo:retryInMS:retryRandom:](self, "initWithVersion:applicationLabel:serviceList:userInfo:retryInMS:retryRandom:", a3, a4, a5, a6, 0, 0);
}

- (NFConnectionHandoverSelect)initWithVersion:(id)a3 applicationLabel:(id)a4 serviceList:(id)a5 userInfo:(id)a6
{
  return -[NFConnectionHandoverSelect initWithVersion:applicationLabel:serviceList:userInfo:retryInMS:retryRandom:](self, "initWithVersion:applicationLabel:serviceList:userInfo:retryInMS:retryRandom:", a3, a4, a5, a6, 0, 0);
}

- (NFConnectionHandoverSelect)initWithVersion:(id)a3 applicationLabel:(id)a4 serviceList:(id)a5 userInfo:(id)a6 retryInMS:(id)a7 retryRandom:(id)a8
{
  id v15;
  id v16;
  id v17;
  NFConnectionHandoverSelect *v18;
  NFConnectionHandoverSelect *v19;
  NFConnectionHandoverSelect *v20;
  id v22;
  id v23;
  id v24;
  objc_super v25;

  v24 = a3;
  v23 = a4;
  v22 = a5;
  v15 = a6;
  v16 = a7;
  v17 = a8;
  v25.receiver = self;
  v25.super_class = (Class)NFConnectionHandoverSelect;
  v18 = -[NFConnectionHandoverSelect init](&v25, sel_init);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_version, a3);
    objc_storeStrong((id *)&v19->_applicationLabel, a4);
    objc_storeStrong((id *)&v19->_transportServiceList, a5);
    objc_storeStrong((id *)&v19->_userInfo, a6);
    objc_storeStrong((id *)&v19->_retryInMS, a7);
    objc_storeStrong((id *)&v19->_retryRandom, a8);
    v20 = v19;
  }

  return v19;
}

+ (id)selectWithRetry:(double)a3
{
  double v3;
  const void **v6;
  uint64_t Logger;
  void (*v8)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  uint64_t v11;
  NSObject *v12;
  objc_class *v13;
  int v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  const char *ClassName;
  const char *Name;
  uint8_t buf[4];
  int v23;
  __int16 v24;
  const char *v25;
  __int16 v26;
  const char *v27;
  __int16 v28;
  int v29;
  __int16 v30;
  uint64_t v31;
  uint64_t v32;

  v3 = a3;
  v32 = *MEMORY[0x1E0C80C00];
  if (a3 < 0.0)
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
      v8(6, "%c[%{public}s %{public}s]:%i Override retry to min value of %f", v11, ClassName, Name, 353, 0);
    }
    dispatch_get_specific(*v6);
    NFSharedLogGetLogger();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v13 = object_getClass(a1);
      if (class_isMetaClass(v13))
        v14 = 43;
      else
        v14 = 45;
      *(_DWORD *)buf = 67110146;
      v23 = v14;
      v24 = 2082;
      v25 = object_getClassName(a1);
      v26 = 2082;
      v27 = sel_getName(a2);
      v28 = 1024;
      v29 = 353;
      v30 = 2048;
      v31 = 0;
      _os_log_impl(&dword_19B5EB000, v12, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Override retry to min value of %f", buf, 0x2Cu);
    }

    v3 = 0.0;
  }
  v15 = (void *)objc_opt_new();
  v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithInteger:", (uint64_t)(v3 * 1000.0));
  objc_msgSend(v15, "setRetryInMS:", v16);

  *(_WORD *)buf = 0;
  arc4random_buf(buf, 2uLL);
  v17 = objc_alloc(MEMORY[0x1E0CB37E8]);
  v18 = (void *)objc_msgSend(v17, "initWithUnsignedShort:", *(unsigned __int16 *)buf);
  objc_msgSend(v15, "setRetryRandom:", v18);

  return v15;
}

- (id)encode
{
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  const void **v8;
  uint64_t Logger;
  void (*v10)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  uint64_t v14;
  NSObject *v15;
  objc_class *v16;
  int v17;
  const char *Name;
  _BYTE buf[28];
  __int16 v21;
  int v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  if (!_MergedGlobals_2)
  {
    *(_OWORD *)buf = xmmword_1E3B52510;
    *(_QWORD *)&buf[16] = 0;
    _MergedGlobals_2 = _sl_dlopen();
  }
  if (_MergedGlobals_2)
  {
    -[NFConnectionHandoverSelect retryInMS](self, "retryInMS");
    v4 = objc_claimAutoreleasedReturnValue();
    if (v4
      && (v5 = (void *)v4,
          -[NFConnectionHandoverSelect retryRandom](self, "retryRandom"),
          v6 = (void *)objc_claimAutoreleasedReturnValue(),
          v6,
          v5,
          v6))
    {
      -[NFConnectionHandoverSelect _encodeRetryError](self, "_encodeRetryError");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      -[NFConnectionHandoverSelect _encodeSelect](self, "_encodeSelect");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    v8 = (const void **)MEMORY[0x1E0DE7900];
    dispatch_get_specific((const void *)*MEMORY[0x1E0DE7900]);
    Logger = NFLogGetLogger();
    if (Logger)
    {
      v10 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(self);
      isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(self);
      Name = sel_getName(a2);
      v14 = 45;
      if (isMetaClass)
        v14 = 43;
      v10(3, "%c[%{public}s %{public}s]:%i CBOR library unavailable", v14, ClassName, Name, 370, *(_QWORD *)buf, *(_QWORD *)&buf[8], *(_QWORD *)&buf[16]);
    }
    dispatch_get_specific(*v8);
    NFSharedLogGetLogger();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      v16 = object_getClass(self);
      if (class_isMetaClass(v16))
        v17 = 43;
      else
        v17 = 45;
      *(_DWORD *)buf = 67109890;
      *(_DWORD *)&buf[4] = v17;
      *(_WORD *)&buf[8] = 2082;
      *(_QWORD *)&buf[10] = object_getClassName(self);
      *(_WORD *)&buf[18] = 2082;
      *(_QWORD *)&buf[20] = sel_getName(a2);
      v21 = 1024;
      v22 = 370;
      _os_log_impl(&dword_19B5EB000, v15, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i CBOR library unavailable", buf, 0x22u);
    }

    v7 = 0;
  }
  return v7;
}

- (id)_encodeSelect
{
  void *v3;
  int v4;
  void *v5;
  id CBORClass_0;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  void *v21;
  void *v22;
  NFConnectionHandoverTransportServiceValue *userInfo;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  -[NFConnectionHandoverSelect transportServiceList](self, "transportServiceList");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = _NFCHValidateTransportServiceList(v3);

  if (!v4)
    return 0;
  v5 = (void *)objc_opt_new();
  CBORClass_0 = getCBORClass_0();
  -[NFConnectionHandoverSelect version](self, "version");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(CBORClass_0, "cborWithUTF8String:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(getCBORClass_0(), "cborWithInteger:", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v8, v9);

  v10 = getCBORClass_0();
  -[NFConnectionHandoverSelect applicationLabel](self, "applicationLabel");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "cborWithUTF8String:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(getCBORClass_0(), "cborWithInteger:", 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v12, v13);

  v14 = (void *)objc_opt_new();
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  -[NFConnectionHandoverSelect transportServiceList](self, "transportServiceList", 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v31;
    do
    {
      for (i = 0; i != v17; ++i)
      {
        if (*(_QWORD *)v31 != v18)
          objc_enumerationMutation(v15);
        objc_msgSend(*(id *)(*((_QWORD *)&v30 + 1) + 8 * i), "encodeToCBOR");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        if (v20)
          objc_msgSend(v14, "addObject:", v20);

      }
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
    }
    while (v17);
  }

  objc_msgSend(getCBORClass_0(), "cborWithArray:", v14);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(getCBORClass_0(), "cborWithInteger:", 2);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v21, v22);

  userInfo = self->_userInfo;
  if (userInfo)
  {
    if (IsValueCBOREncodable(userInfo))
    {
      -[NFConnectionHandoverTransportServiceValue encodeToCBOR](self->_userInfo, "encodeToCBOR");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(getCBORClass_0(), "cborWithInteger:", 3);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKey:", v24, v25);

    }
  }
  objc_msgSend(getCBORClass_0(), "cborWithDictionary:", v5);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithCBOR:", v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DF0]), "initWithData:", v27);
  objc_msgSend(v28, "appendBytes:length:", &SW_STATUS_SUCCESS, 2);

  return v28;
}

- (id)_encodeRetryError
{
  id v3;
  void *v4;
  id CBORClass_0;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(getCBORClass_0(), "cborWithInteger:", 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  CBORClass_0 = getCBORClass_0();
  -[NFConnectionHandoverSelect retryInMS](self, "retryInMS");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(CBORClass_0, "cborWithInteger:", objc_msgSend(v6, "integerValue"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, v4);

  objc_msgSend(getCBORClass_0(), "cborWithInteger:", 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = getCBORClass_0();
  -[NFConnectionHandoverSelect retryRandom](self, "retryRandom");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "cborWithUnsignedInteger:", objc_msgSend(v10, "unsignedShortValue"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, v8);

  objc_msgSend(getCBORClass_0(), "cborWithDictionary:", v3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithCBOR:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DF0]), "initWithData:", v13);
  objc_msgSend(v14, "appendBytes:length:", &SW_STATUS_DATA_NOT_FOUND, 2);

  return v14;
}

- (id)debugDescription
{
  void *v3;
  id v4;
  void *v5;
  __CFString *v6;
  void *v7;
  id v8;
  void *v9;
  __CFString *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  -[NFConnectionHandoverSelect retryInMS](self, "retryInMS");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = objc_alloc(MEMORY[0x1E0CB3940]);
    -[NFConnectionHandoverSelect retryInMS](self, "retryInMS");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (__CFString *)objc_msgSend(v4, "initWithFormat:", CFSTR(", retryInMS=%@"), v5);

  }
  else
  {
    v6 = &stru_1E3B54F18;
  }

  -[NFConnectionHandoverSelect retryRandom](self, "retryRandom");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = objc_alloc(MEMORY[0x1E0CB3940]);
    -[NFConnectionHandoverSelect retryRandom](self, "retryRandom");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (__CFString *)objc_msgSend(v8, "initWithFormat:", CFSTR(", retryRandom=%@"), v9);

  }
  else
  {
    v10 = &stru_1E3B54F18;
  }

  v11 = objc_alloc(MEMORY[0x1E0CB3940]);
  -[NFConnectionHandoverSelect version](self, "version");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[NFConnectionHandoverSelect applicationLabel](self, "applicationLabel");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[NFConnectionHandoverSelect transportServiceList](self, "transportServiceList");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[NFConnectionHandoverSelect userInfo](self, "userInfo");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v11, "initWithFormat:", CFSTR("{version=%@, appLabel=%@, transportServices=%@, userInfo=%@%@%@}"), v12, v13, v14, v15, v6, v10);

  return v16;
}

- (id)copyWithZone:(_NSZone *)a3
{
  NFConnectionHandoverSelect *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NFConnectionHandoverSelect *v11;

  v4 = [NFConnectionHandoverSelect alloc];
  -[NFConnectionHandoverSelect version](self, "version");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NFConnectionHandoverSelect applicationLabel](self, "applicationLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NFConnectionHandoverSelect transportServiceList](self, "transportServiceList");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NFConnectionHandoverSelect userInfo](self, "userInfo");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NFConnectionHandoverSelect retryInMS](self, "retryInMS");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NFConnectionHandoverSelect retryRandom](self, "retryRandom");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[NFConnectionHandoverSelect initWithVersion:applicationLabel:serviceList:userInfo:retryInMS:retryRandom:](v4, "initWithVersion:applicationLabel:serviceList:userInfo:retryInMS:retryRandom:", v5, v6, v7, v8, v9, v10);

  return v11;
}

- (NSString)version
{
  return self->_version;
}

- (void)setVersion:(id)a3
{
  objc_storeStrong((id *)&self->_version, a3);
}

- (NSString)applicationLabel
{
  return self->_applicationLabel;
}

- (void)setApplicationLabel:(id)a3
{
  objc_storeStrong((id *)&self->_applicationLabel, a3);
}

- (NFConnectionHandoverTransportServiceValue)userInfo
{
  return self->_userInfo;
}

- (void)setUserInfo:(id)a3
{
  objc_storeStrong((id *)&self->_userInfo, a3);
}

- (NSArray)transportServiceList
{
  return self->_transportServiceList;
}

- (void)setTransportServiceList:(id)a3
{
  objc_storeStrong((id *)&self->_transportServiceList, a3);
}

- (NSNumber)retryInMS
{
  return self->_retryInMS;
}

- (void)setRetryInMS:(id)a3
{
  objc_storeStrong((id *)&self->_retryInMS, a3);
}

- (NSNumber)retryRandom
{
  return self->_retryRandom;
}

- (void)setRetryRandom:(id)a3
{
  objc_storeStrong((id *)&self->_retryRandom, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_retryRandom, 0);
  objc_storeStrong((id *)&self->_retryInMS, 0);
  objc_storeStrong((id *)&self->_transportServiceList, 0);
  objc_storeStrong((id *)&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_applicationLabel, 0);
  objc_storeStrong((id *)&self->_version, 0);
}

@end
