@implementation HMAccessoryDiagnosticInfoProtoCloudInfo

- (int)cloudState
{
  if ((*(_BYTE *)&self->_has & 1) != 0)
    return self->_cloudState;
  else
    return 0;
}

- (void)setCloudState:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_cloudState = a3;
}

- (void)setHasCloudState:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasCloudState
{
  return *(_BYTE *)&self->_has & 1;
}

- (id)cloudStateAsString:(int)a3
{
  __CFString *v3;

  if (!a3)
    return CFSTR("Unknown");
  if (a3 == 1)
  {
    v3 = CFSTR("Good");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (int)StringAsCloudState:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Unknown")) & 1) != 0)
    v4 = 0;
  else
    v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("Good"));

  return v4;
}

- (int)octagonState
{
  if ((*(_BYTE *)&self->_has & 2) != 0)
    return self->_octagonState;
  else
    return 0;
}

- (void)setOctagonState:(int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_octagonState = a3;
}

- (void)setHasOctagonState:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasOctagonState
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (id)octagonStateAsString:(int)a3
{
  __CFString *v3;

  if (!a3)
    return CFSTR("Unknown");
  if (a3 == 1)
  {
    v3 = CFSTR("Good");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (int)StringAsOctagonState:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Unknown")) & 1) != 0)
    v4 = 0;
  else
    v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("Good"));

  return v4;
}

- (void)setFirstCloudImportComplete:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_firstCloudImportComplete = a3;
}

- (void)setHasFirstCloudImportComplete:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasFirstCloudImportComplete
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
  v8.super_class = (Class)HMAccessoryDiagnosticInfoProtoCloudInfo;
  -[HMAccessoryDiagnosticInfoProtoCloudInfo description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMAccessoryDiagnosticInfoProtoCloudInfo dictionaryRepresentation](self, "dictionaryRepresentation");
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
  int cloudState;
  __CFString *v8;
  int octagonState;
  __CFString *v10;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = (char)self->_has;
  if ((has & 1) == 0)
  {
    if ((*(_BYTE *)&self->_has & 2) == 0)
      goto LABEL_3;
LABEL_12:
    octagonState = self->_octagonState;
    if (octagonState)
    {
      if (octagonState == 1)
      {
        v10 = CFSTR("Good");
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_octagonState);
        v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      v10 = CFSTR("Unknown");
    }
    objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("octagonState"));

    if ((*(_BYTE *)&self->_has & 4) != 0)
      goto LABEL_4;
    return v3;
  }
  cloudState = self->_cloudState;
  if (cloudState)
  {
    if (cloudState == 1)
    {
      v8 = CFSTR("Good");
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_cloudState);
      v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    v8 = CFSTR("Unknown");
  }
  objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("cloudState"));

  has = (char)self->_has;
  if ((has & 2) != 0)
    goto LABEL_12;
LABEL_3:
  if ((has & 4) != 0)
  {
LABEL_4:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_firstCloudImportComplete);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("firstCloudImportComplete"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return HMAccessoryDiagnosticInfoProtoCloudInfoReadFrom((uint64_t)self, (uint64_t)a3);
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
    if ((*(_BYTE *)&self->_has & 2) == 0)
      goto LABEL_3;
LABEL_7:
    PBDataWriterWriteInt32Field();
    v4 = v6;
    if ((*(_BYTE *)&self->_has & 4) == 0)
      goto LABEL_5;
    goto LABEL_4;
  }
  PBDataWriterWriteInt32Field();
  v4 = v6;
  has = (char)self->_has;
  if ((has & 2) != 0)
    goto LABEL_7;
LABEL_3:
  if ((has & 4) != 0)
  {
LABEL_4:
    PBDataWriterWriteBOOLField();
    v4 = v6;
  }
LABEL_5:

}

