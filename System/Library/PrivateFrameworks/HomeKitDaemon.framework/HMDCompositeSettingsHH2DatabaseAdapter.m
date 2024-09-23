@implementation HMDCompositeSettingsHH2DatabaseAdapter

- (HMDCompositeSettingsHH2DatabaseAdapter)initWithAccessory:(id)a3 homeID:(id)a4 workingManagedObjectContext:(id)a5 queue:(id)a6 notificationCenter:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  HMDCompositeSettingsHH2DatabaseAdapter *v17;
  HMDCompositeSettingsHH2DatabaseAdapter *v18;
  NSString *strongRawDatabase;
  uint64_t v20;
  NSUUID *accessoryID;
  objc_super v23;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v23.receiver = self;
  v23.super_class = (Class)HMDCompositeSettingsHH2DatabaseAdapter;
  v17 = -[HMDCompositeSettingsHH2DatabaseAdapter init](&v23, sel_init);
  v18 = v17;
  if (v17)
  {
    strongRawDatabase = v17->_strongRawDatabase;
    v17->_strongRawDatabase = (NSString *)CFSTR("db");

    objc_storeWeak(&v18->_rawDatabase, v18->_strongRawDatabase);
    objc_msgSend(v12, "uuid");
    v20 = objc_claimAutoreleasedReturnValue();
    accessoryID = v18->_accessoryID;
    v18->_accessoryID = (NSUUID *)v20;

    objc_storeStrong((id *)&v18->_homeID, a4);
    objc_storeStrong((id *)&v18->_context, a5);
    objc_storeStrong((id *)&v18->_queue, a6);
    objc_msgSend(v16, "addObserver:selector:name:object:", v18, sel__handleAccessoryUpdateTransaction_, CFSTR("HMDHAPAccessoryUpdateTransactionTriggered"), v12);
  }

  return v18;
}

- (void)startWithDelegate:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[HMDCompositeSettingsHH2DatabaseAdapter queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __60__HMDCompositeSettingsHH2DatabaseAdapter_startWithDelegate___block_invoke;
  v7[3] = &unk_24E79C268;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (id)fetchModelWithID:(id)a3
{
  id v4;
  void *v5;
  HMDCompositeSettingsHH2DatabaseAdapter *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  _QWORD v13[4];
  id v14;
  HMDCompositeSettingsHH2DatabaseAdapter *v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__40597;
  v21 = __Block_byref_object_dispose__40598;
  v22 = 0;
  v5 = (void *)MEMORY[0x227676638]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v24 = v8;
    v25 = 2112;
    v26 = v4;
    _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_DEBUG, "%{public}@Fetching model with id %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v5);
  -[HMDCompositeSettingsHH2DatabaseAdapter context](v6, "context");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __59__HMDCompositeSettingsHH2DatabaseAdapter_fetchModelWithID___block_invoke;
  v13[3] = &unk_24E79C0A8;
  v10 = v4;
  v14 = v10;
  v15 = v6;
  v16 = &v17;
  objc_msgSend(v9, "unsafeSynchronousBlock:", v13);

  v11 = (id)v18[5];
  _Block_object_dispose(&v17, 8);

  return v11;
}

- (void)addModel:(id)a3 withOptionsLabel:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  HMDCompositeSettingsHH2DatabaseAdapter *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  HMDCompositeSettingsHH2DatabaseAdapter *v20;
  NSObject *v21;
  void *v22;
  _QWORD v23[5];
  id v24;
  id v25;
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = v8;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v12 = v11;
  else
    v12 = 0;
  v13 = v12;

  v14 = (void *)MEMORY[0x227676638]();
  v15 = self;
  HMFGetOSLogHandle();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v27 = v17;
    v28 = 2112;
    v29 = v9;
    _os_log_impl(&dword_2218F0000, v16, OS_LOG_TYPE_INFO, "%{public}@Attempting add model via database adapter with options label: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v14);
  if (v13)
  {
    -[HMDCompositeSettingsHH2DatabaseAdapter context](v15, "context");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v23[0] = MEMORY[0x24BDAC760];
    v23[1] = 3221225472;
    v23[2] = __79__HMDCompositeSettingsHH2DatabaseAdapter_addModel_withOptionsLabel_completion___block_invoke;
    v23[3] = &unk_24E79B440;
    v23[4] = v15;
    v24 = v13;
    v25 = v10;
    objc_msgSend(v18, "performBlock:", v23);

  }
  else
  {
    v19 = (void *)MEMORY[0x227676638]();
    v20 = v15;
    HMFGetOSLogHandle();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v27 = v22;
      v28 = 2112;
      v29 = v11;
      _os_log_impl(&dword_2218F0000, v21, OS_LOG_TYPE_ERROR, "%{public}@Unable to cast settings model %@ while adding to the database.", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v19);
  }

}

- (id)emptyModelWithID:(id)a3 parentModelID:(id)a4 modelClass:(Class)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  int v13;
  char v14;
  void *v15;
  id v16;
  id result;
  HMDCompositeSettingsHH2DatabaseAdapter *v18;
  SEL v19;
  id v20;

  v7 = a3;
  v8 = a4;
  v9 = (void *)objc_msgSend([a5 alloc], "initWithModelID:parentModelID:", v7, v8);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v10 = v9;
  else
    v10 = 0;
  v11 = v10;

  if (v11)
  {
    v12 = v11;
    v13 = objc_msgSend(v12, "conformsToProtocol:", &unk_255825FB0);
    v14 = v13;
    if (v13)
      v15 = v12;
    else
      v15 = 0;
    v16 = v15;

    if ((v14 & 1) != 0)
    {

      return v12;
    }
  }
  else
  {
    _HMFPreconditionFailure();
  }
  v18 = (HMDCompositeSettingsHH2DatabaseAdapter *)_HMFPreconditionFailure();
  -[HMDCompositeSettingsHH2DatabaseAdapter _handleAccessoryUpdateTransaction:](v18, v19, v20);
  return result;
}

