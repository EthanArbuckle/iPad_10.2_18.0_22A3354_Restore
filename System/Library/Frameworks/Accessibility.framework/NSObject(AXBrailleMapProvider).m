@implementation NSObject(AXBrailleMapProvider)

- (void)setAccessibilityBrailleMapRenderer:()AXBrailleMapProvider
{
  void *v4;

  v4 = _Block_copy(aBlock);
  objc_setAssociatedObject(a1, &AXBrailleRegion, v4, (void *)3);
}

- (id)accessibilityBrailleMapRenderer
{
  void *v1;
  void *v2;

  objc_getAssociatedObject(a1, &AXBrailleRegion);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = _Block_copy(v1);

  return v2;
}

- (double)accessibilityBrailleMapRenderRegion
{
  void *v1;
  void *v2;
  double v3;
  double v4;

  objc_getAssociatedObject(a1, &AXBrailleRegion);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v1;
  if (v1)
  {
    objc_msgSend(v1, "rectValue");
    v4 = v3;
  }
  else
  {
    v4 = *MEMORY[0x24BDBF090];
  }

  return v4;
}

- (void)setAccessibilityBrailleMapRenderRegion:()AXBrailleMapProvider
{
  id v2;

  objc_msgSend(MEMORY[0x24BDD1968], "valueWithRect:");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_setAssociatedObject(a1, &AXBrailleRegion, v2, (void *)3);

}

@end
