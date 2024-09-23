@implementation HMHome(HFDebugging)

+ (uint64_t)hf_prefersAutoSynthesizedDescription
{
  return 1;
}

- (id)hf_stateDumpBuilderWithContext:()HFDebugging
{
  id v4;
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

  v4 = a3;
  +[HFStateDumpBuilder builderWithObject:context:](HFStateDumpBuilder, "builderWithObject:context:", a1, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "uniqueIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendObject:withName:options:", v6, CFSTR("UUID"), 2);

  objc_msgSend(a1, "name");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v7, CFSTR("name"));

  +[HFHomeKitDispatcher sharedDispatcher](HFHomeKitDispatcher, "sharedDispatcher");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "home");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendBool:withName:ifEqualTo:", v9 == a1, CFSTR("selected"), 1);

  if (objc_msgSend(v4, "detailLevel") == 2)
  {
    objc_msgSend(v5, "appendBool:withName:ifEqualTo:", objc_msgSend(a1, "isPrimary"), CFSTR("primary"), 1);
    objc_msgSend(v5, "appendBool:withName:ifEqualTo:", objc_msgSend(a1, "hf_isCurrentLocationHome"), CFSTR("currentLocation"), 1);
    objc_msgSend(v5, "appendBool:withName:ifEqualTo:", objc_msgSend(a1, "hf_shouldBlockCurrentUserFromHome"), CFSTR("userBlockedFromHome"), 1);
    objc_msgSend(a1, "accessories");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v10, CFSTR("accessories"));

    v11 = (void *)objc_msgSend(v4, "copy");
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithObject:forKey:", a1, CFSTR("HOME"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setUserInfo:", v12);
    objc_opt_self();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "hf_allUsersIncludingCurrentUser");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "appendObject:withName:context:", v14, CFSTR("users"), v11);

    objc_msgSend(a1, "residentDevices");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v15, CFSTR("residentDevices"));

    objc_msgSend(a1, "outgoingInvitations");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v16, CFSTR("outgoingInvitations"));

    objc_msgSend(a1, "serviceGroups");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v17, CFSTR("serviceGroups"));

    objc_msgSend(a1, "actionSets");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v18, CFSTR("actionSets"));

    objc_msgSend(a1, "triggers");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v19, CFSTR("triggers"));

    objc_msgSend(a1, "mediaSystems");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v20, CFSTR("mediaSystems"));

    objc_msgSend(a1, "hf_allRooms");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = (void *)objc_msgSend(v4, "copyWithDetailLevel:", 0);
    objc_msgSend(v5, "appendObject:withName:context:", v21, CFSTR("rooms"), v22);

    objc_msgSend(a1, "hf_personalRequestAccessories");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "na_map:", &__block_literal_global_119_0);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    v25 = (void *)objc_msgSend(v4, "copyWithDetailLevel:", 0);
    objc_msgSend(v5, "appendObject:withName:context:", v24, CFSTR("personalRequestsAccessories"), v25);

    objc_msgSend(a1, "hf_tvViewingProfilesAccessories");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "na_map:", &__block_literal_global_124);
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    v28 = (void *)objc_msgSend(v4, "copyWithDetailLevel:", 0);
    objc_msgSend(v5, "appendObject:withName:context:", v27, CFSTR("tvViewingProfilesAccessories"), v28);

    objc_msgSend(v5, "appendBool:withName:ifEqualTo:", objc_msgSend(a1, "isMultiUserEnabled"), CFSTR("isMultiUserEnabled"), 0);
    objc_msgSend(v5, "appendBool:withName:ifEqualTo:", objc_msgSend(a1, "hf_homeHasMigratedIntoHomeApp"), CFSTR("hasMigratedIntoHomeApp"), 0);
    objc_msgSend(v5, "appendBool:withName:ifEqualTo:", objc_msgSend(a1, "hf_homeHasMigratedServicesToAccessories"), CFSTR("hasMigratedServiceNames"), 0);
    objc_msgSend(v5, "appendBool:withName:ifEqualTo:", objc_msgSend(a1, "areBulletinNotificationsSupported"), CFSTR("bulletinNotificationSupport"), 0);
    objc_msgSend(v5, "appendBool:withName:ifEqualTo:", objc_msgSend(a1, "isEventLogEnabled"), CFSTR("eventLogEnabled"), 1);

  }
  return v5;
}

@end
