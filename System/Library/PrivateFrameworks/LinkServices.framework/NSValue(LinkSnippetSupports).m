@implementation NSValue(LinkSnippetSupports)

- (double)lns_CGSizeValue
{
  _QWORD v2[2];

  v2[0] = 0;
  v2[1] = 0;
  objc_msgSend(a1, "getValue:size:", v2, 16);
  return *(double *)v2;
}

+ (id)lns_valueWithCGSize:()LinkSnippetSupports
{
  _QWORD v4[2];

  *(double *)v4 = a2;
  *(double *)&v4[1] = a3;
  objc_msgSend(a1, "valueWithBytes:objCType:", v4, "{CGSize=dd}");
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
