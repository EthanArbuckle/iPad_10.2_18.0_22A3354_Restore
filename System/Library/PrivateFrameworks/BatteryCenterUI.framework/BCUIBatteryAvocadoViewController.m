@implementation BCUIBatteryAvocadoViewController

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
    BCRegisterUserNotificationsLogging();
}

+ (id)imageForIconInfo:(BCUIIconImageInfo *)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v15[8];

  v6 = v5;
  v7 = v4;
  v8 = v3;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("icon-%fx%f@%f"), v3, v4, v5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[BCUIMappedImageCache sharedCache](BCUIMappedImageCache, "sharedCache");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __53__BCUIBatteryAvocadoViewController_imageForIconInfo___block_invoke;
  v15[3] = &__block_descriptor_64_e18___UIImage_16__0_Q8l;
  v15[4] = a1;
  v15[5] = v8;
  v15[6] = v7;
  v15[7] = v6;
  objc_msgSend(v11, "imageForKey:generatingIfNecessaryWithBlock:", v10, v15);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "imageFlippedForRightToLeftLayoutDirection");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

id __53__BCUIBatteryAvocadoViewController_imageForIconInfo___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", *(_QWORD *)(a1 + 32));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bsui_imageForIconInfo:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)setWidgetFamliy:(int64_t)a3
{
  void *v5;
  BCUIAvocadoViewController *avocadoViewController;
  void *v8;
  void *v9;
  id v10;

  if ((unint64_t)(a3 - 1) >= 2)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromWidgetFamily();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("BCUIBatteryAvocadoViewController.m"), 51, CFSTR("Unsupported avocado size: %@"), v9);

  }
  if (self->_widgetFamily != a3)
  {
    self->_widgetFamily = a3;
    -[BCUIAvocadoViewController viewIfLoaded](self->_avocadoViewController, "viewIfLoaded");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeFromSuperview");

    -[BCUIAvocadoViewController willMoveToParentViewController:](self->_avocadoViewController, "willMoveToParentViewController:", 0);
    -[BCUIAvocadoViewController removeFromParentViewController](self->_avocadoViewController, "removeFromParentViewController");
    avocadoViewController = self->_avocadoViewController;
    self->_avocadoViewController = 0;

    -[BCUIBatteryAvocadoViewController viewIfLoaded](self, "viewIfLoaded");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setNeedsLayout");

  }
}

- (void)setScaleFactor:(double)a3
{
  if (self->_scaleFactor != a3)
  {
    self->_scaleFactor = a3;
    -[BCUIAvocadoViewController setScaleFactor:](self->_avocadoViewController, "setScaleFactor:");
  }
}

- (void)viewDidLoad
{
  BCBatteryDeviceController *v3;
  BCBatteryDeviceController *batteryDeviceController;
  void *v5;
  void *v6;
  objc_class *v7;
  void *v8;
  void *v9;
  OS_dispatch_queue *SerialWithQoS;
  OS_dispatch_queue *queue;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)BCUIBatteryAvocadoViewController;
  -[BCUIBatteryAvocadoViewController viewDidLoad](&v12, sel_viewDidLoad);
  -[BCUIBatteryAvocadoViewController _configureAvocadoViewControllerIfNecessary](self, "_configureAvocadoViewControllerIfNecessary");
  v3 = (BCBatteryDeviceController *)objc_alloc_init(MEMORY[0x1E0D01B20]);
  batteryDeviceController = self->_batteryDeviceController;
  self->_batteryDeviceController = v3;

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bundleIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (objc_class *)objc_opt_class();
  NSStringFromClass(v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringByAppendingFormat:", CFSTR(".%@"), v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  SerialWithQoS = (OS_dispatch_queue *)BSDispatchQueueCreateSerialWithQoS();
  queue = self->_queue;
  self->_queue = SerialWithQoS;

}

