@implementation HMSiriEndpointOnboardingSelections

- (HMSiriEndpointOnboardingSelections)initWithSiriEnabled:(BOOL)a3 allowHeySiri:(BOOL)a4 airPlayEnabled:(BOOL)a5 playbackInfluencesForYouEnabled:(BOOL)a6 shareSiriAnalyticsEnabled:(BOOL)a7 explicitContentAllowed:(BOOL)a8 languageValue:(id)a9
{
  _BOOL8 v9;
  _BOOL8 v10;
  _BOOL8 v11;
  _BOOL8 v12;
  _BOOL8 v13;
  _BOOL8 v14;
  id v16;
  void *v17;
  HMSiriEndpointOnboardingSelections *v18;
  HMSiriEndpointOnboardingSelections *v20;
  SEL v21;
  BOOL v22;
  BOOL v23;
  BOOL v24;
  BOOL v25;
  BOOL v26;
  BOOL v27;

  v9 = a8;
  v10 = a7;
  v11 = a6;
  v12 = a5;
  v13 = a4;
  v14 = a3;
  v16 = a9;
  if (v16)
  {
    v17 = v16;
    v18 = -[HMSiriEndpointOnboardingSelections _initWithSiriEnabled:allowHeySiri:airPlayEnabled:playbackInfluencesForYouEnabled:shareSiriAnalyticsEnabled:explicitContentAllowed:languageValue:](self, "_initWithSiriEnabled:allowHeySiri:airPlayEnabled:playbackInfluencesForYouEnabled:shareSiriAnalyticsEnabled:explicitContentAllowed:languageValue:", v14, v13, v12, v11, v10, v9, v16);

    return v18;
  }
  else
  {
    v20 = (HMSiriEndpointOnboardingSelections *)_HMFPreconditionFailure();
    return (HMSiriEndpointOnboardingSelections *)-[HMSiriEndpointOnboardingSelections _initWithSiriEnabled:allowHeySiri:airPlayEnabled:playbackInfluencesForYouEnabled:shareSiriAnalyticsEnabled:explicitContentAllowed:languageValue:](v20, v21, v22, v23, v24, v25, v26, v27, a9);
  }
}

- (id)_initWithSiriEnabled:(BOOL)a3 allowHeySiri:(BOOL)a4 airPlayEnabled:(BOOL)a5 playbackInfluencesForYouEnabled:(BOOL)a6 shareSiriAnalyticsEnabled:(BOOL)a7 explicitContentAllowed:(BOOL)a8 languageValue:(id)a9
{
  _BOOL8 v9;
  _BOOL8 v10;
  _BOOL8 v11;
  _BOOL8 v12;
  _BOOL8 v13;
  id v15;
  HMSiriEndpointOnboardingSelections *v16;

  v9 = a8;
  v10 = a7;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  v15 = a9;
  v16 = -[HMSiriEndpointOnboardingSelections init](self, "init");
  -[HMSiriEndpointOnboardingSelections setSiriEnabled:](v16, "setSiriEnabled:", v13);
  -[HMSiriEndpointOnboardingSelections setAllowHeySiri:](v16, "setAllowHeySiri:", v12);
  -[HMSiriEndpointOnboardingSelections setAirPlayEnabled:](v16, "setAirPlayEnabled:", v11);
  -[HMSiriEndpointOnboardingSelections setShareSiriAnalyticsEnabled:](v16, "setShareSiriAnalyticsEnabled:", v10);
  -[HMSiriEndpointOnboardingSelections setExplicitContentAllowed:](v16, "setExplicitContentAllowed:", v9);
  -[HMSiriEndpointOnboardingSelections setLanguageValue:](v16, "setLanguageValue:", v15);

  -[HMSiriEndpointOnboardingSelections setDoorbellChimeEnabled:](v16, "setDoorbellChimeEnabled:", 1);
  -[HMSiriEndpointOnboardingSelections setAnnounceEnabled:](v16, "setAnnounceEnabled:", 1);
  -[HMSiriEndpointOnboardingSelections setLightWhenUsingSiriEnabled:](v16, "setLightWhenUsingSiriEnabled:", 1);
  return v16;
}

- (HMSiriEndpointOnboardingSelections)initWithSiriEnabled:(BOOL)a3 allowHeySiri:(BOOL)a4 airPlayEnabled:(BOOL)a5 playbackInfluencesForYouEnabled:(BOOL)a6 shareSiriAnalyticsEnabled:(BOOL)a7 explicitContentAllowed:(BOOL)a8
{
  HMSiriEndpointOnboardingSelections *v8;

  v8 = -[HMSiriEndpointOnboardingSelections _initWithSiriEnabled:allowHeySiri:airPlayEnabled:playbackInfluencesForYouEnabled:shareSiriAnalyticsEnabled:explicitContentAllowed:languageValue:](self, "_initWithSiriEnabled:allowHeySiri:airPlayEnabled:playbackInfluencesForYouEnabled:shareSiriAnalyticsEnabled:explicitContentAllowed:languageValue:", a3, a4, a5, a6, a7, a8, 0);
  -[HMSiriEndpointOnboardingSelections setHasLanguageValue:](v8, "setHasLanguageValue:", 0);
  return v8;
}

- (HMSiriEndpointOnboardingSelections)init
{
  HMSiriEndpointOnboardingSelections *v2;
  HMSiriEndpointOnboardingSelections *v3;
  HMSettingLanguageValue *languageValue;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)HMSiriEndpointOnboardingSelections;
  v2 = -[HMSiriEndpointOnboardingSelections init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    languageValue = v2->_languageValue;
    v2->_languageValue = 0;

    v3->_siriEnabled = 0;
    *(_DWORD *)&v3->_allowHeySiri = 0;
  }
  return v3;
}

