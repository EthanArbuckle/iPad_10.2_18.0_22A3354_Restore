@implementation CLPLOGENTRYVISIONVIOInertialCovarianceInfo

- (void)setCovarianceSizeInBytes:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 1u;
  self->_covarianceSizeInBytes = a3;
}

- (void)setHasCovarianceSizeInBytes:(BOOL)a3
{
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFE | a3;
}

- (BOOL)hasCovarianceSizeInBytes
{
  return *(_WORD *)&self->_has & 1;
}

- (void)setCovarianceSize:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_covarianceSize = a3;
}

- (void)setHasCovarianceSize:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (BOOL)hasCovarianceSize
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (void)setOrientationCovOffset:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_orientationCovOffset = a3;
}

- (void)setHasOrientationCovOffset:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (BOOL)hasOrientationCovOffset
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (void)setOrientationDof:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_orientationDof = a3;
}

- (void)setHasOrientationDof:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 128;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (BOOL)hasOrientationDof
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (void)setGyroBiasCovOffset:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_gyroBiasCovOffset = a3;
}

- (void)setHasGyroBiasCovOffset:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (BOOL)hasGyroBiasCovOffset
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (void)setGyroBiasDof:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_gyroBiasDof = a3;
}

- (void)setHasGyroBiasDof:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (BOOL)hasGyroBiasDof
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (void)setVelocityCovOffset:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x400u;
  self->_velocityCovOffset = a3;
}

- (void)setHasVelocityCovOffset:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 1024;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFBFF | v3;
}

- (BOOL)hasVelocityCovOffset
{
  return (*(_WORD *)&self->_has >> 10) & 1;
}

- (void)setVelocityDof:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x800u;
  self->_velocityDof = a3;
}

- (void)setHasVelocityDof:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 2048;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xF7FF | v3;
}

- (BOOL)hasVelocityDof
{
  return (*(_WORD *)&self->_has >> 11) & 1;
}

- (void)setAccelBiasCovOffset:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_accelBiasCovOffset = a3;
}

- (void)setHasAccelBiasCovOffset:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (BOOL)hasAccelBiasCovOffset
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (void)setAccelBiasDof:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_accelBiasDof = a3;
}

- (void)setHasAccelBiasDof:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (BOOL)hasAccelBiasDof
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (void)setPositionCovOffset:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_positionCovOffset = a3;
}

- (void)setHasPositionCovOffset:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 256;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (BOOL)hasPositionCovOffset
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (void)setPositionDof:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x200u;
  self->_positionDof = a3;
}

- (void)setHasPositionDof:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 512;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFDFF | v3;
}

- (BOOL)hasPositionDof
{
  return (*(_WORD *)&self->_has >> 9) & 1;
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
  v8.super_class = (Class)CLPLOGENTRYVISIONVIOInertialCovarianceInfo;
  -[CLPLOGENTRYVISIONVIOInertialCovarianceInfo description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CLPLOGENTRYVISIONVIOInertialCovarianceInfo dictionaryRepresentation](self, "dictionaryRepresentation");
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
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_covarianceSizeInBytes);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("covariance_size_in_bytes"));

    has = (__int16)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 0x40) == 0)
        goto LABEL_4;
      goto LABEL_17;
    }
  }
  else if ((has & 8) == 0)
  {
    goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_covarianceSize);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("covariance_size"));

  has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_4:
    if ((has & 0x80) == 0)
      goto LABEL_5;
    goto LABEL_18;
  }
LABEL_17:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_orientationCovOffset);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("orientation_cov_offset"));

  has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_5:
    if ((has & 0x10) == 0)
      goto LABEL_6;
    goto LABEL_19;
  }
LABEL_18:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_orientationDof);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("orientation_dof"));

  has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_6:
    if ((has & 0x20) == 0)
      goto LABEL_7;
    goto LABEL_20;
  }
LABEL_19:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_gyroBiasCovOffset);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v11, CFSTR("gyro_bias_cov_offset"));

  has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_7:
    if ((has & 0x400) == 0)
      goto LABEL_8;
    goto LABEL_21;
  }
LABEL_20:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_gyroBiasDof);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v12, CFSTR("gyro_bias_dof"));

  has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_8:
    if ((has & 0x800) == 0)
      goto LABEL_9;
    goto LABEL_22;
  }
