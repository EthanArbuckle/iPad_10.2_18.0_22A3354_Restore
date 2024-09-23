@implementation CNUICoreEditAuthorizationCheck

- (BOOL)shouldPromptForPasscodeAuthorization
{
  NSObject *v3;
  _BOOL4 v4;
  _BOOL4 v5;
  _BOOL4 v6;
  NSObject *v7;
  BOOL v8;
  const char *v9;
  NSObject *v10;
  uint32_t v11;
  _DWORD v13[2];
  __int16 v14;
  _BOOL4 v15;
  __int16 v16;
  int v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  objc_msgSend((id)objc_opt_class(), "log");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    LOWORD(v13[0]) = 0;
    _os_log_impl(&dword_1DD140000, v3, OS_LOG_TYPE_INFO, "- will check if editing contact requires passcode authorization -", (uint8_t *)v13, 2u);
  }

  if (!-[CNUICoreEditAuthorizationCheck canPerformValidAuthorizationCheck](self, "canPerformValidAuthorizationCheck"))
  {
    objc_msgSend((id)objc_opt_class(), "log");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      LOWORD(v13[0]) = 0;
      v9 = "- can't determine if editing contact requires passcode authorization -";
      v10 = v7;
      v11 = 2;
LABEL_13:
      _os_log_impl(&dword_1DD140000, v10, OS_LOG_TYPE_INFO, v9, (uint8_t *)v13, v11);
    }
LABEL_14:
    v8 = 0;
    goto LABEL_15;
  }
  v4 = -[CNUICoreEditAuthorizationCheck shouldRespectParentalRestrictions](self, "shouldRespectParentalRestrictions");
  v5 = -[CNUICoreEditAuthorizationCheck editAltersRestrictedInformation](self, "editAltersRestrictedInformation");
  v6 = v5;
  if (!v4
    || !v5
    || !-[CNUICoreEditAuthorizationCheck authorizationPasscodeEnabledOnDevice](self, "authorizationPasscodeEnabledOnDevice"))
  {
    objc_msgSend((id)objc_opt_class(), "log");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v13[0] = 67109632;
      v13[1] = v4;
      v14 = 1024;
      v15 = v6;
      v16 = 1024;
      v17 = 0;
      v9 = "- should not show authorization prompt (%hhd,%hhd,%hhd) -";
      v10 = v7;
      v11 = 20;
      goto LABEL_13;
    }
    goto LABEL_14;
  }
  objc_msgSend((id)objc_opt_class(), "log");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = 1;
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    LOWORD(v13[0]) = 0;
    _os_log_impl(&dword_1DD140000, v7, OS_LOG_TYPE_INFO, "- should show authorization prompt -", (uint8_t *)v13, 2u);
  }
LABEL_15:

  return v8;
}

+ (id)log
{
  if (log_cn_once_token_1_4 != -1)
    dispatch_once(&log_cn_once_token_1_4, &__block_literal_global_63);
  return (id)log_cn_once_object_1_4;
}

- (BOOL)shouldRespectParentalRestrictions
{
  _BOOL4 v2;
  NSObject *v3;
  const __CFString *v4;
  int v6;
  const __CFString *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = -[CNUICoreEditAuthorizationCheck ignoresParentalRestrictions](self, "ignoresParentalRestrictions");
  objc_msgSend((id)objc_opt_class(), "log");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    v4 = CFSTR("restrictions will be enforced");
    if (v2)
      v4 = CFSTR("restrictions will be ignored");
    v6 = 138543362;
    v7 = v4;
    _os_log_impl(&dword_1DD140000, v3, OS_LOG_TYPE_INFO, "%{public}@", (uint8_t *)&v6, 0xCu);
  }

  return !v2;
}

- (BOOL)ignoresParentalRestrictions
{
  return self->_ignoresParentalRestrictions;
}

- (BOOL)editAltersRestrictedInformation
{
  void *v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  int v9;
  unsigned int v10;
  NSObject *v11;
  _BOOL4 v12;
  const char *v13;
  NSObject *v14;
  uint32_t v15;
  _QWORD v17[5];
  uint8_t buf[4];
  int v19;
  __int16 v20;
  int v21;
  __int16 v22;
  int v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0C972D8];
  -[CNUICoreEditAuthorizationCheck contact](self, "contact");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v3) = objc_msgSend(v3, "isWhitelistedContact:", v4);

  -[CNUICoreEditAuthorizationCheck parentContainer](self, "parentContainer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isGuardianRestricted");

  -[CNUICoreEditAuthorizationCheck contact](self, "contact");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "linkedContacts");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __65__CNUICoreEditAuthorizationCheck_editAltersRestrictedInformation__block_invoke;
  v17[3] = &unk_1EA603568;
  v17[4] = self;
  v9 = objc_msgSend(v8, "_cn_any:", v17);

  v10 = v3 | v6 | v9;
  objc_msgSend((id)objc_opt_class(), "log");
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = os_log_type_enabled(v11, OS_LOG_TYPE_INFO);
  if (v10 == 1)
  {
    if (v12)
    {
      *(_WORD *)buf = 0;
      v13 = "editing is permitted";
      v14 = v11;
      v15 = 2;
LABEL_6:
      _os_log_impl(&dword_1DD140000, v14, OS_LOG_TYPE_INFO, v13, buf, v15);
    }
  }
  else if (v12)
  {
    *(_DWORD *)buf = 67109632;
    v19 = 0;
    v20 = 1024;
    v21 = 0;
    v22 = 1024;
    v23 = 0;
    v13 = "editing is restricted (%hhd,%hhd,%hhd)";
    v14 = v11;
    v15 = 20;
    goto LABEL_6;
  }

  return v10;
}

