@implementation ASAccountAuthenticationModificationServiceViewController

- (void)upgradeCredentialToSignInWithApple:(id)a3 forServiceIdentifier:(id)a4 userInfo:(id)a5 extensionUUID:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  uint64_t v16;
  _QWORD v17[5];
  id v18;
  id v19;
  id v20;
  _QWORD v21[5];
  id v22;
  id v23;
  id v24;
  id v25;
  id location;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  self->_isPerformingAppInitiatedUpgrade = v14 == 0;
  objc_storeStrong((id *)&self->_existingCredential, a3);
  objc_storeStrong((id *)&self->_serviceIdentifierForUpgrade, a4);
  if (v14)
  {
    if (-[ASAccountAuthenticationModificationServiceViewController _ensureHostHasAccountModificationEntitlement](self, "_ensureHostHasAccountModificationEntitlement"))
    {
      objc_initWeak(&location, self);
      v15 = (void *)MEMORY[0x24BDD1550];
      v21[0] = MEMORY[0x24BDAC760];
      v21[1] = 3221225472;
      v21[2] = __139__ASAccountAuthenticationModificationServiceViewController_upgradeCredentialToSignInWithApple_forServiceIdentifier_userInfo_extensionUUID___block_invoke;
      v21[3] = &unk_24C9507F8;
      v21[4] = self;
      objc_copyWeak(&v25, &location);
      v22 = v11;
      v23 = v12;
      v24 = v13;
      objc_msgSend(v15, "extensionWithUUID:completion:", v14, v21);

      objc_destroyWeak(&v25);
      objc_destroyWeak(&location);
    }
  }
  else
  {
    v16 = *MEMORY[0x24BE83098];
    v17[0] = MEMORY[0x24BDAC760];
    v17[1] = 3221225472;
    v17[2] = __139__ASAccountAuthenticationModificationServiceViewController_upgradeCredentialToSignInWithApple_forServiceIdentifier_userInfo_extensionUUID___block_invoke_4;
    v17[3] = &unk_24C950840;
    v17[4] = self;
    v18 = v11;
    v19 = v12;
    v20 = v13;
    -[ASAccountAuthenticationModificationServiceViewController _findExtensionSupportingUpgrade:withCompletionHandler:](self, "_findExtensionSupportingUpgrade:withCompletionHandler:", v16, v17);

  }
}

void __139__ASAccountAuthenticationModificationServiceViewController_upgradeCredentialToSignInWithApple_forServiceIdentifier_userInfo_extensionUUID___block_invoke(id *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  char v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  uint64_t v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (v5
    && (objc_msgSend(v5, "extensionPointIdentifier"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v8 = objc_msgSend(v7, "isEqualToString:", *MEMORY[0x24BE83088]),
        v7,
        (v8 & 1) != 0))
  {
    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3221225472;
    v14[2] = __139__ASAccountAuthenticationModificationServiceViewController_upgradeCredentialToSignInWithApple_forServiceIdentifier_userInfo_extensionUUID___block_invoke_3;
    v14[3] = &unk_24C9507D0;
    objc_copyWeak(&v19, a1 + 8);
    v15 = a1[5];
    v16 = a1[6];
    v17 = a1[7];
    v18 = v5;
    dispatch_async(MEMORY[0x24BDAC9B8], v14);

    objc_destroyWeak(&v19);
  }
  else
  {
    if (v6)
    {
      v9 = v6;
    }
    else
    {
      v10 = (void *)MEMORY[0x24BDD1540];
      v11 = *MEMORY[0x24BDD0C08];
      v20 = *MEMORY[0x24BDD0FD8];
      v21[0] = CFSTR("Did not find a valid extension for request.");
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v21, &v20, 1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "errorWithDomain:code:userInfo:", v11, 0x7FFFFFFFFFFFFFFFLL, v12);
      v9 = (id)objc_claimAutoreleasedReturnValue();

    }
    objc_msgSend(a1[4], "_remoteViewControllerProxy");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "requestDidFailWithError:completion:", v9, &__block_literal_global_13);

  }
}

