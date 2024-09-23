@implementation CRDetailViewComponentWifi

- (id)specifiers
{
  uint64_t v3;
  void *v4;
  void *v5;
  const __CFString *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;

  v3 = (int)*MEMORY[0x24BE756E0];
  v4 = *(Class *)((char *)&self->super.super.super.super.super.super.isa + v3);
  if (!v4)
  {
    v5 = (void *)objc_opt_new();
    if (MGGetBoolAnswer())
      v6 = CFSTR("WLAN");
    else
      v6 = CFSTR("Wifi");
    -[CRUDetailViewComponent componentSpecifierForComponent:](self, "componentSpecifierForComponent:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObjectsFromArray:", v7);

    v8 = *(Class *)((char *)&self->super.super.super.super.super.super.isa + v3);
    *(Class *)((char *)&self->super.super.super.super.super.super.isa + v3) = (Class)v5;
    v9 = v5;

    v10 = (void *)objc_opt_new();
    objc_msgSend(v10, "sendAsyncAnalyticsForEventIfNeeded:moduleName:", CFSTR("detailViewSeen"), CFSTR("Wifi"));

    v4 = *(Class *)((char *)&self->super.super.super.super.super.super.isa + v3);
  }
  return v4;
}

- (CRDetailViewComponentWifi)init
{
  CRDetailViewComponentWifi *v2;
  int v3;
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
  const __CFString *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  objc_super v25;

  v25.receiver = self;
  v25.super_class = (Class)CRDetailViewComponentWifi;
  v2 = -[CRUDetailViewComponent init](&v25, sel_init);
  if (v2)
  {
    v3 = MGGetBoolAnswer();
    v4 = (void *)MEMORY[0x24BDBCF48];
    -[CRUDetailViewComponent locale](v2, "locale");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "localizedStringWithKey:defaultString:", CFSTR("WIFI_KB_URL"), CFSTR("WIFI_KB_URL"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "URLWithString:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[CRUDetailViewComponent setKbArticleURL:](v2, "setKbArticleURL:", v7);

    -[CRUDetailViewComponent locale](v2, "locale");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v3)
    {
      objc_msgSend(v8, "localizedStringWithKey:defaultString:", CFSTR("WLAN_SETTINGS_TITLE"), CFSTR("WLAN_SETTINGS_TITLE"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[CRUDetailViewComponent setTitleText:](v2, "setTitleText:", v10);

      -[CRUDetailViewComponent locale](v2, "locale");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "localizedStringWithKey:defaultString:", CFSTR("WLAN_DESC"), CFSTR("WLAN_DESC"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[CRUDetailViewComponent setInformativeText:](v2, "setInformativeText:", v12);

      if (-[CRUDetailViewComponent deviceClass](v2, "deviceClass") == 3)
      {
        -[CRUDetailViewComponent locale](v2, "locale");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = v13;
        v15 = CFSTR("WLAN_DESC_IPAD");
LABEL_7:
        objc_msgSend(v13, "localizedStringWithKey:defaultString:", v15, v15);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        -[CRUDetailViewComponent setInformativeText:](v2, "setInformativeText:", v19);

        v20 = (void *)MEMORY[0x24BDBCF48];
        -[CRUDetailViewComponent locale](v2, "locale");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "localizedStringWithKey:defaultString:", CFSTR("WIFI_KB_URL_IPAD"), CFSTR("WIFI_KB_URL_IPAD"));
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "URLWithString:", v22);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        -[CRUDetailViewComponent setKbArticleURL:](v2, "setKbArticleURL:", v23);

      }
    }
    else
    {
      objc_msgSend(v8, "localizedStringWithKey:defaultString:", CFSTR("WIFI_SETTINGS_TITLE"), CFSTR("WIFI_SETTINGS_TITLE"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[CRUDetailViewComponent setTitleText:](v2, "setTitleText:", v16);

      -[CRUDetailViewComponent locale](v2, "locale");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "localizedStringWithKey:defaultString:", CFSTR("WIFI_DESC"), CFSTR("WIFI_DESC"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[CRUDetailViewComponent setInformativeText:](v2, "setInformativeText:", v18);

      if (-[CRUDetailViewComponent deviceClass](v2, "deviceClass") == 3)
      {
        -[CRUDetailViewComponent locale](v2, "locale");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = v13;
        v15 = CFSTR("WIFI_DESC_IPAD");
        goto LABEL_7;
      }
    }
  }
  return v2;
}

@end
