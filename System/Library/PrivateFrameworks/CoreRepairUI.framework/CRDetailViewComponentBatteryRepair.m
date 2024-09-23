@implementation CRDetailViewComponentBatteryRepair

- (id)specifiers
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _BOOL8 v8;
  void *v9;
  void *v10;
  void *v11;

  v3 = (int)*MEMORY[0x24BE756E0];
  v4 = *(Class *)((char *)&self->super.super.super.super.super.super.isa + v3);
  if (!v4)
  {
    v5 = (void *)objc_opt_new();
    -[CRUDetailViewComponent locale](self, "locale");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "localizedStringWithKey:defaultString:", CFSTR("Battery"), CFSTR("Battery"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[CRUDetailViewComponent isUsed](self, "isUsed");
    -[CRUDetailViewComponent repairDate](self, "repairDate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[CRUDetailViewComponent componentRepairSpecifierForComponent:IsUsed:repairDate:](self, "componentRepairSpecifierForComponent:IsUsed:repairDate:", v7, v8, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObjectsFromArray:", v10);

    v11 = *(Class *)((char *)&self->super.super.super.super.super.super.isa + v3);
    *(Class *)((char *)&self->super.super.super.super.super.super.isa + v3) = (Class)v5;

    v4 = *(Class *)((char *)&self->super.super.super.super.super.super.isa + v3);
  }
  return v4;
}

- (CRDetailViewComponentBatteryRepair)init
{
  CRDetailViewComponentBatteryRepair *v2;
  CRDetailViewComponentBatteryRepair *v3;
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
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  objc_super v23;

  v23.receiver = self;
  v23.super_class = (Class)CRDetailViewComponentBatteryRepair;
  v2 = -[CRUDetailViewComponent init](&v23, sel_init);
  v3 = v2;
  if (v2)
  {
    -[CRUDetailViewComponent deviceHistory](v2, "deviceHistory");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[CRUDetailViewComponent rchlRepairHistory](v3, "rchlRepairHistory");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[CRUDetailViewComponent claimCount](v3, "claimCount");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[CRUDetailViewComponent setIsUsed:](v3, "setIsUsed:", objc_msgSend(v4, "checkUsedStatusFor:withHistory:withClaimCount:", CFSTR("Battery"), v5, v6));

    if (_os_feature_enabled_impl())
      -[CRUDetailViewComponent setIsUsed:](v3, "setIsUsed:", 1);
    v7 = (void *)MEMORY[0x24BDBCF48];
    -[CRUDetailViewComponent locale](v3, "locale");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "localizedStringWithKey:defaultString:", CFSTR("BATTERY_REPAIR_KB_URL"), CFSTR("BATTERY_REPAIR_KB_URL"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "URLWithString:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[CRUDetailViewComponent setKbArticleURL:](v3, "setKbArticleURL:", v10);

    -[CRUDetailViewComponent locale](v3, "locale");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "localizedStringWithKey:defaultString:", CFSTR("GENUINE_APPLE_PART"), CFSTR("GENUINE_APPLE_PART"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[CRUDetailViewComponent setTitleText:](v3, "setTitleText:", v12);

    v13 = (void *)objc_opt_new();
    -[CRUDetailViewComponent locale](v3, "locale");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "localizedStringWithKey:defaultString:", CFSTR("GENUINE_BATTERY_DESC"), CFSTR("GENUINE_BATTERY_DESC"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "appendString:", v15);

    -[CRUDetailViewComponent deviceHistory](v3, "deviceHistory");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[CRUDetailViewComponent rchlRepairHistory](v3, "rchlRepairHistory");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[CRUDetailViewComponent caaRepairHistoryDict](v3, "caaRepairHistoryDict");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "repairDateForComponent:withRCHLHistory:withCAAHistory:", CFSTR("Battery"), v17, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[CRUDetailViewComponent setRepairDate:](v3, "setRepairDate:", v19);

    -[CRUDetailViewComponent setInformativeText:](v3, "setInformativeText:", v13);
    -[CRUDetailViewComponent locale](v3, "locale");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "localizedStringWithKey:defaultString:", CFSTR("BATTERY_FOOTER_LEARN_MORE"), CFSTR("BATTERY_FOOTER_LEARN_MORE"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[CRUDetailViewComponent setFooterText:](v3, "setFooterText:", v21);

  }
  return v3;
}

@end
