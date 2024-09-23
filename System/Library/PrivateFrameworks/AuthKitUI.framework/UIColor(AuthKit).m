@implementation UIColor(AuthKit)

+ (id)ak_colorWithServerRGBRepresentation:()AuthKit
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  void *v13;
  int v15;
  uint64_t v16;

  v3 = a3;
  if (objc_msgSend(v3, "length") == 6)
  {
    v16 = 0;
    v15 = 0;
    objc_msgSend(v3, "substringWithRange:", 0, 2);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "substringWithRange:", 2, 2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "substringWithRange:", 4, 2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3900], "scannerWithString:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "scanHexInt:", (char *)&v16 + 4);
    objc_msgSend(MEMORY[0x1E0CB3900], "scannerWithString:", v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "scanHexInt:", &v16);
    objc_msgSend(MEMORY[0x1E0CB3900], "scannerWithString:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "scanHexInt:", &v15);
    LODWORD(v10) = HIDWORD(v16);
    LODWORD(v11) = v16;
    LODWORD(v12) = v15;
    objc_msgSend(MEMORY[0x1E0CEA478], "colorWithRed:green:blue:alpha:", (double)v10 / 255.0, (double)v11 / 255.0, (double)v12 / 255.0, 1.0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

@end
