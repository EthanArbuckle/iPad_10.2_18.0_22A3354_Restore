@implementation HFControlItemCharacteristicOptions

uint64_t __49__HFControlItemCharacteristicOptions_na_identity__block_invoke_4(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "characteristicTypesByUsage");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_characteristicTypesByUsage, 0);
}

void __49__HFControlItemCharacteristicOptions_na_identity__block_invoke_2()
{
  void *v0;
  id v1;
  uint64_t v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0D519C8], "builder");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = (id)objc_msgSend(v0, "appendCharacteristic:withRole:comparatorBlock:hashBlock:", &__block_literal_global_221, 3, 0, &__block_literal_global_222);
  objc_msgSend(v0, "build");
  v2 = objc_claimAutoreleasedReturnValue();

  v3 = (void *)qword_1ED378718;
  qword_1ED378718 = v2;

}

- (unint64_t)hash
{
  void *v3;
  unint64_t v4;

  objc_msgSend((id)objc_opt_class(), "na_identity");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hashOfObject:", self);

  return v4;
}

+ (NAIdentity)na_identity
{
  if (qword_1ED378710 != -1)
    dispatch_once(&qword_1ED378710, &__block_literal_global_218);
  return (NAIdentity *)(id)qword_1ED378718;
}

- (id)_optionsByReducingWithOptions:(id)a3 reducer:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  HFControlItemCharacteristicOptions *v16;
  uint64_t v18;
  uint64_t v19;
  void (*v20)(uint64_t, uint64_t, void *);
  void *v21;
  id v22;
  id v23;

  v6 = a3;
  v7 = a4;
  if (v6
    && (objc_msgSend(v6, "characteristicTypesByUsage"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        v9 = objc_msgSend(v8, "count"),
        v8,
        v9))
  {
    -[HFControlItemCharacteristicOptions characteristicTypesByUsage](self, "characteristicTypesByUsage");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "na_dictionaryByMappingValues:", &__block_literal_global_206);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(v11, "mutableCopy");

    objc_msgSend(v6, "characteristicTypesByUsage");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = MEMORY[0x1E0C809B0];
    v19 = 3221225472;
    v20 = __76__HFControlItemCharacteristicOptions__optionsByReducingWithOptions_reducer___block_invoke_2;
    v21 = &unk_1EA72DDD8;
    v22 = v12;
    v23 = v7;
    v14 = v12;
    objc_msgSend(v13, "enumerateKeysAndObjectsUsingBlock:", &v18);

    v15 = objc_alloc((Class)objc_opt_class());
    v16 = (HFControlItemCharacteristicOptions *)objc_msgSend(v15, "initWithCharacteristicTypesByUsage:", v14, v18, v19, v20, v21);

  }
  else
  {
    v16 = self;
  }

  return v16;
}

- (id)_characteristicTypesForUsagesPassingTest:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  _QWORD v10[4];
  id v11;

  v4 = a3;
  -[HFControlItemCharacteristicOptions characteristicTypesByUsage](self, "characteristicTypesByUsage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __79__HFControlItemCharacteristicOptions__characteristicTypesForUsagesPassingTest___block_invoke;
  v10[3] = &unk_1EA72DCF0;
  v11 = v4;
  v7 = v4;
  objc_msgSend(v5, "na_reduceWithInitialValue:reducer:", v6, v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (NSDictionary)characteristicTypesByUsage
{
  return self->_characteristicTypesByUsage;
}

uint64_t __49__HFControlItemCharacteristicOptions_na_identity__block_invoke_5(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;

  v2 = a2;
  v3 = objc_opt_class();
  v4 = v2;
  if (!v4)
    goto LABEL_7;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v4;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "id  _Nullable NAAssertCast(Class  _Nonnull __unsafe_unretained, id  _Nonnull __strong)");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, CFSTR("NSObject+NAAdditions.h"), 54, CFSTR("Expected class of %@ but was %@"), v3, objc_opt_class());

LABEL_7:
    v6 = 0;
  }

  v9 = objc_msgSend(v6, "computeHashFromContents");
  return v9;
}

- (NSSet)allRequiredCharacteristicTypes
{
  return (NSSet *)-[HFControlItemCharacteristicOptions _characteristicTypesForUsagesPassingTest:](self, "_characteristicTypesForUsagesPassingTest:", &__block_literal_global_199);
}

- (NSSet)allCharacteristicTypes
{
  return (NSSet *)-[HFControlItemCharacteristicOptions _characteristicTypesForUsagesPassingTest:](self, "_characteristicTypesForUsagesPassingTest:", &__block_literal_global_198_0);
}

id __79__HFControlItemCharacteristicOptions__characteristicTypesForUsagesPassingTest___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;

  v7 = a3;
  v8 = a4;
  if ((*(unsigned int (**)(_QWORD, uint64_t))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), objc_msgSend(a2, "unsignedIntegerValue")))
  {
    objc_msgSend(v8, "unionSet:", v7);
  }

  return v8;
}

uint64_t __60__HFControlItemCharacteristicOptions_allCharacteristicTypes__block_invoke()
{
  return 1;
}

BOOL __68__HFControlItemCharacteristicOptions_allRequiredCharacteristicTypes__block_invoke(uint64_t a1, uint64_t a2)
{
  return a2 != 2;
}

uint64_t __76__HFControlItemCharacteristicOptions__optionsByReducingWithOptions_reducer___block_invoke_3()
{
  return objc_msgSend(MEMORY[0x1E0C99E20], "set");
}

id __76__HFControlItemCharacteristicOptions__optionsByReducingWithOptions_reducer___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return (id)objc_msgSend(a3, "mutableCopy");
}

