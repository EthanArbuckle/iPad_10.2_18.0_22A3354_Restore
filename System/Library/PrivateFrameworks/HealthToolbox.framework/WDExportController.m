@implementation WDExportController

- (WDExportController)initWithProfile:(id)a3
{
  id v4;
  WDExportController *v5;
  WDExportManager *v6;
  WDExportManager *exportManager;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)WDExportController;
  v5 = -[WDExportController init](&v9, sel_init);
  if (v5)
  {
    v6 = -[WDExportManager initWithProfile:]([WDExportManager alloc], "initWithProfile:", v4);
    exportManager = v5->_exportManager;
    v5->_exportManager = v6;

  }
  return v5;
}

- (HKApplicationProviding)applicationProvider
{
  return -[WDExportManager applicationProvider](self->_exportManager, "applicationProvider");
}

- (void)setApplicationProvider:(id)a3
{
  -[WDExportManager setApplicationProvider:](self->_exportManager, "setApplicationProvider:", a3);
}

- (BOOL)exportInProgress
{
  return self->_isExporting;
}

- (void)verifyExportWithPresentingViewController:(id)a3 shareSheetSourceView:(id)a4
{
  void *v6;
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
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  id obj;
  _QWORD v24[5];
  _QWORD v25[5];

  v6 = (void *)MEMORY[0x24BDF67F0];
  obj = a4;
  v7 = a3;
  WDBundle();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("EXPORT_TITLE"), &stru_24D38E7C8, CFSTR("WellnessDashboard-Localizable"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  WDBundle();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("EXPORT_PROMPT"), &stru_24D38E7C8, CFSTR("WellnessDashboard-Localizable"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "alertControllerWithTitle:message:preferredStyle:", v9, v11, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = (void *)MEMORY[0x24BDF67E8];
  WDBundle();
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("CANCEL"), &stru_24D38E7C8, CFSTR("WellnessDashboard-Localizable"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = MEMORY[0x24BDAC760];
  v25[0] = MEMORY[0x24BDAC760];
  v25[1] = 3221225472;
  v25[2] = __84__WDExportController_verifyExportWithPresentingViewController_shareSheetSourceView___block_invoke;
  v25[3] = &unk_24D38D350;
  v25[4] = self;
  objc_msgSend(v13, "actionWithTitle:style:handler:", v15, 1, v25);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "addAction:", v17);
  v18 = (void *)MEMORY[0x24BDF67E8];
  WDBundle();
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "localizedStringForKey:value:table:", CFSTR("EXPORT_YES"), &stru_24D38E7C8, CFSTR("WellnessDashboard-Localizable"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = v16;
  v24[1] = 3221225472;
  v24[2] = __84__WDExportController_verifyExportWithPresentingViewController_shareSheetSourceView___block_invoke_2;
  v24[3] = &unk_24D38D350;
  v24[4] = self;
  objc_msgSend(v18, "actionWithTitle:style:handler:", v20, 0, v24);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "addAction:", v21);
  objc_storeWeak((id *)&self->_exportSourceView, obj);

  v22 = objc_storeWeak((id *)&self->_exportPresentingViewController, v7);
  objc_msgSend(v7, "presentViewController:animated:completion:", v12, 1, 0);

}

id __84__WDExportController_verifyExportWithPresentingViewController_shareSheetSourceView___block_invoke(uint64_t a1)
{
  objc_storeWeak((id *)(*(_QWORD *)(a1 + 32) + 48), 0);
  return objc_storeWeak((id *)(*(_QWORD *)(a1 + 32) + 56), 0);
}

uint64_t __84__WDExportController_verifyExportWithPresentingViewController_shareSheetSourceView___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_beginExport");
}

- (void)_beginExport
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id WeakRetained;
  void *v15;
  void *v16;
  WDExportManager *exportManager;
  _QWORD v18[5];
  _QWORD v19[5];
  id v20;
  id location;
  _QWORD v22[5];

  self->_isExporting = 1;
  v3 = (void *)MEMORY[0x24BDF67F0];
  WDBundle();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("EXPORT_PREPARING_TITLE"), &stru_24D38E7C8, CFSTR("WellnessDashboard-Localizable"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  WDBundle();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("EXPORT_PREPARING_MESSAGE"), &stru_24D38E7C8, CFSTR("WellnessDashboard-Localizable"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "alertControllerWithTitle:message:preferredStyle:", v5, v7, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)MEMORY[0x24BDF67E8];
  WDBundle();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("CANCEL"), &stru_24D38E7C8, CFSTR("WellnessDashboard-Localizable"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = MEMORY[0x24BDAC760];
  v22[0] = MEMORY[0x24BDAC760];
  v22[1] = 3221225472;
  v22[2] = __34__WDExportController__beginExport__block_invoke;
  v22[3] = &unk_24D38D350;
  v22[4] = self;
  objc_msgSend(v9, "actionWithTitle:style:handler:", v11, 1, v22);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "addAction:", v13);
  WeakRetained = objc_loadWeakRetained((id *)&self->_exportPresentingViewController);
  objc_msgSend(WeakRetained, "presentViewController:animated:completion:", v8, 1, 0);

  objc_initWeak(&location, self);
  -[WDExportController applicationProvider](self, "applicationProvider");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "application");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v12;
  v19[1] = 3221225472;
  v19[2] = __34__WDExportController__beginExport__block_invoke_2;
  v19[3] = &unk_24D38D0C8;
  objc_copyWeak(&v20, &location);
  v19[4] = self;
  self->_backgroundTask = objc_msgSend(v16, "beginBackgroundTaskWithName:expirationHandler:", CFSTR("Export"), v19);

  exportManager = self->_exportManager;
  v18[0] = v12;
  v18[1] = 3221225472;
  v18[2] = __34__WDExportController__beginExport__block_invoke_3;
  v18[3] = &unk_24D38D378;
  v18[4] = self;
  -[WDExportManager createExportFileWithCompletion:](exportManager, "createExportFileWithCompletion:", v18);
  objc_destroyWeak(&v20);
  objc_destroyWeak(&location);

}

