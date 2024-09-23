@implementation CARSetupPrompts

+ (id)bluetoothConfirmationPromptForVehicleName:(id)a3 numericCode:(id)a4 responseHandler:(id)a5
{
  objc_class *v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  void *v35;
  id v36;
  void *v37;
  void *v38;
  void *v39;
  id v40;
  void *v41;
  id v42;
  void *v43;
  void *v44;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  id v54;
  void *v55;
  id v56;
  void *v57;
  _QWORD v58[4];
  id v59;
  _QWORD v60[4];
  id v61;
  _QWORD v62[6];

  v62[4] = *MEMORY[0x24BDAC8D0];
  v56 = a5;
  v7 = (objc_class *)MEMORY[0x24BE7B3E0];
  v8 = a4;
  v9 = a3;
  v10 = objc_alloc_init(v7);
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("BLUETOOTH_PAIRING_CARD_TITLE"), &stru_250987190, CFSTR("Localizable"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "setTitle:", v12);
  v13 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("BLUETOOTH_PAIRING_CARD_MESSAGE_IPHONE_%@"), &stru_250987190, CFSTR("Localizable"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "stringWithFormat:", v15, v9);
  v57 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "setSubtitle:", v57);
  objc_msgSend(v10, "setDismissalType:", 2);
  v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1688]), "initWithString:", v8);

  v17 = objc_msgSend(v16, "length");
  objc_msgSend(MEMORY[0x24BDF6A70], "monospacedDigitSystemFontOfSize:weight:", 36.0, *MEMORY[0x24BDF7888]);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "addAttribute:value:range:", *MEMORY[0x24BDF65F8], v55, 0, v17);
  v53 = v16;
  objc_msgSend(v16, "addAttribute:value:range:", *MEMORY[0x24BDF6608], &unk_250989F68, 0, v17);
  v54 = objc_alloc_init(MEMORY[0x24BDF6748]);
  objc_msgSend(v54, "setAlignment:", 1);
  objc_msgSend(v16, "addAttribute:value:range:", *MEMORY[0x24BDF6628], v54, 0, v17);
  v18 = objc_alloc_init(MEMORY[0x24BDF6B68]);
  objc_msgSend(v18, "setAttributedText:", v16);
  objc_msgSend(v18, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v51 = v10;
  objc_msgSend(v10, "contentView");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "addSubview:", v18);

  objc_msgSend(v10, "contentView");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "mainContentGuide");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  v46 = (void *)MEMORY[0x24BDD1628];
  objc_msgSend(v18, "topAnchor");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "topAnchor");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "constraintEqualToSystemSpacingBelowAnchor:multiplier:", v49, 1.0);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v62[0] = v48;
  objc_msgSend(v21, "bottomAnchor");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "bottomAnchor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "constraintEqualToSystemSpacingBelowAnchor:multiplier:", v22, 1.0);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v62[1] = v23;
  objc_msgSend(v18, "centerXAnchor");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v52 = v21;
  objc_msgSend(v21, "centerXAnchor");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "constraintEqualToAnchor:", v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v62[2] = v26;
  objc_msgSend(v18, "widthAnchor");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "widthAnchor");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "constraintEqualToAnchor:", v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v62[3] = v29;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v62, 4);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "activateConstraints:", v30);

  v31 = (void *)MEMORY[0x24BE7B3C8];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "localizedStringForKey:value:table:", CFSTR("BLUETOOTH_PAIRING_CARD_PAIR"), &stru_250987190, CFSTR("Localizable"));
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  v60[0] = MEMORY[0x24BDAC760];
  v60[1] = 3221225472;
  v60[2] = __89__CARSetupPrompts_bluetoothConfirmationPromptForVehicleName_numericCode_responseHandler___block_invoke;
  v60[3] = &unk_250986EC8;
  v34 = v56;
  v61 = v34;
  objc_msgSend(v31, "actionWithTitle:style:handler:", v33, 0, v60);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = (id)objc_msgSend(v51, "addAction:", v35);

  v37 = (void *)MEMORY[0x24BE7B3C8];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "localizedStringForKey:value:table:", CFSTR("BLUETOOTH_PAIRING_CARD_CANCEL"), &stru_250987190, CFSTR("Localizable"));
  v39 = (void *)objc_claimAutoreleasedReturnValue();

  v58[0] = MEMORY[0x24BDAC760];
  v58[1] = 3221225472;
  v58[2] = __89__CARSetupPrompts_bluetoothConfirmationPromptForVehicleName_numericCode_responseHandler___block_invoke_2;
  v58[3] = &unk_250986EC8;
  v59 = v34;
  v40 = v34;
  objc_msgSend(v37, "actionWithTitle:style:handler:", v39, 1, v58);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = (id)objc_msgSend(v51, "addAction:", v41);

  objc_msgSend(v51, "view");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF6950], "labelColor");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "setTintColor:", v44);

  return v51;
}

