@implementation NSValue(GCTypes)

+ (id)valueWithGCPoint2:()GCTypes
{
  _DWORD v4[2];

  *(float *)v4 = a2;
  *(float *)&v4[1] = a3;
  objc_msgSend(a1, "valueWithBytes:objCType:", v4, "{GCPoint2=ff}");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (float)GCPoint2Value
{
  uint64_t v2;

  v2 = 0;
  objc_msgSend(a1, "getValue:size:", &v2, 8);
  return *(float *)&v2;
}

@end
