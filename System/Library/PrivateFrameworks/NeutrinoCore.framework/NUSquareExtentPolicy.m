@implementation NUSquareExtentPolicy

- ($209B98C1CDF2DEBD503CBDE3C0ED7C90)extentForImageExtent:(SEL)a3
{
  int64_t var0;
  int64_t var1;
  int64_t v6;
  BOOL v7;
  uint64_t v8;
  int64_t v9;
  uint64_t v10;
  int64_t v11;

  var0 = a4->var1.var0;
  var1 = a4->var1.var1;
  if (var0 >= var1)
    v6 = a4->var1.var1;
  else
    v6 = a4->var1.var0;
  v7 = var0 < v6;
  v8 = var0 - v6;
  if (v7)
    ++v8;
  v9 = a4->var0.var0 + (v8 >> 1);
  v7 = var1 < v6;
  v10 = var1 - v6;
  if (v7)
    ++v10;
  v11 = a4->var0.var1 + (v10 >> 1);
  retstr->var0.var0 = v9;
  retstr->var0.var1 = v11;
  retstr->var1.var0 = v6;
  retstr->var1.var1 = v6;
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
