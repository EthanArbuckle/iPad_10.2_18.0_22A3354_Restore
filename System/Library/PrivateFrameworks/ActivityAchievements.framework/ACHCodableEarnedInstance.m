@implementation ACHCodableEarnedInstance

- (BOOL)hasTemplateUniqueName
{
  return self->_templateUniqueName != 0;
}

- (BOOL)hasEarnedDateComponents
{
  return self->_earnedDateComponents != 0;
}

- (void)setCreatedDate:(double)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_createdDate = a3;
}

- (void)setHasCreatedDate:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasCreatedDate
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setCreatorDevice:(int64_t)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_creatorDevice = a3;
}

- (void)setHasCreatorDevice:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasCreatorDevice
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setValue:(double)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_value = a3;
}

- (void)setHasValue:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasValue
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (BOOL)hasValueUnitString
{
  return self->_valueUnitString != 0;
}

- (void)setKey:(int64_t)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_key = a3;
}

- (void)setHasKey:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasKey
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (BOOL)hasExternalIdentifier
{
  return self->_externalIdentifier != 0;
}

- (BOOL)hasSyncIdentity
{
  return self->_syncIdentity != 0;
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
  v8.super_class = (Class)ACHCodableEarnedInstance;
  -[ACHCodableEarnedInstance description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACHCodableEarnedInstance dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *templateUniqueName;
  NSString *earnedDateComponents;
  char has;
  void *v8;
  NSString *valueUnitString;
  void *v10;
  NSString *externalIdentifier;
  ACHCodableSyncIdentity *syncIdentity;
  void *v13;
  void *v15;
  void *v16;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  templateUniqueName = self->_templateUniqueName;
  if (templateUniqueName)
    objc_msgSend(v3, "setObject:forKey:", templateUniqueName, CFSTR("templateUniqueName"));
  earnedDateComponents = self->_earnedDateComponents;
  if (earnedDateComponents)
    objc_msgSend(v4, "setObject:forKey:", earnedDateComponents, CFSTR("earnedDateComponents"));
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_createdDate);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v15, CFSTR("createdDate"));

    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_7:
      if ((has & 8) == 0)
        goto LABEL_9;
      goto LABEL_8;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_7;
  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_creatorDevice);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v16, CFSTR("creatorDevice"));

  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
LABEL_8:
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_value);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v8, CFSTR("value"));

  }
LABEL_9:
  valueUnitString = self->_valueUnitString;
  if (valueUnitString)
    objc_msgSend(v4, "setObject:forKey:", valueUnitString, CFSTR("valueUnitString"));
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_key);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v10, CFSTR("key"));

  }
  externalIdentifier = self->_externalIdentifier;
  if (externalIdentifier)
    objc_msgSend(v4, "setObject:forKey:", externalIdentifier, CFSTR("externalIdentifier"));
  syncIdentity = self->_syncIdentity;
  if (syncIdentity)
  {
    -[ACHCodableSyncIdentity dictionaryRepresentation](syncIdentity, "dictionaryRepresentation");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v13, CFSTR("syncIdentity"));

  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return ACHCodableEarnedInstanceReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  char has;
  id v6;

  v4 = a3;
  v6 = v4;
  if (self->_templateUniqueName)
  {
    PBDataWriterWriteStringField();
    v4 = v6;
  }
  if (self->_earnedDateComponents)
  {
    PBDataWriterWriteStringField();
    v4 = v6;
  }
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteDoubleField();
    v4 = v6;
    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_7:
      if ((has & 8) == 0)
        goto LABEL_9;
      goto LABEL_8;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_7;
  }
  PBDataWriterWriteInt64Field();
  v4 = v6;
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
LABEL_8:
    PBDataWriterWriteDoubleField();
    v4 = v6;
  }
LABEL_9:
  if (self->_valueUnitString)
  {
    PBDataWriterWriteStringField();
    v4 = v6;
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    PBDataWriterWriteInt64Field();
    v4 = v6;
  }
  if (self->_externalIdentifier)
  {
    PBDataWriterWriteStringField();
    v4 = v6;
  }
  if (self->_syncIdentity)
  {
    PBDataWriterWriteSubmessage();
    v4 = v6;
  }

}

