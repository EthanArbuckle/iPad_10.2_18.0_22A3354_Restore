@implementation HFNetworkConfigurationGroupItem

- (HFNetworkConfigurationGroupItem)initWithGroup:(id)a3 valueSource:(id)a4
{
  id v7;
  id v8;
  HFNetworkConfigurationGroupItem *v9;
  HFNetworkConfigurationGroupItem *v10;
  void *v11;
  void *v12;
  _QWORD v14[4];
  id v15;
  objc_super v16;

  v7 = a3;
  v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)HFNetworkConfigurationGroupItem;
  v9 = -[HFItemGroupItem init](&v16, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_group, a3);
    objc_storeStrong((id *)&v10->_valueSource, a4);
    -[HFNetworkConfigurationGroupItem profiles](v10, "profiles");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __61__HFNetworkConfigurationGroupItem_initWithGroup_valueSource___block_invoke;
    v14[3] = &unk_1EA735770;
    v15 = v8;
    objc_msgSend(v11, "na_map:", v14);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFItemGroupItem setItems:](v10, "setItems:", v12);

  }
  return v10;
}

HFNetworkConfigurationItem *__61__HFNetworkConfigurationGroupItem_initWithGroup_valueSource___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  HFNetworkConfigurationItem *v4;

  v3 = a2;
  v4 = -[HFAccessoryProfileItem initWithProfile:valueSource:]([HFNetworkConfigurationItem alloc], "initWithProfile:valueSource:", v3, *(_QWORD *)(a1 + 32));

  return v4;
}

- (HFNetworkConfigurationGroupItem)init
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_initWithGroup_valueSource_);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HFNetworkConfigurationGroupItem.m"), 39, CFSTR("%s is unavailable; use %@ instead"),
    "-[HFNetworkConfigurationGroupItem init]",
    v5);

  return 0;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  id v5;

  -[HFNetworkConfigurationGroupItem valueSource](self, "valueSource", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[HFNetworkConfigurationGroupItem copyWithValueSource:](self, "copyWithValueSource:", v4);

  return v5;
}

- (NSSet)profiles
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x1E0C99E60];
  -[HFNetworkConfigurationGroupItem group](self, "group");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "hf_networkConfigurationProfiles");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v5;
}

