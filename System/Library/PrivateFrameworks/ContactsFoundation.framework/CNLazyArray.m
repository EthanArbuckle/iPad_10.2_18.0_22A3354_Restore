@implementation CNLazyArray

- (CNLazyArray)init
{
  return -[CNLazyArray initWithArray:](self, "initWithArray:", MEMORY[0x1E0C9AA60]);
}

- (CNLazyArray)initWithArray:(id)a3
{
  void *v4;
  CNLazyArray *v5;

  objc_msgSend(a3, "objectEnumerator");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[CNLazyArray initWithEnumerator:](self, "initWithEnumerator:", v4);

  return v5;
}

- (CNLazyArray)initWithEnumerator:(id)a3
{
  id v4;
  _CNLazyArrayEnumeratorSource *v5;
  CNLazyArray *v6;

  v4 = a3;
  v5 = -[_CNLazyArrayEnumeratorSource initWithEnumerator:]([_CNLazyArrayEnumeratorSource alloc], "initWithEnumerator:", v4);

  v6 = -[CNLazyArray initWithSource:](self, "initWithSource:", v5);
  return v6;
}

- (CNLazyArray)initWithFastEnumeration:(id)a3
{
  id v4;
  _CNLazyArrayFastEnumerationSource *v5;
  CNLazyArray *v6;

  v4 = a3;
  v5 = -[_CNLazyArrayFastEnumerationSource initWithFastEnumeration:]([_CNLazyArrayFastEnumerationSource alloc], "initWithFastEnumeration:", v4);

  v6 = -[CNLazyArray initWithSource:](self, "initWithSource:", v5);
  return v6;
}

- (CNLazyArray)initWithInitialState:(id)a3 condition:(id)a4 nextState:(id)a5 resultSelector:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  _CNLazyArrayGeneratorSource *v14;
  CNLazyArray *v15;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  v14 = -[_CNLazyArrayGeneratorSource initWithInitialState:condition:nextState:resultSelector:]([_CNLazyArrayGeneratorSource alloc], "initWithInitialState:condition:nextState:resultSelector:", v13, v12, v11, v10);

  v15 = -[CNLazyArray initWithSource:](self, "initWithSource:", v14);
  return v15;
}

- (CNLazyArray)initWithSource:(id)a3
{
  id v5;
  CNLazyArray *v6;
  CNLazyArray *v7;
  uint64_t v8;
  NSMutableArray *output;
  CNLazyArray *v10;
  objc_super v12;

  v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CNLazyArray;
  v6 = -[CNLazyArray init](&v12, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_operationChain, a3);
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v8 = objc_claimAutoreleasedReturnValue();
    output = v7->_output;
    v7->_output = (NSMutableArray *)v8;

    v10 = v7;
  }

  return v7;
}

- (NSArray)allObjects
{
  -[CNLazyArray consumeAllObjects](self, "consumeAllObjects");
  return (NSArray *)self->_output;
}

- (id)reduce
{
  _QWORD aBlock[5];

  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __21__CNLazyArray_reduce__block_invoke;
  aBlock[3] = &unk_1E29BB4A0;
  aBlock[4] = self;
  return _Block_copy(aBlock);
}

id __21__CNLazyArray_reduce__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void (**v6)(id, void *, _QWORD);
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = v5;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v8 = *(id *)(a1 + 32);
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  v10 = v7;
  if (v9)
  {
    v11 = v9;
    v12 = *(_QWORD *)v17;
    v10 = v7;
    do
    {
      v13 = 0;
      v14 = v10;
      do
      {
        if (*(_QWORD *)v17 != v12)
          objc_enumerationMutation(v8);
        v6[2](v6, v14, *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v13));
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        ++v13;
        v14 = v10;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v11);
  }

  return v10;
}

- (id)firstObject
{
  void *v3;
  void *v4;

  -[CNLazyArray consumeToIndex:](self, "consumeToIndex:", 0);
  -[CNLazyArray output](self, "output");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)lastObject
{
  void *v3;
  void *v4;

  -[CNLazyArray consumeAllObjects](self, "consumeAllObjects");
  -[CNLazyArray output](self, "output");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lastObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)filter
{
  _QWORD aBlock[5];

  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __21__CNLazyArray_filter__block_invoke;
  aBlock[3] = &unk_1E29BB4C8;
  aBlock[4] = self;
  return _Block_copy(aBlock);
}

