@implementation HKCodableCellHeaderViewModel

- (BOOL)hasSystemImageName
{
  return self->_systemImageName != 0;
}

- (BOOL)hasForegroundColor
{
  return self->_foregroundColor != 0;
}

- (void)setDetailDate:(double)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_detailDate = a3;
}

- (void)setHasDetailDate:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasDetailDate
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setForceDayGranularity:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_forceDayGranularity = a3;
}

- (void)setHasForceDayGranularity:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasForceDayGranularity
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (BOOL)hasDetailText
{
  return self->_detailText != 0;
}

- (void)setDetailsVisibility:(int64_t)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_detailsVisibility = a3;
}

- (void)setHasDetailsVisibility:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasDetailsVisibility
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
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
  v8.super_class = (Class)HKCodableCellHeaderViewModel;
  -[HKCodableCellHeaderViewModel description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKCodableCellHeaderViewModel dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *titleText;
  NSString *systemImageName;
  HKCodableColorRepresentation *foregroundColor;
  void *v8;
  char has;
  void *v10;
  void *v11;
  NSString *detailText;
  void *v13;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  titleText = self->_titleText;
  if (titleText)
    objc_msgSend(v3, "setObject:forKey:", titleText, CFSTR("titleText"));
  systemImageName = self->_systemImageName;
  if (systemImageName)
    objc_msgSend(v4, "setObject:forKey:", systemImageName, CFSTR("systemImageName"));
  foregroundColor = self->_foregroundColor;
  if (foregroundColor)
  {
    -[HKCodableColorRepresentation dictionaryRepresentation](foregroundColor, "dictionaryRepresentation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v8, CFSTR("foregroundColor"));

  }
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_detailDate);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v10, CFSTR("detailDate"));

    has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_forceDayGranularity);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v11, CFSTR("forceDayGranularity"));

  }
  detailText = self->_detailText;
  if (detailText)
    objc_msgSend(v4, "setObject:forKey:", detailText, CFSTR("detailText"));
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_detailsVisibility);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v13, CFSTR("detailsVisibility"));

  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return HKCodableCellHeaderViewModelReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  char has;
  void *v6;
  id v7;

  v4 = a3;
  if (!self->_titleText)
    -[HKCodableCellHeaderViewModel writeTo:].cold.1();
  v7 = v4;
  PBDataWriterWriteStringField();
  if (self->_systemImageName)
    PBDataWriterWriteStringField();
  if (self->_foregroundColor)
    PBDataWriterWriteSubmessage();
  has = (char)self->_has;
  v6 = v7;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteDoubleField();
    v6 = v7;
    has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    PBDataWriterWriteBOOLField();
    v6 = v7;
  }
  if (self->_detailText)
  {
    PBDataWriterWriteStringField();
    v6 = v7;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    PBDataWriterWriteInt64Field();
    v6 = v7;
  }

}

