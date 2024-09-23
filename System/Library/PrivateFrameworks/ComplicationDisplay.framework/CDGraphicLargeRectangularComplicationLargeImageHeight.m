@implementation CDGraphicLargeRectangularComplicationLargeImageHeight

void __CDGraphicLargeRectangularComplicationLargeImageHeight_block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  id v3;

  objc_msgSend(MEMORY[0x24BDB8738], "metricsWithDevice:identitySizeClass:", a2, 2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "scaledValue:withOverride:forSizeClass:", 3, 47.0, 54.0);
  CDGraphicLargeRectangularComplicationLargeImageHeight__largeImageHeight = v2;

}

@end