void __139__ASAccountAuthenticationModificationServiceViewController_upgradeCredentialToSignInWithApple_forServiceIdentifier_userInfo_extensionUUID___block_invoke_3(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  objc_msgSend(WeakRetained, "_upgradeCredentialToSignInWithApple:forServiceIdentifier:userInfo:extension:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));

}

void __139__ASAccountAuthenticationModificationServiceViewController_upgradeCredentialToSignInWithApple_forServiceIdentifier_userInfo_extensionUUID___block_invoke_4(_QWORD *a1, uint64_t a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x24BDAC8D0];
  v3 = (void *)a1[4];
  if (a2)
  {
    objc_msgSend(v3, "_upgradeCredentialToSignInWithApple:forServiceIdentifier:userInfo:extension:", a1[5], a1[6], a1[7], a2);
  }
  else
  {
    objc_msgSend(v3, "_remoteViewControllerProxy");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)MEMORY[0x24BDD1540];
    v8 = *MEMORY[0x24BDD0FD8];
    v9[0] = CFSTR("Did not find Account Authentication Modification extension.");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "errorWithDomain:code:userInfo:", CFSTR("ASExtensionErrorDomain"), 0, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "requestDidFailWithError:completion:", v7, &__block_literal_global_9);

  }
}

- (void)_upgradeCredentialToSignInWithApple:(id)a3 forServiceIdentifier:(id)a4 userInfo:(id)a5 extension:(id)a6
{
  id v10;
  id v11;
  id v12;
  _ASAccountAuthenticationModificationHostViewController *v13;
  _ASAccountAuthenticationModificationHostViewController *accountModificationHostViewController;
  id v15;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v15 = a3;
  v13 = -[_ASAccountAuthenticationModificationHostViewController initWithExtension:serviceIdentifier:]([_ASAccountAuthenticationModificationHostViewController alloc], "initWithExtension:serviceIdentifier:", v10, v12);

  accountModificationHostViewController = self->_accountModificationHostViewController;
  self->_accountModificationHostViewController = v13;

  -[_ASAccountAuthenticationModificationHostViewController setDelegate:](self->_accountModificationHostViewController, "setDelegate:", self);
  -[_ASAccountAuthenticationModificationHostViewController upgradeCredentialToSignInWithApple:userInfo:](self->_accountModificationHostViewController, "upgradeCredentialToSignInWithApple:userInfo:", v15, v11);

}

- (void)updateCredential:(id)a3 forServiceIdentifier:(id)a4 userInfo:(id)a5 extensionUUID:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  _QWORD v21[5];
  id v22;
  id v23;
  id v24;
  _QWORD v25[5];
  id v26;
  id v27;
  id v28;
  id v29;
  id location;
  const __CFString *v31;
  _QWORD v32[2];

  v32[1] = *MEMORY[0x24BDAC8D0];
  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  self->_isPerformingAppInitiatedUpgrade = v14 == 0;
  objc_storeStrong((id *)&self->_existingCredential, a3);
  objc_storeStrong((id *)&self->_serviceIdentifierForUpgrade, a4);
  if (v14)
  {
    if (-[ASAccountAuthenticationModificationServiceViewController _ensureHostHasAccountModificationEntitlement](self, "_ensureHostHasAccountModificationEntitlement"))
    {
      objc_initWeak(&location, self);
      v15 = (void *)MEMORY[0x24BDD1550];
      v25[0] = MEMORY[0x24BDAC760];
      v25[1] = 3221225472;
      v25[2] = __121__ASAccountAuthenticationModificationServiceViewController_updateCredential_forServiceIdentifier_userInfo_extensionUUID___block_invoke;
      v25[3] = &unk_24C9507F8;
      v25[4] = self;
      objc_copyWeak(&v29, &location);
      v26 = v11;
      v27 = v12;
      v28 = v13;
      objc_msgSend(v15, "extensionWithUUID:completion:", v14, v25);

      objc_destroyWeak(&v29);
      objc_destroyWeak(&location);
    }
  }
  else
  {
    if (!-[ASAccountAuthenticationModificationServiceViewController _isKeychainSyncEnabled](self, "_isKeychainSyncEnabled"))
    {
      v16 = (void *)MEMORY[0x24BDD1540];
      v31 = CFSTR("ASExtensionLocalizedFailureReasonErrorKey");
      v32[0] = CFSTR("iCloud Keychain must be enabled to perform strong password upgrades.");
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v32, &v31, 1);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD0C08], 0, v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      -[ASAccountAuthenticationModificationServiceViewController _remoteViewControllerProxy](self, "_remoteViewControllerProxy");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "requestDidFailWithError:completion:", v18, &__block_literal_global_15);

    }
    v20 = *MEMORY[0x24BE83090];
    v21[0] = MEMORY[0x24BDAC760];
    v21[1] = 3221225472;
    v21[2] = __121__ASAccountAuthenticationModificationServiceViewController_updateCredential_forServiceIdentifier_userInfo_extensionUUID___block_invoke_5;
    v21[3] = &unk_24C950840;
    v21[4] = self;
    v22 = v11;
    v23 = v12;
    v24 = v13;
    -[ASAccountAuthenticationModificationServiceViewController _findExtensionSupportingUpgrade:withCompletionHandler:](self, "_findExtensionSupportingUpgrade:withCompletionHandler:", v20, v21);

  }
}