- (CNContact)contact
{
  return self->_contact;
}

- (BOOL)canPerformValidAuthorizationCheck
{
  void *v3;
  void *v4;
  void *v5;
  int v6;
  uint64_t v7;
  void *v8;

  -[CNUICoreEditAuthorizationCheck contact](self, "contact");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  -[CNUICoreEditAuthorizationCheck parentContainer](self, "parentContainer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[CNUICoreEditAuthorizationCheck parentContainer](self, "parentContainer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v6) = v5 != 0;
  }
  else
  {
    v7 = *MEMORY[0x1E0D137F8];
    -[CNUICoreEditAuthorizationCheck contact](self, "contact");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "linkedContacts");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (*(uint64_t (**)(uint64_t, void *))(v7 + 16))(v7, v8) ^ 1;

  }
  if (v3)
    return v6;
  else
    return 0;
}

- (CNContainer)parentContainer
{
  return self->_parentContainer;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_linkedParentContainerProvider, 0);
  objc_storeStrong((id *)&self->_screenTimePasscodeStatusCheck, 0);
  objc_storeStrong((id *)&self->_parentContainer, 0);
  objc_storeStrong((id *)&self->_contact, 0);
}

- (CNUICoreEditAuthorizationCheck)initWithContact:(id)a3 parentContainer:(id)a4 ignoresParentalRestrictions:(BOOL)a5 linkedParentContainerProvider:(id)a6
{
  _BOOL8 v6;
  id v10;
  id v11;
  id v12;
  CNUICoreScreentimePasscodeInspector *v13;
  CNUICoreEditAuthorizationCheck *v14;

  v6 = a5;
  v10 = a6;
  v11 = a4;
  v12 = a3;
  v13 = objc_alloc_init(CNUICoreScreentimePasscodeInspector);
  v14 = -[CNUICoreEditAuthorizationCheck initWithContact:parentContainer:ignoresParentalRestrictions:screenTimePasscodeStatusCheck:linkedParentContainerProvider:](self, "initWithContact:parentContainer:ignoresParentalRestrictions:screenTimePasscodeStatusCheck:linkedParentContainerProvider:", v12, v11, v6, v13, v10);

  return v14;
}

- (CNUICoreEditAuthorizationCheck)initWithContact:(id)a3 parentContainer:(id)a4 ignoresParentalRestrictions:(BOOL)a5 screenTimePasscodeStatusCheck:(id)a6 linkedParentContainerProvider:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  CNUICoreEditAuthorizationCheck *v17;
  CNUICoreEditAuthorizationCheck *v18;
  CNUICoreEditAuthorizationCheck *v19;
  objc_super v21;

  v13 = a3;
  v14 = a4;
  v15 = a6;
  v16 = a7;
  v21.receiver = self;
  v21.super_class = (Class)CNUICoreEditAuthorizationCheck;
  v17 = -[CNUICoreEditAuthorizationCheck init](&v21, sel_init);
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_contact, a3);
    objc_storeStrong((id *)&v18->_parentContainer, a4);
    v18->_ignoresParentalRestrictions = a5;
    objc_storeStrong((id *)&v18->_screenTimePasscodeStatusCheck, a6);
    objc_storeStrong((id *)&v18->_linkedParentContainerProvider, a7);
    v19 = v18;
  }

  return v18;
}

void __37__CNUICoreEditAuthorizationCheck_log__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.contactsui", "passcode");
  v1 = (void *)log_cn_once_object_1_4;
  log_cn_once_object_1_4 = (uint64_t)v0;

}

+ (BOOL)isAuthorizationPasscodeEnabledOnDevice
{
  CNUICoreScreentimePasscodeInspector *v2;
  BOOL v3;

  v2 = objc_alloc_init(CNUICoreScreentimePasscodeInspector);
  v3 = -[CNUICoreScreentimePasscodeInspector screentimePasscodeStatus](v2, "screentimePasscodeStatus") == 2;

  return v3;
}

+ (id)containerProviderWithContactStore:(id)a3
{
  id v3;
  CNUICoreContactStoreProductionFacade *v4;

  v3 = a3;
  v4 = -[CNUICoreContactStoreProductionFacade initWithContactStore:]([CNUICoreContactStoreProductionFacade alloc], "initWithContactStore:", v3);

  return v4;
}

