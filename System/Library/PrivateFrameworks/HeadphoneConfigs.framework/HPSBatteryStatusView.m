@implementation HPSBatteryStatusView

- ($FFD8FFF7A5D2C2666551BEB14716E99F)status
{
  __int128 v3;

  v3 = *(_OWORD *)&self[11].var0;
  *(_OWORD *)&retstr->var0 = *(_OWORD *)&self[10].var6;
  *(_OWORD *)&retstr->var4 = v3;
  *(_QWORD *)&retstr->var8 = *(_QWORD *)&self[11].var4;
  return self;
}

- (void)setStatus:(id *)a3
{
  $D7255671A14596C0C458EDE2DD96E2EB *p_status;
  uint64_t v5;
  __int128 v6;
  uint64_t battLevelSingle;
  _BOOL4 untethered;
  void *v9;
  void *v10;
  _BOOL8 v11;
  unsigned int *p_battIsChargingSingle;
  void *v13;
  void *v14;
  id v15;

  p_status = &self->status;
  v5 = *(_QWORD *)&a3->var8;
  v6 = *(_OWORD *)&a3->var4;
  *(_OWORD *)&self->status.battLevelSingle = *(_OWORD *)&a3->var0;
  *(_OWORD *)&self->status.battLevelLeft = v6;
  *(_QWORD *)&self->status.battLevelCombined = v5;
  if (self->untethered)
    battLevelSingle = (self->status.battLevelRight + self->status.battLevelLeft) >> 1;
  else
    battLevelSingle = p_status->battLevelSingle;
  -[HPSBatteryGroupView setChargePercent:](self->deviceBatteryLevelSingleView, "setChargePercent:", battLevelSingle);
  untethered = self->untethered;
  -[HPSBatteryGroupView batteryIconView](self->deviceBatteryLevelSingleView, "batteryIconView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (!untethered)
  {
    p_battIsChargingSingle = &p_status->battIsChargingSingle;
LABEL_9:
    v11 = *p_battIsChargingSingle != 0;
    goto LABEL_10;
  }
  if (!p_status->battIsChargingLeft)
  {
    p_battIsChargingSingle = &p_status->battIsChargingRight;
    goto LABEL_9;
  }
  v11 = 1;
LABEL_10:
  objc_msgSend(v9, "setIsCharging:", v11);

  -[HPSBatteryGroupView setChargePercent:](self->deviceBatteryLevelLeftView, "setChargePercent:", p_status->battLevelLeft);
  -[HPSBatteryGroupView batteryIconView](self->deviceBatteryLevelLeftView, "batteryIconView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setIsCharging:", p_status->battIsChargingLeft != 0);

  -[HPSBatteryGroupView setChargePercent:](self->deviceBatteryLevelRightView, "setChargePercent:", p_status->battLevelRight);
  -[HPSBatteryGroupView batteryIconView](self->deviceBatteryLevelRightView, "batteryIconView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setIsCharging:", p_status->battIsChargingRight != 0);

  -[HPSBatteryGroupView setChargePercent:](self->deviceBatteryLevelCaseView, "setChargePercent:", p_status->battLevelCase);
  -[HPSBatteryGroupView batteryIconView](self->deviceBatteryLevelCaseView, "batteryIconView");
  v15 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setIsCharging:", p_status->battIsChargingCase != 0);

}

- (BOOL)untethered
{
  return self->untethered;
}

- (HPSBatteryStatusView)initWithFrame:(CGRect)a3 device:(id)a4 darkMode:(BOOL)a5
{
  double height;
  double width;
  double y;
  double x;
  id v12;
  HPSBatteryStatusView *v13;
  HPSBatteryStatusView *v14;
  id *p_currentDevice;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  HPSEngravingService *v22;
  HPSEngravingService *engravingService;
  HPSEngravingService *v24;
  UIImageView *deviceImageView;
  UIImageView *caseImageView;
  UIImageView *leftImageView;
  UIImageView *rightImageView;
  _QWORD v30[4];
  HPSBatteryStatusView *v31;
  objc_super v32;
  uint8_t buf[4];
  void *v34;
  uint64_t v35;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v35 = *MEMORY[0x1E0C80C00];
  v12 = a4;
  v32.receiver = self;
  v32.super_class = (Class)HPSBatteryStatusView;
  v13 = -[HPSBatteryStatusView initWithFrame:](&v32, sel_initWithFrame_, x, y, width, height);
  v14 = v13;
  if (v13)
  {
    p_currentDevice = (id *)&v13->currentDevice;
    objc_storeStrong((id *)&v13->currentDevice, a4);
    sharedBluetoothSettingsLogComponent();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*p_currentDevice, "classicDevice");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "address");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v34 = v18;
      _os_log_impl(&dword_1DB30C000, v16, OS_LOG_TYPE_DEFAULT, "Battery Status: Classic device address %@", buf, 0xCu);

    }
    objc_msgSend(*p_currentDevice, "classicDevice");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v19, "productId") == 8212)
    {

    }
    else
    {
      objc_msgSend(*p_currentDevice, "classicDevice");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v20, "productId");

      if (v21 != 8228)
      {
LABEL_8:
        v14->darkMode = a5;
        deviceImageView = v14->deviceImageView;
        v14->deviceImageView = 0;

        caseImageView = v14->caseImageView;
        v14->caseImageView = 0;

        leftImageView = v14->leftImageView;
        v14->leftImageView = 0;

        rightImageView = v14->rightImageView;
        v14->rightImageView = 0;

        -[HPSBatteryStatusView getBatteryStatus](v14, "getBatteryStatus");
        -[HPSBatteryStatusView setupViews](v14, "setupViews");
        v14->deviceColor = 0;
        goto LABEL_9;
      }
    }
    v22 = -[HPSEngravingService initWithDevice:]([HPSEngravingService alloc], "initWithDevice:", *p_currentDevice);
    engravingService = v14->engravingService;
    v14->engravingService = v22;

    v24 = v14->engravingService;
    v30[0] = MEMORY[0x1E0C809B0];
    v30[1] = 3221225472;
    v30[2] = __54__HPSBatteryStatusView_initWithFrame_device_darkMode___block_invoke;
    v30[3] = &unk_1EA29B860;
    v31 = v14;
    -[HPSEngravingService getEngravedCaseView:](v24, "getEngravedCaseView:", v30);

    goto LABEL_8;
  }
LABEL_9:

  return v14;
}

void __54__HPSBatteryStatusView_initWithFrame_device_darkMode___block_invoke(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 520), a2);
  v4 = a2;
  objc_msgSend(*(id *)(a1 + 32), "setupViews");
  objc_msgSend(*(id *)(a1 + 32), "setNeedsLayout");
  objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded");

}

- (void)getBatteryStatus
{
  void *v3;
  NSObject *v4;
  int battLevelSingle;
  int battLevelRight;
  int battLevelLeft;
  int battLevelCase;
  int battLevelCombined;
  NSString *v10;
  NSString *productIdString;
  void *v12;
  __int16 v13;
  void *v14;
  _DWORD v15[2];
  __int16 v16;
  int v17;
  __int16 v18;
  int v19;
  __int16 v20;
  int v21;
  __int16 v22;
  int v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  -[BluetoothDeviceProtocol classicDevice](self->currentDevice, "classicDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "batteryStatus:", &self->status);

  sharedBluetoothSettingsLogComponent();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    battLevelSingle = self->status.battLevelSingle;
    battLevelRight = self->status.battLevelRight;
    battLevelLeft = self->status.battLevelLeft;
    battLevelCase = self->status.battLevelCase;
    battLevelCombined = self->status.battLevelCombined;
    v15[0] = 67110144;
    v15[1] = battLevelSingle;
    v16 = 1024;
    v17 = battLevelRight;
    v18 = 1024;
    v19 = battLevelLeft;
    v20 = 1024;
    v21 = battLevelCase;
    v22 = 1024;
    v23 = battLevelCombined;
    _os_log_impl(&dword_1DB30C000, v4, OS_LOG_TYPE_DEFAULT, "Battery Status: battLevelSingle %d, battLevelRight %d, battLevelLeft %d, battLevelCase %d, battLevelCombined %d", (uint8_t *)v15, 0x20u);
  }

  -[HPSBatteryStatusView getProductIDString](self, "getProductIDString");
  v10 = (NSString *)objc_claimAutoreleasedReturnValue();
  productIdString = self->productIdString;
  self->productIdString = v10;

  -[BluetoothDeviceProtocol classicDevice](self->currentDevice, "classicDevice");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "accessorySettingFeatureBitMask");

  self->untethered = (v13 & 0x400) != 0;
  -[BluetoothDeviceProtocol classicDevice](self->currentDevice, "classicDevice");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v12) = +[HPSProductUtils isBeatsNonWx:](HPSProductUtils, "isBeatsNonWx:", v14);

  if ((_DWORD)v12)
    self->untethered = 1;
}

- (void)applyFiltersForMode:(BOOL)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  UIImageView *caseImageView;
  HPSBatteryStatusView *v8;
  void *v9;

  self->darkMode = a3;
  -[BluetoothDeviceProtocol classicDevice](self->currentDevice, "classicDevice");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "productId");

  -[HPSBatteryStatusView getAssetsDictionary:](self, "getAssetsDictionary:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->untethered)
  {
    if (self->caseImageView)
    {
      if (self->leftImageView)
      {
        if (self->rightImageView)
        {
          v9 = v6;
          -[HPSBatteryStatusView applyFilters:imageView:](self, "applyFilters:imageView:", v6);
          -[HPSBatteryStatusView applyFilters:imageView:](self, "applyFilters:imageView:", v9, self->rightImageView);
          v6 = v9;
          if (!self->caseEngravingView)
          {
            caseImageView = self->caseImageView;
            v8 = self;
LABEL_9:
            -[HPSBatteryStatusView applyFilters:imageView:](v8, "applyFilters:imageView:", v9, caseImageView);
            v6 = v9;
          }
        }
      }
    }
  }
  else
  {
    caseImageView = self->deviceImageView;
    if (caseImageView)
    {
      v8 = self;
      v9 = v6;
      goto LABEL_9;
    }
  }

}

- (void)applyFilters:(id)a3 imageView:(id)a4
{
  id v6;
  objc_class *v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  _BOOL4 darkMode;
  _BOOL4 v15;
  __CFString *v16;
  __CFString *v17;
  void *v18;
  float v19;
  float v20;
  void *v21;
  float v22;
  float v23;
  const __CFString *v24;
  void *v25;
  float v26;
  void *v27;
  float v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  float v32;
  void *v33;
  float v34;
  void *v35;
  double v36;
  void *v37;
  void *v38;
  const __CFString *v39;
  id v40;
  float v41;
  __int128 v42;
  int v43;
  float v44;
  __int128 v45;
  int v46;
  float v47;
  _BYTE v48[28];
  _OWORD v49[2];
  __int128 v50;
  int v51;
  __int128 v52;
  int v53;

  v6 = a3;
  v7 = (objc_class *)MEMORY[0x1E0CD2780];
  v8 = a4;
  v9 = [v7 alloc];
  v10 = (void *)objc_msgSend(v9, "initWithType:", *MEMORY[0x1E0CD2BF0]);
  v11 = objc_alloc(MEMORY[0x1E0CD2780]);
  v12 = (void *)objc_msgSend(v11, "initWithType:", *MEMORY[0x1E0CD2B90]);
  v13 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v52 = *(_OWORD *)(MEMORY[0x1E0CD2338] + 4);
  v53 = *(_DWORD *)(MEMORY[0x1E0CD2338] + 20);
  v50 = *(_OWORD *)(MEMORY[0x1E0CD2338] + 28);
  v51 = *(_DWORD *)(MEMORY[0x1E0CD2338] + 44);
  v49[0] = *(_OWORD *)(MEMORY[0x1E0CD2338] + 52);
  *(_OWORD *)((char *)v49 + 12) = *(_OWORD *)(MEMORY[0x1E0CD2338] + 64);
  darkMode = self->darkMode;
  v15 = -[HPSBatteryStatusView isProductOfDifferentColors](self, "isProductOfDifferentColors");
  if (darkMode)
  {
    if (v15)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("DarkMatrixValue-%d"), self->deviceColor);
      v16 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v16 = CFSTR("DarkMatrixValue");
    }
    if (-[HPSBatteryStatusView isProductOfDifferentColors](self, "isProductOfDifferentColors"))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("DarkBiasValue-%d"), self->deviceColor);
      v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v17 = CFSTR("DarkBiasValue");
    }
    objc_msgSend(v6, "objectForKey:", v16);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "floatValue");
    v20 = v19;

    objc_msgSend(v6, "objectForKey:", v17);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "floatValue");
    v23 = v22;

    if ((v23 == 0.0 || v20 == 0.0)
      && -[HPSBatteryStatusView isProductOfDifferentColors](self, "isProductOfDifferentColors"))
    {
      v39 = CFSTR("DarkBiasValue-%d");
      v40 = v8;
      v24 = CFSTR("DarkMatrixValue-%d");
LABEL_22:
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", v24, -[HPSBatteryStatusView defaultFiltersID](self, "defaultFiltersID"));
      v29 = objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", v39, -[HPSBatteryStatusView defaultFiltersID](self, "defaultFiltersID"));
      v30 = objc_claimAutoreleasedReturnValue();

      objc_msgSend(v6, "objectForKey:", v29);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "floatValue");
      v20 = v32;

      objc_msgSend(v6, "objectForKey:", v30);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "floatValue");
      v23 = v34;

      v16 = (__CFString *)v29;
      v17 = (__CFString *)v30;
      v8 = v40;
    }
  }
  else
  {
    if (v15)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("LightMatrixValue-%d"), self->deviceColor);
      v16 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v16 = CFSTR("LightMatrixValue");
    }
    if (-[HPSBatteryStatusView isProductOfDifferentColors](self, "isProductOfDifferentColors"))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("LightBiasValue-%d"), self->deviceColor);
      v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v17 = CFSTR("LightBiasValue");
    }
    objc_msgSend(v6, "objectForKey:", v16);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "floatValue");
    v20 = v26;

    objc_msgSend(v6, "objectForKey:", v17);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "floatValue");
    v23 = v28;

    if ((v23 == 0.0 || v20 == 0.0)
      && -[HPSBatteryStatusView isProductOfDifferentColors](self, "isProductOfDifferentColors"))
    {
      v39 = CFSTR("LightBiasValue-%d");
      v40 = v8;
      v24 = CFSTR("LightMatrixValue-%d");
      goto LABEL_22;
    }
  }
  v41 = v20;
  v42 = v52;
  v43 = v53;
  v44 = v20;
  v45 = v50;
  v46 = v51;
  v47 = v20;
  *(_OWORD *)v48 = v49[0];
  *(_OWORD *)&v48[12] = *(_OWORD *)((char *)v49 + 12);
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCAColorMatrix:", &v41);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setValue:forKey:", v35, CFSTR("inputColorMatrix"));

  *(float *)&v36 = v23;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v36);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setValue:forKey:", v37, CFSTR("inputAmount"));

  objc_msgSend(v13, "addObject:", v10);
  objc_msgSend(v13, "addObject:", v12);
  objc_msgSend(v8, "layer");
  v38 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v38, "setFilters:", v13);
}

- (id)getDeviceCaseIcon:(unsigned int)a3
{
  void *v4;
  const __CFString *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  void **v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  void *v24;
  void *v26;
  void *v27;
  void *v28;
  _QWORD v29[2];
  CGSize v30;

  v4 = 0;
  v29[1] = *MEMORY[0x1E0C80C00];
  switch(a3)
  {
    case 0x200Bu:
    case 0x201Du:
      v5 = CFSTR("beats.powerbeatspro.chargingcase.fill");
      goto LABEL_11;
    case 0x200Cu:
    case 0x200Du:
    case 0x2010u:
    case 0x2015u:
    case 0x2017u:
    case 0x2018u:
    case 0x2019u:
    case 0x201Au:
    case 0x201Bu:
    case 0x201Cu:
      return v4;
    case 0x200Eu:
    case 0x2014u:
      goto LABEL_5;
    case 0x200Fu:
      v5 = CFSTR("airpods.chargingcase.wireless.fill");
      goto LABEL_11;
    case 0x2011u:
    case 0x2016u:
      v5 = CFSTR("beats.studiobuds.chargingcase.fill");
      goto LABEL_11;
    case 0x2012u:
      v5 = CFSTR("beats.fit.pro.chargingcase.fill");
      goto LABEL_11;
    case 0x2013u:
      v5 = CFSTR("airpods.gen3.chargingcase.wireless.fill");
      goto LABEL_11;
    default:
      if (a3 == 8194)
      {
        v5 = CFSTR("airpods.chargingcase.fill");
      }
      else
      {
        if (a3 != 8228)
          return v4;
LABEL_5:
        v5 = CFSTR("airpodspro.chargingcase.wireless.fill");
      }
LABEL_11:
      v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D3A7E8]), "initWithSymbolName:bundleURL:", v5, 0);
      v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D3A7A0]), "initWithSystemColor:", 12);
      v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D3A7A0]), "initWithSystemColor:", 11);
      v9 = objc_alloc(MEMORY[0x1E0D3A7A0]);
      objc_msgSend(MEMORY[0x1E0DC3658], "secondarySystemBackgroundColor");
      v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v11 = (void *)objc_msgSend(v9, "initWithCGColor:", objc_msgSend(v10, "CGColor"));

      v12 = objc_alloc_init(MEMORY[0x1E0D3A7A8]);
      if (self->darkMode)
      {
        v29[0] = v8;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v29, 1);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setSymbolColors:", v13);

        v28 = v7;
        v14 = &v28;
      }
      else
      {
        v27 = v7;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v27, 1);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setSymbolColors:", v15);

        v26 = v11;
        v14 = &v26;
      }
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 1);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setEnclosureColors:", v16);

      objc_msgSend(v12, "setRenderingMode:", 3);
      objc_msgSend(v6, "imageForGraphicSymbolDescriptor:", v12);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "CGImage");
      PSBlankIconImage();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "size");
      v21 = v20;
      v23 = v22;

      objc_msgSend(MEMORY[0x1E0DC3870], "imageWithCGImage:", v18);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v30.width = v21;
      v30.height = v23;
      UIGraphicsBeginImageContextWithOptions(v30, 0, 0.0);
      objc_msgSend(v24, "drawInRect:", 0.0, 0.0, v21, v23);
      UIGraphicsGetImageFromCurrentImageContext();
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      UIGraphicsEndImageContext();

      return v4;
  }
}