uint64_t __89__CARSetupPrompts_bluetoothConfirmationPromptForVehicleName_numericCode_responseHandler___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, 1);
  return result;
}

uint64_t __89__CARSetupPrompts_bluetoothConfirmationPromptForVehicleName_numericCode_responseHandler___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, 0);
  return result;
}

+ (id)bluetoothContactsSyncPromptWithResponseHandler:(id)a3
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  uint64_t v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t);
  void *v30;
  id v31;
  _QWORD v32[4];
  id v33;

  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x24BE7B3E0]);
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("BLUETOOTH_CONTACTS_SYNC_TITLE"), &stru_250987190, CFSTR("Localizable"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "setTitle:", v6);
  v7 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("BLUETOOTH_CONTACTS_SYNC_MESSAGE"), &stru_250987190, CFSTR("Localizable"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "stringWithFormat:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "setSubtitle:", v10);
  objc_msgSend(v4, "setDismissalType:", 2);
  v11 = (void *)MEMORY[0x24BE7B3C8];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("BLUETOOTH_CONTACTS_SYNC_ALLOW"), &stru_250987190, CFSTR("Localizable"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = MEMORY[0x24BDAC760];
  v32[0] = MEMORY[0x24BDAC760];
  v32[1] = 3221225472;
  v32[2] = __66__CARSetupPrompts_bluetoothContactsSyncPromptWithResponseHandler___block_invoke;
  v32[3] = &unk_250986EC8;
  v15 = v3;
  v33 = v15;
  objc_msgSend(v11, "actionWithTitle:style:handler:", v13, 0, v32);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (id)objc_msgSend(v4, "addAction:", v16);

  v18 = (void *)MEMORY[0x24BE7B3C8];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "localizedStringForKey:value:table:", CFSTR("BLUETOOTH_CONTACTS_SYNC_DONT_ALLOW"), &stru_250987190, CFSTR("Localizable"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  v27 = v14;
  v28 = 3221225472;
  v29 = __66__CARSetupPrompts_bluetoothContactsSyncPromptWithResponseHandler___block_invoke_2;
  v30 = &unk_250986EC8;
  v31 = v15;
  v21 = v15;
  objc_msgSend(v18, "actionWithTitle:style:handler:", v20, 1, &v27);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = (id)objc_msgSend(v4, "addAction:", v22, v27, v28, v29, v30);

  objc_msgSend(v4, "view");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF6950], "labelColor");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setTintColor:", v25);

  return v4;
}

uint64_t __66__CARSetupPrompts_bluetoothContactsSyncPromptWithResponseHandler___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, 1);
  return result;
}

uint64_t __66__CARSetupPrompts_bluetoothContactsSyncPromptWithResponseHandler___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, 0);
  return result;
}

