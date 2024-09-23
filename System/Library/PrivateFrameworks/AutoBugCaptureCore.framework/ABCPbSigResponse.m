@implementation ABCPbSigResponse

- (BOOL)hasCaseIdentifier
{
  return self->_caseIdentifier != 0;
}

- (void)setCaseCount:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_caseCount = a3;
}

- (void)setHasCaseCount:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasCaseCount
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setCaseCountTarget:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_caseCountTarget = a3;
}

- (void)setHasCaseCountTarget:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasCaseCountTarget
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (BOOL)hasCaseStatus
{
  return self->_caseStatus != 0;
}

- (void)setDecision:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_decision = a3;
}

- (void)setHasDecision:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasDecision
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
  v8.super_class = (Class)ABCPbSigResponse;
  -[ABCPbSigResponse description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ABCPbSigResponse dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *caseIdentifier;
  char has;
  void *v7;
  void *v8;
  NSString *caseStatus;
  void *v10;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  caseIdentifier = self->_caseIdentifier;
  if (caseIdentifier)
    objc_msgSend(v3, "setObject:forKey:", caseIdentifier, CFSTR("case_identifier"));
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_caseCount);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("case_count"));

    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_caseCountTarget);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v8, CFSTR("case_count_target"));

  }
  caseStatus = self->_caseStatus;
  if (caseStatus)
    objc_msgSend(v4, "setObject:forKey:", caseStatus, CFSTR("case_status"));
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_decision);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v10, CFSTR("decision"));

  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return ABCPbSigResponseReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  char has;
  id v6;

  v4 = a3;
  v6 = v4;
  if (self->_caseIdentifier)
  {
    PBDataWriterWriteStringField();
    v4 = v6;
  }
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteUint32Field();
    v4 = v6;
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    PBDataWriterWriteUint32Field();
    v4 = v6;
  }
  if (self->_caseStatus)
  {
    PBDataWriterWriteStringField();
    v4 = v6;
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    PBDataWriterWriteBOOLField();
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
  if (self->_caseIdentifier)
  {
    objc_msgSend(v4, "setCaseIdentifier:");
    v4 = v6;
  }
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    *((_DWORD *)v4 + 2) = self->_caseCount;
    *((_BYTE *)v4 + 36) |= 1u;
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *((_DWORD *)v4 + 3) = self->_caseCountTarget;
    *((_BYTE *)v4 + 36) |= 2u;
  }
  if (self->_caseStatus)
  {
    objc_msgSend(v6, "setCaseStatus:");
    v4 = v6;
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    *((_BYTE *)v4 + 32) = self->_decision;
    *((_BYTE *)v4 + 36) |= 4u;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  char has;
  uint64_t v9;
  void *v10;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_caseIdentifier, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v6;

  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    *(_DWORD *)(v5 + 8) = self->_caseCount;
    *(_BYTE *)(v5 + 36) |= 1u;
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *(_DWORD *)(v5 + 12) = self->_caseCountTarget;
    *(_BYTE *)(v5 + 36) |= 2u;
  }
  v9 = -[NSString copyWithZone:](self->_caseStatus, "copyWithZone:", a3);
  v10 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v9;

  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    *(_BYTE *)(v5 + 32) = self->_decision;
    *(_BYTE *)(v5 + 36) |= 4u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *caseIdentifier;
  char has;
  NSString *caseStatus;
  BOOL v8;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_19;
  caseIdentifier = self->_caseIdentifier;
  if ((unint64_t)caseIdentifier | *((_QWORD *)v4 + 2))
  {
    if (!-[NSString isEqual:](caseIdentifier, "isEqual:"))
      goto LABEL_19;
  }
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 36) & 1) == 0 || self->_caseCount != *((_DWORD *)v4 + 2))
      goto LABEL_19;
  }
  else if ((*((_BYTE *)v4 + 36) & 1) != 0)
  {
    goto LABEL_19;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 36) & 2) == 0 || self->_caseCountTarget != *((_DWORD *)v4 + 3))
      goto LABEL_19;
  }
  else if ((*((_BYTE *)v4 + 36) & 2) != 0)
  {
    goto LABEL_19;
  }
  caseStatus = self->_caseStatus;
  if ((unint64_t)caseStatus | *((_QWORD *)v4 + 3))
  {
    if (!-[NSString isEqual:](caseStatus, "isEqual:"))
      goto LABEL_19;
    has = (char)self->_has;
  }
  v8 = (*((_BYTE *)v4 + 36) & 4) == 0;
  if ((has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 36) & 4) != 0)
    {
      if (self->_decision)
      {
        if (!*((_BYTE *)v4 + 32))
          goto LABEL_19;
      }
      else if (*((_BYTE *)v4 + 32))
      {
        goto LABEL_19;
      }
      v8 = 1;
      goto LABEL_20;
    }
LABEL_19:
    v8 = 0;
  }
LABEL_20:

  return v8;
}

- (unint64_t)hash
{
  NSUInteger v3;
  uint64_t v4;
  uint64_t v5;
  NSUInteger v6;
  uint64_t v7;

  v3 = -[NSString hash](self->_caseIdentifier, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4 = 2654435761 * self->_caseCount;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_3;
  }
  else
  {
    v4 = 0;
    if ((*(_BYTE *)&self->_has & 2) != 0)
    {
LABEL_3:
      v5 = 2654435761 * self->_caseCountTarget;
      goto LABEL_6;
    }
  }
  v5 = 0;
LABEL_6:
  v6 = -[NSString hash](self->_caseStatus, "hash");
  if ((*(_BYTE *)&self->_has & 4) != 0)
    v7 = 2654435761 * self->_decision;
  else
    v7 = 0;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  char v5;
  id v6;

  v4 = a3;
  v6 = v4;
  if (*((_QWORD *)v4 + 2))
  {
    -[ABCPbSigResponse setCaseIdentifier:](self, "setCaseIdentifier:");
    v4 = v6;
  }
  v5 = *((_BYTE *)v4 + 36);
  if ((v5 & 1) != 0)
  {
    self->_caseCount = *((_DWORD *)v4 + 2);
    *(_BYTE *)&self->_has |= 1u;
    v5 = *((_BYTE *)v4 + 36);
  }
  if ((v5 & 2) != 0)
  {
    self->_caseCountTarget = *((_DWORD *)v4 + 3);
    *(_BYTE *)&self->_has |= 2u;
  }
  if (*((_QWORD *)v4 + 3))
  {
    -[ABCPbSigResponse setCaseStatus:](self, "setCaseStatus:");
    v4 = v6;
  }
  if ((*((_BYTE *)v4 + 36) & 4) != 0)
  {
    self->_decision = *((_BYTE *)v4 + 32);
    *(_BYTE *)&self->_has |= 4u;
  }

}

- (NSString)caseIdentifier
{
  return self->_caseIdentifier;
}

- (void)setCaseIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_caseIdentifier, a3);
}

- (unsigned)caseCount
{
  return self->_caseCount;
}

- (unsigned)caseCountTarget
{
  return self->_caseCountTarget;
}

- (NSString)caseStatus
{
  return self->_caseStatus;
}

- (void)setCaseStatus:(id)a3
{
  objc_storeStrong((id *)&self->_caseStatus, a3);
}

- (BOOL)decision
{
  return self->_decision;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_caseStatus, 0);
  objc_storeStrong((id *)&self->_caseIdentifier, 0);
}

@end
