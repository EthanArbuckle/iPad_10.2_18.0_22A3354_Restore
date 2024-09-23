@implementation HMFPairingKey

+ (void)setClassMappingForNSCoder
{
  objc_msgSend(MEMORY[0x1E0CB36F8], "setClassName:forClass:", CFSTR("HAPPairingKey"), objc_opt_class());
  objc_msgSend(MEMORY[0x1E0CB3710], "setClass:forClassName:", objc_opt_class(), CFSTR("HAPPairingKey"));
}

- (HMFPairingKey)init
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v2 = (void *)MEMORY[0x1E0C99DA0];
  v3 = *MEMORY[0x1E0C99768];
  v4 = (void *)MEMORY[0x1E0CB3940];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("%@ is unavailable"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "exceptionWithName:reason:userInfo:", v3, v6, 0);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v7);
}

- (HMFPairingKey)initWithPairingKeyData:(id)a3
{
  id v4;
  HMFPairingKey *v5;
  uint64_t v6;
  NSData *data;
  HMFPairingKey *v8;
  HMFPairingKey *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  objc_super v14;
  uint8_t buf[4];
  void *v16;
  __int16 v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "length") == 32)
  {
    v14.receiver = self;
    v14.super_class = (Class)HMFPairingKey;
    v5 = -[HMFPairingKey init](&v14, sel_init);
    if (v5)
    {
      objc_msgSend(v4, "hmf_zeroingCopy");
      v6 = objc_claimAutoreleasedReturnValue();
      data = v5->_data;
      v5->_data = (NSData *)v6;

    }
    v8 = v5;
    v9 = v8;
  }
  else
  {
    v10 = (void *)MEMORY[0x1A1AC355C]();
    v8 = self;
    HMFGetOSLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier(v8);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v16 = v12;
      v17 = 2048;
      v18 = 32;
      _os_log_impl(&dword_19B546000, v11, OS_LOG_TYPE_ERROR, "%{public}@The pairing key data must be %tu bytes long", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v10);
    v9 = 0;
  }

  return v9;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[HMFPairingKey data](self, "data");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  HMFPairingKey *v4;
  void *v5;
  void *v6;
  char v7;

  v4 = (HMFPairingKey *)a3;
  if (self == v4)
  {
    v7 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[HMFPairingKey data](v4, "data");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMFPairingKey data](self, "data");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v5, "isEqualToData:", v6);

    }
    else
    {
      v7 = 0;
    }
  }

  return v7;
}

- (id)attributeDescriptions
{
  HMFAttributeDescription *v3;
  void *v4;
  void *v5;
  HMFAttributeDescription *v6;
  void *v7;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v3 = [HMFAttributeDescription alloc];
  -[HMFPairingKey data](self, "data");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  CUPrintNSObjectMasked();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[HMFAttributeDescription initWithName:value:](v3, "initWithName:value:", CFSTR("Hash"), v5);
  v9[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HMFPairingKey)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  HMFPairingKey *v6;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HAP.data"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[HMFPairingKey initWithPairingKeyData:](self, "initWithPairingKeyData:", v5);
  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[HMFPairingKey data](self, "data");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("HAP.data"));

}

- (NSData)data
{
  return self->_data;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_data, 0);
}

@end
