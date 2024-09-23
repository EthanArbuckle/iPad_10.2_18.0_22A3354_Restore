@implementation HMDFetchedSettingsDriverHomePodSettings

- (HMDFetchedSettingsDriverHomePodSettings)initWithQueue:(id)a3 settingsObjectFactory:(id)a4
{
  id v7;
  id v8;
  HMDFetchedSettingsDriverHomePodSettings *v9;
  HMDFetchedSettingsDriverHomePodSettings *v10;
  uint64_t v11;
  HMDHPSAccessorySettingService *service;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)HMDFetchedSettingsDriverHomePodSettings;
  v9 = -[HMDFetchedSettingsDriverHomePodSettings init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_queue, a3);
    objc_msgSend(v8, "createHPSAccessorySettingServiceWithDelegate:", v10);
    v11 = objc_claimAutoreleasedReturnValue();
    service = v10->_service;
    v10->_service = (HMDHPSAccessorySettingService *)v11;

    objc_storeStrong((id *)&v10->_hmdhpsObjectFactory, a4);
  }

  return v10;
}

- (void)fetchSettingsForKeyPaths:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  HMDFetchedSettingsDriverHomePodSettings *v13;
  NSObject *v14;
  void *v15;
  NSObject *v16;
  id v17;
  _QWORD v18[4];
  id v19;
  _QWORD *v20;
  _QWORD *v21;
  _QWORD v22[4];
  NSObject *v23;
  _QWORD *v24;
  _QWORD *v25;
  _QWORD v26[5];
  id v27;
  _QWORD v28[5];
  id v29;
  uint8_t buf[4];
  void *v31;
  __int16 v32;
  id v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[HMDFetchedSettingsDriverHomePodSettings queue](self, "queue");
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v8);

  v28[0] = 0;
  v28[1] = v28;
  v28[2] = 0x3032000000;
  v28[3] = __Block_byref_object_copy__221910;
  v28[4] = __Block_byref_object_dispose__221911;
  v29 = (id)MEMORY[0x24BDBD1A8];
  v26[0] = 0;
  v26[1] = v26;
  v26[2] = 0x3032000000;
  v26[3] = __Block_byref_object_copy__221910;
  v26[4] = __Block_byref_object_dispose__221911;
  v27 = 0;
  v9 = dispatch_group_create();
  v10 = objc_msgSend(v6, "count");
  v11 = MEMORY[0x24BDAC760];
  if (v10)
  {
    v12 = (void *)MEMORY[0x227676638]();
    v13 = self;
    HMFGetOSLogHandle();
    v14 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v31 = v15;
      v32 = 2112;
      v33 = v6;
      _os_log_impl(&dword_2218F0000, v14, OS_LOG_TYPE_DEBUG, "%{public}@Fetching settings using local api keyPaths: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v12);
    dispatch_group_enter(v9);
    v22[0] = v11;
    v22[1] = 3221225472;
    v22[2] = __79__HMDFetchedSettingsDriverHomePodSettings_fetchSettingsForKeyPaths_completion___block_invoke;
    v22[3] = &unk_24E794FE0;
    v24 = v28;
    v25 = v26;
    v23 = v9;
    -[HMDFetchedSettingsDriverHomePodSettings _readSettingsAtKeyPaths:completion:](v13, "_readSettingsAtKeyPaths:completion:", v6, v22);

  }
  -[HMDFetchedSettingsDriverHomePodSettings queue](self, "queue");
  v16 = objc_claimAutoreleasedReturnValue();
  v18[0] = v11;
  v18[1] = 3221225472;
  v18[2] = __79__HMDFetchedSettingsDriverHomePodSettings_fetchSettingsForKeyPaths_completion___block_invoke_2;
  v18[3] = &unk_24E795008;
  v19 = v7;
  v20 = v28;
  v21 = v26;
  v17 = v7;
  dispatch_group_notify(v9, v16, v18);

  _Block_object_dispose(v26, 8);
  _Block_object_dispose(v28, 8);

}

