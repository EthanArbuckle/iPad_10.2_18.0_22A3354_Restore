@implementation HMDSettingsController

- (HMDSettingsController)initWithDependency:(id)a3 delegate:(id)a4
{
  id v7;
  id v8;
  HMDSettingsController *v9;
  HMDSettingsController *v10;
  uint64_t v11;
  HMDSettingsMessageHandlerProtocol *messageHandler;
  uint64_t v13;
  NSMapTable *groupsMap;
  uint64_t v15;
  NSMapTable *settingsMap;
  uint64_t v17;
  NSUUID *userUUID;
  objc_super v20;

  v7 = a3;
  v8 = a4;
  v20.receiver = self;
  v20.super_class = (Class)HMDSettingsController;
  v9 = -[HMDSettingsController init](&v20, sel_init);
  v10 = v9;
  if (v9)
  {
    v9->_lock._os_unfair_lock_opaque = 0;
    objc_storeStrong((id *)&v9->_dependency, a3);
    objc_storeWeak((id *)&v10->_delegate, v8);
    objc_msgSend(v7, "messageHandler");
    v11 = objc_claimAutoreleasedReturnValue();
    messageHandler = v10->_messageHandler;
    v10->_messageHandler = (HMDSettingsMessageHandlerProtocol *)v11;

    objc_msgSend(MEMORY[0x1E0CB3748], "strongToWeakObjectsMapTable");
    v13 = objc_claimAutoreleasedReturnValue();
    groupsMap = v10->_groupsMap;
    v10->_groupsMap = (NSMapTable *)v13;

    objc_msgSend(MEMORY[0x1E0CB3748], "strongToWeakObjectsMapTable");
    v15 = objc_claimAutoreleasedReturnValue();
    settingsMap = v10->_settingsMap;
    v10->_settingsMap = (NSMapTable *)v15;

    objc_msgSend(v7, "setTransactionReceiver:", v10);
    objc_msgSend(v7, "parentIdentifier");
    v17 = objc_claimAutoreleasedReturnValue();
    userUUID = v10->_userUUID;
    v10->_userUUID = (NSUUID *)v17;

  }
  return v10;
}

- (id)logIdentifier
{
  if (self)
    self = (HMDSettingsController *)objc_getProperty(self, a2, 32, 1);
  return -[HMDSettingsController logIdentifier](self, "logIdentifier");
}

- (void)configure
{
  HMDSettingsController *v2;
  SEL v3;
  void *v4;
  void *v5;
  _QWORD v6[5];

  v2 = self;
  if (self)
  {
    os_unfair_lock_lock_with_options();
    v2->_isInitialized = 1;
    os_unfair_lock_unlock(&v2->_lock);
    self = (HMDSettingsController *)objc_getProperty(v2, v3, 32, 1);
  }
  -[HMDSettingsController backingStoreController](self, "backingStoreController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "registerForSettingsTransactions:", v2);

  -[HMDSettingsController delegate]((id *)&v2->super.super.isa);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __34__HMDSettingsController_configure__block_invoke;
  v6[3] = &unk_1E89C2350;
  v6[4] = v2;
  objc_msgSend(v5, "settingsController:didUpdateWithCompletion:", v2, v6);

}

- (NSArray)allObjectIdentifiers
{
  const char *v3;
  id v4;
  void *v5;
  void *v6;
  SEL v7;
  id Property;
  void *v9;
  void *v10;
  void *v11;
  void *v13;
  void *v14;

  v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (self)
  {
    objc_msgSend(objc_getProperty(self, v3, 56, 1), "keyEnumerator");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "allObjects");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObjectsFromArray:", v6);

    Property = objc_getProperty(self, v7, 64, 1);
  }
  else
  {
    objc_msgSend(0, "keyEnumerator");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "allObjects");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObjectsFromArray:", v14);

    Property = 0;
  }
  objc_msgSend(Property, "keyEnumerator");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "allObjects");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObjectsFromArray:", v10);

  v11 = (void *)objc_msgSend(v4, "copy");
  return (NSArray *)v11;
}

- (id)settingForKeyPath:(id)a3
{
  const char *v4;
  id v5;
  id Property;
  const char *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;

  v5 = a3;
  if (self)
    Property = objc_getProperty(self, v4, 48, 1);
  else
    Property = 0;
  objc_msgSend(Property, "groups");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (self)
    v9 = objc_getProperty(self, v7, 48, 1);
  else
    v9 = 0;
  objc_msgSend(v9, "settings");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDSettingsController _settingForKeyPathWithGroups:settings:keyPath:](self, v8, v10, v5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (void)updateWithEncodedValue:(id)a3 onSettingKeyPath:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, id);
  void *v11;
  void *v12;
  void *v13;
  HMDSettingsController *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  HMDSettingsController *v20;
  NSObject *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  HMDSettingsController *v26;
  NSObject *v27;
  void *v28;
  void *v29;
  id v30;
  uint8_t buf[4];
  void *v32;
  __int16 v33;
  id v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, id))a5;
  -[HMDSettingsController settingForKeyPath:](self, "settingForKeyPath:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (!v11)
  {
    v19 = (void *)MEMORY[0x1D17BA0A0]();
    v20 = self;
    HMFGetOSLogHandle();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v32 = v22;
      v33 = 2112;
      v34 = v9;
      _os_log_impl(&dword_1CD062000, v21, OS_LOG_TYPE_ERROR, "%{public}@Setting not found for key path %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v19);
    v17 = (void *)MEMORY[0x1E0CB35C8];
    v18 = 2;
    goto LABEL_9;
  }
  if (objc_msgSend(v11, "isReadOnly"))
  {
    v13 = (void *)MEMORY[0x1D17BA0A0]();
    v14 = self;
    HMFGetOSLogHandle();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v32 = v16;
      v33 = 2112;
      v34 = v12;
      _os_log_impl(&dword_1CD062000, v15, OS_LOG_TYPE_ERROR, "%{public}@Setting is read only as we do not understand it %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v13);
    v17 = (void *)MEMORY[0x1E0CB35C8];
    v18 = 5;
LABEL_9:
    objc_msgSend(v17, "hmfErrorWithCode:", v18);
    v23 = (id)objc_claimAutoreleasedReturnValue();
    v10[2](v10, v23);
    goto LABEL_16;
  }
  v30 = 0;
  objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v8, &v30);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = v30;
  if (v24)
  {
    -[HMDSettingsController updateWithValue:onSetting:completion:](self, "updateWithValue:onSetting:completion:", v24, v12, v10);
  }
  else
  {
    v25 = (void *)MEMORY[0x1D17BA0A0]();
    v26 = self;
    HMFGetOSLogHandle();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v32 = v28;
      v33 = 2112;
      v34 = v23;
      _os_log_impl(&dword_1CD062000, v27, OS_LOG_TYPE_ERROR, "%{public}@Failed to unarchive setting value from encoded value: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v25);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmfErrorWithCode:", 3);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v10[2](v10, v29);

  }
LABEL_16:

}

- (void)updateWithValue:(id)a3 onSetting:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, id);
  int v11;
  void *v12;
  NSObject *v13;
  _BOOL4 v14;
  void *v15;
  void *v16;
  const char *v17;
  id Property;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  const char *v25;
  id v26;
  void *v27;
  void *v28;
  const char *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  char v38;
  const char *v39;
  id v40;
  id v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  id v47;
  NSObject *v48;
  void *v49;
  void *v50;
  void *v51;
  HMDSettingsController *v52;
  NSObject *v53;
  void *v54;
  void *v55;
  NSObject *v56;
  const char *v57;
  HMDSettingsController *v58;
  NSObject *v59;
  void *v60;
  void *v61;
  uint64_t v62;
  void *v63;
  uint64_t v64;
  void *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t i;
  void *v69;
  void *v70;
  id v71;
  NSObject *v72;
  void *v73;
  id v74;
  void *v75;
  id v76;
  void *v77;
  void *v78;
  HMDSettingsController *v79;
  NSObject *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  HMDSettingsController *v86;
  NSObject *v87;
  void *v88;
  void *v89;
  void (**v90)(id, id);
  id v91;
  id v92;
  void *v93;
  id v94;
  HMDSettingsController *v95;
  uint64_t v96;
  void *v97;
  id v98;
  _QWORD v99[4];
  id v100;
  void (**v101)(id, id);
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  id v110;
  _BYTE v111[128];
  uint8_t v112[128];
  uint8_t buf[4];
  void *v114;
  __int16 v115;
  id v116;
  __int16 v117;
  id v118;
  uint64_t v119;

  v119 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, id))a5;
  v110 = 0;
  LODWORD(a5) = objc_msgSend(v9, "isValidValue:error:", v8, &v110);
  v94 = v110;
  if (!(_DWORD)a5)
  {
    v78 = (void *)MEMORY[0x1D17BA0A0]();
    v79 = self;
    HMFGetOSLogHandle();
    v80 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v80, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v81 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v114 = v81;
      v115 = 2112;
      v116 = v8;
      v117 = 2112;
      v118 = v9;
      _os_log_impl(&dword_1CD062000, v80, OS_LOG_TYPE_ERROR, "%{public}@Received value %@ is not valid for setting %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v78);
    v82 = v94;
    if (v94)
    {
      v10[2](v10, v94);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "hmfErrorWithCode:", 3);
      v84 = (void *)objc_claimAutoreleasedReturnValue();
      v10[2](v10, v84);

    }
    goto LABEL_64;
  }
  v11 = objc_msgSend(v9, "wouldValueUpdate:", v8);
  v12 = (void *)MEMORY[0x1D17BA0A0]();
  v98 = v9;
  HMFGetOSLogHandle();
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = os_log_type_enabled(v13, OS_LOG_TYPE_INFO);
  if (!v11)
  {
    if (v14)
    {
      HMFGetLogIdentifier();
      v83 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v114 = v83;
      v115 = 2112;
      v116 = v98;
      v117 = 2112;
      v118 = v8;
      _os_log_impl(&dword_1CD062000, v13, OS_LOG_TYPE_INFO, "%{public}@Skipping update due to setting: %@ matching update setting value: %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v12);
    v10[2](v10, 0);
    goto LABEL_63;
  }
  if (v14)
  {
    HMFGetLogIdentifier();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v98, "value");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v114 = v15;
    v115 = 2112;
    v116 = v16;
    v117 = 2112;
    v118 = v8;
    _os_log_impl(&dword_1CD062000, v13, OS_LOG_TYPE_INFO, "%{public}@Updating value on message from %@ to %@", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v12);
  if (self)
    Property = objc_getProperty(self, v17, 32, 1);
  else
    Property = 0;
  v19 = Property;
  objc_msgSend(v98, "identifier");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v98, "parentIdentifier");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "settingModelForUpdateWithIdentifier:parentIdentifier:value:", v20, v21, v8);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v22)
  {
    v85 = (void *)MEMORY[0x1D17BA0A0]();
    v86 = self;
    HMFGetOSLogHandle();
    v87 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v87, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v88 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v114 = v88;
      v115 = 2112;
      v116 = v8;
      v117 = 2112;
      v118 = v98;
      _os_log_impl(&dword_1CD062000, v87, OS_LOG_TYPE_ERROR, "%{public}@Failed to create model to update value %@ on setting %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v85);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:description:reason:suggestion:", 3, CFSTR("Created model is nil"), CFSTR("Unable to create update model"), 0);
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    v10[2](v10, v77);
    goto LABEL_62;
  }
  -[HMDSettingsController delegate]((id *)&self->super.super.isa);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v98, "keyPath");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "settingsController:willUpdateSettingAtKeyPath:withValue:", self, v24, v8);
  v93 = (void *)objc_claimAutoreleasedReturnValue();

  if (self)
    v26 = objc_getProperty(self, v25, 32, 1);
  else
    v26 = 0;
  objc_msgSend(v26, "backingStoreController");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "settingTransactionWithName:", CFSTR("Update Setting Value"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  v97 = v28;
  objc_msgSend(v28, "addSettingModel:", v22);
  if (!v93)
    goto LABEL_48;
  v90 = v10;
  v91 = v9;
  v89 = v22;
  v92 = v8;
  v108 = 0u;
  v109 = 0u;
  v106 = 0u;
  v107 = 0u;
  objc_msgSend(v93, "settingsToUpdate");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v106, v112, 16);
  v95 = self;
  if (!v31)
    goto LABEL_38;
  v32 = v31;
  v96 = *(_QWORD *)v107;
  do
  {
    v33 = 0;
    do
    {
      if (*(_QWORD *)v107 != v96)
        objc_enumerationMutation(v30);
      v34 = *(void **)(*((_QWORD *)&v106 + 1) + 8 * v33);
      objc_msgSend(v34, "keyPath");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDSettingsController settingForKeyPath:](self, "settingForKeyPath:", v35);
      v36 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v36)
      {
        v51 = (void *)MEMORY[0x1D17BA0A0]();
        v52 = self;
        HMFGetOSLogHandle();
        v53 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "keyPath");
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v114 = v54;
          v115 = 2112;
          v116 = v55;
          v117 = 2112;
          v118 = v98;
          v56 = v53;
          v57 = "%{public}@Failed to find related constrained setting at keyPath %@ on setting update for %@";
          goto LABEL_28;
        }
