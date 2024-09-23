@implementation NFConnectionHandoverRequest

- (NFConnectionHandoverRequest)initWithVersion:(id)a3 applicationLabel:(id)a4 serivceList:(id)a5
{
  return -[NFConnectionHandoverRequest initWithVersion:applicationLabel:serviceList:userInfo:retryRandom:](self, "initWithVersion:applicationLabel:serviceList:userInfo:retryRandom:", a3, a4, a5, 0, 0);
}

- (NFConnectionHandoverRequest)initWithVersion:(id)a3 applicationLabel:(id)a4 serivceList:(id)a5 userInfo:(id)a6
{
  return -[NFConnectionHandoverRequest initWithVersion:applicationLabel:serviceList:userInfo:retryRandom:](self, "initWithVersion:applicationLabel:serviceList:userInfo:retryRandom:", a3, a4, a5, a6, 0);
}

- (NFConnectionHandoverRequest)initWithVersion:(id)a3 applicationLabel:(id)a4 serviceList:(id)a5 userInfo:(id)a6
{
  return -[NFConnectionHandoverRequest initWithVersion:applicationLabel:serviceList:userInfo:retryRandom:](self, "initWithVersion:applicationLabel:serviceList:userInfo:retryRandom:", a3, a4, a5, a6, 0);
}

- (NFConnectionHandoverRequest)initWithVersion:(id)a3 applicationLabel:(id)a4 serviceList:(id)a5 userInfo:(id)a6 retryRandom:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  NFConnectionHandoverRequest *v17;
  NFConnectionHandoverRequest *v18;
  NFConnectionHandoverRequest *v19;
  id v21;
  objc_super v22;

  v21 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v22.receiver = self;
  v22.super_class = (Class)NFConnectionHandoverRequest;
  v17 = -[NFConnectionHandoverRequest init](&v22, sel_init);
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_version, a3);
    objc_storeStrong((id *)&v18->_applicationLabel, a4);
    objc_storeStrong((id *)&v18->_transportServiceList, a5);
    objc_storeStrong((id *)&v18->_userInfo, a6);
    objc_storeStrong((id *)&v18->_retryRandom, a7);
    v19 = v18;
  }

  return v18;
}

- (id)encode
{
  void *v4;
  NSObject *v5;
  const void **v6;
  uint64_t Logger;
  void (*v8)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  uint64_t v12;
  NSObject *v13;
  objc_class *v14;
  int v15;
  _BOOL8 v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  id v21;
  const char *Name;
  _BYTE buf[28];
  __int16 v25;
  int v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  if (!_MergedGlobals_2)
  {
    *(_OWORD *)buf = xmmword_1E3B52510;
    *(_QWORD *)&buf[16] = 0;
    _MergedGlobals_2 = _sl_dlopen();
  }
  if (!_MergedGlobals_2)
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
      v12 = 45;
      if (isMetaClass)
        v12 = 43;
      v8(3, "%c[%{public}s %{public}s]:%i CBOR library unavailable", v12, ClassName, Name, 177, *(_QWORD *)buf, *(_QWORD *)&buf[8], *(_QWORD *)&buf[16]);
    }
    dispatch_get_specific(*v6);
    NFSharedLogGetLogger();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v14 = object_getClass(self);
      if (class_isMetaClass(v14))
        v15 = 43;
      else
        v15 = 45;
      *(_DWORD *)buf = 67109890;
      *(_DWORD *)&buf[4] = v15;
      *(_WORD *)&buf[8] = 2082;
      *(_QWORD *)&buf[10] = object_getClassName(self);
      *(_WORD *)&buf[18] = 2082;
      *(_QWORD *)&buf[20] = sel_getName(a2);
      v25 = 1024;
      v26 = 177;
      _os_log_impl(&dword_19B5EB000, v13, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i CBOR library unavailable", buf, 0x22u);
    }
    goto LABEL_21;
  }
  -[NFConnectionHandoverRequest retryRandom](self, "retryRandom");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    -[NFConnectionHandoverRequest _encodeRequestRetry](self, "_encodeRequestRetry");
  else
    -[NFConnectionHandoverRequest _encodeRequest](self, "_encodeRequest");
  v5 = objc_claimAutoreleasedReturnValue();
  v13 = v5;
  if (!v5)
  {
LABEL_21:
    v20 = 0;
    goto LABEL_22;
  }
  v16 = (unint64_t)-[NSObject length](v5, "length") > 0xFF;
  v17 = (void *)MEMORY[0x1E0DE78B8];
  v18 = -[NSObject length](v13, "length");
  if (v4)
    v19 = 4;
  else
    v19 = 3;
  objc_msgSend(v17, "buildAPDUHeaderWithClass:instruction:p1:p2:len:useExtendedLength:", 0, 202, 1, v19, v18, v16);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "appendData:", v13);
  v21 = (id)objc_msgSend(MEMORY[0x1E0DE78B8], "appendExpectedLength:usingExtendedLength:toAPDU:", 0, v16, v20);
