@implementation ValidateIntervalDefinitionDict

BOOL ___ValidateIntervalDefinitionDict_block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  _BOOL8 v3;

  objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("type"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

BOOL ___ValidateIntervalDefinitionDict_block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  _BOOL8 v3;

  objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("quantity"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

uint64_t ___ValidateIntervalDefinitionDict_block_invoke_3(uint64_t a1, void *a2)
{
  void *v2;
  char isKindOfClass;

  objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("quantity"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

uint64_t ___ValidateIntervalDefinitionDict_block_invoke_4(uint64_t a1, void *a2)
{
  void *v2;
  char isKindOfClass;

  objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("type"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

BOOL ___ValidateIntervalDefinitionDict_block_invoke_5(uint64_t a1, void *a2)
{
  void *v2;
  _BOOL8 v3;

  objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("type"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (unint64_t)(objc_msgSend(v2, "integerValue") - 1) < 2;

  return v3;
}

@end
