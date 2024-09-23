@implementation AWDSharingProximityPairingResult

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

- (BOOL)hasSessionUUID
{
  return self->_sessionUUID != 0;
}

- (void)setUserAccepted:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 0x20u;
  self->_userAccepted = a3;
}

- (void)setHasUserAccepted:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xDF | v3;
}

- (BOOL)hasUserAccepted
{
  return (*(_BYTE *)&self->_has >> 5) & 1;
}

- (void)setUserResponseMs:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 0x10u;
  self->_userResponseMs = a3;
}

- (void)setHasUserResponseMs:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xEF | v3;
}

- (BOOL)hasUserResponseMs
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (void)setErrorCode:(int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_errorCode = a3;
}

- (void)setHasErrorCode:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasErrorCode
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setPairingMs:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_pairingMs = a3;
}

- (void)setHasPairingMs:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasPairingMs
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setConnectErrors:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_connectErrors = a3;
}

- (void)setHasConnectErrors:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasConnectErrors
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)AWDSharingProximityPairingResult;
  v3 = -[AWDSharingProximityPairingResult description](&v8, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[AWDSharingProximityPairingResult dictionaryRepresentation](self, "dictionaryRepresentation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ %@"), v4, v5));

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *sessionUUID;
  char has;
  void *v7;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", self->_timestamp));
    objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("timestamp"));

  }
  sessionUUID = self->_sessionUUID;
  if (sessionUUID)
    objc_msgSend(v3, "setObject:forKey:", sessionUUID, CFSTR("sessionUUID"));
  has = (char)self->_has;
  if ((has & 0x20) != 0)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", self->_userAccepted));
    objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("userAccepted"));

    has = (char)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_7:
      if ((has & 4) == 0)
        goto LABEL_8;
      goto LABEL_14;
    }
  }
  else if ((*(_BYTE *)&self->_has & 0x10) == 0)
  {
    goto LABEL_7;
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_userResponseMs));
  objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("userResponseMs"));

  has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_8:
    if ((has & 8) == 0)
      goto LABEL_9;
LABEL_15:
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_pairingMs));
    objc_msgSend(v3, "setObject:forKey:", v12, CFSTR("pairingMs"));

    if ((*(_BYTE *)&self->_has & 2) == 0)
      return v3;
    goto LABEL_10;
  }
LABEL_14:
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", self->_errorCode));
  objc_msgSend(v3, "setObject:forKey:", v11, CFSTR("errorCode"));

  has = (char)self->_has;
  if ((has & 8) != 0)
    goto LABEL_15;
