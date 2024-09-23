@implementation CAMSmartStyleSettingsPickerViewController

- (CAMSmartStyleSettingsPickerViewController)initWithPickerConfiguration:(id)a3 selectedAssetIdentifiers:(id)a4
{
  id v6;
  id v7;
  CAMSmartStyleSettingsPickerViewController *v8;
  uint64_t v9;
  NSArray *initialSelectedAssetIdentifiers;
  uint64_t v11;
  NSArray *selectedAssetIdentifiers;
  void *v13;
  uint64_t v14;
  PHPickerViewController *phPicker;
  CAMSmartStyleSettingsPickerViewController *v16;
  objc_super v18;

  v6 = a3;
  v7 = a4;
  v18.receiver = self;
  v18.super_class = (Class)CAMSmartStyleSettingsPickerViewController;
  v8 = -[CAMSmartStyleSettingsPickerViewController initWithNibName:bundle:](&v18, sel_initWithNibName_bundle_, 0, 0);
  if (v8)
  {
    v9 = objc_msgSend(v7, "copy");
    initialSelectedAssetIdentifiers = v8->_initialSelectedAssetIdentifiers;
    v8->_initialSelectedAssetIdentifiers = (NSArray *)v9;

    v11 = objc_msgSend(v7, "copy");
    selectedAssetIdentifiers = v8->_selectedAssetIdentifiers;
    v8->_selectedAssetIdentifiers = (NSArray *)v11;

    v13 = (void *)objc_msgSend(v6, "copy");
    objc_msgSend(v13, "setPreselectedAssetIdentifiers:", v7);
    objc_msgSend(v13, "setEdgesWithoutContentMargins:", 15);
    objc_msgSend(v13, "setSelection:", 3);
    objc_msgSend(v13, "_setDisabledPrivateCapabilities:", 128);
    v14 = objc_msgSend(objc_alloc(MEMORY[0x1E0CD2180]), "initWithConfiguration:", v13);
    phPicker = v8->__phPicker;
    v8->__phPicker = (PHPickerViewController *)v14;

    -[PHPickerViewController setDelegate:](v8->__phPicker, "setDelegate:", v8);
    v16 = v8;

  }
  return v8;
}

- (void)loadView
{
  CAMSmartStyleSettingsPickerView *v3;
  void *v4;
  CAMSmartStyleSettingsPickerView *v5;
  void *v6;
  id v7;

  -[CAMSmartStyleSettingsPickerViewController _phPicker](self, "_phPicker");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[CAMSmartStyleSettingsPickerViewController addChildViewController:](self, "addChildViewController:", v7);
  v3 = [CAMSmartStyleSettingsPickerView alloc];
  objc_msgSend(v7, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[CAMSmartStyleSettingsPickerView initWithPHPickerView:](v3, "initWithPHPickerView:", v4);

  -[CAMSmartStyleSettingsPickerViewController setView:](self, "setView:", v5);
  -[CAMSmartStyleSettingsPickerView continueButton](v5, "continueButton");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addTarget:action:forControlEvents:", self, sel__handleContinueButton_, 64);
  -[CAMSmartStyleSettingsPickerViewController _updateContinueButtonEnablementState](self, "_updateContinueButtonEnablementState");
  objc_msgSend(v7, "didMoveToParentViewController:", self);

}

- (UIButton)_continueButton
{
  void *v2;
  void *v3;

  -[CAMSmartStyleSettingsPickerViewController _pickerView](self, "_pickerView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "continueButton");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIButton *)v3;
}

- (unint64_t)_requiredAssetCount
{
  void *v2;
  void *v3;
  unint64_t v4;

  -[CAMSmartStyleSettingsPickerViewController _phPicker](self, "_phPicker");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "configuration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "selectionLimit");

  return v4;
}

- (BOOL)isWaitingOnLoading
{
  void *v2;
  char v3;

  -[CAMSmartStyleSettingsPickerViewController _pickerView](self, "_pickerView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isWaitingOnLoading");

  return v3;
}

- (void)setWaitingOnLoading:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[CAMSmartStyleSettingsPickerViewController _pickerView](self, "_pickerView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setWaitingOnLoading:", v3);

}

- (void)_handleContinueButton:(id)a3
{
  id v4;

  -[CAMSmartStyleSettingsPickerViewController delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "smartStyleSettingsPickerDidConfirmSelection:", self);

}

- (void)picker:(id)a3 didFinishPicking:(id)a4
{
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v5, "count"));
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v15;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v15 != v10)
          objc_enumerationMutation(v7);
        objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v11), "assetIdentifier", (_QWORD)v14);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "addObject:", v12);

        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v9);
  }

  -[CAMSmartStyleSettingsPickerViewController setSelectedAssetIdentifiers:](self, "setSelectedAssetIdentifiers:", v6);
  -[CAMSmartStyleSettingsPickerViewController _updateContinueButtonEnablementState](self, "_updateContinueButtonEnablementState");
  -[CAMSmartStyleSettingsPickerViewController delegate](self, "delegate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "smartStyleSettingsPickerDidUpdateSelectedAssetIdentifiers:", self);

}

- (void)_updateContinueButtonEnablementState
{
  unint64_t v3;
  _BOOL8 v4;
  void *v5;
  id v6;

  -[CAMSmartStyleSettingsPickerViewController selectedAssetIdentifiers](self, "selectedAssetIdentifiers");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v6, "count");
  v4 = v3 >= -[CAMSmartStyleSettingsPickerViewController _requiredAssetCount](self, "_requiredAssetCount");
  -[CAMSmartStyleSettingsPickerViewController _continueButton](self, "_continueButton");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setEnabled:", v4);

}

- (CAMSmartStyleSettingsPickerViewControllerDelegate)delegate
{
  return (CAMSmartStyleSettingsPickerViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSArray)selectedAssetIdentifiers
{
  return self->_selectedAssetIdentifiers;
}

- (void)setSelectedAssetIdentifiers:(id)a3
{
  objc_storeStrong((id *)&self->_selectedAssetIdentifiers, a3);
}

- (NSArray)initialSelectedAssetIdentifiers
{
  return self->_initialSelectedAssetIdentifiers;
}

- (PHPickerViewController)_phPicker
{
  return self->__phPicker;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__phPicker, 0);
  objc_storeStrong((id *)&self->_initialSelectedAssetIdentifiers, 0);
  objc_storeStrong((id *)&self->_selectedAssetIdentifiers, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
