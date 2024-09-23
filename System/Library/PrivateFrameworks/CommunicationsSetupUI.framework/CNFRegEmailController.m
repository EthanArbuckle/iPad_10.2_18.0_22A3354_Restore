@implementation CNFRegEmailController

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  -[CNFRegEmailController stopValidationTimeoutTimer](self, "stopValidationTimeoutTimer");
  -[NSTimer invalidate](self->_validationTimeoutTimer, "invalidate");
  v4.receiver = self;
  v4.super_class = (Class)CNFRegEmailController;
  -[CNFRegFirstRunController dealloc](&v4, sel_dealloc);
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CNFRegEmailController;
  -[CNFRegEmailController viewDidLoad](&v8, sel_viewDidLoad);
  if (CNFRegGlobalAppearanceStyle() == 6)
  {
    v3 = *(Class *)((char *)&self->super.super.super.super.super.super.super.isa + (int)*MEMORY[0x24BE75700]);
    objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setBackgroundColor:", v4);

  }
  else if (CNFRegGlobalAppearanceStyle() == 5)
  {
    v5 = (int)*MEMORY[0x24BE75700];
    v6 = *(Class *)((char *)&self->super.super.super.super.super.super.super.isa + v5);
    objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setBackgroundColor:", v7);

    objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.super.super.isa + v5), "_setSeparatorsDrawAsOverlay:", 1);
  }
}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CNFRegEmailController;
  -[CNFRegFirstRunController viewWillAppear:](&v4, sel_viewWillAppear_, a3);
  -[CNFRegEmailController _updateUI](self, "_updateUI");
}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CNFRegEmailController;
  -[CNFRegFirstRunController viewDidAppear:](&v3, sel_viewDidAppear_, a3);
}

- (void)viewWillDisappear:(BOOL)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CNFRegEmailController;
  -[CNFRegFirstRunController viewWillDisappear:](&v3, sel_viewWillDisappear_, a3);
}

- (void)viewDidDisappear:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  -[CNFRegEmailController stopValidationTimeoutTimer](self, "stopValidationTimeoutTimer");
  -[CNFRegEmailController _stopValidationModeAnimated:](self, "_stopValidationModeAnimated:", v3);
  v5.receiver = self;
  v5.super_class = (Class)CNFRegEmailController;
  -[CNFRegFirstRunController viewDidDisappear:](&v5, sel_viewDidDisappear_, v3);
}

- (id)specifierList
{
  uint64_t v3;
  void *v4;
  void *v5;
  _BOOL4 v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _BOOL4 v13;
  uint64_t v14;
  BOOL v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  NSObject *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void **v36;
  void *v37;
  void *v38;
  void *v39;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  void (*v44)(uint64_t, uint64_t);
  void *v45;
  id v46;
  CNFRegEmailController *v47;
  uint64_t v48;
  uint8_t buf[4];
  void *v50;
  uint64_t v51;

  v51 = *MEMORY[0x24BDAC8D0];
  v3 = (int)*MEMORY[0x24BE756E0];
  v4 = *(Class *)((char *)&self->super.super.super.super.super.super.super.isa + v3);
  if (v4)
    return v4;
  CNFRegLoadSpecifiersFromPlist(self, CFSTR("CNFRegEmail"), self);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[CNFRegEmailController shouldShowAllVettedAliases](self, "shouldShowAllVettedAliases");
  -[CNFRegListController regController](self, "regController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x24BDBCE30];
  -[CNFRegFirstRunController account](self, "account");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "arrayWithObject:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "vettedAliasesForAccounts:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "specifierForID:", CFSTR("FACETIME_EMAIL_DESCRIPTION_GROUP_ID"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6 || (unint64_t)objc_msgSend(v11, "count") <= 1)
  {
    v14 = CNFRegGlobalAppearanceStyle();
LABEL_9:
    if (v14 == 4)
    {
      CommunicationsSetupUIBundle();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      CNFStringKeyForIdiom(CFSTR("FACETIME_EMAIL_DESCRIPTION_MODERN"));
    }
    else
    {
      CommunicationsSetupUIBundle();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      CNFStringKeyForIdiom(CFSTR("FACETIME_EMAIL_DESCRIPTION"));
    }
    goto LABEL_7;
  }
  v13 = -[CNFRegEmailController _phoneNumberInAliases:](self, "_phoneNumberInAliases:", v11);
  v14 = CNFRegGlobalAppearanceStyle();
  if (!v13)
    goto LABEL_9;
  v15 = v14 == 4;
  CommunicationsSetupUIBundle();
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
    CNFStringKeyForIdiom(CFSTR("FACETIME_EMAIL_AND_PHONE_DESCRIPTION_MODERN"));
  else
    CNFStringKeyForIdiom(CFSTR("FACETIME_EMAIL_AND_PHONE_DESCRIPTION"));
LABEL_7:
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  CNFRegStringTableName();
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "localizedStringForKey:value:table:", v17, &stru_24D077260, v18);
  v19 = objc_claimAutoreleasedReturnValue();
  v20 = (void *)v19;

  if (objc_msgSend(v20, "_isNaturallyRTL"))
    v21 = 2;
  else
    v21 = 0;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setProperty:forKey:", v22, *MEMORY[0x24BE75860]);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v21);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setProperty:forKey:", v23, *MEMORY[0x24BE75A28]);

  objc_msgSend(v12, "setProperty:forKey:", v20, *MEMORY[0x24BE75A68]);
  objc_msgSend(v5, "specifierForID:", CFSTR("FACETIME_EMAIL_GROUP_ID"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v5, "indexOfObject:", v24);
  if (v25 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v26 = v25;
    OSLogHandleForIDSCategory();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v50 = v11;
      _os_log_impl(&dword_2138BA000, v27, OS_LOG_TYPE_DEFAULT, "Updating specifier list with vetted aliases: %@", buf, 0xCu);
    }

    if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
    {
      v41 = v11;
      IMLogString();
    }
    v28 = v26 + 1;
    if (v6 && objc_msgSend(v11, "count"))
    {
      objc_msgSend(v5, "specifierForID:", CFSTR("FACETIME_EMAIL_ID"));
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "removeObject:", v29);
      v42 = MEMORY[0x24BDAC760];
      v43 = 3221225472;
      v44 = __38__CNFRegEmailController_specifierList__block_invoke;
      v45 = &unk_24D075B10;
      v46 = v5;
      v47 = self;
      v48 = v28;
      objc_msgSend(v11, "enumerateObjectsWithOptions:usingBlock:", 2, &v42);

    }
    if (CNFRegSupportsLocalPhoneNumberSentinelAlias())
    {
      -[CNFRegListController regController](self, "regController");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "localPhoneNumberSentinelAlias");
      v31 = (void *)objc_claimAutoreleasedReturnValue();

      if (v31)
      {
        -[CNFRegEmailController _createSpecifierForAlias:](self, "_createSpecifierForAlias:", v31);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "insertObject:atIndex:", v32, v28);

      }
    }
  }
  -[CNFRegEmailController _buildSpecifierCache:](self, "_buildSpecifierCache:", v5, v41, v42, v43, v44, v45);
  objc_msgSend(v5, "specifierForID:", CFSTR("FACETIME_EMAIL_CHECK_MAIL_GROUP_ID"));
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObject:", v33);
  objc_msgSend(v5, "specifierForID:", CFSTR("FACETIME_EMAIL_CHECK_MAIL_ID"));
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObject:", v34);
  v35 = objc_msgSend(v5, "copy");
  v36 = (void **)((char *)&self->super.super.super.super.super.super.super.isa + v3);
  v37 = *v36;
  *v36 = (void *)v35;

  objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.super.super.isa + (int)*MEMORY[0x24BE75700]), "reloadData");
  -[CNFRegEmailController navigationItem](self, "navigationItem");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "rightBarButtonItem");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "setEnabled:", 0);

  v4 = *v36;
  return v4;
}

