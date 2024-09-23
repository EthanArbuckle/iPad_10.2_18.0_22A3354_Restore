@implementation AWDSharingProximityiOSSetupResult

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

- (void)setSmoothedRSSI:(int)a3
{
  *(_BYTE *)&self->_has |= 0x10u;
  self->_smoothedRSSI = a3;
}

- (void)setHasSmoothedRSSI:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xEF | v3;
}

- (BOOL)hasSmoothedRSSI
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

- (void)setIncorrectPINCount:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_incorrectPINCount = a3;
}

- (void)setHasIncorrectPINCount:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasIncorrectPINCount
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)AWDSharingProximityiOSSetupResult;
  v3 = -[AWDSharingProximityiOSSetupResult description](&v8, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[AWDSharingProximityiOSSetupResult dictionaryRepresentation](self, "dictionaryRepresentation"));
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
  if ((has & 0x10) != 0)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", self->_smoothedRSSI));
    objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("smoothedRSSI"));

    has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_7:
      if ((has & 2) == 0)
        goto LABEL_8;
LABEL_13:
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_durationMs));
      objc_msgSend(v3, "setObject:forKey:", v11, CFSTR("durationMs"));

      if ((*(_BYTE *)&self->_has & 8) == 0)
        return v3;
      goto LABEL_9;
    }
  }
  else if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    goto LABEL_7;
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", self->_errorCode));
  objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("errorCode"));

  has = (char)self->_has;
  if ((has & 2) != 0)
    goto LABEL_13;
