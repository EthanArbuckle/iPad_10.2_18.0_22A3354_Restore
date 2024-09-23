@implementation CKCloudSettingsCell

- (void)refreshCellContentsWithSpecifier:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CKCloudSettingsCell;
  -[PSTableCell refreshCellContentsWithSpecifier:](&v4, sel_refreshCellContentsWithSpecifier_, a3);
  -[CKCloudSettingsCell setNeedsUpdateConfiguration](self, "setNeedsUpdateConfiguration");
}

- (void)updateConfigurationUsingState:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  int v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;

  v4 = a3;
  -[PSTableCell specifier](self, "specifier");
  v22 = (id)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "copy");

  v6 = *MEMORY[0x24BE75A18];
  objc_msgSend(v22, "objectForKeyedSubscript:", *MEMORY[0x24BE75A18]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(v22, "objectForKeyedSubscript:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "BOOLValue");

    v10 = v9 ^ 1u;
  }
  else
  {
    v10 = 0;
  }
  objc_msgSend(v5, "setDisabled:", v10);
  objc_msgSend(MEMORY[0x24BDF6B80], "cellConfiguration");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "updatedConfigurationForState:", v5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "setPrefersSideBySideTextAndSecondaryText:", 1);
  objc_msgSend(v22, "name");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setText:", v13);

  -[PSTableCell value](self, "value");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setSecondaryText:", v14);

  objc_msgSend(MEMORY[0x24BE75530], "appearance");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "altTextColor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "textProperties");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "font");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "secondaryTextProperties");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setFont:", v18);

  objc_msgSend(v12, "secondaryTextProperties");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setColor:", v16);

  objc_msgSend(v12, "directionalLayoutMargins");
  objc_msgSend(v12, "setDirectionalLayoutMargins:");
  objc_msgSend(v22, "identifier");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKCloudSettingsCell setAccessibilityIdentifier:](self, "setAccessibilityIdentifier:", v21);

  -[CKCloudSettingsCell setContentConfiguration:](self, "setContentConfiguration:", v12);
}

@end
