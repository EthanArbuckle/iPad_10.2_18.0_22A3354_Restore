@implementation UIFont(FIUINonBoldingFonts)

+ (id)fiui_nonBoldingRoundedSystemFontOfSize:()FIUINonBoldingFonts weight:
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x24BEBB520], "systemFontOfSize:weight:design:", *MEMORY[0x24BDC4DF0]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_fiui_nonBoldedVersionOfFont:size:", v4, a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (CTFontRef)_fiui_nonBoldedVersionOfFont:()FIUINonBoldingFonts size:
{
  void *v5;
  const __CTFont *v6;
  const __CTFontDescriptor *v7;
  CTFontRef CopyWithAttributes;
  uint64_t v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x24BDAC8D0];
  if (a4)
  {
    v10 = *MEMORY[0x24BDC4D58];
    v11[0] = &unk_24CF4FD58;
    v5 = (void *)MEMORY[0x24BDBCE70];
    v6 = a4;
    v7 = CTFontDescriptorCreateWithAttributes((CFDictionaryRef)objc_msgSend(v5, "dictionaryWithObjects:forKeys:count:", v11, &v10, 1));
    CopyWithAttributes = CTFontCreateCopyWithAttributes(v6, a1, 0, v7);

    CFRelease(v7);
  }
  else
  {
    CopyWithAttributes = 0;
  }
  return CopyWithAttributes;
}

+ (id)fiui_nonBoldingSystemFontOfSize:()FIUINonBoldingFonts
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x24BEBB520], "systemFontOfSize:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_fiui_nonBoldedVersionOfFont:size:", v4, a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)fiui_nonBoldingSystemFontOfSize:()FIUINonBoldingFonts weight:
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x24BEBB520], "systemFontOfSize:weight:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_fiui_nonBoldedVersionOfFont:size:", v4, a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

@end
