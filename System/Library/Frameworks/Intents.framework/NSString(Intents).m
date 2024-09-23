@implementation NSString(Intents)

+ (id)deferredLocalizedIntentsStringWithFormat:()Intents
{
  objc_msgSend(a1, "deferredLocalizedIntentsStringWithFormat:fromTable:arguments:", a3, 0, &a9);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (INDeferredLocalizedString)deferredLocalizedIntentsStringWithFormat:()Intents fromTable:arguments:
{
  id v7;
  id v8;
  INDeferredLocalizedString *v9;

  v7 = a4;
  v8 = a3;
  v9 = -[INDeferredLocalizedString initWithDeferredFormat:fromTable:bundle:arguments:]([INDeferredLocalizedString alloc], "initWithDeferredFormat:fromTable:bundle:arguments:", v8, v7, 0, a5);

  return v9;
}

+ (id)deferredLocalizedIntentsStringWithFormat:()Intents fromTable:
{
  objc_msgSend(a1, "deferredLocalizedIntentsStringWithFormat:fromTable:arguments:", a3, a4, &a9);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (INDeferredLocalizedString)deferredLocalizedIntentsStringWithFormat:()Intents fromTable:bundle:
{
  id v11;
  id v12;
  id v13;
  INDeferredLocalizedString *v14;

  v11 = a5;
  v12 = a4;
  v13 = a3;
  v14 = -[INDeferredLocalizedString initWithDeferredFormat:fromTable:bundle:arguments:]([INDeferredLocalizedString alloc], "initWithDeferredFormat:fromTable:bundle:arguments:", v13, v12, v11, &a9);

  return v14;
}

@end
