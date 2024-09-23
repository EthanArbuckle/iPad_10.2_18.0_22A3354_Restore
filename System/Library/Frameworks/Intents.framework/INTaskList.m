@implementation INTaskList

- (INTaskList)initWithTitle:(id)a3 tasks:(id)a4 groupName:(id)a5 taskListType:(int64_t)a6 createdDateComponents:(id)a7 modifiedDateComponents:(id)a8 identifier:(id)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  INSpeakableString *v21;
  INSpeakableString *v22;
  INTaskList *v23;

  v15 = a9;
  v16 = a8;
  v17 = a7;
  v18 = a5;
  v19 = a4;
  v20 = a3;
  v21 = -[INSpeakableString initWithSpokenPhrase:]([INSpeakableString alloc], "initWithSpokenPhrase:", v20);

  v22 = -[INSpeakableString initWithSpokenPhrase:]([INSpeakableString alloc], "initWithSpokenPhrase:", v18);
  v23 = -[INTaskList initWithTitle:tasks:groupName:createdDateComponents:modifiedDateComponents:identifier:](self, "initWithTitle:tasks:groupName:createdDateComponents:modifiedDateComponents:identifier:", v21, v19, v22, v17, v16, v15);

  return v23;
}

- (int64_t)taskListType
{
  return 0;
}

- (id)_intents_readableTitleWithLocalizer:(id)a3 metadata:(id)a4
{
  id v5;
  void *v6;
  void *v7;

  v5 = a3;
  -[INTaskList title](self, "title");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_intents_readableTitleWithLocalizer:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (INTaskList)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)INTaskList;
  return -[INTaskList init](&v3, sel_init);
}

- (INTaskList)initWithTitle:(INSpeakableString *)title tasks:(NSArray *)tasks groupName:(INSpeakableString *)groupName createdDateComponents:(NSDateComponents *)createdDateComponents modifiedDateComponents:(NSDateComponents *)modifiedDateComponents identifier:(NSString *)identifier
{
  INSpeakableString *v14;
  NSArray *v15;
  INSpeakableString *v16;
  NSDateComponents *v17;
  NSDateComponents *v18;
  NSString *v19;
  INTaskList *v20;
  uint64_t v21;
  INSpeakableString *v22;
  uint64_t v23;
  NSArray *v24;
  uint64_t v25;
  INSpeakableString *v26;
  uint64_t v27;
  NSDateComponents *v28;
  uint64_t v29;
  NSDateComponents *v30;
  uint64_t v31;
  NSString *v32;
  objc_super v34;

  v14 = title;
  v15 = tasks;
  v16 = groupName;
  v17 = createdDateComponents;
  v18 = modifiedDateComponents;
  v19 = identifier;
  v34.receiver = self;
  v34.super_class = (Class)INTaskList;
  v20 = -[INTaskList init](&v34, sel_init);
  if (v20)
  {
    v21 = -[INSpeakableString copy](v14, "copy");
    v22 = v20->_title;
    v20->_title = (INSpeakableString *)v21;

    v23 = -[NSArray copy](v15, "copy");
    v24 = v20->_tasks;
    v20->_tasks = (NSArray *)v23;

    v25 = -[INSpeakableString copy](v16, "copy");
    v26 = v20->_groupName;
    v20->_groupName = (INSpeakableString *)v25;

    v27 = -[NSDateComponents copy](v17, "copy");
    v28 = v20->_createdDateComponents;
    v20->_createdDateComponents = (NSDateComponents *)v27;

    v29 = -[NSDateComponents copy](v18, "copy");
    v30 = v20->_modifiedDateComponents;
    v20->_modifiedDateComponents = (NSDateComponents *)v29;

    v31 = -[NSString copy](v19, "copy");
    v32 = v20->_identifier;
    v20->_identifier = (NSString *)v31;

  }
  return v20;
}

- (unint64_t)hash
{
  unint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v3 = -[INSpeakableString hash](self->_title, "hash");
  v4 = -[NSArray hash](self->_tasks, "hash") ^ v3;
  v5 = -[INSpeakableString hash](self->_groupName, "hash");
  v6 = v4 ^ v5 ^ -[NSDateComponents hash](self->_createdDateComponents, "hash");
  v7 = -[NSDateComponents hash](self->_modifiedDateComponents, "hash");
  return v6 ^ v7 ^ -[NSString hash](self->_identifier, "hash");
}

