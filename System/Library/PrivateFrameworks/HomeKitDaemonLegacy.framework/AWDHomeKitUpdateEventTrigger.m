@implementation AWDHomeKitUpdateEventTrigger

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

- (void)setResultErrorCode:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_resultErrorCode = a3;
}

- (void)setHasResultErrorCode:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasResultErrorCode
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (int)updateType
{
  if ((*(_BYTE *)&self->_has & 8) != 0)
    return self->_updateType;
  else
    return 1;
}

- (void)setUpdateType:(int)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_updateType = a3;
}

- (void)setHasUpdateType:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasUpdateType
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (id)updateTypeAsString:(int)a3
{
  if ((a3 - 1) < 0xA)
    return off_1E89B1ED8[a3 - 1];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsUpdateType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("HomeKitEventTriggerAddEvent")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("HomeKitEventTriggerUpdateEvents")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("HomeKitEventTriggerRemoveEvent")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("HomeKitEventTriggerUpdateCondition")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("HomeKitEventTriggerUpdateRecurrence")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("HomeKitEventTriggerUpdateExecuteOne")) & 1) != 0)
  {
    v4 = 6;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("HomeKitEventTriggerUpdateOwningDevice")) & 1) != 0)
  {
    v4 = 7;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("HomeKitEventTriggerRename")) & 1) != 0)
  {
    v4 = 8;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("HomeKitEventTriggerUpdateActionSet")) & 1) != 0)
  {
    v4 = 9;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("HomeKitEventTriggerActivate")))
  {
    v4 = 10;
  }
  else
  {
    v4 = 1;
  }

  return v4;
}

- (int)requestOrigin
{
  if ((*(_BYTE *)&self->_has & 2) != 0)
    return self->_requestOrigin;
  else
    return 1;
}

- (void)setRequestOrigin:(int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_requestOrigin = a3;
}

- (void)setHasRequestOrigin:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasRequestOrigin
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (id)requestOriginAsString:(int)a3
{
  if ((a3 - 1) < 3)
    return off_1E89B1F28[a3 - 1];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsRequestOrigin:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("HomeKitEventTriggerRequestByOwner")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("HomeKitEventTriggerRequestBySharedAdmin")) & 1) != 0)
  {
    v4 = 2;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("HomeKitEventTriggerRequestBySharedAdminOnResident")))
  {
    v4 = 3;
  }
  else
  {
    v4 = 1;
  }

  return v4;
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
  v8.super_class = (Class)AWDHomeKitUpdateEventTrigger;
  -[AWDHomeKitUpdateEventTrigger description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AWDHomeKitUpdateEventTrigger dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  char has;
  void *v5;
  void *v6;
  unsigned int v7;
  __CFString *v8;
  unsigned int v9;
  __CFString *v10;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_timestamp);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("timestamp"));

    has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 8) == 0)
        goto LABEL_4;
      goto LABEL_8;
    }
  }
  else if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_resultErrorCode);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("resultErrorCode"));

  has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_4:
    if ((has & 2) == 0)
      return v3;
    goto LABEL_12;
  }
LABEL_8:
  v7 = self->_updateType - 1;
  if (v7 >= 0xA)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_updateType);
    v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = off_1E89B1ED8[v7];
  }
  objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("updateType"));

  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
