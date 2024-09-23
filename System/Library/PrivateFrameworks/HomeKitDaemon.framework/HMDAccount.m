@implementation HMDAccount

- (BOOL)isCurrentAccount
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  -[HMDAccount devices](self, "devices", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v8;
    while (2)
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v8 != v4)
          objc_enumerationMutation(v2);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * i), "isCurrentDevice") & 1) != 0)
        {
          LOBYTE(v3) = 1;
          goto LABEL_11;
        }
      }
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
      if (v3)
        continue;
      break;
    }
  }
LABEL_11:

  return v3;
}

- (HMDDevice)currentDevice
{
  void *v2;
  id v3;
  uint64_t v4;
  void *i;
  void *v6;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  -[HMDAccount devices](self, "devices", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (id)objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v9;
    while (2)
    {
      for (i = 0; i != v3; i = (char *)i + 1)
      {
        if (*(_QWORD *)v9 != v4)
          objc_enumerationMutation(v2);
        v6 = *(void **)(*((_QWORD *)&v8 + 1) + 8 * (_QWORD)i);
        if ((objc_msgSend(v6, "isCurrentDevice") & 1) != 0)
        {
          v3 = v6;
          goto LABEL_11;
        }
      }
      v3 = (id)objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
      if (v3)
        continue;
      break;
    }
  }
LABEL_11:

  return (HMDDevice *)v3;
}

- (HMDAccount)init
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v2 = (void *)MEMORY[0x24BDBCE88];
  v3 = *MEMORY[0x24BDBCAB0];
  v4 = (void *)MEMORY[0x24BDD17C8];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("%@ is unavailable"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "exceptionWithName:reason:userInfo:", v3, v6, 0);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v7);
}

- (HMDAccount)initWithIdentifier:(id)a3 handles:(id)a4 devices:(id)a5
{
  id v8;
  id v9;
  id v10;
  HMDAccount *v11;
  uint64_t v12;
  HMDAccountIdentifier *identifier;
  id v14;
  const char *v15;
  NSObject *v16;
  dispatch_queue_t v17;
  OS_dispatch_queue *queue;
  void *v19;
  HMDAccount *v20;
  NSObject *v21;
  void *v22;
  HMDAccount *v23;
  void *v24;
  NSSet *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t i;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  NSMutableSet *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t j;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  objc_super v48;
  _BYTE v49[128];
  uint8_t v50[128];
  uint8_t buf[4];
  void *v52;
  uint64_t v53;

  v53 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (v8)
  {
    v48.receiver = self;
    v48.super_class = (Class)HMDAccount;
    v11 = -[HMDAccount init](&v48, sel_init);
    if (v11)
    {
      v12 = objc_msgSend(v8, "copy");
      identifier = v11->_identifier;
      v11->_identifier = (HMDAccountIdentifier *)v12;

      v11->_lock._os_unfair_lock_opaque = 0;
      HMDispatchQueueNameString();
      v14 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v15 = (const char *)objc_msgSend(v14, "UTF8String");
      dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      v16 = objc_claimAutoreleasedReturnValue();
      v17 = dispatch_queue_create(v15, v16);
      queue = v11->_queue;
      v11->_queue = (OS_dispatch_queue *)v17;

      if (v9)
        objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", v9);
      else
        objc_msgSend(MEMORY[0x24BDBCF20], "set");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_storeStrong((id *)&v11->_handles, v24);

      v46 = 0u;
      v47 = 0u;
      v44 = 0u;
      v45 = 0u;
      v25 = v11->_handles;
      v26 = -[NSSet countByEnumeratingWithState:objects:count:](v25, "countByEnumeratingWithState:objects:count:", &v44, v50, 16);
      if (v26)
      {
        v27 = v26;
        v28 = *(_QWORD *)v45;
        do
        {
          for (i = 0; i != v27; ++i)
          {
            if (*(_QWORD *)v45 != v28)
              objc_enumerationMutation(v25);
            v30 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * i);
            objc_msgSend(v30, "modelParentIdentifier");
            v31 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v31)
            {
              -[HMDAccount modelIdentifier](v11, "modelIdentifier");
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v30, "setModelParentIdentifier:", v32);

            }
          }
          v27 = -[NSSet countByEnumeratingWithState:objects:count:](v25, "countByEnumeratingWithState:objects:count:", &v44, v50, 16);
        }
        while (v27);
      }

      if (v10)
        objc_msgSend(MEMORY[0x24BDBCEF0], "setWithArray:", v10);
      else
        objc_msgSend(MEMORY[0x24BDBCEF0], "set");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_storeStrong((id *)&v11->_devices, v33);

      v42 = 0u;
      v43 = 0u;
      v40 = 0u;
      v41 = 0u;
      v34 = v11->_devices;
      v35 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v34, "countByEnumeratingWithState:objects:count:", &v40, v49, 16);
      if (v35)
      {
        v36 = v35;
        v37 = *(_QWORD *)v41;
        do
        {
          for (j = 0; j != v36; ++j)
          {
            if (*(_QWORD *)v41 != v37)
              objc_enumerationMutation(v34);
            objc_msgSend(*(id *)(*((_QWORD *)&v40 + 1) + 8 * j), "setAccount:", v11, (_QWORD)v40);
          }
          v36 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v34, "countByEnumeratingWithState:objects:count:", &v40, v49, 16);
        }
        while (v36);
      }

    }
    v20 = v11;
    v23 = v20;
  }
  else
  {
    v19 = (void *)MEMORY[0x227676638]();
    v20 = self;
    HMFGetOSLogHandle();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v52 = v22;
      _os_log_impl(&dword_2218F0000, v21, OS_LOG_TYPE_ERROR, "%{public}@Missing account identifier", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v19);
    v23 = 0;
  }

  return v23;
}

- (HMDAccount)initWithBackingModel:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  HMDAccount *v14;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(uint64_t, void *);
  void *v19;
  id v20;
  _QWORD v21[4];
  id v22;

  v4 = (void *)MEMORY[0x24BDBCEB8];
  v5 = a3;
  objc_msgSend(v4, "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handles");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x24BDAC760];
  v21[0] = MEMORY[0x24BDAC760];
  v21[1] = 3221225472;
  v21[2] = __35__HMDAccount_initWithBackingModel___block_invoke;
  v21[3] = &unk_24E781320;
  v22 = v6;
  v10 = v6;
  objc_msgSend(v8, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v21);

  objc_msgSend(v5, "devices");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v9;
  v17 = 3221225472;
  v18 = __35__HMDAccount_initWithBackingModel___block_invoke_2;
  v19 = &unk_24E781348;
  v20 = v7;
  v12 = v7;
  objc_msgSend(v11, "hmf_enumerateWithAutoreleasePoolUsingBlock:", &v16);

  objc_msgSend(v5, "identifier", v16, v17, v18, v19);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = -[HMDAccount initWithIdentifier:handles:devices:](self, "initWithIdentifier:handles:devices:", v13, v10, v12);
  return v14;
}

- (Protocol)backingModelType
{
  return (Protocol *)&unk_255778C70;
}

