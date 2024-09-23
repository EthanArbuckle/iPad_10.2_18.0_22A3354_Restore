@implementation MIPSmartPlaylistInfo

- (void)setDynamic:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_dynamic = a3;
}

- (void)setHasDynamic:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (BOOL)hasDynamic
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (void)setFiltered:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_filtered = a3;
}

- (void)setHasFiltered:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (BOOL)hasFiltered
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (void)setLimited:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_limited = a3;
}

- (void)setHasLimited:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 256;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (BOOL)hasLimited
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (void)setLimitKind:(int)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_limitKind = a3;
}

- (void)setHasLimitKind:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (BOOL)hasLimitKind
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (void)setEvaluationOrder:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 1u;
  self->_evaluationOrder = a3;
}

- (void)setHasEvaluationOrder:(BOOL)a3
{
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFE | a3;
}

- (BOOL)hasEvaluationOrder
{
  return *(_WORD *)&self->_has & 1;
}

- (void)setLimitOrder:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_limitOrder = a3;
}

- (void)setHasLimitOrder:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (BOOL)hasLimitOrder
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (void)setLimitValue:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_limitValue = a3;
}

- (void)setHasLimitValue:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (BOOL)hasLimitValue
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (void)setEnabledItemsOnly:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_enabledItemsOnly = a3;
}

- (void)setHasEnabledItemsOnly:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (BOOL)hasEnabledItemsOnly
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (void)setReverseLimitOrder:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x200u;
  self->_reverseLimitOrder = a3;
}

- (void)setHasReverseLimitOrder:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 512;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFDFF | v3;
}

- (BOOL)hasReverseLimitOrder
{
  return (*(_WORD *)&self->_has >> 9) & 1;
}

- (BOOL)hasSmartCriteria
{
  return self->_smartCriteria != 0;
}

- (void)setGenius:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_genius = a3;
}

- (void)setHasGenius:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 128;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (BOOL)hasGenius
{
  return (*(_WORD *)&self->_has >> 7) & 1;
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
  v8.super_class = (Class)MIPSmartPlaylistInfo;
  -[MIPSmartPlaylistInfo description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MIPSmartPlaylistInfo dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  __int16 has;
  void *v5;
  NSData *smartCriteria;
  void *v7;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = (__int16)self->_has;
  if ((has & 0x10) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_dynamic);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("dynamic"));

    has = (__int16)self->_has;
    if ((has & 0x40) == 0)
    {
LABEL_3:
      if ((has & 0x100) == 0)
        goto LABEL_4;
      goto LABEL_18;
    }
  }
  else if ((has & 0x40) == 0)
  {
    goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_filtered);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("filtered"));

  has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_4:
    if ((has & 2) == 0)
      goto LABEL_5;
    goto LABEL_19;
  }
LABEL_18:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_limited);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v11, CFSTR("limited"));

  has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_5:
    if ((has & 1) == 0)
      goto LABEL_6;
    goto LABEL_20;
  }
LABEL_19:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_limitKind);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v12, CFSTR("limitKind"));

  has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_6:
    if ((has & 4) == 0)
      goto LABEL_7;
    goto LABEL_21;
  }
LABEL_20:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_evaluationOrder);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v13, CFSTR("evaluationOrder"));

  has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_7:
    if ((has & 8) == 0)
      goto LABEL_8;
    goto LABEL_22;
  }
LABEL_21:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_limitOrder);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v14, CFSTR("limitOrder"));

  has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_8:
    if ((has & 0x20) == 0)
      goto LABEL_9;
    goto LABEL_23;
  }
LABEL_22:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_limitValue);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v15, CFSTR("limitValue"));

  has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_9:
    if ((has & 0x200) == 0)
      goto LABEL_11;
    goto LABEL_10;
  }
LABEL_23:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_enabledItemsOnly);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v16, CFSTR("enabledItemsOnly"));

  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
LABEL_10:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_reverseLimitOrder);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("reverseLimitOrder"));

  }
