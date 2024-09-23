@implementation FPUIAuthenticationCredentialsViewController

- (FPUIAuthenticationCredentialsViewController)initWithCredentialDescriptors:(id)a3
{
  id v5;
  FPUIAuthenticationCredentialsViewController *v6;
  FPUIAuthenticationCredentialsViewController *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)FPUIAuthenticationCredentialsViewController;
  v6 = -[FPUIAuthenticationTableViewController init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_credentialDescriptors, a3);

  return v7;
}

- (void)viewDidLoad
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)FPUIAuthenticationCredentialsViewController;
  -[FPUIAuthenticationTableViewController viewDidLoad](&v3, sel_viewDidLoad);
  -[FPUIAuthenticationTableViewController setCanTransitionToNextStep:](self, "setCanTransitionToNextStep:", -[FPUIAuthenticationCredentialsViewController _canMoveToNextStep](self, "_canMoveToNextStep"));
}

- (id)defaultRightBarButtonItem
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v14;

  v3 = objc_alloc(MEMORY[0x24BDF6860]);
  FPUILoc(CFSTR("NEXT_NAV_BAR_BUTTON_TITLE"), v4, v5, v6, v7, v8, v9, v10, v14);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v3, "initWithTitle:style:target:action:", v11, 2, self, sel__next_);

  return v12;
}

- (id)_rowDescriptorForCredentialDescriptor:(id)a3
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  __CFString *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  id v19;
  uint64_t v21;
  _QWORD v22[5];
  _QWORD v23[4];
  id v24;
  FPUIAuthenticationCredentialsViewController *v25;

  v5 = a3;
  v6 = (void *)objc_opt_new();
  v7 = objc_msgSend(v5, "type");

  if (v7 == 2)
  {
    v15 = CFSTR("APPLE_ID_OPTION");
  }
  else if (v7 == 1)
  {
    v15 = CFSTR("REGISTERED_USER_OPTION");
  }
  else
  {
    if (v7)
    {
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("FPUIAuthenticationCredentialsViewController.m"), 74, CFSTR("bad credential descriptor type"));

      v16 = 0;
      goto LABEL_9;
    }
    v15 = CFSTR("GUEST_OPTION");
  }
  FPUILoc(v15, v8, v9, v10, v11, v12, v13, v14, v21);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_9:
  v18 = MEMORY[0x24BDAC760];
  v23[0] = MEMORY[0x24BDAC760];
  v23[1] = 3221225472;
  v23[2] = __85__FPUIAuthenticationCredentialsViewController__rowDescriptorForCredentialDescriptor___block_invoke;
  v23[3] = &unk_24EFEE018;
  v24 = v16;
  v25 = self;
  v19 = v16;
  objc_msgSend(v6, "setCellCustomizationHandler:", v23);
  v22[0] = v18;
  v22[1] = 3221225472;
  v22[2] = __85__FPUIAuthenticationCredentialsViewController__rowDescriptorForCredentialDescriptor___block_invoke_2;
  v22[3] = &unk_24EFEE1D0;
  v22[4] = self;
  objc_msgSend(v6, "setSelectionHandler:", v22);

  return v6;
}

void __85__FPUIAuthenticationCredentialsViewController__rowDescriptorForCredentialDescriptor___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;

  v5 = *(_QWORD *)(a1 + 32);
  v6 = a3;
  v11 = a2;
  objc_msgSend(v11, "textLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setText:", v5);

  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 1056);
  v9 = objc_msgSend(v6, "row");

  if (v8 == v9)
    v10 = 3;
  else
    v10 = 0;
  objc_msgSend(v11, "setAccessoryType:", v10);

}

void __85__FPUIAuthenticationCredentialsViewController__rowDescriptorForCredentialDescriptor___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1056);
  if (v4 != objc_msgSend(v3, "row"))
  {
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1056) = objc_msgSend(v3, "row");
    objc_msgSend(*(id *)(a1 + 32), "tableView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "cellForRowAtIndexPath:", v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "setAccessoryType:", 3);
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    objc_msgSend(*(id *)(a1 + 32), "tableView", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "visibleCells");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v19;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v19 != v11)
            objc_enumerationMutation(v8);
          v13 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * v12);
          objc_msgSend(*(id *)(a1 + 32), "tableView");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "indexPathForCell:", v13);
          v15 = (void *)objc_claimAutoreleasedReturnValue();

          v16 = objc_msgSend(v15, "section");
          if (v16 == objc_msgSend(v3, "section"))
          {
            v17 = objc_msgSend(v15, "row");
            if (v17 != objc_msgSend(v3, "row"))
              objc_msgSend(v13, "setAccessoryType:", 0);
          }

          ++v12;
        }
        while (v10 != v12);
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      }
      while (v10);
    }

    objc_msgSend(*(id *)(a1 + 32), "_updateCurrentlyVisibleSections");
    objc_msgSend(*(id *)(a1 + 32), "setCanTransitionToNextStep:", objc_msgSend(*(id *)(a1 + 32), "_canMoveToNextStep"));

  }
}

