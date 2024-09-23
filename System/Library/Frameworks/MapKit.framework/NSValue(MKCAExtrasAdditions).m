@implementation NSValue(MKCAExtrasAdditions)

+ (id)_mapkit_valueWithCGPoint:()MKCAExtrasAdditions
{
  _QWORD v3[2];

  *(double *)v3 = a1;
  *(double *)&v3[1] = a2;
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", v3, "{CGPoint=dd}");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (uint64_t)_mapkit_CGAffineTransformValue
{
  x8_0[1] = 0u;
  x8_0[2] = 0u;
  *x8_0 = 0u;
  return objc_msgSend(a1, "getValue:size:", x8_0, 48);
}

+ (uint64_t)_mapkit_valueWithCGAffineTransform:()MKCAExtrasAdditions
{
  return objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", a3, "{CGAffineTransform=dddddd}");
}

@end