LABEL_9:
  if ((has & 2) != 0)
  {
LABEL_10:
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_connectErrors));
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("connectErrors"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  char v5;
  unsigned int v6;
  unint64_t v7;
  unint64_t v8;
  char v9;
  BOOL v10;
  int v11;
  char v13;
  unsigned int v14;
  unint64_t v15;
  unint64_t v16;
  char v17;
  int v18;
  uint64_t String;
  NSString *v20;
  NSString *sessionUUID;
  char v22;
  unsigned int v23;
  uint64_t v24;
  unint64_t v25;
  char v26;
  char v27;
  unsigned int v28;
  uint64_t v29;
  unint64_t v30;
  char v31;
  char v32;
  unsigned int v33;
  unint64_t v34;
  char v35;
  char v36;
  unsigned int v37;
  unint64_t v38;
  char v39;
  char v40;
  unsigned int v41;
  unint64_t v42;
  char v43;
  uint64_t v44;

  while (*(_QWORD *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) < *(_QWORD *)((char *)a3
                                                                              + OBJC_IVAR___PBDataReader__length))
  {
    if (*((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error))
      break;
    v5 = 0;
    v6 = 0;
    v7 = 0;
    while (1)
    {
      v8 = *(_QWORD *)((char *)a3 + OBJC_IVAR___PBDataReader__pos);
      if (v8 == -1 || v8 >= *(_QWORD *)((char *)a3 + OBJC_IVAR___PBDataReader__length))
        break;
      v9 = *(_BYTE *)(*(_QWORD *)((char *)a3 + OBJC_IVAR___PBDataReader__bytes) + v8);
      *(_QWORD *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) = v8 + 1;
      v7 |= (unint64_t)(v9 & 0x7F) << v5;
      if ((v9 & 0x80) == 0)
        goto LABEL_11;
      v5 += 7;
      v10 = v6++ >= 9;
      if (v10)
      {
        v7 = 0;
        v11 = *((unsigned __int8 *)a3 + OBJC_IVAR___PBDataReader__error);
        goto LABEL_13;
      }
    }
    *((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_11:
    v11 = *((unsigned __int8 *)a3 + OBJC_IVAR___PBDataReader__error);
    if (*((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error))
      v7 = 0;
LABEL_13:
    if (v11 || (v7 & 7) == 4)
      break;
    switch((v7 >> 3))
    {
      case 1u:
        v13 = 0;
        v14 = 0;
        v15 = 0;
        *(_BYTE *)&self->_has |= 1u;
        while (1)
        {
          v16 = *(_QWORD *)((char *)a3 + OBJC_IVAR___PBDataReader__pos);
          if (v16 == -1 || v16 >= *(_QWORD *)((char *)a3 + OBJC_IVAR___PBDataReader__length))
            break;
          v17 = *(_BYTE *)(*(_QWORD *)((char *)a3 + OBJC_IVAR___PBDataReader__bytes) + v16);
          *(_QWORD *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) = v16 + 1;
          v15 |= (unint64_t)(v17 & 0x7F) << v13;
          if ((v17 & 0x80) == 0)
            goto LABEL_64;
          v13 += 7;
          v10 = v14++ >= 9;
          if (v10)
          {
            v15 = 0;
            goto LABEL_66;
          }
        }
        *((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_64:
        if (*((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error))
          v15 = 0;
LABEL_66:
        self->_timestamp = v15;
        continue;
      case 2u:
        String = PBReaderReadString(a3);
        v20 = (NSString *)objc_claimAutoreleasedReturnValue(String);
        sessionUUID = self->_sessionUUID;
        self->_sessionUUID = v20;

        continue;
      case 3u:
        v22 = 0;
        v23 = 0;
        v24 = 0;
        *(_BYTE *)&self->_has |= 0x20u;
        while (2)
        {
          v25 = *(_QWORD *)((char *)a3 + OBJC_IVAR___PBDataReader__pos);
          if (v25 == -1 || v25 >= *(_QWORD *)((char *)a3 + OBJC_IVAR___PBDataReader__length))
          {
            *((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error) = 1;
          }
          else
          {
            v26 = *(_BYTE *)(*(_QWORD *)((char *)a3 + OBJC_IVAR___PBDataReader__bytes) + v25);
            *(_QWORD *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) = v25 + 1;
            v24 |= (unint64_t)(v26 & 0x7F) << v22;
            if (v26 < 0)
            {
              v22 += 7;
              v10 = v23++ >= 9;
              if (v10)
              {
                v24 = 0;
                goto LABEL_70;
              }
              continue;
            }
          }
          break;
        }
        if (*((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error))
          v24 = 0;
LABEL_70:
        self->_userAccepted = v24 != 0;
        continue;
      case 4u:
        v27 = 0;
        v28 = 0;
        v29 = 0;
        *(_BYTE *)&self->_has |= 0x10u;
        while (2)
        {
          v30 = *(_QWORD *)((char *)a3 + OBJC_IVAR___PBDataReader__pos);
          if (v30 == -1 || v30 >= *(_QWORD *)((char *)a3 + OBJC_IVAR___PBDataReader__length))
          {
            *((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error) = 1;
          }
          else
          {
            v31 = *(_BYTE *)(*(_QWORD *)((char *)a3 + OBJC_IVAR___PBDataReader__bytes) + v30);
            *(_QWORD *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) = v30 + 1;
            v29 |= (unint64_t)(v31 & 0x7F) << v27;
            if (v31 < 0)
            {
              v27 += 7;
              v10 = v28++ >= 9;
              if (v10)
              {
                LODWORD(v29) = 0;
                goto LABEL_74;
              }
              continue;
            }
          }
          break;
        }
        if (*((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error))
          LODWORD(v29) = 0;
LABEL_74:
        v44 = 40;
        goto LABEL_87;
      case 5u:
        v32 = 0;
        v33 = 0;
        v29 = 0;
        *(_BYTE *)&self->_has |= 4u;
        while (2)
        {
          v34 = *(_QWORD *)((char *)a3 + OBJC_IVAR___PBDataReader__pos);
          if (v34 == -1 || v34 >= *(_QWORD *)((char *)a3 + OBJC_IVAR___PBDataReader__length))
          {
            *((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error) = 1;
          }
          else
          {
            v35 = *(_BYTE *)(*(_QWORD *)((char *)a3 + OBJC_IVAR___PBDataReader__bytes) + v34);
            *(_QWORD *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) = v34 + 1;
            v29 |= (unint64_t)(v35 & 0x7F) << v32;
            if (v35 < 0)
            {
              v32 += 7;
              v10 = v33++ >= 9;
              if (v10)
              {
                LODWORD(v29) = 0;
                goto LABEL_78;
              }
              continue;
            }
          }
          break;
        }
        if (*((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error))
          LODWORD(v29) = 0;
LABEL_78:
        v44 = 20;
        goto LABEL_87;
      case 6u:
        v36 = 0;
        v37 = 0;
        v29 = 0;
        *(_BYTE *)&self->_has |= 8u;
        while (2)
        {
          v38 = *(_QWORD *)((char *)a3 + OBJC_IVAR___PBDataReader__pos);
          if (v38 == -1 || v38 >= *(_QWORD *)((char *)a3 + OBJC_IVAR___PBDataReader__length))
          {
            *((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error) = 1;
          }
          else
          {
            v39 = *(_BYTE *)(*(_QWORD *)((char *)a3 + OBJC_IVAR___PBDataReader__bytes) + v38);
            *(_QWORD *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) = v38 + 1;
            v29 |= (unint64_t)(v39 & 0x7F) << v36;
            if (v39 < 0)
            {
              v36 += 7;
              v10 = v37++ >= 9;
              if (v10)
              {
                LODWORD(v29) = 0;
                goto LABEL_82;
              }
              continue;
            }
          }
          break;
        }
        if (*((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error))
          LODWORD(v29) = 0;
LABEL_82:
        v44 = 24;
        goto LABEL_87;
      case 7u:
        v40 = 0;
        v41 = 0;
        v29 = 0;
        *(_BYTE *)&self->_has |= 2u;
        break;
      default:
        v18 = PBReaderSkipValueWithTag(a3);
        if (!v18)
          return v18;
        continue;
    }
    while (1)
    {
      v42 = *(_QWORD *)((char *)a3 + OBJC_IVAR___PBDataReader__pos);
      if (v42 == -1 || v42 >= *(_QWORD *)((char *)a3 + OBJC_IVAR___PBDataReader__length))
        break;
      v43 = *(_BYTE *)(*(_QWORD *)((char *)a3 + OBJC_IVAR___PBDataReader__bytes) + v42);
      *(_QWORD *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) = v42 + 1;
      v29 |= (unint64_t)(v43 & 0x7F) << v40;
      if ((v43 & 0x80) == 0)
        goto LABEL_84;
      v40 += 7;
      v10 = v41++ >= 9;
      if (v10)
      {
        LODWORD(v29) = 0;
        goto LABEL_86;
      }
    }
    *((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_84:
    if (*((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error))
      LODWORD(v29) = 0;
LABEL_86:
    v44 = 16;
LABEL_87:
    *(_DWORD *)&self->PBCodable_opaque[v44] = v29;
  }
  LOBYTE(v18) = *((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error) == 0;
  return v18;
}

- (void)writeTo:(id)a3
{
  NSString *sessionUUID;
  char has;
  id v6;

  v6 = a3;
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteUint64Field(v6, self->_timestamp, 1);
  sessionUUID = self->_sessionUUID;
  if (sessionUUID)
    PBDataWriterWriteStringField(v6, sessionUUID, 2);
  has = (char)self->_has;
  if ((has & 0x20) != 0)
  {
    PBDataWriterWriteBOOLField(v6, self->_userAccepted, 3);
    has = (char)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_7:
      if ((has & 4) == 0)
        goto LABEL_8;
      goto LABEL_14;
    }
  }
  else if ((*(_BYTE *)&self->_has & 0x10) == 0)
  {
    goto LABEL_7;
  }
  PBDataWriterWriteUint32Field(v6, self->_userResponseMs, 4);
  has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_8:
    if ((has & 8) == 0)
      goto LABEL_9;
LABEL_15:
    PBDataWriterWriteUint32Field(v6, self->_pairingMs, 6);
    if ((*(_BYTE *)&self->_has & 2) == 0)
      goto LABEL_11;
    goto LABEL_10;
  }
LABEL_14:
  PBDataWriterWriteInt32Field(v6, self->_errorCode, 5);
  has = (char)self->_has;
  if ((has & 8) != 0)
    goto LABEL_15;
LABEL_9:
  if ((has & 2) != 0)
LABEL_10:
    PBDataWriterWriteUint32Field(v6, self->_connectErrors, 7);
LABEL_11:

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
    *((_BYTE *)v4 + 48) |= 1u;
  }
  if (self->_sessionUUID)
  {
    v6 = v4;
    objc_msgSend(v4, "setSessionUUID:");
    v4 = v6;
  }
  has = (char)self->_has;
  if ((has & 0x20) != 0)
  {
    *((_BYTE *)v4 + 44) = self->_userAccepted;
    *((_BYTE *)v4 + 48) |= 0x20u;
    has = (char)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_7:
      if ((has & 4) == 0)
        goto LABEL_8;
      goto LABEL_14;
    }
  }
  else if ((*(_BYTE *)&self->_has & 0x10) == 0)
  {
    goto LABEL_7;
  }
  *((_DWORD *)v4 + 10) = self->_userResponseMs;
  *((_BYTE *)v4 + 48) |= 0x10u;
  has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_8:
    if ((has & 8) == 0)
      goto LABEL_9;
LABEL_15:
    *((_DWORD *)v4 + 6) = self->_pairingMs;
    *((_BYTE *)v4 + 48) |= 8u;
    if ((*(_BYTE *)&self->_has & 2) == 0)
      goto LABEL_11;
    goto LABEL_10;
  }
LABEL_14:
  *((_DWORD *)v4 + 5) = self->_errorCode;
  *((_BYTE *)v4 + 48) |= 4u;
  has = (char)self->_has;
  if ((has & 8) != 0)
    goto LABEL_15;
LABEL_9:
  if ((has & 2) != 0)
  {
LABEL_10:
    *((_DWORD *)v4 + 4) = self->_connectErrors;
    *((_BYTE *)v4 + 48) |= 2u;
  }
LABEL_11:

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  _QWORD *v6;
  id v7;
  void *v8;
  char has;

  v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(self, a2), "allocWithZone:", a3), "init");
  v6 = v5;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v5[1] = self->_timestamp;
    *((_BYTE *)v5 + 48) |= 1u;
  }
  v7 = -[NSString copyWithZone:](self->_sessionUUID, "copyWithZone:", a3);
  v8 = (void *)v6[4];
  v6[4] = v7;

  has = (char)self->_has;
  if ((has & 0x20) != 0)
  {
    *((_BYTE *)v6 + 44) = self->_userAccepted;
    *((_BYTE *)v6 + 48) |= 0x20u;
    has = (char)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_5:
      if ((has & 4) == 0)
        goto LABEL_6;
      goto LABEL_12;
    }
  }
  else if ((*(_BYTE *)&self->_has & 0x10) == 0)
  {
    goto LABEL_5;
  }
  *((_DWORD *)v6 + 10) = self->_userResponseMs;
  *((_BYTE *)v6 + 48) |= 0x10u;
  has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_6:
    if ((has & 8) == 0)
      goto LABEL_7;
LABEL_13:
    *((_DWORD *)v6 + 6) = self->_pairingMs;
    *((_BYTE *)v6 + 48) |= 8u;
    if ((*(_BYTE *)&self->_has & 2) == 0)
      return v6;
    goto LABEL_8;
  }
LABEL_12:
  *((_DWORD *)v6 + 5) = self->_errorCode;
  *((_BYTE *)v6 + 48) |= 4u;
  has = (char)self->_has;
  if ((has & 8) != 0)
    goto LABEL_13;
LABEL_7:
  if ((has & 2) != 0)
  {
LABEL_8:
    *((_DWORD *)v6 + 4) = self->_connectErrors;
    *((_BYTE *)v6 + 48) |= 2u;
  }
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  char has;
  char v7;
  NSString *sessionUUID;
  BOOL v9;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class(self, v5)))
    goto LABEL_37;
  has = (char)self->_has;
  v7 = *((_BYTE *)v4 + 48);
  if ((has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 48) & 1) == 0 || self->_timestamp != *((_QWORD *)v4 + 1))
      goto LABEL_37;
  }
  else if ((*((_BYTE *)v4 + 48) & 1) != 0)
  {
    goto LABEL_37;
  }
  sessionUUID = self->_sessionUUID;
  if ((unint64_t)sessionUUID | *((_QWORD *)v4 + 4))
  {
    if (!-[NSString isEqual:](sessionUUID, "isEqual:"))
      goto LABEL_37;
    has = (char)self->_has;
    v7 = *((_BYTE *)v4 + 48);
  }
  if ((has & 0x20) != 0)
  {
    if ((v7 & 0x20) != 0)
    {
      if (self->_userAccepted)
      {
        if (!*((_BYTE *)v4 + 44))
          goto LABEL_37;
        goto LABEL_18;
      }
      if (!*((_BYTE *)v4 + 44))
        goto LABEL_18;
    }
LABEL_37:
    v9 = 0;
    goto LABEL_38;
  }
  if ((v7 & 0x20) != 0)
    goto LABEL_37;
LABEL_18:
  if ((has & 0x10) != 0)
  {
    if ((v7 & 0x10) == 0 || self->_userResponseMs != *((_DWORD *)v4 + 10))
      goto LABEL_37;
  }
  else if ((v7 & 0x10) != 0)
  {
    goto LABEL_37;
  }
  if ((has & 4) != 0)
  {
    if ((v7 & 4) == 0 || self->_errorCode != *((_DWORD *)v4 + 5))
      goto LABEL_37;
  }
  else if ((v7 & 4) != 0)
  {
    goto LABEL_37;
  }
  if ((has & 8) != 0)
  {
    if ((v7 & 8) == 0 || self->_pairingMs != *((_DWORD *)v4 + 6))
      goto LABEL_37;
  }
  else if ((v7 & 8) != 0)
  {
    goto LABEL_37;
  }
  v9 = (v7 & 2) == 0;
  if ((has & 2) != 0)
  {
    if ((v7 & 2) == 0 || self->_connectErrors != *((_DWORD *)v4 + 4))
      goto LABEL_37;
    v9 = 1;
  }
LABEL_38:

  return v9;
}

- (unint64_t)hash
{
  unint64_t v3;
  NSUInteger v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  if ((*(_BYTE *)&self->_has & 1) != 0)
    v3 = 2654435761u * self->_timestamp;
  else
    v3 = 0;
  v4 = -[NSString hash](self->_sessionUUID, "hash");
  if ((*(_BYTE *)&self->_has & 0x20) != 0)
  {
    v5 = 2654435761 * self->_userAccepted;
    if ((*(_BYTE *)&self->_has & 0x10) != 0)
    {
LABEL_6:
      v6 = 2654435761 * self->_userResponseMs;
      if ((*(_BYTE *)&self->_has & 4) != 0)
        goto LABEL_7;
      goto LABEL_12;
    }
  }
  else
  {
    v5 = 0;
    if ((*(_BYTE *)&self->_has & 0x10) != 0)
      goto LABEL_6;
  }
  v6 = 0;
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
LABEL_7:
    v7 = 2654435761 * self->_errorCode;
    if ((*(_BYTE *)&self->_has & 8) != 0)
      goto LABEL_8;
LABEL_13:
    v8 = 0;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_9;
LABEL_14:
    v9 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9;
  }
LABEL_12:
  v7 = 0;
  if ((*(_BYTE *)&self->_has & 8) == 0)
    goto LABEL_13;
LABEL_8:
  v8 = 2654435761 * self->_pairingMs;
  if ((*(_BYTE *)&self->_has & 2) == 0)
    goto LABEL_14;
LABEL_9:
  v9 = 2654435761 * self->_connectErrors;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  char v5;
  id v6;

  v4 = a3;
  if ((*((_BYTE *)v4 + 48) & 1) != 0)
  {
    self->_timestamp = *((_QWORD *)v4 + 1);
    *(_BYTE *)&self->_has |= 1u;
  }
  if (*((_QWORD *)v4 + 4))
  {
    v6 = v4;
    -[AWDSharingProximityPairingResult setSessionUUID:](self, "setSessionUUID:");
    v4 = v6;
  }
  v5 = *((_BYTE *)v4 + 48);
  if ((v5 & 0x20) != 0)
  {
    self->_userAccepted = *((_BYTE *)v4 + 44);
    *(_BYTE *)&self->_has |= 0x20u;
    v5 = *((_BYTE *)v4 + 48);
    if ((v5 & 0x10) == 0)
    {
LABEL_7:
      if ((v5 & 4) == 0)
        goto LABEL_8;
      goto LABEL_14;
    }
  }
  else if ((*((_BYTE *)v4 + 48) & 0x10) == 0)
  {
    goto LABEL_7;
  }
  self->_userResponseMs = *((_DWORD *)v4 + 10);
  *(_BYTE *)&self->_has |= 0x10u;
  v5 = *((_BYTE *)v4 + 48);
  if ((v5 & 4) == 0)
  {
LABEL_8:
    if ((v5 & 8) == 0)
      goto LABEL_9;
LABEL_15:
    self->_pairingMs = *((_DWORD *)v4 + 6);
    *(_BYTE *)&self->_has |= 8u;
    if ((*((_BYTE *)v4 + 48) & 2) == 0)
      goto LABEL_11;
    goto LABEL_10;
  }
LABEL_14:
  self->_errorCode = *((_DWORD *)v4 + 5);
  *(_BYTE *)&self->_has |= 4u;
  v5 = *((_BYTE *)v4 + 48);
  if ((v5 & 8) != 0)
    goto LABEL_15;
LABEL_9:
  if ((v5 & 2) != 0)
  {
LABEL_10:
    self->_connectErrors = *((_DWORD *)v4 + 4);
    *(_BYTE *)&self->_has |= 2u;
  }
LABEL_11:

}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (NSString)sessionUUID
{
  return self->_sessionUUID;
}

- (void)setSessionUUID:(id)a3
{
  objc_storeStrong((id *)&self->_sessionUUID, a3);
}

- (BOOL)userAccepted
{
  return self->_userAccepted;
}

- (unsigned)userResponseMs
{
  return self->_userResponseMs;
}

- (int)errorCode
{
  return self->_errorCode;
}

- (unsigned)pairingMs
{
  return self->_pairingMs;
}

- (unsigned)connectErrors
{
  return self->_connectErrors;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessionUUID, 0);
}

@end
