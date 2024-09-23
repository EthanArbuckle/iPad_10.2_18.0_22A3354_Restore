@implementation _SFPerSitePreferenceDisplayInformation

+ (id)displayInformationForPerSitePreference:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  objc_msgSend(a1, "_buildMapIfNeeded");
  v5 = (void *)preferenceToDisplayInformation;
  objc_msgSend(v4, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (void)_buildMapIfNeeded
{
  uint64_t v2;
  void *v3;
  _SFPerSitePreferenceDisplayInformation *v4;
  void *v5;
  void *v6;
  id v7;
  _SFPerSitePreferenceDisplayInformation *v8;
  void *v9;
  void *v10;
  id v11;
  _SFPerSitePreferenceDisplayInformation *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  _SFPerSitePreferenceDisplayInformation *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  _SFPerSitePreferenceDisplayInformation *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  _SFPerSitePreferenceDisplayInformation *v27;
  void *v28;
  void *v29;
  id v30;
  _SFPerSitePreferenceDisplayInformation *v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  _SFPerSitePreferenceDisplayInformation *v36;
  void *v37;
  void *v38;
  id v39;
  _SFPerSitePreferenceDisplayInformation *v40;
  void *v41;
  id v42;
  id v43;

  if (!preferenceToDisplayInformation)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v2 = objc_claimAutoreleasedReturnValue();
    v3 = (void *)preferenceToDisplayInformation;
    preferenceToDisplayInformation = v2;

    v4 = [_SFPerSitePreferenceDisplayInformation alloc];
    _WBSLocalizedString();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    _WBSLocalizedString();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[_SFPerSitePreferenceDisplayInformation _initWithLocalizedSiteSpecificSettingsTitle:localizedAllWebsiteSettingsTitle:localizedClearAllSettingsPrompt:displayOption:](v4, "_initWithLocalizedSiteSpecificSettingsTitle:localizedAllWebsiteSettingsTitle:localizedClearAllSettingsPrompt:displayOption:", v5, 0, v6, 0);
    objc_msgSend((id)preferenceToDisplayInformation, "setObject:forKeyedSubscript:", v7, *MEMORY[0x1E0D8B320]);

    v8 = [_SFPerSitePreferenceDisplayInformation alloc];
    _WBSLocalizedString();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    _WBSLocalizedString();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[_SFPerSitePreferenceDisplayInformation _initWithLocalizedSiteSpecificSettingsTitle:localizedAllWebsiteSettingsTitle:localizedClearAllSettingsPrompt:displayOption:](v8, "_initWithLocalizedSiteSpecificSettingsTitle:localizedAllWebsiteSettingsTitle:localizedClearAllSettingsPrompt:displayOption:", v9, 0, v10, 0);
    objc_msgSend((id)preferenceToDisplayInformation, "setObject:forKeyedSubscript:", v11, *MEMORY[0x1E0D8AF68]);

    v12 = [_SFPerSitePreferenceDisplayInformation alloc];
    _WBSLocalizedString();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    _WBSLocalizedString();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    _WBSLocalizedString();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = -[_SFPerSitePreferenceDisplayInformation _initWithLocalizedSiteSpecificSettingsTitle:localizedAllWebsiteSettingsTitle:localizedClearAllSettingsPrompt:displayOption:](v12, "_initWithLocalizedSiteSpecificSettingsTitle:localizedAllWebsiteSettingsTitle:localizedClearAllSettingsPrompt:displayOption:", v13, v14, v15, 1);
    objc_msgSend((id)preferenceToDisplayInformation, "setObject:forKeyedSubscript:", v16, *MEMORY[0x1E0D8AED8]);

    v17 = [_SFPerSitePreferenceDisplayInformation alloc];
    _WBSLocalizedString();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    _WBSLocalizedString();
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    _WBSLocalizedString();
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = -[_SFPerSitePreferenceDisplayInformation _initWithLocalizedSiteSpecificSettingsTitle:localizedAllWebsiteSettingsTitle:localizedClearAllSettingsPrompt:displayOption:](v17, "_initWithLocalizedSiteSpecificSettingsTitle:localizedAllWebsiteSettingsTitle:localizedClearAllSettingsPrompt:displayOption:", v18, v19, v20, 1);
    objc_msgSend((id)preferenceToDisplayInformation, "setObject:forKeyedSubscript:", v21, *MEMORY[0x1E0D8B168]);

    v22 = [_SFPerSitePreferenceDisplayInformation alloc];
    _WBSLocalizedString();
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    _WBSLocalizedString();
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    _WBSLocalizedString();
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = -[_SFPerSitePreferenceDisplayInformation _initWithLocalizedSiteSpecificSettingsTitle:localizedAllWebsiteSettingsTitle:localizedClearAllSettingsPrompt:displayOption:](v22, "_initWithLocalizedSiteSpecificSettingsTitle:localizedAllWebsiteSettingsTitle:localizedClearAllSettingsPrompt:displayOption:", v23, v24, v25, 1);
    objc_msgSend((id)preferenceToDisplayInformation, "setObject:forKeyedSubscript:", v26, *MEMORY[0x1E0D8B0B8]);

    v27 = [_SFPerSitePreferenceDisplayInformation alloc];
    _WBSLocalizedString();
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    _WBSLocalizedString();
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = -[_SFPerSitePreferenceDisplayInformation _initWithLocalizedSiteSpecificSettingsTitle:localizedAllWebsiteSettingsTitle:localizedClearAllSettingsPrompt:displayOption:](v27, "_initWithLocalizedSiteSpecificSettingsTitle:localizedAllWebsiteSettingsTitle:localizedClearAllSettingsPrompt:displayOption:", v28, 0, v29, 0);
    objc_msgSend((id)preferenceToDisplayInformation, "setObject:forKeyedSubscript:", v30, *MEMORY[0x1E0D8B380]);

    v31 = [_SFPerSitePreferenceDisplayInformation alloc];
    _WBSLocalizedString();
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    _WBSLocalizedString();
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    _WBSLocalizedString();
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = -[_SFPerSitePreferenceDisplayInformation _initWithLocalizedSiteSpecificSettingsTitle:localizedAllWebsiteSettingsTitle:localizedClearAllSettingsPrompt:displayOption:](v31, "_initWithLocalizedSiteSpecificSettingsTitle:localizedAllWebsiteSettingsTitle:localizedClearAllSettingsPrompt:displayOption:", v32, v33, v34, 1);
    objc_msgSend((id)preferenceToDisplayInformation, "setObject:forKeyedSubscript:", v35, *MEMORY[0x1E0D8B790]);

    v36 = [_SFPerSitePreferenceDisplayInformation alloc];
    _WBSLocalizedString();
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    _WBSLocalizedString();
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = -[_SFPerSitePreferenceDisplayInformation _initWithLocalizedSiteSpecificSettingsTitle:localizedAllWebsiteSettingsTitle:localizedClearAllSettingsPrompt:displayOption:](v36, "_initWithLocalizedSiteSpecificSettingsTitle:localizedAllWebsiteSettingsTitle:localizedClearAllSettingsPrompt:displayOption:", v37, 0, v38, 0);
    objc_msgSend((id)preferenceToDisplayInformation, "setObject:forKeyedSubscript:", v39, *MEMORY[0x1E0D8B150]);

    v40 = [_SFPerSitePreferenceDisplayInformation alloc];
    _WBSLocalizedString();
    v43 = (id)objc_claimAutoreleasedReturnValue();
    _WBSLocalizedString();
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = -[_SFPerSitePreferenceDisplayInformation _initWithLocalizedSiteSpecificSettingsTitle:localizedAllWebsiteSettingsTitle:localizedClearAllSettingsPrompt:displayOption:](v40, "_initWithLocalizedSiteSpecificSettingsTitle:localizedAllWebsiteSettingsTitle:localizedClearAllSettingsPrompt:displayOption:", v43, 0, v41, 1);
    objc_msgSend((id)preferenceToDisplayInformation, "setObject:forKeyedSubscript:", v42, *MEMORY[0x1E0D8B2E0]);

  }
}

