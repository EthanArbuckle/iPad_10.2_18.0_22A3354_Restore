@implementation CLPNRCellNeighbor

- (void)setNrarfcn:(int)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_nrarfcn = a3;
}

- (void)setHasNrarfcn:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (BOOL)hasNrarfcn
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (void)setPid:(int)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_pid = a3;
}

- (void)setHasPid:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (BOOL)hasPid
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (void)setRssi:(int)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_rssi = a3;
}

- (void)setHasRssi:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 256;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (BOOL)hasRssi
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (void)setEcn0:(int)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_ecn0 = a3;
}

- (void)setHasEcn0:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (BOOL)hasEcn0
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (void)setRscp:(int)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_rscp = a3;
}

- (void)setHasRscp:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 128;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (BOOL)hasRscp
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (void)setScs:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x400u;
  self->_scs = a3;
}

- (void)setHasScs:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 1024;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFBFF | v3;
}

- (BOOL)hasScs
{
  return (*(_WORD *)&self->_has >> 10) & 1;
}

- (void)setSaOrNsaNeighbor:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x200u;
  self->_saOrNsaNeighbor = a3;
}

- (void)setHasSaOrNsaNeighbor:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 512;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFDFF | v3;
}

- (BOOL)hasSaOrNsaNeighbor
{
  return (*(_WORD *)&self->_has >> 9) & 1;
}

- (void)setBandwidth:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 1u;
  self->_bandwidth = a3;
}

- (void)setHasBandwidth:(BOOL)a3
{
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFE | a3;
}

- (BOOL)hasBandwidth
{
  return *(_WORD *)&self->_has & 1;
}

- (void)setNeighborType:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_neighborType = a3;
}

- (void)setHasNeighborType:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (BOOL)hasNeighborType
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (void)setMaxThroughput:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_maxThroughput = a3;
}

- (void)setHasMaxThroughput:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (BOOL)hasMaxThroughput
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (void)setBwpSupport:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_bwpSupport = a3;
}

- (void)setHasBwpSupport:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (BOOL)hasBwpSupport
{
  return (*(_WORD *)&self->_has >> 1) & 1;
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
  v8.super_class = (Class)CLPNRCellNeighbor;
  -[CLPNRCellNeighbor description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CLPNRCellNeighbor dictionaryRepresentation](self, "dictionaryRepresentation");
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

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = (__int16)self->_has;
  if ((has & 0x20) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_nrarfcn);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("nrarfcn"));

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
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_pid);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("pid"));

  has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_4:
    if ((has & 4) == 0)
      goto LABEL_5;
    goto LABEL_17;
  }
LABEL_16:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_rssi);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("rssi"));

  has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_5:
    if ((has & 0x80) == 0)
      goto LABEL_6;
    goto LABEL_18;
  }
LABEL_17:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_ecn0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("ecn0"));

  has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_6:
    if ((has & 0x400) == 0)
      goto LABEL_7;
    goto LABEL_19;
  }
LABEL_18:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_rscp);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v11, CFSTR("rscp"));

  has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_7:
    if ((has & 0x200) == 0)
      goto LABEL_8;
    goto LABEL_20;
  }
LABEL_19:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_scs);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v12, CFSTR("scs"));

  has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_8:
    if ((has & 1) == 0)
      goto LABEL_9;
    goto LABEL_21;
  }
LABEL_20:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_saOrNsaNeighbor);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v13, CFSTR("saOrNsaNeighbor"));

  has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_9:
    if ((has & 0x10) == 0)
      goto LABEL_10;
    goto LABEL_22;
  }
LABEL_21:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_bandwidth);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v14, CFSTR("bandwidth"));

  has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_10:
    if ((has & 8) == 0)
      goto LABEL_11;
LABEL_23:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_maxThroughput);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v16, CFSTR("maxThroughput"));

    if ((*(_WORD *)&self->_has & 2) == 0)
      return v3;
    goto LABEL_12;
  }
LABEL_22:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_neighborType);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v15, CFSTR("neighborType"));

  has = (__int16)self->_has;
  if ((has & 8) != 0)
    goto LABEL_23;
LABEL_11:
  if ((has & 2) != 0)
  {
LABEL_12:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_bwpSupport);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("bwpSupport"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return CLPNRCellNeighborReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  __int16 has;
  id v5;

  v5 = a3;
  has = (__int16)self->_has;
  if ((has & 0x20) != 0)
  {
    PBDataWriterWriteSint32Field();
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
  PBDataWriterWriteSint32Field();
  has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_4:
    if ((has & 4) == 0)
      goto LABEL_5;
    goto LABEL_17;
  }
LABEL_16:
  PBDataWriterWriteSint32Field();
  has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_5:
    if ((has & 0x80) == 0)
      goto LABEL_6;
    goto LABEL_18;
  }
