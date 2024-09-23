@implementation CRUDetailViewComponent

- (CRUDetailViewComponent)init
{
  CRUDetailViewComponent *v2;
  NSURL *kbArticleURL;
  NSString *titleText;
  NSString *componentName;
  NSString *informativeText;
  NSString *repairDate;
  uint64_t v8;
  MRLocalization *locale;
  PSSpecifier *infoCollectionSpecifier;
  void *v11;
  uint64_t v12;
  CRRepairHistory *deviceHistory;
  CRRepairHistory *v14;
  uint64_t v15;
  id v16;
  NSArray *rchlRepairHistory;
  uint64_t v18;
  NSDictionary *claimCount;
  void *v20;
  void *v21;
  uint64_t v22;
  NSString *buttonTitle;
  NSDictionary *caaRepairHistoryDict;
  NSString *footerText;
  uint64_t v26;
  NSDictionary *v27;
  id v29;
  objc_super v30;

  v30.receiver = self;
  v30.super_class = (Class)CRUDetailViewComponent;
  v2 = -[CRUDetailViewComponent init](&v30, sel_init);
  if (v2)
  {
    v2->dataCollectionClassExist = objc_opt_class() != 0;
    kbArticleURL = v2->kbArticleURL;
    v2->kbArticleURL = 0;

    titleText = v2->titleText;
    v2->titleText = 0;

    componentName = v2->componentName;
    v2->componentName = 0;

    informativeText = v2->informativeText;
    v2->informativeText = 0;

    repairDate = v2->repairDate;
    v2->repairDate = 0;

    v8 = objc_opt_new();
    locale = v2->locale;
    v2->locale = (MRLocalization *)v8;

    infoCollectionSpecifier = v2->infoCollectionSpecifier;
    v2->infoCollectionSpecifier = 0;

    v11 = (void *)MGCopyAnswer();
    v2->deviceClass = objc_msgSend(v11, "intValue");

    v12 = objc_opt_new();
    deviceHistory = v2->deviceHistory;
    v2->deviceHistory = (CRRepairHistory *)v12;

    v14 = v2->deviceHistory;
    v29 = 0;
    -[CRRepairHistory extractRCHLRepairHistoryAndClaimCount:](v14, "extractRCHLRepairHistoryAndClaimCount:", &v29);
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = v29;
    rchlRepairHistory = v2->rchlRepairHistory;
    v2->rchlRepairHistory = (NSArray *)v15;

    v18 = objc_msgSend(v16, "copy");
    claimCount = v2->claimCount;
    v2->claimCount = (NSDictionary *)v18;

    v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF50]), "initWithSuiteName:", CFSTR("com.apple.mobilerepaird"));
    objc_msgSend(v20, "objectForKey:", CFSTR("cachedCAACert"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[MRLocalization localizedStringWithKey:defaultString:](v2->locale, "localizedStringWithKey:defaultString:", CFSTR("LEARN_MORE"), CFSTR("LEARN_MORE"));
    v22 = objc_claimAutoreleasedReturnValue();
    buttonTitle = v2->buttonTitle;
    v2->buttonTitle = (NSString *)v22;

    caaRepairHistoryDict = v2->caaRepairHistoryDict;
    v2->caaRepairHistoryDict = 0;

    footerText = v2->footerText;
    v2->footerText = 0;

    if (v21 && objc_msgSend(v21, "length"))
    {
      objc_msgSend(MEMORY[0x24BDD1770], "propertyListWithData:options:format:error:", v21, 0, 0, 0);
      v26 = objc_claimAutoreleasedReturnValue();
      v27 = v2->caaRepairHistoryDict;
      v2->caaRepairHistoryDict = (NSDictionary *)v26;

    }
  }
  return v2;
}

- (void)handleNonGenuineComponentTap:(id)a3
{
  uint64_t v3;
  id v4;
  void *v5;
  void *v6;
  id v7;

  v3 = *MEMORY[0x24BE1B2C8];
  v4 = a3;
  objc_msgSend(v4, "propertyForKey:", v3);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "propertyForKey:", *MEMORY[0x24BE1B2C0]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BE1B410], "handlerWithItem:", v7);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleAction:completion:", v5, &unk_24F4D4CC8);

}