- (id)_initWithLocalizedSiteSpecificSettingsTitle:(id)a3 localizedAllWebsiteSettingsTitle:(id)a4 localizedClearAllSettingsPrompt:(id)a5 displayOption:(unint64_t)a6
{
  id v10;
  id v11;
  id v12;
  _SFPerSitePreferenceDisplayInformation *v13;
  uint64_t v14;
  NSString *localizedSiteSpecificSettingsTitle;
  uint64_t v16;
  NSString *localizedAllWebsiteSettingsTitle;
  uint64_t v18;
  NSString *localizedClearAllSettingsPrompt;
  _SFPerSitePreferenceDisplayInformation *v20;
  objc_super v22;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v22.receiver = self;
  v22.super_class = (Class)_SFPerSitePreferenceDisplayInformation;
  v13 = -[_SFPerSitePreferenceDisplayInformation init](&v22, sel_init);
  if (v13)
  {
    v14 = objc_msgSend(v10, "copy");
    localizedSiteSpecificSettingsTitle = v13->_localizedSiteSpecificSettingsTitle;
    v13->_localizedSiteSpecificSettingsTitle = (NSString *)v14;

    v16 = objc_msgSend(v11, "copy");
    localizedAllWebsiteSettingsTitle = v13->_localizedAllWebsiteSettingsTitle;
    v13->_localizedAllWebsiteSettingsTitle = (NSString *)v16;

    v18 = objc_msgSend(v12, "copy");
    localizedClearAllSettingsPrompt = v13->_localizedClearAllSettingsPrompt;
    v13->_localizedClearAllSettingsPrompt = (NSString *)v18;

    v13->_displayOption = a6;
    v20 = v13;
  }

  return v13;
}

- (NSString)localizedSiteSpecificSettingsTitle
{
  return self->_localizedSiteSpecificSettingsTitle;
}

- (NSString)localizedAllWebsiteSettingsTitle
{
  return self->_localizedAllWebsiteSettingsTitle;
}

- (NSString)localizedClearAllSettingsPrompt
{
  return self->_localizedClearAllSettingsPrompt;
}

- (unint64_t)displayOption
{
  return self->_displayOption;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localizedClearAllSettingsPrompt, 0);
  objc_storeStrong((id *)&self->_localizedAllWebsiteSettingsTitle, 0);
  objc_storeStrong((id *)&self->_localizedSiteSpecificSettingsTitle, 0);
}

@end
