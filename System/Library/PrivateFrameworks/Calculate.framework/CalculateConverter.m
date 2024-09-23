@implementation CalculateConverter

+ (id)currencyCacheLastRefreshDate
{
  void *v2;
  void *v3;

  if (+[StocksKitCurrencyCache isEnabled](_TtC9Calculate22StocksKitCurrencyCache, "isEnabled"))
  {
    v2 = (void *)objc_opt_new();
  }
  else
  {
    +[CalculateCurrencyCache shared](CalculateCurrencyCache, "shared");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "lastRefreshDate");
    v2 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v2;
}

+ (BOOL)needsRefresh
{
  _BOOL4 v2;
  __objc2_class **v3;
  void *v4;
  char v5;

  v2 = +[StocksKitCurrencyCache isEnabled](_TtC9Calculate22StocksKitCurrencyCache, "isEnabled");
  v3 = off_1E6E9C2F0;
  if (v2)
    v3 = &off_1E6E9C478;
  -[__objc2_class shared](*v3, "shared");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "needsRefresh");

  return v5;
}

+ (BOOL)refreshCurrencyCache
{
  void *v2;
  char v3;
  BOOL v4;

  if (+[StocksKitCurrencyCache isEnabled](_TtC9Calculate22StocksKitCurrencyCache, "isEnabled"))
  {
    +[StocksKitCurrencyCache shared](_TtC9Calculate22StocksKitCurrencyCache, "shared");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v2, "refreshSynchronously");
  }
  else
  {
    +[CalculateCurrencyCache shared](CalculateCurrencyCache, "shared");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v2, "refresh");
  }
  v4 = v3;

  return v4;
}

+ (BOOL)refreshCurrencyCacheIfNeeded
{
  void *v2;
  int v3;
  void *v4;
  char v5;

  if (!+[StocksKitCurrencyCache isEnabled](_TtC9Calculate22StocksKitCurrencyCache, "isEnabled"))
  {
    +[CalculateCurrencyCache shared](CalculateCurrencyCache, "shared");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "refreshIfNeeded");
    goto LABEL_5;
  }
  +[StocksKitCurrencyCache shared](_TtC9Calculate22StocksKitCurrencyCache, "shared");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "needsRefresh");

  if (v3)
  {
    +[StocksKitCurrencyCache shared](_TtC9Calculate22StocksKitCurrencyCache, "shared");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "refreshSynchronously");
LABEL_5:
    LOBYTE(v3) = v5;

  }
  return v3;
}

@end
