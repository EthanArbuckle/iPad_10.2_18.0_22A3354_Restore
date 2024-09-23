@implementation _INPBDeleteTimerIntentResponse

- (void)setDeletedTimers:(id)a3
{
  NSArray *v4;
  NSArray *deletedTimers;

  v4 = (NSArray *)objc_msgSend(a3, "mutableCopy");
  deletedTimers = self->_deletedTimers;
  self->_deletedTimers = v4;

}

- (void)clearDeletedTimers
{
  -[NSArray removeAllObjects](self->_deletedTimers, "removeAllObjects");
}

- (void)addDeletedTimers:(id)a3
{
  id v4;
  NSArray *deletedTimers;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v4 = a3;
  deletedTimers = self->_deletedTimers;
  v8 = v4;
  if (!deletedTimers)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_deletedTimers;
    self->_deletedTimers = v6;

    v4 = v8;
    deletedTimers = self->_deletedTimers;
  }
  -[NSArray addObject:](deletedTimers, "addObject:", v4);

}

- (unint64_t)deletedTimersCount
{
  return -[NSArray count](self->_deletedTimers, "count");
}

- (id)deletedTimersAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_deletedTimers, "objectAtIndexedSubscript:", a3);
}

- (BOOL)readFrom:(id)a3
{
  return _INPBDeleteTimerIntentResponseReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  NSArray *v5;
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
  v5 = self->_deletedTimers;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
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
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

- (_INPBDeleteTimerIntentResponse)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  _INPBDeleteTimerIntentResponse *v6;
  uint64_t v7;
  void *v8;

  v4 = a3;
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  v6 = (_INPBDeleteTimerIntentResponse *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v4, "decodeObjectOfClass:forKey:", v7, v8),
        v6 = (_INPBDeleteTimerIntentResponse *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = -[_INPBDeleteTimerIntentResponse initWithData:](self, "initWithData:", v6);

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
  -[_INPBDeleteTimerIntentResponse data](self, "data");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);

}

- (id)copyWithZone:(_NSZone *)a3
{
  _INPBDeleteTimerIntentResponse *v5;
  void *v6;

  v5 = -[_INPBDeleteTimerIntentResponse init](+[_INPBDeleteTimerIntentResponse allocWithZone:](_INPBDeleteTimerIntentResponse, "allocWithZone:"), "init");
  v6 = (void *)-[NSArray copyWithZone:](self->_deletedTimers, "copyWithZone:", a3);
  -[_INPBDeleteTimerIntentResponse setDeletedTimers:](v5, "setDeletedTimers:", v6);

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  BOOL v13;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
  {
    -[_INPBDeleteTimerIntentResponse deletedTimers](self, "deletedTimers");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "deletedTimers");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if ((v5 == 0) != (v6 != 0))
    {
      -[_INPBDeleteTimerIntentResponse deletedTimers](self, "deletedTimers");
      v8 = objc_claimAutoreleasedReturnValue();
      if (!v8)
      {

LABEL_10:
        v13 = 1;
        goto LABEL_8;
      }
      v9 = (void *)v8;
      -[_INPBDeleteTimerIntentResponse deletedTimers](self, "deletedTimers");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "deletedTimers");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v10, "isEqual:", v11);

      if ((v12 & 1) != 0)
        goto LABEL_10;
    }
    else
    {

    }
  }
  v13 = 0;
LABEL_8:

  return v13;
}

- (unint64_t)hash
{
  return -[NSArray hash](self->_deletedTimers, "hash");
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
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[NSArray count](self->_deletedTimers, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 0u;
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v5 = self->_deletedTimers;
    v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v13;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v13 != v8)
            objc_enumerationMutation(v5);
          objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v9), "dictionaryRepresentation", (_QWORD)v12);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "addObject:", v10);

          ++v9;
        }
        while (v7 != v9);
        v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v7);
    }

    objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("deletedTimers"));
  }
  return v3;
}

- (NSArray)deletedTimers
{
  return self->_deletedTimers;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deletedTimers, 0);
}

+ (Class)deletedTimersType
{
  return (Class)objc_opt_class();
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
