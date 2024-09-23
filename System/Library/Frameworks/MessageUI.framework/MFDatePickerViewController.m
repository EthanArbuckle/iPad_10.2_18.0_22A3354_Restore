@implementation MFDatePickerViewController

+ (id)datePickerViewControllerWithType:(int64_t)a3 message:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  MFDatePickerViewController *v9;

  v5 = a4;
  v6 = v5;
  if (a3 == 1)
  {
    objc_msgSend(v5, "readLater");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "date");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else if (a3)
  {
    v7 = 0;
  }
  else
  {
    objc_msgSend(v5, "sendLaterDate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v9 = -[MFDatePickerViewController initWithType:shouldShowDeleteButton:initialDate:]([MFDatePickerViewController alloc], "initWithType:shouldShowDeleteButton:initialDate:", a3, 1, v7);
  -[MFDatePickerViewController setMessage:](v9, "setMessage:", v6);

  return v9;
}

- (MFDatePickerViewController)initWithType:(int64_t)a3 shouldShowDeleteButton:(BOOL)a4 initialDate:(id)a5
{
  return -[MFDatePickerViewController initWithType:shouldShowDeleteButton:initialDate:shouldDismissCommit:](self, "initWithType:shouldShowDeleteButton:initialDate:shouldDismissCommit:", a3, a4, a5, 0);
}

- (MFDatePickerViewController)initWithType:(int64_t)a3 shouldShowDeleteButton:(BOOL)a4 initialDate:(id)a5 shouldDismissCommit:(BOOL)a6
{
  id v10;
  MFDatePickerViewController *v11;
  MFDatePickerViewController *v12;
  NSObject *v13;
  NSObject *v14;
  dispatch_queue_t v15;
  OS_dispatch_queue *updateQueue;
  id v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  uint64_t v22;
  EFLocked *items;
  uint64_t v24;
  char v25;
  NSDate *initialDate;
  NSDate *v27;
  objc_super v29;

  v10 = a5;
  v29.receiver = self;
  v29.super_class = (Class)MFDatePickerViewController;
  v11 = -[MFDatePickerViewController init](&v29, sel_init);
  v12 = v11;
  if (v11)
  {
    v11->_type = a3;
    v11->_shouldShowDeleteButton = a4;
    v11->_shouldInvokeDelegate = a6;
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v13 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v13, QOS_CLASS_USER_INITIATED, 0);
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = dispatch_queue_create("com.apple.mail.datepicker.update", v14);
    updateQueue = v12->_updateQueue;
    v12->_updateQueue = (OS_dispatch_queue *)v15;

    v17 = objc_alloc(MEMORY[0x1E0D1EEF0]);
    v18 = objc_alloc(MEMORY[0x1E0C99DE8]);
    v19 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v20 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v21 = (void *)objc_msgSend(v18, "initWithObjects:", v19, v20, 0);
    v22 = objc_msgSend(v17, "initWithObject:", v21);
    items = v12->_items;
    v12->_items = (EFLocked *)v22;

    if (v10 && !objc_msgSend(v10, "ef_isEarlierThanNow"))
    {
      v27 = (NSDate *)v10;
      initialDate = v12->_initialDate;
      v12->_initialDate = v27;
      v25 = 1;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "now");
      v24 = objc_claimAutoreleasedReturnValue();
      v25 = 0;
      initialDate = v12->_initialDate;
      v12->_initialDate = (NSDate *)v24;
    }

    v12->_timeSwitchEnabled = v25;
  }

  return v12;
}

- (id)_selectedDateForTimeWheelFromDate:(id)a3
{
  id v3;
  void *v4;
  id v5;
  void *v6;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "ef_isDateNextDayOrLater:", v3))
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = v3;
  }
  v6 = v5;

  return v6;
}

