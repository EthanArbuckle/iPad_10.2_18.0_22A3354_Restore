@implementation AWDHomeKitAssistantAccessControl

- (void)setTimestamp:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasTimestamp
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setIsEnabled:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 0x10u;
  self->_isEnabled = a3;
}

- (void)setHasIsEnabled:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xEF | v3;
}

- (BOOL)hasIsEnabled
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (void)setOptions:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_options = a3;
}

- (void)setHasOptions:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasOptions
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setNumEnabledAccessories:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_numEnabledAccessories = a3;
}

- (void)setHasNumEnabledAccessories:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasNumEnabledAccessories
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setNumCapableAccessories:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_numCapableAccessories = a3;
}

- (void)setHasNumCapableAccessories:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasNumCapableAccessories
{
  return *(_BYTE *)&self->_has & 1;
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
  v8.super_class = (Class)AWDHomeKitAssistantAccessControl;
  -[AWDHomeKitAssistantAccessControl description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AWDHomeKitAssistantAccessControl dictionaryRepresentation](self, "dictionaryRepresentation");
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
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = (char)self->_has;
  if ((has & 8) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_timestamp);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("timestamp"));

    has = (char)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_3:
      if ((has & 4) == 0)
        goto LABEL_4;
      goto LABEL_10;
    }
  }
  else if ((*(_BYTE *)&self->_has & 0x10) == 0)
  {
    goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isEnabled);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("isEnabled"));

  has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 2) == 0)
      goto LABEL_5;
LABEL_11:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_numEnabledAccessories);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("numEnabledAccessories"));

    if ((*(_BYTE *)&self->_has & 1) == 0)
      return v3;
    goto LABEL_6;
  }
LABEL_10:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_options);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("options"));

  has = (char)self->_has;
  if ((has & 2) != 0)
    goto LABEL_11;
LABEL_5:
  if ((has & 1) != 0)
  {
LABEL_6:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_numCapableAccessories);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("numCapableAccessories"));

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
  unint64_t v39;
  char v40;
  char v41;
  unsigned int v42;
  uint64_t v43;
  unint64_t v44;
  char v45;
  uint64_t v46;

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
          *(_BYTE *)&self->_has |= 8u;
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
              goto LABEL_57;
            v18 += 7;
            v15 = v19++ >= 9;
            if (v15)
            {
              v20 = 0;
              goto LABEL_59;
            }
          }
          *((_BYTE *)a3 + *v6) = 1;
LABEL_57:
          if (*((_BYTE *)a3 + *v6))
            v20 = 0;
LABEL_59:
          v46 = 32;
          goto LABEL_76;
        case 2u:
          v25 = 0;
          v26 = 0;
          v27 = 0;
          *(_BYTE *)&self->_has |= 0x10u;
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
                  goto LABEL_63;
                }
                continue;
              }
            }
            break;
          }
          if (*((_BYTE *)a3 + *v6))
            v27 = 0;
LABEL_63:
          self->_isEnabled = v27 != 0;
          continue;
        case 3u:
          v31 = 0;
          v32 = 0;
          v20 = 0;
          *(_BYTE *)&self->_has |= 4u;
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
                  goto LABEL_67;
                }
                continue;
              }
            }
            break;
          }
          if (*((_BYTE *)a3 + *v6))
            v20 = 0;
LABEL_67:
          v46 = 24;
          goto LABEL_76;
        case 4u:
          v36 = 0;
          v37 = 0;
          v20 = 0;
          *(_BYTE *)&self->_has |= 2u;
          while (2)
          {
            v38 = *v4;
            v39 = *(_QWORD *)((char *)a3 + v38);
            if (v39 == -1 || v39 >= *(_QWORD *)((char *)a3 + *v5))
            {
              *((_BYTE *)a3 + *v6) = 1;
            }
            else
            {
              v40 = *(_BYTE *)(*(_QWORD *)((char *)a3 + *v8) + v39);
              *(_QWORD *)((char *)a3 + v38) = v39 + 1;
              v20 |= (unint64_t)(v40 & 0x7F) << v36;
              if (v40 < 0)
              {
                v36 += 7;
                v15 = v37++ >= 9;
                if (v15)
                {
                  v20 = 0;
                  goto LABEL_71;
                }
                continue;
              }
            }
            break;
          }
          if (*((_BYTE *)a3 + *v6))
            v20 = 0;