- (void)_handleAccessoryUpdateTransaction:(id)a3
{
  id v4;
  void *v5;
  HMDCompositeSettingsHH2DatabaseAdapter *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  NSObject *v13;
  void *v14;
  HMDCompositeSettingsHH2DatabaseAdapter *v15;
  NSObject *v16;
  void *v17;
  _QWORD v18[5];
  id v19;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)MEMORY[0x227676638]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v21 = v8;
    _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_INFO, "%{public}@Observed accessory update", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v5);
  objc_msgSend(v4, "userInfo");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "valueForKey:", CFSTR("HMDHAPAccessoryUpdateTransactionTriggeredKey"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v11 = v10;
  else
    v11 = 0;
  v12 = v11;

  if (v12)
  {
    -[HMDCompositeSettingsHH2DatabaseAdapter queue](v6, "queue");
    v13 = objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x24BDAC760];
    v18[1] = 3221225472;
    v18[2] = __76__HMDCompositeSettingsHH2DatabaseAdapter__handleAccessoryUpdateTransaction___block_invoke;
    v18[3] = &unk_24E79C268;
    v18[4] = v6;
    v19 = v12;
    dispatch_async(v13, v18);

  }
  else
  {
    v14 = (void *)MEMORY[0x227676638]();
    v15 = v6;
    HMFGetOSLogHandle();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
    {
      HMFGetLogIdentifier();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v21 = v17;
      v22 = 2112;
      v23 = v4;
      _os_log_impl(&dword_2218F0000, v16, OS_LOG_TYPE_FAULT, "%{public}@Received accessory update transaction that was nil or an invalid type: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v14);
  }

}

- (void)_copySettingsFromModel:(id)a3 toAccessory:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  id v52;

  v52 = a3;
  v5 = a4;
  objc_msgSend(v52, "root_siri_soundAlert_value");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v52, "root_siri_soundAlert_value");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setSoundAlertEnabled:", v7);

  }
  objc_msgSend(v52, "root_siri_lightWhenUsingSiri_value");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(v52, "root_siri_lightWhenUsingSiri_value");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setLightWhenUsingSiriEnabled:", v9);

  }
  objc_msgSend(v52, "root_siri_siriEnabled_value");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    objc_msgSend(v52, "root_siri_siriEnabled_value");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setSiriEnabled:", v11);

  }
  objc_msgSend(v52, "root_siri_language_inputLanguageCodeValueName");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    objc_msgSend(v52, "root_siri_language_inputLanguageCodeValueName");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setSiriLanguageCode:", v13);

  }
  objc_msgSend(v52, "root_siri_language_outputLanguageVoiceCodeValueName");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    objc_msgSend(v52, "root_siri_language_outputLanguageVoiceCodeValueName");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setSiriLanguageVoiceCode:", v15);

  }
  objc_msgSend(v52, "root_siri_language_outputLanguageGenderCodeValueName");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    objc_msgSend(v52, "root_siri_language_outputLanguageGenderCodeValueName");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setSiriLanguageVoiceGenderCode:", v17);

  }
  objc_msgSend(v52, "root_siri_language_voiceNameValueName");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    objc_msgSend(v52, "root_siri_language_voiceNameValueName");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setSiriLanguageVoiceName:", v19);

  }
  objc_msgSend(v52, "root_home_dismissedHomePodHasNonMemberMediaAccountWarning_value");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
  {
    objc_msgSend(v52, "root_home_dismissedHomePodHasNonMemberMediaAccountWarning_value");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setHasDismissedHomePodHasNonMemberMediaAccountWarning:", v21);

  }
  objc_msgSend(v52, "root_doorbellChime_enabled_value");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (v22)
  {
    objc_msgSend(v52, "root_doorbellChime_enabled_value");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setDoorbellChimeEnabled:", v23);

  }
  objc_msgSend(v52, "root_announce_enabled_value");
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  if (v24)
  {
    objc_msgSend(v52, "root_announce_enabled_value");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setAnnounceEnabled:", v25);

  }
  objc_msgSend(v52, "root_general_accessibility_vision_doubleTapSettings_timeoutSettings_timeoutInterval_value");
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  if (v26)
  {
    objc_msgSend(v52, "root_general_accessibility_vision_doubleTapSettings_timeoutSettings_timeoutInterval_value");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setVisionDoubleTapSettingsTimeoutInterval:", v27);

  }
  objc_msgSend(v52, "root_general_accessibility_vision_voiceOver_enabled_value");
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  if (v28)
  {
    objc_msgSend(v52, "root_general_accessibility_vision_voiceOver_enabled_value");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setVisionVoiceOverEnabled:", v29);

  }
  objc_msgSend(v52, "root_general_accessibility_vision_voiceOver_audioDuckingEnabled_value");
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  if (v30)
  {
    objc_msgSend(v52, "root_general_accessibility_vision_voiceOver_audioDuckingEnabled_value");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setVisionVoiceOverAudioDuckingEnabled:", v31);

  }
  objc_msgSend(v52, "root_general_accessibility_vision_speakingRateSection_speakingRate_value");
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  if (v32)
  {
    objc_msgSend(v52, "root_general_accessibility_vision_speakingRateSection_speakingRate_value");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setVisionSpeakingRate:", v33);

  }
  objc_msgSend(v52, "root_general_accessibility_interaction_holdDuration_enabled_value");
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  if (v34)
  {
    objc_msgSend(v52, "root_general_accessibility_interaction_holdDuration_enabled_value");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setInteractionHoldDurationEnabled:", v35);

  }
  objc_msgSend(v52, "root_general_accessibility_interaction_holdDuration_seconds_value");
  v36 = (void *)objc_claimAutoreleasedReturnValue();

  if (v36)
  {
    objc_msgSend(v52, "root_general_accessibility_interaction_holdDuration_seconds_value");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setInteractionHoldDurationSeconds:", v37);

  }
  objc_msgSend(v52, "root_general_accessibility_interaction_touchAccommodations_enabled_value");
  v38 = (void *)objc_claimAutoreleasedReturnValue();

  if (v38)
  {
    objc_msgSend(v52, "root_general_accessibility_interaction_touchAccommodations_enabled_value");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setInteractionTouchAccommodationsEnabled:", v39);

  }
  objc_msgSend(v52, "root_general_accessibility_interaction_ignoreRepeat_enabled_value");
  v40 = (void *)objc_claimAutoreleasedReturnValue();

  if (v40)
  {
    objc_msgSend(v52, "root_general_accessibility_interaction_ignoreRepeat_enabled_value");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setInteractionIgnoreRepeatEnabled:", v41);

  }
  objc_msgSend(v52, "root_general_accessibility_interaction_ignoreRepeat_seconds_value");
  v42 = (void *)objc_claimAutoreleasedReturnValue();

  if (v42)
  {
    objc_msgSend(v52, "root_general_accessibility_interaction_ignoreRepeat_seconds_value");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setInteractionIgnoreRepeatSeconds:", v43);

  }
  objc_msgSend(v52, "root_general_analytics_shareSiriAnalytics_value");
  v44 = (void *)objc_claimAutoreleasedReturnValue();

  if (v44)
  {
    objc_msgSend(v52, "root_general_analytics_shareSiriAnalytics_value");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setShareSiriAnalytics:", v45);

  }
  objc_msgSend(v52, "root_general_analytics_shareSpeakerAnalytics_value");
  v46 = (void *)objc_claimAutoreleasedReturnValue();

  if (v46)
  {
    objc_msgSend(v52, "root_general_analytics_shareSpeakerAnalytics_value");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setShareSpeakerAnalytics:", v47);

  }
  objc_msgSend(v52, "root_airPlay_airPlayEnabled_value");
  v48 = (void *)objc_claimAutoreleasedReturnValue();

  if (v48)
  {
    objc_msgSend(v52, "root_airPlay_airPlayEnabled_value");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setAirPlayEnabled:", v49);

  }
  objc_msgSend(v52, "root_siriEndpoint_enabled_value");
  v50 = (void *)objc_claimAutoreleasedReturnValue();

  if (v50)
  {
    objc_msgSend(v52, "root_siriEndpoint_enabled_value");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setSiriEndpointEnabled:", v51);

  }
}

