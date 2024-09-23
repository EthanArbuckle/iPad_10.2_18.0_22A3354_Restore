@implementation DKEraseConfirmationAlertController

+ (id)alertControllerWithCompletion:(id)a3
{
  id v3;
  DKTelephonyProvider *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = a3;
  v4 = objc_alloc_init(DKTelephonyProvider);
  v5 = (void *)objc_opt_class();
  -[DKTelephonyProvider cellularPlans](v4, "cellularPlans");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "alertControllerWithCellularPlans:completion:", v6, v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

+ (id)alertControllerWithCellularPlans:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  const __CFString *v18;
  void *v19;
  _BOOL8 v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  void *v34;
  id v35;
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
  id v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  const __CFString *v51;
  void *v52;
  id v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  const __CFString *v58;
  void *v59;
  void *v60;
  uint64_t v62;
  void *v63;
  void *v64;
  _QWORD v65[4];
  id v66;
  _QWORD v67[4];
  id v68;
  _QWORD v69[4];
  id v70;
  _QWORD v71[4];
  id v72;
  _QWORD v73[4];
  id v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  _BYTE v79[128];
  uint64_t v80;

  v80 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  v64 = v5;
  if (objc_msgSend(v5, "count"))
  {
    v7 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
    v75 = 0u;
    v76 = 0u;
    v77 = 0u;
    v78 = 0u;
    v8 = v5;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v75, v79, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v76;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v76 != v11)
            objc_enumerationMutation(v8);
          objc_msgSend(*(id *)(*((_QWORD *)&v75 + 1) + 8 * i), "carrierName");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "addObject:", v13);

        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v75, v79, 16);
      }
      while (v10);
    }
    v63 = v6;

    v14 = objc_msgSend(v8, "count");
    v15 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v16;
    v62 = v14;
    if (v14 == 1)
      v18 = CFSTR("ERASE_CONFIRMATION_ALERT_MESSAGE_WITH_CELLULAR_SINGULAR");
    else
      v18 = CFSTR("ERASE_CONFIRMATION_ALERT_MESSAGE_WITH_CELLULAR_PLURAL");
    objc_msgSend(v16, "localizedStringForKey:value:table:", v18, &stru_24F20EA28, CFSTR("Localizable"));
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = (void *)MEMORY[0x24BDD1640];
    objc_msgSend(v7, "allObjects");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = (void *)objc_msgSend(v38, "mutableCopy");
    objc_msgSend(v37, "localizedStringByJoiningStrings:", v39);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "stringWithFormat:", v36, v40);
    v33 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "localizedStringForKey:value:table:", CFSTR("ERASE_ALL_DATA_CONFIRMATION_ALERT_TITLE"), &stru_24F20EA28, CFSTR("Localizable"));
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    +[DKEraseConfirmationAlertController alertControllerWithTitle:message:preferredStyle:](DKEraseConfirmationAlertController, "alertControllerWithTitle:message:preferredStyle:", v42, v33, 1);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    v43 = (void *)MEMORY[0x24BDF67E8];
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "localizedStringForKey:value:table:", CFSTR("CANCEL"), &stru_24F20EA28, CFSTR("Localizable"));
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v73[0] = MEMORY[0x24BDAC760];
    v73[1] = 3221225472;
    v73[2] = __82__DKEraseConfirmationAlertController_alertControllerWithCellularPlans_completion___block_invoke;
    v73[3] = &unk_24F20DFE8;
    v46 = v63;
    v74 = v46;
    objc_msgSend(v43, "actionWithTitle:style:handler:", v45, 0, v73);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "addAction:", v47);

    v48 = (void *)MEMORY[0x24BDF67E8];
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v50 = v49;
    if (v62 == 1)
      v51 = CFSTR("ERASE_CONFIRMATION_CELLULAR_KEEP_CELLULAR_PLAN_ALERT_BUTTON");
    else
      v51 = CFSTR("ERASE_CONFIRMATION_CELLULAR_KEEP_CELLULAR_PLANS_ALERT_BUTTON");
    objc_msgSend(v49, "localizedStringForKey:value:table:", v51, &stru_24F20EA28, CFSTR("Localizable"));
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    v71[0] = MEMORY[0x24BDAC760];
    v71[1] = 3221225472;
    v71[2] = __82__DKEraseConfirmationAlertController_alertControllerWithCellularPlans_completion___block_invoke_2;
    v71[3] = &unk_24F20DFE8;
    v53 = v46;
    v72 = v53;
    objc_msgSend(v48, "actionWithTitle:style:handler:", v52, 2, v71);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "addAction:", v54);

    v55 = (void *)MEMORY[0x24BDF67E8];
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    v57 = v56;
    if (v62 == 1)
      v58 = CFSTR("ERASE_CONFIRMATION_CELLULAR_ERASE_CELLULAR_PLAN_ALERT_BUTTON");
    else
      v58 = CFSTR("ERASE_CONFIRMATION_CELLULAR_ERASE_CELLULAR_PLANS_ALERT_BUTTON");
    objc_msgSend(v56, "localizedStringForKey:value:table:", v58, &stru_24F20EA28, CFSTR("Localizable"));
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    v69[0] = MEMORY[0x24BDAC760];
    v69[1] = 3221225472;
    v69[2] = __82__DKEraseConfirmationAlertController_alertControllerWithCellularPlans_completion___block_invoke_3;
    v69[3] = &unk_24F20DFE8;
    v70 = v53;
    v35 = v53;
    objc_msgSend(v55, "actionWithTitle:style:handler:", v59, 2, v69);
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "addAction:", v60);

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "userInterfaceIdiom") == 1;

    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "localizedStringForKey:value:table:", CFSTR("ERASE_CONFIRMATION_ALERT_TITLE"), &stru_24F20EA28, CFSTR("Localizable"));
    v22 = v6;
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    +[DKEraseConfirmationAlertController alertControllerWithTitle:message:preferredStyle:](DKEraseConfirmationAlertController, "alertControllerWithTitle:message:preferredStyle:", v23, 0, v20);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "localizedStringForKey:value:table:", CFSTR("ERASE_CONFIRMATION_ALERT_BUTTON"), &stru_24F20EA28, CFSTR("Localizable"));
    v7 = (id)objc_claimAutoreleasedReturnValue();

    v26 = (void *)MEMORY[0x24BDF67E8];
    v27 = MEMORY[0x24BDAC760];
    v67[0] = MEMORY[0x24BDAC760];
    v67[1] = 3221225472;
    v67[2] = __82__DKEraseConfirmationAlertController_alertControllerWithCellularPlans_completion___block_invoke_4;
    v67[3] = &unk_24F20DFE8;
    v28 = v22;
    v68 = v28;
    objc_msgSend(v26, "actionWithTitle:style:handler:", v7, 2, v67);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "addAction:", v29);

    v30 = (void *)MEMORY[0x24BDF67E8];
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "localizedStringForKey:value:table:", CFSTR("CANCEL"), &stru_24F20EA28, CFSTR("Localizable"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v65[0] = v27;
    v65[1] = 3221225472;
    v65[2] = __82__DKEraseConfirmationAlertController_alertControllerWithCellularPlans_completion___block_invoke_5;
    v65[3] = &unk_24F20DFE8;
    v66 = v28;
    v33 = v28;
    objc_msgSend(v30, "actionWithTitle:style:handler:", v32, 1, v65);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "addAction:", v34);

    v35 = v68;
  }

  return v24;
}

uint64_t __82__DKEraseConfirmationAlertController_alertControllerWithCellularPlans_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __82__DKEraseConfirmationAlertController_alertControllerWithCellularPlans_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __82__DKEraseConfirmationAlertController_alertControllerWithCellularPlans_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __82__DKEraseConfirmationAlertController_alertControllerWithCellularPlans_completion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __82__DKEraseConfirmationAlertController_alertControllerWithCellularPlans_completion___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

@end