id __21__CNLazyArray_filter__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  _CNLazyArrayOperatorFilter *v4;
  void *v5;
  _CNLazyArrayOperatorFilter *v6;

  v3 = a2;
  v4 = [_CNLazyArrayOperatorFilter alloc];
  objc_msgSend(*(id *)(a1 + 32), "operationChain");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[_CNLazyArrayOperatorFilter initWithInput:test:](v4, "initWithInput:test:", v5, v3);

  objc_msgSend(*(id *)(a1 + 32), "setOperationChain:", v6);
  return *(id *)(a1 + 32);
}

- (id)map
{
  _QWORD aBlock[5];

  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __18__CNLazyArray_map__block_invoke;
  aBlock[3] = &unk_1E29BB4F0;
  aBlock[4] = self;
  return _Block_copy(aBlock);
}

id __18__CNLazyArray_map__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  _CNLazyArrayOperatorMap *v4;
  void *v5;
  _CNLazyArrayOperatorMap *v6;

  v3 = a2;
  v4 = [_CNLazyArrayOperatorMap alloc];
  objc_msgSend(*(id *)(a1 + 32), "operationChain");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[_CNLazyArrayOperatorMap initWithInput:transform:](v4, "initWithInput:transform:", v5, v3);

  objc_msgSend(*(id *)(a1 + 32), "setOperationChain:", v6);
  return *(id *)(a1 + 32);
}

- (id)compactMap
{
  _QWORD aBlock[5];

  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __25__CNLazyArray_compactMap__block_invoke;
  aBlock[3] = &unk_1E29BB4F0;
  aBlock[4] = self;
  return _Block_copy(aBlock);
}

id __25__CNLazyArray_compactMap__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  _CNLazyArrayOperatorCompactMap *v4;
  void *v5;
  _CNLazyArrayOperatorCompactMap *v6;

  v3 = a2;
  v4 = [_CNLazyArrayOperatorCompactMap alloc];
  objc_msgSend(*(id *)(a1 + 32), "operationChain");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[_CNLazyArrayOperatorCompactMap initWithInput:transform:](v4, "initWithInput:transform:", v5, v3);

  objc_msgSend(*(id *)(a1 + 32), "setOperationChain:", v6);
  return *(id *)(a1 + 32);
}

- (id)flatMap
{
  _QWORD aBlock[5];

  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __22__CNLazyArray_flatMap__block_invoke;
  aBlock[3] = &unk_1E29BB518;
  aBlock[4] = self;
  return _Block_copy(aBlock);
}

id __22__CNLazyArray_flatMap__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  _CNLazyArrayOperatorFlatMap *v4;
  void *v5;
  _CNLazyArrayOperatorFlatMap *v6;

  v3 = a2;
  v4 = [_CNLazyArrayOperatorFlatMap alloc];
  objc_msgSend(*(id *)(a1 + 32), "operationChain");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[_CNLazyArrayOperatorFlatMap initWithInput:transform:](v4, "initWithInput:transform:", v5, v3);

  objc_msgSend(*(id *)(a1 + 32), "setOperationChain:", v6);
  return *(id *)(a1 + 32);
}

- (id)all
{
  _QWORD aBlock[5];

  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __18__CNLazyArray_all__block_invoke;
  aBlock[3] = &unk_1E29BB540;
  aBlock[4] = self;
  return _Block_copy(aBlock);
}

uint64_t __18__CNLazyArray_all__block_invoke(uint64_t a1, void *a2)
{
  unsigned int (**v3)(id, _QWORD);
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = *(id *)(a1 + 32);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    while (2)
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        if (!v3[2](v3, *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v8)))
        {
          v9 = 0;
          goto LABEL_11;
        }
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v6)
        continue;
      break;
    }
  }
  v9 = 1;
LABEL_11:

  return v9;
}

- (id)any
{
  _QWORD aBlock[5];

  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __18__CNLazyArray_any__block_invoke;
  aBlock[3] = &unk_1E29BB540;
  aBlock[4] = self;
  return _Block_copy(aBlock);
}

uint64_t __18__CNLazyArray_any__block_invoke(uint64_t a1, void *a2)
{
  uint64_t (**v3)(id, _QWORD);
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v4 = *(id *)(a1 + 32);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v10;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v4);
        if ((v3[2](v3, *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * i)) & 1) != 0)
        {
          v5 = 1;
          goto LABEL_11;
        }
      }
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      if (v5)
        continue;
      break;
    }
  }
