@implementation MKFLocalBulletinServiceRegistration

+ (id)fetchServiceRegistrationForAccessoryUUID:(id)a3 serviceInstanceID:(id)a4 managedObjectContext:(id)a5
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
  __int16 v29;
  id v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (!v8)
    _HMFPreconditionFailure();
  v11 = v10;
  +[MKFLocalBulletinServiceRegistration fetchRequest](MKFLocalBulletinServiceRegistration, "fetchRequest");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("(%K == %@) AND (%K == %@)"), CFSTR("accessoryModelID"), v8, CFSTR("serviceInstanceID"), v9);
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
      *(_DWORD *)buf = 138544130;
      v24 = v20;
      v25 = 2112;
      v26 = v8;
      v27 = 2112;
      v28 = v9;
      v29 = 2112;
      v30 = v15;
      _os_log_impl(&dword_2218F0000, v19, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch local service registration for accessoryUUID: %@, serviceInstanceID: %@ error: %@", buf, 0x2Au);

    }
    objc_autoreleasePoolPop(v17);
    v16 = 0;
  }

  return v16;
}

+ (id)fetchRequest
{
  return (id)objc_msgSend(MEMORY[0x24BDBB678], "fetchRequestWithEntityName:", CFSTR("LocalBulletinServiceRegistration"));
}

@end