- (CNUICoreEditAuthorizationCheck)initWithContact:(id)a3 parentContainer:(id)a4 ignoresParentalRestrictions:(BOOL)a5
{
  _BOOL8 v5;
  objc_class *v8;
  id v9;
  id v10;
  id v11;
  CNUICoreScreentimePasscodeInspector *v12;
  void *v13;
  CNUICoreEditAuthorizationCheck *v14;

  v5 = a5;
  v8 = (objc_class *)MEMORY[0x1E0C97298];
  v9 = a4;
  v10 = a3;
  v11 = objc_alloc_init(v8);
  v12 = objc_alloc_init(CNUICoreScreentimePasscodeInspector);
  objc_msgSend((id)objc_opt_class(), "containerProviderWithContactStore:", v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[CNUICoreEditAuthorizationCheck initWithContact:parentContainer:ignoresParentalRestrictions:screenTimePasscodeStatusCheck:linkedParentContainerProvider:](self, "initWithContact:parentContainer:ignoresParentalRestrictions:screenTimePasscodeStatusCheck:linkedParentContainerProvider:", v10, v9, v5, v12, v13);

  return v14;
}

- (BOOL)shouldBypassRestrictionsGivenAuthorizationResult:(int64_t)a3
{
  NSObject *v5;
  int v6;
  int v7;
  NSObject *v8;
  const char *v9;
  BOOL v10;
  _DWORD v12[2];
  __int16 v13;
  _BOOL4 v14;
  __int16 v15;
  int v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  objc_msgSend((id)objc_opt_class(), "log");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    LOWORD(v12[0]) = 0;
    _os_log_impl(&dword_1DD140000, v5, OS_LOG_TYPE_INFO, "- will check if should bypass restrictions when saving -", (uint8_t *)v12, 2u);
  }

  if (!-[CNUICoreEditAuthorizationCheck canPerformValidAuthorizationCheck](self, "canPerformValidAuthorizationCheck"))
  {
    objc_msgSend((id)objc_opt_class(), "log");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      LOWORD(v12[0]) = 0;
      v9 = "- can't determine if bypass of restrictions should be allowed -";
      goto LABEL_14;
    }
LABEL_15:
    v10 = 0;
    goto LABEL_16;
  }
  if (!-[CNUICoreEditAuthorizationCheck editAltersRestrictedInformation](self, "editAltersRestrictedInformation"))
  {
    objc_msgSend((id)objc_opt_class(), "log");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      LOWORD(v12[0]) = 0;
      v9 = "- should not bypass restrictions when saving because info isn't restricted-";
      goto LABEL_14;
    }
    goto LABEL_15;
  }
  v6 = 0;
  v7 = !-[CNUICoreEditAuthorizationCheck shouldRespectParentalRestrictions](self, "shouldRespectParentalRestrictions");
  if (a3 != 2 && (v7 & 1) == 0)
  {
    if (-[CNUICoreEditAuthorizationCheck authorizationPasscodeEnabledOnDevice](self, "authorizationPasscodeEnabledOnDevice"))
    {
      objc_msgSend((id)objc_opt_class(), "log");
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        LOWORD(v12[0]) = 0;
        v9 = "- should not bypass restrictions when saving -";
LABEL_14:
        _os_log_impl(&dword_1DD140000, v8, OS_LOG_TYPE_INFO, v9, (uint8_t *)v12, 2u);
        goto LABEL_15;
      }
      goto LABEL_15;
    }
    v6 = 1;
  }
  objc_msgSend((id)objc_opt_class(), "log");
  v8 = objc_claimAutoreleasedReturnValue();
  v10 = 1;
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v12[0] = 67109632;
    v12[1] = v7;
    v13 = 1024;
    v14 = a3 == 2;
    v15 = 1024;
    v16 = v6;
    _os_log_impl(&dword_1DD140000, v8, OS_LOG_TYPE_INFO, "- should bypass restrictions when saving (%hhd,%hhd,%hhd) -", (uint8_t *)v12, 0x14u);
  }
LABEL_16:

  return v10;
}

uint64_t __65__CNUICoreEditAuthorizationCheck_editAltersRestrictedInformation__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "linkedParentContainerProvider");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "containerForContact:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "isGuardianRestricted");
  return v6;
}

- (BOOL)authorizationPasscodeEnabledOnDevice
{
  void *v2;
  uint64_t v3;
  NSObject *v4;
  const __CFString *v5;
  int v7;
  const __CFString *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  -[CNUICoreEditAuthorizationCheck screenTimePasscodeStatusCheck](self, "screenTimePasscodeStatusCheck");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "screentimePasscodeStatus");

  objc_msgSend((id)objc_opt_class(), "log");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = CFSTR("passcode is disabled");
    if (v3 == 2)
      v5 = CFSTR("passode is enabled");
    v7 = 138543362;
    v8 = v5;
    _os_log_impl(&dword_1DD140000, v4, OS_LOG_TYPE_INFO, "%{public}@", (uint8_t *)&v7, 0xCu);
  }

  return v3 == 2;
}

- (CNUICoreScreentimePasscodeCheck)screenTimePasscodeStatusCheck
{
  return self->_screenTimePasscodeStatusCheck;
}

- (CNUICoreParentContainerProvider)linkedParentContainerProvider
{
  return self->_linkedParentContainerProvider;
}

@end
