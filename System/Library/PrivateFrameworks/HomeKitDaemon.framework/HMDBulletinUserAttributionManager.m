@implementation HMDBulletinUserAttributionManager

- (HMDBulletinUserAttributionManager)initWithAccountRegistry:(id)a3
{
  id v5;
  HMDBulletinUserAttributionManager *v6;
  uint64_t v7;
  NSMutableArray *userAttributions;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)HMDBulletinUserAttributionManager;
  v6 = -[HMDBulletinUserAttributionManager init](&v10, sel_init);
  if (v6)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v7 = objc_claimAutoreleasedReturnValue();
    userAttributions = v6->_userAttributions;
    v6->_userAttributions = (NSMutableArray *)v7;

    objc_storeStrong((id *)&v6->_accountRegistry, a3);
  }

  return v6;
}

- (void)saveAttributedUserUUID:(id)a3 forTargetStateCharacteristic:(id)a4
{
  id v6;
  id v7;
  void *v8;
  HMDBulletinUserAttributionManager *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  _QWORD v23[5];
  _QWORD v24[5];
  _QWORD v25[4];
  id v26;
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  id v30;
  __int16 v31;
  void *v32;
  __int16 v33;
  void *v34;
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x227676638]();
  v9 = self;
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "instanceID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "value");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544130;
    v28 = v11;
    v29 = 2112;
    v30 = v6;
    v31 = 2112;
    v32 = v12;
    v33 = 2112;
    v34 = v13;
    _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_INFO, "%{public}@Saving attributedUserUUID=%@ for targetCharacteristicInstanceID=%@ value=%@", buf, 0x2Au);

  }
  objc_autoreleasePoolPop(v8);
  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_lock_with_options();
  -[HMDBulletinUserAttributionManager userAttributions](v9, "userAttributions");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = MEMORY[0x24BDAC760];
  v25[0] = MEMORY[0x24BDAC760];
  v25[1] = 3221225472;
  v25[2] = __89__HMDBulletinUserAttributionManager_saveAttributedUserUUID_forTargetStateCharacteristic___block_invoke;
  v25[3] = &unk_24E783640;
  v17 = v14;
  v26 = v17;
  objc_msgSend(v15, "na_each:", v25);

  v24[0] = v16;
  v24[1] = 3221225472;
  v24[2] = __89__HMDBulletinUserAttributionManager_saveAttributedUserUUID_forTargetStateCharacteristic___block_invoke_2;
  v24[3] = &unk_24E783640;
  v24[4] = v9;
  objc_msgSend(v17, "na_each:", v24);
  v18 = (void *)objc_opt_new();
  objc_msgSend(v7, "instanceID");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setTargetCharacteristicInstanceID:", v19);

  objc_msgSend(v7, "value");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setValue:", v20);

  objc_msgSend(v7, "lastKnownValueUpdateTime");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setLastKnownValueUpdateTime:", v21);

  objc_msgSend(v18, "setUserUUID:", v6);
  -[HMDBulletinUserAttributionManager userAttributions](v9, "userAttributions");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "addObject:", v18);

  os_unfair_lock_unlock(&v9->_lock);
  v23[0] = v16;
  v23[1] = 3221225472;
  v23[2] = __89__HMDBulletinUserAttributionManager_saveAttributedUserUUID_forTargetStateCharacteristic___block_invoke_3;
  v23[3] = &unk_24E783640;
  v23[4] = v9;
  objc_msgSend(v17, "na_each:", v23);

}

