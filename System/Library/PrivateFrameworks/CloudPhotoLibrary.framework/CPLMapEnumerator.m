@implementation CPLMapEnumerator

- (CPLMapEnumerator)initWithEnumerator:(id)a3 map:(id)a4
{
  id v7;
  id v8;
  CPLMapEnumerator *v9;
  CPLMapEnumerator *v10;
  uint64_t v11;
  id mapBlock;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)CPLMapEnumerator;
  v9 = -[CPLMapEnumerator init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_enumerator, a3);
    v11 = objc_msgSend(v8, "copy");
    mapBlock = v10->_mapBlock;
    v10->_mapBlock = (id)v11;

  }
  return v10;
}

- (CPLMapEnumerator)initWithEnumerator:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  id v7;
  CPLMapEnumerator *v8;
  _QWORD v10[4];
  id v11;

  v4 = (void *)MEMORY[0x1E0C99E38];
  v5 = a3;
  objc_msgSend(v4, "null");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __39__CPLMapEnumerator_initWithEnumerator___block_invoke;
  v10[3] = &unk_1E60D9588;
  v11 = v6;
  v7 = v6;
  v8 = -[CPLMapEnumerator initWithEnumerator:map:](self, "initWithEnumerator:map:", v5, v10);

  return v8;
}

- (void)dealloc
{
  unint64_t v3;
  id *resultValues;
  id v5;
  id *v6;
  id *itemsPtr;
  objc_super v8;

  if (self->_previousResultValuesCount)
  {
    v3 = 0;
    do
    {
      resultValues = self->_resultValues;
      v5 = resultValues[v3];
      resultValues[v3] = 0;

      ++v3;
    }
    while (v3 < self->_previousResultValuesCount);
  }
  v6 = self->_resultValues;
  if (v6)
    free(v6);
  itemsPtr = self->_itemsPtr;
  if (itemsPtr)
    free(itemsPtr);
  v8.receiver = self;
  v8.super_class = (Class)CPLMapEnumerator;
  -[CPLMapEnumerator dealloc](&v8, sel_dealloc);
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  uint64_t v9;
  unint64_t v10;
  id *var1;
  void *itemsPtr;
  id *resultValues;
  unint64_t v14;
  id *v15;
  id v16;
  unint64_t v17;
  uint64_t v18;
  void *v19;
  unint64_t v20;
  id *v21;
  id v22;

  while (1)
  {
    a3->var1 = a4;
    v9 = -[NSFastEnumeration countByEnumeratingWithState:objects:count:](self->_enumerator, "countByEnumeratingWithState:objects:count:", a3, a4, a5);
    if (!v9)
      break;
    v10 = v9;
    var1 = a3->var1;
    itemsPtr = a4;
    if (var1 != a4)
    {
      itemsPtr = self->_itemsPtr;
      if (!itemsPtr)
      {
        self->_previousItemsPtrLength = v10;
        itemsPtr = malloc_type_malloc(8 * v10, 0x80040B8603338uLL);
        goto LABEL_7;
      }
      if (v10 > self->_previousItemsPtrLength)
      {
        self->_previousItemsPtrLength = v10;
        itemsPtr = malloc_type_realloc(itemsPtr, 8 * v10, 0x80040B8603338uLL);
LABEL_7:
        self->_itemsPtr = (id *)itemsPtr;
      }
    }
    a3->var1 = (id *)itemsPtr;
    if (self->_previousResultValuesLength < v10)
    {
      self->_previousResultValuesLength = v10;
      resultValues = self->_resultValues;
      if (resultValues)
      {
        if (self->_previousResultValuesCount)
        {
          v14 = 0;
          do
          {
            v15 = self->_resultValues;
            v16 = v15[v14];
            v15[v14] = 0;

            ++v14;
          }
          while (v14 < self->_previousResultValuesCount);
          resultValues = self->_resultValues;
        }
        free(resultValues);
        self->_resultValues = (id *)malloc_type_calloc(v10, 8uLL, 0x80040B8603338uLL);
        self->_previousResultValuesCount = 0;
      }
      else
      {
        self->_resultValues = (id *)malloc_type_calloc(v10, 8uLL, 0x80040B8603338uLL);
      }
    }
    v17 = 0;
    if (v10 <= 1)
      v18 = 1;
    else
      v18 = v10;
    do
    {
      (*((void (**)(void))self->_mapBlock + 2))();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      if (v19)
      {
        objc_storeStrong(&self->_resultValues[v17], v19);
        a3->var1[v17++] = v19;
      }

      ++var1;
      --v18;
    }
    while (v18);
    if (v17)
      goto LABEL_25;
  }
  v17 = 0;
LABEL_25:
  if (v17 < self->_previousResultValuesCount)
  {
    v20 = v17;
    do
    {
      v21 = self->_resultValues;
      v22 = v21[v20];
      v21[v20] = 0;

      ++v20;
    }
    while (v20 < self->_previousResultValuesCount);
  }
  self->_previousResultValuesCount = v17;
  return v17;
}

- (id)mapBlock
{
  return self->_mapBlock;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_mapBlock, 0);
  objc_storeStrong((id *)&self->_enumerator, 0);
}

id __39__CPLMapEnumerator_initWithEnumerator___block_invoke(uint64_t a1, void *a2)
{
  if (*(void **)(a1 + 32) == a2)
    return 0;
  else
    return a2;
}

@end