- (id)componentRepairSpecifierForComponent:(id)a3 IsUsed:(BOOL)a4 repairDate:(id)a5
{
  _BOOL4 v5;
  id v8;
  void *v9;
  void *v10;
  objc_class *v11;
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
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  uint64_t v58;
  id v59;
  NSRange v60;

  v5 = a4;
  v59 = a5;
  v8 = a3;
  v9 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x24BE75590], "groupSpecifierWithName:", CFSTR("REPAIR RECORD"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (objc_class *)objc_opt_class();
  NSStringFromClass(v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setProperty:forKey:", v12, *MEMORY[0x24BE75A30]);

  -[CRUDetailViewComponent kbArticleURL](self, "kbArticleURL");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setProperty:forKey:", v13, *MEMORY[0x24BE75A60]);

  -[CRUDetailViewComponent footerText](self, "footerText");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setProperty:forKey:", v14, *MEMORY[0x24BE75A58]);

  -[CRUDetailViewComponent footerText](self, "footerText");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[CRUDetailViewComponent footerText](self, "footerText");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v60.location = objc_msgSend(v15, "rangeOfString:", v16);
  NSStringFromRange(v60);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setProperty:forKey:", v17, *MEMORY[0x24BE75A40]);

  v57 = v10;
  objc_msgSend(v9, "addObject:", v10);
  v18 = (void *)MEMORY[0x24BE75590];
  -[CRUDetailViewComponent locale](self, "locale");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "localizedStringWithKey:defaultString:", CFSTR("TYPE"), CFSTR("TYPE"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v20, self, 0, 0, 0, 3, 0);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  -[CRUDetailViewComponent locale](self, "locale");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "localizedStringWithKey:defaultString:", CFSTR("TYPE"), CFSTR("TYPE"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setName:", v23);

  v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1688]), "initWithString:", v8);
  v25 = v9;
  objc_msgSend(v21, "setProperty:forKey:", v24, CFSTR("CRImageAlertKey"));

  v26 = objc_opt_class();
  v58 = *MEMORY[0x24BE75948];
  objc_msgSend(v21, "setProperty:forKey:", v26);
  v56 = v21;
  objc_msgSend(v9, "addObject:", v21);
  v27 = (void *)MEMORY[0x24BE75590];
  -[CRUDetailViewComponent locale](self, "locale");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "localizedStringWithKey:defaultString:", CFSTR("STATUS"), CFSTR("STATUS"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v29, self, 0, 0, 0, 3, 0);
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  -[CRUDetailViewComponent locale](self, "locale");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "localizedStringWithKey:defaultString:", CFSTR("STATUS"), CFSTR("STATUS"));
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "setName:", v32);

  -[CRUDetailViewComponent locale](self, "locale");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = v33;
  if (v5)
  {
    objc_msgSend(v33, "localizedStringWithKey:defaultString:", CFSTR("USED"), CFSTR("USED"));
    v35 = objc_claimAutoreleasedReturnValue();

    v36 = (void *)objc_opt_new();
    objc_msgSend(MEMORY[0x24BEBD640], "systemImageNamed:", CFSTR("arrow.3.trianglepath"));
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BEBD4B8], "systemBlueColor");
  }
  else
  {
    objc_msgSend(v33, "localizedStringWithKey:defaultString:", CFSTR("GENUINE_APPLE_PART"), CFSTR("GENUINE_APPLE_PART"));
    v35 = objc_claimAutoreleasedReturnValue();

    v36 = (void *)objc_opt_new();
    objc_msgSend(MEMORY[0x24BEBD640], "systemImageNamed:", CFSTR("checkmark.seal.fill"));
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BEBD4B8], "systemGreenColor");
  }
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "imageWithTintColor:", v38);
  v39 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v39, "imageWithRenderingMode:", 1);
  v40 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BEBB4B8], "textAttachmentWithImage:", v40);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1458], "attributedStringWithAttachment:");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "appendAttributedString:", v41);
  v42 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1458]), "initWithString:", CFSTR(" "));
  objc_msgSend(v36, "appendAttributedString:", v42);

  v55 = (void *)v35;
  v43 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1688]), "initWithString:", v35);
  objc_msgSend(v36, "appendAttributedString:", v43);

  objc_msgSend(v30, "setProperty:forKey:", v36, CFSTR("CRImageAlertKey"));
  objc_msgSend(v30, "setProperty:forKey:", objc_opt_class(), v58);
  objc_msgSend(v25, "addObject:", v30);
  v44 = v59;
  if (v59)
  {
    v45 = (void *)MEMORY[0x24BE75590];
    -[CRUDetailViewComponent locale](self, "locale");
    v46 = v25;
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "localizedStringWithKey:defaultString:", CFSTR("DATE"), CFSTR("DATE"));
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v48, self, 0, 0, 0, 3, 0);
    v49 = (void *)objc_claimAutoreleasedReturnValue();

    v44 = v59;
    v25 = v46;
    -[CRUDetailViewComponent locale](self, "locale");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "localizedStringWithKey:defaultString:", CFSTR("DATE"), CFSTR("DATE"));
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "setName:", v51);

    v52 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1688]), "initWithString:", v59);
    objc_msgSend(v49, "setProperty:forKey:", v52, CFSTR("CRImageAlertKey"));

    objc_msgSend(v49, "setProperty:forKey:", objc_opt_class(), v58);
    objc_msgSend(v46, "addObject:", v49);

  }
  return v25;
}

