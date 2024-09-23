@implementation _MPCProtoItemIdentifierSet

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v8.receiver = self;
  v8.super_class = (Class)_MPCProtoItemIdentifierSet;
  -[_MPCProtoItemIdentifierSet description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MPCProtoItemIdentifierSet dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *contentItemID;
  char has;
  void *v7;
  NSString *cloudUniversalLibraryID;
  void *v10;
  void *v11;
  void *v12;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_delegateInfoID);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("delegateInfoID"));

  }
  contentItemID = self->_contentItemID;
  if (contentItemID)
    objc_msgSend(v3, "setObject:forKey:", contentItemID, CFSTR("contentItemID"));
  has = (char)self->_has;
  if ((has & 8) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_storeAdamID);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("storeAdamID"));

    has = (char)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_7:
      if ((has & 1) == 0)
        goto LABEL_8;
      goto LABEL_15;
    }
  }
  else if ((*(_BYTE *)&self->_has & 0x10) == 0)
  {
    goto LABEL_7;
  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_storeSubscriptionAdamID);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v11, CFSTR("storeSubscriptionAdamID"));

  has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_8:
    if ((has & 4) == 0)
      goto LABEL_10;
    goto LABEL_9;
  }
LABEL_15:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_cloudID);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v12, CFSTR("cloudID"));

  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
LABEL_9:
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_purchaseHistoryID);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("purchaseHistoryID"));

  }
LABEL_10:
  cloudUniversalLibraryID = self->_cloudUniversalLibraryID;
  if (cloudUniversalLibraryID)
    objc_msgSend(v3, "setObject:forKey:", cloudUniversalLibraryID, CFSTR("cloudUniversalLibraryID"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return _MPCProtoItemIdentifierSetReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  char has;
  id v6;

  v4 = a3;
  v6 = v4;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    PBDataWriterWriteInt64Field();
    v4 = v6;
  }
  if (self->_contentItemID)
  {
    PBDataWriterWriteStringField();
    v4 = v6;
  }
  has = (char)self->_has;
  if ((has & 8) != 0)
  {
    PBDataWriterWriteInt64Field();
    v4 = v6;
    has = (char)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_7:
      if ((has & 1) == 0)
        goto LABEL_8;
      goto LABEL_15;
    }
  }
  else if ((*(_BYTE *)&self->_has & 0x10) == 0)
  {
    goto LABEL_7;
  }
  PBDataWriterWriteInt64Field();
  v4 = v6;
  has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_8:
    if ((has & 4) == 0)
      goto LABEL_10;
    goto LABEL_9;
  }
LABEL_15:
  PBDataWriterWriteInt64Field();
  v4 = v6;
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
LABEL_9:
    PBDataWriterWriteInt64Field();
    v4 = v6;
  }
LABEL_10:
  if (self->_cloudUniversalLibraryID)
  {
    PBDataWriterWriteStringField();
    v4 = v6;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  char has;
  uint64_t v10;
  void *v11;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    *(_QWORD *)(v5 + 16) = self->_delegateInfoID;
    *(_BYTE *)(v5 + 64) |= 2u;
  }
  v7 = -[NSString copyWithZone:](self->_contentItemID, "copyWithZone:", a3);
  v8 = *(void **)(v6 + 56);
  *(_QWORD *)(v6 + 56) = v7;

  has = (char)self->_has;
  if ((has & 8) != 0)
  {
    *(_QWORD *)(v6 + 32) = self->_storeAdamID;
    *(_BYTE *)(v6 + 64) |= 8u;
    has = (char)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_5:
      if ((has & 1) == 0)
        goto LABEL_6;
LABEL_11:
      *(_QWORD *)(v6 + 8) = self->_cloudID;
      *(_BYTE *)(v6 + 64) |= 1u;
      if ((*(_BYTE *)&self->_has & 4) == 0)
        goto LABEL_8;
      goto LABEL_7;
    }
  }
  else if ((*(_BYTE *)&self->_has & 0x10) == 0)
  {
    goto LABEL_5;
  }
  *(_QWORD *)(v6 + 40) = self->_storeSubscriptionAdamID;
  *(_BYTE *)(v6 + 64) |= 0x10u;
  has = (char)self->_has;
  if ((has & 1) != 0)
    goto LABEL_11;
