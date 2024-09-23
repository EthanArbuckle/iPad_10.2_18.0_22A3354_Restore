@implementation CRDetailViewComponentFaceIDRepair

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
    objc_msgSend(v6, "localizedStringWithKey:defaultString:", CFSTR("FaceID"), CFSTR("FaceID"));
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

- (CRDetailViewComponentFaceIDRepair)init
{
  CRDetailViewComponentFaceIDRepair *v2;
  CRDetailViewComponentFaceIDRepair *v3;
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
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  objc_super v36;

  v36.receiver = self;
  v36.super_class = (Class)CRDetailViewComponentFaceIDRepair;
  v2 = -[CRUDetailViewComponent init](&v36, sel_init);
  v3 = v2;
  if (v2)
  {
    -[CRUDetailViewComponent deviceHistory](v2, "deviceHistory");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[CRUDetailViewComponent rchlRepairHistory](v3, "rchlRepairHistory");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[CRUDetailViewComponent claimCount](v3, "claimCount");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[CRUDetailViewComponent setIsUsed:](v3, "setIsUsed:", objc_msgSend(v4, "checkUsedStatusFor:withHistory:withClaimCount:", CFSTR("FaceID"), v5, v6));

    if (_os_feature_enabled_impl())
      -[CRUDetailViewComponent setIsUsed:](v3, "setIsUsed:", 1);
    v7 = (void *)MEMORY[0x24BDBCF48];
    -[CRUDetailViewComponent locale](v3, "locale");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "localizedStringWithKey:defaultString:", CFSTR("FACEID_REPAIR_KB_URL"), CFSTR("FACEID_REPAIR_KB_URL"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "URLWithString:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[CRUDetailViewComponent setKbArticleURL:](v3, "setKbArticleURL:", v10);

    v11 = (void *)objc_opt_new();
    -[CRUDetailViewComponent locale](v3, "locale");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "localizedStringWithKey:defaultString:", CFSTR("GENUINE_FACEID_DESC"), CFSTR("GENUINE_FACEID_DESC"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(v13, "mutableCopy");

    if (-[CRUDetailViewComponent deviceClass](v3, "deviceClass") == 3)
    {
      v15 = (void *)MEMORY[0x24BDBCF48];
      -[CRUDetailViewComponent locale](v3, "locale");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "localizedStringWithKey:defaultString:", CFSTR("FACEID_REPAIR_KB_URL_IPAD"), CFSTR("FACEID_REPAIR_KB_URL_IPAD"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "URLWithString:", v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[CRUDetailViewComponent setKbArticleURL:](v3, "setKbArticleURL:", v18);

      -[CRUDetailViewComponent locale](v3, "locale");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "localizedStringWithKey:defaultString:", CFSTR("GENUINE_FACEID_DESC_IPAD"), CFSTR("GENUINE_FACEID_DESC_IPAD"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v20, "mutableCopy");

      v14 = (void *)v21;
    }
    -[CRUDetailViewComponent locale](v3, "locale");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "localizedStringWithKey:defaultString:", CFSTR("GENUINE_APPLE_PART"), CFSTR("GENUINE_APPLE_PART"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[CRUDetailViewComponent setTitleText:](v3, "setTitleText:", v23);

    if (-[CRUDetailViewComponent isUsed](v3, "isUsed"))
    {
      -[CRUDetailViewComponent locale](v3, "locale");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "localizedStringWithKey:defaultString:", CFSTR("USED"), CFSTR("USED"));
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[CRUDetailViewComponent setTitleText:](v3, "setTitleText:", v25);

      -[CRUDetailViewComponent locale](v3, "locale");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "localizedStringWithKey:defaultString:", CFSTR("USED_FACEID_DESC"), CFSTR("USED_FACEID_DESC"));
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = objc_msgSend(v27, "mutableCopy");

      v14 = (void *)v28;
    }
    -[CRUDetailViewComponent deviceHistory](v3, "deviceHistory");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[CRUDetailViewComponent rchlRepairHistory](v3, "rchlRepairHistory");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[CRUDetailViewComponent caaRepairHistoryDict](v3, "caaRepairHistoryDict");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "repairDateForComponent:withRCHLHistory:withCAAHistory:", CFSTR("FaceID"), v30, v31);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[CRUDetailViewComponent setRepairDate:](v3, "setRepairDate:", v32);

    -[CRUDetailViewComponent setInformativeText:](v3, "setInformativeText:", v14);
    -[CRUDetailViewComponent locale](v3, "locale");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "localizedStringWithKey:defaultString:", CFSTR("FACEID_FOOTER_LEARN_MORE"), CFSTR("FACEID_FOOTER_LEARN_MORE"));
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[CRUDetailViewComponent setFooterText:](v3, "setFooterText:", v34);

  }
  return v3;
}

@end
