@implementation KCellularLteRsrpRsrqSinr

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

- (void)setLastXSeconds:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_lastXSeconds = a3;
}

- (void)setHasLastXSeconds:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasLastXSeconds
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setLastYSamples:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_lastYSamples = a3;
}

- (void)setHasLastYSamples:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasLastYSamples
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setSamplePeriodMs:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 0x20u;
  self->_samplePeriodMs = a3;
}

- (void)setHasSamplePeriodMs:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xDF | v3;
}

- (BOOL)hasSamplePeriodMs
{
  return (*(_BYTE *)&self->_has >> 5) & 1;
}

- (void)setDurationMs:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_durationMs = a3;
}

- (void)setHasDurationMs:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasDurationMs
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setNumSamples:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 0x10u;
  self->_numSamples = a3;
}

- (void)setHasNumSamples:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xEF | v3;
}

- (BOOL)hasNumSamples
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
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

- (void)setSubsId:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 0x40u;
  self->_subsId = a3;
}

- (void)setHasSubsId:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xBF | v3;
}

- (BOOL)hasSubsId
{
  return (*(_BYTE *)&self->_has >> 6) & 1;
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)KCellularLteRsrpRsrqSinr;
  v3 = -[KCellularLteRsrpRsrqSinr description](&v8, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[KCellularLteRsrpRsrqSinr dictionaryRepresentation](self, "dictionaryRepresentation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ %@"), v4, v5));

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *callId;
  char has;
  void *v7;
  RsrpRsrqSinr *avgValues;
  void *v9;
  id v10;
  NSMutableArray *v11;
  id v12;
  id v13;
  uint64_t v14;
  void *i;
  void *v16;
  void *v17;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", self->_timestamp));
    objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("timestamp"));

  }
  callId = self->_callId;
  if (callId)
    objc_msgSend(v3, "setObject:forKey:", callId, CFSTR("call_id"));
  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_lastXSeconds));
    objc_msgSend(v3, "setObject:forKey:", v19, CFSTR("last_x_seconds"));

    has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_7:
      if ((has & 0x20) == 0)
        goto LABEL_8;
      goto LABEL_27;
    }
  }
  else if ((*(_BYTE *)&self->_has & 8) == 0)
  {
    goto LABEL_7;
  }
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_lastYSamples));
  objc_msgSend(v3, "setObject:forKey:", v20, CFSTR("last_y_samples"));

  has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_8:
    if ((has & 2) == 0)
      goto LABEL_9;
    goto LABEL_28;
  }
LABEL_27:
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_samplePeriodMs));
  objc_msgSend(v3, "setObject:forKey:", v21, CFSTR("sample_period_ms"));

  has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_9:
    if ((has & 0x10) == 0)
      goto LABEL_11;
    goto LABEL_10;
  }
LABEL_28:
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_durationMs));
  objc_msgSend(v3, "setObject:forKey:", v22, CFSTR("duration_ms"));

  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
LABEL_10:
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_numSamples));
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("num_samples"));

  }
