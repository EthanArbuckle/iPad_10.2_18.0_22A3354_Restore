@implementation ASAccessoryNameEditingController

- (ASAccessoryNameEditingController)init
{
  ASAccessoryNameEditingController *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)ASAccessoryNameEditingController;
  v2 = -[ASAccessoryNameEditingController init](&v5, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObserver:selector:name:object:", v2, sel_keyboardWillShow_, *MEMORY[0x24BEBE580], 0);

  }
  return v2;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)ASAccessoryNameEditingController;
  -[ASAccessoryNameEditingController dealloc](&v4, sel_dealloc);
}

- (void)viewDidLoad
{
  DASession *v3;
  DASession *session;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ASAccessoryNameEditingController;
  -[ASAccessoryNameEditingController viewDidLoad](&v6, sel_viewDidLoad);
  if (!self->_session)
  {
    v3 = (DASession *)objc_alloc_init(MEMORY[0x24BE2BEF8]);
    session = self->_session;
    self->_session = v3;

    objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x24BE757B0]), "propertyForKey:", CFSTR("bundleID"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[DASession setBundleID:](self->_session, "setBundleID:", v5);

  }
}

- (id)specifiers
{
  uint64_t v3;
  void *v4;
  DADevice *v5;
  DADevice *currentDevice;
  NSString *v7;
  NSString *deviceName;
  id v9;
  void *v10;
  void *v11;
  Class PSSpecifierClass;
  id WeakRetained;
  void *v14;
  void *v15;

  v3 = (int)*MEMORY[0x24BE756E8];
  v4 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
  if (!v4)
  {
    objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x24BE757B0]), "propertyForKey:", CFSTR("device"));
    v5 = (DADevice *)objc_claimAutoreleasedReturnValue();
    currentDevice = self->_currentDevice;
    self->_currentDevice = v5;

    -[DADevice name](self->_currentDevice, "name");
    v7 = (NSString *)objc_claimAutoreleasedReturnValue();
    deviceName = self->_deviceName;
    self->_deviceName = v7;

    v9 = objc_alloc(MEMORY[0x24BDBCEB8]);
    -[objc_class emptyGroupSpecifier](getPSSpecifierClass(), "emptyGroupSpecifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v9, "initWithObjects:", v10, 0);

    PSSpecifierClass = getPSSpecifierClass();
    WeakRetained = objc_loadWeakRetained((id *)((char *)&self->super.super.super.super.super.isa
                                              + (int)*MEMORY[0x24BE75798]));
    -[objc_class preferenceSpecifierNamed:target:set:get:detail:cell:edit:](PSSpecifierClass, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", 0, WeakRetained, sel_saveEditedName_specifier_, sel_getDeviceName_, 0, 8, 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v14, "setProperty:forKey:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BE75A10]);
    objc_msgSend(v11, "addObject:", v14);
    v15 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
    *(Class *)((char *)&self->super.super.super.super.super.isa + v3) = (Class)v11;

    v4 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
  }
  return v4;
}

- (void)suspend
{
  void *v3;
  objc_super v4;

  objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x24BE756F8]), "firstResponder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "resignFirstResponder");

  v4.receiver = self;
  v4.super_class = (Class)ASAccessoryNameEditingController;
  -[ASAccessoryNameEditingController suspend](&v4, sel_suspend);
}

- (void)viewWillDisappear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  objc_super v6;

  v3 = a3;
  objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x24BE756F8]), "firstResponder");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "resignFirstResponder");

  v6.receiver = self;
  v6.super_class = (Class)ASAccessoryNameEditingController;
  -[ASAccessoryNameEditingController viewWillDisappear:](&v6, sel_viewWillDisappear_, v3);
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
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)ASAccessoryNameEditingController;
  -[ASAccessoryNameEditingController tableView:cellForRowAtIndexPath:](&v9, sel_tableView_cellForRowAtIndexPath_, a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "editableTextField");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "setReturnKeyType:", 9);
    objc_msgSend(v7, "setAutocapitalizationType:", 0);
    objc_msgSend(v7, "setAutocorrectionType:", 1);
    objc_msgSend(v7, "setAdjustsFontSizeToFitWidth:", 1);
    objc_msgSend(v7, "setTextAlignment:", 4);
    objc_msgSend(v7, "setClearButtonMode:", 3);
    objc_msgSend(v7, "addTarget:action:forControlEvents:", self, sel_textDidChange_, 0x20000);
    objc_msgSend(v7, "setDelegate:", self);
    objc_msgSend(v7, "setText:", self->_deviceName);
    objc_msgSend(v7, "setPlaceholder:", self->_deviceName);
  }

  return v5;
}

- (void)keyboardWillShow:(id)a3
{
  void *v4;

  objc_msgSend(MEMORY[0x24BEBD6C8], "activeKeyboard", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setReturnKeyEnabled:", -[ASAccessoryNameEditingController keyboardShownOnce](self, "keyboardShownOnce"));

  if (!-[ASAccessoryNameEditingController keyboardShownOnce](self, "keyboardShownOnce"))
    -[ASAccessoryNameEditingController setKeyboardShownOnce:](self, "setKeyboardShownOnce:", 1);
}

- (void)textDidChange:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;

  v9 = a3;
  objc_msgSend(v9, "text");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceAndNewlineCharacterSet");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringByTrimmingCharactersInSet:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend(v6, "length"))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      objc_msgSend(v9, "setText:", &stru_250420148);
  }
  v7 = objc_msgSend(v6, "isEqualToString:", self->_deviceName) ^ 1;
  objc_msgSend(MEMORY[0x24BEBD6C8], "activeKeyboard");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setReturnKeyEnabled:", v7);

}

- (BOOL)textFieldShouldReturn:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;

  objc_msgSend(a3, "text");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceAndNewlineCharacterSet");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringByTrimmingCharactersInSet:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v6, "length"))
  {
    v7 = objc_alloc_init(MEMORY[0x24BE2BEE0]);
    objc_msgSend(v7, "setDisplayName:", v6);
    objc_msgSend(v7, "setUserInitiated:", 1);
    -[DADevice identifier](self->_currentDevice, "identifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[DASession modifyDeviceWithIdentifier:settings:completionHandler:](self->_session, "modifyDeviceWithIdentifier:settings:completionHandler:", v8, v7, &__block_literal_global);

  }
  return 1;
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
  objc_storeStrong((id *)&self->_deviceName, 0);
  objc_storeStrong((id *)&self->_currentDevice, 0);
  objc_storeStrong((id *)&self->_session, 0);
}

@end