- (void)setupTableViewSections
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  NSArray *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  void *v20;
  FPUIAuthenticationSectionDescriptor *v21;
  FPUIAuthenticationSectionDescriptor *credentialsInputSection;
  void *v23;
  uint64_t v24;
  void *v25;
  FPUIAuthenticationSectionDescriptor *v26;
  FPUIAuthenticationSectionDescriptor *rememberPasswordSection;
  void *v28;
  FPUIAuthenticationSectionDescriptor *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  _QWORD v35[5];
  _QWORD v36[5];
  _QWORD v37[5];
  _QWORD v38[5];
  _QWORD v39[5];
  _QWORD v40[5];
  _QWORD v41[5];
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  void *v46;
  _QWORD v47[2];
  _QWORD v48[3];
  _QWORD v49[3];
  _QWORD v50[3];
  _BYTE v51[128];
  uint64_t v52;

  v52 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)objc_opt_new();
  FPUILoc(CFSTR("CONNECT_AS"), v4, v5, v6, v7, v8, v9, v10, v34);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setHeaderTitle:", v11);

  objc_msgSend(v3, "setHeaderHeight:", *MEMORY[0x24BDF7DE0]);
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  v45 = 0u;
  v13 = self->_credentialDescriptors;
  v14 = -[NSArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v42, v51, 16);
  if (v14)
  {
    v15 = v14;
    v16 = 0;
    v17 = *(_QWORD *)v43;
    do
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v43 != v17)
          objc_enumerationMutation(v13);
        v19 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * i);
        if (objc_msgSend(v19, "type") == 1)
          self->_selectedCredentialRow = v16 + i;
        -[FPUIAuthenticationCredentialsViewController _rowDescriptorForCredentialDescriptor:](self, "_rowDescriptorForCredentialDescriptor:", v19);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "addObject:", v20);

      }
      v15 = -[NSArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v42, v51, 16);
      v16 += i;
    }
    while (v15);
  }

  v21 = (FPUIAuthenticationSectionDescriptor *)objc_opt_new();
  credentialsInputSection = self->_credentialsInputSection;
  self->_credentialsInputSection = v21;

  -[FPUIAuthenticationSectionDescriptor setHeaderHeight:](self->_credentialsInputSection, "setHeaderHeight:", 36.0);
  v23 = (void *)objc_opt_new();
  objc_msgSend(v23, "setCellReuseIdentifier:", CFSTR("TextInputReuseIdentifier"));
  objc_msgSend(v23, "setCellClass:", objc_opt_class());
  v24 = MEMORY[0x24BDAC760];
  v41[0] = MEMORY[0x24BDAC760];
  v41[1] = 3221225472;
  v41[2] = __69__FPUIAuthenticationCredentialsViewController_setupTableViewSections__block_invoke;
  v41[3] = &unk_24EFEE280;
  v41[4] = self;
  objc_msgSend(v23, "setCellCustomizationHandler:", v41);
  v40[0] = v24;
  v40[1] = 3221225472;
  v40[2] = __69__FPUIAuthenticationCredentialsViewController_setupTableViewSections__block_invoke_2;
  v40[3] = &unk_24EFEE168;
  v40[4] = self;
  objc_msgSend(v23, "setCellWillDisplayHandler:", v40);
  v39[0] = v24;
  v39[1] = 3221225472;
  v39[2] = __69__FPUIAuthenticationCredentialsViewController_setupTableViewSections__block_invoke_3;
  v39[3] = &unk_24EFEE1D0;
  v39[4] = self;
  objc_msgSend(v23, "setSelectionHandler:", v39);
  v25 = (void *)objc_msgSend(v23, "copy");
  v38[0] = v24;
  v38[1] = 3221225472;
  v38[2] = __69__FPUIAuthenticationCredentialsViewController_setupTableViewSections__block_invoke_4;
  v38[3] = &unk_24EFEE280;
  v38[4] = self;
  objc_msgSend(v25, "setCellCustomizationHandler:", v38);
  v37[0] = v24;
  v37[1] = 3221225472;
  v37[2] = __69__FPUIAuthenticationCredentialsViewController_setupTableViewSections__block_invoke_5;
  v37[3] = &unk_24EFEE168;
  v37[4] = self;
  objc_msgSend(v25, "setCellWillDisplayHandler:", v37);
  v36[0] = v24;
  v36[1] = 3221225472;
  v36[2] = __69__FPUIAuthenticationCredentialsViewController_setupTableViewSections__block_invoke_6;
  v36[3] = &unk_24EFEE1D0;
  v36[4] = self;
  objc_msgSend(v25, "setSelectionHandler:", v36);
  v26 = (FPUIAuthenticationSectionDescriptor *)objc_opt_new();
  rememberPasswordSection = self->_rememberPasswordSection;
  self->_rememberPasswordSection = v26;

  v28 = (void *)objc_opt_new();
  v35[0] = v24;
  v35[1] = 3221225472;
  v35[2] = __69__FPUIAuthenticationCredentialsViewController_setupTableViewSections__block_invoke_7;
  v35[3] = &unk_24EFEE168;
  v35[4] = self;
  objc_msgSend(v28, "setCellCustomizationHandler:", v35);
  v29 = self->_credentialsInputSection;
  v50[0] = v3;
  v50[1] = v29;
  v50[2] = self->_rememberPasswordSection;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v50, 3);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[FPUIAuthenticationTableViewController setSectionDescriptors:](self, "setSectionDescriptors:", v30);

  v49[0] = v12;
  v48[0] = &unk_24EFF27F0;
  v48[1] = &unk_24EFF2808;
  v47[0] = v23;
  v47[1] = v25;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v47, 2);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v49[1] = v31;
  v48[2] = &unk_24EFF2820;
  v46 = v28;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v46, 1);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v49[2] = v32;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v49, v48, 3);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  -[FPUIAuthenticationTableViewController setRowDescriptors:](self, "setRowDescriptors:", v33);

  -[FPUIAuthenticationCredentialsViewController _updateCurrentlyVisibleSectionsNeedsReloadData:](self, "_updateCurrentlyVisibleSectionsNeedsReloadData:", 0);
}

