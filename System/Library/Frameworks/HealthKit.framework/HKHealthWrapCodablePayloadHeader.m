@implementation HKHealthWrapCodablePayloadHeader

- (BOOL)hasChannel
{
  return self->_channel != 0;
}

- (BOOL)hasPayloadType
{
  return self->_payloadType != 0;
}

- (BOOL)hasSubjectUUID
{
  return self->_subjectUUID != 0;
}

- (void)setStartDate:(int64_t)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_startDate = a3;
}

- (void)setHasStartDate:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasStartDate
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setEndDate:(int64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_endDate = a3;
}

- (void)setHasEndDate:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasEndDate
{
  return *(_BYTE *)&self->_has & 1;
}

- (BOOL)hasPayloadIdentifier
{
  return self->_payloadIdentifier != 0;
}

- (BOOL)hasApplicationData
{
  return self->_applicationData != 0;
}

- (void)clearKeyValuePairs
{
  -[NSMutableArray removeAllObjects](self->_keyValuePairs, "removeAllObjects");
}

- (void)addKeyValuePairs:(id)a3
{
  id v4;
  NSMutableArray *keyValuePairs;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  keyValuePairs = self->_keyValuePairs;
  v8 = v4;
  if (!keyValuePairs)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_keyValuePairs;
    self->_keyValuePairs = v6;

    v4 = v8;
    keyValuePairs = self->_keyValuePairs;
  }
  -[NSMutableArray addObject:](keyValuePairs, "addObject:", v4);

}

- (unint64_t)keyValuePairsCount
{
  return -[NSMutableArray count](self->_keyValuePairs, "count");
}

- (id)keyValuePairsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_keyValuePairs, "objectAtIndex:", a3);
}

+ (Class)keyValuePairsType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)HKHealthWrapCodablePayloadHeader;
  -[HKHealthWrapCodablePayloadHeader description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKHealthWrapCodablePayloadHeader dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *channel;
  NSString *payloadType;
  NSData *subjectUUID;
  char has;
  void *v9;
  void *v10;
  NSString *payloadIdentifier;
  NSData *applicationData;
  void *v13;
  NSMutableArray *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  channel = self->_channel;
  if (channel)
    objc_msgSend(v3, "setObject:forKey:", channel, CFSTR("channel"));
  payloadType = self->_payloadType;
  if (payloadType)
    objc_msgSend(v4, "setObject:forKey:", payloadType, CFSTR("payloadType"));
  subjectUUID = self->_subjectUUID;
  if (subjectUUID)
    objc_msgSend(v4, "setObject:forKey:", subjectUUID, CFSTR("subjectUUID"));
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_startDate);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v9, CFSTR("startDate"));

    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_endDate);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v10, CFSTR("endDate"));

  }
  payloadIdentifier = self->_payloadIdentifier;
  if (payloadIdentifier)
    objc_msgSend(v4, "setObject:forKey:", payloadIdentifier, CFSTR("payloadIdentifier"));
  applicationData = self->_applicationData;
  if (applicationData)
    objc_msgSend(v4, "setObject:forKey:", applicationData, CFSTR("applicationData"));
  if (-[NSMutableArray count](self->_keyValuePairs, "count"))
  {
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_keyValuePairs, "count"));
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v14 = self->_keyValuePairs;
    v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v22;
      do
      {
        for (i = 0; i != v16; ++i)
        {
          if (*(_QWORD *)v22 != v17)
            objc_enumerationMutation(v14);
          objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * i), "dictionaryRepresentation", (_QWORD)v21);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "addObject:", v19);

        }
        v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      }
      while (v16);
    }

    objc_msgSend(v4, "setObject:forKey:", v13, CFSTR("keyValuePairs"));
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return HKHealthWrapCodablePayloadHeaderReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  char has;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (self->_channel)
    PBDataWriterWriteStringField();
  if (self->_payloadType)
    PBDataWriterWriteStringField();
  if (self->_subjectUUID)
    PBDataWriterWriteDataField();
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteInt64Field();
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
    PBDataWriterWriteInt64Field();
  if (self->_payloadIdentifier)
    PBDataWriterWriteStringField();
  if (self->_applicationData)
    PBDataWriterWriteDataField();
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v6 = self->_keyValuePairs;
  v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v12 != v9)
          objc_enumerationMutation(v6);
        PBDataWriterWriteSubmessage();
      }
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v8);
  }

}