- (id)_selectedTimeForTimeWheelFromDate:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = a3;
  v4 = (void *)MEMORY[0x1E0C99D68];
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E80], "localTimeZone");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "ef_localCombinedDate:time:timeZone:", v5, v3, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)setUpItemsProvider
{
  void *v3;
  void *v4;
  uint64_t v5;
  MFDatePickerItemIdentifier *v6;
  void *v7;
  uint64_t v8;
  MFDatePickerItemIdentifier *v9;
  void *v10;
  uint64_t v11;
  MFDatePickerItemIdentifier *v12;
  void *v13;
  MFDatePickerItem *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  MFDatePickerItemIdentifier *v18;
  void *v19;
  uint64_t v20;
  MFDatePickerItemIdentifier *v21;
  void *v22;
  MFDatePickerItemIdentifier *v23;
  MFDatePickerItem *v24;
  MFDatePickerItemIdentifier *v25;
  void *v26;
  MFDatePickerItemIdentifier *v27;
  MFDatePickerItem *v28;
  MFDatePickerItemIdentifier *v29;
  void *v30;
  MFDatePickerItemIdentifier *v31;
  MFDatePickerItem *v32;
  id v33;
  void *v34;
  void *v35;
  MFDatePickerItem *v36;
  void *v37;
  void *v38;
  MFDatePickerItem *v39;
  void *v40;
  MFDatePickerItem *v41;
  void *v42;
  MFDatePickerItemIdentifier *v43;
  void *v44;
  id v45;

  v45 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  -[MFDatePickerViewController initialDate](self, "initialDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E80], "localTimeZone");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[MFTimezoneHelper cityForTimeZone:](MFTimezoneHelper, "cityForTimeZone:", v4);
  v5 = objc_claimAutoreleasedReturnValue();

  v44 = (void *)v5;
  v6 = [MFDatePickerItemIdentifier alloc];
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[MFDatePickerItemIdentifier initWithIdentifier:type:](v6, "initWithIdentifier:type:", v7, 0);

  v42 = (void *)v8;
  v41 = -[MFDatePickerItem initWithIdentifier:selectedDate:selectedTime:selectedCity:datePickerComponentType:]([MFDatePickerItem alloc], "initWithIdentifier:selectedDate:selectedTime:selectedCity:datePickerComponentType:", v8, v3, v3, v5, 0);
  objc_msgSend(v45, "setObject:forKeyedSubscript:", v41, v8);
  v9 = [MFDatePickerItemIdentifier alloc];
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[MFDatePickerItemIdentifier initWithIdentifier:type:](v9, "initWithIdentifier:type:", v10, 1);

  v40 = (void *)v11;
  v39 = -[MFDatePickerItem initWithIdentifier:selectedDate:selectedTime:selectedCity:datePickerComponentType:]([MFDatePickerItem alloc], "initWithIdentifier:selectedDate:selectedTime:selectedCity:datePickerComponentType:", v11, v3, 0, 0, 0);
  objc_msgSend(v45, "setObject:forKeyedSubscript:", v39, v11);
  v12 = [MFDatePickerItemIdentifier alloc];
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = -[MFDatePickerItemIdentifier initWithIdentifier:type:](v12, "initWithIdentifier:type:", v13, 2);

  v14 = [MFDatePickerItem alloc];
  -[MFDatePickerViewController _selectedDateForTimeWheelFromDate:](self, "_selectedDateForTimeWheelFromDate:", v3);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFDatePickerViewController _selectedTimeForTimeWheelFromDate:](self, "_selectedTimeForTimeWheelFromDate:", v3);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = -[MFDatePickerItem initWithIdentifier:selectedDate:selectedTime:selectedCity:datePickerComponentType:](v14, "initWithIdentifier:selectedDate:selectedTime:selectedCity:datePickerComponentType:", v43, v15, v16, v44, 0);

  v38 = (void *)v17;
  objc_msgSend(v45, "setObject:forKeyedSubscript:", v17, v43);
  v18 = [MFDatePickerItemIdentifier alloc];
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = -[MFDatePickerItemIdentifier initWithIdentifier:type:](v18, "initWithIdentifier:type:", v19, 5);

  v37 = (void *)v20;
  v36 = -[MFDatePickerItem initWithIdentifier:selectedDate:selectedTime:selectedCity:datePickerComponentType:]([MFDatePickerItem alloc], "initWithIdentifier:selectedDate:selectedTime:selectedCity:datePickerComponentType:", v20, 0, 0, v44, 0);
  objc_msgSend(v45, "setObject:forKeyedSubscript:", v36, v20);
  v21 = [MFDatePickerItemIdentifier alloc];
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = -[MFDatePickerItemIdentifier initWithIdentifier:type:](v21, "initWithIdentifier:type:", v22, 3);

  v24 = -[MFDatePickerItem initWithIdentifier:selectedDate:selectedTime:selectedCity:datePickerComponentType:]([MFDatePickerItem alloc], "initWithIdentifier:selectedDate:selectedTime:selectedCity:datePickerComponentType:", v23, v3, 0, 0, 0);
  objc_msgSend(v45, "setObject:forKeyedSubscript:", v24, v23);
  v25 = [MFDatePickerItemIdentifier alloc];
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = -[MFDatePickerItemIdentifier initWithIdentifier:type:](v25, "initWithIdentifier:type:", v26, 4);

  v28 = -[MFDatePickerItem initWithIdentifier:selectedDate:selectedTime:selectedCity:datePickerComponentType:timeSwitchEnabled:]([MFDatePickerItem alloc], "initWithIdentifier:selectedDate:selectedTime:selectedCity:datePickerComponentType:timeSwitchEnabled:", v27, 0, v3, 0, 0, -[MFDatePickerViewController timeSwitchEnabled](self, "timeSwitchEnabled"));
  objc_msgSend(v45, "setObject:forKeyedSubscript:", v28, v27);
  v29 = [MFDatePickerItemIdentifier alloc];
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = -[MFDatePickerItemIdentifier initWithIdentifier:type:](v29, "initWithIdentifier:type:", v30, 6);

  v32 = -[MFDatePickerItem initWithIdentifier:selectedDate:selectedTime:selectedCity:datePickerComponentType:]([MFDatePickerItem alloc], "initWithIdentifier:selectedDate:selectedTime:selectedCity:datePickerComponentType:", v31, 0, 0, 0, 0);
  objc_msgSend(v45, "setObject:forKeyedSubscript:", v32, v31);
  v33 = objc_alloc(MEMORY[0x1E0D1EEF0]);
  v34 = (void *)objc_msgSend(v45, "copy");
  v35 = (void *)objc_msgSend(v33, "initWithObject:", v34);
  -[MFDatePickerViewController setAllItems:](self, "setAllItems:", v35);

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
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)MFDatePickerViewController;
  -[MFDatePickerViewController viewDidLoad](&v10, sel_viewDidLoad);
  -[MFDatePickerViewController setUpItemsProvider](self, "setUpItemsProvider");
  v3 = objc_alloc(MEMORY[0x1E0DC35B8]);
  -[MFDatePickerViewController createCollectionViewLayout](self, "createCollectionViewLayout");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithFrame:collectionViewLayout:", v4, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));

  objc_msgSend(v5, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v5, "setDelegate:", self);
  objc_msgSend(v5, "setShowsVerticalScrollIndicator:", 0);
  -[MFDatePickerViewController setUpDataSourceForCollectionView:](self, "setUpDataSourceForCollectionView:", v5);
  -[MFDatePickerViewController setCollectionView:](self, "setCollectionView:", v5);
  -[MFDatePickerViewController view](self, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addSubview:", v5);

  -[MFDatePickerViewController collectionView](self, "collectionView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFDatePickerViewController view](self, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "mf_pinToView:usingLayoutMargins:", v8, 0);

  -[MFDatePickerViewController setUpNavigationBar](self, "setUpNavigationBar");
  -[MFDatePickerViewController navigationItem](self, "navigationItem");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setHidesBackButton:", 1);

}

- (void)viewDidDisappear:(BOOL)a3
{
  void *v4;
  int64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  char v15;
  void *v16;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)MFDatePickerViewController;
  -[MFDatePickerViewController viewDidDisappear:](&v17, sel_viewDidDisappear_, a3);
  if (!-[MFDatePickerViewController shouldInvokeDelegate](self, "shouldInvokeDelegate"))
    return;
  -[MFDatePickerViewController initialDate](self, "initialDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[MFDatePickerViewController type](self, "type");
  if (!v5)
  {
    -[MFDatePickerViewController _itemOfType:](self, "_itemOfType:", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)MEMORY[0x1E0C99D68];
    objc_msgSend(v6, "selectedDate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "selectedTime");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "selectedCity");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "timeZone");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "ef_localCombinedDate:time:timeZone:", v7, v9, v11);
    v13 = objc_claimAutoreleasedReturnValue();

    v4 = (void *)v13;
    goto LABEL_6;
  }
  if (v5 == 1)
  {
    -[MFDatePickerViewController _itemOfType:](self, "_itemOfType:", 3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[MFDatePickerViewController _itemOfType:](self, "_itemOfType:", 4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)MEMORY[0x1E0C99D68];
    objc_msgSend(v6, "selectedDate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "selectedTime");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "ef_localCombinedDate:time:timeZone:", v9, v10, 0);
    v11 = v4;
    v4 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_6:

  }
  -[MFDatePickerViewController initialDate](self, "initialDate");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v4, "isEqualToDate:", v14);

  if ((v15 & 1) == 0)
  {
    -[MFDatePickerViewController delegate](self, "delegate");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "datePickerViewController:didSelectDate:", self, v4);

  }
}

- (void)setUpNavigationBar
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[MFDatePickerViewController navigationItem](self, "navigationItem");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 1, self, sel__cancel_);
  objc_msgSend(v6, "setLeftBarButtonItem:", v3);

  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 0, self, sel__datePicked_);
  objc_msgSend(v6, "setRightBarButtonItem:", v4);

  if ((unint64_t)-[MFDatePickerViewController type](self, "type") <= 1)
  {
    _EFLocalizedString();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setTitle:", v5);

  }
}