void __121__ASAccountAuthenticationModificationServiceViewController_updateCredential_forServiceIdentifier_userInfo_extensionUUID___block_invoke(id *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  char v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  uint64_t v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (v5
    && (objc_msgSend(v5, "extensionPointIdentifier"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v8 = objc_msgSend(v7, "isEqualToString:", *MEMORY[0x24BE83088]),
        v7,
        (v8 & 1) != 0))
  {
    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3221225472;
    v14[2] = __121__ASAccountAuthenticationModificationServiceViewController_updateCredential_forServiceIdentifier_userInfo_extensionUUID___block_invoke_3;
    v14[3] = &unk_24C9507D0;
    objc_copyWeak(&v19, a1 + 8);
    v15 = a1[5];
    v16 = a1[6];
    v17 = a1[7];
    v18 = v5;
    dispatch_async(MEMORY[0x24BDAC9B8], v14);

    objc_destroyWeak(&v19);
  }
  else
  {
    if (v6)
    {
      v9 = v6;
    }
    else
    {
      v10 = (void *)MEMORY[0x24BDD1540];
      v11 = *MEMORY[0x24BDD0C08];
      v20 = *MEMORY[0x24BDD0FD8];
      v21[0] = CFSTR("Did not find a valid extension for request.");
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v21, &v20, 1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "errorWithDomain:code:userInfo:", v11, 0x7FFFFFFFFFFFFFFFLL, v12);
      v9 = (id)objc_claimAutoreleasedReturnValue();

    }
    objc_msgSend(a1[4], "_remoteViewControllerProxy");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "requestDidFailWithError:completion:", v9, &__block_literal_global_12);

  }
}

void __121__ASAccountAuthenticationModificationServiceViewController_updateCredential_forServiceIdentifier_userInfo_extensionUUID___block_invoke_3(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  objc_msgSend(WeakRetained, "_updateCredential:forServiceIdentifier:userInfo:extension:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));

}

void __121__ASAccountAuthenticationModificationServiceViewController_updateCredential_forServiceIdentifier_userInfo_extensionUUID___block_invoke_5(_QWORD *a1, uint64_t a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x24BDAC8D0];
  v3 = (void *)a1[4];
  if (a2)
  {
    objc_msgSend(v3, "_updateCredential:forServiceIdentifier:userInfo:extension:", a1[5], a1[6], a1[7], a2);
  }
  else
  {
    objc_msgSend(v3, "_remoteViewControllerProxy");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)MEMORY[0x24BDD1540];
    v8 = *MEMORY[0x24BDD0FD8];
    v9[0] = CFSTR("Did not find Account Authentication Modification extension.");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "errorWithDomain:code:userInfo:", CFSTR("ASExtensionErrorDomain"), 0, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "requestDidFailWithError:completion:", v7, &__block_literal_global_16);

  }
}

