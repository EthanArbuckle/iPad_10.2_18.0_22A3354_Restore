@implementation NTPBRecordBase

- (NSString)identifier
{
  return self->_identifier;
}

- (NTPBDate)assetURLsDate
{
  return self->_assetURLsDate;
}

- (NTPBDate)fetchDate
{
  return self->_fetchDate;
}

- (int)recordType
{
  if ((*(_BYTE *)&self->_has & 2) != 0)
    return self->_recordType;
  else
    return 0;
}

- (int)cacheLifetimeHint
{
  if ((*(_BYTE *)&self->_has & 1) != 0)
    return self->_cacheLifetimeHint;
  else
    return 0;
}

- (NTPBDate)modificationDate
{
  return self->_modificationDate;
}

- (NSString)changeTag
{
  return self->_changeTag;
}

- (BOOL)deletedFromCloud
{
  return self->_deletedFromCloud;
}

- (void)dealloc
{
  objc_super v3;

  -[NTPBRecordBase setIdentifier:](self, "setIdentifier:", 0);
  -[NTPBRecordBase setChangeTag:](self, "setChangeTag:", 0);
  -[NTPBRecordBase setModificationDate:](self, "setModificationDate:", 0);
  -[NTPBRecordBase setFetchDate:](self, "setFetchDate:", 0);
  -[NTPBRecordBase setAssetURLsDate:](self, "setAssetURLsDate:", 0);
  v3.receiver = self;
  v3.super_class = (Class)NTPBRecordBase;
  -[NTPBRecordBase dealloc](&v3, sel_dealloc);
}

- (void)setFetchDate:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 32);
}

- (void)setModificationDate:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 48);
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 40);
}

- (void)setChangeTag:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 24);
}

- (void)setAssetURLsDate:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 8);
}

- (void)setRecordType:(int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_recordType = a3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  char has;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");

  *(_QWORD *)(v5 + 40) = -[NSString copyWithZone:](self->_identifier, "copyWithZone:", a3);
  *(_QWORD *)(v5 + 24) = -[NSString copyWithZone:](self->_changeTag, "copyWithZone:", a3);

  *(_QWORD *)(v5 + 48) = -[NTPBDate copyWithZone:](self->_modificationDate, "copyWithZone:", a3);
  *(_QWORD *)(v5 + 32) = -[NTPBDate copyWithZone:](self->_fetchDate, "copyWithZone:", a3);
  has = (char)self->_has;
  if ((has & 4) == 0)
  {
    if ((*(_BYTE *)&self->_has & 1) == 0)
      goto LABEL_3;
LABEL_7:
    *(_DWORD *)(v5 + 16) = self->_cacheLifetimeHint;
    *(_BYTE *)(v5 + 64) |= 1u;
    if ((*(_BYTE *)&self->_has & 2) == 0)
      goto LABEL_5;
    goto LABEL_4;
  }
  *(_BYTE *)(v5 + 60) = self->_deletedFromCloud;
  *(_BYTE *)(v5 + 64) |= 4u;
  has = (char)self->_has;
  if ((has & 1) != 0)
    goto LABEL_7;
LABEL_3:
  if ((has & 2) != 0)
  {
LABEL_4:
    *(_DWORD *)(v5 + 56) = self->_recordType;
    *(_BYTE *)(v5 + 64) |= 2u;
  }
LABEL_5:

  *(_QWORD *)(v5 + 8) = -[NTPBDate copyWithZone:](self->_assetURLsDate, "copyWithZone:", a3);
  return (id)v5;
}

- (BOOL)hasIdentifier
{
  return self->_identifier != 0;
}

- (BOOL)hasChangeTag
{
  return self->_changeTag != 0;
}

- (BOOL)hasModificationDate
{
  return self->_modificationDate != 0;
}

- (BOOL)hasFetchDate
{
  return self->_fetchDate != 0;
}

- (void)setDeletedFromCloud:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_deletedFromCloud = a3;
}

- (void)setHasDeletedFromCloud:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasDeletedFromCloud
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setCacheLifetimeHint:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_cacheLifetimeHint = a3;
}