- (id)_modelFromAccessory:(id)a3
{
  id v4;
  HMDCompositeSettingsAccessorySettingsModel *v5;
  void *v6;
  void *v7;
  HMDCompositeSettingsAccessorySettingsModel *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;

  v4 = a3;
  v5 = [HMDCompositeSettingsAccessorySettingsModel alloc];
  objc_msgSend(v4, "modelID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "modelID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[HMBModel initWithModelID:parentModelID:](v5, "initWithModelID:parentModelID:", v6, v7);

  -[HMDCompositeSettingsHH2DatabaseAdapter _setDefaultVersionsOnModel:](self, "_setDefaultVersionsOnModel:", v8);
  objc_msgSend(v4, "soundAlertEnabled");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCompositeSettingsAccessorySettingsModel setRoot_siri_soundAlert_value:](v8, "setRoot_siri_soundAlert_value:", v9);

  objc_msgSend(v4, "lightWhenUsingSiriEnabled");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCompositeSettingsAccessorySettingsModel setRoot_siri_lightWhenUsingSiri_value:](v8, "setRoot_siri_lightWhenUsingSiri_value:", v10);

  objc_msgSend(v4, "siriEnabled");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCompositeSettingsAccessorySettingsModel setRoot_siri_siriEnabled_value:](v8, "setRoot_siri_siriEnabled_value:", v11);

  objc_msgSend(v4, "siriLanguageCode");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCompositeSettingsAccessorySettingsModel setRoot_siri_language_inputLanguageCodeValueName:](v8, "setRoot_siri_language_inputLanguageCodeValueName:", v12);

  objc_msgSend(v4, "siriLanguageVoiceCode");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCompositeSettingsAccessorySettingsModel setRoot_siri_language_outputLanguageVoiceCodeValueName:](v8, "setRoot_siri_language_outputLanguageVoiceCodeValueName:", v13);

  objc_msgSend(v4, "siriLanguageVoiceGenderCode");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCompositeSettingsAccessorySettingsModel setRoot_siri_language_outputLanguageGenderCodeValueName:](v8, "setRoot_siri_language_outputLanguageGenderCodeValueName:", v14);

  objc_msgSend(v4, "siriLanguageVoiceName");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCompositeSettingsAccessorySettingsModel setRoot_siri_language_voiceNameValueName:](v8, "setRoot_siri_language_voiceNameValueName:", v15);

  objc_msgSend(v4, "hasDismissedHomePodHasNonMemberMediaAccountWarning");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCompositeSettingsAccessorySettingsModel setRoot_home_dismissedHomePodHasNonMemberMediaAccountWarning_value:](v8, "setRoot_home_dismissedHomePodHasNonMemberMediaAccountWarning_value:", v16);

  objc_msgSend(v4, "doorbellChimeEnabled");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCompositeSettingsAccessorySettingsModel setRoot_doorbellChime_enabled_value:](v8, "setRoot_doorbellChime_enabled_value:", v17);

  objc_msgSend(v4, "announceEnabled");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCompositeSettingsAccessorySettingsModel setRoot_announce_enabled_value:](v8, "setRoot_announce_enabled_value:", v18);

  objc_msgSend(v4, "visionDoubleTapSettingsTimeoutInterval");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCompositeSettingsAccessorySettingsModel setRoot_general_accessibility_vision_doubleTapSettings_timeoutSettings_timeoutInterval_value:](v8, "setRoot_general_accessibility_vision_doubleTapSettings_timeoutSettings_timeoutInterval_value:", v19);

  objc_msgSend(v4, "visionVoiceOverEnabled");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCompositeSettingsAccessorySettingsModel setRoot_general_accessibility_vision_voiceOver_enabled_value:](v8, "setRoot_general_accessibility_vision_voiceOver_enabled_value:", v20);

  objc_msgSend(v4, "visionVoiceOverAudioDuckingEnabled");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCompositeSettingsAccessorySettingsModel setRoot_general_accessibility_vision_voiceOver_audioDuckingEnabled_value:](v8, "setRoot_general_accessibility_vision_voiceOver_audioDuckingEnabled_value:", v21);

  objc_msgSend(v4, "visionSpeakingRate");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCompositeSettingsAccessorySettingsModel setRoot_general_accessibility_vision_speakingRateSection_speakingRate_value:](v8, "setRoot_general_accessibility_vision_speakingRateSection_speakingRate_value:", v22);

  objc_msgSend(v4, "interactionHoldDurationEnabled");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCompositeSettingsAccessorySettingsModel setRoot_general_accessibility_interaction_holdDuration_enabled_value:](v8, "setRoot_general_accessibility_interaction_holdDuration_enabled_value:", v23);

  objc_msgSend(v4, "interactionHoldDurationSeconds");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCompositeSettingsAccessorySettingsModel setRoot_general_accessibility_interaction_holdDuration_seconds_value:](v8, "setRoot_general_accessibility_interaction_holdDuration_seconds_value:", v24);

  objc_msgSend(v4, "interactionTouchAccommodationsEnabled");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCompositeSettingsAccessorySettingsModel setRoot_general_accessibility_interaction_touchAccommodations_enabled_value:](v8, "setRoot_general_accessibility_interaction_touchAccommodations_enabled_value:", v25);

  objc_msgSend(v4, "interactionIgnoreRepeatEnabled");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCompositeSettingsAccessorySettingsModel setRoot_general_accessibility_interaction_ignoreRepeat_enabled_value:](v8, "setRoot_general_accessibility_interaction_ignoreRepeat_enabled_value:", v26);

  objc_msgSend(v4, "interactionIgnoreRepeatSeconds");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCompositeSettingsAccessorySettingsModel setRoot_general_accessibility_interaction_ignoreRepeat_seconds_value:](v8, "setRoot_general_accessibility_interaction_ignoreRepeat_seconds_value:", v27);

  objc_msgSend(v4, "shareSiriAnalytics");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCompositeSettingsAccessorySettingsModel setRoot_general_analytics_shareSiriAnalytics_value:](v8, "setRoot_general_analytics_shareSiriAnalytics_value:", v28);

  objc_msgSend(v4, "shareSpeakerAnalytics");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCompositeSettingsAccessorySettingsModel setRoot_general_analytics_shareSpeakerAnalytics_value:](v8, "setRoot_general_analytics_shareSpeakerAnalytics_value:", v29);

  objc_msgSend(v4, "airPlayEnabled");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCompositeSettingsAccessorySettingsModel setRoot_airPlay_airPlayEnabled_value:](v8, "setRoot_airPlay_airPlayEnabled_value:", v30);

  objc_msgSend(v4, "siriEndpointEnabled");
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  -[HMDCompositeSettingsAccessorySettingsModel setRoot_siriEndpoint_enabled_value:](v8, "setRoot_siriEndpoint_enabled_value:", v31);
  return v8;
}