- (void)_updateCredential:(id)a3 forServiceIdentifier:(id)a4 userInfo:(id)a5 extension:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _ASAccountAuthenticationModificationHostViewController *v19;
  _ASAccountAuthenticationModificationHostViewController *accountModificationHostViewController;
  id v21;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  objc_msgSend(v10, "attributes");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "safari_stringForKey:", *MEMORY[0x24BE830A0]);
  v21 = (id)objc_claimAutoreleasedReturnValue();

  if (v21)
  {
    objc_msgSend(MEMORY[0x24BE82D40], "parsePasswordRules:error:", v21, 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BE82D20], "requirementsForPasswordRuleSet:respectingMinLength:maxLength:", v15, 0, 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v16 = 0;
  }
  v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE82D20]), "initWithPasswordRequirementsByDomain:", 0);
  objc_msgSend(v17, "generatedPasswordMatchingRequirements:", v16);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = -[_ASAccountAuthenticationModificationHostViewController initWithExtension:serviceIdentifier:]([_ASAccountAuthenticationModificationHostViewController alloc], "initWithExtension:serviceIdentifier:", v10, v12);

  accountModificationHostViewController = self->_accountModificationHostViewController;
  self->_accountModificationHostViewController = v19;

  -[_ASAccountAuthenticationModificationHostViewController setDelegate:](self->_accountModificationHostViewController, "setDelegate:", self);
  -[_ASAccountAuthenticationModificationHostViewController updateCredential:withNewPassword:userInfo:](self->_accountModificationHostViewController, "updateCredential:withNewPassword:userInfo:", v13, v18, v11);

}

- (void)_findExtensionSupportingUpgrade:(id)a3 withCompletionHandler:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD);
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  char v21;
  void (*v22)(id, void *);
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  id v35;
  id v36;
  char v37[32];
  uint64_t v38;
  void *v39;
  uint64_t v40;
  const __CFString *v41;
  _QWORD v42[2];
  _QWORD v43[4];

  v43[2] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (void (**)(id, _QWORD))a4;
  v8 = (void *)MEMORY[0x24BDC1558];
  -[ASAccountAuthenticationModificationServiceViewController _hostAuditToken](self, "_hostAuditToken");
  v36 = 0;
  objc_msgSend(v8, "bundleRecordForAuditToken:error:", v37, &v36);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v36;
  objc_msgSend(v9, "URL");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "path");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    v13 = WBS_LOG_CHANNEL_PREFIXAccountAuthenticationModificationExtension();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      -[ASAccountAuthenticationModificationServiceViewController _findExtensionSupportingUpgrade:withCompletionHandler:].cold.1(v13, v10);
    v7[2](v7, 0);
  }
  else
  {
    v14 = *MEMORY[0x24BE83088];
    v15 = *MEMORY[0x24BDD0C00];
    v42[0] = *MEMORY[0x24BDD0C48];
    v42[1] = v15;
    v43[0] = v14;
    v43[1] = v12;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v43, v42, 2);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = 0;
    objc_msgSend(MEMORY[0x24BDD1550], "extensionsWithMatchingAttributes:error:", v16, &v35);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v35;
    objc_msgSend(v17, "firstObject");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (v19)
    {
      objc_msgSend(v19, "attributes");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v20, "safari_BOOLForKey:", v6);

      v22 = (void (*)(id, void *))v7[2];
      if ((v21 & 1) != 0)
      {
        v22(v7, v19);
      }
      else
      {
        v22(v7, 0);
        -[ASAccountAuthenticationModificationServiceViewController _remoteViewControllerProxy](self, "_remoteViewControllerProxy");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = (void *)MEMORY[0x24BDD1540];
        v34 = v18;
        v38 = *MEMORY[0x24BDD0FD8];
        v27 = (void *)MEMORY[0x24BDD17C8];
        objc_msgSend(v19, "identifier");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "stringWithFormat:", CFSTR("Discovered extension %@ does not support strong password upgrades."), v32);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v39 = v28;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v39, &v38, 1);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "errorWithDomain:code:userInfo:", CFSTR("ASExtensionErrorDomain"), 0, v29);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "requestDidFailWithError:completion:", v30, &__block_literal_global_24);

        v18 = v34;
      }
    }
    else
    {
      v7[2](v7, 0);
      -[ASAccountAuthenticationModificationServiceViewController _remoteViewControllerProxy](self, "_remoteViewControllerProxy");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = (void *)MEMORY[0x24BDD1540];
      v40 = *MEMORY[0x24BDD0FD8];
      v41 = CFSTR("Did not find Account Authentication Modification extension.");
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v41, &v40, 1);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "errorWithDomain:code:userInfo:", CFSTR("ASExtensionErrorDomain"), 0, v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "requestDidFailWithError:completion:", v25, &__block_literal_global_20);

    }
  }

}

