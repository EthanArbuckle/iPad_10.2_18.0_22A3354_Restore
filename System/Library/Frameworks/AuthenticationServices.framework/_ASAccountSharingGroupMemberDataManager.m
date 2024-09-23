@implementation _ASAccountSharingGroupMemberDataManager

- (_ASAccountSharingGroupMemberDataManager)init
{
  _ASAccountSharingGroupMemberDataManager *v2;
  ACAccountStore *v3;
  ACAccountStore *accountStore;
  CNAvatarImageRenderer *v5;
  CNAvatarImageRenderer *avatarImageRenderer;
  void *v7;
  objc_class *v8;
  id v9;
  void *v10;
  uint64_t v11;
  AAUIProfilePictureStore *profilePictureStore;
  uint64_t v13;
  NSMutableDictionary *avatarImageDiameterToRenderingScopes;
  id v15;
  void *v16;
  uint64_t v17;
  CNContactStore *contactStore;
  NSCache *v19;
  NSCache *contactsCache;
  void *v21;
  _ASAccountSharingGroupMemberDataManager *v22;
  objc_super v24;
  _QWORD v25[5];
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t v29;

  v24.receiver = self;
  v24.super_class = (Class)_ASAccountSharingGroupMemberDataManager;
  v2 = -[_ASAccountSharingGroupMemberDataManager init](&v24, sel_init);
  if (v2)
  {
    v3 = (ACAccountStore *)objc_alloc_init(MEMORY[0x24BDB4398]);
    accountStore = v2->_accountStore;
    v2->_accountStore = v3;

    v5 = (CNAvatarImageRenderer *)objc_alloc_init(MEMORY[0x24BDBAE38]);
    avatarImageRenderer = v2->_avatarImageRenderer;
    v2->_avatarImageRenderer = v5;

    v26 = 0;
    v27 = &v26;
    v28 = 0x2050000000;
    v7 = (void *)getAAUIProfilePictureStoreClass_softClass;
    v29 = getAAUIProfilePictureStoreClass_softClass;
    if (!getAAUIProfilePictureStoreClass_softClass)
    {
      v25[0] = MEMORY[0x24BDAC760];
      v25[1] = 3221225472;
      v25[2] = __getAAUIProfilePictureStoreClass_block_invoke;
      v25[3] = &unk_24C94F880;
      v25[4] = &v26;
      __getAAUIProfilePictureStoreClass_block_invoke((uint64_t)v25);
      v7 = (void *)v27[3];
    }
    v8 = objc_retainAutorelease(v7);
    _Block_object_dispose(&v26, 8);
    v9 = [v8 alloc];
    -[ACAccountStore aa_primaryAppleAccount](v2->_accountStore, "aa_primaryAppleAccount");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "initWithAppleAccount:store:", v10, v2->_accountStore);
    profilePictureStore = v2->_profilePictureStore;
    v2->_profilePictureStore = (AAUIProfilePictureStore *)v11;

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v13 = objc_claimAutoreleasedReturnValue();
    avatarImageDiameterToRenderingScopes = v2->_avatarImageDiameterToRenderingScopes;
    v2->_avatarImageDiameterToRenderingScopes = (NSMutableDictionary *)v13;

    v15 = objc_alloc_init(MEMORY[0x24BDBAD00]);
    objc_msgSend(CFSTR("com.apple.Passwords"), "UTF8String");
    v16 = (void *)tcc_identity_create();
    objc_msgSend(v15, "setAssumedIdentity:", v16);

    v17 = objc_msgSend(objc_alloc(MEMORY[0x24BDBACF8]), "initWithConfiguration:", v15);
    contactStore = v2->_contactStore;
    v2->_contactStore = (CNContactStore *)v17;

    v19 = (NSCache *)objc_alloc_init(MEMORY[0x24BDBCE40]);
    contactsCache = v2->_contactsCache;
    v2->_contactsCache = v19;

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "addObserver:selector:name:object:", v2, sel__contactsUpdatedNotification_, *MEMORY[0x24BDBA3D0], 0);

    v22 = v2;
  }

  return v2;
}

