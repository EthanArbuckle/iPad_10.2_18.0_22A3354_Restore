@implementation HFConditionCollection

+ (id)conditionCollectionForPredicate:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  void *v13;
  void *v14;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99E60], "set");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_singleConditionForPredicate:knownConditionsOnly:", v4, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v6);
    v7 = objc_claimAutoreleasedReturnValue();

    v5 = (void *)v7;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v4, "compoundPredicateType") == 1)
    {
      objc_msgSend(a1, "_flattenedSubpredicatesForAndPredicate:", v4);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = (void *)MEMORY[0x1E0C99E60];
      objc_msgSend(a1, "_findBestMatchingConditionsForPredicates:", v8);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setWithArray:", v10);
      v11 = objc_claimAutoreleasedReturnValue();

      v5 = (void *)v11;
    }
  }
  v12 = objc_alloc((Class)objc_opt_class());
  objc_msgSend(v5, "allObjects");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v12, "initWithConditions:", v13);

  return v14;
}

+ (id)_flattenedSubpredicatesForAndPredicate:(id)a3
{
  void *v4;
  void *v5;
  _QWORD v7[5];

  objc_msgSend(a3, "subpredicates");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __64__HFConditionCollection__flattenedSubpredicatesForAndPredicate___block_invoke;
  v7[3] = &__block_descriptor_40_e30___NSArray_16__0__NSPredicate_8l;
  v7[4] = a1;
  objc_msgSend(v4, "na_flatMap:", v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id __64__HFConditionCollection__flattenedSubpredicatesForAndPredicate___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *v8;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_opt_class();
  v4 = v3;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;

  if (v6 && objc_msgSend(v6, "compoundPredicateType") == 1)
  {
    objc_msgSend(*(id *)(a1 + 32), "_flattenedSubpredicatesForAndPredicate:", v6);
    v7 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10[0] = v4;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1);
    v7 = objc_claimAutoreleasedReturnValue();
  }
  v8 = (void *)v7;

  return v8;
}

+ (id)_findBestMatchingConditionsForPredicates:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = (void *)objc_msgSend(a3, "mutableCopy");
  v5 = (void *)objc_opt_new();
  while (objc_msgSend(v4, "count"))
  {
    objc_msgSend(a1, "_findBestConditionMatchForPredicates:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "matchedCondition");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v7);

    objc_msgSend(v6, "matchedPredicates");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeObjectsInArray:", v8);

  }
  return v5;
}

+ (id)_findBestConditionMatchForPredicates:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  void *v7;
  id v8;
  _QWORD v10[4];
  id v11;
  uint64_t *v12;
  id v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;
  _QWORD v20[4];
  id v21;
  id v22;

  v4 = a3;
  v5 = MEMORY[0x1E0C809B0];
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __62__HFConditionCollection__findBestConditionMatchForPredicates___block_invoke;
  v20[3] = &unk_1EA727948;
  v6 = v4;
  v21 = v6;
  v22 = a1;
  __62__HFConditionCollection__findBestConditionMatchForPredicates___block_invoke((uint64_t)v20);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    +[_HFCompoundConditionMatch matchWithCondition:matchedPredicates:](_HFCompoundConditionMatch, "matchWithCondition:matchedPredicates:", v7, v6);
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v14 = 0;
    v15 = &v14;
    v16 = 0x3032000000;
    v17 = __Block_byref_object_copy__1;
    v18 = __Block_byref_object_dispose__1;
    v19 = 0;
    v10[0] = v5;
    v10[1] = 3221225472;
    v10[2] = __62__HFConditionCollection__findBestConditionMatchForPredicates___block_invoke_24;
    v10[3] = &unk_1EA727970;
    v12 = &v14;
    v13 = a1;
    v11 = v6;
    objc_msgSend(v11, "enumerateObjectsWithOptions:usingBlock:", 2, v10);
    v8 = (id)v15[5];

    _Block_object_dispose(&v14, 8);
  }

  return v8;
}