- (void)updateSettingWithKeyPath:(id)a3 languageSettingValue:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  HMDFetchedSettingsDriverHomePodSettings *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  HMDFetchedSettingsDriverHomePodSettings *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  _QWORD v25[5];
  id v26;
  id v27;
  id v28;
  uint8_t buf[4];
  void *v30;
  __int16 v31;
  id v32;
  __int16 v33;
  id v34;
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[HMDFetchedSettingsDriverHomePodSettings queue](self, "queue");
  v11 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v11);

  v12 = (void *)MEMORY[0x227676638]();
  v13 = self;
  HMFGetOSLogHandle();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v30 = v15;
    v31 = 2114;
    v32 = v8;
    v33 = 2112;
    v34 = v9;
    _os_log_impl(&dword_2218F0000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@Updating %{public}@ to %@", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v12);
  -[HMDFetchedSettingsDriverHomePodSettings hmdhpsObjectFactory](v13, "hmdhpsObjectFactory");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDFetchedSettingsDriverHomePodSettings _hpLanguageValueFromLanguageValue:](v13, "_hpLanguageValueFromLanguageValue:", v9);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "createHPSSiriLanguageSettingWithKeyPath:languageValue:", v8, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    -[HMDFetchedSettingsDriverHomePodSettings queue](v13, "queue");
    v19 = objc_claimAutoreleasedReturnValue();
    v25[0] = MEMORY[0x24BDAC760];
    v25[1] = 3221225472;
    v25[2] = __100__HMDFetchedSettingsDriverHomePodSettings_updateSettingWithKeyPath_languageSettingValue_completion___block_invoke;
    v25[3] = &unk_24E79B3F0;
    v25[4] = v13;
    v26 = v18;
    v27 = v8;
    v28 = v10;
    dispatch_async(v19, v25);

  }
  else
  {
    v20 = (void *)MEMORY[0x227676638]();
    v21 = v13;
    HMFGetOSLogHandle();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v30 = v23;
      v31 = 2112;
      v32 = v9;
      _os_log_impl(&dword_2218F0000, v22, OS_LOG_TYPE_ERROR, "%{public}@Could not create homepod Setting from setting value %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v20);
    objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 2);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *))v10 + 2))(v10, v24);

  }
}

- (id)_hpLanguageValueFromLanguageValue:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int64_t v9;
  void *v10;
  void *v11;

  v4 = a3;
  -[HMDFetchedSettingsDriverHomePodSettings hmdhpsObjectFactory](self, "hmdhpsObjectFactory");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "inputLanguageCode");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "outputVoiceLanguageCode");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "outputVoiceGenderCode");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = +[HMDFetchedSettingsUtilities _outputGenderFromString:](HMDFetchedSettingsUtilities, "_outputGenderFromString:", v8);
  objc_msgSend(v4, "voiceName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "createHPSSiriLanguageValueWithRecognitionLanguage:outputLanguage:gender:voiceName:", v6, v7, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (void)updateSettingWithKeyPath:(id)a3 BOOLSettingValue:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, void *);
  NSObject *v11;
  void *v12;
  HMDFetchedSettingsDriverHomePodSettings *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  HMDFetchedSettingsDriverHomePodSettings *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  int v23;
  void *v24;
  __int16 v25;
  id v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, void *))a5;
  -[HMDFetchedSettingsDriverHomePodSettings queue](self, "queue");
  v11 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v11);

  v12 = (void *)MEMORY[0x227676638]();
  v13 = self;
  HMFGetOSLogHandle();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = 138543874;
    v24 = v15;
    v25 = 2114;
    v26 = v8;
    v27 = 2112;
    v28 = v9;
    _os_log_impl(&dword_2218F0000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@Updating %{public}@ to %@", (uint8_t *)&v23, 0x20u);

  }
  objc_autoreleasePoolPop(v12);
  -[HMDFetchedSettingsDriverHomePodSettings hmdhpsObjectFactory](v13, "hmdhpsObjectFactory");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "createHPSBooleanSettingWithKeyPath:BOOLeanValue:", v8, objc_msgSend(v9, "BOOLValue"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    -[HMDFetchedSettingsDriverHomePodSettings _writeSetting:keyPath:completion:](v13, "_writeSetting:keyPath:completion:", v17, v8, v10);
  }
  else
  {
    v18 = (void *)MEMORY[0x227676638]();
    v19 = v13;
    HMFGetOSLogHandle();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = 138543618;
      v24 = v21;
      v25 = 2112;
      v26 = v9;
      _os_log_impl(&dword_2218F0000, v20, OS_LOG_TYPE_ERROR, "%{public}@Could not create homepod Setting from setting value %@", (uint8_t *)&v23, 0x16u);

    }
    objc_autoreleasePoolPop(v18);
    objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 2);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v10[2](v10, v22);

  }
}