LABEL_11:

  return v5;
}

- (id)none
{
  _QWORD aBlock[5];

  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __19__CNLazyArray_none__block_invoke;
  aBlock[3] = &unk_1E29BB540;
  aBlock[4] = self;
  return _Block_copy(aBlock);
}

uint64_t __19__CNLazyArray_none__block_invoke(uint64_t a1, void *a2)
{
  uint64_t (**v3)(id, _QWORD);
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = *(id *)(a1 + 32);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    while (2)
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        if ((v3[2](v3, *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v8)) & 1) != 0)
        {
          v9 = 0;
          goto LABEL_11;
        }
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v6)
        continue;
      break;
    }
  }
  v9 = 1;
LABEL_11:

  return v9;
}

- (id)contains
{
  _QWORD aBlock[5];

  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __23__CNLazyArray_contains__block_invoke;
  aBlock[3] = &unk_1E29BB568;
  aBlock[4] = self;
  return _Block_copy(aBlock);
}

uint64_t __23__CNLazyArray_contains__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v4 = *(id *)(a1 + 32);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v10;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v4);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * i), "isEqual:", v3, (_QWORD)v9) & 1) != 0)
        {
          v5 = 1;
          goto LABEL_11;
        }
      }
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      if (v5)
        continue;
      break;
    }
  }
LABEL_11:

  return v5;
}

- (id)distinct
{
  _CNLazyArrayOperatorDistinct *v3;
  void *v4;
  _CNLazyArrayOperatorDistinct *v5;

  v3 = [_CNLazyArrayOperatorDistinct alloc];
  -[CNLazyArray operationChain](self, "operationChain");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[_CNLazyArrayOperatorDistinct initWithInput:](v3, "initWithInput:", v4);
  -[CNLazyArray setOperationChain:](self, "setOperationChain:", v5);

  return self;
}

- (id)skip
{
  _QWORD aBlock[5];

  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __19__CNLazyArray_skip__block_invoke;
  aBlock[3] = &unk_1E29BB590;
  aBlock[4] = self;
  return _Block_copy(aBlock);
}

id __19__CNLazyArray_skip__block_invoke(uint64_t a1, uint64_t a2)
{
  _CNLazyArrayOperatorSkip *v4;
  void *v5;
  _CNLazyArrayOperatorSkip *v6;

  if (a2)
  {
    v4 = [_CNLazyArrayOperatorSkip alloc];
    objc_msgSend(*(id *)(a1 + 32), "operationChain");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[_CNLazyArrayOperatorSkip initWithInput:limit:](v4, "initWithInput:limit:", v5, a2);
    objc_msgSend(*(id *)(a1 + 32), "setOperationChain:", v6);

  }
  return *(id *)(a1 + 32);
}

- (id)skipLast
{
  _QWORD aBlock[5];

  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __23__CNLazyArray_skipLast__block_invoke;
  aBlock[3] = &unk_1E29BB590;
  aBlock[4] = self;
  return _Block_copy(aBlock);
}

id __23__CNLazyArray_skipLast__block_invoke(uint64_t a1, uint64_t a2)
{
  _CNLazyArrayOperatorSkipLast *v4;
  void *v5;
  _CNLazyArrayOperatorSkipLast *v6;

  if (a2)
  {
    v4 = [_CNLazyArrayOperatorSkipLast alloc];
    objc_msgSend(*(id *)(a1 + 32), "operationChain");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[_CNLazyArrayOperatorSkipLast initWithInput:limit:](v4, "initWithInput:limit:", v5, a2);
    objc_msgSend(*(id *)(a1 + 32), "setOperationChain:", v6);

  }
  return *(id *)(a1 + 32);
}

- (id)take
{
  _QWORD aBlock[5];

  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __19__CNLazyArray_take__block_invoke;
  aBlock[3] = &unk_1E29BB590;
  aBlock[4] = self;
  return _Block_copy(aBlock);
}

