@implementation VCMediaNegotiationBlobVideoRuleCollection

- (id)transportAsString:(int)a3
{
  if (a3 == 1)
    return CFSTR("NEGOTIATION_TRANSPORT_TYPE_WIFI");
  if (a3 == 2)
    return CFSTR("NEGOTIATION_TRANSPORT_TYPE_CELLULAR");
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
}

- (int)StringAsTransport:(id)a3
{
  int v4;

  v4 = 1;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("NEGOTIATION_TRANSPORT_TYPE_WIFI")) & 1) == 0)
  {
    if (objc_msgSend(a3, "isEqualToString:", CFSTR("NEGOTIATION_TRANSPORT_TYPE_CELLULAR")))
      return 2;
    else
      return 1;
  }
  return v4;
}

- (id)operationAsString:(int)a3
{
  if (a3 == 1)
    return CFSTR("NEGOTIATION_OPERATION_TYPE_ENCODE");
  if (a3 == 2)
    return CFSTR("NEGOTIATION_OPERATION_TYPE_DECODE");
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
}

- (int)StringAsOperation:(id)a3
{
  int v4;

  v4 = 1;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("NEGOTIATION_OPERATION_TYPE_ENCODE")) & 1) == 0)
  {
    if (objc_msgSend(a3, "isEqualToString:", CFSTR("NEGOTIATION_OPERATION_TYPE_DECODE")))
      return 2;
    else
      return 1;
  }
  return v4;
}

- (void)setPreferredFormat:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_preferredFormat = a3;
}

- (void)setHasPreferredFormat:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasPreferredFormat
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setFormatsExt1:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_formatsExt1 = a3;
}

- (void)setHasFormatsExt1:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasFormatsExt1
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setPreferredFormatExt1:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_preferredFormatExt1 = a3;
}

- (void)setHasPreferredFormatExt1:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasPreferredFormatExt1
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (id)description
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v3.receiver = self;
  v3.super_class = (Class)VCMediaNegotiationBlobVideoRuleCollection;
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ %@"), -[VCMediaNegotiationBlobVideoRuleCollection description](&v3, sel_description), -[VCMediaNegotiationBlobVideoRuleCollection dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  void *v3;
  int transport;
  const __CFString *v5;
  int operation;
  const __CFString *v7;
  char has;

  v3 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  transport = self->_transport;
  if (transport == 1)
  {
    v5 = CFSTR("NEGOTIATION_TRANSPORT_TYPE_WIFI");
  }
  else if (transport == 2)
  {
    v5 = CFSTR("NEGOTIATION_TRANSPORT_TYPE_CELLULAR");
  }
  else
  {
    v5 = (const __CFString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_transport);
  }
  objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("transport"));
  operation = self->_operation;
  if (operation == 1)
  {
    v7 = CFSTR("NEGOTIATION_OPERATION_TYPE_ENCODE");
  }
  else if (operation == 2)
  {
    v7 = CFSTR("NEGOTIATION_OPERATION_TYPE_DECODE");
  }
  else
  {
    v7 = (const __CFString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_operation);
  }
  objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("operation"));
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_formats), CFSTR("formats"));
  has = (char)self->_has;
  if ((has & 2) == 0)
  {
    if ((*(_BYTE *)&self->_has & 1) == 0)
      goto LABEL_13;
LABEL_17:
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_formatsExt1), CFSTR("formatsExt1"));
    if ((*(_BYTE *)&self->_has & 4) == 0)
      return v3;
    goto LABEL_14;
  }
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_preferredFormat), CFSTR("preferredFormat"));
  has = (char)self->_has;
  if ((has & 1) != 0)
    goto LABEL_17;
LABEL_13:
  if ((has & 4) != 0)
LABEL_14:
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_preferredFormatExt1), CFSTR("preferredFormatExt1"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return VCMediaNegotiationBlobVideoRuleCollectionReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has;

  PBDataWriterWriteInt32Field();
  PBDataWriterWriteInt32Field();
  PBDataWriterWriteUint32Field();
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteUint32Field();
    has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 4) == 0)
        return;
LABEL_7:
      PBDataWriterWriteUint32Field();
      return;
    }
  }
  else if ((*(_BYTE *)&self->_has & 1) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint32Field();
  if ((*(_BYTE *)&self->_has & 4) != 0)
    goto LABEL_7;
}

- (void)copyTo:(id)a3
{
  char has;

  *((_DWORD *)a3 + 7) = self->_transport;
  *((_DWORD *)a3 + 4) = self->_operation;
  *((_DWORD *)a3 + 2) = self->_formats;
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((_DWORD *)a3 + 5) = self->_preferredFormat;
    *((_BYTE *)a3 + 32) |= 2u;
    has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 4) == 0)
        return;