- (BOOL)isEqual:(id)a3
{
  INTaskList *v4;
  INTaskList *v5;
  INSpeakableString *title;
  NSArray *tasks;
  INSpeakableString *groupName;
  NSDateComponents *createdDateComponents;
  NSDateComponents *modifiedDateComponents;
  NSString *identifier;
  BOOL v12;

  v4 = (INTaskList *)a3;
  if (v4 == self)
  {
    v12 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      title = self->_title;
      v12 = 0;
      if (title == v5->_title || -[INSpeakableString isEqual:](title, "isEqual:"))
      {
        tasks = self->_tasks;
        if (tasks == v5->_tasks || -[NSArray isEqual:](tasks, "isEqual:"))
        {
          groupName = self->_groupName;
          if (groupName == v5->_groupName || -[INSpeakableString isEqual:](groupName, "isEqual:"))
          {
            createdDateComponents = self->_createdDateComponents;
            if (createdDateComponents == v5->_createdDateComponents
              || -[NSDateComponents isEqual:](createdDateComponents, "isEqual:"))
            {
              modifiedDateComponents = self->_modifiedDateComponents;
              if (modifiedDateComponents == v5->_modifiedDateComponents
                || -[NSDateComponents isEqual:](modifiedDateComponents, "isEqual:"))
              {
                identifier = self->_identifier;
                if (identifier == v5->_identifier || -[NSString isEqual:](identifier, "isEqual:"))
                  v12 = 1;
              }
            }
          }
        }
      }

    }
    else
    {
      v12 = 0;
    }
  }

  return v12;
}

- (INTaskList)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  INTaskList *v17;
  _QWORD v19[3];

  v19[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("title"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0C99E60];
  v19[0] = objc_opt_class();
  v19[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setWithArray:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("tasks"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("groupName"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("createdDateComponents"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("modifiedDateComponents"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)MEMORY[0x1E0C99E60];
  v14 = objc_opt_class();
  objc_msgSend(v13, "setWithObjects:", v14, objc_opt_class(), 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v15, CFSTR("identifier"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = -[INTaskList initWithTitle:tasks:groupName:createdDateComponents:modifiedDateComponents:identifier:](self, "initWithTitle:tasks:groupName:createdDateComponents:modifiedDateComponents:identifier:", v5, v9, v10, v11, v12, v16);
  return v17;
}

- (void)encodeWithCoder:(id)a3
{
  INSpeakableString *title;
  id v5;

  title = self->_title;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", title, CFSTR("title"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_tasks, CFSTR("tasks"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_groupName, CFSTR("groupName"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_createdDateComponents, CFSTR("createdDateComponents"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_modifiedDateComponents, CFSTR("modifiedDateComponents"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_identifier, CFSTR("identifier"));

}

- (id)_intents_encodeWithJSONEncoder:(id)a3 codableDescription:(id)a4
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v5 = (void *)MEMORY[0x1E0C99E08];
  v6 = a3;
  objc_msgSend(v5, "dictionary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:", self->_title);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v8, CFSTR("title"));

  objc_msgSend(v6, "encodeObject:", self->_tasks);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v9, CFSTR("tasks"));

  objc_msgSend(v6, "encodeObject:", self->_groupName);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v10, CFSTR("groupName"));

  objc_msgSend(v6, "encodeObject:", self->_createdDateComponents);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v11, CFSTR("createdDateComponents"));

  objc_msgSend(v6, "encodeObject:", self->_modifiedDateComponents);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v12, CFSTR("modifiedDateComponents"));

  objc_msgSend(v6, "encodeObject:", self->_identifier);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v13, CFSTR("identifier"));
  return v7;
}

- (NSString)description
{
  return (NSString *)-[INTaskList descriptionAtIndent:](self, "descriptionAtIndent:", 0);
}

