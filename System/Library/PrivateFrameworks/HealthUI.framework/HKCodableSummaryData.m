@implementation HKCodableSummaryData

- (BOOL)readFrom:(id)a3
{
  return HKCodableSummaryDataReadFrom((uint64_t)self, (uint64_t)a3);
}

- (HKCodableQueryAnchor)databaseChangesQueryAnchor
{
  return self->_databaseChangesQueryAnchor;
}

- (BOOL)hasContentData
{
  return self->_contentData != 0;
}

- (BOOL)hasDatabaseChangesQueryAnchor
{
  return self->_databaseChangesQueryAnchor != 0;
}

- (NSString)kindRawValue
{
  return self->_kindRawValue;
}

- (NSData)contentData
{
  return self->_contentData;
}

- (BOOL)hasKindRawValue
{
  return self->_kindRawValue != 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_kindRawValue, 0);
  objc_storeStrong((id *)&self->_databaseChangesQueryAnchor, 0);
  objc_storeStrong((id *)&self->_contentData, 0);
  objc_storeStrong((id *)&self->_audienceRawValue, 0);
}

- (NSString)audienceRawValue
{
  return self->_audienceRawValue;
}

- (BOOL)hasAudienceRawValue
{
  return self->_audienceRawValue != 0;
}

- (int64_t)minimumSupportedVersion
{
  return self->_minimumSupportedVersion;
}

- (int64_t)latestSupportedVersion
{
  return self->_latestSupportedVersion;
}

- (void)setKindRawValue:(id)a3
{
  objc_storeStrong((id *)&self->_kindRawValue, a3);
}

- (void)setContentData:(id)a3
{
  objc_storeStrong((id *)&self->_contentData, a3);
}

- (void)setAudienceRawValue:(id)a3
{
  objc_storeStrong((id *)&self->_audienceRawValue, a3);
}

- (BOOL)hasMinimumSupportedVersion
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (BOOL)hasLatestSupportedVersion
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setMinimumSupportedVersion:(int64_t)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_minimumSupportedVersion = a3;
}

- (void)setLatestSupportedVersion:(int64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_latestSupportedVersion = a3;
}

- (void)setDatabaseChangesQueryAnchor:(id)a3
{
  objc_storeStrong((id *)&self->_databaseChangesQueryAnchor, a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  char has;
  id v6;

  v4 = a3;
  v6 = v4;
  if (self->_contentData)
  {
    PBDataWriterWriteDataField();
    v4 = v6;
  }
  if (self->_kindRawValue)
  {
    PBDataWriterWriteStringField();
    v4 = v6;
  }
  if (self->_databaseChangesQueryAnchor)
  {
    PBDataWriterWriteSubmessage();
    v4 = v6;
  }
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteInt64Field();
    v4 = v6;
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    PBDataWriterWriteInt64Field();
    v4 = v6;
  }
  if (self->_audienceRawValue)
  {
    PBDataWriterWriteStringField();
    v4 = v6;
  }

}

- (void)setHasLatestSupportedVersion:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)setHasMinimumSupportedVersion:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
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
  v8.super_class = (Class)HKCodableSummaryData;
  -[HKCodableSummaryData description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKCodableSummaryData dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSData *contentData;
  NSString *kindRawValue;
  HKCodableQueryAnchor *databaseChangesQueryAnchor;
  void *v8;
  char has;
  void *v10;
  void *v11;
  NSString *audienceRawValue;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  contentData = self->_contentData;
  if (contentData)
    objc_msgSend(v3, "setObject:forKey:", contentData, CFSTR("contentData"));
  kindRawValue = self->_kindRawValue;
  if (kindRawValue)
    objc_msgSend(v4, "setObject:forKey:", kindRawValue, CFSTR("kindRawValue"));
  databaseChangesQueryAnchor = self->_databaseChangesQueryAnchor;
  if (databaseChangesQueryAnchor)
  {
    -[HKCodableQueryAnchor dictionaryRepresentation](databaseChangesQueryAnchor, "dictionaryRepresentation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v8, CFSTR("databaseChangesQueryAnchor"));

  }
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_latestSupportedVersion);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v10, CFSTR("latestSupportedVersion"));

    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_minimumSupportedVersion);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v11, CFSTR("minimumSupportedVersion"));

  }
  audienceRawValue = self->_audienceRawValue;
  if (audienceRawValue)
    objc_msgSend(v4, "setObject:forKey:", audienceRawValue, CFSTR("audienceRawValue"));
  return v4;
}