void __38__CNFRegEmailController_specifierList__block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  id v4;

  v3 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "_createSpecifierForAlias:", a2);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "insertObject:atIndex:", v4, *(_QWORD *)(a1 + 48));

}

- (id)logName
{
  return CFSTR("Email");
}

- (id)_rightButtonItem
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = objc_alloc(MEMORY[0x24BEBD410]);
  CommunicationsSetupUIBundle();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  CNFRegStringTableName();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("NEXT"), &stru_24D077260, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v3, "initWithTitle:style:target:action:", v6, 2, self, sel_nextTapped);

  return v7;
}

- (BOOL)showActionSpecifier:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  char v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  PSSpecifier *currentActionSpecifier;
  uint64_t v15;
  void *v16;
  uint8_t buf[4];
  uint64_t v18;
  uint64_t v19;

  v4 = a4;
  v19 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = -[CNFRegEmailController containsSpecifier:](self, "containsSpecifier:", v6);
  if ((v7 & 1) == 0)
  {
    if (self->_currentActionSpecifier)
    {
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObject:");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = *MEMORY[0x24BE75A68];
      -[PSSpecifier propertyForKey:](self->_currentActionSpecifier, "propertyForKey:", *MEMORY[0x24BE75A68]);
      v9 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v9 = 0;
      v16 = 0;
      v8 = *MEMORY[0x24BE75A68];
    }
    objc_msgSend(v6, "propertyForKey:", v8);
    v10 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObject:", v6);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNFRegEmailController replaceContiguousSpecifiers:withSpecifiers:animated:](self, "replaceContiguousSpecifiers:withSpecifiers:animated:", v16, v11, v4);
    if (v10 | v9 && (objc_msgSend((id)v10, "isEqualToString:", v9) & 1) == 0)
    {
      OSLogHandleForIDSCategory();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v18 = v10;
        _os_log_impl(&dword_2138BA000, v12, OS_LOG_TYPE_DEFAULT, "Setting footer text to : %@", buf, 0xCu);
      }

      if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
      {
        v15 = v10;
        IMLogString();
      }
      -[PSSpecifier setProperty:forKey:](self->_actionGroupSpecifier, "setProperty:forKey:", v10, v8, v15);
      -[CNFRegEmailController reloadSpecifier:animated:](self, "reloadSpecifier:animated:", self->_actionGroupSpecifier, v4);
    }
    objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.super.super.isa + (int)*MEMORY[0x24BE75700]), "reloadData");

  }
  currentActionSpecifier = self->_currentActionSpecifier;
  self->_currentActionSpecifier = (PSSpecifier *)v6;

  return v7 ^ 1;
}

- (void)_showCheckMailButton:(BOOL)a3 animated:(BOOL)a4
{
  NSArray *checkMailSpecifiers;
  _BOOL8 v6;
  _BOOL4 v7;
  void *v8;
  int v9;

  checkMailSpecifiers = self->_checkMailSpecifiers;
  if (checkMailSpecifiers)
  {
    v6 = a4;
    v7 = a3;
    if (-[NSArray count](checkMailSpecifiers, "count"))
    {
      -[NSArray objectAtIndex:](self->_checkMailSpecifiers, "objectAtIndex:", 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = -[CNFRegEmailController containsSpecifier:](self, "containsSpecifier:", v8);

      if (!v7 || (v9 & 1) != 0)
      {
        if (!v7 && ((v9 ^ 1) & 1) == 0)
          -[CNFRegEmailController removeContiguousSpecifiers:animated:](self, "removeContiguousSpecifiers:animated:", self->_checkMailSpecifiers, v6);
      }
      else
      {
        -[CNFRegEmailController insertContiguousSpecifiers:atIndex:animated:](self, "insertContiguousSpecifiers:atIndex:animated:", self->_checkMailSpecifiers, objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.super.super.isa + (int)*MEMORY[0x24BE756E0]), "count"), v6);
      }
    }
  }
}

- (id)titleString
{
  return &stru_24D077260;
}

- (BOOL)shouldShowAllVettedAliases
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  BOOL v8;

  -[CNFRegListController regController](self, "regController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x24BDBCE30];
  -[CNFRegFirstRunController account](self, "account");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "arrayWithObject:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "vettedAliasesForAccounts:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count") != 0;

  return v8;
}

- (BOOL)_phoneNumberInAliases:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v3 = a3;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v9;
    while (2)
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v3);
        if (objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * i), "type", (_QWORD)v8) == 2)
        {
          LOBYTE(v4) = 1;
          goto LABEL_11;
        }
      }
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
      if (v4)
        continue;
      break;
    }
  }
LABEL_11:

  return v4;
}

- (id)aliasSpecifiers
{
  id v3;
  uint64_t v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc(MEMORY[0x24BDBCEB8]);
  v4 = (int)*MEMORY[0x24BE756E0];
  v5 = (void *)objc_msgSend(v3, "initWithCapacity:", objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.super.super.isa + v4), "count"));
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v6 = *(id *)((char *)&self->super.super.super.super.super.super.super.isa + v4);
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        objc_msgSend(v11, "propertyForKey:", CFSTR("cnfreg-alias"), (_QWORD)v14);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (v12)
          objc_msgSend(v5, "addObject:", v11);

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v8);
  }

  return v5;
}

