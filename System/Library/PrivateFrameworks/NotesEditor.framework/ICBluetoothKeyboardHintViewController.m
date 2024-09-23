@implementation ICBluetoothKeyboardHintViewController

- (ICBluetoothKeyboardHintViewController)initWithRootViewController:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  ICBluetoothKeyboardHintViewController *v7;
  _QWORD v9[4];
  ICBluetoothKeyboardHintViewController *v10;

  v4 = (void *)MEMORY[0x1E0C99EA0];
  v5 = a3;
  objc_msgSend(v4, "standardUserDefaults");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __68__ICBluetoothKeyboardHintViewController_initWithRootViewController___block_invoke;
  v9[3] = &unk_1EA7DD2D8;
  v10 = self;
  v7 = -[ICBluetoothKeyboardHintViewController initWithRootViewController:userDefaults:buttonAction:](v10, "initWithRootViewController:userDefaults:buttonAction:", v5, v6, v9);

  return v7;
}

uint64_t __68__ICBluetoothKeyboardHintViewController_initWithRootViewController___block_invoke(uint64_t a1)
{
  objc_msgSend(MEMORY[0x1E0DC3470], "ic_openBluetoothSettings");
  return objc_msgSend(*(id *)(a1 + 32), "hide");
}

- (ICBluetoothKeyboardHintViewController)initWithRootViewController:(id)a3 userDefaults:(id)a4 buttonAction:(id)a5
{
  void *v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  ICBluetoothKeyboardHintViewController *v18;
  id v20;
  objc_super v21;

  v20 = a4;
  v9 = (void *)MEMORY[0x1E0CB34D0];
  v10 = a5;
  v11 = a3;
  objc_msgSend(v9, "mainBundle");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("Connect a Keyboard"), &stru_1EA7E9860, 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("Pair a Bluetooth keyboard or trackpad to make quick edits."), &stru_1EA7E9860, 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "localizedStringForKey:value:table:", CFSTR("Go to Settings"), &stru_1EA7E9860, 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v21.receiver = self;
  v21.super_class = (Class)ICBluetoothKeyboardHintViewController;
  v18 = -[ICHintViewController initWithRootViewController:showsCloseButton:hintTitle:hintSubtitle:buttonTitle:buttonAction:](&v21, sel_initWithRootViewController_showsCloseButton_hintTitle_hintSubtitle_buttonTitle_buttonAction_, v11, 1, v13, v15, v17, v10);

  if (v18)
    objc_storeStrong((id *)&v18->_userDefaults, a4);

  return v18;
}

- (void)viewDidLoad
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)ICBluetoothKeyboardHintViewController;
  -[ICHintViewController viewDidLoad](&v4, sel_viewDidLoad);
  -[ICBluetoothKeyboardHintViewController updateHardwareKeyboardMode](self, "updateHardwareKeyboardMode");
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel_keyboardDidChangeFrame_, *MEMORY[0x1E0DC4E60], 0);

}

- (void)didEditNote
{
  id v3;

  -[ICBluetoothKeyboardHintViewController updateHardwareKeyboardMode](self, "updateHardwareKeyboardMode");
  -[ICBluetoothKeyboardHintViewController showIfNeeded](self, "showIfNeeded");
  -[ICBluetoothKeyboardHintViewController userDefaults](self, "userDefaults");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setBool:forKey:", 1, CFSTR("bluetoothKeyboardHintDidEditNote"));

}

- (BOOL)shouldShow
{
  _BOOL4 v3;

  if (-[ICBluetoothKeyboardHintViewController forceShow](self, "forceShow"))
  {
    LOBYTE(v3) = 1;
  }
  else if (-[ICBluetoothKeyboardHintViewController hasAttachedHardwareKeyboard](self, "hasAttachedHardwareKeyboard")
         || -[ICBluetoothKeyboardHintViewController isInHardwareKeyboardMode](self, "isInHardwareKeyboardMode"))
  {
    LOBYTE(v3) = 0;
  }
  else
  {
    v3 = -[ICBluetoothKeyboardHintViewController hasEditedNote](self, "hasEditedNote");
    if (v3)
      LOBYTE(v3) = !-[ICBluetoothKeyboardHintViewController hasShownHint](self, "hasShownHint");
  }
  return v3;
}

