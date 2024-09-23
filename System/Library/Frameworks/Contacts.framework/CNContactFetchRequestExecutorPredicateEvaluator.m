@implementation CNContactFetchRequestExecutorPredicateEvaluator

- (id)observable
{
  if (a1)
    a1 = (id *)a1[3];
  return a1;
}

- (id)initWithFetchRequestPrototype:(void *)a3 dataMapper:
{
  id v5;
  id v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  id v10;
  objc_super v12;

  v5 = a2;
  v6 = a3;
  if (a1)
  {
    v12.receiver = a1;
    v12.super_class = (Class)CNContactFetchRequestExecutorPredicateEvaluator;
    a1 = (id *)objc_msgSendSuper2(&v12, sel_init);
    if (a1)
    {
      v7 = objc_msgSend(v5, "copy");
      v8 = a1[1];
      a1[1] = (id)v7;

      objc_storeStrong(a1 + 2, a3);
      objc_msgSend(MEMORY[0x1E0D13AE8], "emptyObservable");
      v9 = objc_claimAutoreleasedReturnValue();
      v10 = a1[3];
      a1[3] = (id)v9;

    }
  }

  return a1;
}

- (void)evaluatePredicate:(void *)a1
{
  id v3;
  id v4;

  v3 = a2;
  if (a1)
  {
    v4 = v3;
    if (v3)
      objc_msgSend(v3, "_cn_acceptVisitor:", a1);
    else
      objc_msgSend(a1, "visitCNPredicate:", 0);
    v3 = v4;
  }

}

- (void)visitCNPredicate:(id)a3
{
  CNObservable *v4;
  CNObservable *observable;
  id v6;

  v6 = -[CNContactFetchRequestExecutorPredicateEvaluator copyFetchRequestWithPredicate:](self, "copyFetchRequestWithPredicate:", a3);
  -[CNDataMapper contactObservableForFetchRequest:](self->_dataMapper, "contactObservableForFetchRequest:", v6);
  v4 = (CNObservable *)objc_claimAutoreleasedReturnValue();
  observable = self->_observable;
  self->_observable = v4;

}

- (id)copyFetchRequestWithPredicate:(id)a3
{
  CNContactFetchRequest *fetchRequest;
  id v4;
  void *v5;

  fetchRequest = self->_fetchRequest;
  v4 = a3;
  v5 = (void *)-[CNContactFetchRequest copy](fetchRequest, "copy");
  objc_msgSend(v5, "setPredicate:", v4);

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observable, 0);
  objc_storeStrong((id *)&self->_dataMapper, 0);
  objc_storeStrong((id *)&self->_fetchRequest, 0);
}

- (void)visitNSCompoundPredicate:(id)a3
{
  uint64_t v4;
  BOOL v5;
  void *v6;
  id v7;

  v7 = a3;
  v4 = objc_msgSend(v7, "compoundPredicateType");
  if (v4)
  {
    if (v4 == 1)
    {
      -[CNContactFetchRequestExecutorPredicateEvaluator visitAndPredicate:](self, "visitAndPredicate:", v7);
    }
    else
    {
      v5 = v4 == 2;
      v6 = v7;
      if (!v5)
        goto LABEL_9;
      -[CNContactFetchRequestExecutorPredicateEvaluator visitOrPredicate:](self, "visitOrPredicate:", v7);
    }
  }
  else
  {
    -[CNContactFetchRequestExecutorPredicateEvaluator visitNotPredicate:](self, "visitNotPredicate:", v7);
  }
  v6 = v7;
LABEL_9:

}

