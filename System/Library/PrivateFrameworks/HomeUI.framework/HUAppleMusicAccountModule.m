@implementation HUAppleMusicAccountModule

- (HUAppleMusicAccountModule)initWithMediaProfileContainer:(id)a3 itemUpdater:(id)a4
{
  id v7;
  HUAppleMusicAccountModule *v8;
  HUAppleMusicAccountModule *v9;
  HUAppleMusicLogoutItem *v10;
  HUAppleMusicItem *logoutItem;
  HUAppleMusicLoginItem *v12;
  HUAppleMusicItem *loginItem;
  HUAppleMusicCurrentlyLoggedInAccountItem *v14;
  HUAppleMusicItem *loggedInUsernameItem;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  HFStaticItemProvider *appleMusicAccountActionItemProvider;
  HUAppleMusicAccountItemProvider *v24;
  HUAppleMusicAccountItemProvider *appleMusicAccountItemProvider;
  void *v26;
  int v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  void *v35;
  id v36;
  void *v37;
  void *v38;
  char v39;
  uint64_t v40;
  void *v41;
  objc_super v43;

  v7 = a3;
  v43.receiver = self;
  v43.super_class = (Class)HUAppleMusicAccountModule;
  v8 = -[HFItemModule initWithItemUpdater:](&v43, sel_initWithItemUpdater_, a4);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_mediaProfileContainer, a3);
    v10 = -[HUAppleMusicItem initWithMediaProfileContainer:]([HUAppleMusicLogoutItem alloc], "initWithMediaProfileContainer:", v7);
    logoutItem = v9->_logoutItem;
    v9->_logoutItem = &v10->super;

    v12 = -[HUAppleMusicItem initWithMediaProfileContainer:]([HUAppleMusicLoginItem alloc], "initWithMediaProfileContainer:", v7);
    loginItem = v9->_loginItem;
    v9->_loginItem = &v12->super;

    v14 = -[HUAppleMusicItem initWithMediaProfileContainer:]([HUAppleMusicCurrentlyLoggedInAccountItem alloc], "initWithMediaProfileContainer:", v7);
    loggedInUsernameItem = v9->_loggedInUsernameItem;
    v9->_loggedInUsernameItem = &v14->super.super;

    v16 = objc_alloc(MEMORY[0x1E0D31848]);
    v17 = (void *)MEMORY[0x1E0C99E60];
    -[HUAppleMusicAccountModule logoutItem](v9, "logoutItem");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUAppleMusicAccountModule loginItem](v9, "loginItem");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUAppleMusicAccountModule loggedInUsernameItem](v9, "loggedInUsernameItem");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setWithObjects:", v18, v19, v20, 0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v16, "initWithItems:", v21);
    appleMusicAccountActionItemProvider = v9->_appleMusicAccountActionItemProvider;
    v9->_appleMusicAccountActionItemProvider = (HFStaticItemProvider *)v22;

    v24 = -[HUAppleMusicAccountItemProvider initWithMediaProfileContainer:]([HUAppleMusicAccountItemProvider alloc], "initWithMediaProfileContainer:", v7);
    appleMusicAccountItemProvider = v9->_appleMusicAccountItemProvider;
    v9->_appleMusicAccountItemProvider = v24;

    objc_msgSend(v7, "hf_appleMusicCurrentLoggedInAccount");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v7, "hf_homePodSupportsMultiUser");
    objc_msgSend(MEMORY[0x1E0D31190], "sharedInstance");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D31430], "sharedDispatcher");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "home");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "uniqueIdentifier");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "UUIDString");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "mediaAccountForHomeIdentifier:", v32);
    v33 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    v34 = v33;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v35 = v34;
    else
      v35 = 0;
    v36 = v35;

    if (v27 && v26)
    {
      objc_msgSend(v26, "ams_altDSID");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "ams_altDSID");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = objc_msgSend(v37, "isEqualToString:", v38);

      if ((v39 & 1) != 0)
      {
LABEL_12:
        v40 = 0;
        goto LABEL_13;
      }
    }
    else if ((v27 & 1) != 0 || !v26)
    {
      goto LABEL_12;
    }
    v40 = 1;