- (id)getAssetsDictionary:(unsigned int)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  void *v12;
  void *v13;
  double v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  double v21;
  void *v22;
  void *v23;
  void *v24;
  double v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  double v32;
  void *v33;
  void *v34;
  double v35;
  void *v36;
  double v37;
  void *v38;
  double v39;
  void *v40;
  double v41;
  void *v42;
  double v43;
  void *v44;
  double v45;
  void *v46;
  double v47;
  void *v48;
  double v49;
  void *v50;
  double v51;
  void *v52;
  double v53;
  void *v54;
  double v55;
  void *v56;
  double v57;
  void *v58;
  double v59;
  void *v60;
  double v61;
  void *v62;
  double v63;
  void *v64;
  double v65;
  void *v66;
  double v67;
  void *v68;
  double v69;
  void *v70;
  double v71;
  void *v72;
  double v73;
  void *v74;
  double v75;
  void *v76;
  double v77;
  void *v78;
  double v79;
  void *v80;
  double v81;
  void *v82;
  double v83;
  void *v84;
  double v85;
  void *v86;
  double v87;
  void *v88;
  double v89;
  void *v90;
  double v91;
  void *v92;
  double v93;
  void *v94;
  double v95;
  void *v96;
  double v97;
  void *v98;
  double v99;
  void *v100;
  double v101;
  void *v102;
  double v103;
  void *v104;
  double v105;
  void *v106;
  double v107;
  void *v108;
  double v109;
  void *v110;
  double v111;
  void *v112;
  double v113;
  void *v114;
  double v115;
  void *v116;
  double v117;
  void *v118;
  double v119;
  void *v120;
  double v121;
  void *v122;
  double v123;
  void *v124;
  double v125;
  void *v126;
  double v127;
  void *v128;
  double v129;
  void *v130;
  double v131;
  void *v132;
  double v133;
  void *v134;
  double v135;
  void *v136;
  double v137;
  void *v138;
  double v139;
  void *v140;
  double v141;
  void *v142;
  double v143;
  void *v144;
  double v145;
  void *v146;
  double v147;
  void *v148;
  double v149;
  void *v150;
  double v151;
  void *v152;
  double v153;
  void *v154;
  double v155;
  void *v156;
  const __CFString *v157;
  void *v158;
  double v159;
  void *v160;
  double v161;
  void *v162;
  double v163;
  void *v164;
  double v165;
  void *v166;
  double v167;
  void *v168;
  double v169;
  void *v170;
  double v171;
  void *v172;
  double v173;
  void *v174;
  double v175;
  void *v176;
  double v177;
  void *v178;
  double v179;
  void *v180;
  double v181;
  void *v182;
  double v183;
  void *v184;
  double v185;
  void *v186;
  double v187;
  void *v188;
  double v189;
  void *v190;
  double v191;
  void *v192;
  double v193;
  void *v194;
  double v195;
  void *v196;
  double v197;
  void *v198;
  double v199;
  void *v200;
  double v201;
  void *v202;
  double v203;
  void *v204;
  double v205;
  void *v206;
  double v207;
  void *v208;
  double v209;
  void *v210;
  double v211;
  void *v212;
  double v213;
  void *v214;
  double v215;
  void *v216;
  double v217;
  void *v218;
  double v219;
  void *v220;
  double v221;
  void *v222;
  double v223;
  void *v224;
  double v225;
  void *v226;
  double v227;
  void *v228;
  double v229;
  void *v230;
  double v231;
  void *v232;
  double v233;
  void *v234;
  double v235;
  void *v236;
  double v237;
  void *v238;
  double v239;
  void *v240;
  double v241;
  void *v242;
  double v243;
  void *v244;
  double v245;
  void *v246;
  double v247;
  void *v248;
  double v249;
  void *v250;
  double v251;
  void *v252;
  double v253;
  void *v254;
  double v255;
  void *v256;
  double v257;
  void *v258;
  double v259;
  void *v260;
  double v261;
  void *v262;
  double v263;
  void *v264;
  double v265;
  void *v266;
  double v267;
  void *v268;
  double v269;
  void *v270;
  double v271;
  void *v272;
  double v273;
  void *v274;
  double v275;
  void *v276;
  double v277;
  void *v278;
  double v279;
  void *v280;
  double v281;
  void *v282;
  double v283;
  void *v284;
  double v285;
  void *v286;
  double v287;
  void *v288;
  double v289;
  void *v290;
  double v291;
  void *v292;
  double v293;
  void *v294;
  double v295;
  void *v296;
  double v297;
  void *v298;
  double v299;
  void *v300;
  double v301;
  void *v302;
  double v303;
  void *v304;
  double v305;
  void *v306;
  double v307;
  void *v308;
  double v309;
  void *v310;
  double v311;
  void *v312;
  double v313;
  void *v314;
  double v315;
  void *v316;
  double v317;
  void *v318;
  double v319;
  void *v320;
  double v321;
  void *v322;
  double v323;
  void *v324;
  double v325;
  void *v326;
  double v327;
  void *v328;
  double v329;
  void *v330;
  double v331;
  void *v332;
  double v333;
  void *v334;
  double v335;
  void *v336;
  double v337;
  void *v338;
  double v339;
  void *v340;
  double v341;
  void *v342;
  double v343;
  void *v344;
  double v345;
  void *v346;
  double v347;
  void *v348;
  double v349;
  void *v350;
  double v351;
  void *v352;
  double v353;
  void *v354;
  double v355;
  void *v356;
  double v357;
  void *v358;
  double v359;
  void *v360;
  double v361;
  void *v362;
  double v363;
  void *v364;
  double v365;
  void *v366;
  double v367;
  void *v368;
  double v369;
  void *v370;
  double v371;
  void *v372;
  double v373;
  void *v374;
  double v375;
  void *v376;
  double v377;
  void *v378;
  double v379;
  void *v380;
  double v381;
  void *v382;
  double v383;
  void *v384;
  double v385;
  void *v386;
  double v387;
  void *v388;
  double v389;
  void *v390;
  double v391;
  void *v392;
  double v393;
  void *v394;
  double v395;
  void *v396;
  double v397;
  void *v398;
  double v399;
  void *v400;
  double v401;
  void *v402;
  double v403;
  void *v404;
  double v405;
  void *v406;
  double v407;
  void *v408;
  double v409;
  void *v410;
  double v411;
  void *v412;
  double v413;
  void *v414;
  double v415;
  void *v416;
  double v417;
  void *v418;
  double v419;
  void *v420;
  double v421;
  void *v422;
  double v423;
  void *v424;
  double v425;
  void *v426;
  double v427;
  void *v428;
  double v429;
  void *v430;
  double v431;
  void *v432;
  double v433;
  void *v434;
  double v435;
  void *v436;
  double v437;
  void *v438;
  double v439;
  void *v440;
  double v441;
  void *v442;
  double v443;
  void *v444;
  double v445;
  void *v446;
  double v447;
  void *v448;
  double v449;
  void *v450;
  double v451;
  void *v452;
  double v453;
  void *v454;
  double v455;
  void *v456;
  double v457;
  void *v458;
  double v459;
  void *v460;
  double v461;
  void *v462;
  double v463;
  void *v464;
  double v465;
  void *v466;
  double v467;
  void *v468;
  double v469;
  void *v470;
  double v471;
  void *v472;
  double v473;
  void *v474;
  double v475;
  void *v476;
  double v477;
  void *v478;
  double v479;
  void *v480;
  double v481;
  void *v482;
  double v483;
  void *v484;
  double v485;
  void *v486;
  double v487;
  void *v488;
  double v489;
  void *v490;
  double v491;
  void *v492;
  double v493;
  void *v494;
  double v495;
  void *v496;
  double v497;
  void *v498;
  double v499;
  void *v500;
  double v501;
  void *v502;
  double v503;
  void *v504;
  double v505;
  void *v506;
  double v507;
  void *v508;
  double v509;
  void *v510;
  double v511;
  void *v512;
  double v513;
  void *v514;
  double v515;
  void *v516;
  double v517;
  void *v518;
  double v519;
  void *v520;
  double v521;
  void *v522;
  double v523;
  void *v524;
  double v525;
  void *v526;
  double v527;
  void *v528;
  double v529;
  void *v530;
  double v531;
  void *v532;
  double v533;
  void *v534;
  double v535;
  void *v536;
  double v537;
  void *v538;
  double v539;
  void *v540;
  double v541;
  void *v542;
  double v543;
  void *v544;
  double v545;
  void *v546;
  double v547;
  void *v548;
  double v549;
  void *v550;
  double v551;
  void *v552;
  double v553;
  void *v554;
  double v555;
  void *v556;
  double v557;
  void *v558;
  void *v559;
  void *v560;
  void *v561;
  void *v562;
  void *v563;
  double v564;
  void *v565;
  double v566;
  void *v567;
  double v568;
  void *v569;
  double v570;
  void *v571;
  double v572;
  void *v573;
  double v574;
  void *v575;
  double v576;
  void *v577;
  double v578;
  void *v579;
  double v580;
  void *v581;
  double v582;
  void *v583;
  double v584;
  void *v585;
  double v586;
  void *v587;
  double v588;
  void *v589;
  double v590;
  void *v591;
  double v592;
  void *v593;
  double v594;
  void *v595;
  double v596;
  void *v597;
  double v598;
  void *v599;
  double v600;
  void *v601;
  double v602;
  void *v603;
  double v604;
  void *v605;
  double v606;
  void *v607;
  double v608;
  void *v609;
  double v610;
  void *v611;
  double v612;
  void *v613;
  double v614;
  void *v615;
  double v616;
  void *v617;
  double v618;
  void *v619;
  double v620;
  void *v621;
  double v622;
  void *v623;
  double v624;
  void *v625;
  double v626;
  void *v627;
  double v628;
  void *v629;
  double v630;
  void *v631;
  double v632;
  void *v633;
  double v634;
  void *v635;
  double v636;
  void *v637;
  double v638;
  void *v639;
  double v640;
  void *v641;
  double v642;
  void *v643;
  double v644;
  void *v645;
  double v646;
  void *v647;
  double v648;
  void *v649;
  double v650;
  void *v651;
  double v652;
  void *v653;
  double v654;
  void *v655;
  double v656;
  void *v657;
  double v658;
  void *v659;
  double v660;
  void *v661;
  double v662;
  void *v663;
  double v664;
  void *v665;
  double v666;
  void *v667;
  double v668;
  void *v669;
  double v670;
  void *v671;
  double v672;
  void *v673;
  double v674;
  void *v675;
  double v676;
  void *v677;
  double v678;
  void *v679;
  double v680;
  void *v681;
  double v682;
  void *v683;
  double v684;
  void *v685;
  double v686;
  void *v687;
  double v688;
  void *v689;
  double v690;
  void *v691;
  double v692;
  void *v693;
  double v694;
  void *v695;
  double v696;
  void *v697;
  double v698;
  void *v699;
  void *v700;
  void *v701;
  void *v702;
  void *v703;
  void *v704;
  double v705;
  void *v706;
  void *v707;
  void *v708;
  double v709;
  void *v710;
  double v711;
  void *v712;
  double v713;
  void *v714;
  double v715;
  void *v716;
  double v717;
  void *v718;
  double v719;
  void *v720;
  double v721;
  void *v722;
  double v723;
  void *v724;
  double v725;
  void *v726;
  double v727;
  void *v728;
  double v729;
  void *v730;
  double v731;
  void *v732;
  double v733;
  void *v734;
  double v735;
  void *v736;
  double v737;
  void *v738;
  double v739;
  void *v740;
  void *v741;
  void *v742;
  void *v743;
  void *v744;
  void *v745;
  double v746;
  void *v747;
  double v748;
  void *v749;
  double v750;
  void *v751;
  double v752;
  void *v753;
  double v754;
  void *v755;
  double v756;
  void *v757;
  double v758;
  void *v759;
  double v760;
  void *v761;
  double v762;
  void *v763;
  double v764;
  void *v765;
  double v766;
  void *v767;
  double v768;
  void *v769;
  double v770;
  void *v771;
  double v772;
  void *v773;
  double v774;
  void *v775;
  double v776;
  void *v777;
  double v778;
  void *v779;
  double v780;
  void *v781;
  double v782;
  void *v783;
  double v784;
  void *v785;
  double v786;
  void *v787;
  double v788;
  void *v789;
  double v790;
  void *v791;
  double v792;
  void *v793;
  void *v794;
  void *v795;
  void *v796;
  void *v797;
  void *v798;
  double v799;
  void *v800;
  double v801;
  void *v802;
  double v803;
  void *v804;
  double v805;
  void *v806;
  double v807;
  void *v808;
  double v809;
  void *v810;
  double v811;
  void *v812;
  double v813;
  void *v814;
  double v815;
  void *v816;
  double v817;
  void *v818;
  double v819;
  void *v820;
  double v821;
  void *v822;
  double v823;
  void *v824;
  double v825;
  void *v826;
  double v827;
  void *v828;
  double v829;
  void *v830;
  double v831;
  void *v832;
  double v833;
  void *v834;
  double v835;
  void *v836;
  double v837;
  void *v838;
  double v839;
  void *v840;
  double v841;
  void *v842;
  double v843;
  void *v844;
  double v845;
  void *v846;
  double v847;
  void *v848;
  double v849;
  void *v850;
  double v851;
  void *v852;
  double v853;
  void *v854;
  double v855;
  void *v856;
  double v857;
  void *v858;
  double v859;
  void *v860;
  double v861;
  void *v862;
  double v863;
  void *v864;
  double v865;
  void *v866;
  double v867;
  void *v868;
  double v869;
  void *v870;
  double v871;
  void *v872;
  double v873;
  void *v874;
  double v875;
  void *v876;
  void *v877;
  double v878;
  void *v879;
  void *v880;
  void *v881;
  void *v882;
  void *v883;
  void *v884;
  double v885;
  void *v886;
  double v887;
  void *v888;
  void *v889;
  double v890;
  void *v892;
  void *v893;
  void *v894;
  void *v895;
  void *v896;
  void *v897;
  double v898;
  void *v899;
  double v900;
  void *v901;
  double v902;
  void *v903;
  double v904;
  void *v905;
  double v906;
  void *v907;
  double v908;
  void *v909;
  double v910;
  void *v911;
  double v912;
  void *v913;
  double v914;
  void *v915;
  double v916;
  void *v917;
  double v918;
  void *v919;
  double v920;
  void *v921;
  double v922;
  void *v923;
  double v924;
  void *v925;
  double v926;
  void *v927;
  double v928;
  void *v929;
  double v930;
  void *v931;
  double v932;
  void *v933;
  double v934;
  void *v935;
  void *v936;
  double v937;
  void *v938;
  double v939;
  void *v940;
  double v941;
  void *v942;
  double v943;
  void *v944;
  double v945;
  void *v946;
  double v947;
  void *v948;
  double v949;
  void *v950;
  double v951;
  void *v952;
  double v953;
  void *v954;
  double v955;
  void *v956;
  double v957;
  void *v958;
  double v959;
  void *v960;
  double v961;
  void *v962;
  double v963;
  void *v964;
  double v965;
  void *v966;
  double v967;
  void *v968;
  double v969;
  void *v970;
  double v971;
  void *v972;
  double v973;
  void *v974;
  double v975;
  void *v976;
  double v977;
  void *v978;
  double v979;
  void *v980;
  double v981;
  void *v982;
  double v983;
  void *v984;
  double v985;
  void *v986;
  double v987;
  void *v988;
  double v989;
  void *v990;
  double v991;
  void *v992;
  void *v993;
  double v994;
  void *v995;
  double v996;
  void *v997;
  double v998;
  void *v999;
  double v1000;
  void *v1001;
  double v1002;
  void *v1003;
  double v1004;
  void *v1005;
  double v1006;
  void *v1007;
  double v1008;
  void *v1009;
  double v1010;
  void *v1011;
  double v1012;
  void *v1013;
  double v1014;
  void *v1015;
  double v1016;
  void *v1017;
  void *v1018;
  void *v1019;
  void *v1020;
  void *v1021;
  void *v1022;
  double v1023;
  void *v1024;
  double v1025;
  void *v1026;
  double v1027;
  void *v1028;
  double v1029;
  void *v1030;
  double v1031;
  void *v1032;
  double v1033;
  void *v1034;
  double v1035;
  void *v1036;
  double v1037;
  void *v1038;
  double v1039;
  void *v1040;
  double v1041;
  void *v1042;
  double v1043;
  void *v1044;
  double v1045;
  void *v1046;
  double v1047;
  void *v1048;
  double v1049;
  void *v1050;
  double v1051;
  void *v1052;
  void *v1053;
  double v1054;
  void *v1055;
  double v1056;
  void *v1057;
  double v1058;
  void *v1059;
  double v1060;
  void *v1061;
  double v1062;
  void *v1063;
  double v1064;
  void *v1065;
  double v1066;
  void *v1067;
  double v1068;
  void *v1069;
  double v1070;
  void *v1071;
  double v1072;
  void *v1073;
  double v1074;
  void *v1075;
  double v1076;
  void *v1077;
  double v1078;
  void *v1079;
  double v1080;
  void *v1081;
  double v1082;
  void *v1083;
  double v1084;
  void *v1085;
  double v1086;
  void *v1087;
  double v1088;
  void *v1089;
  double v1090;
  void *v1091;
  double v1092;
  void *v1093;
  void *v1094;
  double v1095;
  void *v1096;
  double v1097;
  void *v1098;
  double v1099;
  void *v1100;
  double v1101;
  void *v1102;
  double v1103;
  void *v1104;
  double v1105;
  void *v1106;
  double v1107;
  void *v1108;
  double v1109;
  void *v1110;
  double v1111;
  void *v1112;
  double v1113;
  void *v1114;
  double v1115;
  void *v1116;
  double v1117;
  void *v1118;
  double v1119;
  void *v1120;
  double v1121;
  void *v1122;
  double v1123;
  void *v1124;
  double v1125;
  void *v1126;
  double v1127;
  void *v1128;
  double v1129;
  void *v1130;
  double v1131;
  void *v1132;
  double v1133;
  void *v1134;
  double v1135;
  void *v1136;
  double v1137;
  void *v1138;
  double v1139;
  void *v1140;
  double v1141;
  void *v1142;
  const __CFString *v1143;
  void *v1144;
  void *v1145;
  void *v1146;
  double v1147;
  void *v1148;
  double v1149;
  void *v1150;
  double v1151;
  void *v1152;
  double v1153;
  void *v1154;
  double v1155;
  void *v1156;
  double v1157;
  void *v1158;
  double v1159;
  void *v1160;
  double v1161;
  void *v1162;
  double v1163;
  void *v1164;
  double v1165;
  void *v1166;
  double v1167;
  void *v1168;
  double v1169;

  v4 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  switch(a3)
  {
    case 0x2002u:
    case 0x200Fu:
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 85);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v15, CFSTR("BudHeight"));

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 3);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v16, CFSTR("UnifiedSpacingBetweenBuds"));

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 30);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v17, CFSTR("SeparateSpacingBetweenBuds"));

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 108);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v18, CFSTR("CaseHeight"));

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 62);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v19, CFSTR("UnifiedSpacingBudsCase"));

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 35);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v20, CFSTR("SeparateSpacingBudsCase"));

      LODWORD(v21) = 1053609165;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v22, CFSTR("DarkBiasValue"));

      v13 = (void *)MEMORY[0x1E0CB37E8];
      LODWORD(v14) = 1065772646;
      goto LABEL_4;
    case 0x2003u:
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 108);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v36, CFSTR("BudHeight"));

      LODWORD(v37) = 1051931443;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v37);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v38, CFSTR("DarkBiasValue-0"));

      LODWORD(v39) = 1065772646;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v39);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v40, CFSTR("DarkMatrixValue-0"));

      LODWORD(v41) = 0.5;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v41);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v42, CFSTR("LightBiasValue-0"));

      LODWORD(v43) = 1066359849;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v43);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v44, CFSTR("LightMatrixValue-0"));

      LODWORD(v45) = 1044549468;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v45);
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v46, CFSTR("DarkBiasValue-1"));

      LODWORD(v47) = 1065017672;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v47);
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v48, CFSTR("DarkMatrixValue-1"));

      LODWORD(v49) = 0.5;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v49);
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v50, CFSTR("LightBiasValue-1"));

      LODWORD(v51) = 1066695393;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v51);
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v52, CFSTR("LightMatrixValue-1"));

      LODWORD(v53) = 1055286886;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v53);
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v54, CFSTR("DarkBiasValue-11"));

      LODWORD(v55) = 1057300152;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v55);
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v56, CFSTR("DarkMatrixValue-11"));

      LODWORD(v57) = 0.5;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v57);
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v58, CFSTR("LightBiasValue-11"));

      LODWORD(v59) = 1066695393;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v59);
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v60, CFSTR("LightMatrixValue-11"));

      LODWORD(v61) = 1047233823;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v61);
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v62, CFSTR("DarkBiasValue-12"));

      LODWORD(v63) = 1061662228;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v63);
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v64, CFSTR("DarkMatrixValue-12"));

      LODWORD(v65) = 0.5;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v65);
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v66, CFSTR("LightBiasValue-12"));

      LODWORD(v67) = 1066695393;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v67);
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v68, CFSTR("LightMatrixValue-12"));

      LODWORD(v69) = 1047233823;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v69);
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v70, CFSTR("DarkBiasValue-13"));

      LODWORD(v71) = 1061662228;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v71);
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v72, CFSTR("DarkMatrixValue-13"));

      LODWORD(v73) = 0.5;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v73);
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v74, CFSTR("LightBiasValue-13"));

      LODWORD(v75) = 1066695393;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v75);
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v76, CFSTR("LightMatrixValue-13"));

      LODWORD(v77) = 1055286886;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v77);
      v78 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v78, CFSTR("DarkBiasValue-18"));

      LODWORD(v79) = 1059816735;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v79);
      v80 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v80, CFSTR("DarkMatrixValue-18"));

      LODWORD(v81) = 0.5;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v81);
      v82 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v82, CFSTR("LightBiasValue-18"));

      LODWORD(v83) = 1066695393;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v83);
      v84 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v84, CFSTR("LightMatrixValue-18"));

      LODWORD(v85) = 1056629064;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v85);
      v86 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v86, CFSTR("DarkBiasValue-19"));

      LODWORD(v87) = 1058306785;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v87);
      v88 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v88, CFSTR("DarkMatrixValue-19"));

      LODWORD(v89) = 0.5;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v89);
      v90 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v90, CFSTR("LightBiasValue-19"));

      LODWORD(v91) = 1066695393;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v91);
      v92 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v92, CFSTR("LightMatrixValue-19"));

      LODWORD(v93) = 1056293519;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v93);
      v94 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v94, CFSTR("DarkBiasValue-20"));

      LODWORD(v95) = 1060320051;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v95);
      v96 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v96, CFSTR("DarkMatrixValue-20"));

      LODWORD(v97) = 0.5;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v97);
      v98 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v98, CFSTR("LightBiasValue-20"));

      LODWORD(v99) = 1066695393;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v99);
      v100 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v100, CFSTR("LightMatrixValue-20"));

      LODWORD(v101) = 1056125747;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v101);
      v102 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v102, CFSTR("DarkBiasValue-21"));

      LODWORD(v103) = 1058977874;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v103);
      v104 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v104, CFSTR("DarkMatrixValue-21"));

      LODWORD(v105) = 0.5;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v105);
      v106 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v106, CFSTR("LightBiasValue-21"));

      LODWORD(v107) = 1066695393;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v107);
      v108 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v108, CFSTR("LightMatrixValue-21"));

      LODWORD(v109) = 1055957975;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v109);
      v110 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v110, CFSTR("DarkBiasValue-23"));

      LODWORD(v111) = 1052266988;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v111);
      v112 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v112, CFSTR("DarkMatrixValue-23"));

      LODWORD(v113) = 0.5;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v113);
      v114 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v114, CFSTR("LightBiasValue-23"));

      LODWORD(v115) = 1066695393;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v115);
      v116 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v116, CFSTR("LightMatrixValue-23"));

      LODWORD(v117) = 1058642330;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v117);
      v118 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v118, CFSTR("DarkBiasValue-32"));

      LODWORD(v119) = 1049582633;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v119);
      v120 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v120, CFSTR("DarkMatrixValue-32"));

      LODWORD(v121) = 0.5;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v121);
      v122 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v122, CFSTR("LightBiasValue-32"));

      LODWORD(v123) = 1066695393;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v123);
      v124 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v124, CFSTR("LightMatrixValue-32"));

      LODWORD(v125) = 1052266988;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v125);
      v126 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v126, CFSTR("DarkBiasValue-33"));

      LODWORD(v127) = 1059313418;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v127);
      v128 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v128, CFSTR("DarkMatrixValue-33"));

      LODWORD(v129) = 0.5;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v129);
      v130 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v130, CFSTR("LightBiasValue-33"));

      LODWORD(v131) = 1066695393;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v131);
      v132 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v132, CFSTR("LightMatrixValue-33"));

      LODWORD(v133) = 1056293519;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v133);
      v134 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v134, CFSTR("DarkBiasValue-34"));

      LODWORD(v135) = 0.5;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v135);
      v136 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v136, CFSTR("DarkMatrixValue-34"));

      LODWORD(v137) = 0.5;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v137);
      v138 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v138, CFSTR("LightBiasValue-34"));

      LODWORD(v139) = 1066695393;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v139);
      v140 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v140, CFSTR("LightMatrixValue-34"));

      LODWORD(v141) = 1053609165;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v141);
      v142 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v142, CFSTR("DarkBiasValue-35"));

      LODWORD(v143) = 1058139013;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v143);
      v144 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v144, CFSTR("DarkMatrixValue-35"));

      LODWORD(v145) = 0.5;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v145);
      v146 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v146, CFSTR("LightBiasValue-35"));

      LODWORD(v147) = 1066695393;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v147);
      v148 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v148, CFSTR("LightMatrixValue-35"));

      LODWORD(v149) = 1056293519;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v149);
      v150 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v150, CFSTR("DarkBiasValue-37"));

      LODWORD(v151) = 1054280253;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v151);
      v152 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v152, CFSTR("DarkMatrixValue-37"));

      LODWORD(v153) = 0.5;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v153);
      v154 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v154, CFSTR("LightBiasValue-37"));

      LODWORD(v155) = 1066695393;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v155);
      v156 = (void *)objc_claimAutoreleasedReturnValue();
      v157 = CFSTR("LightMatrixValue-37");
      break;
    case 0x2005u:
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 108);
      v158 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v158, CFSTR("BudHeight"));

      LODWORD(v159) = 1049414861;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v159);
      v160 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v160, CFSTR("DarkBiasValue-0"));

      LODWORD(v161) = 1066192077;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v161);
      v162 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v162, CFSTR("DarkMatrixValue-0"));

      LODWORD(v163) = 0.5;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v163);
      v164 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v164, CFSTR("LightBiasValue-0"));

      LODWORD(v165) = 1066359849;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v165);
      v166 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v166, CFSTR("LightMatrixValue-0"));

      LODWORD(v167) = 1056125747;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v167);
      v168 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v168, CFSTR("DarkBiasValue-1"));

      LODWORD(v169) = 1053944709;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v169);
      v170 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v170, CFSTR("DarkMatrixValue-1"));

      LODWORD(v171) = 0.5;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v171);
      v172 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v172, CFSTR("LightBiasValue-1"));

      LODWORD(v173) = 1066695393;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v173);
      v174 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v174, CFSTR("LightMatrixValue-1"));

      LODWORD(v175) = 1059481190;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v175);
      v176 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v176, CFSTR("DarkBiasValue-3"));

      LODWORD(v177) = 1049582633;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v177);
      v178 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v178, CFSTR("DarkMatrixValue-3"));

      LODWORD(v179) = 0.5;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v179);
      v180 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v180, CFSTR("LightBiasValue-3"));

      LODWORD(v181) = 1066695393;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v181);
      v182 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v182, CFSTR("LightMatrixValue-3"));

      LODWORD(v183) = 1059984507;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v183);
      v184 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v184, CFSTR("DarkBiasValue-5"));

      LODWORD(v185) = 1051931443;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v185);
      v186 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v186, CFSTR("DarkMatrixValue-5"));

      LODWORD(v187) = 0.5;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v187);
      v188 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v188, CFSTR("LightBiasValue-5"));

      LODWORD(v189) = 1066695393;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v189);
      v190 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v190, CFSTR("LightMatrixValue-5"));

      LODWORD(v191) = 1050253722;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v191);
      v192 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v192, CFSTR("DarkBiasValue-27"));

      LODWORD(v193) = 1065520988;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v193);
      v194 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v194, CFSTR("DarkMatrixValue-27"));

      LODWORD(v195) = 0.5;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v195);
      v196 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v196, CFSTR("LightBiasValue-27"));

      LODWORD(v197) = 1066695393;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v197);
      v198 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v198, CFSTR("LightMatrixValue-27"));

      LODWORD(v199) = 1056293519;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v199);
      v200 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v200, CFSTR("DarkBiasValue-29"));

      LODWORD(v201) = 1035489772;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v201);
      v202 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v202, CFSTR("DarkMatrixValue-29"));

      LODWORD(v203) = 0.5;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v203);
      v204 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v204, CFSTR("LightBiasValue-29"));

      LODWORD(v205) = 1066695393;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v205);
      v206 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v206, CFSTR("LightMatrixValue-29"));

      LODWORD(v207) = 1055286886;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v207);
      v208 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v208, CFSTR("DarkBiasValue-37"));

      LODWORD(v209) = 1057132380;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v209);
      v210 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v210, CFSTR("DarkMatrixValue-37"));

      LODWORD(v211) = 0.5;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v211);
      v212 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v212, CFSTR("LightBiasValue-37"));

      LODWORD(v213) = 1066695393;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v213);
      v214 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v214, CFSTR("LightMatrixValue-37"));

      LODWORD(v215) = 1056293519;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v215);
      v216 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v216, CFSTR("DarkBiasValue-65"));

      LODWORD(v217) = 1062836634;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v217);
      v218 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v218, CFSTR("DarkMatrixValue-65"));

      LODWORD(v219) = 0.5;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v219);
      v220 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v220, CFSTR("LightBiasValue-65"));

      LODWORD(v221) = 1066695393;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v221);
      v222 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v222, CFSTR("LightMatrixValue-65"));

      LODWORD(v223) = 1055286886;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v223);
      v224 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v224, CFSTR("DarkBiasValue-73"));

      LODWORD(v225) = 1059816735;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v225);
      v226 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v226, CFSTR("DarkMatrixValue-73"));

      LODWORD(v227) = 0.5;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v227);
      v228 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v228, CFSTR("LightBiasValue-73"));

      LODWORD(v229) = 1066695393;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v229);
      v156 = (void *)objc_claimAutoreleasedReturnValue();
      v157 = CFSTR("LightMatrixValue-73");
      break;
    case 0x2006u:
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 108);
      v230 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v230, CFSTR("BudHeight"));

      LODWORD(v231) = 1051931443;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v231);
      v232 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v232, CFSTR("DarkBiasValue-0"));

      LODWORD(v233) = 1065772646;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v233);
      v234 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v234, CFSTR("DarkMatrixValue-0"));

      LODWORD(v235) = 0.5;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v235);
      v236 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v236, CFSTR("LightBiasValue-0"));

      LODWORD(v237) = 1066695393;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v237);
      v238 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v238, CFSTR("LightMatrixValue-0"));

      LODWORD(v239) = 1058726216;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v239);
      v240 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v240, CFSTR("DarkBiasValue-1"));

      LODWORD(v241) = 1046562734;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v241);
      v242 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v242, CFSTR("DarkMatrixValue-1"));

      LODWORD(v243) = 0.5;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v243);
      v244 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v244, CFSTR("LightBiasValue-1"));

      LODWORD(v245) = 1066695393;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v245);
      v246 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v246, CFSTR("LightMatrixValue-1"));

      LODWORD(v247) = 1056293519;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v247);
      v248 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v248, CFSTR("DarkBiasValue-6"));

      LODWORD(v249) = 1064514355;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v249);
      v250 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v250, CFSTR("DarkMatrixValue-6"));

      LODWORD(v251) = 0.5;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v251);
      v252 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v252, CFSTR("LightBiasValue-6"));

      LODWORD(v253) = 1066695393;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v253);
      v254 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v254, CFSTR("LightMatrixValue-6"));

      LODWORD(v255) = 1054951342;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v255);
      v256 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v256, CFSTR("DarkBiasValue-7"));

      LODWORD(v257) = 1062836634;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v257);
      v258 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v258, CFSTR("DarkMatrixValue-7"));

      LODWORD(v259) = 0.5;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v259);
      v260 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v260, CFSTR("LightBiasValue-7"));

      LODWORD(v261) = 1066695393;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v261);
      v262 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v262, CFSTR("LightMatrixValue-7"));

      LODWORD(v263) = 1055286886;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v263);
      v264 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v264, CFSTR("DarkBiasValue-8"));

      LODWORD(v265) = 1062836634;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v265);
      v266 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v266, CFSTR("DarkMatrixValue-8"));

      LODWORD(v267) = 0.5;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v267);
      v268 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v268, CFSTR("LightBiasValue-8"));

      LODWORD(v269) = 1066695393;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v269);
      v270 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v270, CFSTR("LightMatrixValue-8"));

      LODWORD(v271) = 1059481190;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v271);
      v272 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v272, CFSTR("DarkBiasValue-9"));

      LODWORD(v273) = 1045220557;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v273);
      v274 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v274, CFSTR("DarkMatrixValue-9"));

      LODWORD(v275) = 0.5;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v275);
      v276 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v276, CFSTR("LightBiasValue-9"));

      LODWORD(v277) = 1066695393;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v277);
      v278 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v278, CFSTR("LightMatrixValue-9"));

      LODWORD(v279) = 1055622431;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v279);
      v280 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v280, CFSTR("DarkBiasValue-14"));

      LODWORD(v281) = 0.75;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v281);
      v282 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v282, CFSTR("DarkMatrixValue-14"));

      LODWORD(v283) = 0.5;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v283);
      v284 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v284, CFSTR("LightBiasValue-14"));

      LODWORD(v285) = 1066695393;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v285);
      v286 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v286, CFSTR("LightMatrixValue-14"));

      LODWORD(v287) = 1056293519;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v287);
      v288 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v288, CFSTR("DarkBiasValue-15"));

      LODWORD(v289) = 1061494456;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v289);
      v290 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v290, CFSTR("DarkMatrixValue-15"));

      LODWORD(v291) = 0.5;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v291);
      v292 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v292, CFSTR("LightBiasValue-15"));

      LODWORD(v293) = 1066695393;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v293);
      v294 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v294, CFSTR("LightMatrixValue-15"));

      LODWORD(v295) = 1059145646;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v295);
      v296 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v296, CFSTR("DarkBiasValue-18"));

      LODWORD(v297) = 1052938076;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v297);
      v298 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v298, CFSTR("DarkMatrixValue-18"));

      LODWORD(v299) = 0.5;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v299);
      v300 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v300, CFSTR("LightBiasValue-18"));

      LODWORD(v301) = 1066695393;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v301);
      v302 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v302, CFSTR("LightMatrixValue-18"));

      LODWORD(v303) = 1057132380;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v303);
      v304 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v304, CFSTR("DarkBiasValue-19"));

      LODWORD(v305) = 1059481190;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v305);
      v306 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v306, CFSTR("DarkMatrixValue-19"));

      LODWORD(v307) = 0.5;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v307);
      v308 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v308, CFSTR("LightBiasValue-19"));

      LODWORD(v309) = 1066695393;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v309);
      v310 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v310, CFSTR("LightMatrixValue-19"));

      LODWORD(v311) = 1058810102;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v311);
      v312 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v312, CFSTR("DarkBiasValue-20"));

      LODWORD(v313) = 1051260355;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v313);
      v314 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v314, CFSTR("DarkMatrixValue-20"));

      LODWORD(v315) = 0.5;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v315);
      v316 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v316, CFSTR("LightBiasValue-20"));

      LODWORD(v317) = 1066695393;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v317);
      v318 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v318, CFSTR("LightMatrixValue-20"));

      LODWORD(v319) = 1058977874;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v319);
      v320 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v320, CFSTR("DarkBiasValue-21"));

      LODWORD(v321) = 1050924810;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v321);
      v322 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v322, CFSTR("DarkMatrixValue-21"));

      LODWORD(v323) = 0.5;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v323);
      v324 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v324, CFSTR("LightBiasValue-21"));

      LODWORD(v325) = 1066695393;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v325);
      v326 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v326, CFSTR("LightMatrixValue-21"));

      LODWORD(v327) = 1051931443;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v327);
      v328 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v328, CFSTR("DarkBiasValue-27"));

      LODWORD(v329) = 1065772646;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v329);
      v330 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v330, CFSTR("DarkMatrixValue-27"));

      LODWORD(v331) = 0.5;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v331);
      v332 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v332, CFSTR("LightBiasValue-27"));

      LODWORD(v333) = 1066695393;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v333);
      v334 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v334, CFSTR("LightMatrixValue-27"));

      LODWORD(v335) = 1056293519;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v335);
      v336 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v336, CFSTR("DarkBiasValue-29"));

      LODWORD(v337) = 1062668861;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v337);
      v338 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v338, CFSTR("DarkMatrixValue-29"));

      LODWORD(v339) = 0.5;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v339);
      v340 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v340, CFSTR("LightBiasValue-29"));

      LODWORD(v341) = 1066695393;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v341);
      v342 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v342, CFSTR("LightMatrixValue-29"));

      LODWORD(v343) = 1055957975;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v343);
      v344 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v344, CFSTR("DarkBiasValue-32"));

      LODWORD(v345) = 1059984507;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v345);
      v346 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v346, CFSTR("DarkMatrixValue-32"));

      LODWORD(v347) = 0.5;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v347);
      v348 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v348, CFSTR("LightBiasValue-32"));

      LODWORD(v349) = 1066695393;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v349);
      v350 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v350, CFSTR("LightMatrixValue-32"));

      LODWORD(v351) = 1056461292;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v351);
      v352 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v352, CFSTR("DarkBiasValue-33"));

      LODWORD(v353) = 1059648963;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v353);
      v354 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v354, CFSTR("DarkMatrixValue-33"));

      LODWORD(v355) = 0.5;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v355);
      v356 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v356, CFSTR("LightBiasValue-33"));

      LODWORD(v357) = 1066695393;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v357);
      v358 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v358, CFSTR("LightMatrixValue-33"));

      LODWORD(v359) = 1056293519;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v359);
      v360 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v360, CFSTR("DarkBiasValue-34"));

      LODWORD(v361) = 1061326684;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v361);
      v362 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v362, CFSTR("DarkMatrixValue-34"));

      LODWORD(v363) = 0.5;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v363);
      v364 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v364, CFSTR("LightBiasValue-34"));

      LODWORD(v365) = 1066695393;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v365);
      v366 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v366, CFSTR("LightMatrixValue-34"));

      LODWORD(v367) = 1055622431;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v367);
      v368 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v368, CFSTR("DarkBiasValue-35"));

      LODWORD(v369) = 1059648963;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v369);
      v370 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v370, CFSTR("DarkMatrixValue-35"));

      LODWORD(v371) = 0.5;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v371);
      v372 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v372, CFSTR("LightBiasValue-35"));

      LODWORD(v373) = 1066695393;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v373);
      v374 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v374, CFSTR("LightMatrixValue-35"));

      LODWORD(v375) = 1058306785;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v375);
      v376 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v376, CFSTR("DarkBiasValue-37"));

      LODWORD(v377) = 1051092582;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v377);
      v378 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v378, CFSTR("DarkMatrixValue-37"));

      LODWORD(v379) = 0.5;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v379);
      v380 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v380, CFSTR("LightBiasValue-37"));

      LODWORD(v381) = 1066695393;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v381);
      v382 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v382, CFSTR("LightMatrixValue-37"));

      LODWORD(v383) = 1054951342;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v383);
      v384 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v384, CFSTR("DarkBiasValue-42"));

      LODWORD(v385) = 1062501089;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v385);
      v386 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v386, CFSTR("DarkMatrixValue-42"));

      LODWORD(v387) = 0.5;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v387);
      v388 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v388, CFSTR("LightBiasValue-42"));

      LODWORD(v389) = 1066695393;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v389);
      v390 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v390, CFSTR("LightMatrixValue-42"));

      LODWORD(v391) = 1054280253;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v391);
      v392 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v392, CFSTR("DarkBiasValue-46"));

      LODWORD(v393) = 1063843267;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v393);
      v394 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v394, CFSTR("DarkMatrixValue-46"));

      LODWORD(v395) = 0.5;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v395);
      v396 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v396, CFSTR("LightBiasValue-46"));

      LODWORD(v397) = 1066695393;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v397);
      v398 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v398, CFSTR("LightMatrixValue-46"));

      LODWORD(v399) = 1051931443;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v399);
      v400 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v400, CFSTR("DarkBiasValue-47"));

      LODWORD(v401) = 1065772646;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v401);
      v402 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v402, CFSTR("DarkMatrixValue-47"));

      LODWORD(v403) = 0.5;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v403);
      v404 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v404, CFSTR("LightBiasValue-47"));

      LODWORD(v405) = 1066695393;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v405);
      v406 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v406, CFSTR("LightMatrixValue-47"));

      LODWORD(v407) = 1054615798;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v407);
      v408 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v408, CFSTR("DarkBiasValue-61"));

      LODWORD(v409) = 1063507722;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v409);
      v410 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v410, CFSTR("DarkMatrixValue-61"));

      LODWORD(v411) = 0.5;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v411);
      v412 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v412, CFSTR("LightBiasValue-61"));

      LODWORD(v413) = 1066695393;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v413);
      v414 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v414, CFSTR("LightMatrixValue-61"));

      LODWORD(v415) = 1053944709;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v415);
      v416 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v416, CFSTR("DarkBiasValue-62"));

      LODWORD(v417) = 1064011039;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v417);
      v418 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v418, CFSTR("DarkMatrixValue-62"));

      LODWORD(v419) = 0.5;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v419);
      v420 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v420, CFSTR("LightBiasValue-62"));

      LODWORD(v421) = 1066695393;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v421);
      v422 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v422, CFSTR("LightMatrixValue-62"));

      LODWORD(v423) = 1054951342;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v423);
      v424 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v424, CFSTR("DarkBiasValue-63"));

      LODWORD(v425) = 1064011039;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v425);
      v426 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v426, CFSTR("DarkMatrixValue-63"));

      LODWORD(v427) = 0.5;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v427);
      v428 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v428, CFSTR("LightBiasValue-63"));

      LODWORD(v429) = 1066695393;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v429);
      v430 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v430, CFSTR("LightMatrixValue-63"));

      LODWORD(v431) = 1054951342;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v431);
      v432 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v432, CFSTR("DarkBiasValue-64"));

      LODWORD(v433) = 1060487823;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v433);
      v434 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v434, CFSTR("DarkMatrixValue-64"));

      LODWORD(v435) = 0.5;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v435);
      v436 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v436, CFSTR("LightBiasValue-64"));

      LODWORD(v437) = 1066695393;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v437);
      v438 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v438, CFSTR("LightMatrixValue-64"));

      LODWORD(v439) = 1055957975;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v439);
      v440 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v440, CFSTR("DarkBiasValue-91"));

      LODWORD(v441) = 1064011039;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v441);
      v442 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v442, CFSTR("DarkMatrixValue-91"));

      LODWORD(v443) = 0.5;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v443);
      v444 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v444, CFSTR("LightBiasValue-91"));

      LODWORD(v445) = 1065185444;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v445);
      v446 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v446, CFSTR("LightMatrixValue-91"));

      LODWORD(v447) = 1055957975;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v447);
      v448 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v448, CFSTR("DarkBiasValue-92"));

      LODWORD(v449) = 1063675494;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v449);
      v450 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v450, CFSTR("DarkMatrixValue-92"));

      LODWORD(v451) = 0.5;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v451);
      v452 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v452, CFSTR("LightBiasValue-92"));

      LODWORD(v453) = 1065185444;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v453);
      v156 = (void *)objc_claimAutoreleasedReturnValue();
      v157 = CFSTR("LightMatrixValue-92");
      break;
    case 0x2009u:
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 108);
      v454 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v454, CFSTR("BudHeight"));

      LODWORD(v455) = 1051931443;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v455);
      v456 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v456, CFSTR("DarkBiasValue-0"));

      LODWORD(v457) = 1065772646;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v457);
      v458 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v458, CFSTR("DarkMatrixValue-0"));

      LODWORD(v459) = 0.5;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v459);
      v460 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v460, CFSTR("LightBiasValue-0"));

      LODWORD(v461) = 1066695393;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v461);
      v462 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v462, CFSTR("LightMatrixValue-0"));

      LODWORD(v463) = 1057384038;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v463);
      v464 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v464, CFSTR("DarkBiasValue-1"));

      LODWORD(v465) = 1058642330;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v465);
      v466 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v466, CFSTR("DarkMatrixValue-1"));

      LODWORD(v467) = 0.5;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v467);
      v468 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v468, CFSTR("LightBiasValue-1"));

      LODWORD(v469) = 1066695393;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v469);
      v470 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v470, CFSTR("LightMatrixValue-1"));

      LODWORD(v471) = 1058474557;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v471);
      v472 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v472, CFSTR("DarkBiasValue-2"));

      LODWORD(v473) = 1053944709;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v473);
      v474 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v474, CFSTR("DarkMatrixValue-2"));

      LODWORD(v475) = 0.5;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v475);
      v476 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v476, CFSTR("LightBiasValue-2"));

      LODWORD(v477) = 1066695393;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v477);
      v478 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v478, CFSTR("LightMatrixValue-2"));

      LODWORD(v479) = 1057467924;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v479);
      v480 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v480, CFSTR("DarkBiasValue-3"));

      LODWORD(v481) = 1057132380;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v481);
      v482 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v482, CFSTR("DarkMatrixValue-3"));

      LODWORD(v483) = 0.5;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v483);
      v484 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v484, CFSTR("LightBiasValue-3"));

      LODWORD(v485) = 1066695393;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v485);
      v486 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v486, CFSTR("LightMatrixValue-3"));

      LODWORD(v487) = 1057467924;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v487);
      v488 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v488, CFSTR("DarkBiasValue-24"));

      LODWORD(v489) = 0.5;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v489);
      v490 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v490, CFSTR("DarkMatrixValue-24"));

      LODWORD(v491) = 0.5;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v491);
      v492 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v492, CFSTR("LightBiasValue-24"));

      LODWORD(v493) = 1066695393;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v493);
      v494 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v494, CFSTR("LightMatrixValue-24"));

      LODWORD(v495) = 1051931443;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v495);
      v496 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v496, CFSTR("DarkBiasValue-25"));

      LODWORD(v497) = 1066024305;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v497);
      v498 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v498, CFSTR("DarkMatrixValue-25"));

      LODWORD(v499) = 0.5;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v499);
      v500 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v500, CFSTR("LightBiasValue-25"));

      LODWORD(v501) = 1066695393;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v501);
      v502 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v502, CFSTR("LightMatrixValue-25"));

      LODWORD(v503) = 1058642330;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v503);
      v504 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v504, CFSTR("DarkBiasValue-37"));

      LODWORD(v505) = 1050589266;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v505);
      v506 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v506, CFSTR("DarkMatrixValue-37"));

      LODWORD(v507) = 0.5;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v507);
      v508 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v508, CFSTR("LightBiasValue-37"));

      LODWORD(v509) = 1066695393;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v509);
      v510 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v510, CFSTR("LightMatrixValue-37"));

      LODWORD(v511) = 1057803469;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v511);
      v512 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v512, CFSTR("DarkBiasValue-38"));

      LODWORD(v513) = 1060320051;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v513);
      v514 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v514, CFSTR("DarkMatrixValue-38"));

      LODWORD(v515) = 0.5;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v515);
      v516 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v516, CFSTR("LightBiasValue-38"));

      LODWORD(v517) = 1066695393;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v517);
      v518 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v518, CFSTR("LightMatrixValue-38"));

      LODWORD(v519) = 1051931443;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v519);
      v520 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v520, CFSTR("DarkBiasValue-39"));

      LODWORD(v521) = 1065772646;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v521);
      v522 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v522, CFSTR("DarkMatrixValue-39"));

      LODWORD(v523) = 0.5;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v523);
      v524 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v524, CFSTR("LightBiasValue-39"));

      LODWORD(v525) = 1066695393;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v525);
      v526 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v526, CFSTR("LightMatrixValue-39"));

      LODWORD(v527) = 1057635697;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v527);
      v528 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v528, CFSTR("DarkBiasValue-40"));

      LODWORD(v529) = 1058474557;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v529);
      v530 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v530, CFSTR("DarkMatrixValue-40"));

      LODWORD(v531) = 0.5;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v531);
      v532 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v532, CFSTR("LightBiasValue-40"));

      LODWORD(v533) = 1066695393;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v533);
      v534 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v534, CFSTR("LightMatrixValue-40"));

      LODWORD(v535) = 1053944709;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v535);
      v536 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v536, CFSTR("DarkBiasValue-41"));

      LODWORD(v537) = 1062836634;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v537);
      v538 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v538, CFSTR("DarkMatrixValue-41"));

      LODWORD(v539) = 0.5;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v539);
      v540 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v540, CFSTR("LightBiasValue-41"));

      LODWORD(v541) = 1066695393;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v541);
      v542 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v542, CFSTR("LightMatrixValue-41"));

      LODWORD(v543) = 1052938076;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v543);
      v544 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v544, CFSTR("DarkBiasValue-66"));

      LODWORD(v545) = 1059145646;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v545);
      v546 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v546, CFSTR("DarkMatrixValue-66"));

      LODWORD(v547) = 0.5;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v547);
      v548 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v548, CFSTR("LightBiasValue-66"));

      LODWORD(v549) = 1066695393;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v549);
      v550 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v550, CFSTR("LightMatrixValue-66"));

      LODWORD(v551) = 1051595899;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v551);
      v552 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v552, CFSTR("DarkBiasValue-67"));

      LODWORD(v553) = 1065520988;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v553);
      v554 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v554, CFSTR("DarkMatrixValue-67"));

      LODWORD(v555) = 0.5;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v555);
      v556 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v556, CFSTR("LightBiasValue-67"));

      LODWORD(v557) = 1066695393;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v557);
      v156 = (void *)objc_claimAutoreleasedReturnValue();
      v157 = CFSTR("LightMatrixValue-67");
      break;
    case 0x200Au:
      goto LABEL_29;
    case 0x200Bu:
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 86);
      v558 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v558, CFSTR("BudHeight"));

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 6);
      v559 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v559, CFSTR("UnifiedSpacingBetweenBuds"));

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 17);
      v560 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v560, CFSTR("SeparateSpacingBetweenBuds"));

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 70);
      v561 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v561, CFSTR("CaseHeight"));

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 33);
      v562 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v562, CFSTR("UnifiedSpacingBudsCase"));

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 22);
      v563 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v563, CFSTR("SeparateSpacingBudsCase"));

      LODWORD(v564) = 0.5;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v564);
      v565 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v565, CFSTR("DarkBiasValue-0"));

      LODWORD(v566) = 1063675494;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v566);
      v567 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v567, CFSTR("DarkMatrixValue-0"));

      LODWORD(v568) = 1057300152;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v568);
      v569 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v569, CFSTR("LightBiasValue-0"));

      LODWORD(v570) = 1066695393;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v570);
      v571 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v571, CFSTR("LightMatrixValue-0"));

      LODWORD(v572) = 0.5;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v572);
      v573 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v573, CFSTR("DarkBiasValue-1"));

      LODWORD(v574) = 1061997773;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v574);
      v575 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v575, CFSTR("DarkMatrixValue-1"));

      LODWORD(v576) = 1057803469;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v576);
      v577 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v577, CFSTR("LightBiasValue-1"));

      LODWORD(v578) = 1066695393;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v578);
      v579 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v579, CFSTR("LightMatrixValue-1"));

      LODWORD(v580) = 0.5;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v580);
      v581 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v581, CFSTR("DarkBiasValue-2"));

      LODWORD(v582) = 1064514355;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v582);
      v583 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v583, CFSTR("DarkMatrixValue-2"));

      LODWORD(v584) = 0.5;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v584);
      v585 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v585, CFSTR("LightBiasValue-2"));

      LODWORD(v586) = 1066695393;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v586);
      v587 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v587, CFSTR("LightMatrixValue-2"));

      LODWORD(v588) = 0.5;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v588);
      v589 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v589, CFSTR("DarkBiasValue-3"));

      LODWORD(v590) = 1063675494;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v590);
      v591 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v591, CFSTR("DarkMatrixValue-3"));

      LODWORD(v592) = 1058642330;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v592);
      v593 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v593, CFSTR("LightBiasValue-3"));

      LODWORD(v594) = 1066695393;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v594);
      v595 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v595, CFSTR("LightMatrixValue-3"));

      LODWORD(v596) = 0.5;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v596);
      v597 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v597, CFSTR("DarkBiasValue-5"));

      LODWORD(v598) = 1064514355;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v598);
      v599 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v599, CFSTR("DarkMatrixValue-5"));

      LODWORD(v600) = 1058306785;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v600);
      v601 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v601, CFSTR("LightBiasValue-5"));

      LODWORD(v602) = 1066695393;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v602);
      v603 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v603, CFSTR("LightMatrixValue-5"));

      LODWORD(v604) = 0.5;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v604);
      v605 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v605, CFSTR("DarkBiasValue-6"));

      LODWORD(v606) = 1064514355;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v606);
      v607 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v607, CFSTR("DarkMatrixValue-6"));

      LODWORD(v608) = 1057803469;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v608);
      v609 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v609, CFSTR("LightBiasValue-6"));

      LODWORD(v610) = 1066695393;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v610);
      v611 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v611, CFSTR("LightMatrixValue-6"));

      LODWORD(v612) = 0.5;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v612);
      v613 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v613, CFSTR("DarkBiasValue-11"));

      LODWORD(v614) = 1063675494;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v614);
      v615 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v615, CFSTR("DarkMatrixValue-11"));

      LODWORD(v616) = 1058642330;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v616);
      v617 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v617, CFSTR("LightBiasValue-11"));

      LODWORD(v618) = 1066695393;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v618);
      v619 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v619, CFSTR("LightMatrixValue-11"));

      LODWORD(v620) = 0.5;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v620);
      v621 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v621, CFSTR("DarkBiasValue-13"));

      LODWORD(v622) = 1064514355;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v622);
      v623 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v623, CFSTR("DarkMatrixValue-13"));

      LODWORD(v624) = 0.5;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v624);
      v625 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v625, CFSTR("LightBiasValue-13"));

      LODWORD(v626) = 1066695393;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v626);
      v156 = (void *)objc_claimAutoreleasedReturnValue();
      v157 = CFSTR("LightMatrixValue-13");
      break;
    case 0x200Cu:
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 108);
      v627 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v627, CFSTR("BudHeight"));

      LODWORD(v628) = 1058810102;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v628);
      v629 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v629, CFSTR("DarkBiasValue-1"));

      LODWORD(v630) = 1053273620;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v630);
      v631 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v631, CFSTR("DarkMatrixValue-1"));

      LODWORD(v632) = 0.5;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v632);
      v633 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v633, CFSTR("LightBiasValue-1"));

      LODWORD(v634) = 1066695393;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v634);
      v635 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v635, CFSTR("LightMatrixValue-1"));

      LODWORD(v636) = 1056293519;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v636);
      v637 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v637, CFSTR("DarkBiasValue-60"));

      LODWORD(v638) = 1063172178;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v638);
      v639 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v639, CFSTR("DarkMatrixValue-60"));

      LODWORD(v640) = 0.5;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v640);
      v641 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v641, CFSTR("LightBiasValue-60"));

      LODWORD(v642) = 1066695393;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v642);
      v643 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v643, CFSTR("LightMatrixValue-60"));

      LODWORD(v644) = 1053609165;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v644);
      v645 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v645, CFSTR("DarkBiasValue-69"));

      LODWORD(v646) = 1063507722;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v646);
      v647 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v647, CFSTR("DarkMatrixValue-69"));

      LODWORD(v648) = 0.5;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v648);
      v649 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v649, CFSTR("LightBiasValue-69"));

      LODWORD(v650) = 1066695393;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v650);
      v651 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v651, CFSTR("LightMatrixValue-69"));

      LODWORD(v652) = 1053609165;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v652);
      v653 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v653, CFSTR("DarkBiasValue-70"));

      LODWORD(v654) = 1063172178;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v654);
      v655 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v655, CFSTR("DarkMatrixValue-70"));

      LODWORD(v656) = 0.5;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v656);
      v657 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v657, CFSTR("LightBiasValue-70"));

      LODWORD(v658) = 1066695393;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v658);
      v659 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v659, CFSTR("LightMatrixValue-70"));

      LODWORD(v660) = 1058139013;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v660);
      v661 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v661, CFSTR("DarkBiasValue-71"));

      LODWORD(v662) = 1056125747;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v662);
      v663 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v663, CFSTR("DarkMatrixValue-71"));

      LODWORD(v664) = 0.5;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v664);
      v665 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v665, CFSTR("LightBiasValue-71"));

      LODWORD(v666) = 1066695393;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v666);
      v667 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v667, CFSTR("LightMatrixValue-71"));

      LODWORD(v668) = 1054615798;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v668);
      v669 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v669, CFSTR("DarkBiasValue-72"));

      LODWORD(v670) = 1061830001;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v670);
      v671 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v671, CFSTR("DarkMatrixValue-72"));

      LODWORD(v672) = 0.5;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v672);
      v673 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v673, CFSTR("LightBiasValue-72"));

      LODWORD(v674) = 1066695393;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v674);
      v156 = (void *)objc_claimAutoreleasedReturnValue();
      v157 = CFSTR("LightMatrixValue-72");
      break;
    case 0x200Du:
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 108);
      v675 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v675, CFSTR("BudHeight"));

      LODWORD(v676) = 1050421494;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v676);
      v677 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v677, CFSTR("DarkBiasValue-0"));

      LODWORD(v678) = 1066192077;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v678);
      v679 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v679, CFSTR("DarkMatrixValue-0"));

      LODWORD(v680) = 0.5;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v680);
      v681 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v681, CFSTR("LightBiasValue-0"));

      LODWORD(v682) = 1066695393;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v682);
      v683 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v683, CFSTR("LightMatrixValue-0"));

      LODWORD(v684) = 0.375;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v684);
      v685 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v685, CFSTR("DarkBiasValue-1"));

      LODWORD(v686) = 1058810102;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v686);
      v687 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v687, CFSTR("DarkMatrixValue-1"));

      LODWORD(v688) = 0.5;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v688);
      v689 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v689, CFSTR("LightBiasValue-1"));

      LODWORD(v690) = 1066695393;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v690);
      v691 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v691, CFSTR("LightMatrixValue-1"));

      LODWORD(v692) = 1055286886;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v692);
      v693 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v693, CFSTR("DarkBiasValue-2"));

      LODWORD(v694) = 1060320051;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v694);
      v695 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v695, CFSTR("DarkMatrixValue-2"));

      LODWORD(v696) = 0.5;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v696);
      v697 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v697, CFSTR("LightBiasValue-2"));

      LODWORD(v698) = 1066695393;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v698);
      v156 = (void *)objc_claimAutoreleasedReturnValue();
      v157 = CFSTR("LightMatrixValue-2");
      break;
    case 0x200Eu:
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 64);
      v699 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v699, CFSTR("BudHeight"));

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 6);
      v700 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v700, CFSTR("UnifiedSpacingBetweenBuds"));

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 27);
      v701 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v701, CFSTR("SeparateSpacingBetweenBuds"));

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 92);
      v702 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v702, CFSTR("CaseHeight"));

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 59);
      v703 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v703, CFSTR("UnifiedSpacingBudsCase"));

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 38);
      v704 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v704, CFSTR("SeparateSpacingBudsCase"));

      LODWORD(v705) = 1053609165;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v705);
      v706 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v706, CFSTR("DarkBiasValue"));

      v34 = (void *)MEMORY[0x1E0CB37E8];
      LODWORD(v35) = 1065772646;
      goto LABEL_15;
    case 0x2010u:
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 108);
      v708 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v708, CFSTR("BudHeight"));

      LODWORD(v709) = 0.5;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v709);
      v710 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v710, CFSTR("DarkBiasValue-1"));

      LODWORD(v711) = 1063675494;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v711);
      v712 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v712, CFSTR("DarkMatrixValue-1"));

      LODWORD(v713) = 1057803469;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v713);
      v714 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v714, CFSTR("LightBiasValue-1"));

      LODWORD(v715) = 1068792545;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v715);
      v716 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v716, CFSTR("LightMatrixValue-1"));

      LODWORD(v717) = 1055622431;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v717);
      v718 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v718, CFSTR("DarkBiasValue-77"));

      LODWORD(v719) = 1064849900;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v719);
      v720 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v720, CFSTR("DarkMatrixValue-77"));

      LODWORD(v721) = 0.5;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v721);
      v722 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v722, CFSTR("LightBiasValue-77"));

      LODWORD(v723) = 1.0;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v723);
      v724 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v724, CFSTR("LightMatrixValue-77"));

      LODWORD(v725) = 1054280253;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v725);
      v726 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v726, CFSTR("DarkBiasValue-78"));

      LODWORD(v727) = 1064849900;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v727);
      v728 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v728, CFSTR("DarkMatrixValue-78"));

      LODWORD(v729) = 0.5;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v729);
      v730 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v730, CFSTR("LightBiasValue-78"));

      LODWORD(v731) = 1.0;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v731);
      v732 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v732, CFSTR("LightMatrixValue-78"));

      LODWORD(v733) = 1053609165;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v733);
      v734 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v734, CFSTR("DarkBiasValue-79"));

      LODWORD(v735) = 1065017672;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v735);
      v736 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v736, CFSTR("DarkMatrixValue-79"));

      LODWORD(v737) = 0.5;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v737);
      v738 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v738, CFSTR("LightBiasValue-79"));

      LODWORD(v739) = 1.0;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v739);
      v156 = (void *)objc_claimAutoreleasedReturnValue();
      v157 = CFSTR("LightMatrixValue-79");
      break;
    case 0x2011u:
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 31);
      v740 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v740, CFSTR("BudHeight"));

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 6);
      v741 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v741, CFSTR("UnifiedSpacingBetweenBuds"));

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 25);
      v742 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v742, CFSTR("SeparateSpacingBetweenBuds"));

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 100);
      v743 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v743, CFSTR("CaseHeight"));

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 49);
      v744 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v744, CFSTR("UnifiedSpacingBudsCase"));

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 30);
      v745 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v745, CFSTR("SeparateSpacingBudsCase"));

      LODWORD(v746) = 1052938076;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v746);
      v747 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v747, CFSTR("DarkBiasValue-0"));

      LODWORD(v748) = 1065017672;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v748);
      v749 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v749, CFSTR("DarkMatrixValue-0"));

      LODWORD(v750) = 0.5;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v750);
      v751 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v751, CFSTR("LightBiasValue-0"));

      LODWORD(v752) = 1.0;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v752);
      v753 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v753, CFSTR("LightMatrixValue-0"));

      LODWORD(v754) = 1056293519;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v754);
      v755 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v755, CFSTR("DarkBiasValue-1"));

      LODWORD(v756) = 1064849900;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v756);
      v757 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v757, CFSTR("DarkMatrixValue-1"));

      LODWORD(v758) = 1057300152;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v758);
      v759 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v759, CFSTR("LightBiasValue-1"));

      LODWORD(v760) = 1066527621;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v760);
      v761 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v761, CFSTR("LightMatrixValue-1"));

      LODWORD(v762) = 1055622431;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v762);
      v763 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v763, CFSTR("DarkBiasValue-2"));

      LODWORD(v764) = 1064682127;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v764);
      v765 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v765, CFSTR("DarkMatrixValue-2"));

      LODWORD(v766) = 0.5;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v766);
      v767 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v767, CFSTR("LightBiasValue-2"));

      LODWORD(v768) = 1.0;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v768);
      v769 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v769, CFSTR("LightMatrixValue-2"));

      LODWORD(v770) = 1055622431;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v770);
      v771 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v771, CFSTR("DarkBiasValue-3"));

      LODWORD(v772) = 1064514355;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v772);
      v773 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v773, CFSTR("DarkMatrixValue-3"));

      LODWORD(v774) = 0.5;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v774);
      v775 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v775, CFSTR("LightBiasValue-3"));

      LODWORD(v776) = 1.0;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v776);
      v777 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v777, CFSTR("LightMatrixValue-3"));

      LODWORD(v778) = 1055957975;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v778);
      v779 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v779, CFSTR("DarkBiasValue-4"));

      LODWORD(v780) = 1065017672;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v780);
      v781 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v781, CFSTR("DarkMatrixValue-4"));

      LODWORD(v782) = 0.5;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v782);
      v783 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v783, CFSTR("LightBiasValue-4"));

      LODWORD(v784) = 1.0;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v784);
      v785 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v785, CFSTR("LightMatrixValue-4"));

      LODWORD(v786) = 1055622431;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v786);
      v787 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v787, CFSTR("DarkBiasValue-6"));

      LODWORD(v788) = 1064346583;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v788);
      v789 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v789, CFSTR("DarkMatrixValue-6"));

      LODWORD(v790) = 0.5;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v790);
      v791 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v791, CFSTR("LightBiasValue-6"));

      LODWORD(v792) = 1.0;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v792);
      v156 = (void *)objc_claimAutoreleasedReturnValue();
      v157 = CFSTR("LightMatrixValue-6");
      break;
    case 0x2012u:
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 51);
      v793 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v793, CFSTR("BudHeight"));

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 6);
      v794 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v794, CFSTR("UnifiedSpacingBetweenBuds"));

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 28);
      v795 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v795, CFSTR("SeparateSpacingBetweenBuds"));

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 52);
      v796 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v796, CFSTR("CaseHeight"));

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 50);
      v797 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v797, CFSTR("UnifiedSpacingBudsCase"));

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 28);
      v798 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v798, CFSTR("SeparateSpacingBudsCase"));

      LODWORD(v799) = 1056293519;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v799);
      v800 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v800, CFSTR("DarkBiasValue-0"));

      LODWORD(v801) = 1064514355;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v801);
      v802 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v802, CFSTR("DarkMatrixValue-0"));

      LODWORD(v803) = 0.5;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v803);
      v804 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v804, CFSTR("LightBiasValue-0"));

      LODWORD(v805) = 1065604874;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v805);
      v806 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v806, CFSTR("LightMatrixValue-0"));

      LODWORD(v807) = 0.5;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v807);
      v808 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v808, CFSTR("DarkBiasValue-1"));

      LODWORD(v809) = 0.75;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v809);
      v810 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v810, CFSTR("DarkMatrixValue-1"));

      LODWORD(v811) = 0.5;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v811);
      v812 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v812, CFSTR("LightBiasValue-1"));

      LODWORD(v813) = 1.0;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v813);
      v814 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v814, CFSTR("LightMatrixValue-1"));

      LODWORD(v815) = 1056293519;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v815);
      v816 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v816, CFSTR("DarkBiasValue-2"));

      LODWORD(v817) = 1064178811;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v817);
      v818 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v818, CFSTR("DarkMatrixValue-2"));

      LODWORD(v819) = 0.5;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v819);
      v820 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v820, CFSTR("LightBiasValue-2"));

      LODWORD(v821) = 1.0;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v821);
      v822 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v822, CFSTR("LightMatrixValue-2"));

      LODWORD(v823) = 1056293519;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v823);
      v824 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v824, CFSTR("DarkBiasValue-3"));

      LODWORD(v825) = 1063507722;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v825);
      v826 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v826, CFSTR("DarkMatrixValue-3"));

      LODWORD(v827) = 0.5;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v827);
      v828 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v828, CFSTR("LightBiasValue-3"));

      LODWORD(v829) = 1.0;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v829);
      v830 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v830, CFSTR("LightMatrixValue-3"));

      LODWORD(v831) = 1056293519;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v831);
      v832 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v832, CFSTR("DarkBiasValue-4"));

      LODWORD(v833) = 1064178811;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v833);
      v834 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v834, CFSTR("DarkMatrixValue-4"));

      LODWORD(v835) = 0.5;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v835);
      v836 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v836, CFSTR("LightBiasValue-4"));

      LODWORD(v837) = 1.0;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v837);
      v838 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v838, CFSTR("LightMatrixValue-4"));

      LODWORD(v839) = 1056629064;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v839);
      v840 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v840, CFSTR("DarkBiasValue-5"));

      LODWORD(v841) = 1064514355;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v841);
      v842 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v842, CFSTR("DarkMatrixValue-5"));

      LODWORD(v843) = 0.5;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v843);
      v844 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v844, CFSTR("LightBiasValue-5"));

      LODWORD(v845) = 1.0;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v845);
      v846 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v846, CFSTR("LightMatrixValue-5"));

      LODWORD(v847) = 1055286886;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v847);
      v848 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v848, CFSTR("DarkBiasValue-6"));

      LODWORD(v849) = 1063507722;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v849);
      v850 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v850, CFSTR("DarkMatrixValue-6"));

      LODWORD(v851) = 0.5;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v851);
      v852 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v852, CFSTR("LightBiasValue-6"));

      LODWORD(v853) = 1.0;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v853);
      v854 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v854, CFSTR("LightMatrixValue-6"));

      LODWORD(v855) = 1054951342;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v855);
      v856 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v856, CFSTR("DarkBiasValue-7"));

      LODWORD(v857) = 1062501089;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v857);
      v858 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v858, CFSTR("DarkMatrixValue-7"));

      LODWORD(v859) = 0.5;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v859);
      v860 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v860, CFSTR("LightBiasValue-7"));

      LODWORD(v861) = 1.0;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v861);
      v862 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v862, CFSTR("LightMatrixValue-7"));

      LODWORD(v863) = 1056293519;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v863);
      v864 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v864, CFSTR("DarkBiasValue-8"));

      LODWORD(v865) = 1063507722;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v865);
      v866 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v866, CFSTR("DarkMatrixValue-8"));

      LODWORD(v867) = 0.5;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v867);
      v868 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v868, CFSTR("LightBiasValue-8"));

      LODWORD(v869) = 1.0;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v869);
      v870 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v870, CFSTR("LightMatrixValue-8"));

      LODWORD(v871) = 1055286886;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v871);
      v872 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v872, CFSTR("DarkBiasValue-9"));

      LODWORD(v873) = 1060655596;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v873);
      v874 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v874, CFSTR("DarkMatrixValue-9"));

      LODWORD(v875) = 0.5;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v875);
      v876 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v876, CFSTR("LightBiasValue-9"));

      v877 = (void *)MEMORY[0x1E0CB37E8];
      LODWORD(v878) = 1.0;
      goto LABEL_24;
    case 0x2013u:
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 62);
      v879 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v879, CFSTR("BudHeight"));

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 6);
      v880 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v880, CFSTR("UnifiedSpacingBetweenBuds"));

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 34);
      v881 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v881, CFSTR("SeparateSpacingBetweenBuds"));

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 94);
      v882 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v882, CFSTR("CaseHeight"));

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 74);
      v883 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v883, CFSTR("UnifiedSpacingBudsCase"));

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 46);
      v884 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v884, CFSTR("SeparateSpacingBudsCase"));

      LODWORD(v885) = 1053776937;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v885);
      v886 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v886, CFSTR("DarkBiasValue"));

      LODWORD(v887) = 1066359849;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v887);
      v888 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v888, CFSTR("DarkMatrixValue"));

      v24 = (void *)MEMORY[0x1E0CB37E8];
      LODWORD(v25) = 1058139013;
      goto LABEL_20;
    case 0x2014u:
    case 0x2024u:
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 64);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v26, CFSTR("BudHeight"));

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 6);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v27, CFSTR("UnifiedSpacingBetweenBuds"));

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 27);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v28, CFSTR("SeparateSpacingBetweenBuds"));

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 102);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v29, CFSTR("CaseHeight"));

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 59);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v30, CFSTR("UnifiedSpacingBudsCase"));

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 38);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v31, CFSTR("SeparateSpacingBudsCase"));

      LODWORD(v32) = 1053273620;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v32);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v33, CFSTR("DarkBiasValue"));

      v34 = (void *)MEMORY[0x1E0CB37E8];
      LODWORD(v35) = 1066443735;
