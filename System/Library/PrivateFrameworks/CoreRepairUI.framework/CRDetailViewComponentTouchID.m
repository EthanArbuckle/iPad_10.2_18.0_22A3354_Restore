@implementation CRDetailViewComponentTouchID

- (id)specifiers
{
  id *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;

  v3 = (id *)((char *)&self->super.super.super.super.super.super.isa + (int)*MEMORY[0x24BE756E0]);
  v4 = *v3;
  if (!*v3)
  {
    v5 = (void *)objc_opt_new();
    -[CRUDetailViewComponent componentSpecifierForComponent:](self, "componentSpecifierForComponent:", CFSTR("TouchID"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObjectsFromArray:", v6);

    objc_storeStrong(v3, v5);
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF50]), "initWithSuiteName:", CFSTR("com.apple.mobilerepaird.systemhealth"));
    v8 = objc_msgSend(v7, "integerForKey:", CFSTR("com.apple.mobilerepair.TouchIDRepair"));

    if (v8 <= 1)
    {
      v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF50]), "initWithSuiteName:", CFSTR("com.apple.mobilerepaird.systemhealth"));
      objc_msgSend(v9, "setInteger:forKey:", v8 + 1, CFSTR("com.apple.mobilerepair.TouchIDRepair"));

      notify_post("com.apple.mobilerepair.refreshui");
    }
    v10 = (void *)objc_opt_new();
    objc_msgSend(v10, "sendAsyncAnalyticsForEventIfNeeded:moduleName:", CFSTR("detailViewSeen"), CFSTR("TouchID"));

    v4 = *v3;
  }
  return v4;
}

- (CRDetailViewComponentTouchID)init
{
  CRDetailViewComponentTouchID *v2;
  CRDetailViewComponentTouchID *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)CRDetailViewComponentTouchID;
  v2 = -[CRUDetailViewComponent init](&v13, sel_init);
  v3 = v2;
  if (v2 && -[CRUDetailViewComponent deviceClass](v2, "deviceClass") == 3)
  {
    v4 = (void *)MEMORY[0x24BDBCF48];
    -[CRUDetailViewComponent locale](v3, "locale");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "localizedStringWithKey:defaultString:", CFSTR("TOUCHID_KB_URL_IPAD"), CFSTR("TOUCHID_KB_URL_IPAD"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "URLWithString:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[CRUDetailViewComponent setKbArticleURL:](v3, "setKbArticleURL:", v7);

    -[CRUDetailViewComponent locale](v3, "locale");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "localizedStringWithKey:defaultString:", CFSTR("TOUCHID_DESC_IPAD"), CFSTR("TOUCHID_DESC_IPAD"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[CRUDetailViewComponent setInformativeText:](v3, "setInformativeText:", v9);

    -[CRUDetailViewComponent locale](v3, "locale");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "localizedStringWithKey:defaultString:", CFSTR("TOUCHID_SETTINGS_TITLE"), CFSTR("TOUCHID_SETTINGS_TITLE"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[CRUDetailViewComponent setTitleText:](v3, "setTitleText:", v11);

  }
  return v3;
}

@end
