@implementation HMLightProfile

- (HMLightProfileSettings)settings
{
  void *v2;
  void *v3;

  -[HMLightProfile lightProfile](self, "lightProfile");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "settings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (HMLightProfileSettings *)v3;
}

- (HMLightProfile)initWithLightProfile:(id)a3
{
  id v4;
  HMLightProfile *v5;
  void *v6;
  uint64_t v7;
  NSString *logIdentifier;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)HMLightProfile;
  v5 = -[HMAccessoryProfile initWithAccessoryProfile:](&v10, sel_initWithAccessoryProfile_, v4);
  if (v5)
  {
    objc_msgSend(v4, "profileUniqueIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "UUIDString");
    v7 = objc_claimAutoreleasedReturnValue();
    logIdentifier = v5->_logIdentifier;
    v5->_logIdentifier = (NSString *)v7;

  }
  return v5;
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void)updateSettings:(id)a3 withReason:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  HMLightProfile *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  _QWORD v20[5];
  id v21;
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  id v25;
  __int16 v26;
  void *v27;
  __int16 v28;
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[HMLightProfile lightProfile](self, "lightProfile");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "settings");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isEqual:", v6);

  if ((v10 & 1) == 0)
  {
    v11 = (void *)MEMORY[0x1A1AC1AAC]();
    v12 = self;
    HMFGetOSLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMLightProfile settings](v12, "settings");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v23 = v14;
      v24 = 2112;
      v25 = v7;
      v26 = 2112;
      v27 = v15;
      v28 = 2112;
      v29 = v6;
      _os_log_impl(&dword_19B1B0000, v13, OS_LOG_TYPE_INFO, "%{public}@Updating settings with reason: %@ (%@:%@)", buf, 0x2Au);

    }
    objc_autoreleasePoolPop(v11);
    -[HMLightProfile lightProfile](v12, "lightProfile");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setSettings:", v6);

    -[HMLightProfile lightProfile](v12, "lightProfile");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "context");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "delegateCaller");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __44__HMLightProfile_updateSettings_withReason___block_invoke;
    v20[3] = &unk_1E3AB5ED8;
    v20[4] = v12;
    v21 = v6;
    objc_msgSend(v19, "invokeBlock:", v20);

  }
}

uint64_t __31___HMLightProfile_lightProfile__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "lightProfile");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqual:", *(_QWORD *)(a1 + 32));

  return v4;
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
  HMLightProfile *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  char v21;
  void *v23;
  _QWORD v24[5];
  id v25;
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;

  if (v6)
  {
    objc_msgSend(v6, "settings");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMLightProfile settings](self, "settings");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "isEqual:", v7);

    if ((v9 & 1) == 0)
    {
      v10 = (void *)MEMORY[0x1A1AC1AAC]();
      v11 = self;
      HMFGetOSLogHandle();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMLightProfile lightProfile](v11, "lightProfile");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "settings");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "settings");
        v23 = v10;
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v27 = v13;
        v28 = 2112;
        v29 = v15;
        v30 = 2112;
        v31 = v16;
        _os_log_impl(&dword_19B1B0000, v12, OS_LOG_TYPE_INFO, "%{public}@Updating settings because of merge: %@ to %@ ", buf, 0x20u);

        v10 = v23;
      }

      objc_autoreleasePoolPop(v10);
      -[HMLightProfile lightProfile](v11, "lightProfile");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setSettings:", v7);

      -[HMLightProfile lightProfile](v11, "lightProfile");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "context");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "delegateCaller");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v24[0] = MEMORY[0x1E0C809B0];
      v24[1] = 3221225472;
      v24[2] = __37__HMLightProfile_mergeFromNewObject___block_invoke;
      v24[3] = &unk_1E3AB5ED8;
      v24[4] = v11;
      v25 = v7;
      objc_msgSend(v20, "invokeBlock:", v24);

    }
    v21 = v9 ^ 1;

  }
  else
  {
    v21 = 0;
  }

  return v21;
}

- (void)setNaturalLightingEnabled:(BOOL)a3 completionHandler:(id)a4
{
  -[HMLightProfile setNaturalLightingEnabled:shouldRetryOnFailure:completion:](self, "setNaturalLightingEnabled:shouldRetryOnFailure:completion:", a3, 0, a4);
}