- (void)_setDefaultVersionsOnModel:(id)a3
{
  uint64_t v3;
  id v4;

  v4 = a3;
  objc_msgSend(v4, "setRoot_siri_soundAlert_readVersion:", CFSTR("7.1"));
  objc_msgSend(v4, "setRoot_siri_soundAlert_writeVersion:", CFSTR("7.1"));
  objc_msgSend(v4, "setRoot_siri_lightWhenUsingSiri_readVersion:", CFSTR("7.1"));
  objc_msgSend(v4, "setRoot_siri_lightWhenUsingSiri_writeVersion:", CFSTR("7.1"));
  objc_msgSend(v4, "setRoot_siri_siriEnabled_readVersion:", CFSTR("7.1"));
  objc_msgSend(v4, "setRoot_siri_siriEnabled_writeVersion:", CFSTR("7.1"));
  objc_msgSend(v4, "setRoot_siri_language_readVersion:", CFSTR("7.1"));
  objc_msgSend(v4, "setRoot_siri_language_writeVersion:", CFSTR("7.1"));
  objc_msgSend(v4, "setRoot_home_dismissedHomePodHasNonMemberMediaAccountWarning_readVersion:", CFSTR("7.1"));
  objc_msgSend(v4, "setRoot_home_dismissedHomePodHasNonMemberMediaAccountWarning_writeVersion:", CFSTR("7.1"));
  objc_msgSend(v4, "setRoot_doorbellChime_enabled_readVersion:", CFSTR("7.1"));
  objc_msgSend(v4, "setRoot_doorbellChime_enabled_writeVersion:", CFSTR("7.1"));
  objc_msgSend(v4, "setRoot_announce_enabled_readVersion:", CFSTR("7.1"));
  objc_msgSend(v4, "setRoot_announce_enabled_writeVersion:", CFSTR("7.1"));
  objc_msgSend(v4, "setRoot_general_accessibility_vision_doubleTapSettings_timeoutSettings_timeoutInterval_readVersion:", CFSTR("7.1"));
  objc_msgSend(v4, "setRoot_general_accessibility_vision_doubleTapSettings_timeoutSettings_timeoutInterval_writeVersion:", CFSTR("7.1"));
  objc_msgSend(v4, "setRoot_general_accessibility_vision_voiceOver_enabled_readVersion:", CFSTR("7.1"));
  objc_msgSend(v4, "setRoot_general_accessibility_vision_voiceOver_enabled_writeVersion:", CFSTR("7.1"));
  objc_msgSend(v4, "setRoot_general_accessibility_vision_voiceOver_audioDuckingEnabled_readVersion:", CFSTR("7.1"));
  objc_msgSend(v4, "setRoot_general_accessibility_vision_voiceOver_audioDuckingEnabled_writeVersion:", CFSTR("7.1"));
  objc_msgSend(v4, "setRoot_general_accessibility_vision_speakingRateSection_speakingRate_readVersion:", CFSTR("7.1"));
  objc_msgSend(v4, "setRoot_general_accessibility_vision_speakingRateSection_speakingRate_writeVersion:", CFSTR("7.1"));
  objc_msgSend(v4, "setRoot_general_accessibility_interaction_holdDuration_enabled_readVersion:", CFSTR("7.1"));
  objc_msgSend(v4, "setRoot_general_accessibility_interaction_holdDuration_enabled_writeVersion:", CFSTR("7.1"));
  objc_msgSend(v4, "setRoot_general_accessibility_interaction_holdDuration_seconds_readVersion:", CFSTR("7.1"));
  objc_msgSend(v4, "setRoot_general_accessibility_interaction_holdDuration_seconds_writeVersion:", CFSTR("7.1"));
  objc_msgSend(v4, "setRoot_general_accessibility_interaction_touchAccommodations_enabled_readVersion:", CFSTR("7.1"));
  objc_msgSend(v4, "setRoot_general_accessibility_interaction_touchAccommodations_enabled_writeVersion:", CFSTR("7.1"));
  objc_msgSend(v4, "setRoot_general_accessibility_interaction_ignoreRepeat_enabled_readVersion:", CFSTR("7.1"));
  objc_msgSend(v4, "setRoot_general_accessibility_interaction_ignoreRepeat_enabled_writeVersion:", CFSTR("7.1"));
  objc_msgSend(v4, "setRoot_general_accessibility_interaction_ignoreRepeat_seconds_readVersion:", CFSTR("7.1"));
  objc_msgSend(v4, "setRoot_general_accessibility_interaction_ignoreRepeat_seconds_writeVersion:", CFSTR("7.1"));
  objc_msgSend(v4, "setRoot_general_analytics_shareSiriAnalytics_readVersion:", CFSTR("7.1"));
  objc_msgSend(v4, "setRoot_general_analytics_shareSiriAnalytics_writeVersion:", CFSTR("9.0"));
  objc_msgSend(v4, "setRoot_general_analytics_shareSpeakerAnalytics_readVersion:", CFSTR("7.1"));
  objc_msgSend(v4, "setRoot_general_analytics_shareSpeakerAnalytics_writeVersion:", CFSTR("7.1"));
  objc_msgSend(v4, "setRoot_airPlay_airPlayEnabled_readVersion:", CFSTR("7.1"));
  objc_msgSend(v4, "setRoot_airPlay_airPlayEnabled_writeVersion:", CFSTR("7.1"));
  objc_msgSend(v4, "setRoot_siriEndpoint_enabled_readVersion:", CFSTR("7.1"));
  objc_msgSend(v4, "setRoot_siriEndpoint_enabled_writeVersion:", CFSTR("7.1"));
  v3 = MEMORY[0x24BDBD1C0];
  objc_msgSend(v4, "setRoot_music_allowExplicitContent_value:", MEMORY[0x24BDBD1C0]);
  objc_msgSend(v4, "setRoot_music_allowExplicitContent_readVersion:", CFSTR("7.1"));
  objc_msgSend(v4, "setRoot_music_allowExplicitContent_writeVersion:", CFSTR("7.1"));
  objc_msgSend(v4, "setRoot_locationServices_enabled_value:", v3);
  objc_msgSend(v4, "setRoot_locationServices_enabled_readVersion:", CFSTR("7.1"));
  objc_msgSend(v4, "setRoot_locationServices_enabled_writeVersion:", CFSTR("7.1"));

}

