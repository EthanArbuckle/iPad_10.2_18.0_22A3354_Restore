@implementation BMPBRemindersContentEvent

- (BOOL)hasUniqueId
{
  return self->_uniqueId != 0;
}

- (BOOL)hasDomainId
{
  return self->_domainId != 0;
}

- (void)setAbsoluteTimestamp:(double)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_absoluteTimestamp = a3;
}

- (void)setHasAbsoluteTimestamp:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasAbsoluteTimestamp
{
  return *(_BYTE *)&self->_has & 1;
}

- (BOOL)hasTitle
{
  return self->_title != 0;
}

- (BOOL)hasNotes
{
  return self->_notes != 0;
}

- (void)setIsAllDay:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 0x10u;
  self->_isAllDay = a3;
}

- (void)setHasIsAllDay:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xEF | v3;
}

- (BOOL)hasIsAllDay
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (void)setCompletionDateTimestamp:(double)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_completionDateTimestamp = a3;
}

- (void)setHasCompletionDateTimestamp:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasCompletionDateTimestamp
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setDueDateTimestamp:(double)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_dueDateTimestamp = a3;
}

- (void)setHasDueDateTimestamp:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasDueDateTimestamp
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setPriority:(int)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_priority = a3;
}

- (void)setHasPriority:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasPriority
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (BOOL)hasContentProtection
{
  return self->_contentProtection != 0;
}

- (BOOL)hasPersonaId
{
  return self->_personaId != 0;
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
  v8.super_class = (Class)BMPBRemindersContentEvent;
  -[BMPBRemindersContentEvent description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMPBRemindersContentEvent dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *uniqueId;
  NSString *domainId;
  void *v7;
  NSString *title;
  NSString *notes;
  char has;
  void *v11;
  NSString *contentProtection;
  NSString *personaId;
  void *v15;
  void *v16;
  void *v17;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  uniqueId = self->_uniqueId;
  if (uniqueId)
    objc_msgSend(v3, "setObject:forKey:", uniqueId, CFSTR("uniqueId"));
  domainId = self->_domainId;
  if (domainId)
    objc_msgSend(v4, "setObject:forKey:", domainId, CFSTR("domainId"));
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_absoluteTimestamp);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("absoluteTimestamp"));

  }
  title = self->_title;
  if (title)
    objc_msgSend(v4, "setObject:forKey:", title, CFSTR("title"));
  notes = self->_notes;
  if (notes)
    objc_msgSend(v4, "setObject:forKey:", notes, CFSTR("notes"));
  has = (char)self->_has;
  if ((has & 0x10) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isAllDay);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v15, CFSTR("isAllDay"));

    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_13:
      if ((has & 4) == 0)
        goto LABEL_14;
      goto LABEL_23;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_13;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_completionDateTimestamp);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v16, CFSTR("completionDateTimestamp"));

  has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_14:
    if ((has & 8) == 0)
      goto LABEL_16;
    goto LABEL_15;
  }
LABEL_23:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_dueDateTimestamp);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v17, CFSTR("dueDateTimestamp"));

  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
LABEL_15:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_priority);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v11, CFSTR("priority"));

  }
LABEL_16:
  contentProtection = self->_contentProtection;
  if (contentProtection)
    objc_msgSend(v4, "setObject:forKey:", contentProtection, CFSTR("contentProtection"));
  personaId = self->_personaId;
  if (personaId)
    objc_msgSend(v4, "setObject:forKey:", personaId, CFSTR("personaId"));
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return BMPBRemindersContentEventReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  char has;
  id v6;

  v4 = a3;
  v6 = v4;
  if (self->_uniqueId)
  {
    PBDataWriterWriteStringField();
    v4 = v6;
  }
  if (self->_domainId)
  {
    PBDataWriterWriteStringField();
    v4 = v6;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    PBDataWriterWriteDoubleField();
    v4 = v6;
  }
  if (self->_title)
  {
    PBDataWriterWriteStringField();
    v4 = v6;
  }
  if (self->_notes)
  {
    PBDataWriterWriteStringField();
    v4 = v6;
  }
  has = (char)self->_has;
  if ((has & 0x10) != 0)
  {
    PBDataWriterWriteBOOLField();
    v4 = v6;
    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_13:
      if ((has & 4) == 0)
        goto LABEL_14;
      goto LABEL_23;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_13;
  }
  PBDataWriterWriteDoubleField();
  v4 = v6;
  has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_14:
    if ((has & 8) == 0)
      goto LABEL_16;
    goto LABEL_15;
  }
