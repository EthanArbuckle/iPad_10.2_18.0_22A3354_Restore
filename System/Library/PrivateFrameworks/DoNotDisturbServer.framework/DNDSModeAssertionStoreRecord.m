@implementation DNDSModeAssertionStoreRecord

+ (id)recordForDictionary:(id)a3 keys:(id *)a4
{
  id v5;
  DNDSModeAssertionStoreRecord *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v15[5];
  _QWORD v16[5];
  _QWORD v17[5];

  if (a3)
  {
    v5 = a3;
    v6 = objc_alloc_init(DNDSModeAssertionStoreRecord);
    objc_msgSend(v5, "bs_safeArrayForKey:", a4->var0.var0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = MEMORY[0x1E0C809B0];
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __69__DNDSModeAssertionStoreRecord_Dictionary__recordForDictionary_keys___block_invoke;
    v17[3] = &__block_descriptor_40_e33___DNDSModeAssertionRecord_16__0_8l;
    v17[4] = a4;
    objc_msgSend(v7, "bs_mapNoNulls:", v17);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    -[DNDSModeAssertionStoreRecord setAssertions:](v6, "setAssertions:", v9);
    objc_msgSend(v5, "bs_safeArrayForKey:", a4->var0.var1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = v8;
    v16[1] = 3221225472;
    v16[2] = __69__DNDSModeAssertionStoreRecord_Dictionary__recordForDictionary_keys___block_invoke_2;
    v16[3] = &__block_descriptor_40_e45___DNDSModeAssertionInvalidationRecord_16__0_8l;
    v16[4] = a4;
    objc_msgSend(v10, "bs_mapNoNulls:", v16);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    -[DNDSModeAssertionStoreRecord setInvalidations:](v6, "setInvalidations:", v11);
    objc_msgSend(v5, "bs_safeArrayForKey:", a4->var0.var2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v15[0] = v8;
    v15[1] = 3221225472;
    v15[2] = __69__DNDSModeAssertionStoreRecord_Dictionary__recordForDictionary_keys___block_invoke_3;
    v15[3] = &__block_descriptor_40_e52___DNDSModeAssertionInvalidationRequestRecord_16__0_8l;
    v15[4] = a4;
    objc_msgSend(v12, "bs_mapNoNulls:", v15);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    -[DNDSModeAssertionStoreRecord setInvalidationRequests:](v6, "setInvalidationRequests:", v13);
  }
  else
  {
    v6 = 0;
  }
  return v6;
}

id __69__DNDSModeAssertionStoreRecord_Dictionary__recordForDictionary_keys___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  id v5;
  void *v6;
  id v7;
  void *v8;

  v3 = a2;
  v4 = objc_opt_class();
  v5 = v3;
  if (v4)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v6 = v5;
    else
      v6 = 0;
  }
  else
  {
    v6 = 0;
  }
  v7 = v6;

  +[DNDSModeAssertionRecord recordForDictionary:keys:](DNDSModeAssertionRecord, "recordForDictionary:keys:", v7, *(_QWORD *)(a1 + 32));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

id __69__DNDSModeAssertionStoreRecord_Dictionary__recordForDictionary_keys___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  id v5;
  void *v6;
  id v7;
  void *v8;

  v3 = a2;
  v4 = objc_opt_class();
  v5 = v3;
  if (v4)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v6 = v5;
    else
      v6 = 0;
  }
  else
  {
    v6 = 0;
  }
  v7 = v6;

  +[DNDSModeAssertionInvalidationRecord recordForDictionary:keys:](DNDSModeAssertionInvalidationRecord, "recordForDictionary:keys:", v7, *(_QWORD *)(a1 + 32));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

id __69__DNDSModeAssertionStoreRecord_Dictionary__recordForDictionary_keys___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  id v5;
  void *v6;
  id v7;
  void *v8;

  v3 = a2;
  v4 = objc_opt_class();
  v5 = v3;
  if (v4)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v6 = v5;
    else
      v6 = 0;
  }
  else
  {
    v6 = 0;
  }
  v7 = v6;

  +[DNDSModeAssertionInvalidationRequestRecord recordForDictionary:keys:](DNDSModeAssertionInvalidationRequestRecord, "recordForDictionary:keys:", v7, *(_QWORD *)(a1 + 32));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)dictionaryWithKeys:(id *)a3 options:(unint64_t)a4
{
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v16[6];
  _QWORD v17[6];
  _QWORD v18[6];

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[DNDSModeAssertionStoreRecord assertions](self, "assertions");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x1E0C809B0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __71__DNDSModeAssertionStoreRecord_Dictionary__dictionaryWithKeys_options___block_invoke;
  v18[3] = &__block_descriptor_48_e47___NSDictionary_16__0__DNDSModeAssertionRecord_8l;
  v18[4] = a3;
  v18[5] = a4;
  objc_msgSend(v8, "bs_mapNoNulls:", v18);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "bs_setSafeObject:forKey:", v10, a3->var0.var0);
  -[DNDSModeAssertionStoreRecord invalidations](self, "invalidations");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v9;
  v17[1] = 3221225472;
  v17[2] = __71__DNDSModeAssertionStoreRecord_Dictionary__dictionaryWithKeys_options___block_invoke_2;
  v17[3] = &__block_descriptor_48_e59___NSDictionary_16__0__DNDSModeAssertionInvalidationRecord_8l;
  v17[4] = a3;
  v17[5] = a4;
  objc_msgSend(v11, "bs_mapNoNulls:", v17);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "bs_setSafeObject:forKey:", v12, a3->var0.var1);
  -[DNDSModeAssertionStoreRecord invalidationRequests](self, "invalidationRequests");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v9;
  v16[1] = 3221225472;
  v16[2] = __71__DNDSModeAssertionStoreRecord_Dictionary__dictionaryWithKeys_options___block_invoke_3;
  v16[3] = &__block_descriptor_48_e66___NSDictionary_16__0__DNDSModeAssertionInvalidationRequestRecord_8l;
  v16[4] = a3;
  v16[5] = a4;
  objc_msgSend(v13, "bs_mapNoNulls:", v16);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "bs_setSafeObject:forKey:", v14, a3->var0.var2);
  return v7;
}