LABEL_8:
  if ((has & 8) != 0)
  {
LABEL_9:
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_incorrectPINCount));
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("incorrectPINCount"));

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
  unint64_t v29;
  char v30;
  char v31;
  unsigned int v32;
  unint64_t v33;
  char v34;
  char v35;
  unsigned int v36;
  unint64_t v37;
  char v38;
  uint64_t v39;

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
            goto LABEL_57;
          v13 += 7;
          v10 = v14++ >= 9;
          if (v10)
          {
            v15 = 0;
            goto LABEL_59;
          }
        }
        *((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_57:
        if (*((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error))
          v15 = 0;
LABEL_59:
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
        *(_BYTE *)&self->_has |= 0x10u;
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
                LODWORD(v24) = 0;
                goto LABEL_63;
              }
              continue;
            }
          }
          break;
        }
        if (*((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error))
          LODWORD(v24) = 0;
LABEL_63:
        v39 = 40;
        goto LABEL_76;
      case 4u:
        v27 = 0;
        v28 = 0;
        v24 = 0;
        *(_BYTE *)&self->_has |= 4u;
        while (2)
        {
          v29 = *(_QWORD *)((char *)a3 + OBJC_IVAR___PBDataReader__pos);
          if (v29 == -1 || v29 >= *(_QWORD *)((char *)a3 + OBJC_IVAR___PBDataReader__length))
          {
            *((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error) = 1;
          }
          else
          {
            v30 = *(_BYTE *)(*(_QWORD *)((char *)a3 + OBJC_IVAR___PBDataReader__bytes) + v29);
            *(_QWORD *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) = v29 + 1;
            v24 |= (unint64_t)(v30 & 0x7F) << v27;
            if (v30 < 0)
            {
              v27 += 7;
              v10 = v28++ >= 9;
              if (v10)
              {
                LODWORD(v24) = 0;
                goto LABEL_67;
              }
              continue;
            }
          }
          break;
        }
        if (*((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error))
          LODWORD(v24) = 0;
LABEL_67:
        v39 = 20;
        goto LABEL_76;
      case 5u:
        v31 = 0;
        v32 = 0;
        v24 = 0;
        *(_BYTE *)&self->_has |= 2u;
        while (2)
        {
          v33 = *(_QWORD *)((char *)a3 + OBJC_IVAR___PBDataReader__pos);
          if (v33 == -1 || v33 >= *(_QWORD *)((char *)a3 + OBJC_IVAR___PBDataReader__length))
          {
            *((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error) = 1;
          }
          else
          {
            v34 = *(_BYTE *)(*(_QWORD *)((char *)a3 + OBJC_IVAR___PBDataReader__bytes) + v33);
            *(_QWORD *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) = v33 + 1;
            v24 |= (unint64_t)(v34 & 0x7F) << v31;
            if (v34 < 0)
            {
              v31 += 7;
              v10 = v32++ >= 9;
              if (v10)
              {
                LODWORD(v24) = 0;
                goto LABEL_71;
              }
              continue;
            }
          }
          break;
        }
        if (*((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error))
          LODWORD(v24) = 0;
LABEL_71:
        v39 = 16;
        goto LABEL_76;
      case 6u:
        v35 = 0;
        v36 = 0;
        v24 = 0;
        *(_BYTE *)&self->_has |= 8u;
        break;
      default:
        v18 = PBReaderSkipValueWithTag(a3);
        if (!v18)
          return v18;
        continue;
    }
    while (1)
    {
      v37 = *(_QWORD *)((char *)a3 + OBJC_IVAR___PBDataReader__pos);
      if (v37 == -1 || v37 >= *(_QWORD *)((char *)a3 + OBJC_IVAR___PBDataReader__length))
        break;
      v38 = *(_BYTE *)(*(_QWORD *)((char *)a3 + OBJC_IVAR___PBDataReader__bytes) + v37);
      *(_QWORD *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) = v37 + 1;
      v24 |= (unint64_t)(v38 & 0x7F) << v35;
      if ((v38 & 0x80) == 0)
        goto LABEL_73;
      v35 += 7;
      v10 = v36++ >= 9;
      if (v10)
      {
        LODWORD(v24) = 0;
        goto LABEL_75;
      }
    }
    *((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_73:
    if (*((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error))
      LODWORD(v24) = 0;
LABEL_75:
    v39 = 24;
LABEL_76:
    *(_DWORD *)&self->PBCodable_opaque[v39] = v24;
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
  if ((has & 0x10) != 0)
  {
    PBDataWriterWriteInt32Field(v6, self->_smoothedRSSI, 3);
    has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_7:
      if ((has & 2) == 0)
        goto LABEL_8;
LABEL_13:
      PBDataWriterWriteUint32Field(v6, self->_durationMs, 5);
      if ((*(_BYTE *)&self->_has & 8) == 0)
        goto LABEL_10;
      goto LABEL_9;
    }
  }
  else if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    goto LABEL_7;
  }
  PBDataWriterWriteInt32Field(v6, self->_errorCode, 4);
  has = (char)self->_has;
  if ((has & 2) != 0)
    goto LABEL_13;
LABEL_8:
  if ((has & 8) != 0)
LABEL_9:
    PBDataWriterWriteUint32Field(v6, self->_incorrectPINCount, 6);
LABEL_10:

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
    *((_BYTE *)v4 + 44) |= 1u;
  }
  if (self->_sessionUUID)
  {
    v6 = v4;
    objc_msgSend(v4, "setSessionUUID:");
    v4 = v6;
  }
  has = (char)self->_has;
  if ((has & 0x10) != 0)
  {
    *((_DWORD *)v4 + 10) = self->_smoothedRSSI;
    *((_BYTE *)v4 + 44) |= 0x10u;
    has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_7:
      if ((has & 2) == 0)
        goto LABEL_8;
LABEL_13:
      *((_DWORD *)v4 + 4) = self->_durationMs;
      *((_BYTE *)v4 + 44) |= 2u;
      if ((*(_BYTE *)&self->_has & 8) == 0)
        goto LABEL_10;
      goto LABEL_9;
    }
  }
  else if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    goto LABEL_7;
  }
  *((_DWORD *)v4 + 5) = self->_errorCode;
  *((_BYTE *)v4 + 44) |= 4u;
  has = (char)self->_has;
  if ((has & 2) != 0)
    goto LABEL_13;
LABEL_8:
  if ((has & 8) != 0)
  {
LABEL_9:
    *((_DWORD *)v4 + 6) = self->_incorrectPINCount;
    *((_BYTE *)v4 + 44) |= 8u;
  }
LABEL_10:

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
    *((_BYTE *)v5 + 44) |= 1u;
  }
  v7 = -[NSString copyWithZone:](self->_sessionUUID, "copyWithZone:", a3);
  v8 = (void *)v6[4];
  v6[4] = v7;

  has = (char)self->_has;
  if ((has & 0x10) != 0)
  {
    *((_DWORD *)v6 + 10) = self->_smoothedRSSI;
    *((_BYTE *)v6 + 44) |= 0x10u;
    has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_5:
      if ((has & 2) == 0)
        goto LABEL_6;
LABEL_11:
      *((_DWORD *)v6 + 4) = self->_durationMs;
      *((_BYTE *)v6 + 44) |= 2u;
      if ((*(_BYTE *)&self->_has & 8) == 0)
        return v6;
      goto LABEL_7;
    }
  }
  else if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    goto LABEL_5;
  }
  *((_DWORD *)v6 + 5) = self->_errorCode;
  *((_BYTE *)v6 + 44) |= 4u;
  has = (char)self->_has;
  if ((has & 2) != 0)
    goto LABEL_11;
