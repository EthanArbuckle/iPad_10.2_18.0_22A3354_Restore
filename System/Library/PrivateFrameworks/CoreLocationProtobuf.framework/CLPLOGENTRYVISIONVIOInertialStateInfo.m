@implementation CLPLOGENTRYVISIONVIOInertialStateInfo

- (void)setStateLengthInBytes:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 1u;
  self->_stateLengthInBytes = a3;
}

- (void)setHasStateLengthInBytes:(BOOL)a3
{
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFE | a3;
}

- (BOOL)hasStateLengthInBytes
{
  return *(_WORD *)&self->_has & 1;
}

- (void)setStateLength:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x200u;
  self->_stateLength = a3;
}

- (void)setHasStateLength:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 512;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFDFF | v3;
}

- (BOOL)hasStateLength
{
  return (*(_WORD *)&self->_has >> 9) & 1;
}

- (void)setOrientationOffset:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_orientationOffset = a3;
}

- (void)setHasOrientationOffset:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (BOOL)hasOrientationOffset
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (void)setOrientationLength:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_orientationLength = a3;
}

- (void)setHasOrientationLength:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (BOOL)hasOrientationLength
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (void)setGyroBiasOffset:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_gyroBiasOffset = a3;
}

- (void)setHasGyroBiasOffset:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (BOOL)hasGyroBiasOffset
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (void)setGyroBiasLength:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_gyroBiasLength = a3;
}

- (void)setHasGyroBiasLength:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (BOOL)hasGyroBiasLength
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (void)setVelocityOffset:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x800u;
  self->_velocityOffset = a3;
}

- (void)setHasVelocityOffset:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 2048;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xF7FF | v3;
}

- (BOOL)hasVelocityOffset
{
  return (*(_WORD *)&self->_has >> 11) & 1;
}

- (void)setVelocityLength:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x400u;
  self->_velocityLength = a3;
}

- (void)setHasVelocityLength:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 1024;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFBFF | v3;
}

- (BOOL)hasVelocityLength
{
  return (*(_WORD *)&self->_has >> 10) & 1;
}

- (void)setAccelBiasOffset:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_accelBiasOffset = a3;
}

- (void)setHasAccelBiasOffset:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (BOOL)hasAccelBiasOffset
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (void)setAccelBiasLength:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_accelBiasLength = a3;
}

- (void)setHasAccelBiasLength:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (BOOL)hasAccelBiasLength
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (void)setPositionOffset:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_positionOffset = a3;
}

- (void)setHasPositionOffset:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 256;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (BOOL)hasPositionOffset
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (void)setPositionLength:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_positionLength = a3;
}

- (void)setHasPositionLength:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 128;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (BOOL)hasPositionLength
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
  v8.super_class = (Class)CLPLOGENTRYVISIONVIOInertialStateInfo;
  -[CLPLOGENTRYVISIONVIOInertialStateInfo description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CLPLOGENTRYVISIONVIOInertialStateInfo dictionaryRepresentation](self, "dictionaryRepresentation");
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
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = (__int16)self->_has;
  if ((has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_stateLengthInBytes);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("state_length_in_bytes"));

    has = (__int16)self->_has;
    if ((has & 0x200) == 0)
    {
LABEL_3:
      if ((has & 0x40) == 0)
        goto LABEL_4;
      goto LABEL_17;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x200) == 0)
  {
    goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_stateLength);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("state_length"));

  has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_4:
    if ((has & 0x20) == 0)
      goto LABEL_5;
    goto LABEL_18;
  }
LABEL_17:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_orientationOffset);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("orientation_offset"));

  has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_5:
    if ((has & 0x10) == 0)
      goto LABEL_6;
    goto LABEL_19;
  }
LABEL_18:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_orientationLength);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("orientation_length"));

  has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_6:
    if ((has & 8) == 0)
      goto LABEL_7;
    goto LABEL_20;
  }
