@implementation SUUIReportAConcernDetailsViewController

- (SUUIReportAConcernDetailsViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  SUUIReportAConcernConfiguration *v5;
  SUUIReportAConcernDetailsViewController *v6;

  v5 = objc_alloc_init(SUUIReportAConcernConfiguration);
  v6 = -[SUUIReportAConcernDetailsViewController initWithConfiguration:](self, "initWithConfiguration:", v5);

  return v6;
}

- (SUUIReportAConcernDetailsViewController)initWithCoder:(id)a3
{
  SUUIReportAConcernConfiguration *v4;
  SUUIReportAConcernDetailsViewController *v5;

  v4 = objc_alloc_init(SUUIReportAConcernConfiguration);
  v5 = -[SUUIReportAConcernDetailsViewController initWithConfiguration:](self, "initWithConfiguration:", v4);

  return v5;
}

- (SUUIReportAConcernDetailsViewController)initWithConfiguration:(id)a3
{
  id v5;
  SUUIReportAConcernDetailsViewController *v6;
  SUUIReportAConcernDetailsViewController *v7;
  void *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SUUIReportAConcernDetailsViewController;
  v6 = -[SUUIReportAConcernDetailsViewController initWithNibName:bundle:](&v10, sel_initWithNibName_bundle_, 0, 0);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_configuration, a3);
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObserver:selector:name:object:", v7, sel__keyboardWillShow_, *MEMORY[0x24BEBE580], 0);
    objc_msgSend(v8, "addObserver:selector:name:object:", v7, sel__keyboardWillHide_, *MEMORY[0x24BEBE578], 0);

  }
  return v7;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x24BEBE580], 0);
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x24BEBE578], 0);

  v4.receiver = self;
  v4.super_class = (Class)SUUIReportAConcernDetailsViewController;
  -[SUUIReportAConcernDetailsViewController dealloc](&v4, sel_dealloc);
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  SUUIReportAConcernDetailsDataSource *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  objc_super v21;

  v21.receiver = self;
  v21.super_class = (Class)SUUIReportAConcernDetailsViewController;
  -[SUUIReportAConcernDetailsViewController viewDidLoad](&v21, sel_viewDidLoad);
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("REPORT_A_CONCERN"), &stru_2511FF0C8, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUIReportAConcernDetailsViewController setTitle:](self, "setTitle:", v4);

  v5 = objc_alloc(MEMORY[0x24BEBD410]);
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("SUBMIT"), &stru_2511FF0C8, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v5, "initWithTitle:style:target:action:", v7, 2, self, sel_submitPressed_);
  -[SUUIReportAConcernDetailsViewController navigationItem](self, "navigationItem");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setRightBarButtonItem:", v8);

  v10 = objc_alloc(MEMORY[0x24BEBD9F0]);
  v11 = (void *)objc_msgSend(v10, "initWithFrame:style:", 1, *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
  objc_msgSend(v11, "setAllowsSelection:", 0);
  objc_msgSend(v11, "setDelegate:", self);
  v12 = -[SUUIReportAConcernDetailsDataSource initWithTableView:]([SUUIReportAConcernDetailsDataSource alloc], "initWithTableView:", v11);
  -[SUUIReportAConcernDetailsViewController configuration](self, "configuration");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "reportConcernExplanation");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUIReportAConcernDetailsDataSource setPlaceholder:](v12, "setPlaceholder:", v14);

  -[SUUIReportAConcernDetailsViewController metadata](self, "metadata");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "selectedReason");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "uppercaseName");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUIReportAConcernDetailsDataSource setSelectedReason:](v12, "setSelectedReason:", v17);

  -[SUUIReportAConcernDetailsViewController configuration](self, "configuration");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "privacyNote");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUIReportAConcernDetailsDataSource setPrivacyNote:](v12, "setPrivacyNote:", v19);

  objc_msgSend(v11, "setDataSource:", v12);
  -[SUUIReportAConcernDetailsViewController setDataSource:](self, "setDataSource:", v12);
  -[SUUIReportAConcernDetailsViewController view](self, "view");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "addSubview:", v11);

  -[SUUIReportAConcernDetailsViewController setTableView:](self, "setTableView:", v11);
}