LABEL_6:
  if ((has & 4) != 0)
  {
LABEL_7:
    *(_QWORD *)(v6 + 24) = self->_purchaseHistoryID;
    *(_BYTE *)(v6 + 64) |= 4u;
  }
LABEL_8:
  v10 = -[NSString copyWithZone:](self->_cloudUniversalLibraryID, "copyWithZone:", a3);
  v11 = *(void **)(v6 + 48);
  *(_QWORD *)(v6 + 48) = v10;

  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  char has;
  char v6;
  NSString *contentItemID;
  NSString *cloudUniversalLibraryID;
  char v9;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_32;
  has = (char)self->_has;
  v6 = *((_BYTE *)v4 + 64);
  if ((has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 64) & 2) == 0 || self->_delegateInfoID != *((_QWORD *)v4 + 2))
      goto LABEL_32;
  }
  else if ((*((_BYTE *)v4 + 64) & 2) != 0)
  {
    goto LABEL_32;
  }
  contentItemID = self->_contentItemID;
  if ((unint64_t)contentItemID | *((_QWORD *)v4 + 7))
  {
    if (!-[NSString isEqual:](contentItemID, "isEqual:"))
    {
LABEL_32:
      v9 = 0;
      goto LABEL_33;
    }
    has = (char)self->_has;
    v6 = *((_BYTE *)v4 + 64);
  }
  if ((has & 8) != 0)
  {
    if ((v6 & 8) == 0 || self->_storeAdamID != *((_QWORD *)v4 + 4))
      goto LABEL_32;
  }
  else if ((v6 & 8) != 0)
  {
    goto LABEL_32;
  }
  if ((has & 0x10) != 0)
  {
    if ((v6 & 0x10) == 0 || self->_storeSubscriptionAdamID != *((_QWORD *)v4 + 5))
      goto LABEL_32;
  }
  else if ((v6 & 0x10) != 0)
  {
    goto LABEL_32;
  }
  if ((has & 1) != 0)
  {
    if ((v6 & 1) == 0 || self->_cloudID != *((_QWORD *)v4 + 1))
      goto LABEL_32;
  }
  else if ((v6 & 1) != 0)
  {
    goto LABEL_32;
  }
  if ((has & 4) != 0)
  {
    if ((v6 & 4) == 0 || self->_purchaseHistoryID != *((_QWORD *)v4 + 3))
      goto LABEL_32;
  }
  else if ((v6 & 4) != 0)
  {
    goto LABEL_32;
  }
  cloudUniversalLibraryID = self->_cloudUniversalLibraryID;
  if ((unint64_t)cloudUniversalLibraryID | *((_QWORD *)v4 + 6))
    v9 = -[NSString isEqual:](cloudUniversalLibraryID, "isEqual:");
  else
    v9 = 1;
LABEL_33:

  return v9;
}

- (unint64_t)hash
{
  uint64_t v3;
  NSUInteger v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  if ((*(_BYTE *)&self->_has & 2) != 0)
    v3 = 2654435761 * self->_delegateInfoID;
  else
    v3 = 0;
  v4 = -[NSString hash](self->_contentItemID, "hash");
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    v5 = 2654435761 * self->_storeAdamID;
    if ((*(_BYTE *)&self->_has & 0x10) != 0)
    {
LABEL_6:
      v6 = 2654435761 * self->_storeSubscriptionAdamID;
      if ((*(_BYTE *)&self->_has & 1) != 0)
        goto LABEL_7;
LABEL_11:
      v7 = 0;
      if ((*(_BYTE *)&self->_has & 4) != 0)
        goto LABEL_8;
LABEL_12:
      v8 = 0;
      return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ -[NSString hash](self->_cloudUniversalLibraryID, "hash");
    }
  }
  else
  {
    v5 = 0;
    if ((*(_BYTE *)&self->_has & 0x10) != 0)
      goto LABEL_6;
  }
  v6 = 0;
  if ((*(_BYTE *)&self->_has & 1) == 0)
    goto LABEL_11;
LABEL_7:
  v7 = 2654435761 * self->_cloudID;
  if ((*(_BYTE *)&self->_has & 4) == 0)
    goto LABEL_12;
LABEL_8:
  v8 = 2654435761 * self->_purchaseHistoryID;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ -[NSString hash](self->_cloudUniversalLibraryID, "hash");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentItemID, 0);
  objc_storeStrong((id *)&self->_cloudUniversalLibraryID, 0);
}

@end