- (id)_subclass_updateWithOptions:(id)a3
{
  void *v4;
  void *v5;
  _QWORD v7[5];
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)HFNetworkConfigurationGroupItem;
  -[HFItemGroupItem _subclass_updateWithOptions:](&v8, sel__subclass_updateWithOptions_, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __63__HFNetworkConfigurationGroupItem__subclass_updateWithOptions___block_invoke;
  v7[3] = &unk_1EA7289C8;
  v7[4] = self;
  objc_msgSend(v4, "flatMap:", v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id __63__HFNetworkConfigurationGroupItem__subclass_updateWithOptions___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
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
  NSObject *v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  void *v38;
  unint64_t v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  NSObject *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  uint64_t v58;
  _BOOL8 v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  _QWORD v86[5];
  uint8_t buf[4];
  void *v88;
  __int16 v89;
  void *v90;
  __int16 v91;
  uint64_t v92;
  __int16 v93;
  uint64_t v94;
  __int16 v95;
  void *v96;
  uint64_t v97;

  v97 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_msgSend(a2, "mutableCopy");
  objc_msgSend(*(id *)(a1 + 32), "group");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "hf_home");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    HFLogForCategory(0x29uLL);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v71 = *(void **)(a1 + 32);
      objc_msgSend(v71, "group");
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v72, "hf_title");
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "group");
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218498;
      v88 = v71;
      v89 = 2112;
      v90 = v73;
      v91 = 2112;
      v92 = (uint64_t)v74;
      _os_log_error_impl(&dword_1DD34E000, v6, OS_LOG_TYPE_ERROR, "<HFNetworkConfigurationGroupItem %p (%@)>: Nil home for HMAccessoryNetworkProtectionGroup %@", buf, 0x20u);

    }
  }
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("dependentHomeKitObjects"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "mutableCopy");

  objc_msgSend(*(id *)(a1 + 32), "group");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addObject:", v9);

  objc_msgSend(v8, "na_safeAddObject:", v5);
  v85 = v8;
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("dependentHomeKitObjects"));
  objc_msgSend(*(id *)(a1 + 32), "group");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "hf_title");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("title"));

  objc_msgSend(*(id *)(a1 + 32), "group");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "manufacturer");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v13)
  {
    HFLogForCategory(0x29uLL);
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      v75 = *(void **)(a1 + 32);
      objc_msgSend(v75, "group");
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v76, "hf_title");
      v77 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "group");
      v78 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218498;
      v88 = v75;
      v89 = 2112;
      v90 = v77;
      v91 = 2112;
      v92 = (uint64_t)v78;
      _os_log_error_impl(&dword_1DD34E000, v14, OS_LOG_TYPE_ERROR, "<HFNetworkConfigurationGroupItem %p (%@)>: Nil manufacturer for HMAccessoryNetworkProtectionGroup %@", buf, 0x20u);

    }
  }
  v15 = (void *)MEMORY[0x1E0CBA1A8];
  objc_msgSend(*(id *)(a1 + 32), "group");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "category");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "categoryType");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "hf_userFriendlyLocalizedCapitalizedDescription:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v19)
  {
    HFLogForCategory(0x29uLL);
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      v79 = *(void **)(a1 + 32);
      objc_msgSend(v79, "group");
      v80 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v80, "hf_title");
      v81 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "group");
      v82 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218498;
      v88 = v79;
      v89 = 2112;
      v90 = v81;
      v91 = 2112;
      v92 = (uint64_t)v82;
      _os_log_error_impl(&dword_1DD34E000, v20, OS_LOG_TYPE_ERROR, "<HFNetworkConfigurationGroupItem %p (%@)>: Nil category for HMAccessoryNetworkProtectionGroup %@", buf, 0x20u);

    }
  }
  v21 = (void *)0x1E0CBA000;
  v22 = (void *)MEMORY[0x1E0CBA710];
  objc_msgSend(*(id *)(a1 + 32), "group");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "hf_localizedTitleForTargetProtectionMode:", objc_msgSend(v23, "targetProtectionMode"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v24, CFSTR("description"));

  objc_msgSend(v3, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("shouldHideForNonAdminUsers"));
  v25 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(*(id *)(a1 + 32), "group");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "numberWithInteger:", objc_msgSend(v26, "targetProtectionMode"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v27, CFSTR("HFResultNetworkConfigurationTargetProtectionMode"));

  v28 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(*(id *)(a1 + 32), "group");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "numberWithInteger:", objc_msgSend(v29, "hf_displayCurrentProtectionMode"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v30, CFSTR("HFResultNetworkConfigurationCurrentProtectionMode"));

  HFLogForCategory(0x29uLL);
  v31 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
  {
    v84 = v5;
    v32 = *(void **)(a1 + 32);
    objc_msgSend(v32, "group");
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v83, "hf_title");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("HFResultNetworkConfigurationTargetProtectionMode"));
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = objc_msgSend(v34, "unsignedLongValue");
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("HFResultNetworkConfigurationCurrentProtectionMode"));
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = objc_msgSend(v36, "unsignedLongValue");
    objc_msgSend(*(id *)(a1 + 32), "group");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134219010;
    v88 = v32;
    v5 = v84;
    v89 = 2112;
    v90 = v33;
    v91 = 2048;
    v92 = v35;
    v93 = 2048;
    v94 = v37;
    v95 = 2112;
    v96 = v38;
    _os_log_impl(&dword_1DD34E000, v31, OS_LOG_TYPE_DEFAULT, "<HFNetworkConfigurationGroupItem %p (%@)>: Protection mode to display (target %lu, current %lu) for HMAccessoryNetworkProtectionGroup %@", buf, 0x34u);

    v21 = (void *)0x1E0CBA000;
  }

  v39 = 0x1E0CB3000uLL;
  v40 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(*(id *)(a1 + 32), "profiles");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v86[0] = MEMORY[0x1E0C809B0];
  v86[1] = 3221225472;
  v86[2] = __63__HFNetworkConfigurationGroupItem__subclass_updateWithOptions___block_invoke_13;
  v86[3] = &unk_1EA735798;
  v86[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v40, "numberWithBool:", objc_msgSend(v41, "na_any:", v86));
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v42, CFSTR("HFResultNetworkConfigurationProtectionModeMismatch"));

  v43 = (void *)MEMORY[0x1E0CB37E8];
  v44 = (void *)MEMORY[0x1E0CBA710];
  objc_msgSend(*(id *)(a1 + 32), "group");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "numberWithInt:", objc_msgSend(v44, "hf_targetProtectionModeIsValid:", objc_msgSend(v45, "targetProtectionMode")) ^ 1);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v46, CFSTR("HFResultNetworkConfigurationInvalid"));

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("HFResultNetworkConfigurationInvalid"));
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v44) = objc_msgSend(v47, "BOOLValue");

  if ((_DWORD)v44)
  {
    HFLogForCategory(0x29uLL);
    v48 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
    {
      v66 = *(void **)(a1 + 32);
      objc_msgSend(v66, "group");
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v67, "hf_title");
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "group");
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = (void *)objc_msgSend(v69, "targetProtectionMode");
      objc_msgSend(*(id *)(a1 + 32), "group");
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218754;
      v88 = v66;
      v89 = 2112;
      v90 = v68;
      v91 = 2048;
      v92 = (uint64_t)v21;
      v93 = 2112;
      v94 = (uint64_t)v70;
      _os_log_error_impl(&dword_1DD34E000, v48, OS_LOG_TYPE_ERROR, "<HFNetworkConfigurationGroupItem %p (%@)>: Invalid targetProtectionMode %lu for HMAccessoryNetworkProtectionGroup %@", buf, 0x2Au);

      v39 = 0x1E0CB3000;
    }

  }
  objc_msgSend(*(id *)(v39 + 2024), "numberWithInt:", objc_msgSend(v5, "hf_isNetworkProtectionSupportedForAccessories") ^ 1);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v49, CFSTR("HFResultNetworkConfigurationUnsupported"));

  objc_msgSend(*(id *)(v39 + 2024), "numberWithInt:", objc_msgSend(v5, "hf_isNetworkProtectionEnabled") ^ 1);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v50, CFSTR("HFResultNetworkConfigurationDisabled"));

  objc_msgSend(*(id *)(a1 + 32), "profiles");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  +[HFNetworkConfigurationAllowedHostGroup groupsForNetworkConfigurationProfiles:](HFNetworkConfigurationAllowedHostGroup, "groupsForNetworkConfigurationProfiles:", v51);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v52, CFSTR("HFResultNetworkConfigurationAllowedHostGroups"));

  v53 = *(void **)(v39 + 2024);
  objc_msgSend(*(id *)(a1 + 32), "profiles");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "numberWithBool:", objc_msgSend(v54, "na_any:", &__block_literal_global_114));
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v55, CFSTR("HFResultNetworkConfigurationDisplayAllowedHostException"));

  v56 = *(void **)(v39 + 2024);
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("HFResultNetworkConfigurationAllowedHostGroups"));
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  v58 = objc_msgSend(v57, "count");
  if (v58)
  {
    objc_msgSend(*(id *)(a1 + 32), "profiles");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v59 = (unint64_t)objc_msgSend(v21, "count") > 1;
  }
  else
  {
    v59 = 0;
  }
  objc_msgSend(v56, "numberWithInt:", v59);
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v60, CFSTR("HFResultNetworkConfigurationDisplayAllowedHostMismatch"));

  if (v58)
  v61 = *(void **)(v39 + 2024);
  objc_msgSend(*(id *)(a1 + 32), "profiles");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "numberWithBool:", objc_msgSend(v62, "na_any:", &__block_literal_global_17_7));
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v63, CFSTR("HFResultNetworkConfigurationDisplayAccessViolation"));

  objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", v3);
  v64 = (void *)objc_claimAutoreleasedReturnValue();

  return v64;
}

