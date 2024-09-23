@implementation AUDeveloperSettingsOverrideController

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)AUDeveloperSettingsOverrideController;
  -[AUDeveloperSettingsOverrideController viewDidLoad](&v5, sel_viewDidLoad);
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("CUSTOMER_STAGING_OVERRIDE"), &stru_24DFF2410, CFSTR("AUDeveloperSettings"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AUDeveloperSettingsOverrideController setTitle:](self, "setTitle:", v4);

}

- (id)specifiers
{
  AUDeveloperSettingsOverrideController *v2;
  uint64_t v3;
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;
  PSSpecifier *locationRadioGroup;
  uint64_t v9;
  PSSpecifier **p_customerSpecifier;
  PSSpecifier *customerSpecifier;
  uint64_t v12;
  PSSpecifier *publicSeedSpecifier;
  uint64_t v14;
  PSSpecifier *customerStagingSpecifier;
  uint64_t v16;
  PSSpecifier *descriptionSpecifier;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id WeakRetained;
  void *v30;
  void *v31;
  id v32;
  void *v34;

  v2 = self;
  objc_sync_enter(v2);
  v3 = (int)*MEMORY[0x24BE756E0];
  v4 = *(Class *)((char *)&v2->super.super.super.super.super.isa + v3);
  if (!v4)
  {
    -[AUDeveloperSettingsOverrideController loadSpecifiersFromPlistName:target:](v2, "loadSpecifiersFromPlistName:target:", CFSTR("AUDeveloperSettingsOverride"), v2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "specifierForID:", CFSTR("SELECT_LOCATION"));
    v7 = objc_claimAutoreleasedReturnValue();
    locationRadioGroup = v2->_locationRadioGroup;
    v2->_locationRadioGroup = (PSSpecifier *)v7;

    objc_msgSend(v6, "specifierForID:", CFSTR("CUSTOMER"));
    v9 = objc_claimAutoreleasedReturnValue();
    p_customerSpecifier = &v2->_customerSpecifier;
    customerSpecifier = v2->_customerSpecifier;
    v2->_customerSpecifier = (PSSpecifier *)v9;

    objc_msgSend(v6, "specifierForID:", CFSTR("PUBLIC_SEED"));
    v12 = objc_claimAutoreleasedReturnValue();
    publicSeedSpecifier = v2->_publicSeedSpecifier;
    v2->_publicSeedSpecifier = (PSSpecifier *)v12;

    objc_msgSend(v6, "specifierForID:", CFSTR("CUSTOMER_STAGING"));
    v14 = objc_claimAutoreleasedReturnValue();
    customerStagingSpecifier = v2->_customerStagingSpecifier;
    v2->_customerStagingSpecifier = (PSSpecifier *)v14;

    objc_msgSend(MEMORY[0x24BE75590], "emptyGroupSpecifier");
    v16 = objc_claimAutoreleasedReturnValue();
    descriptionSpecifier = v2->_descriptionSpecifier;
    v2->_descriptionSpecifier = (PSSpecifier *)v16;

    -[AUDeveloperSettingsOverrideController specifier](v2, "specifier");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "identifier");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    getInfoForAccessory(v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = (void *)objc_msgSend(v20, "mutableCopy");

    objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("fusing"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (AUDeveloperSettingsAccessoryFusingStringToType(v22) != 1)
    {
LABEL_13:
      objc_msgSend(v6, "addObject:", v2->_descriptionSpecifier);
      v30 = *(Class *)((char *)&v2->super.super.super.super.super.isa + v3);
      *(Class *)((char *)&v2->super.super.super.super.super.isa + v3) = (Class)v6;
      v31 = v21;
      v32 = v6;

      v5 = *(id *)((char *)&v2->super.super.super.super.super.isa + v3);
      goto LABEL_14;
    }
    v34 = v21;
    objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("assetLocation"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = AUDeveloperSettingsURLStringToType(v23);
    switch(v24)
    {
      case 2:
        -[PSSpecifier setProperty:forKey:](v2->_locationRadioGroup, "setProperty:forKey:", *p_customerSpecifier, *MEMORY[0x24BE75C20]);
        break;
      case 3:
        -[PSSpecifier setProperty:forKey:](v2->_locationRadioGroup, "setProperty:forKey:", v2->_publicSeedSpecifier, *MEMORY[0x24BE75C20]);
        p_customerSpecifier = &v2->_publicSeedSpecifier;
        break;
      case 6:
        -[PSSpecifier setProperty:forKey:](v2->_locationRadioGroup, "setProperty:forKey:", v2->_customerStagingSpecifier, *MEMORY[0x24BE75C20]);
        p_customerSpecifier = &v2->_customerStagingSpecifier;
        break;
      default:
        -[PSSpecifier setProperty:forKey:](v2->_locationRadioGroup, "setProperty:forKey:", *p_customerSpecifier, *MEMORY[0x24BE75C20]);
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", AUDeveloperSettingsURLTypeToString(2uLL));
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "setObject:forKeyedSubscript:", v25, CFSTR("assetLocation"));

        +[AUDeveloperSettingsDatabase sharedDatabase](AUDeveloperSettingsDatabase, "sharedDatabase");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        -[AUDeveloperSettingsOverrideController specifier](v2, "specifier");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "identifier");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "addAccessoryWithSerialNumber:info:", v28, v34);

        WeakRetained = objc_loadWeakRetained((id *)((char *)&v2->super.super.super.super.super.isa
                                                  + (int)*MEMORY[0x24BE75790]));
        objc_msgSend(WeakRetained, "reloadSpecifier:", *(Class *)((char *)&v2->super.super.super.super.super.isa + (int)*MEMORY[0x24BE757A8]));

        goto LABEL_12;
    }
    -[AUDeveloperSettingsOverrideController updateDescriptionForSpecifier:](v2, "updateDescriptionForSpecifier:", *p_customerSpecifier);
LABEL_12:

    v21 = v34;
    goto LABEL_13;
  }
  v5 = v4;
