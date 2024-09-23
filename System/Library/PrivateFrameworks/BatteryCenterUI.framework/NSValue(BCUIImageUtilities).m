@implementation NSValue(BCUIImageUtilities)

+ (id)valueWithBCUIIconImageInfo:()BCUIImageUtilities
{
  _QWORD v4[3];

  *(double *)v4 = a1;
  *(double *)&v4[1] = a2;
  *(double *)&v4[2] = a3;
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", v4, "{BCUIIconImageInfo={CGSize=dd}d}");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (double)BCUIIconImageInfoValue
{
  _QWORD v2[3];

  memset(v2, 0, sizeof(v2));
  objc_msgSend(a1, "getValue:size:", v2, 24);
  return *(double *)v2;
}

@end