LABEL_13:
    v9->_state = v40;
    objc_msgSend(MEMORY[0x1E0D31528], "sharedDispatcher");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "addAppleMusicAccountObserver:", v9);

  }
  return v9;
}

- (id)itemProviders
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0C99E60];
  -[HUAppleMusicAccountModule appleMusicAccountItemProvider](self, "appleMusicAccountItemProvider");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUAppleMusicAccountModule appleMusicAccountActionItemProvider](self, "appleMusicAccountActionItemProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setWithObjects:", v4, v5, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)buildSectionsWithDisplayedItems:(id)a3
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
  uint64_t v17;
  unint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  char v22;
  void *v23;
  void *v24;
  int v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;

  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    -[HUAppleMusicAccountModule loggedInUsernameItem](self, "loggedInUsernameItem");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v4, "containsObject:", v5) & 1) == 0)
    {

      v5 = 0;
    }
    -[HUAppleMusicAccountModule appleMusicAccountItemProvider](self, "appleMusicAccountItemProvider");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "items");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "na_setByIntersectingWithSet:", v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "allObjects");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    -[HUAppleMusicAccountModule appleMusicAccountActionItemProvider](self, "appleMusicAccountActionItemProvider");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "items");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "na_setByIntersectingWithSet:", v4);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "allObjects");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(v13, "mutableCopy");

    objc_msgSend(v14, "removeObject:", v5);
    objc_msgSend(MEMORY[0x1E0C99D20], "na_arrayWithSafeObject:", v5);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v9, "count") && !objc_msgSend(v14, "count") && !objc_msgSend(v15, "count"))
    {
      v16 = (void *)MEMORY[0x1E0C9AA60];
      goto LABEL_23;
    }
    v16 = (void *)objc_opt_new();
    v17 = objc_msgSend(v9, "count");
    v18 = -[HUAppleMusicAccountModule state](self, "state");
    if (objc_msgSend(v9, "count") && v18 != 1)
    {
      v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D31570]), "initWithIdentifier:", CFSTR("HUAppleMusicAccountModule_MusicCredentialsSectionIdentifier"));
      objc_msgSend(v19, "setItems:", v9);
      if (v17 >= 1)
      {
        _HULocalizedStringWithDefaultValue(CFSTR("HUAppleMusicAccountSelectionHeader"), CFSTR("HUAppleMusicAccountSelectionHeader"), 1);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "setHeaderTitle:", v20);

      }
      -[HUAppleMusicAccountModule mediaProfileContainer](self, "mediaProfileContainer");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v21, "hf_supportsPreferredMediaUser");

      if ((v22 & 1) == 0)
        objc_msgSend(v16, "addObject:", v19);

    }
    if (objc_msgSend(v15, "count"))
    {
      v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D31570]), "initWithIdentifier:", CFSTR("HUAppleMusicAccountModule_MusicCurrentUserSectionIdentifier"));
      objc_msgSend(v23, "setItems:", v15);
      -[HUAppleMusicAccountModule mediaProfileContainer](self, "mediaProfileContainer");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = objc_msgSend(v24, "hf_supportsPreferredMediaUser");

      if (v25)
      {
        _HULocalizedStringWithDefaultValue(CFSTR("HUPrimaryUserSettingsHomePodAccountSection_Header"), CFSTR("HUPrimaryUserSettingsHomePodAccountSection_Header"), 1);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "setHeaderTitle:", v26);

        _HULocalizedStringWithDefaultValue(CFSTR("HUPrimaryUserSettingsHomePodAccountSection_Footer"), CFSTR("HUPrimaryUserSettingsHomePodAccountSection_Footer"), 1);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "setFooterTitle:", v27);

      }
      objc_msgSend(v16, "addObject:", v23);
      if (objc_msgSend(v14, "count"))
      {
        objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithArray:", v15);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "addObjectsFromArray:", v14);
        v29 = (void *)objc_msgSend(v28, "copy");
        objc_msgSend(v23, "setItems:", v29);

      }
    }
    else
    {
      if (!objc_msgSend(v14, "count"))
      {
LABEL_23:

        goto LABEL_24;
      }
      v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D31570]), "initWithIdentifier:", CFSTR("HUAppleMusicAccountModule_MusicActionsSectionIdentifier"));
      objc_msgSend(v23, "setItems:", v14);
      objc_msgSend(v16, "addObject:", v23);
    }

    goto LABEL_23;
  }
  v16 = (void *)MEMORY[0x1E0C9AA60];