- (void)updateSettingWithKeyPath:(id)a3 integerSettingValue:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, void *);
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  HMDFetchedSettingsDriverHomePodSettings *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  HMDFetchedSettingsDriverHomePodSettings *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  int v27;
  void *v28;
  __int16 v29;
  id v30;
  __int16 v31;
  void *v32;
  __int16 v33;
  void *v34;
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, void *))a5;
  -[HMDFetchedSettingsDriverHomePodSettings queue](self, "queue");
  v11 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v11);

  v12 = (void *)MEMORY[0x24BDD7418];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v9, "integerValue"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "scaleDownNumberSettingValue:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = (void *)MEMORY[0x227676638]();
  v16 = self;
  HMFGetOSLogHandle();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v9, "integerValue"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = 138544130;
    v28 = v18;
    v29 = 2114;
    v30 = v8;
    v31 = 2112;
    v32 = v14;
    v33 = 2112;
    v34 = v19;
    _os_log_impl(&dword_2218F0000, v17, OS_LOG_TYPE_DEFAULT, "%{public}@Updating %{public}@ to %@ (integer value: %@)", (uint8_t *)&v27, 0x2Au);

  }
  objc_autoreleasePoolPop(v15);
  -[HMDFetchedSettingsDriverHomePodSettings hmdhpsObjectFactory](v16, "hmdhpsObjectFactory");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "createHPSNumberSettingWithKeyPath:numberValue:", v8, v14);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (v21)
  {
    -[HMDFetchedSettingsDriverHomePodSettings _writeSetting:keyPath:completion:](v16, "_writeSetting:keyPath:completion:", v21, v8, v10);
  }
  else
  {
    v22 = (void *)MEMORY[0x227676638]();
    v23 = v16;
    HMFGetOSLogHandle();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = 138543618;
      v28 = v25;
      v29 = 2112;
      v30 = v9;
      _os_log_impl(&dword_2218F0000, v24, OS_LOG_TYPE_ERROR, "%{public}@Could not create homepod Setting from setting value %@", (uint8_t *)&v27, 0x16u);

    }
    objc_autoreleasePoolPop(v22);
    objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 2);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v10[2](v10, v26);

  }
}

- (void)updateSettingWithKeyPath:(id)a3 primaryUserInfo:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, void *);
  NSObject *v11;
  void *v12;
  HMDFetchedSettingsDriverHomePodSettings *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  HMDFetchedSettingsDriverHomePodSettings *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  int v24;
  void *v25;
  __int16 v26;
  id v27;
  __int16 v28;
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, void *))a5;
  -[HMDFetchedSettingsDriverHomePodSettings queue](self, "queue");
  v11 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v11);

  v12 = (void *)MEMORY[0x227676638]();
  v13 = self;
  HMFGetOSLogHandle();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = 138543874;
    v25 = v15;
    v26 = 2114;
    v27 = v8;
    v28 = 2112;
    v29 = v9;
    _os_log_impl(&dword_2218F0000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@Updating Primary User setting %{public}@ to %@", (uint8_t *)&v24, 0x20u);

  }
  objc_autoreleasePoolPop(v12);
  objc_msgSend(v9, "uuidString");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDFetchedSettingsDriverHomePodSettings hmdhpsObjectFactory](v13, "hmdhpsObjectFactory");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "createHPSStringSettingWithKeyPath:stringValue:", v8, v16);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    -[HMDFetchedSettingsDriverHomePodSettings _writeSetting:keyPath:completion:](v13, "_writeSetting:keyPath:completion:", v18, v8, v10);
  }
  else
  {
    v19 = (void *)MEMORY[0x227676638]();
    v20 = v13;
    HMFGetOSLogHandle();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = 138543618;
      v25 = v22;
      v26 = 2112;
      v27 = v9;
      _os_log_impl(&dword_2218F0000, v21, OS_LOG_TYPE_ERROR, "%{public}@Could not create homepod Setting from setting value %@", (uint8_t *)&v24, 0x16u);

    }
    objc_autoreleasePoolPop(v19);
    objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 2);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v10[2](v10, v23);

  }
}

