@implementation WDMedicalRecordSourceDataViewController

- (WDMedicalRecordSourceDataViewController)initWithProfile:(id)a3 medicalRecord:(id)a4
{
  id v7;
  id v8;
  WDMedicalRecordSourceDataViewController *v9;
  WDMedicalRecordSourceDataViewController *v10;
  uint64_t v11;
  HKMedicalRecord *medicalRecord;
  void *v13;
  objc_super v15;

  v7 = a3;
  v8 = a4;
  v15.receiver = self;
  v15.super_class = (Class)WDMedicalRecordSourceDataViewController;
  v9 = -[WDMedicalRecordSourceDataViewController initWithNibName:bundle:](&v15, sel_initWithNibName_bundle_, 0, 0);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_profile, a3);
    v11 = objc_msgSend(v8, "copy");
    medicalRecord = v10->_medicalRecord;
    v10->_medicalRecord = (HKMedicalRecord *)v11;

    HRLocalizedString(CFSTR("ORIGINAL_SOURCE_DATA_TITLE"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[WDMedicalRecordSourceDataViewController setTitle:](v10, "setTitle:", v13);

  }
  return v10;
}

- (void)loadView
{
  id v3;
  UITextView *v4;
  UITextView *sourceView;
  void *v6;
  void *v7;
  UITextView *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)WDMedicalRecordSourceDataViewController;
  -[WDMedicalRecordSourceDataViewController loadView](&v16, sel_loadView);
  v3 = objc_alloc(MEMORY[0x1E0DC3E50]);
  v4 = (UITextView *)objc_msgSend(v3, "initWithFrame:", *MEMORY[0x1E0C9D628], *(double *)(MEMORY[0x1E0C9D628] + 8), *(double *)(MEMORY[0x1E0C9D628] + 16), *(double *)(MEMORY[0x1E0C9D628] + 24));
  sourceView = self->_sourceView;
  self->_sourceView = v4;

  objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITextView setTextColor:](self->_sourceView, "setTextColor:", v6);

  -[UITextView setTextAlignment:](self->_sourceView, "setTextAlignment:", 0);
  -[UITextView setEditable:](self->_sourceView, "setEditable:", 0);
  -[WDMedicalRecordSourceDataViewController view](self, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addSubview:", self->_sourceView);

  v8 = self->_sourceView;
  -[WDMedicalRecordSourceDataViewController view](self, "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITextView hk_alignConstraintsWithView:](v8, "hk_alignConstraintsWithView:", v9);

  if (objc_msgSend(MEMORY[0x1E0CB6F18], "isAppleInternalInstall"))
  {
    v10 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 9, self, sel_share_);
    -[WDMedicalRecordSourceDataViewController setShareItem:](self, "setShareItem:", v11);

    -[WDMedicalRecordSourceDataViewController shareItem](self, "shareItem");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObject:", v12);

    -[WDMedicalRecordSourceDataViewController shareItem](self, "shareItem");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setEnabled:", 0);

    objc_msgSend(MEMORY[0x1E0DC34F0], "makeTapToRadarItemWithTarget:action:", self, sel__tapToRadar_);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
      objc_msgSend(v10, "addObject:", v14);
    -[WDMedicalRecordSourceDataViewController navigationItem](self, "navigationItem");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setRightBarButtonItems:", v10);

  }
}

