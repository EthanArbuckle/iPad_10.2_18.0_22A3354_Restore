@implementation CRDetailViewComponentCameraRepair

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
    objc_msgSend(v6, "localizedStringWithKey:defaultString:", CFSTR("Camera"), CFSTR("Camera"));
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

- (CRDetailViewComponentCameraRepair)init
{
  CRDetailViewComponentCameraRepair *v2;
  CRDetailViewComponentCameraRepair *v3;
  CRDetailViewComponentCameraRepair *v4;
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
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  objc_super v30;

  v30.receiver = self;
  v30.super_class = (Class)CRDetailViewComponentCameraRepair;
  v2 = -[CRUDetailViewComponent init](&v30, sel_init);
  v3 = v2;
  if (!v2)
  {
LABEL_9:
    v4 = v3;
    goto LABEL_10;
  }
  if (-[CRUDetailViewComponent deviceClass](v2, "deviceClass") != 3)
  {
    -[CRUDetailViewComponent deviceHistory](v3, "deviceHistory");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[CRUDetailViewComponent rchlRepairHistory](v3, "rchlRepairHistory");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[CRUDetailViewComponent claimCount](v3, "claimCount");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[CRUDetailViewComponent setIsUsed:](v3, "setIsUsed:", objc_msgSend(v5, "checkUsedStatusFor:withHistory:withClaimCount:", CFSTR("Camera"), v6, v7));

    if (_os_feature_enabled_impl())
      -[CRUDetailViewComponent setIsUsed:](v3, "setIsUsed:", 1);
    v8 = (void *)MEMORY[0x24BDBCF48];
    -[CRUDetailViewComponent locale](v3, "locale");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "localizedStringWithKey:defaultString:", CFSTR("CAMERA_REPAIR_KB_URL"), CFSTR("CAMERA_REPAIR_KB_URL"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "URLWithString:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[CRUDetailViewComponent setKbArticleURL:](v3, "setKbArticleURL:", v11);

    -[CRUDetailViewComponent locale](v3, "locale");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "localizedStringWithKey:defaultString:", CFSTR("GENUINE_APPLE_PART"), CFSTR("GENUINE_APPLE_PART"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[CRUDetailViewComponent setTitleText:](v3, "setTitleText:", v13);

    v14 = (void *)objc_opt_new();
    -[CRUDetailViewComponent locale](v3, "locale");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "localizedStringWithKey:defaultString:", CFSTR("GENUINE_CAMERA_DESC"), CFSTR("GENUINE_CAMERA_DESC"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)objc_msgSend(v16, "mutableCopy");

    if (-[CRUDetailViewComponent isUsed](v3, "isUsed"))
    {
      -[CRUDetailViewComponent locale](v3, "locale");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "localizedStringWithKey:defaultString:", CFSTR("USED"), CFSTR("USED"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[CRUDetailViewComponent setTitleText:](v3, "setTitleText:", v19);

      -[CRUDetailViewComponent locale](v3, "locale");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "localizedStringWithKey:defaultString:", CFSTR("USED_CAMERA_DESC"), CFSTR("USED_CAMERA_DESC"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v21, "mutableCopy");

      v17 = (void *)v22;
    }
    -[CRUDetailViewComponent deviceHistory](v3, "deviceHistory");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[CRUDetailViewComponent rchlRepairHistory](v3, "rchlRepairHistory");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[CRUDetailViewComponent caaRepairHistoryDict](v3, "caaRepairHistoryDict");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "repairDateForComponent:withRCHLHistory:withCAAHistory:", CFSTR("Camera"), v24, v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[CRUDetailViewComponent setRepairDate:](v3, "setRepairDate:", v26);

    -[CRUDetailViewComponent setInformativeText:](v3, "setInformativeText:", v17);
    -[CRUDetailViewComponent locale](v3, "locale");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "localizedStringWithKey:defaultString:", CFSTR("CAMERA_FOOTER_LEARN_MORE"), CFSTR("CAMERA_FOOTER_LEARN_MORE"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[CRUDetailViewComponent setFooterText:](v3, "setFooterText:", v28);

    goto LABEL_9;
  }
  v4 = 0;
LABEL_10:

  return v4;
}

@end
