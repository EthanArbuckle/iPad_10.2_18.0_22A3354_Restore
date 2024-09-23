@implementation HFTransformItemProvider

- (id)items
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x1E0C99E60];
  -[HFTransformItemProvider transformedItems](self, "transformedItems");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allValues");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (NSMutableDictionary)transformedItems
{
  return self->_transformedItems;
}

- (id)reloadItems
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[5];

  -[HFTransformItemProvider sourceProvider](self, "sourceProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "reloadItems");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __38__HFTransformItemProvider_reloadItems__block_invoke;
  v7[3] = &unk_1EA72C438;
  v7[4] = self;
  objc_msgSend(v4, "flatMap:", v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)invalidationReasons
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)HFTransformItemProvider;
  -[HFItemProvider invalidationReasons](&v8, sel_invalidationReasons);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFTransformItemProvider sourceProvider](self, "sourceProvider");
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

void __38__HFTransformItemProvider_reloadItems__block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void (**v5)(_QWORD, _QWORD);
  void *v6;
  void *v7;
  id v8;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "transformationBlock");
  v5 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, id))v5)[2](v5, v4);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "transformedItems");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithNonretainedObject:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setObject:forKeyedSubscript:", v8, v7);
  objc_msgSend(*(id *)(a1 + 40), "na_safeAddObject:", v8);

}

- (id)transformationBlock
{
  return self->_transformationBlock;
}

- (HFTransformItemProvider)initWithSourceProvider:(id)a3 transformationBlock:(id)a4
{
  id v7;
  id v8;
  HFTransformItemProvider *v9;
  HFTransformItemProvider *v10;
  void *v11;
  id transformationBlock;
  uint64_t v13;
  NSMutableDictionary *transformedItems;
  objc_super v16;

  v7 = a3;
  v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)HFTransformItemProvider;
  v9 = -[HFItemProvider init](&v16, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_sourceProvider, a3);
    v11 = _Block_copy(v8);
    transformationBlock = v10->_transformationBlock;
    v10->_transformationBlock = v11;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v13 = objc_claimAutoreleasedReturnValue();
    transformedItems = v10->_transformedItems;
    v10->_transformedItems = (NSMutableDictionary *)v13;

  }
  return v10;
}

id __38__HFTransformItemProvider_reloadItems__block_invoke(uint64_t a1, void *a2)
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
  uint64_t v30;
  uint64_t v31;
  void (*v32)(uint64_t, uint64_t);
  void *v33;
  id v34;
  uint64_t v35;
  _QWORD v36[4];
  id v37;
  uint64_t v38;
  _QWORD v39[5];
  id v40;

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
    v39[0] = v6;
    v39[1] = 3221225472;
    v39[2] = __38__HFTransformItemProvider_reloadItems__block_invoke_2;
    v39[3] = &unk_1EA733DD0;
    v39[4] = *(_QWORD *)(a1 + 32);
    v40 = v9;
    v11 = v9;
    objc_msgSend(v10, "na_each:", v39);

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
    v36[0] = v6;
    v36[1] = 3221225472;
    v36[2] = __38__HFTransformItemProvider_reloadItems__block_invoke_3;
    v36[3] = &unk_1EA733DD0;
    v18 = *(_QWORD *)(a1 + 32);
    v37 = v16;
    v38 = v18;
    v19 = v16;
    objc_msgSend(v17, "na_each:", v36);

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
    v30 = v6;
    v31 = 3221225472;
    v32 = __38__HFTransformItemProvider_reloadItems__block_invoke_4;
    v33 = &unk_1EA733DD0;
    v26 = *(_QWORD *)(a1 + 32);
    v34 = v24;
    v35 = v26;
    v27 = v24;
    objc_msgSend(v25, "na_each:", &v30);

    objc_msgSend(v3, "setRemovedItems:", v27, v30, v31, v32, v33);
  }
  objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", v3);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  return v28;
}

- (HFTransformItemProvider)init
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_initWithSourceProvider_transformationBlock_);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HFTransformItemProvider.m"), 24, CFSTR("%s is unavailable; use %@ instead"),
    "-[HFTransformItemProvider init]",
    v5);

  return 0;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = objc_alloc((Class)objc_opt_class());
  -[HFTransformItemProvider sourceProvider](self, "sourceProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFTransformItemProvider transformationBlock](self, "transformationBlock");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v4, "initWithSourceProvider:transformationBlock:", v5, v6);

  return v7;
}

void __38__HFTransformItemProvider_reloadItems__block_invoke_3(uint64_t a1, void *a2)
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
  objc_msgSend(v2, "na_safeAddObject:", v6);

}

void __38__HFTransformItemProvider_reloadItems__block_invoke_4(uint64_t a1, uint64_t a2)
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
  objc_msgSend(v3, "na_safeAddObject:", v5);

  objc_msgSend(*(id *)(a1 + 40), "transformedItems");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeObjectForKey:", v7);

}

- (void)setSourceProvider:(id)a3
{
  objc_storeStrong((id *)&self->_sourceProvider, a3);
}

- (void)setTransformationBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void)setTransformedItems:(id)a3
{
  objc_storeStrong((id *)&self->_transformedItems, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transformedItems, 0);
  objc_storeStrong(&self->_transformationBlock, 0);
  objc_storeStrong((id *)&self->_sourceProvider, 0);
}

@end
