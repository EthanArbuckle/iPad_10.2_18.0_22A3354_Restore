@implementation MGGroup

- (MGGroup)initWithClientService:(id)a3 type:(id)a4 identifier:(id)a5 name:(id)a6 properties:(id)a7 memberIdentifiers:(id)a8
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  MGGroup *v21;
  MGGroup *v22;
  uint64_t v23;
  NSString *type;
  uint64_t v25;
  NSString *name;
  uint64_t v27;
  void *v28;
  void *v29;
  uint64_t v30;
  NSArray *memberIdentifiers;
  NSObject *v32;
  objc_super v34;
  uint8_t buf[4];
  MGGroup *v36;
  __int16 v37;
  id v38;
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a6;
  v19 = a7;
  v20 = a8;
  v34.receiver = self;
  v34.super_class = (Class)MGGroup;
  v21 = -[MGGroup init](&v34, sel_init);
  v22 = v21;
  if (v21)
  {
    objc_storeStrong((id *)&v21->_service, a3);
    v23 = objc_msgSend(v16, "copy");
    type = v22->_type;
    v22->_type = (NSString *)v23;

    objc_storeStrong((id *)&v22->_identifier, a5);
    v25 = objc_msgSend(v18, "copy");
    name = v22->_name;
    v22->_name = (NSString *)v25;

    v27 = objc_msgSend(v19, "copy");
    v28 = (void *)v27;
    if (v27)
      v29 = (void *)v27;
    else
      v29 = (void *)MEMORY[0x24BDBD1B8];
    objc_storeStrong((id *)&v22->_properties, v29);

    v30 = objc_msgSend(v20, "copy");
    memberIdentifiers = v22->_memberIdentifiers;
    v22->_memberIdentifiers = (NSArray *)v30;

    MGLogForCategory(0);
    v32 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218240;
      v36 = v22;
      v37 = 2048;
      v38 = v15;
      _os_log_impl(&dword_2172B2000, v32, OS_LOG_TYPE_DEFAULT, "%p group initializing with service %p", buf, 0x16u);
    }

  }
  return v22;
}

- (MGGroup)initWithConnectionProvider:(id)a3 type:(id)a4 identifier:(id)a5 name:(id)a6 properties:(id)a7 memberIdentifiers:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  MGGroup *v21;

  v14 = a8;
  v15 = a7;
  v16 = a6;
  v17 = a5;
  v18 = a4;
  v19 = a3;
  objc_msgSend((id)objc_opt_class(), "clientServiceWithConnectionProvider:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  v21 = -[MGGroup initWithClientService:type:identifier:name:properties:memberIdentifiers:](self, "initWithClientService:type:identifier:name:properties:memberIdentifiers:", v20, v18, v17, v16, v15, v14);
  return v21;
}

