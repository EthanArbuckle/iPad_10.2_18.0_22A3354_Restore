@implementation NSNumber(WFNaming)

- (uint64_t)wfName
{
  return objc_msgSend(a1, "wfNameWithMaximumFractionDigits:", &unk_24C50F200);
}

- (id)wfNameWithMaximumFractionDigits:()WFNaming
{
  id v4;
  void *v5;
  char isKindOfClass;
  __CFString *v7;
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;

  v4 = a3;
  if (!v4)
  {
    objc_msgSend(a1, "wfName");
    v8 = objc_claimAutoreleasedReturnValue();
LABEL_9:
    v11 = (void *)v8;
    goto LABEL_10;
  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    if ((objc_msgSend(a1, "BOOLValue") & 1) != 0)
      v7 = CFSTR("Yes");
    else
      v7 = CFSTR("No");
    WFLocalizedString(v7);
    v8 = objc_claimAutoreleasedReturnValue();
    goto LABEL_9;
  }
  v9 = objc_alloc_init(MEMORY[0x24BDD16F0]);
  objc_msgSend(v9, "setUsesSignificantDigits:", 0);
  objc_msgSend(v9, "setMaximumFractionDigits:", objc_msgSend(v4, "integerValue"));
  objc_msgSend(MEMORY[0x24BDBCEA0], "autoupdatingCurrentLocale");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setLocale:", v10);

  objc_msgSend(v9, "setUsesGroupingSeparator:", 0);
  objc_msgSend(v9, "stringFromNumber:", a1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_10:
  return v11;
}

@end
