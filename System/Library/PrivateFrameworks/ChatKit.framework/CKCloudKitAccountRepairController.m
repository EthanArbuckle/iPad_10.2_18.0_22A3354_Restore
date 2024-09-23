@implementation CKCloudKitAccountRepairController

- (id)CDPUIDeviceToDeviceEncryptionHelperWithPresentingViewController:(id)a3
{
  id v3;
  void *v4;
  NSObject *v5;
  uint8_t v7[16];

  v3 = a3;
  if (CDPUIDeviceToDeviceEncryptionHelperWithPresentingViewController__onceToken != -1)
    dispatch_once(&CDPUIDeviceToDeviceEncryptionHelperWithPresentingViewController__onceToken, &__block_literal_global_283);
  if (CDPUIDeviceToDeviceEncryptionHelperWithPresentingViewController__sClass)
  {
    v4 = (void *)objc_msgSend(objc_alloc((Class)CDPUIDeviceToDeviceEncryptionHelperWithPresentingViewController__sClass), "initWithPresentingViewController:", v3);
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v7 = 0;
        _os_log_impl(&dword_18DFCD000, v5, OS_LOG_TYPE_INFO, "Loading weak linked class CDPUIDeviceToDeviceEncryptionHelper from CoreCDPUI failed", v7, 2u);
      }

    }
    v4 = 0;
  }

  return v4;
}

uint64_t __101__CKCloudKitAccountRepairController_CDPUIDeviceToDeviceEncryptionHelperWithPresentingViewController___block_invoke()
{
  uint64_t result;

  result = MEMORY[0x193FF3C18](CFSTR("CDPUIDeviceToDeviceEncryptionHelper"), CFSTR("CoreCDPUI"));
  CDPUIDeviceToDeviceEncryptionHelperWithPresentingViewController__sClass = result;
  return result;
}

- (id)accountStore
{
  id v2;
  NSObject *v3;
  uint8_t v5[16];

  if (accountStore_onceToken != -1)
    dispatch_once(&accountStore_onceToken, &__block_literal_global_17);
  if (accountStore_sClass)
  {
    v2 = objc_alloc_init((Class)accountStore_sClass);
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v3 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v5 = 0;
        _os_log_impl(&dword_18DFCD000, v3, OS_LOG_TYPE_INFO, "Loading weak linked class ACAccountStore from Accounts failed", v5, 2u);
      }

    }
    v2 = 0;
  }
  return v2;
}

uint64_t __49__CKCloudKitAccountRepairController_accountStore__block_invoke()
{
  uint64_t result;

  result = MEMORY[0x193FF3C18](CFSTR("ACAccountStore"), CFSTR("Accounts"));
  accountStore_sClass = result;
  return result;
}

- (id)AKSecurityUpgradeContextMessages
{
  void *v2;
  id v3;
  NSObject *v4;
  uint8_t v6[16];

  if (AKSecurityUpgradeContextMessages_onceToken != -1)
    dispatch_once(&AKSecurityUpgradeContextMessages_onceToken, &__block_literal_global_22);
  v2 = (void *)AKSecurityUpgradeContextMessages_sSecurityUpgradeContext;
  if (AKSecurityUpgradeContextMessages_sSecurityUpgradeContext)
  {
    v3 = (id)AKSecurityUpgradeContextMessages_sSecurityUpgradeContext;
  }
  else if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_18DFCD000, v4, OS_LOG_TYPE_INFO, "Loading weak linked sSecurityUpgradeContext from AuthKit failed", v6, 2u);
    }

  }
  return v2;
}

void __69__CKCloudKitAccountRepairController_AKSecurityUpgradeContextMessages__block_invoke()
{
  id *v0;

  v0 = (id *)MEMORY[0x193FF3C24]("AKSecurityUpgradeContextMessages", CFSTR("AuthKit"));
  objc_storeStrong((id *)&AKSecurityUpgradeContextMessages_sSecurityUpgradeContext, *v0);
}

