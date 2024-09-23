@implementation CCUILayoutEdgeInsetsForInterfaceOrientation

double __CCUILayoutEdgeInsetsForInterfaceOrientation_block_invoke()
{
  double v0;
  double v1;
  uint64_t v2;
  uint64_t v3;
  double result;

  if (CCUIStatusBarBaselineHeight_onceToken != -1)
    dispatch_once(&CCUIStatusBarBaselineHeight_onceToken, &__block_literal_global_3);
  v0 = *(double *)&CCUIStatusBarBaselineHeight_height;
  if (CCUIPortraitGridLayoutTopMargin_onceToken != -1)
    dispatch_once(&CCUIPortraitGridLayoutTopMargin_onceToken, &__block_literal_global_4);
  v1 = *(double *)&CCUIPortraitGridLayoutTopMargin_margin;
  CCUIPortraitGridLayoutSideMargin();
  *(double *)&CCUILayoutEdgeInsetsForInterfaceOrientation_portraitInsets_0 = v1 - v0;
  CCUILayoutEdgeInsetsForInterfaceOrientation_portraitInsets_1 = v2;
  CCUILayoutEdgeInsetsForInterfaceOrientation_portraitInsets_3 = v2;
  if (CCUILandscapeGridLayoutTopMargin_onceToken != -1)
    dispatch_once(&CCUILandscapeGridLayoutTopMargin_onceToken, &__block_literal_global_5);
  v3 = CCUILandscapeGridLayoutTopMargin_margin;
  if (CCUILandscapeGridLayoutSideMargin_onceToken != -1)
    dispatch_once(&CCUILandscapeGridLayoutSideMargin_onceToken, &__block_literal_global_6);
  result = *(double *)&CCUILandscapeGridLayoutSideMargin_margin;
  CCUILayoutEdgeInsetsForInterfaceOrientation_landscapeInsets_0 = v3;
  CCUILayoutEdgeInsetsForInterfaceOrientation_landscapeInsets_1 = CCUILandscapeGridLayoutSideMargin_margin;
  CCUILayoutEdgeInsetsForInterfaceOrientation_landscapeInsets_3 = CCUILandscapeGridLayoutSideMargin_margin;
  return result;
}

@end
