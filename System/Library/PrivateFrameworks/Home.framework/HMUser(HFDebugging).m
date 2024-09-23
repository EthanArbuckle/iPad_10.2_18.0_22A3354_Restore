@implementation HMUser(HFDebugging)

- (id)hf_stateDumpBuilderWithContext:()HFDebugging
{
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
  const __CFString *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  const __CFString *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  _QWORD v37[5];

  v4 = (void *)objc_msgSend(a3, "copyWithOutputStyle:", 3);
  objc_msgSend(v4, "userInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("HOME"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    +[HFHomeKitDispatcher sharedDispatcher](HFHomeKitDispatcher, "sharedDispatcher");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "homeManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "homes");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v37[0] = MEMORY[0x1E0C809B0];
    v37[1] = 3221225472;
    v37[2] = __54__HMUser_HFDebugging__hf_stateDumpBuilderWithContext___block_invoke;
    v37[3] = &unk_1EA72B630;
    v37[4] = a1;
    objc_msgSend(v9, "na_firstObjectPassingTest:", v37);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  +[HFStateDumpBuilder builderWithObject:context:](HFStateDumpBuilder, "builderWithObject:context:", a1, v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "uniqueIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "appendObject:withName:options:", v11, CFSTR("UUID"), 2);

  objc_msgSend(a1, "name");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObject:forKeyedSubscript:", v12, CFSTR("name"));

  objc_msgSend(v6, "currentUser");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13 == a1)
  {
    objc_msgSend(v10, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("isCurrentUserOnHome"));
    if ((objc_msgSend(v6, "hf_currentUserIsOwner") & 1) != 0)
    {
      v14 = CFSTR("isOwner");
    }
    else if (objc_msgSend(v6, "hf_currentUserIsAdministrator"))
    {
      v14 = CFSTR("isAdminUser");
    }
    else
    {
      v14 = CFSTR("isSharedUser");
    }
    objc_msgSend(v10, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], v14);
  }
  if (_os_feature_enabled_impl() && objc_msgSend(v6, "hf_userIsRestrictedGuest:", a1))
  {
    objc_msgSend(v10, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("isRestrictedGuest"));
    objc_msgSend(v6, "homeAccessControlForUser:", a1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "restrictedGuestAccessSettings");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v16, "guestAccessSchedule");
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = (void *)v17;
    if (v17)
      v19 = (const __CFString *)v17;
    else
      v19 = CFSTR("Always allowed");
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v19, CFSTR("restrictedGuestSchedule"));
    objc_msgSend(v16, "accessAllowedToAccessories");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "na_map:", &__block_literal_global_331);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    v22 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v16, "accessAllowedToAccessories");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "stringWithFormat:", CFSTR("(%ld accessories) %@"), objc_msgSend(v23, "count"), v21);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v24, CFSTR("restrictedGuestAccessAllowedToAccessories"));

    if (objc_msgSend(v4, "detailLevel") == 2)
    {
      objc_msgSend(v16, "locksWithReducedFunctionalityDueToSchedule");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "na_map:", &__block_literal_global_331);
      v26 = objc_claimAutoreleasedReturnValue();

      v27 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v16, "locksWithReducedFunctionalityDueToSchedule");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "stringWithFormat:", CFSTR("(%ld accessories) %@"), objc_msgSend(v28, "count"), v26);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setObject:forKeyedSubscript:", v29, CFSTR("restrictedGuestLocksWithReducedFunctionalityDueToSchedule"));

      v21 = (void *)v26;
    }

  }
  if (objc_msgSend(v4, "detailLevel") == 2)
  {
    objc_msgSend(a1, "userID");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v30, CFSTR("userID"));

    objc_msgSend(a1, "pendingAccessoryInvitations");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = (void *)objc_msgSend(v4, "copyWithDetailLevel:", 0);
    objc_msgSend(v10, "appendObject:withName:context:options:", v31, CFSTR("pendingAccessoryInvitations"), v32, 1);

    objc_msgSend(a1, "userSettingsForHome:", v6);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "settings");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v34, CFSTR("settings"));

    objc_msgSend(v33, "privateSettings");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v35, CFSTR("privateSettings"));

  }
  return v10;
}

@end
