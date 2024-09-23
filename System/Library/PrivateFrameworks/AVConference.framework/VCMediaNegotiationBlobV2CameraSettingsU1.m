@implementation VCMediaNegotiationBlobV2CameraSettingsU1

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  -[VCMediaNegotiationBlobV2CameraSettingsU1 setPayloads:](self, "setPayloads:", 0);
  v3.receiver = self;
  v3.super_class = (Class)VCMediaNegotiationBlobV2CameraSettingsU1;
  -[VCMediaNegotiationBlobV2CameraSettingsU1 dealloc](&v3, sel_dealloc);
}

- (void)setRtpSSRC:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 0x80u;
  self->_rtpSSRC = a3;
}

- (void)setHasRtpSSRC:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 0x80;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = v3 & 0x80 | *(_BYTE *)&self->_has & 0x7F;
}

- (BOOL)hasRtpSSRC
{
  return *(_BYTE *)&self->_has >> 7;
}

- (void)clearPayloads
{
  -[NSMutableArray removeAllObjects](self->_payloads, "removeAllObjects");
}

- (void)addPayloads:(id)a3
{
  NSMutableArray *payloads;

  payloads = self->_payloads;
  if (!payloads)
  {
    payloads = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    self->_payloads = payloads;
  }
  -[NSMutableArray addObject:](payloads, "addObject:", a3);
}

- (unint64_t)payloadsCount
{
  return -[NSMutableArray count](self->_payloads, "count");
}

- (id)payloadsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_payloads, "objectAtIndex:", a3);
}

+ (Class)payloadsType
{
  return (Class)objc_opt_class();
}

- (void)setLandscapeAspectRatioX:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_landscapeAspectRatioX = a3;
}

- (void)setHasLandscapeAspectRatioX:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasLandscapeAspectRatioX
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setLandscapeAspectRatioY:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_landscapeAspectRatioY = a3;
}

- (void)setHasLandscapeAspectRatioY:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasLandscapeAspectRatioY
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setPortraitAspectRatioX:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 0x20u;
  self->_portraitAspectRatioX = a3;
}

- (void)setHasPortraitAspectRatioX:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xDF | v3;
}

- (BOOL)hasPortraitAspectRatioX
{
  return (*(_BYTE *)&self->_has >> 5) & 1;
}

- (void)setPortraitAspectRatioY:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 0x40u;
  self->_portraitAspectRatioY = a3;
}

- (void)setHasPortraitAspectRatioY:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xBF | v3;
}

- (BOOL)hasPortraitAspectRatioY
{
  return (*(_BYTE *)&self->_has >> 6) & 1;
}

- (void)setMismatchedDisplayAspectRatioX:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_mismatchedDisplayAspectRatioX = a3;
}

- (void)setHasMismatchedDisplayAspectRatioX:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasMismatchedDisplayAspectRatioX
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setMismatchedDisplayAspectRatioY:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 0x10u;
  self->_mismatchedDisplayAspectRatioY = a3;
}

- (void)setHasMismatchedDisplayAspectRatioY:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xEF | v3;
}

- (BOOL)hasMismatchedDisplayAspectRatioY
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (int)cipherSuites
{
  if ((*(_BYTE *)&self->_has & 1) != 0)
    return self->_cipherSuites;
  else
    return 1;
}

- (void)setCipherSuites:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_cipherSuites = a3;
}

- (void)setHasCipherSuites:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasCipherSuites
{
  return *(_BYTE *)&self->_has & 1;
}

- (id)cipherSuitesAsString:(int)a3
{
  int v3;

  v3 = a3 - 1;
  if ((a3 - 1) < 7 && ((0x4Bu >> v3) & 1) != 0)
    return off_1E9E56E18[v3];
  else
    return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
}

- (int)StringAsCipherSuites:(id)a3
{
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("CipherAES128AuthNoneRCCM3")) & 1) != 0)
    return 1;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("CipherAES128AuthSHA280RCCM2Deferred")) & 1) != 0)
    return 2;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("CipherAES128AuthSHA232RCCM2Deferred")) & 1) != 0)
    return 4;
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("SupportedMask")))
    return 7;
  return 1;
}

- (id)description
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v3.receiver = self;
  v3.super_class = (Class)VCMediaNegotiationBlobV2CameraSettingsU1;
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ %@"), -[VCMediaNegotiationBlobV2CameraSettingsU1 description](&v3, sel_description), -[VCMediaNegotiationBlobV2CameraSettingsU1 dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSMutableArray *payloads;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  char has;
  unsigned int v11;
  __CFString *v12;
  _BYTE v14[128];
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  if ((*(_BYTE *)&self->_has & 0x80000000) != 0)
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_rtpSSRC), CFSTR("rtpSSRC"));
  if (-[NSMutableArray count](self->_payloads, "count"))
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_payloads, "count"));
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    payloads = self->_payloads;
    v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](payloads, "countByEnumeratingWithState:objects:count:", &v15, v14, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v16;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v16 != v8)
            objc_enumerationMutation(payloads);
          objc_msgSend(v4, "addObject:", objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * i), "dictionaryRepresentation"));
        }
        v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](payloads, "countByEnumeratingWithState:objects:count:", &v15, v14, 16);
      }
      while (v7);
    }
    objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("payloads"));

  }
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_landscapeAspectRatioX), CFSTR("landscapeAspectRatioX"));
    has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_14:
      if ((has & 0x20) == 0)
        goto LABEL_15;
      goto LABEL_22;
    }
  }
  else if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    goto LABEL_14;
  }
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_landscapeAspectRatioY), CFSTR("landscapeAspectRatioY"));
  has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_15:
    if ((has & 0x40) == 0)
      goto LABEL_16;
    goto LABEL_23;
  }
