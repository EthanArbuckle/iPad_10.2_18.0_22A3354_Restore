@implementation NTKCompanionApp

- (UIImage)icon
{
  UIImage *v3;
  void *v4;
  NSObject *v5;
  _QWORD block[5];

  v3 = self->_icon;
  if (!v3 && !self->_fetchingIcon)
  {
    -[NTKCompanionApp watchApplicationIdentifier](self, "watchApplicationIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      -[NTKCompanionApp setFetchingIcon:](self, "setFetchingIcon:", 1);
      dispatch_get_global_queue(0, 0);
      v5 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __23__NTKCompanionApp_icon__block_invoke;
      block[3] = &unk_1E6BCD5F0;
      block[4] = self;
      dispatch_async(v5, block);

    }
  }
  return v3;
}

void __23__NTKCompanionApp_icon__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  double v6;
  uint64_t v7;
  _QWORD v8[5];

  objc_msgSend(MEMORY[0x1E0D51850], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "watchApplicationIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "traitCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "displayScale");
  if (v6 <= 2.0)
    v7 = 42;
  else
    v7 = 41;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __23__NTKCompanionApp_icon__block_invoke_2;
  v8[3] = &unk_1E6BD2268;
  v8[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v2, "getIconForBundleID:iconVariant:block:timeout:", v3, v7, v8, 60.0);

}

void __23__NTKCompanionApp_icon__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  id v5;
  _QWORD v6[4];
  id v7;
  uint64_t v8;

  v3 = a2;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __23__NTKCompanionApp_icon__block_invoke_3;
  v6[3] = &unk_1E6BCD778;
  v4 = *(_QWORD *)(a1 + 32);
  v7 = v3;
  v8 = v4;
  v5 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v6);

}

uint64_t __23__NTKCompanionApp_icon__block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;

  if (*(_QWORD *)(a1 + 32))
  {
    objc_msgSend(*(id *)(a1 + 40), "setIcon:");
    objc_msgSend(*(id *)(a1 + 40), "delegate");
    v2 = (void *)objc_claimAutoreleasedReturnValue();

    if (v2)
    {
      objc_msgSend(*(id *)(a1 + 40), "delegate");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "companionAppUpdatedIcon:", *(_QWORD *)(a1 + 40));

    }
  }
  return objc_msgSend(*(id *)(a1 + 40), "setFetchingIcon:", 0);
}

- (id)complication
{
  return 0;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_storeStrong((id *)&self->_name, a3);
}

- (void)setIcon:(id)a3
{
  objc_storeStrong((id *)&self->_icon, a3);
}

- (NSString)watchApplicationIdentifier
{
  return self->_watchApplicationIdentifier;
}

- (void)setWatchApplicationIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_watchApplicationIdentifier, a3);
}

- (NSString)containerApplicationIdentifier
{
  return self->_containerApplicationIdentifier;
}

- (void)setContainerApplicationIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_containerApplicationIdentifier, a3);
}

- (NTKCompanionAppDelegate)delegate
{
  return (NTKCompanionAppDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)fetchingIcon
{
  return self->_fetchingIcon;
}

- (void)setFetchingIcon:(BOOL)a3
{
  self->_fetchingIcon = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_containerApplicationIdentifier, 0);
  objc_storeStrong((id *)&self->_watchApplicationIdentifier, 0);
  objc_storeStrong((id *)&self->_icon, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