- (void)viewWillLayoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BCUIBatteryAvocadoViewController;
  -[BCUIBatteryAvocadoViewController viewWillLayoutSubviews](&v3, sel_viewWillLayoutSubviews);
  -[BCUIBatteryAvocadoViewController _configureAvocadoViewControllerIfNecessary](self, "_configureAvocadoViewControllerIfNecessary");
}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  NSObject *v6;
  void *v7;
  objc_super v8;
  uint8_t buf[4];
  void *v10;
  __int16 v11;
  const char *v12;
  uint64_t v13;

  v3 = a3;
  v13 = *MEMORY[0x1E0C80C00];
  v5 = (void *)*MEMORY[0x1E0D01B08];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D01B08], OS_LOG_TYPE_DEFAULT))
  {
    v6 = v5;
    -[BCUIBatteryAvocadoViewController _synthesizedDebugIdentifier](self, "_synthesizedDebugIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v10 = v7;
    v11 = 2082;
    v12 = "-[BCUIBatteryAvocadoViewController viewWillAppear:]";
    _os_log_impl(&dword_1D2A32000, v6, OS_LOG_TYPE_DEFAULT, "(%{public}@) %{public}s", buf, 0x16u);

  }
  v8.receiver = self;
  v8.super_class = (Class)BCUIBatteryAvocadoViewController;
  -[BCUIBatteryAvocadoViewController viewWillAppear:](&v8, sel_viewWillAppear_, v3);
  -[BCBatteryDeviceController addBatteryDeviceObserver:queue:](self->_batteryDeviceController, "addBatteryDeviceObserver:queue:", self, self->_queue);
}

- (void)viewDidAppear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  NSObject *v6;
  void *v7;
  objc_super v8;
  uint8_t buf[4];
  void *v10;
  __int16 v11;
  const char *v12;
  uint64_t v13;

  v3 = a3;
  v13 = *MEMORY[0x1E0C80C00];
  v5 = (void *)*MEMORY[0x1E0D01B08];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D01B08], OS_LOG_TYPE_DEFAULT))
  {
    v6 = v5;
    -[BCUIBatteryAvocadoViewController _synthesizedDebugIdentifier](self, "_synthesizedDebugIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v10 = v7;
    v11 = 2082;
    v12 = "-[BCUIBatteryAvocadoViewController viewDidAppear:]";
    _os_log_impl(&dword_1D2A32000, v6, OS_LOG_TYPE_DEFAULT, "(%{public}@) %{public}s", buf, 0x16u);

  }
  v8.receiver = self;
  v8.super_class = (Class)BCUIBatteryAvocadoViewController;
  -[BCUIBatteryAvocadoViewController viewDidAppear:](&v8, sel_viewDidAppear_, v3);
}

- (void)viewWillDisappear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  NSObject *v6;
  void *v7;
  objc_super v8;
  uint8_t buf[4];
  void *v10;
  __int16 v11;
  const char *v12;
  uint64_t v13;

  v3 = a3;
  v13 = *MEMORY[0x1E0C80C00];
  v5 = (void *)*MEMORY[0x1E0D01B08];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D01B08], OS_LOG_TYPE_DEFAULT))
  {
    v6 = v5;
    -[BCUIBatteryAvocadoViewController _synthesizedDebugIdentifier](self, "_synthesizedDebugIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v10 = v7;
    v11 = 2082;
    v12 = "-[BCUIBatteryAvocadoViewController viewWillDisappear:]";
    _os_log_impl(&dword_1D2A32000, v6, OS_LOG_TYPE_DEFAULT, "(%{public}@) %{public}s", buf, 0x16u);

  }
  v8.receiver = self;
  v8.super_class = (Class)BCUIBatteryAvocadoViewController;
  -[BCUIBatteryAvocadoViewController viewWillDisappear:](&v8, sel_viewWillDisappear_, v3);
}

- (void)viewDidDisappear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  NSObject *v6;
  void *v7;
  objc_super v8;
  uint8_t buf[4];
  void *v10;
  __int16 v11;
  const char *v12;
  uint64_t v13;

  v3 = a3;
  v13 = *MEMORY[0x1E0C80C00];
  v5 = (void *)*MEMORY[0x1E0D01B08];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D01B08], OS_LOG_TYPE_DEFAULT))
  {
    v6 = v5;
    -[BCUIBatteryAvocadoViewController _synthesizedDebugIdentifier](self, "_synthesizedDebugIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v10 = v7;
    v11 = 2082;
    v12 = "-[BCUIBatteryAvocadoViewController viewDidDisappear:]";
    _os_log_impl(&dword_1D2A32000, v6, OS_LOG_TYPE_DEFAULT, "(%{public}@) %{public}s", buf, 0x16u);

  }
  v8.receiver = self;
  v8.super_class = (Class)BCUIBatteryAvocadoViewController;
  -[BCUIBatteryAvocadoViewController viewDidDisappear:](&v8, sel_viewDidDisappear_, v3);
  -[BCBatteryDeviceController removeBatteryDeviceObserver:](self->_batteryDeviceController, "removeBatteryDeviceObserver:", self);
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)connectedDevicesDidChange:(id)a3
{
  id v4;
  id v5;
  _QWORD block[4];
  id v7;
  id v8;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __62__BCUIBatteryAvocadoViewController_connectedDevicesDidChange___block_invoke;
  block[3] = &unk_1E9418658;
  objc_copyWeak(&v8, &location);
  v7 = v4;
  v5 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], block);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

