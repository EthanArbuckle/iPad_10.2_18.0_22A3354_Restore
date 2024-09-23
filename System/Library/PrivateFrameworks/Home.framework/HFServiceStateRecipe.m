@implementation HFServiceStateRecipe

- (HFServiceStateRecipe)initWithPredicate:(id)a3 characteristicRecipes:(id)a4
{
  id v7;
  id v8;
  HFServiceStateRecipe *v9;
  HFServiceStateRecipe *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HFServiceStateRecipe;
  v9 = -[HFServiceStateRecipe init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_predicate, a3);
    objc_storeStrong((id *)&v10->_characteristicRecipes, a4);
  }

  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = objc_alloc((Class)objc_opt_class());
  -[HFServiceStateRecipe predicate](self, "predicate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFServiceStateRecipe characteristicRecipes](self, "characteristicRecipes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v4, "initWithPredicate:characteristicRecipes:", v5, v6);

  return v7;
}

- (id)matchResultForServices:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id obj;
  HFServiceStateRecipe *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  obj = v4;
  v23 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
  if (v23)
  {
    v21 = self;
    v22 = *(_QWORD *)v30;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v30 != v22)
          objc_enumerationMutation(obj);
        v7 = *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * v6);
        -[HFServiceStateRecipe predicate](self, "predicate");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "matchingServicesForRootService:", v7);
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v9, "count"))
        {
          v24 = v9;
          v27 = 0u;
          v28 = 0u;
          v25 = 0u;
          v26 = 0u;
          -[HFServiceStateRecipe characteristicRecipes](self, "characteristicRecipes");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
          if (v11)
          {
            v12 = v11;
            v13 = *(_QWORD *)v26;
            do
            {
              v14 = 0;
              do
              {
                if (*(_QWORD *)v26 != v13)
                  objc_enumerationMutation(v10);
                v15 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * v14);
                objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v7);
                v16 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v15, "matchResultForServices:", v16);
                v17 = (void *)objc_claimAutoreleasedReturnValue();

                objc_msgSend(v5, "addObject:", v17);
                ++v14;
              }
              while (v12 != v14);
              v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
            }
            while (v12);
          }

          self = v21;
          v9 = v24;
        }

        ++v6;
      }
      while (v6 != v23);
      v23 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
    }
    while (v23);
  }

  +[HFServiceStateCharacteristicMatchResult matchResultByMergingResults:](HFServiceStateCharacteristicMatchResult, "matchResultByMergingResults:", v5);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

- (NSString)description
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;

  objc_msgSend(MEMORY[0x1E0D519B8], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFServiceStateRecipe predicate](self, "predicate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v3, "appendObject:withName:", v4, CFSTR("predicate"));

  -[HFServiceStateRecipe characteristicRecipes](self, "characteristicRecipes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "allObjects");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendArraySection:withName:skipIfEmpty:", v7, CFSTR("characteristicRecipes"), 0);

  objc_msgSend(v3, "build");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v8;
}

+ (NAIdentity)na_identity
{
  if (qword_1ED379F10 != -1)
    dispatch_once(&qword_1ED379F10, &__block_literal_global_217);
  return (NAIdentity *)(id)qword_1ED379F18;
}

void __35__HFServiceStateRecipe_na_identity__block_invoke_2()
{
  void *v0;
  id v1;
  id v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0D519C8], "builder");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = (id)objc_msgSend(v0, "appendCharacteristic:", &__block_literal_global_220_2);
  v2 = (id)objc_msgSend(v0, "appendCharacteristic:", &__block_literal_global_222_1);
  objc_msgSend(v0, "build");
  v3 = objc_claimAutoreleasedReturnValue();

  v4 = (void *)qword_1ED379F18;
  qword_1ED379F18 = v3;

}

uint64_t __35__HFServiceStateRecipe_na_identity__block_invoke_4(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "predicate");
}

uint64_t __35__HFServiceStateRecipe_na_identity__block_invoke_5(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "characteristicRecipes");
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

- (unint64_t)hash
{
  void *v3;
  unint64_t v4;

  objc_msgSend((id)objc_opt_class(), "na_identity");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hashOfObject:", self);

  return v4;
}

- (HFServiceTreeMatching)predicate
{
  return self->_predicate;
}

- (NSSet)characteristicRecipes
{
  return self->_characteristicRecipes;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_characteristicRecipes, 0);
  objc_storeStrong((id *)&self->_predicate, 0);
}

@end
