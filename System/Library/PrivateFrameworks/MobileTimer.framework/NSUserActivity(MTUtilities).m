@implementation NSUserActivity(MTUtilities)

+ (uint64_t)mtUserActivityWithActivityType:()MTUtilities title:
{
  return objc_msgSend(a1, "mtUserActivityWithActivityType:title:keywords:", a3, a4, 0);
}

+ (id)mtUserActivityWithActivityType:()MTUtilities title:keywords:
{
  id v7;
  objc_class *v8;
  id v9;
  id v10;
  void *v11;
  void *v12;

  v7 = a5;
  v8 = (objc_class *)MEMORY[0x1E0CB3B10];
  v9 = a4;
  v10 = a3;
  v11 = (void *)objc_msgSend([v8 alloc], "initWithActivityType:", v10);

  objc_msgSend(v11, "setEligibleForHandoff:", 1);
  objc_msgSend(v11, "setEligibleForSearch:", 1);
  objc_msgSend(v11, "setEligibleForPublicIndexing:", 1);
  objc_msgSend(v11, "setTitle:", v9);

  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v7);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setKeywords:", v12);

  }
  else
  {
    objc_msgSend(v11, "setKeywords:", 0);
  }

  return v11;
}

+ (uint64_t)mtUserActivityWithActivityType:()MTUtilities
{
  return objc_msgSend(a1, "mtUserActivityWithActivityType:title:", a3, 0);
}

@end
