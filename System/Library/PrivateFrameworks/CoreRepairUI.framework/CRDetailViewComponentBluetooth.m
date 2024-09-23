@implementation CRDetailViewComponentBluetooth

- (id)specifiers
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;

  v3 = (int)*MEMORY[0x24BE756E0];
  v4 = *(Class *)((char *)&self->super.super.super.super.super.super.isa + v3);
  if (!v4)
  {
    v5 = (void *)objc_opt_new();
    -[CRUDetailViewComponent componentSpecifierForComponent:](self, "componentSpecifierForComponent:", CFSTR("Bluetooth"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObjectsFromArray:", v6);

    v7 = *(Class *)((char *)&self->super.super.super.super.super.super.isa + v3);
    *(Class *)((char *)&self->super.super.super.super.super.super.isa + v3) = (Class)v5;
    v8 = v5;

    v9 = (void *)objc_opt_new();
    objc_msgSend(v9, "sendAsyncAnalyticsForEventIfNeeded:moduleName:", CFSTR("detailViewSeen"), CFSTR("Bluetooth"));

    v4 = *(Class *)((char *)&self->super.super.super.super.super.super.isa + v3);
  }
  return v4;
}

- (CRDetailViewComponentBluetooth)init
{
  CRDetailViewComponentBluetooth *v2;
  CRDetailViewComponentBluetooth *v3;
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
  v19.super_class = (Class)CRDetailViewComponentBluetooth;
  v2 = -[CRUDetailViewComponent init](&v19, sel_init);
  v3 = v2;
  if (v2)
  {
    v4 = (void *)MEMORY[0x24BDBCF48];
    -[CRUDetailViewComponent locale](v2, "locale");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "localizedStringWithKey:defaultString:", CFSTR("BLUETOOTH_KB_URL"), CFSTR("BLUETOOTH_KB_URL"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "URLWithString:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[CRUDetailViewComponent setKbArticleURL:](v3, "setKbArticleURL:", v7);

    -[CRUDetailViewComponent locale](v3, "locale");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "localizedStringWithKey:defaultString:", CFSTR("BLUETOOTH_SETTINGS_TITLE"), CFSTR("BLUETOOTH_SETTINGS_TITLE"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[CRUDetailViewComponent setTitleText:](v3, "setTitleText:", v9);

    -[CRUDetailViewComponent locale](v3, "locale");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "localizedStringWithKey:defaultString:", CFSTR("BLUETOOTH_DESC"), CFSTR("BLUETOOTH_DESC"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[CRUDetailViewComponent setInformativeText:](v3, "setInformativeText:", v11);

    if (-[CRUDetailViewComponent deviceClass](v3, "deviceClass") == 3)
    {
      -[CRUDetailViewComponent locale](v3, "locale");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "localizedStringWithKey:defaultString:", CFSTR("BLUETOOTH_DESC_IPAD"), CFSTR("BLUETOOTH_DESC_IPAD"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[CRUDetailViewComponent setInformativeText:](v3, "setInformativeText:", v13);

      v14 = (void *)MEMORY[0x24BDBCF48];
      -[CRUDetailViewComponent locale](v3, "locale");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "localizedStringWithKey:defaultString:", CFSTR("BLUETOOTH_KB_URL_IPAD"), CFSTR("BLUETOOTH_KB_URL_IPAD"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "URLWithString:", v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[CRUDetailViewComponent setKbArticleURL:](v3, "setKbArticleURL:", v17);

    }
  }
  return v3;
}

@end