- (id)componentSpecifierForComponent:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  NSString *buttonTitle;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  NSObject *v17;
  void *v18;
  NSString *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint8_t buf[4];
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)objc_opt_new();
  v6 = objc_alloc_init(MEMORY[0x24BE1B3B0]);
  v7 = (void *)MEMORY[0x24BE1B3A0];
  buttonTitle = self->buttonTitle;
  -[CRUDetailViewComponent kbArticleURL](self, "kbArticleURL");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "actionWithLabel:url:", buttonTitle, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[CRUDetailViewComponent titleText](self, "titleText");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setTitle:", v11);

  -[CRUDetailViewComponent informativeText](self, "informativeText");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setInformativeText:", v12);

  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObject:", v10);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setActions:", v13);

  objc_msgSend(MEMORY[0x24BE75590], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", &stru_24F4D7158, 0, 0, 0, 0, -1, 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setProperty:forKey:", objc_opt_class(), *MEMORY[0x24BE75948]);
  v15 = *MEMORY[0x24BE1B2C8];
  objc_msgSend(v14, "setProperty:forKey:", v6, *MEMORY[0x24BE1B2C8]);
  objc_msgSend(v5, "addObject:", v14);
  -[CRUDetailViewComponent infoCollectionSpecifier](self, "infoCollectionSpecifier");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    sub_22AC82A9C(0);
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v26 = v4;
      _os_log_impl(&dword_22AC64000, v17, OS_LOG_TYPE_DEFAULT, "Has infomation collection specifier for component: %@", buf, 0xCu);
    }

    -[CRUDetailViewComponent infoCollectionSpecifier](self, "infoCollectionSpecifier");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v18);

  }
  v19 = self->buttonTitle;
  -[MRLocalization localizedStringWithKey:defaultString:](self->locale, "localizedStringWithKey:defaultString:", CFSTR("LEARN_MORE"), CFSTR("LEARN_MORE"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v19) = -[NSString isEqualToString:](v19, "isEqualToString:", v20);

  if ((_DWORD)v19)
  {
    v21 = (void *)MEMORY[0x24BE75590];
    objc_msgSend(v10, "label");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v22, self, 0, 0, 0, 13, 0);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v23, "setProperty:forKey:", v10, *MEMORY[0x24BE1B2C0]);
    objc_msgSend(v23, "setProperty:forKey:", v6, v15);
    objc_msgSend(v23, "setButtonAction:", sel_handleNonGenuineComponentTap_);
    objc_msgSend(v5, "addObject:", v23);

  }
  return v5;
}