- (id)_createSpecifierForAlias:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v4 = a3;
  objc_msgSend(v4, "displayName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE75590], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v5, self, 0, 0, 0, 13, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setButtonAction:", sel_setAliasSelected_);
  NSStringFromSelector(sel_setAliasSelected_);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setProperty:forKey:", v7, *MEMORY[0x24BE75900]);

  v8 = objc_msgSend(v4, "isLocalPhoneNumberAlias");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v8 ^ 1u);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setProperty:forKey:", v9, *MEMORY[0x24BE75A18]);

  objc_msgSend(v6, "setProperty:forKey:", objc_opt_class(), *MEMORY[0x24BE75948]);
  objc_msgSend(v4, "identifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setProperty:forKey:", v10, *MEMORY[0x24BE75AC0]);

  objc_msgSend(v6, "setProperty:forKey:", v5, *MEMORY[0x24BE75D50]);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setProperty:forKey:", v11, *MEMORY[0x24BE75860]);

  objc_msgSend(v6, "setProperty:forKey:", v4, CFSTR("cnfreg-alias"));
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setProperty:forKey:", v12, CFSTR("cnfreg-alias-checked"));

  return v6;
}

- (void)setAliasSelected:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;

  v4 = a3;
  objc_msgSend(v4, "propertyForKey:", CFSTR("cnfreg-alias-checked"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "BOOLValue") ^ 1;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setProperty:forKey:", v7, CFSTR("cnfreg-alias-checked"));

  -[CNFRegEmailController cachedCellForSpecifier:](self, "cachedCellForSpecifier:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "setChecked:", v6);
  -[CNFRegEmailController _updateUI](self, "_updateUI");
}

- (id)selectedAliases
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  -[CNFRegEmailController aliasSpecifiers](self, "aliasSpecifiers");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v3)
  {
    v4 = v3;
    v5 = 0;
    v6 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v15 != v6)
          objc_enumerationMutation(v2);
        v8 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        objc_msgSend(v8, "propertyForKey:", CFSTR("cnfreg-alias"));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (v9)
        {
          objc_msgSend(v8, "propertyForKey:", CFSTR("cnfreg-alias-checked"));
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = objc_msgSend(v10, "BOOLValue");

          if (v11)
          {
            if (!v5)
            {
              objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.super.super.isa + (int)*MEMORY[0x24BE756E0]), "count"));
              v5 = (void *)objc_claimAutoreleasedReturnValue();
            }
            objc_msgSend(v5, "addObject:", v9);
          }
        }

      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v4);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (BOOL)onlyLocalPhoneNumberSentinelAliasIsSelected
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  -[CNFRegEmailController selectedAliases](self, "selectedAliases", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v8;
    while (2)
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v8 != v4)
          objc_enumerationMutation(v2);
        if (!objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * i), "isLocalPhoneNumberAlias"))
        {
          LOBYTE(v3) = 0;
          goto LABEL_11;
        }
      }
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
      if (v3)
        continue;
      break;
    }
    LOBYTE(v3) = 1;
  }
LABEL_11:

  return v3;
}

- (void)_finishValidation
{
  void *v3;
  id v4;

  -[CNFRegEmailController _stopValidationModeAnimated:](self, "_stopValidationModeAnimated:", 0);
  -[CNFRegEmailController stopValidationTimeoutTimer](self, "stopValidationTimeoutTimer");
  if (-[CNFRegEmailController shouldShowAllVettedAliases](self, "shouldShowAllVettedAliases"))
  {
    -[CNFRegEmailController _updateControllerState](self, "_updateControllerState");
  }
  else
  {
    -[CNFRegFirstRunController setCellsChecked:](self, "setCellsChecked:", 1);
    -[CNFRegEmailController performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel__updateControllerState, 0, 1.0);
  }
  -[CNFRegEmailController navigationItem](self, "navigationItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setRightBarButtonItem:", 0);

  -[CNFRegEmailController navigationItem](self, "navigationItem");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setHidesBackButton:", 1);

}

- (void)_stopValidationModeAnimated:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CNFRegEmailController;
  -[CNFRegFirstRunController _stopValidationModeAnimated:](&v4, sel__stopValidationModeAnimated_, a3);
  self->_validating = 0;
}

- (void)_failValidationWithError:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
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
  uint64_t v32;
  uint64_t v33;
  void (*v34)(uint64_t, void *);
  void *v35;
  id v36;
  CNFRegEmailController *v37;

  v4 = a3;
  -[CNFRegEmailController _stopValidationModeAnimated:](self, "_stopValidationModeAnimated:", 1);
  -[CNFRegEmailController stopValidationTimeoutTimer](self, "stopValidationTimeoutTimer");
  -[CNFRegEmailController navigationItem](self, "navigationItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "rightBarButtonItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setEnabled:", 1);

  objc_msgSend(v4, "userInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:", CFSTR("cnf-customTitle"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    v10 = v8;
  }
  else
  {
    CommunicationsSetupUIBundle();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    CNFRegStringTableName();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("FACETIME_ACTIVATION_ERROR_TITLE"), &stru_24D077260, v12);
    v10 = (id)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(v4, "localizedDescription");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v13)
  {
    v15 = v13;
  }
  else
  {
    CommunicationsSetupUIBundle();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    CNFRegStringTableName();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "localizedStringForKey:value:table:", CFSTR("FACETIME_SIGNIN_ERROR_GENERIC"), &stru_24D077260, v17);
    v15 = (id)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(v4, "userInfo");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "objectForKey:", CFSTR("cnf-customButton"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v19;
  if (v19)
  {
    v21 = v19;
  }
  else
  {
    CommunicationsSetupUIBundle();
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    CNFRegStringTableName();
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "localizedStringForKey:value:table:", CFSTR("FACETIME_ALERT_OK"), &stru_24D077260, v23);
    v21 = (id)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(MEMORY[0x24BEBD3B0], "alertControllerWithTitle:message:preferredStyle:", v10, v15, 1);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBD3A8], "actionWithTitle:style:handler:", v21, 0, 0);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "addAction:", v25);

  objc_msgSend(v4, "userInfo");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "objectForKey:", CFSTR("cnf-customActionTitle"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  if (v27)
  {
    v28 = (void *)MEMORY[0x24BEBD3A8];
    objc_msgSend(v4, "userInfo");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "objectForKey:", CFSTR("cnf-customActionTitle"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = MEMORY[0x24BDAC760];
    v33 = 3221225472;
    v34 = __50__CNFRegEmailController__failValidationWithError___block_invoke;
    v35 = &unk_24D075BA0;
    v36 = v4;
    v37 = self;
    objc_msgSend(v28, "actionWithTitle:style:handler:", v30, 0, &v32);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "addAction:", v31, v32, v33, v34, v35);

  }
  -[CNFRegEmailController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v24, 1, 0);

}

