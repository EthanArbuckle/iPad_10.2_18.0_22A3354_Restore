@implementation CLKUICurvedColoringLabelCenterSize

void __CLKUICurvedColoringLabelCenterSize_block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  uint64_t v10;
  uint64_t v11;
  id v12;

  v2 = (void *)MEMORY[0x1E0C944C0];
  v3 = a2;
  objc_msgSend(v2, "metricsWithDevice:identitySizeClass:", v3, 2);
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "scaledValue:withOverride:forSizeClass:", 3, 54.5, 59.5);
  v5 = v4;
  objc_msgSend(v12, "scaledValue:withOverride:forSizeClass:", 2, 3.0, 1.0);
  v7 = v6;
  objc_msgSend(v12, "scaledValue:", 6.5);
  v9 = v7 + v8;
  objc_msgSend(v3, "screenBounds");
  v11 = v10;

  CLKUICurvedColoringLabelCenterSize__size_0 = v11;
  *(double *)&CLKUICurvedColoringLabelCenterSize__size_1 = v5 + -3.0 + v9;

}

@end