- (BOOL)updateBackingModel:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  HMDAccount *v15;
  SEL v16;

  v5 = a3;
  objc_msgSend(v5, "modelID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDAccount modelIdentifier](self, "modelIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "isEqual:", v7);

  if ((v8 & 1) != 0)
  {
    -[HMDAccount identifier](self, "identifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "identifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = HMFEqualObjects();

    if ((v11 & 1) == 0)
      objc_msgSend(v5, "setIdentifier:", v9);

    -[HMDAccount handles](self, "handles");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "synchronizeHandlesRelationWith:", v12);

    -[HMDAccount devices](self, "devices");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "synchronizeDevicesRelationWith:", v13);

    return 1;
  }
  else
  {
    v15 = (HMDAccount *)_HMFPreconditionFailure();
    return -[HMDAccount backingModelKey](v15, v16);
  }
}

- (HMDAccount)initWithObjectModel:(id)a3
{
  void *v4;
  HMDAccount *v5;

  objc_msgSend(a3, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[HMDAccount initWithIdentifier:handles:devices:](self, "initWithIdentifier:handles:devices:", v4, MEMORY[0x24BDBD1A8], MEMORY[0x24BDBD1A8]);

  return v5;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[HMDAccount identifier](self, "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  HMDAccount *v4;
  HMDAccount *v5;
  HMDAccount *v6;
  BOOL v7;

  v4 = (HMDAccount *)a3;
  if (v4 == self)
  {
    v7 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5 = v4;
    else
      v5 = 0;
    v6 = v5;
    if (v6)
      v7 = -[HMDAccount isEqualToAccount:](self, "isEqualToAccount:", v6);
    else
      v7 = 0;

  }
  return v7;
}

- (BOOL)isEqualToAccount:(id)a3
{
  HMDAccount *v4;
  HMDAccount *v5;
  void *v6;
  void *v7;
  char v8;

  v4 = (HMDAccount *)a3;
  v5 = v4;
  if (v4)
  {
    if (v4 == self)
    {
      v8 = 1;
    }
    else
    {
      -[HMDAccount identifier](v4, "identifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDAccount identifier](self, "identifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v6, "isEqual:", v7);

    }
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (BOOL)isRelatedToAccount:(id)a3
{
  id v4;
  BOOL v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v4 = a3;
  if (v4)
  {
    if (-[HMDAccount isEqualToAccount:](self, "isEqualToAccount:", v4))
    {
      v5 = 1;
    }
    else
    {
      objc_msgSend(v4, "senderCorrelationIdentifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (v6
        && (-[HMDAccount senderCorrelationIdentifier](self, "senderCorrelationIdentifier"),
            v7 = (void *)objc_claimAutoreleasedReturnValue(),
            v8 = objc_msgSend(v7, "isEqualToString:", v6),
            v7,
            (v8 & 1) != 0))
      {
        v5 = 1;
      }
      else
      {
        v9 = (void *)MEMORY[0x24BDBCEF0];
        objc_msgSend(v4, "handles");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setWithArray:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        v12 = (void *)MEMORY[0x24BDBCF20];
        -[HMDAccount handles](self, "handles");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setWithArray:", v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "intersectSet:", v14);

        v5 = objc_msgSend(v11, "count") != 0;
      }

    }
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (BOOL)isPresentInContacts
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  uint64_t v9;
  BOOL v10;
  void *v11;
  void *v12;
  HMDAccount *v13;
  NSObject *v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  void *v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  -[HMDAccount handles](self, "handles", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v17, v27, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v18;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v18 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        objc_msgSend(v8, "contact");
        v9 = objc_claimAutoreleasedReturnValue();
        if (v9)
        {
          v11 = (void *)v9;
          v12 = (void *)MEMORY[0x227676638]();
          v13 = self;
          HMFGetOSLogHandle();
          v14 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543874;
            v22 = v15;
            v23 = 2112;
            v24 = v11;
            v25 = 2112;
            v26 = v8;
            _os_log_impl(&dword_2218F0000, v14, OS_LOG_TYPE_INFO, "%{public}@Found contact: %@ for handle: %@", buf, 0x20u);

          }
          objc_autoreleasePoolPop(v12);

          v10 = 1;
          goto LABEL_13;
        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v17, v27, 16);
      if (v5)
        continue;
      break;
    }
  }
  v10 = 0;
LABEL_13:

  return v10;
}

- (void)isOfKnownPersonWithCompletion:(id)a3
{
  void (**v4)(id, uint64_t);
  void *v5;
  HMDAccount *v6;
  NSObject *v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v4 = (void (**)(id, uint64_t))a3;
  if (-[HMDAccount isPresentInContacts](self, "isPresentInContacts"))
  {
    v4[2](v4, 1);
  }
  else
  {
    v5 = (void *)MEMORY[0x227676638]();
    v6 = self;
    HMFGetOSLogHandle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138543362;
      v10 = v8;
      _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_INFO, "%{public}@Account is not present in contacts, checking family circle.", (uint8_t *)&v9, 0xCu);

    }
    objc_autoreleasePoolPop(v5);
    -[HMDAccount isPresentInFamilyCircleWithCompletion:](v6, "isPresentInFamilyCircleWithCompletion:", v4);
  }

}

- (id)shortDescription
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend((id)objc_opt_class(), "shortDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDAccount identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "shortDescription");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)attributeDescriptions
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v18[5];

  v18[4] = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMDAccount identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "shortDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithName:value:", CFSTR("Id"), v5);
  v18[0] = v6;
  v7 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMDAccount senderCorrelationIdentifier](self, "senderCorrelationIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v7, "initWithName:value:", CFSTR("MID"), v8);
  v18[1] = v9;
  v10 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMDAccount handles](self, "handles");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v10, "initWithName:value:", CFSTR("Hndl"), v11);
  v18[2] = v12;
  v13 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMDAccount devices](self, "devices");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v13, "initWithName:value:", CFSTR("Dev"), v14);
  v18[3] = v15;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v18, 4);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (BOOL)isAuthenticated
{
  void *v2;
  char v3;

  -[HMDAccount identifier](self, "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isAuthenticated");

  return v3;
}

- (BOOL)shouldCache
{
  HMDAccount *v2;
  void *v3;

  v2 = self;
  -[HMDAccount manager](self, "manager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v2) = objc_msgSend(v3, "shouldCacheAccount:", v2);

  return (char)v2;
}

- (NSString)name
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  -[HMDAccount contact](self, "contact");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3
    || (objc_msgSend(MEMORY[0x24BDBACC0], "stringFromContact:style:", v3, 0),
        (v4 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    +[HMDAccountHandleFormatter defaultFormatter](HMDAccountHandleFormatter, "defaultFormatter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDAccount handles](self, "handles");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "firstObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringForObjectValue:", v7);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return (NSString *)v4;
}

- (CNContact)contact
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[HMDAccount handles](self, "handles", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v11;
    while (2)
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v11 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v6), "contact");
        v7 = objc_claimAutoreleasedReturnValue();
        if (v7)
        {
          v8 = (void *)v7;
          goto LABEL_11;
        }
        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      if (v4)
        continue;
      break;
    }
  }
  v8 = 0;
LABEL_11:

  return (CNContact *)v8;
}

