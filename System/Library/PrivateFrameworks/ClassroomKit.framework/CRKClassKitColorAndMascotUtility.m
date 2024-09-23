@implementation CRKClassKitColorAndMascotUtility

+ (unint64_t)mascotForClass:(id)a3
{
  id v4;
  CRKClassKitIconID *v5;
  void *v6;
  unint64_t v7;

  v4 = a3;
  v5 = -[CRKClassKitIconID initWithClass:]([CRKClassKitIconID alloc], "initWithClass:", v4);

  -[CRKClassKitIconID mascotIdentifier](v5, "mascotIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(a1, "mascotTypeForMascotIdentifier:", v6);
  return v7;
}

+ (BOOL)setMascot:(unint64_t)a3 forClass:(id)a4 error:(id *)a5
{
  id v8;
  void *v9;
  CRKClassKitIconID *v10;
  void *v11;

  v8 = a4;
  objc_msgSend(a1, "mascotIdentifierForMascotType:", a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v10 = -[CRKClassKitIconID initWithClass:]([CRKClassKitIconID alloc], "initWithClass:", v8);
    -[CRKClassKitIconID setMascotIdentifier:](v10, "setMascotIdentifier:", v9);
    -[CRKClassKitIconID stringValue](v10, "stringValue");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setIconID:", v11);

  }
  else if (a5)
  {
    CRKErrorWithCodeAndUserInfo(2, &unk_24DA07B98);
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v9 != 0;
}

+ (unint64_t)defaultMascot
{
  return 0;
}

+ (unint64_t)mascotTypeForMascotIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  unint64_t v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v4 = a3;
  if (v4)
  {
    objc_msgSend(a1, "mascotTypesByMascotIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      v7 = objc_msgSend(v6, "integerValue");
    }
    else
    {
      _CRKLogASM_10();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        +[CRKClassKitColorAndMascotUtility mascotTypeForMascotIdentifier:].cold.1((uint64_t)v4, v9, v10, v11, v12, v13, v14, v15);

      v7 = objc_msgSend(a1, "defaultMascot");
    }
    v8 = v7;

  }
  else
  {
    v8 = objc_msgSend(a1, "defaultMascot");
  }

  return v8;
}

+ (id)mascotIdentifierForMascotType:(unint64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(a1, "mascotTypesByMascotIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allKeysForObject:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "firstObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)mascotTypesByMascotIdentifier
{
  _QWORD v3[6];

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __65__CRKClassKitColorAndMascotUtility_mascotTypesByMascotIdentifier__block_invoke;
  v3[3] = &__block_descriptor_48_e5_v8__0l;
  v3[4] = a2;
  v3[5] = a1;
  if (mascotTypesByMascotIdentifier_onceToken != -1)
    dispatch_once(&mascotTypesByMascotIdentifier_onceToken, v3);
  return (id)mascotTypesByMascotIdentifier_mascotTypesByIconIdentifier;
}

void __65__CRKClassKitColorAndMascotUtility_mascotTypesByMascotIdentifier__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;

  v2 = (void *)mascotTypesByMascotIdentifier_mascotTypesByIconIdentifier;
  mascotTypesByMascotIdentifier_mascotTypesByIconIdentifier = (uint64_t)&unk_24DA07BC0;

  v3 = (void *)MEMORY[0x24BDBCF20];
  objc_msgSend(&unk_24DA07BC0, "allKeys");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setWithArray:", v4);
  v10 = (id)objc_claimAutoreleasedReturnValue();

  v5 = (void *)MEMORY[0x24BDBCF20];
  objc_msgSend(&unk_24DA07BC0, "allValues");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setWithArray:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v10, "count");
  if (v8 != objc_msgSend(v7, "count"))
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), CFSTR("CRKClassKitColorAndMascotUtility.m"), 85, CFSTR("Multiple icon identifiers map to the same mascot type"));

  }
}

+ (unint64_t)colorForClass:(id)a3
{
  id v4;
  CRKClassKitIconID *v5;
  void *v6;
  unint64_t v7;
  void *v8;

  v4 = a3;
  v5 = -[CRKClassKitIconID initWithClass:]([CRKClassKitIconID alloc], "initWithClass:", v4);
  -[CRKClassKitIconID colorIdentifier](v5, "colorIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = objc_msgSend(a1, "colorTypeForColorIdentifier:", v6);
  }
  else
  {
    objc_msgSend(v4, "className");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(a1, "classColorFromClassName:", v8);

  }
  return v7;
}

