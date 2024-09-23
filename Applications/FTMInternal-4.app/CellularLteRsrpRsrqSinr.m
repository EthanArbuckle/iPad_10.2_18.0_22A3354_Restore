@implementation CellularLteRsrpRsrqSinr

- (void)setTimestamp:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasTimestamp
{
  return *(_BYTE *)&self->_has & 1;
}

- (BOOL)hasCallId
{
  return self->_callId != 0;
}

- (BOOL)hasAvgValues
{
  return self->_avgValues != 0;
}

- (void)clearInstValues
{
  -[NSMutableArray removeAllObjects](self->_instValues, "removeAllObjects");
}

- (void)addInstValues:(id)a3
{
  id v4;
  NSMutableArray *instValues;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  instValues = self->_instValues;
  v8 = v4;
  if (!instValues)
  {
    v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v7 = self->_instValues;
    self->_instValues = v6;

    v4 = v8;
    instValues = self->_instValues;
  }
  -[NSMutableArray addObject:](instValues, "addObject:", v4);

}

- (unint64_t)instValuesCount
{
  return (unint64_t)-[NSMutableArray count](self->_instValues, "count");
}

- (id)instValuesAtIndex:(unint64_t)a3
{
  return -[NSMutableArray objectAtIndex:](self->_instValues, "objectAtIndex:", a3);
}

+ (Class)instValuesType
{
  return (Class)objc_opt_class(RsrpRsrqSinr, a2);
}

- (void)setNumSubs:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_numSubs = a3;
}

- (void)setHasNumSubs:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasNumSubs
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setSubsId:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_subsId = a3;
}

- (void)setHasSubsId:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasSubsId
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CellularLteRsrpRsrqSinr;
  v3 = -[CellularLteRsrpRsrqSinr description](&v8, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CellularLteRsrpRsrqSinr dictionaryRepresentation](self, "dictionaryRepresentation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ %@"), v4, v5));

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *callId;
  RsrpRsrqSinr *avgValues;
  void *v7;
  id v8;
  NSMutableArray *v9;
  id v10;
  id v11;
  uint64_t v12;
  void *i;
  void *v14;
  char has;
  void *v16;
  void *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", self->_timestamp));
    objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("timestamp"));

  }
  callId = self->_callId;
  if (callId)
    objc_msgSend(v3, "setObject:forKey:", callId, CFSTR("call_id"));
  avgValues = self->_avgValues;
  if (avgValues)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[RsrpRsrqSinr dictionaryRepresentation](avgValues, "dictionaryRepresentation"));
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("avg_values"));

  }
  if (-[NSMutableArray count](self->_instValues, "count"))
  {
    v8 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", -[NSMutableArray count](self->_instValues, "count"));
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v9 = self->_instValues;
    v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v20;
      do
      {
        for (i = 0; i != v11; i = (char *)i + 1)
        {
          if (*(_QWORD *)v20 != v12)
            objc_enumerationMutation(v9);
          v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * (_QWORD)i), "dictionaryRepresentation", (_QWORD)v19));
          objc_msgSend(v8, "addObject:", v14);

        }
        v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      }
      while (v11);
    }

    objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("inst_values"));
  }
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_numSubs));
    objc_msgSend(v3, "setObject:forKey:", v16, CFSTR("num_subs"));

    has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_subsId));
    objc_msgSend(v3, "setObject:forKey:", v17, CFSTR("subs_id"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_1000D138C((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  void *v5;
  NSString *callId;
  char has;
  RsrpRsrqSinr *avgValues;
  NSMutableArray *v9;
  id v10;
  id v11;
  uint64_t v12;
  void *i;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  v4 = a3;
  v5 = v4;
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteUint64Field(v4, self->_timestamp, 1);
  callId = self->_callId;
  if (callId)
    PBDataWriterWriteStringField(v5, callId, 3);
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteUint32Field(v5, self->_numSubs, 12);
    has = (char)self->_has;
  }
  if ((has & 4) != 0)
    PBDataWriterWriteUint32Field(v5, self->_subsId, 13);
  avgValues = self->_avgValues;
  if (avgValues)
    PBDataWriterWriteSubmessage(v5, avgValues, 14);
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v9 = self->_instValues;
  v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(_QWORD *)v15 != v12)
          objc_enumerationMutation(v9);
        PBDataWriterWriteSubmessage(v5, *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i), 15);
      }
      v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v11);
  }

}

