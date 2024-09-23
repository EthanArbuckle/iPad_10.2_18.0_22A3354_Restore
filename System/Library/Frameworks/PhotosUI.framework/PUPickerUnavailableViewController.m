@implementation PUPickerUnavailableViewController

- (PUPickerUnavailableViewController)initWithReason:(unint64_t)a3 configuration:(id)a4 error:(id)a5
{
  PHPickerConfiguration *v8;
  id v9;
  PUPickerUnavailableViewController *v10;
  PUPickerUnavailableViewController *v11;
  PHPickerConfiguration *v12;
  objc_super v14;

  v8 = (PHPickerConfiguration *)a4;
  v9 = a5;
  v14.receiver = self;
  v14.super_class = (Class)PUPickerUnavailableViewController;
  v10 = -[PUPickerUnavailableViewController initWithNibName:bundle:](&v14, sel_initWithNibName_bundle_, 0, 0);
  v11 = v10;
  if (v10)
  {
    v10->_reason = a3;
    objc_storeStrong((id *)&v10->_error, a5);
    v12 = v8;
    if (!v8)
      v12 = objc_alloc_init(PHPickerConfiguration);
    objc_storeStrong((id *)&v11->_configuration, v12);
    if (!v8)

  }
  return v11;
}

- (PUPickerUnavailableViewController)init
{
  PUPickerUnavailableViewController *v2;
  SEL v3;
  id v4;
  id v5;

  v2 = (PUPickerUnavailableViewController *)_PFAssertFailHandler();
  return -[PUPickerUnavailableViewController initWithNibName:bundle:](v2, v3, v4, v5);
}

- (PUPickerUnavailableViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v5;
  id v6;
  PUPickerUnavailableViewController *v7;
  SEL v8;
  id v9;

  v5 = a3;
  v6 = a4;
  v7 = (PUPickerUnavailableViewController *)_PFAssertFailHandler();
  return -[PUPickerUnavailableViewController initWithCoder:](v7, v8, v9);
}

- (PUPickerUnavailableViewController)initWithCoder:(id)a3
{
  id v3;
  PUPickerUnavailableViewController *v4;
  SEL v5;
  PUPickerUnavailableViewController *result;

  v3 = a3;
  v4 = (PUPickerUnavailableViewController *)_PFAssertFailHandler();
  -[PUPickerUnavailableViewController viewDidLoad](v4, v5);
  return result;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  char v5;
  void *v6;
  unint64_t v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  objc_super v12;
  uint8_t buf[4];
  void *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v12.receiver = self;
  v12.super_class = (Class)PUPickerUnavailableViewController;
  -[PUPickerUnavailableViewController viewDidLoad](&v12, sel_viewDidLoad);
  -[PUPickerUnavailableViewController updateUnavailableView](self, "updateUnavailableView");
  -[PUPickerUnavailableViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUPickerUnavailableViewController configuration](self, "configuration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "_disabledPrivateCapabilities");

  if ((v5 & 0x10) != 0)
    objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
  else
    objc_msgSend(MEMORY[0x24BEBD4B8], "systemBackgroundColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setBackgroundColor:", v6);

  v7 = -[PUPickerUnavailableViewController reason](self, "reason");
  PLPickerGetLog();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v7 == 1)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_20D1E2000, v9, OS_LOG_TYPE_DEBUG, "Showing picker loading UI.", buf, 2u);
    }
  }
  else if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    -[PUPickerUnavailableViewController reasonDebugDescription](self, "reasonDebugDescription");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUPickerUnavailableViewController error](self, "error");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v14 = v10;
    v15 = 2112;
    v16 = v11;
    _os_log_impl(&dword_20D1E2000, v9, OS_LOG_TYPE_ERROR, "Showing picker unavailable UI (reason: %@) with error: %@", buf, 0x16u);

  }
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
  -[PUPickerUnavailableViewController updateUnavailableView](self, "updateUnavailableView");
}

- (void)updateReason:(unint64_t)a3 error:(id)a4
{
  unint64_t v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  self->_reason = a3;
  objc_storeStrong((id *)&self->_error, a4);
  -[PUPickerUnavailableViewController updateUnavailableView](self, "updateUnavailableView");
  v5 = -[PUPickerUnavailableViewController reason](self, "reason");
  PLPickerGetLog();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v5 == 1)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(v10) = 0;
      _os_log_impl(&dword_20D1E2000, v7, OS_LOG_TYPE_DEBUG, "Showing picker loading UI (updated).", (uint8_t *)&v10, 2u);
    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    -[PUPickerUnavailableViewController reasonDebugDescription](self, "reasonDebugDescription");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUPickerUnavailableViewController error](self, "error");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138412546;
    v11 = v8;
    v12 = 2112;
    v13 = v9;
    _os_log_impl(&dword_20D1E2000, v7, OS_LOG_TYPE_ERROR, "Showing picker unavailable UI (updated) (reason: %@) with error: %@", (uint8_t *)&v10, 0x16u);

  }
}