- (id)payloadCopy
{
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
  _QWORD v27[17];
  _QWORD v28[19];

  v28[17] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 19);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = CFSTR("HMSiriEndpointOnboardingSelectionsSiriEnabledPayloadKey");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[HMSiriEndpointOnboardingSelections isSiriEnabled](self, "isSiriEnabled"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v28[0] = v26;
  v27[1] = CFSTR("HMSiriEndpointOnboardingSelectionsAllowHeySiriPayloadKey");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[HMSiriEndpointOnboardingSelections allowHeySiri](self, "allowHeySiri"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v28[1] = v25;
  v27[2] = CFSTR("HMSiriEndpointOnboardingSelectionsAirPlayEnabledPayloadKey");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[HMSiriEndpointOnboardingSelections isAirPlayEnabled](self, "isAirPlayEnabled"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v28[2] = v24;
  v27[3] = CFSTR("HMSiriEndpointOnboardingSelectionsExplicitContentAllowedPayloadKey");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[HMSiriEndpointOnboardingSelections isExplicitContentAllowed](self, "isExplicitContentAllowed"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v28[3] = v22;
  v27[4] = CFSTR("HMSiriEndpointOnboardingSelectionsShareSiriAnalyticsPayloadKey");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[HMSiriEndpointOnboardingSelections isShareSiriAnalyticsEnabled](self, "isShareSiriAnalyticsEnabled"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v28[4] = v21;
  v27[5] = CFSTR("HMSiriEndpointOnboardingSelectionsDoorbellChimeEnabledPayloadKey");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[HMSiriEndpointOnboardingSelections isDoorbellChimeEnabled](self, "isDoorbellChimeEnabled"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v28[5] = v20;
  v27[6] = CFSTR("HMSiriEndpointOnboardingSelectionsAnnounceEnabledPayloadKey");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[HMSiriEndpointOnboardingSelections isAnnounceEnabled](self, "isAnnounceEnabled"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v28[6] = v19;
  v27[7] = CFSTR("HMSiriEndpointOnboardingSelectionsLightWhenUsingSiriEnabledPayloadKey");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[HMSiriEndpointOnboardingSelections isLightWhenUsingSiriEnabled](self, "isLightWhenUsingSiriEnabled"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v28[7] = v18;
  v27[8] = CFSTR("HMSiriEndpointOnboardingSelectionsHasSiriEnabledPayloadKey");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[HMSiriEndpointOnboardingSelections hasSiriEnabled](self, "hasSiriEnabled"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v28[8] = v17;
  v27[9] = CFSTR("HMSiriEndpointOnboardingSelectionsHasAllowHeySiriPayloadKey");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[HMSiriEndpointOnboardingSelections hasAllowHeySiri](self, "hasAllowHeySiri"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v28[9] = v3;
  v27[10] = CFSTR("HMSiriEndpointOnboardingSelectionsHasAirPlayEnabledPayloadKey");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[HMSiriEndpointOnboardingSelections hasAirPlayEnabled](self, "hasAirPlayEnabled"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v28[10] = v4;
  v27[11] = CFSTR("HMSiriEndpointOnboardingSelectionsHasExplicitContentAllowedPayloadKey");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[HMSiriEndpointOnboardingSelections hasExplicitContentAllowed](self, "hasExplicitContentAllowed"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v28[11] = v5;
  v27[12] = CFSTR("HMSiriEndpointOnboardingSelectionsHasShareSiriAnalyticsPayloadKey");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[HMSiriEndpointOnboardingSelections hasShareSiriAnalyticsEnabled](self, "hasShareSiriAnalyticsEnabled"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v28[12] = v6;
  v27[13] = CFSTR("HMSiriEndpointOnboardingSelectionsHasDoorbellChimeEnabledPayloadKey");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[HMSiriEndpointOnboardingSelections hasDoorbellChimeEnabled](self, "hasDoorbellChimeEnabled"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v28[13] = v7;
  v27[14] = CFSTR("HMSiriEndpointOnboardingSelectionsHasAnnounceEnabledPayloadKey");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[HMSiriEndpointOnboardingSelections hasAnnounceEnabled](self, "hasAnnounceEnabled"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v28[14] = v8;
  v27[15] = CFSTR("HMSiriEndpointOnboardingSelectionsHasLightWhenUsingSiriEnabledPayloadKey");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[HMSiriEndpointOnboardingSelections hasLightWhenUsingSiriEnabled](self, "hasLightWhenUsingSiriEnabled"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v27[16] = CFSTR("HMSiriEndpointOnboardingSelectionsShouldHonorSiriAnalyticsSelectionPayloadKey");
  v28[15] = v9;
  v28[16] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v28, v27, 17);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "addEntriesFromDictionary:", v10);

  -[HMSiriEndpointOnboardingSelections languageValue](self, "languageValue");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    -[HMSiriEndpointOnboardingSelections languageValue](self, "languageValue");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "payloadCopy");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setObject:forKeyedSubscript:", v13, CFSTR("HMSiriEndpointOnboardingSelectionsLanguageValueKey"));

  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[HMSiriEndpointOnboardingSelections hasLanguageValue](self, "hasLanguageValue"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setObject:forKeyedSubscript:", v14, CFSTR("HMSiriEndpointOnboardingSelectionsHasLanguageValueKey"));

  v15 = (void *)objc_msgSend(v23, "copy");
  return v15;
}

- (HMSiriEndpointOnboardingSelections)initWithPayload:(id)a3
{
  id v4;
  uint64_t v5;
  HMSettingLanguageValue *v6;
  HMSettingLanguageValue *v7;
  void *v8;
  HMSiriEndpointOnboardingSelections *v9;
  NSObject *v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  HMSettingLanguageValue *v14;
  uint64_t v15;
  HMSettingLanguageValue *v16;
  unsigned int v17;
  HMSettingLanguageValue *v18;
  unsigned int v19;
  HMSettingLanguageValue *v20;
  HMSiriEndpointOnboardingSelections *v21;
  char v23;
  void *v24;
  HMSiriEndpointOnboardingSelections *v25;
  NSObject *v26;
  void *v27;
  id v28;
  id v29;
  id v30;
  id v31;
  unsigned int v32;
  id v33;
  HMSettingLanguageValue *v34;
  HMSettingLanguageValue *v35;
  id v36;
  id v37;
  id v38;
  id v39;
  id v40;
  void *v41;
  HMSiriEndpointOnboardingSelections *v42;
  NSObject *v43;
  HMSettingLanguageValue *v44;
  void *v45;
  uint64_t v46;
  void *v47;
  HMSiriEndpointOnboardingSelections *v48;
  void *v49;
  NSObject *v50;
  void *v51;
  void *v52;
  void *v53;
  unsigned int v54;
  unsigned int v55;
  unsigned int v56;
  unsigned int v57;
  HMSettingLanguageValue *v58;
  unsigned int v59;
  unsigned int v60;
  HMSettingLanguageValue *v61;
  unsigned int v62;
  unsigned int v63;
  unsigned int v64;
  unsigned int v65;
  unsigned int v66;
  unsigned int v67;
  unsigned int v68;
  unsigned int v69;
  id v70;
  id v71;
  id v72;
  id v73;
  id v74;
  id v75;
  id v76;
  id v77;
  id v78;
  id v79;
  id v80;
  id v81;
  id v82;
  id v83;
  id v84;
  id v85;
  uint8_t buf[4];
  void *v87;
  __int16 v88;
  HMSettingLanguageValue *v89;
  __int16 v90;
  void *v91;
  __int16 v92;
  uint64_t v93;
  uint64_t v94;

  v94 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v85 = 0;
  v5 = objc_msgSend(v4, "hmf_BOOLForKey:error:", CFSTR("HMSiriEndpointOnboardingSelectionsSiriEnabledPayloadKey"), &v85);
  v6 = (HMSettingLanguageValue *)v85;
  if (v6)
  {
    v7 = v6;
    v8 = (void *)MEMORY[0x1A1AC1AAC]();
    v9 = self;
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v87 = v11;
      v88 = 2112;
      v89 = v7;
      v12 = "%{public}@Failed to decode isSiriEnabled due to error: %@";
LABEL_16:
      _os_log_impl(&dword_19B1B0000, v10, OS_LOG_TYPE_ERROR, v12, buf, 0x16u);

      goto LABEL_17;
    }
    goto LABEL_17;
  }
  v84 = 0;
  v13 = objc_msgSend(v4, "hmf_BOOLForKey:error:", CFSTR("HMSiriEndpointOnboardingSelectionsAllowHeySiriPayloadKey"), &v84);
  v14 = (HMSettingLanguageValue *)v84;
  if (v14)
  {
    v7 = v14;
    v8 = (void *)MEMORY[0x1A1AC1AAC]();
    v9 = self;
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v87 = v11;
      v88 = 2112;
      v89 = v7;
      v12 = "%{public}@Failed to decode allowHeySiri due to error: %@";
      goto LABEL_16;
    }
LABEL_17:

    objc_autoreleasePoolPop(v8);
    v21 = 0;
    goto LABEL_18;
  }
  v83 = 0;
  v15 = objc_msgSend(v4, "hmf_BOOLForKey:error:", CFSTR("HMSiriEndpointOnboardingSelectionsAirPlayEnabledPayloadKey"), &v83);
  v16 = (HMSettingLanguageValue *)v83;
  if (v16)
  {
    v7 = v16;
    v8 = (void *)MEMORY[0x1A1AC1AAC]();
    v9 = self;
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v87 = v11;
      v88 = 2112;
      v89 = v7;
      v12 = "%{public}@Failed to decode isAirPlayEnabled due to error: %@";
      goto LABEL_16;
    }
    goto LABEL_17;
  }
  v82 = 0;
  v17 = objc_msgSend(v4, "hmf_BOOLForKey:error:", CFSTR("HMSiriEndpointOnboardingSelectionsExplicitContentAllowedPayloadKey"), &v82);
  v18 = (HMSettingLanguageValue *)v82;
  if (v18)
  {
    v7 = v18;
    v8 = (void *)MEMORY[0x1A1AC1AAC]();
    v9 = self;
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v87 = v11;
      v88 = 2112;
      v89 = v7;
      v12 = "%{public}@Failed to decode isExplicitContentAllowed due to error: %@";
      goto LABEL_16;
    }
    goto LABEL_17;
  }
  v81 = 0;
  v19 = objc_msgSend(v4, "hmf_BOOLForKey:error:", CFSTR("HMSiriEndpointOnboardingSelectionsShareSiriAnalyticsPayloadKey"), &v81);
  v20 = (HMSettingLanguageValue *)v81;
  if (v20)
  {
    v7 = v20;
    v8 = (void *)MEMORY[0x1A1AC1AAC]();
    v9 = self;
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v87 = v11;
      v88 = 2112;
      v89 = v7;
      v12 = "%{public}@Failed to decode isShareSiriAnalyticsEnabled due to error: %@";
      goto LABEL_16;
    }
    goto LABEL_17;
  }
  v66 = v17;
  v23 = objc_msgSend(v4, "hmf_BOOLForKey:", CFSTR("HMSiriEndpointOnboardingSelectionsShouldHonorSiriAnalyticsSelectionPayloadKey"));
  if (v19 && (v23 & 1) == 0)
  {
    v24 = (void *)MEMORY[0x1A1AC1AAC]();
    v25 = self;
    HMFGetOSLogHandle();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v87 = v27;
      _os_log_impl(&dword_19B1B0000, v26, OS_LOG_TYPE_INFO, "%{public}@Blocking enabling siri analytics due to old payload with missing flag", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v24);
    v19 = 0;
  }
  v80 = 0;
  v65 = objc_msgSend(v4, "hmf_BOOLForKey:error:", CFSTR("HMSiriEndpointOnboardingSelectionsHasSiriEnabledPayloadKey"), &v80);
  v28 = v80;
  v79 = v28;
  v64 = objc_msgSend(v4, "hmf_BOOLForKey:error:", CFSTR("HMSiriEndpointOnboardingSelectionsHasAllowHeySiriPayloadKey"), &v79);
  v29 = v79;

  v78 = v29;
  v63 = objc_msgSend(v4, "hmf_BOOLForKey:error:", CFSTR("HMSiriEndpointOnboardingSelectionsHasAirPlayEnabledPayloadKey"), &v78);
  v30 = v78;

  v77 = v30;
  v62 = objc_msgSend(v4, "hmf_BOOLForKey:error:", CFSTR("HMSiriEndpointOnboardingSelectionsHasExplicitContentAllowedPayloadKey"), &v77);
  v31 = v77;

  v76 = v31;
  v32 = objc_msgSend(v4, "hmf_BOOLForKey:error:", CFSTR("HMSiriEndpointOnboardingSelectionsHasShareSiriAnalyticsPayloadKey"), &v76);
  v33 = v76;

  objc_msgSend(v4, "hmf_dictionaryForKey:", CFSTR("HMSiriEndpointOnboardingSelectionsLanguageValueKey"));
  v34 = (HMSettingLanguageValue *)objc_claimAutoreleasedReturnValue();
  v35 = v34;
  if (v34
    && (v34 = -[HMSettingLanguageValue initWithPayload:]([HMSettingLanguageValue alloc], "initWithPayload:", v34)) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmfErrorWithCode:reason:", 2, CFSTR("Unable to decode languageValue"));
    v7 = (HMSettingLanguageValue *)objc_claimAutoreleasedReturnValue();

    v49 = (void *)MEMORY[0x1A1AC1AAC]();
    v9 = self;
    HMFGetOSLogHandle();
    v50 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v87 = v51;
      v88 = 2112;
      v89 = v35;
      _os_log_impl(&dword_19B1B0000, v50, OS_LOG_TYPE_ERROR, "%{public}@Failed to decode onboarding selections due to invalid language value payload: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v49);
    v21 = 0;
  }
  else
  {
    v58 = v34;
    v59 = v32;
    v60 = v19;
    v61 = v35;
    v57 = objc_msgSend(v4, "hmf_BOOLForKey:", CFSTR("HMSiriEndpointOnboardingSelectionsHasLanguageValueKey"));
    v75 = v33;
    v69 = objc_msgSend(v4, "hmf_BOOLForKey:error:", CFSTR("HMSiriEndpointOnboardingSelectionsHasDoorbellChimeEnabledPayloadKey"), &v75);
    v36 = v75;

    v74 = v36;
    v68 = objc_msgSend(v4, "hmf_BOOLForKey:error:", CFSTR("HMSiriEndpointOnboardingSelectionsHasAnnounceEnabledPayloadKey"), &v74);
    v37 = v74;

    v73 = v37;
    v67 = objc_msgSend(v4, "hmf_BOOLForKey:error:", CFSTR("HMSiriEndpointOnboardingSelectionsHasLightWhenUsingSiriEnabledPayloadKey"), &v73);
    v38 = v73;

    v72 = v38;
    v56 = objc_msgSend(v4, "hmf_BOOLForKey:error:", CFSTR("HMSiriEndpointOnboardingSelectionsDoorbellChimeEnabledPayloadKey"), &v72);
    v39 = v72;

    v71 = v39;
    v55 = objc_msgSend(v4, "hmf_BOOLForKey:error:", CFSTR("HMSiriEndpointOnboardingSelectionsAnnounceEnabledPayloadKey"), &v71);
    v40 = v71;

    v70 = v40;
    v54 = objc_msgSend(v4, "hmf_BOOLForKey:error:", CFSTR("HMSiriEndpointOnboardingSelectionsLightWhenUsingSiriEnabledPayloadKey"), &v70);
    v7 = (HMSettingLanguageValue *)v70;

    v41 = (void *)MEMORY[0x1A1AC1AAC]();
    v42 = self;
    HMFGetOSLogHandle();
    v43 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      HMFBooleanToString();
      v44 = (HMSettingLanguageValue *)objc_claimAutoreleasedReturnValue();
      HMFBooleanToString();
      v52 = v41;
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      HMFBooleanToString();
      v46 = objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v87 = v53;
      v88 = 2112;
      v89 = v44;
      v90 = 2112;
      v91 = v45;
      v92 = 2112;
      v93 = v46;
      v47 = (void *)v46;
      _os_log_impl(&dword_19B1B0000, v43, OS_LOG_TYPE_INFO, "%{public}@Decoded Payload hasAnnounce = %@, hasLightWhenUsingSiri = %@, hasDoorbellChimeEnabled = %@ ", buf, 0x2Au);

      v41 = v52;
    }

    objc_autoreleasePoolPop(v41);
    v48 = -[HMSiriEndpointOnboardingSelections init](v42, "init");
    -[HMSiriEndpointOnboardingSelections setAllowHeySiri:](v48, "setAllowHeySiri:", v13);
    -[HMSiriEndpointOnboardingSelections setSiriEnabled:](v48, "setSiriEnabled:", v5);
    -[HMSiriEndpointOnboardingSelections setAirPlayEnabled:](v48, "setAirPlayEnabled:", v15);
    -[HMSiriEndpointOnboardingSelections setExplicitContentAllowed:](v48, "setExplicitContentAllowed:", v66);
    -[HMSiriEndpointOnboardingSelections setShareSiriAnalyticsEnabled:](v48, "setShareSiriAnalyticsEnabled:", v60);
    -[HMSiriEndpointOnboardingSelections setLanguageValue:](v48, "setLanguageValue:", v58);
    -[HMSiriEndpointOnboardingSelections setDoorbellChimeEnabled:](v48, "setDoorbellChimeEnabled:", v56);
    -[HMSiriEndpointOnboardingSelections setAnnounceEnabled:](v48, "setAnnounceEnabled:", v55);
    -[HMSiriEndpointOnboardingSelections setLightWhenUsingSiriEnabled:](v48, "setLightWhenUsingSiriEnabled:", v54);
    -[HMSiriEndpointOnboardingSelections setHasAllowHeySiri:](v48, "setHasAllowHeySiri:", v64);
    -[HMSiriEndpointOnboardingSelections setHasSiriEnabled:](v48, "setHasSiriEnabled:", v65);
    -[HMSiriEndpointOnboardingSelections setHasAirPlayEnabled:](v48, "setHasAirPlayEnabled:", v63);
    -[HMSiriEndpointOnboardingSelections setHasExplicitContentAllowed:](v48, "setHasExplicitContentAllowed:", v62);
    -[HMSiriEndpointOnboardingSelections setHasShareSiriAnalyticsEnabled:](v48, "setHasShareSiriAnalyticsEnabled:", v59);
    -[HMSiriEndpointOnboardingSelections setHasLanguageValue:](v48, "setHasLanguageValue:", v57);
    -[HMSiriEndpointOnboardingSelections setHasAnnounceEnabled:](v48, "setHasAnnounceEnabled:", v68);
    -[HMSiriEndpointOnboardingSelections setHasDoorbellChimeEnabled:](v48, "setHasDoorbellChimeEnabled:", v69);
    -[HMSiriEndpointOnboardingSelections setHasLightWhenUsingSiriEnabled:](v48, "setHasLightWhenUsingSiriEnabled:", v67);
    v9 = v48;

    v21 = v9;
    v35 = v61;
  }

LABEL_18:
  return v21;
}

- (NSString)shortDescription
{
  return (NSString *)objc_msgSend((id)objc_opt_class(), "shortDescription");
}

- (NSArray)attributeDescriptions
{
  id v3;
  id v4;
  id v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  _QWORD v32[11];

  v32[9] = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMSiriEndpointOnboardingSelections isSiriEnabled](self, "isSiriEnabled");
  HMFBooleanToString();
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = (void *)objc_msgSend(v3, "initWithName:value:", CFSTR("siriEnabled"), v31);
  v32[0] = v30;
  v4 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMSiriEndpointOnboardingSelections allowHeySiri](self, "allowHeySiri");
  HMFBooleanToString();
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = (void *)objc_msgSend(v4, "initWithName:value:", CFSTR("allowHeySiri"), v29);
  v32[1] = v28;
  v5 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMSiriEndpointOnboardingSelections isAirPlayEnabled](self, "isAirPlayEnabled");
  HMFBooleanToString();
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = (void *)objc_msgSend(v5, "initWithName:value:", CFSTR("airPlayEnabled"), v27);
  v32[2] = v26;
  v6 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMSiriEndpointOnboardingSelections isExplicitContentAllowed](self, "isExplicitContentAllowed");
  HMFBooleanToString();
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = (void *)objc_msgSend(v6, "initWithName:value:", CFSTR("explicitContentAllowed"), v25);
  v32[3] = v24;
  v7 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMSiriEndpointOnboardingSelections isShareSiriAnalyticsEnabled](self, "isShareSiriAnalyticsEnabled");
  HMFBooleanToString();
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "initWithName:value:", CFSTR("shareSiriAnalyticsEnabled"), v23);
  v32[4] = v8;
  v9 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMSiriEndpointOnboardingSelections isLightWhenUsingSiriEnabled](self, "isLightWhenUsingSiriEnabled");
  HMFBooleanToString();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v9, "initWithName:value:", CFSTR("lightWhenUsingSiriEnabled"), v10);
  v32[5] = v11;
  v12 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMSiriEndpointOnboardingSelections isDoorbellChimeEnabled](self, "isDoorbellChimeEnabled");
  HMFBooleanToString();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v12, "initWithName:value:", CFSTR("doorbellChimeEnabled"), v13);
  v32[6] = v14;
  v15 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMSiriEndpointOnboardingSelections isAnnounceEnabled](self, "isAnnounceEnabled");
  HMFBooleanToString();
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)objc_msgSend(v15, "initWithName:value:", CFSTR("announceEnabled"), v16);
  v32[7] = v17;
  v18 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMSiriEndpointOnboardingSelections languageValue](self, "languageValue");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (void *)objc_msgSend(v18, "initWithName:value:", CFSTR("languageValue"), v19);
  v32[8] = v20;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v32, 9);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v21;
}

