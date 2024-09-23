@implementation UITextView

- (double)firstBaselineFromTop
{
  UITextView *v2;
  NSLayoutManager *v3;
  double v4;
  double v5;

  v2 = self;
  v3 = -[UITextView layoutManager](v2, "layoutManager");
  -[NSLayoutManager baselineOffsetForGlyphAtIndex:](v3, "baselineOffsetForGlyphAtIndex:", 0);
  v5 = v4;

  return v5;
}

- (double)lastBaselineFromBottom
{
  UITextView *v2;
  NSLayoutManager *v3;
  NSTextContainer *v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double MaxY;
  CGRect v15;

  v2 = self;
  v3 = -[UITextView layoutManager](v2, "layoutManager");
  v4 = -[UITextView textContainer](v2, "textContainer");
  -[NSLayoutManager usedRectForTextContainer:](v3, "usedRectForTextContainer:", v4);
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;

  v15.origin.x = v6;
  v15.origin.y = v8;
  v15.size.width = v10;
  v15.size.height = v12;
  MaxY = CGRectGetMaxY(v15);

  return MaxY;
}

@end