- (id)createCollectionViewLayout
{
  void *v2;
  id v3;
  id v4;
  void *v5;
  _QWORD v7[4];
  id v8;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC35A8]), "initWithAppearance:", 2);
  v3 = objc_alloc(MEMORY[0x1E0DC35D0]);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __56__MFDatePickerViewController_createCollectionViewLayout__block_invoke;
  v7[3] = &unk_1E5A66EA8;
  v4 = v2;
  v8 = v4;
  v5 = (void *)objc_msgSend(v3, "initWithSectionProvider:", v7);

  return v5;
}

id __56__MFDatePickerViewController_createCollectionViewLayout__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0DC3368], "sectionWithListConfiguration:layoutEnvironment:", *(_QWORD *)(a1 + 32), a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!a2)
  {
    v5 = (void *)MEMORY[0x1E0DC3370];
    objc_msgSend(MEMORY[0x1E0DC3340], "fractionalWidthDimension:", 1.0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3340], "estimatedDimension:", 44.0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "sizeWithWidthDimension:heightDimension:", v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0DC3330], "boundarySupplementaryItemWithLayoutSize:elementKind:alignment:", v8, *MEMORY[0x1E0DC48A8], 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = v9;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setBoundarySupplementaryItems:", v10);

  }
  return v4;
}

