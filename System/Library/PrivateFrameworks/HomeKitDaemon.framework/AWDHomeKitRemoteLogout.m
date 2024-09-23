@implementation AWDHomeKitRemoteLogout

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

- (void)setResultErrorCode:(int)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_resultErrorCode = a3;
}

- (void)setHasResultErrorCode:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasResultErrorCode
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setDelay:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_delay = a3;
}

- (void)setHasDelay:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasDelay
{
  return *(_BYTE *)&self->_has & 1;
}

- (int)requester
{
  if ((*(_BYTE *)&self->_has & 4) != 0)
    return self->_requester;
  else
    return 1;
}

- (void)setRequester:(int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_requester = a3;
}

- (void)setHasRequester:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasRequester
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (id)requesterAsString:(int)a3
{
  if ((a3 - 1) < 4)
    return off_24E7861C0[a3 - 1];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsRequester:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("HomeKitRequesterOwner")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("HomeKitRequesterSharedAdmin")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("HomeKitRequesterSharedAdminOnResident")) & 1) != 0)
  {
    v4 = 3;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("HomeKitRequesterSharedUser")))
  {
    v4 = 4;
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

  v3 = (void *)MEMORY[0x24BDD17C8];
  v8.receiver = self;
  v8.super_class = (Class)AWDHomeKitRemoteLogout;
  -[AWDHomeKitRemoteLogout description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AWDHomeKitRemoteLogout dictionaryRepresentation](self, "dictionaryRepresentation");
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
  unsigned int v8;
  __CFString *v9;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_timestamp);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("timestamp"));

    has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 1) == 0)
        goto LABEL_4;
LABEL_8:
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_delay);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("delay"));

      if ((*(_BYTE *)&self->_has & 4) == 0)
        return v3;
      goto LABEL_9;
    }
  }
  else if ((*(_BYTE *)&self->_has & 8) == 0)
  {
    goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_resultErrorCode);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("resultErrorCode"));

  has = (char)self->_has;
  if ((has & 1) != 0)
    goto LABEL_8;
LABEL_4:
  if ((has & 4) == 0)
    return v3;
LABEL_9:
  v8 = self->_requester - 1;
  if (v8 >= 4)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_requester);
    v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = off_24E7861C0[v8];
  }
  objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("requester"));

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
  uint64_t v41;
  uint64_t v42;

  v4 = (int *)MEMORY[0x24BE7AF60];
  v5 = (int *)MEMORY[0x24BE7AF50];
  v6 = (int *)MEMORY[0x24BE7AF48];
  if (*(_QWORD *)((char *)a3 + (int)*MEMORY[0x24BE7AF60]) < *(_QWORD *)((char *)a3 + (int)*MEMORY[0x24BE7AF50]))
  {
    v8 = (int *)MEMORY[0x24BE7AF30];
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
          v41 = 16;
          goto LABEL_61;
        case 3u:
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
                  LODWORD(v27) = 0;
                  goto LABEL_56;
                }
                continue;
              }
            }
            break;
          }
          if (*((_BYTE *)a3 + *v6))
            LODWORD(v27) = 0;
LABEL_56:
          v42 = 28;
          goto LABEL_66;
        case 4u:
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
                  goto LABEL_60;
                }
                continue;
              }
            }
            break;
          }
          if (*((_BYTE *)a3 + *v6))
            v20 = 0;
LABEL_60:
          v41 = 8;
LABEL_61:
          *(Class *)((char *)&self->super.super.isa + v41) = (Class)v20;
          continue;
        case 5u:
          v36 = 0;
          v37 = 0;
          v27 = 0;
          *(_BYTE *)&self->_has |= 4u;
          break;
        default:
          v24 = PBReaderSkipValueWithTag();
          if (!v24)
            return v24;
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
        v27 |= (unint64_t)(v40 & 0x7F) << v36;
        if ((v40 & 0x80) == 0)
          goto LABEL_63;
        v36 += 7;
        v15 = v37++ >= 9;
        if (v15)
        {
          LODWORD(v27) = 0;
          goto LABEL_65;
        }
      }
      *((_BYTE *)a3 + *v6) = 1;
LABEL_63:
      if (*((_BYTE *)a3 + *v6))
        LODWORD(v27) = 0;
LABEL_65:
      v42 = 24;
LABEL_66:
      *(_DWORD *)((char *)&self->super.super.isa + v42) = v27;
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
  if ((has & 2) != 0)
  {
    PBDataWriterWriteUint64Field();
    has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 1) == 0)
        goto LABEL_4;
LABEL_9:
      PBDataWriterWriteUint64Field();
      if ((*(_BYTE *)&self->_has & 4) == 0)
        goto LABEL_6;
      goto LABEL_5;
    }
  }
  else if ((*(_BYTE *)&self->_has & 8) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteInt32Field();
  has = (char)self->_has;
  if ((has & 1) != 0)
    goto LABEL_9;
LABEL_4:
  if ((has & 4) != 0)
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
  if ((has & 2) != 0)
  {
    v4[2] = self->_timestamp;
    *((_BYTE *)v4 + 32) |= 2u;
    has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 1) == 0)
        goto LABEL_4;