LABEL_11:
  avgValues = self->_avgValues;
  if (avgValues)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[RsrpRsrqSinr dictionaryRepresentation](avgValues, "dictionaryRepresentation"));
    objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("avg_values"));

  }
  if (-[NSMutableArray count](self->_instValues, "count"))
  {
    v10 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", -[NSMutableArray count](self->_instValues, "count"));
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v11 = self->_instValues;
    v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v24;
      do
      {
        for (i = 0; i != v13; i = (char *)i + 1)
        {
          if (*(_QWORD *)v24 != v14)
            objc_enumerationMutation(v11);
          v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * (_QWORD)i), "dictionaryRepresentation", (_QWORD)v23));
          objc_msgSend(v10, "addObject:", v16);

        }
        v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
      }
      while (v13);
    }

    objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("inst_values"));
  }
  if ((*(_BYTE *)&self->_has & 0x40) != 0)
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_subsId));
    objc_msgSend(v3, "setObject:forKey:", v17, CFSTR("subs_id"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_100133500((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  void *v5;
  char has;
  NSString *callId;
  char v8;
  RsrpRsrqSinr *avgValues;
  NSMutableArray *v10;
  id v11;
  id v12;
  uint64_t v13;
  void *i;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];

  v4 = a3;
  v5 = v4;
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteUint64Field(v4, self->_timestamp, 1);
    has = (char)self->_has;
  }
  if ((has & 0x40) != 0)
    PBDataWriterWriteUint32Field(v5, self->_subsId, 2);
  callId = self->_callId;
  if (callId)
    PBDataWriterWriteStringField(v5, callId, 3);
  v8 = (char)self->_has;
  if ((v8 & 4) != 0)
  {
    PBDataWriterWriteUint32Field(v5, self->_lastXSeconds, 6);
    v8 = (char)self->_has;
    if ((v8 & 8) == 0)
    {
LABEL_9:
      if ((v8 & 0x20) == 0)
        goto LABEL_10;
      goto LABEL_25;
    }
  }
  else if ((*(_BYTE *)&self->_has & 8) == 0)
  {
    goto LABEL_9;
  }
  PBDataWriterWriteUint32Field(v5, self->_lastYSamples, 7);
  v8 = (char)self->_has;
  if ((v8 & 0x20) == 0)
  {
LABEL_10:
    if ((v8 & 2) == 0)
      goto LABEL_11;
    goto LABEL_26;
  }
LABEL_25:
  PBDataWriterWriteUint32Field(v5, self->_samplePeriodMs, 8);
  v8 = (char)self->_has;
  if ((v8 & 2) == 0)
  {
LABEL_11:
    if ((v8 & 0x10) == 0)
      goto LABEL_13;
    goto LABEL_12;
  }
LABEL_26:
  PBDataWriterWriteUint32Field(v5, self->_durationMs, 10);
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
LABEL_12:
    PBDataWriterWriteUint32Field(v5, self->_numSamples, 11);
LABEL_13:
  avgValues = self->_avgValues;
  if (avgValues)
    PBDataWriterWriteSubmessage(v5, avgValues, 14);
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v10 = self->_instValues;
  v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(_QWORD *)v16 != v13)
          objc_enumerationMutation(v10);
        PBDataWriterWriteSubmessage(v5, *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)i), 15);
      }
      v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v12);
  }

}

- (void)copyTo:(id)a3
{
  _QWORD *v4;
  char has;
  char v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t i;
  void *v10;
  _QWORD *v11;

  v4 = a3;
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    v4[1] = self->_timestamp;
    *((_BYTE *)v4 + 68) |= 1u;
    has = (char)self->_has;
  }
  if ((has & 0x40) != 0)
  {
    *((_DWORD *)v4 + 16) = self->_subsId;
    *((_BYTE *)v4 + 68) |= 0x40u;
  }
  v11 = v4;
  if (self->_callId)
  {
    objc_msgSend(v4, "setCallId:");
    v4 = v11;
  }
  v6 = (char)self->_has;
  if ((v6 & 4) != 0)
  {
    *((_DWORD *)v4 + 12) = self->_lastXSeconds;
    *((_BYTE *)v4 + 68) |= 4u;
    v6 = (char)self->_has;
    if ((v6 & 8) == 0)
    {
LABEL_9:
      if ((v6 & 0x20) == 0)
        goto LABEL_10;
      goto LABEL_22;
    }
  }
  else if ((*(_BYTE *)&self->_has & 8) == 0)
  {
    goto LABEL_9;
  }
  *((_DWORD *)v4 + 13) = self->_lastYSamples;
  *((_BYTE *)v4 + 68) |= 8u;
  v6 = (char)self->_has;
  if ((v6 & 0x20) == 0)
  {
LABEL_10:
    if ((v6 & 2) == 0)
      goto LABEL_11;
    goto LABEL_23;
  }
LABEL_22:
  *((_DWORD *)v4 + 15) = self->_samplePeriodMs;
  *((_BYTE *)v4 + 68) |= 0x20u;
  v6 = (char)self->_has;
  if ((v6 & 2) == 0)
  {
LABEL_11:
    if ((v6 & 0x10) == 0)
      goto LABEL_13;
    goto LABEL_12;
  }