- (id)primaryAppleAccount
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  NSObject *v6;
  uint8_t v8[16];

  -[CKCloudKitAccountRepairController accountStore](self, "accountStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "aa_primaryAppleAccount");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_18DFCD000, v6, OS_LOG_TYPE_INFO, "Loading weak primary apple account failed", v8, 2u);
    }

  }
  return v4;
}

- (Class)authenticationContextClass
{
  void *v2;
  id v3;
  NSObject *v4;
  uint8_t v6[16];

  if (authenticationContextClass_onceToken != -1)
    dispatch_once(&authenticationContextClass_onceToken, &__block_literal_global_26_1);
  v2 = (void *)authenticationContextClass_sClass;
  if (authenticationContextClass_sClass)
  {
    v3 = (id)authenticationContextClass_sClass;
  }
  else if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_18DFCD000, v4, OS_LOG_TYPE_INFO, "Loading weak linked AKAppleIDAuthenticationContext from AuthKit failed", v6, 2u);
    }

  }
  return (Class)v2;
}

uint64_t __63__CKCloudKitAccountRepairController_authenticationContextClass__block_invoke()
{
  uint64_t result;

  result = MEMORY[0x193FF3C18](CFSTR("AKAppleIDAuthenticationContext"), CFSTR("AuthKit"));
  authenticationContextClass_sClass = result;
  return result;
}

- (id)authenticationContext
{
  void *v3;
  objc_class *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  const char *v12;
  uint8_t *v13;
  __int16 v15;
  __int16 v16;

  -[CKCloudKitAccountRepairController primaryAppleAccount](self, "primaryAppleAccount");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = -[CKCloudKitAccountRepairController authenticationContextClass](self, "authenticationContextClass");
    if (v4)
    {
      v5 = objc_alloc_init(v4);
      objc_msgSend(v3, "aa_altDSID");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setAltDSID:", v6);

      objc_msgSend(v5, "altDSID");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      if (v7)
      {
        -[CKCloudKitAccountRepairController AKSecurityUpgradeContextMessages](self, "AKSecurityUpgradeContextMessages");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "setSecurityUpgradeContext:", v8);

        objc_msgSend(v5, "securityUpgradeContext");
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        if (v9)
        {
          v10 = v5;
LABEL_16:

          goto LABEL_17;
        }
        if (IMOSLoggingEnabled())
        {
          OSLogHandleForIMFoundationCategory();
          v11 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
          {
            v15 = 0;
            v12 = "Loading weak linked securityUpgradeContext";
            v13 = (uint8_t *)&v15;
            goto LABEL_13;
          }
          goto LABEL_14;
        }
      }
      else if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
        {
          v16 = 0;
          v12 = "Loading weak linked altDSID failed";
          v13 = (uint8_t *)&v16;
LABEL_13:
          _os_log_impl(&dword_18DFCD000, v11, OS_LOG_TYPE_INFO, v12, v13, 2u);
        }
LABEL_14:

      }
      v10 = 0;
      goto LABEL_16;
    }
  }
  v10 = 0;
LABEL_17:

  return v10;
}