LABEL_22:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_portraitAspectRatioX), CFSTR("portraitAspectRatioX"));
  has = (char)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_16:
    if ((has & 8) == 0)
      goto LABEL_17;
    goto LABEL_24;
  }
LABEL_23:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_portraitAspectRatioY), CFSTR("portraitAspectRatioY"));
  has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_17:
    if ((has & 0x10) == 0)
      goto LABEL_18;
LABEL_25:
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_mismatchedDisplayAspectRatioY), CFSTR("mismatchedDisplayAspectRatioY"));
    if ((*(_BYTE *)&self->_has & 1) == 0)
      return v3;
    goto LABEL_26;
  }
LABEL_24:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_mismatchedDisplayAspectRatioX), CFSTR("mismatchedDisplayAspectRatioX"));
  has = (char)self->_has;
  if ((has & 0x10) != 0)
    goto LABEL_25;
LABEL_18:
  if ((has & 1) == 0)
    return v3;
LABEL_26:
  v11 = self->_cipherSuites - 1;
  if (v11 < 7 && ((0x4Bu >> v11) & 1) != 0)
    v12 = off_1E9E56E18[v11];
  else
    v12 = (__CFString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_cipherSuites);
  objc_msgSend(v3, "setObject:forKey:", v12, CFSTR("cipherSuites"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return VCMediaNegotiationBlobV2CameraSettingsU1ReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  NSMutableArray *payloads;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  char has;
  _BYTE v10[128];
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if ((*(_BYTE *)&self->_has & 0x80000000) != 0)
    PBDataWriterWriteUint32Field();
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  payloads = self->_payloads;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](payloads, "countByEnumeratingWithState:objects:count:", &v11, v10, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(payloads);
        PBDataWriterWriteSubmessage();
      }
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](payloads, "countByEnumeratingWithState:objects:count:", &v11, v10, 16);
    }
    while (v6);
  }
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteUint32Field();
    has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_12:
      if ((has & 0x20) == 0)
        goto LABEL_13;
      goto LABEL_21;
    }
  }
  else if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    goto LABEL_12;
  }
  PBDataWriterWriteUint32Field();
  has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_13:
    if ((has & 0x40) == 0)
      goto LABEL_14;
    goto LABEL_22;
  }
LABEL_21:
  PBDataWriterWriteUint32Field();
  has = (char)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_14:
    if ((has & 8) == 0)
      goto LABEL_15;
    goto LABEL_23;
  }
LABEL_22:
  PBDataWriterWriteUint32Field();
  has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_15:
    if ((has & 0x10) == 0)
      goto LABEL_16;
    goto LABEL_24;
  }
LABEL_23:
  PBDataWriterWriteUint32Field();
  has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_16:
    if ((has & 1) == 0)
      return;
    goto LABEL_17;
  }
LABEL_24:
  PBDataWriterWriteUint32Field();
  if ((*(_BYTE *)&self->_has & 1) == 0)
    return;
LABEL_17:
  PBDataWriterWriteInt32Field();
}

- (void)copyTo:(id)a3
{
  unint64_t v5;
  unint64_t v6;
  uint64_t i;
  char has;

  if ((*(_BYTE *)&self->_has & 0x80000000) != 0)
  {
    *((_DWORD *)a3 + 12) = self->_rtpSSRC;
    *((_BYTE *)a3 + 52) |= 0x80u;
  }
  if (-[VCMediaNegotiationBlobV2CameraSettingsU1 payloadsCount](self, "payloadsCount"))
  {
    objc_msgSend(a3, "clearPayloads");
    v5 = -[VCMediaNegotiationBlobV2CameraSettingsU1 payloadsCount](self, "payloadsCount");
    if (v5)
    {
      v6 = v5;
      for (i = 0; i != v6; ++i)
        objc_msgSend(a3, "addPayloads:", -[VCMediaNegotiationBlobV2CameraSettingsU1 payloadsAtIndex:](self, "payloadsAtIndex:", i));
    }
  }
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((_DWORD *)a3 + 3) = self->_landscapeAspectRatioX;
    *((_BYTE *)a3 + 52) |= 2u;
    has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_9:
      if ((has & 0x20) == 0)
        goto LABEL_10;
      goto LABEL_18;
    }
  }
  else if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    goto LABEL_9;
  }
  *((_DWORD *)a3 + 4) = self->_landscapeAspectRatioY;
  *((_BYTE *)a3 + 52) |= 4u;
  has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_10:
    if ((has & 0x40) == 0)
      goto LABEL_11;
    goto LABEL_19;
  }
LABEL_18:
  *((_DWORD *)a3 + 10) = self->_portraitAspectRatioX;
  *((_BYTE *)a3 + 52) |= 0x20u;
  has = (char)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_11:
    if ((has & 8) == 0)
      goto LABEL_12;
    goto LABEL_20;
  }
LABEL_19:
  *((_DWORD *)a3 + 11) = self->_portraitAspectRatioY;
  *((_BYTE *)a3 + 52) |= 0x40u;
  has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_12:
    if ((has & 0x10) == 0)
      goto LABEL_13;
    goto LABEL_21;
  }
