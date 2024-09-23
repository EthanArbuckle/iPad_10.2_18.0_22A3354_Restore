@implementation UIFontDescriptor(Helper)

- (id)ck_fontDescriptorByRemovingSymbolicTrait:()Helper
{
  id v5;

  if ((objc_msgSend(a1, "symbolicTraits") & a3) != 0)
  {
    objc_msgSend(a1, "fontDescriptorWithSymbolicTraits:", objc_msgSend(a1, "symbolicTraits") & ~a3);
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = a1;
  }
  return v5;
}

- (id)ck_fontDescriptorByAddingSymbolicTrait:()Helper
{
  id v5;

  if ((objc_msgSend(a1, "symbolicTraits") & a3) != 0)
  {
    v5 = a1;
  }
  else
  {
    objc_msgSend(a1, "fontDescriptorWithSymbolicTraits:", objc_msgSend(a1, "symbolicTraits") | a3);
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (uint64_t)ck_hasItalicTrait
{
  return objc_msgSend(a1, "symbolicTraits") & 1;
}

- (uint64_t)ck_hasBoldTrait
{
  return (objc_msgSend(a1, "symbolicTraits") >> 1) & 1;
}

- (id)ck_fontDescriptorBySettingBoldEnabled:()Helper
{
  if (a3)
    objc_msgSend(a1, "ck_fontDescriptorByAddingSymbolicTrait:", 2);
  else
    objc_msgSend(a1, "ck_fontDescriptorByRemovingSymbolicTrait:", 2);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)ck_fontDescriptorBySettingItalicEnabled:()Helper
{
  if (a3)
    objc_msgSend(a1, "ck_fontDescriptorByAddingSymbolicTrait:", 1);
  else
    objc_msgSend(a1, "ck_fontDescriptorByRemovingSymbolicTrait:", 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
