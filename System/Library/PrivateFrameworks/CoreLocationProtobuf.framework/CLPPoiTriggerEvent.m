@implementation CLPPoiTriggerEvent

- (void)setProviderIdentifier:(int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_providerIdentifier = a3;
}

- (void)setHasProviderIdentifier:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasProviderIdentifier
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (int)triggerType
{
  if ((*(_BYTE *)&self->_has & 8) != 0)
    return self->_triggerType;
  else
    return 0;
}

- (void)setTriggerType:(int)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_triggerType = a3;
}

- (void)setHasTriggerType:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasTriggerType
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (id)triggerTypeAsString:(int)a3
{
  if (a3 < 5)
    return *(&off_1E9595C70 + a3);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsTriggerType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Type_Unknown")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Passbook")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Visit")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("VisitSettled")) & 1) != 0)
  {
    v4 = 3;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("Review")))
  {
    v4 = 4;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)setTriggerTimestamp:(double)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_triggerTimestamp = a3;
}

- (void)setHasTriggerTimestamp:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasTriggerTimestamp
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setTriggerSubType:(int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_triggerSubType = a3;
}

- (void)setHasTriggerSubType:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasTriggerSubType
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
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
  v8.super_class = (Class)CLPPoiTriggerEvent;
  -[CLPPoiTriggerEvent description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CLPPoiTriggerEvent dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  char has;
  void *v6;
  void *v8;
  uint64_t triggerType;
  void *v10;
  void *v11;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_muid);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("muid"));

  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_providerIdentifier);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("providerIdentifier"));

    has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 1) == 0)
        goto LABEL_4;
LABEL_12:
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_triggerTimestamp);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKey:", v11, CFSTR("triggerTimestamp"));

      if ((*(_BYTE *)&self->_has & 4) == 0)
        return v3;
      goto LABEL_5;
    }
  }
  else if ((*(_BYTE *)&self->_has & 8) == 0)
  {
    goto LABEL_3;
  }
  triggerType = self->_triggerType;
  if (triggerType >= 5)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_triggerType);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = *(&off_1E9595C70 + triggerType);
  }
  objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("triggerType"));

  has = (char)self->_has;
  if ((has & 1) != 0)
    goto LABEL_12;
LABEL_4:
  if ((has & 4) != 0)
  {
LABEL_5:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_triggerSubType);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("triggerSubType"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return CLPPoiTriggerEventReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has;
  id v5;

  v5 = a3;
  PBDataWriterWriteUint64Field();
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteInt32Field();
    has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 1) == 0)
        goto LABEL_4;
LABEL_9:
      PBDataWriterWriteDoubleField();
      if ((*(_BYTE *)&self->_has & 4) == 0)
        goto LABEL_6;
      goto LABEL_5;
    }
  }
  else if ((*(_BYTE *)&self->_has & 8) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteInt32Field();
  has = (char)self->_has;
  if ((has & 1) != 0)
    goto LABEL_9;
LABEL_4:
  if ((has & 4) != 0)
LABEL_5:
    PBDataWriterWriteInt32Field();
LABEL_6:

}

- (void)copyTo:(id)a3
{
  _QWORD *v4;
  char has;

  v4 = a3;
  v4[1] = self->_muid;
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((_DWORD *)v4 + 6) = self->_providerIdentifier;
    *((_BYTE *)v4 + 36) |= 2u;
    has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 1) == 0)
        goto LABEL_4;
LABEL_9:
      v4[2] = *(_QWORD *)&self->_triggerTimestamp;
      *((_BYTE *)v4 + 36) |= 1u;
      if ((*(_BYTE *)&self->_has & 4) == 0)
        goto LABEL_6;
      goto LABEL_5;
    }
  }
  else if ((*(_BYTE *)&self->_has & 8) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)v4 + 8) = self->_triggerType;
  *((_BYTE *)v4 + 36) |= 8u;
  has = (char)self->_has;
  if ((has & 1) != 0)
    goto LABEL_9;
LABEL_4:
  if ((has & 4) != 0)
  {
LABEL_5:
    *((_DWORD *)v4 + 7) = self->_triggerSubType;
    *((_BYTE *)v4 + 36) |= 4u;
  }
LABEL_6:

}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;
  char has;

  result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *((_QWORD *)result + 1) = self->_muid;
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((_DWORD *)result + 6) = self->_providerIdentifier;
    *((_BYTE *)result + 36) |= 2u;
    has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 1) == 0)
        goto LABEL_4;
      goto LABEL_9;
    }
  }
  else if ((*(_BYTE *)&self->_has & 8) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)result + 8) = self->_triggerType;
  *((_BYTE *)result + 36) |= 8u;
  has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_4:
    if ((has & 4) == 0)
      return result;
    goto LABEL_5;
  }