+ (_ASAccountSharingGroupMemberDataManager)sharedManager
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __56___ASAccountSharingGroupMemberDataManager_sharedManager__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedManager_once != -1)
    dispatch_once(&sharedManager_once, block);
  return (_ASAccountSharingGroupMemberDataManager *)(id)sharedManager_sharedManager_0;
}

- (_ASAccountSharingGroupMemberData)groupMemberDataForPrimaryAccount
{
  void *v3;
  _ASAccountSharingGroupMemberData *v4;
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

  -[ACAccountStore aa_primaryAppleAccount](self->_accountStore, "aa_primaryAppleAccount");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc_init(_ASAccountSharingGroupMemberData);
  v5 = objc_alloc_init(MEMORY[0x24BDD1730]);
  objc_msgSend(v3, "aa_firstName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setGivenName:", v6);

  objc_msgSend(v3, "aa_middleName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setMiddleName:", v7);

  objc_msgSend(v3, "aa_lastName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setFamilyName:", v8);

  -[_ASAccountSharingGroupMemberDataManager _contactDisplayNameFromNameComponents:](self, "_contactDisplayNameFromNameComponents:", v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[_ASAccountSharingGroupMemberData setContactDisplayName:](v4, "setContactDisplayName:", v9);

  -[_ASAccountSharingGroupMemberDataManager _shortContactDisplayNameFromNameComponents:](self, "_shortContactDisplayNameFromNameComponents:", v5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[_ASAccountSharingGroupMemberData setShortContactDisplayName:](v4, "setShortContactDisplayName:", v10);

  -[_ASAccountSharingGroupMemberDataManager avatarImageForPrimaryAccountOwnerWithDiameter:](self, "avatarImageForPrimaryAccountOwnerWithDiameter:", 37.0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[_ASAccountSharingGroupMemberData setAvatarImageForGroupMemberCell:](v4, "setAvatarImageForGroupMemberCell:", v11);

  -[_ASAccountSharingGroupMemberDataManager _contactForCurrentUser](self, "_contactForCurrentUser");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[_ASAccountSharingGroupMemberData setContact:](v4, "setContact:", v12);

  -[_ASAccountSharingGroupMemberData setIsMeParticipant:](v4, "setIsMeParticipant:", 1);
  objc_msgSend(v3, "username");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[_ASAccountSharingGroupMemberData setHandle:](v4, "setHandle:", v13);

  objc_msgSend(v3, "username");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[_ASAccountSharingGroupMemberDataManager _formattedAddressForAddress:](self, "_formattedAddressForAddress:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[_ASAccountSharingGroupMemberData setHandleForDisplay:](v4, "setHandleForDisplay:", v15);

  objc_msgSend(MEMORY[0x24BE82D00], "sharedProvider");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "currentUserParticipantID");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[_ASAccountSharingGroupMemberData setParticipantID:](v4, "setParticipantID:", v17);

  return v4;
}

- (id)groupMemberDataForRecipients:(id)a3
{
  _QWORD v4[5];

  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __72___ASAccountSharingGroupMemberDataManager_groupMemberDataForRecipients___block_invoke;
  v4[3] = &unk_24C94FC70;
  v4[4] = self;
  objc_msgSend(a3, "safari_mapObjectsUsingBlock:", v4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)groupMemberDataForGroup:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend(a3, "participants");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_ASAccountSharingGroupMemberDataManager groupMemberDataForGroupParticipants:](self, "groupMemberDataForGroupParticipants:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)groupMemberDataForGroupParticipants:(id)a3
{
  _QWORD v4[5];

  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __79___ASAccountSharingGroupMemberDataManager_groupMemberDataForGroupParticipants___block_invoke;
  v4[3] = &unk_24C94FC98;
  v4[4] = self;
  objc_msgSend(a3, "safari_mapObjectsUsingBlock:", v4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)displayNameForOriginalContributorParticipantID:(id)a3 inGroupID:(id)a4
{
  void *v4;
  void *v5;
  id v6;
  void *v7;

  -[_ASAccountSharingGroupMemberDataManager nameForOriginalContributorParticipantID:inGroupID:](self, "nameForOriginalContributorParticipantID:inGroupID:", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = v4;
  }
  else
  {
    _WBSLocalizedString();
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  v7 = v6;

  return v7;
}

- (id)nameForOriginalContributorParticipantID:(id)a3 inGroupID:(id)a4
{
  id v6;
  id v7;
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
  NSObject *v19;
  NSObject *v20;
  uint64_t v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, void *);
  void *v25;
  id v26;
  _QWORD v27[2];

  v27[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x24BE82D00], "sharedProvider");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "cachedGroupWithID:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(v9, "participants");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = MEMORY[0x24BDAC760];
    v23 = 3221225472;
    v24 = __93___ASAccountSharingGroupMemberDataManager_nameForOriginalContributorParticipantID_inGroupID___block_invoke;
    v25 = &unk_24C94FCC0;
    v26 = v6;
    objc_msgSend(v10, "safari_firstObjectPassingTest:", &v22);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      v27[0] = v11;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v27, 1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[_ASAccountSharingGroupMemberDataManager groupMemberDataForGroupParticipants:](self, "groupMemberDataForGroupParticipants:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "firstObject");
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if ((objc_msgSend(v14, "isMeParticipant") & 1) != 0)
      {
        v15 = (void *)MEMORY[0x24BDD17C8];
        _WBSLocalizedString();
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "displayName");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "localizedStringWithFormat:", v16, v17, v22, v23, v24, v25);
        v18 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        objc_msgSend(v14, "displayName");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
      }

    }
    else
    {
      v20 = WBS_LOG_CHANNEL_PREFIXPasswordManager();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        -[_ASAccountSharingGroupMemberDataManager nameForOriginalContributorParticipantID:inGroupID:].cold.2();
      v18 = 0;
    }

  }
  else
  {
    v19 = WBS_LOG_CHANNEL_PREFIXPasswordManager();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      -[_ASAccountSharingGroupMemberDataManager nameForOriginalContributorParticipantID:inGroupID:].cold.1();
    v18 = 0;
  }

  return v18;
}

- (id)fetchContactForUserHandle:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  CNContactStore *contactStore;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  NSObject *v19;
  id v21;
  void *v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (objc_msgSend(MEMORY[0x24BE192B0], "isStringPhoneNumber:", v4))
  {
    v5 = (void *)MEMORY[0x24BDBACA0];
    objc_msgSend(MEMORY[0x24BDBAD88], "phoneNumberWithStringValue:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "predicateForContactsMatchingPhoneNumber:", v6);
    v7 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = objc_msgSend(MEMORY[0x24BE19260], "isStringEmailAddress:", v4);
    v9 = (void *)MEMORY[0x24BDBACA0];
    if (v8)
    {
      objc_msgSend(MEMORY[0x24BDBACA0], "predicateForContactsMatchingEmailAddress:", v4);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    }
    v23[0] = v4;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v23, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "predicateForContactsMatchingHandleStrings:", v6);
    v7 = objc_claimAutoreleasedReturnValue();
  }
  v10 = (void *)v7;

LABEL_7:
  -[NSCache objectForKey:](self->_contactsCache, "objectForKey:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v11)
  {
    v13 = v11;
  }
  else
  {
    contactStore = self->_contactStore;
    objc_msgSend(MEMORY[0x24BDBAE90], "descriptorForRequiredKeys");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = v15;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v22, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = 0;
    -[CNContactStore unifiedContactsMatchingPredicate:keysToFetch:error:](contactStore, "unifiedContactsMatchingPredicate:keysToFetch:error:", v10, v16, &v21);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v21;

    if ((unint64_t)objc_msgSend(v17, "count") >= 2)
    {
      v19 = WBS_LOG_CHANNEL_PREFIXPasswordManager();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        -[_ASAccountSharingGroupMemberDataManager fetchContactForUserHandle:].cold.1();
    }
    objc_msgSend(v17, "firstObject");
    v13 = (id)objc_claimAutoreleasedReturnValue();
    if (v13)
      -[NSCache setObject:forKey:](self->_contactsCache, "setObject:forKey:", v13, v10);

  }
  return v13;
}

- (id)KCSharingParticipantsFromGroupMembers:(id)a3
{
  return (id)objc_msgSend(a3, "safari_mapObjectsUsingBlock:", &__block_literal_global_2);
}

- (id)_contactDisplayNameFromNameComponents:(id)a3
{
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x24BDD1738], "localizedStringFromPersonNameComponents:style:options:", a3, 0, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "length"))
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;

  return v5;
}

