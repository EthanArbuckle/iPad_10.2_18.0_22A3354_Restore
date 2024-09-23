@implementation HAPAccessoryInfo

- (HAPAccessoryInfo)initWithName:(id)a3 manufacturer:(id)a4 modelName:(id)a5 category:(id)a6 certificationStatus:(id)a7 denylisted:(id)a8 ppid:(id)a9
{
  __CFString *v15;
  id v16;
  id v17;
  NSObject *v18;
  void *v19;
  HAPAccessoryInfo *v20;
  HAPAccessoryInfo *v21;
  id v23;
  void *context;
  id v25;
  id v26;
  id v27;
  id v28;
  objc_super v29;
  uint8_t buf[4];
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v15 = (__CFString *)a3;
  v16 = a4;
  v28 = a5;
  v27 = a6;
  v26 = a7;
  v25 = a8;
  v17 = a9;
  if (!v15)
  {
    context = (void *)MEMORY[0x1D17B7244]();
    HMFGetOSLogHandle();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v23 = v16;
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v31 = v19;
      _os_log_impl(&dword_1CCE01000, v18, OS_LOG_TYPE_ERROR, "%{public}@Accessory name is Unknown", buf, 0xCu);

      v16 = v23;
    }

    objc_autoreleasePoolPop(context);
    v15 = CFSTR("Unknown");
  }
  v29.receiver = self;
  v29.super_class = (Class)HAPAccessoryInfo;
  v20 = -[HAPAccessoryInfo init](&v29, sel_init, v23);
  v21 = v20;
  if (v20)
  {
    objc_storeStrong((id *)&v20->_name, v15);
    objc_storeStrong((id *)&v21->_manufacturer, a4);
    objc_storeStrong((id *)&v21->_modelName, a5);
    objc_storeStrong((id *)&v21->_category, a6);
    objc_storeStrong((id *)&v21->_certificationStatus, a7);
    objc_storeStrong((id *)&v21->_denylisted, a8);
    objc_storeStrong((id *)&v21->_ppid, a9);
    v21->_authenticated = 0;
  }

  return v21;
}

- (BOOL)isCertified
{
  void *v2;
  void *v3;
  char v4;

  -[HAPAccessoryInfo certificationStatus](self, "certificationStatus");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "uppercaseString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(CFSTR("CERTIFIED"), "isEqualToString:", v3);

  return v4;
}

- (BOOL)isDenylisted
{
  void *v2;
  void *v3;
  char v4;

  -[HAPAccessoryInfo denylisted](self, "denylisted");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "uppercaseString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(CFSTR("YES"), "isEqualToString:", v3);

  return v4;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[HAPAccessoryInfo name](self, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HAPAccessoryInfo manufacturer](self, "manufacturer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HAPAccessoryInfo modelName](self, "modelName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HAPAccessoryInfo category](self, "category");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HAPAccessoryInfo certificationStatus](self, "certificationStatus");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HAPAccessoryInfo denylisted](self, "denylisted");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HAPAccessoryInfo ppid](self, "ppid");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("Name: %@, Manufacturer: %@, Model: %@, Category: %@, Certification Status: %@, denylisted: %@, ppid: %@"), v4, v5, v6, v7, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (NSString)name
{
  return self->_name;
}

- (NSString)modelName
{
  return self->_modelName;
}

- (NSString)manufacturer
{
  return self->_manufacturer;
}

- (NSNumber)category
{
  return self->_category;
}

- (NSString)certificationStatus
{
  return self->_certificationStatus;
}

- (NSString)denylisted
{
  return self->_denylisted;
}

- (NSString)ppid
{
  return self->_ppid;
}

- (BOOL)authenticated
{
  return self->_authenticated;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ppid, 0);
  objc_storeStrong((id *)&self->_denylisted, 0);
  objc_storeStrong((id *)&self->_certificationStatus, 0);
  objc_storeStrong((id *)&self->_category, 0);
  objc_storeStrong((id *)&self->_manufacturer, 0);
  objc_storeStrong((id *)&self->_modelName, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
