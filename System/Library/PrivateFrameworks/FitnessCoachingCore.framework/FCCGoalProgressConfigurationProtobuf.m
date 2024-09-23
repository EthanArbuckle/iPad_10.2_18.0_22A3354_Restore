@implementation FCCGoalProgressConfigurationProtobuf

- (void)setMinimumNumberOfActiveDays:(int)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_minimumNumberOfActiveDays = a3;
}

- (void)setHasMinimumNumberOfActiveDays:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasMinimumNumberOfActiveDays
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setUserStartOfDayDate:(double)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_userStartOfDayDate = a3;
}

- (void)setHasUserStartOfDayDate:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasUserStartOfDayDate
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setUserEndOfDayDate:(double)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_userEndOfDayDate = a3;
}

- (void)setHasUserEndOfDayDate:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasUserEndOfDayDate
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setExpirationDate:(double)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_expirationDate = a3;
}

- (void)setHasExpirationDate:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasExpirationDate
{
  return *(_BYTE *)&self->_has & 1;
}

- (BOOL)hasAlmostThereConfiguration
{
  return self->_almostThereConfiguration != 0;
}

- (BOOL)hasAtypicalDayConfiguration
{
  return self->_atypicalDayConfiguration != 0;
}

- (BOOL)hasCompletionOffTrackConfiguration
{
  return self->_completionOffTrackConfiguration != 0;
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
  v8.super_class = (Class)FCCGoalProgressConfigurationProtobuf;
  -[FCCGoalProgressConfigurationProtobuf description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCCGoalProgressConfigurationProtobuf dictionaryRepresentation](self, "dictionaryRepresentation");
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
  FCCAlmostThereConfigurationProtobuf *almostThereConfiguration;
  void *v7;
  FCCAtypicalDayConfigurationProtobuf *atypicalDayConfiguration;
  void *v9;
  FCCCompletionOffTrackConfigurationProtobuf *completionOffTrackConfiguration;
  void *v11;
  void *v13;
  void *v14;
  void *v15;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = (char)self->_has;
  if ((has & 8) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_minimumNumberOfActiveDays);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v13, CFSTR("minimumNumberOfActiveDays"));

    has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 2) == 0)
        goto LABEL_4;
      goto LABEL_15;
    }
  }
  else if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_userStartOfDayDate);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v14, CFSTR("userStartOfDayDate"));

  has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_4:
    if ((has & 1) == 0)
      goto LABEL_6;
    goto LABEL_5;
  }
LABEL_15:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_userEndOfDayDate);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v15, CFSTR("userEndOfDayDate"));

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
LABEL_5:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_expirationDate);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("expirationDate"));

  }
LABEL_6:
  almostThereConfiguration = self->_almostThereConfiguration;
  if (almostThereConfiguration)
  {
    -[FCCAlmostThereConfigurationProtobuf dictionaryRepresentation](almostThereConfiguration, "dictionaryRepresentation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("almostThereConfiguration"));

  }
  atypicalDayConfiguration = self->_atypicalDayConfiguration;
  if (atypicalDayConfiguration)
  {
    -[FCCAtypicalDayConfigurationProtobuf dictionaryRepresentation](atypicalDayConfiguration, "dictionaryRepresentation");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("atypicalDayConfiguration"));

  }
  completionOffTrackConfiguration = self->_completionOffTrackConfiguration;
  if (completionOffTrackConfiguration)
  {
    -[FCCCompletionOffTrackConfigurationProtobuf dictionaryRepresentation](completionOffTrackConfiguration, "dictionaryRepresentation");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v11, CFSTR("completionOffTrackConfiguration"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return FCCGoalProgressConfigurationProtobufReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  char has;
  id v6;

  v4 = a3;
  has = (char)self->_has;
  v6 = v4;
  if ((has & 8) != 0)
  {
    PBDataWriterWriteInt32Field();
    v4 = v6;
    has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 2) == 0)
        goto LABEL_4;
      goto LABEL_15;
    }
  }
  else if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteDoubleField();
  v4 = v6;
  has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_4:
    if ((has & 1) == 0)
      goto LABEL_6;
    goto LABEL_5;
  }
LABEL_15:
  PBDataWriterWriteDoubleField();
  v4 = v6;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
LABEL_5:
    PBDataWriterWriteDoubleField();
    v4 = v6;
  }