void __50__CNFRegEmailController__failValidationWithError___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  uint8_t buf[4];
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("cnf-customActionURLString"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      OSLogHandleForIDSCategory();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v11 = v6;
        _os_log_impl(&dword_2138BA000, v7, OS_LOG_TYPE_DEFAULT, "Launching URL : %@", buf, 0xCu);
      }

      if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
      {
        v9 = v6;
        IMLogString();
      }
      objc_msgSend(*(id *)(a1 + 40), "regController", v9);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "openURL:", v6);

    }
  }

}

- (void)nextTapped
{
  NSObject *v2;
  void *v3;
  void *v4;
  id v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  char v23;
  uint64_t i;
  void *v25;
  void *v26;
  char v27;
  void *v28;
  void *v29;
  char v30;
  void *v31;
  void *v32;
  void *v33;
  char v34;
  char v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  NSObject *v49;
  void *v50;
  void *v51;
  id v52;
  void *v53;
  void *v54;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  uint8_t v60[128];
  uint8_t buf[4];
  id v62;
  __int16 v63;
  void *v64;
  uint64_t v65;

  v65 = *MEMORY[0x24BDAC8D0];
  OSLogHandleForIDSCategory();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2138BA000, v2, OS_LOG_TYPE_DEFAULT, "Next tapped", buf, 2u);
  }

  if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
    IMLogString();
  self->_validating = 1;
  -[CNFRegListController regController](self, "regController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!-[CNFRegEmailController shouldShowAllVettedAliases](self, "shouldShowAllVettedAliases"))
  {
    -[CNFRegEmailController emailTextField](self, "emailTextField");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "text");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v3, "aliases");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (void *)objc_msgSend(v19, "copy");

    v58 = 0u;
    v59 = 0u;
    v56 = 0u;
    v57 = 0u;
    v5 = v20;
    v21 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v56, v60, 16);
    if (v21)
    {
      v22 = *(_QWORD *)v57;
      v23 = 1;
      do
      {
        for (i = 0; i != v21; ++i)
        {
          if (*(_QWORD *)v57 != v22)
            objc_enumerationMutation(v5);
          v25 = *(void **)(*((_QWORD *)&v56 + 1) + 8 * i);
          if (objc_msgSend(v25, "type") != 2)
          {
            objc_msgSend(v25, "alias");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            v27 = objc_msgSend(v26, "isEqualToString:", v4);

            if ((v27 & 1) == 0)
            {
              objc_msgSend(v25, "alias");
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v25, "account");
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              v30 = objc_msgSend(v3, "removeAlias:fromAccount:", v28, v29);

              v23 &= v30;
            }
          }
        }
        v21 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v56, v60, 16);
      }
      while (v21);

      if ((v23 & 1) == 0)
        goto LABEL_50;
    }
    else
    {

    }
    objc_msgSend(v3, "aliasNamed:", v4);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = v31;
    if (v31)
    {
      if (objc_msgSend(v31, "validationStatus") == 3)
      {
        objc_msgSend(v32, "account");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = objc_msgSend(v33, "CNFRegSignInComplete");

        if ((v34 & 1) != 0)
        {
          -[CNFRegEmailController _finishValidation](self, "_finishValidation");

          goto LABEL_61;
        }
        OSLogHandleForIDSCategory();
        v49 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_2138BA000, v49, OS_LOG_TYPE_DEFAULT, "**** ERROR: We have a validated alias, but are not registered. Please file a radar.", buf, 2u);
        }

        if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
          IMLogString();
        objc_msgSend(v32, "account");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v50, "registerAccount");

        goto LABEL_57;
      }
      v35 = objc_msgSend(v32, "validate");

      if ((v35 & 1) == 0)
      {
LABEL_50:
        CommunicationsSetupUIBundle();
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        CNFRegStringTableName();
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "localizedStringForKey:value:table:", CFSTR("FACETIME_ACTIVATION_ERROR_TITLE"), &stru_24D077260, v37);
        v38 = (void *)objc_claimAutoreleasedReturnValue();

        v39 = (void *)MEMORY[0x24BDD17C8];
        CommunicationsSetupUIBundle();
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        CNFRegStringTableName();
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "localizedStringForKey:value:table:", CFSTR("FACETIME_EMAIL_UNABLE_TO_ADD_ALIAS_%@"), &stru_24D077260, v41);
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "stringWithFormat:", v42, v4);
        v43 = (void *)objc_claimAutoreleasedReturnValue();

        CommunicationsSetupUIBundle();
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        CNFRegStringTableName();
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "localizedStringForKey:value:table:", CFSTR("FACETIME_ALERT_OK"), &stru_24D077260, v45);
        v46 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x24BEBD3B0], "alertControllerWithTitle:message:preferredStyle:", v38, v43, 1);
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BEBD3A8], "actionWithTitle:style:handler:", v46, 0, 0);
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v47, "addAction:", v48);

        -[CNFRegEmailController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v47, 1, 0);
LABEL_60:

        goto LABEL_61;
      }
    }
    else if (!objc_msgSend(v3, "addAlias:", v4))
    {
      goto LABEL_50;
    }