LABEL_29:

        objc_autoreleasePoolPop(v51);
        goto LABEL_34;
      }
      objc_msgSend(v34, "settingValue");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = objc_msgSend(v36, "isValidValue:error:", v37, 0);

      if ((v38 & 1) == 0)
      {
        v51 = (void *)MEMORY[0x1D17BA0A0]();
        v52 = self;
        HMFGetOSLogHandle();
        v53 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "settingValue");
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v114 = v54;
          v115 = 2112;
          v116 = v55;
          v117 = 2112;
          v118 = v36;
          v56 = v53;
          v57 = "%{public}@Provided setting value %@ is not valid for constrained setting %@";
LABEL_28:
          _os_log_impl(&dword_1CD062000, v56, OS_LOG_TYPE_ERROR, v57, buf, 0x20u);

        }
        goto LABEL_29;
      }
      if (self)
        v40 = objc_getProperty(self, v39, 32, 1);
      else
        v40 = 0;
      v41 = v40;
      objc_msgSend(v36, "identifier");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "parentIdentifier");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "settingValue");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "settingModelForUpdateWithIdentifier:parentIdentifier:value:", v42, v43, v44);
      v45 = (void *)objc_claimAutoreleasedReturnValue();

      v46 = (void *)MEMORY[0x1D17BA0A0]();
      if (v45)
      {
        v47 = v98;
        HMFGetOSLogHandle();
        v48 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v48, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "settingValue");
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v114 = v49;
          v115 = 2112;
          v116 = v45;
          v117 = 2112;
          v118 = v50;
          _os_log_impl(&dword_1CD062000, v48, OS_LOG_TYPE_INFO, "%{public}@Added additional setting model %@ update with value %@", buf, 0x20u);

        }
        objc_autoreleasePoolPop(v46);
        objc_msgSend(v97, "addSettingModel:", v45);
      }
      else
      {
        v58 = v95;
        HMFGetOSLogHandle();
        v59 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v59, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v60 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "settingValue");
          v61 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v114 = v60;
          v115 = 2112;
          v116 = v61;
          v117 = 2112;
          v118 = 0;
          _os_log_impl(&dword_1CD062000, v59, OS_LOG_TYPE_ERROR, "%{public}@Failed to create model to update value %@ on constrained setting %@", buf, 0x20u);

        }
        objc_autoreleasePoolPop(v46);
      }

      self = v95;
LABEL_34:

      ++v33;
    }
    while (v32 != v33);
    v62 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v106, v112, 16);
    v32 = v62;
  }
  while (v62);
LABEL_38:

  v104 = 0u;
  v105 = 0u;
  v102 = 0u;
  v103 = 0u;
  objc_msgSend(v93, "modelsToUpdate");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  v64 = objc_msgSend(v63, "countByEnumeratingWithState:objects:count:", &v102, v111, 16);
  v65 = v98;
  if (v64)
  {
    v66 = v64;
    v67 = *(_QWORD *)v103;
    do
    {
      for (i = 0; i != v66; ++i)
      {
        if (*(_QWORD *)v103 != v67)
          objc_enumerationMutation(v63);
        v69 = *(void **)(*((_QWORD *)&v102 + 1) + 8 * i);
        v70 = (void *)MEMORY[0x1D17BA0A0]();
        v71 = v65;
        HMFGetOSLogHandle();
        v72 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v72, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v73 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v114 = v73;
          v115 = 2112;
          v116 = v69;
          v117 = 2112;
          v118 = v98;
          _os_log_impl(&dword_1CD062000, v72, OS_LOG_TYPE_INFO, "%{public}@Added additional model %@ to update when updating setting %@", buf, 0x20u);

          v65 = v98;
        }

        objc_autoreleasePoolPop(v70);
        objc_msgSend(v97, "addModel:", v69);
      }
      v66 = objc_msgSend(v63, "countByEnumeratingWithState:objects:count:", &v102, v111, 16);
    }
    while (v66);
  }

  v9 = v91;
  v8 = v92;
  v22 = v89;
  v10 = v90;
  self = v95;
LABEL_48:
  if (self)
    v74 = objc_getProperty(self, v29, 32, 1);
  else
    v74 = 0;
  objc_msgSend(v74, "backingStoreController");
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  v99[0] = MEMORY[0x1E0C809B0];
  v99[1] = 3221225472;
  v99[2] = __62__HMDSettingsController_updateWithValue_onSetting_completion___block_invoke;
  v99[3] = &unk_1E89BFC88;
  v100 = v93;
  v101 = v10;
  v76 = v93;
  v77 = v97;
  objc_msgSend(v75, "runSettingTransaction:completion:", v97, v99);

LABEL_62:
LABEL_63:
  v82 = v94;
LABEL_64:

}

