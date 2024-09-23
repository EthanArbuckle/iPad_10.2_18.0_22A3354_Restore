@implementation DKCloudUploadViewController

- (DKCloudUploadViewController)init
{
  void *v3;
  void *v4;
  DKCloudUploadViewController *v5;
  NSDateComponentsFormatter *v6;
  NSDateComponentsFormatter *durationFormatter;
  objc_super v9;

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("CLOUD_UPLOAD_TITLE"), &stru_24F20EA28, CFSTR("Localizable"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9.receiver = self;
  v9.super_class = (Class)DKCloudUploadViewController;
  v5 = -[OBSetupAssistantProgressController initWithTitle:detailText:symbolName:](&v9, sel_initWithTitle_detailText_symbolName_, v4, 0, CFSTR("icloud.and.arrow.up"));

  if (v5)
  {
    v6 = (NSDateComponentsFormatter *)objc_alloc_init(MEMORY[0x24BDD14F8]);
    durationFormatter = v5->_durationFormatter;
    v5->_durationFormatter = v6;

    -[NSDateComponentsFormatter setUnitsStyle:](v5->_durationFormatter, "setUnitsStyle:", 3);
    -[NSDateComponentsFormatter setMaximumUnitCount:](v5->_durationFormatter, "setMaximumUnitCount:", 1);
    -[NSDateComponentsFormatter setAllowedUnits:](v5->_durationFormatter, "setAllowedUnits:", 240);
    -[NSDateComponentsFormatter setIncludesApproximationPhrase:](v5->_durationFormatter, "setIncludesApproximationPhrase:", 1);
  }
  return v5;
}

- (void)viewDidLoad
{
  id v3;
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
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)DKCloudUploadViewController;
  -[OBSetupAssistantProgressController viewDidLoad](&v17, sel_viewDidLoad);
  v3 = objc_alloc(MEMORY[0x24BDF6860]);
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("CANCEL"), &stru_24F20EA28, CFSTR("Localizable"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithTitle:style:target:action:", v5, 0, self, sel__cancelTapped_);
  -[OBBaseWelcomeController navigationItem](self, "navigationItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setLeftBarButtonItem:", v6);

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("TIME_REMAINING"), &stru_24F20EA28, CFSTR("Localizable"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("ESTIMATING_TIME_REMAINING"), &stru_24F20EA28, CFSTR("Localizable"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringByAppendingString:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[OBSetupAssistantProgressController setProgressText:](self, "setProgressText:", v12);

  -[DKCloudUploadViewController setProgress:](self, "setProgress:", 0.0);
  objc_msgSend(MEMORY[0x24BE6E418], "linkButton");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("SKIP_BACKUP"), &stru_24F20EA28, CFSTR("Localizable"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setTitle:forState:", v15, 0);

  objc_msgSend(v13, "addTarget:action:forControlEvents:", self, sel__skipTapped_, 64);
  -[DKCloudUploadViewController buttonTray](self, "buttonTray");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "addButton:", v13);

}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)DKCloudUploadViewController;
  -[OBBaseWelcomeController viewDidAppear:](&v5, sel_viewDidAppear_, a3);
  if (-[DKCloudUploadViewController showUploadFailureAlert](self, "showUploadFailureAlert"))
  {
    -[DKCloudUploadViewController uploadResults](self, "uploadResults");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[DKCloudUploadViewController _showUploadFailureAlertForResults:](self, "_showUploadFailureAlertForResults:", v4);

    -[DKCloudUploadViewController setShowUploadFailureAlert:](self, "setShowUploadFailureAlert:", 0);
  }
}

- (void)setProgress:(double)a3
{
  objc_super v3;

  if (a3 < 0.02)
    a3 = 0.02;
  v3.receiver = self;
  v3.super_class = (Class)DKCloudUploadViewController;
  -[OBSetupAssistantProgressController setProgress:](&v3, sel_setProgress_, a3);
}

- (void)uploadProgress:(float)a3 withTimeRemaining:(double)a4
{
  id v6;

  -[DKCloudUploadViewController setProgress:](self, "setProgress:", a3);
  -[DKCloudUploadViewController _timeRemainingString:](self, "_timeRemainingString:", a4);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[OBSetupAssistantProgressController setProgressText:](self, "setProgressText:", v6);

}

- (void)uploadDidComplete:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  if (objc_msgSend(v6, "success"))
    -[DKCloudUploadViewController uploadDidComplete:].cold.1();
  -[DKCloudUploadViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "window");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[DKCloudUploadViewController _showUploadFailureAlertForResults:](self, "_showUploadFailureAlertForResults:", v6);
  }
  else
  {
    -[DKCloudUploadViewController setUploadResults:](self, "setUploadResults:", v6);
    -[DKCloudUploadViewController setShowUploadFailureAlert:](self, "setShowUploadFailureAlert:", 1);
  }

}