- (BOOL)isSiriEnabled
{
  return self->_siriEnabled;
}

- (void)setSiriEnabled:(BOOL)a3
{
  self->_siriEnabled = a3;
  self->_hasSiriEnabled = 1;
}

- (void)setAllowHeySiri:(BOOL)a3
{
  self->_allowHeySiri = a3;
  self->_hasAllowHeySiri = 1;
}

- (BOOL)allowHeySiri
{
  return self->_allowHeySiri;
}

- (void)setAirPlayEnabled:(BOOL)a3
{
  self->_airPlayEnabled = a3;
  self->_hasAirPlayEnabled = 1;
}

- (BOOL)isAirPlayEnabled
{
  return self->_airPlayEnabled;
}

- (BOOL)isExplicitContentAllowed
{
  return self->_explicitContentAllowed;
}

- (void)setExplicitContentAllowed:(BOOL)a3
{
  self->_explicitContentAllowed = a3;
  self->_hasExplicitContentAllowed = 1;
}

- (BOOL)isShareSiriAnalyticsEnabled
{
  return self->_shareSiriAnalyticsEnabled;
}

- (void)setShareSiriAnalyticsEnabled:(BOOL)a3
{
  self->_shareSiriAnalyticsEnabled = a3;
  self->_hasShareSiriAnalyticsEnabled = 1;
}

