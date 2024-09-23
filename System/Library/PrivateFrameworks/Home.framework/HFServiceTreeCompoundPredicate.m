@implementation HFServiceTreeCompoundPredicate

- (HFServiceTreeCompoundPredicate)initWithRootServicePredicate:(id)a3 childServicePredicates:(id)a4
{
  id v7;
  id v8;
  HFServiceTreeCompoundPredicate *v9;
  HFServiceTreeCompoundPredicate *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HFServiceTreeCompoundPredicate;
  v9 = -[HFServiceTreeCompoundPredicate init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_rootServicePredicate, a3);
    objc_storeStrong((id *)&v10->_childServicePredicates, a4);
  }

  return v10;
}

- (id)matchingServicesForRootService:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  id v20;
  id obj;
  void *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HFServiceTreeCompoundPredicate rootServicePredicate](self, "rootServicePredicate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "matchingServicesForRootService:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "mutableCopy");

  if (objc_msgSend(v7, "count"))
  {
    v20 = v4;
    objc_msgSend(v4, "hf_childServices");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    -[HFServiceTreeCompoundPredicate childServicePredicates](self, "childServicePredicates");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v28;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v28 != v10)
            objc_enumerationMutation(obj);
          v12 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * v11);
          v23 = 0u;
          v24 = 0u;
          v25 = 0u;
          v26 = 0u;
          v13 = v22;
          v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
          if (v14)
          {
            v15 = v14;
            v16 = *(_QWORD *)v24;
            do
            {
              v17 = 0;
              do
              {
                if (*(_QWORD *)v24 != v16)
                  objc_enumerationMutation(v13);
                objc_msgSend(v12, "matchingServicesForRootService:", *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * v17));
                v18 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v7, "unionSet:", v18);

                ++v17;
              }
              while (v15 != v17);
              v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
            }
            while (v15);
          }

          ++v11;
        }
        while (v11 != v9);
        v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
      }
      while (v9);
    }

    v4 = v20;
  }

  return v7;
}

- (NSString)description
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0D519B8], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFServiceTreeCompoundPredicate rootServicePredicate](self, "rootServicePredicate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v3, "appendObject:withName:", v4, CFSTR("rootServicePredicate"));

  -[HFServiceTreeCompoundPredicate childServicePredicates](self, "childServicePredicates");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendArraySection:withName:skipIfEmpty:", v6, CFSTR("childServicePredicates"), 0);

  objc_msgSend(v3, "build");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
}

+ (NAIdentity)na_identity
{
  if (qword_1ED379EE0 != -1)
    dispatch_once(&qword_1ED379EE0, &__block_literal_global_105_1);
  return (NAIdentity *)(id)qword_1ED379EE8;
}

void __45__HFServiceTreeCompoundPredicate_na_identity__block_invoke_2()
{
  void *v0;
  id v1;
  id v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0D519C8], "builder");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = (id)objc_msgSend(v0, "appendCharacteristic:", &__block_literal_global_108_4);
  v2 = (id)objc_msgSend(v0, "appendCharacteristic:", &__block_literal_global_110_2);
  objc_msgSend(v0, "build");
  v3 = objc_claimAutoreleasedReturnValue();

  v4 = (void *)qword_1ED379EE8;
  qword_1ED379EE8 = v3;

}

uint64_t __45__HFServiceTreeCompoundPredicate_na_identity__block_invoke_4(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "rootServicePredicate");
}

uint64_t __45__HFServiceTreeCompoundPredicate_na_identity__block_invoke_5(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "childServicePredicates");
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

- (HFServiceTreeMatching)rootServicePredicate
{
  return self->_rootServicePredicate;
}

- (NSArray)childServicePredicates
{
  return self->_childServicePredicates;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_childServicePredicates, 0);
  objc_storeStrong((id *)&self->_rootServicePredicate, 0);
}

@end
