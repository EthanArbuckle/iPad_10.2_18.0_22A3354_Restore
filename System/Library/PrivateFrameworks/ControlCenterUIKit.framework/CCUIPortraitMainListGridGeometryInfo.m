@implementation CCUIPortraitMainListGridGeometryInfo

void __CCUIPortraitMainListGridGeometryInfo_block_invoke()
{
  void *v0;
  uint64_t v1;
  double v2;
  double v3;
  double v4;
  CGFloat v5;
  void *v6;
  CGRect v7;

  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "userInterfaceIdiom");

  if (v1 == 1)
  {
    v2 = 10.0;
    v3 = 66.0;
  }
  else
  {
    if (CCUIPortraitGridLayoutSideMargin_onceToken != -1)
      dispatch_once(&CCUIPortraitGridLayoutSideMargin_onceToken, &__block_literal_global_13);
    v4 = *(double *)&CCUIPortraitGridLayoutSideMargin_margin;
    v7.origin.x = CCUIReferenceScreenBounds();
    v5 = CGRectGetWidth(v7) + v4 * -2.0;
    objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "scale");

    v3 = round(v5 / 4.66176471);
    UIFloorToScale();
  }
  CCUIPortraitMainListGridGeometryInfo_gridGeometryInfo_0 = *(_QWORD *)&v3;
  CCUIPortraitMainListGridGeometryInfo_gridGeometryInfo_1 = *(_QWORD *)&v2;
}

@end
