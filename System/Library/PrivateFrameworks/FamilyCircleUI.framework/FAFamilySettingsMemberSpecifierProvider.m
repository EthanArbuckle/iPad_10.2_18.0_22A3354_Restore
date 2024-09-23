@implementation FAFamilySettingsMemberSpecifierProvider

- (FAFamilySettingsMemberSpecifierProvider)initWithAppleAccount:(id)a3 familyCircle:(id)a4 familyPictureStore:(id)a5
{
  id v8;
  id v9;
  FAFamilySettingsMemberSpecifierProvider *v10;
  FAFamilySettingsMemberSpecifierProvider *v11;
  objc_super v13;

  v8 = a4;
  v9 = a5;
  v13.receiver = self;
  v13.super_class = (Class)FAFamilySettingsMemberSpecifierProvider;
  v10 = -[FAFamilySettingsMemberSpecifierProvider init](&v13, sel_init);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_familyCircle, a4);
    objc_storeStrong((id *)&v11->_familyPictureStore, a5);
  }

  return v11;
}

- (void)setFamilyCircle:(id)a3
{
  NSArray *specifiers;
  id v6;

  objc_storeStrong((id *)&self->_familyCircle, a3);
  v6 = a3;
  specifiers = self->_specifiers;
  self->_specifiers = 0;

}

- (BOOL)handleURL:(id)a3
{
  id v5;
  BOOL v6;
  NSObject *v7;
  uint8_t v9[16];

  v5 = a3;
  v6 = -[FAFamilySettingsMemberSpecifierProvider _launchWithResourceDictionary:](self, "_launchWithResourceDictionary:", v5);
  if (!v6)
  {
    _FALogSystem();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl(&dword_20DE41000, v7, OS_LOG_TYPE_DEFAULT, "FAFamilySettingsMemberSpecifierProvider doesn't have the specifier, will try again upon response.", v9, 2u);
    }

    objc_storeStrong((id *)&self->_cachedResourceDictionary, a3);
  }

  return v6;
}

- (BOOL)_launchWithResourceDictionary:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  BOOL v9;
  NSObject *v10;
  NSArray *specifiers;
  int v13;
  void *v14;
  __int16 v15;
  NSArray *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x24BE30978]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
LABEL_8:
    v9 = 0;
    goto LABEL_9;
  }
  -[FAFamilySettingsMemberSpecifierProvider _specifierWithID:](self, "_specifierWithID:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!v5
    || (objc_msgSend(v5, "identifier"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v8 = objc_msgSend(v7, "isEqualToString:", CFSTR("AddMember")),
        v7,
        !v8))
  {
    _FALogSystem();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      specifiers = self->_specifiers;
      v13 = 138412546;
      v14 = v4;
      v15 = 2112;
      v16 = specifiers;
      _os_log_impl(&dword_20DE41000, v10, OS_LOG_TYPE_DEFAULT, "A specifier for \"%@\" was not found in: %@", (uint8_t *)&v13, 0x16u);
    }

    goto LABEL_8;
  }
  -[FAFamilySettingsMemberSpecifierProvider _addFamilyMemberButtonWasTapped:](self, "_addFamilyMemberButtonWasTapped:", v6);

  v9 = 1;
LABEL_9:

  return v9;
}

- (void)_delayedLoadIfNeeded
{
  NSObject *v3;
  NSDictionary *cachedResourceDictionary;
  uint8_t v5[16];

  if (self->_cachedResourceDictionary)
  {
    _FALogSystem();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_20DE41000, v3, OS_LOG_TYPE_DEFAULT, "We have a cached resource dictionary, let's try launching.", v5, 2u);
    }

    -[FAFamilySettingsMemberSpecifierProvider _launchWithResourceDictionary:](self, "_launchWithResourceDictionary:", self->_cachedResourceDictionary);
    cachedResourceDictionary = self->_cachedResourceDictionary;
    self->_cachedResourceDictionary = 0;

  }
}

