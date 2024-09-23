@implementation CCUILandscapeGridLayoutSideMargin

void __CCUILandscapeGridLayoutSideMargin_block_invoke()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "userInterfaceIdiom");

  v2 = 0;
  if (v1 != 1)
  {
    CCUICompactModuleRows();
    CCUIPortraitMainListGridGeometryInfo();
    CCUIReferenceScreenBounds();
    objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "scale");

    UIFloorToScale();
  }
  CCUILandscapeGridLayoutSideMargin_margin = v2;
}

@end
