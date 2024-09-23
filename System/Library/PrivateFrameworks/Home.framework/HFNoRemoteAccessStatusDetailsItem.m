@implementation HFNoRemoteAccessStatusDetailsItem

- (HFNoRemoteAccessStatusDetailsItem)init
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_initWithHome_);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HFNoRemoteAccessStatusDetailsItem.m"), 23, CFSTR("%s is unavailable; use %@ instead"),
    "-[HFNoRemoteAccessStatusDetailsItem init]",
    v5);

  return 0;
}

- (HFNoRemoteAccessStatusDetailsItem)initWithHome:(id)a3
{
  id v5;
  HFNoRemoteAccessStatusDetailsItem *v6;
  HFNoRemoteAccessStatusDetailsItem *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HFNoRemoteAccessStatusDetailsItem;
  v6 = -[HFNoRemoteAccessStatusDetailsItem init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_home, a3);

  return v7;
}

- (id)_subclass_updateWithOptions:(id)a3
{
  HFMutableItemUpdateOutcome *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  int v14;
  __CFString *v15;
  __CFString *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  int v40;
  void *v41;
  id v42;
  void *v43;
  id v44;
  void *v45;
  void *v46;
  void *v47;
  uint64_t v48;
  void *v49;
  NSObject *v51;
  uint64_t v52;
  void *v53;
  uint8_t buf[4];
  HFNoRemoteAccessStatusDetailsItem *v55;
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  v4 = objc_alloc_init(HFMutableItemUpdateOutcome);
  -[HFNoRemoteAccessStatusDetailsItem home](self, "home");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hf_remoteAccessState");

  +[HFHomeKitDispatcher sharedDispatcher](HFHomeKitDispatcher, "sharedDispatcher");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "homeManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "residentProvisioningStatus");

  if ((v9 & 1) != 0)
  {
    -[HFMutableItemUpdateOutcome setObject:forKeyedSubscript:](v4, "setObject:forKeyedSubscript:", &unk_1EA7CBE48, CFSTR("priority"));
    if (v6 == 1)
      v16 = CFSTR("HFStatusDetailsNeedsTwoFactorAuthTitle");
    else
      v16 = CFSTR("HFStatusDetailsRemoteAccessAvailableButNeedsTwoFactorAuthTitle");
    _HFLocalizedStringWithDefaultValue(v16, v16, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFMutableItemUpdateOutcome setObject:forKeyedSubscript:](v4, "setObject:forKeyedSubscript:", v17, CFSTR("title"));

    _HFLocalizedStringWithDefaultValue(CFSTR("HFStatusDetailsNeedsTwoFactorAuthSettingsLink"), CFSTR("HFStatusDetailsNeedsTwoFactorAuthSettingsLink"), 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    _HFLocalizedStringWithDefaultValue(CFSTR("HFStatusDetailsNeedsTwoFactorAuthLearnMoreLink"), CFSTR("HFStatusDetailsNeedsTwoFactorAuthLearnMoreLink"), 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    HFLocalizedStringWithFormat(CFSTR("HFStatusDetailsNeedsTwoFactorAuthDescriptionFormat"), CFSTR("%1$@ %2$@"), v20, v21, v22, v23, v24, v25, (uint64_t)v18);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E98], "hf_openiCloudPasswordAndSecurityURL");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", CFSTR("https://support.apple.com/kb/HT204915"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3498], "hf_attributedLinkStringForString:linkString:linkURL:", v26, v18, v27);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3498], "hf_attributedLinkStringForAttributedString:linkString:linkURL:", v29, v19, v28);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFMutableItemUpdateOutcome setObject:forKeyedSubscript:](v4, "setObject:forKeyedSubscript:", v30, CFSTR("description"));

    HFLocalizedStringWithFormat(CFSTR("HFStatusDetailsNeedsTwoFactorAuthShortDescriptionFormat"), CFSTR("%1$@"), v31, v32, v33, v34, v35, v36, (uint64_t)v18);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3498], "hf_attributedLinkStringForString:linkString:linkURL:", v37, v18, v27);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFMutableItemUpdateOutcome setObject:forKeyedSubscript:](v4, "setObject:forKeyedSubscript:", v38, CFSTR("shortDescription"));

    -[HFMutableItemUpdateOutcome setObject:forKeyedSubscript:](v4, "setObject:forKeyedSubscript:", v28, CFSTR("destinationURL"));
    goto LABEL_11;
  }
  if ((v9 & 2) == 0 || v6 != 1)
  {
    if (v6 != 1
      || (-[HFNoRemoteAccessStatusDetailsItem home](self, "home"),
          v39 = (void *)objc_claimAutoreleasedReturnValue(),
          v40 = objc_msgSend(v39, "hf_isCurrentLocationHome"),
          v39,
          v40))
    {
      -[HFMutableItemUpdateOutcome setObject:forKeyedSubscript:](v4, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("hidden"));
      goto LABEL_22;
    }
    -[HFMutableItemUpdateOutcome setObject:forKeyedSubscript:](v4, "setObject:forKeyedSubscript:", &unk_1EA7CBE48, CFSTR("priority"));
    _HFLocalizedStringWithDefaultValue(CFSTR("HFStatusDetailsNoRemoteAccessTitle"), CFSTR("HFStatusDetailsNoRemoteAccessTitle"), 1);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFMutableItemUpdateOutcome setObject:forKeyedSubscript:](v4, "setObject:forKeyedSubscript:", v41, CFSTR("title"));

    _HFLocalizedStringWithDefaultValue(CFSTR("HFStatusDetailsNoRemoteAccessDescription"), CFSTR("HFStatusDetailsNoRemoteAccessDescription"), 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFMutableItemUpdateOutcome setObject:forKeyedSubscript:](v4, "setObject:forKeyedSubscript:", v18, CFSTR("shortDescription"));
    +[HFURLComponents aboutResidentDeviceURL](HFURLComponents, "aboutResidentDeviceURL");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = objc_alloc(MEMORY[0x1E0CB3778]);
    objc_msgSend(v18, "stringByAppendingString:", CFSTR(" "));
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = (void *)objc_msgSend(v42, "initWithString:", v43);

    v44 = objc_alloc(MEMORY[0x1E0CB3498]);
    _HFLocalizedStringWithDefaultValue(CFSTR("HFStatusDetailsNoRemoteAccessLearnMoreLink"), CFSTR("HFStatusDetailsNoRemoteAccessLearnMoreLink"), 1);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v52 = *MEMORY[0x1E0CEA0C0];
    v53 = v19;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v53, &v52, 1);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = (void *)objc_msgSend(v44, "initWithString:attributes:", v45, v46);
    objc_msgSend(v26, "appendAttributedString:", v47);

    -[HFMutableItemUpdateOutcome setObject:forKeyedSubscript:](v4, "setObject:forKeyedSubscript:", v26, CFSTR("description"));
    -[HFMutableItemUpdateOutcome setObject:forKeyedSubscript:](v4, "setObject:forKeyedSubscript:", v19, CFSTR("destinationURL"));
