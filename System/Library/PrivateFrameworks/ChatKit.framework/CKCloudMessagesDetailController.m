@implementation CKCloudMessagesDetailController

- (void)showSpinnerMessage:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  UIProgressHUD *v7;
  UIProgressHUD *cloudKitProgressView;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v4 = a3;
  -[CKCloudMessagesDetailController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "window");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setUserInteractionEnabled:", 0);

  v7 = (UIProgressHUD *)objc_alloc_init(MEMORY[0x1E0CEA8E0]);
  cloudKitProgressView = self->_cloudKitProgressView;
  self->_cloudKitProgressView = v7;

  -[UIProgressHUD setAutoresizingMask:](self->_cloudKitProgressView, "setAutoresizingMask:", 45);
  -[UIProgressHUD setFontSize:](self->_cloudKitProgressView, "setFontSize:", 16);
  -[UIProgressHUD setText:](self->_cloudKitProgressView, "setText:", v4);

  objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "userInterfaceIdiom");

  -[CKCloudMessagesDetailController rootController](self, "rootController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if ((v10 & 0xFFFFFFFFFFFFFFFBLL) == 1)
  {
    objc_msgSend(v11, "parentViewController");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "view");
    v16 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v11, "view");
    v16 = (id)objc_claimAutoreleasedReturnValue();
  }

  -[UIProgressHUD showInView:](self->_cloudKitProgressView, "showInView:", v16);
  -[CKCloudMessagesDetailController view](self, "view");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "window");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "setUserInteractionEnabled:", 0);
}

- (void)hideSpinner
{
  void *v3;
  UIProgressHUD *cloudKitProgressView;
  id v5;

  -[CKCloudMessagesDetailController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "window");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  -[UIProgressHUD hide](self->_cloudKitProgressView, "hide");
  cloudKitProgressView = self->_cloudKitProgressView;
  self->_cloudKitProgressView = 0;

  objc_msgSend(v5, "setUserInteractionEnabled:", 1);
}

+ (id)specifier
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x1E0D804E8];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("MESSAGES"), &stru_1E276D870, CFSTR("General"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v4, 0, 0, 0, objc_opt_class(), 1, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (CKCloudMessagesDetailController)init
{
  CKCloudMessagesDetailController *v2;
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CKCloudMessagesDetailController;
  v2 = -[CKCloudMessagesDetailController init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObserver:selector:name:object:", v2, sel_setEnabledDidReturned_, CFSTR("com.apple.IMCore.IMCloudKitHooks.SetEnabledReturned"), 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObserver:selector:name:object:", v2, sel_tryToDisableAllDevicesDidReturn_, CFSTR("com.apple.IMCore.IMCloudKitHooks.tryToDisableAllDevicesReturned"), 0);

  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  -[CKCloudMessagesDetailController disconnectFromDaemon](self, "disconnectFromDaemon");
  v3.receiver = self;
  v3.super_class = (Class)CKCloudMessagesDetailController;
  -[CKCloudMessagesDetailController dealloc](&v3, sel_dealloc);
}

- (id)cloudDocsSpecifiers
{
  CKStoragePlugin *v3;
  STStoragePlugin *plugin;
  void *v5;

  if (!self->_plugin)
  {
    v3 = objc_alloc_init(CKStoragePlugin);
    plugin = self->_plugin;
    self->_plugin = &v3->super;

  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[STStoragePlugin performSelector:withObject:](self->_plugin, "performSelector:withObject:", sel_cloudDocumentSpecifiers, self);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = (void *)MEMORY[0x1E0C9AA60];
  }
  return v5;
}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CKCloudMessagesDetailController;
  -[CKCloudMessagesDetailController viewWillAppear:](&v7, sel_viewWillAppear_, a3);
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("MESSAGES"), &stru_1E276D870, CFSTR("General"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKCloudMessagesDetailController navigationItem](self, "navigationItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setTitle:", v5);

}