- (id)logIdentifier
{
  void *v2;
  void *v3;

  -[HMDCompositeSettingsHH2DatabaseAdapter accessoryID](self, "accessoryID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "UUIDString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (id)rawDatabase
{
  return objc_loadWeakRetained(&self->_rawDatabase);
}

- (HMDCompositeSettingsDatabaseAdapterDelegate)delegate
{
  return (HMDCompositeSettingsDatabaseAdapterDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSUUID)accessoryID
{
  return self->_accessoryID;
}

- (NSUUID)homeID
{
  return self->_homeID;
}

- (HMCContext)context
{
  return self->_context;
}

- (NSString)strongRawDatabase
{
  return self->_strongRawDatabase;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_strongRawDatabase, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_homeID, 0);
  objc_storeStrong((id *)&self->_accessoryID, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak(&self->_rawDatabase);
  objc_storeStrong((id *)&self->_queue, 0);
}

void __76__HMDCompositeSettingsHH2DatabaseAdapter__handleAccessoryUpdateTransaction___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  id v53;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "uuid");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fetchModelWithID:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v53 = v5;

  objc_msgSend(*(id *)(a1 + 40), "soundAlertEnabled");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(*(id *)(a1 + 40), "soundAlertEnabled");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "setRoot_siri_soundAlert_value:", v7);

  }
  objc_msgSend(*(id *)(a1 + 40), "lightWhenUsingSiriEnabled");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(*(id *)(a1 + 40), "lightWhenUsingSiriEnabled");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "setRoot_siri_lightWhenUsingSiri_value:", v9);

  }
  objc_msgSend(*(id *)(a1 + 40), "siriEnabled");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    objc_msgSend(*(id *)(a1 + 40), "siriEnabled");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "setRoot_siri_siriEnabled_value:", v11);

  }
  objc_msgSend(*(id *)(a1 + 40), "siriLanguageCode");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    objc_msgSend(*(id *)(a1 + 40), "siriLanguageCode");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "setRoot_siri_language_inputLanguageCodeValueName:", v13);

  }
  objc_msgSend(*(id *)(a1 + 40), "siriLanguageVoiceCode");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    objc_msgSend(*(id *)(a1 + 40), "siriLanguageVoiceCode");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "setRoot_siri_language_outputLanguageVoiceCodeValueName:", v15);

  }
  objc_msgSend(*(id *)(a1 + 40), "siriLanguageVoiceGenderCode");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    objc_msgSend(*(id *)(a1 + 40), "siriLanguageVoiceGenderCode");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "setRoot_siri_language_outputLanguageGenderCodeValueName:", v17);

  }
  objc_msgSend(*(id *)(a1 + 40), "siriLanguageVoiceName");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    objc_msgSend(*(id *)(a1 + 40), "siriLanguageVoiceName");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "setRoot_siri_language_voiceNameValueName:", v19);

  }
  objc_msgSend(*(id *)(a1 + 40), "hasDismissedHomePodHasNonMemberMediaAccountWarning");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
  {
    objc_msgSend(*(id *)(a1 + 40), "hasDismissedHomePodHasNonMemberMediaAccountWarning");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "setRoot_home_dismissedHomePodHasNonMemberMediaAccountWarning_value:", v21);

  }
  objc_msgSend(*(id *)(a1 + 40), "doorbellChimeEnabled");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (v22)
  {
    objc_msgSend(*(id *)(a1 + 40), "doorbellChimeEnabled");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "setRoot_doorbellChime_enabled_value:", v23);

  }
  objc_msgSend(*(id *)(a1 + 40), "announceEnabled");
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  if (v24)
  {
    objc_msgSend(*(id *)(a1 + 40), "announceEnabled");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "setRoot_announce_enabled_value:", v25);

  }
  objc_msgSend(*(id *)(a1 + 40), "visionDoubleTapSettingsTimeoutInterval");
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  if (v26)
  {
    objc_msgSend(*(id *)(a1 + 40), "visionDoubleTapSettingsTimeoutInterval");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "setRoot_general_accessibility_vision_doubleTapSettings_timeoutSettings_timeoutInterval_value:", v27);

  }
  objc_msgSend(*(id *)(a1 + 40), "visionVoiceOverEnabled");
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  if (v28)
  {
    objc_msgSend(*(id *)(a1 + 40), "visionVoiceOverEnabled");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "setRoot_general_accessibility_vision_voiceOver_enabled_value:", v29);

  }
  objc_msgSend(*(id *)(a1 + 40), "visionVoiceOverAudioDuckingEnabled");
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  if (v30)
  {
    objc_msgSend(*(id *)(a1 + 40), "visionVoiceOverAudioDuckingEnabled");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "setRoot_general_accessibility_vision_voiceOver_audioDuckingEnabled_value:", v31);

  }
  objc_msgSend(*(id *)(a1 + 40), "visionSpeakingRate");
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  if (v32)
  {
    objc_msgSend(*(id *)(a1 + 40), "visionSpeakingRate");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "setRoot_general_accessibility_vision_speakingRateSection_speakingRate_value:", v33);

  }
  objc_msgSend(*(id *)(a1 + 40), "interactionHoldDurationEnabled");
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  if (v34)
  {
    objc_msgSend(*(id *)(a1 + 40), "interactionHoldDurationEnabled");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "setRoot_general_accessibility_interaction_holdDuration_enabled_value:", v35);

  }
  objc_msgSend(*(id *)(a1 + 40), "interactionHoldDurationSeconds");
  v36 = (void *)objc_claimAutoreleasedReturnValue();

  if (v36)
  {
    objc_msgSend(*(id *)(a1 + 40), "interactionHoldDurationSeconds");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "setRoot_general_accessibility_interaction_holdDuration_seconds_value:", v37);

  }
  objc_msgSend(*(id *)(a1 + 40), "interactionTouchAccommodationsEnabled");
  v38 = (void *)objc_claimAutoreleasedReturnValue();

  if (v38)
  {
    objc_msgSend(*(id *)(a1 + 40), "interactionTouchAccommodationsEnabled");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "setRoot_general_accessibility_interaction_touchAccommodations_enabled_value:", v39);

  }
  objc_msgSend(*(id *)(a1 + 40), "interactionIgnoreRepeatEnabled");
  v40 = (void *)objc_claimAutoreleasedReturnValue();

  if (v40)
  {
    objc_msgSend(*(id *)(a1 + 40), "interactionIgnoreRepeatEnabled");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "setRoot_general_accessibility_interaction_ignoreRepeat_enabled_value:", v41);

  }
  objc_msgSend(*(id *)(a1 + 40), "interactionIgnoreRepeatSeconds");
  v42 = (void *)objc_claimAutoreleasedReturnValue();

  if (v42)
  {
    objc_msgSend(*(id *)(a1 + 40), "interactionIgnoreRepeatSeconds");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "setRoot_general_accessibility_interaction_ignoreRepeat_seconds_value:", v43);

  }
  objc_msgSend(*(id *)(a1 + 40), "shareSiriAnalytics");
  v44 = (void *)objc_claimAutoreleasedReturnValue();

  if (v44)
  {
    objc_msgSend(*(id *)(a1 + 40), "shareSiriAnalytics");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "setRoot_general_analytics_shareSiriAnalytics_value:", v45);

  }
  objc_msgSend(*(id *)(a1 + 40), "shareSpeakerAnalytics");
  v46 = (void *)objc_claimAutoreleasedReturnValue();

  if (v46)
  {
    objc_msgSend(*(id *)(a1 + 40), "shareSpeakerAnalytics");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "setRoot_general_analytics_shareSpeakerAnalytics_value:", v47);

  }
  objc_msgSend(*(id *)(a1 + 40), "airPlayEnabled");
  v48 = (void *)objc_claimAutoreleasedReturnValue();

  if (v48)
  {
    objc_msgSend(*(id *)(a1 + 40), "airPlayEnabled");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "setRoot_airPlay_airPlayEnabled_value:", v49);

  }
  objc_msgSend(*(id *)(a1 + 40), "siriEndpointEnabled");
  v50 = (void *)objc_claimAutoreleasedReturnValue();

  if (v50)
  {
    objc_msgSend(*(id *)(a1 + 40), "siriEndpointEnabled");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "setRoot_siriEndpoint_enabled_value:", v51);

  }
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "database:didProcessUpdateForModel:", *(_QWORD *)(a1 + 32), v53);

}