- (id)settingValuesByKeyPathWithPrefix:(id)a3
{
  const char *v4;
  id v5;
  id Property;
  void *v7;
  id v8;
  void *v9;
  void *v10;

  v5 = a3;
  if (self)
    Property = objc_getProperty(self, v4, 48, 1);
  else
    Property = 0;
  v7 = (void *)MEMORY[0x1E0C99E08];
  v8 = Property;
  objc_msgSend(v7, "dictionary");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDSettingsController _flattenedSettingControllerRoot:withCurrentPath:andReturnDictionary:](self, v8, v5, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (void)updateRootGroup:(id)a3
{
  const char *v4;

  if (self)
  {
    objc_setProperty_atomic(self, a2, a3, 48);
    -[HMDSettingsController settingsHierarchyDidChange](self, v4);
  }
}

- (id)modelsToMakeSettings
{
  HMDSettingsController *v2;
  void *v3;
  void *v4;
  HMDSettingsController *v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  const char *v9;
  id Property;
  void *v11;
  void *v12;
  void *v13;
  int v15;
  void *v16;
  uint64_t v17;

  v2 = self;
  v17 = *MEMORY[0x1E0C80C00];
  if (self)
    self = (HMDSettingsController *)objc_getProperty(self, a2, 32, 1);
  -[HMDSettingsController loadMetadata](self, "loadMetadata");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1D17BA0A0]();
  v5 = v2;
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v3)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138543362;
      v16 = v8;
      _os_log_impl(&dword_1CD062000, v7, OS_LOG_TYPE_INFO, "%{public}@Creating settings models using metadata", (uint8_t *)&v15, 0xCu);

    }
    objc_autoreleasePoolPop(v4);
    if (v2)
      Property = objc_getProperty(v5, v9, 32, 1);
    else
      Property = 0;
    objc_msgSend(Property, "metadataParser");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "modelsFromMetadata:", v3);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138543362;
      v16 = v13;
      _os_log_impl(&dword_1CD062000, v7, OS_LOG_TYPE_ERROR, "%{public}@Could not load any metadata to make settings", (uint8_t *)&v15, 0xCu);

    }
    objc_autoreleasePoolPop(v4);
    v12 = 0;
  }

  return v12;
}

- (id)modelsToMigrateSettings
{
  HMDSettingsController *v2;
  const char *v3;
  void *v4;
  id Property;
  void *v6;
  void *v7;
  const char *v8;
  id v9;
  void *v10;
  NSObject *v11;
  _BOOL4 v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  id *p_isa;
  SEL v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  SEL v35;
  id v36;
  void *v37;
  void *v38;
  id v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t j;
  uint64_t v43;
  void *v44;
  void *v45;
  id v46;
  void *v47;
  id v48;
  void *v49;
  void *v50;
  BOOL v51;
  void *v52;
  uint64_t v53;
  void *v54;
  uint64_t v55;
  void *v56;
  uint64_t v57;
  void *v58;
  id *v59;
  NSObject *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  id v67;
  void *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t k;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  uint64_t v79;
  void *v80;
  HMDSettingsController *v81;
  NSObject *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  HMDSettingsController *v87;
  NSObject *v88;
  void *v89;
  HMDSettingsController *v90;
  NSObject *v91;
  void *v92;
  void *v93;
  void *v95;
  HMDSettingsController *v96;
  void *v97;
  void *v98;
  HMDSettingsController *selfa;
  void *v100;
  void *v101;
  id obj;
  id obja;
  void *v104;
  id v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  uint8_t v114[128];
  uint8_t buf[4];
  void *v116;
  __int16 v117;
  void *v118;
  __int16 v119;
  void *v120;
  uint64_t v121;

  v2 = self;
  v121 = *MEMORY[0x1E0C80C00];
  if (self)
    self = (HMDSettingsController *)objc_getProperty(self, a2, 32, 1);
  -[HMDSettingsController loadMetadata](self, "loadMetadata");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    if (v2)
      Property = objc_getProperty(v2, v3, 32, 1);
    else
      Property = 0;
    objc_msgSend(Property, "metadataParser");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "modelsFromMetadata:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      if (v2)
        v9 = objc_getProperty(v2, v8, 48, 1);
      else
        v9 = 0;
      v10 = (void *)MEMORY[0x1D17BA0A0]();
      selfa = v2;
      HMFGetOSLogHandle();
      v11 = objc_claimAutoreleasedReturnValue();
      v12 = os_log_type_enabled(v11, OS_LOG_TYPE_INFO);
      if (v9)
      {
        if (v12)
        {
          HMFGetLogIdentifier();
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v116 = v13;
          _os_log_impl(&dword_1CD062000, v11, OS_LOG_TYPE_INFO, "%{public}@Getting new models in metadata for migration", buf, 0xCu);

        }
        v98 = v4;

        objc_autoreleasePoolPop(v10);
        v97 = v7;
        v14 = v7;
        v15 = v14;
        v96 = v2;
        if (v2)
        {
          v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(v14, "count"));
          v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(v15, "count"));
          v110 = 0u;
          v111 = 0u;
          v112 = 0u;
          v113 = 0u;
          v18 = v15;
          v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v110, buf, 16);
          if (v19)
          {
            v20 = v19;
            v21 = *(_QWORD *)v111;
            do
            {
              for (i = 0; i != v20; ++i)
              {
                if (*(_QWORD *)v111 != v21)
                  objc_enumerationMutation(v18);
                v23 = *(void **)(*((_QWORD *)&v110 + 1) + 8 * i);
                objc_msgSend(v23, "hmbModelID");
                v24 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v16, "setObject:forKey:", v23, v24);

                objc_msgSend(v23, "hmbParentModelID");
                v25 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v17, "objectForKey:", v25);
                v26 = (id)objc_claimAutoreleasedReturnValue();

                if (!v26)
                {
                  v26 = objc_alloc_init(MEMORY[0x1E0C99E20]);
                  objc_msgSend(v23, "hmbParentModelID");
                  v27 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v17, "setObject:forKey:", v26, v27);

                }
                objc_msgSend(v23, "hmbModelID");
                v28 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v26, "addObject:", v28);

              }
              v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v110, buf, 16);
            }
            while (v20);
          }

          p_isa = (id *)&selfa->super.super.isa;
          objc_msgSend(objc_getProperty(selfa, v30, 48, 1), "parentIdentifier");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "objectForKey:", v31);
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "allObjects");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "objectAtIndexedSubscript:", 0);
          v34 = (void *)objc_claimAutoreleasedReturnValue();

          -[HMDSettingsController _keyPathsToModelInModelIDToModelLookup:parentIDToModelIDsLookup:currentID:currentPath:](v16, v17, v34, &stru_1E89C3E38);
          v104 = (void *)objc_claimAutoreleasedReturnValue();

          v36 = objc_getProperty(selfa, v35, 48, 1);
          -[HMDSettingsController _keyPathsFromGroup:currentPath:](v36, &stru_1E89C3E38);
          v95 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {

          v104 = 0;
          v95 = 0;
          p_isa = (id *)&selfa->super.super.isa;
        }
        -[HMDSettingsController delegate](p_isa);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "settingsControllerFollowerKeyPaths:", p_isa);
        v38 = (void *)objc_claimAutoreleasedReturnValue();

        v108 = 0u;
        v109 = 0u;
        v106 = 0u;
        v107 = 0u;
        v39 = v38;
        v40 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v106, v114, 16);
        v101 = v39;
        if (v40)
        {
          v41 = v40;
          obj = *(id *)v107;
          do
          {
            for (j = 0; j != v41; ++j)
            {
              if (*(id *)v107 != obj)
                objc_enumerationMutation(v39);
              v43 = *(_QWORD *)(*((_QWORD *)&v106 + 1) + 8 * j);
              objc_msgSend(CFSTR("."), "stringByAppendingString:", v43, v95);
              v44 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v104, "objectForKeyedSubscript:", v44);
              v45 = (void *)objc_claimAutoreleasedReturnValue();

              v46 = v45;
              if (objc_msgSend(v46, "conformsToProtocol:", &unk_1EFAADEE0))
                v47 = v46;
              else
                v47 = 0;
              v48 = v47;

              objc_msgSend(v39, "objectForKeyedSubscript:", v43);
              v49 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(p_isa, "settingForKeyPath:", v49);
              v50 = (void *)objc_claimAutoreleasedReturnValue();

              if (v48)
                v51 = v50 == 0;
              else
                v51 = 1;
              if (!v51)
              {
                objc_msgSend(v50, "internalValue");
                v52 = (void *)objc_claimAutoreleasedReturnValue();
                v53 = objc_msgSend(v52, "type");
                objc_msgSend(v48, "type");
                v54 = (void *)objc_claimAutoreleasedReturnValue();
                v55 = objc_msgSend(v54, "integerValue");

                v39 = v101;
                if (v53 == v55)
                {
                  objc_msgSend(v48, "type");
                  v56 = (void *)objc_claimAutoreleasedReturnValue();
                  v57 = objc_msgSend(v56, "integerValue");

                  if (v57 == 2)
                  {
                    v58 = (void *)MEMORY[0x1D17BA0A0]();
                    v59 = p_isa;
                    HMFGetOSLogHandle();
                    v60 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT))
                    {
                      HMFGetLogIdentifier();
                      v100 = v58;
                      v61 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v48, "name");
                      v62 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v50, "internalValue");
                      v63 = (void *)objc_claimAutoreleasedReturnValue();
                      *(_DWORD *)buf = 138543874;
                      v116 = v61;
                      v117 = 2112;
                      v118 = v62;
                      v119 = 2112;
                      v120 = v63;
                      _os_log_impl(&dword_1CD062000, v60, OS_LOG_TYPE_DEFAULT, "%{public}@Will migrate value of %@ as %@", buf, 0x20u);

                      v39 = v101;
                      p_isa = (id *)&selfa->super.super.isa;

                      v58 = v100;
                    }

                    objc_autoreleasePoolPop(v58);
                    objc_msgSend(v50, "internalValue");
                    v64 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v64, "numberValue");
                    v65 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v48, "setNumberValue:", v65);

                  }
                }
              }

            }
            v41 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v106, v114, 16);
          }
          while (v41);
        }

        objc_msgSend(v95, "allKeys");
        v66 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v104, "removeObjectsForKeys:", v66);

        v67 = v104;
        v105 = v95;
        if (v96)
        {
          objc_msgSend(v67, "allKeys");
          v68 = (void *)objc_claimAutoreleasedReturnValue();
          v110 = 0u;
          v111 = 0u;
          v112 = 0u;
          v113 = 0u;
          obja = v68;
          v69 = objc_msgSend(v68, "countByEnumeratingWithState:objects:count:", &v110, buf, 16);
          if (v69)
          {
            v70 = v69;
            v71 = *(_QWORD *)v111;
            do
            {
              for (k = 0; k != v70; ++k)
              {
                if (*(_QWORD *)v111 != v71)
                  objc_enumerationMutation(obja);
                v73 = *(void **)(*((_QWORD *)&v110 + 1) + 8 * k);
                objc_msgSend(v67, "valueForKey:", v73, v95);
                v74 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v73, "substringToIndex:", objc_msgSend(v73, "rangeOfString:options:", CFSTR("."), 4));
                v75 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v105, "valueForKey:", v75);
                v76 = (void *)objc_claimAutoreleasedReturnValue();
                v77 = v76;
                if (v76)
                {
                  objc_msgSend(v76, "identifier");
                  v78 = (void *)objc_claimAutoreleasedReturnValue();
                  v79 = objc_msgSend(v74, "copyWithNewParentModelID:", v78);

                  objc_msgSend(v67, "setValue:forKey:", v79, v73);
                  v74 = (void *)v79;
                }

              }
              v70 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v110, buf, 16);
            }
            while (v70);
          }

        }
        v80 = (void *)MEMORY[0x1D17BA0A0]();
        v81 = selfa;
        HMFGetOSLogHandle();
        v82 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v82, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v83 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v67, "count"));
          v84 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v116 = v83;
          v117 = 2112;
          v118 = v84;
          _os_log_impl(&dword_1CD062000, v82, OS_LOG_TYPE_INFO, "%{public}@Found %@ new models in metadata for migration", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v80);
        objc_msgSend(v67, "allValues");
        v85 = (void *)objc_claimAutoreleasedReturnValue();

        v7 = v97;
        v4 = v98;
        goto LABEL_66;
      }
      if (v12)
      {
        HMFGetLogIdentifier();
        v93 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v116 = v93;
        _os_log_impl(&dword_1CD062000, v11, OS_LOG_TYPE_INFO, "%{public}@Settings controller does not have a rootGroup for migration", buf, 0xCu);

      }
    }
    else
    {
      v10 = (void *)MEMORY[0x1D17BA0A0]();
      v90 = v2;
      HMFGetOSLogHandle();
      v91 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v91, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v92 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v116 = v92;
        _os_log_impl(&dword_1CD062000, v91, OS_LOG_TYPE_ERROR, "%{public}@Unable to retrieve setting models from parser", buf, 0xCu);

      }
    }
    objc_autoreleasePoolPop(v10);
    v85 = 0;