- (id)descriptionAtIndent:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v5 = (void *)MEMORY[0x1E0CB3940];
  v11.receiver = self;
  v11.super_class = (Class)INTaskList;
  -[INTaskList description](&v11, sel_description);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[INTaskList _dictionaryRepresentation](self, "_dictionaryRepresentation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "descriptionAtIndent:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("%@ %@"), v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)_dictionaryRepresentation
{
  INSpeakableString *title;
  uint64_t v4;
  NSArray *tasks;
  uint64_t v6;
  INSpeakableString *groupName;
  uint64_t v8;
  NSDateComponents *createdDateComponents;
  void *v10;
  NSDateComponents *modifiedDateComponents;
  void *v12;
  NSString *identifier;
  void *v14;
  void *v15;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  const __CFString *v21;
  const __CFString *v22;
  const __CFString *v23;
  const __CFString *v24;
  const __CFString *v25;
  const __CFString *v26;
  _QWORD v27[7];

  v27[6] = *MEMORY[0x1E0C80C00];
  v21 = CFSTR("title");
  title = self->_title;
  v4 = (uint64_t)title;
  if (!title)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v4 = objc_claimAutoreleasedReturnValue();
  }
  v20 = (void *)v4;
  v27[0] = v4;
  v22 = CFSTR("tasks");
  tasks = self->_tasks;
  v6 = (uint64_t)tasks;
  if (!tasks)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v6 = objc_claimAutoreleasedReturnValue();
  }
  v19 = (void *)v6;
  v27[1] = v6;
  v23 = CFSTR("groupName");
  groupName = self->_groupName;
  v8 = (uint64_t)groupName;
  if (!groupName)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v8 = objc_claimAutoreleasedReturnValue();
  }
  v17 = v8;
  v27[2] = v8;
  v24 = CFSTR("createdDateComponents");
  createdDateComponents = self->_createdDateComponents;
  v10 = createdDateComponents;
  if (!createdDateComponents)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null", v8, v19, v20, v21, v22, v23, v24);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v27[3] = v10;
  v25 = CFSTR("modifiedDateComponents");
  modifiedDateComponents = self->_modifiedDateComponents;
  v12 = modifiedDateComponents;
  if (!modifiedDateComponents)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v27[4] = v12;
  v26 = CFSTR("identifier");
  identifier = self->_identifier;
  v14 = identifier;
  if (!identifier)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v27[5] = v14;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v27, &v21, 6, v17);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (identifier)
  {
    if (modifiedDateComponents)
      goto LABEL_15;
  }
  else
  {

    if (modifiedDateComponents)
    {
LABEL_15:
      if (createdDateComponents)
        goto LABEL_16;
      goto LABEL_22;
    }
  }

  if (createdDateComponents)
  {
LABEL_16:
    if (groupName)
      goto LABEL_17;
    goto LABEL_23;
  }
LABEL_22:

  if (groupName)
  {
LABEL_17:
    if (tasks)
      goto LABEL_18;
LABEL_24:

    if (title)
      return v15;
LABEL_25:

    return v15;
  }
LABEL_23:

  if (!tasks)
    goto LABEL_24;
LABEL_18:
  if (!title)
    goto LABEL_25;
  return v15;
}

- (INSpeakableString)title
{
  return self->_title;
}

- (NSArray)tasks
{
  return self->_tasks;
}

- (INSpeakableString)groupName
{
  return self->_groupName;
}

- (NSDateComponents)createdDateComponents
{
  return self->_createdDateComponents;
}

- (NSDateComponents)modifiedDateComponents
{
  return self->_modifiedDateComponents;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_modifiedDateComponents, 0);
  objc_storeStrong((id *)&self->_createdDateComponents, 0);
  objc_storeStrong((id *)&self->_groupName, 0);
  objc_storeStrong((id *)&self->_tasks, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)_intents_decodeWithJSONDecoder:(id)a3 codableDescription:(id)a4 from:(id)a5
{
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;

  v7 = a3;
  v8 = a5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v9 = objc_opt_class();
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("title"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "decodeObjectOfClass:from:", v9, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = objc_opt_class();
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("tasks"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "decodeObjectsOfClass:from:", v12, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v15 = objc_opt_class();
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("groupName"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "decodeObjectOfClass:from:", v15, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    v18 = objc_opt_class();
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("createdDateComponents"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "decodeObjectOfClass:from:", v18, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    v21 = objc_opt_class();
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("modifiedDateComponents"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "decodeObjectOfClass:from:", v21, v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("identifier"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithTitle:tasks:groupName:createdDateComponents:modifiedDateComponents:identifier:", v11, v14, v17, v20, v23, v24);

  }
  else
  {
    v25 = 0;
  }

  return v25;
}

- (id)_intents_cacheableObjects
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[INTaskList tasks](self, "tasks", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v14;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v8), "_intents_cacheableObjects");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "unionSet:", v9);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v6);
  }

  if (objc_msgSend(v3, "count"))
    v10 = v3;
  else
    v10 = 0;
  v11 = v10;

  return v11;
}

- (void)_intents_updateContainerWithCache:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[INTaskList tasks](self, "tasks", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v9++), "_intents_updateContainerWithCache:", v4);
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

@end