LABEL_6:
  if (self->_almostThereConfiguration)
  {
    PBDataWriterWriteSubmessage();
    v4 = v6;
  }
  if (self->_atypicalDayConfiguration)
  {
    PBDataWriterWriteSubmessage();
    v4 = v6;
  }
  if (self->_completionOffTrackConfiguration)
  {
    PBDataWriterWriteSubmessage();
    v4 = v6;
  }

}

- (void)copyTo:(id)a3
{
  _DWORD *v4;
  char has;
  _DWORD *v6;

  v4 = a3;
  has = (char)self->_has;
  if ((has & 8) != 0)
  {
    v4[14] = self->_minimumNumberOfActiveDays;
    *((_BYTE *)v4 + 60) |= 8u;
    has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 2) == 0)
        goto LABEL_4;
      goto LABEL_15;
    }
  }
  else if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  *((_QWORD *)v4 + 3) = *(_QWORD *)&self->_userStartOfDayDate;
  *((_BYTE *)v4 + 60) |= 4u;
  has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_4:
    if ((has & 1) == 0)
      goto LABEL_6;
    goto LABEL_5;
  }
LABEL_15:
  *((_QWORD *)v4 + 2) = *(_QWORD *)&self->_userEndOfDayDate;
  *((_BYTE *)v4 + 60) |= 2u;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
LABEL_5:
    *((_QWORD *)v4 + 1) = *(_QWORD *)&self->_expirationDate;
    *((_BYTE *)v4 + 60) |= 1u;
  }
LABEL_6:
  v6 = v4;
  if (self->_almostThereConfiguration)
  {
    objc_msgSend(v4, "setAlmostThereConfiguration:");
    v4 = v6;
  }
  if (self->_atypicalDayConfiguration)
  {
    objc_msgSend(v6, "setAtypicalDayConfiguration:");
    v4 = v6;
  }
  if (self->_completionOffTrackConfiguration)
  {
    objc_msgSend(v6, "setCompletionOffTrackConfiguration:");
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
  id v12;
  void *v13;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = (_QWORD *)v5;
  has = (char)self->_has;
  if ((has & 8) != 0)
  {
    *(_DWORD *)(v5 + 56) = self->_minimumNumberOfActiveDays;
    *(_BYTE *)(v5 + 60) |= 8u;
    has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 2) == 0)
        goto LABEL_4;
LABEL_9:
      *(double *)(v5 + 16) = self->_userEndOfDayDate;
      *(_BYTE *)(v5 + 60) |= 2u;
      if ((*(_BYTE *)&self->_has & 1) == 0)
        goto LABEL_6;
      goto LABEL_5;
    }
  }
  else if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  *(double *)(v5 + 24) = self->_userStartOfDayDate;
  *(_BYTE *)(v5 + 60) |= 4u;
  has = (char)self->_has;
  if ((has & 2) != 0)
    goto LABEL_9;
LABEL_4:
  if ((has & 1) != 0)
  {
LABEL_5:
    *(double *)(v5 + 8) = self->_expirationDate;
    *(_BYTE *)(v5 + 60) |= 1u;
  }