- (void)copyTo:(id)a3
{
  _QWORD *v4;
  char has;
  unint64_t v6;
  unint64_t v7;
  uint64_t i;
  void *v9;
  _QWORD *v10;

  v4 = a3;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4[1] = self->_timestamp;
    *((_BYTE *)v4 + 48) |= 1u;
  }
  v10 = v4;
  if (self->_callId)
  {
    objc_msgSend(v4, "setCallId:");
    v4 = v10;
  }
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((_DWORD *)v4 + 10) = self->_numSubs;
    *((_BYTE *)v4 + 48) |= 2u;
    has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    *((_DWORD *)v4 + 11) = self->_subsId;
    *((_BYTE *)v4 + 48) |= 4u;
  }
  if (self->_avgValues)
    objc_msgSend(v10, "setAvgValues:");
  if (-[CellularLteRsrpRsrqSinr instValuesCount](self, "instValuesCount"))
  {
    objc_msgSend(v10, "clearInstValues");
    v6 = -[CellularLteRsrpRsrqSinr instValuesCount](self, "instValuesCount");
    if (v6)
    {
      v7 = v6;
      for (i = 0; i != v7; ++i)
      {
        v9 = (void *)objc_claimAutoreleasedReturnValue(-[CellularLteRsrpRsrqSinr instValuesAtIndex:](self, "instValuesAtIndex:", i));
        objc_msgSend(v10, "addInstValues:", v9);

      }
    }
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  _QWORD *v6;
  id v7;
  void *v8;
  char has;
  id v10;
  void *v11;
  NSMutableArray *v12;
  id v13;
  id v14;
  uint64_t v15;
  void *i;
  id v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];

  v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(self, a2), "allocWithZone:", a3), "init");
  v6 = v5;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v5[1] = self->_timestamp;
    *((_BYTE *)v5 + 48) |= 1u;
  }
  v7 = -[NSString copyWithZone:](self->_callId, "copyWithZone:", a3);
  v8 = (void *)v6[3];
  v6[3] = v7;

  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((_DWORD *)v6 + 10) = self->_numSubs;
    *((_BYTE *)v6 + 48) |= 2u;
    has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    *((_DWORD *)v6 + 11) = self->_subsId;
    *((_BYTE *)v6 + 48) |= 4u;
  }
  v10 = -[RsrpRsrqSinr copyWithZone:](self->_avgValues, "copyWithZone:", a3);
  v11 = (void *)v6[2];
  v6[2] = v10;

  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v12 = self->_instValues;
  v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v14; i = (char *)i + 1)
      {
        if (*(_QWORD *)v20 != v15)
          objc_enumerationMutation(v12);
        v17 = objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * (_QWORD)i), "copyWithZone:", a3, (_QWORD)v19);
        objc_msgSend(v6, "addInstValues:", v17);

      }
      v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v14);
  }

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  char has;
  NSString *callId;
  RsrpRsrqSinr *avgValues;
  NSMutableArray *instValues;
  unsigned __int8 v10;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class(self, v5)))
    goto LABEL_24;
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 48) & 1) == 0 || self->_timestamp != *((_QWORD *)v4 + 1))
      goto LABEL_24;
  }
  else if ((*((_BYTE *)v4 + 48) & 1) != 0)
  {
    goto LABEL_24;
  }
  callId = self->_callId;
  if ((unint64_t)callId | *((_QWORD *)v4 + 3))
  {
    if (!-[NSString isEqual:](callId, "isEqual:"))
    {
LABEL_24:
      v10 = 0;
      goto LABEL_25;
    }
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 48) & 2) == 0 || self->_numSubs != *((_DWORD *)v4 + 10))
      goto LABEL_24;
  }
  else if ((*((_BYTE *)v4 + 48) & 2) != 0)
  {
    goto LABEL_24;
  }
  if ((has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 48) & 4) == 0 || self->_subsId != *((_DWORD *)v4 + 11))
      goto LABEL_24;
  }
  else if ((*((_BYTE *)v4 + 48) & 4) != 0)
  {
    goto LABEL_24;
  }
  avgValues = self->_avgValues;
  if ((unint64_t)avgValues | *((_QWORD *)v4 + 2) && !-[RsrpRsrqSinr isEqual:](avgValues, "isEqual:"))
    goto LABEL_24;
  instValues = self->_instValues;
  if ((unint64_t)instValues | *((_QWORD *)v4 + 4))
    v10 = -[NSMutableArray isEqual:](instValues, "isEqual:");
  else
    v10 = 1;
