@implementation ATXPredictionUpdateCountPBPredictionUpdateCountTracker

- (int)triggerType
{
  if ((*(_BYTE *)&self->_has & 2) != 0)
    return self->_triggerType;
  else
    return 0;
}

- (void)setTriggerType:(int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_triggerType = a3;
}

- (void)setHasTriggerType:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasTriggerType
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (id)triggerTypeAsString:(int)a3
{
  if (a3 < 8)
    return off_1E82E8FA8[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsTriggerType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TRIGGER_TYPE_CTS")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TRIGGER_TYPE_APPLAUNCH")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TRIGGER_TYPE_APPFEEDBACK")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TRIGGER_TYPE_ACTIONFEEDBACK")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TRIGGER_TYPE_HEROAPP")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TRIGGER_TYPE_MAGICALMOMENTS")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TRIGGER_TYPE_OTHER")) & 1) != 0)
  {
    v4 = 6;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("TRIGGER_TYPE_TOTAL")))
  {
    v4 = 7;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (int)clientType
{
  if ((*(_BYTE *)&self->_has & 1) != 0)
    return self->_clientType;
  else
    return 0;
}

- (void)setClientType:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_clientType = a3;
}

- (void)setHasClientType:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasClientType
{
  return *(_BYTE *)&self->_has & 1;
}

- (id)clientTypeAsString:(int)a3
{
  __CFString *v3;

  if (!a3)
    return CFSTR("CLIENT_APP_PREDICTIONS");
  if (a3 == 1)
  {
    v3 = CFSTR("CLIENT_ACTION_PREDICTIONS");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (int)StringAsClientType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CLIENT_APP_PREDICTIONS")) & 1) != 0)
    v4 = 0;
  else
    v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("CLIENT_ACTION_PREDICTIONS"));

  return v4;
}

- (BOOL)hasAbGroup
{
  return self->_abGroup != 0;
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
  v8.super_class = (Class)ATXPredictionUpdateCountPBPredictionUpdateCountTracker;
  -[ATXPredictionUpdateCountPBPredictionUpdateCountTracker description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXPredictionUpdateCountPBPredictionUpdateCountTracker dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  char has;
  uint64_t triggerType;
  __CFString *v6;
  int clientType;
  __CFString *v8;
  NSString *abGroup;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    triggerType = self->_triggerType;
    if (triggerType >= 8)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_triggerType);
      v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v6 = off_1E82E8FA8[triggerType];
    }
    objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("triggerType"));

    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    clientType = self->_clientType;
    if (clientType)
    {
      if (clientType == 1)
      {
        v8 = CFSTR("CLIENT_ACTION_PREDICTIONS");
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_clientType);
        v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      v8 = CFSTR("CLIENT_APP_PREDICTIONS");
    }
    objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("clientType"));

  }
  abGroup = self->_abGroup;
  if (abGroup)
    objc_msgSend(v3, "setObject:forKey:", abGroup, CFSTR("abGroup"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return ATXPredictionUpdateCountPBPredictionUpdateCountTrackerReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  char has;
  id v6;

  v4 = a3;
  has = (char)self->_has;
  v6 = v4;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteInt32Field();
    v4 = v6;
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    PBDataWriterWriteInt32Field();
    v4 = v6;
  }
  if (self->_abGroup)
  {
    PBDataWriterWriteStringField();
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
  if ((has & 2) != 0)
  {
    v4[5] = self->_triggerType;
    *((_BYTE *)v4 + 24) |= 2u;
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    v4[4] = self->_clientType;
    *((_BYTE *)v4 + 24) |= 1u;
  }
  if (self->_abGroup)
  {
    v6 = v4;
    objc_msgSend(v4, "setAbGroup:");
    v4 = v6;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  _QWORD *v6;
  char has;
  uint64_t v8;
  void *v9;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = (_QWORD *)v5;
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *(_DWORD *)(v5 + 20) = self->_triggerType;
    *(_BYTE *)(v5 + 24) |= 2u;
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    *(_DWORD *)(v5 + 16) = self->_clientType;
    *(_BYTE *)(v5 + 24) |= 1u;
  }
  v8 = -[NSString copyWithZone:](self->_abGroup, "copyWithZone:", a3);
  v9 = (void *)v6[1];
  v6[1] = v8;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *abGroup;
  char v6;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_14;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 24) & 2) == 0 || self->_triggerType != *((_DWORD *)v4 + 5))
      goto LABEL_14;
  }
  else if ((*((_BYTE *)v4 + 24) & 2) != 0)
  {
LABEL_14:
    v6 = 0;
    goto LABEL_15;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 24) & 1) == 0 || self->_clientType != *((_DWORD *)v4 + 4))
      goto LABEL_14;
  }
  else if ((*((_BYTE *)v4 + 24) & 1) != 0)
  {
    goto LABEL_14;
  }
  abGroup = self->_abGroup;
  if ((unint64_t)abGroup | *((_QWORD *)v4 + 1))
    v6 = -[NSString isEqual:](abGroup, "isEqual:");
  else
    v6 = 1;
LABEL_15:

  return v6;
}

- (unint64_t)hash
{
  uint64_t v2;
  uint64_t v3;

  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    v2 = 2654435761 * self->_triggerType;
    if ((*(_BYTE *)&self->_has & 1) != 0)
      goto LABEL_3;
LABEL_5:
    v3 = 0;
    return v3 ^ v2 ^ -[NSString hash](self->_abGroup, "hash");
  }
  v2 = 0;
  if ((*(_BYTE *)&self->_has & 1) == 0)
    goto LABEL_5;
LABEL_3:
  v3 = 2654435761 * self->_clientType;
  return v3 ^ v2 ^ -[NSString hash](self->_abGroup, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  char v5;
  id v6;

  v4 = a3;
  v5 = *((_BYTE *)v4 + 24);
  if ((v5 & 2) != 0)
  {
    self->_triggerType = *((_DWORD *)v4 + 5);
    *(_BYTE *)&self->_has |= 2u;
    v5 = *((_BYTE *)v4 + 24);
  }
  if ((v5 & 1) != 0)
  {
    self->_clientType = *((_DWORD *)v4 + 4);
    *(_BYTE *)&self->_has |= 1u;
  }
  if (*((_QWORD *)v4 + 1))
  {
    v6 = v4;
    -[ATXPredictionUpdateCountPBPredictionUpdateCountTracker setAbGroup:](self, "setAbGroup:");
    v4 = v6;
  }

}

- (NSString)abGroup
{
  return self->_abGroup;
}

- (void)setAbGroup:(id)a3
{
  objc_storeStrong((id *)&self->_abGroup, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_abGroup, 0);
}

@end
