@implementation _INPBAddTasksIntentResponse

- (void)setAddedTasks:(id)a3
{
  NSArray *v4;
  NSArray *addedTasks;

  v4 = (NSArray *)objc_msgSend(a3, "mutableCopy");
  addedTasks = self->_addedTasks;
  self->_addedTasks = v4;

}

- (void)clearAddedTasks
{
  -[NSArray removeAllObjects](self->_addedTasks, "removeAllObjects");
}

- (void)addAddedTasks:(id)a3
{
  id v4;
  NSArray *addedTasks;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v4 = a3;
  addedTasks = self->_addedTasks;
  v8 = v4;
  if (!addedTasks)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_addedTasks;
    self->_addedTasks = v6;

    v4 = v8;
    addedTasks = self->_addedTasks;
  }
  -[NSArray addObject:](addedTasks, "addObject:", v4);

}

- (unint64_t)addedTasksCount
{
  return -[NSArray count](self->_addedTasks, "count");
}

- (id)addedTasksAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_addedTasks, "objectAtIndexedSubscript:", a3);
}

- (void)setModifiedTaskList:(id)a3
{
  objc_storeStrong((id *)&self->_modifiedTaskList, a3);
}

- (BOOL)hasModifiedTaskList
{
  return self->_modifiedTaskList != 0;
}

- (void)setWarnings:(int *)a3 count:(unint64_t)a4
{
  PBRepeatedInt32Set();
}

- (int)warnings
{
  return self->_warnings.list;
}

- (void)clearWarnings
{
  PBRepeatedInt32Clear();
}

- (void)addWarnings:(int)a3
{
  if (a3 != 0x7FFFFFFF)
    PBRepeatedInt32Add();
}

- (unint64_t)warningsCount
{
  return self->_warnings.count;
}

- (int)warningsAtIndex:(unint64_t)a3
{
  return self->_warnings.list[a3];
}

- (id)warningsAsString:(int)a3
{
  if (a3 < 5)
    return off_1E22905F8[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsWarnings:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UNKNOWN")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LOCATION_SERVICES_DISABLED")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FLAGGED_NOT_ALLOWED")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CONTACT_TRIGGER_NOT_ALLOWED")) & 1) != 0)
  {
    v4 = 3;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("NOT_UPGRADED_TO_CLOUDKIT")))
  {
    v4 = 4;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return _INPBAddTasksIntentResponseReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  $27AAA0BB14FCB8642CC83DAEBE69EA4A *p_warnings;
  unint64_t v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v5 = self->_addedTasks;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v5);
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v7);
  }

  -[_INPBAddTasksIntentResponse modifiedTaskList](self, "modifiedTaskList", v14);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[_INPBAddTasksIntentResponse modifiedTaskList](self, "modifiedTaskList");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  p_warnings = &self->_warnings;
  if (p_warnings->count)
  {
    v13 = 0;
    do
    {
      PBDataWriterWriteInt32Field();
      ++v13;
    }
    while (v13 < p_warnings->count);
  }

}

- (void)dealloc
{
  objc_super v3;

  -[_INPBAddTasksIntentResponse clearWarnings](self, "clearWarnings");
  v3.receiver = self;
  v3.super_class = (Class)_INPBAddTasksIntentResponse;
  -[_INPBAddTasksIntentResponse dealloc](&v3, sel_dealloc);
}

- (_INPBAddTasksIntentResponse)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  _INPBAddTasksIntentResponse *v6;
  uint64_t v7;
  void *v8;

  v4 = a3;
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  v6 = (_INPBAddTasksIntentResponse *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v4, "decodeObjectOfClass:forKey:", v7, v8),
        v6 = (_INPBAddTasksIntentResponse *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = -[_INPBAddTasksIntentResponse initWithData:](self, "initWithData:", v6);

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
  -[_INPBAddTasksIntentResponse data](self, "data");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);

}