LABEL_23:
  *((_DWORD *)v4 + 8) = self->_durationMs;
  *((_BYTE *)v4 + 68) |= 2u;
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
LABEL_12:
    *((_DWORD *)v4 + 14) = self->_numSamples;
    *((_BYTE *)v4 + 68) |= 0x10u;
  }
LABEL_13:
  if (self->_avgValues)
    objc_msgSend(v11, "setAvgValues:");
  if (-[KCellularLteRsrpRsrqSinr instValuesCount](self, "instValuesCount"))
  {
    objc_msgSend(v11, "clearInstValues");
    v7 = -[KCellularLteRsrpRsrqSinr instValuesCount](self, "instValuesCount");
    if (v7)
    {
      v8 = v7;
      for (i = 0; i != v8; ++i)
      {
        v10 = (void *)objc_claimAutoreleasedReturnValue(-[KCellularLteRsrpRsrqSinr instValuesAtIndex:](self, "instValuesAtIndex:", i));
        objc_msgSend(v11, "addInstValues:", v10);

      }
    }
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  _QWORD *v6;
  char has;
  id v8;
  void *v9;
  char v10;
  id v11;
  void *v12;
  NSMutableArray *v13;
  id v14;
  id v15;
  uint64_t v16;
  void *i;
  id v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];

  v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(self, a2), "allocWithZone:", a3), "init");
  v6 = v5;
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    v5[1] = self->_timestamp;
    *((_BYTE *)v5 + 68) |= 1u;
    has = (char)self->_has;
  }
  if ((has & 0x40) != 0)
  {
    *((_DWORD *)v5 + 16) = self->_subsId;
    *((_BYTE *)v5 + 68) |= 0x40u;
  }
  v8 = -[NSString copyWithZone:](self->_callId, "copyWithZone:", a3);
  v9 = (void *)v6[3];
  v6[3] = v8;

  v10 = (char)self->_has;
  if ((v10 & 4) != 0)
  {
    *((_DWORD *)v6 + 12) = self->_lastXSeconds;
    *((_BYTE *)v6 + 68) |= 4u;
    v10 = (char)self->_has;
    if ((v10 & 8) == 0)
    {
LABEL_7:
      if ((v10 & 0x20) == 0)
        goto LABEL_8;
      goto LABEL_21;
    }
  }
  else if ((*(_BYTE *)&self->_has & 8) == 0)
  {
    goto LABEL_7;
  }
  *((_DWORD *)v6 + 13) = self->_lastYSamples;
  *((_BYTE *)v6 + 68) |= 8u;
  v10 = (char)self->_has;
  if ((v10 & 0x20) == 0)
  {
LABEL_8:
    if ((v10 & 2) == 0)
      goto LABEL_9;
    goto LABEL_22;
  }
LABEL_21:
  *((_DWORD *)v6 + 15) = self->_samplePeriodMs;
  *((_BYTE *)v6 + 68) |= 0x20u;
  v10 = (char)self->_has;
  if ((v10 & 2) == 0)
  {
LABEL_9:
    if ((v10 & 0x10) == 0)
      goto LABEL_11;
    goto LABEL_10;
  }
LABEL_22:
  *((_DWORD *)v6 + 8) = self->_durationMs;
  *((_BYTE *)v6 + 68) |= 2u;
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
LABEL_10:
    *((_DWORD *)v6 + 14) = self->_numSamples;
    *((_BYTE *)v6 + 68) |= 0x10u;
  }