- (void)copyTo:(id)a3
{
  char has;
  _QWORD *v5;
  id v6;

  v6 = a3;
  objc_msgSend(v6, "setTitleText:", self->_titleText);
  if (self->_systemImageName)
    objc_msgSend(v6, "setSystemImageName:");
  if (self->_foregroundColor)
    objc_msgSend(v6, "setForegroundColor:");
  has = (char)self->_has;
  v5 = v6;
  if ((has & 1) != 0)
  {
    *((_QWORD *)v6 + 1) = *(_QWORD *)&self->_detailDate;
    *((_BYTE *)v6 + 60) |= 1u;
    has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    *((_BYTE *)v6 + 56) = self->_forceDayGranularity;
    *((_BYTE *)v6 + 60) |= 4u;
  }
  if (self->_detailText)
  {
    objc_msgSend(v6, "setDetailText:");
    v5 = v6;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    v5[2] = self->_detailsVisibility;
    *((_BYTE *)v5 + 60) |= 2u;
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
  v6 = -[NSString copyWithZone:](self->_titleText, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 48);
  *(_QWORD *)(v5 + 48) = v6;

  v8 = -[NSString copyWithZone:](self->_systemImageName, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v8;

  v10 = -[HKCodableColorRepresentation copyWithZone:](self->_foregroundColor, "copyWithZone:", a3);
  v11 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v10;

  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    *(double *)(v5 + 8) = self->_detailDate;
    *(_BYTE *)(v5 + 60) |= 1u;
    has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    *(_BYTE *)(v5 + 56) = self->_forceDayGranularity;
    *(_BYTE *)(v5 + 60) |= 4u;
  }
  v13 = -[NSString copyWithZone:](self->_detailText, "copyWithZone:", a3);
  v14 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v13;

  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    *(_QWORD *)(v5 + 16) = self->_detailsVisibility;
    *(_BYTE *)(v5 + 60) |= 2u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *titleText;
  NSString *systemImageName;
  HKCodableColorRepresentation *foregroundColor;
  char has;
  NSString *detailText;
  BOOL v10;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_28;
  titleText = self->_titleText;
  if ((unint64_t)titleText | *((_QWORD *)v4 + 6))
  {
    if (!-[NSString isEqual:](titleText, "isEqual:"))
      goto LABEL_28;
  }
  systemImageName = self->_systemImageName;
  if ((unint64_t)systemImageName | *((_QWORD *)v4 + 5))
  {
    if (!-[NSString isEqual:](systemImageName, "isEqual:"))
      goto LABEL_28;
  }
  foregroundColor = self->_foregroundColor;
  if ((unint64_t)foregroundColor | *((_QWORD *)v4 + 4))
  {
    if (!-[HKCodableColorRepresentation isEqual:](foregroundColor, "isEqual:"))
      goto LABEL_28;
  }
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 60) & 1) == 0 || self->_detailDate != *((double *)v4 + 1))
      goto LABEL_28;
  }
  else if ((*((_BYTE *)v4 + 60) & 1) != 0)
  {
    goto LABEL_28;
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 60) & 4) == 0)
      goto LABEL_28;
    if (self->_forceDayGranularity)
    {
      if (!*((_BYTE *)v4 + 56))
        goto LABEL_28;
    }
    else if (*((_BYTE *)v4 + 56))
    {
      goto LABEL_28;
    }
  }
  else if ((*((_BYTE *)v4 + 60) & 4) != 0)
  {
    goto LABEL_28;
  }
  detailText = self->_detailText;
  if (!((unint64_t)detailText | *((_QWORD *)v4 + 3)))
    goto LABEL_24;
  if (!-[NSString isEqual:](detailText, "isEqual:"))
  {
LABEL_28:
    v10 = 0;
    goto LABEL_29;
  }
  has = (char)self->_has;
LABEL_24:
  v10 = (*((_BYTE *)v4 + 60) & 2) == 0;
  if ((has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 60) & 2) == 0 || self->_detailsVisibility != *((_QWORD *)v4 + 2))
      goto LABEL_28;
    v10 = 1;
  }
