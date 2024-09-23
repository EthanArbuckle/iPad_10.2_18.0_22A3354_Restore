@implementation HUStringDisplayFormatter

+ (id)stringByApplyingCodeFormatToString:(id)a3
{
  void *v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(a3, "hf_extractDecimalDigits");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v3, "length") > 8)
  {
    if ((unint64_t)objc_msgSend(v3, "length") > 0xB)
      +[HUStringDisplayFormatter _stringByApplyingMatter21DigitFormatToString:](HUStringDisplayFormatter, "_stringByApplyingMatter21DigitFormatToString:", v3);
    else
      +[HUStringDisplayFormatter _stringByApplyingMatter11DigitFormatToString:](HUStringDisplayFormatter, "_stringByApplyingMatter11DigitFormatToString:", v3);
    v4 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    +[HUStringDisplayFormatter _stringByApplyingHomeKit8DigitFormatToString:](HUStringDisplayFormatter, "_stringByApplyingHomeKit8DigitFormatToString:", v3);
    v4 = objc_claimAutoreleasedReturnValue();
  }
  v5 = (void *)v4;

  return v5;
}

+ (id)_stringByApplyingHomeKit8DigitFormatToString:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  if ((unint64_t)objc_msgSend(v3, "length") > 4)
  {
    v4 = (id)objc_msgSend(v3, "mutableCopy");
    objc_msgSend(v4, "insertString:atIndex:", CFSTR("-"), 4);
  }
  else
  {
    v4 = v3;
  }

  return v4;
}

+ (id)_stringByApplyingMatter11DigitFormatToString:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  if ((unint64_t)objc_msgSend(v3, "length") > 4)
  {
    v4 = (id)objc_msgSend(v3, "mutableCopy");
    objc_msgSend(v4, "insertString:atIndex:", CFSTR("-"), 4);
    if ((unint64_t)objc_msgSend(v4, "length") >= 9)
      objc_msgSend(v4, "insertString:atIndex:", CFSTR("-"), 8);
  }
  else
  {
    v4 = v3;
  }

  return v4;
}

+ (id)_stringByApplyingMatter21DigitFormatToString:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  if ((unint64_t)objc_msgSend(v3, "length") > 4)
  {
    v4 = (id)objc_msgSend(v3, "mutableCopy");
    objc_msgSend(v4, "insertString:atIndex:", CFSTR("-"), 4);
    if ((unint64_t)objc_msgSend(v4, "length") >= 9)
      objc_msgSend(v4, "insertString:atIndex:", CFSTR("-"), 8);
    if ((unint64_t)objc_msgSend(v4, "length") >= 0xE)
      objc_msgSend(v4, "insertString:atIndex:", CFSTR(" "), 13);
    if ((unint64_t)objc_msgSend(v4, "length") >= 0x13)
      objc_msgSend(v4, "insertString:atIndex:", CFSTR("-"), 18);
    if ((unint64_t)objc_msgSend(v4, "length") >= 0x17)
      objc_msgSend(v4, "insertString:atIndex:", CFSTR("-"), 22);
    if ((unint64_t)objc_msgSend(v4, "length") >= 0x1A)
      objc_msgSend(v4, "insertString:atIndex:", CFSTR("-"), 25);
  }
  else
  {
    v4 = v3;
  }

  return v4;
}

@end
