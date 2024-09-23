@implementation HMDStatusChannelRecord

- (HMDStatusChannelRecord)initWithIdsIdentifier:(id)a3 idsDestination:(id)a4 payload:(id)a5 assertionTime:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  HMDStatusChannelRecord *v15;
  HMDStatusChannelRecord *v16;
  NSDictionary *payload;
  objc_super v19;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v19.receiver = self;
  v19.super_class = (Class)HMDStatusChannelRecord;
  v15 = -[HMDStatusChannelRecord init](&v19, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_idsIdentifier, a3);
    objc_storeStrong((id *)&v16->_idsDestination, a4);
    payload = v16->_payload;
    v16->_payload = (NSDictionary *)MEMORY[0x24BDBD1B8];

    if (v13)
      objc_storeStrong((id *)&v16->_payload, a5);
    objc_storeStrong((id *)&v16->_assertionTime, a6);
  }

  return v16;
}

- (HMDStatusChannelRecord)initWithPresentDevice:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  HMDStatusChannelRecord *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  HMDStatusChannelRecord *v19;
  void *v20;
  int v22;
  void *v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "presencePayload");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "deviceTokenURI");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_alloc(MEMORY[0x24BDD1880]);
  objc_msgSend(v5, "payloadDictionary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "hmf_stringForKey:", CFSTR("statusChannelDeviceIdKey"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v7, "initWithUUIDString:", v9);

  if (v10)
  {
    objc_msgSend(v5, "payloadDictionary");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "hmf_dateForKey:", CFSTR("SC.ck.pt"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      objc_msgSend(v5, "payloadDictionary");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = -[HMDStatusChannelRecord initWithIdsIdentifier:idsDestination:payload:assertionTime:](self, "initWithIdsIdentifier:idsDestination:payload:assertionTime:", v10, v6, v13, v12);
    }
    else
    {
      objc_msgSend(v4, "assertionTime");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "payloadDictionary");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = -[HMDStatusChannelRecord initWithIdsIdentifier:idsDestination:payload:assertionTime:](self, "initWithIdsIdentifier:idsDestination:payload:assertionTime:", v10, v6, v20, v13);

    }
    v19 = v14;
  }
  else
  {
    v15 = (void *)MEMORY[0x227676638]();
    v14 = self;
    HMFGetOSLogHandle();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "payloadDictionary");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = 138543618;
      v23 = v17;
      v24 = 2112;
      v25 = v18;
      _os_log_impl(&dword_2218F0000, v16, OS_LOG_TYPE_ERROR, "%{public}@Attempt to create ChannelRecord with invalid payload: missing/bad deviceID %@", (uint8_t *)&v22, 0x16u);

    }
    objc_autoreleasePoolPop(v15);
    v19 = 0;
  }

  return v19;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  -[HMDStatusChannelRecord idsIdentifier](self, "idsIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDStatusChannelRecord idsDestination](self, "idsDestination");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDStatusChannelRecord assertionTime](self, "assertionTime");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDStatusChannelRecord payload](self, "payload");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("device:%@ %@ assertionTime:%@ payload:%@"), v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  void *v16;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;
  if (v6)
  {
    -[HMDStatusChannelRecord idsIdentifier](self, "idsIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "idsIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "isEqual:", v8))
    {
      -[HMDStatusChannelRecord idsDestination](self, "idsDestination");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "idsDestination");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v9, "isEqual:", v10))
      {
        -[HMDStatusChannelRecord payload](self, "payload");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "payload");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v11, "isEqual:", v12))
        {
          -[HMDStatusChannelRecord assertionTime](self, "assertionTime");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "assertionTime");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = HMFEqualObjects();

        }
        else
        {
          v14 = 0;
        }

      }
      else
      {
        v14 = 0;
      }

    }
    else
    {
      v14 = 0;
    }

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[HMDStatusChannelRecord idsIdentifier](self, "idsIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (NSUUID)idsIdentifier
{
  return self->_idsIdentifier;
}

- (NSString)idsDestination
{
  return self->_idsDestination;
}

- (NSDictionary)payload
{
  return self->_payload;
}

- (NSDate)assertionTime
{
  return self->_assertionTime;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assertionTime, 0);
  objc_storeStrong((id *)&self->_payload, 0);
  objc_storeStrong((id *)&self->_idsDestination, 0);
  objc_storeStrong((id *)&self->_idsIdentifier, 0);
}

@end