- (void)setLanguageValue:(id)a3
{
  objc_storeStrong((id *)&self->_languageValue, a3);
  self->_hasLanguageValue = 1;
}

- (HMSettingLanguageValue)languageValue
{
  return self->_languageValue;
}

- (void)setDoorbellChimeEnabled:(BOOL)a3
{
  self->_doorbellChimeEnabled = a3;
  self->_hasDoorbellChimeEnabled = 1;
}

- (BOOL)isDoorbellChimeEnabled
{
  return self->_doorbellChimeEnabled;
}

- (void)setLightWhenUsingSiriEnabled:(BOOL)a3
{
  self->_lightWhenUsingSiriEnabled = a3;
  self->_hasLightWhenUsingSiriEnabled = 1;
}

- (BOOL)isLightWhenUsingSiriEnabled
{
  return self->_lightWhenUsingSiriEnabled;
}

- (BOOL)isAnnounceEnabled
{
  return self->_announceEnabled;
}

- (void)setAnnounceEnabled:(BOOL)a3
{
  self->_announceEnabled = a3;
  self->_hasAnnounceEnabled = 1;
}

- (BOOL)isEqual:(id)a3
{
  HMSiriEndpointOnboardingSelections *v4;
  HMSiriEndpointOnboardingSelections *v5;
  HMSiriEndpointOnboardingSelections *v6;
  _BOOL4 v7;
  _BOOL4 v8;
  _BOOL4 v9;
  _BOOL4 v10;
  _BOOL4 v11;
  void *v12;
  void *v13;
  int v14;
  _BOOL4 v15;
  _BOOL4 v16;
  _BOOL4 v17;
  _BOOL4 v18;
  _BOOL4 v19;
  _BOOL4 v20;
  _BOOL4 v21;
  _BOOL4 v22;
  _BOOL4 v24;

  v4 = (HMSiriEndpointOnboardingSelections *)a3;
  if (v4 == self)
  {
    LOBYTE(v22) = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5 = v4;
    else
      v5 = 0;
    v6 = v5;
    if (!v6)
      goto LABEL_19;
    v7 = -[HMSiriEndpointOnboardingSelections isSiriEnabled](self, "isSiriEnabled");
    if (v7 != -[HMSiriEndpointOnboardingSelections isSiriEnabled](v6, "isSiriEnabled"))
      goto LABEL_19;
    v8 = -[HMSiriEndpointOnboardingSelections allowHeySiri](self, "allowHeySiri");
    if (v8 != -[HMSiriEndpointOnboardingSelections allowHeySiri](v6, "allowHeySiri"))
      goto LABEL_19;
    v9 = -[HMSiriEndpointOnboardingSelections isAirPlayEnabled](self, "isAirPlayEnabled");
    if (v9 != -[HMSiriEndpointOnboardingSelections isAirPlayEnabled](v6, "isAirPlayEnabled"))
      goto LABEL_19;
    v10 = -[HMSiriEndpointOnboardingSelections isExplicitContentAllowed](self, "isExplicitContentAllowed");
    if (v10 != -[HMSiriEndpointOnboardingSelections isExplicitContentAllowed](v6, "isExplicitContentAllowed"))
      goto LABEL_19;
    v11 = -[HMSiriEndpointOnboardingSelections isShareSiriAnalyticsEnabled](self, "isShareSiriAnalyticsEnabled");
    if (v11 != -[HMSiriEndpointOnboardingSelections isShareSiriAnalyticsEnabled](v6, "isShareSiriAnalyticsEnabled"))
      goto LABEL_19;
    -[HMSiriEndpointOnboardingSelections languageValue](self, "languageValue");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMSiriEndpointOnboardingSelections languageValue](v6, "languageValue");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = HMFEqualObjects();

    if (!v14)
      goto LABEL_19;
    v15 = -[HMSiriEndpointOnboardingSelections isAnnounceEnabled](self, "isAnnounceEnabled");
    if (v15 == -[HMSiriEndpointOnboardingSelections isAnnounceEnabled](v6, "isAnnounceEnabled")
      && (v16 = -[HMSiriEndpointOnboardingSelections isDoorbellChimeEnabled](self, "isDoorbellChimeEnabled"),
          v16 == -[HMSiriEndpointOnboardingSelections isDoorbellChimeEnabled](v6, "isDoorbellChimeEnabled"))
      && (v17 = -[HMSiriEndpointOnboardingSelections isLightWhenUsingSiriEnabled](self, "isLightWhenUsingSiriEnabled"),
          v17 == -[HMSiriEndpointOnboardingSelections isLightWhenUsingSiriEnabled](v6, "isLightWhenUsingSiriEnabled"))
      && (v18 = -[HMSiriEndpointOnboardingSelections hasLanguageValue](self, "hasLanguageValue"),
          v18 == -[HMSiriEndpointOnboardingSelections hasLanguageValue](v6, "hasLanguageValue"))
      && (v19 = -[HMSiriEndpointOnboardingSelections hasSiriEnabled](self, "hasSiriEnabled"),
          v19 == -[HMSiriEndpointOnboardingSelections hasSiriEnabled](v6, "hasSiriEnabled"))
      && (v20 = -[HMSiriEndpointOnboardingSelections hasAllowHeySiri](self, "hasAllowHeySiri"),
          v20 == -[HMSiriEndpointOnboardingSelections hasAllowHeySiri](v6, "hasAllowHeySiri"))
      && (v21 = -[HMSiriEndpointOnboardingSelections hasExplicitContentAllowed](self, "hasExplicitContentAllowed"),
          v21 == -[HMSiriEndpointOnboardingSelections hasExplicitContentAllowed](v6, "hasExplicitContentAllowed")))
    {
      v24 = -[HMSiriEndpointOnboardingSelections hasShareSiriAnalyticsEnabled](self, "hasShareSiriAnalyticsEnabled");
      v22 = v24 ^ -[HMSiriEndpointOnboardingSelections hasShareSiriAnalyticsEnabled](v6, "hasShareSiriAnalyticsEnabled") ^ 1;
    }
    else
    {
LABEL_19:
      LOBYTE(v22) = 0;
    }

  }
  return v22;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _BOOL4 v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _BOOL4 v11;
  uint64_t v12;
  uint64_t v13;
  _BOOL4 v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _BOOL4 v18;
  uint64_t v19;
  uint64_t v20;
  _BOOL4 v21;
  uint64_t v22;
  uint64_t v23;
  _BOOL4 v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  _BOOL4 v28;
  uint64_t v29;
  uint64_t v30;
  _BOOL4 v31;
  uint64_t v32;
  uint64_t v33;
  _BOOL4 v34;
  uint64_t v35;
  uint64_t v36;
  _BOOL4 v37;
  uint64_t v38;
  uint64_t v39;
  _BOOL4 v40;
  uint64_t v41;

  -[HMSiriEndpointOnboardingSelections languageValue](self, "languageValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");

  v5 = v4 ^ -[HMSiriEndpointOnboardingSelections isSiriEnabled](self, "isSiriEnabled");
  if (-[HMSiriEndpointOnboardingSelections allowHeySiri](self, "allowHeySiri"))
    v6 = 2;
  else
    v6 = 0;
  v7 = -[HMSiriEndpointOnboardingSelections isAirPlayEnabled](self, "isAirPlayEnabled");
  v8 = 4;
  if (!v7)
    v8 = 0;
  v9 = v5 ^ v6 ^ v8;
  if (-[HMSiriEndpointOnboardingSelections isExplicitContentAllowed](self, "isExplicitContentAllowed"))
    v10 = 8;
  else
    v10 = 0;
  v11 = -[HMSiriEndpointOnboardingSelections isShareSiriAnalyticsEnabled](self, "isShareSiriAnalyticsEnabled");
  v12 = 16;
  if (!v11)
    v12 = 0;
  v13 = v10 ^ v12;
  v14 = -[HMSiriEndpointOnboardingSelections isLightWhenUsingSiriEnabled](self, "isLightWhenUsingSiriEnabled");
  v15 = 32;
  if (!v14)
    v15 = 0;
  v16 = v9 ^ v13 ^ v15;
  if (-[HMSiriEndpointOnboardingSelections isAnnounceEnabled](self, "isAnnounceEnabled"))
    v17 = 64;
  else
    v17 = 0;
  v18 = -[HMSiriEndpointOnboardingSelections isDoorbellChimeEnabled](self, "isDoorbellChimeEnabled");
  v19 = 128;
  if (!v18)
    v19 = 0;
  v20 = v17 ^ v19;
  v21 = -[HMSiriEndpointOnboardingSelections hasDoorbellChimeEnabled](self, "hasDoorbellChimeEnabled");
  v22 = 256;
  if (!v21)
    v22 = 0;
  v23 = v20 ^ v22;
  v24 = -[HMSiriEndpointOnboardingSelections hasLightWhenUsingSiriEnabled](self, "hasLightWhenUsingSiriEnabled");
  v25 = 512;
  if (!v24)
    v25 = 0;
  v26 = v16 ^ v23 ^ v25;
  if (-[HMSiriEndpointOnboardingSelections hasAnnounceEnabled](self, "hasAnnounceEnabled"))
    v27 = 1024;
  else
    v27 = 0;
  v28 = -[HMSiriEndpointOnboardingSelections hasAllowHeySiri](self, "hasAllowHeySiri");
  v29 = 2048;
  if (!v28)
    v29 = 0;
  v30 = v27 ^ v29;
  v31 = -[HMSiriEndpointOnboardingSelections hasShareSiriAnalyticsEnabled](self, "hasShareSiriAnalyticsEnabled");
  v32 = 4096;
  if (!v31)
    v32 = 0;
  v33 = v30 ^ v32;
  v34 = -[HMSiriEndpointOnboardingSelections hasAirPlayEnabled](self, "hasAirPlayEnabled");
  v35 = 0x2000;
  if (!v34)
    v35 = 0;
  v36 = v33 ^ v35;
  v37 = -[HMSiriEndpointOnboardingSelections hasExplicitContentAllowed](self, "hasExplicitContentAllowed");
  v38 = 0x4000;
  if (!v37)
    v38 = 0;
  v39 = v26 ^ v36 ^ v38;
  v40 = -[HMSiriEndpointOnboardingSelections hasLanguageValue](self, "hasLanguageValue");
  v41 = 0x8000;
  if (!v40)
    v41 = 0;
  return v39 ^ v41;
}

