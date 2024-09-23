@implementation _DKPREvent

- (void)setValue:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 88), a2);
}

- (uint64_t)setTimeZone:(uint64_t)result
{
  if (result)
  {
    *(_BYTE *)(result + 96) |= 8u;
    *(_QWORD *)(result + 48) = a2;
  }
  return result;
}

- (void)setStream:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 80), a2);
}

- (uint64_t)setStartDate:(uint64_t)result
{
  if (result)
    *(double *)(result + 40) = a2;
  return result;
}

- (void)setSource:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 72), a2);
}

- (void)setIdentifier:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 56), a2);
}

- (uint64_t)setEndDate:(uint64_t)result
{
  if (result)
    *(double *)(result + 32) = a2;
  return result;
}

- (uint64_t)setCreationDate:(uint64_t)result
{
  if (result)
  {
    *(_BYTE *)(result + 96) |= 4u;
    *(double *)(result + 24) = a2;
  }
  return result;
}

- (void)addMetadata:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 64);
    v7 = v3;
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *(void **)(a1 + 64);
      *(_QWORD *)(a1 + 64) = v5;

      v4 = *(void **)(a1 + 64);
    }
    objc_msgSend(v4, "addObject:", v7);
    v3 = v7;
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_value, 0);
  objc_storeStrong((id *)&self->_stream, 0);
  objc_storeStrong((id *)&self->_source, 0);
  objc_storeStrong((id *)&self->_metadatas, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

- (void)writeTo:(id)a3
{
  id v4;
  void *v5;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  char has;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!self->_stream)
    -[_DKPREvent writeTo:].cold.1();
  v5 = v4;
  PBDataWriterWriteSubmessage();
  PBDataWriterWriteDoubleField();
  PBDataWriterWriteDoubleField();
  if (!self->_value)
    -[_DKPREvent writeTo:].cold.2();
  PBDataWriterWriteSubmessage();
  if (!self->_identifier)
    -[_DKPREvent writeTo:].cold.3();
  PBDataWriterWriteStringField();
  if (self->_source)
    PBDataWriterWriteSubmessage();
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v6 = self->_metadatas;
  v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v13 != v9)
          objc_enumerationMutation(v6);
        PBDataWriterWriteSubmessage();
      }
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v8);
  }

  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    PBDataWriterWriteDoubleField();
    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_15:
      if ((has & 8) == 0)
        goto LABEL_16;
LABEL_21:
      PBDataWriterWriteInt64Field();
      if ((*(_BYTE *)&self->_has & 1) == 0)
        goto LABEL_18;
      goto LABEL_17;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_15;
  }
  PBDataWriterWriteDoubleField();
  has = (char)self->_has;
  if ((has & 8) != 0)
    goto LABEL_21;
LABEL_16:
  if ((has & 1) != 0)
LABEL_17:
    PBDataWriterWriteInt64Field();
LABEL_18:

}

- (uint64_t)setConfidence:(uint64_t)result
{
  if (result)
  {
    *(_BYTE *)(result + 96) |= 2u;
    *(double *)(result + 16) = a2;
  }
  return result;
}

- (uint64_t)hasConfidence
{
  if (result)
    return (*(unsigned __int8 *)(result + 96) >> 1) & 1;
  return result;
}

- (uint64_t)hasTimeZone
{
  if (result)
    return (*(unsigned __int8 *)(result + 96) >> 3) & 1;
  return result;
}

- (uint64_t)setCompatibilityVersion:(uint64_t)result
{
  if (result)
  {
    *(_BYTE *)(result + 96) |= 1u;
    *(_QWORD *)(result + 8) = a2;
  }
  return result;
}