LABEL_24:

  return v16;
}

- (unint64_t)numberOfKnownAccounts
{
  void *v2;
  void *v3;
  unint64_t v4;

  -[HUAppleMusicAccountModule appleMusicAccountItemProvider](self, "appleMusicAccountItemProvider");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "items");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  return v4;
}

- (id)signInMessage:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;

  v3 = a3;
  -[HUAppleMusicAccountModule mediaProfileContainer](self, "mediaProfileContainer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v3)
  {
    objc_msgSend(v5, "hf_appleMusicCurrentLoggedInAccount");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0D31190], "sharedInstance");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D31430], "sharedDispatcher");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "home");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "uniqueIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "UUIDString");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "mediaAccountForHomeIdentifier:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    v14 = v13;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v15 = v14;
    else
      v15 = 0;
    v16 = v15;

    if (v7
      && (objc_msgSend(v7, "ams_altDSID"),
          v17 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v16, "ams_altDSID"),
          v18 = (void *)objc_claimAutoreleasedReturnValue(),
          v19 = objc_msgSend(v17, "isEqualToString:", v18),
          v18,
          v17,
          v19))
    {
      objc_msgSend(v7, "username");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      HULocalizedStringWithFormat(CFSTR("HUAppleMusicAccountSignInFooter"), CFSTR("%@"), v21, v22, v23, v24, v25, v26, (uint64_t)v20);
      v27 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v27 = 0;
    }

  }
  else
  {
    objc_msgSend(v5, "hf_appleMusicCurrentLoggedInAccountDSID");
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    if (v28)
    {
      v27 = 0;
    }
    else if (-[HUAppleMusicAccountModule numberOfKnownAccounts](self, "numberOfKnownAccounts") == 1)
    {
      -[HUAppleMusicAccountModule appleMusicAccountItemProvider](self, "appleMusicAccountItemProvider");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "items");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "anyObject");
      v32 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v32, "latestResults");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "objectForKeyedSubscript:", CFSTR("HOAppleMusicAccountKey"));
      v34 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v34, "username");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      HULocalizedStringWithFormat(CFSTR("HUAppleMusicAccountSelectionFooter_Singular"), CFSTR("%@"), v36, v37, v38, v39, v40, v41, (uint64_t)v35);
      v27 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      _HULocalizedStringWithDefaultValue(CFSTR("HUAppleMusicAccountSelectionFooter_Plural"), CFSTR("HUAppleMusicAccountSelectionFooter_Plural"), 1);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  return v27;
}

