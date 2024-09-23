@implementation ATXTimelineRelevancePBTimelineRelevanceStackConfigSummary

- (void)setTimestamp:(int64_t)a3
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

- (void)setSmartStacksWithWidget:(int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_smartStacksWithWidget = a3;
}

- (void)setHasSmartStacksWithWidget:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasSmartStacksWithWidget
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setNonSmartStacksWithWidget:(int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_nonSmartStacksWithWidget = a3;
}

- (void)setHasNonSmartStacksWithWidget:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasNonSmartStacksWithWidget
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setStandaloneWidgets:(int)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_standaloneWidgets = a3;
}

- (void)setHasStandaloneWidgets:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasStandaloneWidgets
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setWidgetsWithUnknownStackKind:(int)a3
{
  *(_BYTE *)&self->_has |= 0x10u;
  self->_widgetsWithUnknownStackKind = a3;
}

- (void)setHasWidgetsWithUnknownStackKind:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xEF | v3;
}

- (BOOL)hasWidgetsWithUnknownStackKind
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
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
  v8.super_class = (Class)ATXTimelineRelevancePBTimelineRelevanceStackConfigSummary;
  -[ATXTimelineRelevancePBTimelineRelevanceStackConfigSummary description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXTimelineRelevancePBTimelineRelevanceStackConfigSummary dictionaryRepresentation](self, "dictionaryRepresentation");
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
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_timestamp);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("timestamp"));

    has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 2) == 0)
        goto LABEL_4;
      goto LABEL_10;
    }
  }
  else if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_smartStacksWithWidget);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("smartStacksWithWidget"));

  has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_4:
    if ((has & 8) == 0)
      goto LABEL_5;
LABEL_11:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_standaloneWidgets);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("standaloneWidgets"));

    if ((*(_BYTE *)&self->_has & 0x10) == 0)
      return v3;
    goto LABEL_6;
  }
LABEL_10:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_nonSmartStacksWithWidget);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("nonSmartStacksWithWidget"));

  has = (char)self->_has;
  if ((has & 8) != 0)
    goto LABEL_11;
LABEL_5:
  if ((has & 0x10) != 0)
  {
LABEL_6:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_widgetsWithUnknownStackKind);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("widgetsWithUnknownStackKind"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return ATXTimelineRelevancePBTimelineRelevanceStackConfigSummaryReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has;
  id v5;

  v5 = a3;
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteInt64Field();
    has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 2) == 0)
        goto LABEL_4;
      goto LABEL_10;
    }
  }
  else if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteInt32Field();
  has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_4:
    if ((has & 8) == 0)
      goto LABEL_5;
LABEL_11:
    PBDataWriterWriteInt32Field();
    if ((*(_BYTE *)&self->_has & 0x10) == 0)
      goto LABEL_7;
    goto LABEL_6;
  }
LABEL_10:
  PBDataWriterWriteInt32Field();
  has = (char)self->_has;
  if ((has & 8) != 0)
    goto LABEL_11;
LABEL_5:
  if ((has & 0x10) != 0)
LABEL_6:
    PBDataWriterWriteInt32Field();
LABEL_7:

}

- (void)copyTo:(id)a3
{
  _QWORD *v4;
  char has;

  v4 = a3;
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    v4[1] = self->_timestamp;
    *((_BYTE *)v4 + 32) |= 1u;
    has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 2) == 0)
        goto LABEL_4;
      goto LABEL_10;
    }
  }
  else if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)v4 + 5) = self->_smartStacksWithWidget;
  *((_BYTE *)v4 + 32) |= 4u;
  has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_4:
    if ((has & 8) == 0)
      goto LABEL_5;
LABEL_11:
    *((_DWORD *)v4 + 6) = self->_standaloneWidgets;
    *((_BYTE *)v4 + 32) |= 8u;
    if ((*(_BYTE *)&self->_has & 0x10) == 0)
      goto LABEL_7;
    goto LABEL_6;
  }
LABEL_10:
  *((_DWORD *)v4 + 4) = self->_nonSmartStacksWithWidget;
  *((_BYTE *)v4 + 32) |= 2u;
  has = (char)self->_has;
  if ((has & 8) != 0)
    goto LABEL_11;
LABEL_5:
  if ((has & 0x10) != 0)
  {
LABEL_6:
    *((_DWORD *)v4 + 7) = self->_widgetsWithUnknownStackKind;
    *((_BYTE *)v4 + 32) |= 0x10u;
  }
LABEL_7:

}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;
  char has;

  result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    *((_QWORD *)result + 1) = self->_timestamp;
    *((_BYTE *)result + 32) |= 1u;
    has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 2) == 0)
        goto LABEL_4;
      goto LABEL_10;
    }
  }
  else if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)result + 5) = self->_smartStacksWithWidget;
  *((_BYTE *)result + 32) |= 4u;
  has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_4:
    if ((has & 8) == 0)
      goto LABEL_5;
    goto LABEL_11;
  }
LABEL_10:
  *((_DWORD *)result + 4) = self->_nonSmartStacksWithWidget;
  *((_BYTE *)result + 32) |= 2u;
  has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_5:
    if ((has & 0x10) == 0)
      return result;
    goto LABEL_6;
  }
LABEL_11:
  *((_DWORD *)result + 6) = self->_standaloneWidgets;
  *((_BYTE *)result + 32) |= 8u;
  if ((*(_BYTE *)&self->_has & 0x10) == 0)
    return result;