- (void)visitOrPredicate:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  char v16;
  void *v17;
  void *v18;
  CNObservable *v19;
  CNObservable *v20;
  void *v21;
  void *v22;
  CNObservable *v23;
  CNObservable *observable;
  void *v25;
  CNObservable *obj;
  uint64_t v27;
  uint64_t v28;
  void *v30;
  uint64_t v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v25 = v3;
  objc_msgSend(v3, "subpredicates");
  obj = (CNObservable *)objc_claimAutoreleasedReturnValue();
  v28 = -[CNObservable countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
  if (v28)
  {
    v27 = *(_QWORD *)v37;
    while (2)
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v37 != v27)
          objc_enumerationMutation(obj);
        -[CNContactFetchRequestExecutorPredicateEvaluator evaluateSubpredicate:](self, "evaluateSubpredicate:", *(_QWORD *)(*((_QWORD *)&v36 + 1) + 8 * v6));
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v7, "isFailure") & 1) != 0)
        {
          v21 = (void *)MEMORY[0x1E0D13AE8];
          objc_msgSend(v7, "error");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "observableWithError:", v22);
          v23 = (CNObservable *)objc_claimAutoreleasedReturnValue();
          observable = self->_observable;
          self->_observable = v23;

          v20 = obj;
          goto LABEL_20;
        }
        v30 = v7;
        v31 = v6;
        v34 = 0u;
        v35 = 0u;
        v32 = 0u;
        v33 = 0u;
        objc_msgSend(v7, "value");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
        if (v9)
        {
          v10 = v9;
          v11 = *(_QWORD *)v33;
          do
          {
            for (i = 0; i != v10; ++i)
            {
              if (*(_QWORD *)v33 != v11)
                objc_enumerationMutation(v8);
              v13 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * i);
              objc_msgSend(v13, "first");
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v14, "identifier");
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              v16 = objc_msgSend(v4, "containsObject:", v15);

              if ((v16 & 1) == 0)
              {
                objc_msgSend(v13, "first");
                v17 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v17, "identifier");
                v18 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v4, "addObject:", v18);

                objc_msgSend(v5, "addObject:", v13);
              }
            }
            v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
          }
          while (v10);
        }

        v6 = v31 + 1;
      }
      while (v31 + 1 != v28);
      v28 = -[CNObservable countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
      if (v28)
        continue;
      break;
    }
  }

  objc_msgSend(MEMORY[0x1E0D13AE8], "observableWithResult:", v5);
  v19 = (CNObservable *)objc_claimAutoreleasedReturnValue();
  v20 = self->_observable;
  self->_observable = v19;
LABEL_20:

}

- (void)visitAndPredicate:(id)a3
{
  id v3;
  void *v4;
  char v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *observable;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  void *v19;
  CNObservable *v20;
  CNObservable *v21;
  void *v22;
  void *v23;
  CNObservable *v24;
  CNObservable *v25;
  CNObservable *v26;
  id v27;
  CNObservable *obj;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v33;
  void *v34;
  void *v35;
  id v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _BYTE v45[128];
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  v27 = v3;
  objc_msgSend(v3, "subpredicates");
  obj = (CNObservable *)objc_claimAutoreleasedReturnValue();
  v31 = -[CNObservable countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v41, v46, 16);
  if (v31)
  {
    v29 = v4;
    v30 = *(_QWORD *)v42;
    v5 = 1;
    while (2)
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v42 != v30)
          objc_enumerationMutation(obj);
        -[CNContactFetchRequestExecutorPredicateEvaluator evaluateSubpredicate:](self, "evaluateSubpredicate:", *(_QWORD *)(*((_QWORD *)&v41 + 1) + 8 * v6));
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v7, "isFailure"))
        {
          v23 = (void *)MEMORY[0x1E0D13AE8];
          objc_msgSend(v7, "error");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "observableWithError:", v8);
          v24 = (CNObservable *)objc_claimAutoreleasedReturnValue();
          observable = self->_observable;
          self->_observable = v24;