- (void)viewWillLayoutSubviews
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)SUUIReportAConcernDetailsViewController;
  -[SUUIReportAConcernDetailsViewController viewWillLayoutSubviews](&v13, sel_viewWillLayoutSubviews);
  -[SUUIReportAConcernDetailsViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  -[SUUIReportAConcernDetailsViewController tableView](self, "tableView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setFrame:", v5, v7, v9, v11);

}

- (void)submitPressed:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  objc_class *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  SUUIReportAConcernOperation *v16;
  void *v17;
  SUUIReportAConcernOperation *v18;
  id v19;
  id v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void (*v24)(uint64_t);
  void *v25;
  id v26;
  id v27;
  id v28;
  id v29[2];
  id from;
  id location;
  _QWORD v32[5];

  v4 = a3;
  objc_msgSend(v4, "setEnabled:", 0);
  -[SUUIReportAConcernDetailsViewController _detailsText](self, "_detailsText");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUIReportAConcernDetailsViewController metadata](self, "metadata");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setDetails:", v5);

  objc_msgSend(MEMORY[0x24BEBD3C8], "sharedApplication");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "sendAction:to:from:forEvent:", sel_resignFirstResponder, 0, 0, 0);

  v8 = *MEMORY[0x24BEBE030];
  objc_msgSend(MEMORY[0x24BEBD3C8], "sharedApplication");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (objc_class *)objc_opt_class();
  NSStringFromClass(v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = MEMORY[0x24BDAC760];
  v32[0] = MEMORY[0x24BDAC760];
  v32[1] = 3221225472;
  v32[2] = __57__SUUIReportAConcernDetailsViewController_submitPressed___block_invoke;
  v32[3] = &__block_descriptor_40_e5_v8__0l;
  v32[4] = v8;
  v13 = (void *)objc_msgSend(v9, "beginBackgroundTaskWithName:expirationHandler:", v11, v32);

  -[SUUIReportAConcernDetailsViewController view](self, "view");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "window");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = [SUUIReportAConcernOperation alloc];
  -[SUUIReportAConcernDetailsViewController metadata](self, "metadata");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = -[SUUIReportAConcernOperation initWithMetadata:](v16, "initWithMetadata:", v17);

  objc_initWeak(&location, v18);
  objc_initWeak(&from, self);
  v22 = v12;
  v23 = 3221225472;
  v24 = __57__SUUIReportAConcernDetailsViewController_submitPressed___block_invoke_2;
  v25 = &unk_2511FD848;
  objc_copyWeak(&v28, &location);
  v19 = v15;
  v26 = v19;
  objc_copyWeak(v29, &from);
  v20 = v4;
  v27 = v20;
  v29[1] = v13;
  -[SUUIReportAConcernOperation setCompletionBlock:](v18, "setCompletionBlock:", &v22);
  objc_msgSend(MEMORY[0x24BEC8BE8], "mainQueue", v22, v23, v24, v25);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "addOperation:", v18);

  objc_destroyWeak(v29);
  objc_destroyWeak(&v28);
  objc_destroyWeak(&from);
  objc_destroyWeak(&location);

}

void __57__SUUIReportAConcernDetailsViewController_submitPressed___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x24BEBD3C8], "sharedApplication");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "endBackgroundTask:", *(_QWORD *)(a1 + 32));

}

void __57__SUUIReportAConcernDetailsViewController_submitPressed___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  id v3;
  id v4;
  void *v5;
  _QWORD block[4];
  id v7;
  id v8;
  id v9;
  id v10[2];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __57__SUUIReportAConcernDetailsViewController_submitPressed___block_invoke_3;
  block[3] = &unk_2511FD820;
  v7 = WeakRetained;
  v8 = *(id *)(a1 + 32);
  v3 = WeakRetained;
  objc_copyWeak(v10, (id *)(a1 + 56));
  v4 = *(id *)(a1 + 40);
  v5 = *(void **)(a1 + 64);
  v9 = v4;
  v10[1] = v5;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

  objc_destroyWeak(v10);
}

