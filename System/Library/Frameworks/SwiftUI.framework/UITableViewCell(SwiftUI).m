@implementation UITableViewCell(SwiftUI)

- (double)swiftui_defaultRowHeight
{
  void *v2;
  double v3;
  double v4;
  double v5;

  objc_msgSend(a1, "layoutManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "frame");
  objc_msgSend(v2, "intrinsicContentSizeForCell:rowWidth:", a1, v3);
  v5 = v4;

  return v5;
}

@end
