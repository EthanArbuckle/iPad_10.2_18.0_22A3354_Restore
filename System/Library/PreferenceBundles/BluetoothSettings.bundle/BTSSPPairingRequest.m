@implementation BTSSPPairingRequest

- (BTSSPPairingRequest)initWithDevice:(id)a3 andSpecifier:(id)a4
{
  id v7;
  id v8;
  BTSSPPairingRequest *v9;
  uint64_t v10;
  UIAlertController *alert;
  void *v12;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)BTSSPPairingRequest;
  v9 = -[BTSSPPairingRequest init](&v14, sel_init);
  if (v9)
  {
    objc_msgSend(MEMORY[0x24BEBD3B0], "alertControllerWithTitle:message:preferredStyle:", 0, 0, 1);
    v10 = objc_claimAutoreleasedReturnValue();
    alert = v9->_alert;
    v9->_alert = (UIAlertController *)v10;

    objc_storeStrong((id *)&v9->_device, a3);
    objc_storeStrong((id *)&v9->_specifier, a4);
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addObserver:selector:name:object:", v9, sel_hidPairingResult_, *MEMORY[0x24BE0F9A8], 0);

  }
  return v9;
}

- (void)dealloc
{
  void *v3;
  id delegate;
  BluetoothDevice *device;
  PSSpecifier *specifier;
  UIAlertController *alert;
  objc_super v8;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  delegate = self->_delegate;
  self->_delegate = 0;

  device = self->_device;
  self->_device = 0;

  specifier = self->_specifier;
  self->_specifier = 0;

  alert = self->_alert;
  self->_alert = 0;

  v8.receiver = self;
  v8.super_class = (Class)BTSSPPairingRequest;
  -[BTSSPPairingRequest dealloc](&v8, sel_dealloc);
}

- (void)setDelegate:(id)a3
{
  objc_storeStrong(&self->_delegate, a3);
}

- (id)sanitizeNameForAlert:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  int v12;
  id v13;
  void *v14;
  id v16;

  v3 = a3;
  objc_msgSend(MEMORY[0x24BDD17A8], "scannerWithString:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD14A8], "illegalCharacterSet");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setCharactersToBeSkipped:", v5);

  objc_msgSend(MEMORY[0x24BDD16A8], "string");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16A8], "string");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  while (1)
  {
    v8 = v7;
    objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceAndNewlineCharacterSet");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v7;
    v10 = objc_msgSend(v4, "scanUpToCharactersFromSet:intoString:", v9, &v16);
    v7 = v16;

    if (!v10)
      break;
    objc_msgSend(v6, "appendString:", v7);
    objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceAndNewlineCharacterSet");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v4, "scanCharactersFromSet:intoString:", v11, 0);

    if (v12)
      objc_msgSend(v6, "appendString:", CFSTR(" "));
  }
  if ((unint64_t)objc_msgSend(v6, "length") < 0x33)
  {
    v13 = v6;
  }
  else
  {
    objc_msgSend(v6, "substringToIndex:", 50);
    v13 = (id)objc_claimAutoreleasedReturnValue();
  }
  v14 = v13;

  return v14;
}

- (int)pairingStyle
{
  return self->_pairingStyle;
}