- (void)copyTo:(id)a3
{
  id v4;
  char has;
  id v6;

  v4 = a3;
  v6 = v4;
  if (self->_templateUniqueName)
  {
    objc_msgSend(v4, "setTemplateUniqueName:");
    v4 = v6;
  }
  if (self->_earnedDateComponents)
  {
    objc_msgSend(v6, "setEarnedDateComponents:");
    v4 = v6;
  }
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    *((_QWORD *)v4 + 1) = *(_QWORD *)&self->_createdDate;
    *((_BYTE *)v4 + 80) |= 1u;
    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_7:
      if ((has & 8) == 0)
        goto LABEL_9;
      goto LABEL_8;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_7;
  }
  *((_QWORD *)v4 + 2) = self->_creatorDevice;
  *((_BYTE *)v4 + 80) |= 2u;
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
LABEL_8:
    *((_QWORD *)v4 + 4) = *(_QWORD *)&self->_value;
    *((_BYTE *)v4 + 80) |= 8u;
  }
LABEL_9:
  if (self->_valueUnitString)
  {
    objc_msgSend(v6, "setValueUnitString:");
    v4 = v6;
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    *((_QWORD *)v4 + 3) = self->_key;
    *((_BYTE *)v4 + 80) |= 4u;
  }
  if (self->_externalIdentifier)
  {
    objc_msgSend(v6, "setExternalIdentifier:");
    v4 = v6;
  }
  if (self->_syncIdentity)
  {
    objc_msgSend(v6, "setSyncIdentity:");
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
  char has;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id v15;
  void *v16;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_templateUniqueName, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 64);
  *(_QWORD *)(v5 + 64) = v6;

  v8 = -[NSString copyWithZone:](self->_earnedDateComponents, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v8;

  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    *(double *)(v5 + 8) = self->_createdDate;
    *(_BYTE *)(v5 + 80) |= 1u;
    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 8) == 0)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  *(_QWORD *)(v5 + 16) = self->_creatorDevice;
  *(_BYTE *)(v5 + 80) |= 2u;
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
LABEL_4:
    *(double *)(v5 + 32) = self->_value;
    *(_BYTE *)(v5 + 80) |= 8u;
  }
LABEL_5:
  v11 = -[NSString copyWithZone:](self->_valueUnitString, "copyWithZone:", a3);
  v12 = *(void **)(v5 + 72);
  *(_QWORD *)(v5 + 72) = v11;

  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    *(_QWORD *)(v5 + 24) = self->_key;
    *(_BYTE *)(v5 + 80) |= 4u;
  }
  v13 = -[NSString copyWithZone:](self->_externalIdentifier, "copyWithZone:", a3);
  v14 = *(void **)(v5 + 48);
  *(_QWORD *)(v5 + 48) = v13;

  v15 = -[ACHCodableSyncIdentity copyWithZone:](self->_syncIdentity, "copyWithZone:", a3);
  v16 = *(void **)(v5 + 56);
  *(_QWORD *)(v5 + 56) = v15;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *templateUniqueName;
  NSString *earnedDateComponents;
  char has;
  NSString *valueUnitString;
  NSString *externalIdentifier;
  ACHCodableSyncIdentity *syncIdentity;
  char v11;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_33;
  templateUniqueName = self->_templateUniqueName;
  if ((unint64_t)templateUniqueName | *((_QWORD *)v4 + 8))
  {
    if (!-[NSString isEqual:](templateUniqueName, "isEqual:"))
      goto LABEL_33;
  }
  earnedDateComponents = self->_earnedDateComponents;
  if ((unint64_t)earnedDateComponents | *((_QWORD *)v4 + 5))
  {
    if (!-[NSString isEqual:](earnedDateComponents, "isEqual:"))
      goto LABEL_33;
  }
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 80) & 1) == 0 || self->_createdDate != *((double *)v4 + 1))
      goto LABEL_33;
  }
  else if ((*((_BYTE *)v4 + 80) & 1) != 0)
  {
    goto LABEL_33;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 80) & 2) == 0 || self->_creatorDevice != *((_QWORD *)v4 + 2))
      goto LABEL_33;
  }
  else if ((*((_BYTE *)v4 + 80) & 2) != 0)
  {
    goto LABEL_33;
  }
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    if ((*((_BYTE *)v4 + 80) & 8) == 0 || self->_value != *((double *)v4 + 4))
      goto LABEL_33;
  }
  else if ((*((_BYTE *)v4 + 80) & 8) != 0)
  {
    goto LABEL_33;
  }
  valueUnitString = self->_valueUnitString;
  if ((unint64_t)valueUnitString | *((_QWORD *)v4 + 9))
  {
    if (!-[NSString isEqual:](valueUnitString, "isEqual:"))
    {
LABEL_33:
      v11 = 0;
      goto LABEL_34;
    }
    has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 80) & 4) == 0 || self->_key != *((_QWORD *)v4 + 3))
      goto LABEL_33;
  }
  else if ((*((_BYTE *)v4 + 80) & 4) != 0)
  {
    goto LABEL_33;
  }
  externalIdentifier = self->_externalIdentifier;
  if ((unint64_t)externalIdentifier | *((_QWORD *)v4 + 6)
    && !-[NSString isEqual:](externalIdentifier, "isEqual:"))
  {
    goto LABEL_33;
  }
  syncIdentity = self->_syncIdentity;
  if ((unint64_t)syncIdentity | *((_QWORD *)v4 + 7))
    v11 = -[ACHCodableSyncIdentity isEqual:](syncIdentity, "isEqual:");
  else
    v11 = 1;