- (id)attributedUserUUIDForCurrentStateCharacteristic:(id)a3 destination:(id)a4
{
  id v6;
  void *v7;
  HMDBulletinUserAttributionManager *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  os_unfair_lock_s *p_lock;
  void *v19;
  id v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  double v25;
  double v26;
  uint64_t v27;
  double v28;
  void *v29;
  HMDBulletinUserAttributionManager *v30;
  NSObject *v31;
  void *v32;
  double v33;
  void *v34;
  void *v35;
  HMDBulletinUserAttributionManager *v36;
  NSObject *v37;
  void *v38;
  id v39;
  void *v40;
  HMDBulletinUserAttributionManager *v41;
  NSObject *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  HMDBulletinUserAttributionManager *v50;
  NSObject *v51;
  void *v52;
  void *v53;
  HMDBulletinUserAttributionManager *v54;
  NSObject *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  HMDBulletinUserAttributionManager *v60;
  NSObject *v61;
  void *v62;
  void *v63;
  void *v64;
  HMDBulletinUserAttributionManager *v65;
  NSObject *v66;
  _BOOL4 v67;
  void *v68;
  void *v69;
  void *v70;
  void *context;
  id v73;
  void *v74;
  void *v75;
  void *v76;
  id v77;
  id v78;
  _QWORD v79[4];
  id v80;
  char v81;
  _QWORD v82[4];
  id v83;
  id v84;
  _QWORD v85[4];
  id v86;
  uint8_t buf[4];
  void *v88;
  __int16 v89;
  uint64_t v90;
  __int16 v91;
  id v92;
  __int16 v93;
  void *v94;
  __int16 v95;
  void *v96;
  uint64_t v97;

  v97 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v78 = a4;
  v7 = (void *)MEMORY[0x227676638]();
  v8 = self;
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v88 = v10;
    v89 = 2112;
    v90 = (uint64_t)v6;
    _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_INFO, "%{public}@Attempting to retrieve user attribution for current state characteristic=%@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v7);
  objc_msgSend((id)objc_opt_class(), "currentTargetStateCharacteristicTypeMap");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "type");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "hmf_stringForKey:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "service");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "characteristics");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = MEMORY[0x24BDAC760];
  v85[0] = MEMORY[0x24BDAC760];
  v85[1] = 3221225472;
  v85[2] = __97__HMDBulletinUserAttributionManager_attributedUserUUIDForCurrentStateCharacteristic_destination___block_invoke;
  v85[3] = &unk_24E798C68;
  v77 = v13;
  v86 = v77;
  objc_msgSend(v15, "na_firstObjectPassingTest:", v85);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    p_lock = &v8->_lock;
    os_unfair_lock_lock_with_options();
    -[HMDBulletinUserAttributionManager userAttributions](v8, "userAttributions");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v82[0] = v16;
    v82[1] = 3221225472;
    v82[2] = __97__HMDBulletinUserAttributionManager_attributedUserUUIDForCurrentStateCharacteristic_destination___block_invoke_32;
    v82[3] = &unk_24E783668;
    v20 = v17;
    v83 = v20;
    v21 = v6;
    v84 = v21;
    objc_msgSend(v19, "na_firstObjectPassingTest:", v82);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    os_unfair_lock_unlock(&v8->_lock);
    if (!v22)
    {
      v40 = (void *)MEMORY[0x227676638]();
      v41 = v8;
      HMFGetOSLogHandle();
      v42 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "instanceID");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "value");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v88 = v43;
        v89 = 2112;
        v90 = (uint64_t)v44;
        v91 = 2112;
        v92 = v45;
        _os_log_impl(&dword_2218F0000, v42, OS_LOG_TYPE_INFO, "%{public}@No saved tuple found for target state characteristic with instanceID=%@ and value=%@", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v40);
      goto LABEL_15;
    }
    objc_msgSend(v21, "lastKnownValueUpdateTime");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "lastKnownValueUpdateTime");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "timeIntervalSinceDate:", v24);
    v26 = v25;

    v27 = HMDSecureClassBulletinUserAttributionTime();
    if (v26 > v28)
    {
      v29 = (void *)MEMORY[0x227676638](v27);
      v30 = v8;
      HMFGetOSLogHandle();
      v31 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        HMDSecureClassBulletinUserAttributionTime();
        *(_DWORD *)buf = 138543618;
        v88 = v32;
        v89 = 2048;
        v90 = (uint64_t)v33;
        _os_log_impl(&dword_2218F0000, v31, OS_LOG_TYPE_INFO, "%{public}@TargetState changed date is too far apart from CurrentState changed date (%ld seconds), these are likely different operations, therefore we do not know who triggered this operation.", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v29);
      os_unfair_lock_lock_with_options();
      -[HMDBulletinUserAttributionManager userAttributions](v30, "userAttributions");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "removeObject:", v22);

      os_unfair_lock_unlock(p_lock);
