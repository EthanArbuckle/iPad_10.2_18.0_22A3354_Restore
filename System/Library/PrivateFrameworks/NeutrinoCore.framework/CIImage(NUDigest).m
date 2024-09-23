@implementation CIImage(NUDigest)

- (void)nu_updateDigest:()NUDigest
{
  id v4;
  uint64_t v5;

  v4 = a3;
  v5 = objc_msgSend(a1, "hash");
  objc_msgSend(v4, "addString:", CFSTR("CIImage<"));
  objc_msgSend(v4, "addBytes:length:", &v5, 8);
  objc_msgSend(v4, "addString:", CFSTR(">"));

}

@end
