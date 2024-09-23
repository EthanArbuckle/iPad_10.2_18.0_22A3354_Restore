@implementation CNUIColorSerialization

+ (id)colorsFromDictionaries:(id)a3
{
  _QWORD v4[5];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __49__CNUIColorSerialization_colorsFromDictionaries___block_invoke;
  v4[3] = &__block_descriptor_40_e31___UIColor_16__0__NSDictionary_8l;
  v4[4] = a1;
  objc_msgSend(a3, "_cn_compactMap:", v4);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)colorFromDictionary:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v8;

  v3 = a3;
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("type"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    if (objc_msgSend(v4, "integerValue"))
    {
      objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], CFSTR("unsupported color type"), 0);
      v8 = (id)objc_claimAutoreleasedReturnValue();
      objc_exception_throw(v8);
    }
    +[_CNUIComponentBasedColorSerialization colorFromDictionary:](_CNUIComponentBasedColorSerialization, "colorFromDictionary:", v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

uint64_t __49__CNUIColorSerialization_colorsFromDictionaries___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "colorFromDictionary:", a2);
}

+ (id)stringForColors:(id)a3
{
  uint64_t v3;
  void *v4;
  void *v5;

  v3 = *MEMORY[0x1E0D13858];
  objc_msgSend(a1, "dictionariesForColors:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *))(v3 + 16))(v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)colorsFromString:(id)a3
{
  void *v4;
  void *v5;

  (*(void (**)(void))(*MEMORY[0x1E0D13888] + 16))();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "colorsFromDictionaries:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)dictionariesForColors:(id)a3
{
  _QWORD v4[5];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __48__CNUIColorSerialization_dictionariesForColors___block_invoke;
  v4[3] = &__block_descriptor_40_e31___NSDictionary_16__0__UIColor_8l;
  v4[4] = a1;
  objc_msgSend(a3, "_cn_map:", v4);
  return (id)objc_claimAutoreleasedReturnValue();
}

uint64_t __48__CNUIColorSerialization_dictionariesForColors___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "dictionaryForColor:", a2);
}

+ (id)stringForColor:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(a1, "dictionaryForColor:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*MEMORY[0x1E0D13858] + 16))();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)colorFromString:(id)a3
{
  void *v4;
  void *v5;

  (*(void (**)(void))(*MEMORY[0x1E0D13888] + 16))();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "colorFromDictionary:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)dataForColor:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(a1, "dictionaryForColor:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D13B28], "dataWithObject:error:", v3, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)colorFromData:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0D13B28], "objectWithData:error:", a3, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(a1, "colorFromDictionary:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

+ (id)dictionaryForColor:(id)a3
{
  return +[_CNUIComponentBasedColorSerialization dictionaryForColor:](_CNUIComponentBasedColorSerialization, "dictionaryForColor:", a3);
}

@end
