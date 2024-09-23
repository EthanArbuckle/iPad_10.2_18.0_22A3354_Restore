@implementation BTAlert

- (BTAlert)initWithDevice:(id)a3
{
  id v5;
  BTAlert *v6;
  uint64_t v7;
  UIAlertController *alert;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)BTAlert;
  v6 = -[BTAlert init](&v10, sel_init);
  if (v6)
  {
    objc_msgSend(MEMORY[0x24BEBD3B0], "alertControllerWithTitle:message:preferredStyle:", 0, 0, 1);
    v7 = objc_claimAutoreleasedReturnValue();
    alert = v6->_alert;
    v6->_alert = (UIAlertController *)v7;

    objc_storeStrong((id *)&v6->_device, a3);
  }

  return v6;
}

- (void)dealloc
{
  NSObject *v3;
  UIAlertController *alert;
  BTAlertDelegate *delegate;
  BTSDevice *device;
  UIAlertController *v7;
  objc_super v8;
  uint8_t buf[4];
  UIAlertController *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  sharedBluetoothSettingsLogComponent();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    alert = self->_alert;
    *(_DWORD *)buf = 138412290;
    v10 = alert;
    _os_log_impl(&dword_22F721000, v3, OS_LOG_TYPE_DEFAULT, "Dealloc BTAlert : %@", buf, 0xCu);
  }

  delegate = self->_delegate;
  self->_delegate = 0;

  device = self->_device;
  self->_device = 0;

  v7 = self->_alert;
  self->_alert = 0;

  -[BTAlert dismiss](self, "dismiss");
  v8.receiver = self;
  v8.super_class = (Class)BTAlert;
  -[BTAlert dealloc](&v8, sel_dealloc);
}