LABEL_15:
      objc_msgSend(v34, "numberWithFloat:", v35);
      v707 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v707, CFSTR("DarkMatrixValue"));

      v24 = (void *)MEMORY[0x1E0CB37E8];
      LODWORD(v25) = 1057803469;
      goto LABEL_20;
    case 0x2016u:
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 31);
      v892 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v892, CFSTR("BudHeight"));

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 6);
      v893 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v893, CFSTR("UnifiedSpacingBetweenBuds"));

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 25);
      v894 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v894, CFSTR("SeparateSpacingBetweenBuds"));

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 100);
      v895 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v895, CFSTR("CaseHeight"));

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 49);
      v896 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v896, CFSTR("UnifiedSpacingBudsCase"));

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 30);
      v897 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v897, CFSTR("SeparateSpacingBudsCase"));

      LODWORD(v898) = 1056293519;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v898);
      v899 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v899, CFSTR("DarkBiasValue-0"));

      LODWORD(v900) = 1064849900;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v900);
      v901 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v901, CFSTR("DarkMatrixValue-0"));

      LODWORD(v902) = 1057300152;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v902);
      v903 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v903, CFSTR("LightBiasValue-0"));

      LODWORD(v904) = 1066527621;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v904);
      v905 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v905, CFSTR("LightMatrixValue-0"));

      LODWORD(v906) = 1054615798;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v906);
      v907 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v907, CFSTR("DarkBiasValue-1"));

      LODWORD(v908) = 1064849900;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v908);
      v909 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v909, CFSTR("DarkMatrixValue-1"));

      LODWORD(v910) = 0.5;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v910);
      v911 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v911, CFSTR("LightBiasValue-1"));

      LODWORD(v912) = 1.0;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v912);
      v913 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v913, CFSTR("LightMatrixValue-1"));

      LODWORD(v914) = 1055957975;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v914);
      v915 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v915, CFSTR("DarkBiasValue-2"));

      LODWORD(v916) = 1063843267;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v916);
      v917 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v917, CFSTR("DarkMatrixValue-2"));

      LODWORD(v918) = 1056360628;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v918);
      v919 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v919, CFSTR("LightBiasValue-2"));

      LODWORD(v920) = 1064766013;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v920);
      v921 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v921, CFSTR("LightMatrixValue-2"));

      LODWORD(v922) = 1053609165;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v922);
      v923 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v923, CFSTR("DarkBiasValue-3"));

      LODWORD(v924) = 1064346583;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v924);
      v925 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v925, CFSTR("DarkMatrixValue-3"));

      LODWORD(v926) = 0.5;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v926);
      v927 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v927, CFSTR("LightBiasValue-3"));

      LODWORD(v928) = 1.0;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v928);
      v929 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v929, CFSTR("LightMatrixValue-3"));

      LODWORD(v930) = 1054615798;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v930);
      v931 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v931, CFSTR("DarkBiasValue-4"));

      LODWORD(v932) = 1064514355;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v932);
      v933 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v933, CFSTR("DarkMatrixValue-4"));

      LODWORD(v934) = 0.5;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v934);
      v935 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v935, CFSTR("LightBiasValue-4"));

      v936 = (void *)MEMORY[0x1E0CB37E8];
      LODWORD(v937) = 1.0;
      goto LABEL_27;
    case 0x2017u:
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 108);
      v938 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v938, CFSTR("BudHeight"));

      LODWORD(v939) = 1056159302;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v939);
      v940 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v940, CFSTR("DarkBiasValue-1"));

      LODWORD(v941) = 1065269330;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v941);
      v942 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v942, CFSTR("DarkMatrixValue-1"));

      LODWORD(v943) = 0.5;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v943);
      v944 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v944, CFSTR("LightBiasValue-1"));

      LODWORD(v945) = 1.0;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v945);
      v946 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v946, CFSTR("LightMatrixValue-1"));

      LODWORD(v947) = 1056226410;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v947);
      v948 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v948, CFSTR("DarkBiasValue-3"));

      LODWORD(v949) = 1064262697;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v949);
      v950 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v950, CFSTR("DarkMatrixValue-3"));

      LODWORD(v951) = 0.5;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v951);
      v952 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v952, CFSTR("LightBiasValue-3"));

      LODWORD(v953) = 1.0;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v953);
      v954 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v954, CFSTR("LightMatrixValue-3"));

      LODWORD(v955) = 1056629064;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v955);
      v956 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v956, CFSTR("DarkBiasValue-4"));

      LODWORD(v957) = 1065017672;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v957);
      v958 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v958, CFSTR("DarkMatrixValue-4"));

      LODWORD(v959) = 0.5;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v959);
      v960 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v960, CFSTR("LightBiasValue-4"));

      LODWORD(v961) = 1065604874;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v961);
      v962 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v962, CFSTR("LightMatrixValue-4"));

      LODWORD(v963) = 1057300152;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v963);
      v964 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v964, CFSTR("DarkBiasValue-5"));

      LODWORD(v965) = 1063675494;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v965);
      v966 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v966, CFSTR("DarkMatrixValue-5"));

      LODWORD(v967) = 1057803469;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v967);
      v968 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v968, CFSTR("LightBiasValue-5"));

      LODWORD(v969) = 1065017672;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v969);
      v970 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v970, CFSTR("LightMatrixValue-5"));

      LODWORD(v971) = 0.5;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v971);
      v972 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v972, CFSTR("DarkBiasValue-6"));

      LODWORD(v973) = 1.0;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v973);
      v974 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v974, CFSTR("DarkMatrixValue-6"));

      LODWORD(v975) = 1057132380;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v975);
      v976 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v976, CFSTR("LightBiasValue-6"));

      LODWORD(v977) = 1065772646;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v977);
      v978 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v978, CFSTR("LightMatrixValue-6"));

      LODWORD(v979) = 1056360628;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v979);
      v980 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v980, CFSTR("DarkBiasValue-7"));

      LODWORD(v981) = 1065772646;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v981);
      v982 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v982, CFSTR("DarkMatrixValue-7"));

      LODWORD(v983) = 0.5;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v983);
      v984 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v984, CFSTR("LightBiasValue-7"));

      LODWORD(v985) = 1.0;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v985);
      v986 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v986, CFSTR("LightMatrixValue-7"));

      LODWORD(v987) = 1056427737;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v987);
      v988 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v988, CFSTR("DarkBiasValue-9"));

      LODWORD(v989) = 1064849900;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v989);
      v990 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v990, CFSTR("DarkMatrixValue-9"));

      LODWORD(v991) = 1057434370;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v991);
      v992 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v992, CFSTR("LightBiasValue-9"));

      v877 = (void *)MEMORY[0x1E0CB37E8];
      LODWORD(v878) = 1066317906;
