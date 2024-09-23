@implementation HKCodableSampleChartData

- (void)setDataType:(int64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_dataType = a3;
}

- (void)setHasDataType:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasDataType
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setInt64Value:(int64_t)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_int64Value = a3;
}

- (void)setHasInt64Value:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasInt64Value
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setStartDate:(double)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_startDate = a3;
}

- (void)setHasStartDate:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasStartDate
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setEndDate:(double)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_endDate = a3;
}

- (void)setHasEndDate:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasEndDate
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (BOOL)hasMetadataDictionary
{
  return self->_metadataDictionary != 0;
}

- (BOOL)hasQuantity
{
  return self->_quantity != 0;
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
  v8.super_class = (Class)HKCodableSampleChartData;
  -[HKCodableSampleChartData description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKCodableSampleChartData dictionaryRepresentation](self, "dictionaryRepresentation");
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
  HKCodableMetadataDictionary *metadataDictionary;
  void *v7;
  HKCodableQuantity *quantity;
  void *v9;
  void *v11;
  void *v12;
  void *v13;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_dataType);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v11, CFSTR("dataType"));

    has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 8) == 0)
        goto LABEL_4;
      goto LABEL_13;
    }
  }
  else if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_int64Value);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v12, CFSTR("int64Value"));

  has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_4:
    if ((has & 2) == 0)
      goto LABEL_6;
    goto LABEL_5;
  }
LABEL_13:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_startDate);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v13, CFSTR("startDate"));

  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
LABEL_5:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_endDate);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("endDate"));

  }
LABEL_6:
  metadataDictionary = self->_metadataDictionary;
  if (metadataDictionary)
  {
    -[HKCodableMetadataDictionary dictionaryRepresentation](metadataDictionary, "dictionaryRepresentation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("metadataDictionary"));

  }
  quantity = self->_quantity;
  if (quantity)
  {
    -[HKCodableQuantity dictionaryRepresentation](quantity, "dictionaryRepresentation");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("quantity"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return HKCodableSampleChartDataReadFrom((uint64_t)self, (uint64_t)a3);
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
    PBDataWriterWriteInt64Field();
    v4 = v6;
    has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 8) == 0)
        goto LABEL_4;
      goto LABEL_13;
    }
  }
  else if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteInt64Field();
  v4 = v6;
  has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_4:
    if ((has & 2) == 0)
      goto LABEL_6;
    goto LABEL_5;
  }
LABEL_13:
  PBDataWriterWriteDoubleField();
  v4 = v6;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
LABEL_5:
    PBDataWriterWriteDoubleField();
    v4 = v6;
  }
LABEL_6:
  if (self->_metadataDictionary)
  {
    PBDataWriterWriteSubmessage();
    v4 = v6;
  }
  if (self->_quantity)
  {
    PBDataWriterWriteSubmessage();
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
    v4[1] = self->_dataType;
    *((_BYTE *)v4 + 56) |= 1u;
    has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 8) == 0)
        goto LABEL_4;
      goto LABEL_13;
    }
  }
  else if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  v4[3] = self->_int64Value;
  *((_BYTE *)v4 + 56) |= 4u;
  has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_4:
    if ((has & 2) == 0)
      goto LABEL_6;
    goto LABEL_5;
  }
LABEL_13:
  v4[4] = *(_QWORD *)&self->_startDate;
  *((_BYTE *)v4 + 56) |= 8u;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
LABEL_5:
    v4[2] = *(_QWORD *)&self->_endDate;
    *((_BYTE *)v4 + 56) |= 2u;
  }
LABEL_6:
  v6 = v4;
  if (self->_metadataDictionary)
  {
    objc_msgSend(v4, "setMetadataDictionary:");
    v4 = v6;
  }
  if (self->_quantity)
  {
    objc_msgSend(v6, "setQuantity:");
    v4 = v6;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  _QWORD *v6;
  char has;
  id v8;
  void *v9;
  id v10;
  void *v11;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = (_QWORD *)v5;
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    *(_QWORD *)(v5 + 8) = self->_dataType;
    *(_BYTE *)(v5 + 56) |= 1u;
    has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 8) == 0)
        goto LABEL_4;
