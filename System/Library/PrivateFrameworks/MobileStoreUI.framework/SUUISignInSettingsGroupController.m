@implementation SUUISignInSettingsGroupController

- (BOOL)isAuthenticating
{
  return self->_authenticating;
}

- (void)returnInSettingDescription:(id)a3
{
  id v4;

  -[SUUISignInSettingsGroupController _keyForSettingDescription:](self, "_keyForSettingDescription:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("accountName")))
  {
    -[SUUISignInSettingsGroupController _becomeFirstResponderWithKey:](self, "_becomeFirstResponderWithKey:", CFSTR("password"));
  }
  else
  {
    -[SUUISignInSettingsGroupController _resignFirstResponder](self, "_resignFirstResponder");
    if (self->_valid)
      -[SUUISignInSettingsGroupController _attemptSignInWithAccountName:password:](self, "_attemptSignInWithAccountName:password:", self->_accountName, self->_password);
  }

}

- (void)setValue:(id)a3 forSettingDescription:(id)a4
{
  void *v6;
  id v7;

  v7 = a3;
  -[SUUISignInSettingsGroupController _keyForSettingDescription:](self, "_keyForSettingDescription:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    -[SUUISignInSettingsGroupController setValue:forKey:](self, "setValue:forKey:", v7, v6);
  -[SUUISignInSettingsGroupController _updateValidation](self, "_updateValidation");

}

- (void)submitSettingDescription:(id)a3
{
  int v4;
  void *v5;
  id v6;
  void *v7;
  id v8;

  v8 = a3;
  -[SUUISignInSettingsGroupController _resignFirstResponder](self, "_resignFirstResponder");
  v4 = objc_msgSend(v8, "isMemberOfClass:", objc_opt_class());
  v5 = v8;
  if (v4)
  {
    v6 = v8;
    v7 = v6;
    if (self->_valid && objc_msgSend(v6, "fieldType") == 1)
      -[SUUISignInSettingsGroupController _attemptSignInWithAccountName:password:](self, "_attemptSignInWithAccountName:password:", self->_accountName, self->_password);

    v5 = v8;
  }

}

- (id)valueForSettingDescription:(id)a3
{
  void *v4;
  void *v5;

  -[SUUISignInSettingsGroupController _keyForSettingDescription:](self, "_keyForSettingDescription:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[SUUISignInSettingsGroupController valueForKey:](self, "valueForKey:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)_attemptSignInWithAccountName:(id)a3 password:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id location;

  v6 = a3;
  v7 = a4;
  -[SUUISignInSettingsGroupController _updateFieldsAuthenticating:](self, "_updateFieldsAuthenticating:", 1);
  v8 = objc_alloc_init(MEMORY[0x24BE0ACC0]);
  v9 = objc_alloc_init(MEMORY[0x24BE0AE28]);
  objc_msgSend(v9, "setServiceType:", 2);
  objc_msgSend(v9, "setUsername:", v6);
  objc_msgSend(v9, "_setPassword:", v7);
  objc_msgSend(v9, "setIsUsernameEditable:", 0);
  objc_msgSend(v9, "setShouldAllowAppleIDCreation:", 0);
  -[SUUISettingsGroupController delegate](self, "delegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "owningViewControllerForSettingsGroupController:", self);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setPresentingViewController:", v11);

  objc_initWeak(&location, self);
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __76__SUUISignInSettingsGroupController__attemptSignInWithAccountName_password___block_invoke;
  v13[3] = &unk_2511F5150;
  objc_copyWeak(&v15, &location);
  v12 = v6;
  v14 = v12;
  objc_msgSend(v8, "authenticateWithContext:completion:", v9, v13);

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);

}

void __76__SUUISignInSettingsGroupController__attemptSignInWithAccountName_password___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  id v13;
  id v14;

  v5 = a2;
  v6 = a3;
  if (v6)
  {
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __76__SUUISignInSettingsGroupController__attemptSignInWithAccountName_password___block_invoke_5;
    v7[3] = &unk_2511F5128;
    objc_copyWeak(&v10, (id *)(a1 + 40));
    v8 = *(id *)(a1 + 32);
    v9 = v6;
    dispatch_async(MEMORY[0x24BDAC9B8], v7);

    objc_destroyWeak(&v10);
  }
  else
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __76__SUUISignInSettingsGroupController__attemptSignInWithAccountName_password___block_invoke_2;
    block[3] = &unk_2511F5100;
    v12 = v5;
    objc_copyWeak(&v14, (id *)(a1 + 40));
    v13 = *(id *)(a1 + 32);
    dispatch_sync(MEMORY[0x24BDAC9B8], block);

    objc_destroyWeak(&v14);
  }

}

