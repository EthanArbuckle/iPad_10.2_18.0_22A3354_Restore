@implementation CIVector(NUDigest)

- (void)nu_updateDigest:()NUDigest
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  uint64_t v8;
  uint64_t v9;

  v4 = a3;
  objc_msgSend(v4, "addCString:", "CIVector(");
  v5 = objc_msgSend(a1, "count");
  if (v5)
  {
    v6 = v5;
    for (i = 0; i != v6; ++i)
    {
      v9 = 0;
      objc_msgSend(a1, "valueAtIndex:", i);
      v9 = v8;
      objc_msgSend(v4, "addBytes:length:", &v9, 8);
    }
  }
  objc_msgSend(v4, "addCString:", ")");

}

@end
