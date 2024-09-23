@implementation HKCodableSummaryCurrentValue

- (BOOL)readFrom:(id)a3
{
  return HKCodableSummaryCurrentValueReadFrom((uint64_t)self, (uint64_t)a3);
}

- (NSString)kindRawValue
{
  return self->_kindRawValue;
}

- (int64_t)minimumSupportedVersion
{
  return self->_minimumSupportedVersion;
}

- (int64_t)latestSupportedVersion
{
  return self->_latestSupportedVersion;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_valueData, 0);
  objc_storeStrong((id *)&self->_supplementaryValue, 0);
  objc_storeStrong((id *)&self->_queryConfigurationData, 0);
  objc_storeStrong((id *)&self->_metadataDictionary, 0);
  objc_storeStrong((id *)&self->_kindRawValue, 0);
}

- (BOOL)hasMinimumSupportedVersion
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (BOOL)hasLatestSupportedVersion
{
  return *(_BYTE *)&self->_has & 1;
}

- (HKCodableSummarySupplementaryValue)supplementaryValue
{
  return self->_supplementaryValue;
}

- (BOOL)hasValueData
{
  return self->_valueData != 0;
}

- (NSData)valueData
{
  return self->_valueData;
}

- (void)setValueData:(id)a3
{
  objc_storeStrong((id *)&self->_valueData, a3);
}

- (void)setSupplementaryValue:(id)a3
{
  objc_storeStrong((id *)&self->_supplementaryValue, a3);
}

- (void)setKindRawValue:(id)a3
{
  objc_storeStrong((id *)&self->_kindRawValue, a3);
}

- (NSData)queryConfigurationData
{
  return self->_queryConfigurationData;
}

- (BOOL)hasSupplementaryValue
{
  return self->_supplementaryValue != 0;
}

- (BOOL)hasQueryConfigurationData
{
  return self->_queryConfigurationData != 0;
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

- (void)writeTo:(id)a3
{
  id v4;
  char has;
  id v6;

  v4 = a3;
  v6 = v4;
  if (self->_valueData)
  {
    PBDataWriterWriteDataField();
    v4 = v6;
  }
  if (self->_kindRawValue)
  {
    PBDataWriterWriteStringField();
    v4 = v6;
  }
  if (self->_supplementaryValue)
  {
    PBDataWriterWriteSubmessage();
    v4 = v6;
  }
  if (self->_queryConfigurationData)
  {
    PBDataWriterWriteDataField();
    v4 = v6;
  }
  if (self->_metadataDictionary)
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

}

- (BOOL)hasKindRawValue
{
  return self->_kindRawValue != 0;
}

- (BOOL)hasMetadataDictionary
{
  return self->_metadataDictionary != 0;
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
  v8.super_class = (Class)HKCodableSummaryCurrentValue;
  -[HKCodableSummaryCurrentValue description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKCodableSummaryCurrentValue dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSData *valueData;
  NSString *kindRawValue;
  HKCodableSummarySupplementaryValue *supplementaryValue;
  void *v8;
  NSData *queryConfigurationData;
  HKCodableMetadataDictionary *metadataDictionary;
  void *v11;
  char has;
  void *v13;
  void *v14;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  valueData = self->_valueData;
  if (valueData)
    objc_msgSend(v3, "setObject:forKey:", valueData, CFSTR("valueData"));
  kindRawValue = self->_kindRawValue;
  if (kindRawValue)
    objc_msgSend(v4, "setObject:forKey:", kindRawValue, CFSTR("kindRawValue"));
  supplementaryValue = self->_supplementaryValue;
  if (supplementaryValue)
  {
    -[HKCodableSummarySupplementaryValue dictionaryRepresentation](supplementaryValue, "dictionaryRepresentation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v8, CFSTR("supplementaryValue"));

  }
  queryConfigurationData = self->_queryConfigurationData;
  if (queryConfigurationData)
    objc_msgSend(v4, "setObject:forKey:", queryConfigurationData, CFSTR("queryConfigurationData"));
  metadataDictionary = self->_metadataDictionary;
  if (metadataDictionary)
  {
    -[HKCodableMetadataDictionary dictionaryRepresentation](metadataDictionary, "dictionaryRepresentation");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v11, CFSTR("metadataDictionary"));

  }
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_latestSupportedVersion);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v13, CFSTR("latestSupportedVersion"));

    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_minimumSupportedVersion);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v14, CFSTR("minimumSupportedVersion"));

  }
  return v4;
}

