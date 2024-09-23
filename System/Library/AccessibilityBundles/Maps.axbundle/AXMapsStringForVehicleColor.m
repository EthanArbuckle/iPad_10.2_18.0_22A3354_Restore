@implementation AXMapsStringForVehicleColor

void __AXMapsStringForVehicleColor_block_invoke()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;

  objc_msgSend(MEMORY[0x24BDF6950], "colorWithRed:green:blue:alpha:", 0.388235, 0.388235, 0.4, 1.0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)AXMapsStringForVehicleColor_DarkGrayColor;
  AXMapsStringForVehicleColor_DarkGrayColor = v0;

  objc_msgSend(MEMORY[0x24BDF6950], "colorWithRed:green:blue:alpha:", 0.0, 0.239216, 0.501961, 1.0);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)AXMapsStringForVehicleColor_NavyBlueColor;
  AXMapsStringForVehicleColor_NavyBlueColor = v2;

  objc_msgSend(MEMORY[0x24BDF6950], "colorWithRed:green:blue:alpha:", 0.352941, 0.784314, 0.980392, 1.0);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)AXMapsStringForVehicleColor_LightBlueColor;
  AXMapsStringForVehicleColor_LightBlueColor = v4;

  objc_msgSend(MEMORY[0x24BDF6950], "colorWithRed:green:blue:alpha:", 0.0, 0.478431, 1.0, 1.0);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)AXMapsStringForVehicleColor_BlueColor;
  AXMapsStringForVehicleColor_BlueColor = v6;

  objc_msgSend(MEMORY[0x24BDF6950], "colorWithRed:green:blue:alpha:", 0.701961, 0.584314, 0.419608, 1.0);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)AXMapsStringForVehicleColor_BeigeColor;
  AXMapsStringForVehicleColor_BeigeColor = v8;

  objc_msgSend(MEMORY[0x24BDF6950], "colorWithRed:green:blue:alpha:", 0.949019, 0.949019, 0.949019, 1.0);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)AXMapsStringForVehicleColor_DarkModeWhiteColor;
  AXMapsStringForVehicleColor_DarkModeWhiteColor = v10;

  objc_msgSend(MEMORY[0x24BDF6950], "colorWithRed:green:blue:alpha:", 0.701961, 0.6, 0.454902, 1.0);
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = (void *)AXMapsStringForVehicleColor_DarkModeBeigeColor;
  AXMapsStringForVehicleColor_DarkModeBeigeColor = v12;

  objc_msgSend(MEMORY[0x24BDF6950], "colorWithRed:green:blue:alpha:", 0.023529, 0.298039, 0.6, 1.0);
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = (void *)AXMapsStringForVehicleColor_DarkModeNavyBlueColor;
  AXMapsStringForVehicleColor_DarkModeNavyBlueColor = v14;

  objc_msgSend(MEMORY[0x24BDF6950], "colorWithRed:green:blue:alpha:", 0.39216, 0.823529, 1.0, 1.0);
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = (void *)AXMapsStringForVehicleColor_DarkModeLightBlueColor;
  AXMapsStringForVehicleColor_DarkModeLightBlueColor = v16;

  objc_msgSend(MEMORY[0x24BDF6950], "colorWithRed:green:blue:alpha:", 0.03922, 0.517647, 1.0, 1.0);
  v18 = objc_claimAutoreleasedReturnValue();
  v19 = (void *)AXMapsStringForVehicleColor_DarkModeBlueColor;
  AXMapsStringForVehicleColor_DarkModeBlueColor = v18;

}

@end
