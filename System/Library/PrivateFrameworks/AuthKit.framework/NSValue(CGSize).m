@implementation NSValue(CGSize)

- (double)CGSizeValue
{
  id v1;
  _QWORD v3[2];
  NSUInteger sizep;

  v3[0] = 0;
  v3[1] = 0;
  sizep = 0;
  v1 = objc_retainAutorelease(a1);
  NSGetSizeAndAlignment((const char *)objc_msgSend(v1, "objCType"), &sizep, 0);
  objc_msgSend(v1, "getValue:size:", v3, 16);

  return *(double *)v3;
}

@end
