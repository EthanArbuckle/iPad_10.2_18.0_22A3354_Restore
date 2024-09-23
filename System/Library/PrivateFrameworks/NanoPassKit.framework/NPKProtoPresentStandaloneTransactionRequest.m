@implementation NPKProtoPresentStandaloneTransactionRequest

- (void)setTransactionType:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_transactionType = a3;
}

- (void)setHasTransactionType:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasTransactionType
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (BOOL)hasWatchPassUniqueID
{
  return self->_watchPassUniqueID != 0;
}

- (void)setValidUntilEpochTimeInterval:(double)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_validUntilEpochTimeInterval = a3;
}

- (void)setHasValidUntilEpochTimeInterval:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasValidUntilEpochTimeInterval
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

  v3 = (void *)MEMORY[0x24BDD17C8];
  v8.receiver = self;
  v8.super_class = (Class)NPKProtoPresentStandaloneTransactionRequest;
  -[NPKProtoPresentStandaloneTransactionRequest description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPKProtoPresentStandaloneTransactionRequest dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *watchPassUniqueID;
  void *v6;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_transactionType);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("transactionType"));

  }
  watchPassUniqueID = self->_watchPassUniqueID;
  if (watchPassUniqueID)
    objc_msgSend(v3, "setObject:forKey:", watchPassUniqueID, CFSTR("watchPassUniqueID"));
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_validUntilEpochTimeInterval);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("validUntilEpochTimeInterval"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return NPKProtoPresentStandaloneTransactionRequestReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    PBDataWriterWriteUint32Field();
    v4 = v5;
  }
  if (self->_watchPassUniqueID)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    PBDataWriterWriteDoubleField();
    v4 = v5;
  }

}

- (void)copyTo:(id)a3
{
  _DWORD *v4;
  _DWORD *v5;

  v4 = a3;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    v4[4] = self->_transactionType;
    *((_BYTE *)v4 + 32) |= 2u;
  }
  if (self->_watchPassUniqueID)
  {
    v5 = v4;
    objc_msgSend(v4, "setWatchPassUniqueID:");
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_QWORD *)v4 + 1) = *(_QWORD *)&self->_validUntilEpochTimeInterval;
    *((_BYTE *)v4 + 32) |= 1u;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    *(_DWORD *)(v5 + 16) = self->_transactionType;
    *(_BYTE *)(v5 + 32) |= 2u;
  }
  v7 = -[NSString copyWithZone:](self->_watchPassUniqueID, "copyWithZone:", a3);
  v8 = *(void **)(v6 + 24);
  *(_QWORD *)(v6 + 24) = v7;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(double *)(v6 + 8) = self->_validUntilEpochTimeInterval;
    *(_BYTE *)(v6 + 32) |= 1u;
  }
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  char has;
  NSString *watchPassUniqueID;
  BOOL v7;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_14;
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 32) & 2) == 0 || self->_transactionType != *((_DWORD *)v4 + 4))
      goto LABEL_14;
  }
  else if ((*((_BYTE *)v4 + 32) & 2) != 0)
  {
    goto LABEL_14;
  }
  watchPassUniqueID = self->_watchPassUniqueID;
  if ((unint64_t)watchPassUniqueID | *((_QWORD *)v4 + 3))
  {
    if (!-[NSString isEqual:](watchPassUniqueID, "isEqual:"))
    {
LABEL_14:
      v7 = 0;
      goto LABEL_15;
    }
    has = (char)self->_has;
  }
  v7 = (*((_BYTE *)v4 + 32) & 1) == 0;
  if ((has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 32) & 1) == 0 || self->_validUntilEpochTimeInterval != *((double *)v4 + 1))
      goto LABEL_14;
    v7 = 1;
  }
LABEL_15:

  return v7;
}

- (unint64_t)hash
{
  uint64_t v3;
  NSUInteger v4;
  unint64_t v5;
  double validUntilEpochTimeInterval;
  double v7;
  long double v8;
  double v9;

  if ((*(_BYTE *)&self->_has & 2) != 0)
    v3 = 2654435761 * self->_transactionType;
  else
    v3 = 0;
  v4 = -[NSString hash](self->_watchPassUniqueID, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    validUntilEpochTimeInterval = self->_validUntilEpochTimeInterval;
    v7 = -validUntilEpochTimeInterval;
    if (validUntilEpochTimeInterval >= 0.0)
      v7 = self->_validUntilEpochTimeInterval;
    v8 = floor(v7 + 0.5);
    v9 = (v7 - v8) * 1.84467441e19;
    v5 = 2654435761u * (unint64_t)fmod(v8, 1.84467441e19);
    if (v9 >= 0.0)
    {
      if (v9 > 0.0)
        v5 += (unint64_t)v9;
    }
    else
    {
      v5 -= (unint64_t)fabs(v9);
    }
  }
  else
  {
    v5 = 0;
  }
  return v4 ^ v3 ^ v5;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  if ((*((_BYTE *)v4 + 32) & 2) != 0)
  {
    self->_transactionType = *((_DWORD *)v4 + 4);
    *(_BYTE *)&self->_has |= 2u;
  }
  if (*((_QWORD *)v4 + 3))
  {
    v5 = v4;
    -[NPKProtoPresentStandaloneTransactionRequest setWatchPassUniqueID:](self, "setWatchPassUniqueID:");
    v4 = v5;
  }
  if ((*((_BYTE *)v4 + 32) & 1) != 0)
  {
    self->_validUntilEpochTimeInterval = *((double *)v4 + 1);
    *(_BYTE *)&self->_has |= 1u;
  }

}

- (unsigned)transactionType
{
  return self->_transactionType;
}

- (NSString)watchPassUniqueID
{
  return self->_watchPassUniqueID;
}

- (void)setWatchPassUniqueID:(id)a3
{
  objc_storeStrong((id *)&self->_watchPassUniqueID, a3);
}

- (double)validUntilEpochTimeInterval
{
  return self->_validUntilEpochTimeInterval;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_watchPassUniqueID, 0);
}

@end
