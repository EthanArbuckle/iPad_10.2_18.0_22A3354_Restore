@implementation NoLocationHistoryDevicesList

- (NoLocationHistoryDevicesList)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5
{
  NoLocationHistoryDevicesList *v5;
  _TtC21CommunicationsSetupUI28CKSettingsCheckInDevicesList *v6;
  _TtC21CommunicationsSetupUI28CKSettingsCheckInDevicesList *devicesList;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)NoLocationHistoryDevicesList;
  v5 = -[PSTableCell initWithStyle:reuseIdentifier:specifier:](&v9, sel_initWithStyle_reuseIdentifier_specifier_, a3, a4, a5);
  if (v5)
  {
    v6 = -[CKSettingsCheckInDevicesList initWithFullDataSharing:]([_TtC21CommunicationsSetupUI28CKSettingsCheckInDevicesList alloc], "initWithFullDataSharing:", 0);
    devicesList = v5->_devicesList;
    v5->_devicesList = v6;

    -[NoLocationHistoryDevicesList setUpConstraints](v5, "setUpConstraints");
  }
  return v5;
}

- (void)setUpConstraints
{
  void *v3;
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
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  _QWORD v31[5];

  v31[4] = *MEMORY[0x24BDAC8D0];
  -[NoLocationHistoryDevicesList devicesList](self, "devicesList");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "getView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[NoLocationHistoryDevicesList inputViewController](self, "inputViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addChildViewController:", v4);

  -[NoLocationHistoryDevicesList contentView](self, "contentView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addSubview:", v8);

  v21 = (void *)MEMORY[0x24BDD1628];
  objc_msgSend(v4, "view");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "centerYAnchor");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[NoLocationHistoryDevicesList contentView](self, "contentView");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "centerYAnchor");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "constraintEqualToAnchor:", v27);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v31[0] = v26;
  objc_msgSend(v4, "view");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "centerXAnchor");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[NoLocationHistoryDevicesList contentView](self, "contentView");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "centerXAnchor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "constraintEqualToAnchor:", v22);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v31[1] = v20;
  objc_msgSend(v4, "view");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "widthAnchor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[NoLocationHistoryDevicesList contentView](self, "contentView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "widthAnchor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "constraintEqualToAnchor:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v31[2] = v11;
  -[NoLocationHistoryDevicesList contentView](self, "contentView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "heightAnchor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "view");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "heightAnchor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "constraintEqualToAnchor:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v31[3] = v16;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v31, 4);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "activateConstraints:", v17);

}

- (_TtC21CommunicationsSetupUI28CKSettingsCheckInDevicesList)devicesList
{
  return self->_devicesList;
}

- (void)setDevicesList:(id)a3
{
  objc_storeStrong((id *)&self->_devicesList, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_devicesList, 0);
}

@end
