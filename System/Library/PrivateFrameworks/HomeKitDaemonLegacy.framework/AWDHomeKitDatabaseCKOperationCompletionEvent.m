@implementation AWDHomeKitDatabaseCKOperationCompletionEvent

- (void)setTimestamp:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasTimestamp
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setDidSucceed:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_didSucceed = a3;
}

- (void)setHasDidSucceed:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasDidSucceed
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setErrorCode:(int64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_errorCode = a3;
}

- (void)setHasErrorCode:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasErrorCode
{
  return *(_BYTE *)&self->_has & 1;
}

- (int)containerType
{
  if ((*(_BYTE *)&self->_has & 4) != 0)
    return self->_containerType;
  else
    return 0;
}

- (void)setContainerType:(int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_containerType = a3;
}

- (void)setHasContainerType:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasContainerType
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (id)containerTypeAsString:(int)a3
{
  if (a3 < 4)
    return off_1E89B9128[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsContainerType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AWDHomeKitDatabaseCKOperationContainerTypeUnknown")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AWDHomeKitDatabaseCKOperationContainerTypeDefault")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AWDHomeKitDatabaseCKOperationContainerTypeCamera")) & 1) != 0)
  {
    v4 = 2;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("AWDHomeKitDatabaseCKOperationContainerTypeLegacy")))
  {
    v4 = 3;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (BOOL)hasErrorDomain
{
  return self->_errorDomain != 0;
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
  v8.super_class = (Class)AWDHomeKitDatabaseCKOperationCompletionEvent;
  -[AWDHomeKitDatabaseCKOperationCompletionEvent description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AWDHomeKitDatabaseCKOperationCompletionEvent dictionaryRepresentation](self, "dictionaryRepresentation");
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
  void *v7;
  uint64_t containerType;
  __CFString *v9;
  NSString *errorDomain;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_timestamp);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("timestamp"));

    has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 1) == 0)
        goto LABEL_4;
LABEL_8:
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_errorCode);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("errorCode"));

      if ((*(_BYTE *)&self->_has & 4) == 0)
        goto LABEL_13;
LABEL_9:
      containerType = self->_containerType;
      if (containerType >= 4)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_containerType);
        v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v9 = off_1E89B9128[containerType];
      }
      objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("containerType"));

      goto LABEL_13;
    }
  }
  else if ((*(_BYTE *)&self->_has & 8) == 0)
  {
    goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_didSucceed);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("didSucceed"));

  has = (char)self->_has;
  if ((has & 1) != 0)
    goto LABEL_8;
LABEL_4:
  if ((has & 4) != 0)
    goto LABEL_9;
LABEL_13:
  errorDomain = self->_errorDomain;
  if (errorDomain)
    objc_msgSend(v3, "setObject:forKey:", errorDomain, CFSTR("errorDomain"));
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
  int v24;
  char v25;
  unsigned int v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  char v30;
  char v31;
  unsigned int v32;
  uint64_t v33;
  unint64_t v34;
  char v35;
  char v36;
  unsigned int v37;
  uint64_t v38;
  uint64_t v39;
  unint64_t v40;
  char v41;
  NSString *v42;
  NSString *errorDomain;
  uint64_t v44;

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
          *(_BYTE *)&self->_has |= 2u;
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
              goto LABEL_51;
            v18 += 7;
            v15 = v19++ >= 9;
            if (v15)
            {
              v20 = 0;
              goto LABEL_53;
            }
          }
          *((_BYTE *)a3 + *v6) = 1;
LABEL_51:
          if (*((_BYTE *)a3 + *v6))
            v20 = 0;