LABEL_66:

    goto LABEL_67;
  }
  v86 = (void *)MEMORY[0x1D17BA0A0]();
  v87 = v2;
  HMFGetOSLogHandle();
  v88 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v88, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v116 = v89;
    _os_log_impl(&dword_1CD062000, v88, OS_LOG_TYPE_ERROR, "%{public}@Unable to load settings metadata from dependency", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v86);
  v85 = 0;
LABEL_67:

  return v85;
}

- (id)migrateSettingsTransactionWithTransaction:(id)a3 error:(id *)a4
{
  const char *v6;
  id v7;
  id Property;
  void *v9;
  HMDSettingsController *v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  const char *v14;
  void *v15;
  id v16;
  const char *v17;
  id v18;
  void *v19;
  uint64_t v20;
  void *v21;
  HMDSettingsController *v22;
  NSObject *v23;
  _BOOL4 v24;
  void *v25;
  void *v26;
  const char *v27;
  id v28;
  void *v29;
  void *v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t i;
  HMDSettingRootGroupModel *v36;
  id v37;
  void *v38;
  void *v39;
  id v40;
  void *v41;
  id v42;
  uint64_t v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  uint8_t v49[128];
  uint8_t buf[4];
  void *v51;
  __int16 v52;
  void *v53;
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  if (self)
    Property = objc_getProperty(self, v6, 48, 1);
  else
    Property = 0;
  v9 = (void *)MEMORY[0x1D17BA0A0]();
  v10 = self;
  HMFGetOSLogHandle();
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (Property)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v51 = v13;
      _os_log_impl(&dword_1CD062000, v12, OS_LOG_TYPE_DEBUG, "%{public}@Getting Migrating Setting models", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v9);
    -[HMDSettingsController modelsToMigrateSettings](v10, "modelsToMigrateSettings");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (self)
      v16 = objc_getProperty(v10, v14, 48, 1);
    else
      v16 = 0;
    objc_msgSend(v16, "identifier");
    v44 = objc_claimAutoreleasedReturnValue();
    if (self)
      v18 = objc_getProperty(v10, v17, 48, 1);
    else
      v18 = 0;
    objc_msgSend(v18, "parentIdentifier");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDSettingsController updateRootGroup:](v10, "updateRootGroup:", 0);
    v20 = objc_msgSend(v15, "count");
    v21 = (void *)MEMORY[0x1D17BA0A0]();
    v22 = v10;
    HMFGetOSLogHandle();
    v23 = objc_claimAutoreleasedReturnValue();
    v24 = os_log_type_enabled(v23, OS_LOG_TYPE_INFO);
    if (v20)
    {
      if (v24)
      {
        HMFGetLogIdentifier();
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v15, "count"));
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v51 = v25;
        v52 = 2112;
        v53 = v26;
        _os_log_impl(&dword_1CD062000, v23, OS_LOG_TYPE_INFO, "%{public}@Migrating settings with %@ models", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v21);
      if (self)
        v28 = objc_getProperty(v22, v27, 32, 1);
      else
        v28 = 0;
      v29 = (void *)v44;
      objc_msgSend(v28, "migrationProvider");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "applyConditionalValueUpdateToModels:", v15);

      v47 = 0u;
      v48 = 0u;
      v45 = 0u;
      v46 = 0u;
      v31 = v15;
      v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v45, v49, 16);
      if (v32)
      {
        v33 = v32;
        v34 = *(_QWORD *)v46;
        do
        {
          for (i = 0; i != v33; ++i)
          {
            if (*(_QWORD *)v46 != v34)
              objc_enumerationMutation(v31);
            objc_msgSend(v7, "addSettingModel:", *(_QWORD *)(*((_QWORD *)&v45 + 1) + 8 * i));
          }
          v33 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v45, v49, 16);
        }
        while (v33);
      }

      v36 = -[HMDSettingRootGroupModel initWithModelID:parentModelID:]([HMDSettingRootGroupModel alloc], "initWithModelID:parentModelID:", v44, v19);
      objc_msgSend(v7, "addSettingModel:", v36);
      v37 = v7;

    }
    else
    {
      if (v24)
      {
        HMFGetLogIdentifier();
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v51 = v41;
        _os_log_impl(&dword_1CD062000, v23, OS_LOG_TYPE_INFO, "%{public}@No new models for settings to migrate", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v21);
      if (a4)
        *a4 = 0;
      v42 = v7;
      v29 = (void *)v44;
    }

  }
  else
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v51 = v38;
      _os_log_impl(&dword_1CD062000, v12, OS_LOG_TYPE_ERROR, "%{public}@No root group to migrate settings", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v9);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmfErrorWithCode:", 8);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v39;
    if (v39)
      *a4 = objc_retainAutorelease(v39);
    v40 = v7;
  }

  return v7;
}

- (id)_prunedSettingsGroupByRemovingKeyPathsFromGroup:(id)a3
{
  return -[HMDSettingsController _cloneGroupFilteringKeyPath:](self, a3);
}

- (void)encodeWithCoder:(id)a3
{
  const char *v4;
  const char *v5;
  const char *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  if (self
    && objc_getProperty(self, v4, 48, 1)
    && objc_msgSend(v9, "hmd_isForXPCTransport")
    && objc_msgSend(v9, "hmd_isForXPCTransportEntitledForSPIAccess"))
  {
    -[HMDSettingsController _prunedSettingsGroupByRemovingKeyPathsFromGroup:](self, "_prunedSettingsGroupByRemovingKeyPathsFromGroup:", objc_getProperty(self, v5, 48, 1));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      objc_msgSend(objc_getProperty(self, v6, 32, 1), "codingKey");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "encodeObject:forKey:", v7, v8);

    }
  }

}