- (void)showIfNeeded
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  void *v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v3 = os_log_create("com.apple.notes", "UI");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[ICBluetoothKeyboardHintViewController shouldShow](self, "shouldShow"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[ICBluetoothKeyboardHintViewController forceShow](self, "forceShow"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[ICBluetoothKeyboardHintViewController isInHardwareKeyboardMode](self, "isInHardwareKeyboardMode"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[ICBluetoothKeyboardHintViewController hasAttachedHardwareKeyboard](self, "hasAttachedHardwareKeyboard"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[ICBluetoothKeyboardHintViewController hasEditedNote](self, "hasEditedNote"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[ICBluetoothKeyboardHintViewController hasShownHint](self, "hasShownHint"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138413570;
    v11 = v4;
    v12 = 2112;
    v13 = v5;
    v14 = 2112;
    v15 = v6;
    v16 = 2112;
    v17 = v7;
    v18 = 2112;
    v19 = v8;
    v20 = 2112;
    v21 = v9;
    _os_log_impl(&dword_1DD7B0000, v3, OS_LOG_TYPE_DEFAULT, "Bluetooth Keyboard Hint Should Show: %@ (forceShow: %@, inHardwareKeyboardMode: %@, hasAttachedHardwareKeyboard: %@, hasEditedNote: %@, hasShownHint: %@)", (uint8_t *)&v10, 0x3Eu);

  }
  if (-[ICBluetoothKeyboardHintViewController shouldShow](self, "shouldShow"))
    -[ICBluetoothKeyboardHintViewController show](self, "show");
}

- (void)show
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)ICBluetoothKeyboardHintViewController;
  -[ICPillOrnamentViewController show](&v4, sel_show);
  -[ICBluetoothKeyboardHintViewController userDefaults](self, "userDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setBool:forKey:", 1, CFSTR("bluetoothKeyboardHintDidShow"));

}

- (BOOL)forceShow
{
  void *v2;
  char v3;

  -[ICBluetoothKeyboardHintViewController userDefaults](self, "userDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLForKey:", CFSTR("bluetoothKeyboardForceShow"));

  return v3;
}

- (BOOL)hasAttachedBluetoothKeyboard
{
  void *v2;
  char v3;

  -[ICBluetoothKeyboardHintViewController userDefaults](self, "userDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLForKey:", CFSTR("bluetoothKeyboardHintHasAttachedHardwareKeyboard"));

  return v3;
}

- (BOOL)hasEditedNote
{
  void *v2;
  char v3;

  -[ICBluetoothKeyboardHintViewController userDefaults](self, "userDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLForKey:", CFSTR("bluetoothKeyboardHintDidEditNote"));

  return v3;
}

- (BOOL)hasShownHint
{
  void *v2;
  char v3;

  -[ICBluetoothKeyboardHintViewController userDefaults](self, "userDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLForKey:", CFSTR("bluetoothKeyboardHintDidShow"));

  return v3;
}

- (void)updateHardwareKeyboardMode
{
  id v3;

  -[ICBluetoothKeyboardHintViewController setIsInHardwareKeyboardMode:](self, "setIsInHardwareKeyboardMode:", objc_msgSend(MEMORY[0x1E0DC3938], "isInHardwareKeyboardMode"));
  if (-[ICBluetoothKeyboardHintViewController isInHardwareKeyboardMode](self, "isInHardwareKeyboardMode"))
  {
    -[ICBluetoothKeyboardHintViewController userDefaults](self, "userDefaults");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setBool:forKey:", 1, CFSTR("bluetoothKeyboardHintHasAttachedHardwareKeyboard"));

  }
}

- (BOOL)isInHardwareKeyboardMode
{
  return self->_isInHardwareKeyboardMode;
}

- (void)setIsInHardwareKeyboardMode:(BOOL)a3
{
  self->_isInHardwareKeyboardMode = a3;
}

- (NSUserDefaults)userDefaults
{
  return self->_userDefaults;
}

- (void)setUserDefaults:(id)a3
{
  objc_storeStrong((id *)&self->_userDefaults, a3);
}

- (BOOL)hasAttachedHardwareKeyboard
{
  return self->_hasAttachedHardwareKeyboard;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userDefaults, 0);
}

@end
