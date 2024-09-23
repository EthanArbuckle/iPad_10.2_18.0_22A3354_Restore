@implementation BCBatteryDevice(BatteryCenterUI)

+ (double)batteryWidgetGlyphLargestSize
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __65__BCBatteryDevice_BatteryCenterUI__batteryWidgetGlyphLargestSize__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (batteryWidgetGlyphLargestSize_onceToken[0] != -1)
    dispatch_once(batteryWidgetGlyphLargestSize_onceToken, block);
  return *(double *)&batteryWidgetGlyphLargestSize___largestBatteryDeviceGlyphSize_0;
}

+ (id)_internalBatteryDeviceGlyphName
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0CEC3F8], "_typeOfCurrentDevice");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = (void *)MEMORY[0x1E0D3A838];
  objc_msgSend(v0, "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "symbolForTypeIdentifier:withResolutionStrategy:variantOptions:error:", v2, 1, 1, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (__CFString)batteryWidgetGlyphName:()BatteryCenterUI
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  __CFString *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __CFString **v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v2 = objc_msgSend(a1, "vendor");
  v3 = objc_msgSend(a1, "accessoryCategory");
  v4 = objc_msgSend(a1, "transportType");
  if (objc_msgSend(a1, "isInternal"))
  {
    objc_msgSend((id)objc_opt_class(), "_internalBatteryDeviceGlyphName");
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
    if (v5)
      return v5;
  }
  if (v2 == 2)
  {
    v5 = CFSTR("beatslogo");
    return v5;
  }
  if (v2 != 1)
  {
    v9 = v3 - 1;
    if ((unint64_t)(v3 - 1) >= 0xA || ((0x3B3u >> v9) & 1) == 0)
      goto LABEL_25;
    v10 = off_1E94185C8;
    goto LABEL_27;
  }
  v6 = objc_msgSend(a1, "productIdentifier");
  v7 = objc_msgSend(a1, "parts");
  if (v4 == 2)
  {
    if (v6 == *MEMORY[0x1E0D01B38])
    {
      v5 = CFSTR("iphone.smartbatterycase.gen1");
      return v5;
    }
    if (v6 == *MEMORY[0x1E0D01B40])
    {
      v5 = CFSTR("iphone.smartbatterycase.gen2");
      return v5;
    }
    goto LABEL_23;
  }
  if (v4 == 4)
  {
    if (v6 == *MEMORY[0x1E0D01B28])
    {
      v5 = CFSTR("magsafe.batterypack.fill");
      return v5;
    }
LABEL_23:
    v9 = v3 - 1;
    if ((unint64_t)(v3 - 1) >= 0xA || ((0x3F7u >> v9) & 1) == 0)
    {
LABEL_25:
      v9 = v4 - 2;
      if ((unint64_t)(v4 - 2) >= 3)
      {
        v5 = 0;
        return v5;
      }
      v10 = off_1E9418618;
      goto LABEL_27;
    }
    v10 = off_1E9418578;
LABEL_27:
    v5 = v10[v9];
    return v5;
  }
  if (v4 != 3)
    goto LABEL_23;
  v8 = (unint64_t)(v7 - 1) >= 4 ? 1 : qword_1D2A83460[v7 - 1];
  objc_msgSend(MEMORY[0x1E0CEC3F8], "_typeWithBluetoothProductID:vendorID:", v6, 76);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)MEMORY[0x1E0D3A838];
  objc_msgSend(v11, "identifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "symbolForTypeIdentifier:withResolutionStrategy:variantOptions:error:", v13, 1, v8, 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "name");
  v5 = (__CFString *)objc_claimAutoreleasedReturnValue();

  if (!v5)
    goto LABEL_23;
  return v5;
}

- (id)batteryWidgetGlyph
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  char v6;

  v6 = 0;
  objc_msgSend(a1, "batteryWidgetGlyphName:", &v6);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = (void *)MEMORY[0x1E0DC3870];
  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "imageNamed:inBundle:", v1, v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3870], "_systemImageNamed:", v1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v4;
}

@end