- (void)setNaturalLightingEnabled:(BOOL)a3 shouldRetryOnFailure:(BOOL)a4 completion:(id)a5
{
  _BOOL8 v5;
  _BOOL8 v6;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  HMLightProfile *v20;
  NSObject *v21;
  void *v22;
  char *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  HMLightProfile *v28;
  NSObject *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  HMLightProfile *v33;
  NSObject *v34;
  void *v35;
  id v36;
  _QWORD v37[5];
  id v38;
  id v39;
  _QWORD v40[2];
  _QWORD v41[2];
  uint8_t buf[4];
  void *v43;
  __int16 v44;
  const char *v45;
  uint64_t v46;

  v5 = a4;
  v6 = a3;
  v46 = *MEMORY[0x1E0C80C00];
  v8 = a5;
  -[HMLightProfile lightProfile](self, "lightProfile");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "context");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s: %@ cannot be nil"), "-[HMLightProfile setNaturalLightingEnabled:shouldRetryOnFailure:completion:]", CFSTR("completion"));
    v31 = objc_claimAutoreleasedReturnValue();
    v32 = (void *)MEMORY[0x1A1AC1AAC]();
    v33 = self;
    HMFGetOSLogHandle();
    v34 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v43 = v35;
      v44 = 2112;
      v45 = (const char *)v31;
      _os_log_impl(&dword_19B1B0000, v34, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v32);
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], v31, 0);
    v36 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v36);
  }
  if (v10)
  {
    v11 = objc_alloc(MEMORY[0x1E0D285D8]);
    -[HMLightProfile lightProfile](self, "lightProfile");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "profileUniqueIdentifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(v11, "initWithTarget:", v13);

    v40[0] = CFSTR("HMLightProfile.snlemk");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v6);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v40[1] = CFSTR("HMLightProfile.snlesrofk");
    v41[0] = v15;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v5);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v41[1] = v16;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v41, v40, 2);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0D285F8], "messageWithName:destination:payload:", CFSTR("HMLightProfile.snlem"), v14, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (void *)MEMORY[0x1A1AC1AAC]();
    v20 = self;
    HMFGetOSLogHandle();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      HMFEnabledStatusToString();
      v23 = (char *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v43 = v22;
      v44 = 2112;
      v45 = v23;
      _os_log_impl(&dword_19B1B0000, v21, OS_LOG_TYPE_INFO, "%{public}@Setting Natural Lighting to: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v19);
    v37[0] = MEMORY[0x1E0C809B0];
    v37[1] = 3221225472;
    v37[2] = __76__HMLightProfile_setNaturalLightingEnabled_shouldRetryOnFailure_completion___block_invoke;
    v37[3] = &unk_1E3AB60C8;
    v37[4] = v20;
    v38 = v10;
    v39 = v8;
    objc_msgSend(v18, "setResponseHandler:", v37);
    -[HMLightProfile lightProfile](v20, "lightProfile");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "context");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "messageDispatcher");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "sendMessage:", v18);

  }
  else
  {
    v27 = (void *)MEMORY[0x1A1AC1AAC]();
    v28 = self;
    HMFGetOSLogHandle();
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v43 = v30;
      v44 = 2080;
      v45 = "-[HMLightProfile setNaturalLightingEnabled:shouldRetryOnFailure:completion:]";
      _os_log_impl(&dword_19B1B0000, v29, OS_LOG_TYPE_ERROR, "%{public}@Nil context, invoking completion - %s", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v27);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *))v8 + 2))(v8, v14);
  }

}

