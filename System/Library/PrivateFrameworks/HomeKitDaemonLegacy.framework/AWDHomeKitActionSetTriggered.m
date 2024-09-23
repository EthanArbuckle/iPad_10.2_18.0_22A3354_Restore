@implementation AWDHomeKitActionSetTriggered

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

- (void)setDuration:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_duration = a3;
}

- (void)setHasDuration:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasDuration
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
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

- (BOOL)hasTransaction
{
  return self->_transaction != 0;
}

- (int)triggerSource
{
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
    return self->_triggerSource;
  else
    return 0;
}

- (void)setTriggerSource:(int)a3
{
  *(_BYTE *)&self->_has |= 0x10u;
  self->_triggerSource = a3;
}

- (void)setHasTriggerSource:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xEF | v3;
}

- (BOOL)hasTriggerSource
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (id)triggerSourceAsString:(int)a3
{
  if (a3 < 9)
    return off_1E89AFDD8[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsTriggerSource:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AWDHomeKitSource_Unknown")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AWDHomeKitSource_Siri")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AWDHomeKitSource_User")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AWDHomeKitSource_EventTrigger")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AWDHomeKitSource_TimerTrigger")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AWDHomeKitSource_FirstParty")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AWDHomeKitSource_ThirdParty")) & 1) != 0)
  {
    v4 = 6;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AWDHomeKitSource_InternalRequested")) & 1) != 0)
  {
    v4 = 7;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("AWDHomeKitSource_RemoteRequested")))
  {
    v4 = 8;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)setNumAccessories:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_numAccessories = a3;
}

- (void)setHasNumAccessories:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasNumAccessories
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (BOOL)hasClientMetricIdentifier
{
  return self->_clientMetricIdentifier != 0;
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
  v8.super_class = (Class)AWDHomeKitActionSetTriggered;
  -[AWDHomeKitActionSetTriggered description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AWDHomeKitActionSetTriggered dictionaryRepresentation](self, "dictionaryRepresentation");
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
  NSString *transaction;
  char v7;
  uint64_t triggerSource;
  __CFString *v9;
  void *v10;
  void *v11;
  void *v12;
  NSString *clientMetricIdentifier;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_timestamp);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("timestamp"));

    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 4) == 0)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_duration);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v11, CFSTR("duration"));

  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
LABEL_4:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_errorCode);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("errorCode"));

  }
LABEL_5:
  transaction = self->_transaction;
  if (transaction)
    objc_msgSend(v3, "setObject:forKey:", transaction, CFSTR("transaction"));
  v7 = (char)self->_has;
  if ((v7 & 0x10) != 0)
  {
    triggerSource = self->_triggerSource;
    if (triggerSource >= 9)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_triggerSource);
      v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v9 = off_1E89AFDD8[triggerSource];
    }
    objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("triggerSource"));

    v7 = (char)self->_has;
  }
  if ((v7 & 8) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_numAccessories);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v12, CFSTR("numAccessories"));

  }
  clientMetricIdentifier = self->_clientMetricIdentifier;
  if (clientMetricIdentifier)
    objc_msgSend(v3, "setObject:forKey:", clientMetricIdentifier, CFSTR("clientMetricIdentifier"));
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
  objc_class *v41;
  uint64_t v42;
  char v43;
  unsigned int v44;
  uint64_t v45;
  unint64_t v46;
  char v47;
  void *v48;
  uint64_t v49;

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
              goto LABEL_60;
            v18 += 7;
            v15 = v19++ >= 9;
            if (v15)
            {
              v20 = 0;
              goto LABEL_62;
            }
          }
          *((_BYTE *)a3 + *v6) = 1;
LABEL_60:
          if (*((_BYTE *)a3 + *v6))
            v20 = 0;
LABEL_62:
          self->_timestamp = v20;
          continue;
        case 2u:
          v24 = 0;
          v25 = 0;
          v26 = 0;
          *(_BYTE *)&self->_has |= 2u;
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
                  goto LABEL_66;
                }
                continue;
              }
            }
            break;
          }
          if (*((_BYTE *)a3 + *v6))
            LODWORD(v26) = 0;
