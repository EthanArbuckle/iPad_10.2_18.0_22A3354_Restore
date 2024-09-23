@implementation HFItemGroupItem

- (HFItemGroupItem)init
{
  HFItemGroupItem *v2;
  uint64_t v3;
  NSSet *items;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)HFItemGroupItem;
  v2 = -[HFItemGroupItem init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v3 = objc_claimAutoreleasedReturnValue();
    items = v2->_items;
    v2->_items = (NSSet *)v3;

  }
  return v2;
}

- (HFItemGroupItem)initWithItems:(id)a3
{
  id v5;
  HFItemGroupItem *v6;
  HFItemGroupItem *v7;

  v5 = a3;
  v6 = -[HFItemGroupItem init](self, "init");
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_items, a3);

  return v7;
}

- (void)setItems:(id)a3
{
  NSSet *v5;
  NSSet *v6;

  v5 = (NSSet *)a3;
  if (self->_items != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_items, a3);
    v5 = v6;
  }

}

- (id)_subclass_updateWithOptions:(id)a3
{
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  id v17;
  _QWORD v19[5];
  id v20;
  _QWORD v21[4];
  id v22;

  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0D519C0]);
  -[HFItemGroupItem items](self, "items");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = MEMORY[0x1E0C809B0];
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __47__HFItemGroupItem__subclass_updateWithOptions___block_invoke;
  v21[3] = &unk_1EA740758;
  v22 = v4;
  v8 = v4;
  objc_msgSend(v6, "na_map:", v21);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)MEMORY[0x1E0D519C0];
  objc_msgSend(v9, "allObjects");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D519E8], "mainThreadScheduler");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "combineAllFutures:ignoringErrors:scheduler:", v11, 1, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v19[0] = v7;
  v19[1] = 3221225472;
  v19[2] = __47__HFItemGroupItem__subclass_updateWithOptions___block_invoke_2;
  v19[3] = &unk_1EA72A0C8;
  v19[4] = self;
  v14 = v5;
  v20 = v14;
  v15 = (id)objc_msgSend(v13, "addCompletionBlock:", v19);
  v16 = v20;
  v17 = v14;

  return v17;
}

uint64_t __47__HFItemGroupItem__subclass_updateWithOptions___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "updateWithOptions:", *(_QWORD *)(a1 + 32));
}

void __47__HFItemGroupItem__subclass_updateWithOptions___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[7];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  char v30;
  _QWORD v31[3];
  _QWORD v32[4];

  v32[3] = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v27 = 0;
  v28 = &v27;
  v29 = 0x2020000000;
  v30 = 1;
  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__27;
  v25 = __Block_byref_object_dispose__27;
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v26 = (id)objc_claimAutoreleasedReturnValue();
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__27;
  v19 = __Block_byref_object_dispose__27;
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v20 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "items");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __47__HFItemGroupItem__subclass_updateWithOptions___block_invoke_4;
  v14[3] = &unk_1EA740780;
  v14[4] = &v15;
  v14[5] = &v21;
  v14[6] = &v27;
  objc_msgSend(v7, "na_each:", v14);

  v8 = v16[5];
  v31[0] = CFSTR("dependentHomeKitClasses");
  v31[1] = CFSTR("dependentHomeKitObjects");
  v9 = v22[5];
  v32[0] = v8;
  v32[1] = v9;
  v31[2] = CFSTR("hidden");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *((unsigned __int8 *)v28 + 24));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v32[2] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v32, v31, 3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = *(void **)(a1 + 40);
  +[HFItemUpdateOutcome outcomeWithResults:](HFItemUpdateOutcome, "outcomeWithResults:", v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "finishWithResult:", v13);

  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(&v21, 8);

  _Block_object_dispose(&v27, 8);
}

void __47__HFItemGroupItem__subclass_updateWithOptions___block_invoke_4(_QWORD *a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  id v15;

  v3 = a2;
  v4 = *(void **)(*(_QWORD *)(a1[4] + 8) + 40);
  v15 = v3;
  objc_msgSend(v3, "latestResults");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("dependentHomeKitClasses"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend(v4, "unionSet:", v6);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "unionSet:", v7);

  }
  v8 = *(void **)(*(_QWORD *)(a1[5] + 8) + 40);
  objc_msgSend(v15, "latestResults");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("dependentHomeKitObjects"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    objc_msgSend(v8, "unionSet:", v10);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "unionSet:", v11);

  }
  objc_msgSend(v15, "latestResults");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("hidden"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "BOOLValue");

  if ((v14 & 1) == 0)
    *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = 0;

}

- (NSSet)items
{
  return self->_items;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_items, 0);
}

@end
