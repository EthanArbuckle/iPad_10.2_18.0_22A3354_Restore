@implementation NSValue(AXGeometryExtensions)

+ (id)axValueWithCGPoint:()AXGeometryExtensions
{
  _QWORD v3[2];

  *(double *)v3 = a1;
  *(double *)&v3[1] = a2;
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", v3, "{CGPoint=dd}");
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)axValueWithCGSize:()AXGeometryExtensions
{
  _QWORD v3[2];

  *(double *)v3 = a1;
  *(double *)&v3[1] = a2;
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", v3, "{CGSize=dd}");
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)axValueWithCGRect:()AXGeometryExtensions
{
  _QWORD v5[4];

  *(double *)v5 = a1;
  *(double *)&v5[1] = a2;
  *(double *)&v5[2] = a3;
  *(double *)&v5[3] = a4;
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", v5, "{CGRect={CGPoint=dd}{CGSize=dd}}");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (double)axCGPointValue
{
  _QWORD v2[2];

  v2[0] = 0;
  v2[1] = 0;
  objc_msgSend(a1, "getValue:size:", v2, 16);
  return *(double *)v2;
}

- (double)axCGSizeValue
{
  _QWORD v2[2];

  v2[0] = 0;
  v2[1] = 0;
  objc_msgSend(a1, "getValue:size:", v2, 16);
  return *(double *)v2;
}

- (double)axCGRectValue
{
  _OWORD v2[2];

  memset(v2, 0, sizeof(v2));
  objc_msgSend(a1, "getValue:size:", v2, 32);
  return *(double *)v2;
}

@end