LABEL_20:
  *((_DWORD *)a3 + 5) = self->_mismatchedDisplayAspectRatioX;
  *((_BYTE *)a3 + 52) |= 8u;
  has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_13:
    if ((has & 1) == 0)
      return;
    goto LABEL_14;
  }
LABEL_21:
  *((_DWORD *)a3 + 6) = self->_mismatchedDisplayAspectRatioY;
  *((_BYTE *)a3 + 52) |= 0x10u;
  if ((*(_BYTE *)&self->_has & 1) == 0)
    return;
LABEL_14:
  *((_DWORD *)a3 + 2) = self->_cipherSuites;
  *((_BYTE *)a3 + 52) |= 1u;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  NSMutableArray *payloads;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  char has;
  _BYTE v15[128];
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  if ((*(_BYTE *)&self->_has & 0x80000000) != 0)
  {
    *(_DWORD *)(v5 + 48) = self->_rtpSSRC;
    *(_BYTE *)(v5 + 52) |= 0x80u;
  }
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  payloads = self->_payloads;
  v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](payloads, "countByEnumeratingWithState:objects:count:", &v16, v15, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v17 != v10)
          objc_enumerationMutation(payloads);
        v12 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * i), "copyWithZone:", a3);
        objc_msgSend((id)v6, "addPayloads:", v12);

      }
      v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](payloads, "countByEnumeratingWithState:objects:count:", &v16, v15, 16);
    }
    while (v9);
  }
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *(_DWORD *)(v6 + 12) = self->_landscapeAspectRatioX;
    *(_BYTE *)(v6 + 52) |= 2u;
    has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_12:
      if ((has & 0x20) == 0)
        goto LABEL_13;
      goto LABEL_21;
    }
  }
  else if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    goto LABEL_12;
  }
  *(_DWORD *)(v6 + 16) = self->_landscapeAspectRatioY;
  *(_BYTE *)(v6 + 52) |= 4u;
  has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_13:
    if ((has & 0x40) == 0)
      goto LABEL_14;
    goto LABEL_22;
  }
LABEL_21:
  *(_DWORD *)(v6 + 40) = self->_portraitAspectRatioX;
  *(_BYTE *)(v6 + 52) |= 0x20u;
  has = (char)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_14:
    if ((has & 8) == 0)
      goto LABEL_15;
    goto LABEL_23;
  }
LABEL_22:
  *(_DWORD *)(v6 + 44) = self->_portraitAspectRatioY;
  *(_BYTE *)(v6 + 52) |= 0x40u;
  has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_15:
    if ((has & 0x10) == 0)
      goto LABEL_16;
LABEL_24:
    *(_DWORD *)(v6 + 24) = self->_mismatchedDisplayAspectRatioY;
    *(_BYTE *)(v6 + 52) |= 0x10u;
    if ((*(_BYTE *)&self->_has & 1) == 0)
      return (id)v6;
    goto LABEL_17;
  }
LABEL_23:
  *(_DWORD *)(v6 + 20) = self->_mismatchedDisplayAspectRatioX;
  *(_BYTE *)(v6 + 52) |= 8u;
  has = (char)self->_has;
  if ((has & 0x10) != 0)
    goto LABEL_24;