LABEL_23:
  PBDataWriterWriteDoubleField();
  v4 = v6;
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
LABEL_15:
    PBDataWriterWriteSint32Field();
    v4 = v6;
  }
LABEL_16:
  if (self->_contentProtection)
  {
    PBDataWriterWriteStringField();
    v4 = v6;
  }
  if (self->_personaId)
  {
    PBDataWriterWriteStringField();
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
  if (self->_uniqueId)
  {
    objc_msgSend(v4, "setUniqueId:");
    v4 = v6;
  }
  if (self->_domainId)
  {
    objc_msgSend(v6, "setDomainId:");
    v4 = v6;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_QWORD *)v4 + 1) = *(_QWORD *)&self->_absoluteTimestamp;
    *((_BYTE *)v4 + 92) |= 1u;
  }
  if (self->_title)
  {
    objc_msgSend(v6, "setTitle:");
    v4 = v6;
  }
  if (self->_notes)
  {
    objc_msgSend(v6, "setNotes:");
    v4 = v6;
  }
  has = (char)self->_has;
  if ((has & 0x10) != 0)
  {
    *((_BYTE *)v4 + 88) = self->_isAllDay;
    *((_BYTE *)v4 + 92) |= 0x10u;
    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_13:
      if ((has & 4) == 0)
        goto LABEL_14;
      goto LABEL_23;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_13;
  }
  *((_QWORD *)v4 + 2) = *(_QWORD *)&self->_completionDateTimestamp;
  *((_BYTE *)v4 + 92) |= 2u;
  has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_14:
    if ((has & 8) == 0)
      goto LABEL_16;
    goto LABEL_15;
  }
LABEL_23:
  *((_QWORD *)v4 + 3) = *(_QWORD *)&self->_dueDateTimestamp;
  *((_BYTE *)v4 + 92) |= 4u;
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
LABEL_15:
    *((_DWORD *)v4 + 16) = self->_priority;
    *((_BYTE *)v4 + 92) |= 8u;
  }
LABEL_16:
  if (self->_contentProtection)
  {
    objc_msgSend(v6, "setContentProtection:");
    v4 = v6;
  }
  if (self->_personaId)
  {
    objc_msgSend(v6, "setPersonaId:");
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
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  char has;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_uniqueId, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 80);
  *(_QWORD *)(v5 + 80) = v6;

  v8 = -[NSString copyWithZone:](self->_domainId, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v8;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(double *)(v5 + 8) = self->_absoluteTimestamp;
    *(_BYTE *)(v5 + 92) |= 1u;
  }
  v10 = -[NSString copyWithZone:](self->_title, "copyWithZone:", a3);
  v11 = *(void **)(v5 + 72);
  *(_QWORD *)(v5 + 72) = v10;

  v12 = -[NSString copyWithZone:](self->_notes, "copyWithZone:", a3);
  v13 = *(void **)(v5 + 48);
  *(_QWORD *)(v5 + 48) = v12;

  has = (char)self->_has;
  if ((has & 0x10) != 0)
  {
    *(_BYTE *)(v5 + 88) = self->_isAllDay;
    *(_BYTE *)(v5 + 92) |= 0x10u;
    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_5:
      if ((has & 4) == 0)
        goto LABEL_6;
LABEL_11:
      *(double *)(v5 + 24) = self->_dueDateTimestamp;
      *(_BYTE *)(v5 + 92) |= 4u;
      if ((*(_BYTE *)&self->_has & 8) == 0)
        goto LABEL_8;
      goto LABEL_7;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_5;
  }
  *(double *)(v5 + 16) = self->_completionDateTimestamp;
  *(_BYTE *)(v5 + 92) |= 2u;
  has = (char)self->_has;
  if ((has & 4) != 0)
    goto LABEL_11;
