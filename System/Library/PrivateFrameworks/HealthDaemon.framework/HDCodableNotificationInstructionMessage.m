@implementation HDCodableNotificationInstructionMessage

- (void)setCurrentCompatibilityVersion:(int64_t)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_currentCompatibilityVersion = a3;
}

- (void)setHasCurrentCompatibilityVersion:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasCurrentCompatibilityVersion
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setMinimumCompatibleVersion:(int64_t)a3
{
  *(_BYTE *)&self->_has |= 0x10u;
  self->_minimumCompatibleVersion = a3;
}

- (void)setHasMinimumCompatibleVersion:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xEF | v3;
}

- (BOOL)hasMinimumCompatibleVersion
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (void)setCreationDateTimeInterval:(double)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_creationDateTimeInterval = a3;
}

- (void)setHasCreationDateTimeInterval:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasCreationDateTimeInterval
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (BOOL)hasSendingDeviceInfo
{
  return self->_sendingDeviceInfo != 0;
}

- (void)setAction:(int64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_action = a3;
}

- (void)setHasAction:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasAction
{
  return *(_BYTE *)&self->_has & 1;
}

- (BOOL)hasClientIdentifier
{
  return self->_clientIdentifier != 0;
}

- (BOOL)hasCategoryIdentifier
{
  return self->_categoryIdentifier != 0;
}

- (void)setExpirationDateTimeInterval:(double)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_expirationDateTimeInterval = a3;
}

- (void)setHasExpirationDateTimeInterval:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasExpirationDateTimeInterval
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (BOOL)hasCriteria
{
  return self->_criteria != 0;
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
  v8.super_class = (Class)HDCodableNotificationInstructionMessage;
  -[HDCodableNotificationInstructionMessage description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDCodableNotificationInstructionMessage dictionaryRepresentation](self, "dictionaryRepresentation");
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
  NSString *sendingDeviceInfo;
  void *v7;
  NSString *clientIdentifier;
  NSString *categoryIdentifier;
  void *v10;
  HDCodableNotificationInstructionCriteria *criteria;
  void *v12;
  void *v14;
  void *v15;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_currentCompatibilityVersion);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v14, CFSTR("currentCompatibilityVersion"));

    has = (char)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_3:
      if ((has & 2) == 0)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  else if ((*(_BYTE *)&self->_has & 0x10) == 0)
  {
    goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_minimumCompatibleVersion);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v15, CFSTR("minimumCompatibleVersion"));

  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
LABEL_4:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_creationDateTimeInterval);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("creationDateTimeInterval"));

  }
