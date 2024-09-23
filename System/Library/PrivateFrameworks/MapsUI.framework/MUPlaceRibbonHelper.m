@implementation MUPlaceRibbonHelper

+ (id)costStringForValue:(unint64_t)a3 locale:(id)a4
{
  void *v5;
  __CFString *v6;
  unsigned int v7;
  __CFString *v8;
  unint64_t v9;

  if (a3)
  {
    MKCurrencySymbolForLocale();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = &stru_1E2E05448;
    v7 = 1;
    do
    {
      v8 = v6;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@"), v6, v5);
      v6 = (__CFString *)objc_claimAutoreleasedReturnValue();

      v9 = v7++;
    }
    while (v9 < a3);

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

+ (id)priceRangeForMapItem:(id)a3 locale:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  __CFString *v10;

  v6 = a3;
  v7 = a4;
  if (v7)
  {
    objc_msgSend(v6, "_geoMapItem");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      objc_msgSend(v6, "_geoMapItem");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "costStringForValue:locale:", objc_msgSend(v9, "_priceRange"), v7);
      v10 = (__CFString *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v10 = &stru_1E2E05448;
    }
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

@end
