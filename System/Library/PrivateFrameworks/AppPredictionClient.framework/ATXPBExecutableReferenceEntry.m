@implementation ATXPBExecutableReferenceEntry

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientModelId, 0);
}

- (BOOL)suggestionIsHidden
{
  if (result)
    return *(_BYTE *)(result + 26) != 0;
  return result;
}

- (BOOL)shouldPurge
{
  if (result)
    return *(_BYTE *)(result + 25) != 0;
  return result;
}

- (BOOL)shouldClearOnEngagement
{
  if (result)
    return *(_BYTE *)(result + 24) != 0;
  return result;
}

- (uint64_t)clientModelId
{
  if (result)
    return *(_QWORD *)(result + 16);
  return result;
}

- (double)date
{
  if (a1)
    return *(double *)(a1 + 8);
  else
    return 0.0;
}

- (uint64_t)setDate:(uint64_t)result
{
  if (result)
  {
    *(_BYTE *)(result + 28) |= 1u;
    *(double *)(result + 8) = a2;
  }
  return result;
}

- (uint64_t)setHasDate:(uint64_t)result
{
  if (result)
    *(_BYTE *)(result + 28) = *(_BYTE *)(result + 28) & 0xFE | a2;
  return result;
}

- (uint64_t)hasDate
{
  if (result)
    return *(_BYTE *)(result + 28) & 1;
  return result;
}

- (BOOL)hasClientModelId
{
  if (result)
    return *(_QWORD *)(result + 16) != 0;
  return result;
}

- (uint64_t)setShouldClearOnEngagement:(uint64_t)result
{
  if (result)
  {
    *(_BYTE *)(result + 28) |= 2u;
    *(_BYTE *)(result + 24) = a2;
  }
  return result;
}

- (uint64_t)setHasShouldClearOnEngagement:(uint64_t)result
{
  char v2;

  if (result)
  {
    if (a2)
      v2 = 2;
    else
      v2 = 0;
    *(_BYTE *)(result + 28) = *(_BYTE *)(result + 28) & 0xFD | v2;
  }
  return result;
}

- (uint64_t)hasShouldClearOnEngagement
{
  if (result)
    return (*(unsigned __int8 *)(result + 28) >> 1) & 1;
  return result;
}

- (uint64_t)setShouldPurge:(uint64_t)result
{
  if (result)
  {
    *(_BYTE *)(result + 28) |= 4u;
    *(_BYTE *)(result + 25) = a2;
  }
  return result;
}

- (uint64_t)setHasShouldPurge:(uint64_t)result
{
  char v2;

  if (result)
  {
    if (a2)
      v2 = 4;
    else
      v2 = 0;
    *(_BYTE *)(result + 28) = *(_BYTE *)(result + 28) & 0xFB | v2;
  }
  return result;
}

- (uint64_t)hasShouldPurge
{
  if (result)
    return (*(unsigned __int8 *)(result + 28) >> 2) & 1;
  return result;
}

- (uint64_t)setSuggestionIsHidden:(uint64_t)result
{
  if (result)
  {
    *(_BYTE *)(result + 28) |= 8u;
    *(_BYTE *)(result + 26) = a2;
  }
  return result;
}

- (uint64_t)setHasSuggestionIsHidden:(uint64_t)result
{
  char v2;

  if (result)
  {
    if (a2)
      v2 = 8;
    else
      v2 = 0;
    *(_BYTE *)(result + 28) = *(_BYTE *)(result + 28) & 0xF7 | v2;
  }
  return result;
}

- (uint64_t)hasSuggestionIsHidden
{
  if (result)
    return (*(unsigned __int8 *)(result + 28) >> 3) & 1;
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
  v8.super_class = (Class)ATXPBExecutableReferenceEntry;
  -[ATXPBExecutableReferenceEntry description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXPBExecutableReferenceEntry dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *clientModelId;
  char has;
  void *v7;
  void *v9;
  void *v10;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_date);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("date"));

  }
  clientModelId = self->_clientModelId;
  if (clientModelId)
    objc_msgSend(v3, "setObject:forKey:", clientModelId, CFSTR("clientModelId"));
  has = (char)self->_has;
  if ((has & 2) == 0)
  {
    if ((*(_BYTE *)&self->_has & 4) == 0)
      goto LABEL_7;
LABEL_11:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_shouldPurge);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("shouldPurge"));

    if ((*(_BYTE *)&self->_has & 8) == 0)
      return v3;
    goto LABEL_8;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_shouldClearOnEngagement);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("shouldClearOnEngagement"));

  has = (char)self->_has;
  if ((has & 4) != 0)
    goto LABEL_11;
