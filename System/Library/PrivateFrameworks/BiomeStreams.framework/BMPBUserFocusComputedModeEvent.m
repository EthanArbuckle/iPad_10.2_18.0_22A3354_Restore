@implementation BMPBUserFocusComputedModeEvent

- (BOOL)hasMode
{
  return self->_mode != 0;
}

- (void)setStarting:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_starting = a3;
}

- (void)setHasStarting:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasStarting
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (int)modeUpdateReason
{
  if ((*(_BYTE *)&self->_has & 2) != 0)
    return self->_modeUpdateReason;
  else
    return 0;
}

- (void)setModeUpdateReason:(int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_modeUpdateReason = a3;
}

- (void)setHasModeUpdateReason:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasModeUpdateReason
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (id)modeUpdateReasonAsString:(int)a3
{
  if (a3 < 4)
    return off_1E2649348[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsModeUpdateReason:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Unknown")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UserAction")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Scheduled")) & 1) != 0)
  {
    v4 = 2;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("Automation")))
  {
    v4 = 3;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (int)modeSemanticType
{
  if ((*(_BYTE *)&self->_has & 1) != 0)
    return self->_modeSemanticType;
  else
    return 0;
}

- (void)setModeSemanticType:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_modeSemanticType = a3;
}

- (void)setHasModeSemanticType:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasModeSemanticType
{
  return *(_BYTE *)&self->_has & 1;
}

- (id)modeSemanticTypeAsString:(int)a3
{
  if (a3 < 0xA)
    return off_1E2649368[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsModeSemanticType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Custom")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Default")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Sleep")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Driving")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Exercise")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Work")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PersonalTime")) & 1) != 0)
  {
    v4 = 6;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Reading")) & 1) != 0)
  {
    v4 = 7;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Gaming")) & 1) != 0)
  {
    v4 = 8;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("Mindfulness")))
  {
    v4 = 9;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (int)modeUpdateSource
{
  if ((*(_BYTE *)&self->_has & 4) != 0)
    return self->_modeUpdateSource;
  else
    return 0;
}

- (void)setModeUpdateSource:(int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_modeUpdateSource = a3;
}

- (void)setHasModeUpdateSource:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasModeUpdateSource
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (id)modeUpdateSourceAsString:(int)a3
{
  if (a3 < 4)
    return off_1E26493B8[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsModeUpdateSource:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Unknown")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Local")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Cloud")) & 1) != 0)
  {
    v4 = 2;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("Paired")))
  {
    v4 = 3;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (BOOL)hasSemanticModeIdentifier
{
  return self->_semanticModeIdentifier != 0;
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
  v8.super_class = (Class)BMPBUserFocusComputedModeEvent;
  -[BMPBUserFocusComputedModeEvent description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMPBUserFocusComputedModeEvent dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *mode;
  char has;
  void *v7;
  uint64_t modeUpdateReason;
  __CFString *v9;
  uint64_t modeSemanticType;
  __CFString *v11;
  uint64_t modeUpdateSource;
  __CFString *v13;
  NSString *semanticModeIdentifier;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  mode = self->_mode;
  if (mode)
    objc_msgSend(v3, "setObject:forKey:", mode, CFSTR("mode"));
  has = (char)self->_has;
  if ((has & 8) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_starting);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("starting"));

    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_5:
      if ((has & 1) == 0)
        goto LABEL_6;
LABEL_13:
      modeSemanticType = self->_modeSemanticType;
      if (modeSemanticType >= 0xA)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_modeSemanticType);
        v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v11 = off_1E2649368[modeSemanticType];
      }
      objc_msgSend(v4, "setObject:forKey:", v11, CFSTR("modeSemanticType"));

      if ((*(_BYTE *)&self->_has & 4) == 0)
        goto LABEL_21;
      goto LABEL_17;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_5;
  }
  modeUpdateReason = self->_modeUpdateReason;
  if (modeUpdateReason >= 4)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_modeUpdateReason);
    v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = off_1E2649348[modeUpdateReason];
  }
  objc_msgSend(v4, "setObject:forKey:", v9, CFSTR("modeUpdateReason"));

  has = (char)self->_has;
  if ((has & 1) != 0)
    goto LABEL_13;
LABEL_6:
  if ((has & 4) != 0)
  {
LABEL_17:
    modeUpdateSource = self->_modeUpdateSource;
    if (modeUpdateSource >= 4)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_modeUpdateSource);
      v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v13 = off_1E26493B8[modeUpdateSource];
    }
    objc_msgSend(v4, "setObject:forKey:", v13, CFSTR("modeUpdateSource"));

  }