- (MGGroup)initWithCoder:(id)a3
{
  id v4;
  MGGroup *v5;
  uint64_t v6;
  uint64_t v7;
  NSString *type;
  uint64_t v9;
  NSString *name;
  uint64_t v11;
  MGGroupIdentifier *identifier;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  NSArray *memberIdentifiers;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  NSDictionary *properties;
  void *v26;
  uint64_t v27;
  MGGroupIdentifier *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  void *v33;
  MGGroupIdentifier *v34;
  MGGroupIdentifier *v35;
  void *v36;
  uint64_t v37;
  NSArray *v38;
  MGGroup *v39;
  objc_super v41;

  v4 = a3;
  v41.receiver = self;
  v41.super_class = (Class)MGGroup;
  v5 = -[MGGroup init](&v41, sel_init);
  if (v5)
  {
    v6 = objc_opt_class();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v6, CFSTR("com.apple.MediaGroups.type"));
    v7 = objc_claimAutoreleasedReturnValue();
    type = v5->_type;
    v5->_type = (NSString *)v7;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v6, CFSTR("com.apple.MediaGroups.name"));
    v9 = objc_claimAutoreleasedReturnValue();
    name = v5->_name;
    v5->_name = (NSString *)v9;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("com.apple.MediaGroups.identifier"));
    v11 = objc_claimAutoreleasedReturnValue();
    identifier = v5->_identifier;
    v5->_identifier = (MGGroupIdentifier *)v11;

    v13 = (void *)MEMORY[0x24BDBCF20];
    v14 = objc_opt_class();
    v15 = objc_opt_class();
    v16 = objc_opt_class();
    objc_msgSend(v13, "setWithObjects:", v14, v15, v16, objc_opt_class(), v6, 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v17, CFSTR("com.apple.MediaGroups.members"));
    v18 = objc_claimAutoreleasedReturnValue();
    memberIdentifiers = v5->_memberIdentifiers;
    v5->_memberIdentifiers = (NSArray *)v18;

    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("com.apple.MediaGroups.properties")))
    {
      v20 = (void *)MEMORY[0x24BDBCF20];
      v21 = objc_opt_class();
      v22 = objc_opt_class();
      objc_msgSend(v20, "setWithObjects:", v21, v22, objc_opt_class(), v6, 0);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v23, CFSTR("com.apple.MediaGroups.properties"));
      v24 = objc_claimAutoreleasedReturnValue();
      properties = v5->_properties;
      v5->_properties = (NSDictionary *)v24;

    }
    if (!v5->_identifier)
    {
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("com.apple.MediaGroups.identifier"));
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      if (v26)
      {
        +[MGGroupIdentifier groupIdentifierWithUUID:](MGGroupIdentifier, "groupIdentifierWithUUID:", v26);
        v27 = objc_claimAutoreleasedReturnValue();
        v28 = v5->_identifier;
        v5->_identifier = (MGGroupIdentifier *)v27;

      }
    }
    if (!v5->_type || !v5->_identifier || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
LABEL_31:
      v39 = 0;
      goto LABEL_32;
    }
    v29 = -[NSArray count](v5->_memberIdentifiers, "count");
    if (v29)
    {
      v30 = v29;
      v31 = 0;
      v32 = 0;
      do
      {
        -[NSArray objectAtIndex:](v5->_memberIdentifiers, "objectAtIndex:", v31);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            +[MGGroupIdentifier groupIdentifierWithUUID:](MGGroupIdentifier, "groupIdentifierWithUUID:", v33);
            v34 = (MGGroupIdentifier *)objc_claimAutoreleasedReturnValue();
            if (!v34)
              goto LABEL_30;
          }
          else
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0
              || (v35 = [MGGroupIdentifier alloc],
                  v36 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1808]), "initWithURL:resolvingAgainstBaseURL:", v33, 1), v34 = -[MGGroupIdentifier initWithURLComponents:](v35, "initWithURLComponents:", v36), v36, !v34))
            {
LABEL_30:

              goto LABEL_31;
            }
          }
          if (!v32)
            v32 = (void *)-[NSArray mutableCopy](v5->_memberIdentifiers, "mutableCopy");
          objc_msgSend(v32, "replaceObjectAtIndex:withObject:", v31, v34);

        }
        ++v31;
      }
      while (v30 != v31);
      if (v32)
      {
        v37 = objc_msgSend(v32, "copy");
        v38 = v5->_memberIdentifiers;
        v5->_memberIdentifiers = (NSArray *)v37;

      }
    }
    else
    {
      v32 = 0;
    }
    if (!v5->_properties)
      v5->_properties = (NSDictionary *)MEMORY[0x24BDBD1B8];

  }
  v39 = v5;
LABEL_32:

  return v39;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MGGroup identifier](self, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MGGroup name](self, "name");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[MGGroup properties](self, "properties");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[MGGroup memberIdentifiers](self, "memberIdentifiers");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p, _identifier = %@, _name = %@, _properties = %@, _members = %@>"), v5, self, v6, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v4 = a3;
  -[MGGroup type](self, "type");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("com.apple.MediaGroups.type"));

  -[MGGroup identifier](self, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("com.apple.MediaGroups.identifier"));

  -[MGGroup name](self, "name");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("com.apple.MediaGroups.name"));

  -[MGGroup memberIdentifiers](self, "memberIdentifiers");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("com.apple.MediaGroups.members"));

  -[MGGroup properties](self, "properties");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("com.apple.MediaGroups.properties"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (void)groupWithClientService:(id)a3 name:(id)a4 members:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  objc_msgSend(a1, "type");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "createGroupWithType:name:members:completion:", v14, v12, v11, v10);

}

