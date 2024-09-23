@implementation _INPBSearchForNotebookItemsIntentResponse

- (void)setNotes:(id)a3
{
  NSArray *v4;
  NSArray *notes;

  v4 = (NSArray *)objc_msgSend(a3, "mutableCopy");
  notes = self->_notes;
  self->_notes = v4;

}

- (void)clearNotes
{
  -[NSArray removeAllObjects](self->_notes, "removeAllObjects");
}

- (void)addNotes:(id)a3
{
  id v4;
  NSArray *notes;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v4 = a3;
  notes = self->_notes;
  v8 = v4;
  if (!notes)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_notes;
    self->_notes = v6;

    v4 = v8;
    notes = self->_notes;
  }
  -[NSArray addObject:](notes, "addObject:", v4);

}

- (unint64_t)notesCount
{
  return -[NSArray count](self->_notes, "count");
}

- (id)notesAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_notes, "objectAtIndexedSubscript:", a3);
}

- (void)setSortType:(int)a3
{
  char has;

  has = (char)self->_has;
  if (a3 == 0x7FFFFFFF)
  {
    *(_BYTE *)&self->_has = has & 0xFE;
  }
  else
  {
    *(_BYTE *)&self->_has = has | 1;
    self->_sortType = a3;
  }
}

- (BOOL)hasSortType
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasSortType:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (id)sortTypeAsString:(int)a3
{
  __CFString *v3;

  if (!a3)
    return CFSTR("AS_IS");
  if (a3 == 1)
  {
    v3 = CFSTR("BY_DATE");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (int)StringAsSortType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AS_IS")) & 1) != 0)
    v4 = 0;
  else
    v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("BY_DATE"));

  return v4;
}

- (void)setTaskLists:(id)a3
{
  NSArray *v4;
  NSArray *taskLists;

  v4 = (NSArray *)objc_msgSend(a3, "mutableCopy");
  taskLists = self->_taskLists;
  self->_taskLists = v4;

}

- (void)clearTaskLists
{
  -[NSArray removeAllObjects](self->_taskLists, "removeAllObjects");
}

- (void)addTaskLists:(id)a3
{
  id v4;
  NSArray *taskLists;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v4 = a3;
  taskLists = self->_taskLists;
  v8 = v4;
  if (!taskLists)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_taskLists;
    self->_taskLists = v6;

    v4 = v8;
    taskLists = self->_taskLists;
  }
  -[NSArray addObject:](taskLists, "addObject:", v4);

}

- (unint64_t)taskListsCount
{
  return -[NSArray count](self->_taskLists, "count");
}

- (id)taskListsAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_taskLists, "objectAtIndexedSubscript:", a3);
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
  return _INPBSearchForNotebookItemsIntentResponseReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSArray *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  NSArray *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  _BYTE v33[128];
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v5 = self->_notes;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v28, v34, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v29;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v29 != v8)
          objc_enumerationMutation(v5);
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v28, v34, 16);
    }
    while (v7);
  }

  if (-[_INPBSearchForNotebookItemsIntentResponse hasSortType](self, "hasSortType"))
    PBDataWriterWriteInt32Field();
  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v10 = self->_taskLists;
  v11 = -[NSArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v24, v33, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v25;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v25 != v13)
          objc_enumerationMutation(v10);
        PBDataWriterWriteSubmessage();
        ++v14;
      }
      while (v12 != v14);
      v12 = -[NSArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v24, v33, 16);
    }
    while (v12);
  }

  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v15 = self->_tasks;
  v16 = -[NSArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v20, v32, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v21;
    do
    {
      v19 = 0;
      do
      {
        if (*(_QWORD *)v21 != v18)
          objc_enumerationMutation(v15);
        PBDataWriterWriteSubmessage();
        ++v19;
      }
      while (v17 != v19);
      v17 = -[NSArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v20, v32, 16);
    }
    while (v17);
  }

}