LABEL_34:

  return v11;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;
  char has;
  unint64_t v6;
  double createdDate;
  double v8;
  long double v9;
  double v10;
  uint64_t v11;
  double value;
  double v13;
  long double v14;
  double v15;
  unint64_t v16;
  NSUInteger v17;
  uint64_t v18;
  NSUInteger v19;
  NSUInteger v20;

  v3 = -[NSString hash](self->_templateUniqueName, "hash");
  v4 = -[NSString hash](self->_earnedDateComponents, "hash");
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    createdDate = self->_createdDate;
    v8 = -createdDate;
    if (createdDate >= 0.0)
      v8 = self->_createdDate;
    v9 = floor(v8 + 0.5);
    v10 = (v8 - v9) * 1.84467441e19;
    v6 = 2654435761u * (unint64_t)fmod(v9, 1.84467441e19);
    if (v10 >= 0.0)
    {
      if (v10 > 0.0)
        v6 += (unint64_t)v10;
    }
    else
    {
      v6 -= (unint64_t)fabs(v10);
    }
  }
  else
  {
    v6 = 0;
  }
  if ((has & 2) != 0)
  {
    v11 = 2654435761 * self->_creatorDevice;
    if ((has & 8) != 0)
      goto LABEL_11;
LABEL_16:
    v16 = 0;
    goto LABEL_19;
  }
  v11 = 0;
  if ((has & 8) == 0)
    goto LABEL_16;
LABEL_11:
  value = self->_value;
  v13 = -value;
  if (value >= 0.0)
    v13 = self->_value;
  v14 = floor(v13 + 0.5);
  v15 = (v13 - v14) * 1.84467441e19;
  v16 = 2654435761u * (unint64_t)fmod(v14, 1.84467441e19);
  if (v15 >= 0.0)
  {
    if (v15 > 0.0)
      v16 += (unint64_t)v15;
  }
  else
  {
    v16 -= (unint64_t)fabs(v15);
  }
