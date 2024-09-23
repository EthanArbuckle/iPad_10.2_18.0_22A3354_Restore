@implementation NSValue(_HDTrivialQuantitySample)

- (double)_hd_trivialQuantitySampleValue
{
  _QWORD v2[2];

  v2[0] = 0;
  v2[1] = 0;
  objc_msgSend(a1, "getValue:", v2);
  return *(double *)v2;
}

+ (id)_hd_valueWithTrivialQuantitySample:()_HDTrivialQuantitySample
{
  _QWORD v4[2];

  *(double *)v4 = a2;
  *(double *)&v4[1] = a3;
  objc_msgSend(a1, "valueWithBytes:objCType:", v4, "{?=dd}");
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
