@implementation IKJSDataObservable

+ (id)toDataObservable:(id)a3
{
  return (id)objc_msgSend(a1, "toDataObservable:proxy:", a3, 0);
}

+ (id)toDataObservable:(id)a3 proxy:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v6 = a3;
  if (objc_msgSend(v6, "ikdt_isObject"))
  {
    +[IKAppContext currentAppContext](IKAppContext, "currentAppContext");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "jsWeakMap");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "valueForWeakKey:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "toObjectOfClass:", objc_opt_class());
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      if (!a4)
      {
LABEL_11:

        goto LABEL_12;
      }
      v11 = objc_retainAutorelease(v6);
    }
    else
    {
      if (!a4)
      {
        v10 = 0;
        goto LABEL_11;
      }
      if ((id)objc_opt_class() == a1)
      {
        objc_msgSend(v6, "ikdt_isArray");
        a1 = (id)objc_opt_class();
      }
      v10 = (void *)objc_msgSend(objc_alloc((Class)a1), "_initWithTargetValue:boxed:", v6, 1);
      objc_msgSend(v10, "exportValue");
      v11 = (id)objc_claimAutoreleasedReturnValue();
    }
    *a4 = v11;
    goto LABEL_11;
  }
  v10 = 0;
LABEL_12:

  return v10;
}

- (IKJSDataObservable)init
{
  void *v3;
  IKJSDataObservable *v4;
  objc_super v6;

  +[IKAppContext currentAppContext](IKAppContext, "currentAppContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6.receiver = self;
  v6.super_class = (Class)IKJSDataObservable;
  v4 = -[IKJSObject initWithAppContext:](&v6, sel_initWithAppContext_, v3);

  return v4;
}

- (JSValue)targetValue
{
  return -[JSManagedValue value](self->_managedTargetValue, "value");
}

- (BOOL)isPlaceholder
{
  return self->_managedTargetValue == 0;
}

- (void)setValue:(id)a3 forPropertyPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  _QWORD v10[4];
  id v11;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v7, "accessorSequence");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count");

  if (v9)
  {
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __47__IKJSDataObservable_setValue_forPropertyPath___block_invoke;
    v10[3] = &unk_1E9F4C558;
    v11 = v6;
    -[IKJSDataObservable _updateValueAtPropertyPath:touch:withBlock:](self, "_updateValueAtPropertyPath:touch:withBlock:", v7, 1, v10);

  }
}

id __47__IKJSDataObservable_setValue_forPropertyPath___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (id)valueForPropertyPath:(id)a3 boxed:(BOOL)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v14[5];
  BOOL v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;

  v6 = a3;
  objc_msgSend(v6, "accessorSequence");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");

  if (v8)
  {
    v16 = 0;
    v17 = &v16;
    v18 = 0x3032000000;
    v19 = __Block_byref_object_copy__6;
    v20 = __Block_byref_object_dispose__6;
    v21 = 0;
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __49__IKJSDataObservable_valueForPropertyPath_boxed___block_invoke;
    v14[3] = &unk_1E9F4C580;
    v14[4] = &v16;
    v15 = a4;
    -[IKJSDataObservable _updateValueAtPropertyPath:touch:withBlock:](self, "_updateValueAtPropertyPath:touch:withBlock:", v6, 0, v14);
    v9 = (id)v17[5];
    _Block_object_dispose(&v16, 8);

  }
  else
  {
    v10 = (void *)MEMORY[0x1E0CBE108];
    -[IKJSObject appContext](self, "appContext");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "jsContext");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "valueWithUndefinedInContext:", v12);
    v9 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v9;
}

id __49__IKJSDataObservable_valueForPropertyPath_boxed___block_invoke(uint64_t a1, void *a2)
{
  id v4;
  id v5;
  id v6;
  id obj;

  v4 = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
  if (objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "ikdt_isObject")
    && *(_BYTE *)(a1 + 40))
  {
    obj = 0;
    v5 = +[IKJSDataObservable toDataObservable:proxy:](IKJSDataObservable, "toDataObservable:proxy:", v4, &obj);
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), obj);
  }
  v6 = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);

  return v6;
}

