@implementation _INPBIdentifyIncomingCallerIntentResponse

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
  return _INPBIdentifyIncomingCallerIntentResponseReadFrom(self, (uint64_t)a3);
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
  v5 = self->_callRecords;
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

  if (-[_INPBIdentifyIncomingCallerIntentResponse hasStatusCode](self, "hasStatusCode", v10))
    PBDataWriterWriteInt32Field();

}

- (_INPBIdentifyIncomingCallerIntentResponse)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  _INPBIdentifyIncomingCallerIntentResponse *v6;
  uint64_t v7;
  void *v8;

  v4 = a3;
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  v6 = (_INPBIdentifyIncomingCallerIntentResponse *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v4, "decodeObjectOfClass:forKey:", v7, v8),
        v6 = (_INPBIdentifyIncomingCallerIntentResponse *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = -[_INPBIdentifyIncomingCallerIntentResponse initWithData:](self, "initWithData:", v6);

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
  -[_INPBIdentifyIncomingCallerIntentResponse data](self, "data");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);

}

- (id)copyWithZone:(_NSZone *)a3
{
  _INPBIdentifyIncomingCallerIntentResponse *v5;
  void *v6;

  v5 = -[_INPBIdentifyIncomingCallerIntentResponse init](+[_INPBIdentifyIncomingCallerIntentResponse allocWithZone:](_INPBIdentifyIncomingCallerIntentResponse, "allocWithZone:"), "init");
  v6 = (void *)-[NSArray copyWithZone:](self->_callRecords, "copyWithZone:", a3);
  -[_INPBIdentifyIncomingCallerIntentResponse setCallRecords:](v5, "setCallRecords:", v6);

  if (-[_INPBIdentifyIncomingCallerIntentResponse hasStatusCode](self, "hasStatusCode"))
    -[_INPBIdentifyIncomingCallerIntentResponse setStatusCode:](v5, "setStatusCode:", -[_INPBIdentifyIncomingCallerIntentResponse statusCode](self, "statusCode"));
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
  int v12;
  int v13;
  BOOL v14;
  int statusCode;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_9;
  -[_INPBIdentifyIncomingCallerIntentResponse callRecords](self, "callRecords");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "callRecords");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if ((v5 == 0) != (v6 != 0))
  {
    -[_INPBIdentifyIncomingCallerIntentResponse callRecords](self, "callRecords");
    v8 = objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      v9 = (void *)v8;
      -[_INPBIdentifyIncomingCallerIntentResponse callRecords](self, "callRecords");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "callRecords");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v10, "isEqual:", v11);

      if (!v12)
        goto LABEL_9;
    }
    else
    {

    }
    v13 = -[_INPBIdentifyIncomingCallerIntentResponse hasStatusCode](self, "hasStatusCode");
    if (v13 == objc_msgSend(v4, "hasStatusCode"))
    {
      if (!-[_INPBIdentifyIncomingCallerIntentResponse hasStatusCode](self, "hasStatusCode")
        || !objc_msgSend(v4, "hasStatusCode")
        || (statusCode = self->_statusCode, statusCode == objc_msgSend(v4, "statusCode")))
      {
        v14 = 1;
        goto LABEL_10;
      }
    }
  }
  else
  {

  }
LABEL_9:
  v14 = 0;
LABEL_10:

  return v14;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;

  v3 = -[NSArray hash](self->_callRecords, "hash");
  if (-[_INPBIdentifyIncomingCallerIntentResponse hasStatusCode](self, "hasStatusCode"))
    v4 = 2654435761 * self->_statusCode;
  else
    v4 = 0;
  return v4 ^ v3;
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
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[NSArray count](self->_callRecords, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v5 = self->_callRecords;
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
          objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v9), "dictionaryRepresentation");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "addObject:", v10);

          ++v9;
        }
        while (v7 != v9);
        v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v7);
    }

    objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("callRecords"));
  }
  if (-[_INPBIdentifyIncomingCallerIntentResponse hasStatusCode](self, "hasStatusCode"))
  {
    v11 = -[_INPBIdentifyIncomingCallerIntentResponse statusCode](self, "statusCode");
    if ((_DWORD)v11 == 1)
    {
      v12 = CFSTR("NO_INCOMING_CALL");
    }
    else if ((_DWORD)v11 == 2)
    {
      v12 = CFSTR("INCOMING_CALL");
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v11);
      v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("statusCode"));

  }
  return v3;
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