LABEL_7:
      *((_DWORD *)a3 + 6) = self->_preferredFormatExt1;
      *((_BYTE *)a3 + 32) |= 4u;
      return;
    }
  }
  else if ((*(_BYTE *)&self->_has & 1) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)a3 + 3) = self->_formatsExt1;
  *((_BYTE *)a3 + 32) |= 1u;
  if ((*(_BYTE *)&self->_has & 4) != 0)
    goto LABEL_7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;
  char has;

  result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *((_DWORD *)result + 7) = self->_transport;
  *((_DWORD *)result + 4) = self->_operation;
  *((_DWORD *)result + 2) = self->_formats;
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((_DWORD *)result + 5) = self->_preferredFormat;
    *((_BYTE *)result + 32) |= 2u;
    has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 4) == 0)
        return result;
      goto LABEL_4;
    }
  }
  else if ((*(_BYTE *)&self->_has & 1) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)result + 3) = self->_formatsExt1;
  *((_BYTE *)result + 32) |= 1u;
  if ((*(_BYTE *)&self->_has & 4) == 0)
    return result;
LABEL_4:
  *((_DWORD *)result + 6) = self->_preferredFormatExt1;
  *((_BYTE *)result + 32) |= 4u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  int v5;

  v5 = objc_msgSend(a3, "isMemberOfClass:", objc_opt_class());
  if (v5)
  {
    if (self->_transport != *((_DWORD *)a3 + 7)
      || self->_operation != *((_DWORD *)a3 + 4)
      || self->_formats != *((_DWORD *)a3 + 2))
    {
      goto LABEL_19;
    }
    if ((*(_BYTE *)&self->_has & 2) != 0)
    {
      if ((*((_BYTE *)a3 + 32) & 2) == 0 || self->_preferredFormat != *((_DWORD *)a3 + 5))
        goto LABEL_19;
    }
    else if ((*((_BYTE *)a3 + 32) & 2) != 0)
    {
LABEL_19:
      LOBYTE(v5) = 0;
      return v5;
    }
    if ((*(_BYTE *)&self->_has & 1) != 0)
    {
      if ((*((_BYTE *)a3 + 32) & 1) == 0 || self->_formatsExt1 != *((_DWORD *)a3 + 3))
        goto LABEL_19;
    }
    else if ((*((_BYTE *)a3 + 32) & 1) != 0)
    {
      goto LABEL_19;
    }
    LOBYTE(v5) = (*((_BYTE *)a3 + 32) & 4) == 0;
    if ((*(_BYTE *)&self->_has & 4) != 0)
    {
      if ((*((_BYTE *)a3 + 32) & 4) == 0 || self->_preferredFormatExt1 != *((_DWORD *)a3 + 6))
        goto LABEL_19;
      LOBYTE(v5) = 1;
    }
  }
  return v5;
}

- (unint64_t)hash
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  if ((*(_BYTE *)&self->_has & 2) != 0)
    v2 = 2654435761 * self->_preferredFormat;
  else
    v2 = 0;
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v3 = 2654435761 * self->_formatsExt1;
  else
    v3 = 0;
  if ((*(_BYTE *)&self->_has & 4) != 0)
    v4 = 2654435761 * self->_preferredFormatExt1;
  else
    v4 = 0;
  return (2654435761 * self->_operation) ^ (2654435761 * self->_transport) ^ (2654435761 * self->_formats) ^ v2 ^ v3 ^ v4;
}

- (void)mergeFrom:(id)a3
{
  char v3;

  self->_transport = *((_DWORD *)a3 + 7);
  self->_operation = *((_DWORD *)a3 + 4);
  self->_formats = *((_DWORD *)a3 + 2);
  v3 = *((_BYTE *)a3 + 32);
  if ((v3 & 2) != 0)
  {
    self->_preferredFormat = *((_DWORD *)a3 + 5);
    *(_BYTE *)&self->_has |= 2u;
    v3 = *((_BYTE *)a3 + 32);
    if ((v3 & 1) == 0)
    {
LABEL_3:
      if ((v3 & 4) == 0)
        return;
LABEL_7:
      self->_preferredFormatExt1 = *((_DWORD *)a3 + 6);
      *(_BYTE *)&self->_has |= 4u;
      return;
    }
  }
  else if ((*((_BYTE *)a3 + 32) & 1) == 0)
  {
    goto LABEL_3;
  }
  self->_formatsExt1 = *((_DWORD *)a3 + 3);
  *(_BYTE *)&self->_has |= 1u;
  if ((*((_BYTE *)a3 + 32) & 4) != 0)
    goto LABEL_7;
}

- (int)transport
{
  return self->_transport;
}

- (void)setTransport:(int)a3
{
  self->_transport = a3;
}

- (int)operation
{
  return self->_operation;
}

- (void)setOperation:(int)a3
{
  self->_operation = a3;
}

- (unsigned)formats
{
  return self->_formats;
}

- (void)setFormats:(unsigned int)a3
{
  self->_formats = a3;
}

- (unsigned)preferredFormat
{
  return self->_preferredFormat;
}

- (unsigned)formatsExt1
{
  return self->_formatsExt1;
}

- (unsigned)preferredFormatExt1
{
  return self->_preferredFormatExt1;
}

@end
