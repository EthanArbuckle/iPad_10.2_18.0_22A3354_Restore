@implementation FBKTeam

+ (id)personalTeamForUser:(id)a3 inContext:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  NSObject *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  NSObject *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  id v30;
  uint8_t buf[16];

  v6 = a3;
  v7 = a4;
  objc_msgSend(a1, "entityName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "feedbackObjectWithEntityName:remoteID:creatingIfNeeded:", v8, &unk_24E18CAD0, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "permissions");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "canDelete");

  if ((v11 & 1) != 0)
  {
    if (v9)
    {
LABEL_12:
      v14 = v9;
      v28 = v14;
      goto LABEL_13;
    }
  }
  else
  {
    +[FBKLog appHandle](FBKLog, "appHandle");
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21D9A9000, v12, OS_LOG_TYPE_DEFAULT, "Personal team has stale permissions. Reseting", buf, 2u);
    }

  }
  objc_msgSend(a1, "entityName");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "feedbackObjectWithEntityName:remoteID:creatingIfNeeded:", v13, &unk_24E18CAD0, 1);
  v14 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("PERSONAL_TEAM_TITLE"), &stru_24E15EAF8, CFSTR("CommonStrings"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setName:", v16);

  objc_msgSend(v14, "setRoleEnum:", 2);
  objc_msgSend(v14, "setTeamTypeEnum:", 0);
  objc_msgSend(v14, "setUser:", v6);
  +[FBKTeamPermissions personalTeamPermissions](FBKTeamPermissions, "personalTeamPermissions");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setPermissions:", v17);

  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", CFSTR("ORIGINATOR"), CFSTR("ASSIGNEE"), 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setStakeholders:", v18);

  objc_msgSend(v14, "setDidFetchFormItems:", 0);
  objc_msgSend(v14, "setTypeString:", 0);
  v30 = 0;
  objc_msgSend(v7, "save:", &v30);
  v19 = v30;
  if (!v19)
  {
    v9 = v14;
    goto LABEL_12;
  }
  v20 = v19;
  +[FBKLog appHandle](FBKLog, "appHandle");
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    +[FBKTeam personalTeamForUser:inContext:].cold.1((uint64_t)v20, v21, v22, v23, v24, v25, v26, v27);

  v28 = 0;
LABEL_13:

  return v28;
}

+ (id)entityName
{
  return CFSTR("Team");
}

- (void)setPropertiesFromJSONObject:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  FBKTeamPermissions *v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  NSObject *v27;
  NSObject *v28;
  void *v29;
  void *v30;
  FBKTeam *v31;
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
  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("name"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    -[FBKTeam setName:](self, "setName:", v5);
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("role_enum"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    v8 = objc_msgSend(v6, "unsignedIntegerValue");
    if ((unint64_t)(v8 - 1) >= 2)
      v9 = 1;
    else
      v9 = v8;
    -[FBKTeam setRoleEnum:](self, "setRoleEnum:", v9);
  }
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("type"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    -[FBKTeam setTypeString:](self, "setTypeString:", v10);
    -[FBKTeam setTeamTypeEnum:](self, "setTeamTypeEnum:", 1000);
  }
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("permissions"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    v12 = -[FBKTeamPermissions initWithJSONObject:]([FBKTeamPermissions alloc], "initWithJSONObject:", v11);
    -[FBKTeam setPermissions:](self, "setPermissions:", v12);

  }
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("stakeholders"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    v29 = v11;
    v30 = v10;
    v31 = self;
    v32 = v4;
    objc_msgSend(MEMORY[0x24BDBCEF0], "setWithCapacity:", 2);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = 0u;
    v34 = 0u;
    v35 = 0u;
    v36 = 0u;
    v15 = v13;
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v33, v39, 16);
    if (!v16)
      goto LABEL_27;
    v17 = v16;
    v18 = *(_QWORD *)v34;
    while (1)
    {
      for (i = 0; i != v17; ++i)
      {
        if (*(_QWORD *)v34 != v18)
          objc_enumerationMutation(v15);
        v20 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);
        objc_msgSend(v20, "uppercaseString");
        v21 = objc_claimAutoreleasedReturnValue();
        if ((-[NSObject isEqualToString:](v21, "isEqualToString:", CFSTR("ORIGINATOR")) & 1) != 0
          || (-[NSObject isEqualToString:](v21, "isEqualToString:", CFSTR("ASSIGNEE")) & 1) != 0)
        {
          if (v21)
          {
            objc_msgSend(v14, "addObject:", v21);
            goto LABEL_25;
          }
        }
        else
        {

        }
        +[FBKLog appHandle](FBKLog, "appHandle");
        v21 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543362;
          v38 = v20;
          _os_log_error_impl(&dword_21D9A9000, v21, OS_LOG_TYPE_ERROR, "Tried to parse [%{public}@] as stakeholder, but failed.", buf, 0xCu);
        }
LABEL_25:

      }
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v33, v39, 16);
      if (!v17)
      {
LABEL_27:

        objc_msgSend(MEMORY[0x24BDBCF20], "setWithSet:", v14);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        self = v31;
        -[FBKTeam setStakeholders:](v31, "setStakeholders:", v22);

        v4 = v32;
        v10 = v30;
        v11 = v29;
        break;
      }
    }
  }
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("status"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = v23;
  if (v23)
  {
    objc_msgSend(v23, "lowercaseString");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v25, "isEqualToString:", CFSTR("active")) & 1) != 0)
    {
      v26 = 0;
    }
    else if ((objc_msgSend(v25, "isEqualToString:", CFSTR("closed")) & 1) != 0
           || !objc_msgSend(v25, "isEqualToString:", CFSTR("disabled")))
    {
      v26 = 1;
    }
    else
    {
      +[FBKLog model](FBKLog, "model");
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
        -[FBKTeam setPropertiesFromJSONObject:].cold.2(v27);

      v26 = 2;
    }

    -[FBKTeam setStatusEnum:](self, "setStatusEnum:", v26);
    if (-[FBKTeam status](self, "status") == 2)
    {
      +[FBKLog model](FBKLog, "model");
      v28 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
        -[FBKTeam setPropertiesFromJSONObject:].cold.1(self, v28);

    }
  }

}