- (uint64_t)hasCompatibilityVersion
{
  if (result)
    return *(_BYTE *)(result + 96) & 1;
  return result;
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
  v8.super_class = (Class)_DKPREvent;
  -[_DKPREvent description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_DKPREvent dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  _DKPRStream *stream;
  void *v5;
  void *v6;
  void *v7;
  _DKPRValue *value;
  void *v9;
  NSString *identifier;
  _DKPRSource *source;
  void *v12;
  void *v13;
  NSMutableArray *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  char has;
  void *v21;
  void *v23;
  void *v24;
  void *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  stream = self->_stream;
  if (stream)
  {
    -[_DKPRStream dictionaryRepresentation](stream, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("stream"));

  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_startDate);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("startDate"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_endDate);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("endDate"));

  value = self->_value;
  if (value)
  {
    -[_DKPRValue dictionaryRepresentation](value, "dictionaryRepresentation");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("value"));

  }
  identifier = self->_identifier;
  if (identifier)
    objc_msgSend(v3, "setObject:forKey:", identifier, CFSTR("identifier"));
  source = self->_source;
  if (source)
  {
    -[_DKPRSource dictionaryRepresentation](source, "dictionaryRepresentation");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v12, CFSTR("source"));

  }
  if (-[NSMutableArray count](self->_metadatas, "count"))
  {
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_metadatas, "count"));
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    v14 = self->_metadatas;
    v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v27;
      do
      {
        for (i = 0; i != v16; ++i)
        {
          if (*(_QWORD *)v27 != v17)
            objc_enumerationMutation(v14);
          objc_msgSend(*(id *)(*((_QWORD *)&v26 + 1) + 8 * i), "dictionaryRepresentation", (_QWORD)v26);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "addObject:", v19);

        }
        v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
      }
      while (v16);
    }

    objc_msgSend(v3, "setObject:forKey:", v13, CFSTR("metadata"));
  }
  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_creationDate);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v23, CFSTR("creationDate"));

    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_20:
      if ((has & 8) == 0)
        goto LABEL_21;
LABEL_26:
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_timeZone, (_QWORD)v26);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKey:", v25, CFSTR("timeZone"));

      if ((*(_BYTE *)&self->_has & 1) == 0)
        return v3;
      goto LABEL_22;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_20;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_confidence, (_QWORD)v26);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v24, CFSTR("confidence"));

  has = (char)self->_has;
  if ((has & 8) != 0)
    goto LABEL_26;
LABEL_21:
  if ((has & 1) != 0)
  {
LABEL_22:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_compatibilityVersion, (_QWORD)v26);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v21, CFSTR("compatibilityVersion"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return _DKPREventReadFrom((uint64_t)self, (uint64_t)a3);
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  void *v13;
  NSMutableArray *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  char has;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[_DKPRStream copyWithZone:](self->_stream, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 80);
  *(_QWORD *)(v5 + 80) = v6;

  *(double *)(v5 + 40) = self->_startDate;
  *(double *)(v5 + 32) = self->_endDate;
  v8 = -[_DKPRValue copyWithZone:](self->_value, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 88);
  *(_QWORD *)(v5 + 88) = v8;

  v10 = -[NSString copyWithZone:](self->_identifier, "copyWithZone:", a3);
  v11 = *(void **)(v5 + 56);
  *(_QWORD *)(v5 + 56) = v10;

  v12 = -[_DKPRSource copyWithZone:](self->_source, "copyWithZone:", a3);
  v13 = *(void **)(v5 + 72);
  *(_QWORD *)(v5 + 72) = v12;

  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v14 = self->_metadatas;
  v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v16; ++i)
      {
        if (*(_QWORD *)v23 != v17)
          objc_enumerationMutation(v14);
        v19 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * i), "copyWithZone:", a3, (_QWORD)v22);
        -[_DKPREvent addMetadata:](v5, v19);

      }
      v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v16);
  }

  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *(double *)(v5 + 24) = self->_creationDate;
    *(_BYTE *)(v5 + 96) |= 4u;
    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_10:
      if ((has & 8) == 0)
        goto LABEL_11;
LABEL_16:
      *(_QWORD *)(v5 + 48) = self->_timeZone;
      *(_BYTE *)(v5 + 96) |= 8u;
      if ((*(_BYTE *)&self->_has & 1) == 0)
        return (id)v5;
      goto LABEL_12;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_10;
  }
  *(double *)(v5 + 16) = self->_confidence;
  *(_BYTE *)(v5 + 96) |= 2u;
  has = (char)self->_has;
  if ((has & 8) != 0)
    goto LABEL_16;
