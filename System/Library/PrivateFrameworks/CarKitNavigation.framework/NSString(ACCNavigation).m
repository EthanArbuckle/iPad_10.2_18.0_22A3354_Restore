@implementation NSString(ACCNavigation)

- (__CFString)stringByEllipsingPastMaxLength:()ACCNavigation
{
  void *v5;
  __CFString *v6;

  if (a3 && objc_msgSend(a1, "length") > a3)
  {
    if (a3 < 3)
    {
      v6 = CFSTR("…");
    }
    else
    {
      objc_msgSend(a1, "substringToIndex:", a3 - 2);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "stringByAppendingString:", CFSTR("…"));
      v6 = (__CFString *)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    v6 = a1;
  }
  return v6;
}

@end
