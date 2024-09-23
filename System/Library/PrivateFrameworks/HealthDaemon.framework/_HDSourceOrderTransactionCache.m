@implementation _HDSourceOrderTransactionCache

- (id)initWithProfile:(id *)a1
{
  id v4;
  id *v5;
  objc_super v7;

  v4 = a2;
  if (a1)
  {
    v7.receiver = a1;
    v7.super_class = (Class)_HDSourceOrderTransactionCache;
    v5 = (id *)objc_msgSendSuper2(&v7, sel_init);
    a1 = v5;
    if (v5)
      objc_storeStrong(v5 + 1, a2);
  }

  return a1;
}

- (id)orderedSourceIDsForBundleIdentifier:(void *)a3 database:(uint64_t)a4 error:
{
  id v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  if (a1)
  {
    v9 = *(void **)(a1 + 24);
    if (!v9)
    {
      v10 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      v11 = *(void **)(a1 + 24);
      *(_QWORD *)(a1 + 24) = v10;

      v9 = *(void **)(a1 + 24);
    }
    objc_msgSend(v9, "objectForKeyedSubscript:", v7);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v12)
    {
      v13 = v7;
      v14 = v8;
      HDSourceEntityPredicateForSourceWithBundleIdentifier((uint64_t)v13);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0D29888], "orderingTermWithProperty:entityClass:ascending:", CFSTR("uuid"), objc_opt_class(), 1);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v20[0] = v16;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 1);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      +[HDSourceEntity sourcesWithPredicate:orderingTerms:includeDeleted:database:error:](HDSourceEntity, "sourcesWithPredicate:orderingTerms:includeDeleted:database:error:", v15, v17, 0, v14, a4);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      if (v18)
      {
        objc_msgSend(v18, "hk_map:", &__block_literal_global_269);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v12 = 0;
      }

      if (v12)
        objc_msgSend(*(id *)(a1 + 24), "setObject:forKeyedSubscript:", v12, v13);
    }
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (_HDSourceOrderTransactionCache)init
{
  void *v3;
  void *v4;

  v3 = (void *)MEMORY[0x1E0C99DA0];
  NSStringFromSelector(a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "raise:format:", *MEMORY[0x1E0C99778], CFSTR("The -%@ method is not available on %@"), v4, objc_opt_class());

  return 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_orderedSourceIDsByBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_defaultOrderedSources, 0);
  objc_storeStrong((id *)&self->_profile, 0);
}

@end
