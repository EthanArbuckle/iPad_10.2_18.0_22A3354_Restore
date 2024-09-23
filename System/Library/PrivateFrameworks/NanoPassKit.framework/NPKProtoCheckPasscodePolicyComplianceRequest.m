@implementation NPKProtoCheckPasscodePolicyComplianceRequest

- (int)enforcedPolicy
{
  if ((*(_BYTE *)&self->_has & 1) != 0)
    return self->_enforcedPolicy;
  else
    return 0;
}

- (void)setEnforcedPolicy:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_enforcedPolicy = a3;
}

- (void)setHasEnforcedPolicy:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasEnforcedPolicy
{
  return *(_BYTE *)&self->_has & 1;
}

- (id)enforcedPolicyAsString:(int)a3
{
  if (!a3)
    return CFSTR("China");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsEnforcedPolicy:(id)a3
{
  objc_msgSend(a3, "isEqualToString:", CFSTR("China"));
  return 0;
}

- (void)setApplyRestrictions:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_applyRestrictions = a3;
}

- (void)setHasApplyRestrictions:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasApplyRestrictions
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setApplyBackgroundEnforcementIfNecessary:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_applyBackgroundEnforcementIfNecessary = a3;
}

- (void)setHasApplyBackgroundEnforcementIfNecessary:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasApplyBackgroundEnforcementIfNecessary
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
  v8.super_class = (Class)NPKProtoCheckPasscodePolicyComplianceRequest;
  -[NPKProtoCheckPasscodePolicyComplianceRequest description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPKProtoCheckPasscodePolicyComplianceRequest dictionaryRepresentation](self, "dictionaryRepresentation");
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
  __CFString *v7;
  void *v8;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = (char)self->_has;
  if ((has & 1) == 0)
  {
    if ((*(_BYTE *)&self->_has & 4) == 0)
      goto LABEL_3;
LABEL_10:
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_applyRestrictions);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("applyRestrictions"));

    if ((*(_BYTE *)&self->_has & 2) == 0)
      return v3;
    goto LABEL_4;
  }
  if (self->_enforcedPolicy)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_enforcedPolicy);
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = CFSTR("China");
  }
  objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("enforcedPolicy"));

  has = (char)self->_has;
  if ((has & 4) != 0)
    goto LABEL_10;
LABEL_3:
  if ((has & 2) != 0)
  {
LABEL_4:
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_applyBackgroundEnforcementIfNecessary);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("applyBackgroundEnforcementIfNecessary"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return NPKProtoCheckPasscodePolicyComplianceRequestReadFrom((uint64_t)self, (uint64_t)a3);
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
    PBDataWriterWriteBOOLField();
    v4 = v6;
    if ((*(_BYTE *)&self->_has & 2) == 0)
      goto LABEL_5;
    goto LABEL_4;
  }
  PBDataWriterWriteInt32Field();
  v4 = v6;
  has = (char)self->_has;
  if ((has & 4) != 0)
    goto LABEL_7;
LABEL_3:
  if ((has & 2) != 0)
  {
LABEL_4:
    PBDataWriterWriteBOOLField();
    v4 = v6;
  }
LABEL_5:

}

