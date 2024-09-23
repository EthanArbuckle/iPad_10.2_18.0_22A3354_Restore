@implementation FBKBugFormStub

+ (id)bugFormStubsMatchingBuild:(id)a3 forPlatform:(id)a4 withStubs:(id)a5
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  uint64_t v22;
  void *v23;
  unint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  NSObject *v28;
  void *v29;
  void *v31;
  id v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  uint8_t buf[4];
  void *v38;
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  v32 = a3;
  v7 = a4;
  v8 = a5;
  v31 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEF0]), "initWithCapacity:", objc_msgSend(v8, "count"));
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v9 = v8;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v33, v39, 16);
  if (v10)
  {
    v11 = v10;
    v12 = 0;
    v13 = *(_QWORD *)v34;
LABEL_3:
    v14 = 0;
    while (1)
    {
      if (*(_QWORD *)v34 != v13)
        objc_enumerationMutation(v9);
      v15 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * v14);
      if (objc_msgSend(v15, "forcePicker", v31))
      {
        +[FBKLog appHandle](FBKLog, "appHandle");
        v28 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v15, "ID");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v38 = v29;
          _os_log_impl(&dword_21D9A9000, v28, OS_LOG_TYPE_DEFAULT, "Found form ID [%{public}@] with always_show_picker = true; forcing picker.",
            buf,
            0xCu);

        }
        v27 = 0;
        v26 = v31;
        goto LABEL_25;
      }
      if (v7)
      {
        objc_msgSend(v15, "platform");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v16, "isEqualToString:", v7);

        if (!v17)
          goto LABEL_18;
      }
      objc_msgSend(v15, "buildPrefix");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v18, "length"))
        break;
      objc_msgSend(v15, "buildPrefix");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v32, "hasPrefix:", v19);

      if (!v20)
        goto LABEL_15;
      objc_msgSend(v15, "buildPrefix");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v21, "length");

      if (v22 != v12)
      {
        objc_msgSend(v15, "buildPrefix");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = objc_msgSend(v23, "length");

        if (v24 > v12)
        {
          objc_msgSend(v31, "removeAllObjects");
          objc_msgSend(v31, "addObject:", v15);
          objc_msgSend(v15, "buildPrefix");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = objc_msgSend(v25, "length");

        }
        goto LABEL_18;
      }
LABEL_17:
      objc_msgSend(v31, "addObject:", v15);
LABEL_18:
      if (v11 == ++v14)
      {
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v33, v39, 16);
        if (v11)
          goto LABEL_3;
        goto LABEL_20;
      }
    }

LABEL_15:
    if (!v7 || v12)
      goto LABEL_18;
    goto LABEL_17;
  }
LABEL_20:

  v26 = v31;
  if (objc_msgSend(v31, "count"))
  {
    objc_msgSend(MEMORY[0x24BDBCF20], "setWithSet:", v31);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v27 = 0;
  }
LABEL_25:

  return v27;
}

+ (id)bugFormStubsMatchingBuild:(id)a3 withStubs:(id)a4
{
  return (id)objc_msgSend(a1, "bugFormStubsMatchingBuild:forPlatform:withStubs:", a3, 0, a4);
}

+ (id)sortDescriptor
{
  if (sortDescriptor_onceToken != -1)
    dispatch_once(&sortDescriptor_onceToken, &__block_literal_global_2);
  return (id)sortDescriptor__sortDescriptor;
}

void __32__FBKBugFormStub_sortDescriptor__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  _QWORD v5[4];

  v5[3] = *MEMORY[0x24BDAC8D0];
  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C0]), "initWithKey:ascending:", CFSTR("priority"), 1);
  v1 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C0]), "initWithKey:ascending:", CFSTR("platform"), 1, v0);
  v5[1] = v1;
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C0]), "initWithKey:ascending:", CFSTR("name"), 1);
  v5[2] = v2;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v5, 3);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)sortDescriptor__sortDescriptor;
  sortDescriptor__sortDescriptor = v3;

}

+ (id)entityName
{
  return CFSTR("BugFormStub");
}