- (void)beginRepairWithPresentingViewController:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  NSObject *v14;
  objc_class *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  _QWORD aBlock[5];
  id v23;
  id v24;
  uint8_t buf[4];
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[CKCloudKitAccountRepairController encryptionHelper](self, "encryptionHelper");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18DFCD000, v9, OS_LOG_TYPE_INFO, "calling beginRepairWithPresentingViewController when repair already in flight", buf, 2u);
      }

    }
    if (v7)
      (*((void (**)(id, _QWORD, _QWORD))v7 + 2))(v7, 0, 0);
  }
  else
  {
    -[CKCloudKitAccountRepairController authenticationContext](self, "authenticationContext");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKCloudKitAccountRepairController CDPUIDeviceToDeviceEncryptionHelperWithPresentingViewController:](self, "CDPUIDeviceToDeviceEncryptionHelperWithPresentingViewController:", v6);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKCloudKitAccountRepairController setEncryptionHelper:](self, "setEncryptionHelper:", v11);

    -[CKCloudKitAccountRepairController encryptionHelper](self, "encryptionHelper");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = IMOSLoggingEnabled();
    if (v12 && v10)
    {
      if (v13)
      {
        OSLogHandleForIMFoundationCategory();
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
        {
          v15 = (objc_class *)objc_opt_class();
          NSStringFromClass(v15);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v26 = v16;
          _os_log_impl(&dword_18DFCD000, v14, OS_LOG_TYPE_INFO, "actually beginning repair with presented view controller: %@", buf, 0xCu);

        }
      }
      aBlock[0] = MEMORY[0x1E0C809B0];
      aBlock[1] = 3221225472;
      aBlock[2] = __88__CKCloudKitAccountRepairController_beginRepairWithPresentingViewController_completion___block_invoke;
      aBlock[3] = &unk_1E274D228;
      aBlock[4] = self;
      v23 = v6;
      v24 = v7;
      v17 = _Block_copy(aBlock);
      -[CKCloudKitAccountRepairController encryptionHelper](self, "encryptionHelper");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setDelegate:", self);

      -[CKCloudKitAccountRepairController encryptionHelper](self, "encryptionHelper");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "performDeviceToDeviceEncryptionStateRepairForContext:withCompletion:", v10, v17);

    }
    else
    {
      if (v13)
      {
        OSLogHandleForIMFoundationCategory();
        v20 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_18DFCD000, v20, OS_LOG_TYPE_INFO, "starting cloud kit account repair failed", buf, 2u);
        }

      }
      -[CKCloudKitAccountRepairController encryptionHelper](self, "encryptionHelper");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "setDelegate:", 0);

      -[CKCloudKitAccountRepairController setEncryptionHelper:](self, "setEncryptionHelper:", 0);
      if (v7)
        (*((void (**)(id, _QWORD, _QWORD))v7 + 2))(v7, 0, 0);
    }

  }
}

void __88__CKCloudKitAccountRepairController_beginRepairWithPresentingViewController_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  void *v6;
  NSObject *v7;
  objc_class *v8;
  void *v9;
  const __CFString *v10;
  uint64_t v11;
  int v12;
  void *v13;
  __int16 v14;
  const __CFString *v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(*(id *)(a1 + 32), "encryptionHelper");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setDelegate:", 0);

  objc_msgSend(*(id *)(a1 + 32), "setEncryptionHelper:", 0);
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v8 = (objc_class *)objc_opt_class();
      NSStringFromClass(v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = CFSTR("NO");
      v12 = 138412802;
      v13 = v9;
      v14 = 2112;
      if ((_DWORD)a2)
        v10 = CFSTR("YES");
      v15 = v10;
      v16 = 2112;
      v17 = v5;
      _os_log_impl(&dword_18DFCD000, v7, OS_LOG_TYPE_INFO, "actually completed repair with presented view controller: %@, with success: %@, error: %@", (uint8_t *)&v12, 0x20u);

    }
  }
  v11 = *(_QWORD *)(a1 + 48);
  if (v11)
    (*(void (**)(uint64_t, uint64_t, id))(v11 + 16))(v11, a2, v5);

}

- (void)deviceToDeviceEncryptionHelper:(id)a3 shouldContinueUpgradingUserToHSA2WithCompletion:(id)a4
{
  if (a4)
    (*((void (**)(id, uint64_t))a4 + 2))(a4, 1);
}

- (CDPUIDeviceToDeviceEncryptionHelper)encryptionHelper
{
  return self->_encryptionHelper;
}

- (void)setEncryptionHelper:(id)a3
{
  objc_storeStrong((id *)&self->_encryptionHelper, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_encryptionHelper, 0);
}

@end