LABEL_19:
  v17 = -[NSString hash](self->_valueUnitString, "hash");
  if ((*(_BYTE *)&self->_has & 4) != 0)
    v18 = 2654435761 * self->_key;
  else
    v18 = 0;
  v19 = v4 ^ v3 ^ v6 ^ v11 ^ v16 ^ v17;
  v20 = v18 ^ -[NSString hash](self->_externalIdentifier, "hash");
  return v19 ^ v20 ^ -[ACHCodableSyncIdentity hash](self->_syncIdentity, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  char v5;
  ACHCodableSyncIdentity *syncIdentity;
  uint64_t v7;
  id v8;

  v4 = a3;
  v8 = v4;
  if (*((_QWORD *)v4 + 8))
  {
    -[ACHCodableEarnedInstance setTemplateUniqueName:](self, "setTemplateUniqueName:");
    v4 = v8;
  }
  if (*((_QWORD *)v4 + 5))
  {
    -[ACHCodableEarnedInstance setEarnedDateComponents:](self, "setEarnedDateComponents:");
    v4 = v8;
  }
  v5 = *((_BYTE *)v4 + 80);
  if ((v5 & 1) != 0)
  {
    self->_createdDate = *((double *)v4 + 1);
    *(_BYTE *)&self->_has |= 1u;
    v5 = *((_BYTE *)v4 + 80);
    if ((v5 & 2) == 0)
    {
LABEL_7:
      if ((v5 & 8) == 0)
        goto LABEL_9;
      goto LABEL_8;
    }
  }
  else if ((*((_BYTE *)v4 + 80) & 2) == 0)
  {
    goto LABEL_7;
  }
  self->_creatorDevice = *((_QWORD *)v4 + 2);
  *(_BYTE *)&self->_has |= 2u;
  if ((*((_BYTE *)v4 + 80) & 8) != 0)
  {
LABEL_8:
    self->_value = *((double *)v4 + 4);
    *(_BYTE *)&self->_has |= 8u;
  }
LABEL_9:
  if (*((_QWORD *)v4 + 9))
  {
    -[ACHCodableEarnedInstance setValueUnitString:](self, "setValueUnitString:");
    v4 = v8;
  }
  if ((*((_BYTE *)v4 + 80) & 4) != 0)
  {
    self->_key = *((_QWORD *)v4 + 3);
    *(_BYTE *)&self->_has |= 4u;
  }
  if (*((_QWORD *)v4 + 6))
  {
    -[ACHCodableEarnedInstance setExternalIdentifier:](self, "setExternalIdentifier:");
    v4 = v8;
  }
  syncIdentity = self->_syncIdentity;
  v7 = *((_QWORD *)v4 + 7);
  if (syncIdentity)
  {
    if (v7)
    {
      -[ACHCodableSyncIdentity mergeFrom:](syncIdentity, "mergeFrom:");
LABEL_23:
      v4 = v8;
    }
  }
  else if (v7)
  {
    -[ACHCodableEarnedInstance setSyncIdentity:](self, "setSyncIdentity:");
    goto LABEL_23;
  }

}

- (NSString)templateUniqueName
{
  return self->_templateUniqueName;
}

- (void)setTemplateUniqueName:(id)a3
{
  objc_storeStrong((id *)&self->_templateUniqueName, a3);
}

- (NSString)earnedDateComponents
{
  return self->_earnedDateComponents;
}

- (void)setEarnedDateComponents:(id)a3
{
  objc_storeStrong((id *)&self->_earnedDateComponents, a3);
}

- (double)createdDate
{
  return self->_createdDate;
}

- (int64_t)creatorDevice
{
  return self->_creatorDevice;
}

- (double)value
{
  return self->_value;
}

- (NSString)valueUnitString
{
  return self->_valueUnitString;
}

- (void)setValueUnitString:(id)a3
{
  objc_storeStrong((id *)&self->_valueUnitString, a3);
}

- (int64_t)key
{
  return self->_key;
}

- (NSString)externalIdentifier
{
  return self->_externalIdentifier;
}

- (void)setExternalIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_externalIdentifier, a3);
}

- (ACHCodableSyncIdentity)syncIdentity
{
  return self->_syncIdentity;
}

- (void)setSyncIdentity:(id)a3
{
  objc_storeStrong((id *)&self->_syncIdentity, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_valueUnitString, 0);
  objc_storeStrong((id *)&self->_templateUniqueName, 0);
  objc_storeStrong((id *)&self->_syncIdentity, 0);
  objc_storeStrong((id *)&self->_externalIdentifier, 0);
  objc_storeStrong((id *)&self->_earnedDateComponents, 0);
}

@end