LABEL_6:
  v8 = -[FCCAlmostThereConfigurationProtobuf copyWithZone:](self->_almostThereConfiguration, "copyWithZone:", a3);
  v9 = (void *)v6[4];
  v6[4] = v8;

  v10 = -[FCCAtypicalDayConfigurationProtobuf copyWithZone:](self->_atypicalDayConfiguration, "copyWithZone:", a3);
  v11 = (void *)v6[5];
  v6[5] = v10;

  v12 = -[FCCCompletionOffTrackConfigurationProtobuf copyWithZone:](self->_completionOffTrackConfiguration, "copyWithZone:", a3);
  v13 = (void *)v6[6];
  v6[6] = v12;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  FCCAlmostThereConfigurationProtobuf *almostThereConfiguration;
  FCCAtypicalDayConfigurationProtobuf *atypicalDayConfiguration;
  FCCCompletionOffTrackConfigurationProtobuf *completionOffTrackConfiguration;
  char v8;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_28;
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    if ((*((_BYTE *)v4 + 60) & 8) == 0 || self->_minimumNumberOfActiveDays != *((_DWORD *)v4 + 14))
      goto LABEL_28;
  }
  else if ((*((_BYTE *)v4 + 60) & 8) != 0)
  {
LABEL_28:
    v8 = 0;
    goto LABEL_29;
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 60) & 4) == 0 || self->_userStartOfDayDate != *((double *)v4 + 3))
      goto LABEL_28;
  }
  else if ((*((_BYTE *)v4 + 60) & 4) != 0)
  {
    goto LABEL_28;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 60) & 2) == 0 || self->_userEndOfDayDate != *((double *)v4 + 2))
      goto LABEL_28;
  }
  else if ((*((_BYTE *)v4 + 60) & 2) != 0)
  {
    goto LABEL_28;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 60) & 1) == 0 || self->_expirationDate != *((double *)v4 + 1))
      goto LABEL_28;
  }
  else if ((*((_BYTE *)v4 + 60) & 1) != 0)
  {
    goto LABEL_28;
  }
  almostThereConfiguration = self->_almostThereConfiguration;
  if ((unint64_t)almostThereConfiguration | *((_QWORD *)v4 + 4)
    && !-[FCCAlmostThereConfigurationProtobuf isEqual:](almostThereConfiguration, "isEqual:"))
  {
    goto LABEL_28;
  }
  atypicalDayConfiguration = self->_atypicalDayConfiguration;
  if ((unint64_t)atypicalDayConfiguration | *((_QWORD *)v4 + 5))
  {
    if (!-[FCCAtypicalDayConfigurationProtobuf isEqual:](atypicalDayConfiguration, "isEqual:"))
      goto LABEL_28;
  }
  completionOffTrackConfiguration = self->_completionOffTrackConfiguration;
  if ((unint64_t)completionOffTrackConfiguration | *((_QWORD *)v4 + 6))
    v8 = -[FCCCompletionOffTrackConfigurationProtobuf isEqual:](completionOffTrackConfiguration, "isEqual:");
  else
    v8 = 1;
LABEL_29:

  return v8;
}