- (id)_transformToImmutableSetting:(id)a3
{
  id v4;
  id v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  HMDFetchedSettingsDriverHomePodSettings *v27;
  NSObject *v28;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  int v33;
  id v34;
  id v35;
  void *v36;
  void *v37;
  uint64_t v38;
  id v39;
  void *v40;
  void *v41;
  void *v42;
  HMDFetchedSettingsDriverHomePodSettings *v43;
  NSObject *v44;
  void *v45;
  int v47;
  void *v48;
  __int16 v49;
  uint64_t v50;
  __int16 v51;
  uint64_t v52;
  __int16 v53;
  uint64_t v54;
  __int16 v55;
  uint64_t v56;
  uint64_t v57;

  v57 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (+[HMDHPSAPIConformanceProviding objectRespondsToHPSBooleanSettingProtocolMethods:](HMDHPSAPIConformanceProviding, "objectRespondsToHPSBooleanSettingProtocolMethods:", v4)&& (v5 = v4) != 0)
  {
    v6 = v5;
    v7 = objc_alloc(MEMORY[0x24BDD74E0]);
    objc_msgSend(v6, "keyPath");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v7, "initWithKeyPath:readOnly:BOOLValue:", v8, 0, objc_msgSend(v6, "BOOLeanValue"));
  }
  else
  {
    if (+[HMDHPSAPIConformanceProviding objectRespondsToHPSConstrainedNumberSettingProtocolMethods:](HMDHPSAPIConformanceProviding, "objectRespondsToHPSConstrainedNumberSettingProtocolMethods:", v4))
    {
      v6 = v4;
      v10 = (void *)MEMORY[0x24BDD7418];
      objc_msgSend(v6, "numberValue");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "scaleUpNumberSettingValue:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "integerValue");

      v14 = (void *)MEMORY[0x24BDD7418];
      objc_msgSend(v6, "maximumValue");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "scaleUpNumberSettingValue:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "integerValue");

      v18 = (void *)MEMORY[0x24BDD7418];
      objc_msgSend(v6, "minimumValue");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "scaleUpNumberSettingValue:", v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v20, "integerValue");

      v22 = (void *)MEMORY[0x24BDD7418];
      objc_msgSend(v6, "stepValue");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "scaleUpNumberSettingValue:", v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = objc_msgSend(v24, "integerValue");

      v26 = (void *)MEMORY[0x227676638]();
      v27 = self;
      HMFGetOSLogHandle();
      v28 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v47 = 138544386;
        v48 = v29;
        v49 = 2048;
        v50 = v13;
        v51 = 2048;
        v52 = v17;
        v53 = 2048;
        v54 = v21;
        v55 = 2048;
        v56 = v25;
        _os_log_impl(&dword_2218F0000, v28, OS_LOG_TYPE_INFO, "%{public}@Transform constrained number setting (after scaling up) with value: %ld, max: %ld, min: %ld, step: %ld", (uint8_t *)&v47, 0x34u);

      }
      objc_autoreleasePoolPop(v26);
      v30 = objc_alloc(MEMORY[0x24BDD74E8]);
      objc_msgSend(v6, "keyPath");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = (void *)objc_msgSend(v30, "initWithKeyPath:readOnly:integerValue:maxValue:minValue:valueStepSize:", v31, 0, v13, v17, v21, v25);

      goto LABEL_9;
    }
    if (!+[HMDHPSAPIConformanceProviding objectRespondsToHPSSiriAvailableLanguagesProtocolMethods:](HMDHPSAPIConformanceProviding, "objectRespondsToHPSSiriAvailableLanguagesProtocolMethods:", v4)|| (objc_msgSend(v4, "keyPath"), v32 = (void *)objc_claimAutoreleasedReturnValue(), v33 = objc_msgSend(v32, "isEqual:", CFSTR("root.siri.availableLanguages")), v32, !v33)|| (v34 = v4) == 0)
    {
      if (+[HMDHPSAPIConformanceProviding objectRespondsToHPSSiriLanguageSettingProtocolMethods:](HMDHPSAPIConformanceProviding, "objectRespondsToHPSSiriLanguageSettingProtocolMethods:", v4))
      {
        v6 = v4;
        objc_msgSend(v6, "languageValue");
        v38 = objc_claimAutoreleasedReturnValue();
        v8 = (void *)v38;
        if (v6)
        {
          if (v38)
          {
            v39 = objc_alloc(MEMORY[0x24BDD7720]);
            objc_msgSend(v6, "keyPath");
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            +[HMDFetchedSettingsUtilities languageValueFromHPLanguageValue:](HMDFetchedSettingsUtilities, "languageValueFromHPLanguageValue:", v8);
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            v9 = (void *)objc_msgSend(v39, "initWithKeyPath:readOnly:languageValue:", v40, 0, v41);

            goto LABEL_4;
          }
          v42 = (void *)MEMORY[0x227676638]();
          v43 = self;
          HMFGetOSLogHandle();
          v44 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            v47 = 138543362;
            v48 = v45;
            _os_log_impl(&dword_2218F0000, v44, OS_LOG_TYPE_ERROR, "%{public}@Nil Language Value", (uint8_t *)&v47, 0xCu);

          }
          objc_autoreleasePoolPop(v42);
        }

      }
      v9 = 0;
      goto LABEL_23;
    }
    v6 = v34;
    v35 = objc_alloc(MEMORY[0x24BDD7728]);
    objc_msgSend(v6, "keyPath");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "languages");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    +[HMDFetchedSettingsUtilities transformHPLanguageItemsToLanguageListValue:](HMDFetchedSettingsUtilities, "transformHPLanguageItemsToLanguageListValue:", v36);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v35, "initWithKeyPath:readOnly:languageValues:", v8, 1, v37);

  }
