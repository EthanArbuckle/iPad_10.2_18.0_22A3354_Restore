@implementation _INPBCreateTaskListIntent

- (void)setGroupName:(id)a3
{
  objc_storeStrong((id *)&self->_groupName, a3);
}

- (BOOL)hasGroupName
{
  return self->_groupName != 0;
}

- (void)setIntentMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_intentMetadata, a3);
}

- (BOOL)hasIntentMetadata
{
  return self->_intentMetadata != 0;
}

- (void)setTaskTitles:(id)a3
{
  NSArray *v4;
  NSArray *taskTitles;

  v4 = (NSArray *)objc_msgSend(a3, "mutableCopy");
  taskTitles = self->_taskTitles;
  self->_taskTitles = v4;

}

- (void)clearTaskTitles
{
  -[NSArray removeAllObjects](self->_taskTitles, "removeAllObjects");
}

- (void)addTaskTitles:(id)a3
{
  id v4;
  NSArray *taskTitles;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v4 = a3;
  taskTitles = self->_taskTitles;
  v8 = v4;
  if (!taskTitles)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_taskTitles;
    self->_taskTitles = v6;

    v4 = v8;
    taskTitles = self->_taskTitles;
  }
  -[NSArray addObject:](taskTitles, "addObject:", v4);

}

- (unint64_t)taskTitlesCount
{
  return -[NSArray count](self->_taskTitles, "count");
}

- (id)taskTitlesAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_taskTitles, "objectAtIndexedSubscript:", a3);
}

- (void)setTitle:(id)a3
{
  objc_storeStrong((id *)&self->_title, a3);
}

- (BOOL)hasTitle
{
  return self->_title != 0;
}

- (BOOL)readFrom:(id)a3
{
  return _INPBCreateTaskListIntentReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSArray *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[_INPBCreateTaskListIntent groupName](self, "groupName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[_INPBCreateTaskListIntent groupName](self, "groupName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[_INPBCreateTaskListIntent intentMetadata](self, "intentMetadata");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[_INPBCreateTaskListIntent intentMetadata](self, "intentMetadata");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v9 = self->_taskTitles;
  v10 = -[NSArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v17;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v17 != v12)
          objc_enumerationMutation(v9);
        PBDataWriterWriteSubmessage();
        ++v13;
      }
      while (v11 != v13);
      v11 = -[NSArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v11);
  }

  -[_INPBCreateTaskListIntent title](self, "title", v16);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    -[_INPBCreateTaskListIntent title](self, "title");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
}

- (_INPBCreateTaskListIntent)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  _INPBCreateTaskListIntent *v6;
  uint64_t v7;
  void *v8;

  v4 = a3;
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  v6 = (_INPBCreateTaskListIntent *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v4, "decodeObjectOfClass:forKey:", v7, v8),
        v6 = (_INPBCreateTaskListIntent *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = -[_INPBCreateTaskListIntent initWithData:](self, "initWithData:", v6);

    v6 = self;
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[_INPBCreateTaskListIntent data](self, "data");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);

}

