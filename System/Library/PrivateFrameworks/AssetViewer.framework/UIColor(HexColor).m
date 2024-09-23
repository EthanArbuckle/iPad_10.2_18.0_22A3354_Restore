@implementation UIColor(HexColor)

+ (id)colorWithHexValue:()HexColor error:
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  unint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  _QWORD *v21;
  int v22;
  double v23[4];

  v23[3] = *(double *)MEMORY[0x1E0C80C00];
  v5 = a3;
  if (objc_msgSend(v5, "hasPrefix:", CFSTR("#")) && (unint64_t)objc_msgSend(v5, "length") >= 2)
  {
    objc_msgSend(v5, "substringFromIndex:", 1);
    v6 = objc_claimAutoreleasedReturnValue();

    v5 = (id)v6;
  }
  v7 = objc_msgSend(v5, "length");
  if (v7 == 3)
  {
    v21 = a4;
    v8 = 1;
  }
  else
  {
    if (objc_msgSend(v5, "length") != 6)
    {
      if (a4)
      {
        v18 = (void *)MEMORY[0x1E0CB35C8];
        v19 = 0;
        goto LABEL_18;
      }
LABEL_19:
      v17 = 0;
      goto LABEL_20;
    }
    v21 = a4;
    v8 = 2;
  }
  v9 = 0;
  v10 = 0;
  v11 = 1;
  do
  {
    objc_msgSend(v5, "substringWithRange:", v9, v8, v21);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v7 == 3)
    {
      objc_msgSend(v12, "stringByAppendingString:", v12);
      v14 = objc_claimAutoreleasedReturnValue();

      v13 = (void *)v14;
    }
    objc_msgSend(MEMORY[0x1E0CB3900], "scannerWithString:", v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = 0;
    v11 &= objc_msgSend(v15, "scanHexInt:", &v22);
    LODWORD(v16) = v22;
    v23[v10] = (double)v16 / 255.0;

    ++v10;
    v9 += v8;
  }
  while (v10 != 3);
  if ((v11 & 1) == 0)
  {
    a4 = v21;
    if (v21)
    {
      v18 = (void *)MEMORY[0x1E0CB35C8];
      v19 = 1;
LABEL_18:
      objc_msgSend(v18, "errorWithDomain:code:userInfo:", CFSTR("com.apple.AssetViewer.invalidHexValue"), v19, 0);
      v17 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_20;
    }
    goto LABEL_19;
  }
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", v23[0], v23[1], v23[2], 1.0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_20:

  return v17;
}

@end
