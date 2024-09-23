@implementation UIColor

+ (id)hexValuedColor:(id)a3 colorSpace:(__CFString *)a4 error:(id *)a5
{
  id v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  int v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  unint64_t v18;
  uint64_t v19;
  void *v20;
  __CFString *v22;
  id *v23;
  int v24;
  double v25;
  double v26;
  double v27;

  v7 = a3;
  if (objc_msgSend(v7, "hasPrefix:", CFSTR("#")) && (unint64_t)objc_msgSend(v7, "length") >= 2)
  {
    v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "substringFromIndex:", 1));

    v7 = (id)v8;
  }
  v9 = objc_msgSend(v7, "length");
  if (v9 == (id)3)
  {
    v22 = a4;
    v23 = a5;
    v10 = 1;
  }
  else
  {
    if (objc_msgSend(v7, "length") != (id)6)
    {
      if (a5)
        goto LABEL_16;
      goto LABEL_18;
    }
    v22 = a4;
    v23 = a5;
    v10 = 2;
  }
  v11 = 0;
  v12 = 0;
  v13 = 1;
  do
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "substringWithRange:", v11, v10));
    v15 = v14;
    if (v9 == (id)3)
    {
      v16 = objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "stringByAppendingString:", v14));

      v15 = (void *)v16;
    }
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSScanner scannerWithString:](NSScanner, "scannerWithString:", v15));
    v24 = 0;
    v13 &= objc_msgSend(v17, "scanHexInt:", &v24);
    LODWORD(v18) = v24;
    *(double *)((char *)&v25 + v12) = (double)v18 / 255.0;

    v12 += 8;
    v11 += v10;
  }
  while (v12 != 24);
  if ((v13 & 1) == 0)
  {
    a5 = v23;
    if (v23)
    {
LABEL_16:
      v20 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.diagnostics.invalidHexValue"), -1, 0));
      goto LABEL_21;
    }
LABEL_18:
    v20 = 0;
    goto LABEL_21;
  }
  if (kCGColorSpaceDisplayP3 == v22)
    v19 = objc_claimAutoreleasedReturnValue(+[UIColor colorWithDisplayP3Red:green:blue:alpha:](UIColor, "colorWithDisplayP3Red:green:blue:alpha:", v25, v26, v27, 1.0));
  else
    v19 = objc_claimAutoreleasedReturnValue(+[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", v25, v26, v27, 1.0));
  v20 = (void *)v19;
LABEL_21:

  return v20;
}

@end