void __34__WDExportController__beginExport__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  _QWORD *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id WeakRetained;
  id v11;

  v3 = a2;
  v4 = *(_QWORD **)(a1 + 32);
  v5 = v4[3];
  if (v5 == 1)
  {
    v11 = v3;
    objc_msgSend(v4, "_shareExportFileAndCleanUp");
    goto LABEL_5;
  }
  if (!v5)
  {
    v4[3] = 2;
    v11 = v3;
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "cancelCurrentExport");
    v6 = (void *)MEMORY[0x24BDF67F0];
    WDBundle();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("EXPORT_CANCELING_TITLE"), &stru_24D38E7C8, CFSTR("WellnessDashboard-Localizable"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "alertControllerWithTitle:message:preferredStyle:", v8, 0, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 56));
    objc_msgSend(WeakRetained, "presentViewController:animated:completion:", v9, 1, 0);

LABEL_5:
    v3 = v11;
  }

}

void __34__WDExportController__beginExport__block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD *WeakRetained;

  NSLog(CFSTR("Background handler called. Not running background tasks anymore."));
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "applicationProvider");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "application");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "endBackgroundTask:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16));

  WeakRetained[2] = *MEMORY[0x24BDF7608];
}

void __34__WDExportController__beginExport__block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  _QWORD v5[5];
  id v6;

  v3 = a2;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __34__WDExportController__beginExport__block_invoke_4;
  v5[3] = &unk_24D38CEC0;
  v5[4] = *(_QWORD *)(a1 + 32);
  v6 = v3;
  v4 = v3;
  dispatch_async(MEMORY[0x24BDAC9B8], v5);

}

void __34__WDExportController__beginExport__block_invoke_4(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  id v4;
  void *v5;
  id WeakRetained;
  void *v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;
  id (*v11)(uint64_t);
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t);
  void *v17;
  uint64_t v18;

  v2 = *(_QWORD **)(a1 + 32);
  v3 = v2[3];
  if (v3 == 2)
  {
    objc_msgSend(v2, "_cleanUpExport");
    WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 56));
    v7 = WeakRetained;
    v9 = MEMORY[0x24BDAC760];
    v10 = 3221225472;
    v11 = __34__WDExportController__beginExport__block_invoke_6;
    v12 = &unk_24D38D000;
    v13 = *(_QWORD *)(a1 + 32);
    v8 = &v9;
    goto LABEL_6;
  }
  if (!v3)
  {
    v2[3] = 1;
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 32), *(id *)(a1 + 40));
    v4 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 56));
    objc_msgSend(v4, "presentedViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 56));
      v7 = WeakRetained;
      v14 = MEMORY[0x24BDAC760];
      v15 = 3221225472;
      v16 = __34__WDExportController__beginExport__block_invoke_5;
      v17 = &unk_24D38D000;
      v18 = *(_QWORD *)(a1 + 32);
      v8 = &v14;
LABEL_6:
      objc_msgSend(WeakRetained, "dismissViewControllerAnimated:completion:", 1, v8, v9, v10, v11, v12, v13, v14, v15, v16, v17, v18);

    }
  }
}

uint64_t __34__WDExportController__beginExport__block_invoke_5(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_shareExportFileAndCleanUp");
}

id __34__WDExportController__beginExport__block_invoke_6(uint64_t a1)
{
  return objc_storeWeak((id *)(*(_QWORD *)(a1 + 32) + 56), 0);
}