LABEL_11:
  v11 = -[RsrpRsrqSinr copyWithZone:](self->_avgValues, "copyWithZone:", a3);
  v12 = (void *)v6[2];
  v6[2] = v11;

  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v13 = self->_instValues;
  v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v15; i = (char *)i + 1)
      {
        if (*(_QWORD *)v21 != v16)
          objc_enumerationMutation(v13);
        v18 = objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)i), "copyWithZone:", a3, (_QWORD)v20);
        objc_msgSend(v6, "addInstValues:", v18);

      }
      v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v15);
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
    goto LABEL_44;
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 68) & 1) == 0 || self->_timestamp != *((_QWORD *)v4 + 1))
      goto LABEL_44;
  }
  else if ((*((_BYTE *)v4 + 68) & 1) != 0)
  {
    goto LABEL_44;
  }
  if ((*(_BYTE *)&self->_has & 0x40) != 0)
  {
    if ((*((_BYTE *)v4 + 68) & 0x40) == 0 || self->_subsId != *((_DWORD *)v4 + 16))
      goto LABEL_44;
  }
  else if ((*((_BYTE *)v4 + 68) & 0x40) != 0)
  {
    goto LABEL_44;
  }
  callId = self->_callId;
  if ((unint64_t)callId | *((_QWORD *)v4 + 3))
  {
    if (!-[NSString isEqual:](callId, "isEqual:"))
    {
LABEL_44:
      v10 = 0;
      goto LABEL_45;
    }
    has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 68) & 4) == 0 || self->_lastXSeconds != *((_DWORD *)v4 + 12))
      goto LABEL_44;
  }
  else if ((*((_BYTE *)v4 + 68) & 4) != 0)
  {
    goto LABEL_44;
  }
  if ((has & 8) != 0)
  {
    if ((*((_BYTE *)v4 + 68) & 8) == 0 || self->_lastYSamples != *((_DWORD *)v4 + 13))
      goto LABEL_44;
  }
  else if ((*((_BYTE *)v4 + 68) & 8) != 0)
  {
    goto LABEL_44;
  }
  if ((has & 0x20) != 0)
  {
    if ((*((_BYTE *)v4 + 68) & 0x20) == 0 || self->_samplePeriodMs != *((_DWORD *)v4 + 15))
      goto LABEL_44;
  }
  else if ((*((_BYTE *)v4 + 68) & 0x20) != 0)
  {
    goto LABEL_44;
  }
  if ((has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 68) & 2) == 0 || self->_durationMs != *((_DWORD *)v4 + 8))
      goto LABEL_44;
  }
  else if ((*((_BYTE *)v4 + 68) & 2) != 0)
  {
    goto LABEL_44;
  }
  if ((has & 0x10) != 0)
  {
    if ((*((_BYTE *)v4 + 68) & 0x10) == 0 || self->_numSamples != *((_DWORD *)v4 + 14))
      goto LABEL_44;
  }
  else if ((*((_BYTE *)v4 + 68) & 0x10) != 0)
  {
    goto LABEL_44;
  }
  avgValues = self->_avgValues;
  if ((unint64_t)avgValues | *((_QWORD *)v4 + 2) && !-[RsrpRsrqSinr isEqual:](avgValues, "isEqual:"))
    goto LABEL_44;
  instValues = self->_instValues;
  if ((unint64_t)instValues | *((_QWORD *)v4 + 5))
    v10 = -[NSMutableArray isEqual:](instValues, "isEqual:");
  else
    v10 = 1;
LABEL_45:

  return v10;
}

- (unint64_t)hash
{
  unint64_t v3;
  uint64_t v4;
  NSUInteger v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v3 = 2654435761u * self->_timestamp;
    if ((*(_BYTE *)&self->_has & 0x40) != 0)
      goto LABEL_3;
  }
  else
  {
    v3 = 0;
    if ((*(_BYTE *)&self->_has & 0x40) != 0)
    {
LABEL_3:
      v4 = 2654435761 * self->_subsId;
      goto LABEL_6;
    }
  }
  v4 = 0;
LABEL_6:
  v5 = -[NSString hash](self->_callId, "hash");
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    v6 = 2654435761 * self->_lastXSeconds;
    if ((*(_BYTE *)&self->_has & 8) != 0)
    {
LABEL_8:
      v7 = 2654435761 * self->_lastYSamples;
      if ((*(_BYTE *)&self->_has & 0x20) != 0)
        goto LABEL_9;
      goto LABEL_14;
    }
  }
  else
  {
    v6 = 0;
    if ((*(_BYTE *)&self->_has & 8) != 0)
      goto LABEL_8;
  }
  v7 = 0;
  if ((*(_BYTE *)&self->_has & 0x20) != 0)
  {
LABEL_9:
    v8 = 2654435761 * self->_samplePeriodMs;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_10;
LABEL_15:
    v9 = 0;
    if ((*(_BYTE *)&self->_has & 0x10) != 0)
      goto LABEL_11;
LABEL_16:
    v10 = 0;
    goto LABEL_17;
  }
