@implementation UIColor(Invert)

- (id)invert
{
  id v1;
  CGColor *v2;
  size_t NumberOfComponents;
  uint64_t v4;
  const CGFloat *Components;
  uint64_t v6;
  double *v7;
  double *v8;
  uint64_t v9;
  double v10;
  CGColorSpace *ColorSpace;
  CGColor *v12;
  uint64_t v13;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x24BDAC8D0];
  v1 = objc_retainAutorelease(a1);
  v2 = (CGColor *)objc_msgSend(v1, "CGColor");
  NumberOfComponents = CGColorGetNumberOfComponents(v2);
  if (NumberOfComponents >= 2)
  {
    v4 = NumberOfComponents;
    Components = CGColorGetComponents(v2);
    if (v4 < 2)
    {
      v6 = 0;
    }
    else
    {
      v6 = v4 - 1;
      v7 = (double *)Components;
      v8 = (double *)((char *)v15 - ((8 * v4 + 15) & 0xFFFFFFFFFFFFFFF0));
      v9 = v4 - 1;
      do
      {
        v10 = *v7++;
        *v8++ = 1.0 - v10;
        --v9;
      }
      while (v9);
    }
    *(CGFloat *)((char *)&v15[v6] - ((8 * v4 + 15) & 0xFFFFFFFFFFFFFFF0)) = Components[v6];
    ColorSpace = CGColorGetColorSpace(v2);
    v12 = CGColorCreate(ColorSpace, (const CGFloat *)((char *)v15 - ((8 * v4 + 15) & 0xFFFFFFFFFFFFFFF0)));
    objc_msgSend(MEMORY[0x24BDF6950], "colorWithCGColor:", v12);
    v13 = objc_claimAutoreleasedReturnValue();

    CGColorRelease(v12);
    v1 = (id)v13;
  }
  return v1;
}

@end