LABEL_11:
  if ((has & 1) != 0)
  {
LABEL_12:
    *(_QWORD *)(v5 + 8) = self->_compatibilityVersion;
    *(_BYTE *)(v5 + 96) |= 1u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  _DKPRStream *stream;
  _DKPRValue *value;
  NSString *identifier;
  _DKPRSource *source;
  NSMutableArray *metadatas;
  BOOL v10;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_33;
  stream = self->_stream;
  if ((unint64_t)stream | *((_QWORD *)v4 + 10))
  {
    if (!-[_DKPRStream isEqual:](stream, "isEqual:"))
      goto LABEL_33;
  }
  if (self->_startDate != *((double *)v4 + 5))
    goto LABEL_33;
  if (self->_endDate != *((double *)v4 + 4))
    goto LABEL_33;
  value = self->_value;
  if ((unint64_t)value | *((_QWORD *)v4 + 11))
  {
    if (!-[_DKPRValue isEqual:](value, "isEqual:"))
      goto LABEL_33;
  }
  identifier = self->_identifier;
  if ((unint64_t)identifier | *((_QWORD *)v4 + 7))
  {
    if (!-[NSString isEqual:](identifier, "isEqual:"))
      goto LABEL_33;
  }
  source = self->_source;
  if ((unint64_t)source | *((_QWORD *)v4 + 9))
  {
    if (!-[_DKPRSource isEqual:](source, "isEqual:"))
      goto LABEL_33;
  }
  metadatas = self->_metadatas;
  if ((unint64_t)metadatas | *((_QWORD *)v4 + 8))
  {
    if (!-[NSMutableArray isEqual:](metadatas, "isEqual:"))
      goto LABEL_33;
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 96) & 4) == 0 || self->_creationDate != *((double *)v4 + 3))
      goto LABEL_33;
  }
  else if ((*((_BYTE *)v4 + 96) & 4) != 0)
  {
LABEL_33:
    v10 = 0;
    goto LABEL_34;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 96) & 2) == 0 || self->_confidence != *((double *)v4 + 2))
      goto LABEL_33;
  }
  else if ((*((_BYTE *)v4 + 96) & 2) != 0)
  {
    goto LABEL_33;
  }
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    if ((*((_BYTE *)v4 + 96) & 8) == 0 || self->_timeZone != *((_QWORD *)v4 + 6))
      goto LABEL_33;
  }
  else if ((*((_BYTE *)v4 + 96) & 8) != 0)
  {
    goto LABEL_33;
  }
  v10 = (*((_BYTE *)v4 + 96) & 1) == 0;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 96) & 1) == 0 || self->_compatibilityVersion != *((_QWORD *)v4 + 1))
      goto LABEL_33;
    v10 = 1;
  }
LABEL_34:

  return v10;
}

