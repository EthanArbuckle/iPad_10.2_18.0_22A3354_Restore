@implementation HMDCoreDataContextTransactionAuthor

- (HMDCoreDataContextTransactionAuthor)initWithType:(unint64_t)a3 clientIdentifier:(id)a4 qualityOfService:(int64_t)a5
{
  id v8;
  HMDCoreDataContextTransactionAuthor *v9;
  HMDCoreDataContextTransactionAuthor *v10;
  void *v11;
  objc_super v13;

  v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)HMDCoreDataContextTransactionAuthor;
  v9 = -[HMDCoreDataContextTransactionAuthor init](&v13, sel_init);
  v10 = v9;
  if (v9)
  {
    v9->_type = a3;
    if (objc_msgSend(v8, "containsString:", CFSTR("/")))
      v11 = 0;
    else
      v11 = v8;
    objc_storeStrong((id *)&v10->_clientIdentifier, v11);
    v10->_qualityOfService = a5;
  }

  return v10;
}

- (NSString)string
{
  unint64_t v3;
  __CFString *v4;
  void *v5;
  uint64_t v6;
  const __CFString *v7;
  int v8;
  int64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v14;

  v3 = -[HMDCoreDataContextTransactionAuthor type](self, "type") - 2;
  if (v3 > 9)
    v4 = CFSTR("HMD.Unknown");
  else
    v4 = off_24E790D20[v3];
  -[HMDCoreDataContextTransactionAuthor clientIdentifier](self, "clientIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
    return (NSString *)v4;
  v6 = -[HMDCoreDataContextTransactionAuthor qualityOfService](self, "qualityOfService");
  v7 = 0;
  v8 = 0;
  if (v6 <= 16)
  {
    if (v6 == -1)
    {
      v7 = CFSTR("defaultQoS");
    }
    else
    {
      if (v6 != 9)
        goto LABEL_17;
      v7 = CFSTR("backgroundQoS");
    }
  }
  else
  {
    switch(v6)
    {
      case 17:
        v7 = CFSTR("utilityQoS");
        break;
      case 25:
        v7 = CFSTR("userInitiatedQoS");
        break;
      case 33:
        v7 = CFSTR("userInteractiveQoS");
        break;
      default:
        goto LABEL_17;
    }
  }
  v8 = 1;
LABEL_17:
  v9 = -[HMDCoreDataContextTransactionAuthor qualityOfService](self, "qualityOfService");
  v10 = (void *)MEMORY[0x24BDD17C8];
  -[HMDCoreDataContextTransactionAuthor clientIdentifier](self, "clientIdentifier");
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = (void *)v11;
  if (!v8 || v9 == -1)
    objc_msgSend(v10, "stringWithFormat:", CFSTR("%@/%@"), v4, v11, v14);
  else
    objc_msgSend(v10, "stringWithFormat:", CFSTR("%@/%@/%@"), v4, v11, v7);
  v4 = (__CFString *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (unint64_t)type
{
  return self->_type;
}

- (NSString)clientIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (int64_t)qualityOfService
{
  return self->_qualityOfService;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientIdentifier, 0);
}

+ (id)residentSyncContextAuthor
{
  return +[HMDCoreDataContextTransactionAuthor contextAuthorWithType:](HMDCoreDataContextTransactionAuthor, "contextAuthorWithType:", 5);
}

+ (id)firstPartyContextAuthor
{
  return +[HMDCoreDataContextTransactionAuthor contextAuthorWithType:](HMDCoreDataContextTransactionAuthor, "contextAuthorWithType:", 6);
}

+ (id)unitTestsContextAuthor
{
  return +[HMDCoreDataContextTransactionAuthor contextAuthorWithType:](HMDCoreDataContextTransactionAuthor, "contextAuthorWithType:", 2);
}

+ (id)controllerForceUpdateContextAuthor
{
  return +[HMDCoreDataContextTransactionAuthor contextAuthorWithType:](HMDCoreDataContextTransactionAuthor, "contextAuthorWithType:", 10);
}

+ (id)contextAuthorWithType:(unint64_t)a3
{
  return -[HMDCoreDataContextTransactionAuthor initWithType:clientIdentifier:qualityOfService:]([HMDCoreDataContextTransactionAuthor alloc], "initWithType:clientIdentifier:qualityOfService:", a3, 0, -1);
}

+ (id)contextAuthorWithType:(unint64_t)a3 clientIdentifier:(id)a4
{
  id v5;
  HMDCoreDataContextTransactionAuthor *v6;

  v5 = a4;
  v6 = -[HMDCoreDataContextTransactionAuthor initWithType:clientIdentifier:qualityOfService:]([HMDCoreDataContextTransactionAuthor alloc], "initWithType:clientIdentifier:qualityOfService:", a3, v5, -1);

  return v6;
}

+ (id)contextAuthorWithType:(unint64_t)a3 clientIdentifier:(id)a4 qualityOfService:(int64_t)a5
{
  id v7;
  HMDCoreDataContextTransactionAuthor *v8;

  v7 = a4;
  v8 = -[HMDCoreDataContextTransactionAuthor initWithType:clientIdentifier:qualityOfService:]([HMDCoreDataContextTransactionAuthor alloc], "initWithType:clientIdentifier:qualityOfService:", a3, v7, a5);

  return v8;
}

+ (id)contextAuthorWithString:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  uint64_t v21;
  HMDCoreDataContextTransactionAuthor *v22;
  int v24;
  void *v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "componentsSeparatedByString:", CFSTR("/"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "count"))
    {
      if ((unint64_t)objc_msgSend(v6, "count") >= 4)
      {
        v7 = (void *)MEMORY[0x227676638]();
        v8 = a1;
        HMFGetOSLogHandle();
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = 138543618;
          v25 = v10;
          v26 = 2112;
          v27 = v5;
          _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_ERROR, "%{public}@Unknown components in context transaction author string will not be parsed: %@", (uint8_t *)&v24, 0x16u);

        }
        objc_autoreleasePoolPop(v7);
      }
      objc_msgSend(v6, "objectAtIndexedSubscript:", 0);
      v11 = (id)objc_claimAutoreleasedReturnValue();
      v12 = 0;
      if (objc_msgSend(v11, "hasPrefix:", CFSTR("HMD.")))
      {
        if ((objc_msgSend(v11, "isEqualToString:", CFSTR("HMD.v4")) & 1) != 0)
        {
          v12 = 3;
        }
        else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("HMD.CK")) & 1) != 0)
        {
          v12 = 4;
        }
        else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("HMD.RS")) & 1) != 0)
        {
          v12 = 5;
        }
        else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("HMD.1P")) & 1) != 0)
        {
          v12 = 6;
        }
        else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("HMD.MI")) & 1) != 0)
        {
          v12 = 7;
        }
        else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("HMD.RC")) & 1) != 0)
        {
          v12 = 8;
        }
        else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("HMD.CKS")) & 1) != 0)
        {
          v12 = 9;
        }
        else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("HMD.CFU")) & 1) != 0)
        {
          v12 = 10;
        }
        else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("HMD.PCE")) & 1) != 0)
        {
          v12 = 11;
        }
        else if (objc_msgSend(v11, "isEqualToString:", CFSTR("HMD.UT")))
        {
          v12 = 2;
        }
        else
        {
          v12 = 0;
        }
      }

      if ((unint64_t)objc_msgSend(v6, "count") < 2)
      {
        v18 = 0;
      }
      else
      {
        objc_msgSend(v6, "objectAtIndexedSubscript:", 1);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
      }
      if (objc_msgSend(v18, "containsString:", CFSTR("/")))
      {

        v18 = 0;
      }
      if ((unint64_t)objc_msgSend(v6, "count") < 3)
      {
        v19 = 0;
      }
      else
      {
        objc_msgSend(v6, "objectAtIndexedSubscript:", 2);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
      }
      v20 = v19;
      if ((objc_msgSend(v20, "isEqualToString:", CFSTR("userInteractiveQoS")) & 1) != 0)
      {
        v21 = 33;
      }
      else if ((objc_msgSend(v20, "isEqualToString:", CFSTR("userInitiatedQoS")) & 1) != 0)
      {
        v21 = 25;
      }
      else if ((objc_msgSend(v20, "isEqualToString:", CFSTR("utilityQoS")) & 1) != 0)
      {
        v21 = 17;
      }
      else if (objc_msgSend(v20, "isEqualToString:", CFSTR("backgroundQoS")))
      {
        v21 = 9;
      }
      else
      {
        v21 = -1;
      }

      if ((unint64_t)objc_msgSend(v6, "count") < 3)
      {
        if (objc_msgSend(v6, "count") == 2)
          +[HMDCoreDataContextTransactionAuthor contextAuthorWithType:clientIdentifier:](HMDCoreDataContextTransactionAuthor, "contextAuthorWithType:clientIdentifier:", v12, v18);
        else
          +[HMDCoreDataContextTransactionAuthor contextAuthorWithType:](HMDCoreDataContextTransactionAuthor, "contextAuthorWithType:", v12);
        v22 = (HMDCoreDataContextTransactionAuthor *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v22 = -[HMDCoreDataContextTransactionAuthor initWithType:clientIdentifier:qualityOfService:]([HMDCoreDataContextTransactionAuthor alloc], "initWithType:clientIdentifier:qualityOfService:", v12, v18, v21);
      }
      v13 = v22;

    }
    else
    {
      v14 = (void *)MEMORY[0x227676638]();
      v15 = a1;
      HMFGetOSLogHandle();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = 138543618;
        v25 = v17;
        v26 = 2112;
        v27 = v5;
        _os_log_impl(&dword_2218F0000, v16, OS_LOG_TYPE_ERROR, "%{public}@Invalid context transaction author string: %@", (uint8_t *)&v24, 0x16u);

      }
      objc_autoreleasePoolPop(v14);
      v13 = 0;
    }

  }
  else
  {
    +[HMDCoreDataContextTransactionAuthor contextAuthorWithType:](HMDCoreDataContextTransactionAuthor, "contextAuthorWithType:", 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v13;
}

@end
