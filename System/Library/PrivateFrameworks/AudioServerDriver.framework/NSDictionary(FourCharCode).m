@implementation NSDictionary(FourCharCode)

- (uint64_t)fourCharCode:()FourCharCode forKey:
{
  uint64_t v5;
  void *v6;
  uint64_t v7;
  id v8;
  unsigned int v10;

  objc_msgSend(a1, "objectForKeyedSubscript:", a4);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  v7 = 0;
  if (a3 && v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      *a3 = objc_msgSend(v6, "unsignedIntegerValue");
      v7 = 1;
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v8 = v6;
        if (objc_msgSend(v8, "length") == 4)
        {
          v7 = objc_msgSend(v8, "getCString:maxLength:encoding:", &v10, 5, 1);
          if ((_DWORD)v7)
            *a3 = bswap32(v10);
        }
        else
        {
          v7 = 0;
        }

      }
      else
      {
        v7 = 0;
      }
    }
  }

  return v7;
}

@end