LABEL_12:
    v9 = self->_requestOrigin - 1;
    if (v9 >= 3)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_requestOrigin);
      v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v10 = off_1E89B1F28[v9];
    }
    objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("requestOrigin"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  int *v4;
  int *v5;
  int *v6;
  int *v8;
  char v9;
  unsigned int v10;
  unint64_t v11;
  uint64_t v12;
  unint64_t v13;
  char v14;
  BOOL v15;
  int v16;
  char v18;
  unsigned int v19;
  unint64_t v20;
  uint64_t v21;
  unint64_t v22;
  char v23;
  char v24;
  unsigned int v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  char v29;
  char v30;
  unsigned int v31;
  uint64_t v32;
  unint64_t v33;
  char v34;
  int v35;
  char v36;
  unsigned int v37;
  uint64_t v38;
  unint64_t v39;
  char v40;
  uint64_t v41;

  v4 = (int *)MEMORY[0x1E0D82BF0];
  v5 = (int *)MEMORY[0x1E0D82BD8];
  v6 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)((char *)a3 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)((char *)a3 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v8 = (int *)MEMORY[0x1E0D82BB8];
    do
    {
      if (*((_BYTE *)a3 + *v6))
        break;
      v9 = 0;
      v10 = 0;
      v11 = 0;
      while (1)
      {
        v12 = *v4;
        v13 = *(_QWORD *)((char *)a3 + v12);
        if (v13 == -1 || v13 >= *(_QWORD *)((char *)a3 + *v5))
          break;
        v14 = *(_BYTE *)(*(_QWORD *)((char *)a3 + *v8) + v13);
        *(_QWORD *)((char *)a3 + v12) = v13 + 1;
        v11 |= (unint64_t)(v14 & 0x7F) << v9;
        if ((v14 & 0x80) == 0)
          goto LABEL_12;
        v9 += 7;
        v15 = v10++ >= 9;
        if (v15)
        {
          v11 = 0;
          v16 = *((unsigned __int8 *)a3 + *v6);
          goto LABEL_14;
        }
      }
      *((_BYTE *)a3 + *v6) = 1;
LABEL_12:
      v16 = *((unsigned __int8 *)a3 + *v6);
      if (*((_BYTE *)a3 + *v6))
        v11 = 0;
LABEL_14:
      if (v16 || (v11 & 7) == 4)
        break;
      switch((v11 >> 3))
      {
        case 1u:
          v18 = 0;
          v19 = 0;
          v20 = 0;
          *(_BYTE *)&self->_has |= 1u;
          while (1)
          {
            v21 = *v4;
            v22 = *(_QWORD *)((char *)a3 + v21);
            if (v22 == -1 || v22 >= *(_QWORD *)((char *)a3 + *v5))
              break;
            v23 = *(_BYTE *)(*(_QWORD *)((char *)a3 + *v8) + v22);
            *(_QWORD *)((char *)a3 + v21) = v22 + 1;
            v20 |= (unint64_t)(v23 & 0x7F) << v18;
            if ((v23 & 0x80) == 0)
              goto LABEL_50;
            v18 += 7;
            v15 = v19++ >= 9;
            if (v15)
            {
              v20 = 0;
              goto LABEL_52;
            }
          }
          *((_BYTE *)a3 + *v6) = 1;
LABEL_50:
          if (*((_BYTE *)a3 + *v6))
            v20 = 0;
LABEL_52:
          self->_timestamp = v20;
          continue;
        case 2u:
          v24 = 0;
          v25 = 0;
          v26 = 0;
          *(_BYTE *)&self->_has |= 4u;
          while (2)
          {
            v27 = *v4;
            v28 = *(_QWORD *)((char *)a3 + v27);
            if (v28 == -1 || v28 >= *(_QWORD *)((char *)a3 + *v5))
            {
              *((_BYTE *)a3 + *v6) = 1;
            }
            else
            {
              v29 = *(_BYTE *)(*(_QWORD *)((char *)a3 + *v8) + v28);
              *(_QWORD *)((char *)a3 + v27) = v28 + 1;
              v26 |= (unint64_t)(v29 & 0x7F) << v24;
              if (v29 < 0)
              {
                v24 += 7;
                v15 = v25++ >= 9;
                if (v15)
                {
                  LODWORD(v26) = 0;
                  goto LABEL_56;
                }
                continue;
              }
            }
            break;
          }
          if (*((_BYTE *)a3 + *v6))
            LODWORD(v26) = 0;
LABEL_56:
          v41 = 20;
          goto LABEL_65;
        case 3u:
          v30 = 0;
          v31 = 0;
          v26 = 0;
          *(_BYTE *)&self->_has |= 8u;
          while (2)
          {
            v32 = *v4;
            v33 = *(_QWORD *)((char *)a3 + v32);
            if (v33 == -1 || v33 >= *(_QWORD *)((char *)a3 + *v5))
            {
              *((_BYTE *)a3 + *v6) = 1;
            }
            else
            {
              v34 = *(_BYTE *)(*(_QWORD *)((char *)a3 + *v8) + v33);
              *(_QWORD *)((char *)a3 + v32) = v33 + 1;
              v26 |= (unint64_t)(v34 & 0x7F) << v30;
              if (v34 < 0)
              {
                v30 += 7;
                v15 = v31++ >= 9;
                if (v15)
                {
                  LODWORD(v26) = 0;
                  goto LABEL_60;
                }
                continue;
              }
            }
            break;
          }
          if (*((_BYTE *)a3 + *v6))
            LODWORD(v26) = 0;
LABEL_60:
          v41 = 24;
          goto LABEL_65;
        case 5u:
          v36 = 0;
          v37 = 0;
          v26 = 0;
          *(_BYTE *)&self->_has |= 2u;
          break;
        default:
          v35 = PBReaderSkipValueWithTag();
          if (!v35)
            return v35;
          continue;
      }
      while (1)
      {
        v38 = *v4;
        v39 = *(_QWORD *)((char *)a3 + v38);
        if (v39 == -1 || v39 >= *(_QWORD *)((char *)a3 + *v5))
          break;
        v40 = *(_BYTE *)(*(_QWORD *)((char *)a3 + *v8) + v39);
        *(_QWORD *)((char *)a3 + v38) = v39 + 1;
        v26 |= (unint64_t)(v40 & 0x7F) << v36;
        if ((v40 & 0x80) == 0)
          goto LABEL_62;
        v36 += 7;
        v15 = v37++ >= 9;
        if (v15)
        {
          LODWORD(v26) = 0;
          goto LABEL_64;
        }
      }
      *((_BYTE *)a3 + *v6) = 1;
LABEL_62:
      if (*((_BYTE *)a3 + *v6))
        LODWORD(v26) = 0;
LABEL_64:
      v41 = 16;
LABEL_65:
      *(_DWORD *)((char *)&self->super.super.isa + v41) = v26;
    }
    while (*(_QWORD *)((char *)a3 + *v4) < *(_QWORD *)((char *)a3 + *v5));
  }
  LOBYTE(v35) = *((_BYTE *)a3 + *v6) == 0;
  return v35;
}

