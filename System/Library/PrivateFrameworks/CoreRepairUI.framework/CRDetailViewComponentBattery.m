@implementation CRDetailViewComponentBattery

- (id)specifiers
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (int)*MEMORY[0x24BE756E0];
  v4 = *(Class *)((char *)&self->super.super.super.super.super.super.isa + v3);
  if (!v4)
  {
    v5 = (void *)objc_opt_new();
    -[CRUDetailViewComponent componentSpecifierForComponent:](self, "componentSpecifierForComponent:", CFSTR("Battery"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObjectsFromArray:", v6);

    v7 = *(Class *)((char *)&self->super.super.super.super.super.super.isa + v3);
    *(Class *)((char *)&self->super.super.super.super.super.super.isa + v3) = (Class)v5;

    v4 = *(Class *)((char *)&self->super.super.super.super.super.super.isa + v3);
  }
  return v4;
}

- (CRDetailViewComponentBattery)init
{
  CRDetailViewComponentBattery *v2;
  CRDetailViewComponentBattery *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)CRDetailViewComponentBattery;
  v2 = -[CRUDetailViewComponent init](&v16, sel_init);
  v3 = v2;
  if (v2)
  {
    v4 = (void *)MEMORY[0x24BDBCF48];
    -[CRUDetailViewComponent locale](v2, "locale");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "localizedStringWithKey:defaultString:", CFSTR("NONGENUINE_BATTERY_URL"), CFSTR("NONGENUINE_BATTERY_URL"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "URLWithString:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[CRUDetailViewComponent setKbArticleURL:](v3, "setKbArticleURL:", v7);

    -[CRUDetailViewComponent locale](v3, "locale");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "localizedStringWithKey:defaultString:", CFSTR("UNKNOWN_PART"), CFSTR("UNKNOWN_PART"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[CRUDetailViewComponent setTitleText:](v3, "setTitleText:", v9);

    -[CRUDetailViewComponent locale](v3, "locale");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "localizedStringWithKey:defaultString:", CFSTR("NONGENUINE_BATTERY_DESC"), CFSTR("NONGENUINE_BATTERY_DESC"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[CRUDetailViewComponent setInformativeText:](v3, "setInformativeText:", v11);

    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF50]), "initWithSuiteName:", CFSTR("com.apple.mobilerepaird.systemhealth"));
    v13 = objc_msgSend(v12, "integerForKey:", CFSTR("com.apple.mobilerepair.BatteryRepair"));

    if (v13 <= 1)
    {
      v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF50]), "initWithSuiteName:", CFSTR("com.apple.mobilerepaird.systemhealth"));
      objc_msgSend(v14, "setInteger:forKey:", v13 + 1, CFSTR("com.apple.mobilerepair.BatteryRepair"));

      notify_post("com.apple.mobilerepair.refreshui");
    }
  }
  return v3;
}

@end
