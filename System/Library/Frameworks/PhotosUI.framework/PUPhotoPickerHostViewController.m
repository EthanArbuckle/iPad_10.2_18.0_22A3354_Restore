@implementation PUPhotoPickerHostViewController

- (void)willMoveToParentViewController:(id)a3
{
  id v3;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v3, "setNavigationBarHidden:", 1);

}

- (void)invalidate
{
  void *v3;

  if (!-[PUPhotoPickerHostViewController _isInvalidated](self, "_isInvalidated"))
  {
    -[PUPhotoPickerHostViewController set_invalidated:](self, "set_invalidated:", 1);
    -[PUPhotoPickerHostViewController hostProxy](self, "hostProxy");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "invalidatePhotoPickerHostServices");

    -[PUPhotoPickerHostViewController setHostExtensionContext:](self, "setHostExtensionContext:", 0);
  }
}

- (void)performPhotoPickerPreviewOfFirstAsset
{
  id v2;

  -[PUPhotoPickerHostViewController hostProxy](self, "hostProxy");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "performPhotoPickerPreviewOfFirstAsset");

}

- (void)performTraitCollectionUpdateWithCompletion:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  NSObject *v17;
  void *v18;
  id v19;
  id v20;
  uint8_t buf[4];
  const char *v22;
  __int16 v23;
  id v24;
  _QWORD v25[6];

  v25[5] = *MEMORY[0x24BDAC8D0];
  v19 = a3;
  -[PUPhotoPickerHostViewController traitCollection](self, "traitCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x24BEBDAB0];
  objc_msgSend(MEMORY[0x24BEBDAB0], "traitCollectionWithVerticalSizeClass:", objc_msgSend(v4, "verticalSizeClass"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = v6;
  objc_msgSend(MEMORY[0x24BEBDAB0], "traitCollectionWithHorizontalSizeClass:", objc_msgSend(v4, "horizontalSizeClass"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v25[1] = v7;
  objc_msgSend(MEMORY[0x24BEBDAB0], "traitCollectionWithUserInterfaceIdiom:", objc_msgSend(v4, "userInterfaceIdiom"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v25[2] = v8;
  objc_msgSend(MEMORY[0x24BEBDAB0], "traitCollectionWithLayoutDirection:", objc_msgSend(v4, "layoutDirection"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v25[3] = v9;
  v10 = (void *)MEMORY[0x24BEBDAB0];
  objc_msgSend(v4, "preferredContentSizeCategory");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "traitCollectionWithPreferredContentSizeCategory:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v25[4] = v12;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v25, 5);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "traitCollectionWithTraitsFromCollections:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = 0;
  objc_msgSend(MEMORY[0x24BDD1618], "archivedDataWithRootObject:requiringSecureCoding:error:", v14, 1, &v20);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v20;
  if (v16)
  {
    PLUIGetLog();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v22 = "-[PUPhotoPickerHostViewController performTraitCollectionUpdateWithCompletion:]";
      v23 = 2112;
      v24 = v16;
      _os_log_impl(&dword_20D1E2000, v17, OS_LOG_TYPE_ERROR, "%s Error %@", buf, 0x16u);
    }

  }
  -[PUPhotoPickerHostViewController hostProxy](self, "hostProxy");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "performTraitCollectionUpdateUsingData:completion:", v15, v19);

}

- (void)viewServiceDidTerminateWithError:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  objc_super v7;
  uint8_t buf[4];
  const char *v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)PUPhotoPickerHostViewController;
  -[_UIRemoteViewController viewServiceDidTerminateWithError:](&v7, sel_viewServiceDidTerminateWithError_, v4);
  if (!-[PUPhotoPickerHostViewController _isInvalidated](self, "_isInvalidated"))
  {
    PLUIGetLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v9 = "-[PUPhotoPickerHostViewController viewServiceDidTerminateWithError:]";
      v10 = 2112;
      v11 = v4;
      _os_log_impl(&dword_20D1E2000, v5, OS_LOG_TYPE_ERROR, "%s Error %@", buf, 0x16u);
    }

    -[PUPhotoPickerHostViewController hostProxy](self, "hostProxy");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "cancelPhotoPicker");

  }
}

- (NSExtensionContext)hostExtensionContext
{
  return self->_hostExtensionContext;
}

- (void)setHostExtensionContext:(id)a3
{
  objc_storeStrong((id *)&self->_hostExtensionContext, a3);
}

- (PUPhotoPickerHostViewControllerDelegate)delegate
{
  return (PUPhotoPickerHostViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)_isInvalidated
{
  return self->__invalidated;
}

- (void)set_invalidated:(BOOL)a3
{
  self->__invalidated = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_hostExtensionContext, 0);
}

@end
