@implementation HUNetworkProtectionModeOptionItem

- (HUNetworkProtectionModeOptionItem)initWithGroup:(id)a3 targetProtectionModeOption:(int64_t)a4
{
  id v7;
  HUNetworkProtectionModeOptionItem *v8;
  HUNetworkProtectionModeOptionItem *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HUNetworkProtectionModeOptionItem;
  v8 = -[HUNetworkProtectionModeOptionItem init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_group, a3);
    v9->_targetProtectionModeOption = a4;
  }

  return v9;
}

- (id)_subclass_updateWithOptions:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  NSObject *v18;
  uint64_t v19;
  _BOOL4 v20;
  int v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  int v34;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  unsigned int v45;
  void *v46;
  void *v47;
  void *v48;
  _QWORD v49[5];
  _QWORD v50[7];
  _QWORD v51[7];
  uint8_t buf[4];
  void *v53;
  __int16 v54;
  void *v55;
  __int16 v56;
  uint64_t v57;
  __int16 v58;
  _BOOL4 v59;
  __int16 v60;
  int v61;
  __int16 v62;
  void *v63;
  __int16 v64;
  void *v65;
  __int16 v66;
  uint64_t v67;
  uint64_t v68;

  v3 = self;
  v68 = *MEMORY[0x1E0C80C00];
  v4 = (void *)MEMORY[0x1E0C99E20];
  -[HUNetworkProtectionModeOptionItem group](self, "group", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "hf_networkConfigurationProfiles");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setWithArray:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "group");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObject:", v8);

  objc_msgSend(v3, "group");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "hf_home");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = v7;
  objc_msgSend(v7, "na_safeAddObject:", v10);

  objc_msgSend(MEMORY[0x1E0CBA710], "hf_detailedLocalizedTitleForTargetProtectionMode:", objc_msgSend(v3, "targetProtectionModeOption"));
  v11 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "group");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "targetProtectionMode");
  v14 = objc_msgSend(v3, "targetProtectionModeOption");

  objc_msgSend(v3, "group");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "hf_networkConfigurationProfiles");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v49[0] = MEMORY[0x1E0C809B0];
  v49[1] = 3221225472;
  v49[2] = __65__HUNetworkProtectionModeOptionItem__subclass_updateWithOptions___block_invoke;
  v49[3] = &unk_1E6F53A20;
  v49[4] = v3;
  v17 = objc_msgSend(v16, "na_any:", v49);

  HFLogForCategory();
  v18 = objc_claimAutoreleasedReturnValue();
  v47 = (void *)v11;
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    v19 = objc_msgSend(v3, "targetProtectionModeOption");
    v20 = v13 == v14;
    v43 = v13;
    if (v13 == v14)
      v21 = v17;
    else
      v21 = 0;
    objc_msgSend(v3, "group");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "group");
    v45 = v17;
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "hf_title");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "group");
    v42 = v14;
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v25, "targetProtectionMode");
    *(_DWORD *)buf = 134219778;
    v53 = v3;
    v54 = 2112;
    v55 = v47;
    v56 = 2048;
    v57 = v19;
    v58 = 1024;
    v59 = v20;
    v11 = (uint64_t)v47;
    v60 = 1024;
    v61 = v21;
    v13 = v43;
    v62 = 2112;
    v63 = v22;
    v64 = 2112;
    v65 = v24;
    v66 = 2048;
    v67 = v26;
    _os_log_impl(&dword_1B8E1E000, v18, OS_LOG_TYPE_DEFAULT, "<HUNetworkProtectionModeOptionItem: %p \"%@\"/%lu> (selected=%{BOOL}d, updating=%{BOOL}d) for group (%@ \"%@\", target mode %lu)", buf, 0x4Au);

    v14 = v42;
    v17 = v45;

  }
  v44 = (void *)MEMORY[0x1E0D314B8];
  v27 = *MEMORY[0x1E0D30D18];
  v50[0] = *MEMORY[0x1E0D30B80];
  v50[1] = v27;
  v51[0] = v7;
  v51[1] = v11;
  v50[2] = *MEMORY[0x1E0D30BF8];
  objc_msgSend(MEMORY[0x1E0CBA710], "hf_detailedLocalizedDescriptionForTargetProtectionMode:", objc_msgSend(v3, "targetProtectionModeOption"));
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v51[2] = v46;
  v50[3] = *MEMORY[0x1E0D30DA0];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v13 == v14);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v51[3] = v28;
  v50[4] = *MEMORY[0x1E0D30EA8];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v17);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v51[4] = v29;
  v50[5] = *MEMORY[0x1E0D30DA8];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend((id)objc_opt_class(), "_priorityForTargetProtectionMode:", objc_msgSend(v3, "targetProtectionModeOption")));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v51[5] = v30;
  v50[6] = *MEMORY[0x1E0D30C80];
  v31 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v3, "group");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "hf_home");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = objc_msgSend(v33, "hf_isNetworkProtectionSupportedForAccessories");
  if (v34)
  {
    v35 = (void *)MEMORY[0x1E0CBA710];
    objc_msgSend(v3, "group");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = objc_msgSend(v35, "hf_targetProtectionModeIsValid:", objc_msgSend(v3, "targetProtectionMode")) ^ 1;
  }
  else
  {
    v36 = 1;
  }
  objc_msgSend(v31, "numberWithInt:", v36);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v51[6] = v37;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v51, v50, 7);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "outcomeWithResults:", v38);
  v39 = (void *)objc_claimAutoreleasedReturnValue();

  if (v34)
  objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", v39);
  v40 = (void *)objc_claimAutoreleasedReturnValue();

  return v40;
}

uint64_t __65__HUNetworkProtectionModeOptionItem__subclass_updateWithOptions___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;

  v3 = (void *)MEMORY[0x1E0CBA710];
  v4 = objc_msgSend(a2, "currentProtectionMode");
  objc_msgSend(*(id *)(a1 + 32), "group");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v3, "hf_currentProtectionMode:isValidForTargetProtectionMode:", v4, objc_msgSend(v5, "targetProtectionMode")) ^ 1;

  return v6;
}

+ (int64_t)_priorityForTargetProtectionMode:(int64_t)a3
{
  if ((unint64_t)a3 > 3)
    return 0;
  else
    return qword_1B94424D0[a3];
}

- (int64_t)targetProtectionModeOption
{
  return self->_targetProtectionModeOption;
}

- (HMAccessoryNetworkProtectionGroup)group
{
  return self->_group;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_group, 0);
}

@end