LABEL_24:
      objc_msgSend(v877, "numberWithFloat:", v878);
      v156 = (void *)objc_claimAutoreleasedReturnValue();
      v157 = CFSTR("LightMatrixValue-9");
      break;
    case 0x2019u:
    case 0x201Bu:
    case 0x201Eu:
    case 0x2020u:
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 62);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v5, CFSTR("BudHeight"));

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 6);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v6, CFSTR("UnifiedSpacingBetweenBuds"));

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 34);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v7, CFSTR("SeparateSpacingBetweenBuds"));

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 94);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v8, CFSTR("CaseHeight"));

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 74);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v9, CFSTR("UnifiedSpacingBudsCase"));

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 46);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v10, CFSTR("SeparateSpacingBudsCase"));

      LODWORD(v11) = 1053609165;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v12, CFSTR("DarkBiasValue"));

      v13 = (void *)MEMORY[0x1E0CB37E8];
      LODWORD(v14) = 1065940419;
LABEL_4:
      objc_msgSend(v13, "numberWithFloat:", v14);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v23, CFSTR("DarkMatrixValue"));

      v24 = (void *)MEMORY[0x1E0CB37E8];
      LODWORD(v25) = 0.5;
LABEL_20:
      objc_msgSend(v24, "numberWithFloat:", v25);
      v889 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v889, CFSTR("LightBiasValue"));

      LODWORD(v890) = 1066695393;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v890);
      v156 = (void *)objc_claimAutoreleasedReturnValue();
      v157 = CFSTR("LightMatrixValue");
      break;
    case 0x201Au:
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 108);
      v993 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v993, CFSTR("BudHeight"));

      LODWORD(v994) = 0.5;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v994);
      v995 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v995, CFSTR("LightBiasValue-1"));

      LODWORD(v996) = 1.0;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v996);
      v997 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v997, CFSTR("LightMatrixValue-1"));

      LODWORD(v998) = 1055957975;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v998);
      v999 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v999, CFSTR("DarkBiasValue-1"));

      LODWORD(v1000) = 1061997773;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v1000);
      v1001 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v1001, CFSTR("DarkMatrixValue-1"));

      LODWORD(v1002) = 0.5;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v1002);
      v1003 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v1003, CFSTR("LightBiasValue-2"));

      LODWORD(v1004) = 1.0;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v1004);
      v1005 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v1005, CFSTR("LightMatrixValue-2"));

      LODWORD(v1006) = 1055957975;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v1006);
      v1007 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v1007, CFSTR("DarkBiasValue-2"));

      LODWORD(v1008) = 1061997773;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v1008);
      v1009 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v1009, CFSTR("DarkMatrixValue-2"));

      LODWORD(v1010) = 0.5;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v1010);
      v1011 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v1011, CFSTR("LightBiasValue-4"));

      LODWORD(v1012) = 1.0;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v1012);
      v1013 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v1013, CFSTR("LightMatrixValue-4"));

      LODWORD(v1014) = 1055957975;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v1014);
      v1015 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v1015, CFSTR("DarkBiasValue-4"));

      LODWORD(v1016) = 1062836634;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v1016);
      v156 = (void *)objc_claimAutoreleasedReturnValue();
      v157 = CFSTR("DarkMatrixValue-4");
      break;
    case 0x201Du:
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 74);
      v1017 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v1017, CFSTR("BudHeight"));

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 6);
      v1018 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v1018, CFSTR("UnifiedSpacingBetweenBuds"));

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 17);
      v1019 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v1019, CFSTR("SeparateSpacingBetweenBuds"));

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 57);
      v1020 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v1020, CFSTR("CaseHeight"));

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 33);
      v1021 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v1021, CFSTR("UnifiedSpacingBudsCase"));

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 22);
      v1022 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v1022, CFSTR("SeparateSpacingBudsCase"));

      LODWORD(v1023) = 1056293519;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v1023);
      v1024 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v1024, CFSTR("DarkBiasValue-1"));

      LODWORD(v1025) = 1064178811;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v1025);
      v1026 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v1026, CFSTR("DarkMatrixValue-1"));

      LODWORD(v1027) = 0.5;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v1027);
      v1028 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v1028, CFSTR("LightBiasValue-1"));

      LODWORD(v1029) = 1065185444;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v1029);
      v1030 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v1030, CFSTR("LightMatrixValue-1"));

      LODWORD(v1031) = 1055957975;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v1031);
      v1032 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v1032, CFSTR("DarkBiasValue-2"));

      LODWORD(v1033) = 1064514355;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v1033);
      v1034 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v1034, CFSTR("DarkMatrixValue-2"));

      LODWORD(v1035) = 0.5;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v1035);
      v1036 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v1036, CFSTR("LightBiasValue-2"));

      LODWORD(v1037) = 1065185444;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v1037);
      v1038 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v1038, CFSTR("LightMatrixValue-2"));

      LODWORD(v1039) = 1056629064;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v1039);
      v1040 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v1040, CFSTR("DarkBiasValue-3"));

      LODWORD(v1041) = 1064849900;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v1041);
      v1042 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v1042, CFSTR("DarkMatrixValue-3"));

      LODWORD(v1043) = 0.5;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v1043);
      v1044 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v1044, CFSTR("LightBiasValue-3"));

      LODWORD(v1045) = 1065185444;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v1045);
      v1046 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v1046, CFSTR("LightMatrixValue-3"));

      LODWORD(v1047) = 1056293519;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v1047);
      v1048 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v1048, CFSTR("DarkBiasValue-4"));

      LODWORD(v1049) = 1064849900;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v1049);
      v1050 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v1050, CFSTR("DarkMatrixValue-4"));

      LODWORD(v1051) = 0.5;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v1051);
      v1052 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v1052, CFSTR("LightBiasValue-4"));

      v936 = (void *)MEMORY[0x1E0CB37E8];
      LODWORD(v937) = 1065185444;
