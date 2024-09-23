@implementation HFNetworkConfigurationItem

+ (id)defaultItemComparator
{
  return &__block_literal_global_117;
}

uint64_t __51__HFNetworkConfigurationItem_defaultItemComparator__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
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
  uint64_t v24;
  void *v25;
  void *v26;
  uint64_t (**v27)(_QWORD, _QWORD, _QWORD);
  void *v29;

  v4 = a2;
  v5 = a3;
  v6 = objc_opt_class();
  v7 = v4;
  if (!v7)
    goto LABEL_7;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v8 = v7;
  else
    v8 = 0;
  v9 = v7;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "id  _Nullable NAAssertCast(Class  _Nonnull __unsafe_unretained, id  _Nonnull __strong)");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInFunction:file:lineNumber:description:", v11, CFSTR("NSObject+NAAdditions.h"), 54, CFSTR("Expected class of %@ but was %@"), v6, objc_opt_class());

LABEL_7:
    v9 = 0;
  }

  v12 = objc_opt_class();
  v13 = v5;
  if (v13)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v14 = v13;
    else
      v14 = 0;
    v15 = v13;
    if (v14)
      goto LABEL_15;
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "id  _Nullable NAAssertCast(Class  _Nonnull __unsafe_unretained, id  _Nonnull __strong)");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInFunction:file:lineNumber:description:", v17, CFSTR("NSObject+NAAdditions.h"), 54, CFSTR("Expected class of %@ but was %@"), v12, objc_opt_class());

  }
  v15 = 0;
LABEL_15:

  v29 = v9;
  objc_msgSend(v9, "accessory");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "accessory");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "room");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "name");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "room");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "name");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v21, "compare:", v23);

  if (!v24)
  {
    objc_msgSend(v18, "name");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "name");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v25, "compare:", v26);

    if (!v24)
    {
      +[HFItemSection defaultItemComparator](HFItemSection, "defaultItemComparator");
      v27 = (uint64_t (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      v24 = ((uint64_t (**)(_QWORD, id, id))v27)[2](v27, v7, v13);

    }
  }

  return v24;
}

- (id)_subclass_updateWithOptions:(id)a3
{
  void *v4;
  void *v5;
  _QWORD v7[5];
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)HFNetworkConfigurationItem;
  -[HFAccessoryProfileItem _subclass_updateWithOptions:](&v8, sel__subclass_updateWithOptions_, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __58__HFNetworkConfigurationItem__subclass_updateWithOptions___block_invoke;
  v7[3] = &unk_1EA7289C8;
  v7[4] = self;
  objc_msgSend(v4, "flatMap:", v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id __58__HFNetworkConfigurationItem__subclass_updateWithOptions___block_invoke(uint64_t a1, void *a2)
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
  uint64_t v44;
  _BOOL8 v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;

  v3 = (void *)objc_msgSend(a2, "mutableCopy");
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("dependentHomeKitObjects"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "mutableCopy");

  objc_msgSend(*(id *)(a1 + 32), "profile");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "accessory");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "home");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v8);

  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("dependentHomeKitObjects"));
  objc_msgSend(*(id *)(a1 + 32), "profile");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "accessory");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "name");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("title"));

  objc_msgSend(v3, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("shouldHideForNonAdminUsers"));
  v12 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(*(id *)(a1 + 32), "profile");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "numberWithInteger:", objc_msgSend(v13, "currentProtectionMode"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("HFResultNetworkConfigurationTargetProtectionMode"));

  v15 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(*(id *)(a1 + 32), "profile");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "numberWithInteger:", objc_msgSend(v16, "targetProtectionMode"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v17, CFSTR("HFResultNetworkConfigurationCurrentProtectionMode"));

  v18 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(*(id *)(a1 + 32), "profile");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "numberWithInt:", objc_msgSend(v19, "hf_targetProtectionModeIsValid") ^ 1);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v20, CFSTR("HFResultNetworkConfigurationInvalid"));

  v21 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(*(id *)(a1 + 32), "profile");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "accessory");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "home");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "numberWithInt:", objc_msgSend(v24, "hf_isNetworkProtectionSupportedForAccessories") ^ 1);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v25, CFSTR("HFResultNetworkConfigurationUnsupported"));

  v26 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(*(id *)(a1 + 32), "profile");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "accessory");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "home");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "numberWithInt:", objc_msgSend(v29, "hf_isNetworkProtectionEnabled") ^ 1);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v30, CFSTR("HFResultNetworkConfigurationDisabled"));

  objc_msgSend(*(id *)(a1 + 32), "profile");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "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");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v32, CFSTR("description"));

  v33 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(*(id *)(a1 + 32), "profile");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "numberWithBool:", objc_msgSend(v34, "hf_hasProtectionModeMismatch"));
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v35, CFSTR("HFResultNetworkConfigurationProtectionModeMismatch"));

  objc_msgSend(*(id *)(a1 + 32), "profile");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "allowedHosts");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v37, CFSTR("HFResultNetworkConfigurationAllowedHosts"));

  v38 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend(*(id *)(a1 + 32), "profile");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "setWithObject:", v39);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  +[HFNetworkConfigurationAllowedHostGroup groupsForNetworkConfigurationProfiles:](HFNetworkConfigurationAllowedHostGroup, "groupsForNetworkConfigurationProfiles:", v40);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v41, CFSTR("HFResultNetworkConfigurationAllowedHostGroups"));

  v42 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(*(id *)(a1 + 32), "profile");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = objc_msgSend(v43, "targetProtectionMode");
  if (v44)
  {
    v45 = 0;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "profile");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = objc_msgSend(v29, "currentProtectionMode") == 4;
  }
  objc_msgSend(v42, "numberWithInt:", v45);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v46, CFSTR("HFResultNetworkConfigurationDisplayAllowedHostException"));

  if (!v44)
  objc_msgSend(v3, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAA0], CFSTR("HFResultNetworkConfigurationDisplayAllowedHostMismatch"));
  v47 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(*(id *)(a1 + 32), "profile");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "numberWithBool:", objc_msgSend(v48, "hf_hasCurrentNetworkAccessViolation"));
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v49, CFSTR("HFResultNetworkConfigurationDisplayAccessViolation"));

  v50 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(*(id *)(a1 + 32), "profile");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "numberWithBool:", objc_msgSend(v51, "hf_requiresManualWiFiReconfiguration"));
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v52, CFSTR("HFResultNetworkConfigurationRequiresManualWiFiReconfiguration"));

  objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", v3);
  v53 = (void *)objc_claimAutoreleasedReturnValue();

  return v53;
}

@end