LABEL_16:
  if ((has & 1) != 0)
  {
LABEL_17:
    *(_DWORD *)(v6 + 8) = self->_cipherSuites;
    *(_BYTE *)(v6 + 52) |= 1u;
  }
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  int v5;
  $6C1ACC2E0C1BB4042306AA23F7780358 has;
  int v7;
  NSMutableArray *payloads;

  v5 = objc_msgSend(a3, "isMemberOfClass:", objc_opt_class());
  if (v5)
  {
    has = self->_has;
    v7 = *((char *)a3 + 52);
    if ((*(_DWORD *)&has & 0x80000000) != 0)
    {
      if ((v7 & 0x80000000) == 0 || self->_rtpSSRC != *((_DWORD *)a3 + 12))
        goto LABEL_45;
    }
    else if (v7 < 0)
    {
LABEL_45:
      LOBYTE(v5) = 0;
      return v5;
    }
    payloads = self->_payloads;
    if ((unint64_t)payloads | *((_QWORD *)a3 + 4))
    {
      v5 = -[NSMutableArray isEqual:](payloads, "isEqual:");
      if (!v5)
        return v5;
      *(_BYTE *)&has = self->_has;
    }
    if ((*(_BYTE *)&has & 2) != 0)
    {
      if ((*((_BYTE *)a3 + 52) & 2) == 0 || self->_landscapeAspectRatioX != *((_DWORD *)a3 + 3))
        goto LABEL_45;
    }
    else if ((*((_BYTE *)a3 + 52) & 2) != 0)
    {
      goto LABEL_45;
    }
    if ((*(_BYTE *)&has & 4) != 0)
    {
      if ((*((_BYTE *)a3 + 52) & 4) == 0 || self->_landscapeAspectRatioY != *((_DWORD *)a3 + 4))
        goto LABEL_45;
    }
    else if ((*((_BYTE *)a3 + 52) & 4) != 0)
    {
      goto LABEL_45;
    }
    if ((*(_BYTE *)&has & 0x20) != 0)
    {
      if ((*((_BYTE *)a3 + 52) & 0x20) == 0 || self->_portraitAspectRatioX != *((_DWORD *)a3 + 10))
        goto LABEL_45;
    }
    else if ((*((_BYTE *)a3 + 52) & 0x20) != 0)
    {
      goto LABEL_45;
    }
    if ((*(_BYTE *)&has & 0x40) != 0)
    {
      if ((*((_BYTE *)a3 + 52) & 0x40) == 0 || self->_portraitAspectRatioY != *((_DWORD *)a3 + 11))
        goto LABEL_45;
    }
    else if ((*((_BYTE *)a3 + 52) & 0x40) != 0)
    {
      goto LABEL_45;
    }
    if ((*(_BYTE *)&has & 8) != 0)
    {
      if ((*((_BYTE *)a3 + 52) & 8) == 0 || self->_mismatchedDisplayAspectRatioX != *((_DWORD *)a3 + 5))
        goto LABEL_45;
    }
    else if ((*((_BYTE *)a3 + 52) & 8) != 0)
    {
      goto LABEL_45;
    }
    if ((*(_BYTE *)&has & 0x10) != 0)
    {
      if ((*((_BYTE *)a3 + 52) & 0x10) == 0 || self->_mismatchedDisplayAspectRatioY != *((_DWORD *)a3 + 6))
        goto LABEL_45;
    }
    else if ((*((_BYTE *)a3 + 52) & 0x10) != 0)
    {
      goto LABEL_45;
    }
    LOBYTE(v5) = (*((_BYTE *)a3 + 52) & 1) == 0;
    if ((*(_BYTE *)&has & 1) != 0)
    {
      if ((*((_BYTE *)a3 + 52) & 1) == 0 || self->_cipherSuites != *((_DWORD *)a3 + 2))
        goto LABEL_45;
      LOBYTE(v5) = 1;
    }
  }
  return v5;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  if ((*(_BYTE *)&self->_has & 0x80000000) != 0)
    v3 = 2654435761 * self->_rtpSSRC;
  else
    v3 = 0;
  v4 = -[NSMutableArray hash](self->_payloads, "hash");
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    v5 = 2654435761 * self->_landscapeAspectRatioX;
    if ((*(_BYTE *)&self->_has & 4) != 0)
    {
LABEL_6:
      v6 = 2654435761 * self->_landscapeAspectRatioY;
      if ((*(_BYTE *)&self->_has & 0x20) != 0)
        goto LABEL_7;
      goto LABEL_14;
    }
  }
  else
  {
    v5 = 0;
    if ((*(_BYTE *)&self->_has & 4) != 0)
      goto LABEL_6;
  }
  v6 = 0;
  if ((*(_BYTE *)&self->_has & 0x20) != 0)
  {
LABEL_7:
    v7 = 2654435761 * self->_portraitAspectRatioX;
    if ((*(_BYTE *)&self->_has & 0x40) != 0)
      goto LABEL_8;
    goto LABEL_15;
  }
LABEL_14:
  v7 = 0;
  if ((*(_BYTE *)&self->_has & 0x40) != 0)
  {
LABEL_8:
    v8 = 2654435761 * self->_portraitAspectRatioY;
    if ((*(_BYTE *)&self->_has & 8) != 0)
      goto LABEL_9;
    goto LABEL_16;
  }
LABEL_15:
  v8 = 0;
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
LABEL_9:
    v9 = 2654435761 * self->_mismatchedDisplayAspectRatioX;
    if ((*(_BYTE *)&self->_has & 0x10) != 0)
      goto LABEL_10;
LABEL_17:
    v10 = 0;
    if ((*(_BYTE *)&self->_has & 1) != 0)
      goto LABEL_11;
LABEL_18:
    v11 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11;
  }
LABEL_16:
  v9 = 0;
  if ((*(_BYTE *)&self->_has & 0x10) == 0)
    goto LABEL_17;
LABEL_10:
  v10 = 2654435761 * self->_mismatchedDisplayAspectRatioY;
  if ((*(_BYTE *)&self->_has & 1) == 0)
    goto LABEL_18;
LABEL_11:
  v11 = 2654435761 * self->_cipherSuites;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11;
}

- (void)mergeFrom:(id)a3
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  char v10;
  _BYTE v11[128];
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (*((char *)a3 + 52) < 0)
  {
    self->_rtpSSRC = *((_DWORD *)a3 + 12);
    *(_BYTE *)&self->_has |= 0x80u;
  }
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = (void *)*((_QWORD *)a3 + 4);
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v11, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        -[VCMediaNegotiationBlobV2CameraSettingsU1 addPayloads:](self, "addPayloads:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * i));
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v11, 16);
    }
    while (v7);
  }
  v10 = *((_BYTE *)a3 + 52);
  if ((v10 & 2) != 0)
  {
    self->_landscapeAspectRatioX = *((_DWORD *)a3 + 3);
    *(_BYTE *)&self->_has |= 2u;
    v10 = *((_BYTE *)a3 + 52);
    if ((v10 & 4) == 0)
    {
LABEL_12:
      if ((v10 & 0x20) == 0)
        goto LABEL_13;
      goto LABEL_21;
    }
  }
  else if ((*((_BYTE *)a3 + 52) & 4) == 0)
  {
    goto LABEL_12;
  }
  self->_landscapeAspectRatioY = *((_DWORD *)a3 + 4);
  *(_BYTE *)&self->_has |= 4u;
  v10 = *((_BYTE *)a3 + 52);
  if ((v10 & 0x20) == 0)
  {
LABEL_13:
    if ((v10 & 0x40) == 0)
      goto LABEL_14;
    goto LABEL_22;
  }
