@implementation NSURLQueryItem

id __63__NSURLQueryItem_AppleMediaServices__queryItemsFromDictionary___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  void *v10;

  v4 = a2;
  v5 = a3;
  v6 = v4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7 = v6;

    if (v7)
      goto LABEL_6;
  }
  else
  {

  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@"), v6);
  v7 = (id)objc_claimAutoreleasedReturnValue();
LABEL_6:
  v8 = v5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

LABEL_10:
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@"), v8);
    v9 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_11;
  }
  v9 = v8;

  if (!v9)
    goto LABEL_10;
LABEL_11:
  objc_msgSend(MEMORY[0x1E0CB39D8], "queryItemWithName:value:", v7, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

@end