void __57__SUUIReportAConcernDetailsViewController_submitPressed___block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  int v11;
  id v12;
  void *v13;
  id v14;
  void (**v15)(_QWORD, _QWORD);
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id WeakRetained;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t j;
  void *v26;
  void *v27;
  void *v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "responseDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(*(id *)(a1 + 32), "success") & 1) == 0 && v2)
  {
    v33 = 0u;
    v34 = 0u;
    v35 = 0u;
    v36 = 0u;
    v28 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEB1DF0]), "initWithResponseDictionary:", v2);
    objc_msgSend(v28, "actions");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v34;
      v7 = *MEMORY[0x24BEB2A18];
      while (2)
      {
        for (i = 0; i != v5; ++i)
        {
          if (*(_QWORD *)v34 != v6)
            objc_enumerationMutation(v3);
          v9 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);
          objc_msgSend(v9, "actionType");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = objc_msgSend(v10, "isEqualToString:", v7);

          if (v11)
          {
            objc_msgSend(v9, "dialog");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x24BEBD3B8], "_alertViewForWindow:", *(_QWORD *)(a1 + 40));
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "message");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "setMessage:", v18);

            objc_msgSend(v16, "title");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "setTitle:", v19);

            WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
            objc_msgSend(v17, "setDelegate:", WeakRetained);

            objc_msgSend(v16, "buttons");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            v29 = 0u;
            v30 = 0u;
            v31 = 0u;
            v32 = 0u;
            v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
            if (v22)
            {
              v23 = v22;
              v24 = *(_QWORD *)v30;
              do
              {
                for (j = 0; j != v23; ++j)
                {
                  if (*(_QWORD *)v30 != v24)
                    objc_enumerationMutation(v21);
                  objc_msgSend(*(id *)(*((_QWORD *)&v29 + 1) + 8 * j), "buttonTitle");
                  v26 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v17, "addButtonWithTitle:", v26);

                }
                v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
              }
              while (v23);
            }
            objc_msgSend(v17, "show");

            goto LABEL_22;
          }
        }
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
        if (v5)
          continue;
        break;
      }
    }

  }
  v12 = objc_loadWeakRetained((id *)(a1 + 56));
  objc_msgSend(v12, "completion");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    v14 = objc_loadWeakRetained((id *)(a1 + 56));
    objc_msgSend(v14, "completion");
    v15 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v15[2](v15, 1);

  }
  else
  {
LABEL_22:
    objc_msgSend(*(id *)(a1 + 48), "setEnabled:", 1);
  }
  if (*(_QWORD *)(a1 + 64) != *MEMORY[0x24BEBE030])
  {
    objc_msgSend(MEMORY[0x24BEBD3C8], "sharedApplication");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "endBackgroundTask:", *(_QWORD *)(a1 + 64));

  }
}

- (id)_detailsText
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  -[SUUIReportAConcernDetailsViewController tableView](self, "tableView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForRow:inSection:", 0, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cellForRowAtIndexPath:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "text");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (double)_detailsCellHeight
{
  void *v3;
  double Height;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGRect v11;

  -[SUUIReportAConcernDetailsViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  Height = CGRectGetHeight(v11);
  -[SUUIReportAConcernDetailsViewController topLayoutGuide](self, "topLayoutGuide");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "length");
  v7 = Height - v6;
  -[SUUIReportAConcernDetailsViewController keyboardHeight](self, "keyboardHeight");
  v9 = v7 - v8;

  return fmin(v9, 250.0);
}