- (BOOL)_ensureHostHasAccountModificationEntitlement
{
  char HasEntitlement;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x24BDAC8D0];
  -[ASAccountAuthenticationModificationServiceViewController _hostAuditToken](self, "_hostAuditToken");
  HasEntitlement = WBSAuditTokenHasEntitlement();
  if ((HasEntitlement & 1) == 0)
  {
    v4 = WBS_LOG_CHANNEL_PREFIXAccountAuthenticationModificationExtension();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      -[ASAccountAuthenticationModificationServiceViewController _ensureHostHasAccountModificationEntitlement].cold.1(v4, v5, v6, v7, v8, v9, v10, v11);
    -[ASAccountAuthenticationModificationServiceViewController _remoteViewControllerProxy](self, "_remoteViewControllerProxy");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)MEMORY[0x24BDD1540];
    v14 = *MEMORY[0x24BDD0B88];
    v18 = *MEMORY[0x24BDD0FD8];
    v19[0] = CFSTR("Calling process is not entitled");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v19, &v18, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "errorWithDomain:code:userInfo:", v14, 4099, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "requestDidFailWithError:completion:", v16, &__block_literal_global_27_0);

  }
  return HasEntitlement;
}

- (void)_deleteExistingKeychainCredentialIfPossible
{
  OUTLINED_FUNCTION_0_2(&dword_20E4D9000, a1, a3, "Deleted credential from Keychain after upgrading to Sign in with Apple.", a5, a6, a7, a8, 0);
}

- (void)_updateKeychainWithNewCredential:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  ASAccountAuthenticationModificationServiceViewController *v17;
  unint64_t v18;
  void *v19;
  void *v20;
  int v21;
  id v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  v30 = a3;
  -[ASCredentialServiceIdentifier identifier](self->_serviceIdentifierForUpgrade, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "safari_highLevelDomainFromHost");
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  objc_msgSend(MEMORY[0x24BE82DD8], "sharedStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "savedAccountsWithPasswords");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v34;
    v10 = 0x254A24000uLL;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v34 != v9)
          objc_enumerationMutation(v6);
        v12 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);
        objc_msgSend(*(id *)((char *)&self->super.super.super.isa + *(int *)(v10 + 2156)), "user");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "user");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v13, "isEqualToString:", v14) & 1) != 0)
        {
          v31 = v12;
          objc_msgSend(v12, "highLevelDomain");
          v15 = v8;
          v16 = v9;
          v17 = self;
          v18 = v10;
          v19 = v6;
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = objc_msgSend(v32, "isEqualToString:", v20);

          v6 = v19;
          v10 = v18;
          self = v17;
          v9 = v16;
          v8 = v15;

          if (v21)
          {
            objc_msgSend(MEMORY[0x24BE82DD8], "sharedStore");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            v26 = v30;
            objc_msgSend(v30, "user");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v30, "password");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v25, "changeSavedAccount:toUser:password:", v31, v27, v28);
            v29 = v32;
            goto LABEL_13;
          }
        }
        else
        {

        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
    }
    while (v8);
  }

  v22 = objc_alloc(MEMORY[0x24BDD1828]);
  -[ASCredentialServiceIdentifier identifier](self->_serviceIdentifierForUpgrade, "identifier");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v22, "initWithHost:port:protocol:realm:authenticationMethod:", v23, 0, &stru_24C955390, 0, *MEMORY[0x24BDD12E0]);

  objc_msgSend(MEMORY[0x24BE82DD8], "sharedStore");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = v30;
  objc_msgSend(v30, "user");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "password");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = v32;
  v24 = (id)objc_msgSend(v25, "saveUser:password:forProtectionSpace:highLevelDomain:groupID:", v27, v28, v6, v32, &stru_24C955390);
LABEL_13:

}

- (BOOL)_isKeychainSyncEnabled
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x24BE82CF0], "sharedMonitor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isKeychainSyncEnabled");

  return v3;
}

- (void)accountModificationHostViewControllerDidCompleteUpgradeToSignInWithApple:(id)a3 userInfo:(id)a4 completion:(id)a5
{
  id v7;
  void *v8;
  id v9;

  v9 = a4;
  v7 = a5;
  if (self->_isPerformingAppInitiatedUpgrade)
    -[ASAccountAuthenticationModificationServiceViewController _deleteExistingKeychainCredentialIfPossible](self, "_deleteExistingKeychainCredentialIfPossible");
  -[ASAccountAuthenticationModificationServiceViewController _remoteViewControllerProxy](self, "_remoteViewControllerProxy");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "requestToUpgradeToSignInWithAppleDidFinishWithUserInfo:completion:", v9, v7);

}

