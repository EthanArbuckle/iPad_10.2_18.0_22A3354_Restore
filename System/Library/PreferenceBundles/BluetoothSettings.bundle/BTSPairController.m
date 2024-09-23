@implementation BTSPairController

- (BTSPairController)init
{
  BTSPairController *v2;
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)BTSPairController;
  v2 = -[BTSPairController init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObserver:selector:name:object:", v2, sel_deviceUpdated_, *MEMORY[0x24BE0F978], 0);

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObserver:selector:name:object:", v2, sel_keyboardWillShow_, *MEMORY[0x24BEBE580], 0);

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
  void *v10;
  void *v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)BTSPairController;
  -[BTSPairController loadView](&v12, sel_loadView);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD410]), "initWithBarButtonSystemItem:target:action:", 1, self, sel_cancelButtonClicked_);
  v4 = objc_alloc(MEMORY[0x24BEBD410]);
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("PAIR"), &stru_24FCCE738, CFSTR("Devices"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v4, "initWithTitle:style:target:action:", v6, 2, self, sel_doneButtonClicked_);

  -[BTSPairController navigationItem](self, "navigationItem");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setLeftBarButtonItem:", v3);

  -[BTSPairController navigationItem](self, "navigationItem");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setRightBarButtonItem:", v7);

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("PAIRING_PROMPT"), &stru_24FCCE738, CFSTR("Devices"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[BTSPairController updatePrompt:](self, "updatePrompt:", v11);

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
  v9.super_class = (Class)BTSPairController;
  -[BTSPairController viewWillAppear:](&v9, sel_viewWillAppear_, a3);
  -[BTSPairController navigationItem](self, "navigationItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "rightBarButtonItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setEnabled:", 0);

  v6 = *(Class *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x24BE75700]);
  -[BTSPairController indexPathForIndex:](self, "indexPathForIndex:", 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "cellForRowAtIndexPath:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "becomeFirstResponder");

}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)BTSPairController;
  -[BTSPairController dealloc](&v4, sel_dealloc);
}

- (void)updatePrompt:(id)a3
{
  id v5;
  id v6;

  objc_storeStrong((id *)&self->_promptFormat, a3);
  v5 = a3;
  -[BTSPairController navigationItem](self, "navigationItem");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setPrompt:", v5);

}

- (void)cancelButtonClicked:(id)a3
{
  void *v4;
  id WeakRetained;

  self->_dismissed = 1;
  objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x24BE757A8]), "userInfo", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", CFSTR("cancelled"), CFSTR("PIN-ended"));

  -[BluetoothDevice setPIN:](self->_device, "setPIN:", 0);
  WeakRetained = objc_loadWeakRetained((id *)((char *)&self->super.super.super.super.super.isa
                                            + (int)*MEMORY[0x24BE75790]));
  objc_msgSend(WeakRetained, "dismiss");

}

- (void)doneButtonClicked:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  unint64_t v7;
  void *v8;
  BluetoothDevice *device;
  void *v10;
  id WeakRetained;
  id v12;

  v4 = *(uint64_t *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x24BE75700]);
  -[BTSPairController indexPathForIndex:](self, "indexPathForIndex:", 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[BTSPairController tableView:cellForRowAtIndexPath:](self, "tableView:cellForRowAtIndexPath:", v4, v5);
  v12 = (id)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    objc_msgSend(v12, "value");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "length");

    if (v7 >= 4)
    {
      self->_dismissed = 1;
      objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x24BE757A8]), "userInfo");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setObject:forKey:", CFSTR("entered"), CFSTR("PIN-ended"));

      device = self->_device;
      objc_msgSend(v12, "value");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[BluetoothDevice setPIN:](device, "setPIN:", v10);

      WeakRetained = objc_loadWeakRetained((id *)((char *)&self->super.super.super.super.super.isa
                                                + (int)*MEMORY[0x24BE75790]));
      objc_msgSend(WeakRetained, "dismiss");

    }
  }

}

- (void)deviceUpdated:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  _BOOL4 dismissed;
  void *v8;
  uint64_t *p_promptFormat;
  NSString *promptFormat;
  void *v11;
  void *v12;
  id v13;
  NSObject *v14;
  id v15;

  objc_msgSend(a3, "object");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "address");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[BluetoothDevice address](self->_device, "address");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5 == v6)
  {
    dismissed = self->_dismissed;

    if (!dismissed)
    {
      v8 = (void *)MEMORY[0x24BDD17C8];
      p_promptFormat = (uint64_t *)&self->_promptFormat;
      promptFormat = self->_promptFormat;
      v15 = 0;
      objc_msgSend(v4, "name");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "stringWithValidatedFormat:validFormatSpecifiers:error:", promptFormat, CFSTR("%@"), &v15, v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = v15;

      if (v12)
      {
        -[BTSPairController navigationItem](self, "navigationItem");
        v14 = objc_claimAutoreleasedReturnValue();
        -[NSObject setTitle:](v14, "setTitle:", v12);
      }
      else
      {
        sharedBluetoothSettingsLogComponent();
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
          -[BTSPairController deviceUpdated:].cold.1((uint64_t)v13, p_promptFormat, v14);
      }

    }
  }
  else
  {

  }
}

- (void)keyboardWillShow:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  int v6;
  id v7;

  v3 = *(Class *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x24BE75700]);
  -[BTSPairController indexPathForIndex:](self, "indexPathForIndex:", 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cellForRowAtIndexPath:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isFirstResponder");

  if (v6)
  {
    objc_msgSend(MEMORY[0x24BEBD6C8], "activeKeyboard");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setReturnKeyEnabled:", 0);

  }
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)BTSPairController;
  -[BTSPairController tableView:cellForRowAtIndexPath:](&v9, sel_tableView_cellForRowAtIndexPath_, a3, a4);
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

  -[BTSPairController navigationItem](self, "navigationItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "rightBarButtonItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setEnabled:", v5);

  objc_msgSend(MEMORY[0x24BEBD6C8], "activeKeyboard");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setReturnKeyEnabled:", v5);

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
  BluetoothDevice *v5;
  BluetoothDevice *device;
  uint64_t v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x24BE757A8]), "userInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", CFSTR("bt-device"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "device");
  v5 = (BluetoothDevice *)objc_claimAutoreleasedReturnValue();
  device = self->_device;
  self->_device = v5;

  v7 = (int)*MEMORY[0x24BE756E0];
  v8 = *(Class *)((char *)&self->super.super.super.super.super.isa + v7);
  if (!v8)
  {
    v9 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v10 = (void *)MEMORY[0x24BE75590];
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("PASSWORD"), &stru_24FCCE738, CFSTR("Devices"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v12, self, sel_emptySetter_specifier_, 0, 0, 12, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "addObject:", v13);
    v14 = *(Class *)((char *)&self->super.super.super.super.super.isa + v7);
    *(Class *)((char *)&self->super.super.super.super.super.isa + v7) = (Class)v9;

    v8 = *(Class *)((char *)&self->super.super.super.super.super.isa + v7);
  }
  v15 = v8;

  return v15;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_promptFormat, 0);
  objc_storeStrong((id *)&self->_device, 0);
}

- (void)deviceUpdated:(os_log_t)log .cold.1(uint64_t a1, uint64_t *a2, os_log_t log)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v3 = *a2;
  v4 = 138412546;
  v5 = a1;
  v6 = 2112;
  v7 = v3;
  _os_log_error_impl(&dword_22F721000, log, OS_LOG_TYPE_ERROR, "bad format string in notification (%@): %@", (uint8_t *)&v4, 0x16u);
}

@end