void __79__HMDCompositeSettingsHH2DatabaseAdapter_addModel_withOptionsLabel_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  char v5;
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  const char *v12;
  NSObject *v13;
  os_log_type_t v14;
  uint32_t v15;
  void *v16;
  id v17;
  NSObject *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  id v22;
  id v23;
  _QWORD block[4];
  id v25;
  id v26;
  id v27;
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  id v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "accessoryID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMCContext findHAPAccessoryWithModelID:](HMCContext, "findHAPAccessoryWithModelID:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "_copySettingsFromModel:toAccessory:", *(_QWORD *)(a1 + 40), v3);
    objc_msgSend(*(id *)(a1 + 32), "context");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = 0;
    v5 = objc_msgSend(v4, "save:", &v27);
    v6 = v27;

    v7 = (void *)MEMORY[0x227676638]();
    v8 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if ((v5 & 1) != 0)
    {
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v29 = v11;
        v12 = "%{public}@Successfully saved settings update";
        v13 = v10;
        v14 = OS_LOG_TYPE_INFO;
        v15 = 12;
LABEL_10:
        _os_log_impl(&dword_2218F0000, v13, v14, v12, buf, v15);

      }
    }
    else if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v29 = v11;
      v30 = 2112;
      v31 = v6;
      v12 = "%{public}@Failed to save settings update: %@";
      v13 = v10;
      v14 = OS_LOG_TYPE_ERROR;
      v15 = 22;
      goto LABEL_10;
    }

    objc_autoreleasePoolPop(v7);
    goto LABEL_12;
  }
  v16 = (void *)MEMORY[0x227676638]();
  v17 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "accessoryID");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v29 = v19;
    v30 = 2112;
    v31 = v20;
    _os_log_impl(&dword_2218F0000, v18, OS_LOG_TYPE_ERROR, "%{public}@Unable to find the MKFHAPAccessory with identifier: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v16);
  objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 2);
  v6 = (id)objc_claimAutoreleasedReturnValue();