LABEL_21:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_velocityCovOffset);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v13, CFSTR("velocity_cov_offset"));

  has = (__int16)self->_has;
  if ((has & 0x800) == 0)
  {
LABEL_9:
    if ((has & 2) == 0)
      goto LABEL_10;
    goto LABEL_23;
  }
LABEL_22:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_velocityDof);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v14, CFSTR("velocity_dof"));

  has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_10:
    if ((has & 4) == 0)
      goto LABEL_11;
    goto LABEL_24;
  }
LABEL_23:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_accelBiasCovOffset);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v15, CFSTR("accel_bias_cov_offset"));

  has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_11:
    if ((has & 0x100) == 0)
      goto LABEL_12;
LABEL_25:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_positionCovOffset);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v17, CFSTR("position_cov_offset"));

    if ((*(_WORD *)&self->_has & 0x200) == 0)
      return v3;
    goto LABEL_13;
  }
LABEL_24:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_accelBiasDof);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v16, CFSTR("accel_bias_dof"));

  has = (__int16)self->_has;
  if ((has & 0x100) != 0)
    goto LABEL_25;
LABEL_12:
  if ((has & 0x200) != 0)
  {
LABEL_13:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_positionDof);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("position_dof"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return CLPLOGENTRYVISIONVIOInertialCovarianceInfoReadFrom((uint64_t)self, (uint64_t)a3);
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
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 0x40) == 0)
        goto LABEL_4;
      goto LABEL_17;
    }
  }
  else if ((has & 8) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint32Field();
  has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_4:
    if ((has & 0x80) == 0)
      goto LABEL_5;
    goto LABEL_18;
  }
LABEL_17:
  PBDataWriterWriteUint32Field();
  has = (__int16)self->_has;
  if ((has & 0x80) == 0)
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
    if ((has & 0x20) == 0)
      goto LABEL_7;
    goto LABEL_20;
  }
LABEL_19:
  PBDataWriterWriteUint32Field();
  has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_7:
    if ((has & 0x400) == 0)
      goto LABEL_8;
    goto LABEL_21;
  }
LABEL_20:
  PBDataWriterWriteUint32Field();
  has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_8:
    if ((has & 0x800) == 0)
      goto LABEL_9;
    goto LABEL_22;
  }
LABEL_21:
  PBDataWriterWriteUint32Field();
  has = (__int16)self->_has;
  if ((has & 0x800) == 0)
  {
LABEL_9:
    if ((has & 2) == 0)
      goto LABEL_10;
    goto LABEL_23;
  }
LABEL_22:
  PBDataWriterWriteUint32Field();
  has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_10:
    if ((has & 4) == 0)
      goto LABEL_11;
    goto LABEL_24;
  }
LABEL_23:
  PBDataWriterWriteUint32Field();
  has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_11:
    if ((has & 0x100) == 0)
      goto LABEL_12;
LABEL_25:
    PBDataWriterWriteUint32Field();
    if ((*(_WORD *)&self->_has & 0x200) == 0)
      goto LABEL_14;
    goto LABEL_13;
  }
LABEL_24:
  PBDataWriterWriteUint32Field();
  has = (__int16)self->_has;
  if ((has & 0x100) != 0)
    goto LABEL_25;
LABEL_12:
  if ((has & 0x200) != 0)
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
    v4[1] = self->_covarianceSizeInBytes;
    *((_WORD *)v4 + 30) |= 1u;
    has = (__int16)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 0x40) == 0)
        goto LABEL_4;
      goto LABEL_17;
    }
  }
  else if ((has & 8) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)v4 + 6) = self->_covarianceSize;
  *((_WORD *)v4 + 30) |= 8u;
  has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_4:
    if ((has & 0x80) == 0)
      goto LABEL_5;
    goto LABEL_18;
  }
LABEL_17:
  *((_DWORD *)v4 + 9) = self->_orientationCovOffset;
  *((_WORD *)v4 + 30) |= 0x40u;
  has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_5:
    if ((has & 0x10) == 0)
      goto LABEL_6;
    goto LABEL_19;
  }
LABEL_18:
  *((_DWORD *)v4 + 10) = self->_orientationDof;
  *((_WORD *)v4 + 30) |= 0x80u;
  has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_6:
    if ((has & 0x20) == 0)
      goto LABEL_7;
    goto LABEL_20;
  }