- (NSArray)specifiers
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t j;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  PSSpecifier *v22;
  PSSpecifier *addFamilyMemberCell;
  PSSpecifier *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  NSArray *v29;
  NSArray *specifiers;
  NSArray *v31;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  if ((-[FAFamilyCircle canAddMembers](self->_familyCircle, "canAddMembers") & 1) == 0
    && -[FAFamilyCircle showAddMemberButton](self->_familyCircle, "showAddMemberButton"))
  {
    objc_msgSend(MEMORY[0x24BE75590], "groupSpecifierWithID:", CFSTR("FamilyMembers"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[FAFamilyCircle familyMembersFooterLabel](self->_familyCircle, "familyMembersFooterLabel");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setProperty:forKey:", v5, *MEMORY[0x24BE75A68]);

    objc_msgSend(v3, "addObject:", v4);
  }
  v39 = 0u;
  v40 = 0u;
  v37 = 0u;
  v38 = 0u;
  -[FAFamilyCircle members](self->_familyCircle, "members");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v38;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v38 != v9)
          objc_enumerationMutation(v6);
        -[FAFamilySettingsMemberSpecifierProvider _createSpecifierForFamilyMemberCell:](self, "_createSpecifierForFamilyMemberCell:", *(_QWORD *)(*((_QWORD *)&v37 + 1) + 8 * i));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (v11)
          objc_msgSend(v3, "addObject:", v11);

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
    }
    while (v8);
  }

  -[FAFamilyCircle pendingMembers](self->_familyCircle, "pendingMembers");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v34;
    do
    {
      for (j = 0; j != v14; ++j)
      {
        if (*(_QWORD *)v34 != v15)
          objc_enumerationMutation(v12);
        -[FAFamilySettingsMemberSpecifierProvider _createSpecifierForPendingMember:](self, "_createSpecifierForPendingMember:", *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * j));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        if (v17)
          objc_msgSend(v3, "addObject:", v17);

      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
    }
    while (v14);
  }
  if (-[FAFamilyCircle showAddMemberButton](self->_familyCircle, "showAddMemberButton"))
  {
    -[FAFamilyCircle addMemberButtonLabel](self->_familyCircle, "addMemberButtonLabel");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v18;
    if (v18)
    {
      v20 = v18;
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "localizedStringForKey:value:table:", CFSTR("ADD_FAMILY_MEMBER_BUTTON"), &stru_24C8A3000, CFSTR("Localizable"));
      v20 = (id)objc_claimAutoreleasedReturnValue();

    }
    objc_msgSend(MEMORY[0x24BE75590], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v20, self, 0, 0, 0, 13, 0);
    v22 = (PSSpecifier *)objc_claimAutoreleasedReturnValue();
    addFamilyMemberCell = self->_addFamilyMemberCell;
    self->_addFamilyMemberCell = v22;

    -[PSSpecifier setIdentifier:](self->_addFamilyMemberCell, "setIdentifier:", CFSTR("AddMember"));
    -[PSSpecifier setButtonAction:](self->_addFamilyMemberCell, "setButtonAction:", sel__addFamilyMemberButtonWasTapped_);
    v24 = self->_addFamilyMemberCell;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[FAFamilyCircle canAddMembers](self->_familyCircle, "canAddMembers"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[PSSpecifier setProperty:forKey:](v24, "setProperty:forKey:", v25, *MEMORY[0x24BE75A18]);

    objc_msgSend(MEMORY[0x24BEBD640], "systemImageNamed:", CFSTR("plus"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[FAFamilyCircle canAddMembers](self->_familyCircle, "canAddMembers"))
    {
      -[PSSpecifier setProperty:forKey:](self->_addFamilyMemberCell, "setProperty:forKey:", v26, *MEMORY[0x24BE75AC8]);
    }
    else
    {
      objc_msgSend(MEMORY[0x24BEBD4B8], "systemDarkGrayColor");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "imageWithTintColor:renderingMode:", v27, 1);
      v28 = (void *)objc_claimAutoreleasedReturnValue();

      -[PSSpecifier setProperty:forKey:](self->_addFamilyMemberCell, "setProperty:forKey:", v28, *MEMORY[0x24BE75AC8]);
    }
    objc_msgSend(v3, "addObject:", self->_addFamilyMemberCell);

  }
  v29 = (NSArray *)objc_msgSend(v3, "copy");
  specifiers = self->_specifiers;
  self->_specifiers = v29;

  -[FAFamilySettingsMemberSpecifierProvider _delayedLoadIfNeeded](self, "_delayedLoadIfNeeded");
  v31 = self->_specifiers;

  return v31;
}