LABEL_9:
      *(double *)(v5 + 32) = self->_startDate;
      *(_BYTE *)(v5 + 56) |= 8u;
      if ((*(_BYTE *)&self->_has & 2) == 0)
        goto LABEL_6;
      goto LABEL_5;
    }
  }
  else if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  *(_QWORD *)(v5 + 24) = self->_int64Value;
  *(_BYTE *)(v5 + 56) |= 4u;
  has = (char)self->_has;
  if ((has & 8) != 0)
    goto LABEL_9;
LABEL_4:
  if ((has & 2) != 0)
  {
LABEL_5:
    *(double *)(v5 + 16) = self->_endDate;
    *(_BYTE *)(v5 + 56) |= 2u;
  }
LABEL_6:
  v8 = -[HKCodableMetadataDictionary copyWithZone:](self->_metadataDictionary, "copyWithZone:", a3);
  v9 = (void *)v6[5];
  v6[5] = v8;

  v10 = -[HKCodableQuantity copyWithZone:](self->_quantity, "copyWithZone:", a3);
  v11 = (void *)v6[6];
  v6[6] = v10;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  HKCodableMetadataDictionary *metadataDictionary;
  HKCodableQuantity *quantity;
  char v7;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_26;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 56) & 1) == 0 || self->_dataType != *((_QWORD *)v4 + 1))
      goto LABEL_26;
  }
  else if ((*((_BYTE *)v4 + 56) & 1) != 0)
  {
LABEL_26:
    v7 = 0;
    goto LABEL_27;
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 56) & 4) == 0 || self->_int64Value != *((_QWORD *)v4 + 3))
      goto LABEL_26;
  }
  else if ((*((_BYTE *)v4 + 56) & 4) != 0)
  {
    goto LABEL_26;
  }
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    if ((*((_BYTE *)v4 + 56) & 8) == 0 || self->_startDate != *((double *)v4 + 4))
      goto LABEL_26;
  }
  else if ((*((_BYTE *)v4 + 56) & 8) != 0)
  {
    goto LABEL_26;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 56) & 2) == 0 || self->_endDate != *((double *)v4 + 2))
      goto LABEL_26;
  }
  else if ((*((_BYTE *)v4 + 56) & 2) != 0)
  {
    goto LABEL_26;
  }
  metadataDictionary = self->_metadataDictionary;
  if ((unint64_t)metadataDictionary | *((_QWORD *)v4 + 5)
    && !-[HKCodableMetadataDictionary isEqual:](metadataDictionary, "isEqual:"))
  {
    goto LABEL_26;
  }
  quantity = self->_quantity;
  if ((unint64_t)quantity | *((_QWORD *)v4 + 6))
    v7 = -[HKCodableQuantity isEqual:](quantity, "isEqual:");
  else
    v7 = 1;
LABEL_27:

  return v7;
}