- (void)fetchNaturalLightColorTemperatureForBrightness:(int64_t)a3 completion:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  HMLightProfile *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  HMLightProfile *v24;
  NSObject *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  HMLightProfile *v29;
  NSObject *v30;
  void *v31;
  id v32;
  _QWORD v33[5];
  id v34;
  id v35;
  const __CFString *v36;
  void *v37;
  uint8_t buf[4];
  void *v39;
  __int16 v40;
  const char *v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  -[HMLightProfile lightProfile](self, "lightProfile");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "context");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s: %@ cannot be nil"), "-[HMLightProfile fetchNaturalLightColorTemperatureForBrightness:completion:]", CFSTR("completion"));
    v27 = objc_claimAutoreleasedReturnValue();
    v28 = (void *)MEMORY[0x1A1AC1AAC]();
    v29 = self;
    HMFGetOSLogHandle();
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v39 = v31;
      v40 = 2112;
      v41 = (const char *)v27;
      _os_log_impl(&dword_19B1B0000, v30, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v28);
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], v27, 0);
    v32 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v32);
  }
  if (v8)
  {
    v9 = objc_alloc(MEMORY[0x1E0D285D8]);
    -[HMLightProfile lightProfile](self, "lightProfile");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "profileUniqueIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(v9, "initWithTarget:", v11);

    v36 = CFSTR("HMLightProfile.bmk");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = v13;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v37, &v36, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0D285F8], "messageWithName:destination:payload:", CFSTR("HMLightProfile.fnlctfbm"), v12, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)MEMORY[0x1A1AC1AAC]();
    v17 = self;
    HMFGetOSLogHandle();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v39 = v19;
      v40 = 2048;
      v41 = (const char *)a3;
      _os_log_impl(&dword_19B1B0000, v18, OS_LOG_TYPE_INFO, "%{public}@Fetching natural lighting color temperature for brightness: %lu", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v16);
    v33[0] = MEMORY[0x1E0C809B0];
    v33[1] = 3221225472;
    v33[2] = __76__HMLightProfile_fetchNaturalLightColorTemperatureForBrightness_completion___block_invoke;
    v33[3] = &unk_1E3AB60C8;
    v33[4] = v17;
    v34 = v8;
    v35 = v6;
    objc_msgSend(v15, "setResponseHandler:", v33);
    -[HMLightProfile lightProfile](v17, "lightProfile");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "context");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "messageDispatcher");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "sendMessage:", v15);

  }
  else
  {
    v23 = (void *)MEMORY[0x1A1AC1AAC]();
    v24 = self;
    HMFGetOSLogHandle();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v39 = v26;
      v40 = 2080;
      v41 = "-[HMLightProfile fetchNaturalLightColorTemperatureForBrightness:completion:]";
      _os_log_impl(&dword_19B1B0000, v25, OS_LOG_TYPE_ERROR, "%{public}@Nil context, invoking completion - %s", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v23);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 12);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v6 + 2))(v6, 0, v12);
  }

}

- (void)fetchSettingsWithCompletion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  HMLightProfile *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  HMLightProfile *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  HMLightProfile *v22;
  NSObject *v23;
  void *v24;
  id v25;
  _QWORD v26[5];
  id v27;
  id v28;
  uint8_t buf[4];
  void *v30;
  __int16 v31;
  const char *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HMLightProfile lightProfile](self, "lightProfile");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "context");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s: %@ cannot be nil"), "-[HMLightProfile fetchSettingsWithCompletion:]", CFSTR("completion"));
    v20 = objc_claimAutoreleasedReturnValue();
    v21 = (void *)MEMORY[0x1A1AC1AAC]();
    v22 = self;
    HMFGetOSLogHandle();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v30 = v24;
      v31 = 2112;
      v32 = (const char *)v20;
      _os_log_impl(&dword_19B1B0000, v23, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v21);
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], v20, 0);
    v25 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v25);
  }
  if (v6)
  {
    -[HMAccessoryProfile accessory](self, "accessory");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "home");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", self);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v26[0] = MEMORY[0x1E0C809B0];
      v26[1] = 3221225472;
      v26[2] = __46__HMLightProfile_fetchSettingsWithCompletion___block_invoke;
      v26[3] = &unk_1E3AB5DD0;
      v26[4] = self;
      v27 = v6;
      v28 = v4;
      objc_msgSend(v8, "fetchSettingsForLightProfiles:withCompletion:", v9, v26);

    }
    else
    {
      v14 = (void *)MEMORY[0x1A1AC1AAC]();
      v15 = self;
      HMFGetOSLogHandle();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v30 = v17;
        _os_log_impl(&dword_19B1B0000, v16, OS_LOG_TYPE_ERROR, "%{public}@Home is not set on light profile accessory", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v14);
      objc_msgSend(v6, "delegateCaller");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 21);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "callCompletion:obj:error:", v4, 0, v19);

      v8 = 0;
    }
  }
  else
  {
    v10 = (void *)MEMORY[0x1A1AC1AAC]();
    v11 = self;
    HMFGetOSLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v30 = v13;
      v31 = 2080;
      v32 = "-[HMLightProfile fetchSettingsWithCompletion:]";
      _os_log_impl(&dword_19B1B0000, v12, OS_LOG_TYPE_ERROR, "%{public}@Nil context, invoking completion - %s", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v10);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 12);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v4 + 2))(v4, 0, v8);
  }

}

