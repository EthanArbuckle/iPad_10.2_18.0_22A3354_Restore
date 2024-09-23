@implementation NTKWhistlerBezelCircularViewFontSize

void __NTKWhistlerBezelCircularViewFontSize_block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  id v3;

  objc_msgSend(MEMORY[0x1E0C944C0], "metricsWithDevice:identitySizeClass:", a2, 2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "scaledValue:", 12.5);
  NTKWhistlerBezelCircularViewFontSize_fontSize = v2;

}

@end