- (BOOL)dataCollectionClassExist
{
  return self->dataCollectionClassExist;
}

- (void)setDataCollectionClassExist:(BOOL)a3
{
  self->dataCollectionClassExist = a3;
}

- (NSURL)kbArticleURL
{
  return self->kbArticleURL;
}

- (void)setKbArticleURL:(id)a3
{
  objc_storeStrong((id *)&self->kbArticleURL, a3);
}

- (NSString)titleText
{
  return self->titleText;
}

- (void)setTitleText:(id)a3
{
  objc_storeStrong((id *)&self->titleText, a3);
}

- (NSString)informativeText
{
  return self->informativeText;
}

- (void)setInformativeText:(id)a3
{
  objc_storeStrong((id *)&self->informativeText, a3);
}

- (MRLocalization)locale
{
  return self->locale;
}

- (void)setLocale:(id)a3
{
  objc_storeStrong((id *)&self->locale, a3);
}

- (int)deviceClass
{
  return self->deviceClass;
}

- (PSSpecifier)infoCollectionSpecifier
{
  return self->infoCollectionSpecifier;
}

- (void)setInfoCollectionSpecifier:(id)a3
{
  objc_storeStrong((id *)&self->infoCollectionSpecifier, a3);
}

- (NSString)footerText
{
  return self->footerText;
}

- (void)setFooterText:(id)a3
{
  objc_storeStrong((id *)&self->footerText, a3);
}

- (CRRepairHistory)deviceHistory
{
  return self->deviceHistory;
}

- (void)setDeviceHistory:(id)a3
{
  objc_storeStrong((id *)&self->deviceHistory, a3);
}

- (NSArray)rchlRepairHistory
{
  return self->rchlRepairHistory;
}

- (void)setRchlRepairHistory:(id)a3
{
  objc_storeStrong((id *)&self->rchlRepairHistory, a3);
}

- (NSDictionary)caaRepairHistoryDict
{
  return self->caaRepairHistoryDict;
}

- (void)setCaaRepairHistoryDict:(id)a3
{
  objc_storeStrong((id *)&self->caaRepairHistoryDict, a3);
}

- (NSString)buttonTitle
{
  return self->buttonTitle;
}

- (void)setButtonTitle:(id)a3
{
  objc_storeStrong((id *)&self->buttonTitle, a3);
}

- (NSString)repairDate
{
  return self->repairDate;
}

- (void)setRepairDate:(id)a3
{
  objc_storeStrong((id *)&self->repairDate, a3);
}

- (NSString)componentName
{
  return self->componentName;
}

- (void)setComponentName:(id)a3
{
  objc_storeStrong((id *)&self->componentName, a3);
}

- (BOOL)isUsed
{
  return self->isUsed;
}

- (void)setIsUsed:(BOOL)a3
{
  self->isUsed = a3;
}

- (NSDictionary)claimCount
{
  return self->claimCount;
}

- (void)setClaimCount:(id)a3
{
  objc_storeStrong((id *)&self->claimCount, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->claimCount, 0);
  objc_storeStrong((id *)&self->componentName, 0);
  objc_storeStrong((id *)&self->repairDate, 0);
  objc_storeStrong((id *)&self->buttonTitle, 0);
  objc_storeStrong((id *)&self->caaRepairHistoryDict, 0);
  objc_storeStrong((id *)&self->rchlRepairHistory, 0);
  objc_storeStrong((id *)&self->deviceHistory, 0);
  objc_storeStrong((id *)&self->footerText, 0);
  objc_storeStrong((id *)&self->infoCollectionSpecifier, 0);
  objc_storeStrong((id *)&self->locale, 0);
  objc_storeStrong((id *)&self->informativeText, 0);
  objc_storeStrong((id *)&self->titleText, 0);
  objc_storeStrong((id *)&self->kbArticleURL, 0);
}

@end
