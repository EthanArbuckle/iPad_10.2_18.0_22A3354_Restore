@implementation NSError

uint64_t __50__NSError_FPAdditions__fp_initLocalizationStrings__block_invoke()
{
  return objc_msgSend(MEMORY[0x1E0CB35C8], "setUserInfoValueProviderForDomain:provider:", CFSTR("NSFileProviderErrorDomain"), &__block_literal_global_80);
}

uint64_t __50__NSError_FPAdditions__fp_initLocalizationStrings__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "fp_userInfoValueForKey:");
}

void __40__NSError_FPAdditions__fp_strippedError__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  id v7;

  v7 = a2;
  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v5, "fp_strippedError");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v6, v7);

    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0
        || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
        || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v5, v7);
      }
    }
  }

}

uint64_t __59__NSError_FPAdditions__fp_annotatedErrorWithItems_variant___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "itemIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *(_QWORD *)(a1 + 32));

  return v4;
}

@end
