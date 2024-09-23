@implementation UITableSectionPart

- (CGRect)accessibilityFrame
{
  double v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  id v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGRect result;

  v10 = (id)-[UITableSectionPart accessibilityContainer](self, "accessibilityContainer");
  objc_msgSend(v10, "accessibilityFrame");
  v11 = v2;
  v12 = v3;
  v13 = v4;
  v14 = v5;

  v6 = v11;
  v7 = v12;
  v8 = v13;
  v9 = v14;
  result.size.height = v9;
  result.size.width = v8;
  result.origin.y = v7;
  result.origin.x = v6;
  return result;
}

@end
