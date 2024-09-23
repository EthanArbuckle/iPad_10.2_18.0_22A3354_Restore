@implementation MOGameCenterSettingsGroup

+ (id)groupName
{
  return CFSTR("gameCenter");
}

- (NSString)allowedOtherPlayerTypes
{
  return (NSString *)-[MOSettingsGroup valueForSetting:](self, "valueForSetting:", CFSTR("allowedOtherPlayerTypes"));
}

- (void)setAllowedOtherPlayerTypes:(id)a3
{
  -[MOSettingsGroup setValue:forSetting:](self, "setValue:forSetting:", a3, CFSTR("allowedOtherPlayerTypes"));
}

+ (MOStringSettingMetadata)allowedOtherPlayerTypesMetadata
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __60__MOGameCenterSettingsGroup_allowedOtherPlayerTypesMetadata__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (allowedOtherPlayerTypesMetadata_onceToken != -1)
    dispatch_once(&allowedOtherPlayerTypesMetadata_onceToken, block);
  return (MOStringSettingMetadata *)(id)allowedOtherPlayerTypesMetadata_metadata;
}

void __60__MOGameCenterSettingsGroup_allowedOtherPlayerTypesMetadata__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  MOStringSettingMetadata *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  _QWORD v8[3];
  _QWORD v9[4];

  v9[3] = *MEMORY[0x1E0C80C00];
  v0 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend((id)objc_opt_class(), "groupName");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "stringWithFormat:", CFSTR("%@.%@"), v1, CFSTR("allowedOtherPlayerTypes"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  v3 = [MOStringSettingMetadata alloc];
  v8[0] = CFSTR("none");
  v8[1] = CFSTR("friendsOnly");
  v9[0] = &unk_1E6768B30;
  v9[1] = &unk_1E6768B48;
  v8[2] = CFSTR("everyone");
  v9[2] = &unk_1E6768B60;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, v8, 3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v7) = 0;
  v5 = -[MOStringSettingMetadata initWithSettingName:defaultString:combineOperator:rankedAllowedValues:isPublic:scope:isPrivacySensitive:](v3, "initWithSettingName:defaultString:combineOperator:rankedAllowedValues:isPublic:scope:isPrivacySensitive:", v2, CFSTR("everyone"), 0, v4, 0, CFSTR("user"), v7);
  v6 = (void *)allowedOtherPlayerTypesMetadata_metadata;
  allowedOtherPlayerTypesMetadata_metadata = v5;

}

- (NSNumber)denyAddingFriends
{
  return (NSNumber *)-[MOSettingsGroup valueForSetting:](self, "valueForSetting:", CFSTR("denyAddingFriends"));
}

- (void)setDenyAddingFriends:(id)a3
{
  -[MOSettingsGroup setValue:forSetting:](self, "setValue:forSetting:", a3, CFSTR("denyAddingFriends"));
}

+ (MOBoolSettingMetadata)denyAddingFriendsMetadata
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __54__MOGameCenterSettingsGroup_denyAddingFriendsMetadata__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (denyAddingFriendsMetadata_onceToken != -1)
    dispatch_once(&denyAddingFriendsMetadata_onceToken, block);
  return (MOBoolSettingMetadata *)(id)denyAddingFriendsMetadata_metadata;
}

void __54__MOGameCenterSettingsGroup_denyAddingFriendsMetadata__block_invoke()
{
  void *v0;
  void *v1;
  MOBoolSettingMetadata *v2;
  void *v3;
  id v4;

  v0 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend((id)objc_opt_class(), "groupName");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "stringWithFormat:", CFSTR("%@.%@"), v1, CFSTR("denyAddingFriends"));
  v4 = (id)objc_claimAutoreleasedReturnValue();

  v2 = -[MOBoolSettingMetadata initWithSettingName:defaultBool:combineOperator:isPublic:scope:isPrivacySensitive:]([MOBoolSettingMetadata alloc], "initWithSettingName:defaultBool:combineOperator:isPublic:scope:isPrivacySensitive:", v4, 0, 0, 1, CFSTR("user"), 0);
  v3 = (void *)denyAddingFriendsMetadata_metadata;
  denyAddingFriendsMetadata_metadata = (uint64_t)v2;

}