- (void)resetValueForPropertyPath:(id)a3
{
  void *v4;
  uint64_t v5;
  id v6;

  v6 = a3;
  objc_msgSend(v6, "accessorSequence");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  if (v5)
    -[IKJSDataObservable _updateValueAtPropertyPath:touch:withBlock:](self, "_updateValueAtPropertyPath:touch:withBlock:", v6, 0, &__block_literal_global_3);

}

uint64_t __48__IKJSDataObservable_resetValueForPropertyPath___block_invoke()
{
  return 0;
}

- (void)addObserver:(id)a3 forPropertyPathWithString:(id)a4
{
  id v6;
  _IKJSDataObserverRecord *v7;
  IKJSDataObservable *v8;
  NSMutableArray *observerRecords;
  uint64_t v10;
  NSMutableArray *v11;
  id v12;

  v12 = a3;
  v6 = a4;
  v7 = -[_IKJSDataObserverRecord initWithObserver:pathString:]([_IKJSDataObserverRecord alloc], "initWithObserver:pathString:", v12, v6);
  v8 = self;
  objc_sync_enter(v8);
  observerRecords = v8->_observerRecords;
  if (!observerRecords)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 1);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = v8->_observerRecords;
    v8->_observerRecords = (NSMutableArray *)v10;

    observerRecords = v8->_observerRecords;
  }
  -[NSMutableArray addObject:](observerRecords, "addObject:", v7);
  objc_sync_exit(v8);

}

- (void)removeObserver:(id)a3
{
  void *v4;
  IKJSDataObservable *v5;
  void *v6;
  NSMutableArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  id v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v15 = a3;
  +[_IKJSDataObserverRecord hashForObserver:](_IKJSDataObserverRecord, "hashForObserver:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = self;
  objc_sync_enter(v5);
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v7 = v5->_observerRecords;
  v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v17 != v9)
          objc_enumerationMutation(v7);
        v11 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        objc_msgSend(v11, "observerHash");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "isEqualToString:", v4);

        if ((v13 & 1) == 0)
          objc_msgSend(v6, "addObject:", v11);
      }
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v8);
  }

  if (objc_msgSend(v6, "count"))
    v14 = v6;
  else
    v14 = 0;
  objc_storeStrong((id *)&v5->_observerRecords, v14);

  objc_sync_exit(v5);
}

- (void)setPropertyPath:(id)a3 :(id)a4
{
  id v6;
  id v7;
  IKDataBindingPropertyPath *v8;

  v6 = a4;
  v7 = a3;
  v8 = -[IKDataBindingPropertyPath initWithString:]([IKDataBindingPropertyPath alloc], "initWithString:", v7);

  -[IKJSDataObservable setValue:forPropertyPath:](self, "setValue:forPropertyPath:", v6, v8);
}