LABEL_11:
  smartCriteria = self->_smartCriteria;
  if (smartCriteria)
    objc_msgSend(v3, "setObject:forKey:", smartCriteria, CFSTR("smartCriteria"));
  if ((*(_WORD *)&self->_has & 0x80) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_genius);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("genius"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return MIPSmartPlaylistInfoReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  __int16 has;
  id v5;

  v5 = a3;
  has = (__int16)self->_has;
  if ((has & 0x10) != 0)
  {
    PBDataWriterWriteBOOLField();
    has = (__int16)self->_has;
    if ((has & 0x40) == 0)
    {
LABEL_3:
      if ((has & 0x100) == 0)
        goto LABEL_4;
      goto LABEL_18;
    }
  }
  else if ((has & 0x40) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteBOOLField();
  has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_4:
    if ((has & 2) == 0)
      goto LABEL_5;
    goto LABEL_19;
  }
LABEL_18:
  PBDataWriterWriteBOOLField();
  has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_5:
    if ((has & 1) == 0)
      goto LABEL_6;
    goto LABEL_20;
  }
LABEL_19:
  PBDataWriterWriteInt32Field();
  has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_6:
    if ((has & 4) == 0)
      goto LABEL_7;
    goto LABEL_21;
  }
LABEL_20:
  PBDataWriterWriteUint32Field();
  has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_7:
    if ((has & 8) == 0)
      goto LABEL_8;
    goto LABEL_22;
  }
LABEL_21:
  PBDataWriterWriteUint32Field();
  has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_8:
    if ((has & 0x20) == 0)
      goto LABEL_9;
    goto LABEL_23;
  }
LABEL_22:
  PBDataWriterWriteUint32Field();
  has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_9:
    if ((has & 0x200) == 0)
      goto LABEL_11;
    goto LABEL_10;
  }
LABEL_23:
  PBDataWriterWriteBOOLField();
  if ((*(_WORD *)&self->_has & 0x200) != 0)
LABEL_10:
    PBDataWriterWriteBOOLField();
LABEL_11:
  if (self->_smartCriteria)
    PBDataWriterWriteDataField();
  if ((*(_WORD *)&self->_has & 0x80) != 0)
    PBDataWriterWriteBOOLField();

}

- (void)copyTo:(id)a3
{
  _BYTE *v4;
  __int16 has;
  _BYTE *v6;

  v4 = a3;
  has = (__int16)self->_has;
  if ((has & 0x10) != 0)
  {
    v4[32] = self->_dynamic;
    *((_WORD *)v4 + 20) |= 0x10u;
    has = (__int16)self->_has;
    if ((has & 0x40) == 0)
    {
LABEL_3:
      if ((has & 0x100) == 0)
        goto LABEL_4;
      goto LABEL_18;
    }
  }
  else if ((has & 0x40) == 0)
  {
    goto LABEL_3;
  }
  v4[34] = self->_filtered;
  *((_WORD *)v4 + 20) |= 0x40u;
  has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_4:
    if ((has & 2) == 0)
      goto LABEL_5;
    goto LABEL_19;
  }
LABEL_18:
  v4[36] = self->_limited;
  *((_WORD *)v4 + 20) |= 0x100u;
  has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_5:
    if ((has & 1) == 0)
      goto LABEL_6;
    goto LABEL_20;
  }
LABEL_19:
  *((_DWORD *)v4 + 3) = self->_limitKind;
  *((_WORD *)v4 + 20) |= 2u;
  has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_6:
    if ((has & 4) == 0)
      goto LABEL_7;
    goto LABEL_21;
  }
LABEL_20:
  *((_DWORD *)v4 + 2) = self->_evaluationOrder;
  *((_WORD *)v4 + 20) |= 1u;
  has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_7:
    if ((has & 8) == 0)
      goto LABEL_8;
    goto LABEL_22;
  }
