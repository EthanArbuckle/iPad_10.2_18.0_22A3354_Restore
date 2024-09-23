@implementation TUIKeyboardBrightnessModuleViewController

- (TUIKeyboardBrightnessModuleViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  TUIKeyboardBrightnessModuleViewController *v4;
  __CFNotificationCenter *DarwinNotifyCenter;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  __CFString *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)TUIKeyboardBrightnessModuleViewController;
  v4 = -[CCUIButtonModuleViewController initWithNibName:bundle:](&v11, sel_initWithNibName_bundle_, a3, a4);
  if (v4)
  {
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    objc_msgSend_stringWithUTF8String_(MEMORY[0x24BDD17C8], v6, *MEMORY[0x24BE3D640], v7, v8);
    v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v4, (CFNotificationCallback)sub_231005404, v9, 0, (CFNotificationSuspensionBehavior)0);

  }
  return v4;
}

- (void)dealloc
{
  __CFNotificationCenter *DarwinNotifyCenter;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  __CFString *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  objc_super v15;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  objc_msgSend_stringWithUTF8String_(MEMORY[0x24BDD17C8], v4, *MEMORY[0x24BE3D640], v5, v6);
  v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, v7, 0);

  objc_msgSend_suspendIdleDimming_(self, v8, 0, v9, v10);
  objc_msgSend_unregisterKeyboardNotificationBlock(self->_keyboardBrightnessClient, v11, v12, v13, v14);
  v15.receiver = self;
  v15.super_class = (Class)TUIKeyboardBrightnessModuleViewController;
  -[TUIKeyboardBrightnessModuleViewController dealloc](&v15, sel_dealloc);
}

- (void)viewDidLoad
{
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  const char *v12;
  KeyboardBrightnessClient *v13;
  KeyboardBrightnessClient *keyboardBrightnessClient;
  KeyboardBrightnessClient *v15;
  uint64_t v16;
  const char *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void (*v24)(uint64_t, uint64_t, void *);
  void *v25;
  id v26;
  id location;
  objc_super v28;

  v28.receiver = self;
  v28.super_class = (Class)TUIKeyboardBrightnessModuleViewController;
  -[CCUISliderButtonModuleViewController viewDidLoad](&v28, sel_viewDidLoad);
  objc_msgSend_setSelected_(self, v3, 1, v4, v5);
  objc_msgSend_sliderView(self, v6, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addTarget_action_forControlEvents_(v10, v11, (uint64_t)self, (uint64_t)sel_sliderValueDidChange_, 4096);
  objc_msgSend_addTarget_action_forControlEvents_(v10, v12, (uint64_t)self, (uint64_t)sel_sliderEditingDidEnd_, 0x40000);
  v13 = (KeyboardBrightnessClient *)objc_alloc_init(MEMORY[0x24BE1A2F0]);
  keyboardBrightnessClient = self->_keyboardBrightnessClient;
  self->_keyboardBrightnessClient = v13;

  objc_initWeak(&location, self);
  v15 = self->_keyboardBrightnessClient;
  v16 = *MEMORY[0x24BE1A2F8];
  v22 = MEMORY[0x24BDAC760];
  v23 = 3221225472;
  v24 = sub_231005608;
  v25 = &unk_24FFDDC70;
  objc_copyWeak(&v26, &location);
  objc_msgSend_registerNotificationForKeys_keyboardID_block_(v15, v17, (uint64_t)&unk_24FFDE610, v16, (uint64_t)&v22);
  objc_msgSend_updateControls(self, v18, v19, v20, v21, v22, v23, v24, v25);
  objc_destroyWeak(&v26);
  objc_destroyWeak(&location);

}

- (void)viewWillAppear:(BOOL)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)TUIKeyboardBrightnessModuleViewController;
  -[TUIKeyboardBrightnessModuleViewController viewWillAppear:](&v7, sel_viewWillAppear_, a3);
  objc_msgSend_suspendIdleDimming_(self, v4, 1, v5, v6);
}

- (void)viewDidDisappear:(BOOL)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)TUIKeyboardBrightnessModuleViewController;
  -[TUIKeyboardBrightnessModuleViewController viewDidDisappear:](&v7, sel_viewDidDisappear_, a3);
  objc_msgSend_suspendIdleDimming_(self, v4, 0, v5, v6);
}

