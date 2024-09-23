@implementation CCUIPortraitGridLayoutSideMargin

void __CCUIPortraitGridLayoutSideMargin_block_invoke()
{
  void *v0;
  uint64_t v1;
  BOOL v2;
  double v3;
  double v4;
  CGRect v5;
  CGRect v6;

  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "userInterfaceIdiom");

  if (v1)
  {
    v5.origin.x = CCUIReferenceScreenBounds();
    v2 = CGRectGetWidth(v5) < 1024.0;
    v3 = 60.0;
    v4 = 50.0;
  }
  else
  {
    if (SBFEffectiveHomeButtonType() != 2)
    {
      v3 = 44.0;
      goto LABEL_9;
    }
    v6.origin.x = CCUIReferenceScreenBounds();
    v2 = CGRectGetWidth(v6) < 414.0;
    v3 = 46.0;
    v4 = 38.0;
  }
  if (v2)
    v3 = v4;
LABEL_9:
  CCUIPortraitGridLayoutSideMargin_margin = *(_QWORD *)&v3;
}

@end
