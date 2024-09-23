@implementation UITableView(SwiftUI)

- (double)horizontalMargin
{
  uint64_t v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  int v8;
  double v9;

  v2 = objc_msgSend(a1, "effectiveUserInterfaceLayoutDirection");
  objc_msgSend(a1, "safeAreaInsets");
  if (v2 == 1)
    v5 = v4;
  else
    v5 = v3;
  objc_msgSend(a1, "_defaultLeadingCellMarginWidth");
  v7 = v6;
  v8 = objc_msgSend(a1, "_sectionContentInsetFollowsLayoutMargins");
  v9 = 0.0;
  if (!v8)
    v9 = v5;
  return v7 - v9;
}

@end
