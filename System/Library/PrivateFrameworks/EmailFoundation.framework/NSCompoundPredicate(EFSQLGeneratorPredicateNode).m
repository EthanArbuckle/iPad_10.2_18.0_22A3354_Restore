@implementation NSCompoundPredicate(EFSQLGeneratorPredicateNode)

- (EFSQLGeneratorCompoundPredicateNode)predicateNodeFromPropertyMapper:()EFSQLGeneratorPredicateNode addingTablesUsed:
{
  id v6;
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  EFSQLGeneratorCompoundPredicateNode *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  objc_msgSend(a1, "subpredicates", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v17;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v17 != v11)
          objc_enumerationMutation(v9);
        objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * v12), "predicateNodeFromPropertyMapper:addingTablesUsed:", v6, v7);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "addObject:", v13);

        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v10);
  }

  v14 = -[EFSQLGeneratorCompoundPredicateNode initWithPredicateType:childPredicates:]([EFSQLGeneratorCompoundPredicateNode alloc], "initWithPredicateType:childPredicates:", objc_msgSend(a1, "compoundPredicateType"), v8);
  return v14;
}

@end
