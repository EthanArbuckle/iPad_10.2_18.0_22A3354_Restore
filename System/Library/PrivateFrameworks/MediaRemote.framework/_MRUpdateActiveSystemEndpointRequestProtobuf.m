@implementation _MRUpdateActiveSystemEndpointRequestProtobuf

- (BOOL)hasOutputDeviceUID
{
  return self->_outputDeviceUID != 0;
}

- (int)changeType
{
  if ((*(_BYTE *)&self->_has & 4) != 0)
    return self->_changeType;
  else
    return 0;
}

- (void)setChangeType:(int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_changeType = a3;
}

- (void)setHasChangeType:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasChangeType
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (id)changeTypeAsString:(int)a3
{
  __CFString *v3;

  if (!a3)
    return CFSTR("Immediate");
  if (a3 == 1)
  {
    v3 = CFSTR("Deferrable");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (int)StringAsChangeType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Immediate")) & 1) != 0)
    v4 = 0;
  else
    v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("Deferrable"));

  return v4;
}

- (BOOL)hasReason
{
  return self->_reason != 0;
}

- (void)setPairedDeviceSync:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 0x10u;
  self->_pairedDeviceSync = a3;
}

- (void)setHasPairedDeviceSync:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xEF | v3;
}

- (BOOL)hasPairedDeviceSync
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (void)setType:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_type = a3;
}

- (void)setHasType:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasType
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setDisableDuration:(double)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_disableDuration = a3;
}

- (void)setHasDisableDuration:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasDisableDuration
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setDemoteWhenSyncingToCompanion:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_demoteWhenSyncingToCompanion = a3;
}

- (void)setHasDemoteWhenSyncingToCompanion:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasDemoteWhenSyncingToCompanion
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
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
  v8.super_class = (Class)_MRUpdateActiveSystemEndpointRequestProtobuf;
  -[_MRUpdateActiveSystemEndpointRequestProtobuf description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MRUpdateActiveSystemEndpointRequestProtobuf dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *outputDeviceUID;
  int changeType;
  __CFString *v7;
  NSString *reason;
  char has;
  void *v10;
  void *v12;
  void *v13;
  void *v14;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  outputDeviceUID = self->_outputDeviceUID;
  if (outputDeviceUID)
    objc_msgSend(v3, "setObject:forKey:", outputDeviceUID, CFSTR("outputDeviceUID"));
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    changeType = self->_changeType;
    if (changeType)
    {
      if (changeType == 1)
      {
        v7 = CFSTR("Deferrable");
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_changeType);
        v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      v7 = CFSTR("Immediate");
    }
    objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("changeType"));

  }
  reason = self->_reason;
  if (reason)
    objc_msgSend(v4, "setObject:forKey:", reason, CFSTR("reason"));
  has = (char)self->_has;
  if ((has & 0x10) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_pairedDeviceSync);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v12, CFSTR("pairedDeviceSync"));

    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_14:
      if ((has & 1) == 0)
        goto LABEL_15;
LABEL_20:
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_disableDuration);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKey:", v14, CFSTR("disableDuration"));

      if ((*(_BYTE *)&self->_has & 8) == 0)
        return v4;
      goto LABEL_16;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_14;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_type);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v13, CFSTR("type"));

  has = (char)self->_has;
  if ((has & 1) != 0)
    goto LABEL_20;
LABEL_15:
  if ((has & 8) != 0)
  {
LABEL_16:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_demoteWhenSyncingToCompanion);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v10, CFSTR("demoteWhenSyncingToCompanion"));

  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return _MRUpdateActiveSystemEndpointRequestProtobufReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  char has;
  id v6;

  v4 = a3;
  v6 = v4;
  if (self->_outputDeviceUID)
  {
    PBDataWriterWriteStringField();
    v4 = v6;
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    PBDataWriterWriteInt32Field();
    v4 = v6;
  }
  if (self->_reason)
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
LABEL_9:
      if ((has & 1) == 0)
        goto LABEL_10;
LABEL_15:
      PBDataWriterWriteDoubleField();
      v4 = v6;
      if ((*(_BYTE *)&self->_has & 8) == 0)
        goto LABEL_12;
      goto LABEL_11;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_9;
  }
  PBDataWriterWriteUint64Field();
  v4 = v6;
  has = (char)self->_has;
  if ((has & 1) != 0)
    goto LABEL_15;
LABEL_10:
  if ((has & 8) != 0)
  {
LABEL_11:
    PBDataWriterWriteBOOLField();
    v4 = v6;
  }
LABEL_12:

}