- (unint64_t)hash
{
  double startDate;
  double v4;
  long double v5;
  double v6;
  double v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  double endDate;
  double v13;
  long double v14;
  double v15;
  double v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;
  unint64_t v21;
  NSUInteger v22;
  unint64_t v23;
  uint64_t v24;
  char has;
  unint64_t v26;
  double creationDate;
  double v28;
  long double v29;
  double v30;
  unint64_t v31;
  double confidence;
  double v33;
  long double v34;
  double v35;
  uint64_t v36;
  uint64_t v37;
  unint64_t v39;

  v39 = -[_DKPRStream hash](self->_stream, "hash");
  startDate = self->_startDate;
  v4 = -startDate;
  if (startDate >= 0.0)
    v4 = self->_startDate;
  v5 = floor(v4 + 0.5);
  v6 = (v4 - v5) * 1.84467441e19;
  v7 = fmod(v5, 1.84467441e19);
  v8 = 2654435761u * (unint64_t)v7;
  v9 = v8 + (unint64_t)v6;
  if (v6 <= 0.0)
    v9 = 2654435761u * (unint64_t)v7;
  v10 = v8 - (unint64_t)fabs(v6);
  if (v6 < 0.0)
    v11 = v10;
  else
    v11 = v9;
  endDate = self->_endDate;
  v13 = -endDate;
  if (endDate >= 0.0)
    v13 = self->_endDate;
  v14 = floor(v13 + 0.5);
  v15 = (v13 - v14) * 1.84467441e19;
  v16 = fmod(v14, 1.84467441e19);
  v17 = 2654435761u * (unint64_t)v16;
  v18 = v17 + (unint64_t)v15;
  if (v15 <= 0.0)
    v18 = 2654435761u * (unint64_t)v16;
  v19 = v17 - (unint64_t)fabs(v15);
  if (v15 < 0.0)
    v20 = v19;
  else
    v20 = v18;
  v21 = -[_DKPRValue hash](self->_value, "hash");
  v22 = -[NSString hash](self->_identifier, "hash");
  v23 = -[_DKPRSource hash](self->_source, "hash");
  v24 = -[NSMutableArray hash](self->_metadatas, "hash");
  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    creationDate = self->_creationDate;
    v28 = -creationDate;
    if (creationDate >= 0.0)
      v28 = self->_creationDate;
    v29 = floor(v28 + 0.5);
    v30 = (v28 - v29) * 1.84467441e19;
    v26 = 2654435761u * (unint64_t)fmod(v29, 1.84467441e19);
    if (v30 >= 0.0)
    {
      if (v30 > 0.0)
        v26 += (unint64_t)v30;
    }
    else
    {
      v26 -= (unint64_t)fabs(v30);
    }
  }
  else
  {
    v26 = 0;
  }
  if ((has & 2) != 0)
  {
    confidence = self->_confidence;
    v33 = -confidence;
    if (confidence >= 0.0)
      v33 = self->_confidence;
    v34 = floor(v33 + 0.5);
    v35 = (v33 - v34) * 1.84467441e19;
    v31 = 2654435761u * (unint64_t)fmod(v34, 1.84467441e19);
    if (v35 >= 0.0)
    {
      if (v35 > 0.0)
        v31 += (unint64_t)v35;
      if ((has & 8) == 0)
      {
LABEL_35:
        v36 = 0;
        if ((has & 1) == 0)
          goto LABEL_36;
        goto LABEL_31;
      }
    }
    else
    {
      v31 -= (unint64_t)fabs(v35);
      if ((has & 8) == 0)
        goto LABEL_35;
    }
  }
  else
  {
    v31 = 0;
    if ((has & 8) == 0)
      goto LABEL_35;
  }
  v36 = 2654435761 * self->_timeZone;
  if ((has & 1) == 0)
  {
LABEL_36:
    v37 = 0;
    return v11 ^ v39 ^ v20 ^ v21 ^ v22 ^ v23 ^ v24 ^ v26 ^ v31 ^ v36 ^ v37;
  }
LABEL_31:
  v37 = 2654435761 * self->_compatibilityVersion;
  return v11 ^ v39 ^ v20 ^ v21 ^ v22 ^ v23 ^ v24 ^ v26 ^ v31 ^ v36 ^ v37;
}

- (uint64_t)stream
{
  if (result)
    return *(_QWORD *)(result + 80);
  return result;
}

- (double)startDate
{
  if (a1)
    return *(double *)(a1 + 40);
  else
    return 0.0;
}

- (double)endDate
{
  if (a1)
    return *(double *)(a1 + 32);
  else
    return 0.0;
}

- (uint64_t)value
{
  if (result)
    return *(_QWORD *)(result + 88);
  return result;
}

- (uint64_t)identifier
{
  if (result)
    return *(_QWORD *)(result + 56);
  return result;
}

- (uint64_t)source
{
  if (result)
    return *(_QWORD *)(result + 72);
  return result;
}

- (uint64_t)metadatas
{
  if (result)
    return *(_QWORD *)(result + 64);
  return result;
}

- (double)creationDate
{
  if (a1)
    return *(double *)(a1 + 24);
  else
    return 0.0;
}

- (double)confidence
{
  if (a1)
    return *(double *)(a1 + 16);
  else
    return 0.0;
}

- (uint64_t)timeZone
{
  if (result)
    return *(_QWORD *)(result + 48);
  return result;
}

- (uint64_t)compatibilityVersion
{
  if (result)
    return *(_QWORD *)(result + 8);
  return result;
}

- (void)writeTo:.cold.1()
{
  __assert_rtn("-[_DKPREvent writeTo:]", "_DKPREvent.m", 312, "self->_stream != nil");
}

- (void)writeTo:.cold.2()
{
  __assert_rtn("-[_DKPREvent writeTo:]", "_DKPREvent.m", 325, "self->_value != nil");
}

- (void)writeTo:.cold.3()
{
  __assert_rtn("-[_DKPREvent writeTo:]", "_DKPREvent.m", 330, "nil != self->_identifier");
}

@end
