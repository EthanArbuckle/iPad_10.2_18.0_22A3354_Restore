@implementation CRDetailViewComponentCameraFinishRepair

- (id)specifiers
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (int)*MEMORY[0x24BE756E0];
  v4 = *(Class *)((char *)&self->super.super.super.super.super.super.isa + v3);
  if (!v4)
  {
    v5 = (void *)objc_opt_new();
    objc_msgSend(CFSTR("Camera"), "stringByAppendingString:", CFSTR("FinishRepair"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[CRUDetailViewComponent componentSpecifierForComponent:](self, "componentSpecifierForComponent:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObjectsFromArray:", v7);

    v8 = *(Class *)((char *)&self->super.super.super.super.super.super.isa + v3);
    *(Class *)((char *)&self->super.super.super.super.super.super.isa + v3) = (Class)v5;

    v4 = *(Class *)((char *)&self->super.super.super.super.super.super.isa + v3);
  }
  return v4;
}

- (CRDetailViewComponentCameraFinishRepair)init
{
  CRDetailViewComponentCameraFinishRepair *v2;
  void *v3;
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
  objc_super v25;

  v25.receiver = self;
  v25.super_class = (Class)CRDetailViewComponentCameraFinishRepair;
  v2 = -[CRUDetailViewComponent init](&v25, sel_init);
  if (v2)
  {
    v3 = (void *)objc_opt_new();
    -[CRUDetailViewComponent locale](v2, "locale");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "localizedStringWithKey:defaultString:", CFSTR("FINISH_REPAIR"), CFSTR("FINISH_REPAIR"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[CRUDetailViewComponent setTitleText:](v2, "setTitleText:", v5);

    v6 = (void *)MEMORY[0x24BDBCF48];
    -[CRUDetailViewComponent locale](v2, "locale");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "localizedStringWithKey:defaultString:", CFSTR("FINISH_REPAIR_KB_URL"), CFSTR("FINISH_REPAIR_KB_URL"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "URLWithString:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[CRUDetailViewComponent setKbArticleURL:](v2, "setKbArticleURL:", v9);

    -[CRUDetailViewComponent locale](v2, "locale");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "localizedStringWithKey:defaultString:", CFSTR("FINISH_CAMERA_DESC"), CFSTR("FINISH_CAMERA_DESC"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(v11, "mutableCopy");

    -[CRUDetailViewComponent locale](v2, "locale");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "localizedStringWithKey:defaultString:", CFSTR("RESTART_FINISH_REPAIR"), CFSTR("RESTART_FINISH_REPAIR"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[CRUDetailViewComponent setButtonTitle:](v2, "setButtonTitle:", v14);

    if (-[CRUDetailViewComponent deviceClass](v2, "deviceClass") == 3)
    {
      v15 = (void *)MEMORY[0x24BDBCF48];
      -[CRUDetailViewComponent locale](v2, "locale");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "localizedStringWithKey:defaultString:", CFSTR("CAMERA_REPAIR_KB_URL_IPAD"), CFSTR("CAMERA_REPAIR_KB_URL_IPAD"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "URLWithString:", v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[CRUDetailViewComponent setKbArticleURL:](v2, "setKbArticleURL:", v18);

      -[CRUDetailViewComponent locale](v2, "locale");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "localizedStringWithKey:defaultString:", CFSTR("FINISH_CAMERA_DESC_IPAD"), CFSTR("FINISH_CAMERA_DESC_IPAD"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v20, "mutableCopy");

      v12 = (void *)v21;
    }
    -[CRUDetailViewComponent setInformativeText:](v2, "setInformativeText:", v12);
    -[CRUDetailViewComponent locale](v2, "locale");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "localizedStringWithKey:defaultString:", CFSTR("Camera"), CFSTR("Camera"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[CRUDetailViewComponent setComponentName:](v2, "setComponentName:", v23);

  }
  return v2;
}

@end
