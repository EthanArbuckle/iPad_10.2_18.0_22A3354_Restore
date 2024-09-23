@implementation HFServiceStateCharacteristicRecipe

- (HFServiceStateCharacteristicRecipe)initWithCharacteristicType:(id)a3 servicePredicate:(id)a4 required:(BOOL)a5
{
  id v9;
  id v10;
  HFServiceStateCharacteristicRecipe *v11;
  HFServiceStateCharacteristicRecipe *v12;
  objc_super v14;

  v9 = a3;
  v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)HFServiceStateCharacteristicRecipe;
  v11 = -[HFServiceStateCharacteristicRecipe init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_characteristicType, a3);
    objc_storeStrong((id *)&v12->_servicePredicate, a4);
    v12->_required = a5;
  }

  return v12;
}

- (id)matchResultForServices:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  HFServiceStateCharacteristicMatchResult *v20;
  id obj;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_opt_new();
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  obj = v4;
  v25 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
  if (v25)
  {
    v24 = *(_QWORD *)v33;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v33 != v24)
          objc_enumerationMutation(obj);
        v7 = *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * v6);
        -[HFServiceStateCharacteristicRecipe servicePredicate](self, "servicePredicate");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "matchingServicesForRootService:", v7);
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v9, "count"))
        {
          v27 = v6;
          objc_msgSend(v23, "unionSet:", v9);
          v30 = 0u;
          v31 = 0u;
          v28 = 0u;
          v29 = 0u;
          v26 = v9;
          v10 = v9;
          v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
          if (v11)
          {
            v12 = v11;
            v13 = *(_QWORD *)v29;
            do
            {
              v14 = 0;
              do
              {
                if (*(_QWORD *)v29 != v13)
                  objc_enumerationMutation(v10);
                v15 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * v14);
                -[HFServiceStateCharacteristicRecipe characteristicType](self, "characteristicType");
                v16 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v15, "hf_characteristicOfType:", v16);
                v17 = (void *)objc_claimAutoreleasedReturnValue();

                if (v17)
                {
                  objc_msgSend(v15, "uniqueIdentifier");
                  v18 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v5, "na_objectForKey:withDefaultValue:", v18, &__block_literal_global_172_3);
                  v19 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v19, "addObject:", v17);

                }
                ++v14;
              }
              while (v12 != v14);
              v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
            }
            while (v12);
          }

          v9 = v26;
          v6 = v27;
        }

        ++v6;
      }
      while (v6 != v25);
      v25 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
    }
    while (v25);
  }

  v20 = -[HFServiceStateCharacteristicMatchResult initWithServices:characteristicsByServiceUUID:]([HFServiceStateCharacteristicMatchResult alloc], "initWithServices:characteristicsByServiceUUID:", v23, v5);
  return v20;
}

- (NSString)characteristicType
{
  return self->_characteristicType;
}

- (HFServiceTreeMatching)servicePredicate
{
  return self->_servicePredicate;
}

uint64_t __61__HFServiceStateCharacteristicRecipe_matchResultForServices___block_invoke()
{
  return objc_msgSend(MEMORY[0x1E0C99E20], "set");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_servicePredicate, 0);
  objc_storeStrong((id *)&self->_characteristicType, 0);
}

+ (id)recipeForRootServiceCharacteristicType:(id)a3 required:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  id v7;
  void *v8;
  void *v9;

  v4 = a4;
  v6 = a3;
  v7 = objc_alloc((Class)a1);
  +[HFServiceTreeTypePredicate anyServiceTypePredicate](HFServiceTreeTypePredicate, "anyServiceTypePredicate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v7, "initWithCharacteristicType:servicePredicate:required:", v6, v8, v4);

  return v9;
}

+ (id)recipesForRootServiceCharacteristicTypes:(id)a3 required:(BOOL)a4
{
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[5];
  BOOL v9;

  v4 = (void *)MEMORY[0x1E0C99E60];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __88__HFServiceStateCharacteristicRecipe_recipesForRootServiceCharacteristicTypes_required___block_invoke;
  v8[3] = &__block_descriptor_41_e54___HFServiceStateCharacteristicRecipe_16__0__NSString_8l;
  v8[4] = a1;
  v9 = a4;
  objc_msgSend(a3, "na_map:", v8);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setWithArray:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

uint64_t __88__HFServiceStateCharacteristicRecipe_recipesForRootServiceCharacteristicTypes_required___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "recipeForRootServiceCharacteristicType:required:", a2, *(unsigned __int8 *)(a1 + 40));
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = objc_alloc((Class)objc_opt_class());
  -[HFServiceStateCharacteristicRecipe characteristicType](self, "characteristicType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFServiceStateCharacteristicRecipe servicePredicate](self, "servicePredicate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v4, "initWithCharacteristicType:servicePredicate:required:", v5, v6, -[HFServiceStateCharacteristicRecipe isRequired](self, "isRequired"));

  return v7;
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  void *v10;

  objc_msgSend(MEMORY[0x1E0D519B8], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0CBA458];
  -[HFServiceStateCharacteristicRecipe characteristicType](self, "characteristicType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedDescriptionForCharacteristicType:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:withName:", v6, CFSTR("characteristicType"));

  -[HFServiceStateCharacteristicRecipe servicePredicate](self, "servicePredicate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (id)objc_msgSend(v3, "appendObject:withName:", v7, CFSTR("servicePredicate"));

  v9 = (id)objc_msgSend(v3, "appendBool:withName:", -[HFServiceStateCharacteristicRecipe isRequired](self, "isRequired"), CFSTR("required"));
  objc_msgSend(v3, "build");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v10;
}

+ (NAIdentity)na_identity
{
  if (qword_1ED379F00 != -1)
    dispatch_once(&qword_1ED379F00, &__block_literal_global_181_1);
  return (NAIdentity *)(id)qword_1ED379F08;
}

void __49__HFServiceStateCharacteristicRecipe_na_identity__block_invoke_2()
{
  void *v0;
  id v1;
  id v2;
  id v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0D519C8], "builder");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = (id)objc_msgSend(v0, "appendCharacteristic:", &__block_literal_global_184_0);
  v2 = (id)objc_msgSend(v0, "appendCharacteristic:", &__block_literal_global_186_1);
  v3 = (id)objc_msgSend(v0, "appendCharacteristic:", &__block_literal_global_188_1);
  objc_msgSend(v0, "build");
  v4 = objc_claimAutoreleasedReturnValue();

  v5 = (void *)qword_1ED379F08;
  qword_1ED379F08 = v4;

}

uint64_t __49__HFServiceStateCharacteristicRecipe_na_identity__block_invoke_4(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "characteristicType");
}

uint64_t __49__HFServiceStateCharacteristicRecipe_na_identity__block_invoke_5(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "servicePredicate");
}

uint64_t __49__HFServiceStateCharacteristicRecipe_na_identity__block_invoke_6(uint64_t a1, void *a2)
{
  return objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(a2, "isRequired"));
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

- (BOOL)isRequired
{
  return self->_required;
}

@end
