@implementation _SFPerSitePreferencePopoverDisplayInformation

+ (id)popoverDisplayInformationForPerSitePreference:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  objc_msgSend(a1, "_buildMapIfNeeded");
  v5 = (void *)preferenceToDisplayInformation_0;
  objc_msgSend(v4, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (void)_buildMapIfNeeded
{
  id v3;
  id v4;
  id v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  _QWORD v29[8];
  _QWORD v30[10];

  v30[8] = *MEMORY[0x1E0C80C00];
  if (!preferenceToDisplayInformation_0)
  {
    v29[0] = *MEMORY[0x1E0D8B320];
    v3 = objc_alloc((Class)a1);
    _WBSLocalizedString();
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = (void *)objc_msgSend(v3, "_initWithDisplayOption:localizedDisplayName:", 0, v28);
    v30[0] = v27;
    v29[1] = *MEMORY[0x1E0D8AF68];
    v4 = objc_alloc((Class)a1);
    _WBSLocalizedString();
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = (void *)objc_msgSend(v4, "_initWithDisplayOption:localizedDisplayName:", 0, v26);
    v30[1] = v25;
    v29[2] = *MEMORY[0x1E0D8AED8];
    v5 = objc_alloc((Class)a1);
    _WBSLocalizedString();
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = (void *)objc_msgSend(v5, "_initWithDisplayOption:localizedDisplayName:", 1, v24);
    v30[2] = v23;
    v29[3] = *MEMORY[0x1E0D8B168];
    v6 = objc_alloc((Class)a1);
    _WBSLocalizedString();
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v6, "_initWithDisplayOption:localizedDisplayName:", 1, v22);
    v30[3] = v7;
    v29[4] = *MEMORY[0x1E0D8B0B8];
    v8 = objc_alloc((Class)a1);
    _WBSLocalizedString();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v8, "_initWithDisplayOption:localizedDisplayName:", 1, v9);
    v30[4] = v10;
    v29[5] = *MEMORY[0x1E0D8B380];
    v11 = objc_alloc((Class)a1);
    _WBSLocalizedString();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(v11, "_initWithDisplayOption:localizedDisplayName:", 0, v12);
    v30[5] = v13;
    v29[6] = *MEMORY[0x1E0D8B150];
    v14 = objc_alloc((Class)a1);
    _WBSLocalizedString();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)objc_msgSend(v14, "_initWithDisplayOption:localizedDisplayName:", 0, v15);
    v30[6] = v16;
    v29[7] = *MEMORY[0x1E0D8B2E0];
    v17 = objc_alloc((Class)a1);
    _WBSLocalizedString();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (void *)objc_msgSend(v17, "_initWithDisplayOption:localizedDisplayName:", 1, v18);
    v30[7] = v19;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v30, v29, 8);
    v20 = objc_claimAutoreleasedReturnValue();
    v21 = (void *)preferenceToDisplayInformation_0;
    preferenceToDisplayInformation_0 = v20;

  }
}

- (id)_initWithDisplayOption:(unint64_t)a3 localizedDisplayName:(id)a4
{
  id v6;
  _SFPerSitePreferencePopoverDisplayInformation *v7;
  _SFPerSitePreferencePopoverDisplayInformation *v8;
  uint64_t v9;
  NSString *localizedDisplayName;
  _SFPerSitePreferencePopoverDisplayInformation *v11;
  objc_super v13;

  v6 = a4;
  v13.receiver = self;
  v13.super_class = (Class)_SFPerSitePreferencePopoverDisplayInformation;
  v7 = -[_SFPerSitePreferencePopoverDisplayInformation init](&v13, sel_init);
  v8 = v7;
  if (v7)
  {
    v7->_displayOption = a3;
    v9 = objc_msgSend(v6, "copy");
    localizedDisplayName = v8->_localizedDisplayName;
    v8->_localizedDisplayName = (NSString *)v9;

    v11 = v8;
  }

  return v8;
}

- (unint64_t)displayOption
{
  return self->_displayOption;
}

- (NSString)localizedDisplayName
{
  return self->_localizedDisplayName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localizedDisplayName, 0);
}

@end
