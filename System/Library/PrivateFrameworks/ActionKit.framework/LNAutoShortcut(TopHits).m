@implementation LNAutoShortcut(TopHits)

- (id)actionParameterIdentifier
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  objc_msgSend(a1, "parameterPresentation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "parameterIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "bundleIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isEqualToString:", *MEMORY[0x24BEC1760]);

    if (v6)
    {
      objc_msgSend(MEMORY[0x24BE5FFE0], "parameterOverrides");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "actionIdentifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "objectForKeyedSubscript:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (v9)
      {
        v10 = v9;

        v4 = v10;
      }

    }
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

+ (id)parameterOverrides
{
  if (parameterOverrides_onceToken != -1)
    dispatch_once(&parameterOverrides_onceToken, &__block_literal_global_25332);
  return (id)parameterOverrides_parameterOverrides;
}

@end
