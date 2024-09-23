@implementation INLocalizedFormatStringFromCodable

id __INLocalizedFormatStringFromCodable_block_invoke(uint64_t a1, void *a2, uint64_t *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  uint64_t v12;
  void *v13;
  char v14;

  v5 = a2;
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {

    objc_msgSend(*(id *)(a1 + 40), "_objectDescription");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "attributeByKeyPath:", v5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(*(id *)(a1 + 40), "valueForKeyPath:", v5);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "typeName");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "isEqualToString:", CFSTR("Long"));

        if ((v11 & 1) != 0)
        {
          v12 = 1;
LABEL_14:
          *a3 = v12;
LABEL_17:

          goto LABEL_18;
        }
        objc_msgSend(v9, "typeName");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "isEqualToString:", CFSTR("Double"));

        if ((v14 & 1) != 0)
        {
          v12 = 2;
          goto LABEL_14;
        }

      }
    }
    v6 = 0;
    goto LABEL_17;
  }
  if ((objc_msgSend(v6, "_intents_isInteger") & 1) != 0)
  {
    v7 = 1;
LABEL_11:
    *a3 = v7;
    goto LABEL_18;
  }
  if (objc_msgSend(v6, "_intents_isDouble"))
  {
    v7 = 2;
    goto LABEL_11;
  }
LABEL_18:

  return v6;
}

@end