- (void)setUpDataSourceForCollectionView:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  id v15;
  void *v16;
  void *v17;
  int64_t v18;
  void *v19;
  id v20;
  id v21;
  id v22;
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
  id v35;
  void *v36;
  void *v37;
  void *v38;
  NSObject *v39;
  id v40;
  id v41;
  void *v42;
  void *v43;
  void *v44;
  id v45;
  id v46;
  id v47;
  id v48;
  id v49;
  id v50;
  id v51;
  id v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  id v61;
  id v62;
  _QWORD block[4];
  id v64;
  id v65;
  _QWORD v66[4];
  id v67;
  _QWORD v68[4];
  id v69;
  id v70;
  id v71;
  _QWORD v72[4];
  id v73;
  id v74;
  _QWORD v75[4];
  id v76;
  _QWORD v77[4];
  id v78;
  id v79;
  id v80;
  id v81;
  id v82;
  id v83;
  id v84;
  id v85;
  _QWORD v86[5];
  _QWORD v87[4];
  id v88;
  _QWORD v89[4];
  id v90;
  _QWORD v91[4];
  id v92;
  _QWORD v93[4];
  id v94;
  _QWORD v95[4];
  id v96;
  id location;
  void *v98;
  void *v99;
  _QWORD v100[3];
  _QWORD v101[2];
  _QWORD v102[3];

  v102[1] = *MEMORY[0x1E0C80C00];
  v61 = a3;
  location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  v4 = (void *)MEMORY[0x1E0DC3640];
  v5 = objc_opt_class();
  v6 = MEMORY[0x1E0C809B0];
  v95[0] = MEMORY[0x1E0C809B0];
  v95[1] = 3221225472;
  v95[2] = __63__MFDatePickerViewController_setUpDataSourceForCollectionView___block_invoke;
  v95[3] = &unk_1E5A66ED0;
  objc_copyWeak(&v96, &location);
  objc_msgSend(v4, "registrationWithSupplementaryClass:elementKind:configurationHandler:", v5, *MEMORY[0x1E0DC48A8], v95);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0DC35C8];
  v8 = objc_opt_class();
  v93[0] = v6;
  v93[1] = 3221225472;
  v93[2] = __63__MFDatePickerViewController_setUpDataSourceForCollectionView___block_invoke_2;
  v93[3] = &unk_1E5A66EF8;
  objc_copyWeak(&v94, &location);
  objc_msgSend(v7, "registrationWithCellClass:configurationHandler:", v8, v93);
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)MEMORY[0x1E0DC35C8];
  v10 = objc_opt_class();
  v91[0] = v6;
  v91[1] = 3221225472;
  v91[2] = __63__MFDatePickerViewController_setUpDataSourceForCollectionView___block_invoke_3;
  v91[3] = &unk_1E5A66F20;
  objc_copyWeak(&v92, &location);
  objc_msgSend(v9, "registrationWithCellClass:configurationHandler:", v10, v91);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)MEMORY[0x1E0DC35C8];
  v12 = objc_opt_class();
  v89[0] = v6;
  v89[1] = 3221225472;
  v89[2] = __63__MFDatePickerViewController_setUpDataSourceForCollectionView___block_invoke_4;
  v89[3] = &unk_1E5A66F48;
  objc_copyWeak(&v90, &location);
  objc_msgSend(v11, "registrationWithCellClass:configurationHandler:", v12, v89);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC35C8], "registrationWithCellClass:configurationHandler:", objc_opt_class(), &__block_literal_global_16);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC35C8], "registrationWithCellClass:configurationHandler:", objc_opt_class(), &__block_literal_global_51);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)MEMORY[0x1E0DC35C8];
  v14 = objc_opt_class();
  v87[0] = v6;
  v87[1] = 3221225472;
  v87[2] = __63__MFDatePickerViewController_setUpDataSourceForCollectionView___block_invoke_7;
  v87[3] = &unk_1E5A66FD0;
  objc_copyWeak(&v88, &location);
  objc_msgSend(v13, "registrationWithCellClass:configurationHandler:", v14, v87);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v86[0] = v6;
  v86[1] = 3221225472;
  v86[2] = __63__MFDatePickerViewController_setUpDataSourceForCollectionView___block_invoke_8;
  v86[3] = &unk_1E5A66FF8;
  v86[4] = self;
  objc_msgSend(MEMORY[0x1E0DC35C8], "registrationWithCellClass:configurationHandler:", objc_opt_class(), v86);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_alloc(MEMORY[0x1E0DC35E8]);
  v77[0] = v6;
  v77[1] = 3221225472;
  v77[2] = __63__MFDatePickerViewController_setUpDataSourceForCollectionView___block_invoke_9;
  v77[3] = &unk_1E5A67020;
  objc_copyWeak(&v85, &location);
  v48 = v57;
  v78 = v48;
  v46 = v60;
  v79 = v46;
  v47 = v58;
  v80 = v47;
  v49 = v56;
  v81 = v49;
  v51 = v54;
  v82 = v51;
  v52 = v53;
  v83 = v52;
  v50 = v55;
  v84 = v50;
  v16 = (void *)objc_msgSend(v15, "initWithCollectionView:cellProvider:", v61, v77);
  v62 = objc_alloc_init(MEMORY[0x1E0DC3398]);
  v102[0] = &unk_1E5A9F340;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v102, 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v62, "appendSectionsWithIdentifiers:", v17);

  v75[0] = v6;
  v75[1] = 3221225472;
  v75[2] = __63__MFDatePickerViewController_setUpDataSourceForCollectionView___block_invoke_10;
  v75[3] = &unk_1E5A67048;
  v45 = v59;
  v76 = v45;
  objc_msgSend(v16, "setSupplementaryViewProvider:", v75);
  v18 = -[MFDatePickerViewController type](self, "type");
  if (v18)
  {
    if (v18 != 1)
      goto LABEL_6;
    -[MFDatePickerViewController _itemOfType:](self, "_itemOfType:", 3);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    -[MFDatePickerViewController _itemOfType:](self, "_itemOfType:", 1);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    -[MFDatePickerViewController _itemOfType:](self, "_itemOfType:", 4);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    -[MFDatePickerViewController items](self, "items");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v68[0] = v6;
    v68[1] = 3221225472;
    v68[2] = __63__MFDatePickerViewController_setUpDataSourceForCollectionView___block_invoke_12;
    v68[3] = &unk_1E5A67098;
    v20 = v44;
    v69 = v20;
    v21 = v43;
    v70 = v21;
    v22 = v42;
    v71 = v22;
    objc_msgSend(v19, "performWhileLocked:", v68);

    objc_msgSend(v20, "identifier");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v100[0] = v23;
    objc_msgSend(v21, "identifier");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v100[1] = v24;
    objc_msgSend(v22, "identifier");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v100[2] = v25;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v100, 3);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v62, "appendItemsWithIdentifiers:intoSectionWithIdentifier:", v26, &unk_1E5A9F340);

  }
  else
  {
    -[MFDatePickerViewController _itemOfType:](self, "_itemOfType:", 0);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[MFDatePickerViewController _itemOfType:](self, "_itemOfType:", 1);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[MFDatePickerViewController items](self, "items");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v72[0] = v6;
    v72[1] = 3221225472;
    v72[2] = __63__MFDatePickerViewController_setUpDataSourceForCollectionView___block_invoke_11;
    v72[3] = &unk_1E5A67070;
    v20 = v27;
    v73 = v20;
    v21 = v28;
    v74 = v21;
    objc_msgSend(v29, "performWhileLocked:", v72);

    objc_msgSend(v20, "identifier");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v101[0] = v30;
    objc_msgSend(v21, "identifier");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v101[1] = v31;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v101, 2);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v62, "appendItemsWithIdentifiers:intoSectionWithIdentifier:", v32, &unk_1E5A9F340);

    v22 = v73;
  }

LABEL_6:
  if (-[MFDatePickerViewController shouldShowDeleteButton](self, "shouldShowDeleteButton"))
  {
    -[MFDatePickerViewController _itemOfType:](self, "_itemOfType:", 6);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[MFDatePickerViewController items](self, "items");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v66[0] = v6;
    v66[1] = 3221225472;
    v66[2] = __63__MFDatePickerViewController_setUpDataSourceForCollectionView___block_invoke_13;
    v66[3] = &unk_1E5A670C0;
    v35 = v33;
    v67 = v35;
    objc_msgSend(v34, "performWhileLocked:", v66);

    v99 = &unk_1E5A9F358;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v99, 1);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v62, "appendSectionsWithIdentifiers:", v36);

    objc_msgSend(v35, "identifier");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v98 = v37;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v98, 1);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v62, "appendItemsWithIdentifiers:intoSectionWithIdentifier:", v38, &unk_1E5A9F358);

  }
  -[MFDatePickerViewController setDataSource:](self, "setDataSource:", v16);
  objc_msgSend(v61, "setDataSource:", v16);
  -[MFDatePickerViewController updateQueue](self, "updateQueue");
  v39 = objc_claimAutoreleasedReturnValue();
  block[0] = v6;
  block[1] = 3221225472;
  block[2] = __63__MFDatePickerViewController_setUpDataSourceForCollectionView___block_invoke_14;
  block[3] = &unk_1E5A65430;
  v64 = v16;
  v65 = v62;
  v40 = v62;
  v41 = v16;
  dispatch_sync(v39, block);

  objc_destroyWeak(&v85);
  objc_destroyWeak(&v88);

  objc_destroyWeak(&v90);
  objc_destroyWeak(&v92);

  objc_destroyWeak(&v94);
  objc_destroyWeak(&v96);
  objc_destroyWeak(&location);

}

