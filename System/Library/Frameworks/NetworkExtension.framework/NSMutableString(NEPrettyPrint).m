@implementation NSMutableString(NEPrettyPrint)

- (void)appendPrettyObject:()NEPrettyPrint withName:andIndent:options:
{
  if (a3)
  {
    if ((a6 & 0xC) != 4)
      -[NSMutableString appendPrettyObject:withName:andIndent:options:depth:](a1, a3, a4, a5, a6, 1uLL);
  }
}

- (void)appendPrettyBOOL:()NEPrettyPrint withName:andIndent:options:
{
  uint64_t v6;
  uint64_t v7;
  const __CFString *v8;

  if ((a6 & 0xC) != 4)
  {
    v8 = CFSTR("NO");
    if (a3)
      v8 = CFSTR("YES");
    return (void *)objc_msgSend(result, "appendFormat:", CFSTR("\n%*s%@ = %@"), (4 * a5 + 4), " ", a4, v8, v6, v7);
  }
  return result;
}

- (void)appendPrettyInt:()NEPrettyPrint withName:andIndent:options:
{
  uint64_t v6;
  uint64_t v7;

  if ((a6 & 0xC) != 4)
    return (void *)objc_msgSend(result, "appendFormat:", CFSTR("\n%*s%@ = %lld"), (4 * a5 + 4), " ", a4, a3, v6, v7);
  return result;
}

- (void)appendPrettyHex:()NEPrettyPrint withName:andIndent:options:
{
  uint64_t v6;
  uint64_t v7;

  if ((a6 & 0xC) != 4)
    return (void *)objc_msgSend(result, "appendFormat:", CFSTR("\n%*s%@ = %llX"), (4 * a5 + 4), " ", a4, a3, v6, v7);
  return result;
}

- (uint64_t)appendToStringAtColumnWithContent:()NEPrettyPrint column:content:appendAsNewLine:addNewLine:
{
  uint64_t v11;
  unsigned int *v12;
  uint64_t v13;
  unsigned int v14;
  uint64_t result;

  v11 = a4;
  if (a4 && a6)
  {
    v12 = a3;
    v13 = a4;
    do
    {
      v14 = *v12++;
      objc_msgSend(a1, "appendFormat:", CFSTR("%-*s"), v14, ");
      --v13;
    }
    while (v13);
  }
  result = objc_msgSend(a1, "appendFormat:", CFSTR("%-*s"), a3[v11], a5);
  if (a7)
    return objc_msgSend(a1, "appendString:", CFSTR("\n"));
  return result;
}

@end