- (id)_timeRemainingString:(double)a3
{
  void *v3;
  void *v4;
  const __CFString *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  if (a3 > 604800.0)
  {
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v3;
    v5 = CFSTR("ESTIMATING_TIME_REMAINING");
LABEL_6:
    objc_msgSend(v3, "localizedStringForKey:value:table:", v5, &stru_24F20EA28, CFSTR("Localizable"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_7;
  }
  if (a3 <= 0.0)
  {
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v3;
    v5 = CFSTR("LESS_THAN_ONE_MINUTE_REMAINING");
    goto LABEL_6;
  }
  -[NSDateComponentsFormatter stringFromTimeInterval:](self->_durationFormatter, "stringFromTimeInterval:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_7:
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("TIME_REMAINING"), &stru_24F20EA28, CFSTR("Localizable"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringByAppendingString:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (void)_showUploadFailureAlertForResults:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;
  unint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  int v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  const __CFString *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  int v39;
  uint64_t j;
  void *v41;
  void *v42;
  int v43;
  void *v44;
  int v45;
  uint64_t v46;
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
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  uint64_t v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  DKCloudUploadViewController *v72;
  void *v73;
  _QWORD v74[5];
  _QWORD v75[5];
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  _BYTE v84[128];
  _BYTE v85[128];
  uint64_t v86;

  v86 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (!v4)
    -[DKCloudUploadViewController _showUploadFailureAlertForResults:].cold.1();
  v5 = v4;
  objc_msgSend(v4, "syncResult");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "success");

  v8 = 0x24BDD1000uLL;
  v73 = v5;
  if ((v7 & 1) != 0)
  {
    v72 = self;
    objc_msgSend(v5, "backupResults");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v9, "mutableCopy");

    v82 = 0u;
    v83 = 0u;
    v80 = 0u;
    v81 = 0u;
    objc_msgSend(v10, "reverseObjectEnumerator");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v80, v85, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v81;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v81 != v14)
            objc_enumerationMutation(v11);
          v16 = *(void **)(*((_QWORD *)&v80 + 1) + 8 * i);
          if (objc_msgSend(v16, "success"))
            objc_msgSend(v10, "removeObject:", v16);
        }
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v80, v85, 16);
      }
      while (v13);
    }

    v17 = objc_msgSend(v10, "count");
    objc_msgSend(v10, "firstObject");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v18;
    v71 = v10;
    if (v17 == 1)
    {
      objc_msgSend(v18, "isPrimaryAccount");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v20, "BOOLValue");

      objc_msgSend(v19, "error");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v22, "dkui_isBackupDisabled");

      self = v72;
      if (v21)
      {
        objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = v24;
        if (v23)
        {
          objc_msgSend(v24, "localizedStringForKey:value:table:", CFSTR("BACKUP_DISABLED_ALERT_TITLE"), &stru_24F20EA28, CFSTR("Localizable"));
          v26 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          v28 = v27;
          v29 = CFSTR("BACKUP_DISABLED_ALERT_MESSAGE");
LABEL_30:
          objc_msgSend(v27, "localizedStringForKey:value:table:", v29, &stru_24F20EA28, CFSTR("Localizable"));
          v33 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_38:

          goto LABEL_39;
        }
        objc_msgSend(v24, "localizedStringForKey:value:table:", CFSTR("CLOUD_UPLOAD_GENERIC_FAILURE_ALERT_TITLE"), &stru_24F20EA28, CFSTR("Localizable"));
        v26 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v47 = (void *)MEMORY[0x24BDD17C8];
        objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = v48;
        if (v23)
        {
          objc_msgSend(v48, "localizedStringForKey:value:table:", CFSTR("BACKUP_DISABLED_ALERT_SINGLE_ACCOUNT_TITLE"), &stru_24F20EA28, CFSTR("Localizable"));
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "username");
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v47, "localizedStringWithFormat:", v49, v50);
          v26 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          v28 = v27;
          v29 = CFSTR("BACKUP_DISABLED_ALERT_SINGLE_ACCOUNT_MESSAGE");
          goto LABEL_30;
        }
        objc_msgSend(v48, "localizedStringForKey:value:table:", CFSTR("CLOUD_UPLOAD_GENERIC_FAILURE_ALERT_SINGLE_ACCOUNT_TITLE"), &stru_24F20EA28, CFSTR("Localizable"));
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "username");
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v47, "localizedStringWithFormat:", v58, v59);
        v26 = (void *)objc_claimAutoreleasedReturnValue();

      }
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      SFLocalizableWAPIStringKeyForKey();
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "localizedStringForKey:value:table:", v60, &stru_24F20EA28, CFSTR("Localizable"));
      v33 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_38;
    }
    objc_msgSend(v18, "username");
    v34 = (void *)objc_claimAutoreleasedReturnValue();

    v78 = 0u;
    v79 = 0u;
    v76 = 0u;
    v77 = 0u;
    v35 = v10;
    v36 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v76, v84, 16);
    if (v36)
    {
      v37 = v36;
      v38 = *(_QWORD *)v77;
      v39 = 1;
      do
      {
        for (j = 0; j != v37; ++j)
        {
          if (*(_QWORD *)v77 != v38)
            objc_enumerationMutation(v35);
          v41 = *(void **)(*((_QWORD *)&v76 + 1) + 8 * j);
          objc_msgSend(v41, "error");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          v43 = objc_msgSend(v42, "dkui_isBackupDisabled");

          objc_msgSend(v41, "isPrimaryAccount");
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          v45 = objc_msgSend(v44, "BOOLValue");

          if (v45)
          {
            objc_msgSend(v41, "username");
            v46 = objc_claimAutoreleasedReturnValue();

            v34 = (void *)v46;
          }
          v39 &= v43;
        }
        v37 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v76, v84, 16);
      }
      while (v37);

      if (!v39)
      {
        v54 = (void *)MEMORY[0x24BDD17C8];
        self = v72;
        objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v55, "localizedStringForKey:value:table:", CFSTR("CLOUD_UPLOAD_GENERIC_FAILURE_ALERT_MULTIPLE_ACCOUNT_TITLE"), &stru_24F20EA28, CFSTR("Localizable"));
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v54, "localizedStringWithFormat:", v56, v34, objc_msgSend(v35, "count") - 1);
        v26 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        SFLocalizableWAPIStringKeyForKey();
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "localizedStringForKey:value:table:", v57, &stru_24F20EA28, CFSTR("Localizable"));
        v33 = (void *)objc_claimAutoreleasedReturnValue();

        goto LABEL_34;
      }
      self = v72;
      v8 = 0x24BDD1000;
    }
    else
    {

      self = v72;
    }
    v51 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(*(id *)(v8 + 1160), "bundleForClass:", objc_opt_class());
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "localizedStringForKey:value:table:", CFSTR("BACKUP_DISABLED_ALERT_MULTIPLE_ACCOUNTS_TITLE"), &stru_24F20EA28, CFSTR("Localizable"));
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "localizedStringWithFormat:", v53, v34, objc_msgSend(v35, "count") - 1);
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(v8 + 1160), "bundleForClass:", objc_opt_class());
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "localizedStringForKey:value:table:", CFSTR("BACKUP_DISABLED_ALERT_MULTIPLE_ACCOUNTS_MESSAGE"), &stru_24F20EA28, CFSTR("Localizable"));
    v33 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_34:
    v19 = v34;
    goto LABEL_38;
  }
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "localizedStringForKey:value:table:", CFSTR("CLOUD_UPLOAD_GENERIC_FAILURE_ALERT_TITLE"), &stru_24F20EA28, CFSTR("Localizable"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  SFLocalizableWAPIStringKeyForKey();
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "localizedStringForKey:value:table:", v32, &stru_24F20EA28, CFSTR("Localizable"));
  v33 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_39:
  objc_msgSend(MEMORY[0x24BDF67F0], "alertControllerWithTitle:message:preferredStyle:", v26, v33, 1);
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  v62 = (void *)MEMORY[0x24BDF67E8];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v63, "localizedStringForKey:value:table:", CFSTR("DONT_ERASE"), &stru_24F20EA28, CFSTR("Localizable"));
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  v65 = MEMORY[0x24BDAC760];
  v75[0] = MEMORY[0x24BDAC760];
  v75[1] = 3221225472;
  v75[2] = __65__DKCloudUploadViewController__showUploadFailureAlertForResults___block_invoke;
  v75[3] = &unk_24F20DE68;
  v75[4] = self;
  objc_msgSend(v62, "actionWithTitle:style:handler:", v64, 1, v75);
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "addAction:", v66);

  v67 = (void *)MEMORY[0x24BDF67E8];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v68, "localizedStringForKey:value:table:", CFSTR("ERASE_ANYWAY"), &stru_24F20EA28, CFSTR("Localizable"));
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  v74[0] = v65;
  v74[1] = 3221225472;
  v74[2] = __65__DKCloudUploadViewController__showUploadFailureAlertForResults___block_invoke_2;
  v74[3] = &unk_24F20DE68;
  v74[4] = self;
  objc_msgSend(v67, "actionWithTitle:style:handler:", v69, 2, v74);
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "addAction:", v70);

  -[DKCloudUploadViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v61, 1, 0);
}

