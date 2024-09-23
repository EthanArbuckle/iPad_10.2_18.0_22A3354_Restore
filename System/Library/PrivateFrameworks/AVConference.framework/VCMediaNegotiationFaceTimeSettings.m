@implementation VCMediaNegotiationFaceTimeSettings

- (BOOL)SIPDisabled
{
  _BOOL4 v3;

  v3 = -[VCMediaNegotiationFaceTimeSettings hasCapabilities](self, "hasCapabilities");
  if (v3)
    return (LOBYTE(self->_capabilities) >> 1) & 1;
  return v3;
}

- (BOOL)secureMessagingRequired
{
  _BOOL4 v3;

  v3 = -[VCMediaNegotiationFaceTimeSettings hasCapabilities](self, "hasCapabilities");
  if (v3)
    LOBYTE(v3) = self->_capabilities & 1;
  return v3;
}

- (unsigned)mediaControlInfoFECFeedbackVersion
{
  int v3;

  if (-[VCMediaNegotiationFaceTimeSettings hasMediaControlInfoSubVersion](self, "hasMediaControlInfoSubVersion"))
    return self->_mediaControlInfoSubVersion;
  else
    LOBYTE(v3) = 0;
  return v3;
}

- (unsigned)capabilities
{
  if ((*(_BYTE *)&self->_has & 1) != 0)
    return self->_capabilities;
  else
    return 0;
}

- (void)setCapabilities:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_capabilities = a3;
}

- (void)setHasCapabilities:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasCapabilities
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setSwitches:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_switches = a3;
}

- (void)setHasSwitches:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasSwitches
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setOneToOneModeSupported:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 0x10u;
  self->_oneToOneModeSupported = a3;
}

- (void)setHasOneToOneModeSupported:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xEF | v3;
}

- (BOOL)hasOneToOneModeSupported
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (unsigned)mediaControlInfoSubVersion
{
  if ((*(_BYTE *)&self->_has & 4) != 0)
    return self->_mediaControlInfoSubVersion;
  else
    return 0;
}

- (void)setMediaControlInfoSubVersion:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_mediaControlInfoSubVersion = a3;
}

- (void)setHasMediaControlInfoSubVersion:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasMediaControlInfoSubVersion
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setLinkProbingCapabilityVersion:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_linkProbingCapabilityVersion = a3;
}

- (void)setHasLinkProbingCapabilityVersion:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasLinkProbingCapabilityVersion
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (id)description
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v3.receiver = self;
  v3.super_class = (Class)VCMediaNegotiationFaceTimeSettings;
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ %@"), -[VCMediaNegotiationFaceTimeSettings description](&v3, sel_description), -[VCMediaNegotiationFaceTimeSettings dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  void *v3;
  char has;

  v3 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_capabilities), CFSTR("capabilities"));
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
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_switches), CFSTR("switches"));
  has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_4:
    if ((has & 4) == 0)
      goto LABEL_5;
LABEL_11:
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_mediaControlInfoSubVersion), CFSTR("mediaControlInfoSubVersion"));
    if ((*(_BYTE *)&self->_has & 2) == 0)
      return v3;
    goto LABEL_6;
  }
LABEL_10:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_oneToOneModeSupported), CFSTR("oneToOneModeSupported"));
  has = (char)self->_has;
  if ((has & 4) != 0)
    goto LABEL_11;
LABEL_5:
  if ((has & 2) != 0)
LABEL_6:
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_linkProbingCapabilityVersion), CFSTR("linkProbingCapabilityVersion"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return VCMediaNegotiationFaceTimeSettingsReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has;

  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteUint32Field();
    has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 0x10) == 0)
        goto LABEL_4;
      goto LABEL_9;
    }
  }
  else if ((*(_BYTE *)&self->_has & 8) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint32Field();
  has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_4:
    if ((has & 4) == 0)
      goto LABEL_5;
    goto LABEL_10;
  }
LABEL_9:
  PBDataWriterWriteBOOLField();
  has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_5:
    if ((has & 2) == 0)
      return;
LABEL_11:
    PBDataWriterWriteUint32Field();
    return;
  }
LABEL_10:
  PBDataWriterWriteUint32Field();
  if ((*(_BYTE *)&self->_has & 2) != 0)
    goto LABEL_11;
}

- (void)copyTo:(id)a3
{
  char has;

  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    *((_DWORD *)a3 + 2) = self->_capabilities;
    *((_BYTE *)a3 + 28) |= 1u;
    has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 0x10) == 0)
        goto LABEL_4;
      goto LABEL_9;
    }
  }
  else if ((*(_BYTE *)&self->_has & 8) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)a3 + 5) = self->_switches;
  *((_BYTE *)a3 + 28) |= 8u;
  has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_4:
    if ((has & 4) == 0)
      goto LABEL_5;
    goto LABEL_10;
  }
LABEL_9:
  *((_BYTE *)a3 + 24) = self->_oneToOneModeSupported;
  *((_BYTE *)a3 + 28) |= 0x10u;
  has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_5:
    if ((has & 2) == 0)
      return;
LABEL_11:
    *((_DWORD *)a3 + 3) = self->_linkProbingCapabilityVersion;
    *((_BYTE *)a3 + 28) |= 2u;
    return;
  }
LABEL_10:
  *((_DWORD *)a3 + 4) = self->_mediaControlInfoSubVersion;
  *((_BYTE *)a3 + 28) |= 4u;
  if ((*(_BYTE *)&self->_has & 2) != 0)
    goto LABEL_11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;
  char has;

  result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    *((_DWORD *)result + 2) = self->_capabilities;
    *((_BYTE *)result + 28) |= 1u;
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
  *((_DWORD *)result + 5) = self->_switches;
  *((_BYTE *)result + 28) |= 8u;
  has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_4:
    if ((has & 4) == 0)
      goto LABEL_5;
    goto LABEL_11;
  }