LABEL_21:
  *((_DWORD *)v4 + 4) = self->_limitOrder;
  *((_WORD *)v4 + 20) |= 4u;
  has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_8:
    if ((has & 0x20) == 0)
      goto LABEL_9;
    goto LABEL_23;
  }
LABEL_22:
  *((_DWORD *)v4 + 5) = self->_limitValue;
  *((_WORD *)v4 + 20) |= 8u;
  has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_9:
    if ((has & 0x200) == 0)
      goto LABEL_11;
    goto LABEL_10;
  }
LABEL_23:
  v4[33] = self->_enabledItemsOnly;
  *((_WORD *)v4 + 20) |= 0x20u;
  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
LABEL_10:
    v4[37] = self->_reverseLimitOrder;
    *((_WORD *)v4 + 20) |= 0x200u;
  }
LABEL_11:
  if (self->_smartCriteria)
  {
    v6 = v4;
    objc_msgSend(v4, "setSmartCriteria:");
    v4 = v6;
  }
  if ((*(_WORD *)&self->_has & 0x80) != 0)
  {
    v4[35] = self->_genius;
    *((_WORD *)v4 + 20) |= 0x80u;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  __int16 has;
  uint64_t v8;
  void *v9;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  has = (__int16)self->_has;
  if ((has & 0x10) != 0)
  {
    *(_BYTE *)(v5 + 32) = self->_dynamic;
    *(_WORD *)(v5 + 40) |= 0x10u;
    has = (__int16)self->_has;
    if ((has & 0x40) == 0)
    {
LABEL_3:
      if ((has & 0x100) == 0)
        goto LABEL_4;
      goto LABEL_16;
    }
  }
  else if ((has & 0x40) == 0)
  {
    goto LABEL_3;
  }
  *(_BYTE *)(v5 + 34) = self->_filtered;
  *(_WORD *)(v5 + 40) |= 0x40u;
  has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_4:
    if ((has & 2) == 0)
      goto LABEL_5;
    goto LABEL_17;
  }
LABEL_16:
  *(_BYTE *)(v5 + 36) = self->_limited;
  *(_WORD *)(v5 + 40) |= 0x100u;
  has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_5:
    if ((has & 1) == 0)
      goto LABEL_6;
    goto LABEL_18;
  }
LABEL_17:
  *(_DWORD *)(v5 + 12) = self->_limitKind;
  *(_WORD *)(v5 + 40) |= 2u;
  has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_6:
    if ((has & 4) == 0)
      goto LABEL_7;
    goto LABEL_19;
  }
LABEL_18:
  *(_DWORD *)(v5 + 8) = self->_evaluationOrder;
  *(_WORD *)(v5 + 40) |= 1u;
  has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_7:
    if ((has & 8) == 0)
      goto LABEL_8;
    goto LABEL_20;
  }
LABEL_19:
  *(_DWORD *)(v5 + 16) = self->_limitOrder;
  *(_WORD *)(v5 + 40) |= 4u;
  has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_8:
    if ((has & 0x20) == 0)
      goto LABEL_9;
    goto LABEL_21;
  }
LABEL_20:
  *(_DWORD *)(v5 + 20) = self->_limitValue;
  *(_WORD *)(v5 + 40) |= 8u;
  has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_9:
    if ((has & 0x200) == 0)
      goto LABEL_11;
    goto LABEL_10;
  }
LABEL_21:
  *(_BYTE *)(v5 + 33) = self->_enabledItemsOnly;
  *(_WORD *)(v5 + 40) |= 0x20u;
  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
LABEL_10:
    *(_BYTE *)(v5 + 37) = self->_reverseLimitOrder;
    *(_WORD *)(v5 + 40) |= 0x200u;
  }