- (id)dataSize:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(a3, "propertyForKey:", *MEMORY[0x1E0DAF438]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "longLongValue");
  NSLocalizedFileSizeDescription();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)specifiers
{
  uint64_t v2;
  void *v3;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  unint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  char v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  unint64_t v33;
  id v34;
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
  BOOL v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;

  v2 = (int)*MEMORY[0x1E0D80590];
  v3 = *(Class *)((char *)&self->super.super.super.super.super.isa + v2);
  if (v3)
  {
LABEL_18:
    v34 = v3;
    return v34;
  }
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DAF428], "specifierForAppIdentifier:", CFSTR("com.apple.MobileSMS"));
  v6 = objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = (void *)v6;
    objc_msgSend(v5, "addObject:", v6);
    v8 = *MEMORY[0x1E0DAF438];
    objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x1E0D80628]), "propertyForKey:", *MEMORY[0x1E0DAF438]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 0x1E0D80000uLL;
    if (v9)
    {
      v11 = (void *)MEMORY[0x1E0D804E8];
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("DOCUMENTS_AND_DATA"), &stru_1E276D870, CFSTR("General"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v13, self, 0, sel_dataSize_, 0, 4, 0);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v14, "setProperty:forKey:", v9, v8);
      objc_msgSend(v5, "addObject:", v14);

    }
    objc_msgSend(MEMORY[0x1E0D357C0], "sharedInstance");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "eligibleForTruthZone");

    objc_msgSend(MEMORY[0x1E0D357C0], "sharedInstance");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "isInExitState");

    if (v16)
    {
      objc_msgSend(MEMORY[0x1E0D804E8], "groupSpecifierWithID:", CFSTR("DISABLE_AND_DELETE"));
      v19 = objc_claimAutoreleasedReturnValue();
      if ((v18 & 1) != 0)
      {
        v58 = (void *)v19;
        v59 = v9;
        objc_msgSend(MEMORY[0x1E0D357C0], "sharedInstance");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "exitDate");
        v21 = (void *)objc_claimAutoreleasedReturnValue();

        v57 = v21;
        objc_msgSend(v21, "dateByAddingTimeInterval:", 2678400.0);
        v22 = objc_claimAutoreleasedReturnValue();
        v23 = objc_alloc(MEMORY[0x1E0C99D48]);
        v24 = (void *)objc_msgSend(v23, "initWithCalendarIdentifier:", *MEMORY[0x1E0C996C8]);
        objc_msgSend(MEMORY[0x1E0C99D68], "date");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v56 = (void *)v22;
        objc_msgSend(v24, "components:fromDate:toDate:options:", 16, v25, v22, 0);
        v26 = (void *)objc_claimAutoreleasedReturnValue();

        v55 = v26;
        v27 = objc_msgSend(v26, "day");
        if (v27 < 0)
        {
          v32 = 0;
          v33 = 0x1E0CB3000uLL;
        }
        else
        {
          v28 = v27;
          v29 = (void *)MEMORY[0x1E0CB3940];
          objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "localizedStringForKey:value:table:", CFSTR("MOC_WILL_DELETE_DESCRIPTION_FORMAT"), &stru_1E276D870, CFSTR("General"));
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "stringWithFormat:", v31, v28);
          v32 = (void *)objc_claimAutoreleasedReturnValue();

          v10 = 0x1E0D80000;
          v33 = 0x1E0CB3000;
        }
        v35 = v58;
        objc_msgSend(v58, "setProperty:forKey:", v32, *MEMORY[0x1E0D80848]);
        objc_msgSend(v5, "addObject:", v58);
        v42 = *(void **)(v10 + 1256);
        objc_msgSend(*(id *)(v33 + 1232), "bundleForClass:", objc_opt_class());
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v43, "localizedStringForKey:value:table:", CFSTR("UNDO_DELETE"), &stru_1E276D870, CFSTR("General"));
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v44, self, 0, 0, 0, 13, 0);
        v45 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v45, "setButtonAction:", sel_undoDelete_);
        objc_msgSend(MEMORY[0x1E0CEA478], "systemDarkBlueColor");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v45, "setProperty:forKey:", v46, CFSTR("buttonColor"));

        objc_msgSend(v45, "setProperty:forKey:", &unk_1E2870FC0, *MEMORY[0x1E0D806F8]);
        objc_msgSend(v5, "addObject:", v45);

        v9 = v59;
        v41 = v57;
      }
      else
      {
        v35 = (void *)v19;
        objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "localizedStringForKey:value:table:", CFSTR("DISABLE_AND_DELETE_DESCRIPTION"), &stru_1E276D870, CFSTR("General"));
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "setProperty:forKey:", v37, *MEMORY[0x1E0D80848]);

        objc_msgSend(v5, "addObject:", v35);
        v38 = (void *)MEMORY[0x1E0D804E8];
        objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "localizedStringForKey:value:table:", CFSTR("DISABLE_AND_DELETE"), &stru_1E276D870, CFSTR("General"));
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "deleteButtonSpecifierWithName:target:action:", v40, self, sel_disableAndDelete_);
        v41 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v5, "addObject:", v41);
      }

    }
    -[CKCloudMessagesDetailController cloudDocsSpecifiers](self, "cloudDocsSpecifiers");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = -[CKCloudMessagesDetailController _isSyncingWithCloud](self, "_isSyncingWithCloud");
    if (objc_msgSend(v47, "count") && !v48)
    {
      v49 = (void *)MEMORY[0x1E0D804E8];
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v50, "localizedStringForKey:value:table:", CFSTR("MESSAGES"), &stru_1E276D870, CFSTR("General"));
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v49, "groupSpecifierWithName:", v51);
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "addObject:", v52);

      objc_msgSend(v5, "addObjectsFromArray:", v47);
    }
    v53 = *(Class *)((char *)&self->super.super.super.super.super.isa + v2);
    *(Class *)((char *)&self->super.super.super.super.super.isa + v2) = (Class)v5;

    v3 = *(Class *)((char *)&self->super.super.super.super.super.isa + v2);
    goto LABEL_18;
  }

  v34 = 0;
  return v34;
}

