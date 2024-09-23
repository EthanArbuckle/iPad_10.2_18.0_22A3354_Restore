@implementation AKSignaturesViewController_iOS

- (AKSignaturesViewController_iOS)initWithController:(id)a3
{
  id v4;
  AKSignaturesViewController_iOS *v5;
  AKSignaturesViewController_iOS *v6;
  void *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AKSignaturesViewController_iOS;
  v5 = -[AKSignaturesViewController_iOS initWithNibName:bundle:](&v9, sel_initWithNibName_bundle_, 0, 0);
  v6 = v5;
  if (v5)
  {
    -[AKSignaturesViewController_iOS setController:](v5, "setController:", v4);
    objc_msgSend(MEMORY[0x24BDF6950], "systemBackgroundColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[AKSignaturesViewController_iOS setTableBackgroundColor:](v6, "setTableBackgroundColor:", v7);

    -[AKSignaturesViewController_iOS setAllowsEdits:](v6, "setAllowsEdits:", 0);
    -[AKSignaturesViewController_iOS setShowsNavigationBar:](v6, "setShowsNavigationBar:", 0);
  }

  return v6;
}

- (CGSize)preferredContentSize
{
  _BOOL4 v3;
  double v4;
  double v5;
  double v6;
  CGSize result;

  v3 = -[AKSignaturesViewController_iOS presentedInAlert](self, "presentedInAlert");
  -[AKSignaturesViewController_iOS idealHeight](self, "idealHeight");
  v5 = v4;
  v6 = 540.0;
  if (v3)
    v6 = 0.0;
  result.height = v5;
  result.width = v6;
  return result;
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
  void *v10;
  uint64_t v11;
  void *v12;
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
  v21.super_class = (Class)AKSignaturesViewController_iOS;
  -[AKSignaturesViewController_iOS viewDidLoad](&v21, sel_viewDidLoad);
  +[AKController akBundle](AKController, "akBundle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("Signatures"), &stru_24F1A83D0, CFSTR("AKSignaturesViewController_iOS"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKSignaturesViewController_iOS setTitle:](self, "setTitle:", v4);

  v5 = objc_alloc(MEMORY[0x24BDF6E58]);
  -[AKSignaturesViewController_iOS view](self, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bounds");
  v7 = (void *)objc_msgSend(v5, "initWithFrame:style:", 0);
  -[AKSignaturesViewController_iOS setTableView:](self, "setTableView:", v7);

  -[AKSignaturesViewController_iOS tableView](self, "tableView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[AKSignaturesViewController_iOS tableView](self, "tableView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setDelegate:", self);

  -[AKSignaturesViewController_iOS tableView](self, "tableView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setDataSource:", self);

  v11 = -[AKSignaturesViewController_iOS presentedInAlert](self, "presentedInAlert") ^ 1;
  -[AKSignaturesViewController_iOS tableView](self, "tableView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setAlwaysBounceVertical:", v11);

  -[AKSignaturesViewController_iOS tableView](self, "tableView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setRowHeight:", 86.0);

  -[AKSignaturesViewController_iOS view](self, "view");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKSignaturesViewController_iOS tableView](self, "tableView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "addSubview:", v15);

  _NSDictionaryOfVariableBindings(CFSTR("_tableView"), self->_tableView, 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKSignaturesViewController_iOS view](self, "view");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1628], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:|[_tableView]|"), 0, 0, v16);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "addConstraints:", v18);

  -[AKSignaturesViewController_iOS view](self, "view");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1628], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:|[_tableView]|"), 0, v16, v16);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "addConstraints:", v20);

  -[AKSignaturesViewController_iOS _configureUI](self, "_configureUI");
}

- (BOOL)becomeFirstResponder
{
  void *v3;
  void *v4;
  AKSignaturesViewController_iOS *v5;
  _BOOL4 v6;
  objc_super v9;

  -[AKSignaturesViewController_iOS view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "window");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstResponder");
  v5 = (AKSignaturesViewController_iOS *)objc_claimAutoreleasedReturnValue();

  v9.receiver = self;
  v9.super_class = (Class)AKSignaturesViewController_iOS;
  v6 = -[AKSignaturesViewController_iOS becomeFirstResponder](&v9, sel_becomeFirstResponder);
  if (v6 && v5 != self)
    -[AKSignaturesViewController_iOS setResponderToRestore:](self, "setResponderToRestore:", v5);

  return v6;
}

- (BOOL)canBecomeFirstResponder
{
  return 1;
}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)AKSignaturesViewController_iOS;
  -[AKSignaturesViewController_iOS viewDidAppear:](&v4, sel_viewDidAppear_, a3);
  if ((-[AKSignaturesViewController_iOS isFirstResponder](self, "isFirstResponder") & 1) == 0)
    -[AKSignaturesViewController_iOS becomeFirstResponder](self, "becomeFirstResponder");
}

