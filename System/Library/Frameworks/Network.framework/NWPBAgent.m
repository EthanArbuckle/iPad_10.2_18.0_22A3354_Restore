@implementation NWPBAgent

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)NWPBAgent;
  -[NWPBAgent description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NWPBAgent dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  NWPBAgentClass *agentClass;
  void *v5;
  NSString *agentIdentifier;
  NSString *agentDescription;
  char has;
  void *v9;
  NSData *agentData;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  agentClass = self->_agentClass;
  if (agentClass)
  {
    -[NWPBAgentClass dictionaryRepresentation](agentClass, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("agentClass"));

  }
  agentIdentifier = self->_agentIdentifier;
  if (agentIdentifier)
    objc_msgSend(v3, "setObject:forKey:", agentIdentifier, CFSTR("agentIdentifier"));
  agentDescription = self->_agentDescription;
  if (agentDescription)
    objc_msgSend(v3, "setObject:forKey:", agentDescription, CFSTR("agentDescription"));
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_active);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v12, CFSTR("active"));

    has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_9:
      if ((has & 0x10) == 0)
        goto LABEL_10;
      goto LABEL_18;
    }
  }
  else if ((*(_BYTE *)&self->_has & 8) == 0)
  {
    goto LABEL_9;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_userActivated);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v13, CFSTR("userActivated"));

  has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_10:
    if ((has & 2) == 0)
      goto LABEL_11;
    goto LABEL_19;
  }
LABEL_18:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_voluntary);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v14, CFSTR("voluntary"));

  has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_11:
    if ((has & 4) == 0)
      goto LABEL_13;
    goto LABEL_12;
  }
LABEL_19:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_networkProvider);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v15, CFSTR("networkProvider"));

  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
LABEL_12:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_nexusProvider);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("nexusProvider"));

  }
LABEL_13:
  agentData = self->_agentData;
  if (agentData)
    objc_msgSend(v3, "setObject:forKey:", agentData, CFSTR("agentData"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return NWPBAgentReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  char has;
  id v6;

  v4 = a3;
  v6 = v4;
  if (self->_agentClass)
  {
    PBDataWriterWriteSubmessage();
    v4 = v6;
  }
  if (self->_agentIdentifier)
  {
    PBDataWriterWriteStringField();
    v4 = v6;
  }
  if (self->_agentDescription)
  {
    PBDataWriterWriteStringField();
    v4 = v6;
  }
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteBOOLField();
    v4 = v6;
    has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_9:
      if ((has & 0x10) == 0)
        goto LABEL_10;
      goto LABEL_18;
    }
  }
  else if ((*(_BYTE *)&self->_has & 8) == 0)
  {
    goto LABEL_9;
  }
  PBDataWriterWriteBOOLField();
  v4 = v6;
  has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_10:
    if ((has & 2) == 0)
      goto LABEL_11;
    goto LABEL_19;
  }
LABEL_18:
  PBDataWriterWriteBOOLField();
  v4 = v6;
  has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_11:
    if ((has & 4) == 0)
      goto LABEL_13;
    goto LABEL_12;
  }
LABEL_19:
  PBDataWriterWriteBOOLField();
  v4 = v6;
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
LABEL_12:
    PBDataWriterWriteBOOLField();
    v4 = v6;
  }
LABEL_13:
  if (self->_agentData)
  {
    PBDataWriterWriteDataField();
    v4 = v6;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  char has;
  uint64_t v13;
  void *v14;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NWPBAgentClass copyWithZone:](self->_agentClass, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 8);
  *(_QWORD *)(v5 + 8) = v6;

  v8 = -[NSString copyWithZone:](self->_agentIdentifier, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v8;

  v10 = -[NSString copyWithZone:](self->_agentDescription, "copyWithZone:", a3);
  v11 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v10;

  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    *(_BYTE *)(v5 + 40) = self->_active;
    *(_BYTE *)(v5 + 48) |= 1u;
    has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 0x10) == 0)
        goto LABEL_4;
      goto LABEL_10;
    }
  }
  else if ((*(_BYTE *)&self->_has & 8) == 0)
  {
    goto LABEL_3;
  }
  *(_BYTE *)(v5 + 43) = self->_userActivated;
  *(_BYTE *)(v5 + 48) |= 8u;
  has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_4:
    if ((has & 2) == 0)
      goto LABEL_5;
LABEL_11:
    *(_BYTE *)(v5 + 41) = self->_networkProvider;
    *(_BYTE *)(v5 + 48) |= 2u;
    if ((*(_BYTE *)&self->_has & 4) == 0)
      goto LABEL_7;
    goto LABEL_6;
  }
LABEL_10:
  *(_BYTE *)(v5 + 44) = self->_voluntary;
  *(_BYTE *)(v5 + 48) |= 0x10u;
  has = (char)self->_has;
  if ((has & 2) != 0)
    goto LABEL_11;
LABEL_5:
  if ((has & 4) != 0)
  {
LABEL_6:
    *(_BYTE *)(v5 + 42) = self->_nexusProvider;
    *(_BYTE *)(v5 + 48) |= 4u;
  }