- (void)setHasCacheLifetimeHint:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasCacheLifetimeHint
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasRecordType:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasRecordType
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (BOOL)hasAssetURLsDate
{
  return self->_assetURLsDate != 0;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NTPBRecordBase;
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@"), -[NTPBRecordBase description](&v3, sel_description), -[NTPBRecordBase dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *identifier;
  NSString *changeTag;
  NTPBDate *modificationDate;
  NTPBDate *fetchDate;
  char has;
  NTPBDate *assetURLsDate;

  v3 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v4 = v3;
  identifier = self->_identifier;
  if (identifier)
    objc_msgSend(v3, "setObject:forKey:", identifier, CFSTR("identifier"));
  changeTag = self->_changeTag;
  if (changeTag)
    objc_msgSend(v4, "setObject:forKey:", changeTag, CFSTR("change_tag"));
  modificationDate = self->_modificationDate;
  if (modificationDate)
    objc_msgSend(v4, "setObject:forKey:", -[NTPBDate dictionaryRepresentation](modificationDate, "dictionaryRepresentation"), CFSTR("modification_date"));
  fetchDate = self->_fetchDate;
  if (fetchDate)
    objc_msgSend(v4, "setObject:forKey:", -[NTPBDate dictionaryRepresentation](fetchDate, "dictionaryRepresentation"), CFSTR("fetch_date"));
  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    objc_msgSend(v4, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_deletedFromCloud), CFSTR("deleted_from_cloud"));
    has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_11:
      if ((has & 2) == 0)
        goto LABEL_13;
      goto LABEL_12;
    }
  }
  else if ((*(_BYTE *)&self->_has & 1) == 0)
  {
    goto LABEL_11;
  }
  objc_msgSend(v4, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_cacheLifetimeHint), CFSTR("cache_lifetime_hint"));
  if ((*(_BYTE *)&self->_has & 2) != 0)
LABEL_12:
    objc_msgSend(v4, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_recordType), CFSTR("record_type"));
LABEL_13:
  assetURLsDate = self->_assetURLsDate;
  if (assetURLsDate)
    objc_msgSend(v4, "setObject:forKey:", -[NTPBDate dictionaryRepresentation](assetURLsDate, "dictionaryRepresentation"), CFSTR("asset_URLs_date"));
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return NTPBRecordBaseReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has;

  if (self->_identifier)
    PBDataWriterWriteStringField();
  if (self->_changeTag)
    PBDataWriterWriteStringField();
  if (self->_modificationDate)
    PBDataWriterWriteSubmessage();
  if (self->_fetchDate)
    PBDataWriterWriteSubmessage();
  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    PBDataWriterWriteBOOLField();
    has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_11:
      if ((has & 2) == 0)
        goto LABEL_13;
      goto LABEL_12;
    }
  }
  else if ((*(_BYTE *)&self->_has & 1) == 0)
  {
    goto LABEL_11;
  }
  PBDataWriterWriteInt32Field();
  if ((*(_BYTE *)&self->_has & 2) != 0)
LABEL_12:
    PBDataWriterWriteInt32Field();
LABEL_13:
  if (self->_assetURLsDate)
    PBDataWriterWriteSubmessage();
}

- (BOOL)isEqual:(id)a3
{
  int v5;
  NSString *identifier;
  NSString *changeTag;
  NTPBDate *modificationDate;
  NTPBDate *fetchDate;
  NTPBDate *assetURLsDate;

  v5 = objc_msgSend(a3, "isMemberOfClass:", objc_opt_class());
  if (!v5)
    return v5;
  identifier = self->_identifier;
  if ((unint64_t)identifier | *((_QWORD *)a3 + 5))
  {
    v5 = -[NSString isEqual:](identifier, "isEqual:");
    if (!v5)
      return v5;
  }
  changeTag = self->_changeTag;
  if ((unint64_t)changeTag | *((_QWORD *)a3 + 3))
  {
    v5 = -[NSString isEqual:](changeTag, "isEqual:");
    if (!v5)
      return v5;
  }
  modificationDate = self->_modificationDate;
  if ((unint64_t)modificationDate | *((_QWORD *)a3 + 6))
  {
    v5 = -[NTPBDate isEqual:](modificationDate, "isEqual:");
    if (!v5)
      return v5;
  }
  fetchDate = self->_fetchDate;
  if ((unint64_t)fetchDate | *((_QWORD *)a3 + 4))
  {
    v5 = -[NTPBDate isEqual:](fetchDate, "isEqual:");
    if (!v5)
      return v5;
  }
  if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    if ((*((_BYTE *)a3 + 64) & 4) != 0)
      goto LABEL_30;
    goto LABEL_18;
  }
  if ((*((_BYTE *)a3 + 64) & 4) == 0)
    goto LABEL_30;
  if (self->_deletedFromCloud)
  {
    if (!*((_BYTE *)a3 + 60))
      goto LABEL_30;
    goto LABEL_18;
  }
  if (*((_BYTE *)a3 + 60))
  {
LABEL_30:
    LOBYTE(v5) = 0;
    return v5;
  }