void __65__DKCloudUploadViewController__showUploadFailureAlertForResults___block_invoke(uint64_t a1)
{
  void *v2;
  void (**v3)(void);

  objc_msgSend(*(id *)(a1 + 32), "cancelBlock");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "cancelBlock");
    v3 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v3[2]();

  }
}

void __65__DKCloudUploadViewController__showUploadFailureAlertForResults___block_invoke_2(uint64_t a1)
{
  void *v2;
  void (**v3)(void);

  objc_msgSend(*(id *)(a1 + 32), "skipBlock");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "skipBlock");
    v3 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v3[2]();

  }
}

- (void)_skipTapped:(id)a3
{
  void *v4;
  void (**v5)(void);

  -[DKCloudUploadViewController skipBlock](self, "skipBlock", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[DKCloudUploadViewController skipBlock](self, "skipBlock");
    v5 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v5[2]();

  }
}

- (void)_cancelTapped:(id)a3
{
  void *v4;
  void (**v5)(void);

  -[DKCloudUploadViewController cancelBlock](self, "cancelBlock", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[DKCloudUploadViewController cancelBlock](self, "cancelBlock");
    v5 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v5[2]();

  }
}

- (id)cancelBlock
{
  return self->_cancelBlock;
}

- (void)setCancelBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1208);
}

