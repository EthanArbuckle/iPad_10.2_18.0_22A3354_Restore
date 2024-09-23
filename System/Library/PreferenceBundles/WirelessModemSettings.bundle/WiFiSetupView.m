@implementation WiFiSetupView

- (WiFiSetupView)initWithFrame:(CGRect)a3
{
  WiFiSetupView *v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  const __CFString *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  void *v22;
  const __CFString *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  objc_super v29;

  v29.receiver = self;
  v29.super_class = (Class)WiFiSetupView;
  v3 = -[SetupView initWithFrame:](&v29, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("CONNECT_OVER_WIFI_LABEL"), &stru_24FDBBCF8, CFSTR("WirelessModemSettings"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = MGGetBoolAnswer();
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v7)
      v10 = CFSTR("WIFI_CH");
    else
      v10 = CFSTR("WIFI_UPPERCASE");
    objc_msgSend(v8, "localizedStringForKey:value:table:", v10, &stru_24FDBBCF8, CFSTR("WirelessModemSettings"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringWithFormat:", v6, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[SetupView setTitle:](v3, "setTitle:", v12);

    v13 = (void *)MEMORY[0x24BEBD640];
    objc_msgSend(MEMORY[0x24BEBD660], "configurationWithPointSize:weight:scale:", 4, 2, 30.0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "_systemImageNamed:withConfiguration:", CFSTR("wifi"), v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[SetupView setIcon:](v3, "setIcon:", v15);

    v16 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "localizedStringForKey:value:table:", CFSTR("CONNECT_OVER_WIFI_STEP_1"), &stru_24FDBBCF8, CFSTR("WirelessModemSettings"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    WMSGetCurrentDeviceName();
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = MGGetBoolAnswer();
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = v21;
    if (v20)
      v23 = CFSTR("WIFI_CH");
    else
      v23 = CFSTR("WIFI");
    objc_msgSend(v21, "localizedStringForKey:value:table:", v23, &stru_24FDBBCF8, CFSTR("WirelessModemSettings"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "stringWithFormat:", v18, v19, v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[SetupView addStep:](v3, "addStep:", v25);

    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "localizedStringForKey:value:table:", CFSTR("CONNECT_OVER_WIFI_STEP_2"), &stru_24FDBBCF8, CFSTR("WirelessModemSettings"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[SetupView addStep:](v3, "addStep:", v27);

  }
  return v3;
}

@end
