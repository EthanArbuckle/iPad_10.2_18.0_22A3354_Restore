@implementation BLTPBSetRemoteGlobalSettingsRequest

- (void)setGlobalScheduledDeliverySetting:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_globalScheduledDeliverySetting = a3;
}

- (void)setHasGlobalScheduledDeliverySetting:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasGlobalScheduledDeliverySetting
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setSettingDate:(double)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_settingDate = a3;
}

- (void)setHasSettingDate:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasSettingDate
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setGlobalSummarizationSetting:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_globalSummarizationSetting = a3;
}

- (void)setHasGlobalSummarizationSetting:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasGlobalSummarizationSetting
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

  v3 = (void *)MEMORY[0x24BDD17C8];
  v8.receiver = self;
  v8.super_class = (Class)BLTPBSetRemoteGlobalSettingsRequest;
  -[BLTPBSetRemoteGlobalSettingsRequest description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[BLTPBSetRemoteGlobalSettingsRequest dictionaryRepresentation](self, "dictionaryRepresentation");
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

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = (char)self->_has;
  if ((has & 1) == 0)
  {
    if ((*(_BYTE *)&self->_has & 4) == 0)
      goto LABEL_3;
LABEL_7:
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_settingDate);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("settingDate"));

    if ((*(_BYTE *)&self->_has & 2) == 0)
      return v3;
    goto LABEL_4;
  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_globalScheduledDeliverySetting);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("globalScheduledDeliverySetting"));

  has = (char)self->_has;
  if ((has & 4) != 0)
    goto LABEL_7;
LABEL_3:
  if ((has & 2) != 0)
  {
LABEL_4:
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_globalSummarizationSetting);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("globalSummarizationSetting"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return BLTPBSetRemoteGlobalSettingsRequestReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  char has;
  id v6;

  v4 = a3;
  has = (char)self->_has;
  v6 = v4;
  if ((has & 1) == 0)
  {
    if ((*(_BYTE *)&self->_has & 4) == 0)
      goto LABEL_3;
LABEL_7:
    PBDataWriterWriteDoubleField();
    v4 = v6;
    if ((*(_BYTE *)&self->_has & 2) == 0)
      goto LABEL_5;
    goto LABEL_4;
  }
  PBDataWriterWriteUint64Field();
  v4 = v6;
  has = (char)self->_has;
  if ((has & 4) != 0)
    goto LABEL_7;
LABEL_3:
  if ((has & 2) != 0)
  {
LABEL_4:
    PBDataWriterWriteUint64Field();
    v4 = v6;
  }
LABEL_5:

}

- (void)copyTo:(id)a3
{
  _QWORD *v4;
  char has;

  v4 = a3;
  has = (char)self->_has;
  if ((has & 1) == 0)
  {
    if ((*(_BYTE *)&self->_has & 4) == 0)
      goto LABEL_3;
LABEL_7:
    v4[3] = *(_QWORD *)&self->_settingDate;
    *((_BYTE *)v4 + 32) |= 4u;
    if ((*(_BYTE *)&self->_has & 2) == 0)
      goto LABEL_5;
    goto LABEL_4;
  }
  v4[1] = self->_globalScheduledDeliverySetting;
  *((_BYTE *)v4 + 32) |= 1u;
  has = (char)self->_has;
  if ((has & 4) != 0)
    goto LABEL_7;
LABEL_3:
  if ((has & 2) != 0)
  {
LABEL_4:
    v4[2] = self->_globalSummarizationSetting;
    *((_BYTE *)v4 + 32) |= 2u;
  }
LABEL_5:

}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;
  char has;

  result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    *((_QWORD *)result + 1) = self->_globalScheduledDeliverySetting;
    *((_BYTE *)result + 32) |= 1u;
    has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 2) == 0)
        return result;
      goto LABEL_4;
    }
  }
  else if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  *((_QWORD *)result + 3) = *(_QWORD *)&self->_settingDate;
  *((_BYTE *)result + 32) |= 4u;
  if ((*(_BYTE *)&self->_has & 2) == 0)
    return result;
LABEL_4:
  *((_QWORD *)result + 2) = self->_globalSummarizationSetting;
  *((_BYTE *)result + 32) |= 2u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_16;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 32) & 1) == 0 || self->_globalScheduledDeliverySetting != *((_QWORD *)v4 + 1))
      goto LABEL_16;
  }
  else if ((*((_BYTE *)v4 + 32) & 1) != 0)
  {
LABEL_16:
    v5 = 0;
    goto LABEL_17;
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 32) & 4) == 0 || self->_settingDate != *((double *)v4 + 3))
      goto LABEL_16;
  }
  else if ((*((_BYTE *)v4 + 32) & 4) != 0)
  {
    goto LABEL_16;
  }
  v5 = (*((_BYTE *)v4 + 32) & 2) == 0;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 32) & 2) == 0 || self->_globalSummarizationSetting != *((_QWORD *)v4 + 2))
      goto LABEL_16;
    v5 = 1;
  }
LABEL_17:

  return v5;
}

- (unint64_t)hash
{
  char has;
  unint64_t v4;
  double settingDate;
  double v6;
  long double v7;
  double v8;
  unint64_t v9;
  unint64_t v10;

  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    v4 = 2654435761u * self->_globalScheduledDeliverySetting;
    if ((*(_BYTE *)&self->_has & 4) != 0)
      goto LABEL_3;
LABEL_8:
    v9 = 0;
    goto LABEL_11;
  }
  v4 = 0;
  if ((*(_BYTE *)&self->_has & 4) == 0)
    goto LABEL_8;
LABEL_3:
  settingDate = self->_settingDate;
  v6 = -settingDate;
  if (settingDate >= 0.0)
    v6 = self->_settingDate;
  v7 = floor(v6 + 0.5);
  v8 = (v6 - v7) * 1.84467441e19;
  v9 = 2654435761u * (unint64_t)fmod(v7, 1.84467441e19);
  if (v8 >= 0.0)
  {
    if (v8 > 0.0)
      v9 += (unint64_t)v8;
  }
  else
  {
    v9 -= (unint64_t)fabs(v8);
  }
LABEL_11:
  if ((has & 2) != 0)
    v10 = 2654435761u * self->_globalSummarizationSetting;
  else
    v10 = 0;
  return v9 ^ v4 ^ v10;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  char v5;

  v4 = a3;
  v5 = *((_BYTE *)v4 + 32);
  if ((v5 & 1) == 0)
  {
    if ((*((_BYTE *)v4 + 32) & 4) == 0)
      goto LABEL_3;
LABEL_7:
    self->_settingDate = *((double *)v4 + 3);
    *(_BYTE *)&self->_has |= 4u;
    if ((*((_BYTE *)v4 + 32) & 2) == 0)
      goto LABEL_5;
    goto LABEL_4;
  }
  self->_globalScheduledDeliverySetting = *((_QWORD *)v4 + 1);
  *(_BYTE *)&self->_has |= 1u;
  v5 = *((_BYTE *)v4 + 32);
  if ((v5 & 4) != 0)
    goto LABEL_7;
LABEL_3:
  if ((v5 & 2) != 0)
  {
LABEL_4:
    self->_globalSummarizationSetting = *((_QWORD *)v4 + 2);
    *(_BYTE *)&self->_has |= 2u;
  }
LABEL_5:

}

- (unint64_t)globalScheduledDeliverySetting
{
  return self->_globalScheduledDeliverySetting;
}

- (double)settingDate
{
  return self->_settingDate;
}

- (unint64_t)globalSummarizationSetting
{
  return self->_globalSummarizationSetting;
}

@end
