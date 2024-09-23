@implementation MKFLocalPersonClassificationRegistration

+ (id)fetchPersonClassificationRegistrationForPersonUUID:(id)a3 settingsModelUUID:(id)a4 managedObjectContext:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  NSObject *v19;
  void *v20;
  id v22;
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  id v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (!v8)
    _HMFPreconditionFailure();
  v11 = v10;
  objc_msgSend(v10, "hmd_assertIsExecuting");
  +[MKFLocalPersonClassificationRegistration fetchRequest](MKFLocalPersonClassificationRegistration, "fetchRequest");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("(%K == %@) && (%K == %@)"), CFSTR("personUUID"), v8, CFSTR("settings.modelID"), v9);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setPredicate:", v13);

  v22 = 0;
  objc_msgSend(v11, "executeFetchRequest:error:", v12, &v22);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v22;
  if (v14)
  {
    objc_msgSend(v14, "firstObject");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v17 = (void *)MEMORY[0x227676638]();
    v18 = a1;
    HMFGetOSLogHandle();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v24 = v20;
      v25 = 2112;
      v26 = v8;
      v27 = 2112;
      v28 = v15;
      _os_log_impl(&dword_2218F0000, v19, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch person classification registration local settings personUUID:%@: %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v17);
    v16 = 0;
  }

  return v16;
}

+ (id)fetchRequest
{
  return (id)objc_msgSend(MEMORY[0x24BDBB678], "fetchRequestWithEntityName:", CFSTR("LocalPersonClassificationRegistration"));
}

@end