- (void)loadWithModels:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  id v16;
  void *v17;
  id v18;
  NSObject *v19;
  void *v20;
  void *context;
  HMDSettingsController *v22;
  id obj;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  id v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  obj = a3;
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v25;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v25 != v6)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
        v9 = (void *)MEMORY[0x1D17BA0A0]();
        v10 = v8;
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v11 = v10;
        else
          v11 = 0;
        v12 = v11;

        v13 = v10;
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v14 = v13;
        else
          v14 = 0;
        v15 = v14;

        v16 = v13;
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v17 = v16;
        else
          v17 = 0;
        v18 = v17;

        if (v12)
        {
          -[HMDSettingsController _handleAddedGroupModel:shouldNotify:completion:](self, v12, 0, &__block_literal_global_165);
        }
        else if (v15)
        {
          -[HMDSettingsController _handleAddedSettingModel:shouldNotify:completion:](self, v15, 0, &__block_literal_global_166);
        }
        else if (v18)
        {
          -[HMDSettingsController _handleAddedConstraintModel:shouldNotify:completion:](self, v18, &__block_literal_global_167);
        }
        else
        {
          context = (void *)MEMORY[0x1D17BA0A0]();
          v22 = self;
          HMFGetOSLogHandle();
          v19 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
          {
            HMFGetLogIdentifier();
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v29 = v20;
            v30 = 2112;
            v31 = v16;
            _os_log_impl(&dword_1CD062000, v19, OS_LOG_TYPE_DEFAULT, "%{public}@Unrecognized model type %@", buf, 0x16u);

          }
          objc_autoreleasePoolPop(context);
        }

        objc_autoreleasePoolPop(v9);
      }
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
    }
    while (v5);
  }

}

- (void)transactionSettingGroupModelUpdated:(id)a3 previousModel:(id)a4 completion:(id)a5
{
  void (**v7)(id, id);
  void *v8;
  void *v9;
  id v10;
  void (**v11)(id, id);
  _BOOL4 isInitialized;
  id v13;
  id v14;

  v14 = a3;
  v7 = (void (**)(id, id))a5;
  objc_msgSend(v14, "hmbModelID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDSettingsController settingGroupForIdentifier:](self, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v10 = objc_alloc_init(MEMORY[0x1E0D32C18]);
    v7[2](v7, v10);
LABEL_8:

    goto LABEL_9;
  }
  if (self)
  {
    v10 = v14;
    v11 = v7;
    os_unfair_lock_lock_with_options();
    isInitialized = self->_isInitialized;
    os_unfair_lock_unlock(&self->_lock);
    if (isInitialized)
    {
      -[HMDSettingsController _handleAddedGroupModel:shouldNotify:completion:](self, v10, 1, v11);
    }
    else
    {
      v13 = objc_alloc_init(MEMORY[0x1E0D32C18]);
      v11[2](v11, v13);

    }
    goto LABEL_8;
  }
LABEL_9:

}

- (void)transactionSettingModelUpdated:(id)a3 previousModel:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  HMDSettingsController *v13;
  id v14;
  id v15;
  void (**v16)(id, id);
  id v17;
  id v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  uint64_t v25;
  id v26;
  id v27;
  _BOOL4 isInitialized;
  id v29;
  void *v30;
  id v31;
  void *v32;
  id v33;
  uint64_t v34;
  void *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  NSObject *v41;
  void *v42;
  HMDSettingsController *v43;
  void *v44;
  id v45;
  void *v46;
  id v47;
  void *v48;
  id v49;
  id v50;
  _BYTE buf[24];
  void *v52;
  HMDSettingsController *v53;
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(v8, "hmbModelID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDSettingsController settingForIdentifier:](self, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    v50 = v9;
    v13 = self;
    v14 = v12;
    v15 = v8;
    v16 = (void (**)(id, id))v10;
    v17 = v14;
    v18 = v15;
    objc_msgSend(v17, "type");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "integerValue");

    v21 = 0;
    switch(v20)
    {
      case 1:
        objc_msgSend(v18, "dataValue");
        v22 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v22)
          goto LABEL_18;
        v23 = objc_alloc(MEMORY[0x1E0CBA820]);
        objc_msgSend(v18, "dataValue");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = objc_msgSend(v23, "initDataSettingWithValue:", v24);
        goto LABEL_14;
      case 2:
        objc_msgSend(v18, "numberValue");
        v30 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v30)
          goto LABEL_18;
        v31 = objc_alloc(MEMORY[0x1E0CBA820]);
        objc_msgSend(v18, "numberValue");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = objc_msgSend(v31, "initNumberSettingWithValue:", v24);
        goto LABEL_14;
      case 3:
        objc_msgSend(v18, "stringValue");
        v32 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v32)
          goto LABEL_18;
        v33 = objc_alloc(MEMORY[0x1E0CBA820]);
        objc_msgSend(v18, "stringValue");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = objc_msgSend(v33, "initStringSettingWithValue:", v24);
LABEL_14:
        v21 = (void *)v25;

        break;
      case 4:
        objc_msgSend(v18, "selectionIdentifier");
        v34 = objc_claimAutoreleasedReturnValue();
        if (!v34)
          goto LABEL_18;
        v35 = (void *)v34;
        objc_msgSend(v18, "selectionValue");
        v36 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v36)
          goto LABEL_18;
        v47 = objc_alloc(MEMORY[0x1E0CBA820]);
        objc_msgSend(v17, "type");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        v37 = objc_msgSend(v48, "integerValue");
        objc_msgSend(v18, "selectionIdentifier");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "selectionValue");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = (void *)objc_msgSend(v47, "initWithType:stringValue:numberValue:dataValue:selectionIdentifier:selectionValue:", v37, 0, 0, 0, v38, v39);

        break;
      case 5:
        break;
      default:
LABEL_18:
        v40 = (void *)MEMORY[0x1D17BA0A0]();
        HMFGetOSLogHandle();
        v41 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "type");
          v49 = v10;
          v43 = v13;
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          *(_QWORD *)&buf[4] = v42;
          *(_WORD *)&buf[12] = 2112;
          *(_QWORD *)&buf[14] = v44;
          _os_log_impl(&dword_1CD062000, v41, OS_LOG_TYPE_INFO, "%{public}@Unknown setting type %@ will not attempt to decode value in transaction", buf, 0x16u);

          v13 = v43;
          v10 = v49;

        }
        objc_autoreleasePoolPop(v40);
        v21 = 0;
        break;
    }

    v45 = objc_alloc_init(MEMORY[0x1E0D32CA8]);
    if (v21 && objc_msgSend(v17, "updateWithSettingValue:", v21))
    {
      -[HMDSettingsController delegate]((id *)&v13->super.super.isa);
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      *(_QWORD *)buf = MEMORY[0x1E0C809B0];
      *(_QWORD *)&buf[8] = 3221225472;
      *(_QWORD *)&buf[16] = ____transactionSettingUpdated_block_invoke;
      v52 = &unk_1E89C2350;
      v53 = v13;
      objc_msgSend(v46, "settingsController:didUpdateWithCompletion:", v53, buf);

      objc_msgSend(v45, "setShouldUpdateClients:", 1);
    }
    v16[2](v16, v45);

    v9 = v50;
  }
  else if (self)
  {
    v26 = v8;
    v27 = v10;
    os_unfair_lock_lock_with_options();
    isInitialized = self->_isInitialized;
    os_unfair_lock_unlock(&self->_lock);
    if (isInitialized)
    {
      -[HMDSettingsController _handleAddedSettingModel:shouldNotify:completion:](self, v26, 1, v27);
    }
    else
    {
      v29 = objc_alloc_init(MEMORY[0x1E0D32C18]);
      (*((void (**)(id, id))v27 + 2))(v27, v29);

    }
  }

}

- (void)transactionSettingConstraintModelUpdated:(id)a3 previousModel:(id)a4 completion:(id)a5
{
  id v7;
  _BOOL4 isInitialized;
  id v9;
  id v10;

  if (self)
  {
    v10 = a3;
    v7 = a5;
    os_unfair_lock_lock_with_options();
    isInitialized = self->_isInitialized;
    os_unfair_lock_unlock(&self->_lock);
    if (isInitialized)
    {
      -[HMDSettingsController _handleAddedConstraintModel:shouldNotify:completion:](self, v10, v7);
    }
    else
    {
      v9 = objc_alloc_init(MEMORY[0x1E0D32C18]);
      (*((void (**)(id, id))v7 + 2))(v7, v9);

    }
  }
}

- (NSUUID)userUUID
{
  return (NSUUID *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_settingsMap, 0);
  objc_storeStrong((id *)&self->_groupsMap, 0);
  objc_storeStrong((id *)&self->_rootGroup, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_dependency, 0);
  objc_storeStrong((id *)&self->_messageHandler, 0);
  objc_storeStrong((id *)&self->_userUUID, 0);
}