LABEL_23:

          v22 = v27;
          v21 = obj;
          goto LABEL_24;
        }
        v33 = v6;
        objc_msgSend(MEMORY[0x1E0C99DE8], "array");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C99E20], "set");
        observable = (void *)objc_claimAutoreleasedReturnValue();
        v37 = 0u;
        v38 = 0u;
        v39 = 0u;
        v40 = 0u;
        v34 = v7;
        objc_msgSend(v7, "value");
        v36 = (id)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v37, v45, 16);
        if (v10)
        {
          v11 = v10;
          v12 = *(_QWORD *)v38;
          do
          {
            v13 = 0;
            do
            {
              if (*(_QWORD *)v38 != v12)
                objc_enumerationMutation(v36);
              v14 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * v13);
              if ((v5 & 1) != 0
                || (objc_msgSend(*(id *)(*((_QWORD *)&v37 + 1) + 8 * v13), "first"),
                    v15 = (void *)objc_claimAutoreleasedReturnValue(),
                    objc_msgSend(v15, "identifier"),
                    v16 = (void *)objc_claimAutoreleasedReturnValue(),
                    v17 = objc_msgSend(v35, "containsObject:", v16),
                    v16,
                    v15,
                    v17))
              {
                objc_msgSend(v14, "first");
                v18 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v18, "identifier");
                v19 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(observable, "addObject:", v19);

                objc_msgSend(v8, "addObject:", v14);
              }
              ++v13;
            }
            while (v11 != v13);
            v11 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v37, v45, 16);
          }
          while (v11);
        }

        v4 = v29;
        objc_msgSend(v29, "setArray:", v8);
        objc_msgSend(v35, "setSet:", observable);
        if (!objc_msgSend(v35, "count"))
        {
          objc_msgSend(MEMORY[0x1E0D13AE8], "emptyObservable");
          v25 = (CNObservable *)objc_claimAutoreleasedReturnValue();
          v26 = self->_observable;
          self->_observable = v25;

          v7 = v34;
          goto LABEL_23;
        }

        v5 = 0;
        v6 = v33 + 1;
      }
      while (v33 + 1 != v31);
      v5 = 0;
      v31 = -[CNObservable countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v41, v46, 16);
      if (v31)
        continue;
      break;
    }
  }

  objc_msgSend(MEMORY[0x1E0D13AE8], "observableWithResult:", v4);
  v20 = (CNObservable *)objc_claimAutoreleasedReturnValue();
  v21 = self->_observable;
  self->_observable = v20;
  v22 = v27;
LABEL_24:

}

- (void)visitNotPredicate:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  CNObservable *v8;
  CNObservable *observable;
  id v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  CNObservable *v24;
  CNObservable *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t j;
  void *v31;
  void *v32;
  void *v33;
  CNObservable *v34;
  void *v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _BYTE v44[128];
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[CNContactFetchRequestExecutorPredicateEvaluator evaluateSubpredicate:](self, "evaluateSubpredicate:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isFailure"))
  {
    v6 = (void *)MEMORY[0x1E0D13AE8];
    objc_msgSend(v5, "error");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "observableWithError:", v7);
    v8 = (CNObservable *)objc_claimAutoreleasedReturnValue();
    observable = self->_observable;
    self->_observable = v8;

  }
  else
  {
    v35 = v4;
    v10 = objc_alloc_init(MEMORY[0x1E0D13AD0]);
    v40 = 0u;
    v41 = 0u;
    v42 = 0u;
    v43 = 0u;
    objc_msgSend(v5, "value");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v40, v45, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v41;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v41 != v14)
            objc_enumerationMutation(v11);
          v16 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * i);
          objc_msgSend(v16, "first");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "identifier");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "setObject:forKeyedSubscript:", v16, v18);

        }
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v40, v45, 16);
      }
      while (v13);
    }

    v4 = v35;
    objc_msgSend(v35, "subpredicates");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "firstObject");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactFetchRequestExecutorPredicateEvaluator evaluateSubpredicate:](self, "evaluateSubpredicate:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v21, "isFailure"))
    {
      v22 = (void *)MEMORY[0x1E0D13AE8];
      objc_msgSend(v21, "error");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "observableWithError:", v23);
      v24 = (CNObservable *)objc_claimAutoreleasedReturnValue();
      v25 = self->_observable;
      self->_observable = v24;
    }
    else
    {
      v38 = 0u;
      v39 = 0u;
      v36 = 0u;
      v37 = 0u;
      objc_msgSend(v21, "value");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v36, v44, 16);
      if (v27)
      {
        v28 = v27;
        v29 = *(_QWORD *)v37;
        do
        {
          for (j = 0; j != v28; ++j)
          {
            if (*(_QWORD *)v37 != v29)
              objc_enumerationMutation(v26);
            objc_msgSend(*(id *)(*((_QWORD *)&v36 + 1) + 8 * j), "first");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v31, "identifier");
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v10, "setObject:forKeyedSubscript:", 0, v32);

          }
          v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v36, v44, 16);
        }
        while (v28);
      }

      v33 = (void *)MEMORY[0x1E0D13AE8];
      objc_msgSend(v10, "allObjects");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "observableWithResult:", v23);
      v34 = (CNObservable *)objc_claimAutoreleasedReturnValue();
      v25 = self->_observable;
      self->_observable = v34;
      v4 = v35;
    }

  }
}