LABEL_17:
  PBDataWriterWriteSint32Field();
  has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_6:
    if ((has & 0x400) == 0)
      goto LABEL_7;
    goto LABEL_19;
  }
LABEL_18:
  PBDataWriterWriteSint32Field();
  has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_7:
    if ((has & 0x200) == 0)
      goto LABEL_8;
    goto LABEL_20;
  }
LABEL_19:
  PBDataWriterWriteUint32Field();
  has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_8:
    if ((has & 1) == 0)
      goto LABEL_9;
    goto LABEL_21;
  }
LABEL_20:
  PBDataWriterWriteUint32Field();
  has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_9:
    if ((has & 0x10) == 0)
      goto LABEL_10;
    goto LABEL_22;
  }
LABEL_21:
  PBDataWriterWriteUint32Field();
  has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_10:
    if ((has & 8) == 0)
      goto LABEL_11;
LABEL_23:
    PBDataWriterWriteUint32Field();
    if ((*(_WORD *)&self->_has & 2) == 0)
      goto LABEL_13;
    goto LABEL_12;
  }
LABEL_22:
  PBDataWriterWriteUint32Field();
  has = (__int16)self->_has;
  if ((has & 8) != 0)
    goto LABEL_23;
LABEL_11:
  if ((has & 2) != 0)
LABEL_12:
    PBDataWriterWriteUint32Field();
LABEL_13:

}

- (void)copyTo:(id)a3
{
  _DWORD *v4;
  __int16 has;

  v4 = a3;
  has = (__int16)self->_has;
  if ((has & 0x20) != 0)
  {
    v4[7] = self->_nrarfcn;
    *((_WORD *)v4 + 26) |= 0x20u;
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
  v4[8] = self->_pid;
  *((_WORD *)v4 + 26) |= 0x40u;
  has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_4:
    if ((has & 4) == 0)
      goto LABEL_5;
    goto LABEL_17;
  }
LABEL_16:
  v4[10] = self->_rssi;
  *((_WORD *)v4 + 26) |= 0x100u;
  has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_5:
    if ((has & 0x80) == 0)
      goto LABEL_6;
    goto LABEL_18;
  }
LABEL_17:
  v4[4] = self->_ecn0;
  *((_WORD *)v4 + 26) |= 4u;
  has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_6:
    if ((has & 0x400) == 0)
      goto LABEL_7;
    goto LABEL_19;
  }
LABEL_18:
  v4[9] = self->_rscp;
  *((_WORD *)v4 + 26) |= 0x80u;
  has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_7:
    if ((has & 0x200) == 0)
      goto LABEL_8;
    goto LABEL_20;
  }
LABEL_19:
  v4[12] = self->_scs;
  *((_WORD *)v4 + 26) |= 0x400u;
  has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_8:
    if ((has & 1) == 0)
      goto LABEL_9;
    goto LABEL_21;
  }
LABEL_20:
  v4[11] = self->_saOrNsaNeighbor;
  *((_WORD *)v4 + 26) |= 0x200u;
  has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_9:
    if ((has & 0x10) == 0)
      goto LABEL_10;
    goto LABEL_22;
  }
LABEL_21:
  v4[2] = self->_bandwidth;
  *((_WORD *)v4 + 26) |= 1u;
  has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_10:
    if ((has & 8) == 0)
      goto LABEL_11;
LABEL_23:
    v4[5] = self->_maxThroughput;
    *((_WORD *)v4 + 26) |= 8u;
    if ((*(_WORD *)&self->_has & 2) == 0)
      goto LABEL_13;
    goto LABEL_12;
  }
LABEL_22:
  v4[6] = self->_neighborType;
  *((_WORD *)v4 + 26) |= 0x10u;
  has = (__int16)self->_has;
  if ((has & 8) != 0)
    goto LABEL_23;
LABEL_11:
  if ((has & 2) != 0)
  {
LABEL_12:
    v4[3] = self->_bwpSupport;
    *((_WORD *)v4 + 26) |= 2u;
  }