LABEL_66:
          v49 = 24;
          goto LABEL_79;
        case 3u:
          v30 = 0;
          v31 = 0;
          v26 = 0;
          *(_BYTE *)&self->_has |= 4u;
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
                  goto LABEL_70;
                }
                continue;
              }
            }
            break;
          }
          if (*((_BYTE *)a3 + *v6))
            LODWORD(v26) = 0;
LABEL_70:
          v49 = 28;
          goto LABEL_79;
        case 6u:
          v36 = 0;
          v37 = 0;
          v26 = 0;
          *(_BYTE *)&self->_has |= 8u;
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
              v26 |= (unint64_t)(v40 & 0x7F) << v36;
              if (v40 < 0)
              {
                v36 += 7;
                v15 = v37++ >= 9;
                if (v15)
                {
                  LODWORD(v26) = 0;
                  goto LABEL_74;
                }
                continue;
              }
            }
            break;
          }
          if (*((_BYTE *)a3 + *v6))
            LODWORD(v26) = 0;
LABEL_74:
          v49 = 32;
          goto LABEL_79;
        case 9u:
          PBReaderReadString();
          v41 = (objc_class *)objc_claimAutoreleasedReturnValue();
          v42 = 40;
          goto LABEL_58;
        case 0xAu:
          v43 = 0;
          v44 = 0;
          v26 = 0;
          *(_BYTE *)&self->_has |= 0x10u;
          break;
        case 0xBu:
          PBReaderReadString();
          v41 = (objc_class *)objc_claimAutoreleasedReturnValue();
          v42 = 16;
LABEL_58:
          v48 = *(Class *)((char *)&self->super.super.isa + v42);
          *(Class *)((char *)&self->super.super.isa + v42) = v41;

          continue;
        default:
          v35 = PBReaderSkipValueWithTag();
          if (!v35)
            return v35;
          continue;
      }
      while (1)
      {
        v45 = *v4;
        v46 = *(_QWORD *)((char *)a3 + v45);
        if (v46 == -1 || v46 >= *(_QWORD *)((char *)a3 + *v5))
          break;
        v47 = *(_BYTE *)(*(_QWORD *)((char *)a3 + *v8) + v46);
        *(_QWORD *)((char *)a3 + v45) = v46 + 1;
        v26 |= (unint64_t)(v47 & 0x7F) << v43;
        if ((v47 & 0x80) == 0)
          goto LABEL_76;
        v43 += 7;
        v15 = v44++ >= 9;
        if (v15)
        {
          LODWORD(v26) = 0;
          goto LABEL_78;
        }
      }
      *((_BYTE *)a3 + *v6) = 1;
LABEL_76:
      if (*((_BYTE *)a3 + *v6))
        LODWORD(v26) = 0;
LABEL_78:
      v49 = 48;
LABEL_79:
      *(_DWORD *)((char *)&self->super.super.isa + v49) = v26;
    }
    while (*(_QWORD *)((char *)a3 + *v4) < *(_QWORD *)((char *)a3 + *v5));
  }
  LOBYTE(v35) = *((_BYTE *)a3 + *v6) == 0;
  return v35;
}

- (void)writeTo:(id)a3
{
  id v4;
  char has;
  id v6;

  v4 = a3;
  has = (char)self->_has;
  v6 = v4;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteUint64Field();
    v4 = v6;
    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 4) == 0)
        goto LABEL_4;
      goto LABEL_15;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint32Field();
  v4 = v6;
  has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 8) == 0)
      goto LABEL_6;
    goto LABEL_5;
  }
LABEL_15:
  PBDataWriterWriteInt32Field();
  v4 = v6;
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
LABEL_5:
    PBDataWriterWriteUint32Field();
    v4 = v6;
  }
LABEL_6:
  if (self->_transaction)
  {
    PBDataWriterWriteStringField();
    v4 = v6;
  }
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
    PBDataWriterWriteInt32Field();
    v4 = v6;
  }
  if (self->_clientMetricIdentifier)
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
  if ((has & 1) != 0)
  {
    v4[1] = self->_timestamp;
    *((_BYTE *)v4 + 52) |= 1u;
    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 4) == 0)
        goto LABEL_4;
      goto LABEL_15;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)v4 + 6) = self->_duration;
  *((_BYTE *)v4 + 52) |= 2u;
  has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 8) == 0)
      goto LABEL_6;
    goto LABEL_5;
  }