- (void)updateUnavailableView
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void (*v21)(uint64_t);
  void *v22;
  id v23;
  id location;

  if (-[PUPickerUnavailableViewController reason](self, "reason") == 1)
  {
    objc_msgSend(MEMORY[0x24BEBD4E8], "loadingConfiguration");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x24BEBD4E8], "emptyProminentConfiguration");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUPickerUnavailableViewController unavailableTitle](self, "unavailableTitle");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setText:", v4);

    -[PUPickerUnavailableViewController unavailableMessage](self, "unavailableMessage");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setSecondaryText:", v5);

    -[PUPickerUnavailableViewController unavailableButtonTitle](self, "unavailableButtonTitle");
    v6 = objc_claimAutoreleasedReturnValue();
    if (v6
      && (v7 = (void *)v6,
          -[PUPickerUnavailableViewController delegate](self, "delegate"),
          v8 = (void *)objc_claimAutoreleasedReturnValue(),
          v9 = objc_opt_respondsToSelector(),
          v8,
          v7,
          (v9 & 1) != 0))
    {
      objc_initWeak(&location, self);
      -[PUPickerUnavailableViewController unavailableButtonTitle](self, "unavailableButtonTitle");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "buttonProperties");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "configuration");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setTitle:", v10);

      v13 = (void *)MEMORY[0x24BEBD388];
      v19 = MEMORY[0x24BDAC760];
      v20 = 3221225472;
      v21 = __58__PUPickerUnavailableViewController_updateUnavailableView__block_invoke;
      v22 = &unk_24C62C348;
      objc_copyWeak(&v23, &location);
      objc_msgSend(v13, "actionWithHandler:", &v19);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "buttonProperties", v19, v20, v21, v22);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setPrimaryAction:", v14);

      objc_destroyWeak(&v23);
      objc_destroyWeak(&location);
    }
    else
    {
      objc_msgSend(v3, "buttonProperties");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "configuration");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setTitle:", 0);

      objc_msgSend(v3, "buttonProperties");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setPrimaryAction:", 0);

    }
  }
  -[PUPickerUnavailableViewController _setContentUnavailableConfiguration:](self, "_setContentUnavailableConfiguration:", v3);

}

- (id)unavailableTitle
{
  void *v3;
  void *v4;
  void *v5;

  -[PUPickerUnavailableViewController unavailableKey](self, "unavailableKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  switch(-[PUPickerUnavailableViewController reason](self, "reason"))
  {
    case 1uLL:
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("PHOTO_PICKER_CONTENT_UNAVAILABLE_TITLE_REASON_LOADING_%@"), v3);
      goto LABEL_7;
    case 2uLL:
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("PHOTO_PICKER_CONTENT_UNAVAILABLE_TITLE_REASON_CRASHED_%@"), v3);
      goto LABEL_7;
    case 3uLL:
      PLServicesLocalizedFrameworkString();
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_8;
    case 4uLL:
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("PHOTO_PICKER_CONTENT_UNAVAILABLE_TITLE_REASON_CANNOT_OPEN_PHOTO_LIBRARY_%@"), v3);
      goto LABEL_7;
    default:
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("PHOTO_PICKER_CONTENT_UNAVAILABLE_TITLE_REASON_UNKNOWN_%@"), v3);
LABEL_7:
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      PLServicesLocalizedFrameworkString();
      v4 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_8:
      return v4;
  }
}

- (id)unavailableMessage
{
  void *v3;
  unint64_t v4;
  void *v5;
  void *v6;
  void *v8;

  -[PUPickerUnavailableViewController unavailableKey](self, "unavailableKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[PUPickerUnavailableViewController reason](self, "reason");
  if (v4 == 1)
    goto LABEL_9;
  if (v4 == 4)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("PHOTO_PICKER_CONTENT_UNAVAILABLE_MESSAGE_REASON_CANNOT_OPEN_PHOTO_LIBRARY_%@"), v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    PLServicesLocalizedFrameworkString();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_8:

    goto LABEL_10;
  }
  if (v4 != 3)
  {
    if (MEMORY[0x212B9FA78]())
    {
      -[PUPickerUnavailableViewController error](self, "error");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[PUPickerUnavailableViewController reasonDebugDescription](self, "reasonDebugDescription");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      PFStringWithValidatedFormat();
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_8;
    }
LABEL_9:
    v5 = 0;
    goto LABEL_10;
  }
  PLServicesLocalizedFrameworkString();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_10:

  return v5;
}