+ (id)bluetoothFailedPromptForVehicleName:(id)a3 isTimeout:(BOOL)a4 responseHandler:(id)a5
{
  _BOOL4 v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  const __CFString *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  id v27;
  uint64_t v29;
  _QWORD v30[4];
  id v31;

  v6 = a4;
  v7 = a3;
  v8 = a5;
  v9 = objc_alloc_init(MEMORY[0x24BE7B3E0]);
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("BLUETOOTH_FAILED_CARD_TITLE"), &stru_250987190, CFSTR("Localizable"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "setTitle:", v11);
  if (v6)
  {
    v12 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    v15 = CFSTR("BLUETOOTH_FAILED_MESSAGE_TIMEOUT");
LABEL_6:
    objc_msgSend(v13, "localizedStringForKey:value:table:", v15, &stru_250987190, CFSTR("Localizable"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "stringWithFormat:", v16, v29);
    goto LABEL_7;
  }
  v12 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (!v7)
  {
    v15 = CFSTR("BLUETOOTH_FAILED_MESSAGE_GENERIC");
    goto LABEL_6;
  }
  objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("BLUETOOTH_FAILED_MESSAGE_GENERIC_%@"), &stru_250987190, CFSTR("Localizable"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "stringWithFormat:", v16, v7);
LABEL_7:
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "setSubtitle:", v17);
  objc_msgSend(v9, "setDismissalType:", 2);
  v18 = (void *)MEMORY[0x24BDF6AC8];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "imageNamed:inBundle:withConfiguration:", CFSTR("Connection_Failure"), v19, 0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6AE8]), "initWithImage:", v20);
  objc_msgSend(v9, "carSetup_addMainContentCenteredView:size:", v21, *MEMORY[0x24BDBF148], *(double *)(MEMORY[0x24BDBF148] + 8));
  v22 = (void *)MEMORY[0x24BE7B3C8];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "localizedStringForKey:value:table:", CFSTR("BLUETOOTH_FAILED_OK"), &stru_250987190, CFSTR("Localizable"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  v30[0] = MEMORY[0x24BDAC760];
  v30[1] = 3221225472;
  v30[2] = __81__CARSetupPrompts_bluetoothFailedPromptForVehicleName_isTimeout_responseHandler___block_invoke;
  v30[3] = &unk_250986EC8;
  v31 = v8;
  v25 = v8;
  objc_msgSend(v22, "actionWithTitle:style:handler:", v24, 0, v30);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = (id)objc_msgSend(v9, "addAction:", v26);

  return v9;
}

uint64_t __81__CARSetupPrompts_bluetoothFailedPromptForVehicleName_isTimeout_responseHandler___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

