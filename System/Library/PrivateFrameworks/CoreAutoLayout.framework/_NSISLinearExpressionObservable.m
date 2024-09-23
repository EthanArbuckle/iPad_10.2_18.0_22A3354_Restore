@implementation _NSISLinearExpressionObservable

+ (id)observableForExpression:(id)a3 inEngine:(id)a4
{
  return -[_NSISLinearExpressionObservable initWithExpression:inEngine:]([_NSISLinearExpressionObservable alloc], a3, (uint64_t)a4);
}

- (_QWORD)initWithExpression:(uint64_t)a3 inEngine:
{
  _QWORD *v5;
  _QWORD *v6;
  objc_super v8;

  if (!a1)
    return 0;
  v8.receiver = a1;
  v8.super_class = (Class)_NSISLinearExpressionObservable;
  v5 = objc_msgSendSuper2(&v8, sel_init);
  v6 = v5;
  if (v5)
  {
    v5[7] = a3;
    v5[6] = a2;
  }
  return v6;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_NSISLinearExpressionObservable;
  -[NSObservationSource dealloc](&v3, sel_dealloc);
}

- (void)_lazilyObserveVariablesIfNeeded
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[5];
  _QWORD v11[6];
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _QWORD v16[6];
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (a1 && !*(_QWORD *)(a1 + 64))
  {
    *(_QWORD *)(a1 + 64) = objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 48), "variableCount"));
    v16[0] = 0;
    v16[1] = v16;
    v16[2] = 0x3052000000;
    v16[3] = __Block_byref_object_copy_;
    v16[4] = __Block_byref_object_dispose_;
    v16[5] = a1;
    v12 = 0u;
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v2 = *(void **)(a1 + 48);
    v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v12, v17, 16);
    if (v3)
    {
      v4 = *(_QWORD *)v13;
      do
      {
        for (i = 0; i != v3; ++i)
        {
          if (*(_QWORD *)v13 != v4)
            objc_enumerationMutation(v2);
          v6 = *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * i);
          v7 = *(void **)(a1 + 64);
          v8 = (void *)objc_msgSend(*(id *)(a1 + 56), "observableForVariable:", v6);
          v11[0] = MEMORY[0x1E0C809B0];
          v11[1] = 3221225472;
          v11[2] = __66___NSISLinearExpressionObservable__lazilyObserveVariablesIfNeeded__block_invoke;
          v11[3] = &unk_1E4A48538;
          v11[4] = v6;
          v11[5] = v16;
          objc_msgSend(v7, "addObject:", objc_msgSend(v8, "addObserverBlock:", v11));
        }
        v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v12, v17, 16);
      }
      while (v3);
    }
    if (_NSConstraintBasedLayoutVariableChangeTransactions())
    {
      v9 = (void *)objc_msgSend(*(id *)(a1 + 56), "variableChangeTransactionSignal");
      v10[0] = MEMORY[0x1E0C809B0];
      v10[1] = 3221225472;
      v10[2] = __66___NSISLinearExpressionObservable__lazilyObserveVariablesIfNeeded__block_invoke_2;
      v10[3] = &unk_1E4A48560;
      v10[4] = v16;
      *(_QWORD *)(a1 + 72) = (id)objc_msgSend(v9, "addObserverBlock:", v10);
    }
    _Block_object_dispose(v16, 8);
  }
}

- (uint64_t)receiveObservedValue:(uint64_t)result fromVariable:
{
  uint64_t v1;

  if (result)
  {
    v1 = result;
    *(_BYTE *)(result + 80) = 1;
    result = _NSConstraintBasedLayoutVariableChangeTransactions();
    if ((result & 1) == 0)
      return -[_NSISLinearExpressionObservable emitValueIfNeeded](v1);
  }
  return result;
}

- (uint64_t)emitValueIfNeeded
{
  _QWORD *v1;
  double v2;
  double v3;
  void *v4;
  float v5;
  void *v6;
  id v7;

  if (result)
  {
    v1 = (_QWORD *)result;
    if (*(_BYTE *)(result + 80))
    {
      objc_msgSend(*(id *)(result + 56), "valueForExpression:", *(_QWORD *)(result + 48));
      v3 = v2;
      v4 = (void *)v1[5];
      if (!v4)
      {
        v6 = 0;
        goto LABEL_8;
      }
      result = objc_msgSend(v4, "floatValue");
      if (v3 != v5)
      {
        v6 = (void *)v1[5];
LABEL_8:

        v7 = (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v3);
        v1[5] = v7;
        return objc_msgSend(v1, "receiveObservedValue:", v7);
      }
    }
  }
  return result;
}

- (BOOL)_overrideUseFastBlockObservers
{
  return 1;
}

- (id)addObserverBlock:(id)a3
{
  objc_super v6;

  -[_NSISLinearExpressionObservable _lazilyObserveVariablesIfNeeded]((uint64_t)self);
  v6.receiver = self;
  v6.super_class = (Class)_NSISLinearExpressionObservable;
  return -[_NSISLinearExpressionObservable addObserverBlock:](&v6, sel_addObserverBlock_, a3);
}

- (id)addObserver:(id)a3
{
  objc_super v6;

  -[_NSISLinearExpressionObservable _lazilyObserveVariablesIfNeeded]((uint64_t)self);
  v6.receiver = self;
  v6.super_class = (Class)_NSISLinearExpressionObservable;
  return -[_NSISLinearExpressionObservable addObserver:](&v6, sel_addObserver_, a3);
}

@end
