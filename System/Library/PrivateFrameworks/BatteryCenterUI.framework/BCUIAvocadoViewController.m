@implementation BCUIAvocadoViewController

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
    BCRegisterUserNotificationsLogging();
}

- (double)_columnWidthForBounds:(CGRect)a3 andMaxNumViews:(double)a4
{
  return (CGRectGetWidth(a3) + -38.0 + (a4 + -1.0) * -17.0) / a4;
}

+ (id)avocadoViewControllerForWidgetFamily:(int64_t)a3
{
  objc_class *v3;
  void *v6;
  void *v7;

  if (a3 == 3 || a3 == 2 || a3 == 1)
  {
    v3 = (objc_class *)objc_opt_class();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromWidgetFamily();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("BCUIAvocadoViewController.m"), 61, CFSTR("Unsupported size: %@"), v7);

    v3 = 0;
  }
  return objc_alloc_init(v3);
}

- (void)setBatteryDevices:(id)a3
{
  id v4;
  BCUIAvocadoViewController *v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  NSArray *batteryDevices;
  int v10;
  void *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  if ((BSEqualObjects() & 1) == 0)
  {
    v6 = (id)*MEMORY[0x1E0D01B08];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      -[BCUIAvocadoViewController _synthesizedDebugIdentifier](v5, "_synthesizedDebugIdentifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138543618;
      v11 = v7;
      v12 = 2114;
      v13 = v4;
      _os_log_impl(&dword_1D2A32000, v6, OS_LOG_TYPE_DEFAULT, "(%{public}@) Updating battery devices : %{public}@", (uint8_t *)&v10, 0x16u);

    }
    v8 = objc_msgSend(v4, "copy");
    batteryDevices = v5->_batteryDevices;
    v5->_batteryDevices = (NSArray *)v8;

    -[BCUIAvocadoViewController invalidateBatteryDeviceState](v5, "invalidateBatteryDeviceState");
  }
  objc_sync_exit(v5);

}

- (void)setScaleFactor:(double)a3
{
  NSMutableArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (self->_scaleFactor != a3)
  {
    self->_scaleFactor = a3;
    if (self->_batteryDeviceViewsValid)
    {
      v12 = 0u;
      v13 = 0u;
      v10 = 0u;
      v11 = 0u;
      v4 = self->_batteryDeviceViews;
      v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      if (v5)
      {
        v6 = v5;
        v7 = *(_QWORD *)v11;
        do
        {
          v8 = 0;
          do
          {
            if (*(_QWORD *)v11 != v7)
              objc_enumerationMutation(v4);
            objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v8++), "setScaleFactor:", self->_scaleFactor, (_QWORD)v10);
          }
          while (v6 != v8);
          v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
        }
        while (v6);
      }

      -[BCUIAvocadoViewController viewIfLoaded](self, "viewIfLoaded");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setNeedsLayout");

    }
  }
}

- (void)invalidateBatteryDeviceState
{
  id v2;

  self->_batteryDeviceViewsValid = 0;
  -[BCUIAvocadoViewController view](self, "view");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsLayout");

}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  id v5;
  _QWORD v6[5];
  objc_super v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v7.receiver = self;
  v7.super_class = (Class)BCUIAvocadoViewController;
  -[BCUIAvocadoViewController viewDidLoad](&v7, sel_viewDidLoad);
  objc_opt_self();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __40__BCUIAvocadoViewController_viewDidLoad__block_invoke;
  v6[3] = &unk_1E9418340;
  v6[4] = self;
  v5 = (id)-[BCUIAvocadoViewController registerForTraitChanges:withHandler:](self, "registerForTraitChanges:withHandler:", v4, v6);

}

void __40__BCUIAvocadoViewController_viewDidLoad__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  id v3;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(v1, "traitCollection");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "preferredContentSizeCategory");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "_contentSizeCategoryDidChange:", v2);

}