LABEL_5:
  sendingDeviceInfo = self->_sendingDeviceInfo;
  if (sendingDeviceInfo)
    objc_msgSend(v3, "setObject:forKey:", sendingDeviceInfo, CFSTR("sendingDeviceInfo"));
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_action);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("action"));

  }
  clientIdentifier = self->_clientIdentifier;
  if (clientIdentifier)
    objc_msgSend(v3, "setObject:forKey:", clientIdentifier, CFSTR("clientIdentifier"));
  categoryIdentifier = self->_categoryIdentifier;
  if (categoryIdentifier)
    objc_msgSend(v3, "setObject:forKey:", categoryIdentifier, CFSTR("categoryIdentifier"));
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_expirationDateTimeInterval);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("expirationDateTimeInterval"));

  }
  criteria = self->_criteria;
  if (criteria)
  {
    -[HDCodableNotificationInstructionCriteria dictionaryRepresentation](criteria, "dictionaryRepresentation");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v12, CFSTR("criteria"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return HDCodableNotificationInstructionMessageReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  char has;
  id v6;

  v4 = a3;
  has = (char)self->_has;
  v6 = v4;
  if ((has & 4) != 0)
  {
    PBDataWriterWriteInt64Field();
    v4 = v6;
    has = (char)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_3:
      if ((has & 2) == 0)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  else if ((*(_BYTE *)&self->_has & 0x10) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteInt64Field();
  v4 = v6;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
LABEL_4:
    PBDataWriterWriteDoubleField();
    v4 = v6;
  }
LABEL_5:
  if (self->_sendingDeviceInfo)
  {
    PBDataWriterWriteStringField();
    v4 = v6;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    PBDataWriterWriteInt64Field();
    v4 = v6;
  }
  if (self->_clientIdentifier)
  {
    PBDataWriterWriteStringField();
    v4 = v6;
  }
  if (self->_categoryIdentifier)
  {
    PBDataWriterWriteStringField();
    v4 = v6;
  }
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    PBDataWriterWriteDoubleField();
    v4 = v6;
  }
  if (self->_criteria)
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
  if ((has & 4) != 0)
  {
    v4[3] = self->_currentCompatibilityVersion;
    *((_BYTE *)v4 + 80) |= 4u;
    has = (char)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_3:
      if ((has & 2) == 0)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  else if ((*(_BYTE *)&self->_has & 0x10) == 0)
  {
    goto LABEL_3;
  }
  v4[5] = self->_minimumCompatibleVersion;
  *((_BYTE *)v4 + 80) |= 0x10u;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
LABEL_4:
    v4[2] = *(_QWORD *)&self->_creationDateTimeInterval;
    *((_BYTE *)v4 + 80) |= 2u;
  }
LABEL_5:
  v6 = v4;
  if (self->_sendingDeviceInfo)
  {
    objc_msgSend(v4, "setSendingDeviceInfo:");
    v4 = v6;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4[1] = self->_action;
    *((_BYTE *)v4 + 80) |= 1u;
  }
  if (self->_clientIdentifier)
  {
    objc_msgSend(v6, "setClientIdentifier:");
    v4 = v6;
  }
  if (self->_categoryIdentifier)
  {
    objc_msgSend(v6, "setCategoryIdentifier:");
    v4 = v6;
  }
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    v4[4] = *(_QWORD *)&self->_expirationDateTimeInterval;
    *((_BYTE *)v4 + 80) |= 8u;
  }
  if (self->_criteria)
  {
    objc_msgSend(v6, "setCriteria:");
    v4 = v6;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  char has;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;
  void *v15;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *(_QWORD *)(v5 + 24) = self->_currentCompatibilityVersion;
    *(_BYTE *)(v5 + 80) |= 4u;
    has = (char)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_3:
      if ((has & 2) == 0)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  else if ((*(_BYTE *)&self->_has & 0x10) == 0)
  {
    goto LABEL_3;
  }
  *(_QWORD *)(v5 + 40) = self->_minimumCompatibleVersion;
  *(_BYTE *)(v5 + 80) |= 0x10u;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
LABEL_4:
    *(double *)(v5 + 16) = self->_creationDateTimeInterval;
    *(_BYTE *)(v5 + 80) |= 2u;
  }
LABEL_5:
  v8 = -[NSString copyWithZone:](self->_sendingDeviceInfo, "copyWithZone:", a3);
  v9 = *(void **)(v6 + 72);
  *(_QWORD *)(v6 + 72) = v8;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_QWORD *)(v6 + 8) = self->_action;
    *(_BYTE *)(v6 + 80) |= 1u;
  }
  v10 = -[NSString copyWithZone:](self->_clientIdentifier, "copyWithZone:", a3);
  v11 = *(void **)(v6 + 56);
  *(_QWORD *)(v6 + 56) = v10;

  v12 = -[NSString copyWithZone:](self->_categoryIdentifier, "copyWithZone:", a3);
  v13 = *(void **)(v6 + 48);
  *(_QWORD *)(v6 + 48) = v12;

  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    *(double *)(v6 + 32) = self->_expirationDateTimeInterval;
    *(_BYTE *)(v6 + 80) |= 8u;
  }
  v14 = -[HDCodableNotificationInstructionCriteria copyWithZone:](self->_criteria, "copyWithZone:", a3);
  v15 = *(void **)(v6 + 64);
  *(_QWORD *)(v6 + 64) = v14;

  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  char has;
  char v6;
  NSString *sendingDeviceInfo;
  NSString *clientIdentifier;
  NSString *categoryIdentifier;
  HDCodableNotificationInstructionCriteria *criteria;
  char v11;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_36;
  has = (char)self->_has;
  v6 = *((_BYTE *)v4 + 80);
  if ((has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 80) & 4) == 0 || self->_currentCompatibilityVersion != *((_QWORD *)v4 + 3))
      goto LABEL_36;
  }
  else if ((*((_BYTE *)v4 + 80) & 4) != 0)
  {
    goto LABEL_36;
  }
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
    if ((*((_BYTE *)v4 + 80) & 0x10) == 0 || self->_minimumCompatibleVersion != *((_QWORD *)v4 + 5))
      goto LABEL_36;
  }
  else if ((*((_BYTE *)v4 + 80) & 0x10) != 0)
  {
    goto LABEL_36;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 80) & 2) == 0 || self->_creationDateTimeInterval != *((double *)v4 + 2))
      goto LABEL_36;
  }
  else if ((*((_BYTE *)v4 + 80) & 2) != 0)
  {
    goto LABEL_36;
  }
  sendingDeviceInfo = self->_sendingDeviceInfo;
  if ((unint64_t)sendingDeviceInfo | *((_QWORD *)v4 + 9))
  {
    if (!-[NSString isEqual:](sendingDeviceInfo, "isEqual:"))
    {
LABEL_36:
      v11 = 0;
      goto LABEL_37;
    }
    has = (char)self->_has;
    v6 = *((_BYTE *)v4 + 80);
  }
  if ((has & 1) != 0)
  {
    if ((v6 & 1) == 0 || self->_action != *((_QWORD *)v4 + 1))
      goto LABEL_36;
  }
  else if ((v6 & 1) != 0)
  {
    goto LABEL_36;
  }
  clientIdentifier = self->_clientIdentifier;
  if ((unint64_t)clientIdentifier | *((_QWORD *)v4 + 7)
    && !-[NSString isEqual:](clientIdentifier, "isEqual:"))
  {
    goto LABEL_36;
  }
  categoryIdentifier = self->_categoryIdentifier;
  if ((unint64_t)categoryIdentifier | *((_QWORD *)v4 + 6))
  {
    if (!-[NSString isEqual:](categoryIdentifier, "isEqual:"))
      goto LABEL_36;
  }
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    if ((*((_BYTE *)v4 + 80) & 8) == 0 || self->_expirationDateTimeInterval != *((double *)v4 + 4))
      goto LABEL_36;
  }
  else if ((*((_BYTE *)v4 + 80) & 8) != 0)
  {
    goto LABEL_36;
  }
  criteria = self->_criteria;
  if ((unint64_t)criteria | *((_QWORD *)v4 + 8))
    v11 = -[HDCodableNotificationInstructionCriteria isEqual:](criteria, "isEqual:");
  else
    v11 = 1;