LABEL_19:
  *((_DWORD *)v4 + 7) = self->_gyroBiasCovOffset;
  *((_WORD *)v4 + 30) |= 0x10u;
  has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_7:
    if ((has & 0x400) == 0)
      goto LABEL_8;
    goto LABEL_21;
  }
LABEL_20:
  *((_DWORD *)v4 + 8) = self->_gyroBiasDof;
  *((_WORD *)v4 + 30) |= 0x20u;
  has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_8:
    if ((has & 0x800) == 0)
      goto LABEL_9;
    goto LABEL_22;
  }
LABEL_21:
  *((_DWORD *)v4 + 13) = self->_velocityCovOffset;
  *((_WORD *)v4 + 30) |= 0x400u;
  has = (__int16)self->_has;
  if ((has & 0x800) == 0)
  {
LABEL_9:
    if ((has & 2) == 0)
      goto LABEL_10;
    goto LABEL_23;
  }
LABEL_22:
  *((_DWORD *)v4 + 14) = self->_velocityDof;
  *((_WORD *)v4 + 30) |= 0x800u;
  has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_10:
    if ((has & 4) == 0)
      goto LABEL_11;
    goto LABEL_24;
  }
LABEL_23:
  *((_DWORD *)v4 + 4) = self->_accelBiasCovOffset;
  *((_WORD *)v4 + 30) |= 2u;
  has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_11:
    if ((has & 0x100) == 0)
      goto LABEL_12;
LABEL_25:
    *((_DWORD *)v4 + 11) = self->_positionCovOffset;
    *((_WORD *)v4 + 30) |= 0x100u;
    if ((*(_WORD *)&self->_has & 0x200) == 0)
      goto LABEL_14;
    goto LABEL_13;
  }
LABEL_24:
  *((_DWORD *)v4 + 5) = self->_accelBiasDof;
  *((_WORD *)v4 + 30) |= 4u;
  has = (__int16)self->_has;
  if ((has & 0x100) != 0)
    goto LABEL_25;
LABEL_12:
  if ((has & 0x200) != 0)
  {
LABEL_13:
    *((_DWORD *)v4 + 12) = self->_positionDof;
    *((_WORD *)v4 + 30) |= 0x200u;
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
    *((_QWORD *)result + 1) = self->_covarianceSizeInBytes;
    *((_WORD *)result + 30) |= 1u;
    has = (__int16)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 0x40) == 0)
        goto LABEL_4;
      goto LABEL_17;
    }
  }
  else if ((has & 8) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)result + 6) = self->_covarianceSize;
  *((_WORD *)result + 30) |= 8u;
  has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_4:
    if ((has & 0x80) == 0)
      goto LABEL_5;
    goto LABEL_18;
  }
LABEL_17:
  *((_DWORD *)result + 9) = self->_orientationCovOffset;
  *((_WORD *)result + 30) |= 0x40u;
  has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_5:
    if ((has & 0x10) == 0)
      goto LABEL_6;
    goto LABEL_19;
  }
LABEL_18:
  *((_DWORD *)result + 10) = self->_orientationDof;
  *((_WORD *)result + 30) |= 0x80u;
  has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_6:
    if ((has & 0x20) == 0)
      goto LABEL_7;
    goto LABEL_20;
  }
LABEL_19:
  *((_DWORD *)result + 7) = self->_gyroBiasCovOffset;
  *((_WORD *)result + 30) |= 0x10u;
  has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_7:
    if ((has & 0x400) == 0)
      goto LABEL_8;
    goto LABEL_21;
  }
LABEL_20:
  *((_DWORD *)result + 8) = self->_gyroBiasDof;
  *((_WORD *)result + 30) |= 0x20u;
  has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_8:
    if ((has & 0x800) == 0)
      goto LABEL_9;
    goto LABEL_22;
  }
LABEL_21:
  *((_DWORD *)result + 13) = self->_velocityCovOffset;
  *((_WORD *)result + 30) |= 0x400u;
  has = (__int16)self->_has;
  if ((has & 0x800) == 0)
  {
LABEL_9:
    if ((has & 2) == 0)
      goto LABEL_10;
    goto LABEL_23;
  }
LABEL_22:
  *((_DWORD *)result + 14) = self->_velocityDof;
  *((_WORD *)result + 30) |= 0x800u;
  has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_10:
    if ((has & 4) == 0)
      goto LABEL_11;
    goto LABEL_24;
  }