- (id)_shortContactDisplayNameFromNameComponents:(id)a3
{
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x24BDD1738], "localizedStringFromPersonNameComponents:style:options:", a3, 1, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "length"))
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;

  return v5;
}

- (double)_screenScale
{
  void *v2;
  double v3;
  double v4;

  objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "scale");
  v4 = v3;

  return v4;
}

- (id)avatarImageForPrimaryAccountOwnerWithDiameter:(double)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  CNAvatarImageRenderer *avatarImageRenderer;
  void *v14;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x24BDAC8D0];
  -[AAUIProfilePictureStore profilePictureForAccountOwnerWithoutMonogramFallback](self->_profilePictureStore, "profilePictureForAccountOwnerWithoutMonogramFallback");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "imageByPreparingThumbnailOfSize:", a3, a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = (void *)MEMORY[0x24BDBACA0];
    -[ACAccountStore aa_primaryAppleAccount](self->_accountStore, "aa_primaryAppleAccount");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "aa_fullName");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "contactWithDisplayName:handleStrings:", v10, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    -[_ASAccountSharingGroupMemberDataManager _renderingScopeForDiameter:](self, "_renderingScopeForDiameter:", a3);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    avatarImageRenderer = self->_avatarImageRenderer;
    v16[0] = v11;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v16, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNAvatarImageRenderer avatarImageForContacts:scope:](avatarImageRenderer, "avatarImageForContacts:scope:", v14, v12);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v7;
}