LABEL_25:

  return v10;
}

- (unint64_t)hash
{
  unint64_t v3;
  NSUInteger v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;

  if ((*(_BYTE *)&self->_has & 1) != 0)
    v3 = 2654435761u * self->_timestamp;
  else
    v3 = 0;
  v4 = -[NSString hash](self->_callId, "hash");
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    v5 = 2654435761 * self->_numSubs;
    if ((*(_BYTE *)&self->_has & 4) != 0)
      goto LABEL_6;
LABEL_8:
    v6 = 0;
    goto LABEL_9;
  }
  v5 = 0;
  if ((*(_BYTE *)&self->_has & 4) == 0)
    goto LABEL_8;
LABEL_6:
  v6 = 2654435761 * self->_subsId;
LABEL_9:
  v7 = v4 ^ v3 ^ v5 ^ v6 ^ -[RsrpRsrqSinr hash](self->_avgValues, "hash");
  return v7 ^ (unint64_t)-[NSMutableArray hash](self->_instValues, "hash");
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;
  id v5;
  char v6;
  RsrpRsrqSinr *avgValues;
  uint64_t v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  void *i;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  v4 = a3;
  v5 = v4;
  if ((v4[6] & 1) != 0)
  {
    self->_timestamp = v4[1];
    *(_BYTE *)&self->_has |= 1u;
  }
  if (v4[3])
    -[CellularLteRsrpRsrqSinr setCallId:](self, "setCallId:");
  v6 = *((_BYTE *)v5 + 48);
  if ((v6 & 2) != 0)
  {
    self->_numSubs = *((_DWORD *)v5 + 10);
    *(_BYTE *)&self->_has |= 2u;
    v6 = *((_BYTE *)v5 + 48);
  }
  if ((v6 & 4) != 0)
  {
    self->_subsId = *((_DWORD *)v5 + 11);
    *(_BYTE *)&self->_has |= 4u;
  }
  avgValues = self->_avgValues;
  v8 = *((_QWORD *)v5 + 2);
  if (avgValues)
  {
    if (v8)
      -[RsrpRsrqSinr mergeFrom:](avgValues, "mergeFrom:");
  }
  else if (v8)
  {
    -[CellularLteRsrpRsrqSinr setAvgValues:](self, "setAvgValues:");
  }
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v9 = *((id *)v5 + 4);
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(_QWORD *)v15 != v12)
          objc_enumerationMutation(v9);
        -[CellularLteRsrpRsrqSinr addInstValues:](self, "addInstValues:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i), (_QWORD)v14);
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v11);
  }

}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (NSString)callId
{
  return self->_callId;
}

- (void)setCallId:(id)a3
{
  objc_storeStrong((id *)&self->_callId, a3);
}

- (RsrpRsrqSinr)avgValues
{
  return self->_avgValues;
}

- (void)setAvgValues:(id)a3
{
  objc_storeStrong((id *)&self->_avgValues, a3);
}

- (NSMutableArray)instValues
{
  return self->_instValues;
}

- (void)setInstValues:(id)a3
{
  objc_storeStrong((id *)&self->_instValues, a3);
}

- (unsigned)numSubs
{
  return self->_numSubs;
}

- (unsigned)subsId
{
  return self->_subsId;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_instValues, 0);
  objc_storeStrong((id *)&self->_callId, 0);
  objc_storeStrong((id *)&self->_avgValues, 0);
}

@end
