@implementation WFContentCompoundPredicate

- (WFContentCompoundPredicate)initWithType:(unint64_t)a3 subpredicates:(id)a4
{
  id v6;
  WFContentCompoundPredicate *v7;
  WFContentCompoundPredicate *v8;
  uint64_t v9;
  NSArray *subpredicates;
  WFContentCompoundPredicate *v11;
  objc_super v13;

  v6 = a4;
  v13.receiver = self;
  v13.super_class = (Class)WFContentCompoundPredicate;
  v7 = -[WFContentCompoundPredicate init](&v13, sel_init);
  v8 = v7;
  if (v7)
  {
    v7->_compoundPredicateType = a3;
    v9 = objc_msgSend(v6, "copy");
    subpredicates = v8->_subpredicates;
    v8->_subpredicates = (NSArray *)v9;

    v11 = v8;
  }

  return v8;
}

- (id)description
{
  unint64_t v3;
  const __CFString *v4;
  void *v5;
  objc_class *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = -[WFContentCompoundPredicate compoundPredicateType](self, "compoundPredicateType");
  if (v3 > 2)
    v4 = CFSTR("unknown");
  else
    v4 = (const __CFString *)*((_QWORD *)&off_24C4DF1D8 + v3);
  v5 = (void *)MEMORY[0x24BDD17C8];
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFContentCompoundPredicate subpredicates](self, "subpredicates");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("<%@: %p, type: %@, subpredicates: %@>"), v7, self, v4, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (void)evaluateWithObject:(id)a3 propertySubstitutor:(id)a4 completionHandler:(id)a5
{
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  NSObject *v16;
  void *v17;
  id v18;
  id v19;
  _QWORD block[4];
  id v21;
  _QWORD *v22;
  _QWORD v23[4];
  id v24;
  WFContentCompoundPredicate *v25;
  NSObject *v26;
  _QWORD *v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _QWORD v32[5];
  id v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v19 = a3;
  v18 = a4;
  v8 = a5;
  if (v8)
  {
    v9 = dispatch_group_create();
    v32[0] = 0;
    v32[1] = v32;
    v32[2] = 0x3032000000;
    v32[3] = __Block_byref_object_copy__10085;
    v32[4] = __Block_byref_object_dispose__10086;
    v33 = 0;
    v10 = (void *)objc_opt_new();
    v17 = v8;
    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    -[WFContentCompoundPredicate subpredicates](self, "subpredicates");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v28, v34, 16);
    if (v12)
    {
      v13 = *(_QWORD *)v29;
      do
      {
        v14 = 0;
        do
        {
          if (*(_QWORD *)v29 != v13)
            objc_enumerationMutation(v11);
          v15 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * v14);
          dispatch_group_enter(v9);
          v23[0] = MEMORY[0x24BDAC760];
          v23[1] = 3221225472;
          v23[2] = __87__WFContentCompoundPredicate_evaluateWithObject_propertySubstitutor_completionHandler___block_invoke;
          v23[3] = &unk_24C4DF190;
          v24 = v10;
          v25 = self;
          v27 = v32;
          v26 = v9;
          objc_msgSend(v15, "evaluateWithObject:propertySubstitutor:completionHandler:", v19, v18, v23);

          ++v14;
        }
        while (v12 != v14);
        v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v28, v34, 16);
      }
      while (v12);
    }

    dispatch_get_global_queue(0, 0);
    v16 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __87__WFContentCompoundPredicate_evaluateWithObject_propertySubstitutor_completionHandler___block_invoke_2;
    block[3] = &unk_24C4DF1B8;
    v21 = v17;
    v22 = v32;
    dispatch_group_notify(v9, v16, block);

    _Block_object_dispose(v32, 8);
    v8 = v17;
  }

}

- (NSSet)containedProperties
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)objc_opt_new();
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[WFContentCompoundPredicate subpredicates](self, "subpredicates", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v8), "containedProperties");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "unionSet:", v9);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

  return (NSSet *)v3;
}

- (unint64_t)compoundPredicateType
{
  return self->_compoundPredicateType;
}

- (NSArray)subpredicates
{
  return (NSArray *)objc_getProperty(self, a2, 24, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subpredicates, 0);
}

void __87__WFContentCompoundPredicate_evaluateWithObject_propertySubstitutor_completionHandler___block_invoke(uint64_t a1, unsigned int a2)
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;

  objc_msgSend(*(id *)(a1 + 32), "lock");
  v4 = (objc_msgSend(*(id *)(a1 + 40), "compoundPredicateType") == 0) ^ a2;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40))
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v4);
    v8 = objc_claimAutoreleasedReturnValue();
LABEL_8:
    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v10 = *(void **)(v9 + 40);
    *(_QWORD *)(v9 + 40) = v8;

    goto LABEL_9;
  }
  v5 = objc_msgSend(*(id *)(a1 + 40), "compoundPredicateType");
  if (v5 == 1)
  {
    v6 = (void *)MEMORY[0x24BDD16E0];
    v7 = v4 & objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "BOOLValue");
    goto LABEL_7;
  }
  if (v5 == 2)
  {
    v6 = (void *)MEMORY[0x24BDD16E0];
    v7 = v4 | objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "BOOLValue");
LABEL_7:
    objc_msgSend(v6, "numberWithInt:", v7);
    v8 = objc_claimAutoreleasedReturnValue();
    goto LABEL_8;
  }
LABEL_9:
  objc_msgSend(*(id *)(a1 + 32), "unlock");
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

uint64_t __87__WFContentCompoundPredicate_evaluateWithObject_propertySubstitutor_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  uint64_t v3;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  if (v2)
    v3 = objc_msgSend(v2, "BOOLValue");
  else
    v3 = 1;
  return (*(uint64_t (**)(uint64_t, uint64_t))(v1 + 16))(v1, v3);
}

+ (id)andPredicateWithSubpredicates:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithType:subpredicates:", 1, v4);

  return v5;
}

+ (id)orPredicateWithSubpredicates:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithType:subpredicates:", 2, v4);

  return v5;
}

+ (id)notPredicateWithSubpredicate:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = objc_alloc((Class)a1);
  v9[0] = v4;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v9, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)objc_msgSend(v5, "initWithType:subpredicates:", 0, v6);
  return v7;
}

@end