LABEL_6:
  if ((has & 8) != 0)
  {
LABEL_7:
    *((_DWORD *)v6 + 6) = self->_incorrectPINCount;
    *((_BYTE *)v6 + 44) |= 8u;
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
    goto LABEL_29;
  has = (char)self->_has;
  v7 = *((_BYTE *)v4 + 44);
  if ((has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 44) & 1) == 0 || self->_timestamp != *((_QWORD *)v4 + 1))
      goto LABEL_29;
  }
  else if ((*((_BYTE *)v4 + 44) & 1) != 0)
  {
    goto LABEL_29;
  }
  sessionUUID = self->_sessionUUID;
  if ((unint64_t)sessionUUID | *((_QWORD *)v4 + 4))
  {
    if (!-[NSString isEqual:](sessionUUID, "isEqual:"))
    {
LABEL_29:
      v9 = 0;
      goto LABEL_30;
    }
    has = (char)self->_has;
    v7 = *((_BYTE *)v4 + 44);
  }
  if ((has & 0x10) != 0)
  {
    if ((v7 & 0x10) == 0 || self->_smoothedRSSI != *((_DWORD *)v4 + 10))
      goto LABEL_29;
  }
  else if ((v7 & 0x10) != 0)
  {
    goto LABEL_29;
  }
  if ((has & 4) != 0)
  {
    if ((v7 & 4) == 0 || self->_errorCode != *((_DWORD *)v4 + 5))
      goto LABEL_29;
  }
  else if ((v7 & 4) != 0)
  {
    goto LABEL_29;
  }
  if ((has & 2) != 0)
  {
    if ((v7 & 2) == 0 || self->_durationMs != *((_DWORD *)v4 + 4))
      goto LABEL_29;
  }
  else if ((v7 & 2) != 0)
  {
    goto LABEL_29;
  }
  v9 = (v7 & 8) == 0;
  if ((has & 8) != 0)
  {
    if ((v7 & 8) == 0 || self->_incorrectPINCount != *((_DWORD *)v4 + 6))
      goto LABEL_29;
    v9 = 1;
  }
LABEL_30:

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

  if ((*(_BYTE *)&self->_has & 1) != 0)
    v3 = 2654435761u * self->_timestamp;
  else
    v3 = 0;
  v4 = -[NSString hash](self->_sessionUUID, "hash");
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
    v5 = 2654435761 * self->_smoothedRSSI;
    if ((*(_BYTE *)&self->_has & 4) != 0)
    {
LABEL_6:
      v6 = 2654435761 * self->_errorCode;
      if ((*(_BYTE *)&self->_has & 2) != 0)
        goto LABEL_7;
LABEL_11:
      v7 = 0;
      if ((*(_BYTE *)&self->_has & 8) != 0)
        goto LABEL_8;
LABEL_12:
      v8 = 0;
      return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8;
    }
  }
  else
  {
    v5 = 0;
    if ((*(_BYTE *)&self->_has & 4) != 0)
      goto LABEL_6;
  }
  v6 = 0;
  if ((*(_BYTE *)&self->_has & 2) == 0)
    goto LABEL_11;
LABEL_7:
  v7 = 2654435761 * self->_durationMs;
  if ((*(_BYTE *)&self->_has & 8) == 0)
    goto LABEL_12;
LABEL_8:
  v8 = 2654435761 * self->_incorrectPINCount;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  char v5;
  id v6;

  v4 = a3;
  if ((*((_BYTE *)v4 + 44) & 1) != 0)
  {
    self->_timestamp = *((_QWORD *)v4 + 1);
    *(_BYTE *)&self->_has |= 1u;
  }
  if (*((_QWORD *)v4 + 4))
  {
    v6 = v4;
    -[AWDSharingProximityiOSSetupResult setSessionUUID:](self, "setSessionUUID:");
    v4 = v6;
  }
  v5 = *((_BYTE *)v4 + 44);
  if ((v5 & 0x10) != 0)
  {
    self->_smoothedRSSI = *((_DWORD *)v4 + 10);
    *(_BYTE *)&self->_has |= 0x10u;
    v5 = *((_BYTE *)v4 + 44);
    if ((v5 & 4) == 0)
    {
LABEL_7:
      if ((v5 & 2) == 0)
        goto LABEL_8;
LABEL_13:
      self->_durationMs = *((_DWORD *)v4 + 4);
      *(_BYTE *)&self->_has |= 2u;
      if ((*((_BYTE *)v4 + 44) & 8) == 0)
        goto LABEL_10;
      goto LABEL_9;
    }
  }
  else if ((*((_BYTE *)v4 + 44) & 4) == 0)
  {
    goto LABEL_7;
  }
  self->_errorCode = *((_DWORD *)v4 + 5);
  *(_BYTE *)&self->_has |= 4u;
  v5 = *((_BYTE *)v4 + 44);
  if ((v5 & 2) != 0)
    goto LABEL_13;
LABEL_8:
  if ((v5 & 8) != 0)
  {
LABEL_9:
    self->_incorrectPINCount = *((_DWORD *)v4 + 6);
    *(_BYTE *)&self->_has |= 8u;
  }
LABEL_10:

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

- (int)smoothedRSSI
{
  return self->_smoothedRSSI;
}

- (int)errorCode
{
  return self->_errorCode;
}

- (unsigned)durationMs
{
  return self->_durationMs;
}

- (unsigned)incorrectPINCount
{
  return self->_incorrectPINCount;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessionUUID, 0);
}

@end
