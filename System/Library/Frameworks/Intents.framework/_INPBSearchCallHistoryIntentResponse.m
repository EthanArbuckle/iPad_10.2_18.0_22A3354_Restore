@implementation _INPBSearchCallHistoryIntentResponse

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

- (void)setDateCreated:(id)a3
{
  NSString *v4;
  NSString *dateCreated;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  dateCreated = self->_dateCreated;
  self->_dateCreated = v4;

}

- (BOOL)hasDateCreated
{
  return self->_dateCreated != 0;
}

- (void)setStatus:(id)a3
{
  NSString *v4;
  NSString *status;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  status = self->_status;
  self->_status = v4;

}

- (BOOL)hasStatus
{
  return self->_status != 0;
}

- (void)setTargetContact:(id)a3
{
  NSString *v4;
  NSString *targetContact;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  targetContact = self->_targetContact;
  self->_targetContact = v4;

}

- (BOOL)hasTargetContact
{
  return self->_targetContact != 0;
}

- (BOOL)readFrom:(id)a3
{
  return _INPBSearchCallHistoryIntentResponseReadFrom(self, (uint64_t)a3);
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
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = self->_callRecords;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);
  }

  -[_INPBSearchCallHistoryIntentResponse dateCreated](self, "dateCreated", v13);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
    PBDataWriterWriteStringField();
  -[_INPBSearchCallHistoryIntentResponse status](self, "status");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
    PBDataWriterWriteStringField();
  -[_INPBSearchCallHistoryIntentResponse targetContact](self, "targetContact");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
    PBDataWriterWriteStringField();

}

- (_INPBSearchCallHistoryIntentResponse)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  _INPBSearchCallHistoryIntentResponse *v6;
  uint64_t v7;
  void *v8;

  v4 = a3;
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  v6 = (_INPBSearchCallHistoryIntentResponse *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v4, "decodeObjectOfClass:forKey:", v7, v8),
        v6 = (_INPBSearchCallHistoryIntentResponse *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = -[_INPBSearchCallHistoryIntentResponse initWithData:](self, "initWithData:", v6);

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
  -[_INPBSearchCallHistoryIntentResponse data](self, "data");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);

}

- (id)copyWithZone:(_NSZone *)a3
{
  _INPBSearchCallHistoryIntentResponse *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v5 = -[_INPBSearchCallHistoryIntentResponse init](+[_INPBSearchCallHistoryIntentResponse allocWithZone:](_INPBSearchCallHistoryIntentResponse, "allocWithZone:"), "init");
  v6 = (void *)-[NSArray copyWithZone:](self->_callRecords, "copyWithZone:", a3);
  -[_INPBSearchCallHistoryIntentResponse setCallRecords:](v5, "setCallRecords:", v6);

  v7 = (void *)-[NSString copyWithZone:](self->_dateCreated, "copyWithZone:", a3);
  -[_INPBSearchCallHistoryIntentResponse setDateCreated:](v5, "setDateCreated:", v7);

  v8 = (void *)-[NSString copyWithZone:](self->_status, "copyWithZone:", a3);
  -[_INPBSearchCallHistoryIntentResponse setStatus:](v5, "setStatus:", v8);

  v9 = (void *)-[NSString copyWithZone:](self->_targetContact, "copyWithZone:", a3);
  -[_INPBSearchCallHistoryIntentResponse setTargetContact:](v5, "setTargetContact:", v9);

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
  -[_INPBSearchCallHistoryIntentResponse callRecords](self, "callRecords");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "callRecords");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_21;
  -[_INPBSearchCallHistoryIntentResponse callRecords](self, "callRecords");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[_INPBSearchCallHistoryIntentResponse callRecords](self, "callRecords");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "callRecords");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_22;
  }
  else
  {

  }
  -[_INPBSearchCallHistoryIntentResponse dateCreated](self, "dateCreated");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dateCreated");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_21;
  -[_INPBSearchCallHistoryIntentResponse dateCreated](self, "dateCreated");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    -[_INPBSearchCallHistoryIntentResponse dateCreated](self, "dateCreated");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dateCreated");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if (!v16)
      goto LABEL_22;
  }
  else
  {

  }
  -[_INPBSearchCallHistoryIntentResponse status](self, "status");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "status");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_21;
  -[_INPBSearchCallHistoryIntentResponse status](self, "status");
  v17 = objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    v18 = (void *)v17;
    -[_INPBSearchCallHistoryIntentResponse status](self, "status");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "status");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v19, "isEqual:", v20);

    if (!v21)
      goto LABEL_22;
  }
  else
  {

  }
  -[_INPBSearchCallHistoryIntentResponse targetContact](self, "targetContact");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "targetContact");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) != (v6 != 0))
  {
    -[_INPBSearchCallHistoryIntentResponse targetContact](self, "targetContact");
    v22 = objc_claimAutoreleasedReturnValue();
    if (!v22)
    {

LABEL_25:
      v27 = 1;
      goto LABEL_23;
    }
    v23 = (void *)v22;
    -[_INPBSearchCallHistoryIntentResponse targetContact](self, "targetContact");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "targetContact");
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
  uint64_t v3;
  NSUInteger v4;
  NSUInteger v5;

  v3 = -[NSArray hash](self->_callRecords, "hash");
  v4 = -[NSString hash](self->_dateCreated, "hash") ^ v3;
  v5 = -[NSString hash](self->_status, "hash");
  return v4 ^ v5 ^ -[NSString hash](self->_targetContact, "hash");
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
  if (-[NSArray count](self->_callRecords, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v5 = self->_callRecords;
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
          objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * v9), "dictionaryRepresentation", (_QWORD)v18);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "addObject:", v10);

          ++v9;
        }
        while (v7 != v9);
        v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      }
      while (v7);
    }

    objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("callRecords"));
  }
  if (self->_dateCreated)
  {
    -[_INPBSearchCallHistoryIntentResponse dateCreated](self, "dateCreated");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(v11, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("dateCreated"));

  }
  if (self->_status)
  {
    -[_INPBSearchCallHistoryIntentResponse status](self, "status");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(v13, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("status"));

  }
  if (self->_targetContact)
  {
    -[_INPBSearchCallHistoryIntentResponse targetContact](self, "targetContact");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)objc_msgSend(v15, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v16, CFSTR("targetContact"));

  }
  return v3;
}

- (NSArray)callRecords
{
  return self->_callRecords;
}

- (NSString)dateCreated
{
  return self->_dateCreated;
}

- (NSString)status
{
  return self->_status;
}

- (NSString)targetContact
{
  return self->_targetContact;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_targetContact, 0);
  objc_storeStrong((id *)&self->_status, 0);
  objc_storeStrong((id *)&self->_dateCreated, 0);
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