LABEL_15:
      v39 = 0;
LABEL_40:

      goto LABEL_41;
    }
    objc_msgSend(v22, "userUUID");
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "accessory");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "home");
    v75 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v75, "userWithUUID:", v76);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = v47;
    if (!v47)
    {
      v53 = (void *)MEMORY[0x227676638]();
      v54 = v8;
      HMFGetOSLogHandle();
      v55 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v55, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "shortDescription");
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v88 = v56;
        v89 = 2112;
        v90 = (uint64_t)v57;
        v91 = 2112;
        v92 = v76;
        _os_log_impl(&dword_2218F0000, v55, OS_LOG_TYPE_INFO, "%{public}@Not returning attributedUserUUID for current state characteristic=%@ because the attributedUser cannot be determined from uuid=%@", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v53);
      v39 = 0;
      goto LABEL_39;
    }
    if (objc_msgSend(v47, "isOwner"))
    {
      v49 = (void *)MEMORY[0x227676638]();
      v50 = v8;
      HMFGetOSLogHandle();
      v51 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v51, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544130;
        v88 = v52;
        v89 = 2112;
        v90 = (uint64_t)v76;
        v91 = 2112;
        v92 = v21;
        v93 = 2112;
        v94 = v48;
        _os_log_impl(&dword_2218F0000, v51, OS_LOG_TYPE_INFO, "%{public}@Returning attributedUserUUID=%@ (owner) for current state characteristic=%@ for destinationUser=%@", buf, 0x2Au);

      }
      objc_autoreleasePoolPop(v49);
      v39 = v76;
      goto LABEL_39;
    }
    +[HMDDeviceHandle deviceHandleForDestination:](HMDDeviceHandle, "deviceHandleForDestination:", v78);
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    if (v74)
    {
      v81 = 0;
      -[HMDBulletinUserAttributionManager accountRegistry](v8, "accountRegistry");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v58, "deviceForHandle:exists:", v74, &v81);
      v73 = (id)objc_claimAutoreleasedReturnValue();

      if (!v81)
      {
        v59 = (void *)MEMORY[0x227676638]();
        v60 = v8;
        HMFGetOSLogHandle();
        v61 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v61, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v62 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v88 = v62;
          v89 = 2112;
          v90 = (uint64_t)v21;
          v91 = 2112;
          v92 = v78;
          _os_log_impl(&dword_2218F0000, v61, OS_LOG_TYPE_INFO, "%{public}@Not returning attributedUserUUID for current state characteristic=%@ because we cannot determine an account for the device with destination=%@", buf, 0x20u);

        }
        objc_autoreleasePoolPop(v59);
        v39 = 0;
LABEL_38:

LABEL_39:
        goto LABEL_40;
      }
    }
    else
    {
      v73 = 0;
    }
    objc_msgSend(v75, "users");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    v79[0] = v16;
    v79[1] = 3221225472;
    v79[2] = __97__HMDBulletinUserAttributionManager_attributedUserUUIDForCurrentStateCharacteristic_destination___block_invoke_35;
    v79[3] = &unk_24E799728;
    v73 = v73;
    v80 = v73;
    objc_msgSend(v63, "na_firstObjectPassingTest:", v79);
    v64 = (void *)objc_claimAutoreleasedReturnValue();

    LODWORD(v63) = objc_msgSend(v64, "isAdministrator");
    context = (void *)MEMORY[0x227676638]();
    v65 = v8;
    HMFGetOSLogHandle();
    v66 = objc_claimAutoreleasedReturnValue();
    v67 = os_log_type_enabled(v66, OS_LOG_TYPE_INFO);
    if ((_DWORD)v63)
    {
      if (v67)
      {
        HMFGetLogIdentifier();
        v68 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544130;
        v88 = v68;
        v89 = 2112;
        v90 = (uint64_t)v76;
        v91 = 2112;
        v92 = v21;
        v93 = 2112;
        v94 = v64;
        _os_log_impl(&dword_2218F0000, v66, OS_LOG_TYPE_INFO, "%{public}@Returning attributedUserUUID=%@ for current state characteristic=%@ for destinationUser=%@ (who is an admin)", buf, 0x2Au);

      }
      objc_autoreleasePoolPop(context);
      v39 = v76;
    }
    else
    {
      if (v67)
      {
        HMFGetLogIdentifier();
        v69 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v64, "privilege", context));
        v70 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544386;
        v88 = v69;
        v89 = 2112;
        v90 = (uint64_t)v21;
        v91 = 2112;
        v92 = v48;
        v93 = 2112;
        v94 = v64;
        v95 = 2112;
        v96 = v70;
        _os_log_impl(&dword_2218F0000, v66, OS_LOG_TYPE_INFO, "%{public}@Not returning attributedUserUUID for current state characteristic=%@ because the attributedUser=%@ is not the owner and the user we are sending to (destinationUser=%@) is not an admin. %@", buf, 0x34u);

      }
      objc_autoreleasePoolPop(context);
      v39 = 0;
    }

    goto LABEL_38;
  }
  v35 = (void *)MEMORY[0x227676638]();
  v36 = v8;
  HMFGetOSLogHandle();
  v37 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v88 = v38;
    v89 = 2112;
    v90 = (uint64_t)v6;
    _os_log_impl(&dword_2218F0000, v37, OS_LOG_TYPE_DEBUG, "%{public}@No targetStateCounterpart available for characteristic=%@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v35);
  v39 = 0;
LABEL_41:

  return v39;
}

- (void)removeAttributedUserUUIDForTargetStateCharacteristic:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  os_unfair_lock_s *p_lock;
  uint64_t v8;
  void *v9;
  HMDBulletinUserAttributionManager *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;
  id v16;
  void *v17;
  _QWORD v18[5];
  _QWORD v19[4];
  id v20;
  id v21;
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "instanceID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "value");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  p_lock = &self->_lock;
  v8 = os_unfair_lock_lock_with_options();
  v9 = (void *)MEMORY[0x227676638](v8);
  v10 = self;
  HMFGetOSLogHandle();
  v11 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v23 = v12;
    v24 = 2112;
    v25 = v5;
    v26 = 2112;
    v27 = v6;
    _os_log_impl(&dword_2218F0000, v11, OS_LOG_TYPE_INFO, "%{public}@Removing user attribution for characteristic with instanceID=%@ value=%@", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v9);
  -[HMDBulletinUserAttributionManager userAttributions](v10, "userAttributions");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = MEMORY[0x24BDAC760];
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __90__HMDBulletinUserAttributionManager_removeAttributedUserUUIDForTargetStateCharacteristic___block_invoke;
  v19[3] = &unk_24E783668;
  v15 = v5;
  v20 = v15;
  v16 = v6;
  v21 = v16;
  objc_msgSend(v13, "na_filter:", v19);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v18[0] = v14;
  v18[1] = 3221225472;
  v18[2] = __90__HMDBulletinUserAttributionManager_removeAttributedUserUUIDForTargetStateCharacteristic___block_invoke_2;
  v18[3] = &unk_24E783640;
  v18[4] = v10;
  objc_msgSend(v17, "na_each:", v18);

  os_unfair_lock_unlock(p_lock);
}

- (NSMutableArray)userAttributions
{
  return self->_userAttributions;
}