LABEL_57:
    -[CNFRegEmailController setPendingAlias:](self, "setPendingAlias:", v4);
    -[CNFRegEmailController cachedCellForSpecifier:](self, "cachedCellForSpecifier:", self->_emailSpecifier);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "editableTextField");
    v38 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v38, "resignFirstResponder");
    -[CNFRegFirstRunController _startValidationModeAnimated:allowCancel:](self, "_startValidationModeAnimated:allowCancel:", 0, 1);
    -[CNFRegEmailController _showCheckMailButton:animated:](self, "_showCheckMailButton:animated:", 0, 1);
    -[CNFRegEmailController startValidationTimeoutTimer](self, "startValidationTimeoutTimer");
    goto LABEL_60;
  }
  -[CNFRegEmailController selectedAliases](self, "selectedAliases");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "arrayByApplyingSelector:", sel_alias);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  OSLogHandleForIDSCategory();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v62 = v4;
    _os_log_impl(&dword_2138BA000, v6, OS_LOG_TYPE_DEFAULT, "  => Selected aliases: %@", buf, 0xCu);
  }

  if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
  {
    v52 = v4;
    IMLogString();
  }
  OSLogHandleForIDSCategory();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v62 = v5;
    _os_log_impl(&dword_2138BA000, v7, OS_LOG_TYPE_DEFAULT, "  => Alias strings: %@", buf, 0xCu);
  }

  if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
  {
    v52 = v5;
    IMLogString();
  }
  -[CNFRegFirstRunController account](self, "account", v52);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAliases:onAccount:", v5, v8);

  OSLogHandleForIDSCategory();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    -[CNFRegFirstRunController account](self, "account");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "aliases");
    v11 = (id)objc_claimAutoreleasedReturnValue();
    -[CNFRegFirstRunController account](self, "account");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v62 = v11;
    v63 = 2112;
    v64 = v12;
    _os_log_impl(&dword_2138BA000, v9, OS_LOG_TYPE_DEFAULT, "Set aliases %@ on account %@", buf, 0x16u);

  }
  if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
  {
    -[CNFRegFirstRunController account](self, "account");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "aliases");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNFRegFirstRunController account](self, "account");
    v53 = v14;
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    IMLogString();

  }
  -[CNFRegFirstRunController account](self, "account", v53, v54);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "CNFRegSignInComplete");

  if (v16)
  {
    OSLogHandleForIDSCategory();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2138BA000, v17, OS_LOG_TYPE_DEFAULT, "Skipping validation because sign in is complete", buf, 2u);
    }

    if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
      IMLogString();
    -[CNFRegEmailController _finishValidation](self, "_finishValidation");
  }
  else
  {
    -[CNFRegFirstRunController _startValidationModeAnimated:allowCancel:](self, "_startValidationModeAnimated:allowCancel:", 0, 1);
    -[CNFRegEmailController _showCheckMailButton:animated:](self, "_showCheckMailButton:animated:", 0, 1);
    -[CNFRegEmailController startValidationTimeoutTimer](self, "startValidationTimeoutTimer");
  }
LABEL_61:

}

- (void)_returnKeyPressed
{
  void *v3;
  _BOOL4 v4;
  int v5;

  if (-[CNFRegEmailController shouldShowAllVettedAliases](self, "shouldShowAllVettedAliases"))
  {
    -[CNFRegEmailController selectedAliases](self, "selectedAliases");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "count") != 0;

  }
  else
  {
    v4 = 0;
  }
  if (-[CNFRegEmailController shouldShowAllVettedAliases](self, "shouldShowAllVettedAliases"))
    v5 = 0;
  else
    v5 = !-[CNFRegEmailController emailFieldIsEmpty](self, "emailFieldIsEmpty");
  if ((v4 | v5) == 1)
    -[CNFRegEmailController nextTapped](self, "nextTapped");
}

- (void)checkMailTapped:(id)a3
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
  id v14;

  if (SBSLaunchApplicationWithIdentifier())
  {
    CommunicationsSetupUIBundle();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    CNFRegStringTableName();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("FACETIME_ACTIVATION_ERROR_TITLE"), &stru_24D077260, v5);
    v14 = (id)objc_claimAutoreleasedReturnValue();

    CommunicationsSetupUIBundle();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    CNFRegStringTableName();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("FACETIME_SIGNIN_ERROR_COULDNT_LAUNCH_MAIL"), &stru_24D077260, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    CommunicationsSetupUIBundle();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    CNFRegStringTableName();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("FACETIME_ALERT_OK"), &stru_24D077260, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BEBD3B0], "alertControllerWithTitle:message:preferredStyle:", v14, v8, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BEBD3A8], "actionWithTitle:style:handler:", v11, 0, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addAction:", v13);

    -[CNFRegEmailController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v12, 1, 0);
  }
}

- (void)_handleValidationModeCancelled
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)CNFRegEmailController;
  -[CNFRegFirstRunController _handleValidationModeCancelled](&v10, sel__handleValidationModeCancelled);
  -[CNFRegEmailController pendingAlias](self, "pendingAlias");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3 && objc_msgSend(v3, "length"))
  {
    -[CNFRegListController regController](self, "regController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "aliasNamed:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    -[CNFRegListController regController](self, "regController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "alias");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "account");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "removeAlias:fromAccount:", v8, v9);

  }
  -[CNFRegEmailController _stopValidationModeAnimated:](self, "_stopValidationModeAnimated:", 0);

}

- (void)systemApplicationDidEnterBackground
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CNFRegEmailController;
  -[CNFRegFirstRunController systemApplicationDidEnterBackground](&v3, sel_systemApplicationDidEnterBackground);
  -[CNFRegEmailController stopValidationTimeoutTimer](self, "stopValidationTimeoutTimer");
  -[CNFRegEmailController _stopValidationModeAnimated:](self, "_stopValidationModeAnimated:", 1);
}

- (void)systemApplicationWillEnterForeground
{
  NSObject *v2;
  uint8_t v3[16];
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CNFRegEmailController;
  -[CNFRegFirstRunController systemApplicationWillEnterForeground](&v4, sel_systemApplicationWillEnterForeground);
  OSLogHandleForIDSCategory();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_2138BA000, v2, OS_LOG_TYPE_DEFAULT, "Will become active", v3, 2u);
  }

  if (os_log_shim_legacy_logging_enabled())
  {
    if (IMShouldLog())
      IMLogString();
  }
}

- (void)_refreshEnabledStateOfAliasSpecifiers
{
  void *v3;
  CNFRegEmailController *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  id obj;
  uint64_t v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  -[CNFRegEmailController selectedAliases](self, "selectedAliases");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v3, "count");

  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v4 = self;
  -[CNFRegEmailController aliasSpecifiers](self, "aliasSpecifiers");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v18;
    v8 = *MEMORY[0x24BE75A18];
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v18 != v7)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        objc_msgSend(v10, "propertyForKey:", CFSTR("cnfreg-alias"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (v11)
        {
          if (v16 == 1)
          {
            objc_msgSend(v10, "propertyForKey:", CFSTR("cnfreg-alias-checked"));
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            v13 = objc_msgSend(v12, "BOOLValue");

          }
          else
          {
            v13 = 0;
          }
          if (CNFRegSupportsLocalPhoneNumberSentinelAlias())
            v13 |= objc_msgSend(v11, "isLocalPhoneNumberAlias");
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v13 ^ 1u);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "setProperty:forKey:", v14, v8);

          -[CNFRegEmailController reloadSpecifier:](v4, "reloadSpecifier:", v10);
        }

      }
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v6);
  }

}

