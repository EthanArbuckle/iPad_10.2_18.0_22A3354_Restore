@implementation BCBatteryDevice

void __65__BCBatteryDevice_BatteryCenterUI__batteryWidgetGlyphLargestSize__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  id v6;

  v1 = (void *)MEMORY[0x1E0DC3870];
  objc_msgSend(*(id *)(a1 + 32), "_internalBatteryDeviceGlyphName");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "imageNamed:inBundle:", v6, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "size");
  batteryWidgetGlyphLargestSize___largestBatteryDeviceGlyphSize_0 = v4;
  batteryWidgetGlyphLargestSize___largestBatteryDeviceGlyphSize_1 = v5;

}

@end