+ (id)sortDescriptors
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[5];

  v8[4] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD17C0], "sortDescriptorWithKey:ascending:", CFSTR("statusEnum"), 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v2;
  objc_msgSend(MEMORY[0x24BDD17C0], "sortDescriptorWithKey:ascending:", CFSTR("teamTypeEnum"), 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8[1] = v3;
  objc_msgSend(MEMORY[0x24BDD17C0], "sortDescriptorWithKey:ascending:", CFSTR("name"), 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[2] = v4;
  objc_msgSend(MEMORY[0x24BDD17C0], "sortDescriptorWithKey:ascending:", CFSTR("remoteID"), 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[3] = v5;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v8, 4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)hasContent
{
  void *v3;
  BOOL v4;
  void *v5;

  -[FBKTeam contentItems](self, "contentItems");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count"))
  {
    v4 = 1;
  }
  else
  {
    -[FBKTeam forms](self, "forms");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v5, "count") != 0;

  }
  return v4;
}

- (BOOL)canStartNewFeedback
{
  void *v3;
  BOOL v4;

  if (!-[FBKTeam didFetchFormItems](self, "didFetchFormItems"))
    return 0;
  -[FBKTeam forms](self, "forms");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count") != 0;

  return v4;
}

- (id)shortDescription
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  unint64_t v7;
  const __CFString *v8;
  void *v9;
  void *v10;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[FBKTeam remoteID](self, "remoteID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[FBKTeam teamType](self, "teamType");
  switch(v7)
  {
    case 1uLL:
      v8 = CFSTR("dev");
      break;
    case 2uLL:
      v8 = CFSTR("ent");
      break;
    case 3uLL:
      v8 = CFSTR("edu");
      break;
    case 4uLL:
      v8 = CFSTR("custom");
      break;
    default:
      if (v7 == 1000)
        v8 = CFSTR("unknown");
      else
        v8 = CFSTR("personal");
      break;
  }
  -[FBKTeam name](self, "name");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ ID: %@ type: %@ name: %@"), v5, v6, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (void)prepareForDeletion
{
  FBKTeam *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _UNKNOWN **v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  NSObject *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  NSObject *v18;
  FBKTeam *v19;
  _UNKNOWN **v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  objc_super v29;
  uint8_t buf[4];
  uint64_t v31;
  _BYTE v32[128];
  uint64_t v33;

  v2 = self;
  v33 = *MEMORY[0x24BDAC8D0];
  v29.receiver = self;
  v29.super_class = (Class)FBKTeam;
  -[FBKTeam prepareForDeletion](&v29, sel_prepareForDeletion);
  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  -[FBKTeam forms](v2, "forms");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v25, v32, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v26;
    v7 = &off_24E155000;
    v24 = v3;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v26 != v6)
          objc_enumerationMutation(v3);
        v9 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
        if ((objc_msgSend(v9, "isDeleted") & 1) == 0)
        {
          objc_msgSend(v9, "teams");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v10, "count") == 1
            && (objc_msgSend(v10, "anyObject"),
                v11 = (void *)objc_claimAutoreleasedReturnValue(),
                v12 = objc_msgSend(v11, "isEqual:", v2),
                v11,
                v12))
          {
            objc_msgSend(v7[379], "model");
            v13 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
            {
              objc_msgSend(v9, "ID");
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              v15 = objc_msgSend(v14, "integerValue");
              *(_DWORD *)buf = 134217984;
              v31 = v15;
              _os_log_impl(&dword_21D9A9000, v13, OS_LOG_TYPE_INFO, "Deleting form [%ld] because it belongs to no teams anymore.", buf, 0xCu);

            }
            -[FBKTeam managedObjectContext](v2, "managedObjectContext");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "deleteObject:", v9);
          }
          else
          {
            objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("isDeleted == NO"));
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v10, "filteredSetUsingPredicate:", v17);
            v16 = (void *)objc_claimAutoreleasedReturnValue();

            if (!objc_msgSend(v16, "count"))
            {
              objc_msgSend(v7[379], "model");
              v18 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
              {
                objc_msgSend(v9, "ID");
                v19 = v2;
                v20 = v7;
                v21 = (void *)objc_claimAutoreleasedReturnValue();
                v22 = objc_msgSend(v21, "integerValue");
                *(_DWORD *)buf = 134217984;
                v31 = v22;
                _os_log_impl(&dword_21D9A9000, v18, OS_LOG_TYPE_INFO, "Deleting form [%ld] because it belongs to no teams anymore or all of its teams are marked for deletion.", buf, 0xCu);

                v7 = v20;
                v2 = v19;
                v3 = v24;
              }

              -[FBKTeam managedObjectContext](v2, "managedObjectContext");
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v23, "deleteObject:", v9);

            }
          }

        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v25, v32, 16);
    }
    while (v5);
  }

}

