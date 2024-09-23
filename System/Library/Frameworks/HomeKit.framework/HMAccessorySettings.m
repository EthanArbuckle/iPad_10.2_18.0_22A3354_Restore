@implementation HMAccessorySettings

- (HMAccessorySettings)initWithSettingsContainer:(id)a3 settingsControl:(id)a4 rootGroup:(id)a5
{
  id v8;
  id v9;
  id v10;
  HMAccessorySettings *v11;
  HMAccessorySettings *v12;
  objc_super v14;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)HMAccessorySettings;
  v11 = -[HMAccessorySettings init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeWeak((id *)&v11->_settingsContainerInternal, v8);
    objc_storeWeak((id *)&v12->_settingsControl, v9);
    objc_storeStrong((id *)&v12->_rootGroup, a5);
  }

  return v12;
}

- (void)_configureWithContext:(id)a3
{
  id v5;
  void *v6;
  id v7;

  objc_storeStrong((id *)&self->_context, a3);
  v5 = a3;
  -[HMAccessorySettings rootGroup](self, "rootGroup");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "internal");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "configureWithAccessorySettings:context:", self, v5);

}

- (HMAccessory)accessory
{
  void *v2;
  void *v3;
  id v4;

  -[HMAccessorySettings settingsContainer](self, "settingsContainer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;

  return (HMAccessory *)v4;
}

- (HMAccessorySettingsContainerInternal)settingsContainerInternal
{
  os_unfair_lock_s *p_lock;
  id WeakRetained;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  WeakRetained = objc_loadWeakRetained((id *)&self->_settingsContainerInternal);
  os_unfair_lock_unlock(p_lock);
  return (HMAccessorySettingsContainerInternal *)WeakRetained;
}

- (void)setSettingsContainerInternal:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;

  p_lock = &self->_lock;
  v5 = a3;
  os_unfair_lock_lock_with_options();
  objc_storeWeak((id *)&self->_settingsContainerInternal, v5);

  os_unfair_lock_unlock(p_lock);
}

- (HMControllable)settingsControl
{
  os_unfair_lock_s *p_lock;
  id WeakRetained;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  WeakRetained = objc_loadWeakRetained((id *)&self->_settingsControl);
  os_unfair_lock_unlock(p_lock);
  return (HMControllable *)WeakRetained;
}

- (void)setSettingsControl:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;

  p_lock = &self->_lock;
  v5 = a3;
  os_unfair_lock_lock_with_options();
  objc_storeWeak((id *)&self->_settingsControl, v5);

  os_unfair_lock_unlock(p_lock);
}

- (void)setDelegate:(id)a3
{
  id v4;
  void *v5;
  HMAccessorySettings *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  id v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)MEMORY[0x1A1AC1AAC]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMAccessorySettings rootGroup](v6, "rootGroup");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMAccessorySettings settingsContainer](v6, "settingsContainer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138544130;
    v12 = v8;
    v13 = 2112;
    v14 = v4;
    v15 = 2112;
    v16 = v9;
    v17 = 2112;
    v18 = v10;
    _os_log_impl(&dword_19B1B0000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@Setting delegate %@ on settings %@ for %@", (uint8_t *)&v11, 0x2Au);

  }
  objc_autoreleasePoolPop(v5);
  objc_storeWeak((id *)&v6->_delegate, v4);

}