- (void)viewDidDisappear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  objc_super v7;

  v3 = a3;
  -[AKSignaturesViewController_iOS resignFirstResponder](self, "resignFirstResponder");
  -[AKSignaturesViewController_iOS responderToRestore](self, "responderToRestore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
    objc_msgSend(v5, "becomeFirstResponder");
  -[AKSignaturesViewController_iOS setResponderToRestore:](self, "setResponderToRestore:", 0);
  v7.receiver = self;
  v7.super_class = (Class)AKSignaturesViewController_iOS;
  -[AKSignaturesViewController_iOS viewDidDisappear:](&v7, sel_viewDidDisappear_, v3);

}

- (double)idealHeight
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  unint64_t v7;
  double v8;
  double v9;
  void *v10;
  double v11;

  -[AKSignaturesViewController_iOS controller](self, "controller");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "signatureModelController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "signatures");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (-[AKSignaturesViewController_iOS presentedInAlert](self, "presentedInAlert"))
  {
    v7 = 3;
    if (v6 < 3)
      v7 = v6;
  }
  else
  {
    v7 = 4;
    if (v6 > 4)
      v7 = v6;
    if (v7 > 6)
    {
      v8 = 559.0;
      goto LABEL_10;
    }
  }
  v8 = (double)(uint64_t)(86 * v7);
LABEL_10:
  v9 = v8 + -1.0;
  if (-[AKSignaturesViewController_iOS showsNavigationBar](self, "showsNavigationBar"))
  {
    -[AKSignaturesViewController_iOS navBar](self, "navBar");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "bounds");
    v9 = v9 + v11;

  }
  return v9;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)_configureUI
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _BOOL8 v7;
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
  id v20;
  void *v21;
  void *v22;
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
  _QWORD v34[2];

  v34[1] = *MEMORY[0x24BDAC8D0];
  -[AKSignaturesViewController_iOS tableBackgroundColor](self, "tableBackgroundColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKSignaturesViewController_iOS view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBackgroundColor:", v3);

  -[AKSignaturesViewController_iOS tableBackgroundColor](self, "tableBackgroundColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKSignaturesViewController_iOS tableView](self, "tableView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setBackgroundColor:", v5);

  v7 = -[AKSignaturesViewController_iOS allowsEdits](self, "allowsEdits");
  -[AKSignaturesViewController_iOS tableView](self, "tableView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setEditing:", v7);

  if (-[AKSignaturesViewController_iOS showsNavigationBar](self, "showsNavigationBar"))
  {
    v9 = objc_alloc(MEMORY[0x24BDF6BE0]);
    v10 = (void *)objc_msgSend(v9, "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
    objc_msgSend(v10, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v10, "setDelegate:", self);
    -[AKSignaturesViewController_iOS view](self, "view");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addSubview:", v10);

    -[AKSignaturesViewController_iOS setNavBar:](self, "setNavBar:", v10);
    _NSDictionaryOfVariableBindings(CFSTR("navBar"), v10, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[AKSignaturesViewController_iOS view](self, "view");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1628], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:|[navBar]|"), 0, 0, v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addConstraints:", v14);

    objc_msgSend(v10, "topAnchor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[AKSignaturesViewController_iOS view](self, "view");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "safeAreaLayoutGuide");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "topAnchor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "constraintEqualToAnchor:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v19, "setActive:", 1);
    v20 = objc_alloc(MEMORY[0x24BDF6C00]);
    -[AKSignaturesViewController_iOS title](self, "title");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = (void *)objc_msgSend(v20, "initWithTitle:", v21);

    v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6860]), "initWithBarButtonSystemItem:target:action:", 4, self, sel__continueToCreateSignature_);
    v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6860]), "initWithBarButtonSystemItem:target:action:", 0, self, sel__cancelPicker_);
    v34[0] = v24;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v34, 1);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[AKSignaturesViewController_iOS setRightBarItems:](self, "setRightBarItems:", v25);

    v33 = v23;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v33, 1);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[AKSignaturesViewController_iOS setLeftBarItems:](self, "setLeftBarItems:", v26);

    -[AKSignaturesViewController_iOS leftBarItems](self, "leftBarItems");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setLeftBarButtonItems:", v27);

    -[AKSignaturesViewController_iOS rightBarItems](self, "rightBarItems");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setRightBarButtonItems:", v28);

    -[AKSignaturesViewController_iOS title](self, "title");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setTitle:", v29);

    v32 = v22;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v32, 1);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setItems:", v30);

    -[AKSignaturesViewController_iOS view](self, "view");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "layoutIfNeeded");

  }
  -[AKSignaturesViewController_iOS _updateSignatureCellLayout](self, "_updateSignatureCellLayout");
}

