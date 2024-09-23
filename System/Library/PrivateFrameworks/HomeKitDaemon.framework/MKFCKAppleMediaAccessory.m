@implementation MKFCKAppleMediaAccessory

- (BOOL)importIntoLocalModel:(id)a3 updatedProperties:(id)a4 context:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  BOOL v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  MKFCKAppleMediaAccessory *v20;
  NSObject *v21;
  void *v22;
  void *v24;
  void *v25;
  objc_super v26;
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a5;
  v26.receiver = self;
  v26.super_class = (Class)MKFCKAppleMediaAccessory;
  if (-[MKFCKAccessory importIntoLocalModel:updatedProperties:context:](&v26, sel_importIntoLocalModel_updatedProperties_context_, v8, a4, v9))
  {
    v10 = v8;
    v11 = v9;
    v12 = self != 0;
    if (self)
    {
      -[MKFCKAppleMediaAccessory resident](self, "resident");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v13;
      if (v13)
      {
        objc_msgSend(v13, "fetchLocalModelWithContext:", v11);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if (v15)
        {
          objc_msgSend(v10, "resident");
          v16 = (void *)objc_claimAutoreleasedReturnValue();

          if (v16 != v15)
          {
            objc_msgSend(v10, "setResident:", v15);
            objc_msgSend(v10, "device");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            if (v17)
            {
              objc_msgSend(v15, "device");
              v18 = (void *)objc_claimAutoreleasedReturnValue();

              if (v18 != v17)
                objc_msgSend(v15, "setDevice:", v17);
            }

          }
        }
        else
        {
          v19 = (void *)MEMORY[0x227676638]();
          v20 = self;
          HMFGetOSLogHandle();
          v21 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            -[MKFCKAppleMediaAccessory objectID](v20, "objectID");
            v24 = v19;
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543874;
            v28 = v25;
            v29 = 2112;
            v30 = v22;
            v31 = 2112;
            v32 = v14;
            _os_log_impl(&dword_2218F0000, v21, OS_LOG_TYPE_INFO, "%{public}@Cannot fulfill relationship yet: %@.resident = %@", buf, 0x20u);

            v19 = v24;
          }

          objc_autoreleasePoolPop(v19);
        }

      }
    }

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (BOOL)exportFromLocalModel:(id)a3 updatedProperties:(id)a4 context:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  BOOL v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  MKFCKAppleMediaAccessory *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v23;
  objc_super v24;
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a5;
  v24.receiver = self;
  v24.super_class = (Class)MKFCKAppleMediaAccessory;
  if (-[MKFCKAccessory exportFromLocalModel:updatedProperties:context:](&v24, sel_exportFromLocalModel_updatedProperties_context_, v8, a4, v9))
  {
    v10 = v8;
    v11 = v9;
    v12 = self != 0;
    if (self)
    {
      objc_msgSend(v10, "resident");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (v13)
      {
        +[MKFCKModel fetchWithLocalModel:context:](MKFCKResident, "fetchWithLocalModel:context:", v13, v11);
        v14 = objc_claimAutoreleasedReturnValue();
        if (v14)
        {
          v15 = (void *)v14;
          -[MKFCKAppleMediaAccessory resident](self, "resident");
          v16 = (void *)objc_claimAutoreleasedReturnValue();

          if (v16 != v15)
            -[MKFCKAppleMediaAccessory setResident:](self, "setResident:", v15);

        }
        else
        {
          v17 = (void *)MEMORY[0x227676638]();
          v18 = self;
          HMFGetOSLogHandle();
          v19 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v10, "objectID");
            v23 = v17;
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543874;
            v26 = v20;
            v27 = 2112;
            v28 = v21;
            v29 = 2112;
            v30 = v13;
            _os_log_impl(&dword_2218F0000, v19, OS_LOG_TYPE_INFO, "%{public}@Cannot fulfill relationship yet: %@.resident = %@", buf, 0x20u);

            v17 = v23;
          }

          objc_autoreleasePoolPop(v17);
        }
      }

    }
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

+ (id)fetchRequest
{
  return (id)objc_msgSend(MEMORY[0x24BDBB678], "fetchRequestWithEntityName:", CFSTR("MKFCKAppleMediaAccessory"));
}

@end
