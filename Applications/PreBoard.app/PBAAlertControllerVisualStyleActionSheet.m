@implementation PBAAlertControllerVisualStyleActionSheet

- (UIEdgeInsets)contentInsetsForContainerView:(id)a3
{
  id v3;
  uint64_t v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  UIEdgeInsets result;

  v3 = a3;
  v4 = SBFEffectiveHomeButtonType(v3);
  objc_msgSend(v3, "layoutMargins");
  v6 = v5;
  v8 = v7;
  v10 = v9;

  if (v4 == 2)
    v11 = 40.0;
  else
    v11 = 44.0;
  v12 = v6;
  v13 = v8;
  v14 = v10;
  result.right = v14;
  result.bottom = v11;
  result.left = v13;
  result.top = v12;
  return result;
}

@end