LABEL_27:
      objc_msgSend(v936, "numberWithFloat:", v937);
      v156 = (void *)objc_claimAutoreleasedReturnValue();
      v157 = CFSTR("LightMatrixValue-4");
      break;
    case 0x201Fu:
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 108);
      v1053 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v1053, CFSTR("BudHeight"));

      LODWORD(v1054) = 0.5;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v1054);
      v1055 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v1055, CFSTR("DarkBiasValue-21"));

      LODWORD(v1056) = 1064682127;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v1056);
      v1057 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v1057, CFSTR("DarkMatrixValue-21"));

      LODWORD(v1058) = 0.5;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v1058);
      v1059 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v1059, CFSTR("LightBiasValue-21"));

      LODWORD(v1060) = 1064849900;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v1060);
      v1061 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v1061, CFSTR("LightMatrixValue-21"));

      LODWORD(v1062) = 0.5;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v1062);
      v1063 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v1063, CFSTR("DarkBiasValue-22"));

      LODWORD(v1064) = 1063675494;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v1064);
      v1065 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v1065, CFSTR("DarkMatrixValue-22"));

      LODWORD(v1066) = 0.5;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v1066);
      v1067 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v1067, CFSTR("LightBiasValue-22"));

      LODWORD(v1068) = 1064849900;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v1068);
      v1069 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v1069, CFSTR("LightMatrixValue-22"));

      LODWORD(v1070) = 0.5;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v1070);
      v1071 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v1071, CFSTR("DarkBiasValue-20"));

      LODWORD(v1072) = 1063675494;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v1072);
      v1073 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v1073, CFSTR("DarkMatrixValue-20"));

      LODWORD(v1074) = 0.5;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v1074);
      v1075 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v1075, CFSTR("LightBiasValue-20"));

      LODWORD(v1076) = 1064849900;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v1076);
      v1077 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v1077, CFSTR("LightMatrixValue-20"));

      LODWORD(v1078) = 1055286886;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v1078);
      v1079 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v1079, CFSTR("DarkBiasValue-19"));

      LODWORD(v1080) = 1.0;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v1080);
      v1081 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v1081, CFSTR("DarkMatrixValue-19"));

      LODWORD(v1082) = 0.5;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v1082);
      v1083 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v1083, CFSTR("LightBiasValue-19"));

      LODWORD(v1084) = 1.0;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v1084);
      v1085 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v1085, CFSTR("LightMatrixValue-19"));

      LODWORD(v1086) = 0.5;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v1086);
      v1087 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v1087, CFSTR("DarkBiasValue-18"));

      LODWORD(v1088) = 1063675494;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v1088);
      v1089 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v1089, CFSTR("DarkMatrixValue-18"));

      LODWORD(v1090) = 0.5;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v1090);
      v1091 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v1091, CFSTR("LightBiasValue-18"));

      LODWORD(v1092) = 1.0;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v1092);
      v1093 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v1093, CFSTR("LightMatrixValue-18"));