LABEL_4:

LABEL_9:
LABEL_23:

  return v9;
}

- (id)_transformPreferredMediaUserEvent:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  HMDFetchedSettingsDriverHomePodSettings *v8;
  NSObject *v9;
  void *v10;
  int v12;
  void *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "stringValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD73B8]), "initWithUUIDString:selectionType:", v5, v5 != 0);
  v7 = (void *)MEMORY[0x227676638]();
  v8 = self;
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138543618;
    v13 = v10;
    v14 = 2112;
    v15 = v6;
    _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@Transform hpSetting to primaryUserInfo: %@", (uint8_t *)&v12, 0x16u);

  }
  objc_autoreleasePoolPop(v7);

  return v6;
}

- (void)_readSettingsAtKeyPaths:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  HMDFetchedSettingsDriverHomePodSettings *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  _QWORD v15[5];
  id v16;
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  id v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x227676638]();
  v9 = self;
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDFetchedSettingsDriverHomePodSettings service](v9, "service");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v18 = v11;
    v19 = 2114;
    v20 = v6;
    v21 = 2112;
    v22 = v12;
    _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@Fetch setting keyPaths: %{public}@ on service: %@", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v8);
  -[HMDFetchedSettingsDriverHomePodSettings service](v9, "service");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __78__HMDFetchedSettingsDriverHomePodSettings__readSettingsAtKeyPaths_completion___block_invoke;
  v15[3] = &unk_24E797D58;
  v15[4] = v9;
  v16 = v7;
  v14 = v7;
  objc_msgSend(v13, "settingsForKeyPaths:completionHandler:", v6, v15);

}

