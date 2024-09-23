@implementation HFTransformItem

id __47__HFTransformItem__subclass_updateWithOptions___block_invoke_2(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;
  void (**v5)(_QWORD, _QWORD);
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "resultsTransformBlock");
  v5 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "results");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  ((void (**)(_QWORD, void *))v5)[2](v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)MEMORY[0x1E0D519C0];
  +[HFItemUpdateOutcome outcomeWithResults:](HFItemUpdateOutcome, "outcomeWithResults:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "futureWithResult:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

id __63__HFTransformItem_initWithSourceItem_resultKeyExclusionFilter___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v4 = *(id *)(a1 + 32);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(v3, "removeObjectForKey:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v8++), (_QWORD)v10);
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }

  return v3;
}

- (id)_subclass_updateWithOptions:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v18[4];
  id v19;
  _QWORD v20[4];
  id v21;
  HFTransformItem *v22;
  id location;

  v4 = a3;
  -[HFTransformItem sourceItem](self, "sourceItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
    NSLog(CFSTR("Must have a source item"));
  -[HFTransformItem resultsTransformBlock](self, "resultsTransformBlock");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
    NSLog(CFSTR("Must specify a transformation block"));
  -[HFTransformItem sourceItem](self, "sourceItem");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7
    && (v8 = (void *)v7,
        -[HFTransformItem resultsTransformBlock](self, "resultsTransformBlock"),
        v9 = (void *)objc_claimAutoreleasedReturnValue(),
        v9,
        v8,
        v9))
  {
    objc_initWeak(&location, self);
    v10 = MEMORY[0x1E0C809B0];
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __47__HFTransformItem__subclass_updateWithOptions___block_invoke;
    v20[3] = &unk_1EA72DAE0;
    v21 = v4;
    v22 = self;
    __47__HFTransformItem__subclass_updateWithOptions___block_invoke((uint64_t)v20);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFTransformItem sourceItem](self, "sourceItem");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "updateWithOptions:", v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = v10;
    v18[1] = 3221225472;
    v18[2] = __47__HFTransformItem__subclass_updateWithOptions___block_invoke_2;
    v18[3] = &unk_1EA72AF60;
    objc_copyWeak(&v19, &location);
    objc_msgSend(v13, "flatMap:", v18);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_destroyWeak(&v19);
    objc_destroyWeak(&location);
  }
  else
  {
    v15 = (void *)MEMORY[0x1E0D519C0];
    objc_msgSend(MEMORY[0x1E0CB35C8], "hf_errorWithCode:", 30);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "futureWithError:", v16);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v14;
}

- (HFItem)sourceItem
{
  return self->_sourceItem;
}

- (id)resultsTransformBlock
{
  return self->_resultsTransformBlock;
}

id __47__HFTransformItem__subclass_updateWithOptions___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void (**v4)(_QWORD, _QWORD);
  void *v5;

  v2 = (void *)objc_msgSend(*(id *)(a1 + 32), "mutableCopy");
  objc_msgSend(v2, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], HFItemUpdateOptionAllowInFlightResults);
  objc_msgSend(*(id *)(a1 + 40), "optionsTransformBlock");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 40), "optionsTransformBlock");
    v4 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *))v4)[2](v4, v2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = (void *)objc_msgSend(v2, "copy");
  }

  return v5;
}

- (id)optionsTransformBlock
{
  return self->_optionsTransformBlock;
}

- (HFTransformItem)initWithSourceItem:(id)a3 resultKeyExclusionFilter:(id)a4
{
  id v6;
  id v7;
  HFTransformItem *v8;
  _QWORD v10[4];
  id v11;

  v6 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __63__HFTransformItem_initWithSourceItem_resultKeyExclusionFilter___block_invoke;
  v10[3] = &unk_1EA73C858;
  v11 = v6;
  v7 = v6;
  v8 = -[HFTransformItem initWithSourceItem:transformationBlock:](self, "initWithSourceItem:transformationBlock:", a3, v10);

  return v8;
}

- (HFTransformItem)initWithSourceItem:(id)a3 updateOptionsTransformBlock:(id)a4 resultsTransformBlock:(id)a5
{
  id v9;
  id v10;
  id v11;
  HFTransformItem *v12;
  HFTransformItem *v13;
  void *v14;
  id optionsTransformBlock;
  void *v16;
  id resultsTransformBlock;
  objc_super v19;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v19.receiver = self;
  v19.super_class = (Class)HFTransformItem;
  v12 = -[HFTransformItem init](&v19, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_sourceItem, a3);
    v14 = _Block_copy(v10);
    optionsTransformBlock = v13->_optionsTransformBlock;
    v13->_optionsTransformBlock = v14;

    v16 = _Block_copy(v11);
    resultsTransformBlock = v13->_resultsTransformBlock;
    v13->_resultsTransformBlock = v16;

  }
  return v13;
}

- (HFTransformItem)initWithSourceItem:(id)a3 transformationBlock:(id)a4
{
  return -[HFTransformItem initWithSourceItem:updateOptionsTransformBlock:resultsTransformBlock:](self, "initWithSourceItem:updateOptionsTransformBlock:resultsTransformBlock:", a3, 0, a4);
}

- (HFItem)transformedSourceItem
{
  HFTransformItem *v3;
  id v4;

  sub_1DD352AB0(0, (unint64_t *)&qword_1ED3783D0);
  v3 = self;
  v4 = HFTransformItem.transformedSourceItem.getter();

  return (HFItem *)v4;
}

- (HFTransformItem)init
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_initWithSourceItem_transformationBlock_);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HFTransformItem.m"), 27, CFSTR("%s is unavailable; use %@ instead"),
    "-[HFTransformItem init]",
    v5);

  return 0;
}

- (HFTransformItem)initWithSourceItem:(id)a3 resultKeyFilter:(id)a4
{
  id v6;
  id v7;
  HFTransformItem *v8;
  _QWORD v10[4];
  id v11;

  v6 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __54__HFTransformItem_initWithSourceItem_resultKeyFilter___block_invoke;
  v10[3] = &unk_1EA73C858;
  v11 = v6;
  v7 = v6;
  v8 = -[HFTransformItem initWithSourceItem:transformationBlock:](self, "initWithSourceItem:transformationBlock:", a3, v10);

  return v8;
}

id __54__HFTransformItem_initWithSourceItem_resultKeyFilter___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (void *)objc_opt_new();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = *(id *)(a1 + 32);
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * i);
        objc_msgSend(v3, "objectForKeyedSubscript:", v10, (_QWORD)v13);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "na_safeSetObject:forKey:", v11, v10);

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);
  }

  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = objc_alloc((Class)objc_opt_class());
  -[HFTransformItem sourceItem](self, "sourceItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFTransformItem optionsTransformBlock](self, "optionsTransformBlock");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFTransformItem resultsTransformBlock](self, "resultsTransformBlock");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v4, "initWithSourceItem:updateOptionsTransformBlock:resultsTransformBlock:", v5, v6, v7);

  objc_msgSend(v8, "copyLatestResultsFromItem:", self);
  return v8;
}

- (void)setSourceItem:(id)a3
{
  objc_storeStrong((id *)&self->_sourceItem, a3);
}

- (void)setOptionsTransformBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (void)setResultsTransformBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_resultsTransformBlock, 0);
  objc_storeStrong(&self->_optionsTransformBlock, 0);
  objc_storeStrong((id *)&self->_sourceItem, 0);
}

@end
