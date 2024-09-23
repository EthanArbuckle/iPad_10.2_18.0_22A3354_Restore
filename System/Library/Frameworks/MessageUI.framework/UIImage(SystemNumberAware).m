@implementation UIImage(SystemNumberAware)

+ (id)mf_systemImageNamedNumberAware:()SystemNumberAware textStyle:scale:weight:maximumContentSizeCategory:
{
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;

  v11 = a3;
  v12 = a4;
  v13 = a7;
  v14 = v11;
  if (MapImageNameNumberAware_onceToken != -1)
    dispatch_once(&MapImageNameNumberAware_onceToken, &__block_literal_global_40);
  if ((objc_msgSend((id)MapImageNameNumberAware_sDigitAwareSet, "containsObject:", v14) & 1) == 0)
  {

    v19 = 0;
LABEL_14:
    objc_msgSend(MEMORY[0x1E0DC3870], "mf_systemImageNamed:textStyle:scale:weight:maximumContentSizeCategory:", v14, v12, a5, a6, v13);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_15;
  }
  objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "languageCode");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v16, "isEqualToString:", CFSTR("ar")) & 1) != 0
    || objc_msgSend(v16, "isEqualToString:", CFSTR("hi")))
  {
    objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "numberingSystem");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v18, "isEqualToString:", CFSTR("latn")))
    {
      objc_msgSend(v14, "stringByAppendingFormat:", CFSTR(".rtl.westernarabic"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v19 = 0;
    }

  }
  else
  {
    v19 = 0;
  }

  if (!v19)
    goto LABEL_14;
  objc_msgSend(MEMORY[0x1E0DC3870], "mf_symbolConfigurationForImageSymbolType:textStyle:scale:weight:traits:maximumContentSizeCategory:", 2, v12, a5, a6, 0, v13);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = (void *)MEMORY[0x1E0DC3870];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.messageui"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "imageNamed:inBundle:withConfiguration:", v19, v22, v20);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v23)
    goto LABEL_14;
LABEL_15:

  return v23;
}

@end