- (void)visitNSPredicate:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  CNObservable *v12;
  CNObservable *observable;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  void *v21;
  int v22;
  uint64_t v23;
  CNObservable *v24;
  CNContactFetchRequestExecutorPredicateEvaluator *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithValue:", 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "isEqual:", v5);

  if (v6)
  {
    -[CNContactFetchRequestExecutorPredicateEvaluator visitTruePredicate:](self, "visitTruePredicate:", v4);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithValue:", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v4, "isEqual:", v7);

    if (v8)
      -[CNContactFetchRequestExecutorPredicateEvaluator visitFalsePredicate:](self, "visitFalsePredicate:", v4);
  }
  -[CNContactFetchRequestExecutorPredicateEvaluator evaluateSubpredicate:](self, "evaluateSubpredicate:", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "isFailure"))
  {
    v10 = (void *)MEMORY[0x1E0D13AE8];
    objc_msgSend(v9, "error");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "observableWithError:", v11);
    v12 = (CNObservable *)objc_claimAutoreleasedReturnValue();
    observable = self->_observable;
    self->_observable = v12;

  }
  else
  {
    v25 = self;
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    objc_msgSend(v9, "value");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v27;
      do
      {
        for (i = 0; i != v17; ++i)
        {
          if (*(_QWORD *)v27 != v18)
            objc_enumerationMutation(v15);
          v20 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
          objc_msgSend(v20, "first");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = objc_msgSend(v4, "evaluateWithObject:", v21);

          if (v22)
            objc_msgSend(v14, "addObject:", v20);
        }
        v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
      }
      while (v17);
    }

    objc_msgSend(MEMORY[0x1E0D13AE8], "observableWithResult:", v14);
    v23 = objc_claimAutoreleasedReturnValue();
    v24 = v25->_observable;
    v25->_observable = (CNObservable *)v23;

  }
}

- (void)visitTruePredicate:(id)a3
{
  -[CNContactFetchRequestExecutorPredicateEvaluator visitCNPredicate:](self, "visitCNPredicate:", 0);
}

- (void)visitFalsePredicate:(id)a3
{
  CNObservable *v4;
  CNObservable *observable;

  objc_msgSend(MEMORY[0x1E0D13AE8], "emptyObservable", a3);
  v4 = (CNObservable *)objc_claimAutoreleasedReturnValue();
  observable = self->_observable;
  self->_observable = v4;

}

- (id)evaluateSubpredicate:(id)a3
{
  id v4;
  id *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v12;

  v4 = a3;
  v5 = -[CNContactFetchRequestExecutorPredicateEvaluator initWithFetchRequestPrototype:dataMapper:]((id *)[CNContactFetchRequestExecutorPredicateEvaluator alloc], self->_fetchRequest, self->_dataMapper);
  -[CNContactFetchRequestExecutorPredicateEvaluator evaluatePredicate:](v5, v4);

  -[CNContactFetchRequestExecutorPredicateEvaluator observable](v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0;
  objc_msgSend(v6, "allObjects:", &v12);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v12;
  objc_msgSend(v7, "_cn_flatten");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D13B60], "resultWithValue:orError:", v9, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

@end
