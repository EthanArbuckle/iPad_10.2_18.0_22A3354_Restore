@implementation NSData(NUDigest)

- (void)nu_updateDigest:()NUDigest
{
  id v4;
  id v5;

  v5 = a3;
  objc_msgSend(v5, "addString:", CFSTR("NSData<"));
  v4 = objc_retainAutorelease(a1);
  objc_msgSend(v5, "addBytes:length:", objc_msgSend(v4, "bytes"), objc_msgSend(v4, "length"));
  objc_msgSend(v5, "addString:", CFSTR(">"));

}

@end
