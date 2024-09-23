@implementation FBKManagedFeedbackObject

+ (id)importFromJSONObject:(id)a3 intoContext:(id)a4
{
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v6 = (void *)MEMORY[0x24BDD16E0];
  v7 = a4;
  v8 = a3;
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("id"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "numberWithInteger:", objc_msgSend(v9, "integerValue"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "entityName");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "feedbackObjectWithEntityName:remoteID:creatingIfNeeded:", v11, v10, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "setPropertiesFromJSONObject:", v8);
  return v12;
}

+ (id)importFromJSONArray:(id)a3 intoContext:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  void *v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  FBKArrayToIdDictionary(a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "entityName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "allKeys");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "feedbackObjectsWithEntityName:remoteIDs:creatingIfNeeded:", v8, v9, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v11 = v10;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v21 != v14)
          objc_enumerationMutation(v11);
        v16 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
        objc_msgSend(v16, "remoteID", (_QWORD)v20);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "objectForKeyedSubscript:", v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "setPropertiesFromJSONObject:", v18);

      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v13);
  }

  return v11;
}

+ (id)entityName
{
  objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB0], CFSTR("+entityName not implemented in %@"), objc_opt_class());
  return &stru_24E15EAF8;
}

- (id)entityName
{
  return (id)objc_msgSend((id)objc_opt_class(), "entityName");
}

- (void)setPropertiesFromJSONObject:(id)a3
{
  objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB0], CFSTR("setPropertiesFromJSONObject not implemented in %@"), objc_opt_class());
}

- (void)setID:(id)a3
{
  id v4;

  v4 = a3;
  -[FBKManagedFeedbackObject willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("ID"));
  -[FBKManagedFeedbackObject setRemoteID:](self, "setRemoteID:", v4);

  -[FBKManagedFeedbackObject didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("ID"));
}

- (BOOL)isEqualToFBKObject:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;

  v4 = a3;
  if (v4 && (v5 = (void *)objc_opt_class(), objc_msgSend(v5, "isSubclassOfClass:", objc_opt_class())))
  {
    -[FBKManagedFeedbackObject ID](self, "ID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "ID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "isEqual:", v7);

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

@end
