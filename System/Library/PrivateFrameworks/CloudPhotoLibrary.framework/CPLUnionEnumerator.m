@implementation CPLUnionEnumerator

- (CPLUnionEnumerator)initWithEnumeratorGenerators:(id)a3
{
  id v4;
  CPLUnionEnumerator *v5;
  uint64_t v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  id v13;
  id v14;
  uint64_t v15;
  id v16;
  uint64_t v17;
  NSMutableArray *remainingGenerators;
  objc_super v20;

  v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)CPLUnionEnumerator;
  v5 = -[CPLUnionEnumerator init](&v20, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "count");
    if (v6 == 2)
    {
      objc_msgSend(v4, "firstObject");
      v10 = objc_claimAutoreleasedReturnValue();
      v11 = v5->_generatorArray[0];
      v5->_generatorArray[0] = (id)v10;

      objc_msgSend(v4, "lastObject");
      v12 = objc_claimAutoreleasedReturnValue();
      v13 = v5->_generatorArray[1];
      v5->_generatorArray[1] = (id)v12;

      v5->_currentGeneratorIndex = 0;
    }
    else
    {
      if (v6 == 1)
      {
        v14 = v5->_generatorArray[0];
        v5->_generatorArray[0] = 0;

        objc_msgSend(v4, "firstObject");
        v15 = objc_claimAutoreleasedReturnValue();
        v16 = v5->_generatorArray[1];
        v5->_generatorArray[1] = (id)v15;

        v9 = 1;
      }
      else
      {
        if (v6)
        {
          v17 = objc_msgSend(v4, "mutableCopy");
          remainingGenerators = v5->_remainingGenerators;
          v5->_remainingGenerators = (NSMutableArray *)v17;

          goto LABEL_10;
        }
        v7 = v5->_generatorArray[0];
        v5->_generatorArray[0] = 0;

        v8 = v5->_generatorArray[1];
        v5->_generatorArray[1] = 0;

        v9 = 2;
      }
      v5->_currentGeneratorIndex = v9;
    }
  }
LABEL_10:

  return v5;
}

- (CPLUnionEnumerator)initWithEnumerators:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  CPLUnionEnumerator *v14;
  _QWORD v16[5];
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v4, "count"));
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v18;
    v10 = MEMORY[0x1E0C809B0];
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v18 != v9)
          objc_enumerationMutation(v6);
        v12 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v11);
        v16[0] = v10;
        v16[1] = 3221225472;
        v16[2] = __42__CPLUnionEnumerator_initWithEnumerators___block_invoke;
        v16[3] = &unk_1E60D8178;
        v16[4] = v12;
        v13 = (void *)MEMORY[0x1B5E08DC4](v16);
        objc_msgSend(v5, "addObject:", v13);

        ++v11;
      }
      while (v8 != v11);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v8);
  }

  v14 = -[CPLUnionEnumerator initWithEnumeratorGenerators:](self, "initWithEnumeratorGenerators:", v5);
  return v14;
}

- (void)_prepareNextEnumeratorWithState:(id *)a3
{
  NSMutableArray *remainingGenerators;
  unint64_t currentGeneratorIndex;
  void (**v7)(void);
  NSFastEnumeration *v8;
  NSFastEnumeration *currentEnumerator;
  NSFastEnumeration *v10;
  NSFastEnumeration *v11;
  unint64_t v12;
  id v13;
  NSFastEnumeration *v14;

  remainingGenerators = self->_remainingGenerators;
  currentGeneratorIndex = self->_currentGeneratorIndex;
  if (remainingGenerators)
  {
    if (currentGeneratorIndex < -[NSMutableArray count](remainingGenerators, "count"))
    {
      -[NSMutableArray objectAtIndexedSubscript:](self->_remainingGenerators, "objectAtIndexedSubscript:", self->_currentGeneratorIndex);
      v7 = (void (**)(void))objc_claimAutoreleasedReturnValue();
      v7[2]();
      v8 = (NSFastEnumeration *)objc_claimAutoreleasedReturnValue();
      currentEnumerator = self->_currentEnumerator;
      self->_currentEnumerator = v8;

      -[NSMutableArray replaceObjectAtIndex:withObject:](self->_remainingGenerators, "replaceObjectAtIndex:withObject:", self->_currentGeneratorIndex, &__block_literal_global_4129);
LABEL_6:
      ++self->_currentGeneratorIndex;
      goto LABEL_8;
    }
  }
  else if (currentGeneratorIndex <= 1)
  {
    (*((void (**)(void))self->_generatorArray[currentGeneratorIndex] + 2))();
    v10 = (NSFastEnumeration *)objc_claimAutoreleasedReturnValue();
    v11 = self->_currentEnumerator;
    self->_currentEnumerator = v10;

    v12 = self->_currentGeneratorIndex;
    v13 = self->_generatorArray[v12];
    self->_generatorArray[v12] = 0;

    goto LABEL_6;
  }
  v14 = self->_currentEnumerator;
  self->_currentEnumerator = 0;

LABEL_8:
  if (self->_currentEnumerator)
  {
    a3->var0 = 0;
    *(_OWORD *)a3->var3 = 0u;
    *(_OWORD *)&a3->var3[2] = 0u;
    a3->var3[4] = 0;
    self->_currentEnumeratorMutationsPtr = 0;
  }
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  unint64_t result;
  unint64_t *currentEnumeratorMutationsPtr;
  unint64_t *var2;
  BOOL v12;
  unint64_t *v13;

  if (self->_currentEnumerator)
    goto LABEL_3;
  do
  {
    -[CPLUnionEnumerator _prepareNextEnumeratorWithState:](self, "_prepareNextEnumeratorWithState:", a3);
    if (!self->_currentEnumerator)
      return 0;
LABEL_3:
    a3->var2 = (unint64_t *)self->_currentEnumeratorMutationsPtr;
    result = -[NSFastEnumeration countByEnumeratingWithState:objects:count:](self->_currentEnumerator, "countByEnumeratingWithState:objects:count:", a3, a4, a5);
  }
  while (!result);
  currentEnumeratorMutationsPtr = (unint64_t *)self->_currentEnumeratorMutationsPtr;
  var2 = a3->var2;
  if (currentEnumeratorMutationsPtr)
    v12 = var2 == currentEnumeratorMutationsPtr;
  else
    v12 = 1;
  if (v12)
  {
    self->_currentEnumeratorMutationsPtr = var2;
    v13 = (unint64_t *)&countByEnumeratingWithState_objects_count__const_mu;
  }
  else
  {
    v13 = (unint64_t *)&countByEnumeratingWithState_objects_count__const_mu2;
  }
  a3->var2 = v13;
  return result;
}

- (void).cxx_destruct
{
  uint64_t v3;

  objc_storeStrong((id *)&self->_currentEnumerator, 0);
  objc_storeStrong((id *)&self->_remainingGenerators, 0);
  v3 = 16;
  do
  {
    objc_storeStrong((id *)((char *)&self->super.isa + v3), 0);
    v3 -= 8;
  }
  while (v3);
}

id __42__CPLUnionEnumerator_initWithEnumerators___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

@end
