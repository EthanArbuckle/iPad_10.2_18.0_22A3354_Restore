@implementation MKFCKServiceGroup

- (BOOL)exportFromLocalModel:(id)a3 updatedProperties:(id)a4 context:(id)a5
{
  id v7;
  _BOOL4 v8;
  _BOOL4 v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  void *v14;
  char v15;

  v7 = a3;
  v8 = -[MKFCKModel copyPropertiesFromLocalModel:context:](self, "copyPropertiesFromLocalModel:context:", v7, a5);
  if (self)
    v9 = v8;
  else
    v9 = 0;
  if (v9)
  {
    -[MKFCKServiceGroup _fetchServiceDetailsWithLocalModel:](v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[MKFCKServiceGroup services](self, "services");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = arraysEqualIgnoringOrder(v11, v10);

    if ((v12 & 1) == 0)
      -[MKFCKServiceGroup setServices:](self, "setServices:", v10);

    +[_MKFApplicationData appDataDictionaryForContainer:](_MKFApplicationData, "appDataDictionaryForContainer:", v7);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[MKFCKServiceGroup applicationData](self, "applicationData");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = HMFEqualObjects();

    if ((v15 & 1) == 0)
      -[MKFCKServiceGroup setApplicationData:](self, "setApplicationData:", v13);

  }
  return v9;
}

- (BOOL)importIntoLocalModel:(id)a3 updatedProperties:(id)a4 context:(id)a5
{
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  id v16;
  uint64_t v18;
  uint64_t v19;
  void (*v20)(uint64_t, void *);
  void *v21;
  MKFCKServiceGroup *v22;
  id v23;

  v7 = a3;
  if (-[MKFCKModel copyPropertiesIntoLocalModel:context:](self, "copyPropertiesIntoLocalModel:context:", v7, a5))
  {
    v8 = v7;
    v9 = v8;
    if (self)
    {
      -[MKFCKServiceGroup services](self, "services");
      v10 = objc_claimAutoreleasedReturnValue();
      v11 = (void *)v10;
      v12 = (void *)MEMORY[0x24BDBD1A8];
      if (v10)
        v12 = (void *)v10;
      v13 = v12;

      -[MKFCKServiceGroup _fetchServiceDetailsWithLocalModel:](v9);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if ((arraysEqualIgnoringOrder(v14, v13) & 1) == 0)
      {
        v15 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
        v18 = MEMORY[0x24BDAC760];
        v19 = 3221225472;
        v20 = __50__MKFCKServiceGroup_importServicesIntoLocalModel___block_invoke;
        v21 = &unk_24E79B878;
        v22 = self;
        v23 = v15;
        v16 = v15;
        objc_msgSend(v13, "hmf_enumerateWithAutoreleasePoolUsingBlock:", &v18);
        objc_msgSend(v9, "setServices_:", v16, v18, v19, v20, v21, v22);

      }
      -[MKFCKServiceGroup applicationData](self, "applicationData");
      self = (MKFCKServiceGroup *)objc_claimAutoreleasedReturnValue();
      +[_MKFApplicationData setAppDataDictionary:forContainer:](_MKFApplicationData, "setAppDataDictionary:forContainer:", self, v9);

      LOBYTE(self) = 1;
    }
    else
    {

    }
  }
  else
  {
    LOBYTE(self) = 0;
  }

  return (char)self;
}

- (id)_fetchServiceDetailsWithLocalModel:(void *)a1
{
  id v1;
  id v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v18;
  id v19;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  id v25;
  _QWORD v26[3];

  v26[2] = *MEMORY[0x24BDAC8D0];
  v1 = a1;
  v2 = objc_alloc_init(MEMORY[0x24BDBB660]);
  objc_msgSend(v2, "setName:", CFSTR("a"));
  objc_msgSend(v2, "setExpressionResultType:", 1100);
  objc_msgSend(MEMORY[0x24BDD1548], "expressionForKeyPath:", CFSTR("accessory.modelID"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setExpression:", v3);

  v4 = objc_alloc_init(MEMORY[0x24BDBB660]);
  objc_msgSend(v4, "setName:", CFSTR("i"));
  objc_msgSend(v4, "setExpressionResultType:", 300);
  objc_msgSend(MEMORY[0x24BDD1548], "expressionForKeyPath:", CFSTR("instanceID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setExpression:", v5);

  +[_MKFService fetchRequest](_MKFService, "fetchRequest");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("%@ in %K"), v1, CFSTR("serviceGroups_"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setPredicate:", v7);

  v26[0] = v2;
  v26[1] = v4;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v26, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setPropertiesToFetch:", v8);

  objc_msgSend(v6, "setResultType:", 2);
  v19 = 0;
  objc_msgSend(v6, "execute:", &v19);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v19;
  if (v9)
  {
    v11 = v9;
  }
  else
  {
    v12 = (void *)MEMORY[0x227676638]();
    objc_opt_class();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    HMFGetOSLogHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v1, "hmd_debugIdentifier");
      v18 = v12;
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v21 = v15;
      v22 = 2112;
      v23 = v16;
      v24 = 2114;
      v25 = v10;
      _os_log_impl(&dword_2218F0000, v14, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch service details for %@: %{public}@", buf, 0x20u);

      v12 = v18;
    }

    objc_autoreleasePoolPop(v12);
  }

  return v9;
}

void __50__MKFCKServiceGroup_importServicesIntoLocalModel___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  BOOL v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  void *v26;
  NSObject *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  void *context;
  void *contexta;
  void *contextb;
  id v36;
  uint8_t buf[4];
  void *v38;
  __int16 v39;
  uint64_t v40;
  __int16 v41;
  uint64_t v42;
  __int16 v43;
  id v44;
  __int16 v45;
  id v46;
  __int16 v47;
  void *v48;
  uint64_t v49;

  v2 = a1;
  v49 = *MEMORY[0x24BDAC8D0];
  v3 = *(void **)(a1 + 32);
  v4 = a2;
  v5 = v4;
  if (!v3)
  {

LABEL_29:
    context = 0;
    goto LABEL_30;
  }
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("a"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v7 = v6;
  else
    v7 = 0;
  v8 = v7;

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("i"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v10 = v9;
  else
    v10 = 0;
  v11 = v10;

  if (v8)
    v12 = v11 == 0;
  else
    v12 = 1;
  if (v12)
  {
    v13 = (void *)MEMORY[0x227676638]();
    objc_opt_class();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    HMFGetOSLogHandle();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v38 = v16;
      v39 = 2112;
      v40 = (uint64_t)v5;
      _os_log_impl(&dword_2218F0000, v15, OS_LOG_TYPE_ERROR, "%{public}@Invalid service details: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v13);
    context = 0;
  }
  else
  {
    +[_MKFService fetchRequest](_MKFService, "fetchRequest");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("(%K == %@) AND (%K == %@)"), CFSTR("accessory.modelID"), v8, CFSTR("instanceID"), v11);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setPredicate:", v18);

    objc_msgSend(v17, "setFetchLimit:", 2);
    v36 = 0;
    objc_msgSend(v17, "execute:", &v36);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v36;
    v21 = v20;
    if (v19)
    {
      if (objc_msgSend(v19, "count") != 1)
      {
        contexta = (void *)MEMORY[0x227676638]();
        objc_opt_class();
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        HMFGetOSLogHandle();
        v23 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v31 = v21;
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v30 = objc_msgSend(v19, "count");
          objc_msgSend(v3, "hmd_debugIdentifier");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138544642;
          v38 = v24;
          v39 = 2048;
          v40 = v30;
          v41 = 2160;
          v42 = 1752392040;
          v43 = 2112;
          v44 = v8;
          v45 = 2112;
          v46 = v11;
          v47 = 2112;
          v48 = v25;
          _os_log_impl(&dword_2218F0000, v23, OS_LOG_TYPE_ERROR, "%{public}@Warning: Found %tu local services %{mask.hash}@/%@ for %@", buf, 0x3Eu);

          v21 = v31;
        }

        objc_autoreleasePoolPop(contexta);
      }
      objc_msgSend(v19, "firstObject");
      context = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      contextb = (void *)MEMORY[0x227676638]();
      objc_opt_class();
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      HMFGetOSLogHandle();
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v32 = v2;
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "hmd_debugIdentifier");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544642;
        v38 = v28;
        v39 = 2160;
        v40 = 1752392040;
        v41 = 2112;
        v42 = (uint64_t)v8;
        v43 = 2112;
        v44 = v11;
        v45 = 2112;
        v46 = v29;
        v47 = 2114;
        v48 = v21;
        _os_log_impl(&dword_2218F0000, v27, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch local service %{mask.hash}@/%@ for %@: %{public}@", buf, 0x3Eu);

        v2 = v32;
      }

      objc_autoreleasePoolPop(contextb);
      context = 0;
    }

  }
  if (!context)
    goto LABEL_29;
  objc_msgSend(*(id *)(v2 + 40), "addObject:");
LABEL_30:

}

+ (id)fetchRequest
{
  return (id)objc_msgSend(MEMORY[0x24BDBB678], "fetchRequestWithEntityName:", CFSTR("MKFCKServiceGroup"));
}

@end
