@implementation HMNetworkConfigurationProfile(HFAdditions)

- (uint64_t)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
{
  return objc_msgSend((id)objc_opt_class(), "hf_localizedTitleForTargetProtectionMode:", objc_msgSend(a1, "targetProtectionMode"));
}

- (uint64_t)hf_targetProtectionModeDetailedLocalizedTitle
{
  return objc_msgSend((id)objc_opt_class(), "hf_detailedLocalizedTitleForTargetProtectionMode:", objc_msgSend(a1, "targetProtectionMode"));
}

- (uint64_t)hf_targetProtectionModeDetailedLocalizedDescription
{
  return objc_msgSend((id)objc_opt_class(), "hf_detailedLocalizedDescriptionForTargetProtectionMode:", objc_msgSend(a1, "targetProtectionMode"));
}

- (uint64_t)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
{
  return objc_msgSend((id)objc_opt_class(), "hf_localizedDescriptionForCredentialType:", objc_msgSend(a1, "credentialType"));
}

- (uint64_t)hf_hasProtectionModeMismatch
{
  return objc_msgSend((id)objc_opt_class(), "hf_currentProtectionMode:isValidForTargetProtectionMode:", objc_msgSend(a1, "currentProtectionMode"), objc_msgSend(a1, "targetProtectionMode")) ^ 1;
}

- (uint64_t)hf_targetProtectionModeIsValid
{
  return objc_msgSend((id)objc_opt_class(), "hf_targetProtectionModeIsValid:", objc_msgSend(a1, "targetProtectionMode"));
}

