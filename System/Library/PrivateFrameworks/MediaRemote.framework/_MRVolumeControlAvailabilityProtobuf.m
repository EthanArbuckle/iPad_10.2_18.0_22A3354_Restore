@implementation _MRVolumeControlAvailabilityProtobuf

- (void)setVolumeControlAvailable:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_volumeControlAvailable = a3;
}

- (void)setHasVolumeControlAvailable:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasVolumeControlAvailable
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setVolumeCapabilities:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_volumeCapabilities = a3;
}

- (void)setHasVolumeCapabilities:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasVolumeCapabilities
{
  return *(_BYTE *)&self->_has & 1;
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
  v8.super_class = (Class)_MRVolumeControlAvailabilityProtobuf;
  -[_MRVolumeControlAvailabilityProtobuf description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MRVolumeControlAvailabilityProtobuf dictionaryRepresentation](self, "dictionaryRepresentation");
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
  void *v6;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_volumeControlAvailable);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("volumeControlAvailable"));

    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_volumeCapabilities);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("volumeCapabilities"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return _MRVolumeControlAvailabilityProtobufReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  char has;
  id v6;

  v4 = a3;
  has = (char)self->_has;
  v6 = v4;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteBOOLField();
    v4 = v6;
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    PBDataWriterWriteInt32Field();
    v4 = v6;
  }

}

- (void)copyTo:(id)a3
{
  _BYTE *v4;
  char has;

  v4 = a3;
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v4[12] = self->_volumeControlAvailable;
    v4[16] |= 2u;
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    *((_DWORD *)v4 + 2) = self->_volumeCapabilities;
    v4[16] |= 1u;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;
  char has;

  result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((_BYTE *)result + 12) = self->_volumeControlAvailable;
    *((_BYTE *)result + 16) |= 2u;
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    *((_DWORD *)result + 2) = self->_volumeCapabilities;
    *((_BYTE *)result + 16) |= 1u;
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_14;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 16) & 2) != 0)
    {
      if (self->_volumeControlAvailable)
      {
        if (!*((_BYTE *)v4 + 12))
          goto LABEL_14;
        goto LABEL_10;
      }
      if (!*((_BYTE *)v4 + 12))
        goto LABEL_10;
    }
LABEL_14:
    v5 = 0;
    goto LABEL_15;
  }
  if ((*((_BYTE *)v4 + 16) & 2) != 0)
    goto LABEL_14;
LABEL_10:
  v5 = (*((_BYTE *)v4 + 16) & 1) == 0;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 16) & 1) == 0 || self->_volumeCapabilities != *((_DWORD *)v4 + 2))
      goto LABEL_14;
    v5 = 1;
  }
LABEL_15:

  return v5;
}

- (unint64_t)hash
{
  uint64_t v2;
  uint64_t v3;

  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    v2 = 2654435761 * self->_volumeControlAvailable;
    if ((*(_BYTE *)&self->_has & 1) != 0)
      goto LABEL_3;
LABEL_5:
    v3 = 0;
    return v3 ^ v2;
  }
  v2 = 0;
  if ((*(_BYTE *)&self->_has & 1) == 0)
    goto LABEL_5;
LABEL_3:
  v3 = 2654435761 * self->_volumeCapabilities;
  return v3 ^ v2;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  char v5;

  v4 = a3;
  v5 = *((_BYTE *)v4 + 16);
  if ((v5 & 2) != 0)
  {
    self->_volumeControlAvailable = *((_BYTE *)v4 + 12);
    *(_BYTE *)&self->_has |= 2u;
    v5 = *((_BYTE *)v4 + 16);
  }
  if ((v5 & 1) != 0)
  {
    self->_volumeCapabilities = *((_DWORD *)v4 + 2);
    *(_BYTE *)&self->_has |= 1u;
  }

}

- (BOOL)volumeControlAvailable
{
  return self->_volumeControlAvailable;
}

- (int)volumeCapabilities
{
  return self->_volumeCapabilities;
}

@end