- (void)share:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_class *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  id v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  _QWORD v32[4];
  id v33;
  id v34;
  _QWORD v35[2];

  v35[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  v5 = objc_alloc_init(MEMORY[0x1E0CB3578]);
  objc_msgSend(v5, "setDateFormat:", CFSTR("yyyyMMdd'T'HHmmss"));
  v6 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringFromDate:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDMedicalRecordSourceDataViewController medicalRecord](self, "medicalRecord");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (objc_class *)objc_opt_class();
  NSStringFromClass(v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringWithFormat:", CFSTR("%@ %@.json"), v8, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = (void *)MEMORY[0x1E0C99E98];
  NSTemporaryDirectory();
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "stringByAppendingPathComponent:", v12);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "fileURLWithPath:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  -[WDMedicalRecordSourceDataViewController sourceView](self, "sourceView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "text");
  v18 = objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v18, "dataUsingEncoding:", 4);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v34 = 0;
  LOBYTE(v18) = objc_msgSend(v19, "writeToURL:options:error:", v16, 0, &v34);
  v20 = v34;
  if ((v18 & 1) != 0)
  {
    v21 = objc_alloc(MEMORY[0x1E0D96D28]);
    v35[0] = v16;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v35, 1);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = (void *)objc_msgSend(v21, "initWithActivityItems:applicationActivities:", v22, 0);

    objc_msgSend(v23, "popoverPresentationController");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setSourceItem:", v4);

    v32[0] = MEMORY[0x1E0C809B0];
    v32[1] = 3221225472;
    v32[2] = __49__WDMedicalRecordSourceDataViewController_share___block_invoke;
    v32[3] = &unk_1E74D1D18;
    v33 = v16;
    objc_msgSend(v23, "setCompletionWithItemsHandler:", v32);
    -[WDMedicalRecordSourceDataViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v23, 1, 0);

  }
  else
  {
    _HKInitializeLogging();
    v25 = *MEMORY[0x1E0CB5378];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5378], OS_LOG_TYPE_ERROR))
      -[WDMedicalRecordSourceDataViewController share:].cold.1((uint64_t)v20, v25, v26, v27, v28, v29, v30, v31);
  }

}

void __49__WDMedicalRecordSourceDataViewController_share___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  char v4;
  id v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 32);
  v13 = 0;
  v4 = objc_msgSend(v2, "removeItemAtURL:error:", v3, &v13);
  v5 = v13;

  if ((v4 & 1) == 0)
  {
    _HKInitializeLogging();
    v6 = *MEMORY[0x1E0CB5378];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5378], OS_LOG_TYPE_ERROR))
      __49__WDMedicalRecordSourceDataViewController_share___block_invoke_cold_1((uint64_t)v5, v6, v7, v8, v9, v10, v11, v12);
  }

}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)WDMedicalRecordSourceDataViewController;
  -[WDMedicalRecordSourceDataViewController viewWillAppear:](&v4, sel_viewWillAppear_, a3);
  -[WDMedicalRecordSourceDataViewController _fetchAndDisplaySourceStringIfNecessary](self, "_fetchAndDisplaySourceStringIfNecessary");
}

- (void)_tapToRadar:(id)a3
{
  +[HRTapToRadarManager presentTapToRadarDialogueFromViewController:](HRTapToRadarManager, "presentTapToRadarDialogueFromViewController:", self);
}

- (void)selectAll:(id)a3
{
  -[UITextView selectAll:](self->_sourceView, "selectAll:", a3);
}

- (void)_fetchAndDisplaySourceStringIfNecessary
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v6[5];
  id v7;
  id location;

  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  if (!-[WDMedicalRecordSourceDataViewController hasFetchedSourceString](self, "hasFetchedSourceString"))
  {
    -[WDMedicalRecordSourceDataViewController setHasFetchedSourceString:](self, "setHasFetchedSourceString:", 1);
    objc_initWeak(&location, self);
    -[WDMedicalRecordSourceDataViewController profile](self, "profile");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "healthRecordsStore");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[WDMedicalRecordSourceDataViewController medicalRecord](self, "medicalRecord");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __82__WDMedicalRecordSourceDataViewController__fetchAndDisplaySourceStringIfNecessary__block_invoke;
    v6[3] = &unk_1E74D1D40;
    objc_copyWeak(&v7, &location);
    v6[4] = self;
    objc_msgSend(v4, "fetchRawSourceStringForHealthRecord:completion:", v5, v6);

    objc_destroyWeak(&v7);
    objc_destroyWeak(&location);
  }
}