LABEL_53:
          v44 = 16;
          goto LABEL_62;
        case 2u:
          v25 = 0;
          v26 = 0;
          v27 = 0;
          *(_BYTE *)&self->_has |= 8u;
          while (2)
          {
            v28 = *v4;
            v29 = *(_QWORD *)((char *)a3 + v28);
            if (v29 == -1 || v29 >= *(_QWORD *)((char *)a3 + *v5))
            {
              *((_BYTE *)a3 + *v6) = 1;
            }
            else
            {
              v30 = *(_BYTE *)(*(_QWORD *)((char *)a3 + *v8) + v29);
              *(_QWORD *)((char *)a3 + v28) = v29 + 1;
              v27 |= (unint64_t)(v30 & 0x7F) << v25;
              if (v30 < 0)
              {
                v25 += 7;
                v15 = v26++ >= 9;
                if (v15)
                {
                  v27 = 0;
                  goto LABEL_57;
                }
                continue;
              }
            }
            break;
          }
          if (*((_BYTE *)a3 + *v6))
            v27 = 0;
LABEL_57:
          self->_didSucceed = v27 != 0;
          continue;
        case 3u:
          v31 = 0;
          v32 = 0;
          v20 = 0;
          *(_BYTE *)&self->_has |= 1u;
          while (2)
          {
            v33 = *v4;
            v34 = *(_QWORD *)((char *)a3 + v33);
            if (v34 == -1 || v34 >= *(_QWORD *)((char *)a3 + *v5))
            {
              *((_BYTE *)a3 + *v6) = 1;
            }
            else
            {
              v35 = *(_BYTE *)(*(_QWORD *)((char *)a3 + *v8) + v34);
              *(_QWORD *)((char *)a3 + v33) = v34 + 1;
              v20 |= (unint64_t)(v35 & 0x7F) << v31;
              if (v35 < 0)
              {
                v31 += 7;
                v15 = v32++ >= 9;
                if (v15)
                {
                  v20 = 0;
                  goto LABEL_61;
                }
                continue;
              }
            }
            break;
          }
          if (*((_BYTE *)a3 + *v6))
            v20 = 0;
LABEL_61:
          v44 = 8;
LABEL_62:
          *(Class *)((char *)&self->super.super.isa + v44) = (Class)v20;
          continue;
        case 4u:
          v36 = 0;
          v37 = 0;
          v38 = 0;
          *(_BYTE *)&self->_has |= 4u;
          break;
        case 5u:
          PBReaderReadString();
          v42 = (NSString *)objc_claimAutoreleasedReturnValue();
          errorDomain = self->_errorDomain;
          self->_errorDomain = v42;

          continue;
        default:
          v24 = PBReaderSkipValueWithTag();
          if (!v24)
            return v24;
          continue;
      }
      while (1)
      {
        v39 = *v4;
        v40 = *(_QWORD *)((char *)a3 + v39);
        if (v40 == -1 || v40 >= *(_QWORD *)((char *)a3 + *v5))
          break;
        v41 = *(_BYTE *)(*(_QWORD *)((char *)a3 + *v8) + v40);
        *(_QWORD *)((char *)a3 + v39) = v40 + 1;
        v38 |= (unint64_t)(v41 & 0x7F) << v36;
        if ((v41 & 0x80) == 0)
          goto LABEL_64;
        v36 += 7;
        v15 = v37++ >= 9;
        if (v15)
        {
          LODWORD(v38) = 0;
          goto LABEL_66;
        }
      }
      *((_BYTE *)a3 + *v6) = 1;
LABEL_64:
      if (*((_BYTE *)a3 + *v6))
        LODWORD(v38) = 0;
LABEL_66:
      self->_containerType = v38;
    }
    while (*(_QWORD *)((char *)a3 + *v4) < *(_QWORD *)((char *)a3 + *v5));
  }
  LOBYTE(v24) = *((_BYTE *)a3 + *v6) == 0;
  return v24;
}

- (void)writeTo:(id)a3
{
  id v4;
  char has;
  id v6;

  v4 = a3;
  has = (char)self->_has;
  v6 = v4;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteUint64Field();
    v4 = v6;
    has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 1) == 0)
        goto LABEL_4;
      goto LABEL_11;
    }
  }
  else if ((*(_BYTE *)&self->_has & 8) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteBOOLField();
  v4 = v6;
  has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_4:
    if ((has & 4) == 0)
      goto LABEL_6;
    goto LABEL_5;
  }
