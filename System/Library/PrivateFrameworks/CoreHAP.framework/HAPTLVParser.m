@implementation HAPTLVParser

- (HAPTLVParser)initWithData:(id)a3
{
  id v5;
  HAPTLVParser *v6;
  HAPTLVParser *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HAPTLVParser;
  v6 = -[HAPTLVParser init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_tlvData, a3);

  return v7;
}

- (id)parseResponseForData:(unint64_t)a3
{
  int v5;
  int v6;
  id v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  uint8_t buf[4];
  void *v14;
  __int16 v15;
  unint64_t v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  -[NSData bytes](self->_tlvData, "bytes");
  -[NSData length](self->_tlvData, "length");
  v5 = TLV8Get();
  if (v5)
  {
    v6 = v5;
    v7 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v8 = (void *)objc_msgSend(v7, "initWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], v6, 0);
    v9 = (void *)MEMORY[0x1D17B7244]();
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v14 = v11;
      v15 = 2048;
      v16 = a3;
      v17 = 2112;
      v18 = v8;
      _os_log_impl(&dword_1CCE01000, v10, OS_LOG_TYPE_ERROR, "%{public}@Failed to parse data for TLV: %tu %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v9);

    return 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", 0, 0);
    return (id)objc_claimAutoreleasedReturnValue();
  }
}

- (id)parseResponseForNumber:(unint64_t)a3
{
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  -[NSData bytes](self->_tlvData, "bytes");
  -[NSData length](self->_tlvData, "length");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", TLV8GetUInt64());
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)parseResponseForUInt8:(unint64_t)a3
{
  void *v3;
  unsigned __int8 *v4;
  void *v5;

  -[HAPTLVParser parseResponseForData:](self, "parseResponseForData:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "length") == 1)
  {
    v4 = (unsigned __int8 *)objc_msgSend(objc_retainAutorelease(v3), "bytes");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)parseResponseForUInt16:(unint64_t)a3
{
  void *v3;
  unsigned __int16 *v4;
  void *v5;

  -[HAPTLVParser parseResponseForData:](self, "parseResponseForData:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "length") == 2)
  {
    v4 = (unsigned __int16 *)objc_msgSend(objc_retainAutorelease(v3), "bytes");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)parseResponseForString:(unint64_t)a3
{
  void *v3;
  void *v4;

  -[HAPTLVParser parseResponseForData:](self, "parseResponseForData:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v3, 4);
  else
    v4 = 0;

  return v4;
}

- (id)parseResponseForUUID:(unint64_t)a3
{
  void *v3;
  void *v4;

  -[HAPTLVParser parseResponseForData:](self, "parseResponseForData:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "length"))
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDBytes:", objc_msgSend(objc_retainAutorelease(v3), "bytes"));
  else
    v4 = 0;

  return v4;
}

- (id)parseResponseForArray:(unint64_t)a3
{
  void *v5;
  int v6;
  void *v7;
  int v8;
  id v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  uint8_t buf[4];
  void *v16;
  __int16 v17;
  unint64_t v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  -[NSData bytes](self->_tlvData, "bytes");
  -[NSData length](self->_tlvData, "length");
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  while (1)
  {
    v6 = TLV8Get();
    if (v6)
      break;
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", 0, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v7);

  }
  if (!v5)
  {
    v8 = v6;
    v9 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v10 = (void *)objc_msgSend(v9, "initWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], v8, 0);
    v11 = (void *)MEMORY[0x1D17B7244]();
    HMFGetOSLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v16 = v13;
      v17 = 2048;
      v18 = a3;
      v19 = 2112;
      v20 = v10;
      _os_log_impl(&dword_1CCE01000, v12, OS_LOG_TYPE_ERROR, "%{public}@Failed to parse array for TLV: %tu %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v11);

  }
  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tlvData, 0);
}

+ (id)parserWithData:(id)a3
{
  id v3;
  HAPTLVParser *v4;

  v3 = a3;
  v4 = -[HAPTLVParser initWithData:]([HAPTLVParser alloc], "initWithData:", v3);

  return v4;
}

@end
