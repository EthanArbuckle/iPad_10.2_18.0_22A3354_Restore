@implementation RPSystemBroadcastPickerView

- (RPSystemBroadcastPickerView)initWithCoder:(id)a3
{
  RPSystemBroadcastPickerView *v3;
  RPSystemBroadcastPickerView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)RPSystemBroadcastPickerView;
  v3 = -[RPSystemBroadcastPickerView initWithCoder:](&v6, sel_initWithCoder_, a3);
  v4 = v3;
  if (v3)
    -[RPSystemBroadcastPickerView addBroadcastPickerButton](v3, "addBroadcastPickerButton");
  return v4;
}

- (RPSystemBroadcastPickerView)initWithFrame:(CGRect)a3
{
  RPSystemBroadcastPickerView *v3;
  RPSystemBroadcastPickerView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)RPSystemBroadcastPickerView;
  v3 = -[RPSystemBroadcastPickerView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    -[RPSystemBroadcastPickerView addBroadcastPickerButton](v3, "addBroadcastPickerButton");
  return v4;
}

- (void)addBroadcastPickerButton
{
  void *v3;
  void *v4;
  UIButton *v5;
  UIButton *broadcastPickerButton;
  UIButton *v7;
  UIButton *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  CGRect v14;
  CGRect v15;

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF6AC8], "imageNamed:inBundle:", CFSTR("ModuleIcon"), v13);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "imageWithRenderingMode:", 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  self->_showsMicrophoneButton = 1;
  objc_msgSend(MEMORY[0x24BDF6880], "buttonWithType:", 0);
  v5 = (UIButton *)objc_claimAutoreleasedReturnValue();
  broadcastPickerButton = self->_broadcastPickerButton;
  self->_broadcastPickerButton = v5;

  v7 = self->_broadcastPickerButton;
  -[RPSystemBroadcastPickerView bounds](self, "bounds");
  v15 = CGRectInset(v14, 5.0, 5.0);
  -[UIButton setFrame:](v7, "setFrame:", v15.origin.x, v15.origin.y, v15.size.width, v15.size.height);
  -[UIButton setImage:forState:](self->_broadcastPickerButton, "setImage:forState:", v4, 0);
  v8 = self->_broadcastPickerButton;
  objc_msgSend(MEMORY[0x24BDF6950], "clearColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIButton setBackgroundColor:](v8, "setBackgroundColor:", v9);

  -[UIButton setAutoresizingMask:](self->_broadcastPickerButton, "setAutoresizingMask:", 18);
  -[UIButton addTarget:action:forControlEvents:](self->_broadcastPickerButton, "addTarget:action:forControlEvents:", self, sel_buttonPressed_, 64);
  -[UIButton imageView](self->_broadcastPickerButton, "imageView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setContentMode:", 2);

  -[RPSystemBroadcastPickerView broadcastPickerButton](self, "broadcastPickerButton");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[RPSystemBroadcastPickerView addSubview:](self, "addSubview:", v11);

  -[RPSystemBroadcastPickerView screenCaptureChanged](self, "screenCaptureChanged");
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addObserver:selector:name:object:", self, sel_screenCaptureChanged, *MEMORY[0x24BDF7D50], 0);

}

- (void)screenCaptureChanged
{
  _QWORD block[5];
  uint8_t buf[4];
  const char *v5;
  __int16 v6;
  int v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  if (__RPLogLevel <= 1 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    v5 = "-[RPSystemBroadcastPickerView screenCaptureChanged]";
    v6 = 1024;
    v7 = 69;
    _os_log_impl(&dword_214135000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d ", buf, 0x12u);
  }
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __51__RPSystemBroadcastPickerView_screenCaptureChanged__block_invoke;
  block[3] = &unk_24D15D648;
  block[4] = self;
  dispatch_async(MEMORY[0x24BDAC9B8], block);
}

void __51__RPSystemBroadcastPickerView_screenCaptureChanged__block_invoke(uint64_t a1)
{
  void *v2;
  int v3;
  uint64_t v4;
  id v5;
  id v6;
  id v7;

  objc_msgSend(MEMORY[0x24BDF6950], "blackColor");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isCaptured");

  if (v3)
  {
    objc_msgSend(MEMORY[0x24BDF6950], "redColor");
    v4 = objc_claimAutoreleasedReturnValue();

    v5 = (id)v4;
  }
  else
  {
    v5 = v6;
  }
  v7 = v5;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 432), "setTintColor:", v5);

}

- (void)buttonPressed:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  const char *v8;
  __int16 v9;
  int v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (__RPLogLevel <= 1 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    v7 = 136446466;
    v8 = "-[RPSystemBroadcastPickerView buttonPressed:]";
    v9 = 1024;
    v10 = 81;
    _os_log_impl(&dword_214135000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d ", (uint8_t *)&v7, 0x12u);
  }
  +[RPDaemonProxy daemonProxy](RPDaemonProxy, "daemonProxy");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setBroadcastPickerPreferredExt:showsMicButton:", self->_preferredExtension, self->_showsMicrophoneButton);

  +[RPDaemonProxy daemonProxy](RPDaemonProxy, "daemonProxy");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "openControlCenterSystemRecordingView");

}

- (NSString)preferredExtension
{
  return self->_preferredExtension;
}

- (void)setPreferredExtension:(NSString *)preferredExtension
{
  objc_storeStrong((id *)&self->_preferredExtension, preferredExtension);
}

- (BOOL)showsMicrophoneButton
{
  return self->_showsMicrophoneButton;
}

- (void)setShowsMicrophoneButton:(BOOL)showsMicrophoneButton
{
  self->_showsMicrophoneButton = showsMicrophoneButton;
}

- (UIButton)broadcastPickerButton
{
  return self->_broadcastPickerButton;
}

- (void)setBroadcastPickerButton:(id)a3
{
  objc_storeStrong((id *)&self->_broadcastPickerButton, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_broadcastPickerButton, 0);
  objc_storeStrong((id *)&self->_preferredExtension, 0);
}

@end