- (id)skipBlock
{
  return self->_skipBlock;
}

- (void)setSkipBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1216);
}

- (NSDateComponentsFormatter)durationFormatter
{
  return self->_durationFormatter;
}

- (void)setDurationFormatter:(id)a3
{
  objc_storeStrong((id *)&self->_durationFormatter, a3);
}

- (DKCloudUploadResults)uploadResults
{
  return self->_uploadResults;
}

- (void)setUploadResults:(id)a3
{
  self->_uploadResults = (DKCloudUploadResults *)a3;
}

- (BOOL)showUploadFailureAlert
{
  return self->_showUploadFailureAlert;
}

- (void)setShowUploadFailureAlert:(BOOL)a3
{
  self->_showUploadFailureAlert = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_durationFormatter, 0);
  objc_storeStrong(&self->_skipBlock, 0);
  objc_storeStrong(&self->_cancelBlock, 0);
}

- (void)uploadDidComplete:.cold.1()
{
  __assert_rtn("-[DKCloudUploadViewController uploadDidComplete:]", "DKCloudUploadViewController.m", 81, "0");
}

- (void)_showUploadFailureAlertForResults:.cold.1()
{
  __assert_rtn("-[DKCloudUploadViewController _showUploadFailureAlertForResults:]", "DKCloudUploadViewController.m", 114, "results");
}

@end
