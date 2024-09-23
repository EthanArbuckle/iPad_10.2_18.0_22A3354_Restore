@implementation HFMultipleTransformItemProvider

- (HFMultipleTransformItemProvider)initWithSourceProvider:(id)a3
{
  id v5;
  HFMultipleTransformItemProvider *v6;
  uint64_t v7;
  NSMutableDictionary *transformedItems;
  uint64_t v9;
  NSMutableSet *allItems;
  objc_super v12;

  v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)HFMultipleTransformItemProvider;
  v6 = -[HFItemProvider init](&v12, sel_init);
  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v7 = objc_claimAutoreleasedReturnValue();
    transformedItems = v6->_transformedItems;
    v6->_transformedItems = (NSMutableDictionary *)v7;

    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v9 = objc_claimAutoreleasedReturnValue();
    allItems = v6->_allItems;
    v6->_allItems = (NSMutableSet *)v9;

    objc_storeStrong((id *)&v6->_sourceProvider, a3);
  }

  return v6;
}

- (HFMultipleTransformItemProvider)initWithSourceProvider:(id)a3 multipleTransformationBlock:(id)a4
{
  id v6;
  HFMultipleTransformItemProvider *v7;
  void *v8;
  id transformationBlock;

  v6 = a4;
  v7 = -[HFMultipleTransformItemProvider initWithSourceProvider:](self, "initWithSourceProvider:", a3);
  if (v7)
  {
    v8 = _Block_copy(v6);
    transformationBlock = v7->_transformationBlock;
    v7->_transformationBlock = v8;

  }
  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = objc_alloc((Class)objc_opt_class());
  -[HFMultipleTransformItemProvider sourceProvider](self, "sourceProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFMultipleTransformItemProvider transformationBlock](self, "transformationBlock");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v4, "initWithSourceProvider:multipleTransformationBlock:", v5, v6);

  return v7;
}

- (id)reloadItems
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[5];

  -[HFMultipleTransformItemProvider sourceProvider](self, "sourceProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "reloadItems");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __46__HFMultipleTransformItemProvider_reloadItems__block_invoke;
  v7[3] = &unk_1EA72C438;
  v7[4] = self;
  objc_msgSend(v4, "flatMap:", v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id __46__HFMultipleTransformItemProvider_reloadItems__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  id v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  void *v37;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _QWORD v43[4];
  id v44;
  uint64_t v45;
  _QWORD v46[4];
  id v47;
  uint64_t v48;
  _QWORD v49[5];
  id v50;
  _BYTE v51[128];
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "addedItems");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  v6 = MEMORY[0x1E0C809B0];
  if (v5)
  {
    v7 = (void *)MEMORY[0x1E0C99E20];
    objc_msgSend(v3, "addedItems");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setWithCapacity:", objc_msgSend(v8, "count"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v3, "addedItems");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v49[0] = v6;
    v49[1] = 3221225472;
    v49[2] = __46__HFMultipleTransformItemProvider_reloadItems__block_invoke_2;
    v49[3] = &unk_1EA733DD0;
    v49[4] = *(_QWORD *)(a1 + 32);
    v50 = v9;
    v11 = v9;
    objc_msgSend(v10, "na_each:", v49);

    objc_msgSend(v3, "setAddedItems:", v11);
  }
  objc_msgSend(v3, "existingItems");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "count");

  if (v13)
  {
    v14 = (void *)MEMORY[0x1E0C99E20];
    objc_msgSend(v3, "existingItems");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setWithCapacity:", objc_msgSend(v15, "count"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v3, "existingItems");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v46[0] = v6;
    v46[1] = 3221225472;
    v46[2] = __46__HFMultipleTransformItemProvider_reloadItems__block_invoke_3;
    v46[3] = &unk_1EA733DD0;
    v18 = *(_QWORD *)(a1 + 32);
    v47 = v16;
    v48 = v18;
    v19 = v16;
    objc_msgSend(v17, "na_each:", v46);

    objc_msgSend(v3, "setExistingItems:", v19);
  }
  objc_msgSend(v3, "removedItems");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "count");

  if (v21)
  {
    v22 = (void *)MEMORY[0x1E0C99E20];
    objc_msgSend(v3, "removedItems");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setWithCapacity:", objc_msgSend(v23, "count"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v3, "removedItems");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v43[0] = v6;
    v43[1] = 3221225472;
    v43[2] = __46__HFMultipleTransformItemProvider_reloadItems__block_invoke_4;
    v43[3] = &unk_1EA733DD0;
    v26 = *(_QWORD *)(a1 + 32);
    v44 = v24;
    v45 = v26;
    v27 = v24;
    objc_msgSend(v25, "na_each:", v43);

    objc_msgSend(v3, "setRemovedItems:", v27);
  }
  objc_msgSend(*(id *)(a1 + 32), "allItems");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "removeAllObjects");

  v41 = 0u;
  v42 = 0u;
  v39 = 0u;
  v40 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "transformedItems", 0);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "objectEnumerator");
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v39, v51, 16);
  if (v31)
  {
    v32 = v31;
    v33 = *(_QWORD *)v40;
    do
    {
      v34 = 0;
      do
      {
        if (*(_QWORD *)v40 != v33)
          objc_enumerationMutation(v30);
        v35 = *(_QWORD *)(*((_QWORD *)&v39 + 1) + 8 * v34);
        objc_msgSend(*(id *)(a1 + 32), "allItems");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "unionSet:", v35);

        ++v34;
      }
      while (v32 != v34);
      v32 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v39, v51, 16);
    }
    while (v32);
  }

  objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", v3);
  v37 = (void *)objc_claimAutoreleasedReturnValue();

  return v37;
}

