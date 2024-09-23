@implementation CNFRegDisabledController

- (id)specifierList
{
  void *v3;
  uint64_t v4;
  PSSpecifier *turnOnButton;
  PSSpecifier *spinner;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  int v14;
  PSSpecifier *v15;
  void *v16;
  void *v17;
  int v18;
  objc_class *v19;
  int v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v3 = *(Class *)((char *)&self->super.super.super.super.super.super.super.isa + (int)*MEMORY[0x24BE756E0]);
  if (v3)
    return v3;
  v26 = (int)*MEMORY[0x24BE756E0];
  v4 = 1488;
  turnOnButton = self->_turnOnButton;
  self->_turnOnButton = 0;

  spinner = self->_spinner;
  self->_spinner = 0;

  CNFRegLoadSpecifiersFromPlist(self, CFSTR("CNFRegDisabled"), self);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
  if (!v8)
    goto LABEL_17;
  v9 = v8;
  v10 = *(_QWORD *)v30;
  v27 = *MEMORY[0x24BE75D50];
  v28 = v7;
  do
  {
    for (i = 0; i != v9; ++i)
    {
      if (*(_QWORD *)v30 != v10)
        objc_enumerationMutation(v7);
      v12 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
      objc_msgSend(v12, "identifier");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "isEqual:", CFSTR("FACETIME_DISABLED_SPINNER_ID"));

      if (v14)
      {
        v15 = v12;
        v16 = self->_spinner;
        self->_spinner = v15;
      }
      else
      {
        objc_msgSend(v12, "identifier");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v17, "isEqual:", CFSTR("FACETIME_DISABLED_TURN_ON_ID"));

        if (v18)
        {
          v19 = v12;
          v16 = *(Class *)((char *)&self->super.super.super.super.super.super.super.isa + v4);
          *(Class *)((char *)&self->super.super.super.super.super.super.super.isa + v4) = v19;
        }
        else
        {
          objc_msgSend(v12, "identifier");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v16, "isEqualToString:", CFSTR("FACETIME_ACCOUNT_ID")))
          {
            v20 = _os_feature_enabled_impl();

            if (!v20)
              continue;
            CommunicationsSetupUIBundle();
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            CNFRegStringTableName();
            v22 = v4;
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "localizedStringForKey:value:table:", CFSTR("\"FACETIME_SETTINGS_ACCOUNT_LABEL_APPLEACCOUNT\"), &stru_24D077260, v23);
            v16 = (void *)objc_claimAutoreleasedReturnValue();

            v4 = v22;
            v7 = v28;

            objc_msgSend(v12, "setProperty:forKey:", v16, v27);
            objc_msgSend(v12, "setName:", v16);
          }
        }
      }

    }
    v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
  }
  while (v9);
LABEL_17:
  if (self->_spinner)
    objc_msgSend(v7, "removeObjectAtIndex:", objc_msgSend(v7, "indexOfObject:"));
  v24 = *(Class *)((char *)&self->super.super.super.super.super.super.super.isa + v26);
  *(Class *)((char *)&self->super.super.super.super.super.super.super.isa + v26) = (Class)v7;

  v3 = *(Class *)((char *)&self->super.super.super.super.super.super.super.isa + v26);
  return v3;
}

- (id)_rightButtonItem
{
  return 0;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CNFRegDisabledController;
  -[CNFRegDisabledController tableView:cellForRowAtIndexPath:](&v6, sel_tableView_cellForRowAtIndexPath_, a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v4, "setSelectionStyle:", 1);
  return v4;
}

- (void)_activateSpinner
{
  void *v3;
  id v4;

  if (self->_spinner && self->_turnOnButton)
  {
    if (-[CNFRegDisabledController containsSpecifier:](self, "containsSpecifier:"))
    {
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObject:", self->_turnOnButton);
      v4 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObject:", self->_spinner);
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNFRegDisabledController replaceContiguousSpecifiers:withSpecifiers:animated:](self, "replaceContiguousSpecifiers:withSpecifiers:animated:", v4, v3, 1);

    }
  }
}

- (void)_deactivateSpinner
{
  void *v3;
  id v4;

  if (self->_turnOnButton && self->_spinner)
  {
    if (-[CNFRegDisabledController containsSpecifier:](self, "containsSpecifier:"))
    {
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObject:", self->_spinner);
      v4 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObject:", self->_turnOnButton);
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNFRegDisabledController replaceContiguousSpecifiers:withSpecifiers:animated:](self, "replaceContiguousSpecifiers:withSpecifiers:animated:", v4, v3, 1);

    }
  }
}

- (void)turnOnTapped:(id)a3
{
  id v4;

  -[CNFRegDisabledController _setupAccountHandlersForDisabledOperation](self, "_setupAccountHandlersForDisabledOperation", a3);
  -[CNFRegDisabledController _activateSpinner](self, "_activateSpinner");
  -[CNFRegListController regController](self, "regController");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "activateAccounts");

}

