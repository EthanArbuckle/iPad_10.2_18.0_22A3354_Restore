@implementation CalculateKeys

- (NSDictionary)options
{
  return self->_options;
}

- (void)setOptions:(id)a3
{
  objc_storeStrong((id *)&self->_options, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_options, 0);
}

+ (id)keysWithOptions:(uint64_t)a1
{
  id v2;
  id *v3;

  v2 = a2;
  objc_opt_self();
  v3 = -[CalculateKeys initWithOptions:]((id *)[CalculateKeys alloc], v2);

  return v3;
}

- (id)initWithOptions:(id *)a1
{
  id v4;
  id *v5;
  objc_super v7;

  v4 = a2;
  if (a1)
  {
    v7.receiver = a1;
    v7.super_class = (Class)CalculateKeys;
    v5 = (id *)objc_msgSendSuper2(&v7, sel_init);
    a1 = v5;
    if (v5)
      objc_storeStrong(v5 + 1, a2);
  }

  return a1;
}

- (id)locales
{
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  void *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  objc_msgSend(*(id *)(a1 + 8), "objectForKeyedSubscript:", CFSTR("CalculateKeyLocales"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0C99DC8], "localeWithLocaleIdentifier:", v1);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = v2;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 1);
    v3 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v6 = v1;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v6, 1);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_10;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v4 = 0;
      goto LABEL_10;
    }
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "filteredArrayUsingPredicate:", v2);
    v3 = objc_claimAutoreleasedReturnValue();
  }
  v4 = (void *)v3;

LABEL_10:
  return v4;
}

uint64_t __24__CalculateKeys_locales__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (id)numberFormatter
{
  void *v1;
  id v2;

  if (a1)
  {
    objc_msgSend(*(id *)(a1 + 8), "objectForKeyedSubscript:", CFSTR("CalculateKeyNumberFormatter"));
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v2 = v1;
    else
      v2 = 0;

  }
  else
  {
    v2 = 0;
  }
  return v2;
}

- (uint64_t)autoScientificNotation
{
  void *v1;
  uint64_t v2;

  if (!a1)
    return 0;
  objc_msgSend(*(id *)(a1 + 8), "objectForKeyedSubscript:", CFSTR("CalculateKeyAutoScientificNotation"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v2 = objc_msgSend(v1, "BOOLValue");
  else
    v2 = 1;

  return v2;
}

- (uint64_t)scientificNotationFormat
{
  void *v1;
  uint64_t v2;

  if (!a1)
    return 0;
  objc_msgSend(*(id *)(a1 + 8), "objectForKeyedSubscript:", CFSTR("CalculateKeyScientificNotationFormat"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v2 = (int)objc_msgSend(v1, "intValue");
  else
    v2 = 1;

  return v2;
}

- (uint64_t)flexibleFractionDigits
{
  void *v1;
  uint64_t v2;

  if (!a1)
    return 0;
  objc_msgSend(*(id *)(a1 + 8), "objectForKeyedSubscript:", CFSTR("CalculateKeyFlexibleFractionDigits"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v2 = objc_msgSend(v1, "BOOLValue");
  else
    v2 = 1;

  return v2;
}

- (uint64_t)allowPartialExpressions
{
  void *v1;
  uint64_t v2;

  if (result)
  {
    objc_msgSend(*(id *)(result + 8), "objectForKeyedSubscript:", CFSTR("CalculateKeyAllowPartialExpressions"));
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    v2 = objc_msgSend(v1, "BOOLValue");

    return v2;
  }
  return result;
}

- (uint64_t)engine
{
  void *v1;
  uint64_t v2;

  if (!a1)
    return 0;
  objc_msgSend(*(id *)(a1 + 8), "objectForKeyedSubscript:", CFSTR("CalculateKeyEngine"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v2 = (int)objc_msgSend(v1, "intValue");
  else
    v2 = 0;

  return v2;
}

- (uint64_t)format
{
  void *v1;
  uint64_t v2;

  if (!a1)
    return 0;
  objc_msgSend(*(id *)(a1 + 8), "objectForKeyedSubscript:", CFSTR("CalculateKeyFormat"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v2 = (int)objc_msgSend(v1, "intValue");
  else
    v2 = 0;

  return v2;
}

uint64_t __34__CalculateKeys_expectedUnitTypes__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (uint64_t)assumeDegrees
{
  void *v1;
  uint64_t v2;

  if (!a1)
    return 0;
  objc_msgSend(*(id *)(a1 + 8), "objectForKeyedSubscript:", CFSTR("CalculateKeyAssumeDegrees"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v2 = objc_msgSend(v1, "BOOLValue");
  else
    v2 = 0;

  return v2;
}

- (id)variables
{
  void *v1;
  id v2;

  if (a1)
  {
    objc_msgSend(*(id *)(a1 + 8), "objectForKeyedSubscript:", CFSTR("CalculateKeyVariables"));
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v2 = v1;
    else
      v2 = 0;

  }
  else
  {
    v2 = 0;
  }
  return v2;
}

@end