void __63__MFDatePickerViewController_setUpDataSourceForCollectionView___block_invoke(uint64_t a1, void *a2)
{
  id WeakRetained;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained && (unint64_t)objc_msgSend(WeakRetained, "type") <= 1)
  {
    _EFLocalizedString();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "label");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setText:", v5);

  }
}

void __63__MFDatePickerViewController_setUpDataSourceForCollectionView___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  id WeakRetained;
  void *v8;
  id v9;

  v9 = a2;
  v6 = a4;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(v9, "setDelegate:", WeakRetained);
  objc_msgSend(v6, "selectedDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "updateCalendarDate:", v8);

}

void __63__MFDatePickerViewController_setUpDataSourceForCollectionView___block_invoke_3(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  id WeakRetained;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v15 = a2;
  v6 = a4;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(v15, "setDelegate:", WeakRetained);
  v8 = (void *)MEMORY[0x1E0C99D68];
  objc_msgSend(v6, "selectedDate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "selectedTime");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "selectedCity");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "timeZone");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "ef_localCombinedDate:time:timeZone:", v9, v10, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setMinimumDate:", v13);

  objc_msgSend(v6, "selectedTime");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setDate:", v14);

}

void __63__MFDatePickerViewController_setUpDataSourceForCollectionView___block_invoke_4(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  id WeakRetained;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v16 = a2;
  v6 = a4;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v8 = (void *)MEMORY[0x1E0C99D68];
  objc_msgSend(v6, "selectedDate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "selectedTime");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "selectedCity");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "timeZone");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "ef_localCombinedDate:time:timeZone:", v9, v10, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "selectedCity");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "timeZone");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "updateWithDate:timeZone:", v13, v15);

  if (objc_msgSend(v6, "datePickerComponentType") == 1)
    objc_msgSend(v16, "updateActiveComponent:", objc_msgSend(v6, "datePickerComponentType"));
  objc_msgSend(v16, "setDelegate:", WeakRetained);

}

void __63__MFDatePickerViewController_setUpDataSourceForCollectionView___block_invoke_5(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  void *v5;
  void *v6;
  id v7;

  v7 = a2;
  objc_msgSend(a4, "selectedCity");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "displayName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setCurrentCityName:", v6);

}

void __63__MFDatePickerViewController_setUpDataSourceForCollectionView___block_invoke_6(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  void *v5;
  id v6;

  v6 = a2;
  objc_msgSend(a4, "selectedDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "updateSecondaryTextWithDate:", v5);

}

void __63__MFDatePickerViewController_setUpDataSourceForCollectionView___block_invoke_7(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  id WeakRetained;
  void *v8;
  id v9;

  v9 = a2;
  v6 = a4;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(v9, "setDelegate:", WeakRetained);
  objc_msgSend(v6, "selectedTime");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "updateSecondaryTextWithTime:timeSwitchEnabled:", v8, objc_msgSend(v6, "timeSwitchEnabled"));

}