- (NSString)senderCorrelationIdentifier
{
  void *v3;
  void *v4;

  -[HMDAccount identifier](self, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "senderCorrelationIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    -[HMDAccount appleAccountSenderCorrelationIdentifier](self, "appleAccountSenderCorrelationIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (NSString *)v4;
}

- (void)setSenderCorrelationIdentifier:(id)a3
{
  if (a3)
    -[HMDAccount setAppleAccountSenderCorrelationIdentifier:](self, "setAppleAccountSenderCorrelationIdentifier:");
}

- (id)appleAccountSenderCorrelationIdentifier
{
  os_unfair_lock_s *p_lock;
  NSString *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = self->_appleAccountSenderCorrelationIdentifier;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setAppleAccountSenderCorrelationIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSString *v9;
  NSString *appleAccountSenderCorrelationIdentifier;
  void *v11;
  void *v12;
  HMDAccount *v13;
  NSObject *v14;
  void *v15;
  HMDAssertionLogEvent *v16;
  void *v17;
  id v18;
  uint8_t buf[4];
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  os_unfair_lock_lock_with_options();
  v18 = v4;
  if (self)
  {
    os_unfair_lock_assert_owner(&self->_lock);
    -[HMDAccount identifier](self, "identifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "senderCorrelationIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      v12 = (void *)MEMORY[0x227676638]();
      v13 = self;
      HMFGetOSLogHandle();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
      {
        HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        v20 = objc_claimAutoreleasedReturnValue();
        v15 = (void *)v20;
        _os_log_impl(&dword_2218F0000, v14, OS_LOG_TYPE_FAULT, "%{public}@Submitting ABC event for failure: MergeID cannot be updated on an account with identifier based on MergeID", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v12);
      v16 = -[HMDAssertionLogEvent initWithReason:]([HMDAssertionLogEvent alloc], "initWithReason:", CFSTR("MergeID cannot be updated on an account with identifier based on MergeID"));
      +[HMDMetricsManager sharedLogEventSubmitter](HMDMetricsManager, "sharedLogEventSubmitter");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "submitLogEvent:", v16);

    }
    -[HMDAccount identifier](self, "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "senderCorrelationIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v8 && v18 && (HMFEqualObjects() & 1) == 0)
    {
      v9 = (NSString *)objc_msgSend(v18, "copy");
      appleAccountSenderCorrelationIdentifier = self->_appleAccountSenderCorrelationIdentifier;
      self->_appleAccountSenderCorrelationIdentifier = v9;

      objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "postNotificationName:object:", CFSTR("HMDAppleAccountMergeIdentifierUpdatedNotification"), self);

    }
  }

  os_unfair_lock_unlock(&self->_lock);
}

- (NSArray)handles
{
  os_unfair_lock_s *p_lock;
  void *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  -[NSSet allObjects](self->_handles, "allObjects");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(p_lock);
  return (NSArray *)v4;
}

- (HMDAccountHandle)primaryHandle
{
  void *v3;
  void *v4;
  os_unfair_lock_s *p_lock;
  void *v6;

  -[HMDAccount manager](self, "manager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) == 0
    || (objc_msgSend(v3, "primaryHandleForAccount:", self), (v4 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    p_lock = &self->_lock;
    os_unfair_lock_lock_with_options();
    objc_msgSend(MEMORY[0x24BDBCEE0], "orderedSetWithSet:", self->_handles);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "sortUsingComparator:", &__block_literal_global_83796);
    objc_msgSend(v6, "lastObject");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    os_unfair_lock_unlock(p_lock);
  }

  return (HMDAccountHandle *)v4;
}

- (void)setHandles:(id)a3
{
  id v4;
  void *v5;
  NSSet *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  _BOOL4 v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (v4)
  {
    objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    os_unfair_lock_lock_with_options();
    if (-[NSSet isEqualToSet:](self->_handles, "isEqualToSet:", v5))
    {
      os_unfair_lock_unlock(&self->_lock);
    }
    else
    {
      objc_storeStrong((id *)&self->_handles, v5);
      v16 = 0u;
      v17 = 0u;
      v14 = 0u;
      v15 = 0u;
      v6 = self->_handles;
      v7 = -[NSSet countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v7)
      {
        v8 = *(_QWORD *)v15;
        do
        {
          for (i = 0; i != v7; ++i)
          {
            if (*(_QWORD *)v15 != v8)
              objc_enumerationMutation(v6);
            v10 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
            objc_msgSend(v10, "modelParentIdentifier", (_QWORD)v14);
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            v12 = v11 == 0;

            if (v12)
            {
              -[HMDAccount modelIdentifier](self, "modelIdentifier");
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v10, "setModelParentIdentifier:", v13);

            }
          }
          v7 = -[NSSet countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
        }
        while (v7);
      }

      os_unfair_lock_unlock(&self->_lock);
      __HMDAccountDidUpdateHandles(self);
    }

  }
}

- (void)addHandle:(id)a3
{
  id v4;
  char v5;
  id v6;

  v4 = a3;
  if (v4)
  {
    v6 = v4;
    os_unfair_lock_lock_with_options();
    v5 = __HMDAccountAddHandle(self, v6);
    os_unfair_lock_unlock(&self->_lock);
    v4 = v6;
    if ((v5 & 1) != 0)
    {
      __HMDAccountDidUpdateHandles(self);
      v4 = v6;
    }
  }

}

- (void)removeHandle:(id)a3
{
  id v4;
  void *v5;
  HMDAccount *v6;
  id v7;
  void *v8;
  id v9;

  v4 = a3;
  if (v4)
  {
    v9 = v4;
    os_unfair_lock_lock_with_options();
    __HMDAccountRemoveHandle(self, v9);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    os_unfair_lock_unlock(&self->_lock);
    if (v5)
    {
      v6 = self;
      v7 = v5;
      +[HMDAccountRegistry sharedRegistry](HMDAccountRegistry, "sharedRegistry");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "removeHandle:fromAccount:", v7, v6);

      __HMDAccountDidUpdateHandles(v6);
      -[HMDAccount _repairDevicesWithStaleHandle:](v6, "_repairDevicesWithStaleHandle:", v9);
    }

    v4 = v9;
  }

}

- (void)_repairDevicesWithStaleHandle:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  HMDAccount *v15;
  NSObject *v16;
  _BOOL4 v17;
  void *v18;
  void *v19;
  HMDAccount *v20;
  id v21;
  void *v22;
  void *v23;
  id v24;
  id v25;
  id v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _QWORD v31[4];
  id v32;
  uint8_t buf[4];
  void *v34;
  __int16 v35;
  void *v36;
  __int16 v37;
  void *v38;
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMDAccount primaryHandle](self, "primaryHandle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDAccount devices](self, "devices");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v31[0] = MEMORY[0x24BDAC760];
  v31[1] = 3221225472;
  v31[2] = __44__HMDAccount__repairDevicesWithStaleHandle___block_invoke;
  v31[3] = &unk_24E797B48;
  v25 = v4;
  v32 = v25;
  objc_msgSend(v6, "na_filter:", v31);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v8 = v7;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v27, v39, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v28;
    v26 = v8;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v28 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
        v14 = (void *)MEMORY[0x227676638]();
        v15 = self;
        HMFGetOSLogHandle();
        v16 = objc_claimAutoreleasedReturnValue();
        v17 = os_log_type_enabled(v16, OS_LOG_TYPE_INFO);
        if (v5)
        {
          if (v17)
          {
            HMFGetLogIdentifier();
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543874;
            v34 = v18;
            v35 = 2112;
            v36 = v13;
            v37 = 2112;
            v38 = v5;
            _os_log_impl(&dword_2218F0000, v16, OS_LOG_TYPE_INFO, "%{public}@Repairing stale handle for device %@ updating to %@", buf, 0x20u);

            v8 = v26;
          }

          objc_autoreleasePoolPop(v14);
          objc_msgSend(v13, "setAccount:", v15);
        }
        else
        {
          if (v17)
          {
            HMFGetLogIdentifier();
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v34 = v19;
            v35 = 2112;
            v36 = v13;
            _os_log_impl(&dword_2218F0000, v16, OS_LOG_TYPE_INFO, "%{public}@Removing device from empty account %@", buf, 0x16u);

            v8 = v26;
          }

          objc_autoreleasePoolPop(v14);
          -[HMDAccount removeDevice:](v15, "removeDevice:", v13);
        }
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v27, v39, 16);
    }
    while (v10);
  }

  if (v5)
  {
    v20 = self;
    v21 = v8;
    +[HMDAccountRegistry sharedRegistry](HMDAccountRegistry, "sharedRegistry");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", v21);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    v24 = (id)objc_msgSend(v22, "updateDevices:onAccount:", v23, v20);
  }

}