- (id)copyWithZone:(_NSZone *)a3
{
  _INPBCreateTaskListIntent *v5;
  id v6;
  id v7;
  void *v8;
  id v9;

  v5 = -[_INPBCreateTaskListIntent init](+[_INPBCreateTaskListIntent allocWithZone:](_INPBCreateTaskListIntent, "allocWithZone:"), "init");
  v6 = -[_INPBDataString copyWithZone:](self->_groupName, "copyWithZone:", a3);
  -[_INPBCreateTaskListIntent setGroupName:](v5, "setGroupName:", v6);

  v7 = -[_INPBIntentMetadata copyWithZone:](self->_intentMetadata, "copyWithZone:", a3);
  -[_INPBCreateTaskListIntent setIntentMetadata:](v5, "setIntentMetadata:", v7);

  v8 = (void *)-[NSArray copyWithZone:](self->_taskTitles, "copyWithZone:", a3);
  -[_INPBCreateTaskListIntent setTaskTitles:](v5, "setTaskTitles:", v8);

  v9 = -[_INPBDataString copyWithZone:](self->_title, "copyWithZone:", a3);
  -[_INPBCreateTaskListIntent setTitle:](v5, "setTitle:", v9);

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  char v26;
  BOOL v27;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_22;
  -[_INPBCreateTaskListIntent groupName](self, "groupName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "groupName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_21;
  -[_INPBCreateTaskListIntent groupName](self, "groupName");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[_INPBCreateTaskListIntent groupName](self, "groupName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "groupName");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_22;
  }
  else
  {

  }
  -[_INPBCreateTaskListIntent intentMetadata](self, "intentMetadata");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "intentMetadata");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_21;
  -[_INPBCreateTaskListIntent intentMetadata](self, "intentMetadata");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    -[_INPBCreateTaskListIntent intentMetadata](self, "intentMetadata");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "intentMetadata");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if (!v16)
      goto LABEL_22;
  }
  else
  {

  }
  -[_INPBCreateTaskListIntent taskTitles](self, "taskTitles");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "taskTitles");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_21;
  -[_INPBCreateTaskListIntent taskTitles](self, "taskTitles");
  v17 = objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    v18 = (void *)v17;
    -[_INPBCreateTaskListIntent taskTitles](self, "taskTitles");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "taskTitles");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v19, "isEqual:", v20);

    if (!v21)
      goto LABEL_22;
  }
  else
  {

  }
  -[_INPBCreateTaskListIntent title](self, "title");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "title");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) != (v6 != 0))
  {
    -[_INPBCreateTaskListIntent title](self, "title");
    v22 = objc_claimAutoreleasedReturnValue();
    if (!v22)
    {

LABEL_25:
      v27 = 1;
      goto LABEL_23;
    }
    v23 = (void *)v22;
    -[_INPBCreateTaskListIntent title](self, "title");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "title");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v24, "isEqual:", v25);

    if ((v26 & 1) != 0)
      goto LABEL_25;
  }
  else
  {
LABEL_21:

  }
LABEL_22:
  v27 = 0;
LABEL_23:

  return v27;
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;
  uint64_t v5;

  v3 = -[_INPBDataString hash](self->_groupName, "hash");
  v4 = -[_INPBIntentMetadata hash](self->_intentMetadata, "hash") ^ v3;
  v5 = -[NSArray hash](self->_taskTitles, "hash");
  return v4 ^ v5 ^ -[_INPBDataString hash](self->_title, "hash");
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSArray *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_INPBCreateTaskListIntent groupName](self, "groupName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("groupName"));

  -[_INPBCreateTaskListIntent intentMetadata](self, "intentMetadata");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dictionaryRepresentation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("intentMetadata"));

  if (-[NSArray count](self->_taskTitles, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v9 = self->_taskTitles;
    v10 = -[NSArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v19;
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v19 != v12)
            objc_enumerationMutation(v9);
          objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * v13), "dictionaryRepresentation", (_QWORD)v18);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "addObject:", v14);

          ++v13;
        }
        while (v11 != v13);
        v11 = -[NSArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      }
      while (v11);
    }

    objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("taskTitles"));
  }
  -[_INPBCreateTaskListIntent title](self, "title", (_QWORD)v18);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "dictionaryRepresentation");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v16, CFSTR("title"));

  return v3;
}

- (_INPBDataString)groupName
{
  return self->_groupName;
}

- (_INPBIntentMetadata)intentMetadata
{
  return self->_intentMetadata;
}

- (NSArray)taskTitles
{
  return self->_taskTitles;
}

- (_INPBDataString)title
{
  return self->_title;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_taskTitles, 0);
  objc_storeStrong((id *)&self->_intentMetadata, 0);
  objc_storeStrong((id *)&self->_groupName, 0);
}

+ (Class)taskTitlesType
{
  return (Class)objc_opt_class();
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