- (HMLightProfileDelegate)delegate
{
  return (HMLightProfileDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (NSString)logIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_logIdentifier, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

void __46__HMLightProfile_fetchSettingsWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  id v17;

  v17 = a3;
  objc_msgSend(a2, "objectForKey:", *(_QWORD *)(a1 + 32));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "settings");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(*(id *)(a1 + 40), "delegateCaller");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = *(_QWORD *)(a1 + 48);
    objc_msgSend(v5, "settings");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v7;
    v11 = v8;
    v12 = v9;
    v13 = 0;
  }
  else
  {
    objc_msgSend(v5, "error");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 40), "delegateCaller");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v15;
    v16 = *(_QWORD *)(a1 + 48);
    if (!v14)
    {
      objc_msgSend(v15, "callCompletion:obj:error:", v16, 0, v17);
      goto LABEL_6;
    }
    objc_msgSend(v5, "error");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v7;
    v11 = v16;
    v12 = 0;
    v13 = v9;
  }
  objc_msgSend(v10, "callCompletion:obj:error:", v11, v12, v13);

LABEL_6:
}

void __76__HMLightProfile_fetchNaturalLightColorTemperatureForBrightness_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
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
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  objc_msgSend(v6, "hmf_numberForKey:", CFSTR("HMLightProfile.ctmk"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    v8 = (void *)MEMORY[0x1A1AC1AAC]();
    v9 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138543874;
      v14 = v11;
      v15 = 2112;
      v16 = v6;
      v17 = 2112;
      v18 = v5;
      _os_log_impl(&dword_19B1B0000, v10, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch natural lighting color temperature %@:%@", (uint8_t *)&v13, 0x20u);

    }
    objc_autoreleasePoolPop(v8);
  }
  objc_msgSend(*(id *)(a1 + 40), "delegateCaller");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "callCompletion:obj:error:", *(_QWORD *)(a1 + 48), v7, v5);

}

void __76__HMLightProfile_setNaturalLightingEnabled_shouldRetryOnFailure_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  NSObject *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  id v17;
  NSObject *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  id v23;
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "hmf_dataForKey:", CFSTR("hmlp.sck"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = 0;
    objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v8, &v23);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v23;
    v11 = (void *)MEMORY[0x1A1AC1AAC]();
    v12 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (v9)
    {
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v25 = v15;
        v26 = 2112;
        v27 = v9;
        _os_log_impl(&dword_19B1B0000, v14, OS_LOG_TYPE_INFO, "%{public}@Successfully updated settings to: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v11);
      objc_msgSend(*(id *)(a1 + 32), "updateSettings:withReason:", v9, CFSTR("HMLightProfile.snlem"));
    }
    else
    {
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v25 = v20;
        v26 = 2112;
        v27 = v10;
        _os_log_impl(&dword_19B1B0000, v14, OS_LOG_TYPE_ERROR, "%{public}@Failed to decode light profile settings: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v11);
      v21 = v10;

      v5 = v21;
    }

  }
  else
  {
    v16 = (void *)MEMORY[0x1A1AC1AAC]();
    v17 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v25 = v19;
      v26 = 2112;
      v27 = v5;
      _os_log_impl(&dword_19B1B0000, v18, OS_LOG_TYPE_ERROR, "%{public}@Failed to update the natural light setting: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v16);
  }
  objc_msgSend(*(id *)(a1 + 40), "delegateCaller");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "callCompletion:error:", *(_QWORD *)(a1 + 48), v5);

}

void __44__HMLightProfile_updateSettings_withReason___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lightProfile:didUpdateSettings:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

void __37__HMLightProfile_mergeFromNewObject___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lightProfile:didUpdateSettings:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

+ (id)logCategory
{
  if (logCategory__hmf_once_t16_55653 != -1)
    dispatch_once(&logCategory__hmf_once_t16_55653, &__block_literal_global_55654);
  return (id)logCategory__hmf_once_v17_55655;
}

void __29__HMLightProfile_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v17_55655;
  logCategory__hmf_once_v17_55655 = v0;

}

@end
