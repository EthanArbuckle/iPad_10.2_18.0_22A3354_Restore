@implementation NTKPrideColorUtils

+ (id)layerForGradientWithColors:(id)a3 type:(id)a4 gradientLocations:(id)a5 startPoint:(CGPoint)a6 endPoint:(CGPoint)a7
{
  double y;
  double x;
  double v9;
  double v10;
  id v13;
  id v14;
  id v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  unsigned int v19;
  uint64_t v20;
  id v21;
  void *v22;
  unint64_t v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  id v27;
  CGColorRef Copy;
  void *v29;
  uint64_t v30;
  void *v31;
  int v33;
  id v34;
  id v35;

  y = a7.y;
  x = a7.x;
  v9 = a6.y;
  v10 = a6.x;
  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = objc_alloc_init(MEMORY[0x1E0CD2790]);
  v17 = objc_msgSend(v13, "count");
  v18 = v17;
  if ((id)*MEMORY[0x1E0CD2F50] == v14)
  {
    if (v15)
    {
      v20 = objc_msgSend(v15, "count");
      if (v20 != objc_msgSend(v13, "count"))
        goto LABEL_10;
      goto LABEL_7;
    }
    v34 = 0;
    v35 = v14;
    v19 = 0;
    v18 = v17 + 1;
    LODWORD(v15) = 1;
LABEL_12:
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", v18);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = (int)v15;
    if (v19 | v15)
      v23 = v18 - 1;
    else
      v23 = v18;
    v24 = v19;
    if (v23 > v19)
    {
      v25 = 0;
      v26 = v23 - v19;
      do
      {
        objc_msgSend(v13, "objectAtIndexedSubscript:", v25);
        v27 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        Copy = CGColorCreateCopy((CGColorRef)objc_msgSend(v27, "CGColor"));
        objc_msgSend(v22, "insertObject:atIndex:", Copy, v24 + v25);

        ++v25;
      }
      while (v26 != v25);
    }
    if ((v24 & 1) != 0)
    {
      objc_msgSend(v22, "objectAtIndexedSubscript:", 1);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "setObject:atIndexedSubscript:", v29, 0);

      v30 = v18 - 2;
      v15 = v34;
    }
    else
    {
      v15 = v34;
      if (!v33)
      {
LABEL_23:
        objc_msgSend(v16, "setColors:", v22);
        objc_msgSend(v16, "setLocations:", v15);
        objc_msgSend(v16, "setStartPoint:", v10, v9);
        objc_msgSend(v16, "setEndPoint:", x, y);
        v14 = v35;
        objc_msgSend(v16, "setType:", v35);
        v21 = v16;

        goto LABEL_24;
      }
      v30 = 0;
    }
    objc_msgSend(v22, "objectAtIndexedSubscript:", v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "insertObject:atIndex:", v31, v18 - 1);

    goto LABEL_23;
  }
  if (!v15)
  {
    v34 = 0;
    v35 = v14;
    v19 = 0;
    goto LABEL_12;
  }
  v18 = objc_msgSend(v15, "count");
  if (v18 == objc_msgSend(v13, "count") + 2)
  {
    v34 = v15;
    v35 = v14;
    LODWORD(v15) = 0;
    v19 = 1;
    goto LABEL_12;
  }
  if (v18 == objc_msgSend(v13, "count"))
  {
LABEL_7:
    v34 = v15;
    v35 = v14;
    v19 = 0;
    LODWORD(v15) = 0;
    goto LABEL_12;
  }
LABEL_10:
  v21 = 0;
LABEL_24:

  return v21;
}

+ (id)prideColorGradientColors2020
{
  void *v2;
  void *v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  char *v9;
  void *v10;
  uint64_t v11;
  void *v12;

  v2 = (void *)prideColorGradientColors2020__prideColorGradientColors2020;
  if (!prideColorGradientColors2020__prideColorGradientColors2020)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 6);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 0;
    v9 = &byte_1EF16D5D3;
    do
    {
      LOBYTE(v4) = *(v9 - 3);
      LOBYTE(v5) = *(v9 - 2);
      LOBYTE(v6) = *(v9 - 1);
      LOBYTE(v7) = *v9;
      objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", (double)v4 / 255.0, (double)v5 / 255.0, (double)v6 / 255.0, (double)v7 / 255.0);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "insertObject:atIndex:", v10, v8);

      ++v8;
      v9 += 4;
    }
    while (v8 != 6);
    v11 = objc_msgSend(v3, "copy");
    v12 = (void *)prideColorGradientColors2020__prideColorGradientColors2020;
    prideColorGradientColors2020__prideColorGradientColors2020 = v11;

    v2 = (void *)prideColorGradientColors2020__prideColorGradientColors2020;
  }
  return v2;
}

+ (id)gradientColorsForColor:(unint64_t)a3 device:(id)a4
{
  uint64_t v4;
  uint64_t v5;
  void *v6;

  if (a3)
  {
    v6 = 0;
  }
  else
  {
    objc_msgSend(a1, "prideColorGradientColors2020", 0, a4, v4, v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v6;
}

+ (id)axialColorGradientLayer:(unint64_t)a3 forDevice:(id)a4
{
  void *v5;
  void *v6;

  objc_msgSend(a1, "gradientColorsForColor:device:", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "layerForGradientWithColors:type:gradientLocations:startPoint:endPoint:", v5, *MEMORY[0x1E0CD2F48], 0, 0.5, 0.0, 0.5, 1.0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

@end