LABEL_21:
  semanticModeIdentifier = self->_semanticModeIdentifier;
  if (semanticModeIdentifier)
    objc_msgSend(v4, "setObject:forKey:", semanticModeIdentifier, CFSTR("semanticModeIdentifier"));
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return BMPBUserFocusComputedModeEventReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  char has;
  id v6;

  v4 = a3;
  v6 = v4;
  if (self->_mode)
  {
    PBDataWriterWriteStringField();
    v4 = v6;
  }
  has = (char)self->_has;
  if ((has & 8) != 0)
  {
    PBDataWriterWriteBOOLField();
    v4 = v6;
    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_5:
      if ((has & 1) == 0)
        goto LABEL_6;
      goto LABEL_13;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_5;
  }
  PBDataWriterWriteInt32Field();
  v4 = v6;
  has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_6:
    if ((has & 4) == 0)
      goto LABEL_8;
    goto LABEL_7;
  }
LABEL_13:
  PBDataWriterWriteInt32Field();
  v4 = v6;
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
LABEL_7:
    PBDataWriterWriteInt32Field();
    v4 = v6;
  }
LABEL_8:
  if (self->_semanticModeIdentifier)
  {
    PBDataWriterWriteStringField();
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
  if (self->_mode)
  {
    objc_msgSend(v4, "setMode:");
    v4 = v6;
  }
  has = (char)self->_has;
  if ((has & 8) != 0)
  {
    *((_BYTE *)v4 + 40) = self->_starting;
    *((_BYTE *)v4 + 44) |= 8u;
    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_5:
      if ((has & 1) == 0)
        goto LABEL_6;
      goto LABEL_13;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_5;
  }
  *((_DWORD *)v4 + 5) = self->_modeUpdateReason;
  *((_BYTE *)v4 + 44) |= 2u;
  has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_6:
    if ((has & 4) == 0)
      goto LABEL_8;
    goto LABEL_7;
  }
LABEL_13:
  *((_DWORD *)v4 + 4) = self->_modeSemanticType;
  *((_BYTE *)v4 + 44) |= 1u;
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
LABEL_7:
    *((_DWORD *)v4 + 6) = self->_modeUpdateSource;
    *((_BYTE *)v4 + 44) |= 4u;
  }
LABEL_8:
  if (self->_semanticModeIdentifier)
  {
    objc_msgSend(v6, "setSemanticModeIdentifier:");
    v4 = v6;
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
  v6 = -[NSString copyWithZone:](self->_mode, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 8);
  *(_QWORD *)(v5 + 8) = v6;

  has = (char)self->_has;
  if ((has & 8) != 0)
  {
    *(_BYTE *)(v5 + 40) = self->_starting;
    *(_BYTE *)(v5 + 44) |= 8u;
    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 1) == 0)
        goto LABEL_4;
LABEL_9:
      *(_DWORD *)(v5 + 16) = self->_modeSemanticType;
      *(_BYTE *)(v5 + 44) |= 1u;
      if ((*(_BYTE *)&self->_has & 4) == 0)
        goto LABEL_6;
      goto LABEL_5;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  *(_DWORD *)(v5 + 20) = self->_modeUpdateReason;
  *(_BYTE *)(v5 + 44) |= 2u;
  has = (char)self->_has;
  if ((has & 1) != 0)
    goto LABEL_9;
LABEL_4:
  if ((has & 4) != 0)
  {
LABEL_5:
    *(_DWORD *)(v5 + 24) = self->_modeUpdateSource;
    *(_BYTE *)(v5 + 44) |= 4u;
  }
LABEL_6:
  v9 = -[NSString copyWithZone:](self->_semanticModeIdentifier, "copyWithZone:", a3);
  v10 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v9;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *mode;
  NSString *semanticModeIdentifier;
  char v7;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_29;
  mode = self->_mode;
  if ((unint64_t)mode | *((_QWORD *)v4 + 1))
  {
    if (!-[NSString isEqual:](mode, "isEqual:"))
      goto LABEL_29;
  }
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    if ((*((_BYTE *)v4 + 44) & 8) != 0)
    {
      if (self->_starting)
      {
        if (!*((_BYTE *)v4 + 40))
          goto LABEL_29;
        goto LABEL_12;
      }
      if (!*((_BYTE *)v4 + 40))
        goto LABEL_12;
    }
LABEL_29:
    v7 = 0;
    goto LABEL_30;
  }
  if ((*((_BYTE *)v4 + 44) & 8) != 0)
    goto LABEL_29;