- (void)_shareExportFileAndCleanUp
{
  WDExportSource *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id WeakRetained;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
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
  id v27;
  _QWORD v28[5];
  _QWORD v29[5];
  _QWORD v30[5];
  _QWORD v31[11];
  _QWORD v32[2];

  v32[1] = *MEMORY[0x24BDAC8D0];
  if (self->_exportFileURL)
  {
    v3 = objc_alloc_init(WDExportSource);
    -[WDExportSource setUrl:](v3, "setUrl:", self->_exportFileURL);
    WDBundle();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("EXPORT_SUBJECT"), &stru_24D38E7C8, CFSTR("WellnessDashboard-Localizable"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[WDExportSource setSubject:](v3, "setSubject:", v5);

    v6 = objc_alloc(MEMORY[0x24BDF67E0]);
    v32[0] = v3;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v32, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v6, "initWithActivityItems:applicationActivities:", v7, 0);

    objc_msgSend(v8, "popoverPresentationController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    WeakRetained = objc_loadWeakRetained((id *)&self->_exportSourceView);
    objc_msgSend(v9, "setSourceView:", WeakRetained);

    v11 = *MEMORY[0x24BDF74A8];
    v31[0] = CFSTR("com.apple.Health.ShareExtension");
    v31[1] = v11;
    v12 = *MEMORY[0x24BDF74D0];
    v31[2] = *MEMORY[0x24BDF74C0];
    v31[3] = v12;
    v13 = *MEMORY[0x24BDF7478];
    v31[4] = *MEMORY[0x24BDF74D8];
    v31[5] = v13;
    v14 = *MEMORY[0x24BDF7468];
    v31[6] = *MEMORY[0x24BDF74E0];
    v31[7] = v14;
    v15 = *MEMORY[0x24BDF74C8];
    v31[8] = *MEMORY[0x24BDF74B0];
    v31[9] = v15;
    v31[10] = *MEMORY[0x24BDF74B8];
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v31, 11);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setExcludedActivityTypes:", v16);

    v17 = MEMORY[0x24BDAC760];
    v30[0] = MEMORY[0x24BDAC760];
    v30[1] = 3221225472;
    v30[2] = __48__WDExportController__shareExportFileAndCleanUp__block_invoke;
    v30[3] = &unk_24D38D3A0;
    v30[4] = self;
    objc_msgSend(v8, "setCompletionWithItemsHandler:", v30);
    v18 = objc_loadWeakRetained((id *)&self->_exportPresentingViewController);
    v29[0] = v17;
    v29[1] = 3221225472;
    v29[2] = __48__WDExportController__shareExportFileAndCleanUp__block_invoke_2;
    v29[3] = &unk_24D38D000;
    v29[4] = self;
    objc_msgSend(v18, "presentViewController:animated:completion:", v8, 1, v29);

  }
  else
  {
    v19 = (void *)MEMORY[0x24BDF67F0];
    WDBundle();
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "localizedStringForKey:value:table:", CFSTR("EXPORT_TITLE"), &stru_24D38E7C8, CFSTR("WellnessDashboard-Localizable"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    WDBundle();
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "localizedStringForKey:value:table:", CFSTR("EXPORT_NO_DATA"), &stru_24D38E7C8, CFSTR("WellnessDashboard-Localizable"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "alertControllerWithTitle:message:preferredStyle:", v21, v23, 1);
    v3 = (WDExportSource *)objc_claimAutoreleasedReturnValue();

    v24 = (void *)MEMORY[0x24BDF67E8];
    WDBundle();
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "localizedStringForKey:value:table:", CFSTR("OK"), &stru_24D38E7C8, CFSTR("WellnessDashboard-Localizable"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "actionWithTitle:style:handler:", v26, 1, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    -[WDExportSource addAction:](v3, "addAction:", v8);
    v27 = objc_loadWeakRetained((id *)&self->_exportPresentingViewController);
    v28[0] = MEMORY[0x24BDAC760];
    v28[1] = 3221225472;
    v28[2] = __48__WDExportController__shareExportFileAndCleanUp__block_invoke_3;
    v28[3] = &unk_24D38D000;
    v28[4] = self;
    objc_msgSend(v27, "presentViewController:animated:completion:", v3, 1, v28);

    -[WDExportController _cleanUpExport](self, "_cleanUpExport");
  }

}

uint64_t __48__WDExportController__shareExportFileAndCleanUp__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_cleanUpExport");
}

id __48__WDExportController__shareExportFileAndCleanUp__block_invoke_2(uint64_t a1)
{
  objc_storeWeak((id *)(*(_QWORD *)(a1 + 32) + 48), 0);
  return objc_storeWeak((id *)(*(_QWORD *)(a1 + 32) + 56), 0);
}

id __48__WDExportController__shareExportFileAndCleanUp__block_invoke_3(uint64_t a1)
{
  return objc_storeWeak((id *)(*(_QWORD *)(a1 + 32) + 56), 0);
}

- (void)_cleanUpExport
{
  NSURL *exportFileURL;
  void *v4;
  void *v5;

  self->_isExporting = 0;
  exportFileURL = self->_exportFileURL;
  self->_exportResult = 0;
  self->_exportFileURL = 0;

  -[WDExportController applicationProvider](self, "applicationProvider");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "application");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "endBackgroundTask:", self->_backgroundTask);

  self->_backgroundTask = *MEMORY[0x24BDF7608];
  -[WDExportManager cleanupExportFilesWithError:](self->_exportManager, "cleanupExportFilesWithError:", 0);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_exportPresentingViewController);
  objc_destroyWeak((id *)&self->_exportSourceView);
  objc_storeStrong((id *)&self->_exportFileURL, 0);
  objc_storeStrong((id *)&self->_exportManager, 0);
}

@end