+ (BOOL)setColor:(unint64_t)a3 forClass:(id)a4 error:(id *)a5
{
  id v8;
  void *v9;
  CRKClassKitIconID *v10;
  void *v11;

  v8 = a4;
  objc_msgSend(a1, "colorIdentifierForColorType:", a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v10 = -[CRKClassKitIconID initWithClass:]([CRKClassKitIconID alloc], "initWithClass:", v8);
    -[CRKClassKitIconID setColorIdentifier:](v10, "setColorIdentifier:", v9);
    -[CRKClassKitIconID stringValue](v10, "stringValue");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setIconID:", v11);

  }
  else if (a5)
  {
    CRKErrorWithCodeAndUserInfo(2, &unk_24DA07BE8);
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v9 != 0;
}

+ (unint64_t)colorTypeForColorIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  unint64_t v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v4 = a3;
  objc_msgSend(a1, "colorTypesByColorIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = objc_msgSend(v6, "integerValue");
  }
  else
  {
    _CRKLogASM_10();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      +[CRKClassKitColorAndMascotUtility colorTypeForColorIdentifier:].cold.1((uint64_t)v4, v8, v9, v10, v11, v12, v13, v14);

    v7 = 4;
  }

  return v7;
}

+ (id)colorIdentifierForColorType:(unint64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(a1, "colorTypesByColorIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allKeysForObject:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "firstObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)colorTypesByColorIdentifier
{
  _QWORD v3[6];

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __63__CRKClassKitColorAndMascotUtility_colorTypesByColorIdentifier__block_invoke;
  v3[3] = &__block_descriptor_48_e5_v8__0l;
  v3[4] = a2;
  v3[5] = a1;
  if (colorTypesByColorIdentifier_onceToken != -1)
    dispatch_once(&colorTypesByColorIdentifier_onceToken, v3);
  return (id)colorTypesByColorIdentifier_colorTypesByColorIdentifier;
}

void __63__CRKClassKitColorAndMascotUtility_colorTypesByColorIdentifier__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;

  v2 = (void *)colorTypesByColorIdentifier_colorTypesByColorIdentifier;
  colorTypesByColorIdentifier_colorTypesByColorIdentifier = (uint64_t)&unk_24DA07C10;

  v3 = (void *)MEMORY[0x24BDBCF20];
  objc_msgSend(&unk_24DA07C10, "allKeys");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setWithArray:", v4);
  v10 = (id)objc_claimAutoreleasedReturnValue();

  v5 = (void *)MEMORY[0x24BDBCF20];
  objc_msgSend(&unk_24DA07C10, "allValues");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setWithArray:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v10, "count");
  if (v8 != objc_msgSend(v7, "count"))
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), CFSTR("CRKClassKitColorAndMascotUtility.m"), 149, CFSTR("Multiple color identifiers map to the same color type"));

  }
}

+ (unint64_t)classColorFromClassName:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  unint64_t v8;
  NSObject *v9;

  v4 = a3;
  objc_msgSend(a1, "classThemeColors");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4)
  {
    objc_msgSend(v5, "objectAtIndexedSubscript:", +[CRKASMHasher asmHashForString:maximumExclusive:](CRKASMHasher, "asmHashForString:maximumExclusive:", v4, objc_msgSend(v5, "count")));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "integerValue");

  }
  else
  {
    _CRKLogASM_10();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      +[CRKClassKitColorAndMascotUtility classColorFromClassName:].cold.1(v9);

    v8 = 8;
  }

  return v8;
}

+ (id)classThemeColors
{
  if (classThemeColors_onceToken != -1)
    dispatch_once(&classThemeColors_onceToken, &__block_literal_global_42);
  return (id)classThemeColors_classThemeColors;
}

void __52__CRKClassKitColorAndMascotUtility_classThemeColors__block_invoke()
{
  void *v0;

  v0 = (void *)classThemeColors_classThemeColors;
  classThemeColors_classThemeColors = (uint64_t)&unk_24DA08108;

}

+ (void)mascotTypeForMascotIdentifier:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_218C99000, a2, a3, "Unknown mascot identifier: %{public}@", a5, a6, a7, a8, 2u);
}

+ (void)colorTypeForColorIdentifier:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_218C99000, a2, a3, "Unknown color identifier: %{public}@", a5, a6, a7, a8, 2u);
}

+ (void)classColorFromClassName:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_218C99000, log, OS_LOG_TYPE_ERROR, "ERROR: Attempted to get class color before the class was named", v1, 2u);
}

@end
