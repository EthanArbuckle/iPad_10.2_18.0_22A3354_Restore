@implementation SGM2HarvestCost

- (int)documentSource
{
  if ((*(_BYTE *)&self->_has & 1) != 0)
    return self->_documentSource;
  else
    return 0;
}

- (void)setDocumentSource:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_documentSource = a3;
}

- (void)setHasDocumentSource:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasDocumentSource
{
  return *(_BYTE *)&self->_has & 1;
}

- (id)documentSourceAsString:(int)a3
{
  if (a3 < 8)
    return off_1E7DA9488[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsDocumentSource:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("otherFirstParty")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("otherThirdParty")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Safari")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("News")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Mail")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Messages")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Notes")) & 1) != 0)
  {
    v4 = 6;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("Reminders")))
  {
    v4 = 7;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)setHighPriority:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_highPriority = a3;
}

- (void)setHasHighPriority:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasHighPriority
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setReceivedOnBattery:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 0x10u;
  self->_receivedOnBattery = a3;
}

- (void)setHasReceivedOnBattery:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xEF | v3;
}

- (BOOL)hasReceivedOnBattery
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (void)setHarvestedOnBattery:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_harvestedOnBattery = a3;
}

- (void)setHasHarvestedOnBattery:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasHarvestedOnBattery
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (int)harvestSource
{
  if ((*(_BYTE *)&self->_has & 2) != 0)
    return self->_harvestSource;
  else
    return 0;
}

- (void)setHarvestSource:(int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_harvestSource = a3;
}

- (void)setHasHarvestSource:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasHarvestSource
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (id)harvestSourceAsString:(int)a3
{
  if (a3 < 9)
    return off_1E7DA94C8[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsHarvestSource:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SGM2HarvestSourceInMemory")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SGM2HarvestSourceRealtime")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SGM2HarvestSourceRealtimeNoBudget")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SGM2HarvestSourceOnDiskOverflow")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SGM2HarvestSourceOnDiskNoBudget")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SGM2HarvestSourceOnDiskTimeout")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SGM2HarvestSourceOnDiskClosed")) & 1) != 0)
  {
    v4 = 6;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SGM2HarvestSourceOnDiskLegacy")) & 1) != 0)
  {
    v4 = 7;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("SGM2HarvestSourceProactiveHarvesting")))
  {
    v4 = 8;
  }
  else
  {
    v4 = 0;
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

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)SGM2HarvestCost;
  -[SGM2HarvestCost description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SGM2HarvestCost dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  char has;
  uint64_t documentSource;
  __CFString *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t harvestSource;
  __CFString *v11;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    documentSource = self->_documentSource;
    if (documentSource >= 8)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_documentSource);
      v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v6 = off_1E7DA9488[documentSource];
    }
    objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("documentSource"));

    has = (char)self->_has;
  }
  if ((has & 8) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_highPriority);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("highPriority"));

    has = (char)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_8:
      if ((has & 4) == 0)
        goto LABEL_9;
LABEL_13:
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_harvestedOnBattery);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("harvestedOnBattery"));

      if ((*(_BYTE *)&self->_has & 2) == 0)
        return v3;
      goto LABEL_14;
    }
  }
  else if ((has & 0x10) == 0)
  {
    goto LABEL_8;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_receivedOnBattery);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("receivedOnBattery"));

  has = (char)self->_has;
  if ((has & 4) != 0)
    goto LABEL_13;
LABEL_9:
  if ((has & 2) == 0)
    return v3;
LABEL_14:
  harvestSource = self->_harvestSource;
  if (harvestSource >= 9)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_harvestSource);
    v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = off_1E7DA94C8[harvestSource];
  }
  objc_msgSend(v3, "setObject:forKey:", v11, CFSTR("harvestSource"));

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return SGM2HarvestCostReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has;
  id v5;

  v5 = a3;
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteInt32Field();
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
  PBDataWriterWriteBOOLField();
  has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_4:
    if ((has & 4) == 0)
      goto LABEL_5;
