@implementation CDPUIAccountRecoveryController

- (void)devicePicker:(id)a3 didSelectDevice:(id)a4
{
  id v5;
  void *v6;
  id v7;

  v5 = a4;
  -[CDPUIController _remoteSecretControllerForDevice:](self, "_remoteSecretControllerForDevice:", v5);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setHidesCancelButton:", 1);
  -[CDPUIAccountRecoveryController _accountRecoveryEscapeOfferForDevice:](self, "_accountRecoveryEscapeOfferForDevice:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "setEscapeOffer:", v6);
  -[UINavigationController pushViewController:animated:](self->super._navController, "pushViewController:animated:", v7, 1);

}

- (id)devicePicker:(id)a3 escapeOffersForDevices:(id)a4
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x24BDAC8D0];
  v5 = (void *)MEMORY[0x24BE1A3F8];
  v6 = a3;
  objc_msgSend(v5, "contextForPrimaryAccount");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CDPUIAccountRecoveryController _accountRecoveryDevicePickerEscapeOfferWithCDPContext:](self, "_accountRecoveryDevicePickerEscapeOfferWithCDPContext:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "setPresentingViewController:", v6);
  v11[0] = v8;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v11, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (BOOL)performingAccountRecovery
{
  return 1;
}

- (void)_presentRemoteSecretControllerWithNewestDevice:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[CDPUIController _remoteSecretControllerForNewestDevice:](self, "_remoteSecretControllerForNewestDevice:", v4);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[CDPUIAccountRecoveryController _accountRecoveryEscapeOfferForDevice:](self, "_accountRecoveryEscapeOfferForDevice:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setEscapeOffer:", v5);
  -[CDPUIController _presentRootController:completion:](self, "_presentRootController:completion:", v6, 0);

}

