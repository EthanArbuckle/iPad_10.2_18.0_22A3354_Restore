@implementation WKAutocorrectionRects

+ (id)autocorrectionRectsWithFirstCGRect:(CGRect)a3 lastCGRect:(CGRect)a4
{
  double height;
  double width;
  double y;
  double x;
  double v8;
  double v9;
  double v10;
  double v11;
  WKAutocorrectionRects *v12;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v8 = a3.size.height;
  v9 = a3.size.width;
  v10 = a3.origin.y;
  v11 = a3.origin.x;
  v12 = objc_alloc_init(WKAutocorrectionRects);
  -[UIWKAutocorrectionRects setFirstRect:](v12, "setFirstRect:", v11, v10, v9, v8);
  -[UIWKAutocorrectionRects setLastRect:](v12, "setLastRect:", x, y, width, height);
  return (id)(id)CFMakeCollectable(v12);
}

@end