LABEL_29:
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 108);
      v1094 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v1094, CFSTR("BudHeight"));

      LODWORD(v1095) = 0.5;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v1095);
      v1096 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v1096, CFSTR("DarkBiasValue-0"));

      LODWORD(v1097) = 1063675494;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v1097);
      v1098 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v1098, CFSTR("DarkMatrixValue-0"));

      LODWORD(v1099) = 0.5;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v1099);
      v1100 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v1100, CFSTR("LightBiasValue-0"));

      LODWORD(v1101) = 1.0;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v1101);
      v1102 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v1102, CFSTR("LightMatrixValue-0"));

      LODWORD(v1103) = 0.5;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v1103);
      v1104 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v1104, CFSTR("DarkBiasValue-2"));

      LODWORD(v1105) = 1064682127;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v1105);
      v1106 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v1106, CFSTR("DarkMatrixValue-2"));

      LODWORD(v1107) = 0.5;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v1107);
      v1108 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v1108, CFSTR("LightBiasValue-2"));

      LODWORD(v1109) = 1064849900;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v1109);
      v1110 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v1110, CFSTR("LightMatrixValue-2"));

      LODWORD(v1111) = 0.5;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v1111);
      v1112 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v1112, CFSTR("DarkBiasValue-3"));

      LODWORD(v1113) = 1063675494;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v1113);
      v1114 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v1114, CFSTR("DarkMatrixValue-3"));

      LODWORD(v1115) = 0.5;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v1115);
      v1116 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v1116, CFSTR("LightBiasValue-3"));

      LODWORD(v1117) = 1064849900;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v1117);
      v1118 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v1118, CFSTR("LightMatrixValue-3"));

      LODWORD(v1119) = 0.5;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v1119);
      v1120 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v1120, CFSTR("DarkBiasValue-15"));

      LODWORD(v1121) = 1063675494;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v1121);
      v1122 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v1122, CFSTR("DarkMatrixValue-15"));

      LODWORD(v1123) = 0.5;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v1123);
      v1124 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v1124, CFSTR("LightBiasValue-15"));

      LODWORD(v1125) = 1.0;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v1125);
      v1126 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v1126, CFSTR("LightMatrixValue-15"));

      LODWORD(v1127) = 1055286886;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v1127);
      v1128 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v1128, CFSTR("DarkBiasValue-16"));

      LODWORD(v1129) = 1.0;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v1129);
      v1130 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v1130, CFSTR("DarkMatrixValue-16"));

      LODWORD(v1131) = 0.5;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v1131);
      v1132 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v1132, CFSTR("LightBiasValue-16"));

      LODWORD(v1133) = 1.0;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v1133);
      v1134 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v1134, CFSTR("LightMatrixValue-16"));

      LODWORD(v1135) = 0.5;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v1135);
      v1136 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v1136, CFSTR("DarkBiasValue-17"));

      LODWORD(v1137) = 1064514355;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v1137);
      v1138 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v1138, CFSTR("DarkMatrixValue-17"));

      LODWORD(v1139) = 0.5;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v1139);
      v1140 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v1140, CFSTR("LightBiasValue-17"));

      LODWORD(v1141) = 1064682127;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v1141);
      v156 = (void *)objc_claimAutoreleasedReturnValue();
      v157 = CFSTR("LightMatrixValue-17");
      break;
    case 0x2025u:
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 108);
      v1142 = (void *)objc_claimAutoreleasedReturnValue();
      v1143 = CFSTR("BudHeight");
      goto LABEL_32;
    case 0x2026u:
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 48);
      v1144 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v1144, CFSTR("BudHeight"));

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 25);
      v1145 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v1145, CFSTR("SeparateSpacingBetweenBuds"));

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 6);
      v1146 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v1146, CFSTR("UnifiedSpacingBetweenBuds"));

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 0);
      v1142 = (void *)objc_claimAutoreleasedReturnValue();
      v1143 = CFSTR("UnifiedSpacingBudsCase");
LABEL_32:
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v1142, v1143);

      LODWORD(v1147) = 1057803469;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v1147);
      v1148 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v1148, CFSTR("LightBiasValue-0"));

      LODWORD(v1149) = 1.0;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v1149);
      v1150 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v1150, CFSTR("LightMatrixValue-0"));

      LODWORD(v1151) = 1057635697;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v1151);
      v1152 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v1152, CFSTR("DarkBiasValue-0"));

      LODWORD(v1153) = 1064514355;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v1153);
      v1154 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v1154, CFSTR("DarkMatrixValue-0"));

      LODWORD(v1155) = 0.5;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v1155);
      v1156 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v1156, CFSTR("LightBiasValue-1"));

      LODWORD(v1157) = 1.0;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v1157);
      v1158 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v1158, CFSTR("LightMatrixValue-1"));

      LODWORD(v1159) = 1055957975;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v1159);
      v1160 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v1160, CFSTR("DarkBiasValue-1"));

      LODWORD(v1161) = 1064514355;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v1161);
      v1162 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v1162, CFSTR("DarkMatrixValue-1"));

      LODWORD(v1163) = 0.5;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v1163);
      v1164 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v1164, CFSTR("LightBiasValue-2"));

      LODWORD(v1165) = 1.0;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v1165);
      v1166 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v1166, CFSTR("LightMatrixValue-2"));

      LODWORD(v1167) = 1055957975;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v1167);
      v1168 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v1168, CFSTR("DarkBiasValue-2"));

      LODWORD(v1169) = 1064514355;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v1169);
      v156 = (void *)objc_claimAutoreleasedReturnValue();
      v157 = CFSTR("DarkMatrixValue-2");
      break;
    default:
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 108);
      v156 = (void *)objc_claimAutoreleasedReturnValue();
      v157 = CFSTR("BudHeight");
      break;
  }
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v156, v157);

  return v4;
}