LABEL_23:
  *((_DWORD *)result + 4) = self->_accelBiasCovOffset;
  *((_WORD *)result + 30) |= 2u;
  has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_11:
    if ((has & 0x100) == 0)
      goto LABEL_12;
    goto LABEL_25;
  }
LABEL_24:
  *((_DWORD *)result + 5) = self->_accelBiasDof;
  *((_WORD *)result + 30) |= 4u;
  has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_12:
    if ((has & 0x200) == 0)
      return result;
    goto LABEL_13;
  }
LABEL_25:
  *((_DWORD *)result + 11) = self->_positionCovOffset;
  *((_WORD *)result + 30) |= 0x100u;
  if ((*(_WORD *)&self->_has & 0x200) == 0)
    return result;
LABEL_13:
  *((_DWORD *)result + 12) = self->_positionDof;
  *((_WORD *)result + 30) |= 0x200u;
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
    if ((v6 & 1) == 0 || self->_covarianceSizeInBytes != *((_QWORD *)v4 + 1))
      goto LABEL_62;
  }
  else if ((v6 & 1) != 0)
  {
LABEL_62:
    v7 = 0;
    goto LABEL_63;
  }
  if ((has & 8) != 0)
  {
    if ((v6 & 8) == 0 || self->_covarianceSize != *((_DWORD *)v4 + 6))
      goto LABEL_62;
  }
  else if ((v6 & 8) != 0)
  {
    goto LABEL_62;
  }
  if ((has & 0x40) != 0)
  {
    if ((v6 & 0x40) == 0 || self->_orientationCovOffset != *((_DWORD *)v4 + 9))
      goto LABEL_62;
  }
  else if ((v6 & 0x40) != 0)
  {
    goto LABEL_62;
  }
  if ((has & 0x80) != 0)
  {
    if ((v6 & 0x80) == 0 || self->_orientationDof != *((_DWORD *)v4 + 10))
      goto LABEL_62;
  }
  else if ((v6 & 0x80) != 0)
  {
    goto LABEL_62;
  }
  if ((has & 0x10) != 0)
  {
    if ((v6 & 0x10) == 0 || self->_gyroBiasCovOffset != *((_DWORD *)v4 + 7))
      goto LABEL_62;
  }
  else if ((v6 & 0x10) != 0)
  {
    goto LABEL_62;
  }
  if ((has & 0x20) != 0)
  {
    if ((v6 & 0x20) == 0 || self->_gyroBiasDof != *((_DWORD *)v4 + 8))
      goto LABEL_62;
  }
  else if ((v6 & 0x20) != 0)
  {
    goto LABEL_62;
  }
  if ((*(_WORD *)&self->_has & 0x400) != 0)
  {
    if ((*((_WORD *)v4 + 30) & 0x400) == 0 || self->_velocityCovOffset != *((_DWORD *)v4 + 13))
      goto LABEL_62;
  }
  else if ((*((_WORD *)v4 + 30) & 0x400) != 0)
  {
    goto LABEL_62;
  }
  if ((*(_WORD *)&self->_has & 0x800) != 0)
  {
    if ((*((_WORD *)v4 + 30) & 0x800) == 0 || self->_velocityDof != *((_DWORD *)v4 + 14))
      goto LABEL_62;
  }
  else if ((*((_WORD *)v4 + 30) & 0x800) != 0)
  {
    goto LABEL_62;
  }
  if ((has & 2) != 0)
  {
    if ((v6 & 2) == 0 || self->_accelBiasCovOffset != *((_DWORD *)v4 + 4))
      goto LABEL_62;
  }
  else if ((v6 & 2) != 0)
  {
    goto LABEL_62;
  }
  if ((has & 4) != 0)
  {
    if ((v6 & 4) == 0 || self->_accelBiasDof != *((_DWORD *)v4 + 5))
      goto LABEL_62;
  }
  else if ((v6 & 4) != 0)
  {
    goto LABEL_62;
  }
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
    if ((*((_WORD *)v4 + 30) & 0x100) == 0 || self->_positionCovOffset != *((_DWORD *)v4 + 11))
      goto LABEL_62;
  }
  else if ((*((_WORD *)v4 + 30) & 0x100) != 0)
  {
    goto LABEL_62;
  }
  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
    if ((*((_WORD *)v4 + 30) & 0x200) == 0 || self->_positionDof != *((_DWORD *)v4 + 12))
      goto LABEL_62;
    v7 = 1;
  }
  else
  {
    v7 = (v6 & 0x200) == 0;
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
    v3 = 2654435761u * self->_covarianceSizeInBytes;
    if ((has & 8) != 0)
    {
LABEL_3:
      v4 = 2654435761 * self->_covarianceSize;
      if ((has & 0x40) != 0)
        goto LABEL_4;
      goto LABEL_16;
    }
  }
  else
  {
    v3 = 0;
    if ((has & 8) != 0)
      goto LABEL_3;
  }
  v4 = 0;
  if ((has & 0x40) != 0)
  {
LABEL_4:
    v5 = 2654435761 * self->_orientationCovOffset;
    if ((has & 0x80) != 0)
      goto LABEL_5;
    goto LABEL_17;
  }