LABEL_15:
  *((_DWORD *)v4 + 7) = self->_errorCode;
  *((_BYTE *)v4 + 52) |= 4u;
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
LABEL_5:
    *((_DWORD *)v4 + 8) = self->_numAccessories;
    *((_BYTE *)v4 + 52) |= 8u;
  }
LABEL_6:
  v6 = v4;
  if (self->_transaction)
  {
    objc_msgSend(v4, "setTransaction:");
    v4 = v6;
  }
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
    *((_DWORD *)v4 + 12) = self->_triggerSource;
    *((_BYTE *)v4 + 52) |= 0x10u;
  }
  if (self->_clientMetricIdentifier)
  {
    objc_msgSend(v6, "setClientMetricIdentifier:");
    v4 = v6;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  char has;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    *(_QWORD *)(v5 + 8) = self->_timestamp;
    *(_BYTE *)(v5 + 52) |= 1u;
    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 4) == 0)
        goto LABEL_4;
      goto LABEL_11;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  *(_DWORD *)(v5 + 24) = self->_duration;
  *(_BYTE *)(v5 + 52) |= 2u;
  has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 8) == 0)
      goto LABEL_6;
    goto LABEL_5;
  }
LABEL_11:
  *(_DWORD *)(v5 + 28) = self->_errorCode;
  *(_BYTE *)(v5 + 52) |= 4u;
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
LABEL_5:
    *(_DWORD *)(v5 + 32) = self->_numAccessories;
    *(_BYTE *)(v5 + 52) |= 8u;
  }
LABEL_6:
  v8 = -[NSString copyWithZone:](self->_transaction, "copyWithZone:", a3);
  v9 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v8;

  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
    *(_DWORD *)(v6 + 48) = self->_triggerSource;
    *(_BYTE *)(v6 + 52) |= 0x10u;
  }
  v10 = -[NSString copyWithZone:](self->_clientMetricIdentifier, "copyWithZone:", a3);
  v11 = *(void **)(v6 + 16);
  *(_QWORD *)(v6 + 16) = v10;

  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  char has;
  char v6;
  NSString *transaction;
  NSString *clientMetricIdentifier;
  char v9;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_32;
  has = (char)self->_has;
  v6 = *((_BYTE *)v4 + 52);
  if ((has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 52) & 1) == 0 || self->_timestamp != *((_QWORD *)v4 + 1))
      goto LABEL_32;
  }
  else if ((*((_BYTE *)v4 + 52) & 1) != 0)
  {
    goto LABEL_32;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 52) & 2) == 0 || self->_duration != *((_DWORD *)v4 + 6))
      goto LABEL_32;
  }
  else if ((*((_BYTE *)v4 + 52) & 2) != 0)
  {
    goto LABEL_32;
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 52) & 4) == 0 || self->_errorCode != *((_DWORD *)v4 + 7))
      goto LABEL_32;
  }
  else if ((*((_BYTE *)v4 + 52) & 4) != 0)
  {
    goto LABEL_32;
  }
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    if ((*((_BYTE *)v4 + 52) & 8) == 0 || self->_numAccessories != *((_DWORD *)v4 + 8))
      goto LABEL_32;
  }
  else if ((*((_BYTE *)v4 + 52) & 8) != 0)
  {
    goto LABEL_32;
  }
  transaction = self->_transaction;
  if ((unint64_t)transaction | *((_QWORD *)v4 + 5))
  {
    if (!-[NSString isEqual:](transaction, "isEqual:"))
    {
LABEL_32:
      v9 = 0;
      goto LABEL_33;
    }
    has = (char)self->_has;
    v6 = *((_BYTE *)v4 + 52);
  }
  if ((has & 0x10) != 0)
  {
    if ((v6 & 0x10) == 0 || self->_triggerSource != *((_DWORD *)v4 + 12))
      goto LABEL_32;
  }
  else if ((v6 & 0x10) != 0)
  {
    goto LABEL_32;
  }
  clientMetricIdentifier = self->_clientMetricIdentifier;
  if ((unint64_t)clientMetricIdentifier | *((_QWORD *)v4 + 2))
    v9 = -[NSString isEqual:](clientMetricIdentifier, "isEqual:");
  else
    v9 = 1;
