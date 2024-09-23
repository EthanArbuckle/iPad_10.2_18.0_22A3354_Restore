@implementation NSValue(NSValueUIGeometryExtensions)

+ (id)valueWithCGSize:()NSValueUIGeometryExtensions
{
  _QWORD v3[2];

  *(double *)v3 = a1;
  *(double *)&v3[1] = a2;
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", v3, "{CGSize=dd}");
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