- (void)copyTo:(id)a3
{
  id v4;
  char has;
  id v6;

  v4 = a3;
  v6 = v4;
  if (self->_outputDeviceUID)
  {
    objc_msgSend(v4, "setOutputDeviceUID:");
    v4 = v6;
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    *((_DWORD *)v4 + 6) = self->_changeType;
    *((_BYTE *)v4 + 52) |= 4u;
  }
  if (self->_reason)
  {
    objc_msgSend(v6, "setReason:");
    v4 = v6;
  }
  has = (char)self->_has;
  if ((has & 0x10) != 0)
  {
    *((_BYTE *)v4 + 49) = self->_pairedDeviceSync;
    *((_BYTE *)v4 + 52) |= 0x10u;
    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_9:
      if ((has & 1) == 0)
        goto LABEL_10;
LABEL_15:
      *((_QWORD *)v4 + 1) = *(_QWORD *)&self->_disableDuration;
      *((_BYTE *)v4 + 52) |= 1u;
      if ((*(_BYTE *)&self->_has & 8) == 0)
        goto LABEL_12;
      goto LABEL_11;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_9;
  }
  *((_QWORD *)v4 + 2) = self->_type;
  *((_BYTE *)v4 + 52) |= 2u;
  has = (char)self->_has;
  if ((has & 1) != 0)
    goto LABEL_15;
LABEL_10:
  if ((has & 8) != 0)
  {
LABEL_11:
    *((_BYTE *)v4 + 48) = self->_demoteWhenSyncingToCompanion;
    *((_BYTE *)v4 + 52) |= 8u;
  }
LABEL_12:

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  char has;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_outputDeviceUID, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v6;

  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    *(_DWORD *)(v5 + 24) = self->_changeType;
    *(_BYTE *)(v5 + 52) |= 4u;
  }
  v8 = -[NSString copyWithZone:](self->_reason, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v8;

  has = (char)self->_has;
  if ((has & 0x10) != 0)
  {
    *(_BYTE *)(v5 + 49) = self->_pairedDeviceSync;
    *(_BYTE *)(v5 + 52) |= 0x10u;
    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_5:
      if ((has & 1) == 0)
        goto LABEL_6;
LABEL_11:
      *(double *)(v5 + 8) = self->_disableDuration;
      *(_BYTE *)(v5 + 52) |= 1u;
      if ((*(_BYTE *)&self->_has & 8) == 0)
        return (id)v5;
      goto LABEL_7;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_5;
  }
  *(_QWORD *)(v5 + 16) = self->_type;
  *(_BYTE *)(v5 + 52) |= 2u;
  has = (char)self->_has;
  if ((has & 1) != 0)
    goto LABEL_11;
LABEL_6:
  if ((has & 8) != 0)
  {
LABEL_7:
    *(_BYTE *)(v5 + 48) = self->_demoteWhenSyncingToCompanion;
    *(_BYTE *)(v5 + 52) |= 8u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *outputDeviceUID;
  char has;
  NSString *reason;
  BOOL v8;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_32;
  outputDeviceUID = self->_outputDeviceUID;
  if ((unint64_t)outputDeviceUID | *((_QWORD *)v4 + 4))
  {
    if (!-[NSString isEqual:](outputDeviceUID, "isEqual:"))
      goto LABEL_32;
  }
  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 52) & 4) == 0 || self->_changeType != *((_DWORD *)v4 + 6))
      goto LABEL_32;
  }
  else if ((*((_BYTE *)v4 + 52) & 4) != 0)
  {
    goto LABEL_32;
  }
  reason = self->_reason;
  if ((unint64_t)reason | *((_QWORD *)v4 + 5))
  {
    if (!-[NSString isEqual:](reason, "isEqual:"))
      goto LABEL_32;
    has = (char)self->_has;
  }
  if ((has & 0x10) != 0)
  {
    if ((*((_BYTE *)v4 + 52) & 0x10) == 0)
      goto LABEL_32;
    if (self->_pairedDeviceSync)
    {
      if (!*((_BYTE *)v4 + 49))
        goto LABEL_32;
    }
    else if (*((_BYTE *)v4 + 49))
    {
      goto LABEL_32;
    }
  }
  else if ((*((_BYTE *)v4 + 52) & 0x10) != 0)
  {
    goto LABEL_32;
  }
  if ((has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 52) & 2) == 0 || self->_type != *((_QWORD *)v4 + 2))
      goto LABEL_32;
  }
  else if ((*((_BYTE *)v4 + 52) & 2) != 0)
  {
    goto LABEL_32;
  }
  if ((has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 52) & 1) == 0 || self->_disableDuration != *((double *)v4 + 1))
      goto LABEL_32;
  }
  else if ((*((_BYTE *)v4 + 52) & 1) != 0)
  {
    goto LABEL_32;
  }
  v8 = (*((_BYTE *)v4 + 52) & 8) == 0;
  if ((has & 8) != 0)
  {
    if ((*((_BYTE *)v4 + 52) & 8) != 0)
    {
      if (self->_demoteWhenSyncingToCompanion)
      {
        if (!*((_BYTE *)v4 + 48))
          goto LABEL_32;
      }
      else if (*((_BYTE *)v4 + 48))
      {
        goto LABEL_32;
      }
      v8 = 1;
      goto LABEL_33;
    }
LABEL_32:
    v8 = 0;
  }