LABEL_7:
  if ((has & 8) != 0)
  {
LABEL_8:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_suggestionIsHidden);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("suggestionIsHidden"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return ATXPBExecutableReferenceEntryReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has;
  id v5;

  v5 = a3;
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteDoubleField();
  if (self->_clientModelId)
    PBDataWriterWriteStringField();
  has = (char)self->_has;
  if ((has & 2) == 0)
  {
    if ((*(_BYTE *)&self->_has & 4) == 0)
      goto LABEL_7;
LABEL_11:
    PBDataWriterWriteBOOLField();
    if ((*(_BYTE *)&self->_has & 8) == 0)
      goto LABEL_9;
    goto LABEL_8;
  }
  PBDataWriterWriteBOOLField();
  has = (char)self->_has;
  if ((has & 4) != 0)
    goto LABEL_11;
LABEL_7:
  if ((has & 8) != 0)
LABEL_8:
    PBDataWriterWriteBOOLField();
LABEL_9:

}

- (void)copyTo:(uint64_t)a1
{
  _QWORD *v3;
  void *v4;
  char v5;
  _QWORD *v6;

  v3 = a2;
  if (!a1)
    goto LABEL_10;
  if ((*(_BYTE *)(a1 + 28) & 1) != 0)
  {
    v3[1] = *(_QWORD *)(a1 + 8);
    *((_BYTE *)v3 + 28) |= 1u;
  }
  v4 = *(void **)(a1 + 16);
  if (v4)
  {
    v6 = v3;
    -[ATXPBExecutableReferenceEntry setClientModelId:]((uint64_t)v3, v4);
    v3 = v6;
  }
  v5 = *(_BYTE *)(a1 + 28);
  if ((v5 & 2) == 0)
  {
    if ((*(_BYTE *)(a1 + 28) & 4) == 0)
      goto LABEL_8;
LABEL_12:
    *((_BYTE *)v3 + 25) = *(_BYTE *)(a1 + 25);
    *((_BYTE *)v3 + 28) |= 4u;
    if ((*(_BYTE *)(a1 + 28) & 8) == 0)
      goto LABEL_10;
    goto LABEL_9;
  }
  *((_BYTE *)v3 + 24) = *(_BYTE *)(a1 + 24);
  *((_BYTE *)v3 + 28) |= 2u;
  v5 = *(_BYTE *)(a1 + 28);
  if ((v5 & 4) != 0)
    goto LABEL_12;
LABEL_8:
  if ((v5 & 8) != 0)
  {
LABEL_9:
    *((_BYTE *)v3 + 26) = *(_BYTE *)(a1 + 26);
    *((_BYTE *)v3 + 28) |= 8u;
  }
LABEL_10:

}

- (void)setClientModelId:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 16), a2);
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  char has;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(double *)(v5 + 8) = self->_date;
    *(_BYTE *)(v5 + 28) |= 1u;
  }
  v7 = -[NSString copyWithZone:](self->_clientModelId, "copyWithZone:", a3);
  v8 = *(void **)(v6 + 16);
  *(_QWORD *)(v6 + 16) = v7;

  has = (char)self->_has;
  if ((has & 2) == 0)
  {
    if ((*(_BYTE *)&self->_has & 4) == 0)
      goto LABEL_5;
LABEL_9:
    *(_BYTE *)(v6 + 25) = self->_shouldPurge;
    *(_BYTE *)(v6 + 28) |= 4u;
    if ((*(_BYTE *)&self->_has & 8) == 0)
      return (id)v6;
    goto LABEL_6;
  }
  *(_BYTE *)(v6 + 24) = self->_shouldClearOnEngagement;
  *(_BYTE *)(v6 + 28) |= 2u;
  has = (char)self->_has;
  if ((has & 4) != 0)
    goto LABEL_9;
