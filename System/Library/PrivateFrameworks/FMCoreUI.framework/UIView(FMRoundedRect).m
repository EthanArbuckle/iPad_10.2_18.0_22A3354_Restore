@implementation UIView(FMRoundedRect)

- (void)setRoundedRectBackgroundColor:()FMRoundedRect
{
  objc_setAssociatedObject(a1, CFSTR("FMRoundedRectBackgroundColorKey"), a3, (void *)0x301);
}

- (id)roundedRectBackgroundColor
{
  return objc_getAssociatedObject(a1, CFSTR("FMRoundedRectBackgroundColorKey"));
}

- (void)setRoundedRectBorderColor:()FMRoundedRect
{
  objc_setAssociatedObject(a1, CFSTR("FMRoundedRectBorderColorKey"), a3, (void *)0x301);
}

- (id)roundedRectBorderColor
{
  return objc_getAssociatedObject(a1, CFSTR("FMRoundedRectBorderColorKey"));
}

- (void)setRoundedRectBorderWidth:()FMRoundedRect
{
  objc_setAssociatedObject(a1, CFSTR("FMRoundedRectBorderWidthKey"), a3, (void *)0x301);
}

- (id)roundedRectBorderWidth
{
  return objc_getAssociatedObject(a1, CFSTR("FMRoundedRectBorderWidthKey"));
}

- (CGPath)newPathForRoundedRect:()FMRoundedRect radius:
{
  CGPath *Mutable;
  CGFloat y;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  CGFloat x;
  CGRect v18;
  CGRect v19;

  Mutable = CGPathCreateMutable();
  v18.origin.x = a1;
  v18.origin.y = a2;
  v18.size.width = a3;
  v18.size.height = a4;
  v19 = CGRectInset(v18, a5, a5);
  x = v19.origin.x;
  y = v19.origin.y;
  v12 = v19.origin.x + v19.size.width;
  v13 = a1 + a3;
  v14 = v19.origin.y + v19.size.height;
  v15 = a2 + a4;
  CGPathMoveToPoint(Mutable, 0, v19.origin.x, a2);
  CGPathAddLineToPoint(Mutable, 0, v12, a2);
  CGPathAddArcToPoint(Mutable, 0, v13, a2, v13, y, a5);
  CGPathAddLineToPoint(Mutable, 0, v13, v14);
  CGPathAddArcToPoint(Mutable, 0, v13, v15, v12, v15, a5);
  CGPathAddLineToPoint(Mutable, 0, x, v15);
  CGPathAddArcToPoint(Mutable, 0, a1, v15, a1, v14, a5);
  CGPathAddLineToPoint(Mutable, 0, a1, y);
  CGPathAddArcToPoint(Mutable, 0, a1, a2, x, a2, a5);
  CGPathCloseSubpath(Mutable);
  return Mutable;
}

@end
