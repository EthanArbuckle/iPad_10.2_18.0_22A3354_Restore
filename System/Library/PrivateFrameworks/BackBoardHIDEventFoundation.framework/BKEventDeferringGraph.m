@implementation BKEventDeferringGraph

- (BKEventDeferringGraph)init
{
  BKEventDeferringGraph *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *identityToGraph;
  NSMutableDictionary *v5;
  NSMutableDictionary *pidToRules;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)BKEventDeferringGraph;
  v2 = -[BKEventDeferringGraph init](&v8, sel_init);
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    identityToGraph = v2->_identityToGraph;
    v2->_identityToGraph = v3;

    v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    pidToRules = v2->_pidToRules;
    v2->_pidToRules = v5;

  }
  return v2;
}

- (NSString)description
{
  BKStringTranscriptTarget *v3;
  void *v4;

  v3 = objc_alloc_init(BKStringTranscriptTarget);
  -[BKEventDeferringGraph logGraphToTarget:]((uint64_t)self, v3);
  -[BKStringTranscriptTarget build](v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (void)appendDescriptionToFormatter:(id)a3
{
  id v3;

  v3 = (id)objc_msgSend(a3, "appendObject:withName:", self->_identityToGraph, 0);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_senderDisplays, 0);
  objc_storeStrong((id *)&self->_pidToRules, 0);
  objc_storeStrong((id *)&self->_identityToGraph, 0);
}

- (void)logGraphToTarget:(uint64_t)a1
{
  void *v3;
  id v4;
  _QWORD v5[4];
  id v6;
  uint64_t v7;

  v4 = a2;
  if (a1)
  {
    -[BKEventDeferringGraph _dictionaryWithGraphToIdentityMapping](a1);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __42__BKEventDeferringGraph_logGraphToTarget___block_invoke;
    v5[3] = &unk_1E81F7798;
    v6 = v4;
    v7 = a1;
    objc_msgSend(v3, "enumerateKeysAndObjectsUsingBlock:", v5);

  }
}

- (id)_dictionaryWithGraphToIdentityMapping
{
  id v2;
  void *v3;
  id v4;
  _QWORD v6[4];
  id v7;

  v2 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v3 = *(void **)(a1 + 8);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __62__BKEventDeferringGraph__dictionaryWithGraphToIdentityMapping__block_invoke;
  v6[3] = &unk_1E81F7748;
  v4 = v2;
  v7 = v4;
  objc_msgSend(v3, "enumerateKeysAndObjectsUsingBlock:", v6);

  return v4;
}

void __42__BKEventDeferringGraph_logGraphToTarget___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id *v14;

  v5 = a3;
  v6 = a2;
  v14 = (id *)-[BKGraphDescription initWithTopLevelCount:target:]([BKGraphDescription alloc], 1, *(void **)(a1 + 32));
  -[BKEventDeferringGraph _aggregateIdentitiesLabel:](*(_QWORD *)(a1 + 40), v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[BKGraphDescription appendNode:](v14, CFSTR("(%@)"), v8, v9, v10, v11, v12, v13, (uint64_t)v7);
  objc_msgSend(v6, "appendGraphDescription:", v14);

  objc_msgSend(*(id *)(a1 + 32), "writeString:", CFSTR("\n"));
}

- (id)_aggregateIdentitiesLabel:(uint64_t)a1
{
  void *v2;
  void *v3;
  _QWORD v5[5];

  if (!a1)
    return 0;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __51__BKEventDeferringGraph__aggregateIdentitiesLabel___block_invoke;
  v5[3] = &unk_1E81F7770;
  v5[4] = a1;
  objc_msgSend(a2, "bs_map:", v5);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "componentsJoinedByString:", CFSTR("|"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id __51__BKEventDeferringGraph__aggregateIdentitiesLabel___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;
  void *v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = a2;
  v4 = v3;
  if (v2)
  {
    objc_msgSend(v3, "display");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "_isNullDisplay");

    if ((v6 & 1) != 0)
    {
      objc_msgSend(v4, "environment");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "description");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v9 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v4, "environment");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "display");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "stringWithFormat:", CFSTR("%@-%@"), v7, v10);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

void __62__BKEventDeferringGraph__dictionaryWithGraphToIdentityMapping__block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  id v5;
  id v6;

  v4 = *(void **)(a1 + 32);
  v5 = a3;
  v6 = a2;
  objc_msgSend(v4, "bs_addObject:toCollectionClass:forKey:", v6, objc_opt_class(), v5);

}

void __83__BKEventDeferringGraph_logConnectionDescriptionForDeferringRuleIdentity_toTarget___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5;
  id v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a2;
  v5 = *(_QWORD *)(a1 + 32);
  v6 = a3;
  v7 = objc_msgSend(v13, "containsDeferringRuleIdentity:", v5);
  v8 = (void *)MEMORY[0x1E0CB3940];
  v9 = *(void **)(a1 + 40);
  -[BKEventDeferringGraph _aggregateIdentitiesLabel:](*(_QWORD *)(a1 + 48), v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(v8, "stringWithFormat:", CFSTR("%@\n"), v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "writeString:", v11);

    objc_msgSend(v13, "logConnectionDescriptionForDeferringRuleIdentity:toTarget:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
    objc_msgSend(*(id *)(a1 + 40), "writeString:", CFSTR("\n"));
  }
  else
  {
    objc_msgSend(v8, "stringWithFormat:", CFSTR("not in %@\n"), v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "writeString:", v12);

  }
}

uint64_t __45__BKEventDeferringGraph_processDidTerminate___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "setActiveUIResponderTokens:forPID:", MEMORY[0x1E0C9AA60], *(unsigned int *)(a1 + 32));
}

