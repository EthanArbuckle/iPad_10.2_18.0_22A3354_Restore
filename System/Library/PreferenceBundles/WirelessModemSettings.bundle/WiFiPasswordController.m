@implementation WiFiPasswordController

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)WiFiPasswordController;
  -[WiFiPasswordController viewDidLoad](&v8, sel_viewDidLoad);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD410]), "initWithBarButtonSystemItem:target:action:", 0, self, sel_doneButtonClicked_);
  -[WiFiPasswordController navigationItem](self, "navigationItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setRightBarButtonItem:", v3);

  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD410]), "initWithBarButtonSystemItem:target:action:", 1, self, sel_cancelButtonClicked_);
  -[WiFiPasswordController navigationItem](self, "navigationItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setLeftBarButtonItem:", v5);

  WMSUIEventDictionary(CFSTR("view-ph-password"), 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  WMSubmitUIEventMetric(v7);

}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  objc_super v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x24BDAC8D0];
  v19.receiver = self;
  v19.super_class = (Class)WiFiPasswordController;
  -[WiFiPasswordController viewDidAppear:](&v19, sel_viewDidAppear_, a3);
  v4 = *(Class *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x24BE75700]);
  -[WiFiPasswordController indexPathForIndex:](self, "indexPathForIndex:", 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cellForRowAtIndexPath:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "becomeFirstResponder");

  if (_os_feature_enabled_impl())
  {
    objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", CFSTR("settings-navigation://com.apple.Settings.PersonalHotspot"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_alloc(MEMORY[0x24BDD19B8]);
    objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "bundleURL");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(v8, "initWithKey:table:locale:bundleURL:", CFSTR("Wi-Fi Password"), 0, v9, v11);

    v13 = objc_alloc(MEMORY[0x24BDD19B8]);
    objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "bundleURL");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)objc_msgSend(v13, "initWithKey:table:locale:bundleURL:", CFSTR("Personal Hotspot"), 0, v14, v16);

    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v20[0] = v17;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v20, 1);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[WiFiPasswordController pe_emitNavigationEventForSystemSettingsWithGraphicIconIdentifier:title:localizedNavigationComponents:deepLink:](self, "pe_emitNavigationEventForSystemSettingsWithGraphicIconIdentifier:title:localizedNavigationComponents:deepLink:", CFSTR("com.apple.graphic-icon.personal-hotspot"), v12, v18, v7);

    }
  }
}

+ (id)generateDefaultPassword
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  NSObject *v8;
  _QWORD v10[3];

  v10[2] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD14A8], "characterSetWithCharactersInString:", CFSTR("abcdefghijkmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVXYZ1234567890"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v2;
  objc_msgSend(MEMORY[0x24BDD14A8], "characterSetWithCharactersInString:", CFSTR("1234567890"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = v3;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v10, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", &unk_24FDBEF68, *MEMORY[0x24BDE9400]);
  objc_msgSend(v5, "setObject:forKey:", &unk_24FDBEF68, *MEMORY[0x24BDE93F8]);
  objc_msgSend(v5, "setObject:forKey:", CFSTR("abcdefghijkmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVXYZ1234567890"), *MEMORY[0x24BDE93E8]);
  objc_msgSend(v5, "setObject:forKey:", v4, *MEMORY[0x24BDE9410]);
  objc_msgSend(v5, "setObject:forKey:", &unk_24FDBEF80, *MEMORY[0x24BDE93F0]);
  objc_msgSend(v5, "setObject:forKey:", &unk_24FDBEF80, *MEMORY[0x24BDE9408]);
  objc_msgSend(v5, "setObject:forKey:", CFSTR("-"), *MEMORY[0x24BDE9418]);
  v6 = v5;
  v7 = (void *)SecPasswordGenerate();
  if (!v7)
  {
    WMSLogComponent();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      +[WiFiPasswordController generateDefaultPassword].cold.1((uint64_t)CFSTR("unknown error"), v8);

  }
  return v7;
}

- (void)cancelButtonClicked:(id)a3
{
  id v3;
  id v4;

  -[WiFiPasswordController navigationController](self, "navigationController", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v3 = (id)objc_msgSend(v4, "popViewControllerAnimated:", 1);

}

- (void)doneButtonClicked:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  unint64_t v9;
  id *v10;
  id WeakRetained;
  char isKindOfClass;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;

  v4 = *(Class *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x24BE75700]);
  -[WiFiPasswordController indexPathForIndex:](self, "indexPathForIndex:", 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cellForRowAtIndexPath:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "editableTextField");
  v17 = (id)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    objc_msgSend(v17, "text");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if ((unint64_t)objc_msgSend(v7, "length") < 8)
    {
LABEL_6:

      goto LABEL_7;
    }
    objc_msgSend(v17, "text");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "length");

    if (v9 <= 0x3F)
    {
      v10 = (id *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x24BE75790]);
      WeakRetained = objc_loadWeakRetained(v10);
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) != 0)
      {
        v7 = objc_loadWeakRetained(v10);
        objc_msgSend(v17, "text");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "_setWiFiPassword:", v13);

        objc_msgSend(v7, "reloadSpecifier:", *(Class *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x24BE757A8]));
        WMSUIEventDictionary(CFSTR("edit-ph-password"), 0);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        WMSubmitUIEventMetric(v14);

        goto LABEL_6;
      }
    }
  }