- (void)viewDidLayoutSubviews
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  id v7;

  -[AKSignaturesViewController_iOS navBar](self, "navBar");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[AKSignaturesViewController_iOS navBar](self, "navBar");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "frame");
    v5 = v4;
    -[AKSignaturesViewController_iOS tableView](self, "tableView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setContentInset:", v5, 0.0, 0.0, 0.0);

  }
}

- (void)_continueToCreateSignature:(id)a3
{
  id v4;

  AKLog(CFSTR("%s"));
  -[AKSignaturesViewController_iOS delegate](self, "delegate", "-[AKSignaturesViewController_iOS _continueToCreateSignature:]");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v4, "signaturesViewControllerContinueToCreateSignature:", self);

}

- (void)_cancelPicker:(id)a3
{
  id v4;

  AKLog(CFSTR("%s"));
  -[AKSignaturesViewController_iOS delegate](self, "delegate", "-[AKSignaturesViewController_iOS _cancelPicker:]");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v4, "signaturesViewControllerDidCancel:", self);

}

- (id)_signatures
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x24BDAC8D0];
  -[AKSignaturesViewController_iOS controller](self, "controller");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "signatureModelController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "signatures");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD17C0], "sortDescriptorWithKey:ascending:", CFSTR("creationDate"), 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v5;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v9, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sortedArrayUsingDescriptors:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)_deleteSignature:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  if (a3)
  {
    v4 = a3;
    -[AKSignaturesViewController_iOS controller](self, "controller");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "signatureModelController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "mutableArrayValueForKey:", CFSTR("signatures"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    AKLog(CFSTR("Delete signature %@"));
    objc_msgSend(v6, "removeObject:", v4, v4);

  }
}

- (void)_updateSignatureCellLayout
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  int64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t j;
  int64_t signatureImageContentMode;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  if (-[AKSignaturesViewController_iOS presentedInAlert](self, "presentedInAlert"))
  {
    -[AKSignaturesViewController_iOS controller](self, "controller");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "signatureModelController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "signatures");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v27 = 0u;
    v28 = 0u;
    v25 = 0u;
    v26 = 0u;
    v6 = v5;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v26;
      v10 = 4;
      while (2)
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v26 != v9)
            objc_enumerationMutation(v6);
          if (objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1) + 8 * i), "descriptionTag"))
          {
            -[AKSignaturesViewController_iOS view](self, "view");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v12, "effectiveUserInterfaceLayoutDirection") == 1)
              v10 = 8;
            else
              v10 = 7;

            goto LABEL_19;
          }
        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
        if (v8)
          continue;
        break;
      }
    }
    else
    {
      v10 = 4;
    }