LABEL_11:
  PBDataWriterWriteInt64Field();
  v4 = v6;
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
LABEL_5:
    PBDataWriterWriteInt32Field();
    v4 = v6;
  }
LABEL_6:
  if (self->_errorDomain)
  {
    PBDataWriterWriteStringField();
    v4 = v6;
  }

}

- (void)copyTo:(id)a3
{
  _QWORD *v4;
  char has;
  _QWORD *v6;

  v4 = a3;
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v4[2] = self->_timestamp;
    *((_BYTE *)v4 + 44) |= 2u;
    has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 1) == 0)
        goto LABEL_4;
      goto LABEL_11;
    }
  }
  else if ((*(_BYTE *)&self->_has & 8) == 0)
  {
    goto LABEL_3;
  }
  *((_BYTE *)v4 + 40) = self->_didSucceed;
  *((_BYTE *)v4 + 44) |= 8u;
  has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_4:
    if ((has & 4) == 0)
      goto LABEL_6;
    goto LABEL_5;
  }
LABEL_11:
  v4[1] = self->_errorCode;
  *((_BYTE *)v4 + 44) |= 1u;
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
LABEL_5:
    *((_DWORD *)v4 + 6) = self->_containerType;
    *((_BYTE *)v4 + 44) |= 4u;
  }
LABEL_6:
  if (self->_errorDomain)
  {
    v6 = v4;
    objc_msgSend(v4, "setErrorDomain:");
    v4 = v6;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  _QWORD *v6;
  char has;
  uint64_t v8;
  void *v9;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = (_QWORD *)v5;
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *(_QWORD *)(v5 + 16) = self->_timestamp;
    *(_BYTE *)(v5 + 44) |= 2u;
    has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 1) == 0)
        goto LABEL_4;
LABEL_9:
      *(_QWORD *)(v5 + 8) = self->_errorCode;
      *(_BYTE *)(v5 + 44) |= 1u;
      if ((*(_BYTE *)&self->_has & 4) == 0)
        goto LABEL_6;
      goto LABEL_5;
    }
  }
  else if ((*(_BYTE *)&self->_has & 8) == 0)
  {
    goto LABEL_3;
  }
  *(_BYTE *)(v5 + 40) = self->_didSucceed;
  *(_BYTE *)(v5 + 44) |= 8u;
  has = (char)self->_has;
  if ((has & 1) != 0)
    goto LABEL_9;
LABEL_4:
  if ((has & 4) != 0)
  {
LABEL_5:
    *(_DWORD *)(v5 + 24) = self->_containerType;
    *(_BYTE *)(v5 + 44) |= 4u;
  }
LABEL_6:
  v8 = -[NSString copyWithZone:](self->_errorDomain, "copyWithZone:", a3);
  v9 = (void *)v6[4];
  v6[4] = v8;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *errorDomain;
  char v6;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_27;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 44) & 2) == 0 || self->_timestamp != *((_QWORD *)v4 + 2))
      goto LABEL_27;
  }
  else if ((*((_BYTE *)v4 + 44) & 2) != 0)
  {
    goto LABEL_27;
  }
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    if ((*((_BYTE *)v4 + 44) & 8) != 0)
    {
      if (self->_didSucceed)
      {
        if (!*((_BYTE *)v4 + 40))
          goto LABEL_27;
        goto LABEL_15;
      }
      if (!*((_BYTE *)v4 + 40))
        goto LABEL_15;
    }
LABEL_27:
    v6 = 0;
    goto LABEL_28;
  }
  if ((*((_BYTE *)v4 + 44) & 8) != 0)
    goto LABEL_27;