void __63__MFDatePickerViewController_setUpDataSourceForCollectionView___block_invoke_8(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a2;
  objc_msgSend(v9, "defaultContentConfiguration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(*(id *)(a1 + 32), "type") <= 1)
  {
    _EFLocalizedString();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setText:", v4);

  }
  objc_msgSend(MEMORY[0x1E0DC3658], "systemRedColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "textProperties");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setColor:", v5);

  objc_msgSend(v3, "textProperties");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setAlignment:", 1);

  objc_msgSend(v9, "setContentConfiguration:", v3);
  objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setBackgroundColor:", v8);

}

id *__63__MFDatePickerViewController_setUpDataSourceForCollectionView___block_invoke_9(id *a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  id WeakRetained;
  void *v11;
  _QWORD *v12;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  WeakRetained = objc_loadWeakRetained(a1 + 11);
  objc_msgSend(WeakRetained, "_itemWithIdentifier:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  switch(objc_msgSend(v9, "type"))
  {
    case 0:
      v12 = a1 + 4;
      goto LABEL_9;
    case 1:
      v12 = a1 + 5;
      goto LABEL_9;
    case 2:
      v12 = a1 + 6;
      goto LABEL_9;
    case 3:
      v12 = a1 + 10;
      goto LABEL_9;
    case 4:
      v12 = a1 + 8;
      goto LABEL_9;
    case 5:
      v12 = a1 + 7;
      goto LABEL_9;
    case 6:
      v12 = a1 + 9;
LABEL_9:
      objc_msgSend(v7, "dequeueConfiguredReusableCellWithRegistration:forIndexPath:item:", *v12, v8, v11);
      a1 = (id *)objc_claimAutoreleasedReturnValue();
      break;
    default:
      break;
  }

  return a1;
}

id __63__MFDatePickerViewController_setUpDataSourceForCollectionView___block_invoke_10(uint64_t a1, void *a2)
{
  objc_msgSend(a2, "dequeueConfiguredReusableSupplementaryViewWithRegistration:forIndexPath:", *(_QWORD *)(a1 + 32));
  return (id)objc_claimAutoreleasedReturnValue();
}

void __63__MFDatePickerViewController_setUpDataSourceForCollectionView___block_invoke_11(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  objc_msgSend(v4, "objectAtIndexedSubscript:", objc_msgSend(&unk_1E5A9F340, "integerValue"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", *(_QWORD *)(a1 + 32));
  objc_msgSend(v3, "addObject:", *(_QWORD *)(a1 + 40));

}

void __63__MFDatePickerViewController_setUpDataSourceForCollectionView___block_invoke_12(_QWORD *a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  objc_msgSend(v4, "objectAtIndexedSubscript:", objc_msgSend(&unk_1E5A9F340, "integerValue"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", a1[4]);
  objc_msgSend(v3, "addObject:", a1[5]);
  objc_msgSend(v3, "addObject:", a1[6]);

}

void __63__MFDatePickerViewController_setUpDataSourceForCollectionView___block_invoke_13(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  objc_msgSend(v4, "objectAtIndexedSubscript:", objc_msgSend(&unk_1E5A9F358, "integerValue"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", *(_QWORD *)(a1 + 32));

}

uint64_t __63__MFDatePickerViewController_setUpDataSourceForCollectionView___block_invoke_14(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "applySnapshot:animatingDifferences:", *(_QWORD *)(a1 + 40), 0);
}

- (void)_reloadDataSourceAnimated:(void *)a3 update:
{
  id v5;

  v5 = a3;
  if (a1)
    -[MFDatePickerViewController _reloadDataSourceAnimated:update:completion:](a1, a2, v5, 0);

}

- (void)_reloadDataSourceAnimated:(void *)a3 update:(void *)a4 completion:
{
  id v7;
  id v8;
  NSObject *v9;
  _QWORD v10[5];
  id v11;
  id v12;
  char v13;

  v7 = a3;
  v8 = a4;
  if (a1)
  {
    objc_msgSend(a1, "updateQueue");
    v9 = objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __74__MFDatePickerViewController__reloadDataSourceAnimated_update_completion___block_invoke;
    v10[3] = &unk_1E5A670E8;
    v10[4] = a1;
    v11 = v7;
    v13 = a2;
    v12 = v8;
    dispatch_async(v9, v10);

  }
}

void __74__MFDatePickerViewController__reloadDataSourceAnimated_update_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "dataSource");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "snapshot");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  v4 = *(unsigned __int8 *)(a1 + 56);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __74__MFDatePickerViewController__reloadDataSourceAnimated_update_completion___block_invoke_2;
  v5[3] = &unk_1E5A66780;
  v6 = *(id *)(a1 + 48);
  objc_msgSend(v2, "applySnapshot:animatingDifferences:completion:", v3, v4, v5);

}

uint64_t __74__MFDatePickerViewController__reloadDataSourceAnimated_update_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  MFTimeZonePickerViewController *v12;
  void *v13;
  MFTimeZonePickerViewController *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void (*v20)(uint64_t, void *);
  void *v21;
  id v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;

  v6 = a3;
  v7 = a4;
  v24 = 0;
  v25 = &v24;
  v26 = 0x3032000000;
  v27 = __Block_byref_object_copy__4;
  v28 = __Block_byref_object_dispose__4;
  v29 = 0;
  -[MFDatePickerViewController items](self, "items");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = MEMORY[0x1E0C809B0];
  v19 = 3221225472;
  v20 = __70__MFDatePickerViewController_collectionView_didSelectItemAtIndexPath___block_invoke;
  v21 = &unk_1E5A67110;
  v23 = &v24;
  v9 = v7;
  v22 = v9;
  objc_msgSend(v8, "performWhileLocked:", &v18);

  objc_msgSend((id)v25[5], "identifier", v18, v19, v20, v21);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "type");

  if (v11 == 5)
  {
    v12 = [MFTimeZonePickerViewController alloc];
    objc_msgSend((id)v25[5], "selectedCity");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = -[MFTimeZonePickerViewController initWithCity:](v12, "initWithCity:", v13);

    -[MFTimeZonePickerViewController setDelegate:](v14, "setDelegate:", self);
    -[MFDatePickerViewController navigationController](self, "navigationController");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "pushViewController:animated:", v14, 1);

    objc_msgSend(v6, "deselectItemAtIndexPath:animated:", v9, 1);
  }
  else
  {
    objc_msgSend((id)v25[5], "identifier");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "type");

    if (v17 != 6)
    {
      objc_msgSend(v6, "deselectItemAtIndexPath:animated:", v9, 1);
      goto LABEL_7;
    }
    -[MFDatePickerViewController delegate](self, "delegate");
    v14 = (MFTimeZonePickerViewController *)objc_claimAutoreleasedReturnValue();
    -[MFDatePickerViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
    -[MFTimeZonePickerViewController datePickerViewControllerDidDeleteDate:](v14, "datePickerViewControllerDidDeleteDate:", self);
  }

LABEL_7:
  _Block_object_dispose(&v24, 8);

}

void __70__MFDatePickerViewController_collectionView_didSelectItemAtIndexPath___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;

  v7 = a2;
  objc_msgSend(v7, "objectAtIndexedSubscript:", objc_msgSend(*(id *)(a1 + 32), "section"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectAtIndexedSubscript:", objc_msgSend(*(id *)(a1 + 32), "item"));
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

}

- (void)_datePicked:(id)a3
{
  -[MFDatePickerViewController setShouldInvokeDelegate:](self, "setShouldInvokeDelegate:", 1);
  -[MFDatePickerViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (void)_cancel:(id)a3
{
  -[MFDatePickerViewController setShouldInvokeDelegate:](self, "setShouldInvokeDelegate:", 0);
  -[MFDatePickerViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (id)_itemOfType:(unint64_t)a3
{
  void *v4;
  id v5;
  _QWORD v7[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;

  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__4;
  v12 = __Block_byref_object_dispose__4;
  v13 = 0;
  -[MFDatePickerViewController allItems](self, "allItems");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __42__MFDatePickerViewController__itemOfType___block_invoke;
  v7[3] = &unk_1E5A67160;
  v7[4] = &v8;
  v7[5] = a3;
  objc_msgSend(v4, "performWhileLocked:", v7);

  v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v5;
}

uint64_t __42__MFDatePickerViewController__itemOfType___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  _QWORD v4[6];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __42__MFDatePickerViewController__itemOfType___block_invoke_2;
  v4[3] = &unk_1E5A67138;
  v2 = *(_QWORD *)(a1 + 40);
  v4[4] = *(_QWORD *)(a1 + 32);
  v4[5] = v2;
  return objc_msgSend(a2, "enumerateKeysAndObjectsUsingBlock:", v4);
}

void __42__MFDatePickerViewController__itemOfType___block_invoke_2(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v8;

  v8 = a3;
  if (objc_msgSend(a2, "type") == *(_QWORD *)(a1 + 40))
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a3);
    *a4 = 1;
  }

}

- (id)_itemWithIdentifier:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v9[4];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__4;
  v16 = __Block_byref_object_dispose__4;
  v17 = 0;
  -[MFDatePickerViewController allItems](self, "allItems");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __50__MFDatePickerViewController__itemWithIdentifier___block_invoke;
  v9[3] = &unk_1E5A67188;
  v11 = &v12;
  v6 = v4;
  v10 = v6;
  objc_msgSend(v5, "performWhileLocked:", v9);

  v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

void __50__MFDatePickerViewController__itemWithIdentifier___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  v6 = a2;
  objc_msgSend(v6, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 32));
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

- (void)sendLaterHeaderCollectionViewCellDateTapped:(id)a3
{
  _QWORD v4[5];

  objc_msgSend(a3, "updateActiveComponent:", 0);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __74__MFDatePickerViewController_sendLaterHeaderCollectionViewCellDateTapped___block_invoke;
  v4[3] = &unk_1E5A671B0;
  v4[4] = self;
  -[MFDatePickerViewController _reloadDataSourceAnimated:update:](self, 1, v4);
}

void __74__MFDatePickerViewController_sendLaterHeaderCollectionViewCellDateTapped___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v16[4];
  id v17;
  id v18;
  id v19;
  void *v20;
  _QWORD v21[3];

  v21[2] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "_itemOfType:", 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_itemOfType:", 5, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_itemOfType:", 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "items");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __74__MFDatePickerViewController_sendLaterHeaderCollectionViewCellDateTapped___block_invoke_2;
  v16[3] = &unk_1E5A67098;
  v8 = v4;
  v17 = v8;
  v9 = v5;
  v18 = v9;
  v10 = v6;
  v19 = v10;
  objc_msgSend(v7, "performWhileLocked:", v16);

  objc_msgSend(v8, "identifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = v11;
  objc_msgSend(v9, "identifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v21[1] = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "deleteItemsWithIdentifiers:", v13);

  objc_msgSend(v10, "identifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v14;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v20, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendItemsWithIdentifiers:intoSectionWithIdentifier:", v15, &unk_1E5A9F340);

}

void __74__MFDatePickerViewController_sendLaterHeaderCollectionViewCellDateTapped___block_invoke_2(_QWORD *a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  objc_msgSend(v4, "objectAtIndexedSubscript:", objc_msgSend(&unk_1E5A9F340, "integerValue"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObject:", a1[4]);
  objc_msgSend(v3, "removeObject:", a1[5]);
  objc_msgSend(v3, "addObject:", a1[6]);

}

- (void)sendLaterHeaderCollectionViewCellTimeTapped:(id)a3
{
  _QWORD v4[5];

  objc_msgSend(a3, "updateActiveComponent:", 1);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __74__MFDatePickerViewController_sendLaterHeaderCollectionViewCellTimeTapped___block_invoke;
  v4[3] = &unk_1E5A671B0;
  v4[4] = self;
  -[MFDatePickerViewController _reloadDataSourceAnimated:update:](self, 1, v4);
}

void __74__MFDatePickerViewController_sendLaterHeaderCollectionViewCellTimeTapped___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v16[4];
  id v17;
  id v18;
  id v19;
  _QWORD v20[2];
  _QWORD v21[2];

  v21[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "_itemOfType:", 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_itemOfType:", 5);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_itemOfType:", 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "items");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __74__MFDatePickerViewController_sendLaterHeaderCollectionViewCellTimeTapped___block_invoke_2;
  v16[3] = &unk_1E5A67098;
  v8 = v6;
  v17 = v8;
  v9 = v4;
  v18 = v9;
  v10 = v5;
  v19 = v10;
  objc_msgSend(v7, "performWhileLocked:", v16);

  objc_msgSend(v8, "identifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "deleteItemsWithIdentifiers:", v12);

  objc_msgSend(v9, "identifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v13;
  objc_msgSend(v10, "identifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v20[1] = v14;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 2);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendItemsWithIdentifiers:intoSectionWithIdentifier:", v15, &unk_1E5A9F340);

}

void __74__MFDatePickerViewController_sendLaterHeaderCollectionViewCellTimeTapped___block_invoke_2(_QWORD *a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  objc_msgSend(v4, "objectAtIndexedSubscript:", objc_msgSend(&unk_1E5A9F340, "integerValue"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObject:", a1[4]);
  objc_msgSend(v3, "addObject:", a1[5]);
  objc_msgSend(v3, "addObject:", a1[6]);

}

- (void)calendarCollectionViewCell:(id)a3 didChangeDate:(id)a4
{
  id v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v5 = a4;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __71__MFDatePickerViewController_calendarCollectionViewCell_didChangeDate___block_invoke;
  v7[3] = &unk_1E5A671D8;
  v7[4] = self;
  v8 = v5;
  v6 = v5;
  -[MFDatePickerViewController _reloadDataSourceAnimated:update:](self, 1, v7);

}

void __71__MFDatePickerViewController_calendarCollectionViewCell_didChangeDate___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  _QWORD v24[2];

  v24[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "_itemOfType:", 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_selectedDateForTimeWheelFromDate:", *(_QWORD *)(a1 + 40));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSelectedDate:", v5);

  objc_msgSend(v3, "itemIdentifiers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "containsObject:", v7);

  if (v8)
  {
    objc_msgSend(v4, "identifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v24[0] = v9;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "reconfigureItemsWithIdentifiers:", v10);

  }
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v11, "ef_isLaterThanDate:", *(_QWORD *)(a1 + 40)))
    objc_msgSend(v4, "setSelectedTime:", v11);
  v12 = objc_msgSend(*(id *)(a1 + 32), "type");
  if (v12 == 1)
  {
    objc_msgSend(*(id *)(a1 + 32), "_itemOfType:", 3);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setSelectedDate:", *(_QWORD *)(a1 + 40));
    objc_msgSend(*(id *)(a1 + 32), "_itemOfType:", 4);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "selectedTime");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setSelectedTime:", v17);

    objc_msgSend(v15, "identifier");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = v18;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v22, 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "reconfigureItemsWithIdentifiers:", v19);

    objc_msgSend(v13, "identifier");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v16;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v21, 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "reconfigureItemsWithIdentifiers:", v20);

    goto LABEL_9;
  }
  if (!v12)
  {
    objc_msgSend(*(id *)(a1 + 32), "_itemOfType:", 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setSelectedDate:", *(_QWORD *)(a1 + 40));
    objc_msgSend(v4, "selectedTime");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setSelectedTime:", v14);

    objc_msgSend(v13, "identifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = v15;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v23, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "reconfigureItemsWithIdentifiers:", v16);
LABEL_9:

  }
}

- (void)timeCollectionViewCell:(id)a3 didChangeDate:(id)a4
{
  id v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v5 = a4;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __67__MFDatePickerViewController_timeCollectionViewCell_didChangeDate___block_invoke;
  v7[3] = &unk_1E5A671D8;
  v7[4] = self;
  v8 = v5;
  v6 = v5;
  -[MFDatePickerViewController _reloadDataSourceAnimated:update:](self, 1, v7);

}

void __67__MFDatePickerViewController_timeCollectionViewCell_didChangeDate___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "_itemOfType:", 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSelectedTime:", *(_QWORD *)(a1 + 40));
  v5 = objc_msgSend(*(id *)(a1 + 32), "type");
  if (!v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "_itemOfType:", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setSelectedTime:", *(_QWORD *)(a1 + 40));
    objc_msgSend(v6, "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = v7;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "reconfigureItemsWithIdentifiers:", v8);
    goto LABEL_5;
  }
  if (v5 == 1)
  {
    objc_msgSend(*(id *)(a1 + 32), "_itemOfType:", 4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setSelectedTime:", *(_QWORD *)(a1 + 40));
    objc_msgSend(v6, "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v7;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v9, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "reconfigureItemsWithIdentifiers:", v8);
LABEL_5:

  }
}

- (void)datePickerTimeHeaderCollectionViewCell:(id)a3 showTime:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;
  id v7;
  _QWORD v8[5];
  id v9;
  BOOL v10;

  v4 = a4;
  -[MFDatePickerViewController _itemOfType:](self, "_itemOfType:", 4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setTimeSwitchEnabled:", v4);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __78__MFDatePickerViewController_datePickerTimeHeaderCollectionViewCell_showTime___block_invoke;
  v8[3] = &unk_1E5A67200;
  v8[4] = self;
  v10 = v4;
  v7 = v6;
  v9 = v7;
  -[MFDatePickerViewController _reloadDataSourceAnimated:update:](self, 1, v8);

}

void __78__MFDatePickerViewController_datePickerTimeHeaderCollectionViewCell_showTime___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "_itemOfType:", 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (*(_BYTE *)(a1 + 48))
  {
    objc_msgSend(v4, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = v6;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendItemsWithIdentifiers:intoSectionWithIdentifier:", v7, &unk_1E5A9F340);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "ef_tomorrowMorning");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "setSelectedTime:", v8);

    objc_msgSend(v5, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v6;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v9, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "deleteItemsWithIdentifiers:", v7);
  }

}

- (void)timeZonePickerViewController:(id)a3 didSelectCity:(id)a4
{
  id v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v5 = a4;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __73__MFDatePickerViewController_timeZonePickerViewController_didSelectCity___block_invoke;
  v7[3] = &unk_1E5A671D8;
  v7[4] = self;
  v8 = v5;
  v6 = v5;
  -[MFDatePickerViewController _reloadDataSourceAnimated:update:](self, 1, v7);

}

void __73__MFDatePickerViewController_timeZonePickerViewController_didSelectCity___block_invoke(uint64_t a1, void *a2)
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
  _QWORD v12[4];

  v12[3] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "_itemOfType:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSelectedCity:", *(_QWORD *)(a1 + 40));
  objc_msgSend(v4, "setDatePickerComponentType:", 1);
  objc_msgSend(*(id *)(a1 + 32), "_itemOfType:", 5);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSelectedCity:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "_itemOfType:", 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setSelectedCity:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "_itemOfType:", 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifier", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[1] = v9;
  objc_msgSend(v7, "identifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12[2] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "reconfigureItemsWithIdentifiers:", v11);

}

- (MFDatePickerViewControllerDelegate)delegate
{
  return (MFDatePickerViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (BOOL)shouldShowDeleteButton
{
  return self->_shouldShowDeleteButton;
}

- (void)setShouldShowDeleteButton:(BOOL)a3
{
  self->_shouldShowDeleteButton = a3;
}

- (EMMessage)message
{
  return self->_message;
}

- (void)setMessage:(id)a3
{
  objc_storeStrong((id *)&self->_message, a3);
}

- (UICollectionViewDiffableDataSource)dataSource
{
  return self->_dataSource;
}

- (void)setDataSource:(id)a3
{
  objc_storeStrong((id *)&self->_dataSource, a3);
}

- (UICollectionView)collectionView
{
  return self->_collectionView;
}

- (void)setCollectionView:(id)a3
{
  objc_storeStrong((id *)&self->_collectionView, a3);
}

- (OS_dispatch_queue)updateQueue
{
  return self->_updateQueue;
}

- (void)setUpdateQueue:(id)a3
{
  objc_storeStrong((id *)&self->_updateQueue, a3);
}

- (EFLocked)items
{
  return self->_items;
}

- (void)setItems:(id)a3
{
  objc_storeStrong((id *)&self->_items, a3);
}

- (EFLocked)allItems
{
  return self->_allItems;
}

- (void)setAllItems:(id)a3
{
  objc_storeStrong((id *)&self->_allItems, a3);
}

- (NSDate)initialDate
{
  return self->_initialDate;
}

- (void)setInitialDate:(id)a3
{
  objc_storeStrong((id *)&self->_initialDate, a3);
}

- (BOOL)timeSwitchEnabled
{
  return self->_timeSwitchEnabled;
}

- (void)setTimeSwitchEnabled:(BOOL)a3
{
  self->_timeSwitchEnabled = a3;
}

- (BOOL)shouldInvokeDelegate
{
  return self->_shouldInvokeDelegate;
}

- (void)setShouldInvokeDelegate:(BOOL)a3
{
  self->_shouldInvokeDelegate = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_initialDate, 0);
  objc_storeStrong((id *)&self->_allItems, 0);
  objc_storeStrong((id *)&self->_items, 0);
  objc_storeStrong((id *)&self->_updateQueue, 0);
  objc_storeStrong((id *)&self->_collectionView, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_message, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