LABEL_10:
  *((_BYTE *)result + 24) = self->_oneToOneModeSupported;
  *((_BYTE *)result + 28) |= 0x10u;
  has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_5:
    if ((has & 2) == 0)
      return result;
    goto LABEL_6;
  }
LABEL_11:
  *((_DWORD *)result + 4) = self->_mediaControlInfoSubVersion;
  *((_BYTE *)result + 28) |= 4u;
  if ((*(_BYTE *)&self->_has & 2) == 0)
    return result;
LABEL_6:
  *((_DWORD *)result + 3) = self->_linkProbingCapabilityVersion;
  *((_BYTE *)result + 28) |= 2u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  int v5;

  v5 = objc_msgSend(a3, "isMemberOfClass:", objc_opt_class());
  if (!v5)
    return v5;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)a3 + 28) & 1) == 0 || self->_capabilities != *((_DWORD *)a3 + 2))
      goto LABEL_29;
  }
  else if ((*((_BYTE *)a3 + 28) & 1) != 0)
  {
    goto LABEL_29;
  }
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    if ((*((_BYTE *)a3 + 28) & 8) == 0 || self->_switches != *((_DWORD *)a3 + 5))
      goto LABEL_29;
  }
  else if ((*((_BYTE *)a3 + 28) & 8) != 0)
  {
    goto LABEL_29;
  }
  if ((*(_BYTE *)&self->_has & 0x10) == 0)
  {
    if ((*((_BYTE *)a3 + 28) & 0x10) != 0)
      goto LABEL_29;
    goto LABEL_20;
  }
  if ((*((_BYTE *)a3 + 28) & 0x10) == 0)
    goto LABEL_29;
  if (self->_oneToOneModeSupported)
  {
    if (!*((_BYTE *)a3 + 24))
      goto LABEL_29;
    goto LABEL_20;
  }
  if (*((_BYTE *)a3 + 24))
  {
LABEL_29:
    LOBYTE(v5) = 0;
    return v5;
  }
LABEL_20:
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((*((_BYTE *)a3 + 28) & 4) == 0 || self->_mediaControlInfoSubVersion != *((_DWORD *)a3 + 4))
      goto LABEL_29;
  }
  else if ((*((_BYTE *)a3 + 28) & 4) != 0)
  {
    goto LABEL_29;
  }
  LOBYTE(v5) = (*((_BYTE *)a3 + 28) & 2) == 0;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)a3 + 28) & 2) == 0 || self->_linkProbingCapabilityVersion != *((_DWORD *)a3 + 3))
      goto LABEL_29;
    LOBYTE(v5) = 1;
  }
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
    v2 = 2654435761 * self->_capabilities;
    if ((*(_BYTE *)&self->_has & 8) != 0)
    {
LABEL_3:
      v3 = 2654435761 * self->_switches;
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
    v4 = 2654435761 * self->_oneToOneModeSupported;
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
  v5 = 2654435761 * self->_mediaControlInfoSubVersion;
  if ((*(_BYTE *)&self->_has & 2) == 0)
    goto LABEL_11;
LABEL_6:
  v6 = 2654435761 * self->_linkProbingCapabilityVersion;
  return v3 ^ v2 ^ v4 ^ v5 ^ v6;
}

- (void)mergeFrom:(id)a3
{
  char v3;

  v3 = *((_BYTE *)a3 + 28);
  if ((v3 & 1) != 0)
  {
    self->_capabilities = *((_DWORD *)a3 + 2);
    *(_BYTE *)&self->_has |= 1u;
    v3 = *((_BYTE *)a3 + 28);
    if ((v3 & 8) == 0)
    {
LABEL_3:
      if ((v3 & 0x10) == 0)
        goto LABEL_4;
      goto LABEL_9;
    }
  }
  else if ((*((_BYTE *)a3 + 28) & 8) == 0)
  {
    goto LABEL_3;
  }
  self->_switches = *((_DWORD *)a3 + 5);
  *(_BYTE *)&self->_has |= 8u;
  v3 = *((_BYTE *)a3 + 28);
  if ((v3 & 0x10) == 0)
  {
LABEL_4:
    if ((v3 & 4) == 0)
      goto LABEL_5;
    goto LABEL_10;
  }
LABEL_9:
  self->_oneToOneModeSupported = *((_BYTE *)a3 + 24);
  *(_BYTE *)&self->_has |= 0x10u;
  v3 = *((_BYTE *)a3 + 28);
  if ((v3 & 4) == 0)
  {
LABEL_5:
    if ((v3 & 2) == 0)
      return;
LABEL_11:
    self->_linkProbingCapabilityVersion = *((_DWORD *)a3 + 3);
    *(_BYTE *)&self->_has |= 2u;
    return;
  }
LABEL_10:
  self->_mediaControlInfoSubVersion = *((_DWORD *)a3 + 4);
  *(_BYTE *)&self->_has |= 4u;
  if ((*((_BYTE *)a3 + 28) & 2) != 0)
    goto LABEL_11;
}

- (unsigned)switches
{
  return self->_switches;
}

- (BOOL)oneToOneModeSupported
{
  return self->_oneToOneModeSupported;
}

- (unsigned)linkProbingCapabilityVersion
{
  return self->_linkProbingCapabilityVersion;
}

@end
