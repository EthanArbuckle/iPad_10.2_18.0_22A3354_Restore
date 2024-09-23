@implementation _CPSessionMissingSuggestionsFeedback

- (_CPSessionMissingSuggestionsFeedback)init
{
  _CPSessionMissingSuggestionsFeedback *v2;
  _CPSessionMissingSuggestionsFeedback *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_CPSessionMissingSuggestionsFeedback;
  v2 = -[_CPSessionMissingSuggestionsFeedback init](&v5, sel_init);
  if (v2)
  {
    -[_CPSessionMissingSuggestionsFeedback setTimestamp:](v2, "setTimestamp:", mach_absolute_time());
    v3 = v2;
  }

  return v2;
}

- (void)setSuggestions:(id)a3
{
  NSArray *v4;
  NSArray *suggestions;

  v4 = (NSArray *)objc_msgSend(a3, "mutableCopy");
  suggestions = self->_suggestions;
  self->_suggestions = v4;

}

- (void)clearSuggestions
{
  -[NSArray removeAllObjects](self->_suggestions, "removeAllObjects");
}

- (void)addSuggestions:(id)a3
{
  id v4;
  NSArray *suggestions;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v4 = a3;
  suggestions = self->_suggestions;
  v8 = v4;
  if (!suggestions)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_suggestions;
    self->_suggestions = v6;

    v4 = v8;
    suggestions = self->_suggestions;
  }
  -[NSArray addObject:](suggestions, "addObject:", v4);

}

- (unint64_t)suggestionsCount
{
  return -[NSArray count](self->_suggestions, "count");
}

- (id)suggestionsAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_suggestions, "objectAtIndexedSubscript:", a3);
}

- (BOOL)readFrom:(id)a3
{
  return _CPSessionMissingSuggestionsFeedbackReadFrom(self, (uint64_t)a3);
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
  if (-[_CPSessionMissingSuggestionsFeedback timestamp](self, "timestamp"))
    PBDataWriterWriteUint64Field();
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v5 = self->_suggestions;
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

- (BOOL)isEqual:(id)a3
{
  id v4;
  unint64_t timestamp;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  BOOL v14;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
  {
    timestamp = self->_timestamp;
    if (timestamp == objc_msgSend(v4, "timestamp"))
    {
      -[_CPSessionMissingSuggestionsFeedback suggestions](self, "suggestions");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "suggestions");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v7;
      if ((v6 == 0) != (v7 != 0))
      {
        -[_CPSessionMissingSuggestionsFeedback suggestions](self, "suggestions");
        v9 = objc_claimAutoreleasedReturnValue();
        if (!v9)
        {

LABEL_11:
          v14 = 1;
          goto LABEL_9;
        }
        v10 = (void *)v9;
        -[_CPSessionMissingSuggestionsFeedback suggestions](self, "suggestions");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "suggestions");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v11, "isEqual:", v12);

        if ((v13 & 1) != 0)
          goto LABEL_11;
      }
      else
      {

      }
    }
  }
  v14 = 0;
LABEL_9:

  return v14;
}

- (unint64_t)hash
{
  unint64_t v2;

  v2 = 2654435761u * self->_timestamp;
  return -[NSArray hash](self->_suggestions, "hash") ^ v2;
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(unint64_t)a3
{
  self->_timestamp = a3;
}

- (NSArray)suggestions
{
  return self->_suggestions;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_suggestions, 0);
}

@end