- (id)unavailableButtonTitle
{
  unint64_t v2;

  v2 = -[PUPickerUnavailableViewController reason](self, "reason");
  if (v2 - 3 < 2 || v2 == 1)
    return 0;
  if (v2 != 2)
    MEMORY[0x212B9FA78]();
  PLServicesLocalizedFrameworkString();
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)reasonDebugDescription
{
  unint64_t v2;

  v2 = -[PUPickerUnavailableViewController reason](self, "reason");
  if (v2 - 1 > 3)
    return CFSTR("unknown");
  else
    return off_24C62C368[v2 - 1];
}

- (id)unavailableKey
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  const __CFString *v6;

  -[PUPickerUnavailableViewController configuration](self, "configuration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "filter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_puPickerFilter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "generatedPossibleAssetTypes");

  v6 = CFSTR("VIDEOS");
  if ((v5 & 0x3FE) != 0)
    v6 = CFSTR("ITEMS");
  if ((v5 & 0x1FC00) == 0)
    v6 = CFSTR("PHOTOS");
  if (v5)
    return (id)v6;
  else
    return CFSTR("ITEMS");
}

- (void)askDelegateToCancel
{
  id v3;

  -[PUPickerUnavailableViewController delegate](self, "delegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "_pickerUnavailableViewControllerCancelButtonTapped:", self);

}

- (void)askDelegateToRetry
{
  id v3;

  -[PUPickerUnavailableViewController delegate](self, "delegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "_pickerUnavailableViewControllerRetryButtonTapped:", self);

}

- (unint64_t)reason
{
  return self->_reason;
}

- (PHPickerConfiguration)configuration
{
  return self->_configuration;
}

- (NSError)error
{
  return self->_error;
}

- (_PUPickerUnavailableViewControllerDelegate)delegate
{
  return (_PUPickerUnavailableViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
}

void __58__PUPickerUnavailableViewController_updateUnavailableView__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "askDelegateToRetry");

}

+ (id)unavailableViewController:(unint64_t)a3 configuration:(id)a4 error:(id)a5 delegate:(id)a6
{
  id v9;
  id v10;
  id v11;
  PUPickerUnavailableViewController *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  PUPickerUnavailableViewController *v19;
  id v21;

  v9 = a4;
  v10 = a6;
  v11 = a5;
  v12 = -[PUPickerUnavailableViewController initWithReason:configuration:error:]([PUPickerUnavailableViewController alloc], "initWithReason:configuration:error:", a3, v9, v11);

  -[PUPickerUnavailableViewController setDelegate:](v12, "setDelegate:", v10);
  LOBYTE(v11) = objc_opt_respondsToSelector();

  if ((v11 & 1) == 0
    || (objc_msgSend(v9, "disabledCapabilities") & 8) != 0
    || (objc_msgSend(v9, "edgesWithoutContentMargins") & 1) != 0)
  {
    v19 = v12;
  }
  else
  {
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD410]), "initWithBarButtonSystemItem:target:action:", 1, v12, sel_cancelButtonTapped_);
    -[PUPickerUnavailableViewController navigationItem](v12, "navigationItem");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setLeftBarButtonItem:", v13);

    v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD7A0]), "initWithRootViewController:", v12);
    objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "bundleIdentifier");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "isEqualToString:", CFSTR("com.apple.Preferences"));

    if (v18)
    {
      v19 = v15;
    }
    else
    {
      v21 = objc_alloc_init(MEMORY[0x24BEBDB08]);
      v19 = (PUPickerUnavailableViewController *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD968]), "initWithStyle:", 1);
      -[PUPickerUnavailableViewController setViewController:forColumn:](v19, "setViewController:forColumn:", v21, 0);
      -[PUPickerUnavailableViewController setViewController:forColumn:](v19, "setViewController:forColumn:", v15, 2);
      -[PUPickerUnavailableViewController setViewController:forColumn:](v19, "setViewController:forColumn:", v15, 3);
      -[PUPickerUnavailableViewController setPrimaryBackgroundStyle:](v19, "setPrimaryBackgroundStyle:", 1);
      -[PUPickerUnavailableViewController setPreferredSplitBehavior:](v19, "setPreferredSplitBehavior:", 1);
      -[PUPickerUnavailableViewController setPresentsWithGesture:](v19, "setPresentsWithGesture:", 0);
      -[PUPickerUnavailableViewController setPreferredDisplayMode:](v19, "setPreferredDisplayMode:", 1);

    }
  }

  return v19;
}

@end