void __69__FPUIAuthenticationCredentialsViewController_setupTableViewSections__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  __CFString *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  id v29;

  v29 = a2;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1048), "objectAtIndexedSubscript:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1056));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  FPUILoc(CFSTR("NAME"), v4, v5, v6, v7, v8, v9, v10, v27);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "label");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setText:", v11);

  if (objc_msgSend(v3, "type") == 2)
    v20 = CFSTR("APPLE_ID_PLACEHOLDER");
  else
    v20 = CFSTR("USERNAME_PLACEHOLDER");
  FPUILoc(v20, v13, v14, v15, v16, v17, v18, v19, v28);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "textField");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setPlaceholder:", v21);

  objc_msgSend(v29, "textField");
  v23 = objc_claimAutoreleasedReturnValue();
  v24 = *(_QWORD *)(a1 + 32);
  v25 = *(void **)(v24 + 1080);
  *(_QWORD *)(v24 + 1080) = v23;

  objc_msgSend(v3, "username");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1080), "setText:", v26);

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1080), "setDelegate:");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1080), "setAutocorrectionType:", 1);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1080), "setAutocapitalizationType:", 0);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1080), "setTextContentType:", &stru_24EFEE558);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1080), "addTarget:action:forControlEvents:", *(_QWORD *)(a1 + 32), sel_textFieldDidChange_, 0x20000);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1080), "setAccessibilityIdentifier:", CFSTR("Username"));
  objc_msgSend(*(id *)(a1 + 32), "_updateTextFieldConstraints");
  objc_msgSend(*(id *)(a1 + 32), "_updateCanTransitionToNextStepState");

}

uint64_t __69__FPUIAuthenticationCredentialsViewController_setupTableViewSections__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateTextFieldConstraints");
}

uint64_t __69__FPUIAuthenticationCredentialsViewController_setupTableViewSections__block_invoke_3(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "selectTextFieldAtIndexPath:", a2);
}