- (void)viewWillLayoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BCUIAvocadoViewController;
  -[BCUIAvocadoViewController viewWillLayoutSubviews](&v3, sel_viewWillLayoutSubviews);
  -[BCUIAvocadoViewController _validateBatteryDeviceViewsIfNecessary](self, "_validateBatteryDeviceViewsIfNecessary");
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)_validateBatteryDeviceViewsIfNecessary
{
  void *v4;
  NSObject *v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  _QWORD v11[4];
  id v12;
  __int128 *v13;
  _QWORD v14[5];
  id v15;
  __int128 *p_buf;
  id v17[2];
  id location;
  __int128 buf;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  if (!self->_batteryDeviceViewsValid)
  {
    v4 = (void *)*MEMORY[0x1E0D01B08];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D01B08], OS_LOG_TYPE_DEFAULT))
    {
      v5 = v4;
      -[BCUIAvocadoViewController _synthesizedDebugIdentifier](self, "_synthesizedDebugIdentifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(buf) = 138543362;
      *(_QWORD *)((char *)&buf + 4) = v6;
      _os_log_impl(&dword_1D2A32000, v5, OS_LOG_TYPE_DEFAULT, "(%{public}@) Validating device views", (uint8_t *)&buf, 0xCu);

    }
    objc_initWeak(&location, self);
    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v20 = 0x3032000000;
    v21 = __Block_byref_object_copy_;
    v22 = __Block_byref_object_dispose_;
    v23 = 0;
    v7 = objc_alloc_init(MEMORY[0x1E0DC4490]);
    objc_msgSend(v7, "_setIsAnimated:", 1);
    v8 = (void *)MEMORY[0x1E0DC3F10];
    v9 = MEMORY[0x1E0C809B0];
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __67__BCUIAvocadoViewController__validateBatteryDeviceViewsIfNecessary__block_invoke;
    v14[3] = &unk_1E9418390;
    objc_copyWeak(v17, &location);
    v14[4] = self;
    v17[1] = (id)a2;
    v15 = v7;
    p_buf = &buf;
    v11[0] = v9;
    v11[1] = 3221225472;
    v11[2] = __67__BCUIAvocadoViewController__validateBatteryDeviceViewsIfNecessary__block_invoke_3;
    v11[3] = &unk_1E94183B8;
    v13 = &buf;
    v10 = v15;
    v12 = v10;
    objc_msgSend(v8, "_animateUsingDefaultDampedSpringWithDelay:initialSpringVelocity:options:animations:completion:", 4, v14, v11, 0.0, 0.0);

    objc_destroyWeak(v17);
    _Block_object_dispose(&buf, 8);

    objc_destroyWeak(&location);
  }
}

void __67__BCUIAvocadoViewController__validateBatteryDeviceViewsIfNecessary__block_invoke(uint64_t a1)
{
  id WeakRetained;
  id *v3;
  void *v4;
  char v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  void *v9;
  unint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  uint64_t v25;
  void *v26;
  id v27;
  void *v28;
  _QWORD v29[4];
  id v30;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    v27 = WeakRetained;
    v3 = (id *)WeakRetained;
    objc_sync_enter(v3);
    v4 = (void *)objc_msgSend(v3[123], "copy");
    objc_sync_exit(v3);

    v5 = objc_msgSend(*(id *)(a1 + 32), "_includeEmptyDevices");
    v6 = objc_msgSend(*(id *)(a1 + 32), "_maximumNumberOfBatteryDeviceViews");
    if ((v5 & 1) == 0)
    {
      v7 = objc_msgSend(v4, "count");
      if (v6 >= v7)
        v6 = v7;
    }
    if (v6)
    {
      v8 = 0;
      v28 = v4;
      do
      {
        if (v8 >= objc_msgSend(v4, "count"))
        {
          v9 = 0;
        }
        else
        {
          objc_msgSend(v4, "objectAtIndex:", v8);
          v9 = (void *)objc_claimAutoreleasedReturnValue();
        }
        v10 = objc_msgSend(v3[122], "count");
        if (v10 <= v8)
        {
          v11 = objc_msgSend(*(id *)(a1 + 32), "_newBatteryDeviceView");
        }
        else
        {
          objc_msgSend(v3[122], "objectAtIndex:", v8);
          v11 = objc_claimAutoreleasedReturnValue();
        }
        v12 = (void *)v11;
        if (!v11)
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 32), CFSTR("BCUIAvocadoViewController.m"), 133, CFSTR("Failed to obtain a battery device view"));

        }
        v13 = v3[122];
        if (v10 <= v8)
        {
          if (!v13)
          {
            v14 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
            v15 = v3[122];
            v3[122] = v14;

            v13 = v3[122];
          }
          objc_msgSend(v13, "addObject:", v12);
          objc_msgSend(*(id *)(a1 + 32), "view");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "addSubview:", v12);

        }
        else
        {
          objc_msgSend(v13, "replaceObjectAtIndex:withObject:", v8, v12);
        }
        v17 = *(void **)(a1 + 32);
        objc_msgSend(*(id *)(a1 + 40), "_transitionCoordinator");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "_configureBatteryDeviceView:withBatteryDevice:transitionCoordinator:", v12, v9, v18);

        if (v10 <= v8)
        {
          v19 = (void *)MEMORY[0x1E0DC3F10];
          v29[0] = MEMORY[0x1E0C809B0];
          v29[1] = 3221225472;
          v29[2] = __67__BCUIAvocadoViewController__validateBatteryDeviceViewsIfNecessary__block_invoke_2;
          v29[3] = &unk_1E9418368;
          v20 = v12;
          v30 = v20;
          objc_msgSend(v19, "performWithoutAnimation:", v29);
          objc_msgSend(v20, "setAlpha:", 1.0);

        }
        else
        {
          objc_msgSend(v12, "layoutIfNeeded");
        }
        v4 = v28;

        ++v8;
      }
      while (v6 != v8);
    }
    while (objc_msgSend(v3[122], "count") > v6)
    {
      objc_msgSend(v3[122], "lastObject");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
      if (!v23)
      {
        v24 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
        v25 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
        v26 = *(void **)(v25 + 40);
        *(_QWORD *)(v25 + 40) = v24;

        v23 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
      }
      objc_msgSend(v23, "addObject:", v22);
      objc_msgSend(v22, "setAlpha:", 0.0);
      objc_msgSend(v3[122], "removeObject:", v22);

    }
    objc_msgSend(*(id *)(a1 + 40), "__runAlongsideAnimations");

    WeakRetained = v27;
  }

}