+ (id)uniquingKey
{
  return CFSTR("signature");
}

- (void)setPropertiesFromJSONObject:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;

  v30 = a3;
  -[FBKManagedLocalIDObject setPropertiesForLocalIDKeys:](self, "setPropertiesForLocalIDKeys:", v30);
  objc_msgSend(v30, "objectForKeyedSubscript:", CFSTR("build_prefix"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  FBKNilIfNSNull(v4);
  v5 = objc_claimAutoreleasedReturnValue();

  if (v5)
    -[FBKBugFormStub setBuildPrefix:](self, "setBuildPrefix:", v5);
  objc_msgSend(v30, "objectForKeyedSubscript:", CFSTR("description"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  FBKNilIfNSNull(v6);
  v7 = objc_claimAutoreleasedReturnValue();

  if (v7)
    -[FBKBugFormStub setFormDescription:](self, "setFormDescription:", v7);
  objc_msgSend(v30, "objectForKeyedSubscript:", CFSTR("name"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  FBKNilIfNSNull(v8);
  v9 = objc_claimAutoreleasedReturnValue();

  if (v9)
    -[FBKBugFormStub setName:](self, "setName:", v9);
  objc_msgSend(v30, "objectForKeyedSubscript:", CFSTR("platform"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  FBKNilIfNSNull(v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
    -[FBKBugFormStub setPlatform:](self, "setPlatform:", v11);
  objc_msgSend(v30, "objectForKeyedSubscript:", CFSTR("priority"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  FBKNilIfNSNull(v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
    v14 = v13;
  else
    v14 = &unk_24E18CA28;
  -[FBKBugFormStub setPriority:](self, "setPriority:", v14);
  objc_msgSend(v30, "objectForKeyedSubscript:", CFSTR("plugins"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  FBKNilIfNSNull(v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v16, "ded_selectItemsPassingTest:", &__block_literal_global_22);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[FBKBugFormStub setPluginIDs:](self, "setPluginIDs:", v17);

    }
  }
  objc_msgSend(v30, "objectForKeyedSubscript:", CFSTR("signature"), v9);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  FBKNilIfNSNull(v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
  {
    if (objc_msgSend(v19, "length"))
      v20 = v19;
    else
      v20 = 0;
    -[FBKBugFormStub setSignature:](self, "setSignature:", v20);
  }
  v21 = (void *)v7;
  objc_msgSend(v30, "objectForKeyedSubscript:", CFSTR("always_show_picker"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  FBKNilIfNSNull(v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  v24 = (void *)v5;
  if (v23)
    v25 = objc_msgSend(v23, "BOOLValue");
  else
    v25 = 0;
  -[FBKBugFormStub setForcePicker:](self, "setForcePicker:", v25);
  objc_msgSend(v30, "objectForKeyedSubscript:", CFSTR("tat"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  FBKNilIfNSNull(v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  if (v27)
  {
    if (objc_msgSend(v27, "length"))
      v28 = v27;
    else
      v28 = 0;
    -[FBKBugFormStub setTat:](self, "setTat:", v28);
  }

}

uint64_t __46__FBKBugFormStub_setPropertiesFromJSONObject___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (id)signatureDescription
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x24BDD17C8];
  -[FBKManagedLocalIDObject ID](self, "ID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "intValue");
  -[FBKBugFormStub pluginIDs](self, "pluginIDs");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "componentsJoinedByString:", CFSTR(","));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[FBKBugFormStub signature](self, "signature");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("Stub [%i] <%@:%@>"), v5, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)preferredTeamForStubPreferringTeam:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  int v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  id v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  id v23;
  NSObject *v24;
  void *v25;
  uint64_t v26;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint8_t v32[128];
  uint8_t buf[4];
  uint64_t v34;
  __int16 v35;
  uint64_t v36;
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[FBKBugFormStub teams](self, "teams");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (!v6)
  {
    v7 = (void *)MEMORY[0x24BDBCE88];
    v8 = *MEMORY[0x24BDBCAB0];
    -[FBKManagedLocalIDObject ID](self, "ID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "raise:format:", v8, CFSTR("Form stub [%lu] belongs to no teams."), objc_msgSend(v9, "unsignedIntegerValue"));

  }
  if (v4
    && (-[FBKBugFormStub teams](self, "teams"),
        v10 = (void *)objc_claimAutoreleasedReturnValue(),
        v11 = objc_msgSend(v10, "containsObject:", v4),
        v10,
        v11))
  {
    +[FBKLog model](FBKLog, "model");
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      -[FBKManagedLocalIDObject ID](self, "ID");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "integerValue");
      objc_msgSend(v4, "ID");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218240;
      v34 = v14;
      v35 = 2048;
      v36 = objc_msgSend(v15, "integerValue");
      _os_log_impl(&dword_21D9A9000, v12, OS_LOG_TYPE_DEFAULT, "Preferred team for stub [%ld] with ID: [%ld]", buf, 0x16u);

    }
    v16 = v4;
  }
  else
  {
    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    -[FBKBugFormStub teams](self, "teams");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v29;
      while (2)
      {
        for (i = 0; i != v19; ++i)
        {
          if (*(_QWORD *)v29 != v20)
            objc_enumerationMutation(v17);
          v22 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
          if (!objc_msgSend(v22, "teamType"))
          {
            +[FBKLog model](FBKLog, "model");
            v24 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
            {
              -[FBKManagedLocalIDObject ID](self, "ID");
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              v26 = objc_msgSend(v25, "integerValue");
              *(_DWORD *)buf = 134217984;
              v34 = v26;
              _os_log_impl(&dword_21D9A9000, v24, OS_LOG_TYPE_DEFAULT, "Preferred team for stub [%ld] unavailable, choosing personal team", buf, 0xCu);

            }
            v23 = v22;
            goto LABEL_20;
          }
        }
        v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
        if (v19)
          continue;
        break;
      }
    }

    -[FBKBugFormStub teams](self, "teams");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "anyObject");
    v23 = (id)objc_claimAutoreleasedReturnValue();
LABEL_20:
    v16 = v23;

  }
  return v16;
}

- (NSSet)stubsWithMatchingID
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  -[FBKBugFormStub user](self, "user");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bugFormStubs");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x24BDD1758];
  -[FBKBugFormStub serverID](self, "serverID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "predicateWithFormat:", CFSTR("serverID == %@"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "filteredSetUsingPredicate:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v8;
}

- (NSSet)teamsMatchingFormID
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  -[FBKBugFormStub stubsWithMatchingID](self, "stubsWithMatchingID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x24BDBCEF0];
  -[FBKBugFormStub user](self, "user");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "teams");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setWithCapacity:", objc_msgSend(v6, "count"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v8 = v3;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v17;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v17 != v11)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * v12), "teams", (_QWORD)v16);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "unionSet:", v13);

        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v10);
  }

  objc_msgSend(MEMORY[0x24BDBCF20], "setWithSet:", v7);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v14;
}

- (id)debugDescription
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[FBKManagedLocalIDObject ID](self, "ID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[FBKBugFormStub signature](self, "signature");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@: %@ - %@"), v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)predicateForStub:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("self = %@"), a3);
}

+ (id)predicateForTeam:(id)a3
{
  id v3;
  const __CFString *v4;
  void *v5;

  v3 = a3;
  if (+[FBKSharedConstants listsFormsFetchedByTat](FBKSharedConstants, "listsFormsFetchedByTat"))
    v4 = CFSTR("%@ IN teams");
  else
    v4 = CFSTR("%@ IN teams AND self.wasFetchedByTat == NO");
  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", v4, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)predicateForAllStubs
{
  if (+[FBKSharedConstants listsFormsFetchedByTat](FBKSharedConstants, "listsFormsFetchedByTat"))
    objc_msgSend(MEMORY[0x24BDD1758], "predicateWithValue:", 1);
  else
    objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("self.wasFetchedByTat == NO"));
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)fetchRequest
{
  return (id)objc_msgSend(MEMORY[0x24BDBB678], "fetchRequestWithEntityName:", CFSTR("BugFormStub"));
}

@end