LABEL_14:
  v8 = 0;
  if ((*(_BYTE *)&self->_has & 2) == 0)
    goto LABEL_15;
LABEL_10:
  v9 = 2654435761 * self->_durationMs;
  if ((*(_BYTE *)&self->_has & 0x10) == 0)
    goto LABEL_16;
LABEL_11:
  v10 = 2654435761 * self->_numSamples;
LABEL_17:
  v11 = v4 ^ v3 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v5;
  v12 = -[RsrpRsrqSinr hash](self->_avgValues, "hash");
  return v11 ^ v12 ^ (unint64_t)-[NSMutableArray hash](self->_instValues, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  id v5;
  char v6;
  char v7;
  RsrpRsrqSinr *avgValues;
  uint64_t v9;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  void *i;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];

  v4 = a3;
  v5 = v4;
  v6 = *((_BYTE *)v4 + 68);
  if ((v6 & 1) != 0)
  {
    self->_timestamp = *((_QWORD *)v4 + 1);
    *(_BYTE *)&self->_has |= 1u;
    v6 = *((_BYTE *)v4 + 68);
  }
  if ((v6 & 0x40) != 0)
  {
    self->_subsId = *((_DWORD *)v4 + 16);
    *(_BYTE *)&self->_has |= 0x40u;
  }
  if (*((_QWORD *)v4 + 3))
    -[KCellularLteRsrpRsrqSinr setCallId:](self, "setCallId:");
  v7 = *((_BYTE *)v5 + 68);
  if ((v7 & 4) != 0)
  {
    self->_lastXSeconds = *((_DWORD *)v5 + 12);
    *(_BYTE *)&self->_has |= 4u;
    v7 = *((_BYTE *)v5 + 68);
    if ((v7 & 8) == 0)
    {
LABEL_9:
      if ((v7 & 0x20) == 0)
        goto LABEL_10;
      goto LABEL_18;
    }
  }
  else if ((*((_BYTE *)v5 + 68) & 8) == 0)
  {
    goto LABEL_9;
  }
  self->_lastYSamples = *((_DWORD *)v5 + 13);
  *(_BYTE *)&self->_has |= 8u;
  v7 = *((_BYTE *)v5 + 68);
  if ((v7 & 0x20) == 0)
  {
LABEL_10:
    if ((v7 & 2) == 0)
      goto LABEL_11;
    goto LABEL_19;
  }
LABEL_18:
  self->_samplePeriodMs = *((_DWORD *)v5 + 15);
  *(_BYTE *)&self->_has |= 0x20u;
  v7 = *((_BYTE *)v5 + 68);
  if ((v7 & 2) == 0)
  {
LABEL_11:
    if ((v7 & 0x10) == 0)
      goto LABEL_13;
    goto LABEL_12;
  }
LABEL_19:
  self->_durationMs = *((_DWORD *)v5 + 8);
  *(_BYTE *)&self->_has |= 2u;
  if ((*((_BYTE *)v5 + 68) & 0x10) != 0)
  {
LABEL_12:
    self->_numSamples = *((_DWORD *)v5 + 14);
    *(_BYTE *)&self->_has |= 0x10u;
  }
LABEL_13:
  avgValues = self->_avgValues;
  v9 = *((_QWORD *)v5 + 2);
  if (avgValues)
  {
    if (v9)
      -[RsrpRsrqSinr mergeFrom:](avgValues, "mergeFrom:");
  }
  else if (v9)
  {
    -[KCellularLteRsrpRsrqSinr setAvgValues:](self, "setAvgValues:");
  }
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v10 = *((id *)v5 + 5);
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(_QWORD *)v16 != v13)
          objc_enumerationMutation(v10);
        -[KCellularLteRsrpRsrqSinr addInstValues:](self, "addInstValues:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)i), (_QWORD)v15);
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v12);
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

- (unsigned)lastXSeconds
{
  return self->_lastXSeconds;
}

- (unsigned)lastYSamples
{
  return self->_lastYSamples;
}

- (unsigned)samplePeriodMs
{
  return self->_samplePeriodMs;
}

- (unsigned)durationMs
{
  return self->_durationMs;
}

- (unsigned)numSamples
{
  return self->_numSamples;
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