- (void)setupViews
{
  void *v3;
  void *v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  int deviceColor;
  _BOOL4 untethered;
  _BOOL4 v13;
  BOOL v14;
  void *v15;
  void *v16;
  BOOL v17;
  NSString *productIdString;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  uint64_t v25;
  NSObject *v26;
  void *v27;
  void *v28;
  void *v29;
  NSObject *v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  void *v34;
  uint64_t v35;
  NSObject *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  UIImageView *v40;
  UIImageView *leftImageView;
  UIImageView *v42;
  UIImageView *rightImageView;
  void *v44;
  float v45;
  float v46;
  double v47;
  float v48;
  double v49;
  double v50;
  float v51;
  float v52;
  id v53;
  int v54;
  void *v55;
  float v56;
  float v57;
  void *v58;
  float v59;
  float v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  float v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  uint64_t battLevelLeft;
  HPSBatteryGroupView *v72;
  double v73;
  double v74;
  _BOOL8 v75;
  void *v76;
  void *v77;
  HPSBatteryGroupView *v78;
  HPSBatteryGroupView *deviceBatteryLevelLeftView;
  HPSBatteryGroupView *v80;
  double v81;
  double v82;
  _BOOL8 v83;
  void *v84;
  void *v85;
  HPSBatteryGroupView *v86;
  uint64_t v87;
  HPSBatteryGroupView *deviceBatteryLevelRightView;
  float v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  float v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  float v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  float v109;
  float v110;
  void *v111;
  float v112;
  float v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  float v118;
  void *v119;
  void *v120;
  void *v121;
  void *v122;
  void *v123;
  uint64_t v124;
  HPSBatteryGroupView *v125;
  double v126;
  _BOOL8 v127;
  float v128;
  HPSBatteryGroupView *v129;
  HPSBatteryGroupView *v130;
  void *v131;
  void *v132;
  void *v133;
  void *v134;
  void *v135;
  void *v136;
  float v137;
  void *v138;
  float v139;
  void *v140;
  void *v141;
  void *v142;
  void *v143;
  void *v144;
  unint64_t v145;
  void *v146;
  void *v147;
  void *v148;
  NSObject *v149;
  void *v150;
  UIImageView *v151;
  UIImageView **p_caseImageView;
  UIImageView *caseImageView;
  UIView *caseEngravingView;
  NSObject *v155;
  void *v156;
  float v157;
  float v158;
  double v159;
  double v160;
  double v161;
  double v162;
  void *v163;
  void *v164;
  int v165;
  unint64_t v166;
  void *v167;
  id v168;
  void *v169;
  void *v170;
  HPSBatteryGroupView *v171;
  double v172;
  HPSBatteryGroupView *v173;
  HPSBatteryGroupView *deviceBatteryLevelCaseView;
  id v175;
  void *v176;
  void *v177;
  float v178;
  void *v179;
  void *v180;
  void *v181;
  void *v182;
  void *v183;
  float v184;
  float v185;
  NSObject *v186;
  void *v187;
  void *v188;
  void *v189;
  void *v190;
  void *v191;
  void *v192;
  void *v193;
  void *v194;
  void *v195;
  void *v196;
  void *v197;
  void *v198;
  void *v199;
  void *v200;
  void *v201;
  void *v202;
  void *v203;
  void *v204;
  void *v205;
  void *v206;
  void *v207;
  void *v208;
  void *v209;
  void *v210;
  void *v211;
  void *v212;
  void *v213;
  int v214;
  NSObject *v215;
  void *v216;
  void *v217;
  void *v218;
  void *v219;
  void *v220;
  UIImageView *v221;
  UIImageView *deviceImageView;
  void *v223;
  void *v224;
  uint64_t battLevelSingle;
  HPSBatteryGroupView *v226;
  double v227;
  HPSBatteryGroupView *v228;
  HPSBatteryGroupView *deviceBatteryLevelSingleView;
  void *v230;
  void *v231;
  void *v232;
  void *v233;
  void *v234;
  void *v235;
  void *v236;
  void *v237;
  void *v238;
  void *v239;
  void *v240;
  void *v241;
  NSObject *v242;
  uint64_t v243;
  uint64_t v244;
  uint64_t v245;
  uint64_t v246;
  int v247;
  unsigned int battLevelRight;
  NSObject *v249;
  NSObject *v250;
  void *v251;
  unsigned int v252;
  void *v253;
  void *v254;
  void *v255;
  void *v256;
  void *v257;
  unsigned int v258;
  uint8_t buf[4];
  _BYTE v260[10];
  __int16 v261;
  int v262;
  uint64_t v263;

  v263 = *MEMORY[0x1E0C80C00];
  -[HPSBatteryStatusView subviews](self, "subviews");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "enumerateObjectsUsingBlock:", &__block_literal_global_12);

  -[BluetoothDeviceProtocol classicDevice](self->currentDevice, "classicDevice");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "productId");

  -[HPSBatteryStatusView getAssetsDictionary:](self, "getAssetsDictionary:", v5);
  v257 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v257)
  {
    sharedBluetoothSettingsLogComponent();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1DB30C000, v6, OS_LOG_TYPE_DEFAULT, "Battery Status: setupViews returning because assetsDict is NULL", buf, 2u);
    }
    goto LABEL_111;
  }
  v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[HPSBatteryStatusView heightAnchor](self, "heightAnchor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "constraintEqualToConstant:", 214.0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSObject addObject:](v6, "addObject:", v8);

  v258 = 0;
  -[BluetoothDeviceProtocol classicDevice](self->currentDevice, "classicDevice");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "getDeviceColor:", &v258);

  self->deviceColor = -[HPSBatteryStatusView bestDeviceColor:productID:](self, "bestDeviceColor:productID:", v258, v5);
  sharedBluetoothSettingsLogComponent();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    deviceColor = self->deviceColor;
    untethered = self->untethered;
    *(_DWORD *)buf = 67109632;
    *(_DWORD *)v260 = deviceColor;
    *(_WORD *)&v260[4] = 1024;
    *(_DWORD *)&v260[6] = untethered;
    v261 = 1024;
    v262 = v5;
    _os_log_impl(&dword_1DB30C000, v10, OS_LOG_TYPE_DEFAULT, "Battery Status: device color: %u untethered: %d pid: %d", buf, 0x14u);
  }

  v13 = self->untethered;
  v14 = -[HPSBatteryStatusView isProductOfDifferentColors](self, "isProductOfDifferentColors");
  if (!v13)
  {
    if (v14)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@-%d"), self->productIdString, self->deviceColor);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithString:", self->productIdString);
    }
    v27 = (void *)MEMORY[0x1E0DC3870];
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "imageNamed:inBundle:compatibleWithTraitCollection:", v15, v28, 0);
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v29)
    {
      sharedBluetoothSettingsLogComponent();
      v30 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)v260 = v15;
        _os_log_impl(&dword_1DB30C000, v30, OS_LOG_TYPE_DEFAULT, "Battery Status: deviceImageFileName not found %@", buf, 0xCu);
      }

      if (-[HPSBatteryStatusView isProductOfDifferentColors](self, "isProductOfDifferentColors"))
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@-%@"), self->productIdString, CFSTR("Default"));
        v31 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v31 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithString:", self->productIdString);
      }
      v218 = (void *)v31;

      v219 = (void *)MEMORY[0x1E0DC3870];
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v220 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v219, "imageNamed:inBundle:compatibleWithTraitCollection:", v218, v220, 0);
      v29 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v29)
      {
        sharedBluetoothSettingsLogComponent();
        v242 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v242, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          *(_QWORD *)v260 = v218;
          _os_log_impl(&dword_1DB30C000, v242, OS_LOG_TYPE_DEFAULT, "Battery Status: default deviceImageFileName not found %@ returning", buf, 0xCu);
        }

        goto LABEL_111;
      }
      v15 = v218;
    }
    v221 = (UIImageView *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3890]), "initWithImage:", v29);
    deviceImageView = self->deviceImageView;
    self->deviceImageView = v221;

    -[HPSBatteryStatusView applyFilters:imageView:](self, "applyFilters:imageView:", v257, self->deviceImageView);
    -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](self->deviceImageView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIImageView heightAnchor](self->deviceImageView, "heightAnchor");
    v223 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v223, "constraintEqualToConstant:", 108.0);
    v224 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject addObject:](v6, "addObject:", v224);

    -[UIImageView setContentMode:](self->deviceImageView, "setContentMode:", 1);
    -[HPSBatteryStatusView addSubview:](self, "addSubview:", self->deviceImageView);
    if (self->untethered)
      battLevelSingle = (self->status.battLevelRight + self->status.battLevelLeft) >> 1;
    else
      battLevelSingle = self->status.battLevelSingle;
    v226 = [HPSBatteryGroupView alloc];
    -[HPSBatteryStatusView size](self, "size");
    v228 = -[HPSBatteryGroupView initWithFrame:batteryPercent:isCharging:glyph:batteryLevelDescription:](v226, "initWithFrame:batteryPercent:isCharging:glyph:batteryLevelDescription:", battLevelSingle, self->status.battIsChargingSingle != 0, 0, 0, 0.0, 0.0, v227, 30.0);
    deviceBatteryLevelSingleView = self->deviceBatteryLevelSingleView;
    self->deviceBatteryLevelSingleView = v228;

    -[HPSBatteryGroupView setTranslatesAutoresizingMaskIntoConstraints:](self->deviceBatteryLevelSingleView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[HPSBatteryGroupView setSemanticContentAttribute:](self->deviceBatteryLevelSingleView, "setSemanticContentAttribute:", 3);
    -[HPSBatteryStatusView addSubview:](self, "addSubview:", self->deviceBatteryLevelSingleView);
    -[UIImageView centerYAnchor](self->deviceImageView, "centerYAnchor");
    v230 = (void *)objc_claimAutoreleasedReturnValue();
    -[HPSBatteryStatusView bottomAnchor](self, "bottomAnchor");
    v231 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v230, "constraintEqualToAnchor:constant:", v231, -136.0);
    v232 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject addObject:](v6, "addObject:", v232);

    -[UIImageView centerXAnchor](self->deviceImageView, "centerXAnchor");
    v233 = (void *)objc_claimAutoreleasedReturnValue();
    -[HPSBatteryStatusView centerXAnchor](self, "centerXAnchor");
    v234 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v233, "constraintEqualToAnchor:", v234);
    v235 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject addObject:](v6, "addObject:", v235);

    -[HPSBatteryGroupView centerXAnchor](self->deviceBatteryLevelSingleView, "centerXAnchor");
    v236 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView centerXAnchor](self->deviceImageView, "centerXAnchor");
    v237 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v236, "constraintEqualToAnchor:", v237);
    v238 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject addObject:](v6, "addObject:", v238);

    -[HPSBatteryGroupView bottomAnchor](self->deviceBatteryLevelSingleView, "bottomAnchor");
    v239 = (void *)objc_claimAutoreleasedReturnValue();
    -[HPSBatteryStatusView bottomAnchor](self, "bottomAnchor");
    v240 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v239, "constraintEqualToAnchor:constant:", v240, -24.0);
    v241 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject addObject:](v6, "addObject:", v241);

    goto LABEL_110;
  }
  if (v14)
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@-%@-%d"), self->productIdString, CFSTR("Left"), self->deviceColor);
  else
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@-%@"), self->productIdString, CFSTR("Left"), v243);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v252 = v5;
  v17 = -[HPSBatteryStatusView isProductOfDifferentColors](self, "isProductOfDifferentColors");
  productIdString = self->productIdString;
  if (v17)
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@-%@-%d"), productIdString, CFSTR("Right"), self->deviceColor);
  else
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@-%@"), productIdString, CFSTR("Right"), v244);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (void *)MEMORY[0x1E0DC3870];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "imageNamed:inBundle:compatibleWithTraitCollection:", v16, v21, 0);
  v22 = objc_claimAutoreleasedReturnValue();

  v23 = (void *)MEMORY[0x1E0DC3870];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "imageNamed:inBundle:compatibleWithTraitCollection:", v19, v24, 0);
  v25 = objc_claimAutoreleasedReturnValue();

  v254 = (void *)v22;
  if (v22)
    goto LABEL_28;
  sharedBluetoothSettingsLogComponent();
  v26 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    *(_QWORD *)v260 = v16;
    _os_log_impl(&dword_1DB30C000, v26, OS_LOG_TYPE_DEFAULT, "Battery Status: leftBudImageFileName not found %@", buf, 0xCu);
  }

  if (-[HPSBatteryStatusView isProductOfDifferentColors](self, "isProductOfDifferentColors"))
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@-%@-%@"), self->productIdString, CFSTR("Left"), CFSTR("Default"));
  else
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@-%@"), self->productIdString, CFSTR("Left"), v245);
  v32 = objc_claimAutoreleasedReturnValue();

  v33 = (void *)MEMORY[0x1E0DC3870];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "imageNamed:inBundle:compatibleWithTraitCollection:", v32, v34, 0);
  v35 = objc_claimAutoreleasedReturnValue();

  v16 = (void *)v32;
  v254 = (void *)v35;
  if (v35)
  {
LABEL_28:
    v251 = v16;
    if (v25)
    {
      v253 = v19;
LABEL_37:
      v40 = (UIImageView *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3890]), "initWithImage:", v254);
      leftImageView = self->leftImageView;
      self->leftImageView = v40;

      v250 = v25;
      v42 = (UIImageView *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3890]), "initWithImage:", v25);
      rightImageView = self->rightImageView;
      self->rightImageView = v42;

      -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](self->leftImageView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](self->rightImageView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      -[HPSBatteryStatusView applyFilters:imageView:](self, "applyFilters:imageView:", v257, self->leftImageView);
      -[HPSBatteryStatusView applyFilters:imageView:](self, "applyFilters:imageView:", v257, self->rightImageView);
      objc_msgSend(v257, "objectForKey:", CFSTR("BudHeight"));
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "floatValue");
      v46 = v45;

      objc_msgSend(v254, "size");
      v48 = v47;
      v49 = (float)(v46 / v48);
      objc_msgSend(v254, "size");
      v51 = v50 * v49;
      v52 = (float)(v51 * 2.0) + 0.0;
      v53 = objc_alloc_init(MEMORY[0x1E0DC3F10]);
      objc_msgSend(v53, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      objc_msgSend(v53, "setSemanticContentAttribute:", 3);
      v256 = v53;
      if (!self->untethered)
        goto LABEL_49;
      v54 = self->status.battLevelLeft - self->status.battLevelRight;
      if (v54 < 0)
        v54 = self->status.battLevelRight - self->status.battLevelLeft;
      if (v54 >= 0xB)
      {
        objc_msgSend(v257, "objectForKey:", CFSTR("SeparateSpacingBetweenBuds"));
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v55, "floatValue");
        v57 = v56;

        objc_msgSend(v257, "objectForKey:", CFSTR("SeparateSpacingBudsCase"));
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v58, "floatValue");
        v60 = v59;

        objc_msgSend(v53, "heightAnchor");
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v61, "constraintEqualToConstant:", v46);
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject addObject:](v6, "addObject:", v62);

        objc_msgSend(v53, "widthAnchor");
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v257, "objectForKey:", CFSTR("SeparateSpacingBetweenBuds"));
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v64, "floatValue");
        objc_msgSend(v63, "constraintEqualToConstant:", (float)(v65 + (float)(v51 * 2.0)));
        v66 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject addObject:](v6, "addObject:", v66);

        -[UIImageView setContentMode:](self->leftImageView, "setContentMode:", 1);
        -[UIImageView heightAnchor](self->leftImageView, "heightAnchor");
        v67 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v67, "constraintEqualToConstant:", v46);
        v68 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject addObject:](v6, "addObject:", v68);

        -[UIImageView setContentMode:](self->rightImageView, "setContentMode:", 1);
        -[UIImageView heightAnchor](self->rightImageView, "heightAnchor");
        v69 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v69, "constraintEqualToConstant:", v46);
        v70 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject addObject:](v6, "addObject:", v70);

        objc_msgSend(v53, "addSubview:", self->leftImageView);
        objc_msgSend(v53, "addSubview:", self->rightImageView);
        battLevelLeft = self->status.battLevelLeft;
        v247 = self->status.battLevelLeft;
        battLevelRight = self->status.battLevelRight;
        v72 = [HPSBatteryGroupView alloc];
        -[HPSBatteryStatusView size](self, "size");
        v74 = v73;
        v75 = self->status.battIsChargingLeft != 0;
        objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
        v76 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v76, "localizedStringForKey:value:table:", CFSTR("ACCESSORY_ABOUT_SERIAL_NUMBER_LEFT"), &stru_1EA29D890, CFSTR("DeviceConfig"));
        v77 = (void *)objc_claimAutoreleasedReturnValue();
        v78 = -[HPSBatteryGroupView initWithFrame:batteryPercent:isCharging:glyph:batteryLevelDescription:](v72, "initWithFrame:batteryPercent:isCharging:glyph:batteryLevelDescription:", battLevelLeft, v75, 0, v77, 0.0, 0.0, v74, 30.0);
        deviceBatteryLevelLeftView = self->deviceBatteryLevelLeftView;
        self->deviceBatteryLevelLeftView = v78;

        -[HPSBatteryGroupView setTranslatesAutoresizingMaskIntoConstraints:](self->deviceBatteryLevelLeftView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
        -[HPSBatteryGroupView setSemanticContentAttribute:](self->deviceBatteryLevelLeftView, "setSemanticContentAttribute:", 3);
        v80 = [HPSBatteryGroupView alloc];
        -[HPSBatteryStatusView size](self, "size");
        v82 = v81;
        v83 = self->status.battIsChargingRight != 0;
        objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
        v84 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v84, "localizedStringForKey:value:table:", CFSTR("ACCESSORY_ABOUT_SERIAL_NUMBER_RIGHT"), &stru_1EA29D890, CFSTR("DeviceConfig"));
        v85 = (void *)objc_claimAutoreleasedReturnValue();
        v86 = -[HPSBatteryGroupView initWithFrame:batteryPercent:isCharging:glyph:batteryLevelDescription:](v80, "initWithFrame:batteryPercent:isCharging:glyph:batteryLevelDescription:", battLevelRight, v83, 0, v85, 0.0, 0.0, v82, 30.0);
        v87 = 536;
        deviceBatteryLevelRightView = self->deviceBatteryLevelRightView;
        self->deviceBatteryLevelRightView = v86;

        -[HPSBatteryGroupView setTranslatesAutoresizingMaskIntoConstraints:](self->deviceBatteryLevelRightView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
        -[HPSBatteryGroupView setSemanticContentAttribute:](self->deviceBatteryLevelRightView, "setSemanticContentAttribute:", 3);
        if (v247)
          objc_msgSend(v256, "addSubview:", self->deviceBatteryLevelLeftView);
        if (battLevelRight)
          objc_msgSend(v256, "addSubview:", self->deviceBatteryLevelRightView);
        v89 = v52 + v57;
        -[UIImageView leadingAnchor](self->leftImageView, "leadingAnchor");
        v90 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v256, "leadingAnchor");
        v91 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v90, "constraintEqualToAnchor:", v91);
        v92 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject addObject:](v6, "addObject:", v92);

        -[UIImageView centerXAnchor](self->rightImageView, "centerXAnchor");
        v93 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIImageView centerXAnchor](self->leftImageView, "centerXAnchor");
        v94 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v257, "objectForKey:", CFSTR("SeparateSpacingBetweenBuds"));
        v95 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v95, "floatValue");
        objc_msgSend(v93, "constraintEqualToAnchor:constant:", v94, (float)(v96 + v51));
        v97 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject addObject:](v6, "addObject:", v97);

        if (v247)
        {
          -[HPSBatteryGroupView centerXAnchor](self->deviceBatteryLevelLeftView, "centerXAnchor");
          v98 = (void *)objc_claimAutoreleasedReturnValue();
          -[UIImageView centerXAnchor](self->leftImageView, "centerXAnchor");
          v99 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v98, "constraintEqualToAnchor:", v99);
          v100 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSObject addObject:](v6, "addObject:", v100);

          -[HPSBatteryGroupView bottomAnchor](self->deviceBatteryLevelLeftView, "bottomAnchor");
          v101 = (void *)objc_claimAutoreleasedReturnValue();
          -[HPSBatteryStatusView bottomAnchor](self, "bottomAnchor");
          v102 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v101, "constraintEqualToAnchor:constant:", v102, -24.0);
          v103 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSObject addObject:](v6, "addObject:", v103);

        }
        v104 = v89 + v60;
        if (battLevelRight)
        {
          -[HPSBatteryGroupView centerXAnchor](self->deviceBatteryLevelRightView, "centerXAnchor");
          v105 = (void *)objc_claimAutoreleasedReturnValue();
          -[UIImageView centerXAnchor](self->rightImageView, "centerXAnchor");
          v106 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v105, "constraintEqualToAnchor:", v106);
          v107 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSObject addObject:](v6, "addObject:", v107);
