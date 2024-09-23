@implementation BTDeviceNameEditingController

- (BTDeviceNameEditingController)init
{
  BTDeviceNameEditingController *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)BTDeviceNameEditingController;
  v2 = -[BTDeviceNameEditingController init](&v5, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObserver:selector:name:object:", v2, sel_keyboardWillShow_, *MEMORY[0x1E0DC4FE8], 0);

  }
  return v2;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)BTDeviceNameEditingController;
  -[BTDeviceNameEditingController dealloc](&v4, sel_dealloc);
}

- (id)specifiers
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  BluetoothDeviceProtocol *v7;
  BluetoothDeviceProtocol *currentDevice;
  void *v9;
  NSString *v10;
  NSString *deviceName;
  void *v12;
  NSString *v13;
  NSString *productName;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  id WeakRetained;
  void *v20;
  void *v21;

  v3 = (int)*MEMORY[0x1E0D80590];
  v4 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
  if (!v4)
  {
    objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x1E0D80628]), "userInfo");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[HPSDevice deviceKey](HPSDevice, "deviceKey");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", v6);
    v7 = (BluetoothDeviceProtocol *)objc_claimAutoreleasedReturnValue();
    currentDevice = self->_currentDevice;
    self->_currentDevice = v7;

    -[BluetoothDeviceProtocol classicDevice](self->_currentDevice, "classicDevice");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "name");
    v10 = (NSString *)objc_claimAutoreleasedReturnValue();
    deviceName = self->_deviceName;
    self->_deviceName = v10;

    -[BluetoothDeviceProtocol classicDevice](self->_currentDevice, "classicDevice");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "productName");
    v13 = (NSString *)objc_claimAutoreleasedReturnValue();
    productName = self->_productName;
    self->_productName = v13;

    v15 = objc_alloc(MEMORY[0x1E0C99DE8]);
    objc_msgSend(MEMORY[0x1E0D804E8], "emptyGroupSpecifier");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)objc_msgSend(v15, "initWithObjects:", v16, 0);

    v18 = (void *)MEMORY[0x1E0D804E8];
    WeakRetained = objc_loadWeakRetained((id *)((char *)&self->super.super.super.super.super.isa
                                              + (int)*MEMORY[0x1E0D80618]));
    objc_msgSend(v18, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", 0, WeakRetained, sel_saveEditedName_specifier_, sel_getDeviceName_, 0, 8, 0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v20, "setProperty:forKey:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0D80800]);
    objc_msgSend(v17, "addObject:", v20);
    v21 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
    *(Class *)((char *)&self->super.super.super.super.super.isa + v3) = (Class)v17;

    v4 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
  }
  return v4;
}

- (void)suspend
{
  void *v3;
  objc_super v4;

  objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x1E0D80598]), "firstResponder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "resignFirstResponder");

  v4.receiver = self;
  v4.super_class = (Class)BTDeviceNameEditingController;
  -[BTDeviceNameEditingController suspend](&v4, sel_suspend);
}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BTDeviceNameEditingController;
  -[BTDeviceNameEditingController viewWillAppear:](&v3, sel_viewWillAppear_, a3);
}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BTDeviceNameEditingController;
  -[BTDeviceNameEditingController viewDidAppear:](&v3, sel_viewDidAppear_, a3);
}

- (void)viewWillDisappear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  objc_super v6;

  v3 = a3;
  objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x1E0D80598]), "firstResponder");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "resignFirstResponder");

  v6.receiver = self;
  v6.super_class = (Class)BTDeviceNameEditingController;
  -[BTDeviceNameEditingController viewWillDisappear:](&v6, sel_viewWillDisappear_, v3);
}

- (void)viewDidDisappear:(BOOL)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BTDeviceNameEditingController;
  -[BTDeviceNameEditingController viewDidDisappear:](&v3, sel_viewDidDisappear_, a3);
}

- (BOOL)shouldSelectResponderOnAppearance
{
  return 1;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  NSString **p_deviceName;
  void *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)BTDeviceNameEditingController;
  -[BTDeviceNameEditingController tableView:cellForRowAtIndexPath:](&v11, sel_tableView_cellForRowAtIndexPath_, a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "editableTextField");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "setReturnKeyType:", 9);
    objc_msgSend(v7, "setAutocapitalizationType:", 0);
    objc_msgSend(v7, "setAutocorrectionType:", 1);
    objc_msgSend(v7, "setAutoresizesTextToFit:", 1);
    objc_msgSend(v7, "setTextAlignment:", 4);
    objc_msgSend(v7, "setClearButtonMode:", 3);
    objc_msgSend(v7, "addTarget:action:forEvents:", self, sel_textDidChange_, 0x20000);
    objc_msgSend(v7, "setDelegate:", self);
    p_deviceName = &self->_deviceName;
    objc_msgSend(v7, "setText:", self->_deviceName);
    -[BluetoothDeviceProtocol classicDevice](self->_currentDevice, "classicDevice");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v9, "magicPaired") & 1) == 0)
      p_deviceName = &self->_productName;
    objc_msgSend(v7, "setPlaceholder:", *p_deviceName);

  }
  return v5;
}

