@implementation LUIManagedDevicesViewController

- (LUIManagedDevicesViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  return -[LUIManagedDevicesViewController initWithOrganizationName:](self, "initWithOrganizationName:", 0, a4);
}

- (LUIManagedDevicesViewController)initWithCoder:(id)a3
{
  return -[LUIManagedDevicesViewController initWithOrganizationName:](self, "initWithOrganizationName:", 0);
}

- (LUIManagedDevicesViewController)initWithOrganizationName:(id)a3
{
  id v5;
  LUIManagedDevicesViewController *v6;
  LUIManagedDevicesView *v7;
  LUIManagedDevicesView *managedDevicesView;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)LUIManagedDevicesViewController;
  v6 = -[LUIManagedDevicesViewController initWithNibName:bundle:](&v10, "initWithNibName:bundle:", 0, 0);
  if (v6)
  {
    v7 = -[LUIManagedDevicesView initWithFrame:]([LUIManagedDevicesView alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    managedDevicesView = v6->_managedDevicesView;
    v6->_managedDevicesView = v7;

    objc_storeStrong((id *)&v6->_organizationName, a3);
  }

  return v6;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)LUIManagedDevicesViewController;
  -[LUIManagedDevicesViewController viewDidLoad](&v16, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[LUIManagedDevicesViewController managedDevicesView](self, "managedDevicesView"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[LUIManagedDevicesViewController managedDevicesText](self, "managedDevicesText"));
  objc_msgSend(v3, "setManagedDevicesAttributedText:", v4);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[LUIManagedDevicesViewController managedDevicesView](self, "managedDevicesView"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("MANAGED_DEVICES_TITLE"), &stru_100069EB8, 0));
  objc_msgSend(v5, "setManagedDevicesTitle:", v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[LUIManagedDevicesViewController managedDevicesView](self, "managedDevicesView"));
  objc_msgSend(v8, "sizeThatFits:", CGSizeZero.width, CGSizeZero.height);
  v10 = v9;
  v12 = v11;

  -[LUIManagedDevicesViewController setPreferredContentSize:](self, "setPreferredContentSize:", v10, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemBackgroundColor](UIColor, "systemBackgroundColor"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[LUIManagedDevicesViewController managedDevicesView](self, "managedDevicesView"));
  objc_msgSend(v14, "setBackgroundColor:", v13);

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[LUIManagedDevicesViewController managedDevicesView](self, "managedDevicesView"));
  -[LUIManagedDevicesViewController setView:](self, "setView:", v15);

}

