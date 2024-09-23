@implementation UIFont(PDFKitUIFontExtensions)

- (id)convertToFitMaximumHeight:()PDFKitUIFontExtensions
{
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  id v9;

  objc_msgSend(a1, "pointSize");
  v5 = v4;
  objc_msgSend(a1, "descender");
  v7 = v5 - v6;
  if (v7 <= a2 || (objc_msgSend(a1, "pointSize"), a2 == 1.0))
  {
    v9 = a1;
  }
  else
  {
    objc_msgSend(a1, "fontWithSize:", v8 * a2 / v7);
    v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  return v9;
}

@end