LABEL_18:
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)a3 + 64) & 1) == 0 || self->_cacheLifetimeHint != *((_DWORD *)a3 + 4))
      goto LABEL_30;
  }
  else if ((*((_BYTE *)a3 + 64) & 1) != 0)
  {
    goto LABEL_30;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)a3 + 64) & 2) == 0 || self->_recordType != *((_DWORD *)a3 + 14))
      goto LABEL_30;
  }
  else if ((*((_BYTE *)a3 + 64) & 2) != 0)
  {
    goto LABEL_30;
  }
  assetURLsDate = self->_assetURLsDate;
  if ((unint64_t)assetURLsDate | *((_QWORD *)a3 + 1))
    LOBYTE(v5) = -[NTPBDate isEqual:](assetURLsDate, "isEqual:");
  else
    LOBYTE(v5) = 1;
  return v5;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v3 = -[NSString hash](self->_identifier, "hash");
  v4 = -[NSString hash](self->_changeTag, "hash");
  v5 = -[NTPBDate hash](self->_modificationDate, "hash");
  v6 = -[NTPBDate hash](self->_fetchDate, "hash");
  if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    v7 = 0;
    if ((*(_BYTE *)&self->_has & 1) != 0)
      goto LABEL_3;
LABEL_6:
    v8 = 0;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_4;
LABEL_7:
    v9 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ -[NTPBDate hash](self->_assetURLsDate, "hash");
  }
  v7 = 2654435761 * self->_deletedFromCloud;
  if ((*(_BYTE *)&self->_has & 1) == 0)
    goto LABEL_6;
LABEL_3:
  v8 = 2654435761 * self->_cacheLifetimeHint;
  if ((*(_BYTE *)&self->_has & 2) == 0)
    goto LABEL_7;
LABEL_4:
  v9 = 2654435761 * self->_recordType;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ -[NTPBDate hash](self->_assetURLsDate, "hash");
}

- (void)mergeFrom:(id)a3
{
  NTPBDate *modificationDate;
  uint64_t v6;
  NTPBDate *fetchDate;
  uint64_t v8;
  char v9;
  NTPBDate *assetURLsDate;
  uint64_t v11;

  if (*((_QWORD *)a3 + 5))
    -[NTPBRecordBase setIdentifier:](self, "setIdentifier:");
  if (*((_QWORD *)a3 + 3))
    -[NTPBRecordBase setChangeTag:](self, "setChangeTag:");
  modificationDate = self->_modificationDate;
  v6 = *((_QWORD *)a3 + 6);
  if (modificationDate)
  {
    if (v6)
      -[NTPBDate mergeFrom:](modificationDate, "mergeFrom:");
  }
  else if (v6)
  {
    -[NTPBRecordBase setModificationDate:](self, "setModificationDate:");
  }
  fetchDate = self->_fetchDate;
  v8 = *((_QWORD *)a3 + 4);
  if (fetchDate)
  {
    if (v8)
      -[NTPBDate mergeFrom:](fetchDate, "mergeFrom:");
  }
  else if (v8)
  {
    -[NTPBRecordBase setFetchDate:](self, "setFetchDate:");
  }
  v9 = *((_BYTE *)a3 + 64);
  if ((v9 & 4) != 0)
  {
    self->_deletedFromCloud = *((_BYTE *)a3 + 60);
    *(_BYTE *)&self->_has |= 4u;
    v9 = *((_BYTE *)a3 + 64);
    if ((v9 & 1) == 0)
    {
LABEL_17:
      if ((v9 & 2) == 0)
        goto LABEL_19;
      goto LABEL_18;
    }
  }
  else if ((*((_BYTE *)a3 + 64) & 1) == 0)
  {
    goto LABEL_17;
  }
  self->_cacheLifetimeHint = *((_DWORD *)a3 + 4);
  *(_BYTE *)&self->_has |= 1u;
  if ((*((_BYTE *)a3 + 64) & 2) != 0)
  {
LABEL_18:
    self->_recordType = *((_DWORD *)a3 + 14);
    *(_BYTE *)&self->_has |= 2u;
  }
LABEL_19:
  assetURLsDate = self->_assetURLsDate;
  v11 = *((_QWORD *)a3 + 1);
  if (assetURLsDate)
  {
    if (v11)
      -[NTPBDate mergeFrom:](assetURLsDate, "mergeFrom:");
  }
  else if (v11)
  {
    -[NTPBRecordBase setAssetURLsDate:](self, "setAssetURLsDate:");
  }
}

@end