LABEL_13:

}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;
  __int16 has;

  result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  has = (__int16)self->_has;
  if ((has & 0x20) != 0)
  {
    *((_DWORD *)result + 7) = self->_nrarfcn;
    *((_WORD *)result + 26) |= 0x20u;
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
  *((_DWORD *)result + 8) = self->_pid;
  *((_WORD *)result + 26) |= 0x40u;
  has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_4:
    if ((has & 4) == 0)
      goto LABEL_5;
    goto LABEL_17;
  }
LABEL_16:
  *((_DWORD *)result + 10) = self->_rssi;
  *((_WORD *)result + 26) |= 0x100u;
  has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_5:
    if ((has & 0x80) == 0)
      goto LABEL_6;
    goto LABEL_18;
  }
LABEL_17:
  *((_DWORD *)result + 4) = self->_ecn0;
  *((_WORD *)result + 26) |= 4u;
  has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_6:
    if ((has & 0x400) == 0)
      goto LABEL_7;
    goto LABEL_19;
  }
LABEL_18:
  *((_DWORD *)result + 9) = self->_rscp;
  *((_WORD *)result + 26) |= 0x80u;
  has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_7:
    if ((has & 0x200) == 0)
      goto LABEL_8;
    goto LABEL_20;
  }
LABEL_19:
  *((_DWORD *)result + 12) = self->_scs;
  *((_WORD *)result + 26) |= 0x400u;
  has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_8:
    if ((has & 1) == 0)
      goto LABEL_9;
    goto LABEL_21;
  }
LABEL_20:
  *((_DWORD *)result + 11) = self->_saOrNsaNeighbor;
  *((_WORD *)result + 26) |= 0x200u;
  has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_9:
    if ((has & 0x10) == 0)
      goto LABEL_10;
    goto LABEL_22;
  }
LABEL_21:
  *((_DWORD *)result + 2) = self->_bandwidth;
  *((_WORD *)result + 26) |= 1u;
  has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_10:
    if ((has & 8) == 0)
      goto LABEL_11;
    goto LABEL_23;
  }
LABEL_22:
  *((_DWORD *)result + 6) = self->_neighborType;
  *((_WORD *)result + 26) |= 0x10u;
  has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_11:
    if ((has & 2) == 0)
      return result;
    goto LABEL_12;
  }
LABEL_23:
  *((_DWORD *)result + 5) = self->_maxThroughput;
  *((_WORD *)result + 26) |= 8u;
  if ((*(_WORD *)&self->_has & 2) == 0)
    return result;
LABEL_12:
  *((_DWORD *)result + 3) = self->_bwpSupport;
  *((_WORD *)result + 26) |= 2u;
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
    goto LABEL_57;
  has = (__int16)self->_has;
  v6 = *((_WORD *)v4 + 26);
  if ((has & 0x20) != 0)
  {
    if ((v6 & 0x20) == 0 || self->_nrarfcn != *((_DWORD *)v4 + 7))
      goto LABEL_57;
  }
  else if ((v6 & 0x20) != 0)
  {
LABEL_57:
    v7 = 0;
    goto LABEL_58;
  }
  if ((has & 0x40) != 0)
  {
    if ((v6 & 0x40) == 0 || self->_pid != *((_DWORD *)v4 + 8))
      goto LABEL_57;
  }
  else if ((v6 & 0x40) != 0)
  {
    goto LABEL_57;
  }
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
    if ((*((_WORD *)v4 + 26) & 0x100) == 0 || self->_rssi != *((_DWORD *)v4 + 10))
      goto LABEL_57;
  }
  else if ((*((_WORD *)v4 + 26) & 0x100) != 0)
  {
    goto LABEL_57;
  }
  if ((has & 4) != 0)
  {
    if ((v6 & 4) == 0 || self->_ecn0 != *((_DWORD *)v4 + 4))
      goto LABEL_57;
  }
  else if ((v6 & 4) != 0)
  {
    goto LABEL_57;
  }
  if ((has & 0x80) != 0)
  {
    if ((v6 & 0x80) == 0 || self->_rscp != *((_DWORD *)v4 + 9))
      goto LABEL_57;
  }
  else if ((v6 & 0x80) != 0)
  {
    goto LABEL_57;
  }
  if ((*(_WORD *)&self->_has & 0x400) != 0)
  {
    if ((*((_WORD *)v4 + 26) & 0x400) == 0 || self->_scs != *((_DWORD *)v4 + 12))
      goto LABEL_57;
  }
  else if ((*((_WORD *)v4 + 26) & 0x400) != 0)
  {
    goto LABEL_57;
  }
  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
    if ((*((_WORD *)v4 + 26) & 0x200) == 0 || self->_saOrNsaNeighbor != *((_DWORD *)v4 + 11))
      goto LABEL_57;
  }
  else if ((*((_WORD *)v4 + 26) & 0x200) != 0)
  {
    goto LABEL_57;
  }
  if ((has & 1) != 0)
  {
    if ((v6 & 1) == 0 || self->_bandwidth != *((_DWORD *)v4 + 2))
      goto LABEL_57;
  }
  else if ((v6 & 1) != 0)
  {
    goto LABEL_57;
  }
  if ((has & 0x10) != 0)
  {
    if ((v6 & 0x10) == 0 || self->_neighborType != *((_DWORD *)v4 + 6))
      goto LABEL_57;
  }
  else if ((v6 & 0x10) != 0)
  {
    goto LABEL_57;
  }
  if ((has & 8) != 0)
  {
    if ((v6 & 8) == 0 || self->_maxThroughput != *((_DWORD *)v4 + 5))
      goto LABEL_57;
  }
  else if ((v6 & 8) != 0)
  {
    goto LABEL_57;
  }
  if ((has & 2) != 0)
  {
    if ((v6 & 2) == 0 || self->_bwpSupport != *((_DWORD *)v4 + 3))
      goto LABEL_57;
    v7 = 1;
  }
  else
  {
    v7 = (v6 & 2) == 0;
  }
