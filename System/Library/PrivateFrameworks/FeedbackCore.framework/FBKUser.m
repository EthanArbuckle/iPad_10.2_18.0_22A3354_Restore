@implementation FBKUser

+ (id)entityName
{
  return CFSTR("User");
}

+ (id)keyPathsForValuesAffectingOnlyPublic
{
  return (id)objc_opt_new();
}

+ (id)createUserFromUserLoginInfo:(id)a3 forEnvironment:(signed __int16)a4 inContext:(id)a5
{
  uint64_t v6;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v6 = a4;
  v27 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a5;
  objc_msgSend(a1, "entityName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "participantID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "feedbackObjectWithEntityName:remoteID:creatingIfNeeded:", v10, v11, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "username");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setUsername:", v13);

  objc_msgSend(v8, "givenName");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setGivenName:", v14);

  objc_msgSend(v8, "familyName");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setFamilyName:", v15);

  objc_msgSend(v12, "setEnvironment:", v6);
  objc_msgSend(v12, "setIsSystemAccount:", objc_msgSend(v8, "isSystemAccount"));
  objc_msgSend(v12, "setIsAppleConnectUser:", objc_msgSend(v8, "isAppleConnectLogin"));
  objc_msgSend(v12, "setDidFetchFormStubs:", 0);
  objc_msgSend(v12, "setDidFetchContentItems:", 0);
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  objc_msgSend(v12, "teams", 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v23;
    do
    {
      v20 = 0;
      do
      {
        if (*(_QWORD *)v23 != v19)
          objc_enumerationMutation(v16);
        objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * v20++), "setDidFetchFormItems:", 0);
      }
      while (v18 != v20);
      v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v18);
  }

  return v12;
}

- (BOOL)onlyPublic
{
  return 0;
}

- (id)draftFormResponseIDs
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  NSObject *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint8_t buf[8];
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  -[FBKUser formResponseContentItems](self, "formResponseContentItems");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = objc_alloc(MEMORY[0x24BDBCEF0]);
    -[FBKUser formResponseContentItems](self, "formResponseContentItems");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v4, "initWithCapacity:", objc_msgSend(v5, "count"));

    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    -[FBKUser formResponseContentItems](self, "formResponseContentItems", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v17;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v17 != v10)
            objc_enumerationMutation(v7);
          objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * i), "ID");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "addObject:", v12);

        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
      }
      while (v9);
    }

    objc_msgSend(MEMORY[0x24BDBCF20], "setWithSet:", v6);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    return v13;
  }
  else
  {
    +[FBKLog appHandle](FBKLog, "appHandle");
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21D9A9000, v15, OS_LOG_TYPE_INFO, "no items found, no form draft IDs", buf, 2u);
    }

    return (id)objc_opt_new();
  }
}

- (BOOL)isInAnyProgram
{
  void *v3;
  void *v4;
  uint64_t v5;
  NSObject *v7;
  uint8_t v8[16];

  -[FBKUser contentItems](self, "contentItems");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count"))
  {

    return 1;
  }
  -[FBKUser bugFormStubs](self, "bugFormStubs");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  if (v5)
    return 1;
  +[FBKLog appHandle](FBKLog, "appHandle");
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_21D9A9000, v7, OS_LOG_TYPE_DEFAULT, "User is not in any programs", v8, 2u);
  }

  return 0;
}

- (BOOL)hasForms
{
  void *v2;
  BOOL v3;

  -[FBKUser bugFormStubs](self, "bugFormStubs");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count") != 0;

  return v3;
}

- (BOOL)isUnauthenticatedUser
{
  void *v2;
  BOOL v3;

  -[FBKUser username](self, "username");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 == 0;

  return v3;
}

- (NSSet)managedTeams
{
  void *v2;
  void *v3;
  void *v4;

  -[FBKUser teams](self, "teams");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("teamTypeEnum != %@"), &unk_24E18CCF8);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "filteredSetUsingPredicate:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v4;
}

- (BOOL)hasManagedTeams
{
  void *v2;
  BOOL v3;

  -[FBKUser activeManagedTeams](self, "activeManagedTeams");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count") != 0;

  return v3;
}

- (BOOL)hasManyManagedTeams
{
  void *v2;
  BOOL v3;

  -[FBKUser activeManagedTeams](self, "activeManagedTeams");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (unint64_t)objc_msgSend(v2, "count") > 1;

  return v3;
}

- (NSSet)activeTeams
{
  void *v2;
  void *v3;
  void *v4;

  -[FBKUser teams](self, "teams");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("statusEnum == %@"), &unk_24E18CCF8);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "filteredSetUsingPredicate:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v4;
}

- (NSSet)activeManagedTeams
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BDBCEF0];
  -[FBKUser managedTeams](self, "managedTeams");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setWithSet:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[FBKUser activeTeams](self, "activeTeams");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "intersectSet:", v6);

  return (NSSet *)v5;
}