- (unint64_t)hash
{
  char has;
  uint64_t v4;
  uint64_t v5;
  double startDate;
  double v7;
  long double v8;
  double v9;
  unint64_t v10;
  unint64_t v11;
  double endDate;
  double v13;
  long double v14;
  double v15;
  unint64_t v16;

  has = (char)self->_has;
  if ((has & 1) == 0)
  {
    v4 = 0;
    if ((*(_BYTE *)&self->_has & 4) != 0)
      goto LABEL_3;
LABEL_9:
    v5 = 0;
    if ((*(_BYTE *)&self->_has & 8) != 0)
      goto LABEL_4;
LABEL_10:
    v10 = 0;
    goto LABEL_13;
  }
  v4 = 2654435761 * self->_dataType;
  if ((*(_BYTE *)&self->_has & 4) == 0)
    goto LABEL_9;
LABEL_3:
  v5 = 2654435761 * self->_int64Value;
  if ((*(_BYTE *)&self->_has & 8) == 0)
    goto LABEL_10;
LABEL_4:
  startDate = self->_startDate;
  v7 = -startDate;
  if (startDate >= 0.0)
    v7 = self->_startDate;
  v8 = floor(v7 + 0.5);
  v9 = (v7 - v8) * 1.84467441e19;
  v10 = 2654435761u * (unint64_t)fmod(v8, 1.84467441e19);
  if (v9 >= 0.0)
  {
    if (v9 > 0.0)
      v10 += (unint64_t)v9;
  }
  else
  {
    v10 -= (unint64_t)fabs(v9);
  }
LABEL_13:
  if ((has & 2) != 0)
  {
    endDate = self->_endDate;
    v13 = -endDate;
    if (endDate >= 0.0)
      v13 = self->_endDate;
    v14 = floor(v13 + 0.5);
    v15 = (v13 - v14) * 1.84467441e19;
    v11 = 2654435761u * (unint64_t)fmod(v14, 1.84467441e19);
    if (v15 >= 0.0)
    {
      if (v15 > 0.0)
        v11 += (unint64_t)v15;
    }
    else
    {
      v11 -= (unint64_t)fabs(v15);
    }
  }
  else
  {
    v11 = 0;
  }
  v16 = v5 ^ v4 ^ v10 ^ v11 ^ -[HKCodableMetadataDictionary hash](self->_metadataDictionary, "hash");
  return v16 ^ -[HKCodableQuantity hash](self->_quantity, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  _QWORD *v5;
  char v6;
  HKCodableMetadataDictionary *metadataDictionary;
  uint64_t v8;
  HKCodableQuantity *quantity;
  uint64_t v10;
  _QWORD *v11;

  v4 = a3;
  v5 = v4;
  v6 = *((_BYTE *)v4 + 56);
  if ((v6 & 1) != 0)
  {
    self->_dataType = *((_QWORD *)v4 + 1);
    *(_BYTE *)&self->_has |= 1u;
    v6 = *((_BYTE *)v4 + 56);
    if ((v6 & 4) == 0)
    {
LABEL_3:
      if ((v6 & 8) == 0)
        goto LABEL_4;
      goto LABEL_11;
    }
  }
  else if ((*((_BYTE *)v4 + 56) & 4) == 0)
  {
    goto LABEL_3;
  }
  self->_int64Value = *((_QWORD *)v4 + 3);
  *(_BYTE *)&self->_has |= 4u;
  v6 = *((_BYTE *)v4 + 56);
  if ((v6 & 8) == 0)
  {
LABEL_4:
    if ((v6 & 2) == 0)
      goto LABEL_6;
    goto LABEL_5;
  }
LABEL_11:
  self->_startDate = *((double *)v4 + 4);
  *(_BYTE *)&self->_has |= 8u;
  if ((*((_BYTE *)v4 + 56) & 2) != 0)
  {
LABEL_5:
    self->_endDate = *((double *)v4 + 2);
    *(_BYTE *)&self->_has |= 2u;
  }
LABEL_6:
  metadataDictionary = self->_metadataDictionary;
  v8 = v5[5];
  v11 = v5;
  if (metadataDictionary)
  {
    if (!v8)
      goto LABEL_16;
    -[HKCodableMetadataDictionary mergeFrom:](metadataDictionary, "mergeFrom:");
  }
  else
  {
    if (!v8)
      goto LABEL_16;
    -[HKCodableSampleChartData setMetadataDictionary:](self, "setMetadataDictionary:");
  }
  v5 = v11;
LABEL_16:
  quantity = self->_quantity;
  v10 = v5[6];
  if (quantity)
  {
    if (v10)
    {
      -[HKCodableQuantity mergeFrom:](quantity, "mergeFrom:");
LABEL_21:
      v5 = v11;
    }
  }
  else if (v10)
  {
    -[HKCodableSampleChartData setQuantity:](self, "setQuantity:");
    goto LABEL_21;
  }

}

- (int64_t)dataType
{
  return self->_dataType;
}

- (int64_t)int64Value
{
  return self->_int64Value;
}

- (double)startDate
{
  return self->_startDate;
}

- (double)endDate
{
  return self->_endDate;
}

- (HKCodableMetadataDictionary)metadataDictionary
{
  return self->_metadataDictionary;
}

- (void)setMetadataDictionary:(id)a3
{
  objc_storeStrong((id *)&self->_metadataDictionary, a3);
}

- (HKCodableQuantity)quantity
{
  return self->_quantity;
}

- (void)setQuantity:(id)a3
{
  objc_storeStrong((id *)&self->_quantity, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_quantity, 0);
  objc_storeStrong((id *)&self->_metadataDictionary, 0);
}

@end