void __69__FPUIAuthenticationCredentialsViewController_setupTableViewSections__block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  id v41;

  v3 = a2;
  FPUILoc(CFSTR("PASSWORD"), v4, v5, v6, v7, v8, v9, v10, v38);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "label");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setText:", v11);

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1048), "objectAtIndexedSubscript:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1056));
  v41 = (id)objc_claimAutoreleasedReturnValue();
  FPUILoc(CFSTR("PASSWORD_OPTIONAL"), v13, v14, v15, v16, v17, v18, v19, v39);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "textField");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setPlaceholder:", v20);

  objc_msgSend(v3, "textField");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setSecureTextEntry:", 1);

  objc_msgSend(v41, "password");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "textField");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setText:", v23);

  objc_msgSend(v3, "textField");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setAccessibilityIdentifier:", CFSTR("Password"));

  FPUILoc(CFSTR("PASSWORD"), v26, v27, v28, v29, v30, v31, v32, v40);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "textField");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "setAccessibilityLabel:", v33);

  objc_msgSend(v3, "textField");
  v35 = objc_claimAutoreleasedReturnValue();

  v36 = *(_QWORD *)(a1 + 32);
  v37 = *(void **)(v36 + 1088);
  *(_QWORD *)(v36 + 1088) = v35;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1088), "setDelegate:");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1088), "addTarget:action:forControlEvents:", *(_QWORD *)(a1 + 32), sel_textFieldDidChange_, 0x20000);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1088), "setTextContentType:", &stru_24EFEE558);
  objc_msgSend(*(id *)(a1 + 32), "_updateCanTransitionToNextStepState");

}

uint64_t __69__FPUIAuthenticationCredentialsViewController_setupTableViewSections__block_invoke_5(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateTextFieldConstraints");
}

uint64_t __69__FPUIAuthenticationCredentialsViewController_setupTableViewSections__block_invoke_6(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "selectTextFieldAtIndexPath:", a2);
}

void __69__FPUIAuthenticationCredentialsViewController_setupTableViewSections__block_invoke_7(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  id v16;

  v16 = a2;
  FPUILoc(CFSTR("REMEMBER_PASSWORD"), v3, v4, v5, v6, v7, v8, v9, v15);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "textLabel");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setText:", v10);

  v12 = objc_opt_new();
  v13 = *(_QWORD *)(a1 + 32);
  v14 = *(void **)(v13 + 1096);
  *(_QWORD *)(v13 + 1096) = v12;

  objc_msgSend(v16, "setAccessoryView:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1096));
}

- (void)_updateTextFieldConstraints
{
  NSLayoutConstraint **p_textFieldLeadingAnchorConstraint;
  id WeakRetained;
  unsigned int (**v5)(_QWORD, _QWORD);
  void *v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v10[5];

  p_textFieldLeadingAnchorConstraint = &self->_textFieldLeadingAnchorConstraint;
  WeakRetained = objc_loadWeakRetained((id *)&self->_textFieldLeadingAnchorConstraint);

  if (!WeakRetained)
  {
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __74__FPUIAuthenticationCredentialsViewController__updateTextFieldConstraints__block_invoke;
    v10[3] = &unk_24EFEE360;
    v10[4] = self;
    v5 = (unsigned int (**)(_QWORD, _QWORD))MEMORY[0x22E29FB2C](v10);
    if (((unsigned int (**)(_QWORD, UITextField *))v5)[2](v5, self->_nameInputTextField))
    {
      if (((unsigned int (**)(_QWORD, UITextField *))v5)[2](v5, self->_passwordInputTextField))
      {
        -[UITextField leadingAnchor](self->_nameInputTextField, "leadingAnchor");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        -[UITextField leadingAnchor](self->_passwordInputTextField, "leadingAnchor");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "constraintEqualToAnchor:", v7);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_storeWeak((id *)p_textFieldLeadingAnchorConstraint, v8);

        v9 = objc_loadWeakRetained((id *)p_textFieldLeadingAnchorConstraint);
        objc_msgSend(v9, "setActive:", 1);

      }
    }

  }
}

BOOL __74__FPUIAuthenticationCredentialsViewController__updateTextFieldConstraints__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  BOOL v6;
  _BOOL8 v7;
  uint64_t v8;

  v3 = a2;
  if (!v3)
    return 0;
  v4 = v3;
  do
  {
    objc_msgSend(*(id *)(a1 + 32), "tableView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = v4 == v5;
    v7 = v4 == v5;
    if (v6)
      break;
    objc_msgSend(v4, "superview");
    v8 = objc_claimAutoreleasedReturnValue();

    v4 = (void *)v8;
  }
  while (v8);

  return v7;
}