- (BOOL)hasSiriEnabled
{
  return self->_hasSiriEnabled;
}

- (void)setHasSiriEnabled:(BOOL)a3
{
  self->_hasSiriEnabled = a3;
}

- (BOOL)hasAllowHeySiri
{
  return self->_hasAllowHeySiri;
}

- (void)setHasAllowHeySiri:(BOOL)a3
{
  self->_hasAllowHeySiri = a3;
}

- (BOOL)hasAirPlayEnabled
{
  return self->_hasAirPlayEnabled;
}

- (void)setHasAirPlayEnabled:(BOOL)a3
{
  self->_hasAirPlayEnabled = a3;
}

- (BOOL)hasShareSiriAnalyticsEnabled
{
  return self->_hasShareSiriAnalyticsEnabled;
}

- (void)setHasShareSiriAnalyticsEnabled:(BOOL)a3
{
  self->_hasShareSiriAnalyticsEnabled = a3;
}

- (BOOL)hasExplicitContentAllowed
{
  return self->_hasExplicitContentAllowed;
}

- (void)setHasExplicitContentAllowed:(BOOL)a3
{
  self->_hasExplicitContentAllowed = a3;
}

- (BOOL)hasLanguageValue
{
  return self->_hasLanguageValue;
}

- (void)setHasLanguageValue:(BOOL)a3
{
  self->_hasLanguageValue = a3;
}