+ (id)waitingPrompt
{
  id v2;
  void *v3;
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
  void *v16;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  _QWORD v22[4];

  v22[3] = *MEMORY[0x24BDAC8D0];
  v2 = objc_alloc_init(MEMORY[0x24BE7B3E0]);
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("BLUETOOTH_PAIRING_CARD_TITLE"), &stru_250987190, CFSTR("Localizable"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v2, "setTitle:", v4);
  objc_msgSend(v2, "setDismissalType:", 2);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF67D0]), "initWithActivityIndicatorStyle:", 101);
  objc_msgSend(v5, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v2, "contentView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addSubview:", v5);

  v18 = v2;
  objc_msgSend(v2, "contentView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "mainContentGuide");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = (void *)MEMORY[0x24BDD1628];
  objc_msgSend(v5, "topAnchor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "topAnchor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "constraintEqualToSystemSpacingBelowAnchor:multiplier:", v20, 1.0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = v9;
  objc_msgSend(v8, "bottomAnchor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bottomAnchor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "constraintEqualToSystemSpacingBelowAnchor:multiplier:", v11, 1.0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v22[1] = v12;
  objc_msgSend(v5, "centerXAnchor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "centerXAnchor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "constraintEqualToAnchor:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v22[2] = v15;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v22, 3);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "activateConstraints:", v16);

  objc_msgSend(v5, "startAnimating");
  return v18;
}

+ (id)allowWhileLockedPromptForVehicleName:(id)a3 responseHandler:(id)a4
{
  id v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  id v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  id v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  void *v32;
  void *v33;
  _QWORD v34[4];
  id v35;
  _QWORD v36[4];
  id v37;
  _QWORD v38[4];
  id v39;

  v5 = a3;
  v6 = a4;
  v7 = objc_alloc_init(MEMORY[0x24BE7B3E0]);
  v33 = v5;
  if (v5)
  {
    v8 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("ALLOW_WHILE_LOCKED_CARD_TITLE_%@"), &stru_250987190, CFSTR("Localizable"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "stringWithFormat:", v10, v5);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("ALLOW_WHILE_LOCKED_CARD_TITLE_GENERIC"), &stru_250987190, CFSTR("Localizable"));
  }
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "setTitle:", v32);
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("ALLOW_WHILE_LOCKED_CARD_MESSAGE"), &stru_250987190, CFSTR("Localizable"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "setSubtitle:", v12);
  objc_msgSend(v7, "setDismissalType:", 3);
  objc_msgSend(v7, "carSetup_addCarPlayIconCenteredInMainContent");
  v13 = (void *)MEMORY[0x24BE7B3C8];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("ALLOW_WHILE_LOCKED_CARD_ALLOW"), &stru_250987190, CFSTR("Localizable"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = MEMORY[0x24BDAC760];
  v38[0] = MEMORY[0x24BDAC760];
  v38[1] = 3221225472;
  v38[2] = __72__CARSetupPrompts_allowWhileLockedPromptForVehicleName_responseHandler___block_invoke;
  v38[3] = &unk_250986EC8;
  v17 = v6;
  v39 = v17;
  objc_msgSend(v13, "actionWithTitle:style:handler:", v15, 0, v38);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (id)objc_msgSend(v7, "addAction:", v18);

  v20 = (void *)MEMORY[0x24BE7B3C8];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "localizedStringForKey:value:table:", CFSTR("ALLOW_WHILE_LOCKED_CARD_DECLINE"), &stru_250987190, CFSTR("Localizable"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  v36[0] = v16;
  v36[1] = 3221225472;
  v36[2] = __72__CARSetupPrompts_allowWhileLockedPromptForVehicleName_responseHandler___block_invoke_2;
  v36[3] = &unk_250986EC8;
  v23 = v17;
  v37 = v23;
  objc_msgSend(v20, "actionWithTitle:style:handler:", v22, 1, v36);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = (id)objc_msgSend(v7, "addAction:", v24);

  v26 = (void *)MEMORY[0x24BE7B3C8];
  v34[0] = v16;
  v34[1] = 3221225472;
  v34[2] = __72__CARSetupPrompts_allowWhileLockedPromptForVehicleName_responseHandler___block_invoke_3;
  v34[3] = &unk_250986EC8;
  v35 = v23;
  v27 = v23;
  objc_msgSend(v26, "actionWithTitle:style:handler:", &stru_250987190, 0, v34);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setDismissButtonAction:", v28);

  objc_msgSend(v7, "view");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF6950], "labelColor");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setTintColor:", v30);

  return v7;
}

uint64_t __72__CARSetupPrompts_allowWhileLockedPromptForVehicleName_responseHandler___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, 1);
  return result;
}

uint64_t __72__CARSetupPrompts_allowWhileLockedPromptForVehicleName_responseHandler___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, 0);
  return result;
}

uint64_t __72__CARSetupPrompts_allowWhileLockedPromptForVehicleName_responseHandler___block_invoke_3(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, 0);
  return result;
}

