@implementation NSString(MOExtensions)

- (__CFString)mask
{
  __CFString *v2;
  void *v3;
  void *v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;

  if (objc_msgSend(a1, "length"))
  {
    if (objc_msgSend(a1, "length") == 1)
    {
      v2 = CFSTR("*");
    }
    else
    {
      if (objc_msgSend(a1, "length") == 2)
      {
        v3 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(a1, "substringToIndex:", 1);
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "stringWithFormat:", CFSTR("%@*"), v4);
        v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v5 = (unint64_t)((double)(unint64_t)objc_msgSend(a1, "length") * 0.499999);
        v6 = objc_msgSend(a1, "length");
        if ((v6 - v5) >> 1 <= 1)
          v7 = 1;
        else
          v7 = (v6 - v5) >> 1;
        v8 = objc_msgSend(a1, "length");
        v9 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(a1, "substringToIndex:", v7);
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(&stru_1E854A388, "stringByPaddingToLength:withString:startingAtIndex:", v5, CFSTR("*"), 0);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1, "substringFromIndex:", v5 - v8 + objc_msgSend(a1, "length") + v7);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "stringWithFormat:", CFSTR("%@%@%@"), v4, v10, v11);
        v2 = (__CFString *)objc_claimAutoreleasedReturnValue();

      }
    }
  }
  else
  {
    v2 = 0;
  }
  return v2;
}

@end