LABEL_19:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_gyroBiasOffset);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v11, CFSTR("gyro_bias_offset"));

  has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_7:
    if ((has & 0x800) == 0)
      goto LABEL_8;
    goto LABEL_21;
  }
LABEL_20:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_gyroBiasLength);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v12, CFSTR("gyro_bias_length"));

  has = (__int16)self->_has;
  if ((has & 0x800) == 0)
  {
LABEL_8:
    if ((has & 0x400) == 0)
      goto LABEL_9;
    goto LABEL_22;
  }
LABEL_21:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_velocityOffset);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v13, CFSTR("velocity_offset"));

  has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_9:
    if ((has & 4) == 0)
      goto LABEL_10;
    goto LABEL_23;
  }
LABEL_22:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_velocityLength);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v14, CFSTR("velocity_length"));

  has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_10:
    if ((has & 2) == 0)
      goto LABEL_11;
    goto LABEL_24;
  }
LABEL_23:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_accelBiasOffset);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v15, CFSTR("accel_bias_offset"));

  has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_11:
    if ((has & 0x100) == 0)
      goto LABEL_12;
LABEL_25:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_positionOffset);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v17, CFSTR("position_offset"));

    if ((*(_WORD *)&self->_has & 0x80) == 0)
      return v3;
    goto LABEL_13;
  }
LABEL_24:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_accelBiasLength);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v16, CFSTR("accel_bias_length"));

  has = (__int16)self->_has;
  if ((has & 0x100) != 0)
    goto LABEL_25;
LABEL_12:
  if ((has & 0x80) != 0)
  {
LABEL_13:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_positionLength);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("position_length"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return CLPLOGENTRYVISIONVIOInertialStateInfoReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  __int16 has;
  id v5;

  v5 = a3;
  has = (__int16)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteUint64Field();
    has = (__int16)self->_has;
    if ((has & 0x200) == 0)
    {
LABEL_3:
      if ((has & 0x40) == 0)
        goto LABEL_4;
      goto LABEL_17;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x200) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint32Field();
  has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_4:
    if ((has & 0x20) == 0)
      goto LABEL_5;
    goto LABEL_18;
  }
LABEL_17:
  PBDataWriterWriteUint32Field();
  has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_5:
    if ((has & 0x10) == 0)
      goto LABEL_6;
    goto LABEL_19;
  }
LABEL_18:
  PBDataWriterWriteUint32Field();
  has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_6:
    if ((has & 8) == 0)
      goto LABEL_7;
    goto LABEL_20;
  }
LABEL_19:
  PBDataWriterWriteUint32Field();
  has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_7:
    if ((has & 0x800) == 0)
      goto LABEL_8;
    goto LABEL_21;
  }
LABEL_20:
  PBDataWriterWriteUint32Field();
  has = (__int16)self->_has;
  if ((has & 0x800) == 0)
  {
LABEL_8:
    if ((has & 0x400) == 0)
      goto LABEL_9;
    goto LABEL_22;
  }
LABEL_21:
  PBDataWriterWriteUint32Field();
  has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_9:
    if ((has & 4) == 0)
      goto LABEL_10;
    goto LABEL_23;
  }
LABEL_22:
  PBDataWriterWriteUint32Field();
  has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_10:
    if ((has & 2) == 0)
      goto LABEL_11;
    goto LABEL_24;
  }
LABEL_23:
  PBDataWriterWriteUint32Field();
  has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_11:
    if ((has & 0x100) == 0)
      goto LABEL_12;
LABEL_25:
    PBDataWriterWriteUint32Field();
    if ((*(_WORD *)&self->_has & 0x80) == 0)
      goto LABEL_14;
    goto LABEL_13;
  }
LABEL_24:
  PBDataWriterWriteUint32Field();
  has = (__int16)self->_has;
  if ((has & 0x100) != 0)
    goto LABEL_25;
LABEL_12:
  if ((has & 0x80) != 0)
