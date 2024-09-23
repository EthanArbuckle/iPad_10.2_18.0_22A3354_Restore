@implementation _INPBSearchForTimersIntentResponse

- (void)setMatchedTimers:(id)a3
{
  NSArray *v4;
  NSArray *matchedTimers;

  v4 = (NSArray *)objc_msgSend(a3, "mutableCopy");
  matchedTimers = self->_matchedTimers;
  self->_matchedTimers = v4;

}

- (void)clearMatchedTimers
{
  -[NSArray removeAllObjects](self->_matchedTimers, "removeAllObjects");
}

- (void)addMatchedTimers:(id)a3
{
  id v4;
  NSArray *matchedTimers;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v4 = a3;
  matchedTimers = self->_matchedTimers;
  v8 = v4;
  if (!matchedTimers)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_matchedTimers;
    self->_matchedTimers = v6;

    v4 = v8;
    matchedTimers = self->_matchedTimers;
  }
  -[NSArray addObject:](matchedTimers, "addObject:", v4);

}

- (unint64_t)matchedTimersCount
{
  return -[NSArray count](self->_matchedTimers, "count");
}

- (id)matchedTimersAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_matchedTimers, "objectAtIndexedSubscript:", a3);
}

- (void)setTimers:(id)a3
{
  NSArray *v4;
  NSArray *timers;

  v4 = (NSArray *)objc_msgSend(a3, "mutableCopy");
  timers = self->_timers;
  self->_timers = v4;

}

- (void)clearTimers
{
  -[NSArray removeAllObjects](self->_timers, "removeAllObjects");
}

- (void)addTimers:(id)a3
{
  id v4;
  NSArray *timers;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v4 = a3;
  timers = self->_timers;
  v8 = v4;
  if (!timers)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_timers;
    self->_timers = v6;

    v4 = v8;
    timers = self->_timers;
  }
  -[NSArray addObject:](timers, "addObject:", v4);

}

- (unint64_t)timersCount
{
  return -[NSArray count](self->_timers, "count");
}

- (id)timersAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_timers, "objectAtIndexedSubscript:", a3);
}

- (void)setUnmatchedTimers:(id)a3
{
  NSArray *v4;
  NSArray *unmatchedTimers;

  v4 = (NSArray *)objc_msgSend(a3, "mutableCopy");
  unmatchedTimers = self->_unmatchedTimers;
  self->_unmatchedTimers = v4;

}

- (void)clearUnmatchedTimers
{
  -[NSArray removeAllObjects](self->_unmatchedTimers, "removeAllObjects");
}

- (void)addUnmatchedTimers:(id)a3
{
  id v4;
  NSArray *unmatchedTimers;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v4 = a3;
  unmatchedTimers = self->_unmatchedTimers;
  v8 = v4;
  if (!unmatchedTimers)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_unmatchedTimers;
    self->_unmatchedTimers = v6;

    v4 = v8;
    unmatchedTimers = self->_unmatchedTimers;
  }
  -[NSArray addObject:](unmatchedTimers, "addObject:", v4);

}

- (unint64_t)unmatchedTimersCount
{
  return -[NSArray count](self->_unmatchedTimers, "count");
}

- (id)unmatchedTimersAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_unmatchedTimers, "objectAtIndexedSubscript:", a3);
}

- (BOOL)readFrom:(id)a3
{
  return _INPBSearchForTimersIntentResponseReadFrom(self, (uint64_t)a3);
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
  v5 = self->_matchedTimers;
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

  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v10 = self->_timers;
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
  v15 = self->_unmatchedTimers;
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

- (_INPBSearchForTimersIntentResponse)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  _INPBSearchForTimersIntentResponse *v6;
  uint64_t v7;
  void *v8;

  v4 = a3;
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  v6 = (_INPBSearchForTimersIntentResponse *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v4, "decodeObjectOfClass:forKey:", v7, v8),
        v6 = (_INPBSearchForTimersIntentResponse *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = -[_INPBSearchForTimersIntentResponse initWithData:](self, "initWithData:", v6);

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
  -[_INPBSearchForTimersIntentResponse data](self, "data");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);

}

