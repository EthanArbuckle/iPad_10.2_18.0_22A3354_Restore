@implementation AWDHomeKitEventTriggerUserConfirmationReceiverSession

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

- (BOOL)hasSessionID
{
  return self->_sessionID != 0;
}

- (void)setResultErrorCode:(int)a3
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

- (void)setUserResponseDelay:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_userResponseDelay = a3;
}

- (void)setHasUserResponseDelay:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasUserResponseDelay
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
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
  v8.super_class = (Class)AWDHomeKitEventTriggerUserConfirmationReceiverSession;
  -[AWDHomeKitEventTriggerUserConfirmationReceiverSession description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AWDHomeKitEventTriggerUserConfirmationReceiverSession dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *sessionID;
  char has;
  void *v7;
  void *v8;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_timestamp);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("timestamp"));

  }
  sessionID = self->_sessionID;
  if (sessionID)
    objc_msgSend(v3, "setObject:forKey:", sessionID, CFSTR("sessionID"));
  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_resultErrorCode);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("resultErrorCode"));

    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_userResponseDelay);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("userResponseDelay"));

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
  NSString *v25;
  NSString *sessionID;
  char v27;
  unsigned int v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;
  char v32;
  char v33;
  unsigned int v34;
  uint64_t v35;
  unint64_t v36;
  char v37;
  uint64_t v38;

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
              goto LABEL_44;
            v18 += 7;
            v15 = v19++ >= 9;
            if (v15)
            {
              v20 = 0;
              goto LABEL_46;
            }
          }
          *((_BYTE *)a3 + *v6) = 1;
LABEL_44:
          if (*((_BYTE *)a3 + *v6))
            v20 = 0;
LABEL_46:
          v38 = 8;
          goto LABEL_55;
        case 2u:
          PBReaderReadString();
          v25 = (NSString *)objc_claimAutoreleasedReturnValue();
          sessionID = self->_sessionID;
          self->_sessionID = v25;

          continue;
        case 3u:
          v27 = 0;
          v28 = 0;
          v29 = 0;
          *(_BYTE *)&self->_has |= 4u;
          while (2)
          {
            v30 = *v4;
            v31 = *(_QWORD *)((char *)a3 + v30);
            if (v31 == -1 || v31 >= *(_QWORD *)((char *)a3 + *v5))
            {
              *((_BYTE *)a3 + *v6) = 1;
            }
            else
            {
              v32 = *(_BYTE *)(*(_QWORD *)((char *)a3 + *v8) + v31);
              *(_QWORD *)((char *)a3 + v30) = v31 + 1;
              v29 |= (unint64_t)(v32 & 0x7F) << v27;
              if (v32 < 0)
              {
                v27 += 7;
                v15 = v28++ >= 9;
                if (v15)
                {
                  LODWORD(v29) = 0;
                  goto LABEL_50;
                }
                continue;
              }
            }
            break;
          }
          if (*((_BYTE *)a3 + *v6))
            LODWORD(v29) = 0;
LABEL_50:
          self->_resultErrorCode = v29;
          continue;
        case 4u:
          v33 = 0;
          v34 = 0;
          v20 = 0;
          *(_BYTE *)&self->_has |= 2u;
          break;
        default:
          v24 = PBReaderSkipValueWithTag();
          if (!v24)
            return v24;
          continue;
      }
      while (1)
      {
        v35 = *v4;
        v36 = *(_QWORD *)((char *)a3 + v35);
        if (v36 == -1 || v36 >= *(_QWORD *)((char *)a3 + *v5))
          break;
        v37 = *(_BYTE *)(*(_QWORD *)((char *)a3 + *v8) + v36);
        *(_QWORD *)((char *)a3 + v35) = v36 + 1;
        v20 |= (unint64_t)(v37 & 0x7F) << v33;
        if ((v37 & 0x80) == 0)
          goto LABEL_52;
        v33 += 7;
        v15 = v34++ >= 9;
        if (v15)
        {
          v20 = 0;
          goto LABEL_54;
        }
      }
      *((_BYTE *)a3 + *v6) = 1;
LABEL_52:
      if (*((_BYTE *)a3 + *v6))
        v20 = 0;
LABEL_54:
      v38 = 16;
LABEL_55:
      *(Class *)((char *)&self->super.super.isa + v38) = (Class)v20;
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
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteUint64Field();
  if (self->_sessionID)
    PBDataWriterWriteStringField();
  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    PBDataWriterWriteInt32Field();
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
    PBDataWriterWriteUint64Field();

}