LABEL_6:
  if ((has & 8) != 0)
  {
LABEL_7:
    *(_DWORD *)(v5 + 64) = self->_priority;
    *(_BYTE *)(v5 + 92) |= 8u;
  }
LABEL_8:
  v15 = -[NSString copyWithZone:](self->_contentProtection, "copyWithZone:", a3);
  v16 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v15;

  v17 = -[NSString copyWithZone:](self->_personaId, "copyWithZone:", a3);
  v18 = *(void **)(v5 + 56);
  *(_QWORD *)(v5 + 56) = v17;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *uniqueId;
  NSString *domainId;
  NSString *title;
  NSString *notes;
  NSString *contentProtection;
  NSString *personaId;
  char v11;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_42;
  uniqueId = self->_uniqueId;
  if ((unint64_t)uniqueId | *((_QWORD *)v4 + 10))
  {
    if (!-[NSString isEqual:](uniqueId, "isEqual:"))
      goto LABEL_42;
  }
  domainId = self->_domainId;
  if ((unint64_t)domainId | *((_QWORD *)v4 + 5))
  {
    if (!-[NSString isEqual:](domainId, "isEqual:"))
      goto LABEL_42;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 92) & 1) == 0 || self->_absoluteTimestamp != *((double *)v4 + 1))
      goto LABEL_42;
  }
  else if ((*((_BYTE *)v4 + 92) & 1) != 0)
  {
    goto LABEL_42;
  }
  title = self->_title;
  if ((unint64_t)title | *((_QWORD *)v4 + 9) && !-[NSString isEqual:](title, "isEqual:"))
    goto LABEL_42;
  notes = self->_notes;
  if ((unint64_t)notes | *((_QWORD *)v4 + 6))
  {
    if (!-[NSString isEqual:](notes, "isEqual:"))
      goto LABEL_42;
  }
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
    if ((*((_BYTE *)v4 + 92) & 0x10) != 0)
    {
      if (self->_isAllDay)
      {
        if (!*((_BYTE *)v4 + 88))
          goto LABEL_42;
        goto LABEL_23;
      }
      if (!*((_BYTE *)v4 + 88))
        goto LABEL_23;
    }
LABEL_42:
    v11 = 0;
    goto LABEL_43;
  }
  if ((*((_BYTE *)v4 + 92) & 0x10) != 0)
    goto LABEL_42;
LABEL_23:
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 92) & 2) == 0 || self->_completionDateTimestamp != *((double *)v4 + 2))
      goto LABEL_42;
  }
  else if ((*((_BYTE *)v4 + 92) & 2) != 0)
  {
    goto LABEL_42;
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 92) & 4) == 0 || self->_dueDateTimestamp != *((double *)v4 + 3))
      goto LABEL_42;
  }
  else if ((*((_BYTE *)v4 + 92) & 4) != 0)
  {
    goto LABEL_42;
  }
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    if ((*((_BYTE *)v4 + 92) & 8) == 0 || self->_priority != *((_DWORD *)v4 + 16))
      goto LABEL_42;
  }
  else if ((*((_BYTE *)v4 + 92) & 8) != 0)
  {
    goto LABEL_42;
  }
  contentProtection = self->_contentProtection;
  if ((unint64_t)contentProtection | *((_QWORD *)v4 + 4)
    && !-[NSString isEqual:](contentProtection, "isEqual:"))
  {
    goto LABEL_42;
  }
  personaId = self->_personaId;
  if ((unint64_t)personaId | *((_QWORD *)v4 + 7))
    v11 = -[NSString isEqual:](personaId, "isEqual:");
  else
    v11 = 1;