+ (void)groupWithConnectionProvider:(id)a3 name:(id)a4 members:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  objc_msgSend((id)objc_opt_class(), "clientServiceWithConnectionProvider:", v13);
  v14 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "groupWithClientService:name:members:completion:", v14, v12, v11, v10);
}

+ (void)groupWithName:(id)a3 members:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(v9, "anyObject");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "service");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
LABEL_12:
    objc_msgSend(a1, "groupWithClientService:name:members:completion:", v12, v8, v9, v10);

  }
  else
  {
    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    v13 = v9;
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v20;
      while (2)
      {
        v17 = 0;
        do
        {
          if (*(_QWORD *)v20 != v16)
            objc_enumerationMutation(v13);
          objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * v17), "service", (_QWORD)v19);
          v18 = objc_claimAutoreleasedReturnValue();
          if (v18)
          {
            v12 = (void *)v18;

            goto LABEL_12;
          }
          ++v17;
        }
        while (v15 != v17);
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
        if (v15)
          continue;
        break;
      }
    }

    objc_msgSend(a1, "groupWithConnectionProvider:name:members:completion:", 0, v8, v13, v10);
  }

}

+ (id)validateGroupSpecificationWithType:(id)a3 identifier:(id)a4 name:(id)a5 properties:(id)a6 members:(id)a7
{
  id v9;
  id v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  char v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  NSObject *v24;
  const char *v25;
  uint8_t v27[16];
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v10 = a7;
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v10, "count"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v12 = v10;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v29;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v29 != v15)
          objc_enumerationMutation(v12);
        objc_msgSend(*(id *)(*((_QWORD *)&v28 + 1) + 8 * i), "identifier");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "addObject:", v17);

      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    }
    while (v14);
  }

  objc_msgSend(a1, "type");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v9, "isEqual:", v18);

  if ((v19 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("MGErrorDomain"), 2, 0);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    MGLogForCategory(0);
    v24 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
LABEL_14:

      goto LABEL_15;
    }
    *(_WORD *)v27 = 0;
    v25 = "Group validation failure: type mismatch";
LABEL_17:
    _os_log_error_impl(&dword_2172B2000, v24, OS_LOG_TYPE_ERROR, v25, v27, 2u);
    goto LABEL_14;
  }
  v20 = objc_msgSend(v11, "count");
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", v11);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "count");

  if (v20 != v22)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("MGErrorDomain"), 5, 0);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    MGLogForCategory(0);
    v24 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      goto LABEL_14;
    *(_WORD *)v27 = 0;
    v25 = "Group validation failure: duplicate members";
    goto LABEL_17;
  }
  v23 = 0;
LABEL_15:

  return v23;
}

- (void)deleteWithClientService:(id)a3 completion:(id)a4
{
  objc_msgSend(a3, "deleteGroup:completion:", self, a4);
}

- (void)deleteWithConnectionProvider:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  objc_msgSend((id)objc_opt_class(), "clientServiceWithConnectionProvider:", v7);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  -[MGGroup deleteWithClientService:completion:](self, "deleteWithClientService:completion:", v8, v6);
}

- (void)deleteWithCompletion:(id)a3
{
  -[MGGroup deleteWithConnectionProvider:completion:](self, "deleteWithConnectionProvider:completion:", 0, a3);
}

+ (id)type
{
  return CFSTR("com.apple.media-group");
}

- (void)forceSetClientService:(id)a3
{
  objc_storeStrong((id *)&self->_service, a3);
}

- (id)predicateForMembers
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  -[MGGroup memberIdentifiers](self, "memberIdentifiers");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", objc_msgSend(v2, "count"));
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v4 = v2;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v8), "normalized");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObject:", v9);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }

  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("identifier IN %@"), v3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (void)membersWithCompletion:(id)a3
{
  id v4;
  void *v5;
  MGGroupQuery *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  uint64_t *v14;
  id v15;
  id location;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  v4 = a3;
  -[MGGroup predicateForMembers](self, "predicateForMembers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy_;
  v21 = __Block_byref_object_dispose_;
  v22 = 0;
  objc_initWeak(&location, self);
  v6 = [MGGroupQuery alloc];
  -[MGGroup service](self, "service");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "provider");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __33__MGGroup_membersWithCompletion___block_invoke;
  v12[3] = &unk_24D726A98;
  objc_copyWeak(&v15, &location);
  v9 = v4;
  v13 = v9;
  v14 = &v17;
  v10 = -[MGGroupQuery initWithConnectionProvider:predicate:updateHandler:](v6, "initWithConnectionProvider:predicate:updateHandler:", v8, v5, v12);
  v11 = (void *)v18[5];
  v18[5] = v10;

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);
  _Block_object_dispose(&v17, 8);

}