LABEL_9:
  *((_QWORD *)result + 2) = *(_QWORD *)&self->_triggerTimestamp;
  *((_BYTE *)result + 36) |= 1u;
  if ((*(_BYTE *)&self->_has & 4) == 0)
    return result;
LABEL_5:
  *((_DWORD *)result + 7) = self->_triggerSubType;
  *((_BYTE *)result + 36) |= 4u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()) || self->_muid != *((_QWORD *)v4 + 1))
    goto LABEL_22;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 36) & 2) == 0 || self->_providerIdentifier != *((_DWORD *)v4 + 6))
      goto LABEL_22;
  }
  else if ((*((_BYTE *)v4 + 36) & 2) != 0)
  {
LABEL_22:
    v5 = 0;
    goto LABEL_23;
  }
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    if ((*((_BYTE *)v4 + 36) & 8) == 0 || self->_triggerType != *((_DWORD *)v4 + 8))
      goto LABEL_22;
  }
  else if ((*((_BYTE *)v4 + 36) & 8) != 0)
  {
    goto LABEL_22;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 36) & 1) == 0 || self->_triggerTimestamp != *((double *)v4 + 2))
      goto LABEL_22;
  }
  else if ((*((_BYTE *)v4 + 36) & 1) != 0)
  {
    goto LABEL_22;
  }
  v5 = (*((_BYTE *)v4 + 36) & 4) == 0;
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 36) & 4) == 0 || self->_triggerSubType != *((_DWORD *)v4 + 7))
      goto LABEL_22;
    v5 = 1;
  }
LABEL_23:

  return v5;
}

- (unint64_t)hash
{
  char has;
  uint64_t v4;
  uint64_t v5;
  unint64_t muid;
  unint64_t v7;
  double triggerTimestamp;
  double v9;
  long double v10;
  double v11;
  uint64_t v12;

  has = (char)self->_has;
  if ((has & 2) != 0)
    v4 = 2654435761 * self->_providerIdentifier;
  else
    v4 = 0;
  if ((*(_BYTE *)&self->_has & 8) != 0)
    v5 = 2654435761 * self->_triggerType;
  else
    v5 = 0;
  muid = self->_muid;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    triggerTimestamp = self->_triggerTimestamp;
    v9 = -triggerTimestamp;
    if (triggerTimestamp >= 0.0)
      v9 = self->_triggerTimestamp;
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
    v12 = 2654435761 * self->_triggerSubType;
  else
    v12 = 0;
  return v4 ^ v5 ^ v7 ^ v12 ^ (2654435761u * muid);
}

- (void)mergeFrom:(id)a3
{
  id v4;
  char v5;

  v4 = a3;
  self->_muid = *((_QWORD *)v4 + 1);
  v5 = *((_BYTE *)v4 + 36);
  if ((v5 & 2) != 0)
  {
    self->_providerIdentifier = *((_DWORD *)v4 + 6);
    *(_BYTE *)&self->_has |= 2u;
    v5 = *((_BYTE *)v4 + 36);
    if ((v5 & 8) == 0)
    {
LABEL_3:
      if ((v5 & 1) == 0)
        goto LABEL_4;
LABEL_9:
      self->_triggerTimestamp = *((double *)v4 + 2);
      *(_BYTE *)&self->_has |= 1u;
      if ((*((_BYTE *)v4 + 36) & 4) == 0)
        goto LABEL_6;
      goto LABEL_5;
    }
  }
  else if ((*((_BYTE *)v4 + 36) & 8) == 0)
  {
    goto LABEL_3;
  }
  self->_triggerType = *((_DWORD *)v4 + 8);
  *(_BYTE *)&self->_has |= 8u;
  v5 = *((_BYTE *)v4 + 36);
  if ((v5 & 1) != 0)
    goto LABEL_9;
LABEL_4:
  if ((v5 & 4) != 0)
  {
LABEL_5:
    self->_triggerSubType = *((_DWORD *)v4 + 7);
    *(_BYTE *)&self->_has |= 4u;
  }
LABEL_6:

}

- (unint64_t)muid
{
  return self->_muid;
}

- (void)setMuid:(unint64_t)a3
{
  self->_muid = a3;
}

- (int)providerIdentifier
{
  return self->_providerIdentifier;
}

- (double)triggerTimestamp
{
  return self->_triggerTimestamp;
}

- (int)triggerSubType
{
  return self->_triggerSubType;
}

@end
