@implementation WFContentQuery

- (WFContentQuery)initWithPredicate:(id)a3
{
  id v4;
  WFContentQuery *v5;
  WFContentPredicate *v6;
  WFContentPredicate *predicate;
  WFContentQuery *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)WFContentQuery;
  v5 = -[WFContentQuery init](&v10, sel_init);
  if (v5)
  {
    if (v4)
    {
      v6 = (WFContentPredicate *)v4;
    }
    else
    {
      +[WFContentPredicate truePredicate](WFContentPredicate, "truePredicate");
      v6 = (WFContentPredicate *)objc_claimAutoreleasedReturnValue();
    }
    predicate = v5->_predicate;
    v5->_predicate = v6;

    v5->_slice = (_WFContentSlice)WFContentSliceAll;
    v8 = v5;
  }

  return v5;
}

- (id)description
{
  objc_class *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __CFString *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v17;

  v17 = (void *)MEMORY[0x24BDD17C8];
  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFContentQuery predicate](self, "predicate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFContentQuery sortDescriptors](self, "sortDescriptors");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[WFContentQuery slice](self, "slice");
  v8 = v7;
  v10 = v9;
  v11 = (void *)MEMORY[0x24BDD17C8];
  if (v7 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v12 = &stru_24C4E3948;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%lu"), v7);
    v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  if (v10 == 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(v11, "stringWithFormat:", CFSTR("[%@:%@]"), v12, &stru_24C4E3948);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%lu"), v10);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "stringWithFormat:", CFSTR("[%@:%@]"), v12, v14);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  if (v8 != 0x7FFFFFFFFFFFFFFFLL)

  objc_msgSend(v17, "stringWithFormat:", CFSTR("<%@: %p, predicate: %@, sortDescriptors: %@, slice: %@>"), v4, self, v5, v6, v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (void)runWithObjects:(id)a3 completionHandler:(id)a4
{
  -[WFContentQuery runWithObjects:propertySubstitutor:completionHandler:](self, "runWithObjects:propertySubstitutor:completionHandler:", a3, 0, a4);
}

- (void)runWithObjects:(id)a3 propertySubstitutor:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  _QWORD v13[5];
  id v14;
  id v15;
  _QWORD v16[5];
  id v17;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = v10;
  if (v10)
  {
    if (v8)
    {
      v12 = MEMORY[0x24BDAC760];
      v16[0] = MEMORY[0x24BDAC760];
      v16[1] = 3221225472;
      v16[2] = __71__WFContentQuery_runWithObjects_propertySubstitutor_completionHandler___block_invoke;
      v16[3] = &unk_24C4E0DC8;
      v16[4] = self;
      v17 = v9;
      v13[0] = v12;
      v13[1] = 3221225472;
      v13[2] = __71__WFContentQuery_runWithObjects_propertySubstitutor_completionHandler___block_invoke_3;
      v13[3] = &unk_24C4E0DF0;
      v13[4] = self;
      v14 = v11;
      v15 = v17;
      objc_msgSend(v8, "if_mapAsynchronously:completionHandler:", v16, v13);

    }
    else
    {
      (*((void (**)(id, _QWORD, _QWORD))v10 + 2))(v10, 0, 0);
    }
  }

}

- (NSSet)containedProperties
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)objc_opt_new();
  -[WFContentQuery predicate](self, "predicate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[WFContentQuery predicate](self, "predicate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "containedProperties");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "unionSet:", v6);

  }
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[WFContentQuery sortDescriptors](self, "sortDescriptors", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v15;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v15 != v10)
          objc_enumerationMutation(v7);
        objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v11), "containedProperties");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "unionSet:", v12);

        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v9);
  }

  return (NSSet *)v3;
}

- (BOOL)canEvaluateObjects:(id)a3 withPropertySubstitutor:(id)a4
{
  id v6;
  id v7;
  void *v8;
  char HaveProperties;

  v6 = a4;
  v7 = a3;
  -[WFContentQuery containedProperties](self, "containedProperties");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  HaveProperties = WFContentObjectsHaveProperties(v7, v8, v6);

  return HaveProperties;
}

- (WFContentPredicate)predicate
{
  return self->_predicate;
}

- (NSArray)sortDescriptors
{
  return self->_sortDescriptors;
}

- (void)setSortDescriptors:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (_WFContentSlice)slice
{
  unint64_t endIndex;
  unint64_t startIndex;
  _WFContentSlice result;

  endIndex = self->_slice.endIndex;
  startIndex = self->_slice.startIndex;
  result.endIndex = endIndex;
  result.startIndex = startIndex;
  return result;
}

- (void)setSlice:(_WFContentSlice)a3
{
  self->_slice = a3;
}

- (NSDictionary)userInfo
{
  return self->_userInfo;
}

- (void)setUserInfo:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_sortDescriptors, 0);
  objc_storeStrong((id *)&self->_predicate, 0);
}

void __71__WFContentQuery_runWithObjects_propertySubstitutor_completionHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;

  v6 = a2;
  v7 = a4;
  objc_msgSend(*(id *)(a1 + 32), "predicate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = *(_QWORD *)(a1 + 40);
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __71__WFContentQuery_runWithObjects_propertySubstitutor_completionHandler___block_invoke_2;
  v12[3] = &unk_24C4E0DA0;
  v13 = v6;
  v14 = v7;
  v10 = v6;
  v11 = v7;
  objc_msgSend(v8, "evaluateWithObject:propertySubstitutor:completionHandler:", v10, v9, v12);

}

void __71__WFContentQuery_runWithObjects_propertySubstitutor_completionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v3 = a2;
  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "sortDescriptors");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __71__WFContentQuery_runWithObjects_propertySubstitutor_completionHandler___block_invoke_4;
    v7[3] = &unk_24C4E2890;
    v5 = *(_QWORD *)(a1 + 48);
    v6 = *(id *)(a1 + 40);
    v7[4] = *(_QWORD *)(a1 + 32);
    v8 = v6;
    objc_msgSend(v3, "sortedArrayUsingContentSortDescriptors:propertySubstitutor:completionHandler:", v4, v5, v7);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

void __71__WFContentQuery_runWithObjects_propertySubstitutor_completionHandler___block_invoke_4(uint64_t a1, void *a2)
{
  uint64_t v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;

  v3 = *(void **)(a1 + 32);
  v2 = *(_QWORD *)(a1 + 40);
  v4 = a2;
  v5 = objc_msgSend(v3, "slice");
  WFIndexSetFromContentSlice(v5, v6, objc_msgSend(v4, "count"));
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectsAtIndexes:", v8);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  (*(void (**)(uint64_t, void *, _QWORD))(v2 + 16))(v2, v7, 0);
}

uint64_t __71__WFContentQuery_runWithObjects_propertySubstitutor_completionHandler___block_invoke_2(uint64_t a1, int a2)
{
  uint64_t v3;
  uint64_t v4;

  v3 = *(_QWORD *)(a1 + 40);
  if (a2)
    v4 = *(_QWORD *)(a1 + 32);
  else
    v4 = 0;
  return (*(uint64_t (**)(uint64_t, uint64_t, _QWORD))(v3 + 16))(v3, v4, 0);
}

@end