LABEL_13:
    PBDataWriterWriteUint32Field();
LABEL_14:

}

- (void)copyTo:(id)a3
{
  _QWORD *v4;
  __int16 has;

  v4 = a3;
  has = (__int16)self->_has;
  if ((has & 1) != 0)
  {
    v4[1] = self->_stateLengthInBytes;
    *((_WORD *)v4 + 30) |= 1u;
    has = (__int16)self->_has;
    if ((has & 0x200) == 0)
    {
LABEL_3:
      if ((has & 0x40) == 0)
        goto LABEL_4;
      goto LABEL_17;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x200) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)v4 + 12) = self->_stateLength;
  *((_WORD *)v4 + 30) |= 0x200u;
  has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_4:
    if ((has & 0x20) == 0)
      goto LABEL_5;
    goto LABEL_18;
  }
LABEL_17:
  *((_DWORD *)v4 + 9) = self->_orientationOffset;
  *((_WORD *)v4 + 30) |= 0x40u;
  has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_5:
    if ((has & 0x10) == 0)
      goto LABEL_6;
    goto LABEL_19;
  }
LABEL_18:
  *((_DWORD *)v4 + 8) = self->_orientationLength;
  *((_WORD *)v4 + 30) |= 0x20u;
  has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_6:
    if ((has & 8) == 0)
      goto LABEL_7;
    goto LABEL_20;
  }
LABEL_19:
  *((_DWORD *)v4 + 7) = self->_gyroBiasOffset;
  *((_WORD *)v4 + 30) |= 0x10u;
  has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_7:
    if ((has & 0x800) == 0)
      goto LABEL_8;
    goto LABEL_21;
  }
LABEL_20:
  *((_DWORD *)v4 + 6) = self->_gyroBiasLength;
  *((_WORD *)v4 + 30) |= 8u;
  has = (__int16)self->_has;
  if ((has & 0x800) == 0)
  {
LABEL_8:
    if ((has & 0x400) == 0)
      goto LABEL_9;
    goto LABEL_22;
  }
LABEL_21:
  *((_DWORD *)v4 + 14) = self->_velocityOffset;
  *((_WORD *)v4 + 30) |= 0x800u;
  has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_9:
    if ((has & 4) == 0)
      goto LABEL_10;
    goto LABEL_23;
  }
LABEL_22:
  *((_DWORD *)v4 + 13) = self->_velocityLength;
  *((_WORD *)v4 + 30) |= 0x400u;
  has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_10:
    if ((has & 2) == 0)
      goto LABEL_11;
    goto LABEL_24;
  }
LABEL_23:
  *((_DWORD *)v4 + 5) = self->_accelBiasOffset;
  *((_WORD *)v4 + 30) |= 4u;
  has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_11:
    if ((has & 0x100) == 0)
      goto LABEL_12;
LABEL_25:
    *((_DWORD *)v4 + 11) = self->_positionOffset;
    *((_WORD *)v4 + 30) |= 0x100u;
    if ((*(_WORD *)&self->_has & 0x80) == 0)
      goto LABEL_14;
    goto LABEL_13;
  }
LABEL_24:
  *((_DWORD *)v4 + 4) = self->_accelBiasLength;
  *((_WORD *)v4 + 30) |= 2u;
  has = (__int16)self->_has;
  if ((has & 0x100) != 0)
    goto LABEL_25;
LABEL_12:
  if ((has & 0x80) != 0)
  {
LABEL_13:
    *((_DWORD *)v4 + 10) = self->_positionLength;
    *((_WORD *)v4 + 30) |= 0x80u;
  }