LABEL_19:

  }
  else
  {
    -[AKSignaturesViewController_iOS view](self, "view");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "effectiveUserInterfaceLayoutDirection") == 1)
      v10 = 8;
    else
      v10 = 7;
  }

  if (v10 != self->_signatureImageContentMode)
  {
    self->_signatureImageContentMode = v10;
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    -[AKSignaturesViewController_iOS tableView](self, "tableView", 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "visibleCells");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v22;
      do
      {
        for (j = 0; j != v16; ++j)
        {
          if (*(_QWORD *)v22 != v17)
            objc_enumerationMutation(v14);
          signatureImageContentMode = self->_signatureImageContentMode;
          objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * j), "signatureImageView");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "setContentMode:", signatureImageContentMode);

        }
        v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
      }
      while (v16);
    }

  }
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  void *v4;
  int64_t v5;

  -[AKSignaturesViewController_iOS _signatures](self, "_signatures", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  return v5;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v5;
  void *v6;
  AKSignatureTableViewCell *v7;
  void *v8;
  void *v9;
  void *v10;
  int64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;

  v5 = a4;
  -[AKSignaturesViewController_iOS tableView](self, "tableView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dequeueReusableCellWithIdentifier:", CFSTR("AKSignatureCellIdentifier"));
  v7 = (AKSignatureTableViewCell *)objc_claimAutoreleasedReturnValue();

  if (!v7)
    v7 = -[AKSignatureTableViewCell initWithStyle:reuseIdentifier:]([AKSignatureTableViewCell alloc], "initWithStyle:reuseIdentifier:", 0, CFSTR("AKSignatureCellIdentifier"));
  objc_msgSend(MEMORY[0x24BDF6950], "clearColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKSignatureTableViewCell contentView](v7, "contentView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setBackgroundColor:", v8);

  objc_msgSend(MEMORY[0x24BDF6950], "clearColor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKSignatureTableViewCell setBackgroundColor:](v7, "setBackgroundColor:", v10);

  v11 = -[AKSignaturesViewController_iOS signatureImageContentMode](self, "signatureImageContentMode");
  -[AKSignatureTableViewCell signatureImageView](v7, "signatureImageView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setContentMode:", v11);

  -[AKSignaturesViewController_iOS _signatures](self, "_signatures");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v5, "row");

  objc_msgSend(v13, "objectAtIndex:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  -[AKSignatureTableViewCell setSignature:](v7, "setSignature:", v15);
  return v7;
}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5
{
  id v7;
  double v8;
  double v9;
  double v10;
  double v11;
  uint64_t v12;
  void *v13;
  _BOOL8 v14;
  id v15;

  v15 = a4;
  v7 = a5;
  if (-[AKSignaturesViewController_iOS presentedInAlert](self, "presentedInAlert"))
  {
    v8 = *MEMORY[0x24BDF7718];
    v9 = *(double *)(MEMORY[0x24BDF7718] + 8);
    v10 = *(double *)(MEMORY[0x24BDF7718] + 16);
    v11 = *(double *)(MEMORY[0x24BDF7718] + 24);
    objc_msgSend(v15, "setLayoutMargins:", *MEMORY[0x24BDF7718], v9, v10, v11);
    objc_msgSend(v15, "setSeparatorInset:", v8, v9, v10, v11);
    objc_msgSend(v15, "setPreservesSuperviewLayoutMargins:", 0);
    v12 = objc_msgSend(v7, "row");
    -[AKSignaturesViewController_iOS _signatures](self, "_signatures");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v12 != objc_msgSend(v13, "count") - 1;

    objc_msgSend(v15, "setSeparatorStyle:", v14);
  }

}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v6 = a4;
  v7 = a3;
  -[AKSignaturesViewController_iOS controller](self, "controller");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  -[AKSignaturesViewController_iOS _signatures](self, "_signatures");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectAtIndex:", objc_msgSend(v6, "row"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "signatureModelController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setSelectedSignature:", v9);

  AKLog(CFSTR("Selected signature %@"));
  objc_msgSend(v7, "deselectRowAtIndexPath:animated:", v6, 1, v9);

  -[AKSignaturesViewController_iOS delegate](self, "delegate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v11, "signaturesViewControllerDidSelectSignature:", self);

}

- (BOOL)tableView:(id)a3 canEditRowAtIndexPath:(id)a4
{
  return !-[AKSignaturesViewController_iOS presentedInAlert](self, "presentedInAlert", a3, a4);
}

- (void)tableView:(id)a3 commitEditingStyle:(int64_t)a4 forRowAtIndexPath:(id)a5
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x24BDAC8D0];
  if (a4 == 1)
  {
    v6 = a5;
    -[AKSignaturesViewController_iOS _signatures](self, "_signatures");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectAtIndex:", objc_msgSend(v6, "row"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    -[AKSignaturesViewController_iOS _deleteSignature:](self, "_deleteSignature:", v8);
    -[AKSignaturesViewController_iOS tableView](self, "tableView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = v6;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v11, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "deleteRowsAtIndexPaths:withRowAnimation:", v10, 100);
  }
}

- (int64_t)positionForBar:(id)a3
{
  return 3;
}

- (void)signatureCreationControllerDidCreateSignature:(id)a3
{
  id v4;

  -[AKSignaturesViewController_iOS delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v4, "signaturesViewControllerDidSelectSignature:", self);
  -[AKSignaturesViewController_iOS _updateSignatureCellLayout](self, "_updateSignatureCellLayout");

}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)AKSignaturesViewController_iOS;
  v4 = a3;
  -[AKSignaturesViewController_iOS traitCollectionDidChange:](&v9, sel_traitCollectionDidChange_, v4);
  objc_msgSend(MEMORY[0x24BDF6950], "systemBackgroundColor", v9.receiver, v9.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKSignaturesViewController_iOS setTableBackgroundColor:](self, "setTableBackgroundColor:", v5);

  -[AKSignaturesViewController_iOS traitCollection](self, "traitCollection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "hasDifferentColorAppearanceComparedToTraitCollection:", v4);

  if (v7)
  {
    -[AKSignaturesViewController_iOS tableView](self, "tableView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "reloadData");

  }
}

- (AKController)controller
{
  return (AKController *)objc_loadWeakRetained((id *)&self->_controller);
}

- (void)setController:(id)a3
{
  objc_storeWeak((id *)&self->_controller, a3);
}

- (AKSignaturesViewControllerDelegate)delegate
{
  return (AKSignaturesViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)presentedInAlert
{
  return self->_presentedInAlert;
}

- (void)setPresentedInAlert:(BOOL)a3
{
  self->_presentedInAlert = a3;
}

- (BOOL)showsNavigationBar
{
  return self->_showsNavigationBar;
}

- (void)setShowsNavigationBar:(BOOL)a3
{
  self->_showsNavigationBar = a3;
}

- (BOOL)allowsEdits
{
  return self->_allowsEdits;
}

- (void)setAllowsEdits:(BOOL)a3
{
  self->_allowsEdits = a3;
}

- (BOOL)showAddEditButtonRow
{
  return self->_showAddEditButtonRow;
}

- (void)setShowAddEditButtonRow:(BOOL)a3
{
  self->_showAddEditButtonRow = a3;
}

- (UIColor)tableBackgroundColor
{
  return self->_tableBackgroundColor;
}

- (void)setTableBackgroundColor:(id)a3
{
  objc_storeStrong((id *)&self->_tableBackgroundColor, a3);
}

- (UITableView)tableView
{
  return self->_tableView;
}

- (void)setTableView:(id)a3
{
  objc_storeStrong((id *)&self->_tableView, a3);
}

- (UINavigationBar)navBar
{
  return self->_navBar;
}

- (void)setNavBar:(id)a3
{
  objc_storeStrong((id *)&self->_navBar, a3);
}

- (NSArray)rightBarItems
{
  return self->_rightBarItems;
}

- (void)setRightBarItems:(id)a3
{
  objc_storeStrong((id *)&self->_rightBarItems, a3);
}

- (NSArray)editingLeftBarItems
{
  return self->_editingLeftBarItems;
}

- (void)setEditingLeftBarItems:(id)a3
{
  objc_storeStrong((id *)&self->_editingLeftBarItems, a3);
}

- (NSArray)leftBarItems
{
  return self->_leftBarItems;
}

- (void)setLeftBarItems:(id)a3
{
  objc_storeStrong((id *)&self->_leftBarItems, a3);
}

- (UIResponder)responderToRestore
{
  return (UIResponder *)objc_loadWeakRetained((id *)&self->_responderToRestore);
}

- (void)setResponderToRestore:(id)a3
{
  objc_storeWeak((id *)&self->_responderToRestore, a3);
}

- (int64_t)signatureImageContentMode
{
  return self->_signatureImageContentMode;
}

- (void)setSignatureImageContentMode:(int64_t)a3
{
  self->_signatureImageContentMode = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_responderToRestore);
  objc_storeStrong((id *)&self->_leftBarItems, 0);
  objc_storeStrong((id *)&self->_editingLeftBarItems, 0);
  objc_storeStrong((id *)&self->_rightBarItems, 0);
  objc_storeStrong((id *)&self->_navBar, 0);
  objc_storeStrong((id *)&self->_tableView, 0);
  objc_storeStrong((id *)&self->_tableBackgroundColor, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_controller);
}

@end