- (void)keyboardWillShow:(id)a3
{
  void *v4;
  uint64_t v5;

  objc_msgSend(MEMORY[0x1E0DC3938], "activeKeyboard", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[BTDeviceNameEditingController keyboardShownOnce](self, "keyboardShownOnce"))
    v5 = -[BluetoothDeviceProtocol connected](self->_currentDevice, "connected");
  else
    v5 = 0;
  objc_msgSend(v4, "setReturnKeyEnabled:", v5);

  if (!-[BTDeviceNameEditingController keyboardShownOnce](self, "keyboardShownOnce"))
    -[BTDeviceNameEditingController setKeyboardShownOnce:](self, "setKeyboardShownOnce:", 1);
}

- (void)textDidChange:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;

  v10 = a3;
  objc_msgSend(v10, "text");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringByTrimmingCharactersInSet:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend(v6, "length"))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      objc_msgSend(v10, "setText:", &stru_1EA29D890);
  }
  if ((unint64_t)objc_msgSend(v6, "length") > 0x3C)
  {
    v8 = 0;
  }
  else
  {
    -[BluetoothDeviceProtocol name](self->_currentDevice, "name");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v6, "isEqualToString:", v7) & 1) != 0)
      v8 = 0;
    else
      v8 = -[BluetoothDeviceProtocol connected](self->_currentDevice, "connected");

  }
  objc_msgSend(MEMORY[0x1E0DC3938], "activeKeyboard");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setReturnKeyEnabled:", v8);

}

- (BOOL)textFieldShouldReturn:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  int v11;
  void *v12;
  char v13;
  id WeakRetained;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  int v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "text");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringByTrimmingCharactersInSet:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend(v7, "length"))
  {
    sharedBluetoothSettingsLogComponent();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v4, "placeholder");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = 138477827;
      v21 = v9;
      _os_log_impl(&dword_1DB30C000, v8, OS_LOG_TYPE_DEFAULT, "Textfield empty, setting it as placeholder: %{private}@", (uint8_t *)&v20, 0xCu);

    }
    objc_msgSend(v4, "placeholder");
    v10 = objc_claimAutoreleasedReturnValue();

    v7 = (void *)v10;
  }
  v11 = -[BluetoothDeviceProtocol connected](self->_currentDevice, "connected");
  if (v11)
  {
    -[BluetoothDeviceProtocol name](self->_currentDevice, "name");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v7, "isEqualToString:", v12);

    if ((v13 & 1) == 0)
    {
      WeakRetained = objc_loadWeakRetained((id *)((char *)&self->super.super.super.super.super.isa
                                                + (int)*MEMORY[0x1E0D80618]));
      objc_msgSend(WeakRetained, "setTitle:", v7);

      -[BluetoothDeviceProtocol classicDevice](self->_currentDevice, "classicDevice");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setUserName:", v7);

      -[BluetoothDeviceProtocol classicDevice](self->_currentDevice, "classicDevice");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v15) = objc_msgSend(v16, "magicPaired");

      if ((_DWORD)v15)
        objc_msgSend(v4, "setPlaceholder:", v7);
    }
    objc_msgSend(v4, "setText:", v7);
  }
  else
  {
    sharedBluetoothSettingsLogComponent();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v20) = 0;
      _os_log_impl(&dword_1DB30C000, v17, OS_LOG_TYPE_DEFAULT, "Cannot rename when device is disconnected", (uint8_t *)&v20, 2u);
    }

    objc_msgSend(MEMORY[0x1E0DC3938], "activeKeyboard");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setReturnKeyEnabled:", 0);

  }
  return v11;
}

- (id)getDeviceName:(id)a3
{
  return self->_deviceName;
}

- (BOOL)keyboardShownOnce
{
  return self->_keyboardShownOnce;
}

- (void)setKeyboardShownOnce:(BOOL)a3
{
  self->_keyboardShownOnce = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_productName, 0);
  objc_storeStrong((id *)&self->_deviceName, 0);
  objc_storeStrong((id *)&self->_currentDevice, 0);
}

@end