+ (id)connectPromptWithBluetoothOnlyOption:(BOOL)a3 wirelessEnablement:(unint64_t)a4 responseHandler:(id)a5
{
  char v5;
  _BOOL4 v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  id v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  _QWORD v32[4];
  id v33;
  _QWORD v34[4];
  id v35;
  _QWORD v36[4];
  id v37;

  v5 = a4;
  v6 = a3;
  v7 = a5;
  v8 = objc_alloc_init(MEMORY[0x24BE7B3E0]);
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("CONNECT_TO_CARPLAY_CARD_TITLE"), &stru_250987190, CFSTR("Localizable"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "setTitle:", v10);
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("CONNECT_TO_CARPLAY_CARD_MESSAGE"), &stru_250987190, CFSTR("Localizable"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "setSubtitle:", v12);
  objc_msgSend(v8, "setDismissalType:", 3);
  objc_msgSend(v8, "carSetup_addCarPlayIconCenteredInMainContent");
  if ((v5 & 2) != 0)
  {
    CRLocalizedWiFiVariantKeyForKey();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "localizedStringForKey:value:table:", v13, &stru_250987190, CFSTR("Localizable"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("CONNECT_TO_CARPLAY_CARD_CONNECT"), &stru_250987190, CFSTR("Localizable"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }

  v16 = (void *)MEMORY[0x24BE7B3C8];
  v17 = MEMORY[0x24BDAC760];
  v36[0] = MEMORY[0x24BDAC760];
  v36[1] = 3221225472;
  v36[2] = __91__CARSetupPrompts_connectPromptWithBluetoothOnlyOption_wirelessEnablement_responseHandler___block_invoke;
  v36[3] = &unk_250986EC8;
  v18 = v7;
  v37 = v18;
  objc_msgSend(v16, "actionWithTitle:style:handler:", v14, 0, v36);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (id)objc_msgSend(v8, "addAction:", v19);

  if (v6)
  {
    v21 = (void *)MEMORY[0x24BE7B3C8];
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "localizedStringForKey:value:table:", CFSTR("CONNECT_USE_BLUETOOTH_ONLY"), &stru_250987190, CFSTR("Localizable"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    v34[0] = v17;
    v34[1] = 3221225472;
    v34[2] = __91__CARSetupPrompts_connectPromptWithBluetoothOnlyOption_wirelessEnablement_responseHandler___block_invoke_111;
    v34[3] = &unk_250986EC8;
    v35 = v18;
    objc_msgSend(v21, "actionWithTitle:style:handler:", v23, 1, v34);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = (id)objc_msgSend(v8, "addAction:", v24);

  }
  v26 = (void *)MEMORY[0x24BE7B3C8];
  v32[0] = v17;
  v32[1] = 3221225472;
  v32[2] = __91__CARSetupPrompts_connectPromptWithBluetoothOnlyOption_wirelessEnablement_responseHandler___block_invoke_112;
  v32[3] = &unk_250986EC8;
  v33 = v18;
  v27 = v18;
  objc_msgSend(v26, "actionWithTitle:style:handler:", &stru_250987190, 0, v32);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setDismissButtonAction:", v28);

  objc_msgSend(v8, "view");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF6950], "labelColor");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setTintColor:", v30);

  return v8;
}

uint64_t __91__CARSetupPrompts_connectPromptWithBluetoothOnlyOption_wirelessEnablement_responseHandler___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t result;
  uint8_t v4[16];

  CarPairingLogging();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_237AF2000, v2, OS_LOG_TYPE_INFO, "received accept for connect prompt", v4, 2u);
  }

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, 1);
  return result;
}

uint64_t __91__CARSetupPrompts_connectPromptWithBluetoothOnlyOption_wirelessEnablement_responseHandler___block_invoke_111(uint64_t a1)
{
  NSObject *v2;
  uint64_t result;
  uint8_t v4[16];

  CarPairingLogging();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_237AF2000, v2, OS_LOG_TYPE_INFO, "received decline for connect prompt", v4, 2u);
  }

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, 0);
  return result;
}

uint64_t __91__CARSetupPrompts_connectPromptWithBluetoothOnlyOption_wirelessEnablement_responseHandler___block_invoke_112(uint64_t a1)
{
  NSObject *v2;
  uint64_t result;
  uint8_t v4[16];

  CarPairingLogging();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_237AF2000, v2, OS_LOG_TYPE_INFO, "received dismiss / decline for connect prompt", v4, 2u);
  }

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, 0);
  return result;
}

