@implementation UIColor

+ (UIColor)colorWithHexValue:(id)a3 error:(id *)a4
{
  id v5;
  uint64_t v6;
  char *v7;
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
  id *v19;
  int v20;
  double v21[3];

  v5 = a3;
  if (objc_msgSend(v5, "hasPrefix:", CFSTR("#")) && (unint64_t)objc_msgSend(v5, "length") >= 2)
  {
    v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "substringFromIndex:", 1));

    v5 = (id)v6;
  }
  v7 = (char *)objc_msgSend(v5, "length");
  if (v7 == (_BYTE *)&dword_0 + 3)
  {
    v19 = a4;
    v8 = 1;
  }
  else
  {
    if (objc_msgSend(v5, "length") != (char *)&dword_4 + 2)
    {
      if (a4)
        goto LABEL_15;
      goto LABEL_17;
    }
    v19 = a4;
    v8 = 2;
  }
  v9 = 0;
  v10 = 0;
  v11 = 1;
  do
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "substringWithRange:", v9, v8, v19));
    v13 = v12;
    if (v7 == (_BYTE *)&dword_0 + 3)
    {
      v14 = objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "stringByAppendingString:", v12));

      v13 = (void *)v14;
    }
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSScanner scannerWithString:](NSScanner, "scannerWithString:", v13));
    v20 = 0;
    v11 &= objc_msgSend(v15, "scanHexInt:", &v20);
    LODWORD(v16) = v20;
    v21[v10] = (double)v16 / 255.0;

    ++v10;
    v9 += v8;
  }
  while (v10 != 3);
  if ((v11 & 1) == 0)
  {
    a4 = v19;
    if (v19)
    {
LABEL_15:
      v17 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.diagnostics.invalidHexValue"), -1, 0));
      goto LABEL_18;
    }
LABEL_17:
    v17 = 0;
    goto LABEL_18;
  }
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", v21[0], v21[1], v21[2], 1.0));
LABEL_18:

  return (UIColor *)v17;
}

@end