- (void)_processReadResults:(id)a3 error:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void *v10;
  HMDFetchedSettingsDriverHomePodSettings *v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  id v15;
  id v16;
  void *v17;
  id v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  HMDFetchedSettingsDriverHomePodSettings *v27;
  NSObject *v28;
  void *v29;
  HMDFetchedSettingsDriverHomePodSettings *v30;
  id v31;
  void *v32;
  id v33;
  void *v34;
  void (**v35)(id, void *, void *);
  id v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  uint8_t v44[128];
  uint8_t buf[4];
  void *v46;
  __int16 v47;
  id v48;
  __int16 v49;
  id v50;
  uint64_t v51;

  v51 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v35 = (void (**)(id, void *, void *))a5;
  v10 = (void *)MEMORY[0x227676638]();
  v11 = self;
  HMFGetOSLogHandle();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v46 = v13;
    v47 = 2112;
    v48 = v8;
    v49 = 2112;
    v50 = v9;
    _os_log_impl(&dword_2218F0000, v12, OS_LOG_TYPE_DEBUG, "%{public}@Fetched settings: %@, error: %@", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v10);
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = v9;
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  v16 = v8;
  v17 = (void *)v14;
  v18 = v16;
  v19 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
  v20 = v15;
  if (v19)
  {
    v21 = v19;
    v22 = *(_QWORD *)v41;
    v20 = v15;
    v36 = v18;
    v37 = *(_QWORD *)v41;
    do
    {
      v23 = 0;
      v38 = v21;
      do
      {
        if (*(_QWORD *)v41 != v22)
          objc_enumerationMutation(v18);
        objc_msgSend(*(id *)(*((_QWORD *)&v40 + 1) + 8 * v23), "setting");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        if (v24)
        {
          -[HMDFetchedSettingsDriverHomePodSettings _transformToImmutableSetting:](v11, "_transformToImmutableSetting:", v24);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          if (v25)
          {
            objc_msgSend(v17, "addObject:", v25);
          }
          else
          {
            v39 = v20;
            v26 = (void *)MEMORY[0x227676638]();
            v27 = v11;
            HMFGetOSLogHandle();
            v28 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
            {
              HMFGetLogIdentifier();
              v29 = v17;
              v30 = v11;
              v31 = v15;
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543618;
              v46 = v32;
              v47 = 2112;
              v48 = v24;
              _os_log_impl(&dword_2218F0000, v28, OS_LOG_TYPE_ERROR, "%{public}@Returned value %@ not of expected type.", buf, 0x16u);

              v15 = v31;
              v11 = v30;
              v17 = v29;
              v18 = v36;
            }

            objc_autoreleasePoolPop(v26);
            if (v15)
            {
              v33 = v15;
            }
            else
            {
              objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 2);
              v33 = (id)objc_claimAutoreleasedReturnValue();
            }
            v20 = v33;

            v22 = v37;
            v21 = v38;
          }

        }
        ++v23;
      }
      while (v21 != v23);
      v21 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
    }
    while (v21);
  }

  v34 = (void *)objc_msgSend(v17, "copy");
  v35[2](v35, v34, v20);

}

- (void)_writeSetting:(id)a3 keyPath:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  HMDFetchedSettingsDriverHomePodSettings *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  _QWORD v19[5];
  id v20;
  id v21;
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  id v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[HMDFetchedSettingsDriverHomePodSettings queue](self, "queue");
  v11 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v11);

  v12 = (void *)MEMORY[0x227676638]();
  v13 = self;
  HMFGetOSLogHandle();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v23 = v15;
    v24 = 2114;
    v25 = v9;
    v26 = 2112;
    v27 = v8;
    _os_log_impl(&dword_2218F0000, v14, OS_LOG_TYPE_DEBUG, "%{public}@Updating %{public}@ to %@", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v12);
  -[HMDFetchedSettingsDriverHomePodSettings service](v13, "service");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __76__HMDFetchedSettingsDriverHomePodSettings__writeSetting_keyPath_completion___block_invoke;
  v19[3] = &unk_24E795030;
  v19[4] = v13;
  v20 = v9;
  v21 = v10;
  v17 = v10;
  v18 = v9;
  objc_msgSend(v16, "updateSettingForKeyPath:setting:completionHandler:", v18, v8, v19);

}

