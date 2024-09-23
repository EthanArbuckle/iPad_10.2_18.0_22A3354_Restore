@implementation _INPBSnoozeTasksIntent

- (void)setAll:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_all = a3;
}

- (BOOL)hasAll
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasAll:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)setIntentMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_intentMetadata, a3);
}

- (BOOL)hasIntentMetadata
{
  return self->_intentMetadata != 0;
}

- (void)setNextTriggerTime:(id)a3
{
  objc_storeStrong((id *)&self->_nextTriggerTime, a3);
}

- (BOOL)hasNextTriggerTime
{
  return self->_nextTriggerTime != 0;
}

- (void)setTasks:(id)a3
{
  NSArray *v4;
  NSArray *tasks;

  v4 = (NSArray *)objc_msgSend(a3, "mutableCopy");
  tasks = self->_tasks;
  self->_tasks = v4;

}

- (void)clearTasks
{
  -[NSArray removeAllObjects](self->_tasks, "removeAllObjects");
}

- (void)addTasks:(id)a3
{
  id v4;
  NSArray *tasks;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v4 = a3;
  tasks = self->_tasks;
  v8 = v4;
  if (!tasks)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_tasks;
    self->_tasks = v6;

    v4 = v8;
    tasks = self->_tasks;
  }
  -[NSArray addObject:](tasks, "addObject:", v4);

}

- (unint64_t)tasksCount
{
  return -[NSArray count](self->_tasks, "count");
}

- (id)tasksAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_tasks, "objectAtIndexedSubscript:", a3);
}

- (BOOL)readFrom:(id)a3
{
  return _INPBSnoozeTasksIntentReadFrom(self, (uint64_t)a3);
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
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[_INPBSnoozeTasksIntent hasAll](self, "hasAll"))
    PBDataWriterWriteBOOLField();
  -[_INPBSnoozeTasksIntent intentMetadata](self, "intentMetadata");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[_INPBSnoozeTasksIntent intentMetadata](self, "intentMetadata");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[_INPBSnoozeTasksIntent nextTriggerTime](self, "nextTriggerTime");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[_INPBSnoozeTasksIntent nextTriggerTime](self, "nextTriggerTime");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v9 = self->_tasks;
  v10 = -[NSArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v15;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v15 != v12)
          objc_enumerationMutation(v9);
        PBDataWriterWriteSubmessage();
        ++v13;
      }
      while (v11 != v13);
      v11 = -[NSArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v11);
  }

}

- (_INPBSnoozeTasksIntent)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  _INPBSnoozeTasksIntent *v6;
  uint64_t v7;
  void *v8;

  v4 = a3;
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  v6 = (_INPBSnoozeTasksIntent *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v4, "decodeObjectOfClass:forKey:", v7, v8),
        v6 = (_INPBSnoozeTasksIntent *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = -[_INPBSnoozeTasksIntent initWithData:](self, "initWithData:", v6);

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
  -[_INPBSnoozeTasksIntent data](self, "data");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);

}