LABEL_9:
      v4[1] = self->_delay;
      *((_BYTE *)v4 + 32) |= 1u;
      if ((*(_BYTE *)&self->_has & 4) == 0)
        goto LABEL_6;
      goto LABEL_5;
    }
  }
  else if ((*(_BYTE *)&self->_has & 8) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)v4 + 7) = self->_resultErrorCode;
  *((_BYTE *)v4 + 32) |= 8u;
  has = (char)self->_has;
  if ((has & 1) != 0)
    goto LABEL_9;
LABEL_4:
  if ((has & 4) != 0)
  {
LABEL_5:
    *((_DWORD *)v4 + 6) = self->_requester;
    *((_BYTE *)v4 + 32) |= 4u;
  }
LABEL_6:

}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;
  char has;

  result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((_QWORD *)result + 2) = self->_timestamp;
    *((_BYTE *)result + 32) |= 2u;
    has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 1) == 0)
        goto LABEL_4;
      goto LABEL_9;
    }
  }
  else if ((*(_BYTE *)&self->_has & 8) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)result + 7) = self->_resultErrorCode;
  *((_BYTE *)result + 32) |= 8u;
  has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_4:
    if ((has & 4) == 0)
      return result;
    goto LABEL_5;
  }
LABEL_9:
  *((_QWORD *)result + 1) = self->_delay;
  *((_BYTE *)result + 32) |= 1u;
  if ((*(_BYTE *)&self->_has & 4) == 0)
    return result;
LABEL_5:
  *((_DWORD *)result + 6) = self->_requester;
  *((_BYTE *)result + 32) |= 4u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_21;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 32) & 2) == 0 || self->_timestamp != *((_QWORD *)v4 + 2))
      goto LABEL_21;
  }
  else if ((*((_BYTE *)v4 + 32) & 2) != 0)
  {
LABEL_21:
    v5 = 0;
    goto LABEL_22;
  }
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    if ((*((_BYTE *)v4 + 32) & 8) == 0 || self->_resultErrorCode != *((_DWORD *)v4 + 7))
      goto LABEL_21;
  }
  else if ((*((_BYTE *)v4 + 32) & 8) != 0)
  {
    goto LABEL_21;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 32) & 1) == 0 || self->_delay != *((_QWORD *)v4 + 1))
      goto LABEL_21;
  }
  else if ((*((_BYTE *)v4 + 32) & 1) != 0)
  {
    goto LABEL_21;
  }
  v5 = (*((_BYTE *)v4 + 32) & 4) == 0;
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 32) & 4) == 0 || self->_requester != *((_DWORD *)v4 + 6))
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
  unint64_t v4;
  uint64_t v5;

  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    v2 = 2654435761u * self->_timestamp;
    if ((*(_BYTE *)&self->_has & 8) != 0)
    {
LABEL_3:
      v3 = 2654435761 * self->_resultErrorCode;
      if ((*(_BYTE *)&self->_has & 1) != 0)
        goto LABEL_4;
LABEL_8:
      v4 = 0;
      if ((*(_BYTE *)&self->_has & 4) != 0)
        goto LABEL_5;
LABEL_9:
      v5 = 0;
      return v3 ^ v2 ^ v4 ^ v5;
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
  v4 = 2654435761u * self->_delay;
  if ((*(_BYTE *)&self->_has & 4) == 0)
    goto LABEL_9;
LABEL_5:
  v5 = 2654435761 * self->_requester;
  return v3 ^ v2 ^ v4 ^ v5;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  char v5;

  v4 = a3;
  v5 = *((_BYTE *)v4 + 32);
  if ((v5 & 2) != 0)
  {
    self->_timestamp = *((_QWORD *)v4 + 2);
    *(_BYTE *)&self->_has |= 2u;
    v5 = *((_BYTE *)v4 + 32);
    if ((v5 & 8) == 0)
    {
LABEL_3:
      if ((v5 & 1) == 0)
        goto LABEL_4;
LABEL_9:
      self->_delay = *((_QWORD *)v4 + 1);
      *(_BYTE *)&self->_has |= 1u;
      if ((*((_BYTE *)v4 + 32) & 4) == 0)
        goto LABEL_6;
      goto LABEL_5;
    }
  }
  else if ((*((_BYTE *)v4 + 32) & 8) == 0)
  {
    goto LABEL_3;
  }
  self->_resultErrorCode = *((_DWORD *)v4 + 7);
  *(_BYTE *)&self->_has |= 8u;
  v5 = *((_BYTE *)v4 + 32);
  if ((v5 & 1) != 0)
    goto LABEL_9;
LABEL_4:
  if ((v5 & 4) != 0)
  {
LABEL_5:
    self->_requester = *((_DWORD *)v4 + 6);
    *(_BYTE *)&self->_has |= 4u;
  }
LABEL_6:

}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (int)resultErrorCode
{
  return self->_resultErrorCode;
}

- (unint64_t)delay
{
  return self->_delay;
}

@end