LABEL_21:
  self->_portraitAspectRatioX = *((_DWORD *)a3 + 10);
  *(_BYTE *)&self->_has |= 0x20u;
  v10 = *((_BYTE *)a3 + 52);
  if ((v10 & 0x40) == 0)
  {
LABEL_14:
    if ((v10 & 8) == 0)
      goto LABEL_15;
    goto LABEL_23;
  }
LABEL_22:
  self->_portraitAspectRatioY = *((_DWORD *)a3 + 11);
  *(_BYTE *)&self->_has |= 0x40u;
  v10 = *((_BYTE *)a3 + 52);
  if ((v10 & 8) == 0)
  {
LABEL_15:
    if ((v10 & 0x10) == 0)
      goto LABEL_16;
    goto LABEL_24;
  }
LABEL_23:
  self->_mismatchedDisplayAspectRatioX = *((_DWORD *)a3 + 5);
  *(_BYTE *)&self->_has |= 8u;
  v10 = *((_BYTE *)a3 + 52);
  if ((v10 & 0x10) == 0)
  {
LABEL_16:
    if ((v10 & 1) == 0)
      return;
    goto LABEL_17;
  }
LABEL_24:
  self->_mismatchedDisplayAspectRatioY = *((_DWORD *)a3 + 6);
  *(_BYTE *)&self->_has |= 0x10u;
  if ((*((_BYTE *)a3 + 52) & 1) == 0)
    return;
LABEL_17:
  self->_cipherSuites = *((_DWORD *)a3 + 2);
  *(_BYTE *)&self->_has |= 1u;
}

- (unsigned)rtpSSRC
{
  return self->_rtpSSRC;
}

- (NSMutableArray)payloads
{
  return self->_payloads;
}

- (void)setPayloads:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 32);
}

- (unsigned)landscapeAspectRatioX
{
  return self->_landscapeAspectRatioX;
}

- (unsigned)landscapeAspectRatioY
{
  return self->_landscapeAspectRatioY;
}

- (unsigned)portraitAspectRatioX
{
  return self->_portraitAspectRatioX;
}

- (unsigned)portraitAspectRatioY
{
  return self->_portraitAspectRatioY;
}

- (unsigned)mismatchedDisplayAspectRatioX
{
  return self->_mismatchedDisplayAspectRatioX;
}

- (unsigned)mismatchedDisplayAspectRatioY
{
  return self->_mismatchedDisplayAspectRatioY;
}

- (VCMediaNegotiationBlobV2CameraSettingsU1)initWithSSRC:(unsigned int)a3 videoRuleCollections:(id)a4 screenSize:(CGSize)a5 aspectRatioPortrait:(CGSize)a6 aspectRatioLandscape:(CGSize)a7 orientationMismatchAspectRatioLandscape:(CGSize)a8 featureListStrings:(id)a9 u1AuthTagEnabled:(BOOL)a10
{
  _BOOL4 v10;
  double height;
  double width;
  double v15;
  double v16;
  double v17;
  double v18;
  uint64_t v19;
  VCMediaNegotiationBlobV2CameraSettingsU1 *v20;
  VCMediaNegotiationBlobV2CameraSettingsU1 *v21;
  double v22;
  double v23;
  uint64_t v24;
  uint64_t v25;
  NSObject *v26;
  id v27;
  CGSize v29;
  uint8_t buf[4];
  uint64_t v31;
  __int16 v32;
  const char *v33;
  __int16 v34;
  int v35;
  __int16 v36;
  id v37;
  __int16 v38;
  VCMediaNegotiationBlobV2CameraSettingsU1 *v39;
  uint64_t v40;

  v10 = a10;
  height = a8.height;
  width = a8.width;
  v15 = a7.height;
  v16 = a7.width;
  v17 = a6.height;
  v18 = a6.width;
  v19 = *(_QWORD *)&a3;
  v40 = *MEMORY[0x1E0C80C00];
  v29 = a5;
  v20 = -[VCMediaNegotiationBlobV2CameraSettingsU1 init](self, "init");
  v21 = v20;
  if (v20)
  {
    -[VCMediaNegotiationBlobV2CameraSettingsU1 setRtpSSRC:](v20, "setRtpSSRC:", v19);
    if (-[VCMediaNegotiationBlobV2CameraSettingsU1 setupVideoRuleCollection:featureListStrings:](v21, "setupVideoRuleCollection:featureListStrings:", a4, a9))
    {
      SimplifyFixedPointRatio(&v29.width);
      if (v29.height != v18)
        -[VCMediaNegotiationBlobV2CameraSettingsU1 setPortraitAspectRatioX:](v21, "setPortraitAspectRatioX:", v18, v29.height);
      v22 = v29.width;
      if (v29.width != v17)
      {
        -[VCMediaNegotiationBlobV2CameraSettingsU1 setPortraitAspectRatioY:](v21, "setPortraitAspectRatioY:", v17, v29.width);
        v22 = v29.width;
      }
      if (v22 != v16)
        -[VCMediaNegotiationBlobV2CameraSettingsU1 setLandscapeAspectRatioX:](v21, "setLandscapeAspectRatioX:", v16);
      v23 = v29.height;
      if (v29.height != v15)
        -[VCMediaNegotiationBlobV2CameraSettingsU1 setLandscapeAspectRatioY:](v21, "setLandscapeAspectRatioY:", v15, v29.height);
      if (v16 != width)
        -[VCMediaNegotiationBlobV2CameraSettingsU1 setMismatchedDisplayAspectRatioX:](v21, "setMismatchedDisplayAspectRatioX:", width, v23);
      if (v15 != height)
        -[VCMediaNegotiationBlobV2CameraSettingsU1 setMismatchedDisplayAspectRatioY:](v21, "setMismatchedDisplayAspectRatioY:", height);
      v24 = +[VCMediaNegotiationBlobV2SettingsU1 negotiationCipherSuitesFromMediaStreamCipherSuites:](VCMediaNegotiationBlobV2SettingsU1, "negotiationCipherSuitesFromMediaStreamCipherSuites:", +[VCEncryptionRules supportedCipherSuitesForStreamGroupID:isOneToOne:](VCEncryptionRules, "supportedCipherSuitesForStreamGroupID:isOneToOne:", 1667329381, 1));
      if (v10 && VCFeatureFlagManager_U1AuthTagEnabled())
      {
        if ((_DWORD)v24 != -[VCMediaNegotiationBlobV2CameraSettingsU1 cipherSuites](v21, "cipherSuites"))
          -[VCMediaNegotiationBlobV2CameraSettingsU1 setCipherSuites:](v21, "setCipherSuites:", v24);
      }
      else if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        v25 = VRTraceErrorLogLevelToCSTR();
        v26 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          v27 = +[VCMediaNegotiationBlobV2SettingsU1 appendCipherSuiteFlags:toDescription:](VCMediaNegotiationBlobV2SettingsU1, "appendCipherSuiteFlags:toDescription:", v24, objc_msgSend(MEMORY[0x1E0CB37A0], "string"));
          *(_DWORD *)buf = 136316162;
          v31 = v25;
          v32 = 2080;
          v33 = "-[VCMediaNegotiationBlobV2CameraSettingsU1(Utils) initWithSSRC:videoRuleCollections:screenSize:aspectRat"
                "ioPortrait:aspectRatioLandscape:orientationMismatchAspectRatioLandscape:featureListStrings:u1AuthTagEnabled:]";
          v34 = 1024;
          v35 = 64;
          v36 = 2112;
          v37 = v27;
          v38 = 2112;
          v39 = v21;
          _os_log_impl(&dword_1D8A54000, v26, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Pruning cipherSuites=%@ for blob=%@ because U1AuthTag is NOT enabled", buf, 0x30u);
        }
      }
    }
    else
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCMediaNegotiationBlobV2CameraSettingsU1(Utils) initWithSSRC:videoRuleCollections:screenSize:aspectRatioPortrait:aspectRatioLandscape:orientationMismatchAspectRatioLandscape:featureListStrings:u1AuthTagEnabled:].cold.1();
      }

      return 0;
    }
  }
  return v21;
}

