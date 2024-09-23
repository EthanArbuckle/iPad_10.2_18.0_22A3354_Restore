@implementation MOFindMySettingsGroup

+ (id)groupName
{
  return CFSTR("findMy");
}

- (NSNumber)lockFindMyFriends
{
  return (NSNumber *)-[MOSettingsGroup valueForSetting:](self, "valueForSetting:", CFSTR("lockFindMyFriends"));
}

- (void)setLockFindMyFriends:(id)a3
{
  -[MOSettingsGroup setValue:forSetting:](self, "setValue:forSetting:", a3, CFSTR("lockFindMyFriends"));
}

+ (MOBoolSettingMetadata)lockFindMyFriendsMetadata
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __50__MOFindMySettingsGroup_lockFindMyFriendsMetadata__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (lockFindMyFriendsMetadata_onceToken != -1)
    dispatch_once(&lockFindMyFriendsMetadata_onceToken, block);
  return (MOBoolSettingMetadata *)(id)lockFindMyFriendsMetadata_metadata;
}

void __50__MOFindMySettingsGroup_lockFindMyFriendsMetadata__block_invoke()
{
  void *v0;
  void *v1;
  MOBoolSettingMetadata *v2;
  void *v3;
  id v4;

  v0 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend((id)objc_opt_class(), "groupName");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "stringWithFormat:", CFSTR("%@.%@"), v1, CFSTR("lockFindMyFriends"));
  v4 = (id)objc_claimAutoreleasedReturnValue();

  v2 = -[MOBoolSettingMetadata initWithSettingName:defaultBool:combineOperator:isPublic:scope:isPrivacySensitive:]([MOBoolSettingMetadata alloc], "initWithSettingName:defaultBool:combineOperator:isPublic:scope:isPrivacySensitive:", v4, 0, 0, 0, CFSTR("user"), 0);
  v3 = (void *)lockFindMyFriendsMetadata_metadata;
  lockFindMyFriendsMetadata_metadata = (uint64_t)v2;

}

@end