LABEL_14:
  objc_sync_exit(v2);

  return v5;
}

- (void)updateDescriptionForSpecifier:(id)a3
{
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v4 = *MEMORY[0x24BE75D50];
  v5 = a3;
  objc_msgSend(v5, "propertyForKey:", v4);
  v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "propertyForKey:", CFSTR("description"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "propertyForKey:", CFSTR("assetURL"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[AUDeveloperSettingsOverrideController specifier](self, "specifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  getInfoForAccessory(v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("assetURLOverride"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("assetURLOverride"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "stringByAppendingFormat:", CFSTR(" :\nProfile Asset URL Override\n\nThis resolves to a URL that looks like this :\n%@"), v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ :\n%@\n\nThis resolves to a URL that looks like this :\n%@"), v14, v6, v7);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  -[PSSpecifier setProperty:forKey:](self->_descriptionSpecifier, "setProperty:forKey:", v13, *MEMORY[0x24BE75A68]);
  -[AUDeveloperSettingsOverrideController reloadSpecifier:](self, "reloadSpecifier:", self->_descriptionSpecifier);

}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  unint64_t v16;
  void *v17;
  char v18;
  void *v19;
  int v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id WeakRetained;
  objc_super v26;

  v6 = a3;
  v7 = a4;
  v8 = -[AUDeveloperSettingsOverrideController indexForIndexPath:](self, "indexForIndexPath:", v7);
  if (v8 != 0x7FFFFFFFFFFFFFFFLL)
  {
    -[AUDeveloperSettingsOverrideController specifierAtIndex:](self, "specifierAtIndex:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v9)
    {
LABEL_11:

      goto LABEL_12;
    }
    -[AUDeveloperSettingsOverrideController updateDescriptionForSpecifier:](self, "updateDescriptionForSpecifier:", v9);
    -[AUDeveloperSettingsOverrideController specifier](self, "specifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "identifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    getInfoForAccessory(v11);
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend((id)v12, "mutableCopy");

    v14 = *MEMORY[0x24BE75AC0];
    objc_msgSend(v9, "propertyForKey:", *MEMORY[0x24BE75AC0]);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v12) = objc_msgSend(v15, "isEqual:", CFSTR("CUSTOMER"));

    if ((v12 & 1) != 0)
    {
      v16 = 2;
    }
    else
    {
      objc_msgSend(v9, "propertyForKey:", v14);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "isEqual:", CFSTR("PUBLIC_SEED"));

      if ((v18 & 1) != 0)
      {
        v16 = 3;
      }
      else
      {
        objc_msgSend(v9, "propertyForKey:", v14);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = objc_msgSend(v19, "isEqual:", CFSTR("CUSTOMER_STAGING"));

        if (!v20)
        {
LABEL_10:
          +[AUDeveloperSettingsDatabase sharedDatabase](AUDeveloperSettingsDatabase, "sharedDatabase");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          -[AUDeveloperSettingsOverrideController specifier](self, "specifier");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "identifier");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "addAccessoryWithSerialNumber:info:", v24, v13);

          WeakRetained = objc_loadWeakRetained((id *)((char *)&self->super.super.super.super.super.isa
                                                    + (int)*MEMORY[0x24BE75790]));
          objc_msgSend(WeakRetained, "reloadSpecifier:", *(Class *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x24BE757A8]));

          v26.receiver = self;
          v26.super_class = (Class)AUDeveloperSettingsOverrideController;
          -[AUDeveloperSettingsOverrideController tableView:didSelectRowAtIndexPath:](&v26, sel_tableView_didSelectRowAtIndexPath_, v6, v7);

          goto LABEL_11;
        }
        v16 = 6;
      }
    }
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", AUDeveloperSettingsURLTypeToString(v16));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setObject:forKeyedSubscript:", v21, CFSTR("assetLocation"));

    -[PSSpecifier setProperty:forKey:](self->_locationRadioGroup, "setProperty:forKey:", v9, *MEMORY[0x24BE75C20]);
    -[AUDeveloperSettingsOverrideController reloadSpecifier:animated:](self, "reloadSpecifier:animated:", self->_locationRadioGroup, 1);
    goto LABEL_10;
  }
LABEL_12:

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_descriptionSpecifier, 0);
  objc_storeStrong((id *)&self->_customerStagingSpecifier, 0);
  objc_storeStrong((id *)&self->_publicSeedSpecifier, 0);
  objc_storeStrong((id *)&self->_customerSpecifier, 0);
  objc_storeStrong((id *)&self->_locationRadioGroup, 0);
}

@end
