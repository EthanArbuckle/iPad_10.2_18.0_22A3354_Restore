@implementation CDGraphicLargeRectangularComplicationCornerRadius

void __CDGraphicLargeRectangularComplicationCornerRadius_block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  id v3;

  objc_msgSend(MEMORY[0x24BDB8738], "metricsWithDevice:identitySizeClass:", a2, 2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "scaledValue:", *MEMORY[0x24BDB8640]);
  CDGraphicLargeRectangularComplicationCornerRadius__cornerRadius = v2;

}

@end
