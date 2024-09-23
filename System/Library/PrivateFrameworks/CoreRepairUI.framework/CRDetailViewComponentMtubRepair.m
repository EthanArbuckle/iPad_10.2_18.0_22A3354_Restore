@implementation CRDetailViewComponentMtubRepair

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

  v3 = (int)*MEMORY[0x24BE756E0];
  v4 = *(Class *)((char *)&self->super.super.super.super.super.super.isa + v3);
  if (!v4)
  {
    v5 = (void *)objc_opt_new();
    -[CRUDetailViewComponent locale](self, "locale");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "localizedStringWithKey:defaultString:", CFSTR("REAR_SYSTEM"), CFSTR("REAR_SYSTEM"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[CRUDetailViewComponent repairDate](self, "repairDate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[CRUDetailViewComponent componentRepairSpecifierForComponent:IsUsed:repairDate:](self, "componentRepairSpecifierForComponent:IsUsed:repairDate:", v7, 0, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObjectsFromArray:", v9);

    v10 = *(Class *)((char *)&self->super.super.super.super.super.super.isa + v3);
    *(Class *)((char *)&self->super.super.super.super.super.super.isa + v3) = (Class)v5;

    v4 = *(Class *)((char *)&self->super.super.super.super.super.super.isa + v3);
  }
  return v4;
}

- (CRDetailViewComponentMtubRepair)init
{
  CRDetailViewComponentMtubRepair *v2;
  CRDetailViewComponentMtubRepair *v3;
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
  objc_super v20;

  v20.receiver = self;
  v20.super_class = (Class)CRDetailViewComponentMtubRepair;
  v2 = -[CRUDetailViewComponent init](&v20, sel_init);
  v3 = v2;
  if (v2)
  {
    v4 = (void *)MEMORY[0x24BDBCF48];
    -[CRUDetailViewComponent locale](v2, "locale");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "localizedStringWithKey:defaultString:", CFSTR("REAR_SYSTEM_REPAIR_KB_URL"), CFSTR("REAR_SYSTEM_REPAIR_KB_URL"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "URLWithString:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[CRUDetailViewComponent setKbArticleURL:](v3, "setKbArticleURL:", v7);

    -[CRUDetailViewComponent locale](v3, "locale");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "localizedStringWithKey:defaultString:", CFSTR("GENUINE_APPLE_PART"), CFSTR("GENUINE_APPLE_PART"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[CRUDetailViewComponent setTitleText:](v3, "setTitleText:", v9);

    v10 = (void *)objc_opt_new();
    -[CRUDetailViewComponent locale](v3, "locale");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "localizedStringWithKey:defaultString:", CFSTR("GENUINE_MTUB_DESC"), CFSTR("GENUINE_MTUB_DESC"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "appendString:", v12);

    -[CRUDetailViewComponent deviceHistory](v3, "deviceHistory");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[CRUDetailViewComponent rchlRepairHistory](v3, "rchlRepairHistory");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[CRUDetailViewComponent caaRepairHistoryDict](v3, "caaRepairHistoryDict");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "repairDateForComponent:withRCHLHistory:withCAAHistory:", CFSTR("MTUB"), v14, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[CRUDetailViewComponent setRepairDate:](v3, "setRepairDate:", v16);

    -[CRUDetailViewComponent setInformativeText:](v3, "setInformativeText:", v10);
    -[CRUDetailViewComponent locale](v3, "locale");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "localizedStringWithKey:defaultString:", CFSTR("MTUB_FOOTER_LEARN_MORE"), CFSTR("MTUB_FOOTER_LEARN_MORE"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[CRUDetailViewComponent setFooterText:](v3, "setFooterText:", v18);

  }
  return v3;
}

@end
