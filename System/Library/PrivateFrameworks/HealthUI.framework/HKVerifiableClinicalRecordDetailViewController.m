@implementation HKVerifiableClinicalRecordDetailViewController

- (HKVerifiableClinicalRecordDetailViewController)initWithSignedRecord:(id)a3 medicalRecords:(id)a4
{
  id v6;
  id v7;
  HKVerifiableClinicalRecordDetailViewController *v8;
  HKVerifiableClinicalRecordDetailDataProvider *v9;
  HKVerifiableClinicalRecordDetailDataProvider *dataProvider;
  objc_super v12;

  v6 = a3;
  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HKVerifiableClinicalRecordDetailViewController;
  v8 = -[HKTableViewController initWithUsingInsetStyling:](&v12, sel_initWithUsingInsetStyling_, 1);
  if (v8)
  {
    v9 = -[HKVerifiableClinicalRecordDetailDataProvider initWithSignedRecord:medicalRecords:]([HKVerifiableClinicalRecordDetailDataProvider alloc], "initWithSignedRecord:medicalRecords:", v6, v7);
    dataProvider = v8->_dataProvider;
    v8->_dataProvider = v9;

  }
  return v8;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HKVerifiableClinicalRecordDetailViewController;
  -[HKTableViewController viewDidLoad](&v5, sel_viewDidLoad);
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("DETAIL_VIEW_TITLE"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable-Pasadena"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKVerifiableClinicalRecordDetailViewController setTitle:](self, "setTitle:", v4);

  -[HKVerifiableClinicalRecordDetailViewController setModalInPresentation:](self, "setModalInPresentation:", 1);
  -[HKVerifiableClinicalRecordDetailViewController _setUpTableView](self, "_setUpTableView");
}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  int v6;
  void *v7;
  objc_super v8;

  v3 = a3;
  v8.receiver = self;
  v8.super_class = (Class)HKVerifiableClinicalRecordDetailViewController;
  -[HKVerifiableClinicalRecordDetailViewController viewWillAppear:](&v8, sel_viewWillAppear_);
  -[HKVerifiableClinicalRecordDetailViewController navigationController](self, "navigationController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isNavigationBarHidden");

  if (v6)
  {
    -[HKVerifiableClinicalRecordDetailViewController navigationController](self, "navigationController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setNavigationBarHidden:animated:", 0, v3);

  }
}

- (void)_setUpTableView
{
  double v3;
  void *v4;
  void *v5;
  id v6;

  v3 = *MEMORY[0x1E0DC53D8];
  -[HKVerifiableClinicalRecordDetailViewController tableView](self, "tableView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setRowHeight:", v3);

  -[HKVerifiableClinicalRecordDetailViewController tableView](self, "tableView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "registerClass:forCellReuseIdentifier:", objc_opt_class(), CFSTR("SubtitleCell"));

  -[HKVerifiableClinicalRecordDetailViewController tableView](self, "tableView");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "registerClass:forCellReuseIdentifier:", objc_opt_class(), CFSTR("ValueCell"));

}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return -[HKVerifiableClinicalRecordDetailDataProvider numberOfSections](self->_dataProvider, "numberOfSections", a3);
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return -[HKVerifiableClinicalRecordDetailDataProvider numberOfRowsForSection:](self->_dataProvider, "numberOfRowsForSection:", a4);
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  return -[HKVerifiableClinicalRecordDetailDataProvider headerForSection:](self->_dataProvider, "headerForSection:", a4);
}

- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4
{
  return -[HKVerifiableClinicalRecordDetailDataProvider footerForSection:](self->_dataProvider, "footerForSection:", a4);
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  HKVerifiableClinicalRecordDetailDataProvider *dataProvider;
  id v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  objc_class *v15;
  void *v16;

  v6 = a3;
  dataProvider = self->_dataProvider;
  v8 = a4;
  v9 = objc_msgSend(v8, "section");
  v10 = objc_msgSend(v8, "row");

  -[HKVerifiableClinicalRecordDetailDataProvider displayItemForSection:row:](dataProvider, "displayItemForSection:row:", v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "type");
  if (v12 == 1)
  {
    -[HKVerifiableClinicalRecordDetailViewController configureValueCellForItem:tableView:](self, "configureValueCellForItem:tableView:", v11, v6);
    v13 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (v12)
    {
      v15 = (objc_class *)objc_opt_class();
      NSStringFromClass(v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      HKErrorTableViewCell(v16);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_7;
    }
    -[HKVerifiableClinicalRecordDetailViewController configureSubtitleCellForItem:tableView:](self, "configureSubtitleCellForItem:tableView:", v11, v6);
    v13 = objc_claimAutoreleasedReturnValue();
  }
  v14 = (void *)v13;
LABEL_7:

  return v14;
}

- (id)configureSubtitleCellForItem:(id)a3 tableView:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;

  v5 = a3;
  objc_msgSend(a4, "dequeueReusableCellWithIdentifier:", CFSTR("SubtitleCell"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setSelectionStyle:", 0);
  objc_msgSend(MEMORY[0x1E0DC39A8], "subtitleCellConfiguration");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "titleText");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setText:", v8);

  objc_msgSend(v5, "detailText");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setSecondaryText:", v9);

  objc_msgSend(v7, "setDirectionalLayoutMargins:", 10.0, 0.0, 10.0, 0.0);
  objc_msgSend(v7, "setTextToSecondaryTextVerticalPadding:", 5.0);
  v10 = objc_msgSend(v5, "subtitleStyle");

  if (v10 == 1)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "textProperties");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setColor:", v19);

    objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4B10]);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "textProperties");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setFont:", v21);

    objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "secondaryTextProperties");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setColor:", v23);

    v17 = (void *)MEMORY[0x1E0DC1350];
    v18 = (_QWORD *)MEMORY[0x1E0DC4A88];
    goto LABEL_5;
  }
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "textProperties");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setColor:", v11);

    objc_msgSend(MEMORY[0x1E0DC1350], "_preferredFontForTextStyle:variant:", *MEMORY[0x1E0DC4A88], 1024);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "textProperties");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setFont:", v13);

    objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "secondaryTextProperties");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setColor:", v15);

    v17 = (void *)MEMORY[0x1E0DC1350];
    v18 = (_QWORD *)MEMORY[0x1E0DC4B10];
LABEL_5:
    objc_msgSend(v17, "preferredFontForTextStyle:", *v18);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "secondaryTextProperties");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setFont:", v25);

  }
  objc_msgSend(v6, "setContentConfiguration:", v7);

  return v6;
}

- (id)configureValueCellForItem:(id)a3 tableView:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;

  v5 = a3;
  objc_msgSend(a4, "dequeueReusableCellWithIdentifier:", CFSTR("ValueCell"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setSelectionStyle:", 0);
  objc_msgSend(MEMORY[0x1E0DC39A8], "valueCellConfiguration");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setTextToSecondaryTextHorizontalPadding:", 10.0);
  objc_msgSend(v5, "titleText");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setText:", v8);

  objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "textProperties");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setColor:", v9);

  v11 = *MEMORY[0x1E0DC4A88];
  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4A88]);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "textProperties");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setFont:", v12);

  objc_msgSend(v5, "detailText");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setSecondaryText:", v14);

  objc_msgSend(v5, "attributedDetailText");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "setSecondaryAttributedText:", v15);
  objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "secondaryTextProperties");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setColor:", v16);

  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", v11);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "secondaryTextProperties");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setFont:", v18);

  objc_msgSend(v6, "setContentConfiguration:", v7);
  return v6;
}

- (HKVerifiableClinicalRecordDetailDataProvider)dataProvider
{
  return self->_dataProvider;
}

- (void)setDataProvider:(id)a3
{
  objc_storeStrong((id *)&self->_dataProvider, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataProvider, 0);
}

@end