- (NSSet)teamsContainingContent
{
  void *v2;
  void *v3;
  void *v4;

  -[FBKUser teams](self, "teams");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("hasContent == YES"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "filteredSetUsingPredicate:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v4;
}

- (NSString)fullName
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  if (fullName_onceToken_0 != -1)
    dispatch_once(&fullName_onceToken_0, &__block_literal_global_42);
  v3 = objc_alloc_init(MEMORY[0x24BDD1730]);
  -[FBKUser familyName](self, "familyName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setFamilyName:", v4);

  -[FBKUser givenName](self, "givenName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setGivenName:", v5);

  objc_msgSend((id)fullName_nameFormatter, "stringFromPersonNameComponents:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

void __19__FBKUser_fullName__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x24BDD1738]);
  v1 = (void *)fullName_nameFormatter;
  fullName_nameFormatter = (uint64_t)v0;

}

- (id)uniqueFormStubsWithPreferredTeam:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  v5 = (void *)objc_opt_class();
  -[FBKUser bugFormStubs](self, "bugFormStubs");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "uniqueFormStubsWithPreferredTeam:withForms:", v4, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)uniqueFormStubsWithPreferredTeam:(id)a3 withForms:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithCapacity:", objc_msgSend(v6, "count"));
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v8 = v6;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v24 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
        objc_msgSend(v13, "ID", (_QWORD)v23);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "objectForKey:", v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v15
          || (objc_msgSend(v13, "teams"),
              v16 = (void *)objc_claimAutoreleasedReturnValue(),
              v17 = objc_msgSend(v16, "containsObject:", v5),
              v16,
              v17))
        {
          objc_msgSend(v13, "ID");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "setObject:forKey:", v13, v18);

        }
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v10);
  }

  v19 = (void *)MEMORY[0x24BDBCF20];
  objc_msgSend(v7, "allValues");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setWithArray:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  return v21;
}

- (id)bugFormStubsForPickerWithPredicate:(id)a3 team:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  NSObject *v12;
  NSObject *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  int v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[FBKUser bugFormStubs](self, "bugFormStubs");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count");

  if (v9)
  {
    if (!v6)
    {
      +[FBKLog model](FBKLog, "model");
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
        -[FBKUser bugFormStubsForPickerWithPredicate:team:].cold.3(v10);

      objc_msgSend(MEMORY[0x24BDD1758], "predicateWithValue:", 0);
      v6 = (id)objc_claimAutoreleasedReturnValue();
    }
    -[FBKUser bugFormStubs](self, "bugFormStubs");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "filteredSetUsingPredicate:", v6);
    v12 = objc_claimAutoreleasedReturnValue();

    +[FBKLog appHandle](FBKLog, "appHandle");
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      -[FBKUser bugFormStubsForPickerWithPredicate:team:].cold.2(v12, v13);

    objc_msgSend((id)objc_opt_class(), "uniqueFormStubsWithPreferredTeam:withForms:", v7, v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    +[FBKLog appHandle](FBKLog, "appHandle");
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v14, "valueForKeyPath:", CFSTR("debugDescription"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = 138412290;
      v22 = v16;
      _os_log_impl(&dword_21D9A9000, v15, OS_LOG_TYPE_INFO, "Showing stubs in picker: %@", (uint8_t *)&v21, 0xCu);

    }
    objc_msgSend(v14, "allObjects");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    +[FBKBugFormStub sortDescriptor](FBKBugFormStub, "sortDescriptor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "sortedArrayUsingDescriptors:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    +[FBKLog model](FBKLog, "model");
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      -[FBKUser bugFormStubsForPickerWithPredicate:team:].cold.1(v12);
    v19 = (void *)MEMORY[0x24BDBD1A8];
  }

  return v19;
}

- (void)bugFormStubsForPickerWithPredicate:(os_log_t)log team:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_21D9A9000, log, OS_LOG_TYPE_ERROR, "bugFormStubsForPickerWithPredicate found no stubs", v1, 2u);
}

- (void)bugFormStubsForPickerWithPredicate:(void *)a1 team:(NSObject *)a2 .cold.2(void *a1, NSObject *a2)
{
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "valueForKeyPath:", CFSTR("debugDescription"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 138412290;
  v5 = v3;
  _os_log_debug_impl(&dword_21D9A9000, a2, OS_LOG_TYPE_DEBUG, "Predicate filtered stubs: %@", (uint8_t *)&v4, 0xCu);

}

- (void)bugFormStubsForPickerWithPredicate:(os_log_t)log team:.cold.3(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_21D9A9000, log, OS_LOG_TYPE_FAULT, "bugFormStubsForPickerWithPredicate: called with nil predicate, defaulting to none predicate.", v1, 2u);
}

@end
