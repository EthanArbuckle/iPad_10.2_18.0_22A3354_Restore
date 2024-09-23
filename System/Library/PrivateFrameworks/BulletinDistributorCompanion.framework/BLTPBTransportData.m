@implementation BLTPBTransportData

+ (id)transportDataWithSequenceNumberManager:(id)a3
{
  id v3;
  void *v4;
  BLTPBTransportData *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD v18[3];

  v18[2] = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(v3, "nextSendSequenceNumber");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = objc_alloc_init(BLTPBTransportData);
    -[BLTPBTransportData setSequenceNumber:](v5, "setSequenceNumber:", objc_msgSend(v4, "unsignedLongLongValue"));
    v6 = objc_msgSend(v3, "sessionState");
    if (v6)
    {
      v7 = v6;
      -[BLTPBTransportData setSessionState:](v5, "setSessionState:", v6);
      if (v7 == 1)
        -[BLTPBTransportData setIsInitialSequenceNumber:](v5, "setIsInitialSequenceNumber:", 1);
    }
    v18[0] = 0;
    v18[1] = 0;
    objc_msgSend(v3, "currentSessionIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "getUUIDBytes:", v18);

    objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", v18, 16);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[BLTPBTransportData setSessionIdentifier:](v5, "setSessionIdentifier:", v9);

  }
  else
  {
    blt_ids_log();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      +[BLTPBTransportData(SequenceNumberManager) transportDataWithSequenceNumberManager:].cold.1((uint64_t)v3, v10, v11, v12, v13, v14, v15, v16);

    v5 = 0;
  }

  return v5;
}

- (id)sessionUUID
{
  id v3;
  id v4;
  void *v5;

  if (-[BLTPBTransportData hasSessionIdentifier](self, "hasSessionIdentifier"))
  {
    v3 = objc_alloc(MEMORY[0x24BDD1880]);
    -[BLTPBTransportData sessionIdentifier](self, "sessionIdentifier");
    v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v5 = (void *)objc_msgSend(v3, "initWithUUIDBytes:", objc_msgSend(v4, "bytes"));

  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (unint64_t)backwardsCompatibleSessionState
{
  unint64_t result;

  if (-[BLTPBTransportData hasSessionState](self, "hasSessionState"))
  {
    LODWORD(result) = -[BLTPBTransportData sessionState](self, "sessionState");
    return result;
  }
  if (-[BLTPBTransportData hasIsInitialSequenceNumber](self, "hasIsInitialSequenceNumber"))
  {
    LODWORD(result) = -[BLTPBTransportData isInitialSequenceNumber](self, "isInitialSequenceNumber");
    return result;
  }
  return 0;
}

- (int64_t)setSequenceNumberOnManager:(id)a3
{
  id v4;
  unint64_t v5;
  void *v6;
  int64_t v7;

  v4 = a3;
  v5 = -[BLTPBTransportData sequenceNumber](self, "sequenceNumber");
  -[BLTPBTransportData sessionUUID](self, "sessionUUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v4, "setRecvSequenceNumber:recvSessionIdentifier:force:", v5, v6, -[BLTPBTransportData backwardsCompatibleSessionState](self, "backwardsCompatibleSessionState") == 1);

  return v7;
}

- (void)setSequenceNumber:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_sequenceNumber = a3;
}

- (void)setHasSequenceNumber:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasSequenceNumber
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setIsInitialSequenceNumber:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_isInitialSequenceNumber = a3;
}

- (void)setHasIsInitialSequenceNumber:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasIsInitialSequenceNumber
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (BOOL)hasSessionIdentifier
{
  return self->_sessionIdentifier != 0;
}

- (void)setSessionState:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_sessionState = a3;
}