+ (HFControlItemCharacteristicOptions)optionsWithReadWriteCharacteristicTypes:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_alloc((Class)a1);
  v9 = &unk_1EA7CBE60;
  v10[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)objc_msgSend(v5, "initWithCharacteristicTypesByUsage:", v6);
  return (HFControlItemCharacteristicOptions *)v7;
}

- (HFControlItemCharacteristicOptions)init
{
  return -[HFControlItemCharacteristicOptions initWithCharacteristicTypesByUsage:](self, "initWithCharacteristicTypesByUsage:", MEMORY[0x1E0C9AA70]);
}

- (id)optionsByAddingCharacteristicTypes:(id)a3 forUsage:(unint64_t)a4
{
  id v6;
  HFControlItemCharacteristicOptions *v7;
  void *v8;
  void *v9;
  HFControlItemCharacteristicOptions *v10;
  void *v11;
  void *v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = [HFControlItemCharacteristicOptions alloc];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v8;
  v14[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, &v13, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = -[HFControlItemCharacteristicOptions initWithCharacteristicTypesByUsage:](v7, "initWithCharacteristicTypesByUsage:", v9);
  -[HFControlItemCharacteristicOptions optionsByAddingCharacteristicOptions:](self, "optionsByAddingCharacteristicOptions:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (HFControlItemCharacteristicOptions)initWithCharacteristicTypesByUsage:(id)a3
{
  id v4;
  HFControlItemCharacteristicOptions *v5;
  uint64_t v6;
  NSDictionary *characteristicTypesByUsage;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HFControlItemCharacteristicOptions;
  v5 = -[HFControlItemCharacteristicOptions init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    characteristicTypesByUsage = v5->_characteristicTypesByUsage;
    v5->_characteristicTypesByUsage = (NSDictionary *)v6;

  }
  return v5;
}

- (id)optionsByAddingCharacteristicOptions:(id)a3
{
  return -[HFControlItemCharacteristicOptions _optionsByReducingWithOptions:reducer:](self, "_optionsByReducingWithOptions:reducer:", a3, &__block_literal_global_203);
}

void __76__HFControlItemCharacteristicOptions__optionsByReducingWithOptions_reducer___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4;
  void *v5;
  id v6;
  id v7;

  v5 = *(void **)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v6 = a3;
  objc_msgSend(v5, "na_objectForKey:withDefaultValue:", a2, &__block_literal_global_208);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, id))(v4 + 16))(v4, v7, v6);

}

uint64_t __75__HFControlItemCharacteristicOptions_optionsByAddingCharacteristicOptions___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "unionSet:");
}

- (id)objectForKeyedSubscript:(id)a3
{
  return -[HFControlItemCharacteristicOptions characteristicTypesForUsage:](self, "characteristicTypesForUsage:", objc_msgSend(a3, "unsignedIntegerValue"));
}

- (id)characteristicTypesForUsage:(unint64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;

  -[HFControlItemCharacteristicOptions characteristicTypesByUsage](self, "characteristicTypesByUsage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    v8 = v6;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  v9 = v8;

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  objc_msgSend((id)objc_opt_class(), "na_identity");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = objc_msgSend(v5, "isObject:equalToObject:", self, v4);

  return (char)self;
}

- (NSString)description
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t);
  void *v11;
  HFControlItemCharacteristicOptions *v12;
  id v13;

  objc_msgSend(MEMORY[0x1E0D519B8], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "activeMultilinePrefix");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x1E0C809B0];
  v9 = 3221225472;
  v10 = __49__HFControlItemCharacteristicOptions_description__block_invoke;
  v11 = &unk_1EA727188;
  v12 = self;
  v13 = v3;
  v5 = v3;
  objc_msgSend(v5, "appendBodySectionWithName:multilinePrefix:block:", CFSTR("characteristicsByUsage"), v4, &v8);

  objc_msgSend(v5, "build", v8, v9, v10, v11, v12);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

id __49__HFControlItemCharacteristicOptions_description__block_invoke_3(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;

  v2 = (void *)MEMORY[0x1E0CB3940];
  v3 = (void *)MEMORY[0x1E0CBA458];
  v4 = a2;
  objc_msgSend(v3, "localizedDescriptionForCharacteristicType:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("%@ (%@)"), v5, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

void __49__HFControlItemCharacteristicOptions_description__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  id v5;
  void *v6;
  unint64_t v7;
  const __CFString *v8;
  id v9;

  v4 = *(void **)(a1 + 32);
  v5 = a2;
  objc_msgSend(a3, "allObjects");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "na_map:", &__block_literal_global_213);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "unsignedIntegerValue");

  if (v7 > 2)
    v8 = CFSTR("(unknown)");
  else
    v8 = off_1EA72DEC0[v7];
  objc_msgSend(v4, "appendArraySection:withName:skipIfEmpty:", v6, v8, 1);

}

void __49__HFControlItemCharacteristicOptions_description__block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD v3[4];
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "characteristicTypesByUsage");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __49__HFControlItemCharacteristicOptions_description__block_invoke_2;
  v3[3] = &unk_1EA72DE20;
  v4 = *(id *)(a1 + 40);
  objc_msgSend(v2, "enumerateKeysAndObjectsUsingBlock:", v3);

}

- (id)optionsByIntersectingWithOptions:(id)a3
{
  return -[HFControlItemCharacteristicOptions _optionsByReducingWithOptions:reducer:](self, "_optionsByReducingWithOptions:reducer:", a3, &__block_literal_global_204);
}

uint64_t __71__HFControlItemCharacteristicOptions_optionsByIntersectingWithOptions___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "intersectSet:");
}

@end
