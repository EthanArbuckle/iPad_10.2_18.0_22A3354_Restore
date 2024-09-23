@implementation LSPlugInKitProxy(IconAdditions)

- (id)iconForInterfaceStyle:()IconAdditions
{
  void *v1;
  uint64_t v2;
  const void *v3;
  void *v4;

  objc_msgSend(a1, "iconDataForInterfaceStyle:");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if (v1 && (v2 = LICreateIconFromCachedBitmap()) != 0)
  {
    v3 = (const void *)v2;
    objc_msgSend(MEMORY[0x1E0CEA638], "imageWithCGImage:", v2);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    CFRelease(v3);
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)iconDataForInterfaceStyle:()IconAdditions
{
  int v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v9;

  v4 = a3 == 2;
  objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "scale");
  v7 = v6;

  v9 = v7;
  objc_msgSend(a1, "iconDataForVariant:withOptions:", objc_msgSend(MEMORY[0x1E0CEA638], "_iconVariantForUIApplicationIconFormat:scale:", 14, &v9), (v4 << 16));
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