void __46__HFMultipleTransformItemProvider_reloadItems__block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "_subclass_transformItem:", v4);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "transformedItems");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithNonretainedObject:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setObject:forKeyedSubscript:", v7, v6);
  objc_msgSend(*(id *)(a1 + 40), "unionSet:", v7);

}

void __46__HFMultipleTransformItemProvider_reloadItems__block_invoke_3(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;

  v2 = *(void **)(a1 + 32);
  v3 = *(void **)(a1 + 40);
  v4 = a2;
  objc_msgSend(v3, "transformedItems");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithNonretainedObject:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "unionSet:", v6);

}

void __46__HFMultipleTransformItemProvider_reloadItems__block_invoke_4(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithNonretainedObject:", a2);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v3 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "transformedItems");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "unionSet:", v5);

  objc_msgSend(*(id *)(a1 + 40), "transformedItems");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeObjectForKey:", v7);

}

- (id)_subclass_transformItem:(id)a3
{
  id v5;
  void *v6;
  void (**v7)(_QWORD, _QWORD);
  void *v8;
  void *v10;

  v5 = a3;
  -[HFMultipleTransformItemProvider transformationBlock](self, "transformationBlock");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HFMultipleTransformItemProvider.m"), 98, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("self.transformationBlock"));

  }
  -[HFMultipleTransformItemProvider transformationBlock](self, "transformationBlock");
  v7 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, id))v7)[2](v7, v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)invalidationReasons
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)HFMultipleTransformItemProvider;
  -[HFItemProvider invalidationReasons](&v8, sel_invalidationReasons);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFMultipleTransformItemProvider sourceProvider](self, "sourceProvider");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "invalidationReasons");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setByAddingObjectsFromSet:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (HFItemProvider)sourceProvider
{
  return self->_sourceProvider;
}

- (id)transformationBlock
{
  return self->_transformationBlock;
}

- (void)setTransformationBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSMutableDictionary)transformedItems
{
  return self->_transformedItems;
}

- (void)setTransformedItems:(id)a3
{
  objc_storeStrong((id *)&self->_transformedItems, a3);
}

- (NSMutableSet)allItems
{
  return self->_allItems;
}

- (void)setAllItems:(id)a3
{
  objc_storeStrong((id *)&self->_allItems, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_allItems, 0);
  objc_storeStrong((id *)&self->_transformedItems, 0);
  objc_storeStrong(&self->_transformationBlock, 0);
  objc_storeStrong((id *)&self->_sourceProvider, 0);
}

@end