LABEL_43:

  return v11;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;
  unint64_t v5;
  double absoluteTimestamp;
  double v7;
  long double v8;
  double v9;
  NSUInteger v10;
  NSUInteger v11;
  char has;
  uint64_t v13;
  double completionDateTimestamp;
  double v15;
  long double v16;
  double v17;
  unint64_t v18;
  unint64_t v19;
  double dueDateTimestamp;
  double v21;
  long double v22;
  double v23;
  uint64_t v24;
  NSUInteger v25;
  NSUInteger v26;

  v3 = -[NSString hash](self->_uniqueId, "hash");
  v4 = -[NSString hash](self->_domainId, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    absoluteTimestamp = self->_absoluteTimestamp;
    v7 = -absoluteTimestamp;
    if (absoluteTimestamp >= 0.0)
      v7 = self->_absoluteTimestamp;
    v8 = floor(v7 + 0.5);
    v9 = (v7 - v8) * 1.84467441e19;
    v5 = 2654435761u * (unint64_t)fmod(v8, 1.84467441e19);
    if (v9 >= 0.0)
    {
      if (v9 > 0.0)
        v5 += (unint64_t)v9;
    }
    else
    {
      v5 -= (unint64_t)fabs(v9);
    }
  }
  else
  {
    v5 = 0;
  }
  v10 = -[NSString hash](self->_title, "hash");
  v11 = -[NSString hash](self->_notes, "hash");
  has = (char)self->_has;
  if ((has & 0x10) != 0)
  {
    v13 = 2654435761 * self->_isAllDay;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_11;
LABEL_16:
    v18 = 0;
    goto LABEL_19;
  }
  v13 = 0;
  if ((*(_BYTE *)&self->_has & 2) == 0)
    goto LABEL_16;
LABEL_11:
  completionDateTimestamp = self->_completionDateTimestamp;
  v15 = -completionDateTimestamp;
  if (completionDateTimestamp >= 0.0)
    v15 = self->_completionDateTimestamp;
  v16 = floor(v15 + 0.5);
  v17 = (v15 - v16) * 1.84467441e19;
  v18 = 2654435761u * (unint64_t)fmod(v16, 1.84467441e19);
  if (v17 >= 0.0)
  {
    if (v17 > 0.0)
      v18 += (unint64_t)v17;
  }
  else
  {
    v18 -= (unint64_t)fabs(v17);
  }