- (void)disableAndDelete:(id)a3
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
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  void *v28;
  id v29;
  _QWORD v30[5];

  v29 = a3;
  -[CKCloudMessagesDetailController connectToDaemon](self, "connectToDaemon");
  v4 = (void *)MEMORY[0x1E0CEA2E0];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("DISABLE_ALERT_CANCEL"), &stru_1E276D870, CFSTR("General"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "actionWithTitle:style:handler:", v6, 1, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)MEMORY[0x1E0CEA2E0];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("DISABLE_ALERT_DELETE_MESSAGES"), &stru_1E276D870, CFSTR("General"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v30[0] = MEMORY[0x1E0C809B0];
  v30[1] = 3221225472;
  v30[2] = __52__CKCloudMessagesDetailController_disableAndDelete___block_invoke;
  v30[3] = &unk_1E274B0D8;
  v30[4] = self;
  objc_msgSend(v8, "actionWithTitle:style:handler:", v10, 2, v30);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = (void *)MEMORY[0x1E0CEA2E8];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("DISABLE_ALERT_TITLE"), &stru_1E276D870, CFSTR("General"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("DISABLE_ALERT_MESSAGE"), &stru_1E276D870, CFSTR("General"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "alertControllerWithTitle:message:preferredStyle:", v14, v16, 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v17, "addAction:", v7);
  objc_msgSend(v17, "addAction:", v11);
  -[CKCloudMessagesDetailController cachedCellForSpecifier:](self, "cachedCellForSpecifier:", v29);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    objc_msgSend(v17, "popoverPresentationController");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setSourceView:", v18);

    objc_msgSend(v18, "bounds");
    v21 = v20;
    v23 = v22;
    v25 = v24;
    v27 = v26;
    objc_msgSend(v17, "popoverPresentationController");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "setSourceRect:", v21, v23, v25, v27);

  }
  -[CKCloudMessagesDetailController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v17, 1, 0);

}

void __52__CKCloudMessagesDetailController_disableAndDelete___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;
  id v4;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("ICLOUD_TURNING_OFF"), &stru_1E276D870, CFSTR("General"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "showSpinnerMessage:", v3);

  objc_msgSend(MEMORY[0x1E0D357C0], "sharedInstance");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "tryToDisableAllDevices");

}

- (void)tryToDisableAllDevicesDidReturn:(id)a3
{
  void *v4;
  char v5;
  id v6;

  objc_msgSend(a3, "userInfo");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[CKCloudMessagesDetailController hideSpinner](self, "hideSpinner");
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("ResultSuccess"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "BOOLValue");

  if ((v5 & 1) == 0)
    -[CKCloudMessagesDetailController _displayiCloudErrorMessage](self, "_displayiCloudErrorMessage");
  -[CKCloudMessagesDetailController reloadSpecifiers](self, "reloadSpecifiers");

}

