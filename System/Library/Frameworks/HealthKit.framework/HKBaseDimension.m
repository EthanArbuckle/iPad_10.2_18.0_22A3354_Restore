@implementation HKBaseDimension

void __33___HKBaseDimension_nullDimension__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  _QWORD *v4;

  v4 = a2;
  +[HKUnit countUnit](HKBaseUnit, "countUnit");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setReducibleBaseUnit:", v2);

  +[HKUnit _nullUnit](HKUnit, "_nullUnit");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setReducedUnit:", v3);

  v4[6] = 0x3FF0000000000000;
}

void __60___HKBaseDimension__uniquedDimensionWithName_configuration___block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v1 = (void *)_uniquedDimensionWithName_configuration____dimensionsByName;
  _uniquedDimensionWithName_configuration____dimensionsByName = (uint64_t)v0;

}

void __53___HKBaseDimension__uniquedDefinedDimensionWithName___block_invoke(uint64_t a1, void *a2)
{
  const char *v3;
  uint64_t v4;
  char **v5;
  char *v6;
  char *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD *v12;

  v12 = a2;
  v3 = (const char *)objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 32)), "UTF8String");
  v4 = 0;
  while (strcmp((&__DimensionDefinitions)[v4], v3))
  {
    v4 += 4;
    if (v4 == 84)
      goto LABEL_7;
  }
  v5 = &(&__DimensionDefinitions)[v4];
  if ((&__DimensionDefinitions)[v4 + 1])
  {
    v6 = v5[3];
    v7 = v5[2];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[HKBaseUnit unitFromString:](HKBaseUnit, "unitFromString:", v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setReducibleBaseUnit:", v10);

    +[HKUnit unitFromString:](HKUnit, "unitFromString:", v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setReducedUnit:", v11);

    v12[6] = v6;
  }
LABEL_7:

}

@end
