@implementation WKSafeBrowsingExclamationPoint

- (void)drawRect:(CGRect)a3
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;

  v3 = (void *)objc_msgSend((id)-[WKSafeBrowsingExclamationPoint superview](self, "superview", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height), "superview");
  v4 = objc_msgSend(MEMORY[0x1E0CEA478], "colorWithRed:green:blue:alpha:", 0.998, 0.239, 0.233, 1.0);
  v5 = objc_msgSend(MEMORY[0x1E0CEA478], "whiteColor");
  if (objc_msgSend((id)objc_msgSend(v3, "traitCollection"), "horizontalSizeClass") == 1)
    v6 = (void *)v4;
  else
    v6 = (void *)v5;
  objc_msgSend(v6, "set");
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CEA390], "bezierPathWithRect:", 0.0, 0.0, 30.0, 30.0), "fill");
  v7 = objc_msgSend(MEMORY[0x1E0CEA478], "colorWithRed:green:blue:alpha:", 0.998, 0.239, 0.233, 1.0);
  v8 = objc_msgSend(MEMORY[0x1E0CEA478], "whiteColor");
  if (objc_msgSend((id)objc_msgSend(v3, "traitCollection"), "horizontalSizeClass") == 1)
    v9 = (void *)v8;
  else
    v9 = (void *)v7;
  objc_msgSend(v9, "set");
  v10 = (void *)objc_msgSend(MEMORY[0x1E0CEA390], "bezierPathWithOvalInRect:", 0.0, 0.0, 30.0, 30.0);
  objc_msgSend(v10, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", 0, 15.0, 7.0, 1.75, 6.28318531, 3.14159265);
  objc_msgSend(v10, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", 0, 15.0, 17.0, 1.75, 3.14159265, 0.0);
  objc_msgSend(v10, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", 0, 15.0, 23.0, 2.25, 0.0, 3.14159265);
  objc_msgSend(v10, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", 0, 15.0, 23.0, 2.25, 3.14159265, 6.28318531);
  objc_msgSend(v10, "addLineToPoint:", 16.75, 17.0);
  objc_msgSend(v10, "addLineToPoint:", 16.75, 7.0);
  objc_msgSend(v10, "fill");
}

- (CGSize)intrinsicContentSize
{
  double v2;
  double v3;
  CGSize result;

  v2 = 30.0;
  v3 = 30.0;
  result.height = v3;
  result.width = v2;
  return result;
}

@end