LABEL_12:
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v21 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __79__HMDCompositeSettingsHH2DatabaseAdapter_addModel_withOptionsLabel_completion___block_invoke_6;
  block[3] = &unk_24E79C2B8;
  v22 = *(id *)(a1 + 48);
  v25 = v6;
  v26 = v22;
  v23 = v6;
  dispatch_async(v21, block);

}

uint64_t __79__HMDCompositeSettingsHH2DatabaseAdapter_addModel_withOptionsLabel_completion___block_invoke_6(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __59__HMDCompositeSettingsHH2DatabaseAdapter_fetchModelWithID___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  int v11;
  void *v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  +[HMCContext findHAPAccessoryWithModelID:](HMCContext, "findHAPAccessoryWithModelID:", *(_QWORD *)(a1 + 32));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 40), "_modelFromAccessory:", v2);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v5 = *(void **)(v4 + 40);
    *(_QWORD *)(v4 + 40) = v3;

  }
  else
  {
    v6 = (void *)MEMORY[0x227676638]();
    v7 = *(id *)(a1 + 40);
    HMFGetOSLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = *(_QWORD *)(a1 + 32);
      v11 = 138543618;
      v12 = v9;
      v13 = 2112;
      v14 = v10;
      _os_log_impl(&dword_2218F0000, v8, OS_LOG_TYPE_ERROR, "%{public}@Unable to find the MKFHAPAccessory with identifier: %@", (uint8_t *)&v11, 0x16u);

    }
    objc_autoreleasePoolPop(v6);
  }

}

uint64_t __60__HMDCompositeSettingsHH2DatabaseAdapter_startWithDelegate___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x227676638]();
  v3 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138543362;
    v8 = v5;
    _os_log_impl(&dword_2218F0000, v4, OS_LOG_TYPE_INFO, "%{public}@Starting composite settings database adapter", (uint8_t *)&v7, 0xCu);

  }
  objc_autoreleasePoolPop(v2);
  objc_storeWeak((id *)(*(_QWORD *)(a1 + 32) + 24), *(id *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 40), "database:didConfigureWithError:", *(_QWORD *)(a1 + 32), 0);
}

@end