- (void)copyTo:(id)a3
{
  _QWORD *v4;
  char has;
  _QWORD *v6;

  v4 = a3;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4[1] = self->_timestamp;
    *((_BYTE *)v4 + 40) |= 1u;
  }
  if (self->_sessionID)
  {
    v6 = v4;
    objc_msgSend(v4, "setSessionID:");
    v4 = v6;
  }
  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *((_DWORD *)v4 + 6) = self->_resultErrorCode;
    *((_BYTE *)v4 + 40) |= 4u;
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    v4[2] = self->_userResponseDelay;
    *((_BYTE *)v4 + 40) |= 2u;
  }

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
    *(_QWORD *)(v5 + 8) = self->_timestamp;
    *(_BYTE *)(v5 + 40) |= 1u;
  }
  v7 = -[NSString copyWithZone:](self->_sessionID, "copyWithZone:", a3);
  v8 = *(void **)(v6 + 32);
  *(_QWORD *)(v6 + 32) = v7;

  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *(_DWORD *)(v6 + 24) = self->_resultErrorCode;
    *(_BYTE *)(v6 + 40) |= 4u;
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *(_QWORD *)(v6 + 16) = self->_userResponseDelay;
    *(_BYTE *)(v6 + 40) |= 2u;
  }
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  char has;
  char v6;
  NSString *sessionID;
  BOOL v8;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_19;
  has = (char)self->_has;
  v6 = *((_BYTE *)v4 + 40);
  if ((has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 40) & 1) == 0 || self->_timestamp != *((_QWORD *)v4 + 1))
      goto LABEL_19;
  }
  else if ((*((_BYTE *)v4 + 40) & 1) != 0)
  {
    goto LABEL_19;
  }
  sessionID = self->_sessionID;
  if ((unint64_t)sessionID | *((_QWORD *)v4 + 4))
  {
    if (!-[NSString isEqual:](sessionID, "isEqual:"))
    {
LABEL_19:
      v8 = 0;
      goto LABEL_20;
    }
    has = (char)self->_has;
    v6 = *((_BYTE *)v4 + 40);
  }
  if ((has & 4) != 0)
  {
    if ((v6 & 4) == 0 || self->_resultErrorCode != *((_DWORD *)v4 + 6))
      goto LABEL_19;
  }
  else if ((v6 & 4) != 0)
  {
    goto LABEL_19;
  }
  v8 = (v6 & 2) == 0;
  if ((has & 2) != 0)
  {
    if ((v6 & 2) == 0 || self->_userResponseDelay != *((_QWORD *)v4 + 2))
      goto LABEL_19;
    v8 = 1;
  }
LABEL_20:

  return v8;
}

- (unint64_t)hash
{
  unint64_t v3;
  NSUInteger v4;
  uint64_t v5;
  unint64_t v6;

  if ((*(_BYTE *)&self->_has & 1) != 0)
    v3 = 2654435761u * self->_timestamp;
  else
    v3 = 0;
  v4 = -[NSString hash](self->_sessionID, "hash");
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    v5 = 2654435761 * self->_resultErrorCode;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_6;
LABEL_8:
    v6 = 0;
    return v4 ^ v3 ^ v5 ^ v6;
  }
  v5 = 0;
  if ((*(_BYTE *)&self->_has & 2) == 0)
    goto LABEL_8;
LABEL_6:
  v6 = 2654435761u * self->_userResponseDelay;
  return v4 ^ v3 ^ v5 ^ v6;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  char v5;
  id v6;

  v4 = a3;
  if ((*((_BYTE *)v4 + 40) & 1) != 0)
  {
    self->_timestamp = *((_QWORD *)v4 + 1);
    *(_BYTE *)&self->_has |= 1u;
  }
  if (*((_QWORD *)v4 + 4))
  {
    v6 = v4;
    -[AWDHomeKitEventTriggerUserConfirmationReceiverSession setSessionID:](self, "setSessionID:");
    v4 = v6;
  }
  v5 = *((_BYTE *)v4 + 40);
  if ((v5 & 4) != 0)
  {
    self->_resultErrorCode = *((_DWORD *)v4 + 6);
    *(_BYTE *)&self->_has |= 4u;
    v5 = *((_BYTE *)v4 + 40);
  }
  if ((v5 & 2) != 0)
  {
    self->_userResponseDelay = *((_QWORD *)v4 + 2);
    *(_BYTE *)&self->_has |= 2u;
  }

}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (NSString)sessionID
{
  return self->_sessionID;
}

- (void)setSessionID:(id)a3
{
  objc_storeStrong((id *)&self->_sessionID, a3);
}

- (int)resultErrorCode
{
  return self->_resultErrorCode;
}

- (unint64_t)userResponseDelay
{
  return self->_userResponseDelay;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessionID, 0);
}

@end
