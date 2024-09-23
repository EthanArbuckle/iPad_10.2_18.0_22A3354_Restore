@implementation ATXMPBAnchorModelPhaseFilterTracker

- (int)phaseDescription
{
  if ((*(_BYTE *)&self->_has & 4) != 0)
    return self->_phaseDescription;
  else
    return 1;
}

- (void)setPhaseDescription:(int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_phaseDescription = a3;
}

- (void)setHasPhaseDescription:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasPhaseDescription
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (id)phaseDescriptionAsString:(int)a3
{
  __CFString *v3;

  if (a3 == 1)
    return CFSTR("First");
  if (a3 == 2)
  {
    v3 = CFSTR("Second");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (int)StringAsPhaseDescription:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  v4 = 1;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("First")) & 1) == 0)
  {
    if (objc_msgSend(v3, "isEqualToString:", CFSTR("Second")))
      v4 = 2;
    else
      v4 = 1;
  }

  return v4;
}

- (BOOL)hasPhaseType
{
  return self->_phaseType != 0;
}

- (void)setNumStartingCandidates:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_numStartingCandidates = a3;
}

- (void)setHasNumStartingCandidates:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasNumStartingCandidates
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setNumEndingCandidates:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_numEndingCandidates = a3;
}

- (void)setHasNumEndingCandidates:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasNumEndingCandidates
{
  return *(_BYTE *)&self->_has & 1;
}

- (BOOL)hasAnchorType
{
  return self->_anchorType != 0;
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
  v8.super_class = (Class)ATXMPBAnchorModelPhaseFilterTracker;
  -[ATXMPBAnchorModelPhaseFilterTracker description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXMPBAnchorModelPhaseFilterTracker dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  int phaseDescription;
  __CFString *v5;
  NSString *phaseType;
  char has;
  void *v8;
  void *v9;
  NSString *anchorType;
  NSString *abGroup;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    phaseDescription = self->_phaseDescription;
    if (phaseDescription == 1)
    {
      v5 = CFSTR("First");
    }
    else if (phaseDescription == 2)
    {
      v5 = CFSTR("Second");
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_phaseDescription);
      v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("phaseDescription"));

  }
  phaseType = self->_phaseType;
  if (phaseType)
    objc_msgSend(v3, "setObject:forKey:", phaseType, CFSTR("phaseType"));
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_numStartingCandidates);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("numStartingCandidates"));

    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_numEndingCandidates);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("numEndingCandidates"));

  }
  anchorType = self->_anchorType;
  if (anchorType)
    objc_msgSend(v3, "setObject:forKey:", anchorType, CFSTR("anchorType"));
  abGroup = self->_abGroup;
  if (abGroup)
    objc_msgSend(v3, "setObject:forKey:", abGroup, CFSTR("abGroup"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return ATXMPBAnchorModelPhaseFilterTrackerReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  char has;
  id v6;

  v4 = a3;
  v6 = v4;
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    PBDataWriterWriteInt32Field();
    v4 = v6;
  }
  if (self->_phaseType)
  {
    PBDataWriterWriteStringField();
    v4 = v6;
  }
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteUint32Field();
    v4 = v6;
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    PBDataWriterWriteUint32Field();
    v4 = v6;
  }
  if (self->_anchorType)
  {
    PBDataWriterWriteStringField();
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
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    v4[8] = self->_phaseDescription;
    *((_BYTE *)v4 + 48) |= 4u;
  }
  v6 = v4;
  if (self->_phaseType)
  {
    objc_msgSend(v4, "setPhaseType:");
    v4 = v6;
  }
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v4[7] = self->_numStartingCandidates;
    *((_BYTE *)v4 + 48) |= 2u;
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    v4[6] = self->_numEndingCandidates;
    *((_BYTE *)v4 + 48) |= 1u;
  }
  if (self->_anchorType)
  {
    objc_msgSend(v6, "setAnchorType:");
    v4 = v6;
  }
  if (self->_abGroup)
  {
    objc_msgSend(v6, "setAbGroup:");
    v4 = v6;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  char has;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    *(_DWORD *)(v5 + 32) = self->_phaseDescription;
    *(_BYTE *)(v5 + 48) |= 4u;
  }
  v7 = -[NSString copyWithZone:](self->_phaseType, "copyWithZone:", a3);
  v8 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v7;

  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *(_DWORD *)(v6 + 28) = self->_numStartingCandidates;
    *(_BYTE *)(v6 + 48) |= 2u;
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    *(_DWORD *)(v6 + 24) = self->_numEndingCandidates;
    *(_BYTE *)(v6 + 48) |= 1u;
  }
  v10 = -[NSString copyWithZone:](self->_anchorType, "copyWithZone:", a3);
  v11 = *(void **)(v6 + 16);
  *(_QWORD *)(v6 + 16) = v10;

  v12 = -[NSString copyWithZone:](self->_abGroup, "copyWithZone:", a3);
  v13 = *(void **)(v6 + 8);
  *(_QWORD *)(v6 + 8) = v12;

  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  char has;
  NSString *phaseType;
  NSString *anchorType;
  NSString *abGroup;
  char v9;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_24;
  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 48) & 4) == 0 || self->_phaseDescription != *((_DWORD *)v4 + 8))
      goto LABEL_24;
  }
  else if ((*((_BYTE *)v4 + 48) & 4) != 0)
  {
    goto LABEL_24;
  }
  phaseType = self->_phaseType;
  if ((unint64_t)phaseType | *((_QWORD *)v4 + 5))
  {
    if (!-[NSString isEqual:](phaseType, "isEqual:"))
    {
LABEL_24:
      v9 = 0;
      goto LABEL_25;
    }
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 48) & 2) == 0 || self->_numStartingCandidates != *((_DWORD *)v4 + 7))
      goto LABEL_24;
  }
  else if ((*((_BYTE *)v4 + 48) & 2) != 0)
  {
    goto LABEL_24;
  }
  if ((has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 48) & 1) == 0 || self->_numEndingCandidates != *((_DWORD *)v4 + 6))
      goto LABEL_24;
  }
  else if ((*((_BYTE *)v4 + 48) & 1) != 0)
  {
    goto LABEL_24;
  }
  anchorType = self->_anchorType;
  if ((unint64_t)anchorType | *((_QWORD *)v4 + 2) && !-[NSString isEqual:](anchorType, "isEqual:"))
    goto LABEL_24;
  abGroup = self->_abGroup;
  if ((unint64_t)abGroup | *((_QWORD *)v4 + 1))
    v9 = -[NSString isEqual:](abGroup, "isEqual:");
  else
    v9 = 1;