LABEL_15:
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 44) & 1) == 0 || self->_errorCode != *((_QWORD *)v4 + 1))
      goto LABEL_27;
  }
  else if ((*((_BYTE *)v4 + 44) & 1) != 0)
  {
    goto LABEL_27;
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 44) & 4) == 0 || self->_containerType != *((_DWORD *)v4 + 6))
      goto LABEL_27;
  }
  else if ((*((_BYTE *)v4 + 44) & 4) != 0)
  {
    goto LABEL_27;
  }
  errorDomain = self->_errorDomain;
  if ((unint64_t)errorDomain | *((_QWORD *)v4 + 4))
    v6 = -[NSString isEqual:](errorDomain, "isEqual:");
  else
    v6 = 1;
LABEL_28:

  return v6;
}

- (unint64_t)hash
{
  unint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    v2 = 2654435761u * self->_timestamp;
    if ((*(_BYTE *)&self->_has & 8) != 0)
    {
LABEL_3:
      v3 = 2654435761 * self->_didSucceed;
      if ((*(_BYTE *)&self->_has & 1) != 0)
        goto LABEL_4;
LABEL_8:
      v4 = 0;
      if ((*(_BYTE *)&self->_has & 4) != 0)
        goto LABEL_5;
LABEL_9:
      v5 = 0;
      return v3 ^ v2 ^ v4 ^ v5 ^ -[NSString hash](self->_errorDomain, "hash");
    }
  }
  else
  {
    v2 = 0;
    if ((*(_BYTE *)&self->_has & 8) != 0)
      goto LABEL_3;
  }
  v3 = 0;
  if ((*(_BYTE *)&self->_has & 1) == 0)
    goto LABEL_8;
LABEL_4:
  v4 = 2654435761 * self->_errorCode;
  if ((*(_BYTE *)&self->_has & 4) == 0)
    goto LABEL_9;
LABEL_5:
  v5 = 2654435761 * self->_containerType;
  return v3 ^ v2 ^ v4 ^ v5 ^ -[NSString hash](self->_errorDomain, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  char v5;
  id v6;

  v4 = a3;
  v5 = *((_BYTE *)v4 + 44);
  if ((v5 & 2) != 0)
  {
    self->_timestamp = *((_QWORD *)v4 + 2);
    *(_BYTE *)&self->_has |= 2u;
    v5 = *((_BYTE *)v4 + 44);
    if ((v5 & 8) == 0)
    {
LABEL_3:
      if ((v5 & 1) == 0)
        goto LABEL_4;
      goto LABEL_11;
    }
  }
  else if ((*((_BYTE *)v4 + 44) & 8) == 0)
  {
    goto LABEL_3;
  }
  self->_didSucceed = *((_BYTE *)v4 + 40);
  *(_BYTE *)&self->_has |= 8u;
  v5 = *((_BYTE *)v4 + 44);
  if ((v5 & 1) == 0)
  {
LABEL_4:
    if ((v5 & 4) == 0)
      goto LABEL_6;
    goto LABEL_5;
  }
LABEL_11:
  self->_errorCode = *((_QWORD *)v4 + 1);
  *(_BYTE *)&self->_has |= 1u;
  if ((*((_BYTE *)v4 + 44) & 4) != 0)
  {
LABEL_5:
    self->_containerType = *((_DWORD *)v4 + 6);
    *(_BYTE *)&self->_has |= 4u;
  }
LABEL_6:
  if (*((_QWORD *)v4 + 4))
  {
    v6 = v4;
    -[AWDHomeKitDatabaseCKOperationCompletionEvent setErrorDomain:](self, "setErrorDomain:");
    v4 = v6;
  }

}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (BOOL)didSucceed
{
  return self->_didSucceed;
}

- (int64_t)errorCode
{
  return self->_errorCode;
}

- (NSString)errorDomain
{
  return self->_errorDomain;
}

- (void)setErrorDomain:(id)a3
{
  objc_storeStrong((id *)&self->_errorDomain, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_errorDomain, 0);
}

@end