- (void)setHasSessionState:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasSessionState
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (BOOL)hasMd5
{
  return self->_md5 != 0;
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
  v8.super_class = (Class)BLTPBTransportData;
  -[BLTPBTransportData description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[BLTPBTransportData dictionaryRepresentation](self, "dictionaryRepresentation");
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
  NSData *sessionIdentifier;
  void *v8;
  NSData *md5;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_sequenceNumber);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("sequenceNumber"));

    has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_isInitialSequenceNumber);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("isInitialSequenceNumber"));

  }
  sessionIdentifier = self->_sessionIdentifier;
  if (sessionIdentifier)
    objc_msgSend(v3, "setObject:forKey:", sessionIdentifier, CFSTR("sessionIdentifier"));
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_sessionState);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("sessionState"));

  }
  md5 = self->_md5;
  if (md5)
    objc_msgSend(v3, "setObject:forKey:", md5, CFSTR("md5"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return BLTPBTransportDataReadFrom((uint64_t)self, (uint64_t)a3);
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
  }
  if ((has & 4) != 0)
  {
    PBDataWriterWriteBOOLField();
    v4 = v6;
  }
  if (self->_sessionIdentifier)
  {
    PBDataWriterWriteDataField();
    v4 = v6;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    PBDataWriterWriteUint32Field();
    v4 = v6;
  }
  if (self->_md5)
  {
    PBDataWriterWriteDataField();
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
    v4[1] = self->_sequenceNumber;
    *((_BYTE *)v4 + 40) |= 1u;
    has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    *((_BYTE *)v4 + 36) = self->_isInitialSequenceNumber;
    *((_BYTE *)v4 + 40) |= 4u;
  }
  v6 = v4;
  if (self->_sessionIdentifier)
  {
    objc_msgSend(v4, "setSessionIdentifier:");
    v4 = v6;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    *((_DWORD *)v4 + 8) = self->_sessionState;
    *((_BYTE *)v4 + 40) |= 2u;
  }
  if (self->_md5)
  {
    objc_msgSend(v6, "setMd5:");
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
    *(_QWORD *)(v5 + 8) = self->_sequenceNumber;
    *(_BYTE *)(v5 + 40) |= 1u;
    has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    *(_BYTE *)(v5 + 36) = self->_isInitialSequenceNumber;
    *(_BYTE *)(v5 + 40) |= 4u;
  }
  v8 = -[NSData copyWithZone:](self->_sessionIdentifier, "copyWithZone:", a3);
  v9 = *(void **)(v6 + 24);
  *(_QWORD *)(v6 + 24) = v8;

  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    *(_DWORD *)(v6 + 32) = self->_sessionState;
    *(_BYTE *)(v6 + 40) |= 2u;
  }
  v10 = -[NSData copyWithZone:](self->_md5, "copyWithZone:", a3);
  v11 = *(void **)(v6 + 16);
  *(_QWORD *)(v6 + 16) = v10;

  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  char has;
  NSData *sessionIdentifier;
  NSData *md5;
  char v8;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_25;
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 40) & 1) == 0 || self->_sequenceNumber != *((_QWORD *)v4 + 1))
      goto LABEL_25;
  }
  else if ((*((_BYTE *)v4 + 40) & 1) != 0)
  {
    goto LABEL_25;
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 40) & 4) == 0)
      goto LABEL_25;
    if (self->_isInitialSequenceNumber)
    {
      if (!*((_BYTE *)v4 + 36))
        goto LABEL_25;
    }
    else if (*((_BYTE *)v4 + 36))
    {
      goto LABEL_25;
    }
  }
  else if ((*((_BYTE *)v4 + 40) & 4) != 0)
  {
    goto LABEL_25;
  }
  sessionIdentifier = self->_sessionIdentifier;
  if (!((unint64_t)sessionIdentifier | *((_QWORD *)v4 + 3)))
    goto LABEL_18;
  if (!-[NSData isEqual:](sessionIdentifier, "isEqual:"))
  {
LABEL_25:
    v8 = 0;
    goto LABEL_26;
  }
  has = (char)self->_has;
LABEL_18:
  if ((has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 40) & 2) == 0 || self->_sessionState != *((_DWORD *)v4 + 8))
      goto LABEL_25;
  }
  else if ((*((_BYTE *)v4 + 40) & 2) != 0)
  {
    goto LABEL_25;
  }
  md5 = self->_md5;
  if ((unint64_t)md5 | *((_QWORD *)v4 + 2))
    v8 = -[NSData isEqual:](md5, "isEqual:");
  else
    v8 = 1;
LABEL_26:

  return v8;
}

- (unint64_t)hash
{
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v3 = 2654435761u * self->_sequenceNumber;
    if ((*(_BYTE *)&self->_has & 4) != 0)
      goto LABEL_3;
  }
  else
  {
    v3 = 0;
    if ((*(_BYTE *)&self->_has & 4) != 0)
    {
LABEL_3:
      v4 = 2654435761 * self->_isInitialSequenceNumber;
      goto LABEL_6;
    }
  }
  v4 = 0;
LABEL_6:
  v5 = -[NSData hash](self->_sessionIdentifier, "hash");
  if ((*(_BYTE *)&self->_has & 2) != 0)
    v6 = 2654435761 * self->_sessionState;
  else
    v6 = 0;
  return v4 ^ v3 ^ v6 ^ v5 ^ -[NSData hash](self->_md5, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  char v5;
  id v6;

  v4 = a3;
  v5 = *((_BYTE *)v4 + 40);
  if ((v5 & 1) != 0)
  {
    self->_sequenceNumber = *((_QWORD *)v4 + 1);
    *(_BYTE *)&self->_has |= 1u;
    v5 = *((_BYTE *)v4 + 40);
  }
  if ((v5 & 4) != 0)
  {
    self->_isInitialSequenceNumber = *((_BYTE *)v4 + 36);
    *(_BYTE *)&self->_has |= 4u;
  }
  v6 = v4;
  if (*((_QWORD *)v4 + 3))
  {
    -[BLTPBTransportData setSessionIdentifier:](self, "setSessionIdentifier:");
    v4 = v6;
  }
  if ((*((_BYTE *)v4 + 40) & 2) != 0)
  {
    self->_sessionState = *((_DWORD *)v4 + 8);
    *(_BYTE *)&self->_has |= 2u;
  }
  if (*((_QWORD *)v4 + 2))
  {
    -[BLTPBTransportData setMd5:](self, "setMd5:");
    v4 = v6;
  }

}

- (unint64_t)sequenceNumber
{
  return self->_sequenceNumber;
}

- (BOOL)isInitialSequenceNumber
{
  return self->_isInitialSequenceNumber;
}

- (NSData)sessionIdentifier
{
  return self->_sessionIdentifier;
}

- (void)setSessionIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_sessionIdentifier, a3);
}

- (unsigned)sessionState
{
  return self->_sessionState;
}

- (NSData)md5
{
  return self->_md5;
}

- (void)setMd5:(id)a3
{
  objc_storeStrong((id *)&self->_md5, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessionIdentifier, 0);
  objc_storeStrong((id *)&self->_md5, 0);
}

@end
