@implementation MGGroupsQueryOperation

- (MGGroupsQueryOperation)initWithAgent:(id)a3 query:(id)a4 groups:(id)a5 substitutionVariables:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  MGGroupsQueryOperation *v15;
  MGGroupsQueryOperation *v16;
  uint64_t v17;
  NSDictionary *groups;
  uint64_t v19;
  NSDictionary *variables;
  objc_super v22;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v22.receiver = self;
  v22.super_class = (Class)MGGroupsQueryOperation;
  v15 = -[MGGroupsQueryOperation init](&v22, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_agent, a3);
    objc_storeStrong((id *)&v16->_query, a4);
    v17 = objc_msgSend(v13, "copy");
    groups = v16->_groups;
    v16->_groups = (NSDictionary *)v17;

    v19 = objc_msgSend(v14, "copy");
    variables = v16->_variables;
    v16->_variables = (NSDictionary *)v19;

  }
  return v16;
}

- (void)main
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  id v17;
  _QWORD v18[5];
  id v19;
  id v20;
  id v21;
  id v22;

  -[MGGroupsQueryOperation variables](self, "variables");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");
  v5 = v4;
  if (v4)
    v6 = v4;
  else
    v6 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v7 = v6;

  v8 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  objc_msgSend(v7, "setObject:forKey:", v8, CFSTR("RESULTS_LIST"));
  v9 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  objc_msgSend(v7, "setObject:forKey:", v9, CFSTR("RESULTS_MAP"));
  -[MGGroupsQueryOperation query](self, "query");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "predicate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[MGGroupsQueryOperation groups](self, "groups");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __30__MGGroupsQueryOperation_main__block_invoke;
  v18[3] = &unk_24E0AAA60;
  v18[4] = self;
  v19 = v11;
  v20 = v7;
  v17 = v8;
  v21 = v17;
  v22 = v9;
  v13 = v9;
  v14 = v7;
  v15 = v11;
  objc_msgSend(v12, "enumerateKeysAndObjectsUsingBlock:", v18);

  if ((-[MGGroupsQueryOperation isCancelled](self, "isCancelled") & 1) == 0)
  {
    -[MGGroupsQueryOperation agent](self, "agent");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "_queryOperation:didFindGroups:", self, v17);

  }
}

void __30__MGGroupsQueryOperation_main__block_invoke(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v7;
  char v8;
  id v9;

  v9 = a2;
  v7 = a3;
  v8 = objc_msgSend(*(id *)(a1 + 32), "isCancelled");
  *a4 = v8;
  if ((v8 & 1) == 0
    && objc_msgSend(*(id *)(a1 + 40), "evaluateWithObject:substitutionVariables:", v7, *(_QWORD *)(a1 + 48)))
  {
    objc_msgSend(*(id *)(a1 + 56), "addObject:", v7);
    objc_msgSend(*(id *)(a1 + 64), "setObject:forKey:", v7, v9);
  }

}

- (MGGroupsQueryAgent)agent
{
  return self->_agent;
}

- (MGOutstandingQuery)query
{
  return self->_query;
}

- (NSDictionary)groups
{
  return self->_groups;
}

- (NSDictionary)variables
{
  return self->_variables;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_variables, 0);
  objc_storeStrong((id *)&self->_groups, 0);
  objc_storeStrong((id *)&self->_query, 0);
  objc_storeStrong((id *)&self->_agent, 0);
}

@end