- (BOOL)hasAnnounceEnabled
{
  return self->_hasAnnounceEnabled;
}

- (void)setHasAnnounceEnabled:(BOOL)a3
{
  self->_hasAnnounceEnabled = a3;
}

- (BOOL)hasDoorbellChimeEnabled
{
  return self->_hasDoorbellChimeEnabled;
}

- (void)setHasDoorbellChimeEnabled:(BOOL)a3
{
  self->_hasDoorbellChimeEnabled = a3;
}

- (BOOL)hasLightWhenUsingSiriEnabled
{
  return self->_hasLightWhenUsingSiriEnabled;
}

- (void)setHasLightWhenUsingSiriEnabled:(BOOL)a3
{
  self->_hasLightWhenUsingSiriEnabled = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_languageValue, 0);
}

+ (id)shortDescription
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t8 != -1)
    dispatch_once(&logCategory__hmf_once_t8, &__block_literal_global_27073);
  return (id)logCategory__hmf_once_v9;
}

void __49__HMSiriEndpointOnboardingSelections_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v9;
  logCategory__hmf_once_v9 = v0;

}

- (HMSiriEndpointOnboardingSelections)initWithSiriEnabled:(BOOL)a3 allowHeySiri:(BOOL)a4 airPlayEnabled:(BOOL)a5 languageValue:(id)a6
{
  _BOOL8 v6;
  _BOOL8 v7;
  _BOOL8 v8;
  id v10;
  void *v11;
  void *v12;
  HMSiriEndpointOnboardingSelections *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  HMSiriEndpointOnboardingSelections *v19;
  void *v21;
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  void *v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  uint64_t v31;
  __int16 v32;
  uint64_t v33;
  __int16 v34;
  uint64_t v35;
  __int16 v36;
  void *v37;
  uint64_t v38;

  v6 = a5;
  v7 = a4;
  v8 = a3;
  v38 = *MEMORY[0x1E0C80C00];
  v10 = a6;
  if (!v10)
    _HMFPreconditionFailure();
  v11 = v10;
  v12 = (void *)MEMORY[0x1A1AC1AAC]();
  v13 = self;
  HMFGetOSLogHandle();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v12;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v8);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v7);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v6);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138545154;
    v23 = v15;
    v24 = 2112;
    v25 = v16;
    v26 = 2112;
    v27 = v17;
    v28 = 2112;
    v29 = v18;
    v30 = 2112;
    v31 = MEMORY[0x1E0C9AAB0];
    v32 = 2112;
    v33 = MEMORY[0x1E0C9AAA0];
    v34 = 2112;
    v35 = MEMORY[0x1E0C9AAA0];
    v36 = 2112;
    v37 = v11;
    _os_log_impl(&dword_19B1B0000, v14, OS_LOG_TYPE_ERROR, "%{public}@Deprecated API: Initializing with isSiriEnabled: %@ allowHeySiri: %@ isAirPlayEnabled: %@ playbackInfluencesForYouEnabled: %@ shareSiriAnalyticsEnabled: %@ explicitContentAllowed: %@ languageValue: %@", buf, 0x52u);

    v12 = v21;
  }

  objc_autoreleasePoolPop(v12);
  v19 = -[HMSiriEndpointOnboardingSelections initWithSiriEnabled:allowHeySiri:airPlayEnabled:playbackInfluencesForYouEnabled:shareSiriAnalyticsEnabled:explicitContentAllowed:languageValue:](v13, "initWithSiriEnabled:allowHeySiri:airPlayEnabled:playbackInfluencesForYouEnabled:shareSiriAnalyticsEnabled:explicitContentAllowed:languageValue:", v8, v7, v6, 1, 0, 0, v11);

  return v19;
}