- (id)copyWithZone:(_NSZone *)a3
{
  _INPBSearchForTimersIntentResponse *v5;
  void *v6;
  void *v7;
  void *v8;

  v5 = -[_INPBSearchForTimersIntentResponse init](+[_INPBSearchForTimersIntentResponse allocWithZone:](_INPBSearchForTimersIntentResponse, "allocWithZone:"), "init");
  v6 = (void *)-[NSArray copyWithZone:](self->_matchedTimers, "copyWithZone:", a3);
  -[_INPBSearchForTimersIntentResponse setMatchedTimers:](v5, "setMatchedTimers:", v6);

  v7 = (void *)-[NSArray copyWithZone:](self->_timers, "copyWithZone:", a3);
  -[_INPBSearchForTimersIntentResponse setTimers:](v5, "setTimers:", v7);

  v8 = (void *)-[NSArray copyWithZone:](self->_unmatchedTimers, "copyWithZone:", a3);
  -[_INPBSearchForTimersIntentResponse setUnmatchedTimers:](v5, "setUnmatchedTimers:", v8);

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
  char v21;
  BOOL v22;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_17;
  -[_INPBSearchForTimersIntentResponse matchedTimers](self, "matchedTimers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "matchedTimers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_16;
  -[_INPBSearchForTimersIntentResponse matchedTimers](self, "matchedTimers");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[_INPBSearchForTimersIntentResponse matchedTimers](self, "matchedTimers");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "matchedTimers");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_17;
  }
  else
  {

  }
  -[_INPBSearchForTimersIntentResponse timers](self, "timers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "timers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_16;
  -[_INPBSearchForTimersIntentResponse timers](self, "timers");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    -[_INPBSearchForTimersIntentResponse timers](self, "timers");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "timers");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if (!v16)
      goto LABEL_17;
  }
  else
  {

  }
  -[_INPBSearchForTimersIntentResponse unmatchedTimers](self, "unmatchedTimers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "unmatchedTimers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) != (v6 != 0))
  {
    -[_INPBSearchForTimersIntentResponse unmatchedTimers](self, "unmatchedTimers");
    v17 = objc_claimAutoreleasedReturnValue();
    if (!v17)
    {

LABEL_20:
      v22 = 1;
      goto LABEL_18;
    }
    v18 = (void *)v17;
    -[_INPBSearchForTimersIntentResponse unmatchedTimers](self, "unmatchedTimers");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "unmatchedTimers");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v19, "isEqual:", v20);

    if ((v21 & 1) != 0)
      goto LABEL_20;
  }
  else
  {
LABEL_16:

  }
LABEL_17:
  v22 = 0;
LABEL_18:

  return v22;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;

  v3 = -[NSArray hash](self->_matchedTimers, "hash");
  v4 = -[NSArray hash](self->_timers, "hash") ^ v3;
  return v4 ^ -[NSArray hash](self->_unmatchedTimers, "hash");
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
  NSArray *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  NSArray *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  __int128 v26;
  __int128 v27;
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
  _BYTE v38[128];
  _BYTE v39[128];
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[NSArray count](self->_matchedTimers, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = 0u;
    v35 = 0u;
    v36 = 0u;
    v37 = 0u;
    v5 = self->_matchedTimers;
    v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v34, v40, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v35;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v35 != v8)
            objc_enumerationMutation(v5);
          objc_msgSend(*(id *)(*((_QWORD *)&v34 + 1) + 8 * v9), "dictionaryRepresentation");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "addObject:", v10);

          ++v9;
        }
        while (v7 != v9);
        v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v34, v40, 16);
      }
      while (v7);
    }

    objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("matchedTimers"));
  }
  if (-[NSArray count](self->_timers, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = 0u;
    v31 = 0u;
    v32 = 0u;
    v33 = 0u;
    v12 = self->_timers;
    v13 = -[NSArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v30, v39, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v31;
      do
      {
        v16 = 0;
        do
        {
          if (*(_QWORD *)v31 != v15)
            objc_enumerationMutation(v12);
          objc_msgSend(*(id *)(*((_QWORD *)&v30 + 1) + 8 * v16), "dictionaryRepresentation");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "addObject:", v17);

          ++v16;
        }
        while (v14 != v16);
        v14 = -[NSArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v30, v39, 16);
      }
      while (v14);
    }

    objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("timers"));
  }
  if (-[NSArray count](self->_unmatchedTimers, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    v19 = self->_unmatchedTimers;
    v20 = -[NSArray countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v26, v38, 16);
    if (v20)
    {
      v21 = v20;
      v22 = *(_QWORD *)v27;
      do
      {
        v23 = 0;
        do
        {
          if (*(_QWORD *)v27 != v22)
            objc_enumerationMutation(v19);
          objc_msgSend(*(id *)(*((_QWORD *)&v26 + 1) + 8 * v23), "dictionaryRepresentation", (_QWORD)v26);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "addObject:", v24);

          ++v23;
        }
        while (v21 != v23);
        v21 = -[NSArray countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v26, v38, 16);
      }
      while (v21);
    }

    objc_msgSend(v3, "setObject:forKeyedSubscript:", v18, CFSTR("unmatchedTimers"));
  }
  return v3;
}

- (NSArray)matchedTimers
{
  return self->_matchedTimers;
}

- (NSArray)timers
{
  return self->_timers;
}

- (NSArray)unmatchedTimers
{
  return self->_unmatchedTimers;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unmatchedTimers, 0);
  objc_storeStrong((id *)&self->_timers, 0);
  objc_storeStrong((id *)&self->_matchedTimers, 0);
}

+ (Class)matchedTimersType
{
  return (Class)objc_opt_class();
}

+ (Class)timersType
{
  return (Class)objc_opt_class();
}

+ (Class)unmatchedTimersType
{
  return (Class)objc_opt_class();
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
