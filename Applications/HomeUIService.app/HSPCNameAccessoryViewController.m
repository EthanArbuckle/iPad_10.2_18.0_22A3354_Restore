@implementation HSPCNameAccessoryViewController

- (HSPCNameAccessoryViewController)initWithCoordinator:(id)a3 config:(id)a4
{
  id v6;
  HSPCNameAccessoryViewController *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  uint64_t v17;
  objc_class *v18;
  NSString *v19;
  void *v20;
  void *v21;
  void *v22;
  objc_super v24;
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  void *v28;

  v6 = a3;
  v24.receiver = self;
  v24.super_class = (Class)HSPCNameAccessoryViewController;
  v7 = -[HSPCTextFieldViewController initWithCoordinator:config:](&v24, "initWithCoordinator:config:", v6, a4);
  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "activeTuple"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "accessoryCategoryOrPrimaryServiceType"));
    v10 = HFLocalizedCategoryOrPrimaryServiceTypeString(CFSTR("HUProximityCardNameAccessoryCardTitle"), v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    -[HSPCNameAccessoryViewController setTitle:](v7, "setTitle:", v11);

    v12 = HULocalizedString(CFSTR("HUProximityCardSetupAccessorySetupSubtitle"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
    -[HSPCNameAccessoryViewController setSubtitle:](v7, "setSubtitle:", v13);

    v15 = HFLogForCategory(58, v14);
    v16 = objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      v18 = (objc_class *)objc_opt_class(v7, v17);
      v19 = NSStringFromClass(v18);
      v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
      v21 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCTextFieldViewController config](v7, "config"));
      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "addedAccessory"));
      *(_DWORD *)buf = 138412546;
      v26 = v20;
      v27 = 2112;
      v28 = v22;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "%@ accessory %@", buf, 0x16u);

    }
  }

  return v7;
}

- (void)viewDidLoad
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)HSPCNameAccessoryViewController;
  -[HSPCTextFieldViewController viewDidLoad](&v4, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCNameAccessoryViewController suggestedAccessoryName](self, "suggestedAccessoryName"));
  -[HSPCTextFieldViewController setTextFieldText:](self, "setTextFieldText:", v3);
  -[HSPCTextFieldViewController setTextFieldPlaceholderText:](self, "setTextFieldPlaceholderText:", v3);

}

- (id)commitConfiguration
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[5];
  _QWORD v13[5];

  -[HSPCTextFieldViewController endEditing](self, "endEditing");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCTextFieldViewController config](self, "config"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCTextFieldViewController textFieldText](self, "textFieldText"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "updateUserGivenAccessoryName:", v4));
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10002E5EC;
  v13[3] = &unk_1000A1E80;
  v13[4] = self;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "flatMap:", v13));
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10002E628;
  v12[3] = &unk_1000A1E80;
  v12[4] = self;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "flatMap:", v12));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCTextFieldViewController textFieldText](self, "textFieldText"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Accessory update naming: \"%@\"), v8));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "hs_commitConfigurationFutureWithContextMessage:", v9));

  return v10;
}

- (id)suggestedAccessoryName
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  __CFString *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  __CFString *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  __CFString *v25;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCTextFieldViewController coordinator](self, "coordinator"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "setupAccessoryDescription"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "suggestedAccessoryName"));
  v6 = v5;
  if (v5)
  {
    v7 = v5;
  }
  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCTextFieldViewController coordinator](self, "coordinator"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "activeTuple"));
    v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "titleForAccessory"));
    v11 = (void *)v10;
    v12 = &stru_1000A3BA0;
    if (v10)
      v12 = (__CFString *)v10;
    v7 = v12;

  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCTextFieldViewController config](self, "config"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "home"));

  if (v14)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "accessories"));
    v16 = objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "na_map:", &stru_1000A2550));
    v17 = (void *)v16;
    if (v16)
      v18 = (void *)v16;
    else
      v18 = &__NSArray0__struct;
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v18));
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCTextFieldViewController config](self, "config"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "addedAccessory"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "name"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet na_setWithSafeObject:](NSSet, "na_setWithSafeObject:", v22));
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "na_setByRemovingObjectsFromSet:", v23));

    v25 = (__CFString *)objc_claimAutoreleasedReturnValue(+[HFUtilities uniqueHomeKitNameForName:allNames:](HFUtilities, "uniqueHomeKitNameForName:allNames:", v7, v24));
  }
  else
  {
    v25 = v7;
  }

  return v25;
}

@end
