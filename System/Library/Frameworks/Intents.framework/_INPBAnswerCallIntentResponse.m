@implementation _INPBAnswerCallIntentResponse

- (void)setAnsweredCall:(id)a3
{
  objc_storeStrong((id *)&self->_answeredCall, a3);
}

- (BOOL)hasAnsweredCall
{
  return self->_answeredCall != 0;
}

- (void)setCallRecords:(id)a3
{
  NSArray *v4;
  NSArray *callRecords;

  v4 = (NSArray *)objc_msgSend(a3, "mutableCopy");
  callRecords = self->_callRecords;
  self->_callRecords = v4;

}

- (void)clearCallRecords
{
  -[NSArray removeAllObjects](self->_callRecords, "removeAllObjects");
}

- (void)addCallRecords:(id)a3
{
  id v4;
  NSArray *callRecords;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v4 = a3;
  callRecords = self->_callRecords;
  v8 = v4;
  if (!callRecords)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_callRecords;
    self->_callRecords = v6;

    v4 = v8;
    callRecords = self->_callRecords;
  }
  -[NSArray addObject:](callRecords, "addObject:", v4);

}

- (unint64_t)callRecordsCount
{
  return -[NSArray count](self->_callRecords, "count");
}

- (id)callRecordsAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_callRecords, "objectAtIndexedSubscript:", a3);
}

- (void)setStatusCode:(int)a3
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
    self->_statusCode = a3;
  }
}

- (BOOL)hasStatusCode
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasStatusCode:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (id)statusCodeAsString:(int)a3
{
  __CFString *v3;

  if (a3 == 1)
    return CFSTR("NO_INCOMING_CALL");
  if (a3 == 2)
  {
    v3 = CFSTR("INCOMING_CALL");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (int)StringAsStatusCode:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  v4 = 1;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NO_INCOMING_CALL")) & 1) == 0)
  {
    if (objc_msgSend(v3, "isEqualToString:", CFSTR("INCOMING_CALL")))
      v4 = 2;
    else
      v4 = 1;
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return _INPBAnswerCallIntentResponseReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[_INPBAnswerCallIntentResponse answeredCall](self, "answeredCall");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[_INPBAnswerCallIntentResponse answeredCall](self, "answeredCall");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v7 = self->_callRecords;
  v8 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v13;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v13 != v10)
          objc_enumerationMutation(v7);
        PBDataWriterWriteSubmessage();
        ++v11;
      }
      while (v9 != v11);
      v9 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v9);
  }

  if (-[_INPBAnswerCallIntentResponse hasStatusCode](self, "hasStatusCode", v12))
    PBDataWriterWriteInt32Field();

}

- (_INPBAnswerCallIntentResponse)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  _INPBAnswerCallIntentResponse *v6;
  uint64_t v7;
  void *v8;

  v4 = a3;
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  v6 = (_INPBAnswerCallIntentResponse *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v4, "decodeObjectOfClass:forKey:", v7, v8),
        v6 = (_INPBAnswerCallIntentResponse *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = -[_INPBAnswerCallIntentResponse initWithData:](self, "initWithData:", v6);

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
  -[_INPBAnswerCallIntentResponse data](self, "data");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);

}

- (id)copyWithZone:(_NSZone *)a3
{
  _INPBAnswerCallIntentResponse *v5;
  id v6;
  void *v7;

  v5 = -[_INPBAnswerCallIntentResponse init](+[_INPBAnswerCallIntentResponse allocWithZone:](_INPBAnswerCallIntentResponse, "allocWithZone:"), "init");
  v6 = -[_INPBConnectedCall copyWithZone:](self->_answeredCall, "copyWithZone:", a3);
  -[_INPBAnswerCallIntentResponse setAnsweredCall:](v5, "setAnsweredCall:", v6);

  v7 = (void *)-[NSArray copyWithZone:](self->_callRecords, "copyWithZone:", a3);
  -[_INPBAnswerCallIntentResponse setCallRecords:](v5, "setCallRecords:", v7);

  if (-[_INPBAnswerCallIntentResponse hasStatusCode](self, "hasStatusCode"))
    -[_INPBAnswerCallIntentResponse setStatusCode:](v5, "setStatusCode:", -[_INPBAnswerCallIntentResponse statusCode](self, "statusCode"));
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
  BOOL v17;
  int v19;
  int statusCode;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_12;
  -[_INPBAnswerCallIntentResponse answeredCall](self, "answeredCall");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "answeredCall");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_11;
  -[_INPBAnswerCallIntentResponse answeredCall](self, "answeredCall");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[_INPBAnswerCallIntentResponse answeredCall](self, "answeredCall");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "answeredCall");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_12;
  }
  else
  {

  }
  -[_INPBAnswerCallIntentResponse callRecords](self, "callRecords");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "callRecords");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_11:

    goto LABEL_12;
  }
  -[_INPBAnswerCallIntentResponse callRecords](self, "callRecords");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    -[_INPBAnswerCallIntentResponse callRecords](self, "callRecords");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "callRecords");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if (!v16)
      goto LABEL_12;
  }
  else
  {

  }
  v19 = -[_INPBAnswerCallIntentResponse hasStatusCode](self, "hasStatusCode");
  if (v19 == objc_msgSend(v4, "hasStatusCode"))
  {
    if (!-[_INPBAnswerCallIntentResponse hasStatusCode](self, "hasStatusCode")
      || !objc_msgSend(v4, "hasStatusCode")
      || (statusCode = self->_statusCode, statusCode == objc_msgSend(v4, "statusCode")))
    {
      v17 = 1;
      goto LABEL_13;
    }
  }
LABEL_12:
  v17 = 0;
LABEL_13:

  return v17;
}

- (unint64_t)hash
{
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v3 = -[_INPBConnectedCall hash](self->_answeredCall, "hash");
  v4 = -[NSArray hash](self->_callRecords, "hash");
  if (-[_INPBAnswerCallIntentResponse hasStatusCode](self, "hasStatusCode"))
    v5 = 2654435761 * self->_statusCode;
  else
    v5 = 0;
  return v4 ^ v3 ^ v5;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  __CFString *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_INPBAnswerCallIntentResponse answeredCall](self, "answeredCall");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("answeredCall"));

  if (-[NSArray count](self->_callRecords, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v7 = self->_callRecords;
    v8 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v17;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v17 != v10)
            objc_enumerationMutation(v7);
          objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * v11), "dictionaryRepresentation");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "addObject:", v12);

          ++v11;
        }
        while (v9 != v11);
        v9 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v9);
    }

    objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("callRecords"));
  }
  if (-[_INPBAnswerCallIntentResponse hasStatusCode](self, "hasStatusCode"))
  {
    v13 = -[_INPBAnswerCallIntentResponse statusCode](self, "statusCode");
    if ((_DWORD)v13 == 1)
    {
      v14 = CFSTR("NO_INCOMING_CALL");
    }
    else if ((_DWORD)v13 == 2)
    {
      v14 = CFSTR("INCOMING_CALL");
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v13);
      v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("statusCode"));

  }
  return v3;
}

- (_INPBConnectedCall)answeredCall
{
  return self->_answeredCall;
}

- (NSArray)callRecords
{
  return self->_callRecords;
}

- (int)statusCode
{
  return self->_statusCode;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_callRecords, 0);
  objc_storeStrong((id *)&self->_answeredCall, 0);
}

+ (Class)callRecordsType
{
  return (Class)objc_opt_class();
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