- (HMAccessorySettingsDelegate)delegate
{
  return (HMAccessorySettingsDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (BOOL)isControllable
{
  void *v2;
  char v3;

  -[HMAccessorySettings settingsControl](self, "settingsControl");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isControllable");

  return v3;
}

- (void)_updateSettingsWithBlock:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  _QWORD *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  HMAccessorySettings *v13;
  NSObject *v14;
  _BOOL4 v15;
  void *v16;
  void *v17;
  _QWORD v18[2];
  void (*v19)(uint64_t);
  void *v20;
  HMAccessorySettings *v21;
  id v22;
  id location;
  __int128 buf;
  void (*v25)(uint64_t);
  void *v26;
  _QWORD *v27;
  id v28[3];

  v28[2] = *(id *)MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = MEMORY[0x1E0C809B0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v19 = __48__HMAccessorySettings__updateSettingsWithBlock___block_invoke;
  v20 = &unk_1E3AB60A0;
  v21 = self;
  v22 = v4;
  v6 = v4;
  v7 = v18;
  if (self)
  {
    -[HMAccessorySettings rootGroup](self, "rootGroup");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "internal");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "context");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "delegateCaller");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = (void *)MEMORY[0x1A1AC1AAC]();
    v13 = self;
    HMFGetOSLogHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
    if (v11)
    {
      if (v15)
      {
        HMFGetLogIdentifier();
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(buf) = 138543362;
        *(_QWORD *)((char *)&buf + 4) = v16;
        _os_log_impl(&dword_19B1B0000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@Starting update", (uint8_t *)&buf, 0xCu);

      }
      objc_autoreleasePoolPop(v12);
      objc_initWeak(&location, v13);
      *(_QWORD *)&buf = v5;
      *((_QWORD *)&buf + 1) = 3221225472;
      v25 = __79__HMAccessorySettings___notifyDelegateSettingsWillUpdateWithCompletionHandler___block_invoke;
      v26 = &unk_1E3AB1BC8;
      objc_copyWeak(v28, &location);
      v27 = v7;
      objc_msgSend(v11, "invokeBlock:", &buf);

      objc_destroyWeak(v28);
      objc_destroyWeak(&location);
    }
    else
    {
      if (v15)
      {
        HMFGetLogIdentifier();
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(buf) = 138543362;
        *(_QWORD *)((char *)&buf + 4) = v17;
        _os_log_impl(&dword_19B1B0000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@Missing delegate caller, not invoking delegate for updating settings", (uint8_t *)&buf, 0xCu);

      }
      objc_autoreleasePoolPop(v12);
      v19((uint64_t)v7);
    }

  }
}

- (void)_notifyDelegateDidUpdateKeyPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  HMAccessorySettings *v10;
  NSObject *v11;
  _BOOL4 v12;
  void *v13;
  void *v14;
  _QWORD v15[4];
  id v16;
  id v17;
  uint8_t buf[4];
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HMAccessorySettings rootGroup](self, "rootGroup");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "internal");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "context");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "delegateCaller");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)MEMORY[0x1A1AC1AAC]();
  v10 = self;
  HMFGetOSLogHandle();
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
  if (v8)
  {
    if (v12)
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v19 = v13;
      _os_log_impl(&dword_19B1B0000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@Finished update", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v9);
    objc_initWeak((id *)buf, v10);
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __55__HMAccessorySettings__notifyDelegateDidUpdateKeyPath___block_invoke;
    v15[3] = &unk_1E3AB6240;
    objc_copyWeak(&v17, (id *)buf);
    v16 = v4;
    objc_msgSend(v8, "invokeBlock:", v15);

    objc_destroyWeak(&v17);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    if (v12)
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v19 = v14;
      _os_log_impl(&dword_19B1B0000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@Missing delegate caller, not invoking delegate for updated settings", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v9);
  }

}

- (NSUUID)uniqueIdentifier
{
  return 0;
}

- (BOOL)mergeFromNewObject:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  char v11;
  char v12;
  _QWORD v14[4];
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;
  id v20;
  id location;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;

  if (v6)
  {
    -[HMAccessorySettings rootGroup](self, "rootGroup");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "rootGroup");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v7, "isEqual:", v8);

    if ((v9 & 1) == 0)
    {
      objc_initWeak(&location, self);
      v17[0] = MEMORY[0x1E0C809B0];
      v17[1] = 3221225472;
      v17[2] = __42__HMAccessorySettings_mergeFromNewObject___block_invoke;
      v17[3] = &unk_1E3AB6268;
      objc_copyWeak(&v20, &location);
      v18 = v7;
      v19 = v6;
      -[HMAccessorySettings _updateSettingsWithBlock:](self, "_updateSettingsWithBlock:", v17);

      objc_destroyWeak(&v20);
      objc_destroyWeak(&location);
    }
    objc_msgSend(v6, "rootGroup");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v7, "isReflectedEqual:", v10);

    if ((v11 & 1) != 0)
    {
      v12 = v9 ^ 1;
    }
    else
    {
      v14[0] = MEMORY[0x1E0C809B0];
      v14[1] = 3221225472;
      v14[2] = __42__HMAccessorySettings_mergeFromNewObject___block_invoke_19;
      v14[3] = &unk_1E3AB5ED8;
      v15 = v7;
      v16 = v6;
      -[HMAccessorySettings _updateSettingsWithBlock:](self, "_updateSettingsWithBlock:", v14);

      v12 = 1;
    }

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (HMAccessorySettingGroup)rootGroup
{
  return (HMAccessorySettingGroup *)objc_getProperty(self, a2, 48, 1);
}