+ (id)useWirelessPromptWithWirelessEnablement:(unint64_t)a3 declineVariant:(unint64_t)a4 responseHandler:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  const __CFString *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  id v39;
  void *v40;
  id v41;
  void *v42;
  void *v43;
  void *v44;
  const __CFString *v45;
  void *v46;
  id v47;
  void *v48;
  id v49;
  void *v50;
  void *v51;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  unint64_t v62;
  void *v63;
  void *v64;
  _QWORD v65[4];
  id v66;
  _QWORD v67[4];
  id v68;
  _QWORD v69[6];

  v69[4] = *MEMORY[0x24BDAC8D0];
  v7 = a5;
  v8 = objc_alloc_init(MEMORY[0x24BE7B3E0]);
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("USE_WIRELESS_CARPLAY_CARD_TITLE"), &stru_250987190, CFSTR("Localizable"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "setTitle:", v10);
  v61 = v7;
  v62 = a4;
  switch(a3)
  {
    case 0uLL:
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v11;
      v13 = CFSTR("USE_WIRELESS_CARPLAY_CARD_MESSAGE");
      goto LABEL_5;
    case 1uLL:
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v11;
      v13 = CFSTR("USE_WIRELESS_CARPLAY_CARD_MESSAGE_BT");
LABEL_5:
      objc_msgSend(v11, "localizedStringForKey:value:table:", v13, &stru_250987190, CFSTR("Localizable"));
      v14 = objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    case 2uLL:
    case 3uLL:
      CRLocalizedWiFiVariantKeyForKey();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "localizedStringForKey:value:table:", v12, &stru_250987190, CFSTR("Localizable"));
      v14 = objc_claimAutoreleasedReturnValue();

LABEL_7:
      break;
    default:
      v14 = 0;
      break;
  }
  v63 = (void *)v14;
  objc_msgSend(v8, "setSubtitle:", v14);
  objc_msgSend(v8, "setDismissalType:", 0);
  objc_msgSend(MEMORY[0x24BDF6AE0], "configurationWithPointSize:", 78.0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)MEMORY[0x24BDF6AE0];
  objc_msgSend(MEMORY[0x24BDF6950], "systemBlueColor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "configurationWithHierarchicalColor:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "configurationByApplyingConfiguration:", v19);
  v20 = objc_claimAutoreleasedReturnValue();

  v60 = (void *)v20;
  objc_msgSend(MEMORY[0x24BDF6AC8], "_systemImageNamed:withConfiguration:", CFSTR("carplay.radiowaves.left.and.right"), v20);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6AE8]), "initWithImage:", v59);
  objc_msgSend(v21, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v8, "contentView");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "addSubview:", v21);

  objc_msgSend(v8, "contentView");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "mainContentGuide");
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  v53 = (void *)MEMORY[0x24BDD1628];
  objc_msgSend(v21, "topAnchor");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "topAnchor");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "constraintGreaterThanOrEqualToAnchor:", v55);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v69[0] = v54;
  objc_msgSend(v21, "bottomAnchor");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "bottomAnchor");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "constraintLessThanOrEqualToAnchor:", v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v69[1] = v27;
  objc_msgSend(v21, "centerYAnchor");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "centerYAnchor");
  v64 = v8;
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "constraintEqualToAnchor:", v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v69[2] = v30;
  v58 = v21;
  objc_msgSend(v21, "centerXAnchor");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v57 = v24;
  objc_msgSend(v24, "centerXAnchor");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "constraintEqualToAnchor:", v32);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v69[3] = v33;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v69, 4);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "activateConstraints:", v34);

  v35 = (void *)MEMORY[0x24BE7B3C8];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "localizedStringForKey:value:table:", CFSTR("USE_WIRELESS_CARPLAY_CARD_ENABLE"), &stru_250987190, CFSTR("Localizable"));
  v37 = (void *)objc_claimAutoreleasedReturnValue();

  v38 = MEMORY[0x24BDAC760];
  v67[0] = MEMORY[0x24BDAC760];
  v67[1] = 3221225472;
  v67[2] = __90__CARSetupPrompts_useWirelessPromptWithWirelessEnablement_declineVariant_responseHandler___block_invoke;
  v67[3] = &unk_250986EC8;
  v39 = v61;
  v68 = v39;
  objc_msgSend(v35, "actionWithTitle:style:handler:", v37, 0, v67);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = (id)objc_msgSend(v64, "addAction:", v40);

  if (v62 == 2)
  {
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = v43;
    v45 = CFSTR("USE_WIRELESS_CARPLAY_CARD_DONTUSE");
    goto LABEL_14;
  }
  if (v62 == 1)
  {
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = v43;
    v45 = CFSTR("USE_WIRELESS_CARPLAY_CARD_NOTNOW");
    goto LABEL_14;
  }
  v42 = 0;
  if (!v62)
  {
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = v43;
    v45 = CFSTR("USE_WIRELESS_CARPLAY_CARD_USB_ONLY");
LABEL_14:
    objc_msgSend(v43, "localizedStringForKey:value:table:", v45, &stru_250987190, CFSTR("Localizable"));
    v42 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v46 = (void *)MEMORY[0x24BE7B3C8];
  v65[0] = v38;
  v65[1] = 3221225472;
  v65[2] = __90__CARSetupPrompts_useWirelessPromptWithWirelessEnablement_declineVariant_responseHandler___block_invoke_2;
  v65[3] = &unk_250986EC8;
  v66 = v39;
  v47 = v39;
  objc_msgSend(v46, "actionWithTitle:style:handler:", v42, 1, v65);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v49 = (id)objc_msgSend(v64, "addAction:", v48);

  objc_msgSend(v64, "view");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF6950], "labelColor");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "setTintColor:", v51);

  return v64;
}

