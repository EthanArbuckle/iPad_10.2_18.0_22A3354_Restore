@implementation MKFLocalBulletinCameraSignificantEventRegistration

+ (id)fetchCameraSignificantEventRegistrationForAccessoryUUID:(id)a3 managedObjectContext:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  NSObject *v16;
  void *v17;
  id v19;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  id v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (!v6)
    _HMFPreconditionFailure();
  v8 = v7;
  +[MKFLocalBulletinCameraSignificantEventRegistration fetchRequest](MKFLocalBulletinCameraSignificantEventRegistration, "fetchRequest");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("(%K == %@)"), CFSTR("accessoryModelID"), v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setPredicate:", v10);

  v19 = 0;
  objc_msgSend(v8, "executeFetchRequest:error:", v9, &v19);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v19;
  if (v11)
  {
    objc_msgSend(v11, "firstObject");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
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
      *(_DWORD *)buf = 138543874;
      v21 = v17;
      v22 = 2112;
      v23 = v6;
      v24 = 2112;
      v25 = v12;
      _os_log_impl(&dword_2218F0000, v16, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch local camera significant event registration for accessoryUUID %@, error: %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v14);
    v13 = 0;
  }

  return v13;
}

+ (id)fetchRequest
{
  return (id)objc_msgSend(MEMORY[0x24BDBB678], "fetchRequestWithEntityName:", CFSTR("LocalBulletinCameraSignificantEventRegistration"));
}

@end
