@implementation AXLTSegmentUtilities

+ (id)mergeOldSegments:(id)a3 withNewSegments:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  id v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  int v21;
  int v22;
  void *v23;
  uint64_t v25;
  id v26;

  v5 = a3;
  v6 = a4;
  v7 = objc_msgSend(v6, "count");
  v8 = v5;
  if (v7 && (v9 = objc_msgSend(v5, "count"), v8 = v6, v9))
  {
    v10 = (id)objc_opt_new();
    v26 = v5;
    v11 = objc_msgSend(v5, "count");
    v12 = objc_msgSend(v6, "count");
    if (v11 >= v12)
      v13 = v12;
    else
      v13 = v11;
    if (v13 >= 1)
    {
      v14 = 0;
      v15 = 0;
      v5 = v26;
      v25 = v13;
      while (1)
      {
        objc_msgSend(v5, "objectAtIndexedSubscript:", v14);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "objectAtIndexedSubscript:", v15);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "substring");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "substring");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v18, "isEqualToString:", v19))
        {
          objc_msgSend(v10, "addObject:", v16);
          ++v14;
          ++v15;
        }
        else
        {
          v20 = objc_msgSend(a1, "isPuncuation:", v18);
          v21 = objc_msgSend(a1, "isPuncuation:", v19);
          v22 = v21 ^ 1;
          if (((v20 ^ 1) & 1) != 0 || (v22 & 1) != 0)
          {
            if (((v20 ^ 1 | v21) & 1) != 0)
            {
              if (((v20 | v22) & 1) != 0)
              {
                v13 = v25;
                if (((v20 | v21) & 1) == 0)
                {
                  objc_msgSend(v10, "addObject:", v16);
                  ++v14;
                  ++v15;
                }
                v5 = v26;
                goto LABEL_20;
              }
              ++v15;
            }
            else
            {
              ++v14;
            }
          }
          else
          {
            objc_msgSend(v10, "addObject:", v16);
            ++v14;
            ++v15;
          }
          v13 = v25;
          v5 = v26;
        }
LABEL_20:

        if (v14 >= v13 || (uint64_t)v15 >= v13)
          goto LABEL_26;
      }
    }
    v15 = 0;
    v5 = v26;
LABEL_26:
    if (objc_msgSend(v6, "count") > v15 && v15 < objc_msgSend(v6, "count"))
    {
      do
      {
        objc_msgSend(v6, "objectAtIndexedSubscript:", v15);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "addObject:", v23);

        ++v15;
      }
      while (v15 < objc_msgSend(v6, "count"));
      v5 = v26;
    }
  }
  else
  {
    v10 = v8;
  }

  return v10;
}

+ (BOOL)isPuncuation:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  BOOL v6;

  v3 = a3;
  if (objc_msgSend(v3, "length"))
  {
    objc_msgSend(MEMORY[0x24BDD14A8], "punctuationCharacterSet");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stringByTrimmingCharactersInSet:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "length") == 0;

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

@end