- (id)getPropertyPath:(id)a3
{
  id v4;
  IKDataBindingPropertyPath *v5;
  void *v6;

  v4 = a3;
  v5 = -[IKDataBindingPropertyPath initWithString:]([IKDataBindingPropertyPath alloc], "initWithString:", v4);

  -[IKJSDataObservable valueForPropertyPath:boxed:](self, "valueForPropertyPath:boxed:", v5, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)touchPropertyPath:(id)a3
{
  id v4;
  IKDataBindingPropertyPath *v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;

  v4 = a3;
  if (objc_msgSend(v4, "length"))
  {
    v5 = -[IKDataBindingPropertyPath initWithString:]([IKDataBindingPropertyPath alloc], "initWithString:", v4);
    -[IKDataBindingPropertyPath accessorSequence](v5, "accessorSequence");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 0;
    v11 = 0;
    v7 = -[IKJSDataObservable valueForAccessorSequence:closestParent:accessorSequenceFromClosestParent:](self, "valueForAccessorSequence:closestParent:accessorSequenceFromClosestParent:", v6, &v11, &v10);
    v8 = v11;
    v9 = v10;
    objc_msgSend(v8, "touchPathWithAccessorSequence:extraInfo:", v9, 0);

  }
}

- (IKJSDataObservable)initWithTargetValue:(id)a3
{
  return (IKJSDataObservable *)-[IKJSDataObservable _initWithTargetValue:boxed:](self, "_initWithTargetValue:boxed:", a3, 0);
}

- (void)setTargetValue:(id)a3
{
  JSManagedValue *v4;
  JSManagedValue *managedTargetValue;

  objc_msgSend(MEMORY[0x1E0CBE0F8], "managedValueWithValue:andOwner:", a3, self);
  v4 = (JSManagedValue *)objc_claimAutoreleasedReturnValue();
  managedTargetValue = self->_managedTargetValue;
  self->_managedTargetValue = v4;

}

- (id)exportValue
{
  void *v3;
  IKJSDataObservable *v4;
  _BOOL8 v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  IKJSDataObservable *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v22[3];

  v22[2] = *MEMORY[0x1E0C80C00];
  -[IKJSObject appContext](self, "appContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[IKJSDataObservable targetValue](self, "targetValue");
  v4 = (IKJSDataObservable *)objc_claimAutoreleasedReturnValue();
  v5 = -[IKJSDataObservable isBoxed](self, "isBoxed");
  v6 = (void *)objc_opt_class();
  -[IKJSObject appContext](self, "appContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "jsContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_proxyHandlerForValue:boxed:context:", v4, v5, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[IKJSObject appContext](self, "appContext");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "jsContext");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("Proxy"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    v13 = v4;
  else
    v13 = self;
  v22[0] = v13;
  v22[1] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "constructWithArguments:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  -[IKJSObject appContext](self, "appContext");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "jsWeakMap");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)MEMORY[0x1E0CBE108];
  objc_msgSend(v3, "jsContext");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "valueWithObject:inContext:", self, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setValue:forWeakKey:", v20, v15);

  return v15;
}

- (id)dataDictionaryObject
{
  _IKJSDataDictionaryExporter *exporter;
  _IKJSDataDictionaryExporter *v4;
  void *v5;
  _IKJSDataDictionaryExporter *v6;
  _IKJSDataDictionaryExporter *v7;

  exporter = self->_exporter;
  if (!exporter)
  {
    v4 = [_IKJSDataDictionaryExporter alloc];
    -[IKJSObject appContext](self, "appContext");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[_IKJSDataDictionaryExporter initWithAppContext:dataObservable:](v4, "initWithAppContext:dataObservable:", v5, self);
    v7 = self->_exporter;
    self->_exporter = v6;

    exporter = self->_exporter;
  }
  return -[_IKJSDataDictionaryExporter dataDictionaryObject](exporter, "dataDictionaryObject");
}

- (void)setParent:(id)a3 accessorSequence:(id)a4
{
  IKJSDataObservable **p_parent;
  id v7;
  NSArray *v8;
  NSArray *parentAccessorSequence;
  _IKJSDataDictionaryExporter *exporter;

  p_parent = &self->_parent;
  v7 = a4;
  objc_storeWeak((id *)p_parent, a3);
  v8 = (NSArray *)objc_msgSend(v7, "copy");

  parentAccessorSequence = self->_parentAccessorSequence;
  self->_parentAccessorSequence = v8;

  exporter = self->_exporter;
  self->_exporter = 0;

}

- (void)touchPathWithAccessorSequence:(id)a3 extraInfo:(id)a4
{
  id v6;
  _IKJSDataDictionaryExporter *exporter;
  IKDataBindingPropertyPath *v8;
  IKJSDataObservable *v9;
  void *v10;
  uint64_t i;
  void *v12;
  int v13;
  id v14;
  id v15;
  IKDataBindingPropertyPath *v16;
  void *v17;
  IKDataBindingPropertyPath *v18;
  void *v19;
  void *v20;
  void *v21;
  IKDataBindingPropertyPath *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  IKJSDataObservable *v30;
  void *v31;
  id v32;
  id obj;
  IKJSDataObservable *v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  id v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v32 = a4;
  exporter = self->_exporter;
  v31 = v6;
  v8 = -[IKDataBindingPropertyPath initWithAccessorSequence:]([IKDataBindingPropertyPath alloc], "initWithAccessorSequence:", v6);
  -[_IKJSDataDictionaryExporter touchPropertyPath:](exporter, "touchPropertyPath:", v8);

  v30 = self;
  if (-[IKJSDataObservable observersEnabled](self, "observersEnabled") && objc_msgSend(v31, "count"))
  {
    v9 = self;
    objc_sync_enter(v9);
    v10 = (void *)-[NSMutableArray copy](v9->_observerRecords, "copy");
    objc_sync_exit(v9);
    v34 = v9;

    +[IKDataBindingPropertyPath pathStringForAccessorSequence:](IKDataBindingPropertyPath, "pathStringForAccessorSequence:", v31);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = 0u;
    v42 = 0u;
    v39 = 0u;
    v40 = 0u;
    obj = v10;
    v37 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
    if (v37)
    {
      v35 = *(_QWORD *)v40;
      do
      {
        for (i = 0; i != v37; ++i)
        {
          if (*(_QWORD *)v40 != v35)
            objc_enumerationMutation(obj);
          v12 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * i);
          v38 = 0;
          v13 = objc_msgSend(v12, "isAffectedByPropertyPathWithString:subpathString:", v36, &v38);
          v14 = v38;
          if (v13)
          {
            v15 = v32;
            if (objc_msgSend(v14, "length"))
            {
              v16 = [IKDataBindingPropertyPath alloc];
              objc_msgSend(v12, "pathString");
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              v18 = -[IKDataBindingPropertyPath initWithString:](v16, "initWithString:", v17);

              -[IKDataBindingPropertyPath accessorSequence](v18, "accessorSequence");
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              -[IKJSDataObservable valueForAccessorSequence:closestParent:accessorSequenceFromClosestParent:](v34, "valueForAccessorSequence:closestParent:accessorSequenceFromClosestParent:", v19, 0, 0);
              v20 = (void *)objc_claimAutoreleasedReturnValue();

              +[IKJSDataObservable toDataObservable:](IKJSDataObservable, "toDataObservable:", v20);
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              v22 = -[IKDataBindingPropertyPath initWithString:]([IKDataBindingPropertyPath alloc], "initWithString:", v14);
              -[IKDataBindingPropertyPath accessorSequence](v22, "accessorSequence");
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v21, "extraInfoForChangeInPathWithAccessorSequence:extraInfo:", v23, v15);
              v24 = objc_claimAutoreleasedReturnValue();

              v15 = (id)v24;
            }
            objc_msgSend(v12, "observer");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "pathString");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v25, "dataObservable:didChangePropertyPathWithString:extraInfo:", v34, v26, v15);

          }
        }
        v37 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
      }
      while (v37);
    }

  }
  -[IKJSDataObservable parent](v30, "parent");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[IKJSDataObservable parentAccessorSequence](v30, "parentAccessorSequence");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "arrayByAddingObjectsFromArray:", v31);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "touchPathWithAccessorSequence:extraInfo:", v29, v32);

}