- (void)_setupAccountHandlersForDisabledOperation
{
  void *v3;
  _QWORD v4[5];
  id v5;
  id location;

  -[CNFRegListController regController](self, "regController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeAllHandlers");
  objc_initWeak(&location, v3);
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __69__CNFRegDisabledController__setupAccountHandlersForDisabledOperation__block_invoke;
  v4[3] = &unk_24D0762F0;
  objc_copyWeak(&v5, &location);
  v4[4] = self;
  objc_msgSend(v3, "setAccountRegistrationBlock:", v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);

}

void __69__CNFRegDisabledController__setupAccountHandlersForDisabledOperation__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id WeakRetained;
  id v7;
  uint64_t v8;
  id v9;
  CNFRegSignInController *v10;
  id v11;
  CNFRegSignInController *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;

  v28 = a2;
  v5 = a3;
  if (objc_msgSend(v28, "CNFRegSignInComplete"))
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    objc_msgSend(WeakRetained, "setServiceEnabled:", 1);

    v7 = objc_loadWeakRetained((id *)(a1 + 40));
    v8 = objc_msgSend(v7, "accountState");

    objc_msgSend(*(id *)(a1 + 32), "dismissWithState:", v8);
    objc_msgSend(*(id *)(a1 + 32), "_deactivateSpinner");
  }
  else if (objc_msgSend(v28, "CNFRegSignInFailed"))
  {
    v9 = objc_loadWeakRetained((id *)(a1 + 40));
    objc_msgSend(v9, "setServiceEnabled:", 1);

    v10 = [CNFRegSignInController alloc];
    v11 = objc_loadWeakRetained((id *)(a1 + 40));
    v12 = -[CNFRegFirstRunController initWithRegController:](v10, "initWithRegController:", v11);

    objc_msgSend(*(id *)(a1 + 32), "rootController");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNFRegSignInController setRootController:](v12, "setRootController:", v13);

    objc_msgSend(*(id *)(a1 + 32), "rootController");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNFRegSignInController setParentController:](v12, "setParentController:", v14);

    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNFRegFirstRunController setDelegate:](v12, "setDelegate:", v15);

    objc_msgSend(*(id *)(a1 + 32), "rootController");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "showController:", v12);

    objc_msgSend(*(id *)(a1 + 32), "_deactivateSpinner");
  }
  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "_deactivateSpinner");
    objc_msgSend(*(id *)(a1 + 32), "regController");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "shouldShowAlertForError:", v5);

    if (v18)
    {
      CommunicationsSetupUIBundle();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      CNFRegStringTableName();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "localizedStringForKey:value:table:", CFSTR("FACETIME_ACTIVATION_ERROR_TITLE"), &stru_24D077260, v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v5, "localizedDescription");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      CommunicationsSetupUIBundle();
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      CNFRegStringTableName();
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "localizedStringForKey:value:table:", CFSTR("FACETIME_ALERT_OK"), &stru_24D077260, v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x24BEBD3B0], "alertControllerWithTitle:message:preferredStyle:", v21, v22, 1);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BEBD3A8], "actionWithTitle:style:handler:", v25, 0, 0);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "addAction:", v27);

      objc_msgSend(*(id *)(a1 + 32), "presentViewController:animated:completion:", v26, 1, 0);
    }
  }

}

- (void)viewWillDisappear:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  -[CNFRegDisabledController _deactivateSpinner](self, "_deactivateSpinner");
  v5.receiver = self;
  v5.super_class = (Class)CNFRegDisabledController;
  -[CNFRegFirstRunController viewWillDisappear:](&v5, sel_viewWillDisappear_, v3);
}

- (id)getAccountNameForSpecifier:(id)a3
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  const __CFString *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  _OWORD v12[4];
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  -[CNFRegListController regController](self, "regController", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = _os_feature_enabled_impl();
  CommunicationsSetupUIBundle();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  CNFRegStringTableName();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    v7 = CFSTR("FACETIME_ACCOUNT_INFO_UNAVAILABLE_APPLEACCOUNT");
  else
    v7 = CFSTR("FACETIME_ACCOUNT_INFO_UNAVAILABLE");
  objc_msgSend(v5, "localizedStringForKey:value:table:", v7, &stru_24D077260, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  memset(v12, 0, sizeof(v12));
  objc_msgSend(v3, "appleIDAccounts", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", v12, v13, 16))
  {
    objc_msgSend(**((id **)&v12[0] + 1), "loginDisplayString");
    v10 = objc_claimAutoreleasedReturnValue();

    v8 = (void *)v10;
  }

  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_turnOnButton, 0);
  objc_storeStrong((id *)&self->_spinner, 0);
}

@end