LABEL_11:
  v8 = -[NSData copyWithZone:](self->_smartCriteria, "copyWithZone:", a3);
  v9 = *(void **)(v6 + 24);
  *(_QWORD *)(v6 + 24) = v8;

  if ((*(_WORD *)&self->_has & 0x80) != 0)
  {
    *(_BYTE *)(v6 + 35) = self->_genius;
    *(_WORD *)(v6 + 40) |= 0x80u;
  }
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  __int16 has;
  __int16 v6;
  NSData *smartCriteria;
  BOOL v8;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_68;
  has = (__int16)self->_has;
  v6 = *((_WORD *)v4 + 20);
  if ((has & 0x10) != 0)
  {
    if ((v6 & 0x10) == 0)
      goto LABEL_68;
    if (self->_dynamic)
    {
      if (!*((_BYTE *)v4 + 32))
        goto LABEL_68;
    }
    else if (*((_BYTE *)v4 + 32))
    {
      goto LABEL_68;
    }
  }
  else if ((v6 & 0x10) != 0)
  {
    goto LABEL_68;
  }
  if ((has & 0x40) != 0)
  {
    if ((v6 & 0x40) == 0)
      goto LABEL_68;
    if (self->_filtered)
    {
      if (!*((_BYTE *)v4 + 34))
        goto LABEL_68;
    }
    else if (*((_BYTE *)v4 + 34))
    {
      goto LABEL_68;
    }
  }
  else if ((v6 & 0x40) != 0)
  {
    goto LABEL_68;
  }
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
    if ((*((_WORD *)v4 + 20) & 0x100) == 0)
      goto LABEL_68;
    if (self->_limited)
    {
      if (!*((_BYTE *)v4 + 36))
        goto LABEL_68;
    }
    else if (*((_BYTE *)v4 + 36))
    {
      goto LABEL_68;
    }
  }
  else if ((*((_WORD *)v4 + 20) & 0x100) != 0)
  {
    goto LABEL_68;
  }
  if ((has & 2) != 0)
  {
    if ((v6 & 2) == 0 || self->_limitKind != *((_DWORD *)v4 + 3))
      goto LABEL_68;
  }
  else if ((v6 & 2) != 0)
  {
    goto LABEL_68;
  }
  if ((has & 1) != 0)
  {
    if ((v6 & 1) == 0 || self->_evaluationOrder != *((_DWORD *)v4 + 2))
      goto LABEL_68;
  }
  else if ((v6 & 1) != 0)
  {
    goto LABEL_68;
  }
  if ((has & 4) != 0)
  {
    if ((v6 & 4) == 0 || self->_limitOrder != *((_DWORD *)v4 + 4))
      goto LABEL_68;
  }
  else if ((v6 & 4) != 0)
  {
    goto LABEL_68;
  }
  if ((has & 8) != 0)
  {
    if ((v6 & 8) == 0 || self->_limitValue != *((_DWORD *)v4 + 5))
      goto LABEL_68;
  }
  else if ((v6 & 8) != 0)
  {
    goto LABEL_68;
  }
  if ((has & 0x20) != 0)
  {
    if ((v6 & 0x20) == 0)
      goto LABEL_68;
    if (self->_enabledItemsOnly)
    {
      if (!*((_BYTE *)v4 + 33))
        goto LABEL_68;
    }
    else if (*((_BYTE *)v4 + 33))
    {
      goto LABEL_68;
    }
  }
  else if ((v6 & 0x20) != 0)
  {
    goto LABEL_68;
  }
  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
    if ((*((_WORD *)v4 + 20) & 0x200) == 0)
      goto LABEL_68;
    if (self->_reverseLimitOrder)
    {
      if (!*((_BYTE *)v4 + 37))
        goto LABEL_68;
    }
    else if (*((_BYTE *)v4 + 37))
    {
      goto LABEL_68;
    }
  }
  else if ((*((_WORD *)v4 + 20) & 0x200) != 0)
  {
    goto LABEL_68;
  }
  smartCriteria = self->_smartCriteria;
  if ((unint64_t)smartCriteria | *((_QWORD *)v4 + 3))
  {
    if (!-[NSData isEqual:](smartCriteria, "isEqual:"))
      goto LABEL_68;
    has = (__int16)self->_has;
    v6 = *((_WORD *)v4 + 20);
  }
  if ((has & 0x80) != 0)
  {
    if ((v6 & 0x80) != 0)
    {
      if (self->_genius)
      {
        if (!*((_BYTE *)v4 + 35))
          goto LABEL_68;
      }
      else if (*((_BYTE *)v4 + 35))
      {
        goto LABEL_68;
      }
      v8 = 1;
      goto LABEL_69;
    }
LABEL_68:
    v8 = 0;
    goto LABEL_69;
  }
  v8 = (v6 & 0x80) == 0;