LABEL_58:

  return v7;
}

- (unint64_t)hash
{
  __int16 has;
  uint64_t v3;
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

  has = (__int16)self->_has;
  if ((has & 0x20) != 0)
  {
    v3 = 2654435761 * self->_nrarfcn;
    if ((has & 0x40) != 0)
    {
LABEL_3:
      v4 = 2654435761 * self->_pid;
      if ((*(_WORD *)&self->_has & 0x100) != 0)
        goto LABEL_4;
      goto LABEL_15;
    }
  }
  else
  {
    v3 = 0;
    if ((has & 0x40) != 0)
      goto LABEL_3;
  }
  v4 = 0;
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
LABEL_4:
    v5 = 2654435761 * self->_rssi;
    if ((has & 4) != 0)
      goto LABEL_5;
    goto LABEL_16;
  }
LABEL_15:
  v5 = 0;
  if ((has & 4) != 0)
  {
LABEL_5:
    v6 = 2654435761 * self->_ecn0;
    if ((has & 0x80) != 0)
      goto LABEL_6;
    goto LABEL_17;
  }
LABEL_16:
  v6 = 0;
  if ((has & 0x80) != 0)
  {
LABEL_6:
    v7 = 2654435761 * self->_rscp;
    if ((*(_WORD *)&self->_has & 0x400) != 0)
      goto LABEL_7;
    goto LABEL_18;
  }
LABEL_17:
  v7 = 0;
  if ((*(_WORD *)&self->_has & 0x400) != 0)
  {
LABEL_7:
    v8 = 2654435761 * self->_scs;
    if ((*(_WORD *)&self->_has & 0x200) != 0)
      goto LABEL_8;
    goto LABEL_19;
  }
LABEL_18:
  v8 = 0;
  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
LABEL_8:
    v9 = 2654435761 * self->_saOrNsaNeighbor;
    if ((has & 1) != 0)
      goto LABEL_9;
    goto LABEL_20;
  }
LABEL_19:
  v9 = 0;
  if ((has & 1) != 0)
  {
LABEL_9:
    v10 = 2654435761 * self->_bandwidth;
    if ((has & 0x10) != 0)
      goto LABEL_10;
    goto LABEL_21;
  }
LABEL_20:
  v10 = 0;
  if ((has & 0x10) != 0)
  {
LABEL_10:
    v11 = 2654435761 * self->_neighborType;
    if ((has & 8) != 0)
      goto LABEL_11;
LABEL_22:
    v12 = 0;
    if ((has & 2) != 0)
      goto LABEL_12;
LABEL_23:
    v13 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13;
  }
LABEL_21:
  v11 = 0;
  if ((has & 8) == 0)
    goto LABEL_22;
LABEL_11:
  v12 = 2654435761 * self->_maxThroughput;
  if ((has & 2) == 0)
    goto LABEL_23;
