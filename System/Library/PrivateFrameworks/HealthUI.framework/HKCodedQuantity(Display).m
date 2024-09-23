@implementation HKCodedQuantity(Display)

- (id)displayString
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(a1, "comparatorCoding");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(a1, "comparatorCoding");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "code");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "_shortDisplayStringForComparatorCode:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(a1, "localizedValue");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringByAppendingString:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(a1, "localizedValue");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v7;
}

- (id)_shortDisplayStringForComparatorCode:()Display
{
  uint64_t v3;
  id v4;
  void *v5;

  v3 = _shortDisplayStringForComparatorCode__onceToken;
  v4 = a3;
  if (v3 != -1)
    dispatch_once(&_shortDisplayStringForComparatorCode__onceToken, &__block_literal_global_4);
  objc_msgSend((id)_shortDisplayStringForComparatorCode__shortDisplayStringComparatorDictionary, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

@end
