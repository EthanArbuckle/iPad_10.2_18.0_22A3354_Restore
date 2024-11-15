@implementation NSString(DDSubstring)

- (__CFString)dd_leadingTextWithNumberOfCharacters:()DDSubstring beforeRange:
{
  __CFString *v7;

  if (objc_msgSend(a1, "length") <= a4)
  {
    v7 = &stru_1E4259460;
  }
  else
  {
    objc_msgSend(a1, "substringWithRange:", (a4 - a3) & ~((uint64_t)(a4 - a3) >> 63), a3 - ((a3 - a4) & ~((uint64_t)(a3 - a4) >> 63)));
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v7;
}

- (__CFString)dd_trailingTextWithNumberOfCharacters:()DDSubstring afterRange:
{
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  __CFString *v10;

  v7 = a4 + a5;
  v8 = objc_msgSend(a1, "length");
  if (v8 <= v7)
  {
    v10 = &stru_1E4259460;
  }
  else
  {
    if (v8 - v7 >= a3)
      v9 = a3;
    else
      v9 = v8 - v7;
    objc_msgSend(a1, "substringWithRange:", v7, v9);
    v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v10;
}

@end
