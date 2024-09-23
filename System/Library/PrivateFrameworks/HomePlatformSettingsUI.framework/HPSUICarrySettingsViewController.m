@implementation HPSUICarrySettingsViewController

+ (void)shouldShowCarrySettingsButtonForHomeID:(id)a3 withCompletion:(id)a4
{
  +[_HPSUICarrySettingsViewController shouldShowCarrySettingsButtonForHomeID:withCompletion:](_HPSUICarrySettingsViewController, "shouldShowCarrySettingsButtonForHomeID:withCompletion:", a3, a4);
}

+ (void)shouldShowCarrySettingsButtonForHomeID:(id)a3 homeKitIdentifiers:(id)a4 withCompletion:(id)a5
{
  +[_HPSUICarrySettingsViewController shouldShowCarrySettingsButtonForHomeID:homeKitIdentifiers:withCompletion:](_HPSUICarrySettingsViewController, "shouldShowCarrySettingsButtonForHomeID:homeKitIdentifiers:withCompletion:", a3, a4, a5);
}

- (HPSUICarrySettingsViewController)initWithHomeID:(id)a3
{
  id v4;
  HPSUICarrySettingsViewController *v5;
  _HPSUICarrySettingsViewController *v6;
  HPSUICarrySettingsViewController *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HPSUICarrySettingsViewController;
  v5 = -[HPSUICarrySettingsViewController initWithNibName:bundle:](&v9, sel_initWithNibName_bundle_, 0, 0);
  if (v5)
  {
    v6 = -[_HPSUICarrySettingsViewController initWithHomeID:]([_HPSUICarrySettingsViewController alloc], "initWithHomeID:", v4);
    -[HPSUICarrySettingsViewController setInternalVC:](v5, "setInternalVC:", v6);

    v7 = v5;
  }

  return v5;
}

- (HPSUICarrySettingsViewController)initWithHomeID:(id)a3 homeKitIdentifiers:(id)a4
{
  id v6;
  id v7;
  HPSUICarrySettingsViewController *v8;
  _HPSUICarrySettingsViewController *v9;
  HPSUICarrySettingsViewController *v10;
  objc_super v12;

  v6 = a3;
  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HPSUICarrySettingsViewController;
  v8 = -[HPSUICarrySettingsViewController initWithNibName:bundle:](&v12, sel_initWithNibName_bundle_, 0, 0);
  if (v8)
  {
    v9 = -[_HPSUICarrySettingsViewController initWithHomeID:homeKitIdentifiers:]([_HPSUICarrySettingsViewController alloc], "initWithHomeID:homeKitIdentifiers:", v6, v7);
    -[HPSUICarrySettingsViewController setInternalVC:](v8, "setInternalVC:", v9);

    v10 = v8;
  }

  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[HPSUICarrySettingsViewController homeID](self, "homeID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    objc_msgSend(v5, "encodeObject:forKey:", v4, CFSTR("hid"));

}

- (HPSUICarrySettingsViewController)initWithCoder:(id)a3
{
  void *v4;
  HPSUICarrySettingsViewController *v5;

  objc_msgSend(a3, "decodeObjectForKey:", CFSTR("hid"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    self = -[HPSUICarrySettingsViewController initWithHomeID:](self, "initWithHomeID:", v4);
    v5 = self;
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)configureInternalVC
{
  void *v3;
  void *v4;

  dispatch_assert_queue_V2(MEMORY[0x24BDAC9B8]);
  -[HPSUICarrySettingsViewController internalVC](self, "internalVC");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = v3;
    -[UIViewController wrapWithSubViewController:](self, "wrapWithSubViewController:", v3);
    v3 = v4;
  }

}

- (void)setBackgroundColorIfNeeded
{
  void *v3;
  char isKindOfClass;
  id v5;
  void *v6;
  unint64_t v7;
  unint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  -[HPSUICarrySettingsViewController parentViewController](self, "parentViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v14 = v3;
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
    v3 = v14;
    if ((isKindOfClass & 1) != 0)
    {
      v5 = v14;
      objc_msgSend(v5, "viewControllers");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "count");

      v8 = v7 - 2;
      if (v7 >= 2)
      {
        objc_msgSend(v5, "viewControllers");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "objectAtIndexedSubscript:", v8);
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v10, "view");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "backgroundColor");
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        if (v12)
        {
          -[HPSUICarrySettingsViewController view](self, "view");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "setBackgroundColor:", v12);

        }
      }

      v3 = v14;
    }
  }

}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  objc_super v5;

  -[HPSUICarrySettingsViewController setBackgroundColorIfNeeded](self, "setBackgroundColorIfNeeded");
  -[HPSUICarrySettingsViewController configureInternalVC](self, "configureInternalVC");
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("HOMEPOD_INTERNAL_UPDATES"), 0, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HPSUICarrySettingsViewController setTitle:](self, "setTitle:", v4);
  v5.receiver = self;
  v5.super_class = (Class)HPSUICarrySettingsViewController;
  -[HPSUICarrySettingsViewController viewDidLoad](&v5, sel_viewDidLoad);

}

- (NSString)homeID
{
  return self->_homeID;
}

- (void)setHomeID:(id)a3
{
  objc_storeStrong((id *)&self->_homeID, a3);
}

- (NSSet)identifiers
{
  return self->_identifiers;
}

- (void)setIdentifiers:(id)a3
{
  objc_storeStrong((id *)&self->_identifiers, a3);
}

- (_HPSUICarrySettingsViewController)internalVC
{
  return self->_internalVC;
}

- (void)setInternalVC:(id)a3
{
  objc_storeStrong((id *)&self->_internalVC, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_internalVC, 0);
  objc_storeStrong((id *)&self->_identifiers, 0);
  objc_storeStrong((id *)&self->_homeID, 0);
}

@end