LABEL_12:
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 44) & 2) == 0 || self->_modeUpdateReason != *((_DWORD *)v4 + 5))
      goto LABEL_29;
  }
  else if ((*((_BYTE *)v4 + 44) & 2) != 0)
  {
    goto LABEL_29;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 44) & 1) == 0 || self->_modeSemanticType != *((_DWORD *)v4 + 4))
      goto LABEL_29;
  }
  else if ((*((_BYTE *)v4 + 44) & 1) != 0)
  {
    goto LABEL_29;
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 44) & 4) == 0 || self->_modeUpdateSource != *((_DWORD *)v4 + 6))
      goto LABEL_29;
  }
  else if ((*((_BYTE *)v4 + 44) & 4) != 0)
  {
    goto LABEL_29;
  }
  semanticModeIdentifier = self->_semanticModeIdentifier;
  if ((unint64_t)semanticModeIdentifier | *((_QWORD *)v4 + 4))
    v7 = -[NSString isEqual:](semanticModeIdentifier, "isEqual:");
  else
    v7 = 1;
LABEL_30:

  return v7;
}

- (unint64_t)hash
{
  NSUInteger v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v3 = -[NSString hash](self->_mode, "hash");
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    v4 = 2654435761 * self->_starting;
    if ((*(_BYTE *)&self->_has & 2) != 0)
    {
LABEL_3:
      v5 = 2654435761 * self->_modeUpdateReason;
      if ((*(_BYTE *)&self->_has & 1) != 0)
        goto LABEL_4;
LABEL_8:
      v6 = 0;
      if ((*(_BYTE *)&self->_has & 4) != 0)
        goto LABEL_5;
LABEL_9:
      v7 = 0;
      return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ -[NSString hash](self->_semanticModeIdentifier, "hash");
    }
  }
  else
  {
    v4 = 0;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_3;
  }
  v5 = 0;
  if ((*(_BYTE *)&self->_has & 1) == 0)
    goto LABEL_8;
LABEL_4:
  v6 = 2654435761 * self->_modeSemanticType;
  if ((*(_BYTE *)&self->_has & 4) == 0)
    goto LABEL_9;
LABEL_5:
  v7 = 2654435761 * self->_modeUpdateSource;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ -[NSString hash](self->_semanticModeIdentifier, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  char v5;
  id v6;

  v4 = a3;
  v6 = v4;
  if (*((_QWORD *)v4 + 1))
  {
    -[BMPBUserFocusComputedModeEvent setMode:](self, "setMode:");
    v4 = v6;
  }
  v5 = *((_BYTE *)v4 + 44);
  if ((v5 & 8) != 0)
  {
    self->_starting = *((_BYTE *)v4 + 40);
    *(_BYTE *)&self->_has |= 8u;
    v5 = *((_BYTE *)v4 + 44);
    if ((v5 & 2) == 0)
    {
LABEL_5:
      if ((v5 & 1) == 0)
        goto LABEL_6;
      goto LABEL_13;
    }
  }
  else if ((*((_BYTE *)v4 + 44) & 2) == 0)
  {
    goto LABEL_5;
  }
  self->_modeUpdateReason = *((_DWORD *)v4 + 5);
  *(_BYTE *)&self->_has |= 2u;
  v5 = *((_BYTE *)v4 + 44);
  if ((v5 & 1) == 0)
  {
LABEL_6:
    if ((v5 & 4) == 0)
      goto LABEL_8;
    goto LABEL_7;
  }
LABEL_13:
  self->_modeSemanticType = *((_DWORD *)v4 + 4);
  *(_BYTE *)&self->_has |= 1u;
  if ((*((_BYTE *)v4 + 44) & 4) != 0)
  {
LABEL_7:
    self->_modeUpdateSource = *((_DWORD *)v4 + 6);
    *(_BYTE *)&self->_has |= 4u;
  }
LABEL_8:
  if (*((_QWORD *)v4 + 4))
  {
    -[BMPBUserFocusComputedModeEvent setSemanticModeIdentifier:](self, "setSemanticModeIdentifier:");
    v4 = v6;
  }

}

- (NSString)mode
{
  return self->_mode;
}

- (void)setMode:(id)a3
{
  objc_storeStrong((id *)&self->_mode, a3);
}

- (BOOL)starting
{
  return self->_starting;
}

- (NSString)semanticModeIdentifier
{
  return self->_semanticModeIdentifier;
}

- (void)setSemanticModeIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_semanticModeIdentifier, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_semanticModeIdentifier, 0);
  objc_storeStrong((id *)&self->_mode, 0);
}

@end