LABEL_12:
  v13 = 2654435761 * self->_bwpSupport;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  __int16 v5;

  v4 = a3;
  v5 = *((_WORD *)v4 + 26);
  if ((v5 & 0x20) != 0)
  {
    self->_nrarfcn = *((_DWORD *)v4 + 7);
    *(_WORD *)&self->_has |= 0x20u;
    v5 = *((_WORD *)v4 + 26);
    if ((v5 & 0x40) == 0)
    {
LABEL_3:
      if ((v5 & 0x100) == 0)
        goto LABEL_4;
      goto LABEL_16;
    }
  }
  else if ((v5 & 0x40) == 0)
  {
    goto LABEL_3;
  }
  self->_pid = *((_DWORD *)v4 + 8);
  *(_WORD *)&self->_has |= 0x40u;
  v5 = *((_WORD *)v4 + 26);
  if ((v5 & 0x100) == 0)
  {
LABEL_4:
    if ((v5 & 4) == 0)
      goto LABEL_5;
    goto LABEL_17;
  }
LABEL_16:
  self->_rssi = *((_DWORD *)v4 + 10);
  *(_WORD *)&self->_has |= 0x100u;
  v5 = *((_WORD *)v4 + 26);
  if ((v5 & 4) == 0)
  {
LABEL_5:
    if ((v5 & 0x80) == 0)
      goto LABEL_6;
    goto LABEL_18;
  }
LABEL_17:
  self->_ecn0 = *((_DWORD *)v4 + 4);
  *(_WORD *)&self->_has |= 4u;
  v5 = *((_WORD *)v4 + 26);
  if ((v5 & 0x80) == 0)
  {
LABEL_6:
    if ((v5 & 0x400) == 0)
      goto LABEL_7;
    goto LABEL_19;
  }
LABEL_18:
  self->_rscp = *((_DWORD *)v4 + 9);
  *(_WORD *)&self->_has |= 0x80u;
  v5 = *((_WORD *)v4 + 26);
  if ((v5 & 0x400) == 0)
  {
LABEL_7:
    if ((v5 & 0x200) == 0)
      goto LABEL_8;
    goto LABEL_20;
  }
LABEL_19:
  self->_scs = *((_DWORD *)v4 + 12);
  *(_WORD *)&self->_has |= 0x400u;
  v5 = *((_WORD *)v4 + 26);
  if ((v5 & 0x200) == 0)
  {
LABEL_8:
    if ((v5 & 1) == 0)
      goto LABEL_9;
    goto LABEL_21;
  }
LABEL_20:
  self->_saOrNsaNeighbor = *((_DWORD *)v4 + 11);
  *(_WORD *)&self->_has |= 0x200u;
  v5 = *((_WORD *)v4 + 26);
  if ((v5 & 1) == 0)
  {
LABEL_9:
    if ((v5 & 0x10) == 0)
      goto LABEL_10;
    goto LABEL_22;
  }
LABEL_21:
  self->_bandwidth = *((_DWORD *)v4 + 2);
  *(_WORD *)&self->_has |= 1u;
  v5 = *((_WORD *)v4 + 26);
  if ((v5 & 0x10) == 0)
  {
LABEL_10:
    if ((v5 & 8) == 0)
      goto LABEL_11;
LABEL_23:
    self->_maxThroughput = *((_DWORD *)v4 + 5);
    *(_WORD *)&self->_has |= 8u;
    if ((*((_WORD *)v4 + 26) & 2) == 0)
      goto LABEL_13;
    goto LABEL_12;
  }
LABEL_22:
  self->_neighborType = *((_DWORD *)v4 + 6);
  *(_WORD *)&self->_has |= 0x10u;
  v5 = *((_WORD *)v4 + 26);
  if ((v5 & 8) != 0)
    goto LABEL_23;
LABEL_11:
  if ((v5 & 2) != 0)
  {
LABEL_12:
    self->_bwpSupport = *((_DWORD *)v4 + 3);
    *(_WORD *)&self->_has |= 2u;
  }
LABEL_13:

}

- (int)nrarfcn
{
  return self->_nrarfcn;
}

- (int)pid
{
  return self->_pid;
}

- (int)rssi
{
  return self->_rssi;
}

- (int)ecn0
{
  return self->_ecn0;
}

- (int)rscp
{
  return self->_rscp;
}

- (unsigned)scs
{
  return self->_scs;
}

- (unsigned)saOrNsaNeighbor
{
  return self->_saOrNsaNeighbor;
}

- (unsigned)bandwidth
{
  return self->_bandwidth;
}

- (unsigned)neighborType
{
  return self->_neighborType;
}

- (unsigned)maxThroughput
{
  return self->_maxThroughput;
}

- (unsigned)bwpSupport
{
  return self->_bwpSupport;
}

@end
