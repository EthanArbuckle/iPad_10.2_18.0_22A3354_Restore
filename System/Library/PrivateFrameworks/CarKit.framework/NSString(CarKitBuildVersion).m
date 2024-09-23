@implementation NSString(CarKitBuildVersion)

- (uint64_t)cr_buildVersionCompare:()CarKitBuildVersion
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  unint64_t v9;
  void *v10;
  unint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  unint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;

  v4 = a3;
  if (v4)
  {
    v5 = objc_msgSend(a1, "length");
    v6 = objc_msgSend(v4, "length");
    if (v5)
    {
      if (v6)
      {
        objc_msgSend(a1, "componentsSeparatedByString:", CFSTR("."));
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "componentsSeparatedByString:", CFSTR("."));
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v7, "count");
        if (v9 >= objc_msgSend(v8, "count"))
          v10 = v8;
        else
          v10 = v7;
        v11 = objc_msgSend(v10, "count");
        if (v11)
        {
          v12 = 0;
          while (1)
          {
            objc_msgSend(v7, "objectAtIndex:", v12);
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v13, "integerValue"));
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v8, "objectAtIndex:", v12);
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v15, "integerValue"));
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            v17 = objc_msgSend(v14, "compare:", v16);

            if (v17)
              break;
            if (v11 == ++v12)
              goto LABEL_11;
          }
        }
        else
        {
LABEL_11:
          if (v11 >= objc_msgSend(v7, "count"))
          {
LABEL_15:
            if (v11 >= objc_msgSend(v8, "count"))
            {
              v17 = 0;
            }
            else
            {
              while (1)
              {
                objc_msgSend(v8, "objectAtIndex:", v11);
                v21 = (void *)objc_claimAutoreleasedReturnValue();
                v22 = objc_msgSend(v21, "integerValue");

                if (v22 >= 1)
                  break;
                if (++v11 >= objc_msgSend(v8, "count"))
                {
                  v17 = 0;
                  goto LABEL_25;
                }
              }
              v17 = -1;
            }
          }
          else
          {
            v17 = 1;
            v18 = v11;
            while (1)
            {
              objc_msgSend(v7, "objectAtIndex:", v18);
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              v20 = objc_msgSend(v19, "integerValue");

              if (v20 >= 1)
                break;
              if (++v18 >= objc_msgSend(v7, "count"))
                goto LABEL_15;
            }
          }
        }
LABEL_25:

      }
      else
      {
        v17 = 1;
      }
    }
    else if (v6)
    {
      v17 = -1;
    }
    else
    {
      v17 = 0;
    }
  }
  else
  {
    v17 = -1;
  }

  return v17;
}

@end
