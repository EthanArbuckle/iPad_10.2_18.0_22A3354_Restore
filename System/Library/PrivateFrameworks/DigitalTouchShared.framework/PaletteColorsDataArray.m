@implementation PaletteColorsDataArray

void __PaletteColorsDataArray_block_invoke(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "objectForKey:", CFSTR("ETColorPickerColors"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "removeObjectForKey:", CFSTR("ETColorPickerColors"));
    objc_msgSend(*(id *)(a1 + 32), "synchronize");
  }
}

@end