LABEL_14:

}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;
  __int16 has;

  result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  has = (__int16)self->_has;
  if ((has & 1) != 0)
  {
    *((_QWORD *)result + 1) = self->_stateLengthInBytes;
    *((_WORD *)result + 30) |= 1u;
    has = (__int16)self->_has;
    if ((has & 0x200) == 0)
    {
LABEL_3:
      if ((has & 0x40) == 0)
        goto LABEL_4;
      goto LABEL_17;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x200) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)result + 12) = self->_stateLength;
  *((_WORD *)result + 30) |= 0x200u;
  has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_4:
    if ((has & 0x20) == 0)
      goto LABEL_5;
    goto LABEL_18;
  }
LABEL_17:
  *((_DWORD *)result + 9) = self->_orientationOffset;
  *((_WORD *)result + 30) |= 0x40u;
  has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_5:
    if ((has & 0x10) == 0)
      goto LABEL_6;
    goto LABEL_19;
  }
LABEL_18:
  *((_DWORD *)result + 8) = self->_orientationLength;
  *((_WORD *)result + 30) |= 0x20u;
  has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_6:
    if ((has & 8) == 0)
      goto LABEL_7;
    goto LABEL_20;
  }
LABEL_19:
  *((_DWORD *)result + 7) = self->_gyroBiasOffset;
  *((_WORD *)result + 30) |= 0x10u;
  has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_7:
    if ((has & 0x800) == 0)
      goto LABEL_8;
    goto LABEL_21;
  }
LABEL_20:
  *((_DWORD *)result + 6) = self->_gyroBiasLength;
  *((_WORD *)result + 30) |= 8u;
  has = (__int16)self->_has;
  if ((has & 0x800) == 0)
  {
LABEL_8:
    if ((has & 0x400) == 0)
      goto LABEL_9;
    goto LABEL_22;
  }
LABEL_21:
  *((_DWORD *)result + 14) = self->_velocityOffset;
  *((_WORD *)result + 30) |= 0x800u;
  has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_9:
    if ((has & 4) == 0)
      goto LABEL_10;
    goto LABEL_23;
  }
LABEL_22:
  *((_DWORD *)result + 13) = self->_velocityLength;
  *((_WORD *)result + 30) |= 0x400u;
  has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_10:
    if ((has & 2) == 0)
      goto LABEL_11;
    goto LABEL_24;
  }
LABEL_23:
  *((_DWORD *)result + 5) = self->_accelBiasOffset;
  *((_WORD *)result + 30) |= 4u;
  has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_11:
    if ((has & 0x100) == 0)
      goto LABEL_12;
    goto LABEL_25;
  }
LABEL_24:
  *((_DWORD *)result + 4) = self->_accelBiasLength;
  *((_WORD *)result + 30) |= 2u;
  has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_12:
    if ((has & 0x80) == 0)
      return result;
    goto LABEL_13;
  }
LABEL_25:
  *((_DWORD *)result + 11) = self->_positionOffset;
  *((_WORD *)result + 30) |= 0x100u;
  if ((*(_WORD *)&self->_has & 0x80) == 0)
    return result;