- (void)languageValueListWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[HMDFetchedSettingsDriverHomePodSettings queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __75__HMDFetchedSettingsDriverHomePodSettings_languageValueListWithCompletion___block_invoke;
  v7[3] = &unk_24E79C2B8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (id)_languageValueList
{
  NSObject *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;

  -[HMDFetchedSettingsDriverHomePodSettings queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[HMDFetchedSettingsDriverHomePodSettings service](self, "service");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "settingForKeyPath:", CFSTR("root.siri.availableLanguages"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (+[HMDHPSAPIConformanceProviding objectRespondsToHPSSiriAvailableLanguagesProtocolMethods:](HMDHPSAPIConformanceProviding, "objectRespondsToHPSSiriAvailableLanguagesProtocolMethods:", v5))
  {
    v6 = v5;
  }
  else
  {
    v6 = 0;
  }
  objc_msgSend(v6, "languages");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMDFetchedSettingsUtilities transformHPLanguageItemsToLanguageListValue:](HMDFetchedSettingsUtilities, "transformHPLanguageItemsToLanguageListValue:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)didUpdateSetting:(id)a3 forKeyPath:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  -[HMDFetchedSettingsDriverHomePodSettings queue](self, "queue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __71__HMDFetchedSettingsDriverHomePodSettings_didUpdateSetting_forKeyPath___block_invoke;
  block[3] = &unk_24E79BBD0;
  block[4] = self;
  v12 = v7;
  v13 = v6;
  v9 = v6;
  v10 = v7;
  dispatch_async(v8, block);

}

- (void)didReconnect
{
  NSObject *v3;
  _QWORD block[5];

  -[HMDFetchedSettingsDriverHomePodSettings queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __55__HMDFetchedSettingsDriverHomePodSettings_didReconnect__block_invoke;
  block[3] = &unk_24E79C240;
  block[4] = self;
  dispatch_async(v3, block);

}

- (void)serviceDidInitializeForCurrentAccessory:(id)a3
{
  NSObject *v4;
  _QWORD block[5];

  -[HMDFetchedSettingsDriverHomePodSettings queue](self, "queue", a3);
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __83__HMDFetchedSettingsDriverHomePodSettings_serviceDidInitializeForCurrentAccessory___block_invoke;
  block[3] = &unk_24E79C240;
  block[4] = self;
  dispatch_async(v4, block);

}

- (HMDFetchedSettingsDriverDelegate)delegate
{
  return (HMDFetchedSettingsDriverDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (OS_dispatch_queue)queue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 16, 1);
}

- (HMDHPSAccessorySettingService)service
{
  return (HMDHPSAccessorySettingService *)objc_getProperty(self, a2, 24, 1);
}

- (HMDHPSSettingsObjectFactoryProtocol)hmdhpsObjectFactory
{
  return (HMDHPSSettingsObjectFactoryProtocol *)objc_getProperty(self, a2, 32, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hmdhpsObjectFactory, 0);
  objc_storeStrong((id *)&self->_service, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

void __83__HMDFetchedSettingsDriverHomePodSettings_serviceDidInitializeForCurrentAccessory___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x227676638]();
  v3 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138543362;
    v8 = v5;
    _os_log_impl(&dword_2218F0000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@homepod settings did initialize", (uint8_t *)&v7, 0xCu);

  }
  objc_autoreleasePoolPop(v2);
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "driverDidReload:", *(_QWORD *)(a1 + 32));

}

void __55__HMDFetchedSettingsDriverHomePodSettings_didReconnect__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x227676638]();
  v3 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138543362;
    v8 = v5;
    _os_log_impl(&dword_2218F0000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@homepod settings did reconnect", (uint8_t *)&v7, 0xCu);

  }
  objc_autoreleasePoolPop(v2);
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "driverDidReload:", *(_QWORD *)(a1 + 32));

}