- (void)aspectRatioPortrait:(CGSize *)a3 aspectRatioLandscape:(CGSize *)a4 orientationMismatchAspectRatioLandscape:(CGSize *)a5 orientationMismatchAspectRatioPortrait:(CGSize *)a6 screenSize:(CGSize)a7
{
  double v12;
  double width;
  double height;
  double v15;
  double v16;
  CGSize v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v17 = a7;
  v12 = SimplifyFixedPointRatio(&v17.width);
  if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    width = v17.width;
    if ((*(_BYTE *)&self->_has & 4) != 0)
      goto LABEL_3;
LABEL_6:
    height = v17.height;
    if (!a4)
      goto LABEL_8;
    goto LABEL_7;
  }
  width = (double)-[VCMediaNegotiationBlobV2CameraSettingsU1 landscapeAspectRatioX](self, "landscapeAspectRatioX", v12);
  if ((*(_BYTE *)&self->_has & 4) == 0)
    goto LABEL_6;
LABEL_3:
  height = (double)-[VCMediaNegotiationBlobV2CameraSettingsU1 landscapeAspectRatioY](self, "landscapeAspectRatioY", v12);
  if (a4)
  {
LABEL_7:
    a4->width = width;
    a4->height = height;
  }
LABEL_8:
  if ((*(_BYTE *)&self->_has & 0x20) == 0)
  {
    v15 = v17.height;
    if ((*(_BYTE *)&self->_has & 0x40) != 0)
      goto LABEL_10;
LABEL_13:
    v16 = v17.width;
    if (!a3)
      goto LABEL_15;
    goto LABEL_14;
  }
  v15 = (double)-[VCMediaNegotiationBlobV2CameraSettingsU1 portraitAspectRatioX](self, "portraitAspectRatioX");
  if ((*(_BYTE *)&self->_has & 0x40) == 0)
    goto LABEL_13;
LABEL_10:
  v16 = (double)-[VCMediaNegotiationBlobV2CameraSettingsU1 portraitAspectRatioY](self, "portraitAspectRatioY");
  if (a3)
  {
LABEL_14:
    a3->width = v15;
    a3->height = v16;
  }