- (void)_updateUI
{
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint8_t v16[16];

  -[CNFRegListController regController](self, "regController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNFRegEmailController pendingAlias](self, "pendingAlias");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "aliasNamed:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5 && objc_msgSend(v5, "validationStatus") == 2)
  {
    -[CNFRegFirstRunController _startValidationModeAnimated:allowCancel:](self, "_startValidationModeAnimated:allowCancel:", 1, 1);
    if (!self->_validationTimeoutTimer)
      -[CNFRegEmailController startValidationTimeoutTimer](self, "startValidationTimeoutTimer");
  }
  else
  {
    OSLogHandleForIDSCategory();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v16 = 0;
      _os_log_impl(&dword_2138BA000, v6, OS_LOG_TYPE_DEFAULT, "Handling initial state", v16, 2u);
    }

    if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
      IMLogString();
    -[CNFRegEmailController _stopValidationModeAnimated:](self, "_stopValidationModeAnimated:", 1);
    if (-[CNFRegEmailController shouldShowAllVettedAliases](self, "shouldShowAllVettedAliases"))
    {
      -[CNFRegEmailController selectedAliases](self, "selectedAliases");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "count") != 0;

      -[CNFRegEmailController _refreshEnabledStateOfAliasSpecifiers](self, "_refreshEnabledStateOfAliasSpecifiers");
    }
    else
    {
      -[CNFRegEmailController pendingAlias](self, "pendingAlias");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v9)
      {
        objc_msgSend(v3, "guessedAlias");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[CNFRegEmailController setPendingAlias:](self, "setPendingAlias:", v10);

      }
      v8 = -[CNFRegEmailController emailFieldIsEmpty](self, "emailFieldIsEmpty") ^ 1;
      -[CNFRegEmailController pendingAlias](self, "pendingAlias");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (v11)
      {
        -[CNFRegEmailController pendingAlias](self, "pendingAlias");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "length");

        if (v13)
          v8 = 1;
        else
          v8 = v8;
      }

      -[CNFRegEmailController reloadSpecifier:animated:](self, "reloadSpecifier:animated:", self->_emailSpecifier, 1);
    }
    -[CNFRegEmailController navigationItem](self, "navigationItem");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "rightBarButtonItem");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setEnabled:", v8);

  }
}

- (void)_updateControllerState
{
  void *v3;
  void *v4;
  uint64_t v5;
  NSObject *v6;
  const __CFString *v7;
  const __CFString *v8;
  const __CFString *v9;
  const __CFString *v10;
  void *v11;
  NSObject *v12;
  char v13;
  const __CFString *v14;
  const __CFString *v15;
  objc_super v16;
  uint8_t buf[4];
  const __CFString *v18;
  __int16 v19;
  const __CFString *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v16.receiver = self;
  v16.super_class = (Class)CNFRegEmailController;
  -[CNFRegFirstRunController _updateControllerState](&v16, sel__updateControllerState);
  -[CNFRegEmailController _updateUI](self, "_updateUI");
  -[CNFRegListController regController](self, "regController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNFRegFirstRunController account](self, "account");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "accountStateForAccount:", v4);

  OSLogHandleForIDSCategory();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = CFSTR("YES");
    if ((v5 & 1) != 0)
      v8 = CFSTR("YES");
    else
      v8 = CFSTR("NO");
    if ((v5 & 4) == 0)
      v7 = CFSTR("NO");
    *(_DWORD *)buf = 138412546;
    v18 = v8;
    v19 = 2112;
    v20 = v7;
    _os_log_impl(&dword_2138BA000, v6, OS_LOG_TYPE_DEFAULT, "Updating email controller state, authenticated:%@   signInComplete:%@", buf, 0x16u);
  }

  if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
  {
    v9 = CFSTR("YES");
    if ((v5 & 1) != 0)
      v10 = CFSTR("YES");
    else
      v10 = CFSTR("NO");
    if ((v5 & 4) == 0)
      v9 = CFSTR("NO");
    v14 = v10;
    v15 = v9;
    IMLogString();
  }
  if ((v5 & 1) != 0)
  {
    if ((v5 & 4) != 0)
    {
      OSLogHandleForIDSCategory();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_2138BA000, v12, OS_LOG_TYPE_DEFAULT, "Handling finished state", buf, 2u);
      }

      if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
        IMLogString();
      if (-[CNFRegFirstRunController pushCompletionControllerIfPossible](self, "pushCompletionControllerIfPossible", v14, v15))
      {
        v13 = 1;
      }
      else
      {
        v13 = -[CNFRegFirstRunController dismissWithState:](self, "dismissWithState:", v5);
      }
      CNFAssert(v13, 7, CFSTR("Finished email verification but no action was taken"));
    }
    else
    {
      -[CNFRegFirstRunController _refreshNavBarAnimated:](self, "_refreshNavBarAnimated:", 0);
    }
  }
  else
  {
    -[CNFRegEmailController navigationController](self, "navigationController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "popToSigninControllerAnimated:", 1);

  }
}

- (void)_setFieldsEnabled:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL8 v5;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  objc_super v18;
  _BYTE v19[128];
  uint64_t v20;

  v4 = a4;
  v5 = a3;
  v20 = *MEMORY[0x24BDAC8D0];
  v18.receiver = self;
  v18.super_class = (Class)CNFRegEmailController;
  -[CNFRegListController _setFieldsEnabled:animated:](&v18, sel__setFieldsEnabled_animated_);
  -[CNFRegListController _setSpecifierEnabled:enabled:animated:](self, "_setSpecifierEnabled:enabled:animated:", self->_emailSpecifier, v5, v4);
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[CNFRegEmailController aliasSpecifiers](self, "aliasSpecifiers", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v19, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v15 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        objc_msgSend(v12, "propertyForKey:", CFSTR("cnfreg-alias"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v13, "isLocalPhoneNumberAlias") & 1) == 0)
          -[CNFRegListController _setSpecifierEnabled:enabled:animated:](self, "_setSpecifierEnabled:enabled:animated:", v12, v5, v4);

      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v19, 16);
    }
    while (v9);
  }

}

- (id)emailTextField
{
  void *v2;
  void *v3;
  void *v4;

  -[CNFRegEmailController cachedCellForSpecifier:](self, "cachedCellForSpecifier:", self->_emailSpecifier);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "editableTextField");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  CNFRegGlobalAppearanceController();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setKeyboardAppearance:", objc_msgSend(v4, "keyboardAppearance"));

  return v3;
}

- (BOOL)emailFieldIsEmpty
{
  void *v2;
  void *v3;
  BOOL v4;

  -[CNFRegEmailController emailTextField](self, "emailTextField");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "text");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    v4 = objc_msgSend(v3, "length") == 0;
  else
    v4 = 1;

  return v4;
}