uint64_t __67__BCUIAvocadoViewController__validateBatteryDeviceViewsIfNecessary__block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded");
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 0.0);
}

uint64_t __67__BCUIAvocadoViewController__validateBatteryDeviceViewsIfNecessary__block_invoke_3(uint64_t a1, uint64_t a2)
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v4 = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v8++), "removeFromSuperview", (_QWORD)v10);
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }

  return objc_msgSend(*(id *)(a1 + 32), "completeTransition:", a2);
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

- (NSArray)batteryDevices
{
  return self->_batteryDevices;
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_debugIdentifier, 0);
  objc_storeStrong((id *)&self->_batteryDevices, 0);
  objc_storeStrong((id *)&self->_batteryDeviceViews, 0);
}

- (NSMutableArray)_batteryDeviceViews
{
  return self->_batteryDeviceViews;
}

- (unint64_t)_maximumNumberOfBatteryDeviceViews
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("BCUIAvocadoViewController.m"), 195, CFSTR("ABSTRACT"));

  return 0;
}

- (BOOL)_includeEmptyDevices
{
  return 0;
}

- (id)_newBatteryDeviceView
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("BCUIAvocadoViewController.m"), 204, CFSTR("ABSTRACT"));

  return 0;
}

- (void)_configureBatteryDeviceView:(id)a3 withBatteryDevice:(id)a4 transitionCoordinator:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  NSObject *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  id v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("BCUIAvocadoViewController.m"), 209, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("batteryDeviceView"));

  }
  v12 = (void *)*MEMORY[0x1E0D01B08];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D01B08], OS_LOG_TYPE_DEFAULT))
  {
    v13 = v12;
    -[BCUIAvocadoViewController _synthesizedDebugIdentifier](self, "_synthesizedDebugIdentifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v20 = v14;
    v21 = 2114;
    v22 = v9;
    v23 = 2114;
    v24 = v10;
    _os_log_impl(&dword_1D2A32000, v13, OS_LOG_TYPE_DEFAULT, "(%{public}@) Configuring battery device view '%{public}@' with battery device: %{public}@", buf, 0x20u);

  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v9, "setTransitionCoordinator:", v11);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v9, "setEmpty:", v10 == 0);
  if (v10)
  {
    objc_msgSend(v9, "setPercentCharge:", objc_msgSend(v10, "percentCharge"));
    objc_msgSend(v9, "setLowCharge:", objc_msgSend(v10, "isLowBattery"));
    objc_msgSend(v9, "setCharging:", objc_msgSend(v10, "isCharging"));
    v15 = objc_msgSend(v10, "isLowPowerModeActive");
  }
  else
  {
    objc_msgSend(v9, "setPercentCharge:", 0);
    objc_msgSend(v9, "setLowCharge:", 0);
    objc_msgSend(v9, "setCharging:", 0);
    v15 = 0;
  }
  objc_msgSend(v9, "setLowPowerModeEnabled:", v15);
  objc_msgSend(v10, "batteryWidgetGlyph");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setGlyph:", v16);

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v10, "name");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setName:", v17);

  }
  objc_msgSend(v9, "setScaleFactor:", self->_scaleFactor);

}

- (void)_contentSizeCategoryDidChange:(id)a3
{
  id v3;

  -[BCUIAvocadoViewController view](self, "view", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setNeedsLayout");

}

@end