- (void)setPairingStyle:(int)a3 andPasskey:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  int v9;
  int v10;
  int v11;
  _BOOL4 v13;
  unsigned int v14;
  unsigned int v15;
  _BOOL4 v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  int v21;
  __CFString *v22;
  __CFString *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  id *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  int v49;
  __CFString *v50;
  __CFString *v51;
  void *v52;
  void *v53;
  void *v54;
  uint64_t v55;
  void *v56;
  id v57;
  id v58;
  void *v59;
  void *v60;
  void *v61;
  uint64_t v62;
  id v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  id v83;
  void *v84;
  void *v85;
  void *v86;
  _QWORD v87[4];
  id v88;
  _QWORD v89[4];
  id v90;
  _QWORD v91[4];
  id v92;
  _QWORD v93[4];
  id v94;
  id location[2];

  v6 = a4;
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("PAIRING_TITLE"), &stru_24FCCE738, CFSTR("SSPAlert"));
  v85 = (void *)objc_claimAutoreleasedReturnValue();

  -[BluetoothDevice name](self->_device, "name");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[BTSSPPairingRequest sanitizeNameForAlert:](self, "sanitizeNameForAlert:", v8);
  v84 = (void *)objc_claimAutoreleasedReturnValue();

  self->_pairingStyle = a3;
  location[0] = 0;
  objc_initWeak(location, self);
  v9 = -[BluetoothDevice type](self->_device, "type");
  v10 = -[BluetoothDevice productId](self->_device, "productId");
  v11 = -[BluetoothDevice vendorId](self->_device, "vendorId");
  v13 = v10 == 613 || v10 == 617;
  v14 = (0x39u >> (v10 - 9)) & 1;
  if ((v10 - 777) >= 6)
    v14 = 0;
  if (v11 != 1452)
    v14 = 0;
  if (v11 == 76)
    v15 = 0;
  else
    v15 = v14;
  v16 = v11 == 76 && v13;
  switch(a3)
  {
    case 0:
      v17 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "localizedStringForKey:value:table:", CFSTR("JUST_WORKS_MESSAGE"), &stru_24FCCE738, CFSTR("SSPAlert"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "stringWithFormat:", v19, v84);
      v86 = (void *)objc_claimAutoreleasedReturnValue();

      if (v9 == 25)
        v20 = 1;
      else
        v20 = v15;
      if ((v20 | v16) == 1 && -[BTSSPPairingRequest hasLimitedSupportForHID](self, "hasLimitedSupportForHID"))
      {
        v21 = MGGetBoolAnswer();
        v22 = CFSTR("WIFI");
        if (v21)
          v22 = CFSTR("WLAN");
        v23 = v22;
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@_JUST_WORKS_MESSAGE_HID_OLD"), v23);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = (void *)MEMORY[0x24BDD17C8];
        objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "localizedStringForKey:value:table:", v24, &stru_24FCCE738, CFSTR("SSPAlert"));
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "stringWithFormat:", v27, v84);
        v28 = objc_claimAutoreleasedReturnValue();

        v86 = (void *)v28;
      }
      v29 = (void *)MEMORY[0x24BEBD3A8];
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "localizedStringForKey:value:table:", CFSTR("PAIR_BUTTON"), &stru_24FCCE738, CFSTR("SSPAlert"));
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v93[0] = MEMORY[0x24BDAC760];
      v93[1] = 3221225472;
      v93[2] = __50__BTSSPPairingRequest_setPairingStyle_andPasskey___block_invoke;
      v93[3] = &unk_24FCCE400;
      v32 = &v94;
      objc_copyWeak(&v94, location);
      objc_msgSend(v29, "actionWithTitle:style:handler:", v31, 0, v93);
      v33 = objc_claimAutoreleasedReturnValue();
      goto LABEL_36;
    case 1:
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%06u"), objc_msgSend(v6, "unsignedIntValue"));
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "localizedStringForKey:value:table:", CFSTR("NUMERIC_MESSAGE"), &stru_24FCCE738, CFSTR("SSPAlert"));
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "stringWithFormat:", v37, v84, v84);
      v86 = (void *)objc_claimAutoreleasedReturnValue();

      v38 = (void *)MEMORY[0x24BEBD3A8];
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "localizedStringForKey:value:table:", CFSTR("PAIR_BUTTON"), &stru_24FCCE738, CFSTR("SSPAlert"));
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v91[0] = MEMORY[0x24BDAC760];
      v91[1] = 3221225472;
      v91[2] = __50__BTSSPPairingRequest_setPairingStyle_andPasskey___block_invoke_2;
      v91[3] = &unk_24FCCE400;
      objc_copyWeak(&v92, location);
      objc_msgSend(v38, "actionWithTitle:style:handler:", v40, 0, v91);
      v41 = (void *)objc_claimAutoreleasedReturnValue();

      objc_destroyWeak(&v92);
      break;
    case 2:
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%06u"), objc_msgSend(v6, "unsignedIntValue"));
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "localizedStringForKey:value:table:", CFSTR("PASSKEY_MESSAGE"), &stru_24FCCE738, CFSTR("SSPAlert"));
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "stringWithFormat:", v44, v84, v84);
      v86 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_30;
    case 3:
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%04u"), objc_msgSend(v6, "unsignedIntValue"));
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v45 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "localizedStringForKey:value:table:", CFSTR("HID_MESSAGE"), &stru_24FCCE738, CFSTR("SSPAlert"));
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "stringWithFormat:", v44, v84);
      v86 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_30:

      v41 = 0;
      break;
    case 4:
      v46 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "localizedStringForKey:value:table:", CFSTR("JUST_WORKS_MESSAGE"), &stru_24FCCE738, CFSTR("SSPAlert"));
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "stringWithFormat:", v48, v84);
      v86 = (void *)objc_claimAutoreleasedReturnValue();

      if (-[BTSSPPairingRequest hasLimitedSupportForHID](self, "hasLimitedSupportForHID"))
      {
        v49 = MGGetBoolAnswer();
        v50 = CFSTR("WIFI_JUST_WORKS_MESSAGE_HID_OLD");
        if (v49)
          v50 = CFSTR("WLAN_JUST_WORKS_MESSAGE_HID_OLD");
        v51 = v50;
        v52 = (void *)MEMORY[0x24BDD17C8];
        objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v53, "localizedStringForKey:value:table:", v51, &stru_24FCCE738, CFSTR("SSPAlert"));
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v52, "stringWithFormat:", v54, v84);
        v55 = objc_claimAutoreleasedReturnValue();

        v86 = (void *)v55;
      }
      v56 = (void *)MEMORY[0x24BEBD3A8];
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "localizedStringForKey:value:table:", CFSTR("PAIR_BUTTON"), &stru_24FCCE738, CFSTR("SSPAlert"));
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v89[0] = MEMORY[0x24BDAC760];
      v89[1] = 3221225472;
      v89[2] = __50__BTSSPPairingRequest_setPairingStyle_andPasskey___block_invoke_3;
      v89[3] = &unk_24FCCE400;
      v32 = &v90;
      objc_copyWeak(&v90, location);
      objc_msgSend(v56, "actionWithTitle:style:handler:", v31, 0, v89);
      v33 = objc_claimAutoreleasedReturnValue();