- (id)copyWithZone:(_NSZone *)a3
{
  _INPBSnoozeTasksIntent *v5;
  id v6;
  id v7;
  void *v8;

  v5 = -[_INPBSnoozeTasksIntent init](+[_INPBSnoozeTasksIntent allocWithZone:](_INPBSnoozeTasksIntent, "allocWithZone:"), "init");
  if (-[_INPBSnoozeTasksIntent hasAll](self, "hasAll"))
    -[_INPBSnoozeTasksIntent setAll:](v5, "setAll:", -[_INPBSnoozeTasksIntent all](self, "all"));
  v6 = -[_INPBIntentMetadata copyWithZone:](self->_intentMetadata, "copyWithZone:", a3);
  -[_INPBSnoozeTasksIntent setIntentMetadata:](v5, "setIntentMetadata:", v6);

  v7 = -[_INPBDateTimeRange copyWithZone:](self->_nextTriggerTime, "copyWithZone:", a3);
  -[_INPBSnoozeTasksIntent setNextTriggerTime:](v5, "setNextTriggerTime:", v7);

  v8 = (void *)-[NSArray copyWithZone:](self->_tasks, "copyWithZone:", a3);
  -[_INPBSnoozeTasksIntent setTasks:](v5, "setTasks:", v8);

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  int v5;
  int all;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  char v23;
  BOOL v24;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_21;
  v5 = -[_INPBSnoozeTasksIntent hasAll](self, "hasAll");
  if (v5 != objc_msgSend(v4, "hasAll"))
    goto LABEL_21;
  if (-[_INPBSnoozeTasksIntent hasAll](self, "hasAll"))
  {
    if (objc_msgSend(v4, "hasAll"))
    {
      all = self->_all;
      if (all != objc_msgSend(v4, "all"))
        goto LABEL_21;
    }
  }
  -[_INPBSnoozeTasksIntent intentMetadata](self, "intentMetadata");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "intentMetadata");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v7 == 0) == (v8 != 0))
    goto LABEL_20;
  -[_INPBSnoozeTasksIntent intentMetadata](self, "intentMetadata");
  v9 = objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v10 = (void *)v9;
    -[_INPBSnoozeTasksIntent intentMetadata](self, "intentMetadata");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "intentMetadata");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v11, "isEqual:", v12);

    if (!v13)
      goto LABEL_21;
  }
  else
  {

  }
  -[_INPBSnoozeTasksIntent nextTriggerTime](self, "nextTriggerTime");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "nextTriggerTime");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v7 == 0) == (v8 != 0))
    goto LABEL_20;
  -[_INPBSnoozeTasksIntent nextTriggerTime](self, "nextTriggerTime");
  v14 = objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    v15 = (void *)v14;
    -[_INPBSnoozeTasksIntent nextTriggerTime](self, "nextTriggerTime");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "nextTriggerTime");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v16, "isEqual:", v17);

    if (!v18)
      goto LABEL_21;
  }
  else
  {

  }
  -[_INPBSnoozeTasksIntent tasks](self, "tasks");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "tasks");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v7 == 0) != (v8 != 0))
  {
    -[_INPBSnoozeTasksIntent tasks](self, "tasks");
    v19 = objc_claimAutoreleasedReturnValue();
    if (!v19)
    {

LABEL_24:
      v24 = 1;
      goto LABEL_22;
    }
    v20 = (void *)v19;
    -[_INPBSnoozeTasksIntent tasks](self, "tasks");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "tasks");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v21, "isEqual:", v22);

    if ((v23 & 1) != 0)
      goto LABEL_24;
  }
  else
  {
LABEL_20:

  }
LABEL_21:
  v24 = 0;
LABEL_22:

  return v24;
}

- (unint64_t)hash
{
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;

  if (-[_INPBSnoozeTasksIntent hasAll](self, "hasAll"))
    v3 = 2654435761 * self->_all;
  else
    v3 = 0;
  v4 = -[_INPBIntentMetadata hash](self->_intentMetadata, "hash") ^ v3;
  v5 = -[_INPBDateTimeRange hash](self->_nextTriggerTime, "hash");
  return v4 ^ v5 ^ -[NSArray hash](self->_tasks, "hash");
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSArray *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[_INPBSnoozeTasksIntent hasAll](self, "hasAll"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[_INPBSnoozeTasksIntent all](self, "all"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("all"));

  }
  -[_INPBSnoozeTasksIntent intentMetadata](self, "intentMetadata");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dictionaryRepresentation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("intentMetadata"));

  -[_INPBSnoozeTasksIntent nextTriggerTime](self, "nextTriggerTime");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "dictionaryRepresentation");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("nextTriggerTime"));

  if (-[NSArray count](self->_tasks, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v10 = self->_tasks;
    v11 = -[NSArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v18;
      do
      {
        v14 = 0;
        do
        {
          if (*(_QWORD *)v18 != v13)
            objc_enumerationMutation(v10);
          objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * v14), "dictionaryRepresentation", (_QWORD)v17);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "addObject:", v15);

          ++v14;
        }
        while (v12 != v14);
        v12 = -[NSArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      }
      while (v12);
    }

    objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("tasks"));
  }
  return v3;
}

- (BOOL)all
{
  return self->_all;
}

- (_INPBIntentMetadata)intentMetadata
{
  return self->_intentMetadata;
}

- (_INPBDateTimeRange)nextTriggerTime
{
  return self->_nextTriggerTime;
}

- (NSArray)tasks
{
  return self->_tasks;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tasks, 0);
  objc_storeStrong((id *)&self->_nextTriggerTime, 0);
  objc_storeStrong((id *)&self->_intentMetadata, 0);
}

+ (Class)tasksType
{
  return (Class)objc_opt_class();
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