- (HMSiriEndpointOnboardingSelections)initWithSiriEnabled:(BOOL)a3 allowHeySiri:(BOOL)a4 airPlayEnabled:(BOOL)a5
{
  _BOOL8 v5;
  _BOOL8 v6;
  _BOOL8 v7;
  void *v9;
  HMSiriEndpointOnboardingSelections *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v17;
  void *v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  uint64_t v26;
  __int16 v27;
  uint64_t v28;
  __int16 v29;
  uint64_t v30;
  uint64_t v31;

  v5 = a5;
  v6 = a4;
  v7 = a3;
  v31 = *MEMORY[0x1E0C80C00];
  v9 = (void *)MEMORY[0x1A1AC1AAC](self, a2);
  v10 = self;
  HMFGetOSLogHandle();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v7);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v6);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v5);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 138544898;
    v18 = v12;
    v19 = 2112;
    v20 = v13;
    v21 = 2112;
    v22 = v14;
    v23 = 2112;
    v24 = v15;
    v25 = 2112;
    v26 = MEMORY[0x1E0C9AAB0];
    v27 = 2112;
    v28 = MEMORY[0x1E0C9AAA0];
    v29 = 2112;
    v30 = MEMORY[0x1E0C9AAA0];
    _os_log_impl(&dword_19B1B0000, v11, OS_LOG_TYPE_ERROR, "%{public}@Deprecated API: Initializing with isSiriEnabled: %@ allowHeySiri: %@ isAirPlayEnabled: %@ playbackInfluencesForYouEnabled: %@ shareSiriAnalyticsEnabled: %@ explicitContentAllowed: %@", (uint8_t *)&v17, 0x48u);

  }
  objc_autoreleasePoolPop(v9);
  return -[HMSiriEndpointOnboardingSelections initWithSiriEnabled:allowHeySiri:airPlayEnabled:playbackInfluencesForYouEnabled:shareSiriAnalyticsEnabled:explicitContentAllowed:](v10, "initWithSiriEnabled:allowHeySiri:airPlayEnabled:playbackInfluencesForYouEnabled:shareSiriAnalyticsEnabled:explicitContentAllowed:", v7, v6, v5, 1, 0, 0);
}

@end
