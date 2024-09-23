@implementation NSManagedObject(HMDBackingStoreModelObject)

- (id)hmd_lastKnownValueForKey:()HMDBackingStoreModelObject
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (objc_msgSend(a1, "isDeleted"))
  {
    v12[0] = v4;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v12, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "committedValuesForKeys:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", v4);
    v7 = (id)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if ((id)*MEMORY[0x24BDBD430] == v7)
      v9 = 0;
    else
      v9 = v7;
    v10 = v9;

  }
  else
  {
    objc_msgSend(a1, "valueForKey:", v4);
    v10 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v10;
}

- (id)hmd_modelID
{
  uint64_t v2;
  id v3;
  void *v4;
  id v5;
  void *v6;
  uint64_t v8;

  v2 = objc_opt_class();
  if ((HMDManagedObjectClassIsBSORepresentable(v2) & 1) != 0)
  {
    v3 = a1;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v4 = v3;
    else
      v4 = 0;
    v5 = v4;

    objc_msgSend(v5, "hmd_lastKnownValueForKey:", CFSTR("modelID"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    return v6;
  }
  else
  {
    v8 = _HMFPreconditionFailure();
    return (id)-[NSManagedObject(HMDBackingStoreModelObject) hmd_parentModelID](v8);
  }
}

- (id)hmd_parentModelID
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v7;

  v2 = objc_opt_class();
  if ((HMDManagedObjectClassIsBSORepresentable(v2) & 1) != 0)
  {
    objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "cd_modelClass"), "cd_parentReferenceName");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
    {
      objc_msgSend(a1, "hmd_lastKnownValueForKey:", v3);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "hmd_modelID");
      v5 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD1880], "hmf_zeroUUID");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }

    return v5;
  }
  else
  {
    v7 = _HMFPreconditionFailure();
    return (id)-[NSManagedObject(HMDBackingStoreModelObject) hmd_modelsWithChangeType:detached:error:](v7);
  }
}

- (uint64_t)hmd_modelsWithChangeType:()HMDBackingStoreModelObject detached:error:
{
  return objc_msgSend(a1, "hmd_modelsWithChangeType:detached:createManagedObject:error:", a3, a4, 1, a5);
}

- (id)hmd_modelsWithChangeType:()HMDBackingStoreModelObject detached:createManagedObject:error:
{
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v19;
  uint8_t buf[4];
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v11 = objc_opt_class();
  if ((HMDManagedObjectClassIsBSORepresentable(v11) & 1) == 0)
    _HMFPreconditionFailure();
  v12 = (void *)objc_msgSend(objc_alloc((Class)objc_msgSend((id)objc_opt_class(), "cd_modelClass")), "initWithManagedObject:changeType:detached:error:", a1, a3, a4, a6);
  if ((a5 & 1) == 0)
  {
    v13 = (void *)MEMORY[0x227676638]();
    v14 = a1;
    HMFGetOSLogHandle();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v21 = v16;
      _os_log_impl(&dword_2218F0000, v15, OS_LOG_TYPE_INFO, "%{public}@Since this managed object was created without a managed object context setting model.managedObject to nil", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v13);
    objc_msgSend(v12, "setManagedObject:", 0);
  }
  if (v12)
  {
    v19 = v12;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v19, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v17 = 0;
  }

  return v17;
}

@end
