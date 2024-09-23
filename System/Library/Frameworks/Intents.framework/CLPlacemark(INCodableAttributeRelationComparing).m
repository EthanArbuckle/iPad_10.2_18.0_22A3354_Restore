@implementation CLPlacemark(INCodableAttributeRelationComparing)

- (uint64_t)_intents_compareValue:()INCodableAttributeRelationComparing relation:
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;

  v6 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7 = v6;
    if (v7)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v8 = v7;
      else
        v8 = 0;
    }
    else
    {
      v8 = 0;
    }
    v12 = v8;

    objc_msgSend(v12, "name");
    v13 = objc_claimAutoreleasedReturnValue();
LABEL_16:
    v11 = (void *)v13;

    goto LABEL_17;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v9 = v6;
    if (v9)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v10 = v9;
      else
        v10 = 0;
    }
    else
    {
      v10 = 0;
    }
    v12 = v10;

    objc_msgSend(v12, "if_flatMap:", &__block_literal_global_31675);
    v13 = objc_claimAutoreleasedReturnValue();
    goto LABEL_16;
  }
  v11 = 0;
LABEL_17:
  objc_msgSend(a1, "name");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "_intents_compareValue:relation:", v11, a4);

  return v15;
}

@end