- (id)accountHandleWithModelIdentifier:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  char v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (v4)
  {
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    -[HMDAccount handles](self, "handles", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v6)
    {
      v7 = *(_QWORD *)v14;
      while (2)
      {
        for (i = 0; i != v6; i = (char *)i + 1)
        {
          if (*(_QWORD *)v14 != v7)
            objc_enumerationMutation(v5);
          v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
          objc_msgSend(v9, "modelIdentifier");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = objc_msgSend(v4, "hmf_isEqualToUUID:", v10);

          if ((v11 & 1) != 0)
          {
            v6 = v9;
            goto LABEL_12;
          }
        }
        v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
        if (v6)
          continue;
        break;
      }
    }
LABEL_12:

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (NSArray)devices
{
  os_unfair_lock_s *p_lock;
  void *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  -[NSMutableSet allObjects](self->_devices, "allObjects");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(p_lock);
  return (NSArray *)v4;
}

- (id)deviceForIdentifier:(id)a3
{
  id v4;
  os_unfair_lock_s *p_lock;
  NSMutableSet *v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  void *v11;
  char v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v6 = self->_devices;
  v7 = (id)-[NSMutableSet countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v15;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v6);
        v10 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v10, "identifier", (_QWORD)v14);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "hmf_isEqualToUUID:", v4);

        if ((v12 & 1) != 0)
        {
          v7 = v10;
          goto LABEL_11;
        }
      }
      v7 = (id)-[NSMutableSet countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v7)
        continue;
      break;
    }
  }
LABEL_11:

  os_unfair_lock_unlock(p_lock);
  return v7;
}

- (id)deviceForHandle:(id)a3
{
  id v4;
  os_unfair_lock_s *p_lock;
  NSMutableSet *v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  void *v11;
  char v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v6 = self->_devices;
  v7 = (id)-[NSMutableSet countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v15;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v6);
        v10 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v10, "handles", (_QWORD)v14);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "containsObject:", v4);

        if ((v12 & 1) != 0)
        {
          v7 = v10;
          goto LABEL_11;
        }
      }
      v7 = (id)-[NSMutableSet countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v7)
        continue;
      break;
    }
  }
LABEL_11:

  os_unfair_lock_unlock(p_lock);
  return v7;
}

- (id)deviceWithModelIdentifier:(id)a3
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  char v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (v4)
  {
    -[HMDAccount devices](self, "devices");
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v5 = (id)objc_claimAutoreleasedReturnValue();
    v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v6)
    {
      v7 = *(_QWORD *)v14;
      while (2)
      {
        for (i = 0; i != v6; i = (char *)i + 1)
        {
          if (*(_QWORD *)v14 != v7)
            objc_enumerationMutation(v5);
          v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
          objc_msgSend(v9, "modelIdentifier", (_QWORD)v13);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = objc_msgSend(v4, "hmf_isEqualToUUID:", v10);

          if ((v11 & 1) != 0)
          {
            v6 = v9;
            goto LABEL_12;
          }
        }
        v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
        if (v6)
          continue;
        break;
      }
    }
LABEL_12:

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)addDevice:(id)a3
{
  id v4;
  char v5;
  HMDAccount *v6;
  id v7;
  void *v8;
  id v9;

  v4 = a3;
  if (v4)
  {
    v9 = v4;
    os_unfair_lock_lock_with_options();
    v5 = __HMDAccountAddDevice(self, v9);
    os_unfair_lock_unlock(&self->_lock);
    v4 = v9;
    if ((v5 & 1) != 0)
    {
      objc_msgSend(v9, "setAccount:", self);
      v6 = self;
      v7 = v9;
      +[HMDAccountRegistry sharedRegistry](HMDAccountRegistry, "sharedRegistry");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "addDevice:toAccount:", v7, v6);

      __HMDAccountDidAddDevice(v6, v7);
      v4 = v9;
    }
  }

}

- (void)removeDevice:(id)a3
{
  id v4;
  void *v5;
  HMDAccount *v6;
  id v7;
  void *v8;
  id v9;

  v4 = a3;
  if (v4)
  {
    v9 = v4;
    os_unfair_lock_lock_with_options();
    __HMDAccountRemoveDevice(self, v9);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    os_unfair_lock_unlock(&self->_lock);
    if (v5)
    {
      v6 = self;
      v7 = v5;
      +[HMDAccountRegistry sharedRegistry](HMDAccountRegistry, "sharedRegistry");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "removeDevice:fromAccount:", v7, v6);

      objc_msgSend(v7, "setAccount:", 0);
      __HMDAccountDidRemoveDevice(v6, v7);
    }

    v4 = v9;
  }

}

- (id)logIdentifier
{
  void *v2;
  void *v3;
  void *v4;

  -[HMDAccount identifier](self, "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "UUIDString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  void *v8;
  unint64_t v9;

  -[HMDAccount devices](self, "devices");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", a3, a4, a5);

  return v9;
}

- (BOOL)shouldMergeObject:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;
  -[HMDAccount identifier](self, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v6) = objc_msgSend(v7, "isEqual:", v8);
  return (char)v6;
}