- (void)showAlertWithResult:(id)a3
{
  id v4;
  int v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  _BOOL4 v28;
  void *v29;
  void *v30;
  void *v31;
  id *v32;
  uint64_t v33;
  void *v34;
  int v35;
  void *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  id v41;
  void *v42;
  void *v43;
  void *v44;
  NSObject *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  UIAlertController *alert;
  void *v58;
  void *v59;
  _QWORD v60[4];
  id v61;
  id v62;
  _QWORD v63[4];
  id v64;
  _QWORD v65[4];
  id v66;
  uint8_t buf[8];
  _QWORD v68[4];
  id v69;
  _QWORD v70[4];
  id v71;
  _QWORD v72[4];
  id v73;
  id location[2];

  v4 = a3;
  location[0] = 0;
  objc_initWeak(location, self);
  v5 = objc_msgSend(v4, "unsignedIntValue");
  if ((v5 - 151) <= 0x1E)
  {
    if (((1 << (v5 + 105)) & 0x40008081) != 0)
    {
      sharedBluetoothSettingsLogComponent();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_22F721000, v6, OS_LOG_TYPE_DEFAULT, "Show alert for BT_ERROR_INVALID_LINK_KEY using UIAlertController", buf, 2u);
      }

      v7 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("ERROR_MISSING_LINK_KEY"), &stru_24FCCE738, CFSTR("Devices"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[BTSDevice name](self->_device, "name");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "stringWithFormat:", v9, v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      v12 = (void *)MEMORY[0x24BEBD3A8];
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("FORGET_DEVICE"), &stru_24FCCE738, CFSTR("Devices"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v65[0] = MEMORY[0x24BDAC760];
      v65[1] = 3221225472;
      v65[2] = __31__BTAlert_showAlertWithResult___block_invoke_20;
      v65[3] = &unk_24FCCE400;
      v15 = &v66;
      objc_copyWeak(&v66, location);
      objc_msgSend(v12, "actionWithTitle:style:handler:", v14, 0, v65);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      -[UIAlertController addAction:](self->_alert, "addAction:", v16);
      goto LABEL_25;
    }
    if (v5 == 156)
    {
      v17 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "localizedStringForKey:value:table:", CFSTR("ERROR_INCORRECT_PIN"), &stru_24FCCE738, CFSTR("Devices"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[BTSDevice name](self->_device, "name");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "stringWithFormat:", v19, v20);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      v21 = (void *)MEMORY[0x24BEBD3A8];
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "localizedStringForKey:value:table:", CFSTR("OK"), &stru_24FCCE738, CFSTR("Devices"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v68[0] = MEMORY[0x24BDAC760];
      v68[1] = 3221225472;
      v68[2] = __31__BTAlert_showAlertWithResult___block_invoke_3;
      v68[3] = &unk_24FCCE400;
      v15 = &v69;
      objc_copyWeak(&v69, location);
      objc_msgSend(v21, "actionWithTitle:style:handler:", v23, 0, v68);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      -[UIAlertController addAction:](self->_alert, "addAction:", v16);
LABEL_25:
      objc_destroyWeak(v15);
      goto LABEL_26;
    }
  }
  if (v5 == 1)
  {
    if (!-[BTSDevice paired](self->_device, "paired"))
    {
      v46 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "localizedStringForKey:value:table:", CFSTR("ERROR_PAIRING_TIMEOUT"), &stru_24FCCE738, CFSTR("Devices"));
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      v49 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v50, "localizedStringForKey:value:table:", CFSTR("ERROR_GEN_PAIRING_FAILURE"), &stru_24FCCE738, CFSTR("Devices"));
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      -[BTSDevice name](self->_device, "name");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v49, "stringWithFormat:", v51, v52);
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "stringWithFormat:", CFSTR("%@ %@"), v48, v53);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      v54 = (void *)MEMORY[0x24BEBD3A8];
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v55, "localizedStringForKey:value:table:", CFSTR("OK"), &stru_24FCCE738, CFSTR("Devices"));
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      v63[0] = MEMORY[0x24BDAC760];
      v63[1] = 3221225472;
      v63[2] = __31__BTAlert_showAlertWithResult___block_invoke_2_27;
      v63[3] = &unk_24FCCE400;
      v15 = &v64;
      objc_copyWeak(&v64, location);
      objc_msgSend(v54, "actionWithTitle:style:handler:", v56, 0, v63);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      -[UIAlertController addAction:](self->_alert, "addAction:", v16);
      goto LABEL_25;
    }
  }
  else if (v5 == 109)
  {
    v24 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "localizedStringForKey:value:table:", CFSTR("ERROR_UNSUPPORTED_DEVICE"), &stru_24FCCE738, CFSTR("Devices"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[BTSDevice name](self->_device, "name");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "stringWithFormat:", v26, v27);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v28 = -[BTSDevice paired](self->_device, "paired");
    v29 = (void *)MEMORY[0x24BEBD3A8];
    if (v28)
    {
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "localizedStringForKey:value:table:", CFSTR("FORGET_DEVICE"), &stru_24FCCE738, CFSTR("Devices"));
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v72[0] = MEMORY[0x24BDAC760];
      v72[1] = 3221225472;
      v72[2] = __31__BTAlert_showAlertWithResult___block_invoke;
      v72[3] = &unk_24FCCE400;
      v32 = &v73;
      objc_copyWeak(&v73, location);
      objc_msgSend(v29, "actionWithTitle:style:handler:", v31, 2, v72);
      v33 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "localizedStringForKey:value:table:", CFSTR("OK"), &stru_24FCCE738, CFSTR("Devices"));
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v70[0] = MEMORY[0x24BDAC760];
      v70[1] = 3221225472;
      v70[2] = __31__BTAlert_showAlertWithResult___block_invoke_2;
      v70[3] = &unk_24FCCE400;
      v32 = &v71;
      objc_copyWeak(&v71, location);
      objc_msgSend(v29, "actionWithTitle:style:handler:", v31, 0, v70);
      v33 = objc_claimAutoreleasedReturnValue();
    }
    v16 = (void *)v33;

    objc_destroyWeak(v32);
    -[UIAlertController addAction:](self->_alert, "addAction:", v16);
    goto LABEL_26;
  }
  if (-[BTSDevice paired](self->_device, "paired"))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && (-[BTSDevice classicDevice](self->_device, "classicDevice"),
          v34 = (void *)objc_claimAutoreleasedReturnValue(),
          v35 = objc_msgSend(v34, "isProController"),
          v34,
          v35))
    {
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "localizedStringForKey:value:table:", CFSTR("ERROR_PRO_CONTROLLER_CONNECTION_FAILURE"), &stru_24FCCE738, CFSTR("Devices"));
      v37 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "localizedStringForKey:value:table:", CFSTR("ERROR_GEN_CONNECTION_FAILURE"), &stru_24FCCE738, CFSTR("Devices"));
      v37 = objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "localizedStringForKey:value:table:", CFSTR("ERROR_GEN_PAIRING_FAILURE"), &stru_24FCCE738, CFSTR("Devices"));
    v37 = objc_claimAutoreleasedReturnValue();
  }
  v38 = (void *)v37;

  v39 = (void *)MEMORY[0x24BDD17C8];
  v62 = 0;
  -[BTSDevice name](self->_device, "name");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "stringWithValidatedFormat:validFormatSpecifiers:error:", v38, CFSTR("%@"), &v62, v40);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = v62;

  if (v11)
  {
    v42 = (void *)MEMORY[0x24BEBD3A8];
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "localizedStringForKey:value:table:", CFSTR("OK"), &stru_24FCCE738, CFSTR("Devices"));
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v60[0] = MEMORY[0x24BDAC760];
    v60[1] = 3221225472;
    v60[2] = __31__BTAlert_showAlertWithResult___block_invoke_35;
    v60[3] = &unk_24FCCE400;
    objc_copyWeak(&v61, location);
    objc_msgSend(v42, "actionWithTitle:style:handler:", v44, 0, v60);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    -[UIAlertController addAction:](self->_alert, "addAction:", v16);
    objc_destroyWeak(&v61);

