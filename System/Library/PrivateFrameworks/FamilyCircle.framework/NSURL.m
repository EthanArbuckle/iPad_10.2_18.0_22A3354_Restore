@implementation NSURL

void __49__NSURL_FamilyCircle__fa_URLByAddingQueryParams___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  v5 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v10, "stringValue");
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v7 = 0;
      goto LABEL_7;
    }
    v6 = v10;
  }
  v7 = v6;
LABEL_7:
  v8 = *(void **)(a1 + 32);
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB39D8]), "initWithName:value:", v5, v7);

  objc_msgSend(v8, "addObject:", v9);
}

@end
