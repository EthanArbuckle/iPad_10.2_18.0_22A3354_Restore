@implementation CNTonePickerController

- (CNTonePickerController)initWithAlertType:(int64_t)a3 activityAlert:(id)a4
{
  id v7;
  CNTonePickerController *v8;
  uint64_t v9;
  TKTonePickerViewController *tonePicker;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  CNToneKitPickerStyleProvider *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v28;
  objc_super v29;

  v7 = a4;
  if ((unint64_t)(a3 - 3) <= 0xFFFFFFFFFFFFFFFDLL)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CNTonePickerController.m"), 29, CFSTR("Only call and text alerts are allowed"));

  }
  v29.receiver = self;
  v29.super_class = (Class)CNTonePickerController;
  v8 = -[CNTonePickerController initWithNibName:bundle:](&v29, sel_initWithNibName_bundle_, 0, 0);
  if (v8)
  {
    v9 = objc_msgSend(objc_alloc((Class)getTKTonePickerViewControllerClass[0]()), "initWithAlertType:", a3);
    tonePicker = v8->_tonePicker;
    v8->_tonePicker = (TKTonePickerViewController *)v9;

    CNContactsUIBundle();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (a3 == 1)
    {
      objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("EDIT_RINGTONE"), &stru_1E20507A8, CFSTR("Localized"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[TKTonePickerViewController navigationItem](v8->_tonePicker, "navigationItem");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setTitle:", v13);

      -[TKTonePickerViewController setShowsNone:](v8->_tonePicker, "setShowsNone:", 0);
    }
    else
    {
      objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("EDIT_TEXTTONE"), &stru_1E20507A8, CFSTR("Localized"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[TKTonePickerViewController navigationItem](v8->_tonePicker, "navigationItem");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setTitle:", v15);

      -[TKTonePickerViewController setShowsNone:](v8->_tonePicker, "setShowsNone:", 1);
      -[TKTonePickerViewController setNoneAtTop:](v8->_tonePicker, "setNoneAtTop:", 1);
    }
    -[TKTonePickerViewController setShowsIgnoreMute:](v8->_tonePicker, "setShowsIgnoreMute:", 1);
    -[TKTonePickerViewController setIgnoreMute:](v8->_tonePicker, "setIgnoreMute:", objc_msgSend(v7, "ignoreMute"));
    +[CNCapabilitiesManager defaultCapabilitiesManager](CNCapabilitiesManager, "defaultCapabilitiesManager");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[TKTonePickerViewController setShowsVibrations:](v8->_tonePicker, "setShowsVibrations:", objc_msgSend(v17, "hasVibratorCapability"));

    -[TKTonePickerViewController setShowsDefault:](v8->_tonePicker, "setShowsDefault:", 1);
    objc_msgSend(v7, "sound");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[TKTonePickerViewController setSelectedToneIdentifier:](v8->_tonePicker, "setSelectedToneIdentifier:", v18);

    objc_msgSend(v7, "vibration");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[TKTonePickerViewController setSelectedVibrationIdentifier:](v8->_tonePicker, "setSelectedVibrationIdentifier:", v19);

    v20 = objc_alloc_init(CNToneKitPickerStyleProvider);
    -[TKTonePickerViewController setStyleProvider:](v8->_tonePicker, "setStyleProvider:", v20);

    -[CNTonePickerController navigationBar](v8, "navigationBar");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "_cnui_applyContactStyle");

    -[TKTonePickerViewController tableView](v8->_tonePicker, "tableView");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "_cnui_applyContactStyle");

    v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 0, v8, sel_doneButton_);
    -[TKTonePickerViewController navigationItem](v8->_tonePicker, "navigationItem");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setRightBarButtonItem:", v23);

    v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 1, v8, sel_cancelButton_);
    -[TKTonePickerViewController navigationItem](v8->_tonePicker, "navigationItem");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setLeftBarButtonItem:", v25);

    -[CNTonePickerController pushViewController:animated:](v8, "pushViewController:animated:", v8->_tonePicker, 0);
  }

  return v8;
}

- (void)doneButton:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v4 = objc_alloc(MEMORY[0x1E0C971B8]);
  -[CNTonePickerController tonePicker](self, "tonePicker");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "selectedToneIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNTonePickerController tonePicker](self, "tonePicker");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "selectedVibrationIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNTonePickerController tonePicker](self, "tonePicker");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (id)objc_msgSend(v4, "initWithSound:vibration:ignoreMute:", v6, v8, objc_msgSend(v9, "ignoreMute"));

  -[CNTonePickerController delegate](self, "delegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "picker:didPickItem:", self, v11);

  -[CNTonePickerController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (void)cancelButton:(id)a3
{
  void *v4;

  -[CNTonePickerController delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "pickerDidCancel:", self);

  -[CNTonePickerController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (TKTonePickerViewController)tonePicker
{
  return self->_tonePicker;
}

- (void)setTonePicker:(id)a3
{
  objc_storeStrong((id *)&self->_tonePicker, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tonePicker, 0);
}

@end