LABEL_11:

LABEL_21:
    goto LABEL_22;
  }
  -[HFMutableItemUpdateOutcome setObject:forKeyedSubscript:](v4, "setObject:forKeyedSubscript:", &unk_1EA7CBE48, CFSTR("priority"));
  _HFLocalizedStringWithDefaultValue(CFSTR("HFStatusDetailsNoRemoteAccessNotAtHomeTitle"), CFSTR("HFStatusDetailsNoRemoteAccessNotAtHomeTitle"), 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFMutableItemUpdateOutcome setObject:forKeyedSubscript:](v4, "setObject:forKeyedSubscript:", v10, CFSTR("title"));

  -[HFNoRemoteAccessStatusDetailsItem home](self, "home");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "hf_hasAppleTVs");

  -[HFNoRemoteAccessStatusDetailsItem home](self, "home");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "hf_hasHomePods");

  if (v12 && v14)
  {
    v15 = CFSTR("HFStatusDetailsNoRemoteAccessDescription_AppleTVHomePod");
LABEL_20:
    _HFLocalizedStringWithDefaultValue(v15, v15, 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFMutableItemUpdateOutcome setObject:forKeyedSubscript:](v4, "setObject:forKeyedSubscript:", v18, CFSTR("description"));
    goto LABEL_21;
  }
  if (v12)
  {
    v15 = CFSTR("HFStatusDetailsNoRemoteAccessDescription_AppleTV");
    goto LABEL_20;
  }
  if (v14)
  {
    v15 = CFSTR("HFStatusDetailsNoRemoteAccessDescription_HomePod");
    goto LABEL_20;
  }
  HFLogForCategory(0x29uLL);
  v51 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    v55 = self;
    _os_log_error_impl(&dword_1DD34E000, v51, OS_LOG_TYPE_ERROR, "%@ Asked to show 'No Remote Access' but there are no HomePods or Apple TVs in the home.", buf, 0xCu);
  }

LABEL_22:
  v48 = MEMORY[0x1E0C9AAB0];
  -[HFMutableItemUpdateOutcome setObject:forKeyedSubscript:](v4, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("remoteAccessDependency"));
  -[HFMutableItemUpdateOutcome setObject:forKeyedSubscript:](v4, "setObject:forKeyedSubscript:", v48, CFSTR("currentHomeDependency"));
  objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", v4);
  v49 = (void *)objc_claimAutoreleasedReturnValue();

  return v49;
}

- (HMHome)home
{
  return self->_home;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_home, 0);
}

@end