- (void)setActiveUIResponderPredicates:(int)a3 forPID:
{
  id v5;
  _QWORD v6[5];
  int v7;

  if (a1)
  {
    objc_msgSend(a2, "bs_dictionaryByPartitioning:", &__block_literal_global_2303);
    v5 = (id)objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __63__BKEventDeferringGraph_setActiveUIResponderPredicates_forPID___block_invoke_2;
    v6[3] = &unk_1E81F7888;
    v6[4] = a1;
    v7 = a3;
    objc_msgSend(v5, "enumerateKeysAndObjectsUsingBlock:", v6);

  }
}

void __63__BKEventDeferringGraph_setActiveUIResponderPredicates_forPID___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  id v7;

  v5 = a2;
  objc_msgSend(a3, "bs_compactMap:", &__block_literal_global_23);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "objectForKey:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setActiveUIResponderTokens:forPID:", v7, *(unsigned int *)(a1 + 40));
}

uint64_t __63__BKEventDeferringGraph_setActiveUIResponderPredicates_forPID___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "token");
}

id __63__BKEventDeferringGraph_setActiveUIResponderPredicates_forPID___block_invoke(uint64_t a1, void *a2)
{
  objc_class *v2;
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v2 = (objc_class *)MEMORY[0x1E0D00C90];
  v3 = a2;
  v4 = [v2 alloc];
  objc_msgSend(v3, "display");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "environment");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)objc_msgSend(v4, "initWithDisplay:environment:", v5, v6);
  return v7;
}

- (id)deferringPathForPID:(void *)a3 environment:(void *)a4 display:(void *)a5 dispatchTarget:
{
  objc_class *v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;

  if (a1)
  {
    v9 = (objc_class *)MEMORY[0x1E0D00C90];
    v10 = a5;
    v11 = a4;
    v12 = a3;
    v13 = (void *)objc_msgSend([v9 alloc], "initWithDisplay:environment:", v11, v12);

    objc_msgSend(*(id *)(a1 + 8), "objectForKey:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "deferringPathForPID:dispatchTarget:", a2, v10);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v15 = 0;
  }
  return v15;
}

void __43__BKEventDeferringGraph_setSenderDisplays___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;

  v5 = a3;
  -[BKEventDeferringGraph _setRules:forPID:toDisplay:](*(_QWORD *)(a1 + 32), v5, objc_msgSend(a2, "intValue"), *(void **)(a1 + 40));

}

- (void)_setRules:(int)a3 forPID:(void *)a4 toDisplay:
{
  id v7;
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  uint64_t v17;
  int v18;
  _QWORD v19[5];
  int v20;
  _QWORD v21[4];
  id v22;

  v7 = a4;
  if (a1)
  {
    v8 = MEMORY[0x1E0C809B0];
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __52__BKEventDeferringGraph__setRules_forPID_toDisplay___block_invoke;
    v21[3] = &unk_1E81F78D8;
    v13 = v7;
    v9 = v7;
    v22 = v9;
    objc_msgSend(a2, "bs_dictionaryByPartitioning:", v21);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = v8;
    v19[1] = 3221225472;
    v19[2] = __52__BKEventDeferringGraph__setRules_forPID_toDisplay___block_invoke_2;
    v19[3] = &unk_1E81F7888;
    v19[4] = a1;
    v20 = a3;
    objc_msgSend(v10, "enumerateKeysAndObjectsUsingBlock:", v19);
    v11 = (void *)objc_msgSend(*(id *)(a1 + 8), "copy");
    v14[0] = v8;
    v14[1] = 3221225472;
    v14[2] = __52__BKEventDeferringGraph__setRules_forPID_toDisplay___block_invoke_3;
    v14[3] = &unk_1E81F7900;
    v15 = v9;
    v16 = v10;
    v18 = a3;
    v17 = a1;
    v12 = v10;
    objc_msgSend(v11, "enumerateKeysAndObjectsUsingBlock:", v14);

    v7 = v13;
  }

}

id __52__BKEventDeferringGraph__setRules_forPID_toDisplay___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = a2;
  objc_msgSend(v3, "predicate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "display");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = _BKHIDEventDeferringDisplayMatch(v5, *(void **)(a1 + 32));

  if (v6)
  {
    objc_msgSend(v3, "predicate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "environment");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D00C90]), "initWithDisplay:environment:", *(_QWORD *)(a1 + 32), v8);
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

void __52__BKEventDeferringGraph__setRules_forPID_toDisplay___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  BKEventDeferringEnvironmentGraph *v6;
  BKEventDeferringEnvironmentGraph *v7;
  void *v8;
  id v9;

  v9 = a2;
  v5 = a3;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "objectForKey:", v9);
  v6 = (BKEventDeferringEnvironmentGraph *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    v7 = [BKEventDeferringEnvironmentGraph alloc];
    objc_msgSend(v9, "environment");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[BKEventDeferringEnvironmentGraph initWithEnvironment:](v7, "initWithEnvironment:", v8);

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "setObject:forKey:", v6, v9);
  }
  -[BKEventDeferringEnvironmentGraph setRules:forPID:](v6, "setRules:forPID:", v5, *(unsigned int *)(a1 + 40));

}

void __52__BKEventDeferringGraph__setRules_forPID_toDisplay___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a2;
  v5 = a3;
  objc_msgSend(v9, "display");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6 == *(void **)(a1 + 32))
  {
    objc_msgSend(*(id *)(a1 + 40), "objectForKey:", v9);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v8)
      objc_msgSend(v5, "setRules:forPID:", MEMORY[0x1E0C9AA60], *(unsigned int *)(a1 + 56));
  }
  else
  {

  }
  if (objc_msgSend(v5, "isEmpty"))
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 8), "removeObjectForKey:", v9);

}

@end