LABEL_36:
      v41 = (void *)v33;

      objc_destroyWeak(v32);
      v34 = 0;
      break;
    default:
      v41 = 0;
      v34 = 0;
      v86 = 0;
      break;
  }
  -[UIAlertController setTitle:](self->_alert, "setTitle:", v85);
  -[UIAlertController setMessage:](self->_alert, "setMessage:", v86);
  if (v34)
  {
    v57 = objc_alloc_init(MEMORY[0x24BEBD708]);
    v83 = v6;
    v58 = objc_alloc(MEMORY[0x24BDD1688]);
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@\r\n"), v34);
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    v60 = (void *)objc_msgSend(v58, "initWithString:", v59);

    objc_msgSend(MEMORY[0x24BEBB520], "preferredFontForTextStyle:", *MEMORY[0x24BEBE240]);
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    v62 = objc_msgSend(v34, "length");
    objc_msgSend(v60, "addAttribute:value:range:", *MEMORY[0x24BEBB360], v61, 0, v62);

    objc_msgSend(v57, "setAttributedText:", v60);
    objc_msgSend(v57, "setNumberOfLines:", 0);
    objc_msgSend(v57, "setTextAlignment:", 1);
    objc_msgSend(v57, "setBaselineAdjustment:", 1);
    objc_msgSend(v57, "setAdjustsFontSizeToFitWidth:", 1);
    objc_msgSend(v57, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v63 = objc_alloc_init(MEMORY[0x24BEBDB08]);
    objc_msgSend(v63, "view");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v64, "setFrame:", 0.0, 0.0, 50.0, 50.0);

    objc_msgSend(v63, "view");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v65, "addSubview:", v57);

    objc_msgSend(v57, "centerXAnchor");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v63, "view");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v67, "centerXAnchor");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v66, "constraintEqualToAnchor:", v68);
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v69, "setActive:", 1);

    objc_msgSend(v57, "topAnchor");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v63, "view");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v71, "topAnchor");
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v70, "constraintEqualToAnchor:constant:", v72, 20.0);
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v73, "setActive:", 1);

    objc_msgSend(v57, "bottomAnchor");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v63, "view");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v75, "bottomAnchor");
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v74, "constraintEqualToAnchor:constant:", v76, -20.0);
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v77, "setActive:", 1);

    objc_msgSend(v63, "view");
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v78, "systemLayoutSizeFittingSize:", *MEMORY[0x24BEBE588], *(double *)(MEMORY[0x24BEBE588] + 8));
    objc_msgSend(v63, "setPreferredContentSize:");

    -[UIAlertController setContentViewController:](self->_alert, "setContentViewController:", v63);
    v6 = v83;
  }
  v79 = (void *)MEMORY[0x24BEBD3A8];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v80, "localizedStringForKey:value:table:", CFSTR("CANCEL_BUTTON"), &stru_24FCCE738, CFSTR("SSPAlert"));
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  v87[0] = MEMORY[0x24BDAC760];
  v87[1] = 3221225472;
  v87[2] = __50__BTSSPPairingRequest_setPairingStyle_andPasskey___block_invoke_4;
  v87[3] = &unk_24FCCE400;
  objc_copyWeak(&v88, location);
  objc_msgSend(v79, "actionWithTitle:style:handler:", v81, 0, v87);
  v82 = (void *)objc_claimAutoreleasedReturnValue();

  -[UIAlertController addAction:](self->_alert, "addAction:", v82);
  if (v41)
    -[UIAlertController addAction:](self->_alert, "addAction:", v41);
  objc_destroyWeak(&v88);
  objc_destroyWeak(location);

}