LABEL_71:
          v46 = 16;
          goto LABEL_76;
        case 5u:
          v41 = 0;
          v42 = 0;
          v20 = 0;
          *(_BYTE *)&self->_has |= 1u;
          break;
        default:
          v24 = PBReaderSkipValueWithTag();
          if (!v24)
            return v24;
          continue;
      }
      while (1)
      {
        v43 = *v4;
        v44 = *(_QWORD *)((char *)a3 + v43);
        if (v44 == -1 || v44 >= *(_QWORD *)((char *)a3 + *v5))
          break;
        v45 = *(_BYTE *)(*(_QWORD *)((char *)a3 + *v8) + v44);
        *(_QWORD *)((char *)a3 + v43) = v44 + 1;
        v20 |= (unint64_t)(v45 & 0x7F) << v41;
        if ((v45 & 0x80) == 0)
          goto LABEL_73;
        v41 += 7;
        v15 = v42++ >= 9;
        if (v15)
        {
          v20 = 0;
          goto LABEL_75;
        }
      }
      *((_BYTE *)a3 + *v6) = 1;
LABEL_73:
      if (*((_BYTE *)a3 + *v6))
        v20 = 0;
LABEL_75:
      v46 = 8;
LABEL_76:
      *(Class *)((char *)&self->super.super.isa + v46) = (Class)v20;
    }
    while (*(_QWORD *)((char *)a3 + *v4) < *(_QWORD *)((char *)a3 + *v5));
  }
  LOBYTE(v24) = *((_BYTE *)a3 + *v6) == 0;
  return v24;
}

- (void)writeTo:(id)a3
{
  char has;
  id v5;

  v5 = a3;
  has = (char)self->_has;
  if ((has & 8) != 0)
  {
    PBDataWriterWriteUint64Field();
    has = (char)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_3:
      if ((has & 4) == 0)
        goto LABEL_4;
      goto LABEL_10;
    }
  }
  else if ((*(_BYTE *)&self->_has & 0x10) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteBOOLField();
  has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 2) == 0)
      goto LABEL_5;
LABEL_11:
    PBDataWriterWriteUint64Field();
    if ((*(_BYTE *)&self->_has & 1) == 0)
      goto LABEL_7;
    goto LABEL_6;
  }
LABEL_10:
  PBDataWriterWriteUint64Field();
  has = (char)self->_has;
  if ((has & 2) != 0)
    goto LABEL_11;
LABEL_5:
  if ((has & 1) != 0)
LABEL_6:
    PBDataWriterWriteUint64Field();
LABEL_7:

}

- (void)copyTo:(id)a3
{
  _QWORD *v4;
  char has;

  v4 = a3;
  has = (char)self->_has;
  if ((has & 8) != 0)
  {
    v4[4] = self->_timestamp;
    *((_BYTE *)v4 + 44) |= 8u;
    has = (char)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_3:
      if ((has & 4) == 0)
        goto LABEL_4;
      goto LABEL_10;
    }
  }
  else if ((*(_BYTE *)&self->_has & 0x10) == 0)
  {
    goto LABEL_3;
  }
  *((_BYTE *)v4 + 40) = self->_isEnabled;
  *((_BYTE *)v4 + 44) |= 0x10u;
  has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 2) == 0)
      goto LABEL_5;
LABEL_11:
    v4[2] = self->_numEnabledAccessories;
    *((_BYTE *)v4 + 44) |= 2u;
    if ((*(_BYTE *)&self->_has & 1) == 0)
      goto LABEL_7;
    goto LABEL_6;
  }
LABEL_10:
  v4[3] = self->_options;
  *((_BYTE *)v4 + 44) |= 4u;
  has = (char)self->_has;
  if ((has & 2) != 0)
    goto LABEL_11;
LABEL_5:
  if ((has & 1) != 0)
  {
LABEL_6:
    v4[1] = self->_numCapableAccessories;
    *((_BYTE *)v4 + 44) |= 1u;
  }
LABEL_7:

}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;
  char has;

  result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  has = (char)self->_has;
  if ((has & 8) != 0)
  {
    *((_QWORD *)result + 4) = self->_timestamp;
    *((_BYTE *)result + 44) |= 8u;
    has = (char)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_3:
      if ((has & 4) == 0)
        goto LABEL_4;
      goto LABEL_10;
    }
  }
  else if ((*(_BYTE *)&self->_has & 0x10) == 0)
  {
    goto LABEL_3;
  }
  *((_BYTE *)result + 40) = self->_isEnabled;
  *((_BYTE *)result + 44) |= 0x10u;
  has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 2) == 0)
      goto LABEL_5;
    goto LABEL_11;
  }
LABEL_10:
  *((_QWORD *)result + 3) = self->_options;
  *((_BYTE *)result + 44) |= 4u;
  has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_5:
    if ((has & 1) == 0)
      return result;
    goto LABEL_6;
  }
LABEL_11:
  *((_QWORD *)result + 2) = self->_numEnabledAccessories;
  *((_BYTE *)result + 44) |= 2u;
  if ((*(_BYTE *)&self->_has & 1) == 0)
    return result;