- (NSAttributedString)managedDevicesText
{
  NSAttributedString *managedDevicesText;
  NSMutableAttributedString *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  void *v23;
  const __CFString *v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  const __CFString *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  const __CFString *v33;
  id v34;
  _QWORD v36[2];
  _QWORD v37[2];
  _QWORD v38[2];
  _QWORD v39[2];

  managedDevicesText = self->_managedDevicesText;
  if (!managedDevicesText)
  {
    v4 = objc_opt_new(NSMutableAttributedString);
    v38[0] = NSFontAttributeName;
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont boldSystemFontOfSize:](UIFont, "boldSystemFontOfSize:", 12.0));
    v39[0] = v5;
    v38[1] = NSForegroundColorAttributeName;
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor labelColor](UIColor, "labelColor"));
    v39[1] = v6;
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v39, v38, 2));

    v36[0] = NSFontAttributeName;
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont systemFontOfSize:](UIFont, "systemFontOfSize:", 12.0));
    v36[1] = NSForegroundColorAttributeName;
    v37[0] = v8;
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor labelColor](UIColor, "labelColor"));
    v37[1] = v9;
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v37, v36, 2));

    v11 = objc_msgSend(objc_alloc((Class)NSAttributedString), "initWithString:attributes:", CFSTR("\n"), v10);
    v12 = objc_alloc((Class)NSMutableAttributedString);
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("SUPERVISION_HEADER"), &stru_100069EB8, 0));
    v15 = objc_msgSend(v12, "initWithString:attributes:", v14, v7);
    -[NSMutableAttributedString appendAttributedString:](v4, "appendAttributedString:", v15);

    -[NSMutableAttributedString appendAttributedString:](v4, "appendAttributedString:", v11);
    -[NSMutableAttributedString appendAttributedString:](v4, "appendAttributedString:", v11);
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[LUIManagedDevicesViewController organizationName](self, "organizationName"));

    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    if (v16)
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "localizedStringForKey:value:table:", CFSTR("SUPERVISION_TEXT_FORMAT_ORG_NAME"), &stru_100069EB8, 0));
      v19 = (void *)objc_claimAutoreleasedReturnValue(-[LUIManagedDevicesViewController organizationName](self, "organizationName"));
      v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v18, v19));

    }
    else
    {
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "localizedStringForKey:value:table:", CFSTR("SUPERVISION_TEXT_GENERIC"), &stru_100069EB8, 0));
    }

    v21 = objc_msgSend(objc_alloc((Class)NSAttributedString), "initWithString:attributes:", v20, v10);
    -[NSMutableAttributedString appendAttributedString:](v4, "appendAttributedString:", v21);

    -[NSMutableAttributedString appendAttributedString:](v4, "appendAttributedString:", v11);
    -[NSMutableAttributedString appendAttributedString:](v4, "appendAttributedString:", v11);
    -[NSMutableAttributedString appendAttributedString:](v4, "appendAttributedString:", v11);
    v22 = objc_alloc((Class)NSMutableAttributedString);
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    if (_os_feature_enabled_impl("AppleAccount", "AABranding"))
      v24 = CFSTR("MANAGED_APPLE_ACCOUNT_HEADER");
    else
      v24 = CFSTR("MANAGED_APPLE_ID_HEADER");
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "localizedStringForKey:value:table:", v24, &stru_100069EB8, 0));
    v26 = objc_msgSend(v22, "initWithString:attributes:", v25, v7);
    -[NSMutableAttributedString appendAttributedString:](v4, "appendAttributedString:", v26);

    -[NSMutableAttributedString appendAttributedString:](v4, "appendAttributedString:", v11);
    -[NSMutableAttributedString appendAttributedString:](v4, "appendAttributedString:", v11);
    v27 = (void *)objc_claimAutoreleasedReturnValue(-[LUIManagedDevicesViewController organizationName](self, "organizationName"));

    if (v27)
    {
      v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      if (_os_feature_enabled_impl("AppleAccount", "AABranding"))
        v29 = CFSTR("MANAGED_APPLE_ACCOUNT_TEXT_FORMAT_ORG_NAME");
      else
        v29 = CFSTR("MANAGED_APPLE_ID_TEXT_FORMAT_ORG_NAME");
      v30 = objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "localizedStringForKey:value:table:", v29, &stru_100069EB8, 0));
      v31 = (void *)objc_claimAutoreleasedReturnValue(-[LUIManagedDevicesViewController organizationName](self, "organizationName"));
      v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v30, v31));

      v20 = (void *)v30;
    }
    else
    {
      v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      if (_os_feature_enabled_impl("AppleAccount", "AABranding"))
        v33 = CFSTR("MANAGED_APPLE_ACCOUNT_TEXT_GENERIC");
      else
        v33 = CFSTR("MANAGED_APPLE_ID_TEXT_GENERIC");
      v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "localizedStringForKey:value:table:", v33, &stru_100069EB8, 0));
    }

    v34 = objc_msgSend(objc_alloc((Class)NSAttributedString), "initWithString:attributes:", v32, v10);
    -[NSMutableAttributedString appendAttributedString:](v4, "appendAttributedString:", v34);

    -[LUIManagedDevicesViewController setManagedDevicesText:](self, "setManagedDevicesText:", v4);
    managedDevicesText = self->_managedDevicesText;
  }
  return managedDevicesText;
}

- (LUIManagedDevicesView)managedDevicesView
{
  return self->_managedDevicesView;
}

- (void)setManagedDevicesView:(id)a3
{
  objc_storeStrong((id *)&self->_managedDevicesView, a3);
}

- (void)setManagedDevicesText:(id)a3
{
  objc_storeStrong((id *)&self->_managedDevicesText, a3);
}

- (NSString)organizationName
{
  return self->_organizationName;
}

- (void)setOrganizationName:(id)a3
{
  objc_storeStrong((id *)&self->_organizationName, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_organizationName, 0);
  objc_storeStrong((id *)&self->_managedDevicesText, 0);
  objc_storeStrong((id *)&self->_managedDevicesView, 0);
}

@end