LABEL_7:
  v13 = -[NSData copyWithZone:](self->_agentData, "copyWithZone:", a3);
  v14 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v13;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NWPBAgentClass *agentClass;
  NSString *agentIdentifier;
  NSString *agentDescription;
  char v8;
  NSData *agentData;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_44;
  agentClass = self->_agentClass;
  if ((unint64_t)agentClass | *((_QWORD *)v4 + 1))
  {
    if (!-[NWPBAgentClass isEqual:](agentClass, "isEqual:"))
      goto LABEL_44;
  }
  agentIdentifier = self->_agentIdentifier;
  if ((unint64_t)agentIdentifier | *((_QWORD *)v4 + 4))
  {
    if (!-[NSString isEqual:](agentIdentifier, "isEqual:"))
      goto LABEL_44;
  }
  agentDescription = self->_agentDescription;
  if ((unint64_t)agentDescription | *((_QWORD *)v4 + 3))
  {
    if (!-[NSString isEqual:](agentDescription, "isEqual:"))
      goto LABEL_44;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 48) & 1) == 0)
      goto LABEL_44;
    if (self->_active)
    {
      if (!*((_BYTE *)v4 + 40))
        goto LABEL_44;
    }
    else if (*((_BYTE *)v4 + 40))
    {
      goto LABEL_44;
    }
  }
  else if ((*((_BYTE *)v4 + 48) & 1) != 0)
  {
    goto LABEL_44;
  }
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    if ((*((_BYTE *)v4 + 48) & 8) == 0)
      goto LABEL_44;
    if (self->_userActivated)
    {
      if (!*((_BYTE *)v4 + 43))
        goto LABEL_44;
    }
    else if (*((_BYTE *)v4 + 43))
    {
      goto LABEL_44;
    }
  }
  else if ((*((_BYTE *)v4 + 48) & 8) != 0)
  {
    goto LABEL_44;
  }
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
    if ((*((_BYTE *)v4 + 48) & 0x10) == 0)
      goto LABEL_44;
    if (self->_voluntary)
    {
      if (!*((_BYTE *)v4 + 44))
        goto LABEL_44;
    }
    else if (*((_BYTE *)v4 + 44))
    {
      goto LABEL_44;
    }
  }
  else if ((*((_BYTE *)v4 + 48) & 0x10) != 0)
  {
    goto LABEL_44;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 48) & 2) == 0)
      goto LABEL_44;
    if (self->_networkProvider)
    {
      if (!*((_BYTE *)v4 + 41))
        goto LABEL_44;
    }
    else if (*((_BYTE *)v4 + 41))
    {
      goto LABEL_44;
    }
  }
  else if ((*((_BYTE *)v4 + 48) & 2) != 0)
  {
    goto LABEL_44;
  }
  if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    if ((*((_BYTE *)v4 + 48) & 4) == 0)
      goto LABEL_50;
LABEL_44:
    v8 = 0;
    goto LABEL_45;
  }
  if ((*((_BYTE *)v4 + 48) & 4) == 0)
    goto LABEL_44;
  if (!self->_nexusProvider)
  {
    if (!*((_BYTE *)v4 + 42))
      goto LABEL_50;
    goto LABEL_44;
  }
  if (!*((_BYTE *)v4 + 42))
    goto LABEL_44;
LABEL_50:
  agentData = self->_agentData;
  if ((unint64_t)agentData | *((_QWORD *)v4 + 2))
    v8 = -[NSData isEqual:](agentData, "isEqual:");
  else
    v8 = 1;
LABEL_45:

  return v8;
}

- (unint64_t)hash
{
  unint64_t v3;
  NSUInteger v4;
  NSUInteger v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v3 = -[NWPBAgentClass hash](self->_agentClass, "hash");
  v4 = -[NSString hash](self->_agentIdentifier, "hash");
  v5 = -[NSString hash](self->_agentDescription, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v6 = 2654435761 * self->_active;
    if ((*(_BYTE *)&self->_has & 8) != 0)
    {
LABEL_3:
      v7 = 2654435761 * self->_userActivated;
      if ((*(_BYTE *)&self->_has & 0x10) != 0)
        goto LABEL_4;
      goto LABEL_9;
    }
  }
  else
  {
    v6 = 0;
    if ((*(_BYTE *)&self->_has & 8) != 0)
      goto LABEL_3;
  }
  v7 = 0;
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
LABEL_4:
    v8 = 2654435761 * self->_voluntary;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_5;
LABEL_10:
    v9 = 0;
    if ((*(_BYTE *)&self->_has & 4) != 0)
      goto LABEL_6;
LABEL_11:
    v10 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ -[NSData hash](self->_agentData, "hash");
  }
LABEL_9:
  v8 = 0;
  if ((*(_BYTE *)&self->_has & 2) == 0)
    goto LABEL_10;
LABEL_5:
  v9 = 2654435761 * self->_networkProvider;
  if ((*(_BYTE *)&self->_has & 4) == 0)
    goto LABEL_11;
LABEL_6:
  v10 = 2654435761 * self->_nexusProvider;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ -[NSData hash](self->_agentData, "hash");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_agentIdentifier, 0);
  objc_storeStrong((id *)&self->_agentDescription, 0);
  objc_storeStrong((id *)&self->_agentData, 0);
  objc_storeStrong((id *)&self->_agentClass, 0);
}

@end