- (NSString)explicitAccountSignedInMessage
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  char v17;
  void *v18;

  -[HUAppleMusicAccountModule mediaProfileContainer](self, "mediaProfileContainer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "hf_appleMusicCurrentLoggedInAccount");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D31190], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D31430], "sharedDispatcher");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "home");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "uniqueIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "UUIDString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "mediaAccountForHomeIdentifier:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  v11 = v10;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v12 = v11;
  else
    v12 = 0;
  v13 = v12;

  -[HUAppleMusicAccountModule mediaProfileContainer](self, "mediaProfileContainer");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v14, "hf_homePodSupportsMultiUser") || !v4)
  {

    goto LABEL_9;
  }
  objc_msgSend(v4, "ams_altDSID");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "ams_altDSID");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v15, "isEqualToString:", v16);

  if ((v17 & 1) != 0)
  {
LABEL_9:
    v18 = 0;
    goto LABEL_10;
  }
  _HULocalizedStringWithDefaultValue(CFSTR("HUAppleMusicAccountExplicitSignedInFooter"), CFSTR("HUAppleMusicAccountExplicitSignedInFooter"), 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_10:

  return (NSString *)v18;
}

- (void)setState:(unint64_t)a3
{
  unint64_t state;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void (**v13)(id, unint64_t, unint64_t);

  state = self->_state;
  if (state != a3)
  {
    self->_state = a3;
    if (a3 <= 1)
    {
      -[HFItemModule itemUpdater](self, "itemUpdater");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = (void *)MEMORY[0x1E0D314C0];
      -[HUAppleMusicAccountModule itemProviders](self, "itemProviders");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "requestToReloadItemProviders:senderSelector:", v9, a2);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = (id)objc_msgSend(v7, "performItemUpdateRequest:", v10);

    }
    -[HUAppleMusicAccountModule stateChangeObserver](self, "stateChangeObserver");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      -[HUAppleMusicAccountModule stateChangeObserver](self, "stateChangeObserver");
      v13 = (void (**)(id, unint64_t, unint64_t))objc_claimAutoreleasedReturnValue();
      v13[2](v13, state, a3);

    }
  }
}

- (void)dispatcher:(id)a3 appleMusicAccountsDidUpdate:(id)a4
{
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;

  -[HFItemModule itemUpdater](self, "itemUpdater", a3, a4);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0D314C0];
  -[HUAppleMusicAccountModule itemProviders](self, "itemProviders");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "requestToReloadItemProviders:senderSelector:", v7, a2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (id)objc_msgSend(v10, "performItemUpdateRequest:", v8);

}

- (void)accessoryDidUpdatePreferredMediaUser:(id)a3
{
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;

  -[HFItemModule itemUpdater](self, "itemUpdater", a3);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x1E0D314C0];
  -[HUAppleMusicAccountModule itemProviders](self, "itemProviders");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "requestToReloadItemProviders:senderSelector:", v6, a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (id)objc_msgSend(v9, "performItemUpdateRequest:", v7);

}

- (HFMediaProfileContainer)mediaProfileContainer
{
  return self->_mediaProfileContainer;
}

- (HUAppleMusicAccountItemProvider)appleMusicAccountItemProvider
{
  return self->_appleMusicAccountItemProvider;
}

- (HUAppleMusicItem)loggedInUsernameItem
{
  return self->_loggedInUsernameItem;
}

- (HUAppleMusicItem)logoutItem
{
  return self->_logoutItem;
}

- (HUAppleMusicItem)loginItem
{
  return self->_loginItem;
}

- (unint64_t)state
{
  return self->_state;
}

- (id)stateChangeObserver
{
  return self->_stateChangeObserver;
}

- (void)setStateChangeObserver:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (HFStaticItemProvider)appleMusicAccountActionItemProvider
{
  return self->_appleMusicAccountActionItemProvider;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appleMusicAccountActionItemProvider, 0);
  objc_storeStrong(&self->_stateChangeObserver, 0);
  objc_storeStrong((id *)&self->_loginItem, 0);
  objc_storeStrong((id *)&self->_logoutItem, 0);
  objc_storeStrong((id *)&self->_loggedInUsernameItem, 0);
  objc_storeStrong((id *)&self->_appleMusicAccountItemProvider, 0);
  objc_storeStrong((id *)&self->_mediaProfileContainer, 0);
}

@end