void __76__SUUISignInSettingsGroupController__attemptSignInWithAccountName_password___block_invoke_2(id *a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v7[4];
  id v8;
  id v9;

  objc_msgSend(MEMORY[0x24BEB1F28], "contextForSignIn");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1[4], "objectForKey:", *MEMORY[0x24BE0ABF0]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setAccountName:", v3);

  objc_msgSend(a1[4], "objectForKey:", *MEMORY[0x24BE0ABD0]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setInitialPassword:", v4);

  objc_msgSend(a1[4], "objectForKey:", *MEMORY[0x24BE0AB48]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setAltDSID:", v5);

  objc_msgSend(v2, "setAllowsRetry:", 0);
  objc_msgSend(v2, "setCanSetActiveAccount:", 1);
  objc_msgSend(v2, "setPromptStyle:", 0);
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEB1DB8]), "initWithAuthenticationContext:", v2);
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __76__SUUISignInSettingsGroupController__attemptSignInWithAccountName_password___block_invoke_3;
  v7[3] = &unk_2511F50D8;
  objc_copyWeak(&v9, a1 + 6);
  v8 = a1[5];
  objc_msgSend(v6, "startWithAuthenticateResponseBlock:", v7);

  objc_destroyWeak(&v9);
}

void __76__SUUISignInSettingsGroupController__attemptSignInWithAccountName_password___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  id v12;
  id v13;

  v5 = a2;
  v6 = a3;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __76__SUUISignInSettingsGroupController__attemptSignInWithAccountName_password___block_invoke_4;
  v9[3] = &unk_2511F50B0;
  v10 = v5;
  v11 = v6;
  v7 = v6;
  v8 = v5;
  objc_copyWeak(&v13, (id *)(a1 + 40));
  v12 = *(id *)(a1 + 32);
  dispatch_async(MEMORY[0x24BDAC9B8], v9);

  objc_destroyWeak(&v13);
}

void __76__SUUISignInSettingsGroupController__attemptSignInWithAccountName_password___block_invoke_4(uint64_t a1)
{
  uint64_t v2;
  id WeakRetained;
  void *v4;
  id v5;

  v2 = *(_QWORD *)(a1 + 40);
  if (*(_QWORD *)(a1 + 32))
  {
    if (!v2)
    {
      WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
      objc_msgSend(*(id *)(a1 + 32), "authenticatedAccount");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained, "_signInSuccess:", v4);

LABEL_6:
      goto LABEL_7;
    }
LABEL_5:
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
    objc_msgSend(WeakRetained, "_signInFailed:error:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40));
    goto LABEL_6;
  }
  if (v2)
    goto LABEL_5;
LABEL_7:
  v5 = objc_loadWeakRetained((id *)(a1 + 56));
  objc_msgSend(v5, "_updateFieldsAuthenticating:", 0);

}

void __76__SUUISignInSettingsGroupController__attemptSignInWithAccountName_password___block_invoke_5(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  id v4;

  v2 = (id *)(a1 + 48);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "_signInFailed:error:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

  v4 = objc_loadWeakRetained(v2);
  objc_msgSend(v4, "_updateFieldsAuthenticating:", 0);

}

