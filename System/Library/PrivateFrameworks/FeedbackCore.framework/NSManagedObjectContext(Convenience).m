@implementation NSManagedObjectContext(Convenience)

- (id)feedbackObjectWithEntityName:()Convenience remoteID:creatingIfNeeded:
{
  id v8;
  id v9;
  uint64_t v10;
  void *v11;

  v8 = a3;
  v9 = a4;
  objc_msgSend(a1, "findFeedbackObjectWithEntityName:remoteID:", v8, v9);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)v10;
  if (a5 && !v10)
  {
    objc_msgSend(a1, "createFeedbackObjectWithEntityName:remoteID:", v8, v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v11;
}

- (id)createFeedbackObjectWithEntityName:()Convenience remoteID:
{
  void *v6;
  id v7;
  void *v8;

  v6 = (void *)MEMORY[0x24BDBB658];
  v7 = a4;
  objc_msgSend(v6, "insertNewObjectForEntityForName:inManagedObjectContext:", a3, a1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setValue:forKey:", v7, CFSTR("remoteID"));

  return v8;
}

- (id)findFeedbackObjectWithEntityName:()Convenience remoteID:
{
  id v6;
  objc_class *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  NSObject *v15;
  id v17;

  v6 = a4;
  v7 = (objc_class *)MEMORY[0x24BDBB678];
  v8 = a3;
  v9 = (void *)objc_msgSend([v7 alloc], "initWithEntityName:", v8);
  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("remoteID = %@"), v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setPredicate:", v10);

  objc_msgSend(v9, "setFetchLimit:", 1);
  objc_msgSend(a1, "tryFindingObjectInContextWithID:andEntityName:", v6, v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    v12 = v11;
    v13 = 0;
    v14 = 0;
  }
  else
  {
    v17 = 0;
    objc_msgSend(a1, "executeFetchRequest:error:", v9, &v17);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v17;
    if (v13)
    {
      +[FBKLog appHandle](FBKLog, "appHandle");
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        -[NSManagedObjectContext(Convenience) findFeedbackObjectWithEntityName:remoteID:].cold.1(v6);

    }
    if (objc_msgSend(v14, "count"))
    {
      objc_msgSend(v14, "objectAtIndexedSubscript:", 0);
      v12 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v12 = 0;
    }
  }

  return v12;
}

- (id)findLocalIDFeedbackObjectsWithEntityName:()Convenience serverID:
{
  id v6;
  objc_class *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  NSObject *v13;
  id v15;

  v6 = a4;
  v7 = (objc_class *)MEMORY[0x24BDBB678];
  v8 = a3;
  v9 = (void *)objc_msgSend([v7 alloc], "initWithEntityName:", v8);

  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("serverID = %@"), v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setPredicate:", v10);

  v15 = 0;
  objc_msgSend(a1, "executeFetchRequest:error:", v9, &v15);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v15;
  if (v12)
  {
    +[FBKLog appHandle](FBKLog, "appHandle");
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      -[NSManagedObjectContext(Convenience) findLocalIDFeedbackObjectsWithEntityName:serverID:].cold.1(v6);

  }
  return v11;
}

- (id)tryFindingObjectInContextWithID:()Convenience andEntityName:
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  id v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  id v20;
  char v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v20 = a4;
  if (v6)
  {
    objc_msgSend(a1, "registeredObjects");
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v7 = (id)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v23;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v23 != v10)
            objc_enumerationMutation(v7);
          v12 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
          if ((objc_msgSend(v12, "isFault", v20) & 1) == 0 && (objc_msgSend(v12, "isDeleted") & 1) == 0)
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v13 = v12;
              objc_msgSend(v13, "ID");
              v14 = objc_claimAutoreleasedReturnValue();
              if (v14)
              {
                v15 = (void *)v14;
                objc_msgSend(v13, "ID");
                v16 = (void *)objc_claimAutoreleasedReturnValue();
                if ((objc_msgSend(v16, "isEqualToNumber:", v6) & 1) != 0)
                {
                  objc_msgSend(v13, "entityName");
                  v17 = v6;
                  v18 = (void *)objc_claimAutoreleasedReturnValue();
                  v21 = objc_msgSend(v18, "isEqualToString:", v20);

                  v6 = v17;
                  if ((v21 & 1) != 0)
                    goto LABEL_19;
                }
                else
                {

                }
              }

            }
          }
        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      }
      while (v9);
    }
    v13 = 0;
