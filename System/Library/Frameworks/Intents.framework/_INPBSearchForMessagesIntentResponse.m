@implementation _INPBSearchForMessagesIntentResponse

- (void)setMessages:(id)a3
{
  NSArray *v4;
  NSArray *messages;

  v4 = (NSArray *)objc_msgSend(a3, "mutableCopy");
  messages = self->_messages;
  self->_messages = v4;

}

- (void)clearMessages
{
  -[NSArray removeAllObjects](self->_messages, "removeAllObjects");
}

- (void)addMessages:(id)a3
{
  id v4;
  NSArray *messages;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v4 = a3;
  messages = self->_messages;
  v8 = v4;
  if (!messages)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_messages;
    self->_messages = v6;

    v4 = v8;
    messages = self->_messages;
  }
  -[NSArray addObject:](messages, "addObject:", v4);

}

- (unint64_t)messagesCount
{
  return -[NSArray count](self->_messages, "count");
}

- (id)messagesAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_messages, "objectAtIndexedSubscript:", a3);
}

- (void)setSearchResults:(id)a3
{
  NSArray *v4;
  NSArray *searchResults;

  v4 = (NSArray *)objc_msgSend(a3, "mutableCopy");
  searchResults = self->_searchResults;
  self->_searchResults = v4;

}

- (void)clearSearchResults
{
  -[NSArray removeAllObjects](self->_searchResults, "removeAllObjects");
}

- (void)addSearchResults:(id)a3
{
  id v4;
  NSArray *searchResults;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v4 = a3;
  searchResults = self->_searchResults;
  v8 = v4;
  if (!searchResults)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_searchResults;
    self->_searchResults = v6;

    v4 = v8;
    searchResults = self->_searchResults;
  }
  -[NSArray addObject:](searchResults, "addObject:", v4);

}

- (unint64_t)searchResultsCount
{
  return -[NSArray count](self->_searchResults, "count");
}

- (id)searchResultsAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_searchResults, "objectAtIndexedSubscript:", a3);
}

- (BOOL)readFrom:(id)a3
{
  return _INPBSearchForMessagesIntentResponseReadFrom(self, (uint64_t)a3);
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
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v5 = self->_messages;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v20;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v20 != v8)
          objc_enumerationMutation(v5);
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
    }
    while (v7);
  }

  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v10 = self->_searchResults;
  v11 = -[NSArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v16;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v16 != v13)
          objc_enumerationMutation(v10);
        PBDataWriterWriteSubmessage();
        ++v14;
      }
      while (v12 != v14);
      v12 = -[NSArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
    }
    while (v12);
  }

}

- (_INPBSearchForMessagesIntentResponse)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  _INPBSearchForMessagesIntentResponse *v6;
  uint64_t v7;
  void *v8;

  v4 = a3;
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  v6 = (_INPBSearchForMessagesIntentResponse *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v4, "decodeObjectOfClass:forKey:", v7, v8),
        v6 = (_INPBSearchForMessagesIntentResponse *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = -[_INPBSearchForMessagesIntentResponse initWithData:](self, "initWithData:", v6);

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
  -[_INPBSearchForMessagesIntentResponse data](self, "data");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);

}

- (id)copyWithZone:(_NSZone *)a3
{
  _INPBSearchForMessagesIntentResponse *v5;
  void *v6;
  void *v7;

  v5 = -[_INPBSearchForMessagesIntentResponse init](+[_INPBSearchForMessagesIntentResponse allocWithZone:](_INPBSearchForMessagesIntentResponse, "allocWithZone:"), "init");
  v6 = (void *)-[NSArray copyWithZone:](self->_messages, "copyWithZone:", a3);
  -[_INPBSearchForMessagesIntentResponse setMessages:](v5, "setMessages:", v6);

  v7 = (void *)-[NSArray copyWithZone:](self->_searchResults, "copyWithZone:", a3);
  -[_INPBSearchForMessagesIntentResponse setSearchResults:](v5, "setSearchResults:", v7);

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
  char v16;
  BOOL v17;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_12;
  -[_INPBSearchForMessagesIntentResponse messages](self, "messages");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "messages");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_11;
  -[_INPBSearchForMessagesIntentResponse messages](self, "messages");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[_INPBSearchForMessagesIntentResponse messages](self, "messages");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "messages");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_12;
  }
  else
  {

  }
  -[_INPBSearchForMessagesIntentResponse searchResults](self, "searchResults");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "searchResults");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) != (v6 != 0))
  {
    -[_INPBSearchForMessagesIntentResponse searchResults](self, "searchResults");
    v12 = objc_claimAutoreleasedReturnValue();
    if (!v12)
    {

LABEL_15:
      v17 = 1;
      goto LABEL_13;
    }
    v13 = (void *)v12;
    -[_INPBSearchForMessagesIntentResponse searchResults](self, "searchResults");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "searchResults");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if ((v16 & 1) != 0)
      goto LABEL_15;
  }
  else
  {
LABEL_11:

  }
LABEL_12:
  v17 = 0;
LABEL_13:

  return v17;
}

- (unint64_t)hash
{
  uint64_t v3;

  v3 = -[NSArray hash](self->_messages, "hash");
  return -[NSArray hash](self->_searchResults, "hash") ^ v3;
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
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[NSArray count](self->_messages, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v5 = self->_messages;
    v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v24;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v24 != v8)
            objc_enumerationMutation(v5);
          objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * v9), "dictionaryRepresentation");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "addObject:", v10);

          ++v9;
        }
        while (v7 != v9);
        v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
      }
      while (v7);
    }

    objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("messages"));
  }
  if (-[NSArray count](self->_searchResults, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v12 = self->_searchResults;
    v13 = -[NSArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v20;
      do
      {
        v16 = 0;
        do
        {
          if (*(_QWORD *)v20 != v15)
            objc_enumerationMutation(v12);
          objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * v16), "dictionaryRepresentation", (_QWORD)v19);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "addObject:", v17);

          ++v16;
        }
        while (v14 != v16);
        v14 = -[NSArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
      }
      while (v14);
    }

    objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("searchResults"));
  }
  return v3;
}

- (NSArray)messages
{
  return self->_messages;
}

- (NSArray)searchResults
{
  return self->_searchResults;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_searchResults, 0);
  objc_storeStrong((id *)&self->_messages, 0);
}

+ (Class)messagesType
{
  return (Class)objc_opt_class();
}

+ (Class)searchResultsType
{
  return (Class)objc_opt_class();
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
