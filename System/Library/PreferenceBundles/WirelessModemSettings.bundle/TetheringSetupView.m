@implementation TetheringSetupView

- (TetheringSetupView)initWithSpecifier:(id)a3
{
  id v4;
  TetheringSetupView *v5;
  void *v6;
  WiFiSetupView *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  uint64_t v12;
  WiFiSetupView *wifiView;
  BluetoothSetupView *v14;
  BluetoothSetupView *btView;
  USBSetupView *v16;
  USBSetupView *usbView;
  objc_super v19;

  v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)TetheringSetupView;
  v5 = -[TetheringSetupView init](&v19, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "propertyForKey:", CFSTR("SupportsWifi"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_showWifiView = objc_msgSend(v6, "BOOLValue");

    if (v5->_showWifiView)
    {
      v7 = [WiFiSetupView alloc];
      v8 = *MEMORY[0x24BDBF090];
      v9 = *(double *)(MEMORY[0x24BDBF090] + 8);
      v10 = *(double *)(MEMORY[0x24BDBF090] + 16);
      v11 = *(double *)(MEMORY[0x24BDBF090] + 24);
      v12 = -[WiFiSetupView initWithFrame:](v7, "initWithFrame:", *MEMORY[0x24BDBF090], v9, v10, v11);
      wifiView = v5->_wifiView;
      v5->_wifiView = (WiFiSetupView *)v12;

      -[WiFiSetupView setAutoresizingMask:](v5->_wifiView, "setAutoresizingMask:", 2);
      -[TetheringSetupView addSubview:](v5, "addSubview:", v5->_wifiView);
    }
    else
    {
      v8 = *MEMORY[0x24BDBF090];
      v9 = *(double *)(MEMORY[0x24BDBF090] + 8);
      v10 = *(double *)(MEMORY[0x24BDBF090] + 16);
      v11 = *(double *)(MEMORY[0x24BDBF090] + 24);
    }
    v14 = -[BluetoothSetupView initWithFrame:]([BluetoothSetupView alloc], "initWithFrame:", v8, v9, v10, v11);
    btView = v5->_btView;
    v5->_btView = v14;

    -[BluetoothSetupView setAutoresizingMask:](v5->_btView, "setAutoresizingMask:", 2);
    -[TetheringSetupView addSubview:](v5, "addSubview:", v5->_btView);
    v16 = -[USBSetupView initWithFrame:]([USBSetupView alloc], "initWithFrame:", v8, v9, v10, v11);
    usbView = v5->_usbView;
    v5->_usbView = v16;

    -[USBSetupView setAutoresizingMask:](v5->_usbView, "setAutoresizingMask:", 2);
    -[TetheringSetupView addSubview:](v5, "addSubview:", v5->_usbView);
  }

  return v5;
}

- (CGSize)sizeThatFits:(CGSize)a3 inTableView:(id)a4 shouldSetSize:(BOOL)a5
{
  _BOOL4 v5;
  double width;
  id v8;
  CGFloat v9;
  double v10;
  double v11;
  double v12;
  CGFloat v13;
  double v14;
  double v15;
  double v16;
  CGFloat v17;
  double v18;
  double v19;
  float v20;
  double v21;
  float v22;
  double v23;
  double v24;
  double v25;
  CGSize result;
  CGRect v27;
  CGRect v28;
  CGRect v29;
  CGRect v30;
  CGRect v31;
  CGRect v32;

  v5 = a5;
  width = a3.width;
  v8 = a4;
  if (self->_showWifiView)
  {
    -[SetupView sizeThatFits:](self->_wifiView, "sizeThatFits:", width, 1.79769313e308);
    v11 = v10;
    if (v5)
    {
      v27.size.width = v9;
      v27.origin.x = 0.0;
      v27.origin.y = 20.0;
      v27.size.height = v11;
      v28 = CGRectIntegral(v27);
      -[WiFiSetupView setFrame:](self->_wifiView, "setFrame:", v28.origin.x, v28.origin.y, v28.size.width, v28.size.height);
    }
    v12 = v11 + 20.0 + 10.0;
  }
  else
  {
    v12 = 20.0;
  }
  -[SetupView sizeThatFits:](self->_btView, "sizeThatFits:", width, 1.79769313e308);
  v15 = v14;
  if (v5)
  {
    v29.size.width = v13;
    v29.origin.x = 0.0;
    v29.origin.y = v12;
    v29.size.height = v15;
    v30 = CGRectIntegral(v29);
    -[BluetoothSetupView setFrame:](self->_btView, "setFrame:", v30.origin.x, v30.origin.y, v30.size.width, v30.size.height);
  }
  v16 = v12 + v15 + 10.0;
  -[SetupView sizeThatFits:](self->_usbView, "sizeThatFits:", width, 1.79769313e308);
  v19 = v18;
  if (v5)
  {
    v31.size.width = v17;
    v31.origin.x = 0.0;
    v31.origin.y = v16;
    v31.size.height = v19;
    v32 = CGRectIntegral(v31);
    -[USBSetupView setFrame:](self->_usbView, "setFrame:", v32.origin.x, v32.origin.y, v32.size.width, v32.size.height);
  }
  v20 = width;
  v21 = ceilf(v20);
  v22 = v16 + v19 + 10.0;
  v23 = ceilf(v22);

  v24 = v21;
  v25 = v23;
  result.height = v25;
  result.width = v24;
  return result;
}

- (double)preferredHeightForWidth:(double)a3 inTableView:(id)a4
{
  double v4;

  -[TetheringSetupView sizeThatFits:inTableView:shouldSetSize:](self, "sizeThatFits:inTableView:shouldSetSize:", a4, 0, a3, 0.0);
  return v4;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGSize result;

  height = a3.height;
  width = a3.width;
  -[TetheringSetupView superview](self, "superview");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[TetheringSetupView sizeThatFits:inTableView:shouldSetSize:](self, "sizeThatFits:inTableView:shouldSetSize:", v6, 0, width, height);
  v8 = v7;
  v10 = v9;

  v11 = v8;
  v12 = v10;
  result.height = v12;
  result.width = v11;
  return result;
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)TetheringSetupView;
  -[TetheringSetupView layoutSubviews](&v8, sel_layoutSubviews);
  -[TetheringSetupView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  -[TetheringSetupView superview](self, "superview");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[TetheringSetupView sizeThatFits:inTableView:shouldSetSize:](self, "sizeThatFits:inTableView:shouldSetSize:", v7, 1, v4, v6);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_usbView, 0);
  objc_storeStrong((id *)&self->_btView, 0);
  objc_storeStrong((id *)&self->_wifiView, 0);
}

@end