- (id)teamFormStubMatchingFromFormStub:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  id v8;
  uint64_t v9;
  void *i;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = v4;
  if (!v4)
  {
    +[FBKLog model](FBKLog, "model");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[FBKTeam teamFormStubMatchingFromFormStub:].cold.1(v7, v15, v16, v17, v18, v19, v20, v21);
    goto LABEL_17;
  }
  objc_msgSend(v4, "serverID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    +[FBKLog model](FBKLog, "model");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[FBKTeam teamFormStubMatchingFromFormStub:].cold.2(v7, v22, v23, v24, v25, v26, v27, v28);
LABEL_17:
    v8 = 0;
    goto LABEL_18;
  }
  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  -[FBKTeam forms](self, "forms", 0);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (id)-[NSObject countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v31;
    while (2)
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v31 != v9)
          objc_enumerationMutation(v7);
        v11 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v11, "serverID");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "serverID");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v12, "isEqualToNumber:", v13);

        if ((v14 & 1) != 0)
        {
          v8 = v11;
          goto LABEL_18;
        }
      }
      v8 = (id)-[NSObject countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
      if (v8)
        continue;
      break;
    }
  }
LABEL_18:

  return v8;
}

+ (id)fetchRequest
{
  return (id)objc_msgSend(MEMORY[0x24BDBB678], "fetchRequestWithEntityName:", CFSTR("Team"));
}

+ (void)personalTeamForUser:(uint64_t)a3 inContext:(uint64_t)a4 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_2(&dword_21D9A9000, a2, a3, "Failed to save personal team to context: [%{public}@]", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_7();
}

- (void)setPropertiesFromJSONObject:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  void *v4;
  uint64_t v5;
  void *v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "ID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "integerValue");
  objc_msgSend(a1, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 134218242;
  v8 = v5;
  v9 = 2114;
  v10 = v6;
  _os_log_error_impl(&dword_21D9A9000, a2, OS_LOG_TYPE_ERROR, "Disabled team information: [%ld – %{public}@]", (uint8_t *)&v7, 0x16u);

}

- (void)setPropertiesFromJSONObject:(os_log_t)log .cold.2(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_21D9A9000, log, OS_LOG_TYPE_ERROR, "Got a disabled team. This is a server bug.", v1, 2u);
}

- (void)teamFormStubMatchingFromFormStub:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_2(&dword_21D9A9000, a1, a3, "FBKBugFormStub argument is nil in [%{public}s]", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_7();
}

- (void)teamFormStubMatchingFromFormStub:(uint64_t)a3 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_2(&dword_21D9A9000, a1, a3, "FBKBugFormStub.serverID argument is nil in [%{public}s]", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_7();
}

@end
