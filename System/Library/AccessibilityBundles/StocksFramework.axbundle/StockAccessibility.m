@implementation StockAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("Stock");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)accessibilityLabel
{
  return -[StockAccessibility _accessibilityLabelWithMarketCap:](self, "_accessibilityLabelWithMarketCap:", 1);
}

- (id)_accessibilityLabelWithMarketCap:(BOOL)a3
{
  _BOOL4 v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  int v15;
  uint64_t v16;
  void *v17;
  void *v18;
  __CFString *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  _BOOL4 v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;

  v3 = a3;
  objc_opt_class();
  __UIAccessibilityCastAsClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "companyName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "formattedPrice");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "formattedChange");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "formattedChangePercent");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "marketcap");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BEB1410], "BlankValueString");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v10, "isEqualToString:", v11) & 1) == 0)
    {
      v12 = (void *)MEMORY[0x24BDD16F0];
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", objc_msgSend(v10, "longLongValue"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "localizedStringFromNumber:numberStyle:", v13, 5);
      v14 = objc_claimAutoreleasedReturnValue();

      v10 = (void *)v14;
    }
    v15 = objc_msgSend(v5, "changeIsNegative");
    if (v15)
    {
      objc_msgSend(CFSTR("-"), "stringByAppendingString:", v9);
      v16 = objc_claimAutoreleasedReturnValue();

      v9 = (void *)v16;
    }
    if (v6)
    {
      v35 = v3;
      v41 = v6;
      v42 = v7;
      if (v7)
      {
        objc_msgSend(MEMORY[0x24BDFEA60], "axAttributedStringWithString:", v7);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "setAttribute:forKey:", *MEMORY[0x24BDBD270], *MEMORY[0x24BDFEBD8]);
      }
      else
      {
        v17 = 0;
      }
      v39 = v17;
      if (v15)
        v19 = CFSTR("down");
      else
        v19 = CFSTR("up");
      accessibilityLocalizedString(v19);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", v8);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDFEA60], "axAttributedStringWithString:", v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8)
      {
        v22 = objc_msgSend(v20, "rangeOfString:", v8);
        if (v22 != 0x7FFFFFFFFFFFFFFFLL)
          objc_msgSend(v21, "setAttribute:forKey:withRange:", *MEMORY[0x24BDBD270], *MEMORY[0x24BDFEBD8], v22, v23);
      }
      v36 = v20;
      v37 = v21;
      v40 = v8;
      v24 = (void *)MEMORY[0x24BDD17C8];
      accessibilityLocalizedString(CFSTR("change.of"));
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "stringWithFormat:", v25, v9);
      v26 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x24BDFEA60], "axAttributedStringWithString:", v26);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      if (v9)
      {
        v28 = objc_msgSend(v26, "rangeOfString:", v9);
        if (v28 != 0x7FFFFFFFFFFFFFFFLL)
          objc_msgSend(v27, "setAttribute:forKey:withRange:", *MEMORY[0x24BDBD270], *MEMORY[0x24BDFEBD8], v28, v29);
      }
      v30 = 0;
      if ((objc_msgSend(v10, "isEqualToString:", v11) & 1) == 0 && v35)
      {
        v31 = (void *)MEMORY[0x24BDD17C8];
        accessibilityLocalizedString(CFSTR("market.cap"));
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "stringWithFormat:", v32, v10);
        v30 = (void *)objc_claimAutoreleasedReturnValue();

      }
      if (objc_msgSend(v7, "integerValue") < 0)
      {
        v18 = 0;
        v6 = v41;
        v33 = v37;
      }
      else
      {
        v33 = v37;
        v6 = v41;
        __UIAXStringForVariables();
        v18 = (void *)objc_claimAutoreleasedReturnValue();
      }

      v7 = v42;
      v8 = v40;
    }
    else
    {
      v18 = 0;
    }

  }
  else
  {
    v18 = 0;
  }

  return v18;
}

- (id)_accessibilitySpeakThisString
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  __CFString *v7;
  void *v8;
  void *v9;

  objc_opt_class();
  __UIAccessibilityCastAsClass();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "companyName");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "formattedPrice");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "formattedChange");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v3, "changeIsNegative"))
      v7 = CFSTR("ticker.cell.format.down.short");
    else
      v7 = CFSTR("ticker.cell.format.up.short");
    accessibilityLocalizedString(v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", v8, v4, v5, v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

@end
