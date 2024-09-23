@implementation CRDetailViewComponentCamera

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
    -[CRUDetailViewComponent componentSpecifierForComponent:](self, "componentSpecifierForComponent:", CFSTR("Camera"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObjectsFromArray:", v6);

    v7 = *(Class *)((char *)&self->super.super.super.super.super.super.isa + v3);
    *(Class *)((char *)&self->super.super.super.super.super.super.isa + v3) = (Class)v5;

    v4 = *(Class *)((char *)&self->super.super.super.super.super.super.isa + v3);
  }
  return v4;
}

- (CRDetailViewComponentCamera)init
{
  CRDetailViewComponentCamera *v2;
  CRDetailViewComponentCamera *v3;
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
  uint64_t v15;
  void *v16;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)CRDetailViewComponentCamera;
  v2 = -[CRUDetailViewComponent init](&v18, sel_init);
  v3 = v2;
  if (v2)
  {
    v4 = (void *)MEMORY[0x24BDBCF48];
    -[CRUDetailViewComponent locale](v2, "locale");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "localizedStringWithKey:defaultString:", CFSTR("NONGENUINE_KB_URL"), CFSTR("NONGENUINE_KB_URL"));
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
    objc_msgSend(v10, "localizedStringWithKey:defaultString:", CFSTR("NONGENUINE_CAMERA_DESC"), CFSTR("NONGENUINE_CAMERA_DESC"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[CRUDetailViewComponent setInformativeText:](v3, "setInformativeText:", v11);

    if (-[CRUDetailViewComponent deviceClass](v3, "deviceClass") == 3)
    {
      -[CRUDetailViewComponent locale](v3, "locale");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "localizedStringWithKey:defaultString:", CFSTR("NONGENUINE_CAMERA_DESC_IPAD"), CFSTR("NONGENUINE_CAMERA_DESC_IPAD"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[CRUDetailViewComponent setInformativeText:](v3, "setInformativeText:", v13);

    }
    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF50]), "initWithSuiteName:", CFSTR("com.apple.mobilerepaird.systemhealth"));
    v15 = objc_msgSend(v14, "integerForKey:", CFSTR("com.apple.mobilerepair.CameraRepair"));

    if (v15 <= 1)
    {
      v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF50]), "initWithSuiteName:", CFSTR("com.apple.mobilerepaird.systemhealth"));
      objc_msgSend(v16, "setInteger:forKey:", v15 + 1, CFSTR("com.apple.mobilerepair.CameraRepair"));

      notify_post("com.apple.mobilerepair.refreshui");
    }
  }
  return v3;
}

@end