- (void)writeTo:(id)a3
{
  char has;
  id v5;

  v5 = a3;
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteUint64Field();
    has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 8) == 0)
        goto LABEL_4;
LABEL_9:
      PBDataWriterWriteInt32Field();
      if ((*(_BYTE *)&self->_has & 2) == 0)
        goto LABEL_6;
      goto LABEL_5;
    }
  }
  else if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint32Field();
  has = (char)self->_has;
  if ((has & 8) != 0)
    goto LABEL_9;
LABEL_4:
  if ((has & 2) != 0)
LABEL_5:
    PBDataWriterWriteInt32Field();
LABEL_6:

}

- (void)copyTo:(id)a3
{
  _QWORD *v4;
  char has;

  v4 = a3;
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    v4[1] = self->_timestamp;
    *((_BYTE *)v4 + 28) |= 1u;
    has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 8) == 0)
        goto LABEL_4;
LABEL_9:
      *((_DWORD *)v4 + 6) = self->_updateType;
      *((_BYTE *)v4 + 28) |= 8u;
      if ((*(_BYTE *)&self->_has & 2) == 0)
        goto LABEL_6;
      goto LABEL_5;
    }
  }
  else if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)v4 + 5) = self->_resultErrorCode;
  *((_BYTE *)v4 + 28) |= 4u;
  has = (char)self->_has;
  if ((has & 8) != 0)
    goto LABEL_9;
LABEL_4:
  if ((has & 2) != 0)
  {
LABEL_5:
    *((_DWORD *)v4 + 4) = self->_requestOrigin;
    *((_BYTE *)v4 + 28) |= 2u;
  }
LABEL_6:

}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;
  char has;

  result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    *((_QWORD *)result + 1) = self->_timestamp;
    *((_BYTE *)result + 28) |= 1u;
    has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 8) == 0)
        goto LABEL_4;
      goto LABEL_9;
    }
  }
  else if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)result + 5) = self->_resultErrorCode;
  *((_BYTE *)result + 28) |= 4u;
  has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_4:
    if ((has & 2) == 0)
      return result;
    goto LABEL_5;
  }