- (void)emailFieldEmptyStateChanged:(id)a3 forSpecifier:(id)a4
{
  int v5;
  void *v6;
  id v7;

  v5 = objc_msgSend(a3, "BOOLValue");
  -[CNFRegEmailController navigationItem](self, "navigationItem");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "rightBarButtonItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setEnabled:", v5 ^ 1u);

}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
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
  objc_super v21;

  v21.receiver = self;
  v21.super_class = (Class)CNFRegEmailController;
  v6 = a4;
  -[CNFRegEmailController tableView:cellForRowAtIndexPath:](&v21, sel_tableView_cellForRowAtIndexPath_, a3, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[CNFRegEmailController indexForIndexPath:](self, "indexForIndexPath:", v6, v21.receiver, v21.super_class);

  if (v8 != 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.super.super.isa + (int)*MEMORY[0x24BE756E0]), "objectAtIndex:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "propertyForKey:", CFSTR("cnfreg-alias-checked"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
      objc_msgSend(v7, "setChecked:", objc_msgSend(v10, "BOOLValue"));

  }
  if (CNFRegGlobalAppearanceStyle() == 6 || CNFRegGlobalAppearanceStyle() == 5)
  {
    objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setBackgroundColor:", v11);

  }
  -[CNFRegEmailController cachedCellForSpecifierID:](self, "cachedCellForSpecifierID:", CFSTR("FACETIME_EMAIL_ID"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7 == v12)
  {
    +[CNFRegAppearanceController globalAppearanceController](CNFRegAppearanceController, "globalAppearanceController");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v13, "styleUsesCustomTableStyle"))
    {
      objc_msgSend(v13, "tableCellTextLabelColor");
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (v14)
      {
        objc_msgSend(v13, "tableCellTextLabelColor");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "editableTextField");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "_placeholderLabel");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "setTextColor:", v15);

        objc_msgSend(v13, "tableCellTextLabelColor");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "editableTextField");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "setTextColor:", v18);

      }
    }

  }
  return v7;
}

- (double)timeoutDuration
{
  void *v3;
  double v4;
  unint64_t v5;
  double result;

  v3 = (void *)CUTWeakLinkClass();
  if (v3 && (objc_msgSend(v3, "hasActiveAccounts") & 1) != 0
    || (v4 = 18.0, -[CNFRegEmailController shouldShowAllVettedAliases](self, "shouldShowAllVettedAliases")))
  {
    v4 = 75.0;
  }
  v5 = objc_msgSend(MEMORY[0x24BDBCF50], "CNFRegEmailValidationTimeout");
  result = (double)v5;
  if (!v5)
    return v4;
  return result;
}

- (void)stopValidationTimeoutTimer
{
  NSObject *v3;
  NSTimer *validationTimeoutTimer;
  uint8_t v5[16];

  if (self->_validationTimeoutTimer)
  {
    OSLogHandleForIDSCategory();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_2138BA000, v3, OS_LOG_TYPE_DEFAULT, "Stopping validation timer", v5, 2u);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      if (IMShouldLog())
        IMLogString();
    }
    -[NSTimer invalidate](self->_validationTimeoutTimer, "invalidate");
    validationTimeoutTimer = self->_validationTimeoutTimer;
    self->_validationTimeoutTimer = 0;

  }
}

- (void)startValidationTimeoutTimer
{
  double v3;
  double v4;
  NSObject *v5;
  NSTimer *v6;
  NSTimer *validationTimeoutTimer;
  double v8;
  uint8_t buf[4];
  double v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  if (self->_validationTimeoutTimer)
    -[CNFRegEmailController stopValidationTimeoutTimer](self, "stopValidationTimeoutTimer");
  -[CNFRegEmailController timeoutDuration](self, "timeoutDuration");
  v4 = v3;
  OSLogHandleForIDSCategory();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v10 = v4;
    _os_log_impl(&dword_2138BA000, v5, OS_LOG_TYPE_DEFAULT, "Starting validation timer with duration %0.3f", buf, 0xCu);
  }

  if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
  {
    v8 = v4;
    IMLogString();
  }
  objc_msgSend(MEMORY[0x24BDBCF40], "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, sel_validationTimeout_, 0, 0, v4, *(_QWORD *)&v8);
  v6 = (NSTimer *)objc_claimAutoreleasedReturnValue();
  validationTimeoutTimer = self->_validationTimeoutTimer;
  self->_validationTimeoutTimer = v6;

}

- (void)validationTimeout:(id)a3
{
  id v4;
  NSObject *v5;
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
  uint8_t v19[16];

  v4 = a3;
  OSLogHandleForIDSCategory();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v19 = 0;
    _os_log_impl(&dword_2138BA000, v5, OS_LOG_TYPE_DEFAULT, "Validation timeout occurred", v19, 2u);
  }

  if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
    IMLogString();
  -[CNFRegEmailController _stopValidationModeAnimated:](self, "_stopValidationModeAnimated:", 1);
  -[CNFRegEmailController stopValidationTimeoutTimer](self, "stopValidationTimeoutTimer");
  -[CNFRegEmailController navigationItem](self, "navigationItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "rightBarButtonItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setEnabled:", 1);

  if (-[CNFRegEmailController shouldShowAllVettedAliases](self, "shouldShowAllVettedAliases"))
  {
    CommunicationsSetupUIBundle();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    CNFRegStringTableName();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("FACETIME_ACTIVATION_ERROR_TITLE"), &stru_24D077260, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    CommunicationsSetupUIBundle();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    CNFRegStringTableName();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("FACETIME_ACTIVATION_ERROR_GENERIC"), &stru_24D077260, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    CommunicationsSetupUIBundle();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    CNFRegStringTableName();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("FACETIME_ALERT_OK"), &stru_24D077260, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BEBD3B0], "alertControllerWithTitle:message:preferredStyle:", v10, v13, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BEBD3A8], "actionWithTitle:style:handler:", v16, 0, 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addAction:", v18);

    -[CNFRegEmailController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v17, 1, 0);
  }
  else
  {
    -[CNFRegEmailController _showCheckMailButton:animated:](self, "_showCheckMailButton:animated:", 1, 1);
  }

}

- (void)_buildEmailSpecifierCache:(id)a3
{
  PSSpecifier *v4;
  PSSpecifier *emailSpecifier;

  objc_msgSend(a3, "specifierForID:", CFSTR("FACETIME_EMAIL_ID"));
  v4 = (PSSpecifier *)objc_claimAutoreleasedReturnValue();
  emailSpecifier = self->_emailSpecifier;
  self->_emailSpecifier = v4;

}