- (void)accountModificationHostViewController:(id)a3 didFinishWithCredential:(id)a4 userInfo:(id)a5 completion:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;

  v9 = a6;
  v10 = a5;
  v11 = a4;
  -[ASAccountAuthenticationModificationServiceViewController _updateKeychainWithNewCredential:](self, "_updateKeychainWithNewCredential:", v11);
  -[ASAccountAuthenticationModificationServiceViewController _remoteViewControllerProxy](self, "_remoteViewControllerProxy");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "requestDidFinishWithCredential:userInfo:completion:", v11, v10, v9);

}

- (void)presentUIForAccountModificationHostViewController:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BEBD7A0]), "initWithRootViewController:", self->_accountModificationHostViewController);
  -[ASAccountAuthenticationModificationServiceViewController addChildViewController:](self, "addChildViewController:", v7);
  -[ASAccountAuthenticationModificationServiceViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addSubview:", v5);
  objc_msgSend(v4, "bounds");
  objc_msgSend(v5, "setFrame:");
  objc_msgSend(v5, "setAutoresizingMask:", 18);
  objc_msgSend(v7, "didMoveToParentViewController:", self);
  -[ASAccountAuthenticationModificationServiceViewController _remoteViewControllerProxy](self, "_remoteViewControllerProxy");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "presentAccountModificationRemoteViewController");

}

- (void)dismissUIForAccountModificationHostViewController:(id)a3
{
  id v3;

  -[ASAccountAuthenticationModificationServiceViewController _remoteViewControllerProxy](self, "_remoteViewControllerProxy", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dismissAccountModificationRemoteViewController");

}

- (void)accountModificationHostViewController:(id)a3 requestCanceledWithError:(id)a4 completion:(id)a5
{
  id v7;
  id v8;
  id v9;

  v7 = a5;
  v8 = a4;
  -[ASAccountAuthenticationModificationServiceViewController _remoteViewControllerProxy](self, "_remoteViewControllerProxy");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "requestDidFailWithError:completion:", v8, v7);

}

+ (id)_exportedInterface
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_254A42110);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v3, sel_updateCredential_forServiceIdentifier_userInfo_extensionUUID_, 0, 0);

  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v4, sel_updateCredential_forServiceIdentifier_userInfo_extensionUUID_, 1, 0);

  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v5, sel_updateCredential_forServiceIdentifier_userInfo_extensionUUID_, 3, 0);

  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v6, sel_upgradeCredentialToSignInWithApple_forServiceIdentifier_userInfo_extensionUUID_, 0, 0);

  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", objc_opt_class());
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v7, sel_upgradeCredentialToSignInWithApple_forServiceIdentifier_userInfo_extensionUUID_, 1, 0);

  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", objc_opt_class());
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v8, sel_upgradeCredentialToSignInWithApple_forServiceIdentifier_userInfo_extensionUUID_, 3, 0);

  return v2;
}

+ (id)_remoteViewControllerInterface
{
  return +[_ASAccountAuthenticationModificationRemoteViewController exportedInterface](_ASAccountAuthenticationModificationRemoteViewController, "exportedInterface");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceIdentifierForUpgrade, 0);
  objc_storeStrong((id *)&self->_existingCredential, 0);
  objc_storeStrong((id *)&self->_accountModificationHostViewController, 0);
}

- (void)_findExtensionSupportingUpgrade:(void *)a1 withCompletionHandler:(void *)a2 .cold.1(void *a1, void *a2)
{
  NSObject *v3;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = a1;
  objc_msgSend(a2, "safari_privacyPreservingDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138543362;
  v6 = v4;
  _os_log_error_impl(&dword_20E4D9000, v3, OS_LOG_TYPE_ERROR, "Failed to get bundle record for host application due to error: %{public}@", (uint8_t *)&v5, 0xCu);

}

- (void)_ensureHostHasAccountModificationEntitlement
{
  OUTLINED_FUNCTION_0_2(&dword_20E4D9000, a1, a3, "The caller is not entitled to coordinate account authentication modification extension requests", a5, a6, a7, a8, 0);
}

@end