LABEL_69:

  return v8;
}

- (unint64_t)hash
{
  __int16 has;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  has = (__int16)self->_has;
  if ((has & 0x10) != 0)
  {
    v16 = 2654435761 * self->_dynamic;
    if ((has & 0x40) != 0)
    {
LABEL_3:
      v14 = 2654435761 * self->_filtered;
      if ((*(_WORD *)&self->_has & 0x100) != 0)
        goto LABEL_4;
      goto LABEL_13;
    }
  }
  else
  {
    v16 = 0;
    if ((has & 0x40) != 0)
      goto LABEL_3;
  }
  v14 = 0;
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
LABEL_4:
    v4 = 2654435761 * self->_limited;
    if ((has & 2) != 0)
      goto LABEL_5;
    goto LABEL_14;
  }
LABEL_13:
  v4 = 0;
  if ((has & 2) != 0)
  {
LABEL_5:
    v5 = 2654435761 * self->_limitKind;
    if ((has & 1) != 0)
      goto LABEL_6;
    goto LABEL_15;
  }
LABEL_14:
  v5 = 0;
  if ((has & 1) != 0)
  {
LABEL_6:
    v6 = 2654435761 * self->_evaluationOrder;
    if ((has & 4) != 0)
      goto LABEL_7;
    goto LABEL_16;
  }
LABEL_15:
  v6 = 0;
  if ((has & 4) != 0)
  {
LABEL_7:
    v7 = 2654435761 * self->_limitOrder;
    if ((has & 8) != 0)
      goto LABEL_8;
    goto LABEL_17;
  }
LABEL_16:
  v7 = 0;
  if ((has & 8) != 0)
  {
LABEL_8:
    v8 = 2654435761 * self->_limitValue;
    if ((has & 0x20) != 0)
      goto LABEL_9;
LABEL_18:
    v9 = 0;
    if ((*(_WORD *)&self->_has & 0x200) != 0)
      goto LABEL_10;
    goto LABEL_19;
  }
LABEL_17:
  v8 = 0;
  if ((has & 0x20) == 0)
    goto LABEL_18;
LABEL_9:
  v9 = 2654435761 * self->_enabledItemsOnly;
  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
LABEL_10:
    v10 = 2654435761 * self->_reverseLimitOrder;
    goto LABEL_20;
  }
LABEL_19:
  v10 = 0;
LABEL_20:
  v11 = -[NSData hash](self->_smartCriteria, "hash", v14);
  if ((*(_WORD *)&self->_has & 0x80) != 0)
    v12 = 2654435761 * self->_genius;
  else
    v12 = 0;
  return v15 ^ v16 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v12 ^ v11;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  __int16 v5;
  id v6;

  v4 = a3;
  v5 = *((_WORD *)v4 + 20);
  if ((v5 & 0x10) != 0)
  {
    self->_dynamic = *((_BYTE *)v4 + 32);
    *(_WORD *)&self->_has |= 0x10u;
    v5 = *((_WORD *)v4 + 20);
    if ((v5 & 0x40) == 0)
    {
LABEL_3:
      if ((v5 & 0x100) == 0)
        goto LABEL_4;
      goto LABEL_18;
    }
  }
  else if ((v5 & 0x40) == 0)
  {
    goto LABEL_3;
  }
  self->_filtered = *((_BYTE *)v4 + 34);
  *(_WORD *)&self->_has |= 0x40u;
  v5 = *((_WORD *)v4 + 20);
  if ((v5 & 0x100) == 0)
  {
LABEL_4:
    if ((v5 & 2) == 0)
      goto LABEL_5;
    goto LABEL_19;
  }