- (id)_createSpecifierForFamilyMemberCell:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id WeakRetained;
  NSString *v25;
  BOOL IsAccessibilityCategory;
  void *v27;
  double v28;
  void *v29;

  v4 = a3;
  objc_msgSend(v4, "fullName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isMe"))
  {
    v6 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("FAMILY_MEMBER_ME_MARKER_FORMAT"), &stru_24C8A3000, CFSTR("Localizable"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringWithFormat:", v8, v5);
    v9 = objc_claimAutoreleasedReturnValue();

    v5 = (void *)v9;
  }
  objc_msgSend(MEMORY[0x24BE75590], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v5, self, 0, 0, 0, 2, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appleID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setIdentifier:", v11);

  if ((objc_msgSend(v4, "hasLinkediTunesAccount") & 1) != 0 || !objc_msgSend(v4, "isMe"))
  {
    objc_msgSend(v4, "memberTypeDisplayString");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v18)
      goto LABEL_11;
    objc_msgSend(v4, "memberTypeDisplayString");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = *MEMORY[0x24BE75D28];
    v17 = v10;
    v16 = v12;
  }
  else
  {
    objc_msgSend(v4, "iTunesNotLinkedMessage");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v12, "length"))
    {
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("NOT_SHARING_PURCHASES"), &stru_24C8A3000, CFSTR("Localizable"));
      v14 = objc_claimAutoreleasedReturnValue();

      v12 = (void *)v14;
    }
    objc_msgSend(v10, "setProperty:forKey:", v12, *MEMORY[0x24BE75D28]);
    v15 = *MEMORY[0x24BE04C78];
    v16 = (void *)MEMORY[0x24BDBD1C8];
    v17 = v10;
  }
  objc_msgSend(v17, "setProperty:forKey:", v16, v15);

LABEL_11:
  objc_msgSend(v4, "dsid");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
    objc_msgSend(v10, "setProperty:forKey:", v4, CFSTR("FAFamilySettingsMemberSpecifierMemberKey"));
  -[FAProfilePictureStore profilePictureForFamilyMember:pictureDiameter:](self->_familyPictureStore, "profilePictureForFamilyMember:pictureDiameter:", v4, 40.0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (v20)
  {
    v21 = (void *)MEMORY[0x24BEBD640];
    objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "scale");
    objc_msgSend(v21, "imageWithData:scale:", v20);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "setProperty:forKey:", v23, *MEMORY[0x24BE75AC8]);
  }
  objc_msgSend(v10, "setProperty:forKey:", objc_opt_class(), *MEMORY[0x24BE75948]);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "preferredContentSizeCategory");
  v25 = (NSString *)objc_claimAutoreleasedReturnValue();
  IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v25);
  v27 = (void *)MEMORY[0x24BDD16E0];
  if (IsAccessibilityCategory)
    v28 = *MEMORY[0x24BEBE770];
  else
    PSRoundToPixel();
  objc_msgSend(v27, "numberWithDouble:", v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setProperty:forKey:", v29, *MEMORY[0x24BE75D10]);

  objc_msgSend(v10, "setProperty:forKey:", &unk_24C8CD710, *MEMORY[0x24BE04C70]);
  objc_msgSend(v10, "setControllerLoadAction:", sel__familyMemberCellWasTapped_);

  return v10;
}