- (void)_buildActionGroupSpecifierCache:(id)a3
{
  PSSpecifier *v4;
  PSSpecifier *actionGroupSpecifier;

  objc_msgSend(a3, "specifierForID:", CFSTR("FACETIME_EMAIL_BUTTON_GROUP_ID"));
  v4 = (PSSpecifier *)objc_claimAutoreleasedReturnValue();
  actionGroupSpecifier = self->_actionGroupSpecifier;
  self->_actionGroupSpecifier = v4;

}

- (void)_buildCheckMailSpecifierCache:(id)a3
{
  id v5;
  void *v6;
  NSArray *v7;
  NSArray *checkMailSpecifiers;
  void *v9;
  id v10;

  v5 = a3;
  objc_msgSend(v5, "specifierForID:", CFSTR("FACETIME_EMAIL_CHECK_MAIL_GROUP_ID"));
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "specifierForID:", CFSTR("FACETIME_EMAIL_CHECK_MAIL_ID"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10 || !v6)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CNFRegEmailController.m"), 866, CFSTR("Could not retrieve check mail button from plist"));

  }
  v7 = (NSArray *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE30]), "initWithObjects:", v10, v6, 0);
  checkMailSpecifiers = self->_checkMailSpecifiers;
  self->_checkMailSpecifiers = v7;

}

- (void)_buildSpecifierCache:(id)a3
{
  id v4;

  v4 = a3;
  -[CNFRegEmailController _buildEmailSpecifierCache:](self, "_buildEmailSpecifierCache:", v4);
  -[CNFRegEmailController _buildCheckMailSpecifierCache:](self, "_buildCheckMailSpecifierCache:", v4);
  -[CNFRegEmailController _buildActionGroupSpecifierCache:](self, "_buildActionGroupSpecifierCache:", v4);

}

- (void)_setupEventHandlers
{
  void *v3;
  uint64_t v4;
  _QWORD v5[5];
  _QWORD v6[5];
  _QWORD v7[5];
  _QWORD v8[5];
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CNFRegEmailController;
  -[CNFRegFirstRunController _setupEventHandlers](&v9, sel__setupEventHandlers);
  -[CNFRegListController regController](self, "regController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = MEMORY[0x24BDAC760];
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __44__CNFRegEmailController__setupEventHandlers__block_invoke;
  v8[3] = &unk_24D075CB8;
  v8[4] = self;
  objc_msgSend(v3, "setAccountRegistrationBlock:", v8);
  v7[0] = v4;
  v7[1] = 3221225472;
  v7[2] = __44__CNFRegEmailController__setupEventHandlers__block_invoke_2;
  v7[3] = &unk_24D075CE0;
  v7[4] = self;
  objc_msgSend(v3, "setAliasAddedBlock:", v7);
  v6[0] = v4;
  v6[1] = 3221225472;
  v6[2] = __44__CNFRegEmailController__setupEventHandlers__block_invoke_177;
  v6[3] = &unk_24D075D08;
  v6[4] = self;
  objc_msgSend(v3, "setAliasStatusChangedBlock:", v6);
  v5[0] = v4;
  v5[1] = 3221225472;
  v5[2] = __44__CNFRegEmailController__setupEventHandlers__block_invoke_181;
  v5[3] = &unk_24D075C90;
  v5[4] = self;
  objc_msgSend(v3, "setVettedAliasesChangedBlock:", v5);

}

void __44__CNFRegEmailController__setupEventHandlers__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  if (objc_msgSend(v4, "CNFRegSignInComplete"))
  {
    objc_msgSend(*(id *)(a1 + 32), "_finishValidation");
  }
  else if (objc_msgSend(v4, "CNFRegSignInFailed"))
  {
    objc_msgSend(*(id *)(a1 + 32), "stopValidationTimeoutTimer");
    objc_msgSend(*(id *)(a1 + 32), "_stopValidationModeAnimated:", 0);
    objc_msgSend(*(id *)(a1 + 32), "navigationController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "popToSigninControllerAnimated:", 1);

  }
}

void __44__CNFRegEmailController__setupEventHandlers__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  int v6;
  id v7;
  uint8_t buf[4];
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  OSLogHandleForIDSCategory();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v9 = v3;
    _os_log_impl(&dword_2138BA000, v4, OS_LOG_TYPE_DEFAULT, "Alias added: %@", buf, 0xCu);
  }

  if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
  {
    v7 = v3;
    IMLogString();
  }
  objc_msgSend(v3, "account", v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "CNFRegSignInComplete");

  if (v6)
    objc_msgSend(*(id *)(a1 + 32), "_finishValidation");

}

void __44__CNFRegEmailController__setupEventHandlers__block_invoke_177(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  _BOOL4 v10;
  id v11;
  uint8_t buf[4];
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  OSLogHandleForIDSCategory();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v13 = v5;
    _os_log_impl(&dword_2138BA000, v7, OS_LOG_TYPE_DEFAULT, "Got alias status change: %@", buf, 0xCu);
  }

  if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
  {
    v11 = v5;
    IMLogString();
  }
  objc_msgSend(v5, "account", v11);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "account");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v8 == v9;

  if (v10 && objc_msgSend(v5, "validationStatus") == -1)
    objc_msgSend(*(id *)(a1 + 32), "_failValidationWithError:", v6);

}

void __44__CNFRegEmailController__setupEventHandlers__block_invoke_181(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  _BYTE *v5;
  id v6;
  _BOOL4 v7;
  uint8_t buf[4];
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  OSLogHandleForIDSCategory();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v9 = v3;
    _os_log_impl(&dword_2138BA000, v4, OS_LOG_TYPE_DEFAULT, "Got vetted aliases change: %@", buf, 0xCu);
  }

  if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
    IMLogString();
  v5 = *(_BYTE **)(a1 + 32);
  if (!v5[1528])
  {
    objc_msgSend(v5, "account");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    v7 = v6 == v3;

    if (v7)
      objc_msgSend(*(id *)(a1 + 32), "reloadSpecifiers");
  }

}

- (NSString)pendingAlias
{
  return self->_pendingAlias;
}

- (void)setPendingAlias:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1520);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingAlias, 0);
  objc_storeStrong((id *)&self->_validationTimeoutTimer, 0);
  objc_storeStrong((id *)&self->_checkMailSpecifiers, 0);
  objc_storeStrong((id *)&self->_currentActionSpecifier, 0);
  objc_storeStrong((id *)&self->_actionGroupSpecifier, 0);
  objc_storeStrong((id *)&self->_emailSpecifier, 0);
}

@end
