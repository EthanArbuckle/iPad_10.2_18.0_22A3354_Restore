@implementation AWDHomeKitPresenceEvent

- (int)presenceEventType
{
  if ((*(_BYTE *)&self->_has & 2) != 0)
    return self->_presenceEventType;
  else
    return 1;
}

- (void)setPresenceEventType:(int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_presenceEventType = a3;
}

- (void)setHasPresenceEventType:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasPresenceEventType
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (id)presenceEventTypeAsString:(int)a3
{
  if ((a3 - 1) < 4)
    return off_24E7786D0[a3 - 1];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsPresenceEventType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("HomeKitPresenceEventTypeUsersAtHome")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("HomeKitPresenceEventTypeUsersNotAtHome")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("HomeKitPresenceEventTypeAnyUserAtHome")) & 1) != 0)
  {
    v4 = 3;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("HomeKitPresenceEventTypeNoUserAtHome")))
  {
    v4 = 4;
  }
  else
  {
    v4 = 1;
  }

  return v4;
}

- (int)presenceEventGranularity
{
  if ((*(_BYTE *)&self->_has & 1) != 0)
    return self->_presenceEventGranularity;
  else
    return 1;
}

- (void)setPresenceEventGranularity:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_presenceEventGranularity = a3;
}

- (void)setHasPresenceEventGranularity:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasPresenceEventGranularity
{
  return *(_BYTE *)&self->_has & 1;
}

- (id)presenceEventGranularityAsString:(int)a3
{
  __CFString *v3;

  if (a3 == 1)
    return CFSTR("HomeKitPresenceEventActivationGranularityUser");
  if (a3 == 2)
  {
    v3 = CFSTR("HomeKitPresenceEventActivationGranularityHome");
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (int)StringAsPresenceEventGranularity:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  v4 = 1;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("HomeKitPresenceEventActivationGranularityUser")) & 1) == 0)
  {
    if (objc_msgSend(v3, "isEqualToString:", CFSTR("HomeKitPresenceEventActivationGranularityHome")))
      v4 = 2;
    else
      v4 = 1;
  }

  return v4;
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
  v8.super_class = (Class)AWDHomeKitPresenceEvent;
  -[AWDHomeKitPresenceEvent description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AWDHomeKitPresenceEvent dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  char has;
  unsigned int v5;
  __CFString *v6;
  int presenceEventGranularity;
  __CFString *v8;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v5 = self->_presenceEventType - 1;
    if (v5 >= 4)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_presenceEventType);
      v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v6 = off_24E7786D0[v5];
    }
    objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("presenceEventType"));

    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    presenceEventGranularity = self->_presenceEventGranularity;
    if (presenceEventGranularity == 1)
    {
      v8 = CFSTR("HomeKitPresenceEventActivationGranularityUser");
    }
    else if (presenceEventGranularity == 2)
    {
      v8 = CFSTR("HomeKitPresenceEventActivationGranularityHome");
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_presenceEventGranularity);
      v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("presenceEventGranularity"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDHomeKitPresenceEventReadFrom((uint64_t)self, (uint64_t)a3);
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

}

- (void)copyTo:(id)a3
{
  _DWORD *v4;
  char has;

  v4 = a3;
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v4[3] = self->_presenceEventType;
    *((_BYTE *)v4 + 16) |= 2u;
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    v4[2] = self->_presenceEventGranularity;
    *((_BYTE *)v4 + 16) |= 1u;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;
  char has;

  result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((_DWORD *)result + 3) = self->_presenceEventType;
    *((_BYTE *)result + 16) |= 2u;
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    *((_DWORD *)result + 2) = self->_presenceEventGranularity;
    *((_BYTE *)result + 16) |= 1u;
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_11;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 16) & 2) == 0 || self->_presenceEventType != *((_DWORD *)v4 + 3))
      goto LABEL_11;
  }
  else if ((*((_BYTE *)v4 + 16) & 2) != 0)
  {
LABEL_11:
    v5 = 0;
    goto LABEL_12;
  }
  v5 = (*((_BYTE *)v4 + 16) & 1) == 0;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 16) & 1) == 0 || self->_presenceEventGranularity != *((_DWORD *)v4 + 2))
      goto LABEL_11;
    v5 = 1;
  }
LABEL_12:

  return v5;
}

- (unint64_t)hash
{
  uint64_t v2;
  uint64_t v3;

  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    v2 = 2654435761 * self->_presenceEventType;
    if ((*(_BYTE *)&self->_has & 1) != 0)
      goto LABEL_3;
LABEL_5:
    v3 = 0;
    return v3 ^ v2;
  }
  v2 = 0;
  if ((*(_BYTE *)&self->_has & 1) == 0)
    goto LABEL_5;
LABEL_3:
  v3 = 2654435761 * self->_presenceEventGranularity;
  return v3 ^ v2;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  char v5;

  v4 = a3;
  v5 = *((_BYTE *)v4 + 16);
  if ((v5 & 2) != 0)
  {
    self->_presenceEventType = *((_DWORD *)v4 + 3);
    *(_BYTE *)&self->_has |= 2u;
    v5 = *((_BYTE *)v4 + 16);
  }
  if ((v5 & 1) != 0)
  {
    self->_presenceEventGranularity = *((_DWORD *)v4 + 2);
    *(_BYTE *)&self->_has |= 1u;
  }

}

@end