LABEL_59:

          objc_msgSend(*(id *)((char *)&self->super.super.super.isa + v87), "bottomAnchor");
          v141 = (void *)objc_claimAutoreleasedReturnValue();
          -[HPSBatteryStatusView bottomAnchor](self, "bottomAnchor");
          v142 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v141, "constraintEqualToAnchor:constant:", v142, -24.0);
          v143 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = v253;
          v144 = v256;
          v145 = 0x1E0CB3000;
          -[NSObject addObject:](v6, "addObject:", v143);

          goto LABEL_61;
        }
      }
      else
      {
LABEL_49:
        objc_msgSend(v257, "objectForKey:", CFSTR("UnifiedSpacingBetweenBuds"));
        v108 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v108, "floatValue");
        v110 = v109;

        objc_msgSend(v257, "objectForKey:", CFSTR("UnifiedSpacingBudsCase"));
        v111 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v111, "floatValue");
        v113 = v112;

        objc_msgSend(v53, "heightAnchor");
        v114 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v114, "constraintEqualToConstant:", v46);
        v115 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject addObject:](v6, "addObject:", v115);

        objc_msgSend(v53, "widthAnchor");
        v116 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v257, "objectForKey:", CFSTR("UnifiedSpacingBetweenBuds"));
        v117 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v117, "floatValue");
        objc_msgSend(v116, "constraintEqualToConstant:", (float)(v118 + (float)(v51 * 2.0)));
        v119 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject addObject:](v6, "addObject:", v119);

        -[UIImageView setContentMode:](self->leftImageView, "setContentMode:", 1);
        -[UIImageView heightAnchor](self->leftImageView, "heightAnchor");
        v120 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v120, "constraintEqualToConstant:", v46);
        v121 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject addObject:](v6, "addObject:", v121);

        -[UIImageView setContentMode:](self->rightImageView, "setContentMode:", 1);
        -[UIImageView heightAnchor](self->rightImageView, "heightAnchor");
        v122 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v122, "constraintEqualToConstant:", v46);
        v123 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject addObject:](v6, "addObject:", v123);

        objc_msgSend(v53, "addSubview:", self->leftImageView);
        objc_msgSend(v53, "addSubview:", self->rightImageView);
        if (self->untethered)
          v124 = (self->status.battLevelRight + self->status.battLevelLeft) >> 1;
        else
          v124 = self->status.battLevelSingle;
        v125 = [HPSBatteryGroupView alloc];
        -[HPSBatteryStatusView size](self, "size");
        if (self->status.battIsChargingLeft)
          v127 = 1;
        else
          v127 = self->status.battIsChargingRight != 0;
        v128 = v52 + v110;
        v129 = -[HPSBatteryGroupView initWithFrame:batteryPercent:isCharging:glyph:batteryLevelDescription:](v125, "initWithFrame:batteryPercent:isCharging:glyph:batteryLevelDescription:", v124, v127, 0, 0, 0.0, 0.0, v126, 30.0);
        v87 = 544;
        v130 = self->deviceBatteryLevelSingleView;
        self->deviceBatteryLevelSingleView = v129;

        -[HPSBatteryGroupView setSemanticContentAttribute:](self->deviceBatteryLevelSingleView, "setSemanticContentAttribute:", 3);
        if ((_DWORD)v124)
        {
          -[HPSBatteryGroupView setTranslatesAutoresizingMaskIntoConstraints:](self->deviceBatteryLevelSingleView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
          -[HPSBatteryStatusView addSubview:](self, "addSubview:", self->deviceBatteryLevelSingleView);
        }
        v104 = v128 + v113;
        -[UIImageView leadingAnchor](self->leftImageView, "leadingAnchor");
        v131 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v53, "leadingAnchor");
        v132 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v131, "constraintEqualToAnchor:", v132);
        v133 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject addObject:](v6, "addObject:", v133);

        -[UIImageView centerXAnchor](self->rightImageView, "centerXAnchor");
        v134 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIImageView centerXAnchor](self->leftImageView, "centerXAnchor");
        v135 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v257, "objectForKey:", CFSTR("UnifiedSpacingBetweenBuds"));
        v136 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v136, "floatValue");
        objc_msgSend(v134, "constraintEqualToAnchor:constant:", v135, (float)(v137 + v51));
        v138 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject addObject:](v6, "addObject:", v138);

        if ((_DWORD)v124)
        {
          -[HPSBatteryGroupView centerXAnchor](self->deviceBatteryLevelSingleView, "centerXAnchor");
          v105 = (void *)objc_claimAutoreleasedReturnValue();
          -[UIImageView centerXAnchor](self->leftImageView, "centerXAnchor");
          v106 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v257, "objectForKey:", CFSTR("UnifiedSpacingBetweenBuds"));
          v107 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v107, "floatValue");
          objc_msgSend(v105, "constraintEqualToAnchor:constant:", v106, (float)((float)(v139 + v51) * 0.5));
          v140 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSObject addObject:](v6, "addObject:", v140);

          goto LABEL_59;
        }
      }
      v19 = v253;
      v144 = v256;
      v145 = 0x1E0CB3000uLL;
LABEL_61:
      if (-[HPSBatteryStatusView isProductOfDifferentColors](self, "isProductOfDifferentColors"))
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@_%@-%d"), self->productIdString, CFSTR("Case"), self->deviceColor);
      else
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@_%@"), self->productIdString, CFSTR("Case"), v245);
      v146 = (void *)objc_claimAutoreleasedReturnValue();
      v147 = (void *)MEMORY[0x1E0DC3870];
      objc_msgSend(*(id *)(v145 + 1232), "bundleForClass:", objc_opt_class());
      v148 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v147, "imageNamed:inBundle:compatibleWithTraitCollection:", v146, v148, 0);
      v149 = objc_claimAutoreleasedReturnValue();

      if (v149)
      {
        v150 = v146;
      }
      else
      {
        sharedBluetoothSettingsLogComponent();
        v155 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v155, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          *(_QWORD *)v260 = v146;
          _os_log_impl(&dword_1DB30C000, v155, OS_LOG_TYPE_DEFAULT, "Battery Status: caseImageFileName not found %@", buf, 0xCu);
        }

        if (-[HPSBatteryStatusView isProductOfDifferentColors](self, "isProductOfDifferentColors"))
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@_%@-%@"), self->productIdString, CFSTR("Case"), CFSTR("Default"));
        else
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@_%@"), self->productIdString, CFSTR("Case"), v246);
        v150 = (void *)objc_claimAutoreleasedReturnValue();

        v216 = (void *)MEMORY[0x1E0DC3870];
        objc_msgSend(*(id *)(v145 + 1232), "bundleForClass:", objc_opt_class());
        v217 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v216, "imageNamed:inBundle:compatibleWithTraitCollection:", v150, v217, 0);
        v149 = objc_claimAutoreleasedReturnValue();

        if (!v149 && v252 != 8230)
        {
          sharedBluetoothSettingsLogComponent();
          v186 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v186, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            *(_QWORD *)v260 = v150;
            _os_log_impl(&dword_1DB30C000, v186, OS_LOG_TYPE_DEFAULT, "Battery Status: Default caseImageFileName not found %@ returning", buf, 0xCu);
          }
          v214 = 1;
          v16 = v251;
          goto LABEL_88;
        }
      }
      v151 = (UIImageView *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3890]), "initWithImage:", v149);
      p_caseImageView = &self->caseImageView;
      caseImageView = self->caseImageView;
      self->caseImageView = v151;

      caseEngravingView = self->caseEngravingView;
      if (caseEngravingView)
        objc_storeStrong((id *)&self->caseImageView, caseEngravingView);
      else
        -[HPSBatteryStatusView applyFilters:imageView:](self, "applyFilters:imageView:", v257, *p_caseImageView);
      -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](*p_caseImageView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      objc_msgSend(v257, "objectForKey:", CFSTR("CaseHeight"));
      v156 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v156, "floatValue");
      v158 = v157;

      -[NSObject size](v149, "size");
      v160 = v159;
      v249 = v149;
      -[NSObject size](v149, "size");
      v162 = v161;
      -[UIImageView setContentMode:](*p_caseImageView, "setContentMode:", 1);
      -[UIImageView heightAnchor](*p_caseImageView, "heightAnchor");
      v163 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v163, "constraintEqualToConstant:", v158);
      v164 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject addObject:](v6, "addObject:", v164);

      v255 = v150;
      if (self->untethered)
      {
        v165 = self->status.battLevelLeft - self->status.battLevelRight;
        if (v165 < 0)
          v165 = self->status.battLevelRight - self->status.battLevelLeft;
        v166 = 0x1E0DC3000;
        if (v165 >= 0xB
          && (-[HPSBatteryStatusView getDeviceCaseIcon:](self, "getDeviceCaseIcon:", v252),
              v167 = (void *)objc_claimAutoreleasedReturnValue(),
              v167,
              v167))
        {
          v168 = objc_alloc(MEMORY[0x1E0DC3890]);
          -[HPSBatteryStatusView getDeviceCaseIcon:](self, "getDeviceCaseIcon:", v252);
          v169 = (void *)objc_claimAutoreleasedReturnValue();
          v170 = (void *)objc_msgSend(v168, "initWithImage:", v169);

        }
        else
        {
          v170 = 0;
        }
      }
      else
      {
        v170 = 0;
        v166 = 0x1E0DC3000uLL;
      }
      v171 = [HPSBatteryGroupView alloc];
      -[HPSBatteryStatusView size](self, "size");
      v173 = -[HPSBatteryGroupView initWithFrame:batteryPercent:isCharging:glyph:batteryLevelDescription:](v171, "initWithFrame:batteryPercent:isCharging:glyph:batteryLevelDescription:", self->status.battLevelCase, self->status.battIsChargingCase != 0, v170, 0, 0.0, 0.0, v172, 30.0);
      deviceBatteryLevelCaseView = self->deviceBatteryLevelCaseView;
      self->deviceBatteryLevelCaseView = v173;

      -[HPSBatteryGroupView setTranslatesAutoresizingMaskIntoConstraints:](self->deviceBatteryLevelCaseView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      -[HPSBatteryGroupView setSemanticContentAttribute:](self->deviceBatteryLevelCaseView, "setSemanticContentAttribute:", 3);
      v175 = objc_alloc_init(*(Class *)(v166 + 3856));
      objc_msgSend(v175, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      objc_msgSend(v175, "setSemanticContentAttribute:", 3);
      objc_msgSend(v175, "heightAnchor");
      v176 = (void *)objc_claimAutoreleasedReturnValue();
      v177 = v176;
      if (v158 <= v46)
        v178 = v46;
      else
        v178 = v158;
      objc_msgSend(v176, "constraintEqualToConstant:", v178);
      v179 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject addObject:](v6, "addObject:", v179);

      if (v252 == 8230)
      {
        objc_msgSend(v175, "centerXAnchor");
        v180 = (void *)objc_claimAutoreleasedReturnValue();
        v181 = v256;
        objc_msgSend(v256, "centerXAnchor");
        v182 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v180, "constraintEqualToAnchor:", v182);
        v183 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject addObject:](v6, "addObject:", v183);

      }
      else
      {
        v184 = v160;
        v185 = v104 + (float)(v158 / v184) * v162;
        objc_msgSend(v175, "widthAnchor");
        v180 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v180, "constraintEqualToConstant:", v185);
        v182 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject addObject:](v6, "addObject:", v182);
        v181 = v256;
      }
      v186 = v249;

      objc_msgSend(v175, "addSubview:", v181);
      objc_msgSend(v175, "addSubview:", *p_caseImageView);
      -[HPSBatteryStatusView addSubview:](self, "addSubview:", v175);
      -[HPSBatteryStatusView addSubview:](self, "addSubview:", self->deviceBatteryLevelCaseView);
      objc_msgSend(v175, "centerYAnchor");
      v187 = (void *)objc_claimAutoreleasedReturnValue();
      -[HPSBatteryStatusView bottomAnchor](self, "bottomAnchor");
      v188 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v187, "constraintEqualToAnchor:constant:", v188, -136.0);
      v189 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject addObject:](v6, "addObject:", v189);

      objc_msgSend(v256, "leadingAnchor");
      v190 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v175, "leadingAnchor");
      v191 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v190, "constraintEqualToAnchor:", v191);
      v192 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject addObject:](v6, "addObject:", v192);

      objc_msgSend(v256, "centerXAnchor");
      v193 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v175, "centerXAnchor");
      v194 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v193, "constraintEqualToAnchor:", v194);
      v195 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject addObject:](v6, "addObject:", v195);

      objc_msgSend(v256, "centerYAnchor");
      v196 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v175, "centerYAnchor");
      v197 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v196, "constraintEqualToAnchor:", v197);
      v198 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject addObject:](v6, "addObject:", v198);

      objc_msgSend(v175, "centerXAnchor");
      v199 = (void *)objc_claimAutoreleasedReturnValue();
      -[HPSBatteryStatusView centerXAnchor](self, "centerXAnchor");
      v200 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v199, "constraintEqualToAnchor:", v200);
      v201 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject addObject:](v6, "addObject:", v201);

      objc_msgSend(v175, "centerYAnchor");
      v202 = (void *)objc_claimAutoreleasedReturnValue();
      -[HPSBatteryStatusView centerYAnchor](self, "centerYAnchor");
      v203 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v202, "constraintEqualToAnchor:", v203);
      v204 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject addObject:](v6, "addObject:", v204);

      -[UIImageView trailingAnchor](*p_caseImageView, "trailingAnchor");
      v205 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v175, "trailingAnchor");
      v206 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v205, "constraintEqualToAnchor:", v206);
      v207 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject addObject:](v6, "addObject:", v207);

      -[HPSBatteryGroupView centerXAnchor](self->deviceBatteryLevelCaseView, "centerXAnchor");
      v208 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIImageView centerXAnchor](*p_caseImageView, "centerXAnchor");
      v209 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v208, "constraintEqualToAnchor:", v209);
      v210 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject addObject:](v6, "addObject:", v210);

      v144 = v256;
      -[HPSBatteryGroupView bottomAnchor](self->deviceBatteryLevelCaseView, "bottomAnchor");
      v211 = (void *)objc_claimAutoreleasedReturnValue();
      -[HPSBatteryStatusView bottomAnchor](self, "bottomAnchor");
      v212 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v211, "constraintEqualToAnchor:constant:", v212, -24.0);
      v213 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject addObject:](v6, "addObject:", v213);

      v214 = 0;
      v19 = v253;
      v16 = v251;
      v150 = v255;
LABEL_88:

      v215 = v250;
      goto LABEL_89;
    }
    sharedBluetoothSettingsLogComponent();
    v36 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)v260 = v19;
      _os_log_impl(&dword_1DB30C000, v36, OS_LOG_TYPE_DEFAULT, "Battery Status: rightBudImageFileName not found %@", buf, 0xCu);
    }

    if (-[HPSBatteryStatusView isProductOfDifferentColors](self, "isProductOfDifferentColors"))
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@-%@-%@"), self->productIdString, CFSTR("Right"), CFSTR("Default"));
    else
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@-%@"), self->productIdString, CFSTR("Right"), v245);
    v37 = objc_claimAutoreleasedReturnValue();

    v38 = (void *)MEMORY[0x1E0DC3870];
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "imageNamed:inBundle:compatibleWithTraitCollection:", v37, v39, 0);
    v25 = objc_claimAutoreleasedReturnValue();

    if (v25)
    {
      v253 = (void *)v37;
      goto LABEL_37;
    }
    sharedBluetoothSettingsLogComponent();
    v215 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v215, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)v260 = v37;
      _os_log_impl(&dword_1DB30C000, v215, OS_LOG_TYPE_DEFAULT, "Battery Status: Default rightBudImageFileName not found %@ returning", buf, 0xCu);
    }
    v214 = 1;
    v19 = (void *)v37;
    v16 = v251;
  }
  else
  {
    sharedBluetoothSettingsLogComponent();
    v215 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v215, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)v260 = v32;
      _os_log_impl(&dword_1DB30C000, v215, OS_LOG_TYPE_DEFAULT, "Battery Status: Default leftBudImageFileName not found %@ returning", buf, 0xCu);
    }
    v214 = 1;
    v254 = (void *)v25;
  }
LABEL_89:

  if (!v214)
LABEL_110:
    objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v6);
LABEL_111:

}

uint64_t __34__HPSBatteryStatusView_setupViews__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "removeFromSuperview");
}

- (BOOL)isProductOfDifferentColors
{
  void *v2;
  int v3;

  -[BluetoothDeviceProtocol classicDevice](self->currentDevice, "classicDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "productId");

  return ((v3 - 8195) < 0x24) & (0xC1498E7CDuLL >> (v3 - 3));
}

- (unsigned)defaultFiltersID
{
  void *v2;
  int v3;

  -[BluetoothDeviceProtocol classicDevice](self->currentDevice, "classicDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "productId");

  return ((v3 - 8204) & 0xFFFFFFFB) == 0;
}

- (id)getProductIDString
{
  void *v2;
  int v3;

  -[BluetoothDeviceProtocol classicDevice](self->currentDevice, "classicDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "productId");

  if ((v3 - 8194) > 0x24)
    return CFSTR("UNKNOWN");
  else
    return off_1EA29B8C0[v3 - 8194];
}

- (unsigned)bestDeviceColor:(unsigned int)a3 productID:(unsigned int)a4
{
  int v4;
  char v5;

  if (a4 - 8202 <= 0x15)
  {
    v4 = 1 << (a4 - 10);
    if ((v4 & 0x182) != 0)
    {
      v5 = a3 & 0xF;
      if ((~a3 & 0xF) == 0)
        v5 = 0;
      if (a3 >> 4 == 15)
        LOBYTE(a3) = v5;
      else
        LOBYTE(a3) = a3 >> 4;
    }
    else if ((v4 & 0x200001) != 0)
    {
      LOBYTE(a3) = a3 & 0x1F;
    }
  }
  return a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->deviceBatteryLevelCaseView, 0);
  objc_storeStrong((id *)&self->deviceBatteryLevelSingleView, 0);
  objc_storeStrong((id *)&self->deviceBatteryLevelRightView, 0);
  objc_storeStrong((id *)&self->deviceBatteryLevelLeftView, 0);
  objc_storeStrong((id *)&self->caseEngravingView, 0);
  objc_storeStrong((id *)&self->engravingService, 0);
  objc_storeStrong((id *)&self->rightImageView, 0);
  objc_storeStrong((id *)&self->leftImageView, 0);
  objc_storeStrong((id *)&self->caseImageView, 0);
  objc_storeStrong((id *)&self->deviceImageView, 0);
  objc_storeStrong((id *)&self->productIdString, 0);
  objc_storeStrong((id *)&self->currentDevice, 0);
}

@end