- (void)_updateFieldsAuthenticating:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _BOOL8 v9;
  uint64_t i;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  if (self->_authenticating != a3)
  {
    v3 = a3;
    self->_authenticating = a3;
    v12 = 0u;
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    -[SUUISettingsGroupController settingDescriptions](self, "settingDescriptions", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v13;
      v9 = !v3;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v13 != v8)
            objc_enumerationMutation(v5);
          -[SUUISettingsGroupController _viewForSettingDescription:](self, "_viewForSettingDescription:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * i));
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            objc_msgSend(v11, "setEnabled:", v9);

        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v7);
    }

  }
}

- (void)_becomeFirstResponderWithKey:(id)a3
{
  void *v4;
  id v5;

  -[SUUISignInSettingsGroupController _settingDescriptionForKey:](self, "_settingDescriptionForKey:", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[SUUISettingsGroupController _viewForSettingDescription:](self, "_viewForSettingDescription:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    objc_msgSend(v4, "beginEdits");

}

- (id)_keyForSettingDescription:(id)a3
{
  id v4;
  __CFString *v5;
  NSMapTable *v6;
  NSMapTable *keyMapping;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;

  v4 = a3;
  -[NSMapTable objectForKey:](self->_keyMapping, "objectForKey:", v4);
  v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    if (!self->_keyMapping)
    {
      v6 = (NSMapTable *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1650]), "initWithKeyOptions:valueOptions:capacity:", 517, 0, 0);
      keyMapping = self->_keyMapping;
      self->_keyMapping = v6;

    }
    if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    {
      v8 = v4;
      v9 = objc_msgSend(v8, "fieldType");
      if (v9)
      {
        if (v9 == 1)
        {
          v5 = CFSTR("valid");
LABEL_13:

          -[NSMapTable setObject:forKey:](self->_keyMapping, "setObject:forKey:", v5, v8);
          goto LABEL_17;
        }
      }
      else
      {
        objc_msgSend(v8, "viewElement");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "textInputViewElement");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = v11;
        if (v11)
        {
          if (objc_msgSend(v11, "isSecure"))
            v5 = CFSTR("password");
          else
            v5 = CFSTR("accountName");

          goto LABEL_13;
        }

      }
    }
    v5 = 0;
  }
LABEL_17:

  return v5;
}

- (void)_resignFirstResponder
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  -[SUUISettingsGroupController settingDescriptions](self, "settingDescriptions", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        -[SUUISettingsGroupController _viewForSettingDescription:](self, "_viewForSettingDescription:", *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v7));
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v8, "isMemberOfClass:", objc_opt_class()))
          objc_msgSend(v8, "commitEdits");

        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

}

- (id)_settingDescriptionForKey:(id)a3
{
  id v4;
  NSMapTable *keyMapping;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  uint64_t v15;
  void *i;
  void *v17;
  void *v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  keyMapping = self->_keyMapping;
  if (keyMapping)
  {
    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    -[NSMapTable keyEnumerator](keyMapping, "keyEnumerator");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v25;
LABEL_4:
      v10 = 0;
      while (1)
      {
        if (*(_QWORD *)v25 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * v10);
        -[NSMapTable objectForKey:](self->_keyMapping, "objectForKey:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v4, "isEqualToString:", v12) & 1) != 0)
          break;

        if (v8 == ++v10)
        {
          v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
          if (v8)
            goto LABEL_4;
          goto LABEL_10;
        }
      }
      v13 = v11;

      if (v13)
        goto LABEL_23;
    }
    else
    {
LABEL_10:

    }
  }
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  -[SUUISettingsGroupController settingDescriptions](self, "settingDescriptions", 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (id)objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
  if (v13)
  {
    v15 = *(_QWORD *)v21;
    while (2)
    {
      for (i = 0; i != v13; i = (char *)i + 1)
      {
        if (*(_QWORD *)v21 != v15)
          objc_enumerationMutation(v14);
        v17 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)i);
        -[SUUISignInSettingsGroupController _keyForSettingDescription:](self, "_keyForSettingDescription:", 0);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v4, "isEqualToString:", v18))
        {
          v13 = v17;

          goto LABEL_22;
        }

      }
      v13 = (id)objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
      if (v13)
        continue;
      break;
    }
  }
