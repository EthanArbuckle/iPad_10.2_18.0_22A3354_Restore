@implementation MTPBSound

- (BOOL)hasToneID
{
  return self->_toneID != 0;
}

- (void)setMediaID:(double)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_mediaID = a3;
}

- (void)setHasMediaID:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasMediaID
{
  return *(_BYTE *)&self->_has & 1;
}

- (BOOL)hasVibeID
{
  return self->_vibeID != 0;
}

- (void)setSoundVolume:(float)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_soundVolume = a3;
}

- (void)setHasSoundVolume:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasSoundVolume
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

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)MTPBSound;
  -[MTPBSound description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MTPBSound dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  double v5;
  NSString *toneID;
  void *v7;
  NSString *vibeID;
  void *v9;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_soundType);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("soundType"));

  toneID = self->_toneID;
  if (toneID)
    objc_msgSend(v3, "setObject:forKey:", toneID, CFSTR("toneID"));
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_mediaID);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("mediaID"));

  }
  vibeID = self->_vibeID;
  if (vibeID)
    objc_msgSend(v3, "setObject:forKey:", vibeID, CFSTR("vibeID"));
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    *(float *)&v5 = self->_soundVolume;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("soundVolume"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return MTPBSoundReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  PBDataWriterWriteUint32Field();
  if (self->_toneID)
    PBDataWriterWriteStringField();
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteDoubleField();
  v4 = v5;
  if (self->_vibeID)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    PBDataWriterWriteFloatField();
    v4 = v5;
  }

}

- (void)copyTo:(id)a3
{
  _DWORD *v4;
  _DWORD *v5;

  v4 = a3;
  v4[4] = self->_soundType;
  v5 = v4;
  if (self->_toneID)
  {
    objc_msgSend(v4, "setToneID:");
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_QWORD *)v4 + 1) = *(_QWORD *)&self->_mediaID;
    *((_BYTE *)v4 + 40) |= 1u;
  }
  if (self->_vibeID)
  {
    objc_msgSend(v5, "setVibeID:");
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    v4[5] = LODWORD(self->_soundVolume);
    *((_BYTE *)v4 + 40) |= 2u;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *(_DWORD *)(v5 + 16) = self->_soundType;
  v6 = -[NSString copyWithZone:](self->_toneID, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v6;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(double *)(v5 + 8) = self->_mediaID;
    *(_BYTE *)(v5 + 40) |= 1u;
  }
  v8 = -[NSString copyWithZone:](self->_vibeID, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v8;

  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    *(float *)(v5 + 20) = self->_soundVolume;
    *(_BYTE *)(v5 + 40) |= 2u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *toneID;
  char has;
  NSString *vibeID;
  BOOL v8;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_17;
  if (self->_soundType != *((_DWORD *)v4 + 4))
    goto LABEL_17;
  toneID = self->_toneID;
  if ((unint64_t)toneID | *((_QWORD *)v4 + 3))
  {
    if (!-[NSString isEqual:](toneID, "isEqual:"))
      goto LABEL_17;
  }
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 40) & 1) == 0 || self->_mediaID != *((double *)v4 + 1))
      goto LABEL_17;
  }
  else if ((*((_BYTE *)v4 + 40) & 1) != 0)
  {
    goto LABEL_17;
  }
  vibeID = self->_vibeID;
  if ((unint64_t)vibeID | *((_QWORD *)v4 + 4))
  {
    if (!-[NSString isEqual:](vibeID, "isEqual:"))
    {
LABEL_17:
      v8 = 0;
      goto LABEL_18;
    }
    has = (char)self->_has;
  }
  v8 = (*((_BYTE *)v4 + 40) & 2) == 0;
  if ((has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 40) & 2) == 0 || self->_soundVolume != *((float *)v4 + 5))
      goto LABEL_17;
    v8 = 1;
  }
LABEL_18:

  return v8;
}

- (unint64_t)hash
{
  unsigned int soundType;
  NSUInteger v4;
  unint64_t v5;
  double mediaID;
  double v7;
  long double v8;
  double v9;
  NSUInteger v10;
  unint64_t v11;
  float soundVolume;
  float v13;
  float v14;
  float v15;

  soundType = self->_soundType;
  v4 = -[NSString hash](self->_toneID, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    mediaID = self->_mediaID;
    v7 = -mediaID;
    if (mediaID >= 0.0)
      v7 = self->_mediaID;
    v8 = floor(v7 + 0.5);
    v9 = (v7 - v8) * 1.84467441e19;
    v5 = 2654435761u * (unint64_t)fmod(v8, 1.84467441e19);
    if (v9 >= 0.0)
    {
      if (v9 > 0.0)
        v5 += (unint64_t)v9;
    }
    else
    {
      v5 -= (unint64_t)fabs(v9);
    }
  }
  else
  {
    v5 = 0;
  }
  v10 = -[NSString hash](self->_vibeID, "hash");
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    soundVolume = self->_soundVolume;
    v13 = -soundVolume;
    if (soundVolume >= 0.0)
      v13 = self->_soundVolume;
    v14 = floorf(v13 + 0.5);
    v15 = (float)(v13 - v14) * 1.8447e19;
    v11 = 2654435761u * (unint64_t)fmodf(v14, 1.8447e19);
    if (v15 >= 0.0)
    {
      if (v15 > 0.0)
        v11 += (unint64_t)v15;
    }
    else
    {
      v11 -= (unint64_t)fabsf(v15);
    }
  }
  else
  {
    v11 = 0;
  }
  return v4 ^ v5 ^ v10 ^ v11 ^ (2654435761 * soundType);
}

- (void)mergeFrom:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  self->_soundType = *((_DWORD *)v4 + 4);
  v5 = v4;
  if (*((_QWORD *)v4 + 3))
  {
    -[MTPBSound setToneID:](self, "setToneID:");
    v4 = v5;
  }
  if ((*((_BYTE *)v4 + 40) & 1) != 0)
  {
    self->_mediaID = *((double *)v4 + 1);
    *(_BYTE *)&self->_has |= 1u;
  }
  if (*((_QWORD *)v4 + 4))
  {
    -[MTPBSound setVibeID:](self, "setVibeID:");
    v4 = v5;
  }
  if ((*((_BYTE *)v4 + 40) & 2) != 0)
  {
    self->_soundVolume = *((float *)v4 + 5);
    *(_BYTE *)&self->_has |= 2u;
  }

}

- (unsigned)soundType
{
  return self->_soundType;
}

- (void)setSoundType:(unsigned int)a3
{
  self->_soundType = a3;
}

- (NSString)toneID
{
  return self->_toneID;
}

- (void)setToneID:(id)a3
{
  objc_storeStrong((id *)&self->_toneID, a3);
}

- (double)mediaID
{
  return self->_mediaID;
}

- (NSString)vibeID
{
  return self->_vibeID;
}

- (void)setVibeID:(id)a3
{
  objc_storeStrong((id *)&self->_vibeID, a3);
}

- (float)soundVolume
{
  return self->_soundVolume;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_vibeID, 0);
  objc_storeStrong((id *)&self->_toneID, 0);
}

@end