- (BOOL)mergeObject:(id)a3
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
  int v13;
  void *v14;
  HMDAccount *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t i;
  void *v30;
  void *v31;
  HMDAccount *v32;
  NSObject *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t j;
  void *v40;
  void *v41;
  HMDAccount *v42;
  NSObject *v43;
  void *v44;
  void *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t k;
  void *v50;
  void *v51;
  void *v52;
  HMDAccount *v53;
  NSObject *v54;
  void *v55;
  void *v56;
  HMDAccount *v57;
  NSObject *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  HMDAccount *v63;
  NSObject *v64;
  void *v65;
  BOOL v66;
  void *v68;
  id v69;
  void *v70;
  char v71;
  id v72;
  id v73;
  id obj;
  void *v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  uint8_t buf[4];
  void *v89;
  __int16 v90;
  void *v91;
  __int16 v92;
  void *v93;
  _BYTE v94[128];
  _BYTE v95[128];
  _BYTE v96[128];
  uint64_t v97;

  v97 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;

  if (v6)
  {
    v7 = (void *)MEMORY[0x24BDBCEF0];
    -[HMDAccount handles](self, "handles");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setWithArray:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = (void *)MEMORY[0x24BDBCF20];
    objc_msgSend(v6, "handles");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setWithArray:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v9, "mergeObject:", v12);

    v68 = v6;
    if (v13)
    {
      v14 = (void *)MEMORY[0x227676638]();
      v15 = self;
      HMFGetOSLogHandle();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v89 = v17;
        v90 = 2112;
        v91 = v9;
        _os_log_impl(&dword_2218F0000, v16, OS_LOG_TYPE_INFO, "%{public}@Updated handles: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v14);
      objc_msgSend(v9, "allObjects");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDAccount setHandles:](v15, "setHandles:", v18);

      LOBYTE(v13) = 1;
    }

    v19 = (void *)MEMORY[0x24BDBCF20];
    -[HMDAccount devices](self, "devices");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setWithArray:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    v22 = (void *)MEMORY[0x24BDBCF20];
    v69 = v4;
    objc_msgSend(v4, "devices");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setWithArray:", v23);
    v24 = objc_claimAutoreleasedReturnValue();

    v70 = v21;
    v25 = (void *)objc_msgSend(v21, "mutableCopy");
    v75 = (void *)v24;
    objc_msgSend(v25, "minusSet:", v24);
    v86 = 0u;
    v87 = 0u;
    v84 = 0u;
    v85 = 0u;
    obj = v25;
    v26 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v84, v96, 16);
    if (v26)
    {
      v27 = v26;
      v28 = *(_QWORD *)v85;
      do
      {
        for (i = 0; i != v27; ++i)
        {
          if (*(_QWORD *)v85 != v28)
            objc_enumerationMutation(obj);
          v30 = *(void **)(*((_QWORD *)&v84 + 1) + 8 * i);
          v31 = (void *)MEMORY[0x227676638]();
          v32 = self;
          HMFGetOSLogHandle();
          v33 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v89 = v34;
            v90 = 2112;
            v91 = v30;
            _os_log_impl(&dword_2218F0000, v33, OS_LOG_TYPE_INFO, "%{public}@Removed device: %@", buf, 0x16u);

          }
          objc_autoreleasePoolPop(v31);
          -[HMDAccount removeDevice:](v32, "removeDevice:", v30);
        }
        v27 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v84, v96, 16);
      }
      while (v27);
      LOBYTE(v13) = 1;
    }

    v35 = (void *)objc_msgSend(v75, "mutableCopy");
    objc_msgSend(v35, "minusSet:", v21);
    v82 = 0u;
    v83 = 0u;
    v80 = 0u;
    v81 = 0u;
    v73 = v35;
    v36 = objc_msgSend(v73, "countByEnumeratingWithState:objects:count:", &v80, v95, 16);
    if (v36)
    {
      v37 = v36;
      v38 = *(_QWORD *)v81;
      do
      {
        for (j = 0; j != v37; ++j)
        {
          if (*(_QWORD *)v81 != v38)
            objc_enumerationMutation(v73);
          v40 = *(void **)(*((_QWORD *)&v80 + 1) + 8 * j);
          v41 = (void *)MEMORY[0x227676638]();
          v42 = self;
          HMFGetOSLogHandle();
          v43 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v44 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v89 = v44;
            v90 = 2112;
            v91 = v40;
            _os_log_impl(&dword_2218F0000, v43, OS_LOG_TYPE_INFO, "%{public}@Added device: %@", buf, 0x16u);

          }
          objc_autoreleasePoolPop(v41);
          -[HMDAccount addDevice:](v42, "addDevice:", v40);
        }
        v37 = objc_msgSend(v73, "countByEnumeratingWithState:objects:count:", &v80, v95, 16);
      }
      while (v37);
      LOBYTE(v13) = 1;
    }
    v71 = v13;

    v45 = (void *)objc_msgSend(v21, "mutableCopy");
    objc_msgSend(v45, "minusSet:", obj);
    v78 = 0u;
    v79 = 0u;
    v76 = 0u;
    v77 = 0u;
    v72 = v45;
    v46 = objc_msgSend(v72, "countByEnumeratingWithState:objects:count:", &v76, v94, 16);
    if (v46)
    {
      v47 = v46;
      v48 = *(_QWORD *)v77;
      do
      {
        for (k = 0; k != v47; ++k)
        {
          if (*(_QWORD *)v77 != v48)
            objc_enumerationMutation(v72);
          v50 = *(void **)(*((_QWORD *)&v76 + 1) + 8 * k);
          objc_msgSend(v75, "member:", v50);
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          if (v51)
          {
            v52 = (void *)MEMORY[0x227676638]();
            v53 = self;
            HMFGetOSLogHandle();
            v54 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v54, OS_LOG_TYPE_DEBUG))
            {
              HMFGetLogIdentifier();
              v55 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543874;
              v89 = v55;
              v90 = 2112;
              v91 = v50;
              v92 = 2112;
              v93 = v51;
              _os_log_impl(&dword_2218F0000, v54, OS_LOG_TYPE_DEBUG, "%{public}@Merging existing device: %@ with device: %@", buf, 0x20u);

            }
            objc_autoreleasePoolPop(v52);
            if (objc_msgSend(v50, "mergeObject:", v51))
            {
              v56 = (void *)MEMORY[0x227676638]();
              v57 = v53;
              HMFGetOSLogHandle();
              v58 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v58, OS_LOG_TYPE_INFO))
              {
                HMFGetLogIdentifier();
                v59 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138543618;
                v89 = v59;
                v90 = 2112;
                v91 = v51;
                _os_log_impl(&dword_2218F0000, v58, OS_LOG_TYPE_INFO, "%{public}@Updated device: %@", buf, 0x16u);

              }
              objc_autoreleasePoolPop(v56);
              v71 = 1;
            }
          }

        }
        v47 = objc_msgSend(v72, "countByEnumeratingWithState:objects:count:", &v76, v94, 16);
      }
      while (v47);
    }

    -[HMDAccount appleAccountSenderCorrelationIdentifier](self, "appleAccountSenderCorrelationIdentifier");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v68;
    objc_msgSend(v68, "appleAccountSenderCorrelationIdentifier");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    if (v61)
    {
      v4 = v69;
      if ((objc_msgSend(v60, "isEqualToString:", v61) & 1) == 0)
      {
        v62 = (void *)MEMORY[0x227676638]();
        v63 = self;
        HMFGetOSLogHandle();
        v64 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v64, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v65 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v89 = v65;
          v90 = 2112;
          v91 = v61;
          _os_log_impl(&dword_2218F0000, v64, OS_LOG_TYPE_INFO, "%{public}@Updating sender correlation identifier to %@", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v62);
        -[HMDAccount setAppleAccountSenderCorrelationIdentifier:](v63, "setAppleAccountSenderCorrelationIdentifier:", v61);
        v71 = 1;
      }
    }
    else
    {
      v4 = v69;
    }

    v66 = v71 & 1;
  }
  else
  {
    v66 = 0;
  }

  return v66;
}

- (HMDAccount)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  HMDAccount *v14;
  HMDAccount *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  int v20;
  void *v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  void *v27;
  _QWORD v28[2];
  _QWORD v29[3];

  v29[2] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)MEMORY[0x24BDBCF20];
  v29[0] = objc_opt_class();
  v29[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v29, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setWithArray:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v7, CFSTR("HM.devices"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)MEMORY[0x24BDBCF20];
  v28[0] = objc_opt_class();
  v28[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v28, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setWithArray:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v11, CFSTR("HM.handles"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HM.identifier2"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13 && v12 && v8)
  {
    v14 = -[HMDAccount initWithIdentifier:handles:devices:](self, "initWithIdentifier:handles:devices:", v13, v12, v8);
    v15 = v14;
  }
  else
  {
    v16 = (void *)MEMORY[0x227676638]();
    v14 = self;
    HMFGetOSLogHandle();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = 138544130;
      v21 = v18;
      v22 = 2112;
      v23 = v13;
      v24 = 2112;
      v25 = v12;
      v26 = 2112;
      v27 = v8;
      _os_log_impl(&dword_2218F0000, v17, OS_LOG_TYPE_ERROR, "%{public}@Cannot initialize HMDAccount from decoded identifier: %@ handles: %@ devices:%@ ", (uint8_t *)&v20, 0x2Au);

    }
    objc_autoreleasePoolPop(v16);
    v15 = 0;
  }

  return v15;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[HMDAccount identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("HM.identifier2"));

  -[HMDAccount handles](self, "handles");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("HM.handles"));

  -[HMDAccount devices](self, "devices");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("HM.devices"));

}

