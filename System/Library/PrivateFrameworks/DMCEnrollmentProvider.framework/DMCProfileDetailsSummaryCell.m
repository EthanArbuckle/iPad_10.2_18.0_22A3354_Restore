@implementation DMCProfileDetailsSummaryCell

+ (id)cellIdentifier
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

- (void)setProfileViewModel:(id)a3
{
  void *v3;
  void *v4;
  __CFString *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  __CFString *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  DMCProfileItemDetail *v28;
  void *v29;
  void *v30;
  id v32;

  v32 = a3;
  objc_msgSend(v32, "profile");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_opt_new();
  objc_msgSend(v3, "signerSummary");
  v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (!-[__CFString length](v5, "length"))
  {

    v5 = &stru_24D52F990;
  }
  v6 = (void *)MEMORY[0x24BDD17C8];
  DMCEnrollmentLocalizedString(CFSTR("DMC_SIGNED_BY"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringWithFormat:", CFSTR("%@ "), v7);
  v8 = objc_claimAutoreleasedReturnValue();

  +[DMCProfileViewModel trustTextForProfile:](DMCProfileViewModel, "trustTextForProfile:", v3);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = (void *)v8;
  v28 = -[DMCProfileItemDetail initWithTitle:detail:trustText:]([DMCProfileItemDetail alloc], "initWithTitle:detail:trustText:", v8, v5, v29);
  objc_msgSend(v4, "addObject:");
  objc_msgSend(v3, "profileDescription");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "length"))
  {
    DMCEnrollmentLocalizedString(CFSTR("DMC_DESCRIPTION_TITLE"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[DMCProfileItemDetail itemDetailWithTitle:detail:](DMCProfileItemDetail, "itemDetailWithTitle:detail:", v10, v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "addObject:", v11);
  }
  objc_msgSend(v32, "payloadInfoSectionSummaries");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v12, "mutableCopy");

  if (objc_msgSend(v3, "isLocked"))
  {
    objc_msgSend(v3, "removalPasscode");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "length");

    if (v15)
    {
      DMCEnrollmentLocalizedString(CFSTR("DMC_PROFILE_REMOVAL_PASSWORD"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "addObject:", v16);

    }
  }
  objc_msgSend(v3, "payloadsWithClass:", objc_opt_class());
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "firstObject");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v18, "managedAppleID");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v19)
  {
    objc_msgSend(v18, "personaID");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (v19)
    {
      v20 = (void *)MEMORY[0x24BE2A7A0];
      objc_msgSend(v18, "personaID");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "managedAppleIDNameWithPersonaID:", v21);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  if (objc_msgSend(v19, "length"))
  {
    if (_os_feature_enabled_impl())
      v22 = CFSTR("DMC_APPLE_ACCOUNT_TITLE");
    else
      v22 = CFSTR("DMC_APPLE_ID_TITLE");
    DMCEnrollmentLocalizedString(v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    +[DMCProfileItemDetail itemDetailWithTitle:detail:](DMCProfileItemDetail, "itemDetailWithTitle:detail:", v23, v19);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v24);

  }
  if (objc_msgSend(v13, "count"))
  {
    DMCEnrollmentLocalizedString(CFSTR("DMC_CONTAINS_TITLE"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "componentsJoinedByString:", CFSTR("\n"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    +[DMCProfileItemDetail itemDetailWithTitle:detail:](DMCProfileItemDetail, "itemDetailWithTitle:detail:", v25, v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "addObject:", v27);
  }
  -[DMCItemSummaryCell createViewWithItemDetailArray:](self, "createViewWithItemDetailArray:", v4);

}

@end