LABEL_11:
    PBDataWriterWriteBOOLField();
    if ((*(_BYTE *)&self->_has & 2) == 0)
      goto LABEL_7;
    goto LABEL_6;
  }
LABEL_10:
  PBDataWriterWriteBOOLField();
  has = (char)self->_has;
  if ((has & 4) != 0)
    goto LABEL_11;
LABEL_5:
  if ((has & 2) != 0)
LABEL_6:
    PBDataWriterWriteInt32Field();
LABEL_7:

}

- (void)copyTo:(id)a3
{
  _DWORD *v4;
  char has;

  v4 = a3;
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    v4[2] = self->_documentSource;
    *((_BYTE *)v4 + 20) |= 1u;
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
  *((_BYTE *)v4 + 17) = self->_highPriority;
  *((_BYTE *)v4 + 20) |= 8u;
  has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_4:
    if ((has & 4) == 0)
      goto LABEL_5;
LABEL_11:
    *((_BYTE *)v4 + 16) = self->_harvestedOnBattery;
    *((_BYTE *)v4 + 20) |= 4u;
    if ((*(_BYTE *)&self->_has & 2) == 0)
      goto LABEL_7;
    goto LABEL_6;
  }
LABEL_10:
  *((_BYTE *)v4 + 18) = self->_receivedOnBattery;
  *((_BYTE *)v4 + 20) |= 0x10u;
  has = (char)self->_has;
  if ((has & 4) != 0)
    goto LABEL_11;
LABEL_5:
  if ((has & 2) != 0)
  {
LABEL_6:
    v4[3] = self->_harvestSource;
    *((_BYTE *)v4 + 20) |= 2u;
  }
LABEL_7:

}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;
  char has;

  result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    *((_DWORD *)result + 2) = self->_documentSource;
    *((_BYTE *)result + 20) |= 1u;
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
  *((_BYTE *)result + 17) = self->_highPriority;
  *((_BYTE *)result + 20) |= 8u;
  has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_4:
    if ((has & 4) == 0)
      goto LABEL_5;
    goto LABEL_11;
  }
LABEL_10:
  *((_BYTE *)result + 18) = self->_receivedOnBattery;
  *((_BYTE *)result + 20) |= 0x10u;
  has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_5:
    if ((has & 2) == 0)
      return result;
    goto LABEL_6;
  }
LABEL_11:
  *((_BYTE *)result + 16) = self->_harvestedOnBattery;
  *((_BYTE *)result + 20) |= 4u;
  if ((*(_BYTE *)&self->_has & 2) == 0)
    return result;
LABEL_6:
  *((_DWORD *)result + 3) = self->_harvestSource;
  *((_BYTE *)result + 20) |= 2u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_35;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 20) & 1) == 0 || self->_documentSource != *((_DWORD *)v4 + 2))
      goto LABEL_35;
  }
  else if ((*((_BYTE *)v4 + 20) & 1) != 0)
  {
    goto LABEL_35;
  }
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    if ((*((_BYTE *)v4 + 20) & 8) == 0)
      goto LABEL_35;
    if (self->_highPriority)
    {
      if (!*((_BYTE *)v4 + 17))
        goto LABEL_35;
    }
    else if (*((_BYTE *)v4 + 17))
    {
      goto LABEL_35;
    }
  }
  else if ((*((_BYTE *)v4 + 20) & 8) != 0)
  {
    goto LABEL_35;
  }
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
    if ((*((_BYTE *)v4 + 20) & 0x10) == 0)
      goto LABEL_35;
    if (self->_receivedOnBattery)
    {
      if (!*((_BYTE *)v4 + 18))
        goto LABEL_35;
    }
    else if (*((_BYTE *)v4 + 18))
    {
      goto LABEL_35;
    }
  }
  else if ((*((_BYTE *)v4 + 20) & 0x10) != 0)
  {
    goto LABEL_35;
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 20) & 4) != 0)
    {
      if (self->_harvestedOnBattery)
      {
        if (!*((_BYTE *)v4 + 16))
          goto LABEL_35;
        goto LABEL_31;
      }
      if (!*((_BYTE *)v4 + 16))
        goto LABEL_31;
    }
