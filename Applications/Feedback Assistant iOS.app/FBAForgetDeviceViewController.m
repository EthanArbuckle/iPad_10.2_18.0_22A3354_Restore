@implementation FBAForgetDeviceViewController

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)FBAForgetDeviceViewController;
  -[FBAForgetDeviceViewController viewDidLoad](&v5, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[FBAForgetDeviceViewController tableView](self, "tableView"));
  objc_msgSend(v3, "setEstimatedSectionHeaderHeight:", 0.0);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[FBAForgetDeviceViewController tableView](self, "tableView"));
  objc_msgSend(v4, "setEstimatedSectionFooterHeight:", 0.0);

  -[FBAForgetDeviceViewController setClearsSelectionOnViewWillAppear:](self, "setClearsSelectionOnViewWillAppear:", 0);
}

- (void)didReceiveMemoryWarning
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)FBAForgetDeviceViewController;
  -[FBAForgetDeviceViewController didReceiveMemoryWarning](&v2, "didReceiveMemoryWarning");
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 1;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return 1;
}

- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle", a3, a4));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("FORGET_DEVICE_INSTRUCTION"), &stru_1000EA660, 0));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[FBAForgetDeviceViewController device](self, "device"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "name"));
  if (objc_msgSend(v8, "isEqualToString:", &stru_1000EA660))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("THIS_DEVICE"), &stru_1000EA660, 0));
  }
  else
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[FBAForgetDeviceViewController device](self, "device"));
    v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "name"));
  }
  v11 = (void *)v10;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v6, v10));

  return v12;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  void *v4;
  void *v5;
  void *v6;
  unint64_t v7;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "dequeueReusableCellWithIdentifier:forIndexPath:", CFSTR("ForgetDeviceCell"), a4));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[iFBAConstants tintColor](iFBAConstants, "tintColor"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "textLabel"));
  objc_msgSend(v6, "setTextColor:", v5);

  v7 = (unint64_t)objc_msgSend(v4, "accessibilityTraits");
  objc_msgSend(v4, "setAccessibilityTraits:", UIAccessibilityTraitButton | v7);
  return v4;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FBAForgetDeviceViewController delegate](self, "delegate", a3, a4));

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[FBAForgetDeviceViewController delegate](self, "delegate"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[FBAForgetDeviceViewController device](self, "device"));
    objc_msgSend(v6, "didTapForgetDevice:", v7);

  }
  v9 = (id)objc_claimAutoreleasedReturnValue(-[FBAForgetDeviceViewController navigationController](self, "navigationController"));
  v8 = objc_msgSend(v9, "popViewControllerAnimated:", 1);

}

- (FBAForgetDeviceProtocol)delegate
{
  return (FBAForgetDeviceProtocol *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (FBKGroupedDevice)device
{
  return self->_device;
}

- (void)setDevice:(id)a3
{
  objc_storeStrong((id *)&self->_device, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_device, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
