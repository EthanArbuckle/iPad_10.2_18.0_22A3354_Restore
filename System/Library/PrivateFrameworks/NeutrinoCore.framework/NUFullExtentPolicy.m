@implementation NUFullExtentPolicy

- ($209B98C1CDF2DEBD503CBDE3C0ED7C90)extentForImageExtent:(SEL)a3
{
  $0AC6E346AE4835514AAA8AC86D8F4844 var1;

  var1 = a4->var1;
  retstr->var0 = a4->var0;
  retstr->var1 = var1;
  return self;
}

- (BOOL)isEqual:(id)a3
{
  id v3;
  char isKindOfClass;

  v3 = a3;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (unint64_t)hash
{
  return objc_msgSend((id)objc_opt_class(), "hash");
}

@end