void __71__HMDFetchedSettingsDriverHomePodSettings_didUpdateSetting_forKeyPath___block_invoke(uint64_t a1)
{
  void *v2;
  char v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;
  NSObject *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  id v19;
  NSObject *v20;
  void *v21;
  uint64_t v22;
  int v23;
  void *v24;
  __int16 v25;
  uint64_t v26;
  __int16 v27;
  void *v28;
  _QWORD v29[2];

  v29[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(*(id *)(a1 + 40), "isEqualToString:", CFSTR("root.home.primaryUser"));
  v4 = *(void **)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 48);
  if ((v3 & 1) != 0)
  {
    objc_msgSend(v4, "_transformPreferredMediaUserEvent:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)MEMORY[0x227676638]();
    v8 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = *(_QWORD *)(a1 + 40);
      v23 = 138543874;
      v24 = v10;
      v25 = 2114;
      v26 = v11;
      v27 = 2112;
      v28 = v6;
      _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@Got primaryUserInfo update for keyPath: %{public}@, %@", (uint8_t *)&v23, 0x20u);

    }
    objc_autoreleasePoolPop(v7);
    objc_msgSend(v2, "driver:didUpdatePrimaryUserInfo:", *(_QWORD *)(a1 + 32), v6);
  }
  else
  {
    objc_msgSend(v4, "_transformToImmutableSetting:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)MEMORY[0x227676638]();
    v13 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = *(_QWORD *)(a1 + 40);
      v23 = 138543618;
      v24 = v15;
      v25 = 2114;
      v26 = v16;
      _os_log_impl(&dword_2218F0000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@Got Setting Update for keyPath: %{public}@", (uint8_t *)&v23, 0x16u);

    }
    objc_autoreleasePoolPop(v12);
    if (v6)
    {
      v29[0] = v6;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v29, 1);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "driver:didUpdateSettings:", *(_QWORD *)(a1 + 32), v17);

    }
    else
    {
      v18 = (void *)MEMORY[0x227676638]();
      v19 = *(id *)(a1 + 32);
      HMFGetOSLogHandle();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = *(_QWORD *)(a1 + 48);
        v23 = 138543618;
        v24 = v21;
        v25 = 2112;
        v26 = v22;
        _os_log_impl(&dword_2218F0000, v20, OS_LOG_TYPE_ERROR, "%{public}@Unable to transform %@ to immutable setting", (uint8_t *)&v23, 0x16u);

      }
      objc_autoreleasePoolPop(v18);
      v6 = 0;
    }
  }

}

void __75__HMDFetchedSettingsDriverHomePodSettings_languageValueListWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "_languageValueList");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, _QWORD))(v1 + 16))(v1, v2, 0);

}

void __76__HMDFetchedSettingsDriverHomePodSettings__writeSetting_keyPath_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  int v12;
  void *v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  v7 = (void *)MEMORY[0x227676638]();
  v8 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = *(_QWORD *)(a1 + 40);
    v12 = 138543874;
    v13 = v10;
    v14 = 2114;
    v15 = v11;
    v16 = 2112;
    v17 = v6;
    _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@Update %{public}@ completion error: %@", (uint8_t *)&v12, 0x20u);

  }
  objc_autoreleasePoolPop(v7);
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

void __78__HMDFetchedSettingsDriverHomePodSettings__readSettingsAtKeyPaths_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[5];
  id v12;
  id v13;
  id v14;

  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v7 = objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __78__HMDFetchedSettingsDriverHomePodSettings__readSettingsAtKeyPaths_completion___block_invoke_2;
  v11[3] = &unk_24E79B3F0;
  v8 = *(void **)(a1 + 40);
  v11[4] = *(_QWORD *)(a1 + 32);
  v12 = v5;
  v13 = v6;
  v14 = v8;
  v9 = v6;
  v10 = v5;
  dispatch_async(v7, v11);

}

uint64_t __78__HMDFetchedSettingsDriverHomePodSettings__readSettingsAtKeyPaths_completion___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_processReadResults:error:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

uint64_t __100__HMDFetchedSettingsDriverHomePodSettings_updateSettingWithKeyPath_languageSettingValue_completion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_writeSetting:keyPath:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

void __79__HMDFetchedSettingsDriverHomePodSettings_fetchSettingsForKeyPaths_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v12 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;
  v11 = v6;

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

uint64_t __79__HMDFetchedSettingsDriverHomePodSettings_fetchSettingsForKeyPaths_completion___block_invoke_2(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[4] + 16))(a1[4], *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 40), *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40));
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t0_221918 != -1)
    dispatch_once(&logCategory__hmf_once_t0_221918, &__block_literal_global_221919);
  return (id)logCategory__hmf_once_v1_221920;
}

void __54__HMDFetchedSettingsDriverHomePodSettings_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v1_221920;
  logCategory__hmf_once_v1_221920 = v0;

}

@end