- (void)copyTo:(id)a3
{
  id v4;
  char has;
  id v6;

  v4 = a3;
  v6 = v4;
  if (self->_valueData)
  {
    objc_msgSend(v4, "setValueData:");
    v4 = v6;
  }
  if (self->_kindRawValue)
  {
    objc_msgSend(v6, "setKindRawValue:");
    v4 = v6;
  }
  if (self->_supplementaryValue)
  {
    objc_msgSend(v6, "setSupplementaryValue:");
    v4 = v6;
  }
  if (self->_queryConfigurationData)
  {
    objc_msgSend(v6, "setQueryConfigurationData:");
    v4 = v6;
  }
  if (self->_metadataDictionary)
  {
    objc_msgSend(v6, "setMetadataDictionary:");
    v4 = v6;
  }
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    *((_QWORD *)v4 + 1) = self->_latestSupportedVersion;
    *((_BYTE *)v4 + 64) |= 1u;
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *((_QWORD *)v4 + 2) = self->_minimumSupportedVersion;
    *((_BYTE *)v4 + 64) |= 2u;
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
  uint64_t v12;
  void *v13;
  id v14;
  void *v15;
  char has;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSData copyWithZone:](self->_valueData, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 56);
  *(_QWORD *)(v5 + 56) = v6;

  v8 = -[NSString copyWithZone:](self->_kindRawValue, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v8;

  v10 = -[HKCodableSummarySupplementaryValue copyWithZone:](self->_supplementaryValue, "copyWithZone:", a3);
  v11 = *(void **)(v5 + 48);
  *(_QWORD *)(v5 + 48) = v10;

  v12 = -[NSData copyWithZone:](self->_queryConfigurationData, "copyWithZone:", a3);
  v13 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v12;

  v14 = -[HKCodableMetadataDictionary copyWithZone:](self->_metadataDictionary, "copyWithZone:", a3);
  v15 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v14;

  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    *(_QWORD *)(v5 + 8) = self->_latestSupportedVersion;
    *(_BYTE *)(v5 + 64) |= 1u;
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *(_QWORD *)(v5 + 16) = self->_minimumSupportedVersion;
    *(_BYTE *)(v5 + 64) |= 2u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSData *valueData;
  NSString *kindRawValue;
  HKCodableSummarySupplementaryValue *supplementaryValue;
  NSData *queryConfigurationData;
  HKCodableMetadataDictionary *metadataDictionary;
  BOOL v10;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_21;
  valueData = self->_valueData;
  if ((unint64_t)valueData | *((_QWORD *)v4 + 7))
  {
    if (!-[NSData isEqual:](valueData, "isEqual:"))
      goto LABEL_21;
  }
  kindRawValue = self->_kindRawValue;
  if ((unint64_t)kindRawValue | *((_QWORD *)v4 + 3))
  {
    if (!-[NSString isEqual:](kindRawValue, "isEqual:"))
      goto LABEL_21;
  }
  supplementaryValue = self->_supplementaryValue;
  if ((unint64_t)supplementaryValue | *((_QWORD *)v4 + 6))
  {
    if (!-[HKCodableSummarySupplementaryValue isEqual:](supplementaryValue, "isEqual:"))
      goto LABEL_21;
  }
  queryConfigurationData = self->_queryConfigurationData;
  if ((unint64_t)queryConfigurationData | *((_QWORD *)v4 + 5))
  {
    if (!-[NSData isEqual:](queryConfigurationData, "isEqual:"))
      goto LABEL_21;
  }
  metadataDictionary = self->_metadataDictionary;
  if ((unint64_t)metadataDictionary | *((_QWORD *)v4 + 4))
  {
    if (!-[HKCodableMetadataDictionary isEqual:](metadataDictionary, "isEqual:"))
      goto LABEL_21;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 64) & 1) == 0 || self->_latestSupportedVersion != *((_QWORD *)v4 + 1))
      goto LABEL_21;
  }
  else if ((*((_BYTE *)v4 + 64) & 1) != 0)
  {
LABEL_21:
    v10 = 0;
    goto LABEL_22;
  }
  v10 = (*((_BYTE *)v4 + 64) & 2) == 0;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 64) & 2) == 0 || self->_minimumSupportedVersion != *((_QWORD *)v4 + 2))
      goto LABEL_21;
    v10 = 1;
  }