- (HMDAccountRegistry)accountRegistry
{
  return self->_accountRegistry;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accountRegistry, 0);
  objc_storeStrong((id *)&self->_userAttributions, 0);
}

uint64_t __90__HMDBulletinUserAttributionManager_removeAttributedUserUUIDForTargetStateCharacteristic___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;

  v3 = a2;
  objc_msgSend(v3, "targetCharacteristicInstanceID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isEqual:", *(_QWORD *)(a1 + 32)))
  {
    objc_msgSend(v3, "value");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isEqual:", *(_QWORD *)(a1 + 40));

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

void __90__HMDBulletinUserAttributionManager_removeAttributedUserUUIDForTargetStateCharacteristic___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "userAttributions");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObject:", v3);

}

uint64_t __97__HMDBulletinUserAttributionManager_attributedUserUUIDForCurrentStateCharacteristic_destination___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "type");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *(_QWORD *)(a1 + 32));

  return v4;
}

uint64_t __97__HMDBulletinUserAttributionManager_attributedUserUUIDForCurrentStateCharacteristic_destination___block_invoke_32(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;

  v3 = a2;
  objc_msgSend(v3, "targetCharacteristicInstanceID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "instanceID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isEqual:", v5))
  {
    objc_msgSend(v3, "value");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "value");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "isEqual:", v7);

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

uint64_t __97__HMDBulletinUserAttributionManager_attributedUserUUIDForCurrentStateCharacteristic_destination___block_invoke_35(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;

  objc_msgSend(a2, "account");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "account");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v5, "hmf_isEqualToUUID:", v8);

  return v9;
}

void __89__HMDBulletinUserAttributionManager_saveAttributedUserUUID_forTargetStateCharacteristic___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  id v8;

  v8 = a2;
  objc_msgSend(MEMORY[0x24BDBCE60], "now");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "lastKnownValueUpdateTime");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "timeIntervalSinceDate:", v4);
  v6 = v5;

  HMDSecureClassBulletinUserAttributionTime();
  if (v6 > v7)
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v8);

}

void __89__HMDBulletinUserAttributionManager_saveAttributedUserUUID_forTargetStateCharacteristic___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "userAttributions");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObject:", v3);

}

void __89__HMDBulletinUserAttributionManager_saveAttributedUserUUID_forTargetStateCharacteristic___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = (void *)MEMORY[0x227676638]();
  v5 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "targetCharacteristicInstanceID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138543618;
    v10 = v7;
    v11 = 2112;
    v12 = v8;
    _os_log_impl(&dword_2218F0000, v6, OS_LOG_TYPE_INFO, "%{public}@Removed orphaned user attribution for characteristic with instanceID=%@", (uint8_t *)&v9, 0x16u);

  }
  objc_autoreleasePoolPop(v4);

}

+ (id)logCategory
{
  if (logCategory__hmf_once_t16_103838 != -1)
    dispatch_once(&logCategory__hmf_once_t16_103838, &__block_literal_global_103839);
  return (id)logCategory__hmf_once_v17_103840;
}