- (void)_handleAddedConstraintModel:(void *)a1 shouldNotify:(void *)a2 completion:(void *)a3
{
  HMDSettingConstraint *v5;
  void (**v6)(id, id);
  void *v7;
  void *v8;
  HMDSettingConstraint *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  HMDSettingConstraint *v15;
  void *v16;
  id v17;
  NSObject *v18;
  void *v19;
  void *v20;
  id v21;
  NSObject *v22;
  void *v23;
  HMDSettingConstraint *v24;
  void *v25;
  const char *v26;
  void *v27;
  id v28;
  NSObject *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  NSObject *v34;
  void *v35;
  void *v36;
  id v37;
  NSObject *v38;
  void *v39;
  id v40;
  int v41;
  void *v42;
  __int16 v43;
  HMDSettingConstraint *v44;
  __int16 v45;
  void *v46;
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (a1)
  {
    -[HMDSettingConstraint hmbParentModelID](v5, "hmbParentModelID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDSettingsController settingForIdentifier:](a1, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      v9 = [HMDSettingConstraint alloc];
      -[HMDSettingConstraint hmbModelID](v5, "hmbModelID");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDSettingConstraint hmbParentModelID](v5, "hmbParentModelID");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDSettingConstraint type](v5, "type");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDSettingConstraint numberValue](v5, "numberValue");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDSettingConstraint dataValue](v5, "dataValue");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = -[HMDSettingConstraint initWithIdentifier:parentIdentifier:type:numberValue:dataValue:](v9, "initWithIdentifier:parentIdentifier:type:numberValue:dataValue:", v10, v11, v12, v13, v14);

      if (v15)
      {
        v16 = (void *)MEMORY[0x1D17BA0A0](objc_msgSend(v8, "addConstraint:", v15));
        v17 = a1;
        HMFGetOSLogHandle();
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
        {
          HMFGetLogIdentifier();
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v41 = 138543874;
          v42 = v19;
          v43 = 2112;
          v44 = v15;
          v45 = 2112;
          v46 = v8;
          _os_log_impl(&dword_1CD062000, v18, OS_LOG_TYPE_DEBUG, "%{public}@Added settings constraint %@ to %@", (uint8_t *)&v41, 0x20u);

        }
        objc_autoreleasePoolPop(v16);
        v20 = (void *)MEMORY[0x1D17BA0A0]();
        v21 = v17;
        HMFGetOSLogHandle();
        v22 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          -[HMDSettingConstraint identifier](v15, "identifier");
          v24 = (HMDSettingConstraint *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "name");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v41 = 138543874;
          v42 = v23;
          v43 = 2112;
          v44 = v24;
          v45 = 2112;
          v46 = v25;
          _os_log_impl(&dword_1CD062000, v22, OS_LOG_TYPE_INFO, "%{public}@Added settings constraint %@ to %@", (uint8_t *)&v41, 0x20u);

        }
        objc_autoreleasePoolPop(v20);
        -[HMDSettingsController settingsHierarchyDidChange](v21, v26);
      }
      else
      {
        v36 = (void *)MEMORY[0x1D17BA0A0]();
        v37 = a1;
        HMFGetOSLogHandle();
        v38 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          v41 = 138543618;
          v42 = v39;
          v43 = 2112;
          v44 = v5;
          _os_log_impl(&dword_1CD062000, v38, OS_LOG_TYPE_ERROR, "%{public}@Couldn't decode value for received constraint model %@", (uint8_t *)&v41, 0x16u);

        }
        objc_autoreleasePoolPop(v36);
      }
      v40 = objc_alloc_init(MEMORY[0x1E0D32C18]);
      v6[2](v6, v40);

    }
    else
    {
      v27 = (void *)MEMORY[0x1D17BA0A0]();
      v28 = a1;
      HMFGetOSLogHandle();
      v29 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
      {
        HMFGetLogIdentifier();
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDSettingConstraint hmbParentModelID](v5, "hmbParentModelID");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v41 = 138543874;
        v42 = v30;
        v43 = 2112;
        v44 = v5;
        v45 = 2112;
        v46 = v31;
        _os_log_impl(&dword_1CD062000, v29, OS_LOG_TYPE_DEBUG, "%{public}@Couldn't find setting for received constraint model %@, parent %@", (uint8_t *)&v41, 0x20u);

      }
      objc_autoreleasePoolPop(v27);
      v32 = (void *)MEMORY[0x1D17BA0A0]();
      v33 = v28;
      HMFGetOSLogHandle();
      v34 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        v41 = 138543362;
        v42 = v35;
        _os_log_impl(&dword_1CD062000, v34, OS_LOG_TYPE_ERROR, "%{public}@Couldn't find setting for received constraint model", (uint8_t *)&v41, 0xCu);

      }
      objc_autoreleasePoolPop(v32);
      v15 = (HMDSettingConstraint *)objc_alloc_init(MEMORY[0x1E0D32C18]);
      v6[2](v6, v15);
    }

  }
}

- (id)settingForIdentifier:(id)a1
{
  id v2;
  id v3;
  SEL v4;

  v2 = a1;
  if (a1)
  {
    v3 = a2;
    objc_msgSend(objc_getProperty(v2, v4, 64, 1), "objectForKey:", v3);
    v2 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v2;
}

- (void)settingsHierarchyDidChange
{
  id v3;
  SEL v4;
  void *v5;
  SEL v6;
  void *v7;
  _QWORD v8[5];

  if (a1)
  {
    v3 = objc_getProperty(a1, a2, 48, 1);
    v5 = (void *)objc_msgSend(objc_getProperty(a1, v4, 56, 1), "copy");
    v7 = (void *)objc_msgSend(objc_getProperty(a1, v6, 64, 1), "copy");
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __51__HMDSettingsController_settingsHierarchyDidChange__block_invoke;
    v8[3] = &unk_1E89AF418;
    v8[4] = a1;
    +[HMDSettingAlgorithm findChangedSettingsWithRootGroup:currentGroups:currentSettings:completion:](HMDSettingAlgorithm, "findChangedSettingsWithRootGroup:currentGroups:currentSettings:completion:", v3, v5, v7, v8);

  }
}

void __51__HMDSettingsController_settingsHierarchyDidChange__block_invoke(uint64_t a1, void *a2, void *a3, void *a4, void *a5, void *a6, void *a7)
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  const char *v19;
  void *v20;
  id v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  const char *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  id v35;
  id v36;
  id v37;
  uint8_t buf[4];
  void *v39;
  __int16 v40;
  void *v41;
  __int16 v42;
  void *v43;
  __int16 v44;
  void *v45;
  __int16 v46;
  void *v47;
  __int16 v48;
  void *v49;
  __int16 v50;
  void *v51;
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v13 = a2;
  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  if (objc_msgSend(v15, "count")
    || objc_msgSend(v16, "count")
    || objc_msgSend(v17, "count")
    || objc_msgSend(v18, "count"))
  {
    v20 = (void *)MEMORY[0x1D17BA0A0]();
    v21 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = v18;
      v37 = v13;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v15, "count"));
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v16, "count"));
      v35 = v16;
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v17, "count"));
      v33 = v20;
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v18, "count"));
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = v17;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v14, "count"));
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v13, "count"));
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544898;
      v39 = v32;
      v40 = 2112;
      v41 = v31;
      v42 = 2112;
      v43 = v23;
      v44 = 2112;
      v45 = v24;
      v46 = 2112;
      v47 = v25;
      v48 = 2112;
      v49 = v26;
      v50 = 2112;
      v51 = v27;
      _os_log_impl(&dword_1CD062000, v22, OS_LOG_TYPE_INFO, "%{public}@Added %@ groups and %@ settings. Removed %@ groups and %@ settings. Currently have %@ groups and %@ settings", buf, 0x48u);

      v13 = v37;
      v17 = v34;

      v18 = v36;
      v20 = v33;

      v16 = v35;
    }

    objc_autoreleasePoolPop(v20);
  }
  v28 = *(void **)(a1 + 32);
  if (v28)
  {
    objc_setProperty_atomic(v28, v19, v14, 64);
    v30 = *(void **)(a1 + 32);
    if (v30)
      objc_setProperty_atomic(v30, v29, v13, 56);
  }

}

- (id)delegate
{
  if (WeakRetained)
    WeakRetained = (id *)objc_loadWeakRetained(WeakRetained + 5);
  return WeakRetained;
}

- (void)_handleAddedSettingModel:(int)a3 shouldNotify:(void *)a4 completion:
{
  id v7;
  void (**v8)(id, id);
  HMDSetting *v9;
  HMDSetting *v10;
  void *v11;
  void *v12;
  id *v13;
  NSObject *v14;
  NSObject *v15;
  void *v16;
  const char *v17;
  id WeakRetained;
  void *v19;
  id v20;
  NSObject *v21;
  void *v22;
  void *v23;
  id v24;
  _QWORD v25[5];
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  HMDSetting *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a4;
  if (a1)
  {
    v9 = -[HMDSetting initWithModel:]([HMDSetting alloc], "initWithModel:", v7);
    if (v9)
    {
      objc_msgSend(v7, "hmbParentModelID");
      v10 = (HMDSetting *)objc_claimAutoreleasedReturnValue();
      -[HMDSettingsController settingGroupForIdentifier:](a1, v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = (void *)MEMORY[0x1D17BA0A0]();
      v13 = a1;
      HMFGetOSLogHandle();
      v14 = objc_claimAutoreleasedReturnValue();
      v15 = v14;
      if (v11)
      {
        if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v27 = v16;
          v28 = 2112;
          v29 = v9;
          _os_log_impl(&dword_1CD062000, v15, OS_LOG_TYPE_INFO, "%{public}@Added setting %@", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v12);
        objc_msgSend(v11, "addSetting:", v9);
        -[HMDSettingsController settingsHierarchyDidChange](v13, v17);
        if (a3)
        {
          WeakRetained = objc_loadWeakRetained(v13 + 5);
          v25[0] = MEMORY[0x1E0C809B0];
          v25[1] = 3221225472;
          v25[2] = __74__HMDSettingsController__handleAddedSettingModel_shouldNotify_completion___block_invoke;
          v25[3] = &unk_1E89C2350;
          v25[4] = v13;
          objc_msgSend(WeakRetained, "settingsController:didUpdateWithCompletion:", v13, v25);

        }
      }
      else
      {
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v27 = v23;
          v28 = 2112;
          v29 = v10;
          _os_log_impl(&dword_1CD062000, v15, OS_LOG_TYPE_ERROR, "%{public}@Parent group not found to add setting in transaction for identifier %@", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v12);
      }
      v24 = objc_alloc_init(MEMORY[0x1E0D32C18]);
      v8[2](v8, v24);

    }
    else
    {
      v19 = (void *)MEMORY[0x1D17BA0A0]();
      v20 = a1;
      HMFGetOSLogHandle();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v27 = v22;
        _os_log_impl(&dword_1CD062000, v21, OS_LOG_TYPE_INFO, "%{public}@Unable to decode setting in transaction payload", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v19);
      v10 = (HMDSetting *)objc_alloc_init(MEMORY[0x1E0D32C18]);
      v8[2](v8, v10);
    }

  }
}

- (id)settingGroupForIdentifier:(id)a1
{
  id v2;
  id v3;
  SEL v4;

  v2 = a1;
  if (a1)
  {
    v3 = a2;
    objc_msgSend(objc_getProperty(v2, v4, 56, 1), "objectForKey:", v3);
    v2 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v2;
}

void __74__HMDSettingsController__handleAddedSettingModel_shouldNotify_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (void *)MEMORY[0x1D17BA0A0]();
  v5 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138543618;
    v9 = v7;
    v10 = 2112;
    v11 = v3;
    _os_log_impl(&dword_1CD062000, v6, OS_LOG_TYPE_INFO, "%{public}@Sent setting added notification. Error: %@", (uint8_t *)&v8, 0x16u);

  }
  objc_autoreleasePoolPop(v4);

}

