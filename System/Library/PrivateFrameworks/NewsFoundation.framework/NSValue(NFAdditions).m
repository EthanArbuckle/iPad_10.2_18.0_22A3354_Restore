@implementation NSValue(NFAdditions)

+ (id)nf_valueWithCGRect:()NFAdditions
{
  _QWORD v5[4];

  *(double *)v5 = a1;
  *(double *)&v5[1] = a2;
  *(double *)&v5[2] = a3;
  *(double *)&v5[3] = a4;
  objc_msgSend(MEMORY[0x24BDD1968], "valueWithBytes:objCType:", v5, "{CGRect={CGPoint=dd}{CGSize=dd}}");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (double)nf_CGRectValue
{
  _OWORD v2[2];

  memset(v2, 0, sizeof(v2));
  _getNSValueBytes(a1, v2);
  return *(double *)v2;
}

@end
