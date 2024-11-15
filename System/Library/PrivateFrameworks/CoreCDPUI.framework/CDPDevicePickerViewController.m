@implementation CDPDevicePickerViewController

- (CDPDevicePickerViewController)initWithDevices:(id)a3 delegate:(id)a4
{
  return -[CDPDevicePickerViewController initWithDevices:delegate:tableViewStyle:](self, "initWithDevices:delegate:tableViewStyle:", a3, a4, 1);
}

- (CDPDevicePickerViewController)initWithDevices:(id)a3 delegate:(id)a4 tableViewStyle:(int64_t)a5
{
  id v9;
  id v10;
  void *v11;
  __CFString *v12;
  char v13;
  CDPDevicePickerViewController *v14;
  void *v15;

  v9 = a3;
  v10 = a4;
  if (objc_msgSend(v9, "prevailingLocalSecretType") != 2)
  {
    CDPLocalizedString();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    CDPLocalizedString();
    v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v14 = -[CDPTableViewController initWithTitle:subTitle:](self, "initWithTitle:subTitle:", v11, v12);
LABEL_8:

    goto LABEL_9;
  }
  CDPLocalizedString();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = CFSTR("DEVICE_PICKER_SUBTITLE_ALL_MAC");
  if ((objc_msgSend(CFSTR("DEVICE_PICKER_SUBTITLE_ALL_MAC"), "containsString:", CFSTR("REBRAND")) & 1) != 0
    || !_os_feature_enabled_impl())
  {
    v13 = 0;
  }
  else
  {
    objc_msgSend(CFSTR("DEVICE_PICKER_SUBTITLE_ALL_MAC"), "stringByAppendingString:", CFSTR("_REBRAND"));
    v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v13 = 1;
  }
  CDPLocalizedString();
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[CDPTableViewController initWithTitle:subTitle:](self, "initWithTitle:subTitle:", v11, v15);

  if ((v13 & 1) != 0)
    goto LABEL_8;
LABEL_9:

  if (v14)
  {
    objc_storeStrong((id *)&v14->_devices, a3);
    objc_storeWeak((id *)&v14->_delegate, v10);
    -[CDPTableViewController setTableViewStyle:](v14, "setTableViewStyle:", a5);
  }

  return v14;
}

- (id)escapeOffers
{
  NSArray *escapeOffers;
  id WeakRetained;
  NSArray *v5;
  NSArray *v6;

  escapeOffers = self->_escapeOffers;
  if (!escapeOffers)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "devicePicker:escapeOffersForDevices:", self, self->_devices);
    v5 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v6 = self->_escapeOffers;
    self->_escapeOffers = v5;

    escapeOffers = self->_escapeOffers;
  }
  return escapeOffers;
}

- (double)heightForFooterInTableView:(id)a3
{
  void *v3;
  double v4;

  -[CDPDevicePickerViewController escapeOffers](self, "escapeOffers", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (double)(unint64_t)objc_msgSend(v3, "count") * 45.0;

  return v4;
}

- (id)viewForFooterInTableView:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;

  -[CDPDevicePickerViewController escapeOffers](self, "escapeOffers", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  if (v5)
  {
    -[CDPDevicePickerViewController escapeOffers](self, "escapeOffers");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "aaf_map:", &__block_literal_global_1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD978]), "initWithArrangedSubviews:", v7);
    objc_msgSend(v8, "setAxis:", 1);
    objc_msgSend(v8, "setAlignment:", 3);
    objc_msgSend(v8, "setDistribution:", 4);

  }
  else
  {
    v8 = 0;
  }
  return v8;
}

id __58__CDPDevicePickerViewController_viewForFooterInTableView___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v2 = (void *)MEMORY[0x24BEBD430];
  v3 = a2;
  objc_msgSend(v2, "buttonWithType:", 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "escapeOfferName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTitle:forState:", v5, 0);

  objc_msgSend(v4, "titleLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBB520], "systemFontOfSize:", 17.0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setFont:", v7);

  objc_msgSend(v4, "addTarget:action:forControlEvents:", v3, sel_handleEscapeAction_, 64);
  objc_msgSend(v4, "sizeToFit");
  return v4;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 1;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return -[NSArray count](self->_devices, "count", a3, a4);
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
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
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;

  v6 = a4;
  v7 = a3;
  -[CDPTableViewController tableView](self, "tableView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "dequeueReusableCellWithIdentifier:", CFSTR("CDPDeviceCell"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD9F8]), "initWithStyle:reuseIdentifier:", 3, CFSTR("CDPDeviceCell"));
    objc_msgSend(v9, "setAccessoryType:", 1);
  }
  -[NSArray objectAtIndexedSubscript:](self->_devices, "objectAtIndexedSubscript:", objc_msgSend(v6, "row"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "localizedName");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "textLabel");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setText:", v11);

  v13 = (void *)MEMORY[0x24BEBB520];
  objc_msgSend(v9, "textLabel");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "font");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "pointSize");
  objc_msgSend(v13, "boldSystemFontOfSize:");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "textLabel");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setFont:", v16);

  objc_msgSend(v10, "model");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "detailTextLabel");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setText:", v18);

  v20 = objc_msgSend(v7, "style");
  if (v20 == 2)
    objc_msgSend(MEMORY[0x24BEBD4B8], "systemGray6Color");
  else
    objc_msgSend(MEMORY[0x24BEBD4B8], "systemBackgroundColor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setBackgroundColor:", v21);

  return v9;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x24BE1A458], "builderForKey:", CFSTR("DEVICE_PICKER_DEVICES_HEADER"), a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addSecretType:", -[NSArray prevailingLocalSecretType](self->_devices, "prevailingLocalSecretType"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  CDPDevicePickerDelegate **p_delegate;
  id v6;
  NSArray *devices;
  uint64_t v8;
  void *v9;
  id WeakRetained;

  p_delegate = &self->_delegate;
  v6 = a4;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  devices = self->_devices;
  v8 = objc_msgSend(v6, "row");

  -[NSArray objectAtIndexedSubscript:](devices, "objectAtIndexedSubscript:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "devicePicker:didSelectDevice:", self, v9);

}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  void *v4;
  NSString *v5;
  double v6;

  -[CDPDevicePickerViewController traitCollection](self, "traitCollection", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "preferredContentSizeCategory");
  v5 = (NSString *)objc_claimAutoreleasedReturnValue();
  if (UIContentSizeCategoryIsAccessibilityCategory(v5))
    v6 = *MEMORY[0x24BEBE770];
  else
    v6 = 60.0;

  return v6;
}

- (double)tableView:(id)a3 estimatedHeightForRowAtIndexPath:(id)a4
{
  return 60.0;
}

- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4
{
  uint64_t v4;
  uint64_t v5;
  double result;
  double v7;

  result = 0.0;
  if (!a4)
  {
    -[UIButton frame](self->_remoteApprovalButton, "frame", a3, 0.0, v4, v5);
    return v7 + 45.0;
  }
  return result;
}

- (void)setDevices:(id)a3
{
  id v5;
  NSArray *escapeOffers;
  id v7;

  objc_storeStrong((id *)&self->_devices, a3);
  v5 = a3;
  escapeOffers = self->_escapeOffers;
  self->_escapeOffers = 0;

  -[CDPTableViewController tableView](self, "tableView");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "reloadData");

}

- (NSArray)devices
{
  return self->_devices;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remoteApprovalButton, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_escapeOffers, 0);
  objc_storeStrong((id *)&self->_devices, 0);
}

@end