LABEL_35:
    v5 = 0;
    goto LABEL_36;
  }
  if ((*((_BYTE *)v4 + 20) & 4) != 0)
    goto LABEL_35;
LABEL_31:
  v5 = (*((_BYTE *)v4 + 20) & 2) == 0;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 20) & 2) == 0 || self->_harvestSource != *((_DWORD *)v4 + 3))
      goto LABEL_35;
    v5 = 1;
  }
LABEL_36:

  return v5;
}

- (unint64_t)hash
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v2 = 2654435761 * self->_documentSource;
    if ((*(_BYTE *)&self->_has & 8) != 0)
    {
LABEL_3:
      v3 = 2654435761 * self->_highPriority;
      if ((*(_BYTE *)&self->_has & 0x10) != 0)
        goto LABEL_4;
      goto LABEL_9;
    }
  }
  else
  {
    v2 = 0;
    if ((*(_BYTE *)&self->_has & 8) != 0)
      goto LABEL_3;
  }
  v3 = 0;
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
LABEL_4:
    v4 = 2654435761 * self->_receivedOnBattery;
    if ((*(_BYTE *)&self->_has & 4) != 0)
      goto LABEL_5;
LABEL_10:
    v5 = 0;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_6;
LABEL_11:
    v6 = 0;
    return v3 ^ v2 ^ v4 ^ v5 ^ v6;
  }
LABEL_9:
  v4 = 0;
  if ((*(_BYTE *)&self->_has & 4) == 0)
    goto LABEL_10;
LABEL_5:
  v5 = 2654435761 * self->_harvestedOnBattery;
  if ((*(_BYTE *)&self->_has & 2) == 0)
    goto LABEL_11;
LABEL_6:
  v6 = 2654435761 * self->_harvestSource;
  return v3 ^ v2 ^ v4 ^ v5 ^ v6;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  char v5;

  v4 = a3;
  v5 = *((_BYTE *)v4 + 20);
  if ((v5 & 1) != 0)
  {
    self->_documentSource = *((_DWORD *)v4 + 2);
    *(_BYTE *)&self->_has |= 1u;
    v5 = *((_BYTE *)v4 + 20);
    if ((v5 & 8) == 0)
    {
LABEL_3:
      if ((v5 & 0x10) == 0)
        goto LABEL_4;
      goto LABEL_10;
    }
  }
  else if ((*((_BYTE *)v4 + 20) & 8) == 0)
  {
    goto LABEL_3;
  }
  self->_highPriority = *((_BYTE *)v4 + 17);
  *(_BYTE *)&self->_has |= 8u;
  v5 = *((_BYTE *)v4 + 20);
  if ((v5 & 0x10) == 0)
  {
LABEL_4:
    if ((v5 & 4) == 0)
      goto LABEL_5;
LABEL_11:
    self->_harvestedOnBattery = *((_BYTE *)v4 + 16);
    *(_BYTE *)&self->_has |= 4u;
    if ((*((_BYTE *)v4 + 20) & 2) == 0)
      goto LABEL_7;
    goto LABEL_6;
  }
LABEL_10:
  self->_receivedOnBattery = *((_BYTE *)v4 + 18);
  *(_BYTE *)&self->_has |= 0x10u;
  v5 = *((_BYTE *)v4 + 20);
  if ((v5 & 4) != 0)
    goto LABEL_11;
LABEL_5:
  if ((v5 & 2) != 0)
  {
LABEL_6:
    self->_harvestSource = *((_DWORD *)v4 + 3);
    *(_BYTE *)&self->_has |= 2u;
  }
LABEL_7:

}

- (BOOL)highPriority
{
  return self->_highPriority;
}

- (BOOL)receivedOnBattery
{
  return self->_receivedOnBattery;
}

- (BOOL)harvestedOnBattery
{
  return self->_harvestedOnBattery;
}

@end