- (void)transactionObjectRemoved:(id)a3 message:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  HMDAccount *v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  id v25;
  HMDAccount *v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  int v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  HMDAccount *v41;
  NSObject *v42;
  void *v43;
  void *v44;
  id v45;
  void *v46;
  void *v47;
  HMDAccount *v48;
  NSObject *v49;
  void *v50;
  id v51;
  void *v52;
  HMDAccount *v53;
  NSObject *v54;
  void *v55;
  id v56;
  void *v57;
  void *v58;
  id v59;
  void *v60;
  void *v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  uint8_t buf[4];
  void *v67;
  __int16 v68;
  id v69;
  __int16 v70;
  id v71;
  uint64_t v72;

  v72 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = v6;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v9 = v8;
  else
    v9 = 0;
  v10 = v9;

  v60 = v7;
  v61 = v8;
  if (v10)
  {
    v11 = self;
    v12 = v10;
    v13 = v7;
    objc_msgSend(v13, "transactionResult");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "uuid");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDAccount accountHandleWithModelIdentifier:](v11, "accountHandleWithModelIdentifier:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      -[HMDAccount manager](v11, "manager");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "shouldAccount:pushbackModel:actions:", v11, v12, v14);

      if (v18)
      {
        objc_msgSend(v14, "backingStore");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        +[HMDBackingStoreTransactionOptions localPushBackOptions](HMDBackingStoreTransactionOptions, "localPushBackOptions");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "transaction:options:", CFSTR("accountHandle pushback"), v20);
        v21 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v16, "modelObjectWithChangeType:version:", 1, 4);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "add:", v22);

        objc_msgSend(v21, "run");
      }
      else
      {
        os_unfair_lock_lock_with_options();
        __HMDAccountRemoveHandle(v11, v16);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        os_unfair_lock_unlock(&v11->_lock);
        if (v21)
          __HMDAccountDidUpdateHandles(v11);
        objc_msgSend(v14, "markChanged");
      }

    }
    else
    {
      v40 = (void *)MEMORY[0x227676638]();
      v41 = v11;
      HMFGetOSLogHandle();
      v42 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v67 = v43;
        v68 = 2112;
        v69 = v12;
        v70 = 2112;
        v71 = (id)objc_opt_class();
        v44 = v40;
        v45 = v71;
        _os_log_impl(&dword_2218F0000, v42, OS_LOG_TYPE_ERROR, "%{public}@Delete request for unknown object (%@) sent to [%@ transactionObjectRemoved:message:]", buf, 0x20u);

        v40 = v44;
      }

      objc_autoreleasePoolPop(v40);
      objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 2);
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "respondWithError:", v46);

    }
    v27 = v61;
    goto LABEL_48;
  }
  v23 = v8;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v24 = v23;
  else
    v24 = 0;
  v25 = v24;

  if (v25)
  {
    v26 = self;
    v27 = v25;
    v59 = v7;
    objc_msgSend(v59, "transactionResult");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "uuid");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDAccount deviceWithModelIdentifier:](v26, "deviceWithModelIdentifier:", v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v30)
    {
      v52 = (void *)MEMORY[0x227676638]();
      v53 = v26;
      HMFGetOSLogHandle();
      v54 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v67 = v55;
        v68 = 2112;
        v69 = v27;
        v70 = 2112;
        v71 = (id)objc_opt_class();
        v56 = v71;
        _os_log_impl(&dword_2218F0000, v54, OS_LOG_TYPE_ERROR, "%{public}@Delete request for unknown object (%@) sent to [%@ transactionObjectRemoved:message:]", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v52);
      objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 2);
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v59, "respondWithError:", v57);

      goto LABEL_47;
    }
    -[HMDAccount manager](v26, "manager");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = objc_msgSend(v31, "shouldAccount:pushbackModel:actions:", v26, v27, v28);

    if (v32)
    {
      objc_msgSend(v28, "backingStore");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      +[HMDBackingStoreTransactionOptions localPushBackOptions](HMDBackingStoreTransactionOptions, "localPushBackOptions");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "transaction:options:", CFSTR("device pushback"), v34);
      v35 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v30, "backingStoreObjectsWithChangeType:version:", 1, 4);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v64 = 0u;
      v65 = 0u;
      v62 = 0u;
      v63 = 0u;
      v37 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v62, buf, 16);
      if (v37)
      {
        v38 = *(_QWORD *)v63;
        do
        {
          v39 = 0;
          do
          {
            if (*(_QWORD *)v63 != v38)
              objc_enumerationMutation(v36);
            objc_msgSend(v35, "add:", *(_QWORD *)(*((_QWORD *)&v62 + 1) + 8 * v39++));
          }
          while (v37 != v39);
          v37 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v62, buf, 16);
        }
        while (v37);
      }
      objc_msgSend(v35, "run");

LABEL_47:
      goto LABEL_48;
    }
    if (objc_msgSend(v28, "source"))
    {
      if (objc_msgSend(v28, "source") != 2 || !objc_msgSend(v30, "isCloudTracked"))
      {
LABEL_43:
        if ((objc_msgSend(v30, "isLocallyTracked") & 1) == 0)
        {
          os_unfair_lock_lock_with_options();
          __HMDAccountRemoveDevice(v26, v30);
          v58 = (void *)objc_claimAutoreleasedReturnValue();
          os_unfair_lock_unlock(&v26->_lock);
          if (v58)
          {
            __HMDAccountDidRemoveDevice(v26, v58);
            objc_msgSend(v58, "setAccount:", 0);
          }
          objc_msgSend(v28, "markChanged");

        }
        goto LABEL_47;
      }
      objc_msgSend(v30, "setCloudTracked:", 0);
    }
    else
    {
      if (!objc_msgSend(v30, "isLocallyTracked"))
        goto LABEL_43;
      objc_msgSend(v30, "setLocallyTracked:", 0);
    }
    objc_msgSend(v28, "markChanged");
    goto LABEL_43;
  }
  v47 = (void *)MEMORY[0x227676638]();
  v48 = self;
  HMFGetOSLogHandle();
  v49 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v67 = v50;
    v68 = 2112;
    v69 = v23;
    v70 = 2112;
    v71 = (id)objc_opt_class();
    v51 = v71;
    _os_log_impl(&dword_2218F0000, v49, OS_LOG_TYPE_ERROR, "%{public}@Unknown model object (%@) sent to [%@ transactionObjectRemoved:message:]", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v47);
  objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 2);
  v27 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "respondWithError:", v27);
LABEL_48:

}