- (unint64_t)hash
{
  char has;
  uint64_t v4;
  double userStartOfDayDate;
  double v6;
  long double v7;
  double v8;
  unint64_t v9;
  unint64_t v10;
  double userEndOfDayDate;
  double v12;
  long double v13;
  double v14;
  unint64_t v15;
  double expirationDate;
  double v17;
  long double v18;
  double v19;
  unint64_t v20;
  unint64_t v21;

  has = (char)self->_has;
  if ((has & 8) != 0)
  {
    v4 = 2654435761 * self->_minimumNumberOfActiveDays;
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
  userStartOfDayDate = self->_userStartOfDayDate;
  v6 = -userStartOfDayDate;
  if (userStartOfDayDate >= 0.0)
    v6 = self->_userStartOfDayDate;
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
  {
    userEndOfDayDate = self->_userEndOfDayDate;
    v12 = -userEndOfDayDate;
    if (userEndOfDayDate >= 0.0)
      v12 = self->_userEndOfDayDate;
    v13 = floor(v12 + 0.5);
    v14 = (v12 - v13) * 1.84467441e19;
    v10 = 2654435761u * (unint64_t)fmod(v13, 1.84467441e19);
    if (v14 >= 0.0)
    {
      if (v14 > 0.0)
        v10 += (unint64_t)v14;
    }
    else
    {
      v10 -= (unint64_t)fabs(v14);
    }
  }
  else
  {
    v10 = 0;
  }
  if ((has & 1) != 0)
  {
    expirationDate = self->_expirationDate;
    v17 = -expirationDate;
    if (expirationDate >= 0.0)
      v17 = self->_expirationDate;
    v18 = floor(v17 + 0.5);
    v19 = (v17 - v18) * 1.84467441e19;
    v15 = 2654435761u * (unint64_t)fmod(v18, 1.84467441e19);
    if (v19 >= 0.0)
    {
      if (v19 > 0.0)
        v15 += (unint64_t)v19;
    }
    else
    {
      v15 -= (unint64_t)fabs(v19);
    }
  }
  else
  {
    v15 = 0;
  }
  v20 = v9 ^ v4 ^ v10 ^ v15 ^ -[FCCAlmostThereConfigurationProtobuf hash](self->_almostThereConfiguration, "hash");
  v21 = -[FCCAtypicalDayConfigurationProtobuf hash](self->_atypicalDayConfiguration, "hash");
  return v20 ^ v21 ^ -[FCCCompletionOffTrackConfigurationProtobuf hash](self->_completionOffTrackConfiguration, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  _QWORD *v5;
  char v6;
  FCCAlmostThereConfigurationProtobuf *almostThereConfiguration;
  uint64_t v8;
  FCCAtypicalDayConfigurationProtobuf *atypicalDayConfiguration;
  uint64_t v10;
  FCCCompletionOffTrackConfigurationProtobuf *completionOffTrackConfiguration;
  uint64_t v12;
  _QWORD *v13;

  v4 = a3;
  v5 = v4;
  v6 = *((_BYTE *)v4 + 60);
  if ((v6 & 8) != 0)
  {
    self->_minimumNumberOfActiveDays = *((_DWORD *)v4 + 14);
    *(_BYTE *)&self->_has |= 8u;
    v6 = *((_BYTE *)v4 + 60);
    if ((v6 & 4) == 0)
    {
LABEL_3:
      if ((v6 & 2) == 0)
        goto LABEL_4;
      goto LABEL_11;
    }
  }
  else if ((*((_BYTE *)v4 + 60) & 4) == 0)
  {
    goto LABEL_3;
  }
  self->_userStartOfDayDate = *((double *)v4 + 3);
  *(_BYTE *)&self->_has |= 4u;
  v6 = *((_BYTE *)v4 + 60);
  if ((v6 & 2) == 0)
  {
LABEL_4:
    if ((v6 & 1) == 0)
      goto LABEL_6;
    goto LABEL_5;
  }
LABEL_11:
  self->_userEndOfDayDate = *((double *)v4 + 2);
  *(_BYTE *)&self->_has |= 2u;
  if ((*((_BYTE *)v4 + 60) & 1) != 0)
  {
LABEL_5:
    self->_expirationDate = *((double *)v4 + 1);
    *(_BYTE *)&self->_has |= 1u;
  }
LABEL_6:
  almostThereConfiguration = self->_almostThereConfiguration;
  v8 = v5[4];
  v13 = v5;
  if (almostThereConfiguration)
  {
    if (!v8)
      goto LABEL_16;
    -[FCCAlmostThereConfigurationProtobuf mergeFrom:](almostThereConfiguration, "mergeFrom:");
  }
  else
  {
    if (!v8)
      goto LABEL_16;
    -[FCCGoalProgressConfigurationProtobuf setAlmostThereConfiguration:](self, "setAlmostThereConfiguration:");
  }
  v5 = v13;
LABEL_16:
  atypicalDayConfiguration = self->_atypicalDayConfiguration;
  v10 = v5[5];
  if (atypicalDayConfiguration)
  {
    if (!v10)
      goto LABEL_22;
    -[FCCAtypicalDayConfigurationProtobuf mergeFrom:](atypicalDayConfiguration, "mergeFrom:");
  }
  else
  {
    if (!v10)
      goto LABEL_22;
    -[FCCGoalProgressConfigurationProtobuf setAtypicalDayConfiguration:](self, "setAtypicalDayConfiguration:");
  }
  v5 = v13;
LABEL_22:
  completionOffTrackConfiguration = self->_completionOffTrackConfiguration;
  v12 = v5[6];
  if (completionOffTrackConfiguration)
  {
    if (v12)
    {
      -[FCCCompletionOffTrackConfigurationProtobuf mergeFrom:](completionOffTrackConfiguration, "mergeFrom:");
LABEL_27:
      v5 = v13;
    }
  }
  else if (v12)
  {
    -[FCCGoalProgressConfigurationProtobuf setCompletionOffTrackConfiguration:](self, "setCompletionOffTrackConfiguration:");
    goto LABEL_27;
  }

}

- (int)minimumNumberOfActiveDays
{
  return self->_minimumNumberOfActiveDays;
}

- (double)userStartOfDayDate
{
  return self->_userStartOfDayDate;
}

- (double)userEndOfDayDate
{
  return self->_userEndOfDayDate;
}

- (double)expirationDate
{
  return self->_expirationDate;
}

- (FCCAlmostThereConfigurationProtobuf)almostThereConfiguration
{
  return self->_almostThereConfiguration;
}

- (void)setAlmostThereConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_almostThereConfiguration, a3);
}

- (FCCAtypicalDayConfigurationProtobuf)atypicalDayConfiguration
{
  return self->_atypicalDayConfiguration;
}

- (void)setAtypicalDayConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_atypicalDayConfiguration, a3);
}

- (FCCCompletionOffTrackConfigurationProtobuf)completionOffTrackConfiguration
{
  return self->_completionOffTrackConfiguration;
}

- (void)setCompletionOffTrackConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_completionOffTrackConfiguration, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_completionOffTrackConfiguration, 0);
  objc_storeStrong((id *)&self->_atypicalDayConfiguration, 0);
  objc_storeStrong((id *)&self->_almostThereConfiguration, 0);
}

@end