LABEL_26:
    alert = self->_alert;
    if (-[BTSDevice paired](self->_device, "paired"))
    {
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v58, "localizedStringForKey:value:table:", CFSTR("CONNECTION_FAILED_TITLE"), &stru_24FCCE738, CFSTR("Devices"));
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v58, "localizedStringForKey:value:table:", CFSTR("PAIRING_FAILED_TITLE"), &stru_24FCCE738, CFSTR("Devices"));
    }
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIAlertController setTitle:](alert, "setTitle:", v59);

    -[UIAlertController setMessage:](self->_alert, "setMessage:", v11);
    -[BTAlertDelegate showAlert:](self->_delegate, "showAlert:", self->_alert);
    goto LABEL_30;
  }
  sharedBluetoothSettingsLogComponent();
  v45 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
    -[BTAlert showAlertWithResult:].cold.1((uint64_t)v41, v45);

  v11 = 0;
  v16 = 0;
LABEL_30:
  objc_destroyWeak(location);

}

void __31__BTAlert_showAlertWithResult___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "userActionResponseWithUnpairStatus:", 1);

}

void __31__BTAlert_showAlertWithResult___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "userActionResponseWithUnpairStatus:", 0);

}

void __31__BTAlert_showAlertWithResult___block_invoke_3(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "userActionResponseWithUnpairStatus:", 0);

}

void __31__BTAlert_showAlertWithResult___block_invoke_20(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "userActionResponseWithUnpairStatus:", 1);

}

void __31__BTAlert_showAlertWithResult___block_invoke_2_27(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "userActionResponseWithUnpairStatus:", 0);

}

void __31__BTAlert_showAlertWithResult___block_invoke_35(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "userActionResponseWithUnpairStatus:", 0);

}

- (void)setDelegate:(id)a3
{
  objc_storeStrong((id *)&self->_delegate, a3);
}

- (void)show
{
  -[BTAlertDelegate showAlert:](self->_delegate, "showAlert:", self->_alert);
}

- (void)userActionResponseWithUnpairStatus:(BOOL)a3
{
  if (a3)
    -[BTSDevice unpair](self->_device, "unpair");
  if (self->_delegate)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      -[BTAlertDelegate performSelector:withObject:](self->_delegate, "performSelector:withObject:", sel_alertSheetDismissed_, self);
  }
}

- (BOOL)isiPhone
{
  void *v2;
  char v3;

  MGGetStringAnswer();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("iPhone"));

  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_device, 0);
  objc_storeStrong((id *)&self->_alert, 0);
  objc_storeStrong((id *)&self->_delegate, 0);
}

- (void)showAlertWithResult:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  __int16 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v2 = 138412546;
  v3 = a1;
  v4 = 2112;
  v5 = 0;
  _os_log_error_impl(&dword_22F721000, a2, OS_LOG_TYPE_ERROR, "bad format string for alert (%@): %@", (uint8_t *)&v2, 0x16u);
}

@end