LABEL_25:

  return v9;
}

- (unint64_t)hash
{
  uint64_t v3;
  NSUInteger v4;
  uint64_t v5;
  uint64_t v6;
  NSUInteger v7;

  if ((*(_BYTE *)&self->_has & 4) != 0)
    v3 = 2654435761 * self->_phaseDescription;
  else
    v3 = 0;
  v4 = -[NSString hash](self->_phaseType, "hash");
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    v5 = 2654435761 * self->_numStartingCandidates;
    if ((*(_BYTE *)&self->_has & 1) != 0)
      goto LABEL_6;
LABEL_8:
    v6 = 0;
    goto LABEL_9;
  }
  v5 = 0;
  if ((*(_BYTE *)&self->_has & 1) == 0)
    goto LABEL_8;
LABEL_6:
  v6 = 2654435761 * self->_numEndingCandidates;
LABEL_9:
  v7 = v4 ^ v3 ^ v5 ^ v6 ^ -[NSString hash](self->_anchorType, "hash");
  return v7 ^ -[NSString hash](self->_abGroup, "hash");
}

- (void)mergeFrom:(id)a3
{
  _DWORD *v4;
  char v5;
  _DWORD *v6;

  v4 = a3;
  if ((v4[12] & 4) != 0)
  {
    self->_phaseDescription = v4[8];
    *(_BYTE *)&self->_has |= 4u;
  }
  v6 = v4;
  if (*((_QWORD *)v4 + 5))
  {
    -[ATXMPBAnchorModelPhaseFilterTracker setPhaseType:](self, "setPhaseType:");
    v4 = v6;
  }
  v5 = *((_BYTE *)v4 + 48);
  if ((v5 & 2) != 0)
  {
    self->_numStartingCandidates = v4[7];
    *(_BYTE *)&self->_has |= 2u;
    v5 = *((_BYTE *)v4 + 48);
  }
  if ((v5 & 1) != 0)
  {
    self->_numEndingCandidates = v4[6];
    *(_BYTE *)&self->_has |= 1u;
  }
  if (*((_QWORD *)v4 + 2))
  {
    -[ATXMPBAnchorModelPhaseFilterTracker setAnchorType:](self, "setAnchorType:");
    v4 = v6;
  }
  if (*((_QWORD *)v4 + 1))
  {
    -[ATXMPBAnchorModelPhaseFilterTracker setAbGroup:](self, "setAbGroup:");
    v4 = v6;
  }

}

- (NSString)phaseType
{
  return self->_phaseType;
}

- (void)setPhaseType:(id)a3
{
  objc_storeStrong((id *)&self->_phaseType, a3);
}

- (unsigned)numStartingCandidates
{
  return self->_numStartingCandidates;
}

- (unsigned)numEndingCandidates
{
  return self->_numEndingCandidates;
}

- (NSString)anchorType
{
  return self->_anchorType;
}

- (void)setAnchorType:(id)a3
{
  objc_storeStrong((id *)&self->_anchorType, a3);
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
  objc_storeStrong((id *)&self->_phaseType, 0);
  objc_storeStrong((id *)&self->_anchorType, 0);
  objc_storeStrong((id *)&self->_abGroup, 0);
}

@end