LABEL_19:
  if ((has & 4) != 0)
  {
    dueDateTimestamp = self->_dueDateTimestamp;
    v21 = -dueDateTimestamp;
    if (dueDateTimestamp >= 0.0)
      v21 = self->_dueDateTimestamp;
    v22 = floor(v21 + 0.5);
    v23 = (v21 - v22) * 1.84467441e19;
    v19 = 2654435761u * (unint64_t)fmod(v22, 1.84467441e19);
    if (v23 >= 0.0)
    {
      if (v23 > 0.0)
        v19 += (unint64_t)v23;
    }
    else
    {
      v19 -= (unint64_t)fabs(v23);
    }
  }
  else
  {
    v19 = 0;
  }
  if ((has & 8) != 0)
    v24 = 2654435761 * self->_priority;
  else
    v24 = 0;
  v25 = v4 ^ v3 ^ v5 ^ v10 ^ v11 ^ v13 ^ v18;
  v26 = v19 ^ v24 ^ -[NSString hash](self->_contentProtection, "hash");
  return v25 ^ v26 ^ -[NSString hash](self->_personaId, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  char v5;
  id v6;

  v4 = a3;
  v6 = v4;
  if (*((_QWORD *)v4 + 10))
  {
    -[BMPBRemindersContentEvent setUniqueId:](self, "setUniqueId:");
    v4 = v6;
  }
  if (*((_QWORD *)v4 + 5))
  {
    -[BMPBRemindersContentEvent setDomainId:](self, "setDomainId:");
    v4 = v6;
  }
  if ((*((_BYTE *)v4 + 92) & 1) != 0)
  {
    self->_absoluteTimestamp = *((double *)v4 + 1);
    *(_BYTE *)&self->_has |= 1u;
  }
  if (*((_QWORD *)v4 + 9))
  {
    -[BMPBRemindersContentEvent setTitle:](self, "setTitle:");
    v4 = v6;
  }
  if (*((_QWORD *)v4 + 6))
  {
    -[BMPBRemindersContentEvent setNotes:](self, "setNotes:");
    v4 = v6;
  }
  v5 = *((_BYTE *)v4 + 92);
  if ((v5 & 0x10) != 0)
  {
    self->_isAllDay = *((_BYTE *)v4 + 88);
    *(_BYTE *)&self->_has |= 0x10u;
    v5 = *((_BYTE *)v4 + 92);
    if ((v5 & 2) == 0)
    {
LABEL_13:
      if ((v5 & 4) == 0)
        goto LABEL_14;
      goto LABEL_23;
    }
  }
  else if ((*((_BYTE *)v4 + 92) & 2) == 0)
  {
    goto LABEL_13;
  }
  self->_completionDateTimestamp = *((double *)v4 + 2);
  *(_BYTE *)&self->_has |= 2u;
  v5 = *((_BYTE *)v4 + 92);
  if ((v5 & 4) == 0)
  {
LABEL_14:
    if ((v5 & 8) == 0)
      goto LABEL_16;
    goto LABEL_15;
  }
LABEL_23:
  self->_dueDateTimestamp = *((double *)v4 + 3);
  *(_BYTE *)&self->_has |= 4u;
  if ((*((_BYTE *)v4 + 92) & 8) != 0)
  {
LABEL_15:
    self->_priority = *((_DWORD *)v4 + 16);
    *(_BYTE *)&self->_has |= 8u;
  }
LABEL_16:
  if (*((_QWORD *)v4 + 4))
  {
    -[BMPBRemindersContentEvent setContentProtection:](self, "setContentProtection:");
    v4 = v6;
  }
  if (*((_QWORD *)v4 + 7))
  {
    -[BMPBRemindersContentEvent setPersonaId:](self, "setPersonaId:");
    v4 = v6;
  }

}

- (NSString)uniqueId
{
  return self->_uniqueId;
}

- (void)setUniqueId:(id)a3
{
  objc_storeStrong((id *)&self->_uniqueId, a3);
}

- (NSString)domainId
{
  return self->_domainId;
}

- (void)setDomainId:(id)a3
{
  objc_storeStrong((id *)&self->_domainId, a3);
}

- (double)absoluteTimestamp
{
  return self->_absoluteTimestamp;
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_storeStrong((id *)&self->_title, a3);
}

- (NSString)notes
{
  return self->_notes;
}

- (void)setNotes:(id)a3
{
  objc_storeStrong((id *)&self->_notes, a3);
}

- (BOOL)isAllDay
{
  return self->_isAllDay;
}

- (double)completionDateTimestamp
{
  return self->_completionDateTimestamp;
}

- (double)dueDateTimestamp
{
  return self->_dueDateTimestamp;
}

- (int)priority
{
  return self->_priority;
}

- (NSString)contentProtection
{
  return self->_contentProtection;
}

- (void)setContentProtection:(id)a3
{
  objc_storeStrong((id *)&self->_contentProtection, a3);
}

- (NSString)personaId
{
  return self->_personaId;
}

- (void)setPersonaId:(id)a3
{
  objc_storeStrong((id *)&self->_personaId, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uniqueId, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_personaId, 0);
  objc_storeStrong((id *)&self->_notes, 0);
  objc_storeStrong((id *)&self->_domainId, 0);
  objc_storeStrong((id *)&self->_contentProtection, 0);
}

@end