- (id)valueForAccessorSequence:(id)a3 closestParent:(id *)a4 accessorSequenceFromClosestParent:(id *)a5
{
  id v6;
  IKJSDataObservable *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t i;
  void *v14;
  unint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  IKJSDataObservable *v25;
  char v26;
  id *v28;
  id obj;
  uint64_t v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  uint64_t v37;

  v28 = a4;
  v37 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = self;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[IKJSDataObservable targetValue](v7, "targetValue");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  obj = v6;
  v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
  if (v10)
  {
    v11 = v10;
    v31 = *(_QWORD *)v33;
    v12 = 0x1E9F4A000uLL;
    while (2)
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v33 != v31)
          objc_enumerationMutation(obj);
        v14 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * i);
        v15 = v12;
        objc_msgSend(*(id *)(v12 + 2688), "toDataObservable:", v9, v28);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "targetValue");
        v17 = objc_claimAutoreleasedReturnValue();
        v18 = (void *)v17;
        if (v17)
          v19 = (void *)v17;
        else
          v19 = v9;
        v20 = v19;

        objc_msgSend(v8, "addObject:", v14);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v14, "property");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "objectForKeyedSubscript:", v21);
          v22 = (void *)objc_claimAutoreleasedReturnValue();

        }
        else if (objc_msgSend(v20, "ikdt_isArray"))
        {
          objc_msgSend(v20, "valueAtIndex:", objc_msgSend(v14, "subscriptIndex"));
          v22 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v22 = 0;
        }
        v12 = v15;
        objc_msgSend(*(id *)(v15 + 2688), "toDataObservable:", v22);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        if (v23)
        {
          v24 = (void *)objc_msgSend(v8, "copy");
          objc_msgSend(v23, "setParent:accessorSequence:", v7, v24);

          v25 = v23;
          objc_msgSend(v8, "removeAllObjects");
          v7 = v25;
        }
        v9 = v22;

        if (!v9 || objc_msgSend(v9, "isNull"))
        {

          goto LABEL_23;
        }
        v26 = objc_msgSend(v9, "isUndefined");

        if ((v26 & 1) != 0)
          goto LABEL_23;
      }
      v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
      if (v11)
        continue;
      break;
    }
  }