LABEL_33:

  return v9;
}

- (unint64_t)hash
{
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  NSUInteger v7;
  uint64_t v8;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v3 = 2654435761u * self->_timestamp;
    if ((*(_BYTE *)&self->_has & 2) != 0)
    {
LABEL_3:
      v4 = 2654435761 * self->_duration;
      if ((*(_BYTE *)&self->_has & 4) != 0)
        goto LABEL_4;
LABEL_8:
      v5 = 0;
      if ((*(_BYTE *)&self->_has & 8) != 0)
        goto LABEL_5;
      goto LABEL_9;
    }
  }
  else
  {
    v3 = 0;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_3;
  }
  v4 = 0;
  if ((*(_BYTE *)&self->_has & 4) == 0)
    goto LABEL_8;
LABEL_4:
  v5 = 2654435761 * self->_errorCode;
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
LABEL_5:
    v6 = 2654435761 * self->_numAccessories;
    goto LABEL_10;
  }
LABEL_9:
  v6 = 0;
LABEL_10:
  v7 = -[NSString hash](self->_transaction, "hash");
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
    v8 = 2654435761 * self->_triggerSource;
  else
    v8 = 0;
  return v4 ^ v3 ^ v5 ^ v6 ^ v8 ^ v7 ^ -[NSString hash](self->_clientMetricIdentifier, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  char v5;
  id v6;

  v4 = a3;
  v5 = *((_BYTE *)v4 + 52);
  if ((v5 & 1) != 0)
  {
    self->_timestamp = *((_QWORD *)v4 + 1);
    *(_BYTE *)&self->_has |= 1u;
    v5 = *((_BYTE *)v4 + 52);
    if ((v5 & 2) == 0)
    {
LABEL_3:
      if ((v5 & 4) == 0)
        goto LABEL_4;
      goto LABEL_15;
    }
  }
  else if ((*((_BYTE *)v4 + 52) & 2) == 0)
  {
    goto LABEL_3;
  }
  self->_duration = *((_DWORD *)v4 + 6);
  *(_BYTE *)&self->_has |= 2u;
  v5 = *((_BYTE *)v4 + 52);
  if ((v5 & 4) == 0)
  {
LABEL_4:
    if ((v5 & 8) == 0)
      goto LABEL_6;
    goto LABEL_5;
  }
LABEL_15:
  self->_errorCode = *((_DWORD *)v4 + 7);
  *(_BYTE *)&self->_has |= 4u;
  if ((*((_BYTE *)v4 + 52) & 8) != 0)
  {
LABEL_5:
    self->_numAccessories = *((_DWORD *)v4 + 8);
    *(_BYTE *)&self->_has |= 8u;
  }
LABEL_6:
  v6 = v4;
  if (*((_QWORD *)v4 + 5))
  {
    -[AWDHomeKitActionSetTriggered setTransaction:](self, "setTransaction:");
    v4 = v6;
  }
  if ((*((_BYTE *)v4 + 52) & 0x10) != 0)
  {
    self->_triggerSource = *((_DWORD *)v4 + 12);
    *(_BYTE *)&self->_has |= 0x10u;
  }
  if (*((_QWORD *)v4 + 2))
  {
    -[AWDHomeKitActionSetTriggered setClientMetricIdentifier:](self, "setClientMetricIdentifier:");
    v4 = v6;
  }

}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (unsigned)duration
{
  return self->_duration;
}

- (int)errorCode
{
  return self->_errorCode;
}

- (NSString)transaction
{
  return self->_transaction;
}

- (void)setTransaction:(id)a3
{
  objc_storeStrong((id *)&self->_transaction, a3);
}

- (unsigned)numAccessories
{
  return self->_numAccessories;
}

- (NSString)clientMetricIdentifier
{
  return self->_clientMetricIdentifier;
}

- (void)setClientMetricIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_clientMetricIdentifier, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transaction, 0);
  objc_storeStrong((id *)&self->_clientMetricIdentifier, 0);
}

@end