id __62__HFConditionCollection__findBestConditionMatchForPredicates___block_invoke(uint64_t a1)
{
  _BOOL8 v2;
  void *v3;
  void *v4;
  void *v5;
  _BOOL8 v6;
  uint64_t v7;
  void *v8;

  if ((unint64_t)objc_msgSend(*(id *)(a1 + 32), "count") < 2)
  {
    v7 = objc_opt_class();
    objc_msgSend(*(id *)(a1 + 32), "firstObject");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (void *)v7;
    v5 = v3;
    v6 = 0;
  }
  else
  {
    v2 = (unint64_t)objc_msgSend(*(id *)(a1 + 32), "count") < 8;
    v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3528]), "initWithType:subpredicates:", 1, *(_QWORD *)(a1 + 32));
    v4 = (void *)objc_opt_class();
    v5 = v3;
    v6 = v2;
  }
  objc_msgSend(v4, "_singleConditionForPredicate:knownConditionsOnly:", v5, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

void __62__HFConditionCollection__findBestConditionMatchForPredicates___block_invoke_24(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  unint64_t v9;
  void *v10;
  unint64_t v11;
  id v12;

  v12 = (id)objc_msgSend(*(id *)(a1 + 32), "mutableCopy");
  objc_msgSend(v12, "removeObjectAtIndex:", a3);
  objc_msgSend(*(id *)(a1 + 48), "_findBestConditionMatchForPredicates:", v12);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  if (!*(_QWORD *)(v7 + 40))
    goto LABEL_4;
  objc_msgSend(v5, "matchedPredicates");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count");
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "matchedPredicates");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "count");

  if (v9 > v11)
  {
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
LABEL_4:
    objc_storeStrong((id *)(v7 + 40), v6);
  }

}

+ (id)_singleConditionForPredicate:(id)a3 knownConditionsOnly:(BOOL)a4
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  id v11;
  uint64_t v12;
  HFUnknownCondition *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (_MergedGlobals_214 != -1)
    dispatch_once(&_MergedGlobals_214, &__block_literal_global_28_1);
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v6 = (id)qword_1ED378C50;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v16;
    while (2)
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v6);
        v11 = objc_alloc(*(Class *)(*((_QWORD *)&v15 + 1) + 8 * i));
        v12 = objc_msgSend(v11, "initWithPredicate:", v5, (_QWORD)v15);
        if (v12)
        {
          v13 = (HFUnknownCondition *)v12;

          goto LABEL_15;
        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v8)
        continue;
      break;
    }
  }

  if (a4)
    v13 = 0;
  else
    v13 = -[HFCondition initWithPredicate:]([HFUnknownCondition alloc], "initWithPredicate:", v5);
LABEL_15:

  return v13;
}

void __74__HFConditionCollection__singleConditionForPredicate_knownConditionsOnly___block_invoke_2()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[8];

  v2[7] = *MEMORY[0x1E0C80C00];
  v2[0] = objc_opt_class();
  v2[1] = objc_opt_class();
  v2[2] = objc_opt_class();
  v2[3] = objc_opt_class();
  v2[4] = objc_opt_class();
  v2[5] = objc_opt_class();
  v2[6] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v2, 7);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)qword_1ED378C50;
  qword_1ED378C50 = v0;

}

- (HFConditionCollection)init
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_initWithConditions_);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HFConditionCollection.m"), 184, CFSTR("%s is unavailable; use %@ instead"),
    "-[HFConditionCollection init]",
    v5);

  return 0;
}

- (HFConditionCollection)initWithConditions:(id)a3
{
  id v5;
  HFConditionCollection *v6;
  HFConditionCollection *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HFConditionCollection;
  v6 = -[HFConditionCollection init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_conditions, a3);

  return v7;
}

- (void)addCondition:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[HFConditionCollection conditions](self, "conditions");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "arrayByAddingObject:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[HFConditionCollection setConditions:](self, "setConditions:", v5);
}

- (void)removeCondition:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[HFConditionCollection conditions](self, "conditions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v5, "mutableCopy");

  objc_msgSend(v7, "removeObject:", v4);
  v6 = (void *)objc_msgSend(v7, "copy");
  -[HFConditionCollection setConditions:](self, "setConditions:", v6);

}

- (NSPredicate)predicate
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  _QWORD v7[4];
  id v8;

  -[HFConditionCollection conditions](self, "conditions");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "na_map:", &__block_literal_global_44);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __34__HFConditionCollection_predicate__block_invoke_2;
  v7[3] = &unk_1EA7279F8;
  v8 = v3;
  v4 = v3;
  __34__HFConditionCollection_predicate__block_invoke_2((uint64_t)v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSPredicate *)v5;
}

uint64_t __34__HFConditionCollection_predicate__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "predicate");
}

id __34__HFConditionCollection_predicate__block_invoke_2(uint64_t a1)
{
  void *v2;

  if ((unint64_t)objc_msgSend(*(id *)(a1 + 32), "count") < 2)
  {
    if (objc_msgSend(*(id *)(a1 + 32), "count") == 1)
    {
      objc_msgSend(*(id *)(a1 + 32), "firstObject");
      v2 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v2 = 0;
    }
  }
  else
  {
    v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3528]), "initWithType:subpredicates:", 1, *(_QWORD *)(a1 + 32));
  }
  return v2;
}

- (NSArray)conditions
{
  return self->_conditions;
}

- (void)setConditions:(id)a3
{
  objc_storeStrong((id *)&self->_conditions, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_conditions, 0);
}

@end