LABEL_9:
  *((_DWORD *)result + 6) = self->_updateType;
  *((_BYTE *)result + 28) |= 8u;
  if ((*(_BYTE *)&self->_has & 2) == 0)
    return result;
LABEL_5:
  *((_DWORD *)result + 4) = self->_requestOrigin;
  *((_BYTE *)result + 28) |= 2u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_21;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 28) & 1) == 0 || self->_timestamp != *((_QWORD *)v4 + 1))
      goto LABEL_21;
  }
  else if ((*((_BYTE *)v4 + 28) & 1) != 0)
  {
LABEL_21:
    v5 = 0;
    goto LABEL_22;
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 28) & 4) == 0 || self->_resultErrorCode != *((_DWORD *)v4 + 5))
      goto LABEL_21;
  }
  else if ((*((_BYTE *)v4 + 28) & 4) != 0)
  {
    goto LABEL_21;
  }
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    if ((*((_BYTE *)v4 + 28) & 8) == 0 || self->_updateType != *((_DWORD *)v4 + 6))
      goto LABEL_21;
  }
  else if ((*((_BYTE *)v4 + 28) & 8) != 0)
  {
    goto LABEL_21;
  }
  v5 = (*((_BYTE *)v4 + 28) & 2) == 0;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 28) & 2) == 0 || self->_requestOrigin != *((_DWORD *)v4 + 4))
      goto LABEL_21;
    v5 = 1;
  }
LABEL_22:

  return v5;
}

- (unint64_t)hash
{
  unint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v2 = 2654435761u * self->_timestamp;
    if ((*(_BYTE *)&self->_has & 4) != 0)
    {
LABEL_3:
      v3 = 2654435761 * self->_resultErrorCode;
      if ((*(_BYTE *)&self->_has & 8) != 0)
        goto LABEL_4;
LABEL_8:
      v4 = 0;
      if ((*(_BYTE *)&self->_has & 2) != 0)
        goto LABEL_5;
LABEL_9:
      v5 = 0;
      return v3 ^ v2 ^ v4 ^ v5;
    }
  }
  else
  {
    v2 = 0;
    if ((*(_BYTE *)&self->_has & 4) != 0)
      goto LABEL_3;
  }
  v3 = 0;
  if ((*(_BYTE *)&self->_has & 8) == 0)
    goto LABEL_8;
LABEL_4:
  v4 = 2654435761 * self->_updateType;
  if ((*(_BYTE *)&self->_has & 2) == 0)
    goto LABEL_9;
LABEL_5:
  v5 = 2654435761 * self->_requestOrigin;
  return v3 ^ v2 ^ v4 ^ v5;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  char v5;

  v4 = a3;
  v5 = *((_BYTE *)v4 + 28);
  if ((v5 & 1) != 0)
  {
    self->_timestamp = *((_QWORD *)v4 + 1);
    *(_BYTE *)&self->_has |= 1u;
    v5 = *((_BYTE *)v4 + 28);
    if ((v5 & 4) == 0)
    {
LABEL_3:
      if ((v5 & 8) == 0)
        goto LABEL_4;
LABEL_9:
      self->_updateType = *((_DWORD *)v4 + 6);
      *(_BYTE *)&self->_has |= 8u;
      if ((*((_BYTE *)v4 + 28) & 2) == 0)
        goto LABEL_6;
      goto LABEL_5;
    }
  }
  else if ((*((_BYTE *)v4 + 28) & 4) == 0)
  {
    goto LABEL_3;
  }
  self->_resultErrorCode = *((_DWORD *)v4 + 5);
  *(_BYTE *)&self->_has |= 4u;
  v5 = *((_BYTE *)v4 + 28);
  if ((v5 & 8) != 0)
    goto LABEL_9;
LABEL_4:
  if ((v5 & 2) != 0)
  {
LABEL_5:
    self->_requestOrigin = *((_DWORD *)v4 + 4);
    *(_BYTE *)&self->_has |= 2u;
  }
LABEL_6:

}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (unsigned)resultErrorCode
{
  return self->_resultErrorCode;
}

@end