LABEL_23:

  if (v28)
    *v28 = objc_retainAutorelease(v7);
  if (a5)
    *a5 = (id)objc_msgSend(v8, "copy");

  return v9;
}

+ (id)jsExportedProperties
{
  return &unk_1E9F8C350;
}

- (id)extraInfoForChangeInPathWithAccessorSequence:(id)a3 extraInfo:(id)a4
{
  return 0;
}

+ (id)_proxyHandlerForValue:(id)a3 boxed:(BOOL)a4 context:(id)a5
{
  _BOOL4 v6;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v17[3];
  _QWORD v18[4];

  v6 = a4;
  v18[3] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0CBE108], "valueWithObject:inContext:", MEMORY[0x1E0C9AA70], v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (_proxyHandlerForValue_boxed_context__onceToken != -1)
      dispatch_once(&_proxyHandlerForValue_boxed_context__onceToken, &__block_literal_global_93);
    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("Function"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = CFSTR("object");
    v18[1] = CFSTR("exportedProperties");
    v18[2] = _proxyHandlerForValue_boxed_context__sHandlerScript;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 3);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "constructWithArguments:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v17[0] = v9;
    v17[1] = v8;
    objc_msgSend(a1, "jsExportedProperties");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v17[2] = v14;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 3);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "invokeMethod:withArguments:", CFSTR("call"), v15);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v10;
}

void __58__IKJSDataObservable__proxyHandlerForValue_boxed_context___block_invoke()
{
  void *v0;

  v0 = (void *)_proxyHandlerForValue_boxed_context__sHandlerScript;
  _proxyHandlerForValue_boxed_context__sHandlerScript = (uint64_t)CFSTR("let handler = {   get: function(target, prop) {       if (this.exportedProperties.indexOf(prop) >= 0) {           let value = Reflect.get(target, prop);           if (Object.getPrototypeOf(value) == Function.prototype) {               value = value.bind(target);           }           return value;       }       else       {           return Reflect.get(this.object, prop);       }   },   set: function(target, prop, value) {       return Reflect.set(this.object, prop, value);   }};handler.object = object;handler.exportedProperties = exportedProperties;return handler;");

}