LABEL_33:

  return v8;
}

- (unint64_t)hash
{
  NSUInteger v3;
  uint64_t v4;
  NSUInteger v5;
  char has;
  uint64_t v7;
  unint64_t v8;
  double disableDuration;
  double v10;
  long double v11;
  double v12;
  unint64_t v13;
  uint64_t v14;

  v3 = -[NSString hash](self->_outputDeviceUID, "hash");
  if ((*(_BYTE *)&self->_has & 4) != 0)
    v4 = 2654435761 * self->_changeType;
  else
    v4 = 0;
  v5 = -[NSString hash](self->_reason, "hash");
  has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
    v7 = 0;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_6;
LABEL_12:
    v8 = 0;
    if ((*(_BYTE *)&self->_has & 1) != 0)
      goto LABEL_7;
LABEL_13:
    v13 = 0;
    goto LABEL_16;
  }
  v7 = 2654435761 * self->_pairedDeviceSync;
  if ((*(_BYTE *)&self->_has & 2) == 0)
    goto LABEL_12;
LABEL_6:
  v8 = 2654435761u * self->_type;
  if ((*(_BYTE *)&self->_has & 1) == 0)
    goto LABEL_13;
LABEL_7:
  disableDuration = self->_disableDuration;
  v10 = -disableDuration;
  if (disableDuration >= 0.0)
    v10 = self->_disableDuration;
  v11 = floor(v10 + 0.5);
  v12 = (v10 - v11) * 1.84467441e19;
  v13 = 2654435761u * (unint64_t)fmod(v11, 1.84467441e19);
  if (v12 >= 0.0)
  {
    if (v12 > 0.0)
      v13 += (unint64_t)v12;
  }
  else
  {
    v13 -= (unint64_t)fabs(v12);
  }
LABEL_16:
  if ((has & 8) != 0)
    v14 = 2654435761 * self->_demoteWhenSyncingToCompanion;
  else
    v14 = 0;
  return v4 ^ v3 ^ v5 ^ v7 ^ v8 ^ v13 ^ v14;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  char v5;
  id v6;

  v4 = a3;
  v6 = v4;
  if (*((_QWORD *)v4 + 4))
  {
    -[_MRUpdateActiveSystemEndpointRequestProtobuf setOutputDeviceUID:](self, "setOutputDeviceUID:");
    v4 = v6;
  }
  if ((*((_BYTE *)v4 + 52) & 4) != 0)
  {
    self->_changeType = *((_DWORD *)v4 + 6);
    *(_BYTE *)&self->_has |= 4u;
  }
  if (*((_QWORD *)v4 + 5))
  {
    -[_MRUpdateActiveSystemEndpointRequestProtobuf setReason:](self, "setReason:");
    v4 = v6;
  }
  v5 = *((_BYTE *)v4 + 52);
  if ((v5 & 0x10) != 0)
  {
    self->_pairedDeviceSync = *((_BYTE *)v4 + 49);
    *(_BYTE *)&self->_has |= 0x10u;
    v5 = *((_BYTE *)v4 + 52);
    if ((v5 & 2) == 0)
    {
LABEL_9:
      if ((v5 & 1) == 0)
        goto LABEL_10;
LABEL_15:
      self->_disableDuration = *((double *)v4 + 1);
      *(_BYTE *)&self->_has |= 1u;
      if ((*((_BYTE *)v4 + 52) & 8) == 0)
        goto LABEL_12;
      goto LABEL_11;
    }
  }
  else if ((*((_BYTE *)v4 + 52) & 2) == 0)
  {
    goto LABEL_9;
  }
  self->_type = *((_QWORD *)v4 + 2);
  *(_BYTE *)&self->_has |= 2u;
  v5 = *((_BYTE *)v4 + 52);
  if ((v5 & 1) != 0)
    goto LABEL_15;
LABEL_10:
  if ((v5 & 8) != 0)
  {
LABEL_11:
    self->_demoteWhenSyncingToCompanion = *((_BYTE *)v4 + 48);
    *(_BYTE *)&self->_has |= 8u;
  }
LABEL_12:

}

- (NSString)outputDeviceUID
{
  return self->_outputDeviceUID;
}

- (void)setOutputDeviceUID:(id)a3
{
  objc_storeStrong((id *)&self->_outputDeviceUID, a3);
}

- (NSString)reason
{
  return self->_reason;
}

- (void)setReason:(id)a3
{
  objc_storeStrong((id *)&self->_reason, a3);
}

- (BOOL)pairedDeviceSync
{
  return self->_pairedDeviceSync;
}

- (unint64_t)type
{
  return self->_type;
}

- (double)disableDuration
{
  return self->_disableDuration;
}

- (BOOL)demoteWhenSyncingToCompanion
{
  return self->_demoteWhenSyncingToCompanion;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reason, 0);
  objc_storeStrong((id *)&self->_outputDeviceUID, 0);
}

@end