LABEL_29:

  return v10;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;
  unint64_t v5;
  char has;
  unint64_t v7;
  double detailDate;
  double v9;
  long double v10;
  double v11;
  uint64_t v12;
  NSUInteger v13;
  uint64_t v14;

  v3 = -[NSString hash](self->_titleText, "hash");
  v4 = -[NSString hash](self->_systemImageName, "hash");
  v5 = -[HKCodableColorRepresentation hash](self->_foregroundColor, "hash");
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    detailDate = self->_detailDate;
    v9 = -detailDate;
    if (detailDate >= 0.0)
      v9 = self->_detailDate;
    v10 = floor(v9 + 0.5);
    v11 = (v9 - v10) * 1.84467441e19;
    v7 = 2654435761u * (unint64_t)fmod(v10, 1.84467441e19);
    if (v11 >= 0.0)
    {
      if (v11 > 0.0)
        v7 += (unint64_t)v11;
    }
    else
    {
      v7 -= (unint64_t)fabs(v11);
    }
  }
  else
  {
    v7 = 0;
  }
  if ((has & 4) != 0)
    v12 = 2654435761 * self->_forceDayGranularity;
  else
    v12 = 0;
  v13 = -[NSString hash](self->_detailText, "hash");
  if ((*(_BYTE *)&self->_has & 2) != 0)
    v14 = 2654435761 * self->_detailsVisibility;
  else
    v14 = 0;
  return v4 ^ v3 ^ v5 ^ v7 ^ v12 ^ v13 ^ v14;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  HKCodableColorRepresentation *foregroundColor;
  uint64_t v6;
  char v7;
  id v8;

  v4 = a3;
  v8 = v4;
  if (*((_QWORD *)v4 + 6))
  {
    -[HKCodableCellHeaderViewModel setTitleText:](self, "setTitleText:");
    v4 = v8;
  }
  if (*((_QWORD *)v4 + 5))
  {
    -[HKCodableCellHeaderViewModel setSystemImageName:](self, "setSystemImageName:");
    v4 = v8;
  }
  foregroundColor = self->_foregroundColor;
  v6 = *((_QWORD *)v4 + 4);
  if (foregroundColor)
  {
    if (!v6)
      goto LABEL_11;
    -[HKCodableColorRepresentation mergeFrom:](foregroundColor, "mergeFrom:");
  }
  else
  {
    if (!v6)
      goto LABEL_11;
    -[HKCodableCellHeaderViewModel setForegroundColor:](self, "setForegroundColor:");
  }
  v4 = v8;
LABEL_11:
  v7 = *((_BYTE *)v4 + 60);
  if ((v7 & 1) != 0)
  {
    self->_detailDate = *((double *)v4 + 1);
    *(_BYTE *)&self->_has |= 1u;
    v7 = *((_BYTE *)v4 + 60);
  }
  if ((v7 & 4) != 0)
  {
    self->_forceDayGranularity = *((_BYTE *)v4 + 56);
    *(_BYTE *)&self->_has |= 4u;
  }
  if (*((_QWORD *)v4 + 3))
  {
    -[HKCodableCellHeaderViewModel setDetailText:](self, "setDetailText:");
    v4 = v8;
  }
  if ((*((_BYTE *)v4 + 60) & 2) != 0)
  {
    self->_detailsVisibility = *((_QWORD *)v4 + 2);
    *(_BYTE *)&self->_has |= 2u;
  }

}

- (NSString)titleText
{
  return self->_titleText;
}

- (void)setTitleText:(id)a3
{
  objc_storeStrong((id *)&self->_titleText, a3);
}

- (NSString)systemImageName
{
  return self->_systemImageName;
}

- (void)setSystemImageName:(id)a3
{
  objc_storeStrong((id *)&self->_systemImageName, a3);
}

- (HKCodableColorRepresentation)foregroundColor
{
  return self->_foregroundColor;
}

- (void)setForegroundColor:(id)a3
{
  objc_storeStrong((id *)&self->_foregroundColor, a3);
}

- (double)detailDate
{
  return self->_detailDate;
}

- (BOOL)forceDayGranularity
{
  return self->_forceDayGranularity;
}

- (NSString)detailText
{
  return self->_detailText;
}

- (void)setDetailText:(id)a3
{
  objc_storeStrong((id *)&self->_detailText, a3);
}

- (int64_t)detailsVisibility
{
  return self->_detailsVisibility;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_titleText, 0);
  objc_storeStrong((id *)&self->_systemImageName, 0);
  objc_storeStrong((id *)&self->_foregroundColor, 0);
  objc_storeStrong((id *)&self->_detailText, 0);
}

- (void)writeTo:.cold.1()
{
  __assert_rtn("-[HKCodableCellHeaderViewModel writeTo:]", "HKCodableCellHeaderViewModel.m", 203, "nil != self->_titleText");
}

@end