LABEL_22:

LABEL_23:
  return v13;
}

- (void)_signInFailed:(id)a3 error:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
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
  id v23;

  v23 = a3;
  v6 = a4;
  -[SUUISettingsGroupController delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "owningViewControllerForSettingsGroupController:", self);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v9 = v8;
    objc_msgSend(v9, "clientContext");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    v12 = (void *)MEMORY[0x24BEBD3B0];
    if (v10)
      objc_msgSend(v10, "localizedStringForKey:", CFSTR("CANNOT_LOGIN_TITLE"));
    else
      +[SUUIClientContext localizedStringForKey:inBundles:](SUUIClientContext, "localizedStringForKey:inBundles:", CFSTR("CANNOT_LOGIN_TITLE"), 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "localizedDescription");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "alertControllerWithTitle:message:preferredStyle:", v13, v14, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v16 = (void *)MEMORY[0x24BEBD3A8];
    if (v11)
      objc_msgSend(v11, "localizedStringForKey:", CFSTR("OK"));
    else
      +[SUUIClientContext localizedStringForKey:inBundles:](SUUIClientContext, "localizedStringForKey:inBundles:", CFSTR("OK"), 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "actionWithTitle:style:handler:", v17, 0, 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addAction:", v18);

    objc_msgSend(v9, "presentViewController:animated:completion:", v15, 1, 0);
  }
  -[SUUISettingsGroupController settingsGroupDescription](self, "settingsGroupDescription");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (v19)
  {
    objc_msgSend(v6, "description");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "viewElement");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE70]), "initWithObjectsAndKeys:", CFSTR("failed"), CFSTR("result"), v23, CFSTR("accountName"), v20, CFSTR("reason"), 0);
    objc_msgSend(v21, "dispatchEventOfType:canBubble:isCancelable:extraInfo:completionBlock:", 15, 1, 1, v22, 0);

  }
}

- (void)_signInSuccess:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  -[SUUISettingsGroupController settingsGroupDescription](self, "settingsGroupDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "viewElement");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_alloc(MEMORY[0x24BDBCE70]);
    objc_msgSend(v10, "accountName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v7, "initWithObjectsAndKeys:", CFSTR("success"), CFSTR("result"), v8, CFSTR("accountName"), 0);

    objc_msgSend(v6, "dispatchEventOfType:canBubble:isCancelable:extraInfo:completionBlock:", 15, 1, 1, v9, 0);
  }

}

- (id)_submitSettingDescription
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[SUUISettingsGroupController settingDescriptions](self, "settingDescriptions", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v11;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v11 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * v6);
        if (objc_msgSend(v7, "isMemberOfClass:", objc_opt_class()))
        {
          v8 = v7;
          if (objc_msgSend(v8, "fieldType") == 1)
            goto LABEL_12;

        }
        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v4);
  }
  v8 = 0;
LABEL_12:

  return v8;
}

- (void)_updateValidation
{
  BOOL v3;
  id v4;

  if (-[NSString length](self->_accountName, "length"))
    v3 = -[NSString length](self->_password, "length") != 0;
  else
    v3 = 0;
  self->_valid = v3;
  -[SUUISignInSettingsGroupController _submitSettingDescription](self, "_submitSettingDescription");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[SUUISettingsGroupController _reloadSettingDescription:](self, "_reloadSettingDescription:", v4);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_password, 0);
  objc_storeStrong((id *)&self->_keyMapping, 0);
  objc_storeStrong((id *)&self->_accountName, 0);
}

@end