- (id)_accountRecoveryEscapeOfferForDevice:(id)a3
{
  id v4;
  CDPRemoteValidationEscapeOffer *v5;
  void *v6;
  CDPRemoteValidationEscapeOffer *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  CDPEscapeOption *v18;
  char v19;
  _BOOL4 v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id *v29;
  void *v30;
  const __CFString *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  CDPEscapeOption *v39;
  void *v40;
  __CFString *v42;
  int v43;
  void *v44;
  void *v45;
  _QWORD v46[4];
  id v47;
  _QWORD v48[4];
  id v49;
  id location;

  v4 = a3;
  v5 = [CDPRemoteValidationEscapeOffer alloc];
  objc_msgSend(MEMORY[0x24BE1A3F8], "contextForPrimaryAccount");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[CDPRemoteValidationEscapeOffer initWithCDPContext:](v5, "initWithCDPContext:", v6);

  objc_msgSend(MEMORY[0x24BE1A458], "builderForKey:", CFSTR("REMOTE_SECRET_ENTRY_FORGOT_HATCH"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "modelClass");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addDeviceClass:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addSecretType:", objc_msgSend(v4, "localSecretType"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "localizedString");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[CDPRemoteValidationEscapeOffer setEscapeOfferName:](v7, "setEscapeOfferName:", v12);

  objc_msgSend(MEMORY[0x24BE1A458], "builderForKey:", CFSTR("REMOTE_SECRET_ENTRY_FORGOT_HATCH"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "modelClass");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addDeviceClass:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "addSecretType:", objc_msgSend(v4, "localSecretType"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "localizedString");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[CDPRemoteValidationEscapeOffer setTitle:](v7, "setTitle:", v17);

  v18 = objc_alloc_init(CDPEscapeOption);
  v19 = -[CDPRemoteDeviceSecretValidator supportedEscapeOfferMask](self->super._remoteSecretValidator, "supportedEscapeOfferMask");
  v20 = (v19 & 0x40) == 0;
  objc_initWeak(&location, self);
  if (-[NSArray count](self->super._devices, "count") < 2)
  {
    if ((v19 & 0x40) != 0)
    {
      -[CDPRemoteValidationEscapeOffer setTitle:](v7, "setTitle:", 0);
      -[CDPEscapeOption setStyle:](v18, "setStyle:", 4);
    }
    else
    {
      v44 = (void *)MEMORY[0x24BDD17C8];
      v30 = (void *)MEMORY[0x24BE1A458];
      if ((objc_msgSend(CFSTR("ACCOUNT_RECOVERY_FORGOT_CODE_DIALOG_MESSAGE_SINGLE"), "containsString:", CFSTR("REBRAND")) & 1) != 0|| !_os_feature_enabled_impl())
      {
        v43 = 0;
        v31 = CFSTR("ACCOUNT_RECOVERY_FORGOT_CODE_DIALOG_MESSAGE_SINGLE");
      }
      else
      {
        objc_msgSend(CFSTR("ACCOUNT_RECOVERY_FORGOT_CODE_DIALOG_MESSAGE_SINGLE"), "stringByAppendingString:", CFSTR("_REBRAND"));
        v43 = 1;
        v31 = (const __CFString *)objc_claimAutoreleasedReturnValue();
      }
      v42 = (__CFString *)v31;
      objc_msgSend(v30, "builderForKey:");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "addSecretType:", objc_msgSend(v4, "localSecretType"));
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "modelClass");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "addDeviceClass:", v33);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "localizedString");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "localizedName");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "stringWithValidatedFormat:validFormatSpecifiers:error:", v35, CFSTR("%@"), 0, v36);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      -[CDPRemoteValidationEscapeOffer setMessage:](v7, "setMessage:", v37);

      if (v43)
    }
    CDPLocalizedString();
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    -[CDPEscapeOption setTitle:](v18, "setTitle:", v38);

    v46[0] = MEMORY[0x24BDAC760];
    v46[1] = 3221225472;
    v46[2] = __71__CDPUIAccountRecoveryController__accountRecoveryEscapeOfferForDevice___block_invoke_3;
    v46[3] = &unk_24C8546D8;
    v29 = &v47;
    objc_copyWeak(&v47, &location);
    -[CDPEscapeOption setEscapeAction:](v18, "setEscapeAction:", v46);
  }
  else
  {
    v21 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(MEMORY[0x24BE1A458], "builderForKey:", CFSTR("REMOTE_SECRET_ENTRY_FORGOT_CODE_DIALOG_MESSAGE_ANOTHER_DEVICE"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "addSecretType:", objc_msgSend(v4, "localSecretType"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "addSecretType:", -[NSArray prevailingLocalSecretType](self->super._devices, "prevailingLocalSecretType"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "localizedString");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "localizedName");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "stringWithValidatedFormat:validFormatSpecifiers:error:", v25, CFSTR("%@"), 0, v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[CDPRemoteValidationEscapeOffer setMessage:](v7, "setMessage:", v27);

    CDPLocalizedString();
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[CDPEscapeOption setTitle:](v18, "setTitle:", v28);

    v48[0] = MEMORY[0x24BDAC760];
    v48[1] = 3221225472;
    v48[2] = __71__CDPUIAccountRecoveryController__accountRecoveryEscapeOfferForDevice___block_invoke;
    v48[3] = &unk_24C8546D8;
    v29 = &v49;
    objc_copyWeak(&v49, &location);
    -[CDPEscapeOption setEscapeAction:](v18, "setEscapeAction:", v48);
    v20 = 1;
  }
  objc_destroyWeak(v29);
  v39 = objc_alloc_init(CDPEscapeOption);
  CDPLocalizedString();
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  -[CDPEscapeOption setTitle:](v39, "setTitle:", v40);

  -[CDPEscapeOption setStyle:](v39, "setStyle:", 1);
  -[CDPRemoteValidationEscapeOffer addEscapeOptionsObject:](v7, "addEscapeOptionsObject:", v18);
  if (v20)
    -[CDPRemoteValidationEscapeOffer addEscapeOptionsObject:](v7, "addEscapeOptionsObject:", v39);

  objc_destroyWeak(&location);
  return v7;
}

void __71__CDPUIAccountRecoveryController__accountRecoveryEscapeOfferForDevice___block_invoke(uint64_t a1)
{
  id WeakRetained;
  _QWORD v2[5];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2[0] = MEMORY[0x24BDAC760];
  v2[1] = 3221225472;
  v2[2] = __71__CDPUIAccountRecoveryController__accountRecoveryEscapeOfferForDevice___block_invoke_2;
  v2[3] = &unk_24C8546B0;
  v2[4] = WeakRetained;
  objc_msgSend(WeakRetained, "_setupDevicePickerController:", v2);

}

uint64_t __71__CDPUIAccountRecoveryController__accountRecoveryEscapeOfferForDevice___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "pushViewController:animated:", a2, 1);
}

void __71__CDPUIAccountRecoveryController__accountRecoveryEscapeOfferForDevice___block_invoke_3(uint64_t a1)
{
  id WeakRetained;
  _QWORD v2[5];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2[0] = MEMORY[0x24BDAC760];
  v2[1] = 3221225472;
  v2[2] = __71__CDPUIAccountRecoveryController__accountRecoveryEscapeOfferForDevice___block_invoke_4;
  v2[3] = &unk_24C8541C0;
  v2[4] = WeakRetained;
  objc_msgSend(WeakRetained, "_dismissPresentedViewControllerWithReason:completion:", CFSTR("com.apple.CoreCDPUI.CDPEnrollmentDismissUI"), v2);

}

void __71__CDPUIAccountRecoveryController__accountRecoveryEscapeOfferForDevice___block_invoke_4(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
  _CDPStateError();
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "cancelValidationWithError:", v2);

}