void __50__BTSSPPairingRequest_setPairingStyle_andPasskey___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "acceptSSP:", 0);

}

void __50__BTSSPPairingRequest_setPairingStyle_andPasskey___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "acceptSSP:", 0);

}

void __50__BTSSPPairingRequest_setPairingStyle_andPasskey___block_invoke_3(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "acceptSSP:", 0);

}

void __50__BTSSPPairingRequest_setPairingStyle_andPasskey___block_invoke_4(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "acceptSSP:", 1);

}

- (void)show
{
  objc_msgSend(self->_delegate, "showPairingAlert:", self->_alert);
}

- (void)dismiss
{
  objc_msgSend(self->_delegate, "dismissPairingAlert:", self->_alert);
}

- (void)hidPairingResult:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  sharedBluetoothSettingsLogComponent();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v4, "name");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[BluetoothDevice name](self->_device, "name");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138412546;
    v9 = v6;
    v10 = 2112;
    v11 = v7;
    _os_log_impl(&dword_22F721000, v5, OS_LOG_TYPE_DEFAULT, "Received %@ for device %@", (uint8_t *)&v8, 0x16u);

  }
}

- (void)acceptSSP:(int64_t)a3
{
  int pairingStyle;
  void *v6;
  BluetoothDevice *device;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  const __CFString *v12;
  id v13;

  pairingStyle = self->_pairingStyle;
  if (a3 == 1)
  {
    if (pairingStyle == 4 || pairingStyle == 3)
    {
      -[BluetoothDevice setPIN:](self->_device, "setPIN:", 0);
      return;
    }
  }
  else if (pairingStyle == 4)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    device = self->_device;
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%04u"), objc_msgSend(v6, "unsignedIntValue"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[BluetoothDevice setPIN:](device, "setPIN:", v8);

    -[PSSpecifier userInfo](self->_specifier, "userInfo");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKey:", CFSTR("entered"), CFSTR("PIN-ended"));

  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(self->_delegate, "setSSPConfirmation:forDevice:", a3, self->_device);
  }
  else
  {
    -[PSSpecifier userInfo](self->_specifier, "userInfo");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (a3)
      v12 = CFSTR("cancelled");
    else
      v12 = CFSTR("accepted");
    objc_msgSend(v10, "setObject:forKey:", v12, CFSTR("PIN-ended"));

    objc_msgSend(MEMORY[0x24BE0F9E0], "sharedInstance");
    v13 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "acceptSSP:forDevice:", a3, self->_device);

  }
}

- (BOOL)hasLimitedSupportForHID
{
  return MGIsDeviceOneOfType();
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_delegate, 0);
  objc_storeStrong((id *)&self->_alert, 0);
  objc_storeStrong((id *)&self->_specifier, 0);
  objc_storeStrong((id *)&self->_device, 0);
}

@end