- (_HMContext)context
{
  return self->_context;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_rootGroup, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_settingsContainerInternal);
  objc_destroyWeak((id *)&self->_settingsControl);
}

void __42__HMAccessorySettings_mergeFromNewObject___block_invoke(id *a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  char v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  int v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained(a1 + 6);
  objc_msgSend(a1[4], "internal");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1[5], "rootGroup");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "internal");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v3, "mergeObject:", v5);

  if ((v6 & 1) == 0)
  {
    v7 = (void *)MEMORY[0x1A1AC1AAC]();
    v8 = WeakRetained;
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138543362;
      v12 = v10;
      _os_log_impl(&dword_19B1B0000, v9, OS_LOG_TYPE_INFO, "%{public}@The merge unexpectedly did not result in a change.", (uint8_t *)&v11, 0xCu);

    }
    objc_autoreleasePoolPop(v7);
  }

}

void __42__HMAccessorySettings_mergeFromNewObject___block_invoke_19(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "rootGroup");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "mergeReflected:", v2);

}

void __55__HMAccessorySettings__notifyDelegateDidUpdateKeyPath___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  __int16 v15;
  id v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v4 = (void *)MEMORY[0x1A1AC1AAC]();
    v5 = WeakRetained;
    HMFGetOSLogHandle();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "accessory");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "uniqueIdentifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = *(_QWORD *)(a1 + 32);
      v13 = 138544130;
      v14 = v7;
      v15 = 2112;
      v16 = v5;
      v17 = 2112;
      v18 = v9;
      v19 = 2112;
      v20 = v10;
      _os_log_impl(&dword_19B1B0000, v6, OS_LOG_TYPE_INFO, "%{public}@Notifying clients settings: %@ didUpdateForIdentifier: %@ keyPath: %@", (uint8_t *)&v13, 0x2Au);

    }
    objc_autoreleasePoolPop(v4);
    objc_msgSend(v5, "accessory");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "uniqueIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "settings:didUpdateForIdentifier:keyPath:", v5, v12, *(_QWORD *)(a1 + 32));

  }
}

