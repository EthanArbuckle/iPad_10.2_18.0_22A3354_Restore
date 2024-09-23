@implementation MKFLocalBulletinCharacteristicRegistration

+ (id)fetchCharacteristicRegistrationForAccessoryUUID:(id)a3 serviceInstanceID:(id)a4 characteristicInstanceID:(id)a5 managedObjectContext:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  id v21;
  NSObject *v22;
  void *v23;
  void *v25;
  id v26;
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  id v30;
  __int16 v31;
  id v32;
  __int16 v33;
  id v34;
  __int16 v35;
  id v36;
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (!v10)
  {
    _HMFPreconditionFailure();
    goto LABEL_11;
  }
  if (!v11)
  {
LABEL_11:
    _HMFPreconditionFailure();
LABEL_12:
    _HMFPreconditionFailure();
  }
  if (!v12)
    goto LABEL_12;
  v14 = v13;
  +[MKFLocalBulletinCharacteristicRegistration fetchRequest](MKFLocalBulletinCharacteristicRegistration, "fetchRequest");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("(%K == %@) AND (%K == %@) AND (%K == %@)"), CFSTR("accessoryModelID"), v10, CFSTR("serviceInstanceID"), v11, CFSTR("characteristicInstanceID"), v12);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setPredicate:", v16);

  v26 = 0;
  objc_msgSend(v14, "executeFetchRequest:error:", v15, &v26);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v26;
  if (v17)
  {
    objc_msgSend(v17, "firstObject");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v20 = (void *)MEMORY[0x227676638]();
    v21 = a1;
    HMFGetOSLogHandle();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v25 = v20;
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544386;
      v28 = v23;
      v29 = 2112;
      v30 = v10;
      v31 = 2112;
      v32 = v11;
      v33 = 2112;
      v34 = v12;
      v35 = 2112;
      v36 = v18;
      _os_log_impl(&dword_2218F0000, v22, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch local characteristic bulletin registration with accessoryUUID %@: serviceInstanceID: %@ characteristicInstanceID: %@ error: %@", buf, 0x34u);

      v20 = v25;
    }

    objc_autoreleasePoolPop(v20);
    v19 = 0;
  }

  return v19;
}

+ (id)fetchRequest
{
  return (id)objc_msgSend(MEMORY[0x24BDBB678], "fetchRequestWithEntityName:", CFSTR("LocalBulletinCharacteristicRegistration"));
}

@end
