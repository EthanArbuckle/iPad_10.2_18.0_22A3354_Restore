@implementation FATopLevelSettingsSpecifierProvider

- (id)specifiers
{
  id v3;
  NSObject *v4;
  const char *v5;
  uint8_t *v6;
  void *v7;
  void *v8;
  __int16 v10;
  __int16 v11;

  v3 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  if (objc_msgSend(MEMORY[0x24BE04958], "isMultiUserMode"))
  {
    _FALogSystem();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v11 = 0;
      v5 = "Device is in multi-user mode, not showing top level Family specifiers.";
      v6 = (uint8_t *)&v11;
LABEL_9:
      _os_log_impl(&dword_20DE41000, v4, OS_LOG_TYPE_DEFAULT, v5, v6, 2u);
    }
  }
  else
  {
    -[FASettingsSpecifierProvider _appleAccount](self, "_appleAccount");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      -[FATopLevelSettingsSpecifierProvider _familySpecifier](self, "_familySpecifier");
      v4 = objc_claimAutoreleasedReturnValue();
      if (v4)
        objc_msgSend(v3, "addObject:", v4);
    }
    else
    {
      _FALogSystem();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        v10 = 0;
        v5 = "User not signed in to AppleAccount, not showing top level Family specifiers.";
        v6 = (uint8_t *)&v10;
        goto LABEL_9;
      }
    }
  }

  v8 = (void *)objc_msgSend(v3, "copy");
  -[FASettingsSpecifierProvider setSpecifiers:](self, "setSpecifiers:", v8);

  return v8;
}

- (id)_familySpecifier
{
  void *v3;
  uint64_t v4;
  _BOOL4 v5;
  NSObject *v6;
  void *v7;
  _DWORD v9[2];
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "integerForKey:", 0);

  v5 = v4 && !self->super._familyCircle && !self->super._didFailToGetFamilyDetails;
  _FALogSystem();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v9[0] = 67109376;
    v9[1] = v5;
    v10 = 2048;
    v11 = v4;
    _os_log_impl(&dword_20DE41000, v6, OS_LOG_TYPE_DEFAULT, "Using cache - %d with state - %lu", (uint8_t *)v9, 0x12u);
  }

  if (!self->super._familyCircle && !self->super._didFailToGetFamilyDetails)
  {
    -[FASettingsSpecifierProvider _loadFamilyDetailsWithCompletion:](self, "_loadFamilyDetailsWithCompletion:", 0);
    if (v5)
      goto LABEL_11;
    goto LABEL_10;
  }
  if (!v5)
LABEL_10:
    v4 = -[FASettingsSpecifierProvider _familyState](self, "_familyState");
LABEL_11:
  -[FATopLevelSettingsSpecifierProvider _familyBaseSpecifierWithState:](self, "_familyBaseSpecifierWithState:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setControllerLoadAction:", sel__viewFamilySpecifierWasTapped_);
  objc_msgSend(v7, "setIdentifier:", 0);
  return v7;
}

- (id)_familyBaseSpecifierWithState:(unint64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = (void *)MEMORY[0x24BEBD640];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "imageNamed:inBundle:", CFSTR("family"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)MEMORY[0x24BE75590];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("FAMILY_TOP_LEVEL_CELL_LABEL"), &stru_24C8A3000, CFSTR("Localizable"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v9, self, 0, 0, 0, 2, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "setProperty:forKey:", v6, *MEMORY[0x24BE75AC8]);
  return v10;
}

- (unint64_t)cachePolicy
{
  return 1;
}

@end
