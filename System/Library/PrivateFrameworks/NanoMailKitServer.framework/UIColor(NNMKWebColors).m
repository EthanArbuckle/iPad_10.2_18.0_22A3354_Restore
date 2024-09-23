@implementation UIColor(NNMKWebColors)

+ (id)colorWithWebColor:()NNMKWebColors
{
  id v3;
  void *v4;

  v3 = a3;
  objc_msgSend(MEMORY[0x24BDF6950], "colorWithWebColorName:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    objc_msgSend(MEMORY[0x24BDF6950], "colorWithWebRgb:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v4)
    {
      objc_msgSend(MEMORY[0x24BDF6950], "colorWithWebHexTriplet:", v3);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }

  return v4;
}

+ (id)colorWithWebColorName:()NNMKWebColors
{
  uint64_t v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = colorWithWebColorName__onceToken;
  v4 = a3;
  if (v3 != -1)
    dispatch_once(&colorWithWebColorName__onceToken, &__block_literal_global_2);
  v5 = (void *)__colorsByColorNames;
  objc_msgSend(v4, "lowercaseString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)colorWithWebRgb:()NNMKWebColors
{
  id v3;
  void *v4;
  char v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  unint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  double v18;
  uint64_t v19;
  char v20;
  void *v21;
  void *v22;
  uint64_t v23;
  char v24;
  void *v25;
  unint64_t v26;
  unint64_t v27;
  unint64_t v28;
  void *v30;
  float v31;
  double v32;
  void *v33;
  float v34;
  double v35;
  void *v36;
  float v37;
  double v38;
  void *v39;
  float v40;
  double v41;
  void *v42;
  void *v44;
  char v45;

  v3 = a3;
  v4 = v3;
  if (v3
    && ((v5 = objc_msgSend(v3, "hasPrefix:", CFSTR("rgb")), (v5 & 1) != 0)
     || objc_msgSend(v4, "hasPrefix:", CFSTR("hsl"))))
  {
    v6 = objc_msgSend(v4, "rangeOfString:", CFSTR("("));
    v7 = objc_msgSend(v4, "rangeOfString:", CFSTR(")"));
    v8 = 0;
    if (v6 != 0x7FFFFFFFFFFFFFFFLL && v7 != 0x7FFFFFFFFFFFFFFFLL)
    {
      v45 = v5;
      objc_msgSend(v4, "substringWithRange:", v6 + 1, v7 - (v6 + 1));
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "componentsSeparatedByString:", CFSTR(","));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", 4);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v9, "count"))
      {
        v11 = 0;
        while (1)
        {
          objc_msgSend(v9, "objectAtIndexedSubscript:", v11);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceCharacterSet");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "stringByTrimmingCharactersInSet:", v13);
          v14 = (void *)objc_claimAutoreleasedReturnValue();

          if (objc_msgSend(v14, "hasSuffix:", CFSTR("%")))
          {
            objc_msgSend(v14, "substringToIndex:", objc_msgSend(v14, "length") - 1);
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            v16 = objc_msgSend(v15, "integerValue");

            v17 = (void *)MEMORY[0x24BDD16E0];
            v18 = (float)v16 / 100.0;
          }
          else
          {
            if (objc_msgSend(v14, "rangeOfString:", CFSTR(".")) != 0x7FFFFFFFFFFFFFFFLL)
            {
              objc_msgSend(v14, "floatValue");
              v22 = (void *)MEMORY[0x24BDD16E0];
LABEL_16:
              objc_msgSend(v22, "numberWithFloat:");
              v23 = objc_claimAutoreleasedReturnValue();
              goto LABEL_26;
            }
            v19 = objc_msgSend(v14, "integerValue");
            v20 = v45 ^ 1;
            if (v11 > 2)
              v20 = 1;
            if ((v20 & 1) != 0)
            {
              if (v11)
                v24 = 1;
              else
                v24 = v45;
              if ((v24 & 1) != 0)
              {
                if ((unint64_t)v19 > 1)
                {
                  v8 = 0;
                  v42 = v44;
                  goto LABEL_37;
                }
                v22 = (void *)MEMORY[0x24BDD16E0];
                goto LABEL_16;
              }
              v21 = (void *)MEMORY[0x24BDD16E0];
              v18 = (float)v19 / 360.0;
            }
            else
            {
              v21 = (void *)MEMORY[0x24BDD16E0];
              v18 = (float)v19 / 255.0;
            }
            v17 = v21;
          }
          objc_msgSend(v17, "numberWithDouble:", v18);
          v23 = objc_claimAutoreleasedReturnValue();
LABEL_26:
          v25 = (void *)v23;
          objc_msgSend(v10, "addObject:", v23);

          v26 = objc_msgSend(v9, "count");
          if (v11 <= 2 && ++v11 < v26)
            continue;
          break;
        }
      }
      v27 = objc_msgSend(v10, "count");
      if (v27 <= 3)
      {
        v28 = v27 - 4;
        do
          objc_msgSend(v10, "addObject:", &unk_24FA10B60);
        while (!__CFADD__(v28++, 1));
      }
      v30 = (void *)MEMORY[0x24BDF6950];
      objc_msgSend(v10, "objectAtIndexedSubscript:", 0);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "floatValue");
      v32 = v31;
      objc_msgSend(v10, "objectAtIndexedSubscript:", 1);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "floatValue");
      v35 = v34;
      objc_msgSend(v10, "objectAtIndexedSubscript:", 2);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "floatValue");
      v38 = v37;
      objc_msgSend(v10, "objectAtIndexedSubscript:", 3);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "floatValue");
      v41 = v40;
      if ((v45 & 1) != 0)
        objc_msgSend(v30, "colorWithRed:green:blue:alpha:", v32, v35, v38, v41);
      else
        objc_msgSend(v30, "colorWithHue:saturation:brightness:alpha:", v32, v35, v38, v41);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = v44;

