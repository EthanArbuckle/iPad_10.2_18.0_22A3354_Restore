@implementation UIFont

- (UIEdgeInsets)languageAwareOutsets
{
  __CFString *v3;
  CGFloat v4;
  CTFontRef v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  UIEdgeInsets result;

  v3 = (__CFString *)objc_claimAutoreleasedReturnValue(-[UIFont fontName](self, "fontName"));
  -[UIFont pointSize](self, "pointSize");
  v5 = CTFontCreateWithName(v3, v4, 0);

  v12 = 0.0;
  v13 = 0.0;
  v10 = 0.0;
  v11 = 0.0;
  CTFontGetLanguageAwareOutsets(v5, &v13, &v12, &v11, &v10);
  CFRelease(v5);
  v6 = v12;
  v7 = v13;
  v8 = v10;
  v9 = v11;
  result.right = v9;
  result.bottom = v8;
  result.left = v7;
  result.top = v6;
  return result;
}

@end