void __82__WDMedicalRecordSourceDataViewController__fetchAndDisplaySourceStringIfNecessary__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  id v9;
  uint64_t v10;
  void *v11;
  _QWORD block[5];
  id v13;
  uint64_t v14;

  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v8 = WeakRetained;
  if (v5)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __82__WDMedicalRecordSourceDataViewController__fetchAndDisplaySourceStringIfNecessary__block_invoke_210;
    block[3] = &unk_1E74D11C8;
    block[4] = WeakRetained;
    v9 = v5;
    v10 = *(_QWORD *)(a1 + 32);
    v13 = v9;
    v14 = v10;
    dispatch_async(MEMORY[0x1E0C80D38], block);

  }
  else
  {
    _HKInitializeLogging();
    v11 = (void *)*MEMORY[0x1E0CB5378];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5378], OS_LOG_TYPE_ERROR))
      __82__WDMedicalRecordSourceDataViewController__fetchAndDisplaySourceStringIfNecessary__block_invoke_cold_1(v11, v8, (uint64_t)v6);
  }

}

void __82__WDMedicalRecordSourceDataViewController__fetchAndDisplaySourceStringIfNecessary__block_invoke_210(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "displaySourceString:", *(_QWORD *)(a1 + 40));
  if (objc_msgSend(MEMORY[0x1E0CB6F18], "isAppleInternalInstall"))
  {
    objc_msgSend(*(id *)(a1 + 48), "shareItem");
    v2 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setEnabled:", 1);

  }
}

- (void)displaySourceString:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = a3;
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  v5 = (void *)MEMORY[0x1E0DC1350];
  v6 = *MEMORY[0x1E0DC4A98];
  -[WDMedicalRecordSourceDataViewController traitCollection](self, "traitCollection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "preferredFontForTextStyle:compatibleWithTraitCollection:", v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDMedicalRecordSourceDataViewController sourceView](self, "sourceView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setFont:", v8);

  -[WDMedicalRecordSourceDataViewController sourceView](self, "sourceView");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setText:", v4);

}

- (HKMedicalRecord)medicalRecord
{
  return self->_medicalRecord;
}

- (HRProfile)profile
{
  return self->_profile;
}

- (UITextView)sourceView
{
  return self->_sourceView;
}

- (BOOL)hasFetchedSourceString
{
  return self->_hasFetchedSourceString;
}

- (void)setHasFetchedSourceString:(BOOL)a3
{
  self->_hasFetchedSourceString = a3;
}

- (UIBarButtonItem)shareItem
{
  return self->_shareItem;
}

- (void)setShareItem:(id)a3
{
  objc_storeStrong((id *)&self->_shareItem, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shareItem, 0);
  objc_storeStrong((id *)&self->_sourceView, 0);
  objc_storeStrong((id *)&self->_profile, 0);
  objc_storeStrong((id *)&self->_medicalRecord, 0);
}

- (void)share:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1BC30A000, a2, a3, "Failed to write resource for sharing with error %{public}@", a5, a6, a7, a8, 2u);
}

void __49__WDMedicalRecordSourceDataViewController_share___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1BC30A000, a2, a3, "Failed to clean up resource with error %{public}@", a5, a6, a7, a8, 2u);
}

void __82__WDMedicalRecordSourceDataViewController__fetchAndDisplaySourceStringIfNecessary__block_invoke_cold_1(void *a1, void *a2, uint64_t a3)
{
  NSObject *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = a1;
  objc_msgSend(a2, "medicalRecord");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  HKSensitiveLogItem();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 138412546;
  v9 = v7;
  v10 = 2114;
  v11 = a3;
  _os_log_error_impl(&dword_1BC30A000, v5, OS_LOG_TYPE_ERROR, "Failed to fetch source string for medical record %@: %{public}@", (uint8_t *)&v8, 0x16u);

}

@end