LABEL_6:
  *((_QWORD *)result + 1) = self->_numCapableAccessories;
  *((_BYTE *)result + 44) |= 1u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_29;
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    if ((*((_BYTE *)v4 + 44) & 8) == 0 || self->_timestamp != *((_QWORD *)v4 + 4))
      goto LABEL_29;
  }
  else if ((*((_BYTE *)v4 + 44) & 8) != 0)
  {
    goto LABEL_29;
  }
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
    if ((*((_BYTE *)v4 + 44) & 0x10) != 0)
    {
      if (self->_isEnabled)
      {
        if (!*((_BYTE *)v4 + 40))
          goto LABEL_29;
        goto LABEL_15;
      }
      if (!*((_BYTE *)v4 + 40))
        goto LABEL_15;
    }
LABEL_29:
    v5 = 0;
    goto LABEL_30;
  }
  if ((*((_BYTE *)v4 + 44) & 0x10) != 0)
    goto LABEL_29;
LABEL_15:
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 44) & 4) == 0 || self->_options != *((_QWORD *)v4 + 3))
      goto LABEL_29;
  }
  else if ((*((_BYTE *)v4 + 44) & 4) != 0)
  {
    goto LABEL_29;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 44) & 2) == 0 || self->_numEnabledAccessories != *((_QWORD *)v4 + 2))
      goto LABEL_29;
  }
  else if ((*((_BYTE *)v4 + 44) & 2) != 0)
  {
    goto LABEL_29;
  }
  v5 = (*((_BYTE *)v4 + 44) & 1) == 0;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 44) & 1) == 0 || self->_numCapableAccessories != *((_QWORD *)v4 + 1))
      goto LABEL_29;
    v5 = 1;
  }
LABEL_30:

  return v5;
}

- (unint64_t)hash
{
  unint64_t v2;
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;

  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    v2 = 2654435761u * self->_timestamp;
    if ((*(_BYTE *)&self->_has & 0x10) != 0)
    {
LABEL_3:
      v3 = 2654435761 * self->_isEnabled;
      if ((*(_BYTE *)&self->_has & 4) != 0)
        goto LABEL_4;
      goto LABEL_9;
    }
  }
  else
  {
    v2 = 0;
    if ((*(_BYTE *)&self->_has & 0x10) != 0)
      goto LABEL_3;
  }
  v3 = 0;
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
LABEL_4:
    v4 = 2654435761u * self->_options;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_5;
LABEL_10:
    v5 = 0;
    if ((*(_BYTE *)&self->_has & 1) != 0)
      goto LABEL_6;
LABEL_11:
    v6 = 0;
    return v3 ^ v2 ^ v4 ^ v5 ^ v6;
  }
LABEL_9:
  v4 = 0;
  if ((*(_BYTE *)&self->_has & 2) == 0)
    goto LABEL_10;
LABEL_5:
  v5 = 2654435761u * self->_numEnabledAccessories;
  if ((*(_BYTE *)&self->_has & 1) == 0)
    goto LABEL_11;
LABEL_6:
  v6 = 2654435761u * self->_numCapableAccessories;
  return v3 ^ v2 ^ v4 ^ v5 ^ v6;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  char v5;

  v4 = a3;
  v5 = *((_BYTE *)v4 + 44);
  if ((v5 & 8) != 0)
  {
    self->_timestamp = *((_QWORD *)v4 + 4);
    *(_BYTE *)&self->_has |= 8u;
    v5 = *((_BYTE *)v4 + 44);
    if ((v5 & 0x10) == 0)
    {
LABEL_3:
      if ((v5 & 4) == 0)
        goto LABEL_4;
      goto LABEL_10;
    }
  }
  else if ((*((_BYTE *)v4 + 44) & 0x10) == 0)
  {
    goto LABEL_3;
  }
  self->_isEnabled = *((_BYTE *)v4 + 40);
  *(_BYTE *)&self->_has |= 0x10u;
  v5 = *((_BYTE *)v4 + 44);
  if ((v5 & 4) == 0)
  {
LABEL_4:
    if ((v5 & 2) == 0)
      goto LABEL_5;
LABEL_11:
    self->_numEnabledAccessories = *((_QWORD *)v4 + 2);
    *(_BYTE *)&self->_has |= 2u;
    if ((*((_BYTE *)v4 + 44) & 1) == 0)
      goto LABEL_7;
    goto LABEL_6;
  }
LABEL_10:
  self->_options = *((_QWORD *)v4 + 3);
  *(_BYTE *)&self->_has |= 4u;
  v5 = *((_BYTE *)v4 + 44);
  if ((v5 & 2) != 0)
    goto LABEL_11;
LABEL_5:
  if ((v5 & 1) != 0)
  {
LABEL_6:
    self->_numCapableAccessories = *((_QWORD *)v4 + 1);
    *(_BYTE *)&self->_has |= 1u;
  }
LABEL_7:

}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (BOOL)isEnabled
{
  return self->_isEnabled;
}

- (unint64_t)options
{
  return self->_options;
}

- (unint64_t)numEnabledAccessories
{
  return self->_numEnabledAccessories;
}

- (unint64_t)numCapableAccessories
{
  return self->_numCapableAccessories;
}

@end