uint64_t __63__HFNetworkConfigurationGroupItem__subclass_updateWithOptions___block_invoke_13(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  int v7;
  NSObject *v8;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  uint64_t v19;
  __int16 v20;
  uint64_t v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (void *)MEMORY[0x1E0CBA710];
  v5 = objc_msgSend(v3, "currentProtectionMode");
  objc_msgSend(*(id *)(a1 + 32), "group");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v4, "hf_currentProtectionMode:isValidForTargetProtectionMode:", v5, objc_msgSend(v6, "targetProtectionMode"));

  if ((v7 & 1) == 0)
  {
    HFLogForCategory(0x29uLL);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v10 = *(void **)(a1 + 32);
      objc_msgSend(v10, "group");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "hf_title");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "group");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 134219010;
      v15 = v10;
      v16 = 2112;
      v17 = v12;
      v18 = 2048;
      v19 = objc_msgSend(v13, "targetProtectionMode");
      v20 = 2048;
      v21 = objc_msgSend(v3, "currentProtectionMode");
      v22 = 2112;
      v23 = v3;
      _os_log_error_impl(&dword_1DD34E000, v8, OS_LOG_TYPE_ERROR, "<HFNetworkConfigurationGroupItem %p (%@)>: Protection mode mismatch (target %lu != current %lu) for HMNetworkConfigurationProfile %@", (uint8_t *)&v14, 0x34u);

    }
  }

  return v7 ^ 1u;
}

BOOL __63__HFNetworkConfigurationGroupItem__subclass_updateWithOptions___block_invoke_16(uint64_t a1, void *a2)
{
  id v2;
  _BOOL8 v3;

  v2 = a2;
  if (objc_msgSend(v2, "targetProtectionMode"))
    v3 = 0;
  else
    v3 = objc_msgSend(v2, "currentProtectionMode") == 4;

  return v3;
}

uint64_t __63__HFNetworkConfigurationGroupItem__subclass_updateWithOptions___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hf_hasCurrentNetworkAccessViolation");
}

- (id)copyWithValueSource:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;

  v4 = a3;
  v5 = objc_alloc((Class)objc_opt_class());
  -[HFNetworkConfigurationGroupItem group](self, "group");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initWithGroup:valueSource:", v6, v4);

  objc_msgSend(v7, "copyLatestResultsFromItem:", self);
  return v7;
}

- (HMAccessoryNetworkProtectionGroup)group
{
  return self->_group;
}

- (HFCharacteristicValueSource)valueSource
{
  return self->_valueSource;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_valueSource, 0);
  objc_storeStrong((id *)&self->_group, 0);
}

@end
