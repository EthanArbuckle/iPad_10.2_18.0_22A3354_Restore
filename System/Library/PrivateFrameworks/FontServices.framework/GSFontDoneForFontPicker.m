@implementation GSFontDoneForFontPicker

void __GSFontDoneForFontPicker_block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  const char *v4;
  id v5;

  v5 = a3;
  if (IsPathUserInstalledFontFile(v5, v4))
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v5);

}

@end