uint64_t __71__DNDSModeAssertionStoreRecord_Dictionary__dictionaryWithKeys_options___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "dictionaryWithKeys:options:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

uint64_t __71__DNDSModeAssertionStoreRecord_Dictionary__dictionaryWithKeys_options___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "dictionaryWithKeys:options:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

uint64_t __71__DNDSModeAssertionStoreRecord_Dictionary__dictionaryWithKeys_options___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "dictionaryWithKeys:options:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

+ (id)recordForAssertionStore:(id)a3
{
  id v3;
  DNDSModeAssertionStoreRecord *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = a3;
  if (v3)
  {
    v4 = objc_alloc_init(DNDSModeAssertionStoreRecord);
    objc_msgSend(v3, "assertions");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "bs_mapNoNulls:", &__block_literal_global_26);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v6, "count"))
      -[DNDSModeAssertionStoreRecord setAssertions:](v4, "setAssertions:", v6);
    objc_msgSend(v3, "invalidations");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "bs_mapNoNulls:", &__block_literal_global_43);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v8, "count"))
      -[DNDSModeAssertionStoreRecord setInvalidations:](v4, "setInvalidations:", v8);
    objc_msgSend(v3, "invalidationRequests");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "bs_mapNoNulls:", &__block_literal_global_46);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v10, "count"))
      -[DNDSModeAssertionStoreRecord setInvalidationRequests:](v4, "setInvalidationRequests:", v10);

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

id __56__DNDSModeAssertionStoreRecord_recordForAssertionStore___block_invoke(uint64_t a1, uint64_t a2)
{
  return +[DNDSModeAssertionRecord recordForAssertion:](DNDSModeAssertionRecord, "recordForAssertion:", a2);
}

id __56__DNDSModeAssertionStoreRecord_recordForAssertionStore___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return +[DNDSModeAssertionInvalidationRecord recordForInvalidation:](DNDSModeAssertionInvalidationRecord, "recordForInvalidation:", a2);
}

id __56__DNDSModeAssertionStoreRecord_recordForAssertionStore___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return +[DNDSModeAssertionInvalidationRequestRecord recordForInvalidationRequest:](DNDSModeAssertionInvalidationRequestRecord, "recordForInvalidationRequest:", a2);
}

- (id)object
{
  DNDSMutableModeAssertionStore *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = objc_alloc_init(DNDSMutableModeAssertionStore);
  -[DNDSModeAssertionStoreRecord assertions](self, "assertions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "count"))
  {
    objc_msgSend(v4, "bs_mapNoNulls:", &__block_literal_global_50);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[DNDSMutableModeAssertionStore setAssertions:](v3, "setAssertions:", v5);

  }
  -[DNDSModeAssertionStoreRecord invalidations](self, "invalidations");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "count"))
  {
    objc_msgSend(v6, "bs_mapNoNulls:", &__block_literal_global_52);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[DNDSMutableModeAssertionStore setInvalidations:](v3, "setInvalidations:", v7);

  }
  -[DNDSModeAssertionStoreRecord invalidationRequests](self, "invalidationRequests");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "count"))
  {
    objc_msgSend(v8, "bs_mapNoNulls:", &__block_literal_global_54);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[DNDSMutableModeAssertionStore setInvalidationRequests:](v3, "setInvalidationRequests:", v9);

  }
  return v3;
}

uint64_t __38__DNDSModeAssertionStoreRecord_object__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "object");
}

uint64_t __38__DNDSModeAssertionStoreRecord_object__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "object");
}

uint64_t __38__DNDSModeAssertionStoreRecord_object__block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "object");
}

- (NSArray)assertions
{
  return self->_assertions;
}

- (void)setAssertions:(id)a3
{
  objc_storeStrong((id *)&self->_assertions, a3);
}

- (NSArray)invalidations
{
  return self->_invalidations;
}

- (void)setInvalidations:(id)a3
{
  objc_storeStrong((id *)&self->_invalidations, a3);
}

- (NSArray)invalidationRequests
{
  return self->_invalidationRequests;
}

- (void)setInvalidationRequests:(id)a3
{
  objc_storeStrong((id *)&self->_invalidationRequests, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_invalidationRequests, 0);
  objc_storeStrong((id *)&self->_invalidations, 0);
  objc_storeStrong((id *)&self->_assertions, 0);
}

@end
