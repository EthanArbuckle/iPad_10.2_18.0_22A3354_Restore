@implementation AXUIVoiceOverBluetoothPairController

- (AXUIVoiceOverBluetoothPairController)init
{
  AXUIVoiceOverBluetoothPairController *v2;
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)AXUIVoiceOverBluetoothPairController;
  v2 = -[AXUISettingsSetupCapableListController init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObserver:selector:name:object:", v2, sel_deviceUpdated_, *MEMORY[0x1E0CF4EE0], 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObserver:selector:name:object:", v2, sel_keyboardWillShow_, *MEMORY[0x1E0DC4FE8], 0);

  }
  return v2;
}

- (void)loadView
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)AXUIVoiceOverBluetoothPairController;
  -[AXUIVoiceOverBluetoothPairController loadView](&v10, sel_loadView);
  v3 = (void *)objc_msgSend(objc_allocWithZone(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 1, self, sel_cancelButtonClicked_);
  v4 = objc_allocWithZone(MEMORY[0x1E0DC34F0]);
  AXUILocalizedStringForKey(CFSTR("PAIR"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithTitle:style:target:action:", v5, 2, self, sel_doneButtonClicked_);

  -[AXUIVoiceOverBluetoothPairController navigationItem](self, "navigationItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setLeftBarButtonItem:", v3);

  -[AXUIVoiceOverBluetoothPairController navigationItem](self, "navigationItem");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setRightBarButtonItem:", v6);

  AXUILocalizedStringForKey(CFSTR("PAIRING_PROMPT"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXUIVoiceOverBluetoothPairController updatePrompt:](self, "updatePrompt:", v9);

}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)AXUIVoiceOverBluetoothPairController;
  -[AXUIVoiceOverBluetoothPairController viewWillAppear:](&v9, sel_viewWillAppear_, a3);
  -[AXUIVoiceOverBluetoothPairController navigationItem](self, "navigationItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "rightBarButtonItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setEnabled:", 0);

  -[AXUIVoiceOverBluetoothPairController internalTableView](self, "internalTableView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXUIVoiceOverBluetoothPairController indexPathForIndex:](self, "indexPathForIndex:", 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "cellForRowAtIndexPath:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "becomeFirstResponder");

}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)AXUIVoiceOverBluetoothPairController;
  -[AXUISettingsSetupCapableListController dealloc](&v4, sel_dealloc);
}

- (void)updatePrompt:(id)a3
{
  NSString **p_promptFormat;
  id v6;
  void *v7;
  NSString *v8;
  void *v9;
  void *v10;
  id v11;

  p_promptFormat = &self->_promptFormat;
  objc_storeStrong((id *)&self->_promptFormat, a3);
  v6 = a3;
  -[AXUIVoiceOverBluetoothPairController navigationItem](self, "navigationItem");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0CB3940];
  v8 = *p_promptFormat;
  -[AXUIBluetoothDevice name](self->_device, "name");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringWithFormat:", v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "setPrompt:", v10);
}

- (void)cancelButtonClicked:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  self->_dismissed = 1;
  objc_opt_class();
  -[AXUIVoiceOverBluetoothPairController specifier](self, "specifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "userInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "setObject:forKey:", CFSTR("cancelled"), CFSTR("PIN-ended"));
  -[AXUIBluetoothDevice setPIN:](self->_device, "setPIN:", 0);
  -[AXUIVoiceOverBluetoothPairController parentController](self, "parentController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "dismiss");

}

- (void)doneButtonClicked:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  unint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  AXUIBluetoothDevice *device;
  void *v14;
  void *v15;

  v4 = a3;
  -[AXUIVoiceOverBluetoothPairController internalTableView](self, "internalTableView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXUIVoiceOverBluetoothPairController indexPathForIndex:](self, "indexPathForIndex:", 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXUIVoiceOverBluetoothPairController tableView:cellForRowAtIndexPath:](self, "tableView:cellForRowAtIndexPath:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(v7, "value");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "length");

    if (v9 >= 4)
    {
      self->_dismissed = 1;
      objc_opt_class();
      -[AXUIVoiceOverBluetoothPairController specifier](self, "specifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "userInfo");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      __UIAccessibilityCastAsClass();
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v12, "setObject:forKey:", CFSTR("entered"), CFSTR("PIN-ended"));
      device = self->_device;
      objc_msgSend(v7, "value");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[AXUIBluetoothDevice setPIN:](device, "setPIN:", v14);

      -[AXUIVoiceOverBluetoothPairController parentController](self, "parentController");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "dismiss");

    }
  }

}