- (id)_createSpecifierForPendingMember:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  void *v18;
  const __CFString *v19;
  void *v20;
  void *v21;
  void *v22;
  id WeakRetained;
  NSString *v24;
  BOOL IsAccessibilityCategory;
  void *v26;
  double v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;

  v4 = a3;
  objc_msgSend(v4, "fullName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "inviteEmail");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  if (v5)
    v8 = v5;
  else
    v8 = (void *)v6;
  v9 = v8;
  objc_msgSend(v4, "invitationDate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    objc_msgSend(MEMORY[0x24BDD1500], "fa_standardFormatter");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setFormattingContext:", 5);
    objc_msgSend(v4, "invitationDate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "stringFromDate:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "invitationDate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "isDateRelative");

    v16 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v17;
    if (v15)
      v19 = CFSTR("INVITED_DATE_RELATIVE");
    else
      v19 = CFSTR("INVITED_DATE_ABSOLUTE");
    objc_msgSend(v17, "localizedStringForKey:value:table:", v19, &stru_24C8A3000, CFSTR("Localizable"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "stringWithFormat:", v20, v13);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("INVITED"), &stru_24C8A3000, CFSTR("Localizable"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
  }

  objc_msgSend(MEMORY[0x24BE75590], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v9, self, 0, 0, 0, 2, 0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setIdentifier:", v7);

  objc_msgSend(v22, "setProperty:forKey:", v21, *MEMORY[0x24BE75D28]);
  objc_msgSend(v22, "setProperty:forKey:", objc_opt_class(), *MEMORY[0x24BE75948]);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "preferredContentSizeCategory");
  v24 = (NSString *)objc_claimAutoreleasedReturnValue();
  IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v24);
  v26 = (void *)MEMORY[0x24BDD16E0];
  if (IsAccessibilityCategory)
    v27 = *MEMORY[0x24BEBE770];
  else
    PSRoundToPixel();
  objc_msgSend(v26, "numberWithDouble:", v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setProperty:forKey:", v28, *MEMORY[0x24BE75D10]);

  objc_msgSend(MEMORY[0x24BEBD4B8], "secondaryLabelColor");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setProperty:forKey:", v29, *MEMORY[0x24BE04C80]);

  objc_msgSend(v22, "setProperty:forKey:", &unk_24C8CD710, *MEMORY[0x24BE04C70]);
  objc_msgSend(v22, "setControllerLoadAction:", sel__pendingFamilyMemberCellWasTapped_);
  -[FAProfilePictureStore profilePictureForFamilyMember:pictureDiameter:](self->_familyPictureStore, "profilePictureForFamilyMember:pictureDiameter:", v4, 40.0);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  if (v30)
  {
    v31 = (void *)MEMORY[0x24BEBD640];
    objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "scale");
    objc_msgSend(v31, "imageWithData:scale:", v30);
    v33 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v22, "setProperty:forKey:", v33, *MEMORY[0x24BE75AC8]);
  }
  objc_msgSend(v22, "setProperty:forKey:", v4, CFSTR("FAFamilySettingsMemberSpecifierMemberKey"));

  return v22;
}

- (void)_addFamilyMemberButtonWasTapped:(id)a3
{
  FAFamilySettingsMemberSpecifierProviderDelegeate **p_delegate;
  id v4;
  id WeakRetained;

  p_delegate = &self->_delegate;
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  objc_msgSend(WeakRetained, "addFamilyMemberButtonWasTapped:", v4);

}

- (void)_familyMemberCellWasTapped:(id)a3
{
  FAFamilySettingsMemberSpecifierProviderDelegeate **p_delegate;
  id v4;
  id WeakRetained;

  p_delegate = &self->_delegate;
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  objc_msgSend(WeakRetained, "familyMemberCellWasTapped:", v4);

}

- (void)_pendingFamilyMemberCellWasTapped:(id)a3
{
  FAFamilySettingsMemberSpecifierProviderDelegeate **p_delegate;
  id v4;
  id WeakRetained;

  p_delegate = &self->_delegate;
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  objc_msgSend(WeakRetained, "pendingFamilyMemberCellWasTapped:", v4);

}

- (id)_specifierWithID:(id)a3
{
  id v4;
  NSArray *v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  char v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = self->_specifiers;
  v6 = (id)-[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v9, "identifier", (_QWORD)v13);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "isEqualToString:", v4);

        if ((v11 & 1) != 0)
        {
          v6 = v9;
          goto LABEL_11;
        }
      }
      v6 = (id)-[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

- (void)reloadSpecifiers
{
  NSArray *specifiers;

  specifiers = self->_specifiers;
  self->_specifiers = 0;

}

- (FAFamilySettingsMemberSpecifierProviderDelegeate)delegate
{
  return (FAFamilySettingsMemberSpecifierProviderDelegeate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (FAFamilyMemberCardTapHandler)memberCardTapHandler
{
  return (FAFamilyMemberCardTapHandler *)objc_loadWeakRetained((id *)&self->_memberCardTapHandler);
}

- (void)setMemberCardTapHandler:(id)a3
{
  objc_storeWeak((id *)&self->_memberCardTapHandler, a3);
}

- (void)setSpecifiers:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_specifiers, 0);
  objc_destroyWeak((id *)&self->_memberCardTapHandler);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_cachedResourceDictionary, 0);
  objc_storeStrong((id *)&self->_addFamilyMemberCell, 0);
  objc_storeStrong((id *)&self->_familyPictureStore, 0);
  objc_storeStrong((id *)&self->_familyCircle, 0);
}

@end