- (void)copyTo:(id)a3
{
  id v4;
  char has;
  unint64_t v6;
  unint64_t v7;
  uint64_t i;
  void *v9;
  id v10;

  v4 = a3;
  v10 = v4;
  if (self->_channel)
  {
    objc_msgSend(v4, "setChannel:");
    v4 = v10;
  }
  if (self->_payloadType)
  {
    objc_msgSend(v10, "setPayloadType:");
    v4 = v10;
  }
  if (self->_subjectUUID)
  {
    objc_msgSend(v10, "setSubjectUUID:");
    v4 = v10;
  }
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((_QWORD *)v4 + 2) = self->_startDate;
    *((_BYTE *)v4 + 72) |= 2u;
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    *((_QWORD *)v4 + 1) = self->_endDate;
    *((_BYTE *)v4 + 72) |= 1u;
  }
  if (self->_payloadIdentifier)
    objc_msgSend(v10, "setPayloadIdentifier:");
  if (self->_applicationData)
    objc_msgSend(v10, "setApplicationData:");
  if (-[HKHealthWrapCodablePayloadHeader keyValuePairsCount](self, "keyValuePairsCount"))
  {
    objc_msgSend(v10, "clearKeyValuePairs");
    v6 = -[HKHealthWrapCodablePayloadHeader keyValuePairsCount](self, "keyValuePairsCount");
    if (v6)
    {
      v7 = v6;
      for (i = 0; i != v7; ++i)
      {
        -[HKHealthWrapCodablePayloadHeader keyValuePairsAtIndex:](self, "keyValuePairsAtIndex:", i);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "addKeyValuePairs:", v9);

      }
    }
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  char has;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  NSMutableArray *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_channel, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v6;

  v8 = -[NSString copyWithZone:](self->_payloadType, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 56);
  *(_QWORD *)(v5 + 56) = v8;

  v10 = -[NSData copyWithZone:](self->_subjectUUID, "copyWithZone:", a3);
  v11 = *(void **)(v5 + 64);
  *(_QWORD *)(v5 + 64) = v10;

  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *(_QWORD *)(v5 + 16) = self->_startDate;
    *(_BYTE *)(v5 + 72) |= 2u;
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    *(_QWORD *)(v5 + 8) = self->_endDate;
    *(_BYTE *)(v5 + 72) |= 1u;
  }
  v13 = -[NSString copyWithZone:](self->_payloadIdentifier, "copyWithZone:", a3);
  v14 = *(void **)(v5 + 48);
  *(_QWORD *)(v5 + 48) = v13;

  v15 = -[NSData copyWithZone:](self->_applicationData, "copyWithZone:", a3);
  v16 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v15;

  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v17 = self->_keyValuePairs;
  v18 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v25;
    do
    {
      for (i = 0; i != v19; ++i)
      {
        if (*(_QWORD *)v25 != v20)
          objc_enumerationMutation(v17);
        v22 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * i), "copyWithZone:", a3, (_QWORD)v24);
        objc_msgSend((id)v5, "addKeyValuePairs:", v22);

      }
      v19 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    }
    while (v19);
  }

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *channel;
  NSString *payloadType;
  NSData *subjectUUID;
  NSString *payloadIdentifier;
  NSData *applicationData;
  NSMutableArray *keyValuePairs;
  char v11;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_24;
  channel = self->_channel;
  if ((unint64_t)channel | *((_QWORD *)v4 + 4))
  {
    if (!-[NSString isEqual:](channel, "isEqual:"))
      goto LABEL_24;
  }
  payloadType = self->_payloadType;
  if ((unint64_t)payloadType | *((_QWORD *)v4 + 7))
  {
    if (!-[NSString isEqual:](payloadType, "isEqual:"))
      goto LABEL_24;
  }
  subjectUUID = self->_subjectUUID;
  if ((unint64_t)subjectUUID | *((_QWORD *)v4 + 8))
  {
    if (!-[NSData isEqual:](subjectUUID, "isEqual:"))
      goto LABEL_24;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 72) & 2) == 0 || self->_startDate != *((_QWORD *)v4 + 2))
      goto LABEL_24;
  }
  else if ((*((_BYTE *)v4 + 72) & 2) != 0)
  {
LABEL_24:
    v11 = 0;
    goto LABEL_25;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 72) & 1) == 0 || self->_endDate != *((_QWORD *)v4 + 1))
      goto LABEL_24;
  }
  else if ((*((_BYTE *)v4 + 72) & 1) != 0)
  {
    goto LABEL_24;
  }
  payloadIdentifier = self->_payloadIdentifier;
  if ((unint64_t)payloadIdentifier | *((_QWORD *)v4 + 6)
    && !-[NSString isEqual:](payloadIdentifier, "isEqual:"))
  {
    goto LABEL_24;
  }
  applicationData = self->_applicationData;
  if ((unint64_t)applicationData | *((_QWORD *)v4 + 3))
  {
    if (!-[NSData isEqual:](applicationData, "isEqual:"))
      goto LABEL_24;
  }
  keyValuePairs = self->_keyValuePairs;
  if ((unint64_t)keyValuePairs | *((_QWORD *)v4 + 5))
    v11 = -[NSMutableArray isEqual:](keyValuePairs, "isEqual:");
  else
    v11 = 1;
