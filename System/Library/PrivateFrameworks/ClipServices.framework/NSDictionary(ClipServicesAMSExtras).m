@implementation NSDictionary(ClipServicesAMSExtras)

- (double)maxAge
{
  void *v1;
  void *v2;
  void *v3;
  uint64_t v4;
  double v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  double v14;
  void *v16;

  objc_msgSend(a1, "objectForKey:", CFSTR("Cache-Control"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if (v1)
  {
    objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceAndNewlineCharacterSet");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "componentsSeparatedByString:", CFSTR(","));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "count");
    v5 = 0.0;
    if (v4)
    {
      v6 = v4;
      v16 = v1;
      v7 = 0;
      while (1)
      {
        objc_msgSend(v3, "objectAtIndex:", v7);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "stringByTrimmingCharactersInSet:", v2);
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v9, "componentsSeparatedByString:", CFSTR("="));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v10, "count") == 2)
        {
          objc_msgSend(v10, "objectAtIndex:", 0);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = objc_msgSend(v11, "hasPrefix:", CFSTR("max-age"));

          if (v12)
            break;
        }

        if (v6 == ++v7)
          goto LABEL_10;
      }
      objc_msgSend(v10, "objectAtIndex:", 1);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "doubleValue");
      v5 = v14;

LABEL_10:
      v1 = v16;
    }

  }
  else
  {
    v5 = 0.0;
  }

  return v5;
}

@end