- (void)viewWillLayoutSubviews
{
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)TUIKeyboardBrightnessModuleViewController;
  -[CCUISliderButtonModuleViewController viewWillLayoutSubviews](&v7, sel_viewWillLayoutSubviews);
  objc_msgSend_updateControls(self, v3, v4, v5, v6);
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (id)sliderView
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TUIKeyboardBrightnessModuleViewController;
  -[CCUISliderButtonModuleViewController sliderView](&v3, sel_sliderView);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)createSliderView
{
  id v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;

  v3 = objc_alloc(MEMORY[0x24BE19B30]);
  objc_msgSend_view(self, v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_bounds(v8, v9, v10, v11, v12);
  v17 = (void *)objc_msgSend_initWithFrame_(v3, v13, v14, v15, v16);

  return v17;
}

- (void)suspendIdleDimming:(BOOL)a3
{
  _BOOL8 v3;
  uint64_t v5;

  v3 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    MEMORY[0x24BEDD108](self->_keyboardBrightnessClient, sel_suspendIdleDimming_forKeyboard_, v3, *MEMORY[0x24BE1A2F8], v5);
}

- (void)sliderValueDidChange:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  KeyboardBrightnessClient *keyboardBrightnessClient;

  keyboardBrightnessClient = self->_keyboardBrightnessClient;
  objc_msgSend_value(a3, a2, (uint64_t)a3, v3, v4);
  MEMORY[0x24BEDD108](keyboardBrightnessClient, sel_setBrightness_fadeSpeed_commit_forKeyboard_, 0, 0, *MEMORY[0x24BE1A2F8]);
}

- (void)sliderEditingDidEnd:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  KeyboardBrightnessClient *keyboardBrightnessClient;

  keyboardBrightnessClient = self->_keyboardBrightnessClient;
  objc_msgSend_value(a3, a2, (uint64_t)a3, v3, v4);
  MEMORY[0x24BEDD108](keyboardBrightnessClient, sel_setBrightness_fadeSpeed_commit_forKeyboard_, 0, 1, *MEMORY[0x24BE1A2F8]);
}

- (void)updateControls
{
  uint64_t v2;
  uint64_t v3;
  const char *v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend_brightnessForKeyboard_(self->_keyboardBrightnessClient, a2, *MEMORY[0x24BE1A2F8], v2, v3);
  objc_msgSend_updateControlsForValue_animated_(self, v5, 0, v6, v7);
}

- (void)updateControlsForValue:(float)a3 animated:(BOOL)a4
{
  uint64_t v4;
  uint64_t v5;
  _BOOL8 v6;
  uint64_t isHardwareKeyboardAvailable;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t isBacklightSaturatedOnKeyboard;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  double v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  const char *v44;
  uint64_t v45;
  id v46;

  v6 = a4;
  isHardwareKeyboardAvailable = objc_msgSend_isHardwareKeyboardAvailable(self, a2, a4, v4, v5);
  objc_msgSend_buttonView(self, v10, v11, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setEnabled_(v14, v15, isHardwareKeyboardAvailable, v16, v17);

  if ((_DWORD)isHardwareKeyboardAvailable)
  {
    objc_msgSend_sliderView(self, v18, v19, v20, v21);
    v46 = (id)objc_claimAutoreleasedReturnValue();
    isBacklightSaturatedOnKeyboard = objc_msgSend_isBacklightSaturatedOnKeyboard_(self->_keyboardBrightnessClient, v22, *MEMORY[0x24BE1A2F8], v23, v24);
    objc_msgSend_setInoperative_(v46, v26, isBacklightSaturatedOnKeyboard, v27, v28);
    *(float *)&v29 = a3;
    objc_msgSend_setValue_animated_(v46, v30, v6, v31, v32, v29);
    objc_msgSend_setSelected_(self, v33, a3 > 0.0, v34, v35);
  }
  else
  {
    objc_msgSend_setSelected_(self, v18, 0, v20, v21);
    if (!objc_msgSend_isExpanded(self, v36, v37, v38, v39))
      return;
    objc_msgSend_presentingViewController(self, v40, v41, v42, v43);
    v46 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend_dismissViewControllerAnimated_completion_(v46, v44, 1, 0, v45);
  }

}

- (BOOL)isHardwareKeyboardAvailable
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v5 = (void *)objc_msgSend_copyKeyboardBacklightIDs(self->_keyboardBrightnessClient, a2, v2, v3, v4);
  v10 = objc_msgSend_count(v5, v6, v7, v8, v9);

  return v10 >= 1 && GSEventIsHardwareKeyboardAttached() != 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyboardBrightnessClient, 0);
}

@end
