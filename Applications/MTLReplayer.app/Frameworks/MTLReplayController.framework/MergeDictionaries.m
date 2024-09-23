@implementation MergeDictionaries

void __MergeDictionaries_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;

  v14 = a2;
  v5 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v14));
  if (!v7)
    goto LABEL_7;
  v8 = objc_opt_class(NSDictionary, v6);
  if ((objc_opt_isKindOfClass(v7, v8) & 1) == 0)
  {
    v12 = objc_opt_class(NSArray, v9);
    if ((objc_opt_isKindOfClass(v7, v12) & 1) != 0)
    {
      v11 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "arrayByAddingObjectsFromArray:", v5));
      goto LABEL_6;
    }
LABEL_7:
    objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v5, v14);
    goto LABEL_8;
  }
  v10 = MergeDictionaries(v7, v5);
  v11 = objc_claimAutoreleasedReturnValue(v10);
LABEL_6:
  v13 = (void *)v11;
  objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v11, v14);

LABEL_8:
}

@end