- (id)avatarImageForUserHandle:(id)a3 diameter:(double)a4
{
  void *v6;
  void *v7;

  -[_ASAccountSharingGroupMemberDataManager fetchContactForUserHandle:](self, "fetchContactForUserHandle:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[_ASAccountSharingGroupMemberDataManager avatarImageForContact:diameter:](self, "avatarImageForContact:diameter:", v6, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)avatarImageForGroupMember:(id)a3 diameter:(double)a4
{
  void *v6;
  void *v7;

  objc_msgSend(a3, "contact");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[_ASAccountSharingGroupMemberDataManager avatarImageForContact:diameter:](self, "avatarImageForContact:diameter:", v6, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)avatarImageForContact:(id)a3 diameter:(double)a4
{
  id v6;
  void *v7;
  CNAvatarImageRenderer *avatarImageRenderer;
  void *v9;
  void *v10;
  CNAvatarImageRenderer *v11;
  id v12;
  void *v13;
  double v14;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x24BDAC8D0];
  if (a3)
  {
    v6 = a3;
    -[_ASAccountSharingGroupMemberDataManager _renderingScopeForDiameter:](self, "_renderingScopeForDiameter:", a4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    avatarImageRenderer = self->_avatarImageRenderer;
    v16[0] = v6;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v16, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNAvatarImageRenderer avatarImageForContacts:scope:](avatarImageRenderer, "avatarImageForContacts:scope:", v9, v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v11 = self->_avatarImageRenderer;
    v12 = 0;
    -[CNAvatarImageRenderer placeholderImageProvider](v11, "placeholderImageProvider");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    -[_ASAccountSharingGroupMemberDataManager _screenScale](self, "_screenScale");
    objc_msgSend(v13, "imageForSize:scale:", a4, a4, v14);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v10;
}

- (id)placeholderAvatarImageWithDiameter:(double)a3
{
  void *v5;
  double v6;
  void *v7;

  -[CNAvatarImageRenderer placeholderImageProvider](self->_avatarImageRenderer, "placeholderImageProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_ASAccountSharingGroupMemberDataManager _screenScale](self, "_screenScale");
  objc_msgSend(v5, "imageForSize:scale:", a3, a3, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)_renderingScopeForDiameter:(double)a3
{
  NSMutableDictionary *avatarImageDiameterToRenderingScopes;
  void *v6;
  void *v7;
  _BOOL8 v8;
  void *v9;
  double v10;
  NSMutableDictionary *v11;
  void *v12;
  id v13;

  avatarImageDiameterToRenderingScopes = self->_avatarImageDiameterToRenderingScopes;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](avatarImageDiameterToRenderingScopes, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    v8 = objc_msgSend(MEMORY[0x24BEBD358], "defaultWritingDirectionForLanguage:", 0) == 2;
    v9 = (void *)MEMORY[0x24BDBAE48];
    -[_ASAccountSharingGroupMemberDataManager _screenScale](self, "_screenScale");
    objc_msgSend(v9, "scopeWithPointSize:scale:rightToLeft:style:", v8, 0, a3, a3, v10);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = self->_avatarImageDiameterToRenderingScopes;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", a3);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](v11, "setObject:forKeyedSubscript:", v7, v12);

  }
  v13 = v7;

  return v13;
}

- (id)_formattedAddressForAddress:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;

  v3 = a3;
  if (objc_msgSend(MEMORY[0x24BE192B0], "isStringPhoneNumber:", v3) && objc_msgSend(v3, "length"))
  {
    v4 = (void *)MEMORY[0x24BE192B0];
    objc_msgSend(MEMORY[0x24BE192B0], "countryCodeForNumber:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "internationalizedFormattedNumber:countryCode:", v3, v5);
    v6 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = v3;
  }

  return v6;
}

- (id)_contactForCurrentUser
{
  CNContact *contactForCurrentUser;
  CNContactStore *contactStore;
  void *v6;
  void *v7;
  CNContact *v8;
  id v9;
  CNContact *v10;
  NSObject *v11;
  CNContact *v12;
  id v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x24BDAC8D0];
  contactForCurrentUser = self->_contactForCurrentUser;
  if (contactForCurrentUser)
    return contactForCurrentUser;
  contactStore = self->_contactStore;
  objc_msgSend(MEMORY[0x24BDBAE90], "descriptorForRequiredKeys");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v6;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v14, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0;
  -[CNContactStore _ios_meContactWithKeysToFetch:error:](contactStore, "_ios_meContactWithKeysToFetch:error:", v7, &v13);
  v8 = (CNContact *)objc_claimAutoreleasedReturnValue();
  v9 = v13;
  v10 = self->_contactForCurrentUser;
  self->_contactForCurrentUser = v8;

  if (v9)
  {
    v11 = WBS_LOG_CHANNEL_PREFIXPasswordManager();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[_ASAccountSharingGroupMemberDataManager _contactForCurrentUser].cold.1(v11, v9);
  }
  v12 = self->_contactForCurrentUser;

  return v12;
}

- (void)_contactsUpdatedNotification:(id)a3
{
  CNContact *contactForCurrentUser;

  contactForCurrentUser = self->_contactForCurrentUser;
  self->_contactForCurrentUser = 0;

  -[NSCache removeAllObjects](self->_contactsCache, "removeAllObjects");
}

- (CNContactStore)contactStore
{
  return self->_contactStore;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contactsCache, 0);
  objc_storeStrong((id *)&self->_contactForCurrentUser, 0);
  objc_storeStrong((id *)&self->_profilePictureStore, 0);
  objc_storeStrong((id *)&self->_avatarImageDiameterToRenderingScopes, 0);
  objc_storeStrong((id *)&self->_contactStore, 0);
  objc_storeStrong((id *)&self->_avatarImageRenderer, 0);
  objc_storeStrong((id *)&self->_accountStore, 0);
}

- (void)nameForOriginalContributorParticipantID:inGroupID:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_1(&dword_20E4D9000, v0, v1, "Failed to find group for group ID when looking up original contributor display name: %{private}@", v2);
  OUTLINED_FUNCTION_2();
}

- (void)nameForOriginalContributorParticipantID:inGroupID:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_1(&dword_20E4D9000, v0, v1, "Failed to find original contributor while trying to get original contributor's name (participantID = %{private}@).", v2);
  OUTLINED_FUNCTION_2();
}

- (void)fetchContactForUserHandle:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_1(&dword_20E4D9000, v0, v1, "Found multiple contacts matching handle %{private}@. Returning first match.", v2);
  OUTLINED_FUNCTION_2();
}

- (void)_contactForCurrentUser
{
  NSObject *v3;
  void *v4;
  uint64_t v5;
  uint8_t v6[24];
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = a1;
  objc_msgSend(a2, "safari_privacyPreservingDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_1(&dword_20E4D9000, v3, v5, "Failed to get contact for current user with error: %{public}@", v6);

}

@end