- (void)deviceUpdated:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  _BOOL4 dismissed;
  void *v8;
  NSString *promptFormat;
  void *v10;
  id v11;

  objc_msgSend(a3, "object");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "address");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXUIBluetoothDevice address](self->_device, "address");
  v5 = objc_claimAutoreleasedReturnValue();
  if (v4 == (void *)v5)
  {
    dismissed = self->_dismissed;

    if (dismissed)
      goto LABEL_5;
    -[AXUIVoiceOverBluetoothPairController navigationItem](self, "navigationItem");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)MEMORY[0x1E0CB3940];
    promptFormat = self->_promptFormat;
    objc_msgSend(v11, "name");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringWithFormat:", promptFormat, v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setTitle:", v10);

  }
  else
  {
    v6 = (void *)v5;
  }

LABEL_5:
}

- (void)keyboardWillShow:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  int v7;
  id v8;

  -[AXUIVoiceOverBluetoothPairController internalTableView](self, "internalTableView", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXUIVoiceOverBluetoothPairController indexPathForIndex:](self, "indexPathForIndex:", 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cellForRowAtIndexPath:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isFirstResponder");

  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0DC3938], "activeKeyboard");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setReturnKeyEnabled:", 0);

  }
}

- (void)textDidChange:(id)a3
{
  void *v4;
  _BOOL8 v5;
  void *v6;
  void *v7;
  id v8;

  objc_msgSend(a3, "text");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (unint64_t)objc_msgSend(v4, "length") > 3;

  -[AXUIVoiceOverBluetoothPairController navigationItem](self, "navigationItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "rightBarButtonItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setEnabled:", v5);

  objc_msgSend(MEMORY[0x1E0DC3938], "activeKeyboard");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setReturnKeyEnabled:", v5);

}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)AXUIVoiceOverBluetoothPairController;
  -[AXUIVoiceOverBluetoothPairController tableView:cellForRowAtIndexPath:](&v9, sel_tableView_cellForRowAtIndexPath_, a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "tag") == 12)
  {
    objc_msgSend(v5, "editableTextField");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
    {
      objc_msgSend(v6, "setKeyboardType:", 4);
      objc_msgSend(v7, "setReturnKeyType:", 9);
      objc_msgSend(v7, "setAutocapitalizationType:", 0);
      objc_msgSend(v7, "addTarget:action:forControlEvents:", self, sel_textDidChange_, 0x20000);
      objc_msgSend(v7, "setDelegate:", self);
    }

  }
  return v5;
}

- (BOOL)textFieldShouldReturn:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  objc_msgSend(v3, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "doneButtonClicked:", v3);

  return 1;
}

- (id)specifiers
{
  void *v3;
  void *v4;
  void *v5;
  AXUIBluetoothDevice *v6;
  AXUIBluetoothDevice *device;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  objc_opt_class();
  -[AXUIVoiceOverBluetoothPairController specifier](self, "specifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "objectForKey:", CFSTR("bt-device"));
  v6 = (AXUIBluetoothDevice *)objc_claimAutoreleasedReturnValue();
  device = self->_device;
  self->_device = v6;

  v8 = (int)*MEMORY[0x1E0D80590];
  v9 = *(Class *)((char *)&self->super.super.super.super.super.super.isa + v8);
  if (!v9)
  {
    v10 = (void *)objc_msgSend(objc_allocWithZone(MEMORY[0x1E0C99DE8]), "init");
    v11 = (void *)MEMORY[0x1E0D804E8];
    AXUILocalizedStringForKey(CFSTR("PASSWORD"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v12, self, sel_emptySetter_specifier_, 0, 0, 12, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "addObject:", v13);
    v14 = *(Class *)((char *)&self->super.super.super.super.super.super.isa + v8);
    *(Class *)((char *)&self->super.super.super.super.super.super.isa + v8) = (Class)v10;

    v9 = *(Class *)((char *)&self->super.super.super.super.super.super.isa + v8);
  }
  v15 = v9;

  return v15;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_promptFormat, 0);
  objc_storeStrong((id *)&self->_device, 0);
}

@end
