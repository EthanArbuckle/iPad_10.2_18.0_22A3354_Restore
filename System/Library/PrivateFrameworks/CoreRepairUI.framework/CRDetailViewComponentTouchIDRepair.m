@implementation CRDetailViewComponentTouchIDRepair

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
    objc_msgSend(v6, "localizedStringWithKey:defaultString:", CFSTR("TouchID"), CFSTR("TouchID"));
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

- (CRDetailViewComponentTouchIDRepair)init
{
  CRDetailViewComponentTouchIDRepair *v2;
  CRDetailViewComponentTouchIDRepair *v3;
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
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  objc_super v25;

  v25.receiver = self;
  v25.super_class = (Class)CRDetailViewComponentTouchIDRepair;
  v2 = -[CRUDetailViewComponent init](&v25, sel_init);
  v3 = v2;
  if (v2)
  {
    -[CRUDetailViewComponent setIsUsed:](v2, "setIsUsed:", 0);
    if (_os_feature_enabled_impl())
      -[CRUDetailViewComponent setIsUsed:](v3, "setIsUsed:", 1);
    v4 = (void *)MEMORY[0x24BDBCF48];
    -[CRUDetailViewComponent locale](v3, "locale");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "localizedStringWithKey:defaultString:", CFSTR("TOUCHID_REPAIR_KB_URL_IPAD"), CFSTR("TOUCHID_REPAIR_KB_URL_IPAD"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "URLWithString:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[CRUDetailViewComponent setKbArticleURL:](v3, "setKbArticleURL:", v7);

    v8 = (void *)objc_opt_new();
    LODWORD(v6) = -[CRUDetailViewComponent isUsed](v3, "isUsed");
    -[CRUDetailViewComponent locale](v3, "locale");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if ((_DWORD)v6)
    {
      objc_msgSend(v9, "localizedStringWithKey:defaultString:", CFSTR("USED"), CFSTR("USED"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[CRUDetailViewComponent setTitleText:](v3, "setTitleText:", v11);

      -[CRUDetailViewComponent locale](v3, "locale");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = v12;
      v14 = CFSTR("USED_TOUCHID_DESC_IPAD");
    }
    else
    {
      objc_msgSend(v9, "localizedStringWithKey:defaultString:", CFSTR("GENUINE_APPLE_PART"), CFSTR("GENUINE_APPLE_PART"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[CRUDetailViewComponent setTitleText:](v3, "setTitleText:", v15);

      -[CRUDetailViewComponent locale](v3, "locale");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = v12;
      v14 = CFSTR("GENUINE_TOUCHID_DESC_IPAD");
    }
    objc_msgSend(v12, "localizedStringWithKey:defaultString:", v14, v14);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)objc_msgSend(v16, "mutableCopy");

    -[CRUDetailViewComponent deviceHistory](v3, "deviceHistory");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[CRUDetailViewComponent rchlRepairHistory](v3, "rchlRepairHistory");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[CRUDetailViewComponent caaRepairHistoryDict](v3, "caaRepairHistoryDict");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "repairDateForComponent:withRCHLHistory:withCAAHistory:", CFSTR("TouchID"), v19, v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[CRUDetailViewComponent setRepairDate:](v3, "setRepairDate:", v21);

    -[CRUDetailViewComponent setInformativeText:](v3, "setInformativeText:", v17);
    -[CRUDetailViewComponent locale](v3, "locale");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "localizedStringWithKey:defaultString:", CFSTR("TOUCHID_FOOTER_LEARN_MORE"), CFSTR("TOUCHID_FOOTER_LEARN_MORE"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[CRUDetailViewComponent setFooterText:](v3, "setFooterText:", v23);

  }
  return v3;
}

@end