- (void)_displayiCloudErrorMessage
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("EXIT_ICLOUD_ERROR_TITLE"), &stru_1E276D870, CFSTR("General"));
  v10 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("EXIT_ICLOUD_ERROR_MESSAGE"), &stru_1E276D870, CFSTR("General"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("EXIT_ICLOUD_ERROR_CONFIRM"), &stru_1E276D870, CFSTR("General"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CEA2E8], "alertControllerWithTitle:message:preferredStyle:", v10, v5, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA2E0], "actionWithTitle:style:handler:", v7, 0, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addAction:", v9);

  -[CKCloudMessagesDetailController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v8, 1, 0);
}

- (void)undoDelete:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("ICLOUD_TURNING_ON"), &stru_1E276D870, CFSTR("General"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKCloudMessagesDetailController showSpinnerMessage:](self, "showSpinnerMessage:", v5);

  objc_msgSend(MEMORY[0x1E0D357C0], "sharedInstance");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setEnabled:", 1);

}

- (void)setEnabledDidReturned:(id)a3
{
  void *v4;
  char v5;
  id v6;

  objc_msgSend(a3, "userInfo");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[CKCloudMessagesDetailController hideSpinner](self, "hideSpinner");
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("ResultSuccess"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "BOOLValue");

  if ((v5 & 1) == 0)
    -[CKCloudMessagesDetailController _displayiCloudErrorMessage](self, "_displayiCloudErrorMessage");
  -[CKCloudMessagesDetailController reloadSpecifiers](self, "reloadSpecifiers");

}

- (void)connectToDaemon
{
  void *v3;
  void *v4;
  objc_class *v5;
  void *v6;
  void *v7;
  id v8;

  -[CKCloudMessagesDetailController daemonConnection](self, "daemonConnection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0D357F0], "sharedController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (objc_class *)objc_opt_class();
    NSStringFromClass(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "multiplexedConnectionWithLabel:capabilities:context:", v6, 512, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKCloudMessagesDetailController setDaemonConnection:](self, "setDaemonConnection:", v7);

    -[CKCloudMessagesDetailController daemonConnection](self, "daemonConnection");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "connectWithCompletion:", &__block_literal_global_252);

  }
}

void __50__CKCloudMessagesDetailController_connectToDaemon__block_invoke()
{
  NSObject *v0;
  uint8_t v1[16];

  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v0 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v0, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v1 = 0;
      _os_log_impl(&dword_18DFCD000, v0, OS_LOG_TYPE_INFO, "connected to daemon", v1, 2u);
    }

  }
}

- (void)disconnectFromDaemon
{
  void *v3;
  NSObject *v4;
  uint8_t v5[16];

  -[CKCloudMessagesDetailController daemonConnection](self, "daemonConnection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "invalidate");

  -[CKCloudMessagesDetailController setDaemonConnection:](self, "setDaemonConnection:", 0);
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_18DFCD000, v4, OS_LOG_TYPE_INFO, "disconnected from daemon", v5, 2u);
    }

  }
}

- (BOOL)_isSyncingWithCloud
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x1E0D357C0], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isSyncing");

  return v3;
}

- (STStoragePlugin)plugin
{
  return self->_plugin;
}

- (void)setPlugin:(id)a3
{
  objc_storeStrong((id *)&self->_plugin, a3);
}

- (UIProgressHUD)cloudKitProgressView
{
  return self->_cloudKitProgressView;
}

- (void)setCloudKitProgressView:(id)a3
{
  objc_storeStrong((id *)&self->_cloudKitProgressView, a3);
}

- (IMDaemonMultiplexedConnectionManaging)daemonConnection
{
  return self->_daemonConnection;
}

- (void)setDaemonConnection:(id)a3
{
  objc_storeStrong((id *)&self->_daemonConnection, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_daemonConnection, 0);
  objc_storeStrong((id *)&self->_cloudKitProgressView, 0);
  objc_storeStrong((id *)&self->_plugin, 0);
}

@end
