@implementation NSValue(EDColor)

+ (id)valueWithColor:()EDColor
{
  _QWORD v4[3];

  *(double *)v4 = a1;
  *(double *)&v4[1] = a2;
  *(double *)&v4[2] = a3;
  objc_msgSend(MEMORY[0x24BDD1968], "value:withObjCType:", v4, "{EDColor=ddd}");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (double)colorValue
{
  _QWORD v2[3];

  memset(v2, 0, sizeof(v2));
  objc_msgSend(a1, "getValue:", v2);
  return *(double *)v2;
}

@end
