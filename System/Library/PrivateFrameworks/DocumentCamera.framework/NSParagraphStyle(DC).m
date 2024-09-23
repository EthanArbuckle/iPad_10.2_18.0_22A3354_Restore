@implementation NSParagraphStyle(DC)

+ (BOOL)dc_isRTL
{
  return objc_msgSend(a1, "defaultWritingDirectionForLanguage:", 0) == 1;
}

+ (id)dc_mutableDefaultParagraphStyle
{
  void *v0;
  void *v1;
  void *v2;
  unint64_t v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  double v10;
  void *v11;

  objc_msgSend(MEMORY[0x24BDF6750], "defaultParagraphStyle");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = (void *)objc_msgSend(v0, "mutableCopy");

  objc_msgSend(v1, "tabStops");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  if (v3 < 2)
  {
    objc_msgSend(v1, "setDefaultTabInterval:", 28.0);
  }
  else
  {
    objc_msgSend(v1, "tabStops");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectAtIndexedSubscript:", 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "location");
    v7 = v6;
    objc_msgSend(v1, "tabStops");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectAtIndexedSubscript:", 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "location");
    objc_msgSend(v1, "setDefaultTabInterval:", v7 - v10);

  }
  objc_msgSend(MEMORY[0x24BDBCE30], "array");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setTabStops:", v11);

  return v1;
}

@end
