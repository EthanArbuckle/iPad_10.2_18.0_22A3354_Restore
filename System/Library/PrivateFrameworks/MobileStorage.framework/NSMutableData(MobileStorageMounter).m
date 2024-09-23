@implementation NSMutableData(MobileStorageMounter)

+ (id)dataWithHexString:()MobileStorageMounter
{
  objc_class *v3;
  id v4;
  void *v5;

  v3 = (objc_class *)MEMORY[0x24BDBCEC8];
  v4 = a3;
  v5 = (void *)objc_msgSend([v3 alloc], "initDataWithHexString:", v4);

  return v5;
}

- (id)initDataWithHexString:()MobileStorageMounter
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  int v13;
  id v14;
  char __str[2];
  __int16 v17;

  v4 = a3;
  v17 = 0;
  if (v4)
  {
    objc_msgSend(MEMORY[0x24BDD14A8], "alphanumericCharacterSet");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringByTrimmingCharactersInSet:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v6, "isEqualToString:", &stru_24CE04C20))
    {
      if ((objc_msgSend(v4, "length") & 1) != 0)
        v7 = objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("0%@"), v4);
      else
        v7 = objc_msgSend(v4, "copy");
      v9 = (void *)v7;
      a1 = (id)objc_msgSend(a1, "init");
      if (a1)
      {
        if ((int)objc_msgSend(v9, "length") >= 2)
        {
          v10 = 0;
          v11 = 1;
          do
          {
            __str[0] = objc_msgSend(v9, "characterAtIndex:", v11 - 1);
            __str[1] = objc_msgSend(v9, "characterAtIndex:", v11);
            HIBYTE(v17) = strtol(__str, 0, 16);
            objc_msgSend(a1, "appendBytes:length:", (char *)&v17 + 1, 1);
            ++v10;
            v12 = objc_msgSend(v9, "length");
            if (v12 >= 0)
              v13 = v12;
            else
              v13 = v12 + 1;
            v11 += 2;
          }
          while (v10 < v13 >> 1);
        }
        v8 = a1;
      }
      else
      {
        v8 = 0;
      }
    }
    else
    {
      v8 = 0;
      v9 = 0;
    }
  }
  else
  {
    v8 = 0;
    v9 = 0;
    v6 = 0;
  }
  v14 = v8;

  return v14;
}

@end
