@implementation NSString(WFContentProperty)

- (__CFString)stringByAppendingAsNewLine:()WFContentProperty
{
  __CFString *v4;
  void *v5;
  void *v6;
  const __CFString *v7;
  __CFString *v8;
  __CFString *v9;

  v4 = a3;
  if (objc_msgSend(a1, "length"))
  {
    objc_msgSend(a1, "stringByAppendingString:", CFSTR("\n"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v4)
      v7 = v4;
    else
      v7 = &stru_24C4E3948;
    objc_msgSend(v5, "stringByAppendingString:", v7);
    v8 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = &stru_24C4E3948;
    if (v4)
      v9 = v4;
    v8 = v9;
  }

  return v8;
}

@end
