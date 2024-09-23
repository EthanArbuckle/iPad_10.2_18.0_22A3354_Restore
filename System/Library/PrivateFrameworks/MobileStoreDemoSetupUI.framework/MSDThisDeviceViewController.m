@implementation MSDThisDeviceViewController

- (MSDThisDeviceViewController)init
{
  MSDThisDeviceViewController *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)MSDThisDeviceViewController;
  v2 = -[MSDThisDeviceViewController init](&v10, sel_init);
  if (v2)
  {
    v3 = (void *)MGCopyAnswer();
    v4 = (void *)MGCopyAnswer();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@"), v3, v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[MSDThisDeviceViewController setOsString:](v2, "setOsString:", v5);

    v6 = (void *)MGCopyAnswer();
    -[MSDThisDeviceViewController setSerialNumber:](v2, "setSerialNumber:", v6);

    v7 = (void *)MGCopyAnswer();
    -[MSDThisDeviceViewController setDeviceModel:](v2, "setDeviceModel:", v7);

    +[MSDSetupUILocalization localizedStringForKey:](MSDSetupUILocalization, "localizedStringForKey:", CFSTR("THIS_DEVICE_HEADER"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[MSDThisDeviceViewController setTitle:](v2, "setTitle:", v8);

  }
  return v2;
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
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  objc_super v27;
  _QWORD v28[6];

  v28[4] = *MEMORY[0x24BDAC8D0];
  v27.receiver = self;
  v27.super_class = (Class)MSDThisDeviceViewController;
  -[MSDThisDeviceViewController viewDidLoad](&v27, sel_viewDidLoad);
  v3 = objc_alloc(MEMORY[0x24BDF6E58]);
  v4 = (void *)objc_msgSend(v3, "initWithFrame:style:", 2, *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
  objc_msgSend(v4, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v4, "setDataSource:", self);
  objc_msgSend(v4, "setScrollEnabled:", 0);
  objc_msgSend(v4, "setUserInteractionEnabled:", 0);
  -[MSDThisDeviceViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addSubview:", v4);

  objc_msgSend(v4, "topAnchor");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[MSDThisDeviceViewController view](self, "view");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "safeAreaLayoutGuide");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "topAnchor");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "constraintEqualToAnchor:", v23);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v28[0] = v22;
  objc_msgSend(v4, "bottomAnchor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[MSDThisDeviceViewController view](self, "view");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "safeAreaLayoutGuide");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "bottomAnchor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "constraintEqualToAnchor:", v18);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v28[1] = v17;
  objc_msgSend(v4, "leftAnchor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[MSDThisDeviceViewController view](self, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "safeAreaLayoutGuide");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "leftAnchor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "constraintEqualToAnchor:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v28[2] = v9;
  objc_msgSend(v4, "rightAnchor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[MSDThisDeviceViewController view](self, "view");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "safeAreaLayoutGuide");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "rightAnchor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "constraintEqualToAnchor:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v28[3] = v14;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v28, 4);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD1628], "activateConstraints:", v16);
  objc_msgSend(v4, "registerClass:forCellReuseIdentifier:", objc_opt_class(), CFSTR("ThisDeviceViewTableCell"));

}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 1;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return 3;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;

  v5 = a4;
  if (objc_msgSend(v5, "row") <= 2)
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6E60]), "initWithStyle:reuseIdentifier:", 1, CFSTR("ThisDeviceViewTableCell"));
    objc_msgSend(v6, "defaultContentConfiguration");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "row"))
    {
      if (objc_msgSend(v5, "row") == 1)
      {
        +[MSDSetupUILocalization localizedStringForKey:](MSDSetupUILocalization, "localizedStringForKey:", CFSTR("OS_OPTION"));
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "setText:", v8);

        -[MSDThisDeviceViewController osString](self, "osString");
        v9 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        if (objc_msgSend(v5, "row") != 2)
        {
LABEL_10:
          objc_msgSend(v6, "setContentConfiguration:", v7);

          goto LABEL_11;
        }
        +[MSDSetupUILocalization localizedStringForKey:](MSDSetupUILocalization, "localizedStringForKey:", CFSTR("SERIAL_NUMBER_OPTION"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "setText:", v11);

        -[MSDThisDeviceViewController serialNumber](self, "serialNumber");
        v9 = objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      +[MSDSetupUILocalization localizedStringForKey:](MSDSetupUILocalization, "localizedStringForKey:", CFSTR("MODEL_OPTION"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setText:", v10);

      -[MSDThisDeviceViewController deviceModel](self, "deviceModel");
      v9 = objc_claimAutoreleasedReturnValue();
    }
    v12 = (void *)v9;
    objc_msgSend(v7, "setSecondaryText:", v9);

    goto LABEL_10;
  }
  v6 = 0;
LABEL_11:

  return v6;
}

- (NSString)osString
{
  return self->_osString;
}

- (void)setOsString:(id)a3
{
  objc_storeStrong((id *)&self->_osString, a3);
}

- (NSString)serialNumber
{
  return self->_serialNumber;
}

- (void)setSerialNumber:(id)a3
{
  objc_storeStrong((id *)&self->_serialNumber, a3);
}

- (NSString)deviceModel
{
  return self->_deviceModel;
}

- (void)setDeviceModel:(id)a3
{
  objc_storeStrong((id *)&self->_deviceModel, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceModel, 0);
  objc_storeStrong((id *)&self->_serialNumber, 0);
  objc_storeStrong((id *)&self->_osString, 0);
}

@end
