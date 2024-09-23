@implementation MCUISpecifierProvider

- (MCUISpecifierProvider)initWithDelegate:(id)a3
{
  id v4;
  MCUISpecifierProvider *v5;
  MCUISpecifierProvider *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)MCUISpecifierProvider;
  v5 = -[MCUISpecifierProvider init](&v8, sel_init);
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->_delegate, v4);

  return v6;
}

- (BOOL)isSectionPopulated:(id)a3 outIsPlural:(BOOL *)a4
{
  id v5;
  void *v6;
  BOOL v7;

  v5 = a3;
  v6 = v5;
  if (v5 && objc_msgSend(v5, "count"))
  {
    *a4 = (unint64_t)objc_msgSend(v6, "count") > 1;
    v7 = 1;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)specifierWithName:(id)a3 detail:(Class)a4
{
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[2];
  _QWORD v9[3];

  v9[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D804E8], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", a3, self, 0, 0, a4, 1, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = *MEMORY[0x1E0D80780];
  v9[0] = objc_opt_class();
  v8[1] = *MEMORY[0x1E0D80870];
  objc_msgSend(MEMORY[0x1E0D1BFA0], "gearIcon");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[1] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, v8, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setProperties:", v6);

  return v4;
}

- (id)_specifierForProfile:(id)a3 profileInstalled:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;

  v4 = a4;
  v6 = a3;
  objc_msgSend(v6, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[MCUISpecifierProvider specifierWithName:detail:](self, "specifierWithName:detail:", v7, objc_opt_class());
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "friendlyName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setProperty:forKey:", v9, *MEMORY[0x1E0D80978]);

  objc_msgSend(v6, "organization");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setProperty:forKey:", v10, *MEMORY[0x1E0D80950]);

  objc_msgSend(v8, "setProperty:forKey:", v6, CFSTR("MCUIPSItemKey"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setProperty:forKey:", v11, CFSTR("MCUIPSInstalledKey"));

  objc_msgSend(v6, "expiryDate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    objc_msgSend(v6, "expiryDate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "DMCProfilePastExpiration");

  }
  else
  {
    v14 = 0;
  }

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setProperty:forKey:", v15, CFSTR("MCUIPSExpiredKey"));

  objc_msgSend(v8, "setControllerLoadAction:", sel_loadProfileFromSpecifier_);
  return v8;
}

- (id)_specifiersForProfiles:(id)a3 singularHeader:(id)a4 pluralHeaader:(id)a5 profilesInstalled:(BOOL)a6
{
  _BOOL8 v6;
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  id v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  char v28;
  _BYTE v29[128];
  uint64_t v30;

  v6 = a6;
  v30 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v28 = 0;
  if (-[MCUISpecifierProvider isSectionPopulated:outIsPlural:](self, "isSectionPopulated:outIsPlural:", v10, &v28))
  {
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v10, "count") + 1);
    v23 = v11;
    if (v28)
      v14 = v12;
    else
      v14 = v11;
    objc_msgSend(MEMORY[0x1E0D804E8], "groupSpecifierWithName:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addObject:", v15);

    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    v16 = v10;
    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v25;
      do
      {
        v20 = 0;
        do
        {
          if (*(_QWORD *)v25 != v19)
            objc_enumerationMutation(v16);
          -[MCUISpecifierProvider _specifierForProfile:profileInstalled:](self, "_specifierForProfile:profileInstalled:", *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * v20), v6);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "addObject:", v21);

          ++v20;
        }
        while (v18 != v20);
        v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
      }
      while (v18);
    }

    v11 = v23;
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (id)specifiersForMDMProfiles:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  MCUILocalizedString(CFSTR("MOBILE_DEVICE_MANAGEMENT"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  MCUILocalizedString(CFSTR("MOBILE_DEVICE_MANAGEMENT"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MCUISpecifierProvider _specifiersForProfiles:singularHeader:pluralHeaader:profilesInstalled:](self, "_specifiersForProfiles:singularHeader:pluralHeaader:profilesInstalled:", v4, v5, v6, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)specifiersForUninstalledProfiles:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  MCUILocalizedString(CFSTR("UNINSTALLED_PROFILE"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  MCUILocalizedString(CFSTR("UNINSTALLED_PROFILE_PLURAL"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MCUISpecifierProvider _specifiersForProfiles:singularHeader:pluralHeaader:profilesInstalled:](self, "_specifiersForProfiles:singularHeader:pluralHeaader:profilesInstalled:", v4, v5, v6, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)specifiersForInstalledProfiles:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = a3;
  v5 = v4;
  if (v4 && objc_msgSend(v4, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "filteredArrayUsingPredicate:", v6);
    v7 = objc_claimAutoreleasedReturnValue();

    v5 = (void *)v7;
  }
  MCUILocalizedString(CFSTR("CONFIGURATION_PROFILE"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  MCUILocalizedString(CFSTR("CONFIGURATION_PROFILE_PLURAL"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[MCUISpecifierProvider _specifiersForProfiles:singularHeader:pluralHeaader:profilesInstalled:](self, "_specifiersForProfiles:singularHeader:pluralHeaader:profilesInstalled:", v5, v8, v9, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

uint64_t __56__MCUISpecifierProvider_specifiersForInstalledProfiles___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isInstalledByDeclarativeManagement") ^ 1;
}

- (MCUISpecifierProviderDelegate)delegate
{
  return (MCUISpecifierProviderDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

@end