- (NSNumber)denyGameCenter
{
  return (NSNumber *)-[MOSettingsGroup valueForSetting:](self, "valueForSetting:", CFSTR("denyGameCenter"));
}

- (void)setDenyGameCenter:(id)a3
{
  -[MOSettingsGroup setValue:forSetting:](self, "setValue:forSetting:", a3, CFSTR("denyGameCenter"));
}

+ (MOBoolSettingMetadata)denyGameCenterMetadata
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __51__MOGameCenterSettingsGroup_denyGameCenterMetadata__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (denyGameCenterMetadata_onceToken != -1)
    dispatch_once(&denyGameCenterMetadata_onceToken, block);
  return (MOBoolSettingMetadata *)(id)denyGameCenterMetadata_metadata;
}

void __51__MOGameCenterSettingsGroup_denyGameCenterMetadata__block_invoke()
{
  void *v0;
  void *v1;
  MOBoolSettingMetadata *v2;
  void *v3;
  id v4;

  v0 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend((id)objc_opt_class(), "groupName");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "stringWithFormat:", CFSTR("%@.%@"), v1, CFSTR("denyGameCenter"));
  v4 = (id)objc_claimAutoreleasedReturnValue();

  v2 = -[MOBoolSettingMetadata initWithSettingName:defaultBool:combineOperator:isPublic:scope:isPrivacySensitive:]([MOBoolSettingMetadata alloc], "initWithSettingName:defaultBool:combineOperator:isPublic:scope:isPrivacySensitive:", v4, 0, 0, 0, CFSTR("user"), 0);
  v3 = (void *)denyGameCenterMetadata_metadata;
  denyGameCenterMetadata_metadata = (uint64_t)v2;

}

- (NSNumber)denyMultiplayerGaming
{
  return (NSNumber *)-[MOSettingsGroup valueForSetting:](self, "valueForSetting:", CFSTR("denyMultiplayerGaming"));
}

- (void)setDenyMultiplayerGaming:(id)a3
{
  -[MOSettingsGroup setValue:forSetting:](self, "setValue:forSetting:", a3, CFSTR("denyMultiplayerGaming"));
}

+ (MOBoolSettingMetadata)denyMultiplayerGamingMetadata
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __58__MOGameCenterSettingsGroup_denyMultiplayerGamingMetadata__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (denyMultiplayerGamingMetadata_onceToken != -1)
    dispatch_once(&denyMultiplayerGamingMetadata_onceToken, block);
  return (MOBoolSettingMetadata *)(id)denyMultiplayerGamingMetadata_metadata;
}

void __58__MOGameCenterSettingsGroup_denyMultiplayerGamingMetadata__block_invoke()
{
  void *v0;
  void *v1;
  MOBoolSettingMetadata *v2;
  void *v3;
  id v4;

  v0 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend((id)objc_opt_class(), "groupName");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "stringWithFormat:", CFSTR("%@.%@"), v1, CFSTR("denyMultiplayerGaming"));
  v4 = (id)objc_claimAutoreleasedReturnValue();

  v2 = -[MOBoolSettingMetadata initWithSettingName:defaultBool:combineOperator:isPublic:scope:isPrivacySensitive:]([MOBoolSettingMetadata alloc], "initWithSettingName:defaultBool:combineOperator:isPublic:scope:isPrivacySensitive:", v4, 0, 0, 1, CFSTR("user"), 0);
  v3 = (void *)denyMultiplayerGamingMetadata_metadata;
  denyMultiplayerGamingMetadata_metadata = (uint64_t)v2;

}

- (NSNumber)denyNearbyMultiplayer
{
  return (NSNumber *)-[MOSettingsGroup valueForSetting:](self, "valueForSetting:", CFSTR("denyNearbyMultiplayer"));
}

- (void)setDenyNearbyMultiplayer:(id)a3
{
  -[MOSettingsGroup setValue:forSetting:](self, "setValue:forSetting:", a3, CFSTR("denyNearbyMultiplayer"));
}