LABEL_22:

  return v10;
}

- (unint64_t)hash
{
  uint64_t v3;
  NSUInteger v4;
  unint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v3 = -[NSData hash](self->_valueData, "hash");
  v4 = -[NSString hash](self->_kindRawValue, "hash");
  v5 = -[HKCodableSummarySupplementaryValue hash](self->_supplementaryValue, "hash");
  v6 = -[NSData hash](self->_queryConfigurationData, "hash");
  v7 = -[HKCodableMetadataDictionary hash](self->_metadataDictionary, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v8 = 2654435761 * self->_latestSupportedVersion;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_3;
LABEL_5:
    v9 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9;
  }
  v8 = 0;
  if ((*(_BYTE *)&self->_has & 2) == 0)
    goto LABEL_5;
LABEL_3:
  v9 = 2654435761 * self->_minimumSupportedVersion;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9;
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;
  HKCodableSummarySupplementaryValue *supplementaryValue;
  uint64_t v6;
  HKCodableMetadataDictionary *metadataDictionary;
  uint64_t v8;
  char v9;
  _QWORD *v10;

  v4 = a3;
  v10 = v4;
  if (v4[7])
  {
    -[HKCodableSummaryCurrentValue setValueData:](self, "setValueData:");
    v4 = v10;
  }
  if (v4[3])
  {
    -[HKCodableSummaryCurrentValue setKindRawValue:](self, "setKindRawValue:");
    v4 = v10;
  }
  supplementaryValue = self->_supplementaryValue;
  v6 = v4[6];
  if (supplementaryValue)
  {
    if (!v6)
      goto LABEL_11;
    -[HKCodableSummarySupplementaryValue mergeFrom:](supplementaryValue, "mergeFrom:");
  }
  else
  {
    if (!v6)
      goto LABEL_11;
    -[HKCodableSummaryCurrentValue setSupplementaryValue:](self, "setSupplementaryValue:");
  }
  v4 = v10;
LABEL_11:
  if (v4[5])
  {
    -[HKCodableSummaryCurrentValue setQueryConfigurationData:](self, "setQueryConfigurationData:");
    v4 = v10;
  }
  metadataDictionary = self->_metadataDictionary;
  v8 = v4[4];
  if (metadataDictionary)
  {
    if (!v8)
      goto LABEL_19;
    -[HKCodableMetadataDictionary mergeFrom:](metadataDictionary, "mergeFrom:");
  }
  else
  {
    if (!v8)
      goto LABEL_19;
    -[HKCodableSummaryCurrentValue setMetadataDictionary:](self, "setMetadataDictionary:");
  }
  v4 = v10;
LABEL_19:
  v9 = *((_BYTE *)v4 + 64);
  if ((v9 & 1) != 0)
  {
    self->_latestSupportedVersion = v4[1];
    *(_BYTE *)&self->_has |= 1u;
    v9 = *((_BYTE *)v4 + 64);
  }
  if ((v9 & 2) != 0)
  {
    self->_minimumSupportedVersion = v4[2];
    *(_BYTE *)&self->_has |= 2u;
  }

}

- (void)setQueryConfigurationData:(id)a3
{
  objc_storeStrong((id *)&self->_queryConfigurationData, a3);
}

- (HKCodableMetadataDictionary)metadataDictionary
{
  return self->_metadataDictionary;
}

- (void)setMetadataDictionary:(id)a3
{
  objc_storeStrong((id *)&self->_metadataDictionary, a3);
}

@end