- (void)_handleAddedGroupModel:(int)a3 shouldNotify:(void *)a4 completion:
{
  HMDSettingGroup *v7;
  void (**v8)(id, id);
  HMDSettingGroup *v9;
  HMDSettingGroup *v10;
  void *v11;
  SEL v12;
  void *v13;
  int v14;
  void *v15;
  id v16;
  NSObject *v17;
  void *v18;
  HMDSettingGroup *v19;
  SEL v20;
  const char *v21;
  void *v22;
  void *v23;
  char v24;
  void *v25;
  id v26;
  NSObject *v27;
  void *v28;
  void *v29;
  id v30;
  NSObject *v31;
  void *v32;
  void *v33;
  void *v34;
  id *v35;
  NSObject *v36;
  NSObject *v37;
  void *v38;
  const char *v39;
  id WeakRetained;
  void *v41;
  id v42;
  NSObject *v43;
  void *v44;
  SEL v45;
  void *v46;
  void *v47;
  id v48;
  _QWORD v49[5];
  uint8_t buf[4];
  void *v51;
  __int16 v52;
  HMDSettingGroup *v53;
  __int16 v54;
  void *v55;
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a4;
  if (a1)
  {
    v9 = -[HMDSettingGroup initWithModel:]([HMDSettingGroup alloc], "initWithModel:", v7);
    v10 = v9;
    if (v9)
    {
      -[HMDSettingGroup parentIdentifier](v9, "parentIdentifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(objc_getProperty(a1, v12, 32, 1), "parentIdentifier");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v11, "hmf_isEqualToUUID:", v13);

      if (v14)
      {
        v15 = (void *)MEMORY[0x1D17BA0A0]();
        v16 = a1;
        HMFGetOSLogHandle();
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v51 = v18;
          v52 = 2112;
          v53 = v7;
          _os_log_impl(&dword_1CD062000, v17, OS_LOG_TYPE_INFO, "%{public}@Root group added to owner %@", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v15);
        v19 = v10;
        if (objc_getProperty(v16, v20, 48, 1))
        {
          objc_msgSend(objc_getProperty(v16, v21, 48, 1), "identifier");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          -[HMDSettingGroup identifier](v19, "identifier");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = objc_msgSend(v22, "hmf_isEqualToUUID:", v23);

          if ((v24 & 1) == 0)
          {
            v25 = (void *)MEMORY[0x1D17BA0A0]();
            v26 = v16;
            HMFGetOSLogHandle();
            v27 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
            {
              HMFGetLogIdentifier();
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543362;
              v51 = v28;
              _os_log_impl(&dword_1CD062000, v27, OS_LOG_TYPE_ERROR, "%{public}@We have a colliding root group", buf, 0xCu);

            }
            objc_autoreleasePoolPop(v25);
          }
        }
        else
        {
          v41 = (void *)MEMORY[0x1D17BA0A0]();
          v42 = v16;
          HMFGetOSLogHandle();
          v43 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v44 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(objc_getProperty(v42, v45, 32, 1), "parentIdentifier");
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543874;
            v51 = v44;
            v52 = 2112;
            v53 = v19;
            v54 = 2112;
            v55 = v46;
            _os_log_impl(&dword_1CD062000, v43, OS_LOG_TYPE_INFO, "%{public}@Adding root group %@ for user %@", buf, 0x20u);

          }
          objc_autoreleasePoolPop(v41);
          objc_msgSend(v42, "updateRootGroup:", v19);
        }
      }
      else
      {
        -[HMDSettingGroup hmbParentModelID](v7, "hmbParentModelID");
        v19 = (HMDSettingGroup *)objc_claimAutoreleasedReturnValue();
        -[HMDSettingsController settingGroupForIdentifier:](a1, v19);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = (void *)MEMORY[0x1D17BA0A0]();
        v35 = a1;
        HMFGetOSLogHandle();
        v36 = objc_claimAutoreleasedReturnValue();
        v37 = v36;
        if (!v33)
        {
          if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v47 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v51 = v47;
            v52 = 2112;
            v53 = v19;
            _os_log_impl(&dword_1CD062000, v37, OS_LOG_TYPE_ERROR, "%{public}@Parent group not found to add group in transaction for identifier %@", buf, 0x16u);

          }
          objc_autoreleasePoolPop(v34);
          v48 = objc_alloc_init(MEMORY[0x1E0D32C18]);
          v8[2](v8, v48);

          goto LABEL_25;
        }
        if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v51 = v38;
          v52 = 2112;
          v53 = v10;
          _os_log_impl(&dword_1CD062000, v37, OS_LOG_TYPE_INFO, "%{public}@Added group %@", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v34);
        objc_msgSend(v33, "addGroup:", v10);
        -[HMDSettingsController settingsHierarchyDidChange](v35, v39);
        if (a3)
        {
          WeakRetained = objc_loadWeakRetained(v35 + 5);
          v49[0] = MEMORY[0x1E0C809B0];
          v49[1] = 3221225472;
          v49[2] = __72__HMDSettingsController__handleAddedGroupModel_shouldNotify_completion___block_invoke;
          v49[3] = &unk_1E89C2350;
          v49[4] = v35;
          objc_msgSend(WeakRetained, "settingsController:didUpdateWithCompletion:", v35, v49);

        }
      }

    }
    else
    {
      v29 = (void *)MEMORY[0x1D17BA0A0]();
      v30 = a1;
      HMFGetOSLogHandle();
      v31 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v51 = v32;
        v52 = 2112;
        v53 = v7;
        _os_log_impl(&dword_1CD062000, v31, OS_LOG_TYPE_ERROR, "%{public}@Unable to decode setting group in transaction payload %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v29);
    }
    v19 = (HMDSettingGroup *)objc_alloc_init(MEMORY[0x1E0D32C18]);
    v8[2](v8, v19);
LABEL_25:

  }
}

void __72__HMDSettingsController__handleAddedGroupModel_shouldNotify_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (void *)MEMORY[0x1D17BA0A0]();
  v5 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138543618;
    v9 = v7;
    v10 = 2112;
    v11 = v3;
    _os_log_impl(&dword_1CD062000, v6, OS_LOG_TYPE_INFO, "%{public}@Sent group added notification. Error: %@", (uint8_t *)&v8, 0x16u);

  }
  objc_autoreleasePoolPop(v4);

}

- (HMDSettingGroup)_cloneGroupFilteringKeyPath:(void *)a1
{
  const char *v3;
  id v4;
  void *v5;
  uint64_t v6;
  const char *v7;
  void *v8;
  void *v9;
  char v10;
  HMDSettingGroup *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id v16;
  void *v17;
  id v18;
  HMDSettingGroup *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v26;
  uint64_t v27;
  void (*v28)(uint64_t, void *);
  void *v29;
  void *v30;
  id v31;
  _QWORD v32[5];
  id v33;

  v4 = a2;
  if (a1)
  {
    objc_msgSend(objc_getProperty(a1, v3, 32, 1), "keyPathsToPrune");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "count");

    if (!v6)
    {
      v11 = (HMDSettingGroup *)v4;
      goto LABEL_7;
    }
    objc_msgSend(objc_getProperty(a1, v7, 32, 1), "keyPathsToPrune");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "keyPath");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v8, "containsObject:", v9);

    if ((v10 & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "groups");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = MEMORY[0x1E0C809B0];
      v32[0] = MEMORY[0x1E0C809B0];
      v32[1] = 3221225472;
      v32[2] = __53__HMDSettingsController__cloneGroupFilteringKeyPath___block_invoke;
      v32[3] = &unk_1E89AF440;
      v32[4] = a1;
      v33 = v12;
      v16 = v12;
      objc_msgSend(v14, "na_each:", v32);

      objc_msgSend(v4, "settings");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = v15;
      v27 = 3221225472;
      v28 = __53__HMDSettingsController__cloneGroupFilteringKeyPath___block_invoke_2;
      v29 = &unk_1E89AF468;
      v30 = a1;
      v31 = v13;
      v18 = v13;
      objc_msgSend(v17, "na_each:", &v26);

      v19 = [HMDSettingGroup alloc];
      objc_msgSend(v4, "identifier", v26, v27, v28, v29, v30);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "parentIdentifier");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "name");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = (void *)objc_msgSend(v16, "copy");
      v24 = (void *)objc_msgSend(v18, "copy");
      v11 = -[HMDSettingGroup initWithIdentifier:parentIdentifier:name:groups:settings:](v19, "initWithIdentifier:parentIdentifier:name:groups:settings:", v20, v21, v22, v23, v24);

      goto LABEL_7;
    }
  }
  v11 = 0;