- (uint64_t)hf_hasCurrentNetworkAccessViolation
{
  void *v2;
  void *v3;
  uint64_t v4;

  objc_msgSend(a1, "accessViolation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    objc_msgSend(a1, "accessViolation");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "hasCurrentViolation");

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (BOOL)hf_hasManagedNetworkCredential
{
  return objc_msgSend(a1, "credentialType") == 3;
}

- (uint64_t)hf_requiresManualWiFiReconfiguration
{
  void *v2;
  int v3;

  if (objc_msgSend(a1, "supportsWiFiReconfiguration"))
  {
    objc_msgSend(a1, "accessory");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v2, "isReachable") ^ 1;

  }
  else
  {
    v3 = 1;
  }
  return objc_msgSend(a1, "hf_requiresWiFiReconfiguration") & v3;
}

+ (id)hf_localizedTitleForTargetProtectionMode:()HFAdditions
{
  __CFString *v4;
  NSObject *v5;
  int v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    if (a3 == 3)
    {
      v4 = CFSTR("HFNetworkProtectionLevelOpen");
    }
    else if (a3 == 1)
    {
      v4 = CFSTR("HFNetworkProtectionLevelHomeKit");
    }
    else
    {
      HFLogForCategory(0);
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        v7 = 134217984;
        v8 = a3;
        _os_log_error_impl(&dword_1DD34E000, v5, OS_LOG_TYPE_ERROR, "Invalid targetProtectionMode %li", (uint8_t *)&v7, 0xCu);
      }

      v4 = CFSTR("HFNetworkProtectionLevelUnknown");
    }
  }
  else
  {
    v4 = CFSTR("HFNetworkProtectionLevelAuto");
  }
  _HFLocalizedStringWithDefaultValue(v4, v4, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)hf_detailedLocalizedTitleForTargetProtectionMode:()HFAdditions
{
  __CFString *v4;
  NSObject *v5;
  int v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    if (a3 == 3)
    {
      v4 = CFSTR("HFNetworkProtectionLevelOpen_Detail");
    }
    else if (a3 == 1)
    {
      v4 = CFSTR("HFNetworkProtectionLevelHomeKit_Detail");
    }
    else
    {
      HFLogForCategory(0);
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        v7 = 134217984;
        v8 = a3;
        _os_log_error_impl(&dword_1DD34E000, v5, OS_LOG_TYPE_ERROR, "Invalid targetProtectionMode %li", (uint8_t *)&v7, 0xCu);
      }

      v4 = CFSTR("HFNetworkProtectionLevelUnknown_Detail");
    }
  }
  else
  {
    v4 = CFSTR("HFNetworkProtectionLevelAuto_Detail");
  }
  _HFLocalizedStringWithDefaultValue(v4, v4, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)hf_detailedLocalizedDescriptionForTargetProtectionMode:()HFAdditions
{
  __CFString *v4;
  NSObject *v5;
  int v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    if (a3 == 3)
    {
      v4 = CFSTR("HFNetworkProtectionLevelOpen_Description");
    }
    else if (a3 == 1)
    {
      v4 = CFSTR("HFNetworkProtectionLevelHomeKit_Description");
    }
    else
    {
      HFLogForCategory(0);
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        v7 = 134217984;
        v8 = a3;
        _os_log_error_impl(&dword_1DD34E000, v5, OS_LOG_TYPE_ERROR, "Invalid targetProtectionMode %li", (uint8_t *)&v7, 0xCu);
      }

      v4 = CFSTR("HFNetworkProtectionLevelUnknown_Description");
    }
  }
  else
  {
    v4 = CFSTR("HFNetworkProtectionLevelAuto_Description");
  }
  _HFLocalizedStringWithDefaultValue(v4, v4, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)hf_localizedDescriptionForAllowedHostPurpose:()HFAdditions
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t, void *);
  void *v17;
  id v18;
  uint64_t *v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;

  objc_msgSend((id)objc_opt_class(), "_localizedStringForPurpose");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = 0;
  v27 = &v26;
  v28 = 0x3032000000;
  v29 = __Block_byref_object_copy__21;
  v30 = __Block_byref_object_dispose__21;
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v31 = (id)objc_claimAutoreleasedReturnValue();
  v22 = 0;
  v23 = &v22;
  v24 = 0x2020000000;
  v25 = a3;
  objc_msgSend(v4, "allKeys");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = MEMORY[0x1E0C809B0];
  v15 = 3221225472;
  v16 = __91__HMNetworkConfigurationProfile_HFAdditions__hf_localizedDescriptionForAllowedHostPurpose___block_invoke;
  v17 = &unk_1EA738C90;
  v21 = a3;
  v19 = &v26;
  v6 = v4;
  v18 = v6;
  v20 = &v22;
  objc_msgSend(v5, "na_each:", &v14);

  if (v23[3])
  {
    v7 = (void *)v27[5];
    objc_msgSend(v6, "objectForKeyedSubscript:", &unk_1EA7CC8F8, v14, v15, v16, v17);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObject:", v8);

  }
  v9 = (void *)MEMORY[0x1E0CB3738];
  objc_msgSend((id)v27[5], "allObjects", v14, v15, v16, v17);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "sortedArrayUsingSelector:", sel_localizedStandardCompare_);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "localizedStringByJoiningStrings:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  _Block_object_dispose(&v22, 8);
  _Block_object_dispose(&v26, 8);

  return v12;
}

+ (id)hf_localizedDescriptionForCredentialType:()HFAdditions
{
  __CFString *v3;

  if ((unint64_t)(a3 - 1) > 2)
    v3 = CFSTR("HFNetworkConfigurationCredential_Unknown");
  else
    v3 = off_1EA738CF0[a3 - 1];
  _HFLocalizedStringWithDefaultValue(v3, v3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (BOOL)hf_targetProtectionModeIsValid:()HFAdditions
{
  void *v4;
  void *v5;
  void *v6;
  _BOOL8 v7;

  objc_msgSend(a1, "_validCurrentModesForTargetModes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6 != 0;

  return v7;
}

+ (uint64_t)hf_currentProtectionMode:()HFAdditions isValidForTargetProtectionMode:
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;

  objc_msgSend(a1, "_validCurrentModesForTargetModes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v8, "containsObject:", v9);

  return v10;
}

+ (id)_validCurrentModesForTargetModes
{
  if (_MergedGlobals_285 != -1)
    dispatch_once(&_MergedGlobals_285, &__block_literal_global_37_3);
  return (id)qword_1ED379868;
}

+ (id)_localizedStringForPurpose
{
  if (qword_1ED379870 != -1)
    dispatch_once(&qword_1ED379870, &__block_literal_global_50_7);
  return (id)qword_1ED379878;
}

@end