void __48__HMAccessorySettings__updateSettingsWithBlock___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  NSObject *v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  NSObject *v18;
  void *v19;
  id location;
  _BYTE buf[24];
  void *v22;
  id v23;
  id v24[3];

  v24[2] = *(id *)MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 40);
  if (v2)
    (*(void (**)(void))(v2 + 16))();
  v3 = *(void **)(a1 + 32);
  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "rootGroup");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "internal");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "context");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "delegateCaller");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      objc_msgSend(v3, "rootGroup");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "internal");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "identifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      v11 = (void *)MEMORY[0x1A1AC1AAC]();
      v12 = v3;
      HMFGetOSLogHandle();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        HMFGetLogIdentifier();
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        *(_QWORD *)&buf[4] = v14;
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v10;
        _os_log_impl(&dword_19B1B0000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@%@: Finished update", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v11);
      objc_initWeak(&location, v12);
      *(_QWORD *)buf = MEMORY[0x1E0C809B0];
      *(_QWORD *)&buf[8] = 3221225472;
      *(_QWORD *)&buf[16] = __56__HMAccessorySettings___notifyDelegateSettingsDidUpdate__block_invoke;
      v22 = &unk_1E3AB6240;
      objc_copyWeak(v24, &location);
      v15 = v10;
      v23 = v15;
      objc_msgSend(v7, "invokeBlock:", buf);

      objc_destroyWeak(v24);
      objc_destroyWeak(&location);

    }
    else
    {
      v16 = (void *)MEMORY[0x1A1AC1AAC]();
      v17 = v3;
      HMFGetOSLogHandle();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        HMFGetLogIdentifier();
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        *(_QWORD *)&buf[4] = v19;
        _os_log_impl(&dword_19B1B0000, v18, OS_LOG_TYPE_DEFAULT, "%{public}@Missing delegate caller, not invoking delegate for updated settings", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v16);
    }

  }
}

void __79__HMAccessorySettings___notifyDelegateSettingsWillUpdateWithCompletionHandler___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  int v9;
  void *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v4 = (void *)MEMORY[0x1A1AC1AAC]();
    v5 = WeakRetained;
    HMFGetOSLogHandle();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138543618;
      v10 = v7;
      v11 = 2112;
      v12 = v5;
      _os_log_impl(&dword_19B1B0000, v6, OS_LOG_TYPE_INFO, "%{public}@Notifying clients settings will update: %@", (uint8_t *)&v9, 0x16u);

    }
    objc_autoreleasePoolPop(v4);
    objc_msgSend(v3, "settingsWillUpdate:", v5);
  }
  v8 = *(_QWORD *)(a1 + 32);
  if (v8)
    (*(void (**)(void))(v8 + 16))();

}

void __56__HMAccessorySettings___notifyDelegateSettingsDidUpdate__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v4 = (void *)MEMORY[0x1A1AC1AAC]();
    v5 = WeakRetained;
    HMFGetOSLogHandle();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138543618;
      v14 = v7;
      v15 = 2112;
      v16 = v5;
      _os_log_impl(&dword_19B1B0000, v6, OS_LOG_TYPE_INFO, "%{public}@Notifying clients settings did update: %@", (uint8_t *)&v13, 0x16u);

    }
    objc_autoreleasePoolPop(v4);
    objc_msgSend(v3, "settingsDidUpdate:", v5);
  }
  else if (v3)
  {
    v8 = (void *)MEMORY[0x1A1AC1AAC]();
    v9 = WeakRetained;
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = *(void **)(a1 + 32);
      v13 = 138543618;
      v14 = v11;
      v15 = 2112;
      v16 = v12;
      _os_log_impl(&dword_19B1B0000, v10, OS_LOG_TYPE_INFO, "%{public}@%@: Delegate does not implement settingsDidUpdate:", (uint8_t *)&v13, 0x16u);

    }
    objc_autoreleasePoolPop(v8);
  }

}

+ (id)localizationKeyForKeyPath:(id)a3
{
  void *v3;
  void *v4;

  v3 = (void *)objc_msgSend(a3, "mutableCopy");
  objc_msgSend(v3, "replaceOccurrencesOfString:withString:options:range:", CFSTR(" "), &stru_1E3AB7688, 1, 0, objc_msgSend(v3, "length"));
  objc_msgSend(v3, "replaceOccurrencesOfString:withString:options:range:", CFSTR("."), CFSTR("_"), 1, 0, objc_msgSend(v3, "length"));
  objc_msgSend(v3, "uppercaseString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t16 != -1)
    dispatch_once(&logCategory__hmf_once_t16, &__block_literal_global_26783);
  return (id)logCategory__hmf_once_v17;
}

void __34__HMAccessorySettings_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v17;
  logCategory__hmf_once_v17 = v0;

}

@end