- (void)copyTo:(id)a3
{
  id v4;
  char has;
  id v6;

  v4 = a3;
  v6 = v4;
  if (self->_contentData)
  {
    objc_msgSend(v4, "setContentData:");
    v4 = v6;
  }
  if (self->_kindRawValue)
  {
    objc_msgSend(v6, "setKindRawValue:");
    v4 = v6;
  }
  if (self->_databaseChangesQueryAnchor)
  {
    objc_msgSend(v6, "setDatabaseChangesQueryAnchor:");
    v4 = v6;
  }
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    *((_QWORD *)v4 + 1) = self->_latestSupportedVersion;
    *((_BYTE *)v4 + 56) |= 1u;
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *((_QWORD *)v4 + 2) = self->_minimumSupportedVersion;
    *((_BYTE *)v4 + 56) |= 2u;
  }
  if (self->_audienceRawValue)
  {
    objc_msgSend(v6, "setAudienceRawValue:");
    v4 = v6;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  char has;
  uint64_t v13;
  void *v14;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSData copyWithZone:](self->_contentData, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v6;

  v8 = -[NSString copyWithZone:](self->_kindRawValue, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 48);
  *(_QWORD *)(v5 + 48) = v8;

  v10 = -[HKCodableQueryAnchor copyWithZone:](self->_databaseChangesQueryAnchor, "copyWithZone:", a3);
  v11 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v10;

  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    *(_QWORD *)(v5 + 8) = self->_latestSupportedVersion;
    *(_BYTE *)(v5 + 56) |= 1u;
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *(_QWORD *)(v5 + 16) = self->_minimumSupportedVersion;
    *(_BYTE *)(v5 + 56) |= 2u;
  }
  v13 = -[NSString copyWithZone:](self->_audienceRawValue, "copyWithZone:", a3);
  v14 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v13;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSData *contentData;
  NSString *kindRawValue;
  HKCodableQueryAnchor *databaseChangesQueryAnchor;
  NSString *audienceRawValue;
  char v9;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_20;
  contentData = self->_contentData;
  if ((unint64_t)contentData | *((_QWORD *)v4 + 4))
  {
    if (!-[NSData isEqual:](contentData, "isEqual:"))
      goto LABEL_20;
  }
  kindRawValue = self->_kindRawValue;
  if ((unint64_t)kindRawValue | *((_QWORD *)v4 + 6))
  {
    if (!-[NSString isEqual:](kindRawValue, "isEqual:"))
      goto LABEL_20;
  }
  databaseChangesQueryAnchor = self->_databaseChangesQueryAnchor;
  if ((unint64_t)databaseChangesQueryAnchor | *((_QWORD *)v4 + 5))
  {
    if (!-[HKCodableQueryAnchor isEqual:](databaseChangesQueryAnchor, "isEqual:"))
      goto LABEL_20;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 56) & 1) == 0 || self->_latestSupportedVersion != *((_QWORD *)v4 + 1))
      goto LABEL_20;
  }
  else if ((*((_BYTE *)v4 + 56) & 1) != 0)
  {
LABEL_20:
    v9 = 0;
    goto LABEL_21;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 56) & 2) == 0 || self->_minimumSupportedVersion != *((_QWORD *)v4 + 2))
      goto LABEL_20;
  }
  else if ((*((_BYTE *)v4 + 56) & 2) != 0)
  {
    goto LABEL_20;
  }
  audienceRawValue = self->_audienceRawValue;
  if ((unint64_t)audienceRawValue | *((_QWORD *)v4 + 3))
    v9 = -[NSString isEqual:](audienceRawValue, "isEqual:");
  else
    v9 = 1;
LABEL_21:

  return v9;
}

- (unint64_t)hash
{
  uint64_t v3;
  NSUInteger v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v3 = -[NSData hash](self->_contentData, "hash");
  v4 = -[NSString hash](self->_kindRawValue, "hash");
  v5 = -[HKCodableQueryAnchor hash](self->_databaseChangesQueryAnchor, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v6 = 2654435761 * self->_latestSupportedVersion;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_3;
LABEL_5:
    v7 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ -[NSString hash](self->_audienceRawValue, "hash");
  }
  v6 = 0;
  if ((*(_BYTE *)&self->_has & 2) == 0)
    goto LABEL_5;
LABEL_3:
  v7 = 2654435761 * self->_minimumSupportedVersion;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ -[NSString hash](self->_audienceRawValue, "hash");
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;
  HKCodableQueryAnchor *databaseChangesQueryAnchor;
  uint64_t v6;
  char v7;
  _QWORD *v8;

  v4 = a3;
  v8 = v4;
  if (v4[4])
  {
    -[HKCodableSummaryData setContentData:](self, "setContentData:");
    v4 = v8;
  }
  if (v4[6])
  {
    -[HKCodableSummaryData setKindRawValue:](self, "setKindRawValue:");
    v4 = v8;
  }
  databaseChangesQueryAnchor = self->_databaseChangesQueryAnchor;
  v6 = v4[5];
  if (databaseChangesQueryAnchor)
  {
    if (!v6)
      goto LABEL_11;
    -[HKCodableQueryAnchor mergeFrom:](databaseChangesQueryAnchor, "mergeFrom:");
  }
  else
  {
    if (!v6)
      goto LABEL_11;
    -[HKCodableSummaryData setDatabaseChangesQueryAnchor:](self, "setDatabaseChangesQueryAnchor:");
  }
  v4 = v8;
LABEL_11:
  v7 = *((_BYTE *)v4 + 56);
  if ((v7 & 1) != 0)
  {
    self->_latestSupportedVersion = v4[1];
    *(_BYTE *)&self->_has |= 1u;
    v7 = *((_BYTE *)v4 + 56);
  }
  if ((v7 & 2) != 0)
  {
    self->_minimumSupportedVersion = v4[2];
    *(_BYTE *)&self->_has |= 2u;
  }
  if (v4[3])
  {
    -[HKCodableSummaryData setAudienceRawValue:](self, "setAudienceRawValue:");
    v4 = v8;
  }

}

@end
