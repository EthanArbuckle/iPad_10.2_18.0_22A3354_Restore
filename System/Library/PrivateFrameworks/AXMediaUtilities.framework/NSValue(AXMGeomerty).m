@implementation NSValue(AXMGeomerty)

+ (id)axmValueWithCGPoint:()AXMGeomerty
{
  _QWORD v3[2];

  *(double *)v3 = a1;
  *(double *)&v3[1] = a2;
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", v3, "{CGPoint=dd}");
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)axmValueWithCGVector:()AXMGeomerty
{
  _QWORD v3[2];

  *(double *)v3 = a1;
  *(double *)&v3[1] = a2;
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", v3, "{CGVector=dd}");
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)axmValueWithCGSize:()AXMGeomerty
{
  _QWORD v3[2];

  *(double *)v3 = a1;
  *(double *)&v3[1] = a2;
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", v3, "{CGSize=dd}");
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)axmValueWithCGRect:()AXMGeomerty
{
  _QWORD v5[4];

  *(double *)v5 = a1;
  *(double *)&v5[1] = a2;
  *(double *)&v5[2] = a3;
  *(double *)&v5[3] = a4;
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", v5, "{CGRect={CGPoint=dd}{CGSize=dd}}");
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (uint64_t)axmValueWithCGAffineTransform:()AXMGeomerty
{
  return objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", a3, "{CGAffineTransform=dddddd}");
}

- (double)AXMPointValue
{
  _QWORD v2[2];

  v2[0] = 0;
  v2[1] = 0;
  objc_msgSend(a1, "getValue:", v2);
  return *(double *)v2;
}

- (double)AXMVectorValue
{
  _QWORD v2[2];

  v2[0] = 0;
  v2[1] = 0;
  objc_msgSend(a1, "getValue:", v2);
  return *(double *)v2;
}

- (double)AXMSizeValue
{
  _QWORD v2[2];

  v2[0] = 0;
  v2[1] = 0;
  objc_msgSend(a1, "getValue:", v2);
  return *(double *)v2;
}

- (double)AXMRectValue
{
  _OWORD v2[2];

  memset(v2, 0, sizeof(v2));
  objc_msgSend(a1, "getValue:", v2);
  return *(double *)v2;
}

- (uint64_t)AXMAffineTransformValue
{
  x8_0[1] = 0u;
  x8_0[2] = 0u;
  *x8_0 = 0u;
  return objc_msgSend(a1, "getValue:", x8_0);
}

@end