LABEL_7:
  -[WiFiPasswordController navigationController](self, "navigationController");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (id)objc_msgSend(v15, "popViewControllerAnimated:", 1);

}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)WiFiPasswordController;
  -[WiFiPasswordController tableView:cellForRowAtIndexPath:](&v9, sel_tableView_cellForRowAtIndexPath_, a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "tag") == 8)
  {
    objc_msgSend(v5, "editableTextField");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
    {
      objc_msgSend(v6, "setTextContentType:", *MEMORY[0x24BEBE810]);
      objc_msgSend(v7, "setReturnKeyType:", 9);
      objc_msgSend(v7, "setKeyboardType:", 1);
      objc_msgSend(v7, "setDisplaySecureTextUsingPlainText:", 1);
      objc_msgSend(v7, "setAutocapitalizationType:", 0);
      objc_msgSend(v7, "setAutocorrectionType:", 1);
      objc_msgSend(v7, "setClearButtonMode:", 3);
      objc_msgSend(v7, "addTarget:action:forControlEvents:", self, sel_textDidChange_, 0x20000);
      objc_msgSend(v7, "setDelegate:", self);
    }

  }
  return v5;
}

- (void)textDidChange:(id)a3
{
  void *v4;
  void *v5;
  _BOOL8 v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  objc_msgSend(v10, "text");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v4, "length") < 8)
  {
    v6 = 0;
  }
  else
  {
    objc_msgSend(v10, "text");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (unint64_t)objc_msgSend(v5, "length") < 0x40;

  }
  -[WiFiPasswordController navigationItem](self, "navigationItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "rightBarButtonItem");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setEnabled:", v6);

  objc_msgSend(MEMORY[0x24BEBD6C8], "activeKeyboard");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setReturnKeyEnabled:", v6);

}

- (BOOL)textField:(id)a3 shouldChangeCharactersInRange:(_NSRange)a4 replacementString:(id)a5
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  unint64_t v10;
  unsigned int v11;
  BOOL v12;

  v5 = a5;
  if (objc_msgSend(v5, "length"))
  {
    objc_msgSend(v5, "dataUsingEncoding:", 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
    {
      v8 = objc_retainAutorelease(v6);
      v9 = objc_msgSend(v8, "bytes");
      if (objc_msgSend(v8, "length"))
      {
        v10 = 0;
        do
        {
          v11 = *(unsigned __int8 *)(v9 + v10) - 32;
          v12 = v11 < 0x5F;
          if (v11 >= 0x5F)
            break;
          ++v10;
        }
        while (v10 < objc_msgSend(v8, "length"));
      }
      else
      {
        v12 = 1;
      }
    }
    else
    {
      v12 = 0;
    }

  }
  else
  {
    v12 = 1;
  }

  return v12;
}

- (id)wifiPassword:(id)a3
{
  id *v3;
  id WeakRetained;
  char isKindOfClass;
  id v6;
  void *v7;

  v3 = (id *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x24BE75790]);
  WeakRetained = objc_loadWeakRetained(v3);
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    v6 = objc_loadWeakRetained(v3);
    objc_msgSend(v6, "_wiFiPassword");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }
  return v7;
}

- (id)specifiers
{
  uint64_t v3;
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
  const __CFString *v14;
  void *v15;
  void *v16;
  objc_class *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  int v26;
  const __CFString *v27;
  void *v28;

  v3 = (int)*MEMORY[0x24BE756E0];
  v4 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
  if (!v4)
  {
    v26 = MGGetBoolAnswer();
    v5 = (void *)MEMORY[0x24BE75590];
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("PASSWORD"), &stru_24FDBBCF8, CFSTR("WirelessModemSettings"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v7, self, sel_emptySetter_specifier_, sel_wifiPassword_, 0, 8, 0);
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BE75590], "emptyGroupSpecifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("WIFI_PASSWORD_FOOTER"), &stru_24FDBBCF8, CFSTR("WirelessModemSettings"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v26)
      v14 = CFSTR("WIFI_CH");
    else
      v14 = CFSTR("WIFI");
    v27 = v14;
    objc_msgSend(v12, "localizedStringForKey:value:table:");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stringWithFormat:", v11, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setProperty:forKey:", v16, *MEMORY[0x24BE75A68]);

    v17 = (objc_class *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE30]), "initWithObjects:", v8, v28, 0);
    v18 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
    *(Class *)((char *)&self->super.super.super.super.super.isa + v3) = v17;

    v19 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "localizedStringForKey:value:table:", CFSTR("WIFI_PASSWORD_TITLE"), &stru_24FDBBCF8, CFSTR("WirelessModemSettings"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "localizedStringForKey:value:table:", v27, &stru_24FDBBCF8, CFSTR("WirelessModemSettings"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "stringWithFormat:", v21, v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[WiFiPasswordController setTitle:](self, "setTitle:", v24);

    v4 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
  }
  return v4;
}

+ (void)generateDefaultPassword
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_22FE37000, a2, OS_LOG_TYPE_ERROR, "Failed to generate default personal hotspot password! (%@)", (uint8_t *)&v2, 0xCu);
}

@end