LABEL_37:
    }
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

+ (id)colorWithWebHexTriplet:()NNMKWebColors
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  unsigned int v21;
  unsigned int v22;
  unsigned int v23;

  v3 = a3;
  v4 = v3;
  if (!v3)
    goto LABEL_11;
  if (objc_msgSend(v3, "hasPrefix:", CFSTR("#")))
  {
    objc_msgSend(v4, "substringFromIndex:", 1);
    v5 = objc_claimAutoreleasedReturnValue();

    v4 = (void *)v5;
  }
  if (objc_msgSend(v4, "length") == 3)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%C%C%C%C%C%C"), objc_msgSend(v4, "characterAtIndex:", 0), objc_msgSend(v4, "characterAtIndex:", 0), objc_msgSend(v4, "characterAtIndex:", 1), objc_msgSend(v4, "characterAtIndex:", 1), objc_msgSend(v4, "characterAtIndex:", 2), objc_msgSend(v4, "characterAtIndex:", 2));
    v6 = objc_claimAutoreleasedReturnValue();

    v4 = (void *)v6;
  }
  if (objc_msgSend(v4, "length") != 6)
    goto LABEL_11;
  v21 = 255;
  v22 = 255;
  v23 = 255;
  v7 = (void *)MEMORY[0x24BDD17A8];
  objc_msgSend(v4, "substringWithRange:", 0, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "scannerWithString:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "scanHexInt:", &v23);

  v11 = 0;
  if (v10)
  {
    v12 = (void *)MEMORY[0x24BDD17A8];
    objc_msgSend(v4, "substringWithRange:", 2, 2);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "scannerWithString:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "scanHexInt:", &v22);

    if (v15)
    {
      v16 = (void *)MEMORY[0x24BDD17A8];
      objc_msgSend(v4, "substringWithRange:", 4, 2);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "scannerWithString:", v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v18, "scanHexInt:", &v21);

      if (v19)
      {
        objc_msgSend(MEMORY[0x24BDF6950], "colorWithRed:green:blue:alpha:", (float)v23 / 255.0, (float)v22 / 255.0, (float)v21 / 255.0, 1.0);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_12;
      }
    }
LABEL_11:
    v11 = 0;
  }
LABEL_12:

  return v11;
}

@end
