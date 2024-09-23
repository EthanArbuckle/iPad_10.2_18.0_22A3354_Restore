@implementation CRDetailViewComponentDisplayRepair

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
    objc_msgSend(v6, "localizedStringWithKey:defaultString:", CFSTR("Display"), CFSTR("Display"));
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

- (CRDetailViewComponentDisplayRepair)init
{
  CRDetailViewComponentDisplayRepair *v2;
  CRDetailViewComponentDisplayRepair *v3;
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
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  const __CFString *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  objc_super v38;

  v38.receiver = self;
  v38.super_class = (Class)CRDetailViewComponentDisplayRepair;
  v2 = -[CRUDetailViewComponent init](&v38, sel_init);
  v3 = v2;
  if (v2)
  {
    -[CRUDetailViewComponent deviceHistory](v2, "deviceHistory");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[CRUDetailViewComponent rchlRepairHistory](v3, "rchlRepairHistory");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[CRUDetailViewComponent claimCount](v3, "claimCount");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[CRUDetailViewComponent setIsUsed:](v3, "setIsUsed:", objc_msgSend(v4, "checkUsedStatusFor:withHistory:withClaimCount:", CFSTR("Display"), v5, v6));

    if (_os_feature_enabled_impl())
      -[CRUDetailViewComponent setIsUsed:](v3, "setIsUsed:", 1);
    v7 = (void *)objc_opt_new();
    -[CRUDetailViewComponent locale](v3, "locale");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "localizedStringWithKey:defaultString:", CFSTR("GENUINE_APPLE_PART"), CFSTR("GENUINE_APPLE_PART"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[CRUDetailViewComponent setTitleText:](v3, "setTitleText:", v9);

    v10 = (void *)MEMORY[0x24BDBCF48];
    -[CRUDetailViewComponent locale](v3, "locale");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "localizedStringWithKey:defaultString:", CFSTR("DISPLAY_REPAIR_KB_URL"), CFSTR("DISPLAY_REPAIR_KB_URL"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "URLWithString:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[CRUDetailViewComponent setKbArticleURL:](v3, "setKbArticleURL:", v13);

    -[CRUDetailViewComponent locale](v3, "locale");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "localizedStringWithKey:defaultString:", CFSTR("GENUINE_DISPLAY_DESC"), CFSTR("GENUINE_DISPLAY_DESC"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)objc_msgSend(v15, "mutableCopy");

    if (-[CRUDetailViewComponent isUsed](v3, "isUsed"))
    {
      -[CRUDetailViewComponent locale](v3, "locale");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "localizedStringWithKey:defaultString:", CFSTR("USED_DISPLAY_DESC"), CFSTR("USED_DISPLAY_DESC"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v18, "mutableCopy");

      -[CRUDetailViewComponent locale](v3, "locale");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "localizedStringWithKey:defaultString:", CFSTR("USED"), CFSTR("USED"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[CRUDetailViewComponent setTitleText:](v3, "setTitleText:", v21);

      v16 = (void *)v19;
    }
    if (-[CRUDetailViewComponent deviceClass](v3, "deviceClass") == 3)
    {
      v22 = (void *)MEMORY[0x24BDBCF48];
      -[CRUDetailViewComponent locale](v3, "locale");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "localizedStringWithKey:defaultString:", CFSTR("DISPLAY_REPAIR_KB_URL_IPAD"), CFSTR("DISPLAY_REPAIR_KB_URL_IPAD"));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "URLWithString:", v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[CRUDetailViewComponent setKbArticleURL:](v3, "setKbArticleURL:", v25);

      LODWORD(v23) = -[CRUDetailViewComponent isUsed](v3, "isUsed");
      -[CRUDetailViewComponent locale](v3, "locale");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = v26;
      if ((_DWORD)v23)
        v28 = CFSTR("USED_DISPLAY_DESC_IPAD");
      else
        v28 = CFSTR("GENUINE_DISPLAY_DESC_IPAD");
      objc_msgSend(v26, "localizedStringWithKey:defaultString:", v28, v28);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = objc_msgSend(v29, "mutableCopy");

      v16 = (void *)v30;
    }
    -[CRUDetailViewComponent deviceHistory](v3, "deviceHistory");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[CRUDetailViewComponent rchlRepairHistory](v3, "rchlRepairHistory");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[CRUDetailViewComponent caaRepairHistoryDict](v3, "caaRepairHistoryDict");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "repairDateForComponent:withRCHLHistory:withCAAHistory:", CFSTR("Display"), v32, v33);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[CRUDetailViewComponent setRepairDate:](v3, "setRepairDate:", v34);

    -[CRUDetailViewComponent setInformativeText:](v3, "setInformativeText:", v16);
    -[CRUDetailViewComponent locale](v3, "locale");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "localizedStringWithKey:defaultString:", CFSTR("DISPLAY_FOOTER_LEARN_MORE"), CFSTR("DISPLAY_FOOTER_LEARN_MORE"));
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    -[CRUDetailViewComponent setFooterText:](v3, "setFooterText:", v36);

  }
  return v3;
}

@end