+ (MOBoolSettingMetadata)denyNearbyMultiplayerMetadata
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __58__MOGameCenterSettingsGroup_denyNearbyMultiplayerMetadata__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (denyNearbyMultiplayerMetadata_onceToken != -1)
    dispatch_once(&denyNearbyMultiplayerMetadata_onceToken, block);
  return (MOBoolSettingMetadata *)(id)denyNearbyMultiplayerMetadata_metadata;
}

void __58__MOGameCenterSettingsGroup_denyNearbyMultiplayerMetadata__block_invoke()
{
  void *v0;
  void *v1;
  MOBoolSettingMetadata *v2;
  void *v3;
  id v4;

  v0 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend((id)objc_opt_class(), "groupName");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "stringWithFormat:", CFSTR("%@.%@"), v1, CFSTR("denyNearbyMultiplayer"));
  v4 = (id)objc_claimAutoreleasedReturnValue();

  v2 = -[MOBoolSettingMetadata initWithSettingName:defaultBool:combineOperator:isPublic:scope:isPrivacySensitive:]([MOBoolSettingMetadata alloc], "initWithSettingName:defaultBool:combineOperator:isPublic:scope:isPrivacySensitive:", v4, 0, 0, 0, CFSTR("user"), 0);
  v3 = (void *)denyNearbyMultiplayerMetadata_metadata;
  denyNearbyMultiplayerMetadata_metadata = (uint64_t)v2;

}

- (NSNumber)denyPrivateMessaging
{
  return (NSNumber *)-[MOSettingsGroup valueForSetting:](self, "valueForSetting:", CFSTR("denyPrivateMessaging"));
}

- (void)setDenyPrivateMessaging:(id)a3
{
  -[MOSettingsGroup setValue:forSetting:](self, "setValue:forSetting:", a3, CFSTR("denyPrivateMessaging"));
}

+ (MOBoolSettingMetadata)denyPrivateMessagingMetadata
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __57__MOGameCenterSettingsGroup_denyPrivateMessagingMetadata__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (denyPrivateMessagingMetadata_onceToken != -1)
    dispatch_once(&denyPrivateMessagingMetadata_onceToken, block);
  return (MOBoolSettingMetadata *)(id)denyPrivateMessagingMetadata_metadata;
}

void __57__MOGameCenterSettingsGroup_denyPrivateMessagingMetadata__block_invoke()
{
  void *v0;
  void *v1;
  MOBoolSettingMetadata *v2;
  void *v3;
  id v4;

  v0 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend((id)objc_opt_class(), "groupName");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "stringWithFormat:", CFSTR("%@.%@"), v1, CFSTR("denyPrivateMessaging"));
  v4 = (id)objc_claimAutoreleasedReturnValue();

  v2 = -[MOBoolSettingMetadata initWithSettingName:defaultBool:combineOperator:isPublic:scope:isPrivacySensitive:]([MOBoolSettingMetadata alloc], "initWithSettingName:defaultBool:combineOperator:isPublic:scope:isPrivacySensitive:", v4, 0, 0, 0, CFSTR("user"), 0);
  v3 = (void *)denyPrivateMessagingMetadata_metadata;
  denyPrivateMessagingMetadata_metadata = (uint64_t)v2;

}

- (NSNumber)lockFriendsSharing
{
  return (NSNumber *)-[MOSettingsGroup valueForSetting:](self, "valueForSetting:", CFSTR("lockFriendsSharing"));
}

- (void)setLockFriendsSharing:(id)a3
{
  -[MOSettingsGroup setValue:forSetting:](self, "setValue:forSetting:", a3, CFSTR("lockFriendsSharing"));
}

+ (MOBoolSettingMetadata)lockFriendsSharingMetadata
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __55__MOGameCenterSettingsGroup_lockFriendsSharingMetadata__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (lockFriendsSharingMetadata_onceToken != -1)
    dispatch_once(&lockFriendsSharingMetadata_onceToken, block);
  return (MOBoolSettingMetadata *)(id)lockFriendsSharingMetadata_metadata;
}