LABEL_15:
  if (a5)
  {
    if ((*(_BYTE *)&self->_has & 8) != 0)
      width = (double)-[VCMediaNegotiationBlobV2CameraSettingsU1 mismatchedDisplayAspectRatioX](self, "mismatchedDisplayAspectRatioX");
    a5->width = width;
    if ((*(_BYTE *)&self->_has & 0x10) != 0)
      height = (double)-[VCMediaNegotiationBlobV2CameraSettingsU1 mismatchedDisplayAspectRatioY](self, "mismatchedDisplayAspectRatioY");
    a5->height = height;
  }
  if (a6)
  {
    if ((*(_BYTE *)&self->_has & 0x10) != 0)
      v15 = (double)-[VCMediaNegotiationBlobV2CameraSettingsU1 mismatchedDisplayAspectRatioY](self, "mismatchedDisplayAspectRatioY");
    a6->width = v15;
    if ((*(_BYTE *)&self->_has & 8) != 0)
      v16 = (double)-[VCMediaNegotiationBlobV2CameraSettingsU1 mismatchedDisplayAspectRatioX](self, "mismatchedDisplayAspectRatioX");
    a6->height = v16;
  }
}

- (CGSize)orientationMismatchDisplayRatio
{
  double v3;
  double v4;
  double v5;
  CGSize result;

  v3 = (double)-[VCMediaNegotiationBlobV2CameraSettingsU1 mismatchedDisplayAspectRatioX](self, "mismatchedDisplayAspectRatioX");
  v4 = (double)-[VCMediaNegotiationBlobV2CameraSettingsU1 mismatchedDisplayAspectRatioY](self, "mismatchedDisplayAspectRatioY");
  v5 = v3;
  result.height = v4;
  result.width = v5;
  return result;
}

- (BOOL)addVideoRules:(id)a3 encodingType:(unsigned __int8)a4 payload:(int)a5 videoRuleCollections:(id)a6
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v10;
  void *v11;
  void *v12;
  BOOL v13;

  v7 = *(_QWORD *)&a5;
  v8 = a4;
  if (objc_msgSend(a3, "count"))
  {
    v10 = objc_msgSend(a3, "mutableCopy");
    if (v10)
    {
      v11 = (void *)v10;
      v12 = (void *)objc_msgSend(a6, "supportedPayloads");
      if ((objc_msgSend(v12, "containsObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v7)) & 1) == 0)
        objc_msgSend(a6, "addSupportedPayload:", v7);
      v13 = 1;
      objc_msgSend(a6, "addVideoRules:transportType:payload:encodingType:", v11, 1, v7, v8);
    }
    else
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCMediaNegotiationBlobV2CameraSettingsU1(Utils) addVideoRules:encodingType:payload:videoRuleCollections:].cold.1();
      }
      v11 = 0;
      v13 = 0;
    }
  }
  else
  {
    v11 = 0;
    v13 = 1;
  }

  return v13;
}

- (VCVideoRuleCollections)videoRuleCollections
{
  VCVideoRuleCollections *v3;
  NSMutableArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  uint64_t v10;
  _BYTE v12[128];
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(VCVideoRuleCollections);
  if (!v3)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCMediaNegotiationBlobV2CameraSettingsU1(Utils) videoRuleCollections].cold.1();
    }
    goto LABEL_19;
  }
  if (!objc_msgSend(MEMORY[0x1E0C99E20], "set"))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCMediaNegotiationBlobV2CameraSettingsU1(Utils) videoRuleCollections].cold.2();
    }
LABEL_19:

    v3 = 0;
    return v3;
  }
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = -[VCMediaNegotiationBlobV2CameraSettingsU1 payloads](self, "payloads");
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v13, v12, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        v10 = objc_msgSend(v9, "payload");
        if (!-[VCMediaNegotiationBlobV2CameraSettingsU1 addVideoRules:encodingType:payload:videoRuleCollections:](self, "addVideoRules:encodingType:payload:videoRuleCollections:", objc_msgSend(v9, "encodeVideoRules"), 1, v10, v3))
        {
          if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
          {
            VRTraceErrorLogLevelToCSTR();
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
              -[VCMediaNegotiationBlobV2CameraSettingsU1(Utils) videoRuleCollections].cold.4();
          }
          goto LABEL_19;
        }
        if (!-[VCMediaNegotiationBlobV2CameraSettingsU1 addVideoRules:encodingType:payload:videoRuleCollections:](self, "addVideoRules:encodingType:payload:videoRuleCollections:", objc_msgSend(v9, "decodeVideoRules"), 2, v10, v3))
        {
          if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
          {
            VRTraceErrorLogLevelToCSTR();
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
              -[VCMediaNegotiationBlobV2CameraSettingsU1(Utils) videoRuleCollections].cold.3();
          }
          goto LABEL_19;
        }
      }
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v13, v12, 16);
      if (v6)
        continue;
      break;
    }
  }
  return v3;
}