id __19__CNLazyArray_take__block_invoke(uint64_t a1, uint64_t a2)
{
  _CNLazyArrayOperatorTake *v4;
  void *v5;
  uint64_t v6;
  _CNLazyArrayEnumeratorSource *v7;
  void *v8;

  if (a2)
  {
    v4 = [_CNLazyArrayOperatorTake alloc];
    objc_msgSend(*(id *)(a1 + 32), "operationChain");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[_CNLazyArrayOperatorTake initWithInput:limit:](v4, "initWithInput:limit:", v5, a2);
  }
  else
  {
    v7 = [_CNLazyArrayEnumeratorSource alloc];
    objc_msgSend(MEMORY[0x1E0C9AA60], "objectEnumerator");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[_CNLazyArrayEnumeratorSource initWithEnumerator:](v7, "initWithEnumerator:", v5);
  }
  v8 = (void *)v6;
  objc_msgSend(*(id *)(a1 + 32), "setOperationChain:", v6);

  return *(id *)(a1 + 32);
}

- (id)takeLast
{
  _QWORD aBlock[5];

  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __23__CNLazyArray_takeLast__block_invoke;
  aBlock[3] = &unk_1E29BB590;
  aBlock[4] = self;
  return _Block_copy(aBlock);
}

id __23__CNLazyArray_takeLast__block_invoke(uint64_t a1, uint64_t a2)
{
  _CNLazyArrayOperatorTakeLast *v4;
  void *v5;
  uint64_t v6;
  _CNLazyArrayEnumeratorSource *v7;
  void *v8;

  if (a2)
  {
    v4 = [_CNLazyArrayOperatorTakeLast alloc];
    objc_msgSend(*(id *)(a1 + 32), "operationChain");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[_CNLazyArrayOperatorTakeLast initWithInput:limit:](v4, "initWithInput:limit:", v5, a2);
  }
  else
  {
    v7 = [_CNLazyArrayEnumeratorSource alloc];
    objc_msgSend(MEMORY[0x1E0C9AA60], "objectEnumerator");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[_CNLazyArrayEnumeratorSource initWithEnumerator:](v7, "initWithEnumerator:", v5);
  }
  v8 = (void *)v6;
  objc_msgSend(*(id *)(a1 + 32), "setOperationChain:", v6);

  return *(id *)(a1 + 32);
}

- (id)doOnNext
{
  _QWORD aBlock[5];

  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __23__CNLazyArray_doOnNext__block_invoke;
  aBlock[3] = &unk_1E29BB5B8;
  aBlock[4] = self;
  return _Block_copy(aBlock);
}

id __23__CNLazyArray_doOnNext__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  _CNLazyArrayActionOnNext *v4;
  void *v5;
  _CNLazyArrayActionOnNext *v6;

  v3 = a2;
  v4 = [_CNLazyArrayActionOnNext alloc];
  objc_msgSend(*(id *)(a1 + 32), "operationChain");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[_CNLazyArrayActionOnNext initWithInput:action:](v4, "initWithInput:action:", v5, v3);

  objc_msgSend(*(id *)(a1 + 32), "setOperationChain:", v6);
  return *(id *)(a1 + 32);
}

- (void)consumeToIndex:(unint64_t)a3
{
  while (-[NSMutableArray count](self->_output, "count") <= a3
       && -[CNLazyArray consumeNextObject](self, "consumeNextObject"))
    ;
}

- (void)consumeAllObjects
{
  while (-[CNLazyArray consumeNextObject](self, "consumeNextObject"))
    ;
}

- (BOOL)consumeNextObject
{
  void *v3;
  void *v4;

  -[CNLazyArray operationChain](self, "operationChain");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "nextObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    -[NSMutableArray addObject:](self->_output, "addObject:", v4);

  return v4 != 0;
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  unint64_t var0;
  void *v9;

  var0 = a3->var0;
  if (!var0)
  {
    a3->var2 = (unint64_t *)self;
    a3->var3[0] = -[NSMutableArray count](self->_output, "count", 0, a4, a5);
    var0 = a3->var0;
  }
  -[CNLazyArray consumeToIndex:](self, "consumeToIndex:", var0, a4, a5);
  if (-[NSMutableArray count](self->_output, "count") <= a3->var0)
    return 0;
  -[NSMutableArray objectAtIndexedSubscript:](self->_output, "objectAtIndexedSubscript:");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  *a4 = v9;
  ++a3->var0;
  a3->var1 = a4;

  return 1;
}

- (_CNLazyArrayOperation)operationChain
{
  return (_CNLazyArrayOperation *)objc_getProperty(self, a2, 8, 1);
}

- (void)setOperationChain:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (NSMutableArray)output
{
  return (NSMutableArray *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_output, 0);
  objc_storeStrong((id *)&self->_operationChain, 0);
}

@end