uint64_t __90__CARSetupPrompts_useWirelessPromptWithWirelessEnablement_declineVariant_responseHandler___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, 1);
  return result;
}

uint64_t __90__CARSetupPrompts_useWirelessPromptWithWirelessEnablement_declineVariant_responseHandler___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, 0);
  return result;
}

+ (id)enhancedIntegrationPromptForVehicleName:(id)a3 responseHandler:(id)a4
{
  id v5;
  objc_class *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  id v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  void *v30;
  _QWORD v31[4];
  id v32;
  _QWORD v33[4];
  id v34;

  v5 = a4;
  v6 = (objc_class *)MEMORY[0x24BE7B3E0];
  v7 = a3;
  v8 = objc_alloc_init(v6);
  v9 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("ENHANCED_INTEGRATION_CARD_TITLE_%@"), &stru_250987190, CFSTR("Localizable"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "stringWithFormat:", v11, v7);
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "setTitle:", v30);
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("ENHANCED_INTEGRATION_CARD_MESSAGE"), &stru_250987190, CFSTR("Localizable"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "setSubtitle:", v13);
  objc_msgSend(v8, "setDismissalType:", 0);
  v14 = (void *)MEMORY[0x24BE7B3C8];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("ENHANCED_INTEGRATION_CARD_ALLOW"), &stru_250987190, CFSTR("Localizable"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = MEMORY[0x24BDAC760];
  v33[0] = MEMORY[0x24BDAC760];
  v33[1] = 3221225472;
  v33[2] = __75__CARSetupPrompts_enhancedIntegrationPromptForVehicleName_responseHandler___block_invoke;
  v33[3] = &unk_250986EC8;
  v18 = v5;
  v34 = v18;
  objc_msgSend(v14, "actionWithTitle:style:handler:", v16, 0, v33);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (id)objc_msgSend(v8, "addAction:", v19);

  v21 = (void *)MEMORY[0x24BE7B3C8];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "localizedStringForKey:value:table:", CFSTR("ENHANCED_INTEGRATION_CARD_DECLINE"), &stru_250987190, CFSTR("Localizable"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  v31[0] = v17;
  v31[1] = 3221225472;
  v31[2] = __75__CARSetupPrompts_enhancedIntegrationPromptForVehicleName_responseHandler___block_invoke_2;
  v31[3] = &unk_250986EC8;
  v32 = v18;
  v24 = v18;
  objc_msgSend(v21, "actionWithTitle:style:handler:", v23, 1, v31);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = (id)objc_msgSend(v8, "addAction:", v25);

  objc_msgSend(v8, "view");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF6950], "labelColor");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setTintColor:", v28);

  return v8;
}

uint64_t __75__CARSetupPrompts_enhancedIntegrationPromptForVehicleName_responseHandler___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, 1);
  return result;
}

uint64_t __75__CARSetupPrompts_enhancedIntegrationPromptForVehicleName_responseHandler___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, 0);
  return result;
}

@end
