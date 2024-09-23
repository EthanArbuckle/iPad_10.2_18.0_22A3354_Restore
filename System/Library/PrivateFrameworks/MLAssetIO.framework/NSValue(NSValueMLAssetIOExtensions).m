@implementation NSValue(NSValueMLAssetIOExtensions)

+ (MIORangeAsValue)valueWithMIORange:()NSValueMLAssetIOExtensions
{
  return +[MIORangeAsValue valueWithMIORange:](MIORangeAsValue, "valueWithMIORange:");
}

- (uint64_t)MIORangeValue
{
  id v1;
  _QWORD v3[2];

  v1 = objc_retainAutorelease(a1);
  if (strcmp("{_MIORange=qq}", (const char *)objc_msgSend(v1, "objCType")))
    return 0x7FFFFFFFFFFFFFFFLL;
  v3[0] = 0;
  v3[1] = 0;
  objc_msgSend(v1, "getValue:", v3);
  return v3[0];
}

@end
