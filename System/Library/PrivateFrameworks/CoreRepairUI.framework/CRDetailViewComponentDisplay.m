@implementation CRDetailViewComponentDisplay

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
    -[CRUDetailViewComponent componentSpecifierForComponent:](self, "componentSpecifierForComponent:", CFSTR("Display"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObjectsFromArray:", v6);

    v7 = *(Class *)((char *)&self->super.super.super.super.super.super.isa + v3);
    *(Class *)((char *)&self->super.super.super.super.super.super.isa + v3) = (Class)v5;

    v4 = *(Class *)((char *)&self->super.super.super.super.super.super.isa + v3);
  }
  return v4;
}

- (CRDetailViewComponentDisplay)init
{
  CRDetailViewComponentDisplay *v2;
  CRDetailViewComponentDisplay *v3;
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
  objc_super v22;

  v22.receiver = self;
  v22.super_class = (Class)CRDetailViewComponentDisplay;
  v2 = -[CRUDetailViewComponent init](&v22, sel_init);
  v3 = v2;
  if (v2)
  {
    v4 = (void *)MEMORY[0x24BDBCF48];
    -[CRUDetailViewComponent locale](v2, "locale");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "localizedStringWithKey:defaultString:", CFSTR("NONGENUINE_DISPLAY_URL"), CFSTR("NONGENUINE_DISPLAY_URL"));
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
    objc_msgSend(v10, "localizedStringWithKey:defaultString:", CFSTR("NONGENUINE_DISPLAY_DESC"), CFSTR("NONGENUINE_DISPLAY_DESC"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[CRUDetailViewComponent setInformativeText:](v3, "setInformativeText:", v11);

    if (-[CRUDetailViewComponent deviceClass](v3, "deviceClass") == 3)
    {
      v12 = (void *)MEMORY[0x24BDBCF48];
      -[CRUDetailViewComponent locale](v3, "locale");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "localizedStringWithKey:defaultString:", CFSTR("NONGENUINE_DISPLAY_URL_IPAD"), CFSTR("NONGENUINE_DISPLAY_URL_IPAD"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "URLWithString:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[CRUDetailViewComponent setKbArticleURL:](v3, "setKbArticleURL:", v15);

      -[CRUDetailViewComponent locale](v3, "locale");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "localizedStringWithKey:defaultString:", CFSTR("NONGENUINE_DISPLAY_DESC_IPAD"), CFSTR("NONGENUINE_DISPLAY_DESC_IPAD"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[CRUDetailViewComponent setInformativeText:](v3, "setInformativeText:", v17);

    }
    v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF50]), "initWithSuiteName:", CFSTR("com.apple.mobilerepaird.systemhealth"));
    v19 = objc_msgSend(v18, "integerForKey:", CFSTR("com.apple.mobilerepair.DisplayRepair"));

    if (v19 <= 1)
    {
      v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF50]), "initWithSuiteName:", CFSTR("com.apple.mobilerepaird.systemhealth"));
      objc_msgSend(v20, "setInteger:forKey:", v19 + 1, CFSTR("com.apple.mobilerepair.DisplayRepair"));

    }
    notify_post("com.apple.mobilerepair.refreshui");
  }
  return v3;
}

@end
