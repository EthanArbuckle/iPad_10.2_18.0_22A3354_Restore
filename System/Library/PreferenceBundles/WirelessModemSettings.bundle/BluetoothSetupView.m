@implementation BluetoothSetupView

- (BluetoothSetupView)initWithFrame:(CGRect)a3
{
  BluetoothSetupView *v3;
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
  objc_super v31;

  v31.receiver = self;
  v31.super_class = (Class)BluetoothSetupView;
  v3 = -[SetupView initWithFrame:](&v31, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("CONNECT_OVER_BLUETOOTH_LABEL"), &stru_24FDBBCF8, CFSTR("WirelessModemSettings"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[SetupView setTitle:](v3, "setTitle:", v5);

    v6 = (void *)MEMORY[0x24BEBD640];
    objc_msgSend(MEMORY[0x24BEBD660], "configurationWithPointSize:weight:scale:", 4, 2, 30.0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_systemImageNamed:withConfiguration:", CFSTR("bluetooth"), v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[SetupView setIcon:](v3, "setIcon:", v8);

    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "model");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "uppercaseString");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stringWithFormat:", CFSTR("%@_%@"), CFSTR("CONNECT_OVER_BLUETOOTH_STEP_1"), v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "localizedStringForKey:value:table:", v14, &stru_24FDBBCF8, CFSTR("WirelessModemSettings"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[SetupView addStep:](v3, "addStep:", v15);

    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "model");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "uppercaseString");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "stringWithFormat:", CFSTR("%@_%@"), CFSTR("CONNECT_OVER_BLUETOOTH_STEP_2"), v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "localizedStringForKey:value:table:", v21, &stru_24FDBBCF8, CFSTR("WirelessModemSettings"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[SetupView addStep:](v3, "addStep:", v22);

    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "model");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "uppercaseString");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "stringWithFormat:", CFSTR("%@_%@"), CFSTR("CONNECT_OVER_BLUETOOTH_STEP_3"), v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "localizedStringForKey:value:table:", v28, &stru_24FDBBCF8, CFSTR("WirelessModemSettings"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[SetupView addStep:](v3, "addStep:", v29);

  }
  return v3;
}

@end