LABEL_22:

  return v20;
}

- (id)_encodeRequest
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
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  -[NFConnectionHandoverRequest transportServiceList](self, "transportServiceList");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = _NFCHValidateTransportServiceList(v3);

  if (!v4)
    return 0;
  v5 = (void *)objc_opt_new();
  CBORClass_0 = getCBORClass_0();
  -[NFConnectionHandoverRequest version](self, "version");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(CBORClass_0, "cborWithUTF8String:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(getCBORClass_0(), "cborWithInteger:", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v8, v9);

  v10 = getCBORClass_0();
  -[NFConnectionHandoverRequest applicationLabel](self, "applicationLabel");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "cborWithUTF8String:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(getCBORClass_0(), "cborWithInteger:", 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v12, v13);

  v14 = (void *)objc_opt_new();
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  -[NFConnectionHandoverRequest transportServiceList](self, "transportServiceList", 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v30;
    do
    {
      for (i = 0; i != v17; ++i)
      {
        if (*(_QWORD *)v30 != v18)
          objc_enumerationMutation(v15);
        objc_msgSend(*(id *)(*((_QWORD *)&v29 + 1) + 8 * i), "encodeToCBOR");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        if (v20)
          objc_msgSend(v14, "addObject:", v20);

      }
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
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

  return v27;
}

- (id)_encodeRequestRetry
{
  void *v3;
  id CBORClass_0;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v3 = (void *)objc_opt_new();
  CBORClass_0 = getCBORClass_0();
  -[NFConnectionHandoverRequest version](self, "version");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(CBORClass_0, "cborWithUTF8String:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(getCBORClass_0(), "cborWithInteger:", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v6, v7);

  v8 = getCBORClass_0();
  -[NFConnectionHandoverRequest retryRandom](self, "retryRandom");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "cborWithUnsignedInteger:", objc_msgSend(v9, "unsignedShortValue"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(getCBORClass_0(), "cborWithInteger:", 4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v10, v11);

  objc_msgSend(getCBORClass_0(), "cborWithDictionary:", v3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithCBOR:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (id)debugDescription
{
  void *v3;
  id v4;
  void *v5;
  __CFString *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  -[NFConnectionHandoverRequest retryRandom](self, "retryRandom");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = objc_alloc(MEMORY[0x1E0CB3940]);
    -[NFConnectionHandoverRequest retryRandom](self, "retryRandom");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (__CFString *)objc_msgSend(v4, "initWithFormat:", CFSTR(", retryRandom=%@"), v5);

  }
  else
  {
    v6 = &stru_1E3B54F18;
  }

  v7 = objc_alloc(MEMORY[0x1E0CB3940]);
  -[NFConnectionHandoverRequest version](self, "version");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NFConnectionHandoverRequest applicationLabel](self, "applicationLabel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NFConnectionHandoverRequest transportServiceList](self, "transportServiceList");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[NFConnectionHandoverRequest userInfo](self, "userInfo");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v7, "initWithFormat:", CFSTR("{version=%@, appLabel=%@, transportServices=%@, userInfo=%@%@}"), v8, v9, v10, v11, v6);

  return v12;
}

- (id)copyWithZone:(_NSZone *)a3
{
  NFConnectionHandoverRequest *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NFConnectionHandoverRequest *v10;

  v4 = [NFConnectionHandoverRequest alloc];
  -[NFConnectionHandoverRequest version](self, "version");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NFConnectionHandoverRequest applicationLabel](self, "applicationLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NFConnectionHandoverRequest transportServiceList](self, "transportServiceList");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NFConnectionHandoverRequest userInfo](self, "userInfo");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NFConnectionHandoverRequest retryRandom](self, "retryRandom");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[NFConnectionHandoverRequest initWithVersion:applicationLabel:serviceList:userInfo:retryRandom:](v4, "initWithVersion:applicationLabel:serviceList:userInfo:retryRandom:", v5, v6, v7, v8, v9);

  return v10;
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
  objc_storeStrong((id *)&self->_transportServiceList, 0);
  objc_storeStrong((id *)&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_applicationLabel, 0);
  objc_storeStrong((id *)&self->_version, 0);
}

@end
