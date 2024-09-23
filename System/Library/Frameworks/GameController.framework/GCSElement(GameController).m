@implementation GCSElement(GameController)

- (void)initWithElement:()GameController
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = a3;
  objc_msgSend(v4, "unmappedNameLocalizationKey");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(v4, "unmappedSfSymbolsName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v7 = 1;
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v7 = 2;
        else
          v7 = 0;
      }
      objc_msgSend(v4, "primaryAlias");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "unmappedNameLocalizationKey");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "unmappedSfSymbolsName");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      a1 = (id)objc_msgSend(a1, "initWithName:nameLocalizationKey:sfSymbolsName:remappingKey:kind:", v8, v9, v10, objc_msgSend(v4, "remappingKey"), v7);

      v5 = a1;
    }
    else
    {
      v5 = 0;
    }
  }

  return v5;
}

@end