LABEL_6:
  *((_DWORD *)result + 7) = self->_widgetsWithUnknownStackKind;
  *((_BYTE *)result + 32) |= 0x10u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_26;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 32) & 1) == 0 || self->_timestamp != *((_QWORD *)v4 + 1))
      goto LABEL_26;
  }
  else if ((*((_BYTE *)v4 + 32) & 1) != 0)
  {
LABEL_26:
    v5 = 0;
    goto LABEL_27;
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 32) & 4) == 0 || self->_smartStacksWithWidget != *((_DWORD *)v4 + 5))
      goto LABEL_26;
  }
  else if ((*((_BYTE *)v4 + 32) & 4) != 0)
  {
    goto LABEL_26;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 32) & 2) == 0 || self->_nonSmartStacksWithWidget != *((_DWORD *)v4 + 4))
      goto LABEL_26;
  }
  else if ((*((_BYTE *)v4 + 32) & 2) != 0)
  {
    goto LABEL_26;
  }
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    if ((*((_BYTE *)v4 + 32) & 8) == 0 || self->_standaloneWidgets != *((_DWORD *)v4 + 6))
      goto LABEL_26;
  }
  else if ((*((_BYTE *)v4 + 32) & 8) != 0)
  {
    goto LABEL_26;
  }
  v5 = (*((_BYTE *)v4 + 32) & 0x10) == 0;
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
    if ((*((_BYTE *)v4 + 32) & 0x10) == 0 || self->_widgetsWithUnknownStackKind != *((_DWORD *)v4 + 7))
      goto LABEL_26;
    v5 = 1;
  }
LABEL_27:

  return v5;
}

- (unint64_t)hash
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v2 = 2654435761 * self->_timestamp;
    if ((*(_BYTE *)&self->_has & 4) != 0)
    {
LABEL_3:
      v3 = 2654435761 * self->_smartStacksWithWidget;
      if ((*(_BYTE *)&self->_has & 2) != 0)
        goto LABEL_4;
      goto LABEL_9;
    }
  }
  else
  {
    v2 = 0;
    if ((*(_BYTE *)&self->_has & 4) != 0)
      goto LABEL_3;
  }
  v3 = 0;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
LABEL_4:
    v4 = 2654435761 * self->_nonSmartStacksWithWidget;
    if ((*(_BYTE *)&self->_has & 8) != 0)
      goto LABEL_5;
LABEL_10:
    v5 = 0;
    if ((*(_BYTE *)&self->_has & 0x10) != 0)
      goto LABEL_6;
LABEL_11:
    v6 = 0;
    return v3 ^ v2 ^ v4 ^ v5 ^ v6;
  }
LABEL_9:
  v4 = 0;
  if ((*(_BYTE *)&self->_has & 8) == 0)
    goto LABEL_10;
LABEL_5:
  v5 = 2654435761 * self->_standaloneWidgets;
  if ((*(_BYTE *)&self->_has & 0x10) == 0)
    goto LABEL_11;
LABEL_6:
  v6 = 2654435761 * self->_widgetsWithUnknownStackKind;
  return v3 ^ v2 ^ v4 ^ v5 ^ v6;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  char v5;

  v4 = a3;
  v5 = *((_BYTE *)v4 + 32);
  if ((v5 & 1) != 0)
  {
    self->_timestamp = *((_QWORD *)v4 + 1);
    *(_BYTE *)&self->_has |= 1u;
    v5 = *((_BYTE *)v4 + 32);
    if ((v5 & 4) == 0)
    {
LABEL_3:
      if ((v5 & 2) == 0)
        goto LABEL_4;
      goto LABEL_10;
    }
  }
  else if ((*((_BYTE *)v4 + 32) & 4) == 0)
  {
    goto LABEL_3;
  }
  self->_smartStacksWithWidget = *((_DWORD *)v4 + 5);
  *(_BYTE *)&self->_has |= 4u;
  v5 = *((_BYTE *)v4 + 32);
  if ((v5 & 2) == 0)
  {
LABEL_4:
    if ((v5 & 8) == 0)
      goto LABEL_5;
LABEL_11:
    self->_standaloneWidgets = *((_DWORD *)v4 + 6);
    *(_BYTE *)&self->_has |= 8u;
    if ((*((_BYTE *)v4 + 32) & 0x10) == 0)
      goto LABEL_7;
    goto LABEL_6;
  }
LABEL_10:
  self->_nonSmartStacksWithWidget = *((_DWORD *)v4 + 4);
  *(_BYTE *)&self->_has |= 2u;
  v5 = *((_BYTE *)v4 + 32);
  if ((v5 & 8) != 0)
    goto LABEL_11;
LABEL_5:
  if ((v5 & 0x10) != 0)
  {
LABEL_6:
    self->_widgetsWithUnknownStackKind = *((_DWORD *)v4 + 7);
    *(_BYTE *)&self->_has |= 0x10u;
  }
LABEL_7:

}

- (int64_t)timestamp
{
  return self->_timestamp;
}

- (int)smartStacksWithWidget
{
  return self->_smartStacksWithWidget;
}

- (int)nonSmartStacksWithWidget
{
  return self->_nonSmartStacksWithWidget;
}

- (int)standaloneWidgets
{
  return self->_standaloneWidgets;
}

- (int)widgetsWithUnknownStackKind
{
  return self->_widgetsWithUnknownStackKind;
}

@end