- (void)_setupDevicePickerController:(id)a3
{
  CDPDevicePickerViewController *v4;
  CDPDevicePickerViewController *devicePicker;
  void (**v6)(id, CDPDevicePickerViewController *);

  v6 = (void (**)(id, CDPDevicePickerViewController *))a3;
  v4 = -[CDPDevicePickerViewController initWithDevices:delegate:]([CDPDevicePickerViewController alloc], "initWithDevices:delegate:", self->super._devices, self);
  devicePicker = self->super._devicePicker;
  self->super._devicePicker = v4;

  v6[2](v6, self->super._devicePicker);
}

- (id)_accountRecoveryDevicePickerEscapeOfferWithCDPContext:(id)a3
{
  CDPRemoteValidationEscapeOffer *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  __CFString *v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  CDPEscapeOption *v18;
  void *v19;
  CDPEscapeOption *v20;
  void *v21;
  id v23;
  _QWORD v24[4];
  id v25;
  id location;

  v23 = a3;
  v4 = -[CDPRemoteValidationEscapeOffer initWithCDPContext:]([CDPRemoteValidationEscapeOffer alloc], "initWithCDPContext:", v23);
  v5 = -[NSArray prevailingLocalSecretType](self->super._devices, "prevailingLocalSecretType");
  objc_msgSend(MEMORY[0x24BE1A458], "builderForKey:", CFSTR("DEVICE_PICKER_FORGOT_CODE_DIALOG_TITLE"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addSecretType:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localizedString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)MEMORY[0x24BE1A458];
  v10 = CFSTR("ACCOUNT_RECOVERY_FORGOT_CODE_DIALOG_MESSAGE_MULTI");
  if ((objc_msgSend(CFSTR("ACCOUNT_RECOVERY_FORGOT_CODE_DIALOG_MESSAGE_MULTI"), "containsString:", CFSTR("REBRAND")) & 1) != 0
    || !_os_feature_enabled_impl())
  {
    v11 = 0;
  }
  else
  {
    objc_msgSend(CFSTR("ACCOUNT_RECOVERY_FORGOT_CODE_DIALOG_MESSAGE_MULTI"), "stringByAppendingString:", CFSTR("_REBRAND"));
    v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v11 = 1;
  }
  objc_msgSend(v9, "builderForKey:", v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addSecretType:", v5);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "localizedString");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  objc_msgSend(MEMORY[0x24BE1A458], "builderForKey:", CFSTR("DEVICE_PICKER_APPROVE_FROM_ANOTHER_DEVICE"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "addSecretType:", v5);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "localizedString");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[CDPRemoteValidationEscapeOffer setEscapeOfferName:](v4, "setEscapeOfferName:", v17);

  -[CDPRemoteValidationEscapeOffer setTitle:](v4, "setTitle:", v8);
  -[CDPRemoteValidationEscapeOffer setMessage:](v4, "setMessage:", v14);
  objc_initWeak(&location, self);
  v18 = objc_alloc_init(CDPEscapeOption);
  CDPLocalizedString();
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[CDPEscapeOption setTitle:](v18, "setTitle:", v19);

  v24[0] = MEMORY[0x24BDAC760];
  v24[1] = 3221225472;
  v24[2] = __88__CDPUIAccountRecoveryController__accountRecoveryDevicePickerEscapeOfferWithCDPContext___block_invoke;
  v24[3] = &unk_24C8546D8;
  objc_copyWeak(&v25, &location);
  -[CDPEscapeOption setEscapeAction:](v18, "setEscapeAction:", v24);
  v20 = objc_alloc_init(CDPEscapeOption);
  CDPLocalizedString();
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[CDPEscapeOption setTitle:](v20, "setTitle:", v21);

  -[CDPEscapeOption setStyle:](v20, "setStyle:", 1);
  -[CDPRemoteValidationEscapeOffer addEscapeOptionsObject:](v4, "addEscapeOptionsObject:", v18);
  -[CDPRemoteValidationEscapeOffer addEscapeOptionsObject:](v4, "addEscapeOptionsObject:", v20);

  objc_destroyWeak(&v25);
  objc_destroyWeak(&location);

  return v4;
}

void __88__CDPUIAccountRecoveryController__accountRecoveryDevicePickerEscapeOfferWithCDPContext___block_invoke(uint64_t a1)
{
  id WeakRetained;
  _QWORD v2[5];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2[0] = MEMORY[0x24BDAC760];
  v2[1] = 3221225472;
  v2[2] = __88__CDPUIAccountRecoveryController__accountRecoveryDevicePickerEscapeOfferWithCDPContext___block_invoke_2;
  v2[3] = &unk_24C8541C0;
  v2[4] = WeakRetained;
  objc_msgSend(WeakRetained, "_dismissPresentedViewControllerWithReason:completion:", CFSTR("com.apple.CoreCDPUI.CDPEnrollmentDismissUI"), v2);

}

void __88__CDPUIAccountRecoveryController__accountRecoveryDevicePickerEscapeOfferWithCDPContext___block_invoke_2(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
  _CDPStateError();
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "cancelValidationWithError:", v2);

}

@end