+ (BOOL)currentStateCharacteristicSupportsUserAttribution:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  char v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  int v20;
  void *v21;
  void *v22;
  void *v23;

  v3 = a3;
  objc_msgSend(v3, "service");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "type");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", *MEMORY[0x24BDD5850]);
  if (v6)
  {
    objc_msgSend(v4, "type");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v7, "isEqualToString:", *MEMORY[0x24BDD6C08]) & 1) != 0)
    {
      v8 = 1;
LABEL_21:

      goto LABEL_22;
    }
    v23 = v7;
  }
  objc_msgSend(v3, "type");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isEqualToString:", *MEMORY[0x24BDD5818]);
  if (v10)
  {
    objc_msgSend(v4, "type");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v11, "isEqualToString:", *MEMORY[0x24BDD6BC0]) & 1) != 0)
    {
      v8 = 1;
      goto LABEL_20;
    }
    v22 = v11;
  }
  objc_msgSend(v3, "type");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "isEqualToString:", *MEMORY[0x24BDD5870]);
  if (v13)
  {
    objc_msgSend(v4, "type");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v14, "isEqualToString:", *MEMORY[0x24BDD6C30]) & 1) != 0)
    {
      v8 = 1;
      goto LABEL_19;
    }
    v21 = v14;
  }
  objc_msgSend(v3, "type");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v15, "isEqualToString:", *MEMORY[0x24BDD5860]))
  {
    objc_msgSend(v4, "type");
    v20 = v6;
    v16 = v9;
    v17 = v5;
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v18, "isEqualToString:", *MEMORY[0x24BDD6CA0]);

    v5 = v17;
    v9 = v16;
    v6 = v20;

    v14 = v21;
    if ((v13 & 1) == 0)
      goto LABEL_15;
  }
  else
  {

    v8 = 0;
    v14 = v21;
    if (!v13)
    {
LABEL_15:

      v11 = v22;
      if (v10)
        goto LABEL_20;
LABEL_16:

      v7 = v23;
      if (!v6)
        goto LABEL_22;
      goto LABEL_21;
    }
  }
LABEL_19:

  v11 = v22;
  if ((v10 & 1) == 0)
    goto LABEL_16;
LABEL_20:

  v7 = v23;
  if ((v6 & 1) != 0)
    goto LABEL_21;
LABEL_22:

  return v8;
}

+ (BOOL)targetStateCharacteristicSupportsUserAttribution:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  char v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  int v20;
  void *v21;
  void *v22;
  void *v23;

  v3 = a3;
  objc_msgSend(v3, "service");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "type");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", *MEMORY[0x24BDD5A50]);
  if (v6)
  {
    objc_msgSend(v4, "type");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v7, "isEqualToString:", *MEMORY[0x24BDD6C08]) & 1) != 0)
    {
      v8 = 1;
LABEL_21:

      goto LABEL_22;
    }
    v23 = v7;
  }
  objc_msgSend(v3, "type");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isEqualToString:", *MEMORY[0x24BDD5A18]);
  if (v10)
  {
    objc_msgSend(v4, "type");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v11, "isEqualToString:", *MEMORY[0x24BDD6BC0]) & 1) != 0)
    {
      v8 = 1;
      goto LABEL_20;
    }
    v22 = v11;
  }
  objc_msgSend(v3, "type");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "isEqualToString:", *MEMORY[0x24BDD5A70]);
  if (v13)
  {
    objc_msgSend(v4, "type");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v14, "isEqualToString:", *MEMORY[0x24BDD6C30]) & 1) != 0)
    {
      v8 = 1;
      goto LABEL_19;
    }
    v21 = v14;
  }
  objc_msgSend(v3, "type");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v15, "isEqualToString:", *MEMORY[0x24BDD5A60]))
  {
    objc_msgSend(v4, "type");
    v20 = v6;
    v16 = v9;
    v17 = v5;
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v18, "isEqualToString:", *MEMORY[0x24BDD6CA0]);

    v5 = v17;
    v9 = v16;
    v6 = v20;

    v14 = v21;
    if ((v13 & 1) == 0)
      goto LABEL_15;
  }
  else
  {

    v8 = 0;
    v14 = v21;
    if (!v13)
    {
LABEL_15:

      v11 = v22;
      if (v10)
        goto LABEL_20;
LABEL_16:

      v7 = v23;
      if (!v6)
        goto LABEL_22;
      goto LABEL_21;
    }
  }
LABEL_19:

  v11 = v22;
  if ((v10 & 1) == 0)
    goto LABEL_16;
LABEL_20:

  v7 = v23;
  if ((v6 & 1) != 0)
    goto LABEL_21;
LABEL_22:

  return v8;
}

void __48__HMDBulletinUserAttributionManager_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v17_103840;
  logCategory__hmf_once_v17_103840 = v0;

}

@end