- (id)_initWithTargetValue:(id)a3 boxed:(BOOL)a4
{
  id v6;
  IKJSDataObservable *v7;
  uint64_t v8;
  JSManagedValue *managedTargetValue;

  v6 = a3;
  v7 = -[IKJSDataObservable init](self, "init");
  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0CBE0F8], "managedValueWithValue:andOwner:", v6, v7);
    v8 = objc_claimAutoreleasedReturnValue();
    managedTargetValue = v7->_managedTargetValue;
    v7->_managedTargetValue = (JSManagedValue *)v8;

    v7->_isBoxed = a4;
    v7->_observersEnabled = 1;
  }

  return v7;
}

- (void)_updateValueAtPropertyPath:(id)a3 touch:(BOOL)a4 withBlock:(id)a5
{
  _BOOL4 v5;
  void (**v8)(id, void *);
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void (**v21)(id, void *);
  _BOOL4 v22;
  void *v23;
  void (**v24)(id, void *);
  _BOOL4 v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  id v30;

  v5 = a4;
  v8 = (void (**)(id, void *))a5;
  objc_msgSend(a3, "accessorSequence");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "count") - 1;
  objc_msgSend(v9, "lastObject");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "subarrayWithRange:", 0, v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = 0;
  v30 = 0;
  -[IKJSDataObservable valueForAccessorSequence:closestParent:accessorSequenceFromClosestParent:](self, "valueForAccessorSequence:closestParent:accessorSequenceFromClosestParent:", v12, &v30, &v29);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v30;
  v15 = v29;

  if (v13)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v11, "property");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "objectForKeyedSubscript:", v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else if (objc_msgSend(v13, "ikdt_isArray"))
    {
      objc_msgSend(v13, "valueAtIndex:", objc_msgSend(v11, "subscriptIndex"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v17 = 0;
    }
    if ((objc_msgSend(v17, "isNull") & 1) != 0 || objc_msgSend(v17, "isUndefined"))
    {

      v17 = 0;
    }
    v8[2](v8, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (v18)
    {
      v28 = v15;
      v19 = v14;
      +[IKJSDataObservable toDataObservable:](IKJSDataObservable, "toDataObservable:", v18);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      if (v20)
      {
        objc_msgSend(v28, "arrayByAddingObject:", v11);
        v21 = v8;
        v22 = v5;
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "setParent:accessorSequence:", v19, v23);

        v5 = v22;
        v8 = v21;
      }
      if (v17 != v18)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v11, "property");
          v24 = v8;
          v25 = v5;
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "setObject:forKeyedSubscript:", v18, v26);

          v5 = v25;
          v8 = v24;
        }
        else if (objc_msgSend(v13, "ikdt_isArray"))
        {
          objc_msgSend(v13, "setValue:atIndex:", v18, objc_msgSend(v11, "subscriptIndex"));
        }
      }
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
LABEL_21:

        goto LABEL_22;
      }
      v28 = v15;
      v19 = v14;
      objc_msgSend(v11, "property");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "deleteProperty:", v20);
    }

    v14 = v19;
    v15 = v28;
    goto LABEL_21;
  }
LABEL_22:
  if (v5)
  {
    objc_msgSend(v15, "arrayByAddingObject:", v11);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "touchPathWithAccessorSequence:extraInfo:", v27, 0);

  }
}

- (IKJSDataObservable)parent
{
  return (IKJSDataObservable *)objc_loadWeakRetained((id *)&self->_parent);
}

- (BOOL)isBoxed
{
  return self->_isBoxed;
}

- (BOOL)observersEnabled
{
  return self->_observersEnabled;
}

- (void)setObserversEnabled:(BOOL)a3
{
  self->_observersEnabled = a3;
}

- (NSArray)parentAccessorSequence
{
  return self->_parentAccessorSequence;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parentAccessorSequence, 0);
  objc_destroyWeak((id *)&self->_parent);
  objc_storeStrong((id *)&self->_exporter, 0);
  objc_storeStrong((id *)&self->_observerRecords, 0);
  objc_storeStrong((id *)&self->_managedTargetValue, 0);
}

@end