LABEL_7:

  return v11;
}

void __53__HMDSettingsController__cloneGroupFilteringKeyPath___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  -[HMDSettingsController _cloneGroupFilteringKeyPath:](*(_QWORD *)(a1 + 32));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = v2;
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v2);
    v2 = v3;
  }

}

void __53__HMDSettingsController__cloneGroupFilteringKeyPath___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  const char *v4;
  id v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  id v10;

  v3 = *(void **)(a1 + 32);
  v5 = a2;
  if (v3
    && (objc_msgSend(objc_getProperty(v3, v4, 32, 1), "keyPathsToPrune"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v5, "keyPath"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v8 = objc_msgSend(v6, "containsObject:", v7),
        v7,
        v6,
        !v8))
  {
    v10 = v5;

    v9 = v10;
    if (v10)
    {
      objc_msgSend(*(id *)(a1 + 40), "addObject:", v10);
      v9 = v10;
    }
  }
  else
  {

    v9 = 0;
  }

}

- (id)_keyPathsFromGroup:(void *)a1 currentPath:(void *)a2
{
  id v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t j;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  v4 = a2;
  v5 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v6 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v3, "name");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringWithFormat:", CFSTR("%@.%@"), v4, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setValue:forKey:", v3, v8);
  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  v28 = v3;
  objc_msgSend(v3, "settings");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v34;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v34 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);
        v15 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(v14, "name");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "stringWithFormat:", CFSTR("%@.%@"), v8, v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v5, "setValue:forKey:", v14, v17);
        objc_msgSend(v14, "constraintsByKeyPathWithCurrentKeyPath:", v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addEntriesFromDictionary:", v18);

      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
    }
    while (v11);
  }

  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  objc_msgSend(v28, "groups");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
  if (v20)
  {
    v21 = v20;
    v22 = *(_QWORD *)v30;
    do
    {
      for (j = 0; j != v21; ++j)
      {
        if (*(_QWORD *)v30 != v22)
          objc_enumerationMutation(v19);
        v24 = *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * j);
        v25 = (void *)objc_msgSend(v8, "copy");
        -[HMDSettingsController _keyPathsFromGroup:currentPath:](v24, v25);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addEntriesFromDictionary:", v26);

      }
      v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
    }
    while (v21);
  }

  return v5;
}

- (id)_keyPathsToModelInModelIDToModelLookup:(void *)a1 parentIDToModelIDsLookup:(void *)a2 currentID:(void *)a3 currentPath:(void *)a4
{
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v25;
  void *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v7 = a1;
  v8 = a2;
  v9 = a3;
  v10 = a4;
  v11 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v7, "objectForKey:", v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v12, "nameForKeyPath");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "stringWithFormat:", CFSTR("%@.%@"), v10, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v25 = v12;
  objc_msgSend(v11, "setObject:forKey:", v12, v15);
  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v26 = v9;
  objc_msgSend(v8, "objectForKey:", v9);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v28;
    do
    {
      v20 = 0;
      do
      {
        if (*(_QWORD *)v28 != v19)
          objc_enumerationMutation(v16);
        v21 = *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * v20);
        v22 = (void *)objc_msgSend(v15, "copy");
        -[HMDSettingsController _keyPathsToModelInModelIDToModelLookup:parentIDToModelIDsLookup:currentID:currentPath:](v7, v8, v21, v22);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "addEntriesFromDictionary:", v23);

        ++v20;
      }
      while (v18 != v20);
      v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    }
    while (v18);
  }

  return v11;
}

- (id)_flattenedSettingControllerRoot:(void *)a3 withCurrentPath:(void *)a4 andReturnDictionary:
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  id v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t j;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  if (a1)
  {
    if (v7)
    {
      if (objc_msgSend(v8, "length"))
      {
        objc_msgSend(v8, "stringByAppendingString:", CFSTR("."));
        v10 = objc_claimAutoreleasedReturnValue();

        v8 = (id)v10;
      }
      v11 = v8;
      objc_msgSend(v7, "name");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "stringByAppendingString:", v12);
      v8 = (id)objc_claimAutoreleasedReturnValue();

      v38 = 0u;
      v39 = 0u;
      v36 = 0u;
      v37 = 0u;
      objc_msgSend(v7, "groups");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
      if (v14)
      {
        v15 = v14;
        v16 = *(_QWORD *)v37;
        do
        {
          for (i = 0; i != v15; ++i)
          {
            if (*(_QWORD *)v37 != v16)
              objc_enumerationMutation(v13);
            v18 = (id)-[HMDSettingsController _flattenedSettingControllerRoot:withCurrentPath:andReturnDictionary:](a1, *(_QWORD *)(*((_QWORD *)&v36 + 1) + 8 * i), v8, v9);
          }
          v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
        }
        while (v15);
      }

      v34 = 0u;
      v35 = 0u;
      v32 = 0u;
      v33 = 0u;
      v31 = v7;
      objc_msgSend(v7, "settings");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
      if (v20)
      {
        v21 = v20;
        v22 = *(_QWORD *)v33;
        do
        {
          for (j = 0; j != v21; ++j)
          {
            if (*(_QWORD *)v33 != v22)
              objc_enumerationMutation(v19);
            v24 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * j);
            objc_msgSend(v24, "name");
            v25 = (void *)objc_claimAutoreleasedReturnValue();

            if (v25)
            {
              objc_msgSend(v8, "stringByAppendingString:", CFSTR("."));
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v24, "name");
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v26, "stringByAppendingString:", v27);
              v28 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(v24, "value");
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v9, "setObject:forKeyedSubscript:", v29, v28);

            }
          }
          v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
        }
        while (v21);
      }

      v7 = v31;
    }
    a1 = v9;
  }

  return a1;
}

void __62__HMDSettingsController_updateWithValue_onSetting_completion___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void (**v4)(void);
  id v5;

  v5 = a2;
  if (!v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "onCommitCompletion");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (v3)
    {
      objc_msgSend(*(id *)(a1 + 32), "onCommitCompletion");
      v4 = (void (**)(void))objc_claimAutoreleasedReturnValue();
      v4[2]();

    }
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (id)_settingForKeyPathWithGroups:(void *)a3 settings:(void *)a4 keyPath:
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  char v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t j;
  void *v21;
  void *v22;
  char v23;
  void *v24;
  void *v25;
  id v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v27 = a2;
  v7 = a3;
  v8 = a4;
  if (a1)
  {
    v34 = 0u;
    v35 = 0u;
    v32 = 0u;
    v33 = 0u;
    v9 = v7;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v33;
      while (2)
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v33 != v12)
            objc_enumerationMutation(v9);
          v14 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * i);
          objc_msgSend(v14, "keyPath");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = objc_msgSend(v15, "isEqualToString:", v8);

          if ((v16 & 1) != 0)
          {
            a1 = v14;
            goto LABEL_21;
          }
        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
        if (v11)
          continue;
        break;
      }
    }

    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    v9 = v27;
    v17 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v29;
      while (2)
      {
        for (j = 0; j != v18; ++j)
        {
          if (*(_QWORD *)v29 != v19)
            objc_enumerationMutation(v9);
          v21 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * j);
          objc_msgSend(v21, "keyPath");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = objc_msgSend(v8, "containsString:", v22);

          if ((v23 & 1) != 0)
          {
            objc_msgSend(v21, "groups");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "settings");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            -[HMDSettingsController _settingForKeyPathWithGroups:settings:keyPath:](a1, v24, v25, v8);
            a1 = (id)objc_claimAutoreleasedReturnValue();

            goto LABEL_21;
          }
        }
        v18 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
        if (v18)
          continue;
        break;
      }
    }
    a1 = 0;
LABEL_21:

  }
  return a1;
}

void __34__HMDSettingsController_configure__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (void *)MEMORY[0x1D17BA0A0]();
  v5 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138543362;
    v9 = v7;
    _os_log_impl(&dword_1CD062000, v6, OS_LOG_TYPE_INFO, "%{public}@Updated settings on configure.", (uint8_t *)&v8, 0xCu);

  }
  objc_autoreleasePoolPop(v4);

}

+ (id)logCategory
{
  if (logCategory__hmf_once_t0_78185 != -1)
    dispatch_once(&logCategory__hmf_once_t0_78185, &__block_literal_global_78186);
  return (id)logCategory__hmf_once_v1_78187;
}

void __36__HMDSettingsController_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v1_78187;
  logCategory__hmf_once_v1_78187 = v0;

}

@end
