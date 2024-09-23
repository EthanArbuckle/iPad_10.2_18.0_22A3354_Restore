@implementation NUEmptyPattern

- (id)tokens
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "set");
}

- (BOOL)isFixedOrder
{
  return 1;
}

- (id)shortestMatch
{
  return (id)MEMORY[0x1E0C9AA60];
}

- (id)stringRepresentation
{
  return CFSTR("[]");
}

- (BOOL)isEmpty
{
  return 1;
}

- (BOOL)isEqualToPattern:(id)a3
{
  id v3;
  char isKindOfClass;

  v3 = a3;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (BOOL)match:(id)a3 location:(unint64_t *)a4 count:(unint64_t *)a5
{
  unint64_t v6;
  unint64_t v7;

  v6 = *a4;
  v7 = objc_msgSend(a3, "count");
  if (v6 <= v7)
    *a5 = 0;
  return v6 <= v7;
}

@end
