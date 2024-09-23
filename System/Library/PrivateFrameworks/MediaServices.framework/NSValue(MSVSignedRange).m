@implementation NSValue(MSVSignedRange)

- (uint64_t)signedRangeValue
{
  _QWORD v2[2];

  v2[0] = 0;
  v2[1] = 0;
  objc_msgSend(a1, "getValue:", v2);
  return v2[0];
}

+ (id)valueWithMSVSignedRange:()MSVSignedRange
{
  _QWORD v5[2];

  v5[0] = a3;
  v5[1] = a4;
  objc_msgSend(a1, "valueWithBytes:objCType:", v5, "{_MSVSignedRange=qq}");
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