- (void)transactionObjectUpdated:(id)a3 newValues:(id)a4 message:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  HMDAccount *v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  HMDAccountHandle *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  HMDAccount *v26;
  NSObject *v27;
  void *v28;
  id v29;
  void *v30;
  char v31;
  char v32;
  id v33;
  id v34;
  uint8_t buf[4];
  void *v36;
  __int16 v37;
  id v38;
  __int16 v39;
  id v40;
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v11 = v9;
  else
    v11 = 0;
  v12 = v9;
  if (!v11)
  {
    v12 = v9;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v13 = v12;
    else
      v13 = 0;
    v14 = v13;

    if (v14)
    {
      v15 = self;
      v33 = v8;
      v16 = v14;
      v17 = v10;
      objc_msgSend(v17, "transactionResult");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "uuid");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDAccount accountHandleWithModelIdentifier:](v15, "accountHandleWithModelIdentifier:", v19);
      v20 = (HMDAccountHandle *)objc_claimAutoreleasedReturnValue();

      if (v20)
      {
        v21 = v33;
        -[HMDAccountHandle transactionObjectUpdated:newValues:message:](v20, "transactionObjectUpdated:newValues:message:", v33, v16, v17);
      }
      else
      {
        v20 = -[HMDAccountHandle initWithObjectModel:]([HMDAccountHandle alloc], "initWithObjectModel:", v16);
        if (v20)
        {
          os_unfair_lock_lock_with_options();
          v31 = __HMDAccountAddHandle(v15, v20);
          os_unfair_lock_unlock(&v15->_lock);
          if ((v31 & 1) != 0)
            __HMDAccountDidUpdateHandles(v15);
          objc_msgSend(v18, "markChanged");
        }
        v21 = v33;
      }
      if (!objc_msgSend(v18, "source") && !-[HMDAccountHandle isLocallyTracked](v20, "isLocallyTracked"))
      {
        -[HMDAccountHandle setLocallyTracked:](v20, "setLocallyTracked:", 1);
        objc_msgSend(v18, "markChanged");
      }
LABEL_32:

      goto LABEL_33;
    }
    v12 = v12;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v22 = v12;
    else
      v22 = 0;
    v23 = v22;

    if (v23)
    {
      v15 = self;
      v34 = v8;
      v16 = v23;
      v17 = v10;
      objc_msgSend(v17, "transactionResult");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "uuid");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDAccount deviceWithModelIdentifier:](v15, "deviceWithModelIdentifier:", v24);
      v20 = (HMDAccountHandle *)objc_claimAutoreleasedReturnValue();

      if (v20)
      {
        v21 = v34;
        -[HMDAccountHandle transactionObjectUpdated:newValues:message:](v20, "transactionObjectUpdated:newValues:message:", v34, v16, v17);
      }
      else
      {
        v20 = -[HMDDevice initWithObjectModel:]([HMDDevice alloc], "initWithObjectModel:", v16);
        os_unfair_lock_lock_with_options();
        v32 = __HMDAccountAddDevice(v15, v20);
        os_unfair_lock_unlock(&v15->_lock);
        if ((v32 & 1) != 0)
        {
          -[HMDAccountHandle setAccount:](v20, "setAccount:", v15);
          __HMDAccountDidAddDevice(v15, v20);
        }
        v21 = v34;
      }
      -[HMDAccountHandle __updateDeviceWithActions:](v20, "__updateDeviceWithActions:", v18);
      goto LABEL_32;
    }
    v25 = (void *)MEMORY[0x227676638]();
    v26 = self;
    HMFGetOSLogHandle();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v36 = v28;
      v37 = 2112;
      v38 = v12;
      v39 = 2112;
      v40 = (id)objc_opt_class();
      v29 = v40;
      _os_log_impl(&dword_2218F0000, v27, OS_LOG_TYPE_ERROR, "%{public}@Unknown model object (%@) sent to [%@ transactionObjectUpdated:newValues:message:]", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v25);
    objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 2);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "respondWithError:", v30);

    v12 = 0;
  }
LABEL_33:

}

- (Class)modelClass
{
  return (Class)objc_opt_class();
}

- (NSUUID)modelIdentifier
{
  void *v2;
  void *v3;

  -[HMDAccount identifier](self, "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSUUID *)v3;
}

- (NSUUID)modelParentIdentifier
{
  if (modelParentIdentifier_onceToken != -1)
    dispatch_once(&modelParentIdentifier_onceToken, &__block_literal_global_360_83761);
  return (NSUUID *)(id)modelParentIdentifier_homeManagerUUID;
}

- (id)modelObjectWithChangeType:(unint64_t)a3 version:(int64_t)a4
{
  HMDAccountModel *v6;
  void *v7;
  void *v8;
  HMDAccountModel *v9;
  void *v10;
  void *v11;

  v6 = [HMDAccountModel alloc];
  -[HMDAccount modelIdentifier](self, "modelIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDAccount modelParentIdentifier](self, "modelParentIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[HMDBackingStoreModelObject initWithObjectChangeType:uuid:parentUUID:](v6, "initWithObjectChangeType:uuid:parentUUID:", a3, v7, v8);

  -[HMDAccount identifier](self, "identifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v10, "copy");
  -[HMDAccountModel setIdentifier:](v9, "setIdentifier:", v11);

  return v9;
}

- (id)backingStoreObjectsWithChangeType:(unint64_t)a3 version:(int64_t)a4
{
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDAccount modelObjectWithChangeType:version:](self, "modelObjectWithChangeType:version:", a3, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObject:", v8);

  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  -[HMDAccount handles](self, "handles");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v28;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v28 != v12)
          objc_enumerationMutation(v9);
        objc_msgSend(*(id *)(*((_QWORD *)&v27 + 1) + 8 * v13), "modelObjectWithChangeType:version:", a3, a4);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "addObject:", v14);

        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
    }
    while (v11);
  }

  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  -[HMDAccount devices](self, "devices", 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v24;
    do
    {
      v19 = 0;
      do
      {
        if (*(_QWORD *)v24 != v18)
          objc_enumerationMutation(v15);
        objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * v19), "backingStoreObjectsWithChangeType:version:", a3, a4);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "addObjectsFromArray:", v20);

        ++v19;
      }
      while (v17 != v19);
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
    }
    while (v17);
  }

  v21 = (void *)objc_msgSend(v7, "copy");
  return v21;
}

- (id)currentDeviceModelsWithChangeType:(unint64_t)a3 version:(int64_t)a4
{
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t i;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  -[HMDAccount devices](self, "devices", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
    v10 = (void *)MEMORY[0x24BDBD1A8];
    while (2)
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v6);
        v12 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        if ((objc_msgSend(v12, "isCurrentDevice") & 1) != 0)
        {
          objc_msgSend(v12, "backingStoreObjectsWithChangeType:version:", a3, a4);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          goto LABEL_12;
        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v8)
        continue;
      break;
    }
  }
  else
  {
    v10 = (void *)MEMORY[0x24BDBD1A8];
  }
LABEL_12:

  return v10;
}

- (id)modelBackedObjects
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", self);
  -[HMDAccount handles](self, "handles");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObjectsFromArray:", v4);

  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[HMDAccount devices](self, "devices", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v9), "modelBackedObjects");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObjectsFromArray:", v10);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);
  }

  v11 = (void *)objc_msgSend(v3, "copy");
  return v11;
}

- (HMDAccountIdentifier)identifier
{
  return (HMDAccountIdentifier *)objc_getProperty(self, a2, 48, 1);
}

- (HMDAccountManager)manager
{
  return (HMDAccountManager *)objc_loadWeakRetained((id *)&self->_manager);
}