- (void)copyTo:(id)a3
{
  _BYTE *v4;
  char has;

  v4 = a3;
  has = (char)self->_has;
  if ((has & 1) == 0)
  {
    if ((*(_BYTE *)&self->_has & 4) == 0)
      goto LABEL_3;
LABEL_7:
    v4[13] = self->_applyRestrictions;
    v4[16] |= 4u;
    if ((*(_BYTE *)&self->_has & 2) == 0)
      goto LABEL_5;
    goto LABEL_4;
  }
  *((_DWORD *)v4 + 2) = self->_enforcedPolicy;
  v4[16] |= 1u;
  has = (char)self->_has;
  if ((has & 4) != 0)
    goto LABEL_7;
LABEL_3:
  if ((has & 2) != 0)
  {
LABEL_4:
    v4[12] = self->_applyBackgroundEnforcementIfNecessary;
    v4[16] |= 2u;
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
    *((_DWORD *)result + 2) = self->_enforcedPolicy;
    *((_BYTE *)result + 16) |= 1u;
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
  *((_BYTE *)result + 13) = self->_applyRestrictions;
  *((_BYTE *)result + 16) |= 4u;
  if ((*(_BYTE *)&self->_has & 2) == 0)
    return result;
LABEL_4:
  *((_BYTE *)result + 12) = self->_applyBackgroundEnforcementIfNecessary;
  *((_BYTE *)result + 16) |= 2u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_17;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 16) & 1) == 0 || self->_enforcedPolicy != *((_DWORD *)v4 + 2))
      goto LABEL_17;
  }
  else if ((*((_BYTE *)v4 + 16) & 1) != 0)
  {
    goto LABEL_17;
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 16) & 4) == 0)
      goto LABEL_17;
    if (self->_applyRestrictions)
    {
      if (!*((_BYTE *)v4 + 13))
        goto LABEL_17;
    }
    else if (*((_BYTE *)v4 + 13))
    {
      goto LABEL_17;
    }
  }
  else if ((*((_BYTE *)v4 + 16) & 4) != 0)
  {
    goto LABEL_17;
  }
  v5 = (*((_BYTE *)v4 + 16) & 2) == 0;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 16) & 2) != 0)
    {
      if (self->_applyBackgroundEnforcementIfNecessary)
      {
        if (!*((_BYTE *)v4 + 12))
          goto LABEL_17;
      }
      else if (*((_BYTE *)v4 + 12))
      {
        goto LABEL_17;
      }
      v5 = 1;
      goto LABEL_18;
    }
LABEL_17:
    v5 = 0;
  }
LABEL_18:

  return v5;
}

- (unint64_t)hash
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  if ((*(_BYTE *)&self->_has & 1) == 0)
  {
    v2 = 0;
    if ((*(_BYTE *)&self->_has & 4) != 0)
      goto LABEL_3;
LABEL_6:
    v3 = 0;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_4;
LABEL_7:
    v4 = 0;
    return v3 ^ v2 ^ v4;
  }
  v2 = 2654435761 * self->_enforcedPolicy;
  if ((*(_BYTE *)&self->_has & 4) == 0)
    goto LABEL_6;
LABEL_3:
  v3 = 2654435761 * self->_applyRestrictions;
  if ((*(_BYTE *)&self->_has & 2) == 0)
    goto LABEL_7;
LABEL_4:
  v4 = 2654435761 * self->_applyBackgroundEnforcementIfNecessary;
  return v3 ^ v2 ^ v4;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  char v5;

  v4 = a3;
  v5 = *((_BYTE *)v4 + 16);
  if ((v5 & 1) == 0)
  {
    if ((*((_BYTE *)v4 + 16) & 4) == 0)
      goto LABEL_3;
LABEL_7:
    self->_applyRestrictions = *((_BYTE *)v4 + 13);
    *(_BYTE *)&self->_has |= 4u;
    if ((*((_BYTE *)v4 + 16) & 2) == 0)
      goto LABEL_5;
    goto LABEL_4;
  }
  self->_enforcedPolicy = *((_DWORD *)v4 + 2);
  *(_BYTE *)&self->_has |= 1u;
  v5 = *((_BYTE *)v4 + 16);
  if ((v5 & 4) != 0)
    goto LABEL_7;
LABEL_3:
  if ((v5 & 2) != 0)
  {
LABEL_4:
    self->_applyBackgroundEnforcementIfNecessary = *((_BYTE *)v4 + 12);
    *(_BYTE *)&self->_has |= 2u;
  }
LABEL_5:

}

- (BOOL)applyRestrictions
{
  return self->_applyRestrictions;
}

- (BOOL)applyBackgroundEnforcementIfNecessary
{
  return self->_applyBackgroundEnforcementIfNecessary;
}

@end