LABEL_13:
  *((_DWORD *)result + 10) = self->_positionLength;
  *((_WORD *)result + 30) |= 0x80u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  __int16 has;
  __int16 v6;
  BOOL v7;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_62;
  has = (__int16)self->_has;
  v6 = *((_WORD *)v4 + 30);
  if ((has & 1) != 0)
  {
    if ((v6 & 1) == 0 || self->_stateLengthInBytes != *((_QWORD *)v4 + 1))
      goto LABEL_62;
  }
  else if ((v6 & 1) != 0)
  {
LABEL_62:
    v7 = 0;
    goto LABEL_63;
  }
  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
    if ((*((_WORD *)v4 + 30) & 0x200) == 0 || self->_stateLength != *((_DWORD *)v4 + 12))
      goto LABEL_62;
  }
  else if ((*((_WORD *)v4 + 30) & 0x200) != 0)
  {
    goto LABEL_62;
  }
  if ((has & 0x40) != 0)
  {
    if ((v6 & 0x40) == 0 || self->_orientationOffset != *((_DWORD *)v4 + 9))
      goto LABEL_62;
  }
  else if ((v6 & 0x40) != 0)
  {
    goto LABEL_62;
  }
  if ((has & 0x20) != 0)
  {
    if ((v6 & 0x20) == 0 || self->_orientationLength != *((_DWORD *)v4 + 8))
      goto LABEL_62;
  }
  else if ((v6 & 0x20) != 0)
  {
    goto LABEL_62;
  }
  if ((has & 0x10) != 0)
  {
    if ((v6 & 0x10) == 0 || self->_gyroBiasOffset != *((_DWORD *)v4 + 7))
      goto LABEL_62;
  }
  else if ((v6 & 0x10) != 0)
  {
    goto LABEL_62;
  }
  if ((has & 8) != 0)
  {
    if ((v6 & 8) == 0 || self->_gyroBiasLength != *((_DWORD *)v4 + 6))
      goto LABEL_62;
  }
  else if ((v6 & 8) != 0)
  {
    goto LABEL_62;
  }
  if ((*(_WORD *)&self->_has & 0x800) != 0)
  {
    if ((*((_WORD *)v4 + 30) & 0x800) == 0 || self->_velocityOffset != *((_DWORD *)v4 + 14))
      goto LABEL_62;
  }
  else if ((*((_WORD *)v4 + 30) & 0x800) != 0)
  {
    goto LABEL_62;
  }
  if ((*(_WORD *)&self->_has & 0x400) != 0)
  {
    if ((*((_WORD *)v4 + 30) & 0x400) == 0 || self->_velocityLength != *((_DWORD *)v4 + 13))
      goto LABEL_62;
  }
  else if ((*((_WORD *)v4 + 30) & 0x400) != 0)
  {
    goto LABEL_62;
  }
  if ((has & 4) != 0)
  {
    if ((v6 & 4) == 0 || self->_accelBiasOffset != *((_DWORD *)v4 + 5))
      goto LABEL_62;
  }
  else if ((v6 & 4) != 0)
  {
    goto LABEL_62;
  }
  if ((has & 2) != 0)
  {
    if ((v6 & 2) == 0 || self->_accelBiasLength != *((_DWORD *)v4 + 4))
      goto LABEL_62;
  }
  else if ((v6 & 2) != 0)
  {
    goto LABEL_62;
  }
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
    if ((*((_WORD *)v4 + 30) & 0x100) == 0 || self->_positionOffset != *((_DWORD *)v4 + 11))
      goto LABEL_62;
  }
  else if ((*((_WORD *)v4 + 30) & 0x100) != 0)
  {
    goto LABEL_62;
  }
  if ((has & 0x80) != 0)
  {
    if ((v6 & 0x80) == 0 || self->_positionLength != *((_DWORD *)v4 + 10))
      goto LABEL_62;
    v7 = 1;
  }
  else
  {
    v7 = (v6 & 0x80) == 0;
  }
LABEL_63:

  return v7;
}