- (_INPBSearchForNotebookItemsIntentResponse)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  _INPBSearchForNotebookItemsIntentResponse *v6;
  uint64_t v7;
  void *v8;

  v4 = a3;
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  v6 = (_INPBSearchForNotebookItemsIntentResponse *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v4, "decodeObjectOfClass:forKey:", v7, v8),
        v6 = (_INPBSearchForNotebookItemsIntentResponse *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = -[_INPBSearchForNotebookItemsIntentResponse initWithData:](self, "initWithData:", v6);

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
  -[_INPBSearchForNotebookItemsIntentResponse data](self, "data");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);

}

- (id)copyWithZone:(_NSZone *)a3
{
  _INPBSearchForNotebookItemsIntentResponse *v5;
  void *v6;
  void *v7;
  void *v8;

  v5 = -[_INPBSearchForNotebookItemsIntentResponse init](+[_INPBSearchForNotebookItemsIntentResponse allocWithZone:](_INPBSearchForNotebookItemsIntentResponse, "allocWithZone:"), "init");
  v6 = (void *)-[NSArray copyWithZone:](self->_notes, "copyWithZone:", a3);
  -[_INPBSearchForNotebookItemsIntentResponse setNotes:](v5, "setNotes:", v6);

  if (-[_INPBSearchForNotebookItemsIntentResponse hasSortType](self, "hasSortType"))
    -[_INPBSearchForNotebookItemsIntentResponse setSortType:](v5, "setSortType:", -[_INPBSearchForNotebookItemsIntentResponse sortType](self, "sortType"));
  v7 = (void *)-[NSArray copyWithZone:](self->_taskLists, "copyWithZone:", a3);
  -[_INPBSearchForNotebookItemsIntentResponse setTaskLists:](v5, "setTaskLists:", v7);

  v8 = (void *)-[NSArray copyWithZone:](self->_tasks, "copyWithZone:", a3);
  -[_INPBSearchForNotebookItemsIntentResponse setTasks:](v5, "setTasks:", v8);

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
  int v12;
  int sortType;
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
  -[_INPBSearchForNotebookItemsIntentResponse notes](self, "notes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "notes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_20;
  -[_INPBSearchForNotebookItemsIntentResponse notes](self, "notes");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[_INPBSearchForNotebookItemsIntentResponse notes](self, "notes");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "notes");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_21;
  }
  else
  {

  }
  v12 = -[_INPBSearchForNotebookItemsIntentResponse hasSortType](self, "hasSortType");
  if (v12 != objc_msgSend(v4, "hasSortType"))
    goto LABEL_21;
  if (-[_INPBSearchForNotebookItemsIntentResponse hasSortType](self, "hasSortType"))
  {
    if (objc_msgSend(v4, "hasSortType"))
    {
      sortType = self->_sortType;
      if (sortType != objc_msgSend(v4, "sortType"))
        goto LABEL_21;
    }
  }
  -[_INPBSearchForNotebookItemsIntentResponse taskLists](self, "taskLists");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "taskLists");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_20;
  -[_INPBSearchForNotebookItemsIntentResponse taskLists](self, "taskLists");
  v14 = objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    v15 = (void *)v14;
    -[_INPBSearchForNotebookItemsIntentResponse taskLists](self, "taskLists");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "taskLists");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v16, "isEqual:", v17);

    if (!v18)
      goto LABEL_21;
  }
  else
  {

  }
  -[_INPBSearchForNotebookItemsIntentResponse tasks](self, "tasks");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "tasks");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) != (v6 != 0))
  {
    -[_INPBSearchForNotebookItemsIntentResponse tasks](self, "tasks");
    v19 = objc_claimAutoreleasedReturnValue();
    if (!v19)
    {

LABEL_24:
      v24 = 1;
      goto LABEL_22;
    }
    v20 = (void *)v19;
    -[_INPBSearchForNotebookItemsIntentResponse tasks](self, "tasks");
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
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v3 = -[NSArray hash](self->_notes, "hash");
  if (-[_INPBSearchForNotebookItemsIntentResponse hasSortType](self, "hasSortType"))
    v4 = 2654435761 * self->_sortType;
  else
    v4 = 0;
  v5 = v4 ^ v3;
  v6 = -[NSArray hash](self->_taskLists, "hash");
  return v5 ^ v6 ^ -[NSArray hash](self->_tasks, "hash");
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  __CFString *v12;
  void *v13;
  NSArray *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  NSArray *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  _BYTE v41[128];
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[NSArray count](self->_notes, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = 0u;
    v37 = 0u;
    v38 = 0u;
    v39 = 0u;
    v5 = self->_notes;
    v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v36, v42, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v37;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v37 != v8)
            objc_enumerationMutation(v5);
          objc_msgSend(*(id *)(*((_QWORD *)&v36 + 1) + 8 * v9), "dictionaryRepresentation");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "addObject:", v10);

          ++v9;
        }
        while (v7 != v9);
        v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v36, v42, 16);
      }
      while (v7);
    }

    objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("notes"));
  }
  if (-[_INPBSearchForNotebookItemsIntentResponse hasSortType](self, "hasSortType"))
  {
    v11 = -[_INPBSearchForNotebookItemsIntentResponse sortType](self, "sortType");
    if ((_DWORD)v11)
    {
      if ((_DWORD)v11 == 1)
      {
        v12 = CFSTR("BY_DATE");
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v11);
        v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      v12 = CFSTR("AS_IS");
    }
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("sortType"));

  }
  if (-[NSArray count](self->_taskLists, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = 0u;
    v33 = 0u;
    v34 = 0u;
    v35 = 0u;
    v14 = self->_taskLists;
    v15 = -[NSArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v32, v41, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v33;
      do
      {
        v18 = 0;
        do
        {
          if (*(_QWORD *)v33 != v17)
            objc_enumerationMutation(v14);
          objc_msgSend(*(id *)(*((_QWORD *)&v32 + 1) + 8 * v18), "dictionaryRepresentation");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "addObject:", v19);

          ++v18;
        }
        while (v16 != v18);
        v16 = -[NSArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v32, v41, 16);
      }
      while (v16);
    }

    objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("taskLists"));
  }
  if (-[NSArray count](self->_tasks, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    v21 = self->_tasks;
    v22 = -[NSArray countByEnumeratingWithState:objects:count:](v21, "countByEnumeratingWithState:objects:count:", &v28, v40, 16);
    if (v22)
    {
      v23 = v22;
      v24 = *(_QWORD *)v29;
      do
      {
        v25 = 0;
        do
        {
          if (*(_QWORD *)v29 != v24)
            objc_enumerationMutation(v21);
          objc_msgSend(*(id *)(*((_QWORD *)&v28 + 1) + 8 * v25), "dictionaryRepresentation");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "addObject:", v26);

          ++v25;
        }
        while (v23 != v25);
        v23 = -[NSArray countByEnumeratingWithState:objects:count:](v21, "countByEnumeratingWithState:objects:count:", &v28, v40, 16);
      }
      while (v23);
    }

    objc_msgSend(v3, "setObject:forKeyedSubscript:", v20, CFSTR("tasks"));
  }
  return v3;
}

- (NSArray)notes
{
  return self->_notes;
}

- (int)sortType
{
  return self->_sortType;
}

- (NSArray)taskLists
{
  return self->_taskLists;
}

- (NSArray)tasks
{
  return self->_tasks;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tasks, 0);
  objc_storeStrong((id *)&self->_taskLists, 0);
  objc_storeStrong((id *)&self->_notes, 0);
}

+ (Class)notesType
{
  return (Class)objc_opt_class();
}

+ (Class)taskListsType
{
  return (Class)objc_opt_class();
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