LABEL_16:
  v5 = 0;
  if ((has & 0x80) != 0)
  {
LABEL_5:
    v6 = 2654435761 * self->_orientationDof;
    if ((has & 0x10) != 0)
      goto LABEL_6;
    goto LABEL_18;
  }
LABEL_17:
  v6 = 0;
  if ((has & 0x10) != 0)
  {
LABEL_6:
    v7 = 2654435761 * self->_gyroBiasCovOffset;
    if ((has & 0x20) != 0)
      goto LABEL_7;
    goto LABEL_19;
  }
LABEL_18:
  v7 = 0;
  if ((has & 0x20) != 0)
  {
LABEL_7:
    v8 = 2654435761 * self->_gyroBiasDof;
    if ((*(_WORD *)&self->_has & 0x400) != 0)
      goto LABEL_8;
    goto LABEL_20;
  }
LABEL_19:
  v8 = 0;
  if ((*(_WORD *)&self->_has & 0x400) != 0)
  {
LABEL_8:
    v9 = 2654435761 * self->_velocityCovOffset;
    if ((*(_WORD *)&self->_has & 0x800) != 0)
      goto LABEL_9;
    goto LABEL_21;
  }
LABEL_20:
  v9 = 0;
  if ((*(_WORD *)&self->_has & 0x800) != 0)
  {
LABEL_9:
    v10 = 2654435761 * self->_velocityDof;
    if ((has & 2) != 0)
      goto LABEL_10;
    goto LABEL_22;
  }
LABEL_21:
  v10 = 0;
  if ((has & 2) != 0)
  {
LABEL_10:
    v11 = 2654435761 * self->_accelBiasCovOffset;
    if ((has & 4) != 0)
      goto LABEL_11;
    goto LABEL_23;
  }
LABEL_22:
  v11 = 0;
  if ((has & 4) != 0)
  {
LABEL_11:
    v12 = 2654435761 * self->_accelBiasDof;
    if ((*(_WORD *)&self->_has & 0x100) != 0)
      goto LABEL_12;
LABEL_24:
    v13 = 0;
    if ((*(_WORD *)&self->_has & 0x200) != 0)
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
  v13 = 2654435761 * self->_positionCovOffset;
  if ((*(_WORD *)&self->_has & 0x200) == 0)
    goto LABEL_25;
LABEL_13:
  v14 = 2654435761 * self->_positionDof;
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
    self->_covarianceSizeInBytes = *((_QWORD *)v4 + 1);
    *(_WORD *)&self->_has |= 1u;
    v5 = *((_WORD *)v4 + 30);
    if ((v5 & 8) == 0)
    {
LABEL_3:
      if ((v5 & 0x40) == 0)
        goto LABEL_4;
      goto LABEL_17;
    }
  }
  else if ((v5 & 8) == 0)
  {
    goto LABEL_3;
  }
  self->_covarianceSize = *((_DWORD *)v4 + 6);
  *(_WORD *)&self->_has |= 8u;
  v5 = *((_WORD *)v4 + 30);
  if ((v5 & 0x40) == 0)
  {
LABEL_4:
    if ((v5 & 0x80) == 0)
      goto LABEL_5;
    goto LABEL_18;
  }