- (id)copyWithZone:(_NSZone *)a3
{
  _INPBAddTasksIntentResponse *v5;
  void *v6;
  id v7;

  v5 = -[_INPBAddTasksIntentResponse init](+[_INPBAddTasksIntentResponse allocWithZone:](_INPBAddTasksIntentResponse, "allocWithZone:"), "init");
  v6 = (void *)-[NSArray copyWithZone:](self->_addedTasks, "copyWithZone:", a3);
  -[_INPBAddTasksIntentResponse setAddedTasks:](v5, "setAddedTasks:", v6);

  v7 = -[_INPBTaskList copyWithZone:](self->_modifiedTaskList, "copyWithZone:", a3);
  -[_INPBAddTasksIntentResponse setModifiedTaskList:](v5, "setModifiedTaskList:", v7);

  PBRepeatedInt32Copy();
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
  char IsEqual;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_12;
  -[_INPBAddTasksIntentResponse addedTasks](self, "addedTasks");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addedTasks");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_11;
  -[_INPBAddTasksIntentResponse addedTasks](self, "addedTasks");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[_INPBAddTasksIntentResponse addedTasks](self, "addedTasks");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addedTasks");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_12;
  }
  else
  {

  }
  -[_INPBAddTasksIntentResponse modifiedTaskList](self, "modifiedTaskList");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "modifiedTaskList");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) != (v6 != 0))
  {
    -[_INPBAddTasksIntentResponse modifiedTaskList](self, "modifiedTaskList");
    v12 = objc_claimAutoreleasedReturnValue();
    if (!v12)
    {

LABEL_15:
      IsEqual = PBRepeatedInt32IsEqual();
      goto LABEL_13;
    }
    v13 = (void *)v12;
    -[_INPBAddTasksIntentResponse modifiedTaskList](self, "modifiedTaskList");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "modifiedTaskList");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if (v16)
      goto LABEL_15;
  }
  else
  {
LABEL_11:

  }
LABEL_12:
  IsEqual = 0;
LABEL_13:

  return IsEqual;
}

- (unint64_t)hash
{
  uint64_t v3;
  unint64_t v4;

  v3 = -[NSArray hash](self->_addedTasks, "hash");
  v4 = -[_INPBTaskList hash](self->_modifiedTaskList, "hash") ^ v3;
  return v4 ^ PBRepeatedInt32Hash();
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
  void *v11;
  void *v12;
  void *v13;
  unint64_t v14;
  uint64_t v15;
  __CFString *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[NSArray count](self->_addedTasks, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v5 = self->_addedTasks;
    v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v19;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v19 != v8)
            objc_enumerationMutation(v5);
          objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * v9), "dictionaryRepresentation");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "addObject:", v10);

          ++v9;
        }
        while (v7 != v9);
        v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      }
      while (v7);
    }

    objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("addedTasks"));
  }
  -[_INPBAddTasksIntentResponse modifiedTaskList](self, "modifiedTaskList");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "dictionaryRepresentation");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("modifiedTaskList"));

  if (self->_warnings.count)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", -[_INPBAddTasksIntentResponse warningsCount](self, "warningsCount"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[_INPBAddTasksIntentResponse warningsCount](self, "warningsCount"))
    {
      v14 = 0;
      do
      {
        v15 = self->_warnings.list[v14];
        if (v15 >= 5)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_warnings.list[v14]);
          v16 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v16 = off_1E22905F8[v15];
        }
        objc_msgSend(v13, "addObject:", v16);

        ++v14;
      }
      while (v14 < -[_INPBAddTasksIntentResponse warningsCount](self, "warningsCount"));
    }
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("warnings"));

  }
  return v3;
}

- (NSArray)addedTasks
{
  return self->_addedTasks;
}

- (_INPBTaskList)modifiedTaskList
{
  return self->_modifiedTaskList;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modifiedTaskList, 0);
  objc_storeStrong((id *)&self->_addedTasks, 0);
}

+ (Class)addedTasksType
{
  return (Class)objc_opt_class();
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