LABEL_37:

  return v11;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  double creationDateTimeInterval;
  double v6;
  long double v7;
  double v8;
  unint64_t v9;
  NSUInteger v10;
  uint64_t v11;
  NSUInteger v12;
  NSUInteger v13;
  unint64_t v14;
  double expirationDateTimeInterval;
  double v16;
  long double v17;
  double v18;

  if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    v3 = 0;
    if ((*(_BYTE *)&self->_has & 0x10) != 0)
      goto LABEL_3;
LABEL_9:
    v4 = 0;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_4;
LABEL_10:
    v9 = 0;
    goto LABEL_13;
  }
  v3 = 2654435761 * self->_currentCompatibilityVersion;
  if ((*(_BYTE *)&self->_has & 0x10) == 0)
    goto LABEL_9;
LABEL_3:
  v4 = 2654435761 * self->_minimumCompatibleVersion;
  if ((*(_BYTE *)&self->_has & 2) == 0)
    goto LABEL_10;
LABEL_4:
  creationDateTimeInterval = self->_creationDateTimeInterval;
  v6 = -creationDateTimeInterval;
  if (creationDateTimeInterval >= 0.0)
    v6 = self->_creationDateTimeInterval;
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
LABEL_13:
  v10 = -[NSString hash](self->_sendingDeviceInfo, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v11 = 2654435761 * self->_action;
  else
    v11 = 0;
  v12 = -[NSString hash](self->_clientIdentifier, "hash");
  v13 = -[NSString hash](self->_categoryIdentifier, "hash");
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    expirationDateTimeInterval = self->_expirationDateTimeInterval;
    v16 = -expirationDateTimeInterval;
    if (expirationDateTimeInterval >= 0.0)
      v16 = self->_expirationDateTimeInterval;
    v17 = floor(v16 + 0.5);
    v18 = (v16 - v17) * 1.84467441e19;
    v14 = 2654435761u * (unint64_t)fmod(v17, 1.84467441e19);
    if (v18 >= 0.0)
    {
      if (v18 > 0.0)
        v14 += (unint64_t)v18;
    }
    else
    {
      v14 -= (unint64_t)fabs(v18);
    }
  }
  else
  {
    v14 = 0;
  }
  return v4 ^ v3 ^ v9 ^ v11 ^ v10 ^ v12 ^ v13 ^ v14 ^ -[HDCodableNotificationInstructionCriteria hash](self->_criteria, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  id v5;
  char v6;
  HDCodableNotificationInstructionCriteria *criteria;
  uint64_t v8;
  id v9;

  v4 = a3;
  v5 = v4;
  v6 = *((_BYTE *)v4 + 80);
  if ((v6 & 4) != 0)
  {
    self->_currentCompatibilityVersion = *((_QWORD *)v4 + 3);
    *(_BYTE *)&self->_has |= 4u;
    v6 = *((_BYTE *)v4 + 80);
    if ((v6 & 0x10) == 0)
    {
LABEL_3:
      if ((v6 & 2) == 0)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  else if ((*((_BYTE *)v4 + 80) & 0x10) == 0)
  {
    goto LABEL_3;
  }
  self->_minimumCompatibleVersion = *((_QWORD *)v4 + 5);
  *(_BYTE *)&self->_has |= 0x10u;
  if ((*((_BYTE *)v4 + 80) & 2) != 0)
  {
LABEL_4:
    self->_creationDateTimeInterval = *((double *)v4 + 2);
    *(_BYTE *)&self->_has |= 2u;
  }
LABEL_5:
  v9 = v4;
  if (*((_QWORD *)v4 + 9))
  {
    -[HDCodableNotificationInstructionMessage setSendingDeviceInfo:](self, "setSendingDeviceInfo:");
    v5 = v9;
  }
  if ((*((_BYTE *)v5 + 80) & 1) != 0)
  {
    self->_action = *((_QWORD *)v5 + 1);
    *(_BYTE *)&self->_has |= 1u;
  }
  if (*((_QWORD *)v5 + 7))
  {
    -[HDCodableNotificationInstructionMessage setClientIdentifier:](self, "setClientIdentifier:");
    v5 = v9;
  }
  if (*((_QWORD *)v5 + 6))
  {
    -[HDCodableNotificationInstructionMessage setCategoryIdentifier:](self, "setCategoryIdentifier:");
    v5 = v9;
  }
  if ((*((_BYTE *)v5 + 80) & 8) != 0)
  {
    self->_expirationDateTimeInterval = *((double *)v5 + 4);
    *(_BYTE *)&self->_has |= 8u;
  }
  criteria = self->_criteria;
  v8 = *((_QWORD *)v5 + 8);
  if (criteria)
  {
    if (v8)
    {
      -[HDCodableNotificationInstructionCriteria mergeFrom:](criteria, "mergeFrom:");
LABEL_23:
      v5 = v9;
    }
  }
  else if (v8)
  {
    -[HDCodableNotificationInstructionMessage setCriteria:](self, "setCriteria:");
    goto LABEL_23;
  }

}

- (int64_t)currentCompatibilityVersion
{
  return self->_currentCompatibilityVersion;
}

- (int64_t)minimumCompatibleVersion
{
  return self->_minimumCompatibleVersion;
}

- (double)creationDateTimeInterval
{
  return self->_creationDateTimeInterval;
}

- (NSString)sendingDeviceInfo
{
  return self->_sendingDeviceInfo;
}

- (void)setSendingDeviceInfo:(id)a3
{
  objc_storeStrong((id *)&self->_sendingDeviceInfo, a3);
}

- (int64_t)action
{
  return self->_action;
}

- (NSString)clientIdentifier
{
  return self->_clientIdentifier;
}

- (void)setClientIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_clientIdentifier, a3);
}

- (NSString)categoryIdentifier
{
  return self->_categoryIdentifier;
}

- (void)setCategoryIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_categoryIdentifier, a3);
}

- (double)expirationDateTimeInterval
{
  return self->_expirationDateTimeInterval;
}

- (HDCodableNotificationInstructionCriteria)criteria
{
  return self->_criteria;
}

- (void)setCriteria:(id)a3
{
  objc_storeStrong((id *)&self->_criteria, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sendingDeviceInfo, 0);
  objc_storeStrong((id *)&self->_criteria, 0);
  objc_storeStrong((id *)&self->_clientIdentifier, 0);
  objc_storeStrong((id *)&self->_categoryIdentifier, 0);
}

@end
