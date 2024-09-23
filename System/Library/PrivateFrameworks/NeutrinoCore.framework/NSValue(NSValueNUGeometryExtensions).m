@implementation NSValue(NSValueNUGeometryExtensions)

- (uint64_t)nu_pixelRect
{
  *x8_0 = 0u;
  x8_0[1] = 0u;
  return objc_msgSend(a1, "getValue:size:", x8_0, 32);
}

- (uint64_t)nu_pixelPoint
{
  _QWORD v2[2];

  v2[0] = 0;
  v2[1] = 0;
  objc_msgSend(a1, "getValue:size:", v2, 16);
  return v2[0];
}

- (double)nu_CGRect
{
  _OWORD v2[2];

  memset(v2, 0, sizeof(v2));
  objc_msgSend(a1, "getValue:size:", v2, 32);
  return *(double *)v2;
}

- (double)nu_CGPoint
{
  _QWORD v2[2];

  v2[0] = 0;
  v2[1] = 0;
  objc_msgSend(a1, "getValue:size:", v2, 16);
  return *(double *)v2;
}

+ (uint64_t)nu_valueWithPixelRect:()NSValueNUGeometryExtensions
{
  return objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", a3, "{?={?=qq}{?=qq}}");
}

+ (id)nu_valueWithCGRect:()NSValueNUGeometryExtensions
{
  _QWORD v5[4];

  *(double *)v5 = a1;
  *(double *)&v5[1] = a2;
  *(double *)&v5[2] = a3;
  *(double *)&v5[3] = a4;
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", v5, "{CGRect={CGPoint=dd}{CGSize=dd}}");
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)nu_valueWithPixelPoint:()NSValueNUGeometryExtensions
{
  _QWORD v5[2];

  v5[0] = a3;
  v5[1] = a4;
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", v5, "{?=qq}");
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)nu_valueWithCGPoint:()NSValueNUGeometryExtensions
{
  _QWORD v3[2];

  *(double *)v3 = a1;
  *(double *)&v3[1] = a2;
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", v3, "{CGPoint=dd}");
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
