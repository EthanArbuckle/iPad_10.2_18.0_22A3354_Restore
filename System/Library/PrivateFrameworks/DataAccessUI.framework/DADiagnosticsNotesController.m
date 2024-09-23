@implementation DADiagnosticsNotesController

- (void)_disableButtons
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  -[PSDetailController pane](self, "pane");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "resignFirstResponder");

  -[PSDetailController pane](self, "pane");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setEnabled:", 0);

  -[DADiagnosticsNotesController navigationItem](self, "navigationItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "leftBarButtonItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setEnabled:", 0);

  -[DADiagnosticsNotesController navigationItem](self, "navigationItem");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "rightBarButtonItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setEnabled:", 0);

}

- (void)_enableButtons
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  -[PSDetailController pane](self, "pane");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setEnabled:", 1);

  -[DADiagnosticsNotesController navigationItem](self, "navigationItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "leftBarButtonItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setEnabled:", 1);

  -[DADiagnosticsNotesController navigationItem](self, "navigationItem");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "rightBarButtonItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setEnabled:", 1);

}

- (void)_cancelButtonPressed
{
  id v2;

  -[DADiagnosticsNotesController parentController](self, "parentController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dismiss");

}

- (void)_okButtonPressed
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  id v8;
  id v9;
  _QWORD block[4];
  id v11;
  id v12;
  DADiagnosticsNotesController *v13;

  -[DADiagnosticsNotesController _disableButtons](self, "_disableButtons");
  -[DADiagnosticsNotesController specifier](self, "specifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "propertyForKey:", CFSTR("kDADiagnosticSaveNotesDelegate"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[PSDetailController pane](self, "pane");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "preferenceValue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  dispatch_get_global_queue(0, 0);
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __48__DADiagnosticsNotesController__okButtonPressed__block_invoke;
  block[3] = &unk_24E437C70;
  v11 = v4;
  v12 = v6;
  v13 = self;
  v8 = v6;
  v9 = v4;
  dispatch_async(v7, block);

}

void __48__DADiagnosticsNotesController__okButtonPressed__block_invoke(uint64_t a1)
{
  _QWORD block[5];

  objc_msgSend(*(id *)(a1 + 32), "saveNotesInBackground:", *(_QWORD *)(a1 + 40));
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __48__DADiagnosticsNotesController__okButtonPressed__block_invoke_2;
  block[3] = &unk_24E437C48;
  block[4] = *(_QWORD *)(a1 + 48);
  dispatch_async(MEMORY[0x24BDAC9B8], block);
}

void __48__DADiagnosticsNotesController__okButtonPressed__block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "_enableButtons");
  objc_msgSend(*(id *)(a1 + 32), "parentController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dismiss");

}

- (DADiagnosticsNotesController)init
{
  DADiagnosticsNotesController *v2;
  DADiagnosticsNotesController *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)DADiagnosticsNotesController;
  v2 = -[DADiagnosticsNotesController init](&v15, sel_init);
  v3 = v2;
  if (v2)
  {
    -[DADiagnosticsNotesController navigationItem](v2, "navigationItem");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("DIAG_NOTES_TITLE"), &stru_24E437D68, CFSTR("Diagnostic"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setTitle:", v6);

    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("DIAGS_NOTES_PROMPT"), &stru_24E437D68, CFSTR("Diagnostic"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setPrompt:", v8);

    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6860]), "initWithBarButtonSystemItem:target:action:", 1, v3, sel__cancelButtonPressed);
    v10 = objc_alloc(MEMORY[0x24BDF6860]);
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("OK"), &stru_24E437D68, CFSTR("Diagnostic"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(v10, "initWithTitle:style:target:action:", v12, 2, v3, sel__okButtonPressed);

    objc_msgSend(v4, "setLeftBarButtonItem:", v9);
    objc_msgSend(v4, "setRightBarButtonItem:", v13);

  }
  return v3;
}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)DADiagnosticsNotesController;
  -[PSDetailController viewWillAppear:](&v5, sel_viewWillAppear_, a3);
  -[PSDetailController pane](self, "pane");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "becomeFirstResponder");

}

- (BOOL)shouldAutorotateToInterfaceOrientation:(int64_t)a3
{
  void *v4;
  uint64_t v5;

  objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "userInterfaceIdiom");

  return a3 == 1 || (v5 & 0xFFFFFFFFFFFFFFFBLL) == 1;
}

@end