LABEL_19:

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (id)feedbackObjectsWithEntityName:()Convenience remoteIDs:creatingIfNeeded:
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  id v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  objc_msgSend(a1, "findFeedbackObjectsWithEntityName:remoteIDs:", v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (a5 && (v12 = objc_msgSend(v10, "count"), v12 != objc_msgSend(v9, "count")))
  {
    v29 = v9;
    v14 = (void *)objc_msgSend(v9, "mutableCopy");
    v15 = (void *)objc_msgSend(v11, "mutableCopy");
    v34 = 0u;
    v35 = 0u;
    v36 = 0u;
    v37 = 0u;
    v16 = v11;
    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v35;
      do
      {
        v20 = 0;
        do
        {
          if (*(_QWORD *)v35 != v19)
            objc_enumerationMutation(v16);
          objc_msgSend(*(id *)(*((_QWORD *)&v34 + 1) + 8 * v20), "remoteID");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "removeObject:", v21);

          ++v20;
        }
        while (v18 != v20);
        v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
      }
      while (v18);
    }

    v32 = 0u;
    v33 = 0u;
    v30 = 0u;
    v31 = 0u;
    v22 = v14;
    v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
    if (v23)
    {
      v24 = v23;
      v25 = *(_QWORD *)v31;
      do
      {
        v26 = 0;
        do
        {
          if (*(_QWORD *)v31 != v25)
            objc_enumerationMutation(v22);
          objc_msgSend(a1, "createFeedbackObjectWithEntityName:remoteID:", v8, *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * v26));
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "addObject:", v27);

          ++v26;
        }
        while (v24 != v26);
        v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
      }
      while (v24);
    }

    v13 = (id)objc_msgSend(v15, "copy");
    v9 = v29;
  }
  else
  {
    v13 = v11;
  }

  return v13;
}

- (id)findFeedbackObjectsWithEntityName:()Convenience remoteIDs:
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  NSObject *v24;
  id v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEF0]), "initWithCapacity:", objc_msgSend(v7, "count"));
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEF0]), "initWithCapacity:", objc_msgSend(v7, "count"));
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v10 = v7;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v28;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v28 != v13)
          objc_enumerationMutation(v10);
        v15 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
        objc_msgSend(a1, "tryFindingObjectInContextWithID:andEntityName:", v15, v6);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        if (v16)
        {
          v17 = v9;
          v18 = v16;
        }
        else
        {
          v17 = v8;
          v18 = v15;
        }
        objc_msgSend(v17, "addObject:", v18);

      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    }
    while (v12);
  }

  if (objc_msgSend(v8, "count"))
  {
    v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBB678]), "initWithEntityName:", v6);
    objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("remoteID IN %@"), v8);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setPredicate:", v20);

    v26 = 0;
    objc_msgSend(a1, "executeFetchRequest:error:", v19, &v26);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = v26;

    if (v21)
    {
      objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", v21);
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_16;
    }
  }
  else
  {
    v22 = 0;
  }
  v23 = (void *)objc_opt_new();
LABEL_16:
  objc_msgSend(v9, "unionSet:", v23);
  if (v22)
  {
    +[FBKLog model](FBKLog, "model");
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      -[NSManagedObjectContext(Convenience) findFeedbackObjectsWithEntityName:remoteIDs:].cold.1((uint64_t)v22, v24);

  }
  return v9;
}

- (void)findFeedbackObjectWithEntityName:()Convenience remoteID:.cold.1(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  objc_msgSend(a1, "intValue");
  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_0_5(&dword_21D9A9000, v1, v2, "Error finding feedbackObject with ID [%i] error [%@]", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_2_1();
}

- (void)findLocalIDFeedbackObjectsWithEntityName:()Convenience serverID:.cold.1(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  objc_msgSend(a1, "intValue");
  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_0_5(&dword_21D9A9000, v1, v2, "Error finding feedbackObjects with ID [%i] error [%@]", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_2_1();
}

- (void)findFeedbackObjectsWithEntityName:()Convenience remoteIDs:.cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_21D9A9000, a2, OS_LOG_TYPE_ERROR, "Error finding objects in bulk %@", (uint8_t *)&v2, 0xCu);
}

@end
