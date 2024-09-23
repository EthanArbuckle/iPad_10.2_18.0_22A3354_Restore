@implementation AXValueChangeUtilities

+ (id)phoneNumberWithoutFormattingCharacters:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  objc_msgSend(v3, "stringByReplacingOccurrencesOfString:withString:options:range:", CFSTR("[-()\\s]"), &stru_1E24CAB08, 1024, 0, objc_msgSend(v3, "length"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)handleValueChangeForPhoneDeletionWithOldString:(id)a3 newString:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  int64_t v8;
  void *v9;

  v5 = a4;
  +[AXValueChangeUtilities phoneNumberWithoutFormattingCharacters:](AXValueChangeUtilities, "phoneNumberWithoutFormattingCharacters:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[AXValueChangeUtilities phoneNumberWithoutFormattingCharacters:](AXValueChangeUtilities, "phoneNumberWithoutFormattingCharacters:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v6, "length") && objc_msgSend(v7, "length"))
  {
    v8 = +[AXValueChangeUtilities findLocationOfDifferenceInOldString:withNewString:](AXValueChangeUtilities, "findLocationOfDifferenceInOldString:withNewString:", v6, v7);
  }
  else
  {
    objc_msgSend(v6, "length");
    v8 = 0;
  }
  if (v8 + 1 <= (unint64_t)objc_msgSend(v6, "length"))
  {
    objc_msgSend(v6, "substringWithRange:", v8, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

+ (int64_t)findLocationOfDifferenceInOldString:(id)a3 withNewString:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  int64_t v11;
  int v12;
  int v13;
  BOOL v14;
  _BOOL4 v15;
  int64_t v17;

  v5 = a3;
  v6 = a4;
  v7 = objc_msgSend(v5, "length");
  v8 = objc_msgSend(v6, "length");
  v9 = v8;
  if (v7 >= v8)
    v10 = v8;
  else
    v10 = v7;
  if (v10 < 1)
  {
    v11 = 0;
  }
  else
  {
    v11 = 0;
    while (1)
    {
      v12 = objc_msgSend(v5, "characterAtIndex:", v11);
      v13 = objc_msgSend(v6, "characterAtIndex:", v11);
      if (v12 != 160 || v13 != 32)
      {
        v14 = v12 == 32 && v13 == 160;
        v15 = v14;
        if (v12 != v13 && !v15)
          break;
      }
      if (v10 == ++v11)
      {
        v11 = v10;
        break;
      }
    }
  }
  if (v7 >= v9 && v11 == v7)
    v17 = v7 - 1;
  else
    v17 = v11;

  return v17;
}

@end