LABEL_25:

  return v11;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSUInteger v8;
  NSUInteger v9;
  uint64_t v10;

  v3 = -[NSString hash](self->_channel, "hash");
  v4 = -[NSString hash](self->_payloadType, "hash");
  v5 = -[NSData hash](self->_subjectUUID, "hash");
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    v6 = 2654435761 * self->_startDate;
    if ((*(_BYTE *)&self->_has & 1) != 0)
      goto LABEL_3;
LABEL_5:
    v7 = 0;
    goto LABEL_6;
  }
  v6 = 0;
  if ((*(_BYTE *)&self->_has & 1) == 0)
    goto LABEL_5;
LABEL_3:
  v7 = 2654435761 * self->_endDate;
LABEL_6:
  v8 = v4 ^ v3 ^ v5 ^ v6;
  v9 = v7 ^ -[NSString hash](self->_payloadIdentifier, "hash");
  v10 = v8 ^ v9 ^ -[NSData hash](self->_applicationData, "hash");
  return v10 ^ -[NSMutableArray hash](self->_keyValuePairs, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  char v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (*((_QWORD *)v4 + 4))
    -[HKHealthWrapCodablePayloadHeader setChannel:](self, "setChannel:");
  if (*((_QWORD *)v4 + 7))
    -[HKHealthWrapCodablePayloadHeader setPayloadType:](self, "setPayloadType:");
  if (*((_QWORD *)v4 + 8))
    -[HKHealthWrapCodablePayloadHeader setSubjectUUID:](self, "setSubjectUUID:");
  v5 = *((_BYTE *)v4 + 72);
  if ((v5 & 2) != 0)
  {
    self->_startDate = *((_QWORD *)v4 + 2);
    *(_BYTE *)&self->_has |= 2u;
    v5 = *((_BYTE *)v4 + 72);
  }
  if ((v5 & 1) != 0)
  {
    self->_endDate = *((_QWORD *)v4 + 1);
    *(_BYTE *)&self->_has |= 1u;
  }
  if (*((_QWORD *)v4 + 6))
    -[HKHealthWrapCodablePayloadHeader setPayloadIdentifier:](self, "setPayloadIdentifier:");
  if (*((_QWORD *)v4 + 3))
    -[HKHealthWrapCodablePayloadHeader setApplicationData:](self, "setApplicationData:");
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v6 = *((id *)v4 + 5);
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v12 != v9)
          objc_enumerationMutation(v6);
        -[HKHealthWrapCodablePayloadHeader addKeyValuePairs:](self, "addKeyValuePairs:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * i), (_QWORD)v11);
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v8);
  }

}

- (NSString)channel
{
  return self->_channel;
}

- (void)setChannel:(id)a3
{
  objc_storeStrong((id *)&self->_channel, a3);
}

- (NSString)payloadType
{
  return self->_payloadType;
}

- (void)setPayloadType:(id)a3
{
  objc_storeStrong((id *)&self->_payloadType, a3);
}

- (NSData)subjectUUID
{
  return self->_subjectUUID;
}

- (void)setSubjectUUID:(id)a3
{
  objc_storeStrong((id *)&self->_subjectUUID, a3);
}

- (int64_t)startDate
{
  return self->_startDate;
}

- (int64_t)endDate
{
  return self->_endDate;
}

- (NSString)payloadIdentifier
{
  return self->_payloadIdentifier;
}

- (void)setPayloadIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_payloadIdentifier, a3);
}

- (NSData)applicationData
{
  return self->_applicationData;
}

- (void)setApplicationData:(id)a3
{
  objc_storeStrong((id *)&self->_applicationData, a3);
}

- (NSMutableArray)keyValuePairs
{
  return self->_keyValuePairs;
}

- (void)setKeyValuePairs:(id)a3
{
  objc_storeStrong((id *)&self->_keyValuePairs, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subjectUUID, 0);
  objc_storeStrong((id *)&self->_payloadType, 0);
  objc_storeStrong((id *)&self->_payloadIdentifier, 0);
  objc_storeStrong((id *)&self->_keyValuePairs, 0);
  objc_storeStrong((id *)&self->_channel, 0);
  objc_storeStrong((id *)&self->_applicationData, 0);
}

@end