void __62__BCUIBatteryAvocadoViewController_connectedDevicesDidChange___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = (void *)*MEMORY[0x1E0D01B08];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D01B08], OS_LOG_TYPE_DEFAULT))
  {
    v4 = v3;
    objc_msgSend(WeakRetained, "_synthesizedDebugIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(a1 + 32);
    v8 = 138543618;
    v9 = v5;
    v10 = 2114;
    v11 = v6;
    _os_log_impl(&dword_1D2A32000, v4, OS_LOG_TYPE_DEFAULT, "(%{public}@) Connected devices did change: '%{public}@'", (uint8_t *)&v8, 0x16u);

  }
  objc_msgSend(WeakRetained, "_avocadoViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setBatteryDevices:", *(_QWORD *)(a1 + 32));

}

- (void)_configureAvocadoViewControllerIfNecessary
{
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  BCUIAvocadoViewController *v7;
  BCUIAvocadoViewController *avocadoViewController;
  BCUIAvocadoViewController *v9;
  void *v10;
  double scaleFactor;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (!self->_avocadoViewController)
  {
    v3 = (void *)*MEMORY[0x1E0D01B08];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D01B08], OS_LOG_TYPE_DEFAULT))
    {
      v4 = v3;
      -[BCUIBatteryAvocadoViewController _synthesizedDebugIdentifier](self, "_synthesizedDebugIdentifier");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromWidgetFamily();
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138543618;
      v15 = v5;
      v16 = 2114;
      v17 = v6;
      _os_log_impl(&dword_1D2A32000, v4, OS_LOG_TYPE_DEFAULT, "(%{public}@) Configuring view controller for size '%{public}@'", (uint8_t *)&v14, 0x16u);

    }
    +[BCUIAvocadoViewController avocadoViewControllerForWidgetFamily:](BCUIAvocadoViewController, "avocadoViewControllerForWidgetFamily:", self->_widgetFamily);
    v7 = (BCUIAvocadoViewController *)objc_claimAutoreleasedReturnValue();
    avocadoViewController = self->_avocadoViewController;
    self->_avocadoViewController = v7;

    v9 = self->_avocadoViewController;
    -[BCUIBatteryAvocadoViewController _synthesizedDebugIdentifier](self, "_synthesizedDebugIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[BCUIAvocadoViewController setDebugIdentifier:](v9, "setDebugIdentifier:", v10);

    scaleFactor = self->_scaleFactor;
    if (scaleFactor == 0.0)
      scaleFactor = 1.0;
    -[BCUIAvocadoViewController setScaleFactor:](self->_avocadoViewController, "setScaleFactor:", scaleFactor);
    -[BCUIBatteryAvocadoViewController addChildViewController:](self, "addChildViewController:", self->_avocadoViewController);
    -[BCUIAvocadoViewController didMoveToParentViewController:](self->_avocadoViewController, "didMoveToParentViewController:", self);
    -[BCUIBatteryAvocadoViewController view](self, "view");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[BCUIAvocadoViewController view](self->_avocadoViewController, "view");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "bounds");
    objc_msgSend(v13, "setFrame:");
    objc_msgSend(v13, "setAutoresizingMask:", 18);
    objc_msgSend(v12, "addSubview:", v13);

  }
}

- (id)_synthesizedDebugIdentifier
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  v5 = v4;
  if (self->_debugIdentifier)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR(" [%@]"), self->_debugIdentifier);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@%@: %p>"), v5, v6, self);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@%@: %p>"), v4, &stru_1E9419348, self);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v7;
}

- (int64_t)widgetFamily
{
  return self->_widgetFamily;
}

- (void)setWidgetFamily:(int64_t)a3
{
  self->_widgetFamily = a3;
}

- (double)scaleFactor
{
  return self->_scaleFactor;
}

- (NSString)debugIdentifier
{
  return self->_debugIdentifier;
}

- (void)setDebugIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1000);
}

- (BCUIAvocadoViewController)_avocadoViewController
{
  return self->_avocadoViewController;
}

- (void)_setAvocadoViewController:(id)a3
{
  objc_storeStrong((id *)&self->_avocadoViewController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_avocadoViewController, 0);
  objc_storeStrong((id *)&self->_debugIdentifier, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_batteryDeviceController, 0);
}

@end
