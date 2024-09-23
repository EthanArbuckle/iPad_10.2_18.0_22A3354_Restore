@implementation CLKUICurvedColoringLabelCornerSize

double __CLKUICurvedColoringLabelCornerSize_block_invoke(uint64_t a1, uint64_t a2)
{
  double v2;
  double v3;
  double result;
  id v5;

  objc_msgSend(MEMORY[0x1E0C944C0], "metricsWithDevice:identitySizeClass:", a2, 2);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "scaledSize:withOverride:forSizeClass:", 3, 67.0, 56.0, 78.0, 63.0);
  *(double *)&CLKUICurvedColoringLabelCornerSize__size_0 = v2 + -3.0;
  *(double *)&CLKUICurvedColoringLabelCornerSize__size_1 = v3 + -3.0;

  return result;
}

@end