void __55__MOGameCenterSettingsGroup_lockFriendsSharingMetadata__block_invoke()
{
  void *v0;
  void *v1;
  MOBoolSettingMetadata *v2;
  void *v3;
  id v4;

  v0 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend((id)objc_opt_class(), "groupName");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "stringWithFormat:", CFSTR("%@.%@"), v1, CFSTR("lockFriendsSharing"));
  v4 = (id)objc_claimAutoreleasedReturnValue();

  v2 = -[MOBoolSettingMetadata initWithSettingName:defaultBool:combineOperator:isPublic:scope:isPrivacySensitive:]([MOBoolSettingMetadata alloc], "initWithSettingName:defaultBool:combineOperator:isPublic:scope:isPrivacySensitive:", v4, 0, 0, 0, CFSTR("user"), 0);
  v3 = (void *)lockFriendsSharingMetadata_metadata;
  lockFriendsSharingMetadata_metadata = (uint64_t)v2;

}

- (NSNumber)lockProfile
{
  return (NSNumber *)-[MOSettingsGroup valueForSetting:](self, "valueForSetting:", CFSTR("lockProfile"));
}

- (void)setLockProfile:(id)a3
{
  -[MOSettingsGroup setValue:forSetting:](self, "setValue:forSetting:", a3, CFSTR("lockProfile"));
}

+ (MOBoolSettingMetadata)lockProfileMetadata
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __48__MOGameCenterSettingsGroup_lockProfileMetadata__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (lockProfileMetadata_onceToken != -1)
    dispatch_once(&lockProfileMetadata_onceToken, block);
  return (MOBoolSettingMetadata *)(id)lockProfileMetadata_metadata;
}

void __48__MOGameCenterSettingsGroup_lockProfileMetadata__block_invoke()
{
  void *v0;
  void *v1;
  MOBoolSettingMetadata *v2;
  void *v3;
  id v4;

  v0 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend((id)objc_opt_class(), "groupName");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "stringWithFormat:", CFSTR("%@.%@"), v1, CFSTR("lockProfile"));
  v4 = (id)objc_claimAutoreleasedReturnValue();

  v2 = -[MOBoolSettingMetadata initWithSettingName:defaultBool:combineOperator:isPublic:scope:isPrivacySensitive:]([MOBoolSettingMetadata alloc], "initWithSettingName:defaultBool:combineOperator:isPublic:scope:isPrivacySensitive:", v4, 0, 0, 0, CFSTR("user"), 0);
  v3 = (void *)lockProfileMetadata_metadata;
  lockProfileMetadata_metadata = (uint64_t)v2;

}

- (NSNumber)lockProfilePrivacy
{
  return (NSNumber *)-[MOSettingsGroup valueForSetting:](self, "valueForSetting:", CFSTR("lockProfilePrivacy"));
}

- (void)setLockProfilePrivacy:(id)a3
{
  -[MOSettingsGroup setValue:forSetting:](self, "setValue:forSetting:", a3, CFSTR("lockProfilePrivacy"));
}

+ (MOBoolSettingMetadata)lockProfilePrivacyMetadata
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __55__MOGameCenterSettingsGroup_lockProfilePrivacyMetadata__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (lockProfilePrivacyMetadata_onceToken != -1)
    dispatch_once(&lockProfilePrivacyMetadata_onceToken, block);
  return (MOBoolSettingMetadata *)(id)lockProfilePrivacyMetadata_metadata;
}

void __55__MOGameCenterSettingsGroup_lockProfilePrivacyMetadata__block_invoke()
{
  void *v0;
  void *v1;
  MOBoolSettingMetadata *v2;
  void *v3;
  id v4;

  v0 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend((id)objc_opt_class(), "groupName");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "stringWithFormat:", CFSTR("%@.%@"), v1, CFSTR("lockProfilePrivacy"));
  v4 = (id)objc_claimAutoreleasedReturnValue();

  v2 = -[MOBoolSettingMetadata initWithSettingName:defaultBool:combineOperator:isPublic:scope:isPrivacySensitive:]([MOBoolSettingMetadata alloc], "initWithSettingName:defaultBool:combineOperator:isPublic:scope:isPrivacySensitive:", v4, 0, 0, 0, CFSTR("user"), 0);
  v3 = (void *)lockProfilePrivacyMetadata_metadata;
  lockProfilePrivacyMetadata_metadata = (uint64_t)v2;

}

@end