void __33__MGGroup_membersWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id WeakRetained;
  uint64_t v7;
  void *v8;
  id v9;

  v9 = a2;
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = 0;

}

- (BOOL)isSameGroup:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[MGGroup identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v4) = objc_msgSend(v5, "isEqual:", v6);
  return (char)v4;
}

+ (id)predicateForGroup:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend(a3, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "predicateForGroupIdentifier:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)predicateForGroupIdentifier:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[3];

  v13[2] = *MEMORY[0x24BDAC8D0];
  v4 = (void *)MEMORY[0x24BDD14C0];
  v5 = a3;
  objc_msgSend(a1, "predicateForType");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v6;
  v7 = (void *)MEMORY[0x24BDD1758];
  objc_msgSend(v5, "normalized");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "predicateWithFormat:", CFSTR("SELF.identifier = %@"), v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13[1] = v9;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v13, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "andPredicateWithSubpredicates:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)predicateForType
{
  return (id)objc_msgSend(MEMORY[0x24BDD1758], "predicateWithValue:", 1);
}

+ (id)predicateForCurrentDevice
{
  return (id)objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("($CURRENT_SOLO_GROUP != nil) && (SELF.identifier == $CURRENT_SOLO_GROUP.identifier)"));
}

+ (id)predicateForGroupsContainingGroup:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v14[5];

  v14[4] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a3, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "normalized");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)MEMORY[0x24BDD14C0];
  objc_msgSend(a1, "predicateForType");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("$CONTAINMENT_MAP[%@] != nil"), v5, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v14[1] = v8;
  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("SELF.identifier != %@"), v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14[2] = v9;
  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("SUBQUERY($CONTAINMENT_MAP[%@], $container, SELF.identifier in $container)[SIZE] > 0"), v5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14[3] = v10;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v14, 4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "andPredicateWithSubpredicates:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)_conformingProtocols
{
  void *v2;
  uint64_t v3;
  objc_class *v4;
  Protocol **v5;
  Protocol **v6;
  unint64_t i;
  void *v8;
  void *v9;
  unsigned int outCount;

  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_opt_class();
  if (v3)
  {
    v4 = (objc_class *)v3;
    do
    {
      outCount = 0;
      v5 = class_copyProtocolList(v4, &outCount);
      if (v5)
      {
        v6 = v5;
        if (outCount)
        {
          for (i = 0; i < outCount; ++i)
          {
            NSStringFromProtocol(v6[i]);
            v8 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v2, "addObject:", v8);

          }
        }
        free(v6);
      }
      v4 = (objc_class *)-[objc_class superclass](v4, "superclass");
    }
    while (v4);
  }
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithSet:", v2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)predicateForGroupsConformingToProtocol:(id)a3
{
  void *v3;
  void *v4;

  NSStringFromProtocol((Protocol *)a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("%@ IN SELF._conformingProtocols"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)clientServiceWithConnectionProvider:(id)a3
{
  return +[MGClientService clientServiceWithConnectionProvider:](MGClientService, "clientServiceWithConnectionProvider:", a3);
}

- (MGGroupIdentifier)identifier
{
  return self->_identifier;
}

- (NSArray)memberIdentifiers
{
  return self->_memberIdentifiers;
}

- (NSString)type
{
  return self->_type;
}

- (NSString)name
{
  return self->_name;
}

- (NSDictionary)properties
{
  return self->_properties;
}

- (MGClientService)service
{
  return self->_service;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_service, 0);
  objc_storeStrong((id *)&self->_properties, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_type, 0);
  objc_storeStrong((id *)&self->_memberIdentifiers, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