- (void)copyTo:(id)a3
{
  _DWORD *v4;
  char has;

  v4 = a3;
  has = (char)self->_has;
  if ((has & 1) == 0)
  {
    if ((*(_BYTE *)&self->_has & 2) == 0)
      goto LABEL_3;
LABEL_7:
    v4[3] = self->_octagonState;
    *((_BYTE *)v4 + 20) |= 2u;
    if ((*(_BYTE *)&self->_has & 4) == 0)
      goto LABEL_5;
    goto LABEL_4;
  }
  v4[2] = self->_cloudState;
  *((_BYTE *)v4 + 20) |= 1u;
  has = (char)self->_has;
  if ((has & 2) != 0)
    goto LABEL_7;
LABEL_3:
  if ((has & 4) != 0)
  {
LABEL_4:
    *((_BYTE *)v4 + 16) = self->_firstCloudImportComplete;
    *((_BYTE *)v4 + 20) |= 4u;
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
    *((_DWORD *)result + 2) = self->_cloudState;
    *((_BYTE *)result + 20) |= 1u;
    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 4) == 0)
        return result;
      goto LABEL_4;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)result + 3) = self->_octagonState;
  *((_BYTE *)result + 20) |= 2u;
  if ((*(_BYTE *)&self->_has & 4) == 0)
    return result;
LABEL_4:
  *((_BYTE *)result + 16) = self->_firstCloudImportComplete;
  *((_BYTE *)result + 20) |= 4u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_14;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 20) & 1) == 0 || self->_cloudState != *((_DWORD *)v4 + 2))
      goto LABEL_14;
  }
  else if ((*((_BYTE *)v4 + 20) & 1) != 0)
  {
    goto LABEL_14;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 20) & 2) == 0 || self->_octagonState != *((_DWORD *)v4 + 3))
      goto LABEL_14;
  }
  else if ((*((_BYTE *)v4 + 20) & 2) != 0)
  {
    goto LABEL_14;
  }
  v5 = (*((_BYTE *)v4 + 20) & 4) == 0;
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 20) & 4) == 0)
    {
LABEL_14:
      v5 = 0;
      goto LABEL_15;
    }
    if (self->_firstCloudImportComplete)
    {
      if (!*((_BYTE *)v4 + 16))
        goto LABEL_14;
    }
    else if (*((_BYTE *)v4 + 16))
    {
      goto LABEL_14;
    }
    v5 = 1;
  }
LABEL_15:

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
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_3;
LABEL_6:
    v3 = 0;
    if ((*(_BYTE *)&self->_has & 4) != 0)
      goto LABEL_4;
LABEL_7:
    v4 = 0;
    return v3 ^ v2 ^ v4;
  }
  v2 = 2654435761 * self->_cloudState;
  if ((*(_BYTE *)&self->_has & 2) == 0)
    goto LABEL_6;
LABEL_3:
  v3 = 2654435761 * self->_octagonState;
  if ((*(_BYTE *)&self->_has & 4) == 0)
    goto LABEL_7;
LABEL_4:
  v4 = 2654435761 * self->_firstCloudImportComplete;
  return v3 ^ v2 ^ v4;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  char v5;

  v4 = a3;
  v5 = *((_BYTE *)v4 + 20);
  if ((v5 & 1) == 0)
  {
    if ((*((_BYTE *)v4 + 20) & 2) == 0)
      goto LABEL_3;
LABEL_7:
    self->_octagonState = *((_DWORD *)v4 + 3);
    *(_BYTE *)&self->_has |= 2u;
    if ((*((_BYTE *)v4 + 20) & 4) == 0)
      goto LABEL_5;
    goto LABEL_4;
  }
  self->_cloudState = *((_DWORD *)v4 + 2);
  *(_BYTE *)&self->_has |= 1u;
  v5 = *((_BYTE *)v4 + 20);
  if ((v5 & 2) != 0)
    goto LABEL_7;
LABEL_3:
  if ((v5 & 4) != 0)
  {
LABEL_4:
    self->_firstCloudImportComplete = *((_BYTE *)v4 + 16);
    *(_BYTE *)&self->_has |= 4u;
  }
LABEL_5:

}

- (BOOL)firstCloudImportComplete
{
  return self->_firstCloudImportComplete;
}

@end