- (unint64_t)hash
{
  __int16 has;
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  has = (__int16)self->_has;
  if ((has & 1) != 0)
  {
    v3 = 2654435761u * self->_stateLengthInBytes;
    if ((*(_WORD *)&self->_has & 0x200) != 0)
    {
LABEL_3:
      v4 = 2654435761 * self->_stateLength;
      if ((has & 0x40) != 0)
        goto LABEL_4;
      goto LABEL_16;
    }
  }
  else
  {
    v3 = 0;
    if ((*(_WORD *)&self->_has & 0x200) != 0)
      goto LABEL_3;
  }
  v4 = 0;
  if ((has & 0x40) != 0)
  {
LABEL_4:
    v5 = 2654435761 * self->_orientationOffset;
    if ((has & 0x20) != 0)
      goto LABEL_5;
    goto LABEL_17;
  }
LABEL_16:
  v5 = 0;
  if ((has & 0x20) != 0)
  {
LABEL_5:
    v6 = 2654435761 * self->_orientationLength;
    if ((has & 0x10) != 0)
      goto LABEL_6;
    goto LABEL_18;
  }
LABEL_17:
  v6 = 0;
  if ((has & 0x10) != 0)
  {
LABEL_6:
    v7 = 2654435761 * self->_gyroBiasOffset;
    if ((has & 8) != 0)
      goto LABEL_7;
    goto LABEL_19;
  }
LABEL_18:
  v7 = 0;
  if ((has & 8) != 0)
  {
LABEL_7:
    v8 = 2654435761 * self->_gyroBiasLength;
    if ((*(_WORD *)&self->_has & 0x800) != 0)
      goto LABEL_8;
    goto LABEL_20;
  }
LABEL_19:
  v8 = 0;
  if ((*(_WORD *)&self->_has & 0x800) != 0)
  {
LABEL_8:
    v9 = 2654435761 * self->_velocityOffset;
    if ((*(_WORD *)&self->_has & 0x400) != 0)
      goto LABEL_9;
    goto LABEL_21;
  }
LABEL_20:
  v9 = 0;
  if ((*(_WORD *)&self->_has & 0x400) != 0)
  {
LABEL_9:
    v10 = 2654435761 * self->_velocityLength;
    if ((has & 4) != 0)
      goto LABEL_10;
    goto LABEL_22;
  }
LABEL_21:
  v10 = 0;
  if ((has & 4) != 0)
  {
LABEL_10:
    v11 = 2654435761 * self->_accelBiasOffset;
    if ((has & 2) != 0)
      goto LABEL_11;
    goto LABEL_23;
  }
LABEL_22:
  v11 = 0;
  if ((has & 2) != 0)
  {
LABEL_11:
    v12 = 2654435761 * self->_accelBiasLength;
    if ((*(_WORD *)&self->_has & 0x100) != 0)
      goto LABEL_12;
LABEL_24:
    v13 = 0;
    if ((has & 0x80) != 0)
      goto LABEL_13;
LABEL_25:
    v14 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14;
  }
LABEL_23:
  v12 = 0;
  if ((*(_WORD *)&self->_has & 0x100) == 0)
    goto LABEL_24;
LABEL_12:
  v13 = 2654435761 * self->_positionOffset;
  if ((has & 0x80) == 0)
    goto LABEL_25;
LABEL_13:
  v14 = 2654435761 * self->_positionLength;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  __int16 v5;

  v4 = a3;
  v5 = *((_WORD *)v4 + 30);
  if ((v5 & 1) != 0)
  {
    self->_stateLengthInBytes = *((_QWORD *)v4 + 1);
    *(_WORD *)&self->_has |= 1u;
    v5 = *((_WORD *)v4 + 30);
    if ((v5 & 0x200) == 0)
    {
LABEL_3:
      if ((v5 & 0x40) == 0)
        goto LABEL_4;
      goto LABEL_17;
    }
  }
  else if ((*((_WORD *)v4 + 30) & 0x200) == 0)
  {
    goto LABEL_3;
  }
  self->_stateLength = *((_DWORD *)v4 + 12);
  *(_WORD *)&self->_has |= 0x200u;
  v5 = *((_WORD *)v4 + 30);
  if ((v5 & 0x40) == 0)
  {
LABEL_4:
    if ((v5 & 0x20) == 0)
      goto LABEL_5;
    goto LABEL_18;
  }
LABEL_17:
  self->_orientationOffset = *((_DWORD *)v4 + 9);
  *(_WORD *)&self->_has |= 0x40u;
  v5 = *((_WORD *)v4 + 30);
  if ((v5 & 0x20) == 0)
  {
LABEL_5:
    if ((v5 & 0x10) == 0)
      goto LABEL_6;
    goto LABEL_19;
  }
LABEL_18:
  self->_orientationLength = *((_DWORD *)v4 + 8);
  *(_WORD *)&self->_has |= 0x20u;
  v5 = *((_WORD *)v4 + 30);
  if ((v5 & 0x10) == 0)
  {
LABEL_6:
    if ((v5 & 8) == 0)
      goto LABEL_7;
    goto LABEL_20;
  }
LABEL_19:
  self->_gyroBiasOffset = *((_DWORD *)v4 + 7);
  *(_WORD *)&self->_has |= 0x10u;
  v5 = *((_WORD *)v4 + 30);
  if ((v5 & 8) == 0)
  {
LABEL_7:
    if ((v5 & 0x800) == 0)
      goto LABEL_8;
    goto LABEL_21;
  }
LABEL_20:
  self->_gyroBiasLength = *((_DWORD *)v4 + 6);
  *(_WORD *)&self->_has |= 8u;
  v5 = *((_WORD *)v4 + 30);
  if ((v5 & 0x800) == 0)
  {
LABEL_8:
    if ((v5 & 0x400) == 0)
      goto LABEL_9;
    goto LABEL_22;
  }
LABEL_21:
  self->_velocityOffset = *((_DWORD *)v4 + 14);
  *(_WORD *)&self->_has |= 0x800u;
  v5 = *((_WORD *)v4 + 30);
  if ((v5 & 0x400) == 0)
  {
LABEL_9:
    if ((v5 & 4) == 0)
      goto LABEL_10;
    goto LABEL_23;
  }
LABEL_22:
  self->_velocityLength = *((_DWORD *)v4 + 13);
  *(_WORD *)&self->_has |= 0x400u;
  v5 = *((_WORD *)v4 + 30);
  if ((v5 & 4) == 0)
  {
LABEL_10:
    if ((v5 & 2) == 0)
      goto LABEL_11;
    goto LABEL_24;
  }
LABEL_23:
  self->_accelBiasOffset = *((_DWORD *)v4 + 5);
  *(_WORD *)&self->_has |= 4u;
  v5 = *((_WORD *)v4 + 30);
  if ((v5 & 2) == 0)
  {
LABEL_11:
    if ((v5 & 0x100) == 0)
      goto LABEL_12;
LABEL_25:
    self->_positionOffset = *((_DWORD *)v4 + 11);
    *(_WORD *)&self->_has |= 0x100u;
    if ((*((_WORD *)v4 + 30) & 0x80) == 0)
      goto LABEL_14;
    goto LABEL_13;
  }
LABEL_24:
  self->_accelBiasLength = *((_DWORD *)v4 + 4);
  *(_WORD *)&self->_has |= 2u;
  v5 = *((_WORD *)v4 + 30);
  if ((v5 & 0x100) != 0)
    goto LABEL_25;
LABEL_12:
  if ((v5 & 0x80) != 0)
  {
LABEL_13:
    self->_positionLength = *((_DWORD *)v4 + 10);
    *(_WORD *)&self->_has |= 0x80u;
  }
LABEL_14:

}

- (unint64_t)stateLengthInBytes
{
  return self->_stateLengthInBytes;
}

- (unsigned)stateLength
{
  return self->_stateLength;
}

- (unsigned)orientationOffset
{
  return self->_orientationOffset;
}

- (unsigned)orientationLength
{
  return self->_orientationLength;
}

- (unsigned)gyroBiasOffset
{
  return self->_gyroBiasOffset;
}

- (unsigned)gyroBiasLength
{
  return self->_gyroBiasLength;
}

- (unsigned)velocityOffset
{
  return self->_velocityOffset;
}

- (unsigned)velocityLength
{
  return self->_velocityLength;
}

- (unsigned)accelBiasOffset
{
  return self->_accelBiasOffset;
}

- (unsigned)accelBiasLength
{
  return self->_accelBiasLength;
}

- (unsigned)positionOffset
{
  return self->_positionOffset;
}

- (unsigned)positionLength
{
  return self->_positionLength;
}

@end