- (void)setManager:(id)a3
{
  objc_storeWeak((id *)&self->_manager, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_manager);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_appleAccountSenderCorrelationIdentifier, 0);
  objc_storeStrong((id *)&self->_devices, 0);
  objc_storeStrong((id *)&self->_handles, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

void __35__HMDAccount_modelParentIdentifier__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDString:", CFSTR("1CAEDC10-E3E5-41A4-BB17-A9EEBA14A938"));
  v1 = (void *)modelParentIdentifier_homeManagerUUID;
  modelParentIdentifier_homeManagerUUID = v0;

}

uint64_t __44__HMDAccount__repairDevicesWithStaleHandle___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  _QWORD v6[4];
  id v7;

  objc_msgSend(a2, "handles");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __44__HMDAccount__repairDevicesWithStaleHandle___block_invoke_2;
  v6[3] = &unk_24E781390;
  v7 = *(id *)(a1 + 32);
  v4 = objc_msgSend(v3, "na_any:", v6);

  return v4;
}

uint64_t __44__HMDAccount__repairDevicesWithStaleHandle___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "accountHandle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqual:", *(_QWORD *)(a1 + 32));

  return v4;
}

uint64_t __27__HMDAccount_primaryHandle__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  int v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;

  v4 = a2;
  v5 = a3;
  v6 = objc_msgSend(v4, "isLocal");
  if (v6 == objc_msgSend(v5, "isLocal"))
  {
    v8 = objc_msgSend(v4, "type");
    if (v8 != objc_msgSend(v5, "type"))
    {
      if (objc_msgSend(v4, "type") == 1)
      {
        v7 = 1;
        goto LABEL_11;
      }
      if (objc_msgSend(v5, "type") == 1)
      {
        v7 = -1;
        goto LABEL_11;
      }
    }
    +[HMDAccountHandleFormatter defaultFormatter](HMDAccountHandleFormatter, "defaultFormatter");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stringForObjectValue:", v4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stringForObjectValue:", v5);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v10, "caseInsensitiveCompare:", v11);

    goto LABEL_11;
  }
  if (objc_msgSend(v4, "isLocal"))
    v7 = -1;
  else
    v7 = 1;
LABEL_11:

  return v7;
}

void __35__HMDAccount_initWithBackingModel___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  HMDAccountHandle *v4;
  HMDAccountHandle *v5;

  v3 = a2;
  v5 = -[HMDAccountHandle initWithBackingModel:]([HMDAccountHandle alloc], "initWithBackingModel:", v3);

  v4 = v5;
  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v5);
    v4 = v5;
  }

}

void __35__HMDAccount_initWithBackingModel___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  HMDDevice *v4;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  v4 = -[HMDDevice initWithBackingModel:]([HMDDevice alloc], "initWithBackingModel:", v3);

  objc_msgSend(v2, "addObject:", v4);
}

+ (HMDAccount)accountWithHandle:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = objc_alloc((Class)a1);
  +[HMDAccountIdentifier accountIdentifierForAccountHandle:](HMDAccountIdentifier, "accountIdentifierForAccountHandle:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v4;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v10, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)objc_msgSend(v5, "initWithIdentifier:handles:devices:", v6, v7, MEMORY[0x24BDBD1A8]);
  return (HMDAccount *)v8;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t23_83832 != -1)
    dispatch_once(&logCategory__hmf_once_t23_83832, &__block_literal_global_341);
  return (id)logCategory__hmf_once_v24_83833;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

void __25__HMDAccount_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v24_83833;
  logCategory__hmf_once_v24_83833 = v0;

}

- (void)isPresentInFamilyCircleWithCompletion:(id)a3
{
  id v4;
  id v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x24BE30A88]);
  objc_msgSend(v5, "setCachePolicy:", 2);
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __66__HMDAccount_FamilyCircle__isPresentInFamilyCircleWithCompletion___block_invoke;
  v7[3] = &unk_24E781440;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "startRequestWithCompletionHandler:", v7);

}

- (BOOL)hasFamilyMember:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  -[HMDAccount handles](self, "handles", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v17;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v17 != v7)
          objc_enumerationMutation(v5);
        v9 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * i);
        +[HMDAccountHandleFormatter defaultFormatter](HMDAccountHandleFormatter, "defaultFormatter");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "stringForObjectValue:", v9);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        if (v11)
        {
          objc_msgSend(v4, "appleID");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v11, "isEqualToString:", v12))
          {

LABEL_13:
            LOBYTE(v6) = 1;
            goto LABEL_14;
          }
          objc_msgSend(v4, "memberPhoneNumbers");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = objc_msgSend(v11, "isEqualToString:", v13);

          if ((v14 & 1) != 0)
            goto LABEL_13;
        }
      }
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_14:

  return v6;
}

void __66__HMDAccount_FamilyCircle__isPresentInFamilyCircleWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  uint64_t v14;
  id v15;
  id v16;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(a1 + 32);
  v8 = *(void **)(a1 + 40);
  v9 = *(NSObject **)(v7 + 8);
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __66__HMDAccount_FamilyCircle__isPresentInFamilyCircleWithCompletion___block_invoke_2;
  v12[3] = &unk_24E79B3F0;
  v13 = v5;
  v14 = v7;
  v15 = v6;
  v16 = v8;
  v10 = v6;
  v11 = v5;
  dispatch_async(v9, v12);

}

uint64_t __66__HMDAccount_FamilyCircle__isPresentInFamilyCircleWithCompletion___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  uint64_t (*v9)(void);
  void *v10;
  id v11;
  NSObject *v12;
  void *v13;
  void *v14;
  _QWORD v16[5];
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v2 = *(void **)(a1 + 32);
  if (v2)
  {
    objc_msgSend(v2, "members");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = MEMORY[0x24BDAC760];
    v16[1] = 3221225472;
    v16[2] = __66__HMDAccount_FamilyCircle__isPresentInFamilyCircleWithCompletion___block_invoke_497;
    v16[3] = &unk_24E781418;
    v16[4] = *(_QWORD *)(a1 + 40);
    objc_msgSend(v3, "na_any:", v16);

    v4 = (void *)MEMORY[0x227676638]();
    v5 = *(id *)(a1 + 40);
    HMFGetOSLogHandle();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      HMFBooleanToString();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v18 = v7;
      v19 = 2112;
      v20 = v8;
      _os_log_impl(&dword_2218F0000, v6, OS_LOG_TYPE_INFO, "%{public}@Account is in family circle: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v4);
    v9 = *(uint64_t (**)(void))(*(_QWORD *)(a1 + 56) + 16);
  }
  else
  {
    v10 = (void *)MEMORY[0x227676638]();
    v11 = *(id *)(a1 + 40);
    HMFGetOSLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = *(void **)(a1 + 48);
      *(_DWORD *)buf = 138543618;
      v18 = v13;
      v19 = 2112;
      v20 = v14;
      _os_log_impl(&dword_2218F0000, v12, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch family members with error: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v10);
    v9 = *(uint64_t (**)(void))(*(_QWORD *)(a1 + 56) + 16);
  }
  return v9();
}

uint64_t __66__HMDAccount_FamilyCircle__isPresentInFamilyCircleWithCompletion___block_invoke_497(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "hasFamilyMember:", a2);
}

- (NSArray)identities
{
  void *v3;
  void *v4;

  +[HMDIdentityRegistry sharedRegistry](HMDIdentityRegistry, "sharedRegistry");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "identitiesForAccount:", self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v4;
}

@end