LABEL_18:
  self->_limited = *((_BYTE *)v4 + 36);
  *(_WORD *)&self->_has |= 0x100u;
  v5 = *((_WORD *)v4 + 20);
  if ((v5 & 2) == 0)
  {
LABEL_5:
    if ((v5 & 1) == 0)
      goto LABEL_6;
    goto LABEL_20;
  }
LABEL_19:
  self->_limitKind = *((_DWORD *)v4 + 3);
  *(_WORD *)&self->_has |= 2u;
  v5 = *((_WORD *)v4 + 20);
  if ((v5 & 1) == 0)
  {
LABEL_6:
    if ((v5 & 4) == 0)
      goto LABEL_7;
    goto LABEL_21;
  }
LABEL_20:
  self->_evaluationOrder = *((_DWORD *)v4 + 2);
  *(_WORD *)&self->_has |= 1u;
  v5 = *((_WORD *)v4 + 20);
  if ((v5 & 4) == 0)
  {
LABEL_7:
    if ((v5 & 8) == 0)
      goto LABEL_8;
    goto LABEL_22;
  }
LABEL_21:
  self->_limitOrder = *((_DWORD *)v4 + 4);
  *(_WORD *)&self->_has |= 4u;
  v5 = *((_WORD *)v4 + 20);
  if ((v5 & 8) == 0)
  {
LABEL_8:
    if ((v5 & 0x20) == 0)
      goto LABEL_9;
    goto LABEL_23;
  }
LABEL_22:
  self->_limitValue = *((_DWORD *)v4 + 5);
  *(_WORD *)&self->_has |= 8u;
  v5 = *((_WORD *)v4 + 20);
  if ((v5 & 0x20) == 0)
  {
LABEL_9:
    if ((v5 & 0x200) == 0)
      goto LABEL_11;
    goto LABEL_10;
  }
LABEL_23:
  self->_enabledItemsOnly = *((_BYTE *)v4 + 33);
  *(_WORD *)&self->_has |= 0x20u;
  if ((*((_WORD *)v4 + 20) & 0x200) != 0)
  {
LABEL_10:
    self->_reverseLimitOrder = *((_BYTE *)v4 + 37);
    *(_WORD *)&self->_has |= 0x200u;
  }
LABEL_11:
  if (*((_QWORD *)v4 + 3))
  {
    v6 = v4;
    -[MIPSmartPlaylistInfo setSmartCriteria:](self, "setSmartCriteria:");
    v4 = v6;
  }
  if ((*((_WORD *)v4 + 20) & 0x80) != 0)
  {
    self->_genius = *((_BYTE *)v4 + 35);
    *(_WORD *)&self->_has |= 0x80u;
  }

}

- (BOOL)dynamic
{
  return self->_dynamic;
}

- (BOOL)filtered
{
  return self->_filtered;
}

- (BOOL)limited
{
  return self->_limited;
}

- (int)limitKind
{
  return self->_limitKind;
}

- (unsigned)evaluationOrder
{
  return self->_evaluationOrder;
}

- (unsigned)limitOrder
{
  return self->_limitOrder;
}

- (unsigned)limitValue
{
  return self->_limitValue;
}

- (BOOL)enabledItemsOnly
{
  return self->_enabledItemsOnly;
}

- (BOOL)reverseLimitOrder
{
  return self->_reverseLimitOrder;
}

- (NSData)smartCriteria
{
  return self->_smartCriteria;
}

- (void)setSmartCriteria:(id)a3
{
  objc_storeStrong((id *)&self->_smartCriteria, a3);
}

- (BOOL)genius
{
  return self->_genius;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_smartCriteria, 0);
}

@end