LABEL_5:
  if ((has & 8) != 0)
  {
LABEL_6:
    *(_BYTE *)(v6 + 26) = self->_suggestionIsHidden;
    *(_BYTE *)(v6 + 28) |= 8u;
  }
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  char has;
  NSString *clientModelId;
  BOOL v7;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_28;
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 28) & 1) == 0 || self->_date != *((double *)v4 + 1))
      goto LABEL_28;
  }
  else if ((*((_BYTE *)v4 + 28) & 1) != 0)
  {
    goto LABEL_28;
  }
  clientModelId = self->_clientModelId;
  if ((unint64_t)clientModelId | *((_QWORD *)v4 + 2))
  {
    if (!-[NSString isEqual:](clientModelId, "isEqual:"))
      goto LABEL_28;
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 28) & 2) == 0)
      goto LABEL_28;
    if (self->_shouldClearOnEngagement)
    {
      if (!*((_BYTE *)v4 + 24))
        goto LABEL_28;
    }
    else if (*((_BYTE *)v4 + 24))
    {
      goto LABEL_28;
    }
  }
  else if ((*((_BYTE *)v4 + 28) & 2) != 0)
  {
    goto LABEL_28;
  }
  if ((has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 28) & 4) == 0)
      goto LABEL_28;
    if (self->_shouldPurge)
    {
      if (!*((_BYTE *)v4 + 25))
        goto LABEL_28;
    }
    else if (*((_BYTE *)v4 + 25))
    {
      goto LABEL_28;
    }
  }
  else if ((*((_BYTE *)v4 + 28) & 4) != 0)
  {
    goto LABEL_28;
  }
  v7 = (*((_BYTE *)v4 + 28) & 8) == 0;
  if ((has & 8) != 0)
  {
    if ((*((_BYTE *)v4 + 28) & 8) != 0)
    {
      if (self->_suggestionIsHidden)
      {
        if (!*((_BYTE *)v4 + 26))
          goto LABEL_28;
      }
      else if (*((_BYTE *)v4 + 26))
      {
        goto LABEL_28;
      }
      v7 = 1;
      goto LABEL_29;
    }
LABEL_28:
    v7 = 0;
  }
LABEL_29:

  return v7;
}

- (unint64_t)hash
{
  unint64_t v3;
  double date;
  double v5;
  long double v6;
  double v7;
  NSUInteger v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    date = self->_date;
    v5 = -date;
    if (date >= 0.0)
      v5 = self->_date;
    v6 = floor(v5 + 0.5);
    v7 = (v5 - v6) * 1.84467441e19;
    v3 = 2654435761u * (unint64_t)fmod(v6, 1.84467441e19);
    if (v7 >= 0.0)
    {
      if (v7 > 0.0)
        v3 += (unint64_t)v7;
    }
    else
    {
      v3 -= (unint64_t)fabs(v7);
    }
  }
  else
  {
    v3 = 0;
  }
  v8 = -[NSString hash](self->_clientModelId, "hash");
  if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    v9 = 0;
    if ((*(_BYTE *)&self->_has & 4) != 0)
      goto LABEL_11;
LABEL_14:
    v10 = 0;
    if ((*(_BYTE *)&self->_has & 8) != 0)
      goto LABEL_12;
LABEL_15:
    v11 = 0;
    return v8 ^ v3 ^ v9 ^ v10 ^ v11;
  }
  v9 = 2654435761 * self->_shouldClearOnEngagement;
  if ((*(_BYTE *)&self->_has & 4) == 0)
    goto LABEL_14;
LABEL_11:
  v10 = 2654435761 * self->_shouldPurge;
  if ((*(_BYTE *)&self->_has & 8) == 0)
    goto LABEL_15;
LABEL_12:
  v11 = 2654435761 * self->_suggestionIsHidden;
  return v8 ^ v3 ^ v9 ^ v10 ^ v11;
}

- (void)mergeFrom:(uint64_t)a1
{
  _QWORD *v3;
  void *v4;
  char v5;
  _QWORD *v6;

  v3 = a2;
  if (!a1)
    goto LABEL_10;
  if ((*((_BYTE *)v3 + 28) & 1) != 0)
  {
    *(_QWORD *)(a1 + 8) = v3[1];
    *(_BYTE *)(a1 + 28) |= 1u;
  }
  v4 = (void *)v3[2];
  if (v4)
  {
    v6 = v3;
    objc_storeStrong((id *)(a1 + 16), v4);
    v3 = v6;
  }
  v5 = *((_BYTE *)v3 + 28);
  if ((v5 & 2) == 0)
  {
    if ((*((_BYTE *)v3 + 28) & 4) == 0)
      goto LABEL_8;
LABEL_12:
    *(_BYTE *)(a1 + 25) = *((_BYTE *)v3 + 25);
    *(_BYTE *)(a1 + 28) |= 4u;
    if ((*((_BYTE *)v3 + 28) & 8) == 0)
      goto LABEL_10;
    goto LABEL_9;
  }
  *(_BYTE *)(a1 + 24) = *((_BYTE *)v3 + 24);
  *(_BYTE *)(a1 + 28) |= 2u;
  v5 = *((_BYTE *)v3 + 28);
  if ((v5 & 4) != 0)
    goto LABEL_12;
LABEL_8:
  if ((v5 & 8) != 0)
  {
LABEL_9:
    *(_BYTE *)(a1 + 26) = *((_BYTE *)v3 + 26);
    *(_BYTE *)(a1 + 28) |= 8u;
  }
LABEL_10:

}

@end
