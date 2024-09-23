@implementation DrawPlaneGlow

void __DrawPlaneGlow_block_invoke(uint64_t a1, double a2, double a3, CGFloat a4, CGFloat a5, double a6, double a7)
{
  double v12;
  double v13;
  __double2 v14;
  double v15;
  __double2 v16;
  double v17;
  double v18;
  CGFloat v19;
  CGFloat v20;
  CGFloat v21;
  CGFloat v22;
  CGFloat v23;
  CGFloat v24;
  CGPath *Mutable;
  const CGPath *v26;
  CGImage *v27;
  CGPoint v28;
  CGPoint v29;

  v12 = atan2(a5 - a3, a4 - a2) + -1.57079633;
  v13 = atan2(a5 - a7, a4 - a6) + 1.57079633;
  v14 = __sincos_stret(v12);
  v15 = *(double *)(a1 + 32);
  v16 = __sincos_stret(v13);
  v17 = v15 * v16.__cosval;
  v18 = v15 * v16.__sinval;
  v19 = a4 + v14.__cosval * v15;
  v20 = a5 + v14.__sinval * v15;
  v21 = a4 + v17;
  v22 = a5 + v18;
  v23 = v19 + v17;
  v24 = v20 + v18;
  Mutable = CGPathCreateMutable();
  CGPathMoveToPoint(Mutable, 0, a4, a5);
  CGPathAddLineToPoint(Mutable, 0, v19, v20);
  CGPathAddLineToPoint(Mutable, 0, v23, v24);
  CGPathAddLineToPoint(Mutable, 0, v21, v22);
  CGPathCloseSubpath(Mutable);
  v26 = *(const CGPath **)(a1 + 40);
  if (v26)
  {
    CGContextAddPath(*(CGContextRef *)(a1 + 48), v26);
    CGContextClip(*(CGContextRef *)(a1 + 48));
    CGContextBeginPath(*(CGContextRef *)(a1 + 48));
  }
  v27 = *(CGImage **)(a1 + 56);
  if (v27)
    CGContextClipToMask(*(CGContextRef *)(a1 + 48), *(CGRect *)(a1 + 64), v27);
  CGContextAddPath(*(CGContextRef *)(a1 + 48), Mutable);
  CGContextClip(*(CGContextRef *)(a1 + 48));
  CGContextBeginPath(*(CGContextRef *)(a1 + 48));
  v28.x = a4;
  v28.y = a5;
  v29.x = a4;
  v29.y = a5;
  CGContextDrawRadialGradient(*(CGContextRef *)(a1 + 48), *(CGGradientRef *)(a1 + 96), v28, 0.0, v29, *(CGFloat *)(a1 + 32), 0);
  CGContextResetClip(*(CGContextRef *)(a1 + 48));
  CGPathRelease(Mutable);
}

void __DrawPlaneGlow_block_invoke_2(uint64_t a1, CGFloat a2, CGFloat a3, CGFloat a4, CGFloat a5, double a6, double a7, double a8, double a9)
{
  double v17;
  double v18;
  double sinval;
  double cosval;
  __double2 v21;
  double v22;
  double v23;
  double v24;
  __double2 v25;
  __double2 v26;
  CGFloat v27;
  CGFloat v28;
  CGPath *Mutable;
  const CGPath *v30;
  CGImage *v31;
  __double2 v32;
  double xa;
  double v35;
  CGPoint v36;
  CGPoint v37;

  v17 = atan2(a5 - a3, a4 - a2) + -1.57079633;
  v18 = *(double *)(a1 + 32);
  v35 = v17;
  if (v18 <= 0.0)
  {
    v23 = atan2(a3 - a7, a2 - a6);
    v24 = atan2(a5 - a9, a4 - a8);
    v25 = __sincos_stret(v23);
    xa = a2 + v25.__cosval * v18;
    v22 = a3 + v25.__sinval * v18;
    v26 = __sincos_stret(v24);
    cosval = v26.__cosval;
    sinval = v26.__sinval;
  }
  else
  {
    v21 = __sincos_stret(v17);
    cosval = v21.__cosval;
    sinval = v21.__sinval;
    xa = a2 + v21.__cosval * v18;
    v22 = a3 + v21.__sinval * v18;
  }
  v27 = a4 + cosval * v18;
  v28 = a5 + sinval * v18;
  Mutable = CGPathCreateMutable();
  CGPathMoveToPoint(Mutable, 0, a2, a3);
  CGPathAddLineToPoint(Mutable, 0, a4, a5);
  CGPathAddLineToPoint(Mutable, 0, v27, v28);
  CGPathAddLineToPoint(Mutable, 0, xa, v22);
  CGPathCloseSubpath(Mutable);
  v30 = *(const CGPath **)(a1 + 40);
  if (v30)
  {
    CGContextAddPath(*(CGContextRef *)(a1 + 48), v30);
    CGContextClip(*(CGContextRef *)(a1 + 48));
    CGContextBeginPath(*(CGContextRef *)(a1 + 48));
  }
  v31 = *(CGImage **)(a1 + 56);
  if (v31)
    CGContextClipToMask(*(CGContextRef *)(a1 + 48), *(CGRect *)(a1 + 64), v31);
  v32 = __sincos_stret(v35);
  CGContextAddPath(*(CGContextRef *)(a1 + 48), Mutable);
  CGContextClip(*(CGContextRef *)(a1 + 48));
  CGContextBeginPath(*(CGContextRef *)(a1 + 48));
  v36.x = (a2 + a4) * 0.5;
  v36.y = (a3 + a5) * 0.5;
  v37.x = v36.x + v32.__cosval * v18;
  v37.y = v36.y + v32.__sinval * v18;
  CGContextDrawLinearGradient(*(CGContextRef *)(a1 + 48), *(CGGradientRef *)(a1 + 96), v36, v37, 0);
  CGContextResetClip(*(CGContextRef *)(a1 + 48));
  CGPathRelease(Mutable);
}

@end
