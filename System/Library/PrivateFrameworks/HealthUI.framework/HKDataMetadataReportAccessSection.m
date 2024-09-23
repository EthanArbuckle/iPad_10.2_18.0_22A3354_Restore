@implementation HKDataMetadataReportAccessSection

- (HKDataMetadataReportAccessSection)initWithSample:(id)a3 healthStore:(id)a4 delegate:(id)a5
{
  id v8;
  id v9;
  id v10;
  HKDataMetadataReportAccessSection *v11;
  int v12;
  HKDataMetadataReportAccessSection *v13;
  uint64_t v14;
  UIViewController *accessViewController;
  objc_super v17;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v17.receiver = self;
  v17.super_class = (Class)HKDataMetadataReportAccessSection;
  v11 = -[HKDataMetadataReportAccessSection init](&v17, sel_init);
  if (!v11)
  {
LABEL_6:
    v13 = v11;
    goto LABEL_7;
  }
  v12 = objc_msgSend(v8, "hasAssociatedReport");
  v13 = 0;
  if (v9 && v10 && v12)
  {
    objc_msgSend(v10, "accessViewControllerForSample:healthStore:", v8, v9);
    v14 = objc_claimAutoreleasedReturnValue();
    accessViewController = v11->_accessViewController;
    v11->_accessViewController = (UIViewController *)v14;

    if (!v11->_accessViewController)
    {
      v13 = 0;
      goto LABEL_7;
    }
    goto LABEL_6;
  }
LABEL_7:

  return v13;
}

- (unint64_t)numberOfRowsInSection
{
  return 1;
}

- (id)cellForIndex:(unint64_t)a3 tableView:(id)a4
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  objc_msgSend(a4, "dequeueReusableCellWithIdentifier:", CFSTR("access"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D50]), "initWithStyle:reuseIdentifier:", 0, CFSTR("access"));
  objc_msgSend(v4, "setAccessoryType:", 1);
  objc_msgSend(v4, "textLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("SHARE_DATA_TITLE"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setText:", v7);

  objc_msgSend(v4, "textLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC1350], "hk_preferredFontForTextStyle:", *MEMORY[0x1E0DC4A88]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setFont:", v9);

  return v4;
}

- (void)selectCellForIndex:(unint64_t)a3 navigationController:(id)a4 animated:(BOOL)a5
{
  objc_msgSend(a4, "pushViewController:animated:", self->_accessViewController, 1, a5);
}

- (UIViewController)accessViewController
{
  return self->_accessViewController;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessViewController, 0);
}

@end