LABEL_17:
  self->_orientationCovOffset = *((_DWORD *)v4 + 9);
  *(_WORD *)&self->_has |= 0x40u;
  v5 = *((_WORD *)v4 + 30);
  if ((v5 & 0x80) == 0)
  {
LABEL_5:
    if ((v5 & 0x10) == 0)
      goto LABEL_6;
    goto LABEL_19;
  }
LABEL_18:
  self->_orientationDof = *((_DWORD *)v4 + 10);
  *(_WORD *)&self->_has |= 0x80u;
  v5 = *((_WORD *)v4 + 30);
  if ((v5 & 0x10) == 0)
  {
LABEL_6:
    if ((v5 & 0x20) == 0)
      goto LABEL_7;
    goto LABEL_20;
  }
LABEL_19:
  self->_gyroBiasCovOffset = *((_DWORD *)v4 + 7);
  *(_WORD *)&self->_has |= 0x10u;
  v5 = *((_WORD *)v4 + 30);
  if ((v5 & 0x20) == 0)
  {
LABEL_7:
    if ((v5 & 0x400) == 0)
      goto LABEL_8;
    goto LABEL_21;
  }
LABEL_20:
  self->_gyroBiasDof = *((_DWORD *)v4 + 8);
  *(_WORD *)&self->_has |= 0x20u;
  v5 = *((_WORD *)v4 + 30);
  if ((v5 & 0x400) == 0)
  {
LABEL_8:
    if ((v5 & 0x800) == 0)
      goto LABEL_9;
    goto LABEL_22;
  }
LABEL_21:
  self->_velocityCovOffset = *((_DWORD *)v4 + 13);
  *(_WORD *)&self->_has |= 0x400u;
  v5 = *((_WORD *)v4 + 30);
  if ((v5 & 0x800) == 0)
  {
LABEL_9:
    if ((v5 & 2) == 0)
      goto LABEL_10;
    goto LABEL_23;
  }
LABEL_22:
  self->_velocityDof = *((_DWORD *)v4 + 14);
  *(_WORD *)&self->_has |= 0x800u;
  v5 = *((_WORD *)v4 + 30);
  if ((v5 & 2) == 0)
  {
LABEL_10:
    if ((v5 & 4) == 0)
      goto LABEL_11;
    goto LABEL_24;
  }
LABEL_23:
  self->_accelBiasCovOffset = *((_DWORD *)v4 + 4);
  *(_WORD *)&self->_has |= 2u;
  v5 = *((_WORD *)v4 + 30);
  if ((v5 & 4) == 0)
  {
LABEL_11:
    if ((v5 & 0x100) == 0)
      goto LABEL_12;
LABEL_25:
    self->_positionCovOffset = *((_DWORD *)v4 + 11);
    *(_WORD *)&self->_has |= 0x100u;
    if ((*((_WORD *)v4 + 30) & 0x200) == 0)
      goto LABEL_14;
    goto LABEL_13;
  }
LABEL_24:
  self->_accelBiasDof = *((_DWORD *)v4 + 5);
  *(_WORD *)&self->_has |= 4u;
  v5 = *((_WORD *)v4 + 30);
  if ((v5 & 0x100) != 0)
    goto LABEL_25;
LABEL_12:
  if ((v5 & 0x200) != 0)
  {
LABEL_13:
    self->_positionDof = *((_DWORD *)v4 + 12);
    *(_WORD *)&self->_has |= 0x200u;
  }
LABEL_14:

}

- (unint64_t)covarianceSizeInBytes
{
  return self->_covarianceSizeInBytes;
}

- (unsigned)covarianceSize
{
  return self->_covarianceSize;
}

- (unsigned)orientationCovOffset
{
  return self->_orientationCovOffset;
}

- (unsigned)orientationDof
{
  return self->_orientationDof;
}

- (unsigned)gyroBiasCovOffset
{
  return self->_gyroBiasCovOffset;
}

- (unsigned)gyroBiasDof
{
  return self->_gyroBiasDof;
}

- (unsigned)velocityCovOffset
{
  return self->_velocityCovOffset;
}

- (unsigned)velocityDof
{
  return self->_velocityDof;
}

- (unsigned)accelBiasCovOffset
{
  return self->_accelBiasCovOffset;
}

- (unsigned)accelBiasDof
{
  return self->_accelBiasDof;
}

- (unsigned)positionCovOffset
{
  return self->_positionCovOffset;
}

- (unsigned)positionDof
{
  return self->_positionDof;
}

@end