- (void)_keyboardWillShow:(id)a3
{
  void *v4;
  void *v5;
  double v6;
  void *v7;
  float v8;
  double v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD v21[9];

  objc_msgSend(a3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", *MEMORY[0x24BEBE468]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "CGRectValue");
  -[SUUIReportAConcernDetailsViewController setKeyboardHeight:](self, "setKeyboardHeight:", v6);
  objc_msgSend(v4, "objectForKey:", *MEMORY[0x24BEBE408]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "floatValue");
  v9 = v8;

  objc_msgSend(v4, "objectForKey:", *MEMORY[0x24BEBE400]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "integerValue");

  -[SUUIReportAConcernDetailsViewController tableView](self, "tableView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "contentInset");
  v14 = v13;
  v16 = v15;
  v18 = v17;
  v20 = v19;

  v21[0] = MEMORY[0x24BDAC760];
  v21[1] = 3221225472;
  v21[2] = __61__SUUIReportAConcernDetailsViewController__keyboardWillShow___block_invoke;
  v21[3] = &unk_2511F4980;
  v21[4] = self;
  v21[5] = v14;
  v21[6] = v16;
  v21[7] = v18;
  v21[8] = v20;
  objc_msgSend(MEMORY[0x24BEBDB00], "animateWithDuration:delay:options:animations:completion:", v11, v21, &__block_literal_global_62, v9, 0.0);

}

void __61__SUUIReportAConcernDetailsViewController__keyboardWillShow___block_invoke(uint64_t a1)
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double MinY;
  void *v13;
  double v14;
  void *v15;
  void *v16;
  id v17;
  CGRect v18;

  objc_msgSend(*(id *)(a1 + 32), "tableView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "beginUpdates");

  v3 = *(double *)(a1 + 40);
  v4 = *(double *)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 32), "keyboardHeight");
  v6 = v5;
  v7 = *(double *)(a1 + 64);
  objc_msgSend(*(id *)(a1 + 32), "tableView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setContentInset:", v3, v4, v6, v7);

  objc_msgSend(*(id *)(a1 + 32), "tableView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForRow:inSection:", 0, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "cellForRowAtIndexPath:", v10);
  v17 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "tableView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "frame");
  MinY = CGRectGetMinY(v18);
  objc_msgSend(*(id *)(a1 + 32), "tableView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "contentInset");
  objc_msgSend(v11, "setContentOffset:", 0.0, MinY - v14);

  objc_msgSend(*(id *)(a1 + 32), "tableView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "endUpdates");

  objc_msgSend(*(id *)(a1 + 32), "view");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "layoutIfNeeded");

}

- (void)_keyboardWillHide:(id)a3
{
  void *v4;
  void *v5;
  float v6;
  double v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD v19[9];

  objc_msgSend(a3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", *MEMORY[0x24BEBE408]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "floatValue");
  v7 = v6;

  objc_msgSend(v4, "objectForKey:", *MEMORY[0x24BEBE400]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "integerValue");

  -[SUUIReportAConcernDetailsViewController tableView](self, "tableView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "contentInset");
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v18 = v17;

  -[SUUIReportAConcernDetailsViewController setKeyboardHeight:](self, "setKeyboardHeight:", 0.0);
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __61__SUUIReportAConcernDetailsViewController__keyboardWillHide___block_invoke;
  v19[3] = &unk_2511F4980;
  v19[4] = self;
  v19[5] = v12;
  v19[6] = v14;
  v19[7] = v16;
  v19[8] = v18;
  objc_msgSend(MEMORY[0x24BEBDB00], "animateWithDuration:delay:options:animations:completion:", v9, v19, 0, v7, 0.0);

}

void __61__SUUIReportAConcernDetailsViewController__keyboardWillHide___block_invoke(uint64_t a1)
{
  double v2;
  double v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v2 = *(double *)(a1 + 40);
  v3 = *(double *)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 32), "keyboardHeight");
  v5 = v4;
  v6 = *(double *)(a1 + 64);
  objc_msgSend(*(id *)(a1 + 32), "tableView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setContentInset:", v2, v3, v5, v6);

  objc_msgSend(*(id *)(a1 + 32), "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "layoutIfNeeded");

  objc_msgSend(*(id *)(a1 + 32), "tableView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "beginUpdates");

  objc_msgSend(*(id *)(a1 + 32), "tableView");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "endUpdates");

}

- (id)completion
{
  return self->_completion;
}

- (void)setCompletion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 968);
}

- (SUUIReportAConcernMetadata)metadata
{
  return self->_metadata;
}

- (void)setMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_metadata, a3);
}

- (SUUIReportAConcernConfiguration)configuration
{
  return self->_configuration;
}

- (void)setConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_configuration, a3);
}

- (SUUIReportAConcernDetailsDataSource)dataSource
{
  return self->_dataSource;
}

- (void)setDataSource:(id)a3
{
  objc_storeStrong((id *)&self->_dataSource, a3);
}

- (UITableView)tableView
{
  return self->_tableView;
}

- (void)setTableView:(id)a3
{
  objc_storeStrong((id *)&self->_tableView, a3);
}

- (double)keyboardHeight
{
  return self->_keyboardHeight;
}

- (void)setKeyboardHeight:(double)a3
{
  self->_keyboardHeight = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tableView, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong(&self->_completion, 0);
}

@end
