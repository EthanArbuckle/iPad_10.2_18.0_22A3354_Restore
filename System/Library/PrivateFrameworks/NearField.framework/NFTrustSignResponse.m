@implementation NFTrustSignResponse

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)rawData
{
  void *v2;
  void *v3;

  -[NFTrustSignResponse trustObjectInternalRawNSData](self, "trustObjectInternalRawNSData");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "NF_asHexString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NFTrustSignResponse)initWithCoder:(id)a3
{
  id v4;
  NFTrustSignResponse *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)NFTrustSignResponse;
  v5 = -[NFTrustObject initWithCoder:](&v10, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("trustObjectInternalRawNSData"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[NFTrustSignResponse setValue:forKey:](v5, "setValue:forKey:", v6, CFSTR("trustObjectInternalRawNSData"));

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("key"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NFTrustSignResponse setValue:forKey:](v5, "setValue:forKey:", v7, CFSTR("key"));

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("counterValue"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[NFTrustSignResponse setValue:forKey:](v5, "setValue:forKey:", v8, CFSTR("counterValue"));

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[NFTrustSignResponse trustObjectInternalRawNSData](self, "trustObjectInternalRawNSData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("trustObjectInternalRawNSData"));

  -[NFTrustSignResponse key](self, "key");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("key"));

  -[NFTrustSignResponse counterValue](self, "counterValue");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("counterValue"));

}

+ (id)signResponseWithRawData:(id)a3 counterValueData:(id)a4
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  const void **v12;
  uint64_t Logger;
  void (*v14)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  uint64_t v18;
  NSObject *v19;
  objc_class *v20;
  int v21;
  const char *Name;
  uint8_t buf[4];
  int v25;
  __int16 v26;
  const char *v27;
  __int16 v28;
  const char *v29;
  __int16 v30;
  int v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (v7)
  {
    v9 = objc_alloc((Class)a1);
    v10 = v9;
    if (v9)
    {
      objc_msgSend(v9, "setTrustObjectInternalRawNSData:", v7);
      if (v8)
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", bswap32(*(_DWORD *)objc_msgSend(objc_retainAutorelease(v8), "bytes")));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "setCounterValue:", v11);

      }
    }
  }
  else
  {
    v12 = (const void **)MEMORY[0x1E0DE7900];
    dispatch_get_specific((const void *)*MEMORY[0x1E0DE7900]);
    Logger = NFLogGetLogger();
    if (Logger)
    {
      v14 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(a1);
      isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(a1);
      Name = sel_getName(a2);
      v18 = 45;
      if (isMetaClass)
        v18 = 43;
      v14(3, "%c[%{public}s %{public}s]:%i Could not create SignResponse with nil data", v18, ClassName, Name, 407);
    }
    dispatch_get_specific(*v12);
    NFSharedLogGetLogger();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      v20 = object_getClass(a1);
      if (class_isMetaClass(v20))
        v21 = 43;
      else
        v21 = 45;
      *(_DWORD *)buf = 67109890;
      v25 = v21;
      v26 = 2082;
      v27 = object_getClassName(a1);
      v28 = 2082;
      v29 = sel_getName(a2);
      v30 = 1024;
      v31 = 407;
      _os_log_impl(&dword_19B5EB000, v19, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Could not create SignResponse with nil data", buf, 0x22u);
    }

    v10 = 0;
  }

  return v10;
}

- (NSNumber)counterValue
{
  return self->_counterValue;
}

- (void)setCounterValue:(id)a3
{
  objc_storeStrong((id *)&self->_counterValue, a3);
}

- (NFTrustKey)key
{
  return self->_key;
}

- (void)setKey:(id)a3
{
  objc_storeStrong((id *)&self->_key, a3);
}

- (NSData)trustObjectInternalRawNSData
{
  return self->_trustObjectInternalRawNSData;
}

- (void)setTrustObjectInternalRawNSData:(id)a3
{
  objc_storeStrong((id *)&self->_trustObjectInternalRawNSData, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trustObjectInternalRawNSData, 0);
  objc_storeStrong((id *)&self->_key, 0);
  objc_storeStrong((id *)&self->_counterValue, 0);
}

@end
