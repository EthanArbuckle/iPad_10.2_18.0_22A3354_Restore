@implementation CRDetailViewComponentNFC

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
    -[CRUDetailViewComponent componentSpecifierForComponent:](self, "componentSpecifierForComponent:", CFSTR("NFC"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObjectsFromArray:", v6);

    objc_storeStrong(v3, v5);
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF50]), "initWithSuiteName:", CFSTR("com.apple.mobilerepaird.systemhealth"));
    v8 = objc_msgSend(v7, "integerForKey:", CFSTR("com.apple.mobilerepair.NFCRepair"));

    if (v8 <= 1)
    {
      v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF50]), "initWithSuiteName:", CFSTR("com.apple.mobilerepaird.systemhealth"));
      objc_msgSend(v9, "setInteger:forKey:", v8 + 1, CFSTR("com.apple.mobilerepair.NFCRepair"));

      notify_post("com.apple.mobilerepair.refreshui");
    }
    v10 = (void *)objc_opt_new();
    objc_msgSend(v10, "sendAsyncAnalyticsForEventIfNeeded:moduleName:", CFSTR("detailViewSeen"), CFSTR("NFC"));

    v4 = *v3;
  }
  return v4;
}

- (CRDetailViewComponentNFC)init
{
  CRDetailViewComponentNFC *v2;
  CRDetailViewComponentNFC *v3;
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
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)CRDetailViewComponentNFC;
  v2 = -[CRUDetailViewComponent init](&v19, sel_init);
  v3 = v2;
  if (v2)
  {
    v4 = (void *)MEMORY[0x24BDBCF48];
    -[CRUDetailViewComponent locale](v2, "locale");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "localizedStringWithKey:defaultString:", CFSTR("NFC_KB_URL"), CFSTR("NFC_KB_URL"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "URLWithString:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[CRUDetailViewComponent setKbArticleURL:](v3, "setKbArticleURL:", v7);

    -[CRUDetailViewComponent locale](v3, "locale");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "localizedStringWithKey:defaultString:", CFSTR("NFC_SETTINGS_TITLE"), CFSTR("NFC_SETTINGS_TITLE"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[CRUDetailViewComponent setTitleText:](v3, "setTitleText:", v9);

    -[CRUDetailViewComponent locale](v3, "locale");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "localizedStringWithKey:defaultString:", CFSTR("NFC_DESC"), CFSTR("NFC_DESC"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[CRUDetailViewComponent setInformativeText:](v3, "setInformativeText:", v11);

    if (-[CRUDetailViewComponent deviceClass](v3, "deviceClass") == 3)
    {
      v12 = (void *)MEMORY[0x24BDBCF48];
      -[CRUDetailViewComponent locale](v3, "locale");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "localizedStringWithKey:defaultString:", CFSTR("NFC_KB_URL_IPAD"), CFSTR("NFC_KB_URL_IPAD"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "URLWithString:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[CRUDetailViewComponent setKbArticleURL:](v3, "setKbArticleURL:", v15);

      -[CRUDetailViewComponent locale](v3, "locale");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "localizedStringWithKey:defaultString:", CFSTR("NFC_DESC_IPAD"), CFSTR("NFC_DESC_IPAD"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[CRUDetailViewComponent setInformativeText:](v3, "setInformativeText:", v17);

    }
  }
  return v3;
}

@end
