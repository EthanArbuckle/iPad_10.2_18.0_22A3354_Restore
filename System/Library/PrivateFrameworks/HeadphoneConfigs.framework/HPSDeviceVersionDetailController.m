@implementation HPSDeviceVersionDetailController

- (id)getBudVersion
{
  void *v2;
  void *v3;

  objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x1E0D80628]), "userInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("device-bud-version"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)getCaseVersion
{
  void *v2;
  void *v3;

  objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x1E0D80628]), "userInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("device-case-version"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)specifiers
{
  uint64_t v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_class *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  NSRange v28;

  v3 = (int)*MEMORY[0x1E0D80590];
  v4 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
  if (!v4)
  {
    v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    objc_msgSend(MEMORY[0x1E0D804E8], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", &stru_1EA29D890, self, 0, 0, 0, 0, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("ACCESSORY_VERSION_DETAIL_FOOTER"), &stru_1EA29D890, CFSTR("DeviceConfig"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringWithFormat:", v9, CFSTR("support.apple.com"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = (objc_class *)objc_opt_class();
    NSStringFromClass(v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setProperty:forKey:", v12, *MEMORY[0x1E0D80818]);

    objc_msgSend(v6, "setProperty:forKey:", v10, *MEMORY[0x1E0D80838]);
    v28.location = objc_msgSend(v10, "rangeOfString:", CFSTR("support.apple.com"));
    NSStringFromRange(v28);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setProperty:forKey:", v13, *MEMORY[0x1E0D80828]);

    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithNonretainedObject:", self);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setProperty:forKey:", v14, *MEMORY[0x1E0D80830]);

    objc_msgSend(v6, "setProperty:forKey:", CFSTR("userDidTapLink:"), *MEMORY[0x1E0D80820]);
    objc_msgSend(v5, "addObject:", v6);
    -[HPSDeviceVersionDetailController getBudVersion](self, "getBudVersion");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v16 = (_QWORD *)MEMORY[0x1E0D807E8];
    if (v15)
    {
      v17 = (void *)MEMORY[0x1E0D804E8];
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "localizedStringForKey:value:table:", CFSTR("ACCESSORY_ABOUT_BUD_VERSION_FIRMWARE"), &stru_1EA29D890, CFSTR("DeviceConfig"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v19, self, 0, sel_getBudVersion, 0, 4, 0);
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v20, "setProperty:forKey:", MEMORY[0x1E0C9AAB0], *v16);
      objc_msgSend(v5, "addObject:", v20);

    }
    -[HPSDeviceVersionDetailController getCaseVersion](self, "getCaseVersion");
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    if (v21)
    {
      v22 = (void *)MEMORY[0x1E0D804E8];
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "localizedStringForKey:value:table:", CFSTR("ACCESSORY_ABOUT_CASE_VERSION_FIRMWARE"), &stru_1EA29D890, CFSTR("DeviceConfig"));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v24, self, 0, sel_getCaseVersion, 0, 4, 0);
      v25 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v25, "setProperty:forKey:", MEMORY[0x1E0C9AAB0], *v16);
      objc_msgSend(v5, "addObject:", v25);

    }
    v26 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
    *(Class *)((char *)&self->super.super.super.super.super.isa + v3) = (Class)v5;

    v4 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
  }
  return v4;
}

- (void)userDidTapLink:(id)a3
{
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", CFSTR("https://support.apple.com/ht213317?cid=mc-ols-airpods-article_ht213317-ios_ui-06152022"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "openSensitiveURL:withOptions:", v3, 0);

}

@end