- (void)_updateCurrentlyVisibleSections
{
  -[FPUIAuthenticationCredentialsViewController _updateCurrentlyVisibleSectionsNeedsReloadData:](self, "_updateCurrentlyVisibleSectionsNeedsReloadData:", 1);
}

- (void)_updateCurrentlyVisibleSectionsNeedsReloadData:(BOOL)a3
{
  _BOOL4 v3;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v3 = a3;
  -[NSArray objectAtIndexedSubscript:](self->_credentialDescriptors, "objectAtIndexedSubscript:", self->_selectedCredentialRow);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v6;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("FPUIAuthenticationCredentialsViewController.m"), 247, CFSTR("nil currentlySelectedDescriptor"));

    v6 = 0;
  }
  -[FPUIAuthenticationSectionDescriptor setActive:](self->_credentialsInputSection, "setActive:", objc_msgSend(v6, "type") != 0);
  -[FPUIAuthenticationSectionDescriptor setActive:](self->_rememberPasswordSection, "setActive:", 0);
  if (v3)
  {
    -[FPUIAuthenticationCredentialsViewController tableView](self, "tableView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "reloadData");

  }
}

- (void)_next:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  -[FPUIAuthenticationTableViewController setNavBarActivityIndicatorHidden:](self, "setNavBarActivityIndicatorHidden:", 0);
  -[NSArray objectAtIndexedSubscript:](self->_credentialDescriptors, "objectAtIndexedSubscript:", self->_selectedCredentialRow);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_opt_new();
  objc_msgSend(v4, "setType:", objc_msgSend(v8, "type"));
  objc_msgSend(v8, "username");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setUsername:", v5);

  objc_msgSend(v8, "password");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPassword:", v6);

  -[FPUIAuthenticationTableViewController setTransitioning:](self, "setTransitioning:", 1);
  -[FPUIAuthenticationTableViewController authenticationDelegate](self, "authenticationDelegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "connectionFlowDelegate:didInputCredentials:", self, v4);

}

- (BOOL)_canMoveToNextStep
{
  void *v3;
  void *v4;
  BOOL v5;

  -[NSArray objectAtIndexedSubscript:](self->_credentialDescriptors, "objectAtIndexedSubscript:", self->_selectedCredentialRow);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "type"))
  {
    -[UITextField text](self->_nameInputTextField, "text");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "length") != 0;

  }
  else
  {
    v5 = 1;
  }

  return v5;
}

- (BOOL)textFieldShouldReturn:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  if (-[UITextField isFirstResponder](self->_nameInputTextField, "isFirstResponder"))
  {
    -[UITextField becomeFirstResponder](self->_passwordInputTextField, "becomeFirstResponder");
  }
  else
  {
    if (!-[FPUIAuthenticationCredentialsViewController _canMoveToNextStep](self, "_canMoveToNextStep"))
    {
      v5 = 1;
      goto LABEL_7;
    }
    -[FPUIAuthenticationCredentialsViewController _next:](self, "_next:", v4);
  }
  v5 = 0;
LABEL_7:

  return v5;
}

- (void)textFieldDidChange:(id)a3
{
  void *v4;
  void *v5;
  UITextField *v6;

  v6 = (UITextField *)a3;
  -[NSArray objectAtIndexedSubscript:](self->_credentialDescriptors, "objectAtIndexedSubscript:", self->_selectedCredentialRow);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_nameInputTextField == v6)
  {
    -[UITextField text](v6, "text");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setUsername:", v5);
    goto LABEL_5;
  }
  if (self->_passwordInputTextField == v6)
  {
    -[UITextField text](v6, "text");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setPassword:", v5);
LABEL_5:

  }
  -[FPUIAuthenticationCredentialsViewController _updateCanTransitionToNextStepState](self, "_updateCanTransitionToNextStepState");

}

- (void)_updateCanTransitionToNextStepState
{
  -[FPUIAuthenticationTableViewController setCanTransitionToNextStep:](self, "setCanTransitionToNextStep:", -[FPUIAuthenticationCredentialsViewController _canMoveToNextStep](self, "_canMoveToNextStep"));
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_textFieldLeadingAnchorConstraint);
  objc_storeStrong((id *)&self->_rememberPasswordSwitch, 0);
  objc_storeStrong((id *)&self->_passwordInputTextField, 0);
  objc_storeStrong((id *)&self->_nameInputTextField, 0);
  objc_storeStrong((id *)&self->_rememberPasswordSection, 0);
  objc_storeStrong((id *)&self->_credentialsInputSection, 0);
  objc_storeStrong((id *)&self->_credentialDescriptors, 0);
}

@end