- (void)printWithLogFile:(void *)a3 prefix:(id)a4 screenSize:(CGSize)a5
{
  void *v8;
  uint64_t v9;
  char v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  NSMutableArray *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  _BYTE v32[128];
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  uint8_t buf[4];
  uint64_t v38;
  __int16 v39;
  const char *v40;
  __int16 v41;
  int v42;
  __int16 v43;
  void *v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v30 = -1;
  v31 = -1;
  v28 = -1;
  v29 = -1;
  v26 = -1;
  v27 = -1;
  v24 = -1;
  v25 = -1;
  -[VCMediaNegotiationBlobV2CameraSettingsU1 aspectRatioPortrait:aspectRatioLandscape:orientationMismatchAspectRatioLandscape:orientationMismatchAspectRatioPortrait:screenSize:](self, "aspectRatioPortrait:aspectRatioLandscape:orientationMismatchAspectRatioLandscape:orientationMismatchAspectRatioPortrait:screenSize:", &v30, &v28, &v26, &v24, a5.width, a5.height);
  v8 = (void *)objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("[%lu] %@"), objc_msgSend((id)-[VCMediaNegotiationBlobV2CameraSettingsU1 data](self, "data"), "length"), a4);
  v9 = -[VCMediaNegotiationBlobV2CameraSettingsU1 rtpSSRC](self, "rtpSSRC");
  objc_msgSend(v8, "appendFormat:", CFSTR("Camera settings (U+1): src=%08x AR=%fx%f,%fx%f XR=%fx%f,%fx%f "), v9, v28, v29, v30, v31, v26, v27, v24, v25);
  +[VCMediaNegotiationBlobV2SettingsU1 appendCipherSuiteFlags:toDescription:](VCMediaNegotiationBlobV2SettingsU1, "appendCipherSuiteFlags:toDescription:", -[VCMediaNegotiationBlobV2CameraSettingsU1 cipherSuites](self, "cipherSuites"), v8);
  v10 = objc_msgSend(v8, "UTF8String");
  VRLogfilePrintWithTimestamp((uint64_t)a3, "%s\n", v11, v12, v13, v14, v15, v16, v10);
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v17 = VRTraceErrorLogLevelToCSTR();
    v18 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      v38 = v17;
      v39 = 2080;
      v40 = "-[VCMediaNegotiationBlobV2CameraSettingsU1(Utils) printWithLogFile:prefix:screenSize:]";
      v41 = 1024;
      v42 = 172;
      v43 = 2112;
      v44 = v8;
      _os_log_impl(&dword_1D8A54000, v18, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d %@", buf, 0x26u);
    }
  }
  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  v19 = -[VCMediaNegotiationBlobV2CameraSettingsU1 payloads](self, "payloads");
  v20 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v33, v32, 16);
  if (v20)
  {
    v21 = v20;
    v22 = *(_QWORD *)v34;
    do
    {
      v23 = 0;
      do
      {
        if (*(_QWORD *)v34 != v22)
          objc_enumerationMutation(v19);
        objc_msgSend(*(id *)(*((_QWORD *)&v33 + 1) + 8 * v23++), "printWithLogFile:prefix:", a3, objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@  "), a4));
      }
      while (v21 != v23);
      v21 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v33, v32, 16);
    }
    while (v21);
  }
}

- (id)rulesForEncodeType:(unsigned __int8)a3 paylaod:(int)a4 videoRuleCollection:(id)a5
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;

  v6 = *(_QWORD *)&a4;
  v7 = a3;
  v8 = objc_msgSend(a5, "getVideoRulesForTransport:payload:encodingType:", 1, *(_QWORD *)&a4, a3);
  v9 = objc_msgSend(a5, "getVideoRulesForTransport:payload:encodingType:", 2, v6, v7);
  v10 = (void *)objc_msgSend(MEMORY[0x1E0C99E20], "setWithArray:", v8);
  objc_msgSend(v10, "addObjectsFromArray:", v9);
  return (id)objc_msgSend(v10, "allObjects");
}

- (BOOL)setupVideoRuleCollection:(id)a3 featureListStrings:(id)a4
{
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  VCMediaNegotiationBlobV2VideoPayload *v12;
  VCMediaNegotiationBlobV2VideoPayload *v13;
  _BOOL4 v14;
  _BYTE v17[128];
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v6 = (void *)objc_msgSend(a3, "supportedPayloads");
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v17, 16);
  if (!v7)
  {
LABEL_11:
    LOBYTE(v14) = 1;
    return v14;
  }
  v8 = v7;
  v9 = *(_QWORD *)v19;
LABEL_3:
  v10 = 0;
  while (1)
  {
    if (*(_QWORD *)v19 != v9)
      objc_enumerationMutation(v6);
    v11 = objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * v10), "unsignedIntValue");
    if ((_DWORD)v11 == 126)
      goto LABEL_9;
    v12 = -[VCMediaNegotiationBlobV2VideoPayload initWithPayload:encodeVideoRules:decodeVideoRules:videoParameterSupport:featureListStrings:]([VCMediaNegotiationBlobV2VideoPayload alloc], "initWithPayload:encodeVideoRules:decodeVideoRules:videoParameterSupport:featureListStrings:", v11, -[VCMediaNegotiationBlobV2CameraSettingsU1 rulesForEncodeType:paylaod:videoRuleCollection:](self, "rulesForEncodeType:paylaod:videoRuleCollection:", 1, v11, a3), -[VCMediaNegotiationBlobV2CameraSettingsU1 rulesForEncodeType:paylaod:videoRuleCollection:](self, "rulesForEncodeType:paylaod:videoRuleCollection:", 2, v11, a3), VCVideoParamaterSets_DefaultSupportedSets(v11), a4);
    if (!v12)
      break;
    v13 = v12;
    -[VCMediaNegotiationBlobV2CameraSettingsU1 addPayloads:](self, "addPayloads:", v12);

LABEL_9:
    if (v8 == ++v10)
    {
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v17, 16);
      if (v8)
        goto LABEL_3;
      goto LABEL_11;
    }
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    v14 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
    if (!v14)
      return v14;
    -[VCMediaNegotiationBlobV2CameraSettingsU1(Utils) setupVideoRuleCollection:featureListStrings:].cold.1();
  }
  LOBYTE(v14) = 0;
  return v14;
}

@end
