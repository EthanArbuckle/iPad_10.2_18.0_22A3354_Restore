@implementation VCMediaNegotiationBlobVideoSettings

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  -[VCMediaNegotiationBlobVideoSettings setVideoPayloadCollections:](self, "setVideoPayloadCollections:", 0);
  v3.receiver = self;
  v3.super_class = (Class)VCMediaNegotiationBlobVideoSettings;
  -[VCMediaNegotiationBlobVideoSettings dealloc](&v3, sel_dealloc);
}

- (void)clearVideoPayloadCollections
{
  -[NSMutableArray removeAllObjects](self->_videoPayloadCollections, "removeAllObjects");
}

- (void)addVideoPayloadCollections:(id)a3
{
  NSMutableArray *videoPayloadCollections;

  videoPayloadCollections = self->_videoPayloadCollections;
  if (!videoPayloadCollections)
  {
    videoPayloadCollections = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    self->_videoPayloadCollections = videoPayloadCollections;
  }
  -[NSMutableArray addObject:](videoPayloadCollections, "addObject:", a3);
}

- (unint64_t)videoPayloadCollectionsCount
{
  return -[NSMutableArray count](self->_videoPayloadCollections, "count");
}

- (id)videoPayloadCollectionsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_videoPayloadCollections, "objectAtIndex:", a3);
}

+ (Class)videoPayloadCollectionsType
{
  return (Class)objc_opt_class();
}

- (unsigned)customVideoWidth
{
  if ((*(_WORD *)&self->_has & 2) != 0)
    return self->_customVideoWidth;
  else
    return 0;
}

- (void)setCustomVideoWidth:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_customVideoWidth = a3;
}

- (void)setHasCustomVideoWidth:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (BOOL)hasCustomVideoWidth
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (unsigned)customVideoHeight
{
  if ((*(_WORD *)&self->_has & 1) != 0)
    return self->_customVideoHeight;
  else
    return 0;
}

- (void)setCustomVideoHeight:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 1u;
  self->_customVideoHeight = a3;
}

- (void)setHasCustomVideoHeight:(BOOL)a3
{
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFE | a3;
}

- (BOOL)hasCustomVideoHeight
{
  return *(_WORD *)&self->_has & 1;
}

- (unsigned)tilesPerFrame
{
  if ((*(_WORD *)&self->_has & 0x10) != 0)
    return self->_tilesPerFrame;
  else
    return 1;
}

- (void)setTilesPerFrame:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_tilesPerFrame = a3;
}

- (void)setHasTilesPerFrame:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (BOOL)hasTilesPerFrame
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (BOOL)ltrpEnabled
{
  return (*(_WORD *)&self->_has & 0x80) != 0 && self->_ltrpEnabled;
}

- (void)setLtrpEnabled:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_ltrpEnabled = a3;
}

- (void)setHasLtrpEnabled:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 128;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (BOOL)hasLtrpEnabled
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (void)setPixelFormats:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_pixelFormats = a3;
}

- (void)setHasPixelFormats:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (BOOL)hasPixelFormats
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (void)setHdrModesSupported:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_hdrModesSupported = a3;
}

- (void)setHasHdrModesSupported:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (BOOL)hasHdrModesSupported
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (void)setFecEnabled:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_fecEnabled = a3;
}

- (void)setHasFecEnabled:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (BOOL)hasFecEnabled
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (void)setRtxEnabled:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_rtxEnabled = a3;
}

- (void)setHasRtxEnabled:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 256;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (BOOL)hasRtxEnabled
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (void)setBlackFrameOnClearScreenEnabled:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_blackFrameOnClearScreenEnabled = a3;
}

- (void)setHasBlackFrameOnClearScreenEnabled:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (BOOL)hasBlackFrameOnClearScreenEnabled
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (id)description
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v3.receiver = self;
  v3.super_class = (Class)VCMediaNegotiationBlobVideoSettings;
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ %@"), -[VCMediaNegotiationBlobVideoSettings description](&v3, sel_description), -[VCMediaNegotiationBlobVideoSettings dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSMutableArray *videoPayloadCollections;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  __int16 has;
  _BYTE v12[128];
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_rtpSSRC), CFSTR("rtpSSRC"));
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_allowRTCPFB), CFSTR("allowRTCPFB"));
  if (-[NSMutableArray count](self->_videoPayloadCollections, "count"))
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_videoPayloadCollections, "count"));
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    videoPayloadCollections = self->_videoPayloadCollections;
    v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](videoPayloadCollections, "countByEnumeratingWithState:objects:count:", &v13, v12, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v14;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v14 != v8)
            objc_enumerationMutation(videoPayloadCollections);
          objc_msgSend(v4, "addObject:", objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * i), "dictionaryRepresentation"));
        }
        v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](videoPayloadCollections, "countByEnumeratingWithState:objects:count:", &v13, v12, 16);
      }
      while (v7);
    }
    objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("videoPayloadCollections"));

  }
  has = (__int16)self->_has;
  if ((has & 2) != 0)
  {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_customVideoWidth), CFSTR("customVideoWidth"));
    has = (__int16)self->_has;
    if ((has & 1) == 0)
    {
LABEL_12:
      if ((has & 0x10) == 0)
        goto LABEL_13;
      goto LABEL_23;
    }
  }
  else if ((has & 1) == 0)
  {
    goto LABEL_12;
  }
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_customVideoHeight), CFSTR("customVideoHeight"));
  has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_13:
    if ((has & 0x80) == 0)
      goto LABEL_14;
    goto LABEL_24;
  }
LABEL_23:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_tilesPerFrame), CFSTR("tilesPerFrame"));
  has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_14:
    if ((has & 8) == 0)
      goto LABEL_15;
    goto LABEL_25;
  }
LABEL_24:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_ltrpEnabled), CFSTR("ltrpEnabled"));
  has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_15:
    if ((has & 4) == 0)
      goto LABEL_16;
    goto LABEL_26;
  }
LABEL_25:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_pixelFormats), CFSTR("pixelFormats"));
  has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_16:
    if ((has & 0x40) == 0)
      goto LABEL_17;
    goto LABEL_27;
  }
LABEL_26:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_hdrModesSupported), CFSTR("hdrModesSupported"));
  has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_17:
    if ((has & 0x100) == 0)
      goto LABEL_18;
LABEL_28:
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_rtxEnabled), CFSTR("rtxEnabled"));
    if ((*(_WORD *)&self->_has & 0x20) == 0)
      return v3;
    goto LABEL_19;
  }
LABEL_27:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_fecEnabled), CFSTR("fecEnabled"));
  has = (__int16)self->_has;
  if ((has & 0x100) != 0)
    goto LABEL_28;
LABEL_18:
  if ((has & 0x20) != 0)
LABEL_19:
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_blackFrameOnClearScreenEnabled), CFSTR("blackFrameOnClearScreenEnabled"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return VCMediaNegotiationBlobVideoSettingsReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  NSMutableArray *videoPayloadCollections;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  __int16 has;
  _BYTE v10[128];
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  PBDataWriterWriteUint32Field();
  PBDataWriterWriteBOOLField();
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  videoPayloadCollections = self->_videoPayloadCollections;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](videoPayloadCollections, "countByEnumeratingWithState:objects:count:", &v11, v10, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(videoPayloadCollections);
        PBDataWriterWriteSubmessage();
      }
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](videoPayloadCollections, "countByEnumeratingWithState:objects:count:", &v11, v10, 16);
    }
    while (v6);
  }
  has = (__int16)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteUint32Field();
    has = (__int16)self->_has;
    if ((has & 1) == 0)
    {
LABEL_10:
      if ((has & 0x10) == 0)
        goto LABEL_11;
      goto LABEL_21;
    }
  }
  else if ((has & 1) == 0)
  {
    goto LABEL_10;
  }
  PBDataWriterWriteUint32Field();
  has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_11:
    if ((has & 0x80) == 0)
      goto LABEL_12;
    goto LABEL_22;
  }
LABEL_21:
  PBDataWriterWriteUint32Field();
  has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_12:
    if ((has & 8) == 0)
      goto LABEL_13;
    goto LABEL_23;
  }
LABEL_22:
  PBDataWriterWriteBOOLField();
  has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_13:
    if ((has & 4) == 0)
      goto LABEL_14;
    goto LABEL_24;
  }
LABEL_23:
  PBDataWriterWriteUint32Field();
  has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_14:
    if ((has & 0x40) == 0)
      goto LABEL_15;
    goto LABEL_25;
  }
LABEL_24:
  PBDataWriterWriteUint32Field();
  has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_15:
    if ((has & 0x100) == 0)
      goto LABEL_16;
    goto LABEL_26;
  }
LABEL_25:
  PBDataWriterWriteBOOLField();
  has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_16:
    if ((has & 0x20) == 0)
      return;
    goto LABEL_17;
  }
LABEL_26:
  PBDataWriterWriteBOOLField();
  if ((*(_WORD *)&self->_has & 0x20) == 0)
    return;
LABEL_17:
  PBDataWriterWriteBOOLField();
}

- (void)copyTo:(id)a3
{
  unint64_t v5;
  unint64_t v6;
  uint64_t i;
  __int16 has;

  *((_DWORD *)a3 + 6) = self->_rtpSSRC;
  *((_BYTE *)a3 + 40) = self->_allowRTCPFB;
  if (-[VCMediaNegotiationBlobVideoSettings videoPayloadCollectionsCount](self, "videoPayloadCollectionsCount"))
  {
    objc_msgSend(a3, "clearVideoPayloadCollections");
    v5 = -[VCMediaNegotiationBlobVideoSettings videoPayloadCollectionsCount](self, "videoPayloadCollectionsCount");
    if (v5)
    {
      v6 = v5;
      for (i = 0; i != v6; ++i)
        objc_msgSend(a3, "addVideoPayloadCollections:", -[VCMediaNegotiationBlobVideoSettings videoPayloadCollectionsAtIndex:](self, "videoPayloadCollectionsAtIndex:", i));
    }
  }
  has = (__int16)self->_has;
  if ((has & 2) != 0)
  {
    *((_DWORD *)a3 + 3) = self->_customVideoWidth;
    *((_WORD *)a3 + 24) |= 2u;
    has = (__int16)self->_has;
    if ((has & 1) == 0)
    {
LABEL_7:
      if ((has & 0x10) == 0)
        goto LABEL_8;
      goto LABEL_18;
    }
  }
  else if ((has & 1) == 0)
  {
    goto LABEL_7;
  }
  *((_DWORD *)a3 + 2) = self->_customVideoHeight;
  *((_WORD *)a3 + 24) |= 1u;
  has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_8:
    if ((has & 0x80) == 0)
      goto LABEL_9;
    goto LABEL_19;
  }
LABEL_18:
  *((_DWORD *)a3 + 7) = self->_tilesPerFrame;
  *((_WORD *)a3 + 24) |= 0x10u;
  has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_9:
    if ((has & 8) == 0)
      goto LABEL_10;
    goto LABEL_20;
  }
LABEL_19:
  *((_BYTE *)a3 + 43) = self->_ltrpEnabled;
  *((_WORD *)a3 + 24) |= 0x80u;
  has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_10:
    if ((has & 4) == 0)
      goto LABEL_11;
    goto LABEL_21;
  }
LABEL_20:
  *((_DWORD *)a3 + 5) = self->_pixelFormats;
  *((_WORD *)a3 + 24) |= 8u;
  has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_11:
    if ((has & 0x40) == 0)
      goto LABEL_12;
    goto LABEL_22;
  }
LABEL_21:
  *((_DWORD *)a3 + 4) = self->_hdrModesSupported;
  *((_WORD *)a3 + 24) |= 4u;
  has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_12:
    if ((has & 0x100) == 0)
      goto LABEL_13;
    goto LABEL_23;
  }
LABEL_22:
  *((_BYTE *)a3 + 42) = self->_fecEnabled;
  *((_WORD *)a3 + 24) |= 0x40u;
  has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_13:
    if ((has & 0x20) == 0)
      return;
    goto LABEL_14;
  }
LABEL_23:
  *((_BYTE *)a3 + 44) = self->_rtxEnabled;
  *((_WORD *)a3 + 24) |= 0x100u;
  if ((*(_WORD *)&self->_has & 0x20) == 0)
    return;
LABEL_14:
  *((_BYTE *)a3 + 41) = self->_blackFrameOnClearScreenEnabled;
  *((_WORD *)a3 + 24) |= 0x20u;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  NSMutableArray *videoPayloadCollections;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  __int16 has;
  _BYTE v14[128];
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *(_DWORD *)(v5 + 24) = self->_rtpSSRC;
  *(_BYTE *)(v5 + 40) = self->_allowRTCPFB;
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  videoPayloadCollections = self->_videoPayloadCollections;
  v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](videoPayloadCollections, "countByEnumeratingWithState:objects:count:", &v15, v14, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(videoPayloadCollections);
        v11 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * i), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addVideoPayloadCollections:", v11);

      }
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](videoPayloadCollections, "countByEnumeratingWithState:objects:count:", &v15, v14, 16);
    }
    while (v8);
  }
  has = (__int16)self->_has;
  if ((has & 2) != 0)
  {
    *(_DWORD *)(v5 + 12) = self->_customVideoWidth;
    *(_WORD *)(v5 + 48) |= 2u;
    has = (__int16)self->_has;
    if ((has & 1) == 0)
    {
LABEL_10:
      if ((has & 0x10) == 0)
        goto LABEL_11;
      goto LABEL_21;
    }
  }
  else if ((has & 1) == 0)
  {
    goto LABEL_10;
  }
  *(_DWORD *)(v5 + 8) = self->_customVideoHeight;
  *(_WORD *)(v5 + 48) |= 1u;
  has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_11:
    if ((has & 0x80) == 0)
      goto LABEL_12;
    goto LABEL_22;
  }
LABEL_21:
  *(_DWORD *)(v5 + 28) = self->_tilesPerFrame;
  *(_WORD *)(v5 + 48) |= 0x10u;
  has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_12:
    if ((has & 8) == 0)
      goto LABEL_13;
    goto LABEL_23;
  }
LABEL_22:
  *(_BYTE *)(v5 + 43) = self->_ltrpEnabled;
  *(_WORD *)(v5 + 48) |= 0x80u;
  has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_13:
    if ((has & 4) == 0)
      goto LABEL_14;
    goto LABEL_24;
  }
LABEL_23:
  *(_DWORD *)(v5 + 20) = self->_pixelFormats;
  *(_WORD *)(v5 + 48) |= 8u;
  has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_14:
    if ((has & 0x40) == 0)
      goto LABEL_15;
    goto LABEL_25;
  }
LABEL_24:
  *(_DWORD *)(v5 + 16) = self->_hdrModesSupported;
  *(_WORD *)(v5 + 48) |= 4u;
  has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_15:
    if ((has & 0x100) == 0)
      goto LABEL_16;
LABEL_26:
    *(_BYTE *)(v5 + 44) = self->_rtxEnabled;
    *(_WORD *)(v5 + 48) |= 0x100u;
    if ((*(_WORD *)&self->_has & 0x20) == 0)
      return (id)v5;
    goto LABEL_17;
  }
LABEL_25:
  *(_BYTE *)(v5 + 42) = self->_fecEnabled;
  *(_WORD *)(v5 + 48) |= 0x40u;
  has = (__int16)self->_has;
  if ((has & 0x100) != 0)
    goto LABEL_26;
LABEL_16:
  if ((has & 0x20) != 0)
  {
LABEL_17:
    *(_BYTE *)(v5 + 41) = self->_blackFrameOnClearScreenEnabled;
    *(_WORD *)(v5 + 48) |= 0x20u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  int v5;
  NSMutableArray *videoPayloadCollections;
  __int16 has;
  __int16 v8;

  v5 = objc_msgSend(a3, "isMemberOfClass:", objc_opt_class());
  if (!v5)
    return v5;
  if (self->_rtpSSRC != *((_DWORD *)a3 + 6))
    goto LABEL_60;
  if (self->_allowRTCPFB)
  {
    if (!*((_BYTE *)a3 + 40))
      goto LABEL_60;
  }
  else if (*((_BYTE *)a3 + 40))
  {
    goto LABEL_60;
  }
  videoPayloadCollections = self->_videoPayloadCollections;
  if ((unint64_t)videoPayloadCollections | *((_QWORD *)a3 + 4))
  {
    v5 = -[NSMutableArray isEqual:](videoPayloadCollections, "isEqual:");
    if (!v5)
      return v5;
  }
  has = (__int16)self->_has;
  v8 = *((_WORD *)a3 + 24);
  if ((has & 2) != 0)
  {
    if ((v8 & 2) == 0 || self->_customVideoWidth != *((_DWORD *)a3 + 3))
      goto LABEL_60;
  }
  else if ((v8 & 2) != 0)
  {
    goto LABEL_60;
  }
  if ((has & 1) != 0)
  {
    if ((v8 & 1) == 0 || self->_customVideoHeight != *((_DWORD *)a3 + 2))
      goto LABEL_60;
  }
  else if ((v8 & 1) != 0)
  {
    goto LABEL_60;
  }
  if ((has & 0x10) != 0)
  {
    if ((v8 & 0x10) == 0 || self->_tilesPerFrame != *((_DWORD *)a3 + 7))
      goto LABEL_60;
  }
  else if ((v8 & 0x10) != 0)
  {
    goto LABEL_60;
  }
  if ((has & 0x80) != 0)
  {
    if ((v8 & 0x80) == 0)
      goto LABEL_60;
    if (self->_ltrpEnabled)
    {
      if (!*((_BYTE *)a3 + 43))
        goto LABEL_60;
    }
    else if (*((_BYTE *)a3 + 43))
    {
      goto LABEL_60;
    }
  }
  else if ((v8 & 0x80) != 0)
  {
    goto LABEL_60;
  }
  if ((has & 8) != 0)
  {
    if ((v8 & 8) == 0 || self->_pixelFormats != *((_DWORD *)a3 + 5))
      goto LABEL_60;
  }
  else if ((v8 & 8) != 0)
  {
    goto LABEL_60;
  }
  if ((has & 4) != 0)
  {
    if ((v8 & 4) == 0 || self->_hdrModesSupported != *((_DWORD *)a3 + 4))
      goto LABEL_60;
  }
  else if ((v8 & 4) != 0)
  {
    goto LABEL_60;
  }
  if ((has & 0x40) != 0)
  {
    if ((v8 & 0x40) == 0)
      goto LABEL_60;
    if (self->_fecEnabled)
    {
      if (!*((_BYTE *)a3 + 42))
        goto LABEL_60;
    }
    else if (*((_BYTE *)a3 + 42))
    {
      goto LABEL_60;
    }
  }
  else if ((v8 & 0x40) != 0)
  {
    goto LABEL_60;
  }
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
    if ((*((_WORD *)a3 + 24) & 0x100) != 0)
    {
      if (self->_rtxEnabled)
      {
        if (!*((_BYTE *)a3 + 44))
          goto LABEL_60;
        goto LABEL_58;
      }
      if (!*((_BYTE *)a3 + 44))
        goto LABEL_58;
    }
LABEL_60:
    LOBYTE(v5) = 0;
    return v5;
  }
  if ((*((_WORD *)a3 + 24) & 0x100) != 0)
    goto LABEL_60;
LABEL_58:
  LOBYTE(v5) = (v8 & 0x20) == 0;
  if ((has & 0x20) != 0)
  {
    if ((v8 & 0x20) == 0)
      goto LABEL_60;
    if (self->_blackFrameOnClearScreenEnabled)
    {
      if (!*((_BYTE *)a3 + 41))
        goto LABEL_60;
    }
    else if (*((_BYTE *)a3 + 41))
    {
      goto LABEL_60;
    }
    LOBYTE(v5) = 1;
  }
  return v5;
}

- (unint64_t)hash
{
  unsigned int rtpSSRC;
  _BOOL4 allowRTCPFB;
  uint64_t v5;
  __int16 has;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  rtpSSRC = self->_rtpSSRC;
  allowRTCPFB = self->_allowRTCPFB;
  v5 = -[NSMutableArray hash](self->_videoPayloadCollections, "hash");
  has = (__int16)self->_has;
  if ((has & 2) != 0)
  {
    v7 = 2654435761 * self->_customVideoWidth;
    if ((has & 1) != 0)
    {
LABEL_3:
      v8 = 2654435761 * self->_customVideoHeight;
      if ((has & 0x10) != 0)
        goto LABEL_4;
      goto LABEL_13;
    }
  }
  else
  {
    v7 = 0;
    if ((has & 1) != 0)
      goto LABEL_3;
  }
  v8 = 0;
  if ((has & 0x10) != 0)
  {
LABEL_4:
    v9 = 2654435761 * self->_tilesPerFrame;
    if ((has & 0x80) != 0)
      goto LABEL_5;
    goto LABEL_14;
  }
LABEL_13:
  v9 = 0;
  if ((has & 0x80) != 0)
  {
LABEL_5:
    v10 = 2654435761 * self->_ltrpEnabled;
    if ((has & 8) != 0)
      goto LABEL_6;
    goto LABEL_15;
  }
LABEL_14:
  v10 = 0;
  if ((has & 8) != 0)
  {
LABEL_6:
    v11 = 2654435761 * self->_pixelFormats;
    if ((has & 4) != 0)
      goto LABEL_7;
    goto LABEL_16;
  }
LABEL_15:
  v11 = 0;
  if ((has & 4) != 0)
  {
LABEL_7:
    v12 = 2654435761 * self->_hdrModesSupported;
    if ((has & 0x40) != 0)
      goto LABEL_8;
    goto LABEL_17;
  }
LABEL_16:
  v12 = 0;
  if ((has & 0x40) != 0)
  {
LABEL_8:
    v13 = 2654435761 * self->_fecEnabled;
    if ((*(_WORD *)&self->_has & 0x100) != 0)
      goto LABEL_9;
LABEL_18:
    v14 = 0;
    if ((has & 0x20) != 0)
      goto LABEL_10;
LABEL_19:
    v15 = 0;
    return (2654435761 * allowRTCPFB) ^ (2654435761 * rtpSSRC) ^ v5 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15;
  }
LABEL_17:
  v13 = 0;
  if ((*(_WORD *)&self->_has & 0x100) == 0)
    goto LABEL_18;
LABEL_9:
  v14 = 2654435761 * self->_rtxEnabled;
  if ((has & 0x20) == 0)
    goto LABEL_19;
LABEL_10:
  v15 = 2654435761 * self->_blackFrameOnClearScreenEnabled;
  return (2654435761 * allowRTCPFB) ^ (2654435761 * rtpSSRC) ^ v5 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15;
}

- (void)mergeFrom:(id)a3
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  __int16 v10;
  _BYTE v11[128];
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  self->_rtpSSRC = *((_DWORD *)a3 + 6);
  self->_allowRTCPFB = *((_BYTE *)a3 + 40);
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
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
        -[VCMediaNegotiationBlobVideoSettings addVideoPayloadCollections:](self, "addVideoPayloadCollections:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * i));
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v11, 16);
    }
    while (v7);
  }
  v10 = *((_WORD *)a3 + 24);
  if ((v10 & 2) != 0)
  {
    self->_customVideoWidth = *((_DWORD *)a3 + 3);
    *(_WORD *)&self->_has |= 2u;
    v10 = *((_WORD *)a3 + 24);
    if ((v10 & 1) == 0)
    {
LABEL_10:
      if ((v10 & 0x10) == 0)
        goto LABEL_11;
      goto LABEL_21;
    }
  }
  else if ((v10 & 1) == 0)
  {
    goto LABEL_10;
  }
  self->_customVideoHeight = *((_DWORD *)a3 + 2);
  *(_WORD *)&self->_has |= 1u;
  v10 = *((_WORD *)a3 + 24);
  if ((v10 & 0x10) == 0)
  {
LABEL_11:
    if ((v10 & 0x80) == 0)
      goto LABEL_12;
    goto LABEL_22;
  }
LABEL_21:
  self->_tilesPerFrame = *((_DWORD *)a3 + 7);
  *(_WORD *)&self->_has |= 0x10u;
  v10 = *((_WORD *)a3 + 24);
  if ((v10 & 0x80) == 0)
  {
LABEL_12:
    if ((v10 & 8) == 0)
      goto LABEL_13;
    goto LABEL_23;
  }
LABEL_22:
  self->_ltrpEnabled = *((_BYTE *)a3 + 43);
  *(_WORD *)&self->_has |= 0x80u;
  v10 = *((_WORD *)a3 + 24);
  if ((v10 & 8) == 0)
  {
LABEL_13:
    if ((v10 & 4) == 0)
      goto LABEL_14;
    goto LABEL_24;
  }
LABEL_23:
  self->_pixelFormats = *((_DWORD *)a3 + 5);
  *(_WORD *)&self->_has |= 8u;
  v10 = *((_WORD *)a3 + 24);
  if ((v10 & 4) == 0)
  {
LABEL_14:
    if ((v10 & 0x40) == 0)
      goto LABEL_15;
    goto LABEL_25;
  }
LABEL_24:
  self->_hdrModesSupported = *((_DWORD *)a3 + 4);
  *(_WORD *)&self->_has |= 4u;
  v10 = *((_WORD *)a3 + 24);
  if ((v10 & 0x40) == 0)
  {
LABEL_15:
    if ((v10 & 0x100) == 0)
      goto LABEL_16;
    goto LABEL_26;
  }
LABEL_25:
  self->_fecEnabled = *((_BYTE *)a3 + 42);
  *(_WORD *)&self->_has |= 0x40u;
  v10 = *((_WORD *)a3 + 24);
  if ((v10 & 0x100) == 0)
  {
LABEL_16:
    if ((v10 & 0x20) == 0)
      return;
    goto LABEL_17;
  }
LABEL_26:
  self->_rtxEnabled = *((_BYTE *)a3 + 44);
  *(_WORD *)&self->_has |= 0x100u;
  if ((*((_WORD *)a3 + 24) & 0x20) == 0)
    return;
LABEL_17:
  self->_blackFrameOnClearScreenEnabled = *((_BYTE *)a3 + 41);
  *(_WORD *)&self->_has |= 0x20u;
}

- (unsigned)rtpSSRC
{
  return self->_rtpSSRC;
}

- (void)setRtpSSRC:(unsigned int)a3
{
  self->_rtpSSRC = a3;
}

- (BOOL)allowRTCPFB
{
  return self->_allowRTCPFB;
}

- (void)setAllowRTCPFB:(BOOL)a3
{
  self->_allowRTCPFB = a3;
}

- (NSMutableArray)videoPayloadCollections
{
  return self->_videoPayloadCollections;
}

- (void)setVideoPayloadCollections:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 32);
}

- (unsigned)pixelFormats
{
  return self->_pixelFormats;
}

- (unsigned)hdrModesSupported
{
  return self->_hdrModesSupported;
}

- (BOOL)fecEnabled
{
  return self->_fecEnabled;
}

- (BOOL)rtxEnabled
{
  return self->_rtxEnabled;
}

- (BOOL)blackFrameOnClearScreenEnabled
{
  return self->_blackFrameOnClearScreenEnabled;
}

- (VCMediaNegotiationBlobVideoSettings)initWithSSRC:(unsigned int)a3 allowRTCPFB:(BOOL)a4 videoRuleCollections:(id)a5 featureStrings:(id)a6 isCellular16x9Capable:(BOOL)a7 tilesPerFrame:(unsigned int)a8 ltrpEnabled:(BOOL)a9 pixelFormats:(id)a10 hdrModesSupported:(id)a11
{
  _BOOL8 v12;
  VCMediaNegotiationBlobVideoSettings *v17;
  VCMediaNegotiationBlobVideoSettings *v18;
  unsigned int v19;
  uint64_t v20;
  NSObject *v21;
  unsigned int v22;
  uint64_t v23;
  NSObject *v24;
  int v26;
  uint64_t v27;
  __int16 v28;
  const char *v29;
  __int16 v30;
  int v31;
  uint64_t v32;

  v12 = a7;
  v32 = *MEMORY[0x1E0C80C00];
  v17 = -[VCMediaNegotiationBlobVideoSettings init](self, "init");
  v18 = v17;
  if (v17)
  {
    v17->_rtpSSRC = a3;
    v17->_allowRTCPFB = a4;
    if (a8 >= 2)
    {
      *(_WORD *)&v17->_has |= 0x10u;
      v17->_tilesPerFrame = a8;
    }
    if (a9)
    {
      *(_WORD *)&v17->_has |= 0x80u;
      v17->_ltrpEnabled = a9;
    }
    if (-[VCMediaNegotiationBlobVideoSettings setVideoRuleCollections:featureStrings:isScreen:isCellular16x9Capable:](v17, "setVideoRuleCollections:featureStrings:isScreen:isCellular16x9Capable:", a5, a6, 0, v12))
    {
      if (a10)
      {
        v19 = +[VCMediaNegotiationBlobVideoSettings storePixelFormatsInBitMap:](VCMediaNegotiationBlobVideoSettings, "storePixelFormatsInBitMap:");
        v18->_pixelFormats = v19;
        if (v19)
        {
          *(_WORD *)&v18->_has |= 8u;
        }
        else if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
        {
          v20 = VRTraceErrorLogLevelToCSTR();
          v21 = *MEMORY[0x1E0CF2758];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
          {
            v26 = 136315650;
            v27 = v20;
            v28 = 2080;
            v29 = "-[VCMediaNegotiationBlobVideoSettings(VideoRules) initWithSSRC:allowRTCPFB:videoRuleCollections:featur"
                  "eStrings:isCellular16x9Capable:tilesPerFrame:ltrpEnabled:pixelFormats:hdrModesSupported:]";
            v30 = 1024;
            v31 = 202;
            _os_log_impl(&dword_1D8A54000, v21, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d No pixel format set to negotiate", (uint8_t *)&v26, 0x1Cu);
          }
        }
      }
      if (a11)
      {
        v22 = +[VCMediaNegotiationBlobVideoSettings hdrModesBitmapWithSupportedModes:](VCMediaNegotiationBlobVideoSettings, "hdrModesBitmapWithSupportedModes:", a11);
        v18->_hdrModesSupported = v22;
        if (v22)
        {
          *(_WORD *)&v18->_has |= 4u;
        }
        else if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
        {
          v23 = VRTraceErrorLogLevelToCSTR();
          v24 = *MEMORY[0x1E0CF2758];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
          {
            v26 = 136315650;
            v27 = v23;
            v28 = 2080;
            v29 = "-[VCMediaNegotiationBlobVideoSettings(VideoRules) initWithSSRC:allowRTCPFB:videoRuleCollections:featur"
                  "eStrings:isCellular16x9Capable:tilesPerFrame:ltrpEnabled:pixelFormats:hdrModesSupported:]";
            v30 = 1024;
            v31 = 210;
            _os_log_impl(&dword_1D8A54000, v24, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d No HDR modes to negotiate", (uint8_t *)&v26, 0x1Cu);
          }
        }
      }
    }
    else
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCMediaNegotiationBlobVideoSettings(VideoRules) initWithSSRC:allowRTCPFB:videoRuleCollections:featureStrings:isCellular16x9Capable:tilesPerFrame:ltrpEnabled:pixelFormats:hdrModesSupported:].cold.1();
      }

      return 0;
    }
  }
  return v18;
}

- (VCMediaNegotiationBlobVideoSettings)initWithScreenSSRC:(unsigned int)a3 allowRTCPFB:(BOOL)a4 videoRuleCollections:(id)a5 featureStrings:(id)a6 isCellular16x9Capable:(BOOL)a7 customVideoWidth:(unsigned int)a8 customVideoHeight:(unsigned int)a9 tilesPerFrame:(unsigned int)a10 ltrpEnabled:(BOOL)a11 pixelFormats:(id)a12 hdrModesSupported:(id)a13 fecEnabled:(BOOL)a14 rtxEnabled:(BOOL)a15 blackFrameOnClearScreenEnabled:(BOOL)a16
{
  _BOOL8 v17;
  VCMediaNegotiationBlobVideoSettings *v22;
  VCMediaNegotiationBlobVideoSettings *v23;
  unsigned int v24;
  uint64_t v25;
  NSObject *v26;
  unsigned int v27;
  uint64_t v28;
  NSObject *v29;
  int v31;
  uint64_t v32;
  __int16 v33;
  const char *v34;
  __int16 v35;
  int v36;
  uint64_t v37;

  v17 = a7;
  v37 = *MEMORY[0x1E0C80C00];
  v22 = -[VCMediaNegotiationBlobVideoSettings init](self, "init");
  v23 = v22;
  if (!v22)
    return v23;
  v22->_rtpSSRC = a3;
  v22->_allowRTCPFB = a4;
  -[VCMediaNegotiationBlobVideoSettings setBlackFrameOnClearScreenEnabled:](v22, "setBlackFrameOnClearScreenEnabled:", a16);
  if (a8)
  {
    *(_WORD *)&v23->_has |= 2u;
    v23->_customVideoWidth = a8;
  }
  if (a9)
  {
    *(_WORD *)&v23->_has |= 1u;
    v23->_customVideoHeight = a9;
  }
  if (a10 >= 2)
  {
    *(_WORD *)&v23->_has |= 0x10u;
    v23->_tilesPerFrame = a10;
  }
  if (a11)
  {
    *(_WORD *)&v23->_has |= 0x80u;
    v23->_ltrpEnabled = a11;
    if (!a14)
    {
LABEL_10:
      if (!a15)
        goto LABEL_12;
      goto LABEL_11;
    }
  }
  else if (!a14)
  {
    goto LABEL_10;
  }
  *(_WORD *)&v23->_has |= 0x40u;
  v23->_fecEnabled = a14;
  if (a15)
  {
LABEL_11:
    *(_WORD *)&v23->_has |= 0x100u;
    v23->_rtxEnabled = a15;
  }
LABEL_12:
  if (-[VCMediaNegotiationBlobVideoSettings setVideoRuleCollections:featureStrings:isScreen:isCellular16x9Capable:](v23, "setVideoRuleCollections:featureStrings:isScreen:isCellular16x9Capable:", a5, a6, 1, v17))
  {
    if (a12)
    {
      v24 = +[VCMediaNegotiationBlobVideoSettings storePixelFormatsInBitMap:](VCMediaNegotiationBlobVideoSettings, "storePixelFormatsInBitMap:");
      v23->_pixelFormats = v24;
      if (v24)
      {
        *(_WORD *)&v23->_has |= 8u;
      }
      else if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
      {
        v25 = VRTraceErrorLogLevelToCSTR();
        v26 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          v31 = 136315650;
          v32 = v25;
          v33 = 2080;
          v34 = "-[VCMediaNegotiationBlobVideoSettings(VideoRules) initWithScreenSSRC:allowRTCPFB:videoRuleCollections:fe"
                "atureStrings:isCellular16x9Capable:customVideoWidth:customVideoHeight:tilesPerFrame:ltrpEnabled:pixelFor"
                "mats:hdrModesSupported:fecEnabled:rtxEnabled:blackFrameOnClearScreenEnabled:]";
          v35 = 1024;
          v36 = 265;
          _os_log_impl(&dword_1D8A54000, v26, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d No pixel format set to negotiate", (uint8_t *)&v31, 0x1Cu);
        }
      }
    }
    if (a13)
    {
      v27 = +[VCMediaNegotiationBlobVideoSettings hdrModesBitmapWithSupportedModes:](VCMediaNegotiationBlobVideoSettings, "hdrModesBitmapWithSupportedModes:", a13);
      v23->_hdrModesSupported = v27;
      if (v27)
      {
        *(_WORD *)&v23->_has |= 4u;
      }
      else if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
      {
        v28 = VRTraceErrorLogLevelToCSTR();
        v29 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          v31 = 136315650;
          v32 = v28;
          v33 = 2080;
          v34 = "-[VCMediaNegotiationBlobVideoSettings(VideoRules) initWithScreenSSRC:allowRTCPFB:videoRuleCollections:fe"
                "atureStrings:isCellular16x9Capable:customVideoWidth:customVideoHeight:tilesPerFrame:ltrpEnabled:pixelFor"
                "mats:hdrModesSupported:fecEnabled:rtxEnabled:blackFrameOnClearScreenEnabled:]";
          v35 = 1024;
          v36 = 273;
          _os_log_impl(&dword_1D8A54000, v29, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d No HDR modes to negotiate", (uint8_t *)&v31, 0x1Cu);
        }
      }
    }
  }
  else
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCMediaNegotiationBlobVideoSettings(VideoRules) initWithScreenSSRC:allowRTCPFB:videoRuleCollections:featureStrings:isCellular16x9Capable:customVideoWidth:customVideoHeight:tilesPerFrame:ltrpEnabled:pixelFormats:hdrModesSupported:fecEnabled:rtxEnabled:blackFrameOnClearScreenEnabled:].cold.1();
    }

    return 0;
  }
  return v23;
}

+ (unsigned)storePixelFormatsInBitMap:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  unsigned int v6;
  uint64_t v7;
  uint64_t i;
  int v9;
  _BYTE v11[128];
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v4 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v12, v11, 16);
  if (!v4)
    return 0;
  v5 = v4;
  v6 = 0;
  v7 = *(_QWORD *)v13;
  do
  {
    for (i = 0; i != v5; ++i)
    {
      if (*(_QWORD *)v13 != v7)
        objc_enumerationMutation(a3);
      v9 = objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * i), "intValue");
      if (v9 > 875836533)
      {
        switch(v9)
        {
          case 875836534:
            v6 |= 0x10u;
            break;
          case 2016686640:
            v6 |= 4u;
            break;
          case 2019963956:
            v6 |= 0x20u;
            break;
        }
      }
      else
      {
        switch(v9)
        {
          case 875704422:
            v6 |= 1u;
            break;
          case 875704438:
            v6 |= 2u;
            break;
          case 875836518:
            v6 |= 8u;
            break;
        }
      }
    }
    v5 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v12, v11, 16);
  }
  while (v5);
  return v6;
}

+ (unsigned)hdrModesBitmapWithSupportedModes:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  unsigned int v6;
  uint64_t v7;
  uint64_t i;
  _BYTE v10[128];
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v11, v10, 16);
  if (!v4)
    return 0;
  v5 = v4;
  v6 = 0;
  v7 = *(_QWORD *)v12;
  do
  {
    for (i = 0; i != v5; ++i)
    {
      if (*(_QWORD *)v12 != v7)
        objc_enumerationMutation(a3);
      switch(objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * i), "intValue"))
      {
        case 0u:
          v6 |= 1u;
          break;
        case 1u:
          v6 |= 2u;
          break;
        case 2u:
          v6 |= 4u;
          break;
        case 3u:
          v6 |= 8u;
          break;
        default:
          continue;
      }
    }
    v5 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v11, v10, 16);
  }
  while (v5);
  return v6;
}

- (id)getPayloadSettingsForPayload:(int)a3
{
  uint64_t v3;
  NSMutableArray *videoPayloadCollections;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  id v11;
  _BYTE v13[128];
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint64_t v18;

  v3 = *(_QWORD *)&a3;
  v18 = *MEMORY[0x1E0C80C00];
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  videoPayloadCollections = self->_videoPayloadCollections;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](videoPayloadCollections, "countByEnumeratingWithState:objects:count:", &v14, v13, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(videoPayloadCollections);
        v10 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        if (objc_msgSend(v10, "payload") == (_DWORD)v3)
        {
          v11 = v10;
          return v11;
        }
      }
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](videoPayloadCollections, "countByEnumeratingWithState:objects:count:", &v14, v13, 16);
      if (v7)
        continue;
      break;
    }
  }
  v11 = (id)objc_opt_new();
  objc_msgSend(v11, "setPayload:", v3);
  -[VCMediaNegotiationBlobVideoSettings addVideoPayloadCollections:](self, "addVideoPayloadCollections:", v11);
  return v11;
}

- (BOOL)setVideoRuleCollections:(id)a3 featureStrings:(id)a4 isScreen:(BOOL)a5 isCellular16x9Capable:(BOOL)a6
{
  _BOOL4 v6;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id v16;
  char v17;
  char v18;
  int v19;
  uint64_t v20;
  int v21;
  int v22;
  unsigned int v23;
  uint64_t v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  int v33;
  float v34;
  float v35;
  float v36;
  float v37;
  float v38;
  float v39;
  float v40;
  float v41;
  float v42;
  float v43;
  float v44;
  float v45;
  uint64_t v46;
  float v47;
  float v48;
  float v49;
  float v50;
  float v51;
  float v52;
  float v53;
  float v54;
  float v55;
  float v56;
  float v57;
  float v58;
  float v59;
  float v60;
  float v61;
  float v62;
  float v63;
  float v64;
  float v65;
  float v66;
  float v67;
  float v68;
  float v69;
  float v70;
  float v71;
  float v72;
  float v73;
  float v74;
  float v75;
  float v76;
  float v77;
  float v78;
  float v79;
  float v80;
  float v81;
  float v82;
  float v83;
  float v84;
  float v85;
  float v86;
  float v87;
  float v88;
  float v89;
  float v90;
  float v91;
  float v92;
  float v93;
  float v94;
  float v95;
  float v96;
  float v97;
  float v98;
  float v99;
  float v100;
  float v101;
  float v102;
  float v103;
  float v104;
  float v105;
  float v106;
  float v107;
  float v108;
  float v109;
  float v110;
  float v111;
  float v112;
  float v113;
  uint64_t v114;
  float v115;
  float v116;
  float v117;
  float v118;
  float v119;
  float v120;
  float v121;
  float v122;
  float v123;
  float v124;
  float v125;
  float v126;
  float v127;
  int v128;
  float v129;
  float v130;
  float v131;
  float v132;
  float v133;
  float v134;
  float v135;
  float v136;
  float v137;
  float v138;
  float v139;
  float v140;
  float v141;
  float v142;
  float v143;
  uint64_t v144;
  uint64_t v145;
  uint64_t v146;
  NSObject *v147;
  uint64_t v148;
  NSObject *v149;
  void *v151;
  VCMediaNegotiationBlobVideoSettings *v152;
  id v153;
  uint64_t v154;
  uint64_t v155;
  uint64_t v156;
  int v157;
  void *v158;
  void *v159;
  unsigned int v160;
  _BOOL4 v161;
  unsigned int v162;
  unsigned int v163;
  int v164;
  _BYTE v165[128];
  __int128 v166;
  __int128 v167;
  __int128 v168;
  __int128 v169;
  _BYTE v170[128];
  __int128 v171;
  __int128 v172;
  __int128 v173;
  __int128 v174;
  uint64_t v175;

  v161 = a6;
  v6 = a5;
  v175 = *MEMORY[0x1E0C80C00];
  v171 = 0u;
  v172 = 0u;
  v173 = 0u;
  v174 = 0u;
  v10 = (void *)objc_msgSend(a3, "supportedPayloads");
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v171, v170, 16);
  if (!v11)
  {
    LOBYTE(v145) = 1;
    return v145;
  }
  v12 = v11;
  v13 = *(_QWORD *)v172;
  v155 = *(_QWORD *)v172;
LABEL_3:
  v154 = v12;
  v14 = 0;
LABEL_4:
  if (*(_QWORD *)v172 != v13)
    objc_enumerationMutation(v10);
  v156 = v14;
  v15 = *(void **)(*((_QWORD *)&v171 + 1) + 8 * v14);
  v16 = -[VCMediaNegotiationBlobVideoSettings getPayloadSettingsForPayload:](self, "getPayloadSettingsForPayload:", objc_msgSend(v15, "unsignedIntValue"));
  objc_msgSend(v16, "setFeatureString:", objc_msgSend(a4, "objectForKey:", v15));
  v17 = VCVideoParamaterSets_DefaultSupportedSets(objc_msgSend(v15, "unsignedIntValue"));
  v18 = v17;
  if ((v17 & 1) != 0)
  {
    objc_msgSend(v16, "setParameterSet:", objc_msgSend(v16, "parameterSet") | 1);
    if ((v18 & 2) == 0)
    {
LABEL_8:
      if ((v18 & 4) == 0)
        goto LABEL_9;
      goto LABEL_275;
    }
  }
  else if ((v17 & 2) == 0)
  {
    goto LABEL_8;
  }
  objc_msgSend(v16, "setParameterSet:", objc_msgSend(v16, "parameterSet") | 2);
  if ((v18 & 4) == 0)
  {
LABEL_9:
    if ((v18 & 8) == 0)
      goto LABEL_11;
    goto LABEL_10;
  }
LABEL_275:
  objc_msgSend(v16, "setParameterSet:", objc_msgSend(v16, "parameterSet") | 4);
  if ((v18 & 8) != 0)
LABEL_10:
    objc_msgSend(v16, "setParameterSet:", objc_msgSend(v16, "parameterSet") | 8);
LABEL_11:
  if (objc_msgSend(v16, "parameterSet"))
  {
    v151 = v10;
    v152 = self;
    v153 = a4;
    v19 = 1;
    v158 = v16;
    v159 = v15;
    while (1)
    {
      v157 = v19;
      v20 = v19;
      if (v19 == 1)
        v21 = 1;
      else
        v21 = 2;
      v162 = v21;
      v22 = 1;
      v160 = v19;
      do
      {
        v23 = v22;
        v24 = objc_msgSend(a3, "getVideoRulesForTransport:payload:encodingType:", v20, objc_msgSend(v15, "unsignedIntValue", v151), v22);
        if (!v24)
          goto LABEL_269;
        v25 = (void *)v24;
        v164 = v22;
        v26 = (void *)objc_opt_new();
        objc_msgSend(v26, "setTransport:", v162);
        v163 = v22;
        if (v22 == 1)
          v27 = 1;
        else
          v27 = 2;
        objc_msgSend(v26, "setOperation:", v27);
        v168 = 0u;
        v169 = 0u;
        v166 = 0u;
        v167 = 0u;
        v28 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v166, v165, 16);
        if (!v28)
          goto LABEL_268;
        v29 = v28;
        v30 = *(_QWORD *)v167;
        while (2)
        {
          v31 = 0;
          do
          {
            if (*(_QWORD *)v167 != v30)
              objc_enumerationMutation(v25);
            v32 = *(void **)(*((_QWORD *)&v166 + 1) + 8 * v31);
            v33 = objc_msgSend(v32, "iWidth");
            if (v6)
            {
              if (v33 == 1024
                && objc_msgSend(v32, "iHeight") == 768
                && (objc_msgSend(v32, "fRate"), v34 == 30.0))
              {
LABEL_64:
                objc_msgSend(v32, "fPref");
                objc_msgSend(v26, "setPreferredFormat:", objc_msgSend(v26, "preferredFormat") | (v48 == 1.0));
                v46 = objc_msgSend(v26, "formats") | 1;
              }
              else if (objc_msgSend(v32, "iWidth") == 1024
                     && objc_msgSend(v32, "iHeight") == 768
                     && (objc_msgSend(v32, "fRate"), v35 == 60.0))
              {
LABEL_68:
                objc_msgSend(v32, "fPref");
                objc_msgSend(v26, "setPreferredFormat:", objc_msgSend(v26, "preferredFormat") | (2 * (v50 == 1.0)));
                v46 = objc_msgSend(v26, "formats") | 2;
              }
              else if (objc_msgSend(v32, "iWidth") == 1136
                     && objc_msgSend(v32, "iHeight") == 640
                     && (objc_msgSend(v32, "fRate"), v36 == 30.0))
              {
LABEL_72:
                objc_msgSend(v32, "fPref");
                objc_msgSend(v26, "setPreferredFormat:", objc_msgSend(v26, "preferredFormat") | (4 * (v52 == 1.0)));
                v46 = objc_msgSend(v26, "formats") | 4;
              }
              else if (objc_msgSend(v32, "iWidth") == 1136
                     && objc_msgSend(v32, "iHeight") == 640
                     && (objc_msgSend(v32, "fRate"), v37 == 60.0))
              {
LABEL_76:
                objc_msgSend(v32, "fPref");
                objc_msgSend(v26, "setPreferredFormat:", objc_msgSend(v26, "preferredFormat") | (8 * (v54 == 1.0)));
                v46 = objc_msgSend(v26, "formats") | 8;
              }
              else if (objc_msgSend(v32, "iWidth") == 1334
                     && objc_msgSend(v32, "iHeight") == 750
                     && (objc_msgSend(v32, "fRate"), v38 == 30.0))
              {
LABEL_80:
                objc_msgSend(v32, "fPref");
                objc_msgSend(v26, "setPreferredFormat:", objc_msgSend(v26, "preferredFormat") | (16 * (v56 == 1.0)));
                v46 = objc_msgSend(v26, "formats") | 0x10;
              }
              else if (objc_msgSend(v32, "iWidth") == 1334
                     && objc_msgSend(v32, "iHeight") == 750
                     && (objc_msgSend(v32, "fRate"), v39 == 60.0))
              {
LABEL_84:
                objc_msgSend(v32, "fPref");
                objc_msgSend(v26, "setPreferredFormat:", objc_msgSend(v26, "preferredFormat") | (32 * (v58 == 1.0)));
                v46 = objc_msgSend(v26, "formats") | 0x20;
              }
              else if (objc_msgSend(v32, "iWidth") == 1664
                     && objc_msgSend(v32, "iHeight") == 1248
                     && (objc_msgSend(v32, "fRate"), v40 == 30.0))
              {
LABEL_88:
                objc_msgSend(v32, "fPref");
                objc_msgSend(v26, "setPreferredFormat:", objc_msgSend(v26, "preferredFormat") | ((v60 == 1.0) << 6));
                v46 = objc_msgSend(v26, "formats") | 0x40;
              }
              else if (objc_msgSend(v32, "iWidth") == 1664
                     && objc_msgSend(v32, "iHeight") == 1248
                     && (objc_msgSend(v32, "fRate"), v41 == 60.0))
              {
LABEL_92:
                objc_msgSend(v32, "fPref");
                objc_msgSend(v26, "setPreferredFormat:", objc_msgSend(v26, "preferredFormat") | ((v62 == 1.0) << 7));
                v46 = objc_msgSend(v26, "formats") | 0x80;
              }
              else if (objc_msgSend(v32, "iWidth") == 1920
                     && objc_msgSend(v32, "iHeight") == 1080
                     && (objc_msgSend(v32, "fRate"), v42 == 30.0))
              {
LABEL_96:
                objc_msgSend(v32, "fPref");
                objc_msgSend(v26, "setPreferredFormat:", objc_msgSend(v26, "preferredFormat") | ((v64 == 1.0) << 8));
                v46 = objc_msgSend(v26, "formats") | 0x100;
              }
              else if (objc_msgSend(v32, "iWidth") == 1920
                     && objc_msgSend(v32, "iHeight") == 1080
                     && (objc_msgSend(v32, "fRate"), v43 == 60.0))
              {
LABEL_100:
                objc_msgSend(v32, "fPref");
                objc_msgSend(v26, "setPreferredFormat:", objc_msgSend(v26, "preferredFormat") | ((v66 == 1.0) << 9));
                v46 = objc_msgSend(v26, "formats") | 0x200;
              }
              else if (objc_msgSend(v32, "iWidth") == 2208
                     && objc_msgSend(v32, "iHeight") == 1242
                     && (objc_msgSend(v32, "fRate"), v44 == 30.0))
              {
                objc_msgSend(v32, "fPref");
                objc_msgSend(v26, "setPreferredFormat:", objc_msgSend(v26, "preferredFormat") | ((v45 == 1.0) << 10));
                v46 = objc_msgSend(v26, "formats") | 0x400;
              }
              else
              {
                if (objc_msgSend(v32, "iWidth") == 2208
                  && objc_msgSend(v32, "iHeight") == 1242)
                {
                  objc_msgSend(v32, "fRate");
                  if (v74 == 60.0)
                  {
                    objc_msgSend(v32, "fPref");
                    objc_msgSend(v26, "setPreferredFormat:", objc_msgSend(v26, "preferredFormat") | ((v75 == 1.0) << 11));
                    v46 = objc_msgSend(v26, "formats") | 0x800;
                    goto LABEL_196;
                  }
                }
                if (objc_msgSend(v32, "iWidth") == 2048
                  && objc_msgSend(v32, "iHeight") == 1536)
                {
                  objc_msgSend(v32, "fRate");
                  if (v76 == 30.0)
                  {
LABEL_127:
                    objc_msgSend(v32, "fPref");
                    objc_msgSend(v26, "setPreferredFormat:", objc_msgSend(v26, "preferredFormat") | ((v77 == 1.0) << 12));
                    v46 = objc_msgSend(v26, "formats") | 0x1000;
                    goto LABEL_196;
                  }
                }
                if (objc_msgSend(v32, "iWidth") == 2048
                  && objc_msgSend(v32, "iHeight") == 1536)
                {
                  objc_msgSend(v32, "fRate");
                  if (v78 == 60.0)
                  {
                    objc_msgSend(v32, "fPref");
                    objc_msgSend(v26, "setPreferredFormat:", objc_msgSend(v26, "preferredFormat") | ((v79 == 1.0) << 13));
                    v46 = objc_msgSend(v26, "formats") | 0x2000;
                    goto LABEL_196;
                  }
                }
                if (objc_msgSend(v32, "iWidth") == 1280
                  && objc_msgSend(v32, "iHeight") == 720)
                {
                  objc_msgSend(v32, "fRate");
                  if (v80 == 30.0)
                    goto LABEL_135;
                }
                if (objc_msgSend(v32, "iWidth") == 1280
                  && objc_msgSend(v32, "iHeight") == 720)
                {
                  objc_msgSend(v32, "fRate");
                  if (v82 == 60.0)
                  {
LABEL_139:
                    objc_msgSend(v32, "fPref");
                    objc_msgSend(v26, "setPreferredFormat:", objc_msgSend(v26, "preferredFormat") | ((v83 == 1.0) << 15));
                    v46 = objc_msgSend(v26, "formats") | 0x8000;
                    goto LABEL_196;
                  }
                }
                if (objc_msgSend(v32, "iWidth") == 1920
                  && objc_msgSend(v32, "iHeight") == 896)
                {
                  objc_msgSend(v32, "fRate");
                  if (v86 == 30.0)
                  {
                    objc_msgSend(v32, "fPref");
                    objc_msgSend(v26, "setPreferredFormat:", objc_msgSend(v26, "preferredFormat") | ((v87 == 1.0) << 16));
                    v46 = objc_msgSend(v26, "formats") | 0x10000;
                    goto LABEL_196;
                  }
                }
                if (objc_msgSend(v32, "iWidth") == 1920
                  && objc_msgSend(v32, "iHeight") == 896)
                {
                  objc_msgSend(v32, "fRate");
                  if (v90 == 60.0)
                    goto LABEL_155;
                }
                if (objc_msgSend(v32, "iWidth") == 2732
                  && objc_msgSend(v32, "iHeight") == 2048)
                {
                  objc_msgSend(v32, "fRate");
                  if (v94 == 60.0)
                    goto LABEL_163;
                }
                if (objc_msgSend(v32, "iWidth") == 2388
                  && objc_msgSend(v32, "iHeight") == 1668
                  && (objc_msgSend(v32, "fRate"), v98 == 60.0))
                {
LABEL_171:
                  objc_msgSend(v32, "fPref");
                  objc_msgSend(v26, "setPreferredFormat:", objc_msgSend(v26, "preferredFormat") | ((v99 == 1.0) << 19));
                  v46 = objc_msgSend(v26, "formats") | 0x80000;
                }
                else if (objc_msgSend(v32, "iWidth") == 2224
                       && objc_msgSend(v32, "iHeight") == 1668
                       && (objc_msgSend(v32, "fRate"), v102 == 60.0))
                {
LABEL_179:
                  objc_msgSend(v32, "fPref");
                  objc_msgSend(v26, "setPreferredFormat:", objc_msgSend(v26, "preferredFormat") | ((v103 == 1.0) << 20));
                  v46 = objc_msgSend(v26, "formats") | 0x100000;
                }
                else if (objc_msgSend(v32, "iWidth") == 3072
                       && objc_msgSend(v32, "iHeight") == 1728
                       && (objc_msgSend(v32, "fRate"), v106 == 60.0))
                {
LABEL_187:
                  objc_msgSend(v32, "fPref");
                  objc_msgSend(v26, "setPreferredFormat:", objc_msgSend(v26, "preferredFormat") | ((v107 == 1.0) << 21));
                  v46 = objc_msgSend(v26, "formats") | 0x200000;
                }
                else
                {
                  if (objc_msgSend(v32, "iWidth") != 3840)
                    goto LABEL_279;
                  if (objc_msgSend(v32, "iHeight") != 2160)
                    goto LABEL_279;
                  objc_msgSend(v32, "fRate");
                  if (v110 != 60.0)
                    goto LABEL_279;
LABEL_195:
                  objc_msgSend(v32, "fPref");
                  objc_msgSend(v26, "setPreferredFormat:", objc_msgSend(v26, "preferredFormat") | ((v111 == 1.0) << 22));
                  v46 = objc_msgSend(v26, "formats") | 0x400000;
                }
              }
LABEL_196:
              objc_msgSend(v26, "setFormats:", v46);
              goto LABEL_197;
            }
            if (v33 == 320 && objc_msgSend(v32, "iHeight") == 240)
            {
              objc_msgSend(v32, "fRate");
              if (v47 == 15.0)
                goto LABEL_64;
            }
            if (objc_msgSend(v32, "iWidth") == 320 && objc_msgSend(v32, "iHeight") == 240)
            {
              objc_msgSend(v32, "fRate");
              if (v49 == 30.0)
                goto LABEL_68;
            }
            if (objc_msgSend(v32, "iWidth") == 480 && objc_msgSend(v32, "iHeight") == 368)
            {
              objc_msgSend(v32, "fRate");
              if (v51 == 15.0)
                goto LABEL_72;
            }
            if (objc_msgSend(v32, "iWidth") == 480 && objc_msgSend(v32, "iHeight") == 368)
            {
              objc_msgSend(v32, "fRate");
              if (v53 == 30.0)
                goto LABEL_76;
            }
            if (objc_msgSend(v32, "iWidth") == 640 && objc_msgSend(v32, "iHeight") == 480)
            {
              objc_msgSend(v32, "fRate");
              if (v55 == 15.0)
                goto LABEL_80;
            }
            if (objc_msgSend(v32, "iWidth") == 640 && objc_msgSend(v32, "iHeight") == 480)
            {
              objc_msgSend(v32, "fRate");
              if (v57 == 30.0)
                goto LABEL_84;
            }
            if (objc_msgSend(v32, "iWidth") == 848 && objc_msgSend(v32, "iHeight") == 480)
            {
              objc_msgSend(v32, "fRate");
              if (v59 == 15.0)
                goto LABEL_88;
            }
            if (objc_msgSend(v32, "iWidth") == 848 && objc_msgSend(v32, "iHeight") == 480)
            {
              objc_msgSend(v32, "fRate");
              if (v61 == 30.0)
                goto LABEL_92;
            }
            if (objc_msgSend(v32, "iWidth") == 1024 && objc_msgSend(v32, "iHeight") == 768)
            {
              objc_msgSend(v32, "fRate");
              if (v63 == 15.0)
                goto LABEL_96;
            }
            if (objc_msgSend(v32, "iWidth") == 1024 && objc_msgSend(v32, "iHeight") == 768)
            {
              objc_msgSend(v32, "fRate");
              if (v65 == 30.0)
                goto LABEL_100;
            }
            if (objc_msgSend(v32, "iWidth") == 1024 && objc_msgSend(v32, "iHeight") == 768)
            {
              objc_msgSend(v32, "fRate");
              if (v67 == 60.0)
                goto LABEL_127;
            }
            if (objc_msgSend(v32, "iWidth") == 192 && objc_msgSend(v32, "iHeight") == 112)
            {
              objc_msgSend(v32, "fRate");
              if (v68 == 15.0)
                goto LABEL_171;
            }
            if (objc_msgSend(v32, "iWidth") == 192 && objc_msgSend(v32, "iHeight") == 192)
            {
              objc_msgSend(v32, "fRate");
              if (v69 == 15.0)
                goto LABEL_179;
            }
            if (objc_msgSend(v32, "iWidth") == 240 && objc_msgSend(v32, "iHeight") == 240)
            {
              objc_msgSend(v32, "fRate");
              if (v70 == 15.0)
                goto LABEL_187;
            }
            if (objc_msgSend(v32, "iWidth") == 320 && objc_msgSend(v32, "iHeight") == 320)
            {
              objc_msgSend(v32, "fRate");
              if (v71 == 30.0)
                goto LABEL_195;
            }
            if (objc_msgSend(v32, "iWidth") == 480 && objc_msgSend(v32, "iHeight") == 480)
            {
              objc_msgSend(v32, "fRate");
              if (v72 == 30.0)
              {
                objc_msgSend(v32, "fPref");
                objc_msgSend(v26, "setPreferredFormat:", objc_msgSend(v26, "preferredFormat") | ((v73 == 1.0) << 23));
                v46 = objc_msgSend(v26, "formats") | 0x800000;
                goto LABEL_196;
              }
            }
            if (objc_msgSend(v32, "iWidth") == 640 && objc_msgSend(v32, "iHeight") == 640)
            {
              objc_msgSend(v32, "fRate");
              if (v84 == 30.0)
              {
                objc_msgSend(v32, "fPref");
                objc_msgSend(v26, "setPreferredFormat:", objc_msgSend(v26, "preferredFormat") | ((v85 == 1.0) << 24));
                v46 = objc_msgSend(v26, "formats") | 0x1000000;
                goto LABEL_196;
              }
            }
            if (objc_msgSend(v32, "iWidth") == 720 && objc_msgSend(v32, "iHeight") == 720)
            {
              objc_msgSend(v32, "fRate");
              if (v88 == 30.0)
              {
                objc_msgSend(v32, "fPref");
                objc_msgSend(v26, "setPreferredFormat:", objc_msgSend(v26, "preferredFormat") | ((v89 == 1.0) << 25));
                v46 = objc_msgSend(v26, "formats") | 0x2000000;
                goto LABEL_196;
              }
            }
            if (objc_msgSend(v32, "iWidth") == 1024 && objc_msgSend(v32, "iHeight") == 576)
            {
              objc_msgSend(v32, "fRate");
              if (v92 == 30.0)
              {
                objc_msgSend(v32, "fPref");
                objc_msgSend(v26, "setPreferredFormat:", objc_msgSend(v26, "preferredFormat") | ((v93 == 1.0) << 26));
                v46 = objc_msgSend(v26, "formats") | 0x4000000;
                goto LABEL_196;
              }
            }
            if (objc_msgSend(v32, "iWidth") == 1920 && objc_msgSend(v32, "iHeight") == 1080)
            {
              objc_msgSend(v32, "fRate");
              if (v96 == 30.0)
              {
                objc_msgSend(v32, "fPref");
                objc_msgSend(v26, "setPreferredFormat:", objc_msgSend(v26, "preferredFormat") | ((v97 == 1.0) << 27));
                v46 = objc_msgSend(v26, "formats") | 0x8000000;
                goto LABEL_196;
              }
            }
            if (objc_msgSend(v32, "iWidth") == 1440 && objc_msgSend(v32, "iHeight") == 1080)
            {
              objc_msgSend(v32, "fRate");
              if (v100 == 30.0)
              {
                objc_msgSend(v32, "fPref");
                objc_msgSend(v26, "setPreferredFormat:", objc_msgSend(v26, "preferredFormat") | ((v101 == 1.0) << 28));
                v46 = objc_msgSend(v26, "formats") | 0x10000000;
                goto LABEL_196;
              }
            }
            if (objc_msgSend(v32, "iWidth") == 896 && objc_msgSend(v32, "iHeight") == 672)
            {
              objc_msgSend(v32, "fRate");
              if (v104 == 30.0)
              {
                objc_msgSend(v32, "fPref");
                objc_msgSend(v26, "setPreferredFormat:", objc_msgSend(v26, "preferredFormat") | ((v105 == 1.0) << 29));
                v46 = objc_msgSend(v26, "formats") | 0x20000000;
                goto LABEL_196;
              }
            }
            if (objc_msgSend(v32, "iWidth") == 1920 && objc_msgSend(v32, "iHeight") == 1080)
            {
              objc_msgSend(v32, "fRate");
              if (v108 == 60.0)
              {
                objc_msgSend(v32, "fPref");
                objc_msgSend(v26, "setPreferredFormat:", objc_msgSend(v26, "preferredFormat") | ((v109 == 1.0) << 30));
                v46 = objc_msgSend(v26, "formats") | 0x40000000;
                goto LABEL_196;
              }
            }
            if (objc_msgSend(v32, "iWidth") == 896 && objc_msgSend(v32, "iHeight") == 672)
            {
              objc_msgSend(v32, "fRate");
              if (v112 == 60.0)
              {
                objc_msgSend(v32, "fPref");
                objc_msgSend(v26, "setPreferredFormatExt1:", objc_msgSend(v26, "preferredFormatExt1") | (v113 == 1.0));
                v114 = objc_msgSend(v26, "formatsExt1") | 1;
LABEL_223:
                objc_msgSend(v26, "setFormatsExt1:", v114);
                goto LABEL_197;
              }
            }
            if (objc_msgSend(v32, "iWidth") == 1664 && objc_msgSend(v32, "iHeight") == 1248)
            {
              objc_msgSend(v32, "fRate");
              if (v115 == 30.0)
              {
                objc_msgSend(v32, "fPref");
                objc_msgSend(v26, "setPreferredFormatExt1:", objc_msgSend(v26, "preferredFormatExt1") | (2 * (v116 == 1.0)));
                v114 = objc_msgSend(v26, "formatsExt1") | 2;
                goto LABEL_223;
              }
            }
            if (objc_msgSend(v32, "iWidth") == 1664 && objc_msgSend(v32, "iHeight") == 1248)
            {
              objc_msgSend(v32, "fRate");
              if (v117 == 60.0)
              {
                objc_msgSend(v32, "fPref");
                objc_msgSend(v26, "setPreferredFormatExt1:", objc_msgSend(v26, "preferredFormatExt1") | (4 * (v118 == 1.0)));
                v114 = objc_msgSend(v26, "formatsExt1") | 4;
                goto LABEL_223;
              }
            }
            if (objc_msgSend(v32, "iWidth") == 1024 && objc_msgSend(v32, "iHeight") == 576)
            {
              objc_msgSend(v32, "fRate");
              if (v119 == 15.0)
              {
                objc_msgSend(v32, "fPref");
                objc_msgSend(v26, "setPreferredFormatExt1:", objc_msgSend(v26, "preferredFormatExt1") | (8 * (v120 == 1.0)));
                v114 = objc_msgSend(v26, "formatsExt1") | 8;
                goto LABEL_223;
              }
            }
            if (objc_msgSend(v32, "iWidth") == 896 && objc_msgSend(v32, "iHeight") == 672)
            {
              objc_msgSend(v32, "fRate");
              if (v121 == 15.0)
              {
                objc_msgSend(v32, "fPref");
                objc_msgSend(v26, "setPreferredFormatExt1:", objc_msgSend(v26, "preferredFormatExt1") | (16 * (v122 == 1.0)));
                v114 = objc_msgSend(v26, "formatsExt1") | 0x10;
                goto LABEL_223;
              }
            }
            if (objc_msgSend(v32, "iWidth") == 1920 && objc_msgSend(v32, "iHeight") == 1440)
            {
              objc_msgSend(v32, "fRate");
              if (v123 == 60.0)
              {
                objc_msgSend(v32, "fPref");
                objc_msgSend(v26, "setPreferredFormatExt1:", objc_msgSend(v26, "preferredFormatExt1") | (32 * (v124 == 1.0)));
                v114 = objc_msgSend(v26, "formatsExt1") | 0x20;
                goto LABEL_223;
              }
            }
            if (objc_msgSend(v32, "iWidth") != 1088
              || objc_msgSend(v32, "iHeight") != 1088
              || (objc_msgSend(v32, "fRate"), v125 != 15.0)
              && (objc_msgSend(v32, "fRate"), v126 != 30.0)
              && (objc_msgSend(v32, "fRate"), v127 != 60.0))
            {
              v128 = objc_msgSend(v32, "iWidth");
              if (v164 == 1)
              {
                if (v128 == 1280 && objc_msgSend(v32, "iHeight") == 720)
                {
                  objc_msgSend(v32, "fRate");
                  if (v129 == 15.0)
                  {
                    objc_msgSend(v32, "fPref");
                    objc_msgSend(v26, "setPreferredFormat:", objc_msgSend(v26, "preferredFormat") | ((v130 == 1.0) << 10));
                    objc_msgSend(v26, "setFormats:", objc_msgSend(v26, "formats") | 0x400);
                  }
                }
                if (objc_msgSend(v32, "iWidth") == 1280
                  && objc_msgSend(v32, "iHeight") == 720)
                {
                  objc_msgSend(v32, "fRate");
                  if (v131 == 30.0)
                  {
                    objc_msgSend(v32, "fPref");
                    objc_msgSend(v26, "setPreferredFormat:", objc_msgSend(v26, "preferredFormat") | ((v132 == 1.0) << 11));
                    objc_msgSend(v26, "setFormats:", objc_msgSend(v26, "formats") | 0x800);
                  }
                }
                if (objc_msgSend(v32, "iWidth") == 1280
                  && objc_msgSend(v32, "iHeight") == 720)
                {
                  objc_msgSend(v32, "fRate");
                  if (v133 == 60.0)
                  {
                    objc_msgSend(v32, "fPref");
                    objc_msgSend(v26, "setPreferredFormat:", objc_msgSend(v26, "preferredFormat") | ((v134 == 1.0) << 13));
                    objc_msgSend(v26, "setFormats:", objc_msgSend(v26, "formats") | 0x2000);
                  }
                }
                v128 = objc_msgSend(v32, "iWidth");
              }
              if (v161)
              {
                if (v128 != 1280
                  || objc_msgSend(v32, "iHeight") != 720
                  || (objc_msgSend(v32, "fRate"), v135 != 15.0))
                {
                  v20 = v160;
                  if (objc_msgSend(v32, "iWidth") != 1280
                    || objc_msgSend(v32, "iHeight") != 720
                    || (objc_msgSend(v32, "fRate"), v140 != 30.0))
                  {
                    if (objc_msgSend(v32, "iWidth") != 1280
                      || objc_msgSend(v32, "iHeight") != 720
                      || (objc_msgSend(v32, "fRate"), v141 != 60.0))
                    {
LABEL_260:
                      if (objc_msgSend(v32, "iWidth") != 480
                        || objc_msgSend(v32, "iHeight") != 272
                        || (objc_msgSend(v32, "fRate"), v142 != 15.0))
                      {
                        if (objc_msgSend(v32, "iWidth") != 480
                          || objc_msgSend(v32, "iHeight") != 272
                          || (objc_msgSend(v32, "fRate"), v143 != 30.0))
                        {
LABEL_279:
                          if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
                          {
                            v146 = VRTraceErrorLogLevelToCSTR();
                            v147 = *MEMORY[0x1E0CF2758];
                            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
                              -[VCMediaNegotiationBlobVideoSettings(VideoRules) setVideoRuleCollections:featureStrings:isScreen:isCellular16x9Capable:].cold.2(v146, v32, v147);
                          }

                          goto LABEL_283;
                        }
                        goto LABEL_139;
                      }
LABEL_135:
                      objc_msgSend(v32, "fPref");
                      objc_msgSend(v26, "setPreferredFormat:", objc_msgSend(v26, "preferredFormat") | ((v81 == 1.0) << 14));
                      v46 = objc_msgSend(v26, "formats") | 0x4000;
                      goto LABEL_196;
                    }
LABEL_163:
                    objc_msgSend(v32, "fPref");
                    objc_msgSend(v26, "setPreferredFormat:", objc_msgSend(v26, "preferredFormat") | ((v95 == 1.0) << 18));
                    v46 = objc_msgSend(v26, "formats") | 0x40000;
                    goto LABEL_196;
                  }
LABEL_155:
                  objc_msgSend(v32, "fPref");
                  objc_msgSend(v26, "setPreferredFormat:", objc_msgSend(v26, "preferredFormat") | ((v91 == 1.0) << 17));
                  v46 = objc_msgSend(v26, "formats") | 0x20000;
                  goto LABEL_196;
                }
                objc_msgSend(v32, "fPref");
                objc_msgSend(v26, "setPreferredFormat:", objc_msgSend(v26, "preferredFormat") | ((v136 == 1.0) << 16));
                objc_msgSend(v26, "setFormats:", objc_msgSend(v26, "formats") | 0x10000);
                v20 = v160;
              }
              else
              {
                v20 = v160;
                if (v128 != 1280)
                  goto LABEL_260;
                if (objc_msgSend(v32, "iHeight") != 720)
                  goto LABEL_260;
                objc_msgSend(v32, "fRate");
                if (v137 != 15.0)
                {
                  objc_msgSend(v32, "fRate");
                  if (v138 != 30.0)
                  {
                    objc_msgSend(v32, "fRate");
                    if (v139 != 60.0)
                      goto LABEL_260;
                  }
                }
              }
            }
LABEL_197:
            ++v31;
          }
          while (v29 != v31);
          v144 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v166, v165, 16);
          v29 = v144;
          if (v144)
            continue;
          break;
        }
LABEL_268:
        objc_msgSend(v158, "addVideoRuleCollections:", v26);

        v15 = v159;
        v23 = v163;
        v22 = v164;
LABEL_269:
        ++v22;
      }
      while (v23 < 2);
      v19 = v157 + 1;
      if (v157 >= 2u)
      {
        v13 = v155;
        v14 = v156 + 1;
        a4 = v153;
        v10 = v151;
        self = v152;
        if (v156 + 1 == v154)
        {
          v145 = objc_msgSend(v151, "countByEnumeratingWithState:objects:count:", &v171, v170, 16);
          v13 = v155;
          v12 = v145;
          LOBYTE(v145) = 1;
          if (!v12)
            return v145;
          goto LABEL_3;
        }
        goto LABEL_4;
      }
    }
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    v148 = VRTraceErrorLogLevelToCSTR();
    v149 = *MEMORY[0x1E0CF2758];
    LODWORD(v145) = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
    if (!(_DWORD)v145)
      return v145;
    -[VCMediaNegotiationBlobVideoSettings(VideoRules) setVideoRuleCollections:featureStrings:isScreen:isCellular16x9Capable:].cold.1(v148, v15, v149);
  }
LABEL_283:
  LOBYTE(v145) = 0;
  return v145;
}

- (void)checkAndInsertRuleWithWidth:(unsigned int)a3 height:(unsigned int)a4 framerate:(int)a5 payload:(int)a6 priority:(double)a7 negotiationBitfield:(unsigned int *)a8 negotiationBit:(unsigned int)a9 rules:(id)a10 isCellular16x9Capable:(BOOL)a11
{
  uint64_t v14;
  uint64_t v16;
  uint64_t v17;
  VCVideoRule *v18;
  double v19;
  double v20;
  VCVideoRule *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t i;
  void *v26;
  int v27;
  int v28;
  float v29;
  float v30;
  float v31;
  int v32;
  uint64_t v33;
  NSObject *v34;
  unint64_t v35;
  int v36;
  uint8_t buf[4];
  uint64_t v38;
  __int16 v39;
  const char *v40;
  __int16 v41;
  int v42;
  __int16 v43;
  int v44;
  __int16 v45;
  int v46;
  __int16 v47;
  int v48;
  __int16 v49;
  int v50;
  __int16 v51;
  unsigned int v52;
  _BYTE v53[128];
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  uint64_t v58;

  v58 = *MEMORY[0x1E0C80C00];
  if ((*a8 & a9) != 0)
  {
    v14 = *(_QWORD *)&a6;
    v16 = *(_QWORD *)&a4;
    v17 = *(_QWORD *)&a3;
    v18 = [VCVideoRule alloc];
    v35 = __PAIR64__(a5, v16);
    *(float *)&v19 = (float)a5;
    *(float *)&v20 = a7;
    v36 = v14;
    v21 = -[VCVideoRule initWithFrameWidth:frameHeight:frameRate:payload:priority:](v18, "initWithFrameWidth:frameHeight:frameRate:payload:priority:", v17, v16, v14, v19, v20);
    v54 = 0u;
    v55 = 0u;
    v56 = 0u;
    v57 = 0u;
    v22 = objc_msgSend(a10, "countByEnumeratingWithState:objects:count:", &v54, v53, 16);
    if (v22)
    {
      v23 = v22;
      v24 = *(_QWORD *)v55;
      while (2)
      {
        for (i = 0; i != v23; ++i)
        {
          if (*(_QWORD *)v55 != v24)
            objc_enumerationMutation(a10);
          v26 = *(void **)(*((_QWORD *)&v54 + 1) + 8 * i);
          v27 = objc_msgSend(v26, "iWidth");
          if (v27 == -[VCVideoRule iWidth](v21, "iWidth"))
          {
            v28 = objc_msgSend(v26, "iHeight");
            if (v28 == -[VCVideoRule iHeight](v21, "iHeight"))
            {
              objc_msgSend(v26, "fRate");
              v30 = v29;
              -[VCVideoRule fRate](v21, "fRate");
              if (v30 == v31)
              {
                v32 = objc_msgSend(v26, "iPayload");
                if (v32 == -[VCVideoRule iPayload](v21, "iPayload"))
                {
                  if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
                  {
                    v33 = VRTraceErrorLogLevelToCSTR();
                    v34 = *MEMORY[0x1E0CF2758];
                    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
                    {
                      *(_DWORD *)buf = 136316930;
                      v38 = v33;
                      v39 = 2080;
                      v40 = "-[VCMediaNegotiationBlobVideoSettings(VideoRules) checkAndInsertRuleWithWidth:height:framera"
                            "te:payload:priority:negotiationBitfield:negotiationBit:rules:isCellular16x9Capable:]";
                      v41 = 1024;
                      v42 = 542;
                      v43 = 1024;
                      v44 = v17;
                      v45 = 1024;
                      v46 = v35;
                      v47 = 1024;
                      v48 = HIDWORD(v35);
                      v49 = 1024;
                      v50 = v36;
                      v51 = 1024;
                      v52 = a9;
                      _os_log_impl(&dword_1D8A54000, v34, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Found duplicated rule for %dx%d (%d) payload=%d 0x%x", buf, 0x3Au);
                    }
                  }
                  goto LABEL_17;
                }
              }
            }
          }
        }
        v23 = objc_msgSend(a10, "countByEnumeratingWithState:objects:count:", &v54, v53, 16);
        if (v23)
          continue;
        break;
      }
    }
    objc_msgSend(a10, "addObject:", v21);
LABEL_17:

    *a8 &= ~a9;
  }
}

- (id)newVideoRuleCollectionsForScreen:(BOOL)a3 isCellular16x9Capable:(BOOL)a4 isLocalConfig:(BOOL)a5
{
  _BOOL4 v5;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  int v14;
  id v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  unsigned int v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double v59;
  double v60;
  double v61;
  double v62;
  double v63;
  double v64;
  double v65;
  double v66;
  double v67;
  double v68;
  double v69;
  double v70;
  double v71;
  double v72;
  double v73;
  double v74;
  double v75;
  double v76;
  uint64_t v77;
  NSObject *v78;
  int v79;
  uint64_t v80;
  int v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v85;
  NSObject *v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t v142;
  uint64_t v143;
  NSMutableArray *obj;
  uint64_t v145;
  uint64_t v146;
  uint64_t v147;
  id v149;
  uint64_t v150;
  void *v151;
  VCVideoRuleCollections *v152;
  _BOOL4 v153;
  int v154;
  int v155;
  uint8_t buf[4];
  uint64_t v157;
  __int16 v158;
  const char *v159;
  __int16 v160;
  int v161;
  __int16 v162;
  int v163;
  __int16 v164;
  int v165;
  __int16 v166;
  _BOOL4 v167;
  _BYTE v168[128];
  __int128 v169;
  __int128 v170;
  __int128 v171;
  __int128 v172;
  _BYTE v173[128];
  __int128 v174;
  __int128 v175;
  __int128 v176;
  __int128 v177;
  uint64_t v178;

  v5 = a4;
  v153 = a3;
  v178 = *MEMORY[0x1E0C80C00];
  v152 = objc_alloc_init(VCVideoRuleCollections);
  if (v152)
  {
    v176 = 0u;
    v177 = 0u;
    v174 = 0u;
    v175 = 0u;
    obj = self->_videoPayloadCollections;
    v145 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v174, v173, 16);
    if (v145)
    {
      v146 = *(_QWORD *)v175;
      do
      {
        v7 = 0;
        do
        {
          if (*(_QWORD *)v175 != v146)
            objc_enumerationMutation(obj);
          v147 = v7;
          v8 = *(void **)(*((_QWORD *)&v174 + 1) + 8 * v7);
          v9 = objc_msgSend(v8, "payload");
          -[VCVideoRuleCollections addSupportedPayload:](v152, "addSupportedPayload:", v9);
          v171 = 0u;
          v172 = 0u;
          v169 = 0u;
          v170 = 0u;
          v151 = v8;
          v149 = (id)objc_msgSend(v8, "videoRuleCollections");
          v10 = objc_msgSend(v149, "countByEnumeratingWithState:objects:count:", &v169, v168, 16);
          if (!v10)
            goto LABEL_210;
          v11 = v10;
          v150 = *(_QWORD *)v170;
          while (2)
          {
            for (i = 0; i != v11; ++i)
            {
              if (*(_QWORD *)v170 != v150)
                objc_enumerationMutation(v149);
              v13 = *(void **)(*((_QWORD *)&v169 + 1) + 8 * i);
              v155 = -1431655766;
              v14 = objc_msgSend(v13, "formats");
              v154 = -1431655766;
              v155 = v14;
              v154 = objc_msgSend(v13, "formatsExt1");
              v15 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
              if (!v15)
              {
                if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
                {
                  VRTraceErrorLogLevelToCSTR();
                  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
                    -[VCMediaNegotiationBlobVideoSettings(VideoRules) newVideoRuleCollectionsForScreen:isCellular16x9Capable:isLocalConfig:].cold.2();
                }
                goto LABEL_216;
              }
              v16 = v15;
              if ((objc_msgSend(v13, "preferredFormat") & 1) != 0)
                v17 = 1.0;
              else
                v17 = 0.5;
              if (v153)
              {
                LOBYTE(v87) = v5;
                -[VCMediaNegotiationBlobVideoSettings checkAndInsertRuleWithWidth:height:framerate:payload:priority:negotiationBitfield:negotiationBit:rules:isCellular16x9Capable:](self, "checkAndInsertRuleWithWidth:height:framerate:payload:priority:negotiationBitfield:negotiationBit:rules:isCellular16x9Capable:", 1024, 768, 30, v9, &v155, 1, v17, v16, v87);
                v155 &= ~1u;
                if ((objc_msgSend(v13, "preferredFormat") & 2) != 0)
                  v18 = 1.0;
                else
                  v18 = 0.5;
                LOBYTE(v88) = v5;
                -[VCMediaNegotiationBlobVideoSettings checkAndInsertRuleWithWidth:height:framerate:payload:priority:negotiationBitfield:negotiationBit:rules:isCellular16x9Capable:](self, "checkAndInsertRuleWithWidth:height:framerate:payload:priority:negotiationBitfield:negotiationBit:rules:isCellular16x9Capable:", 1024, 768, 60, v9, &v155, 2, v18, v16, v88);
                v155 &= ~2u;
                if ((objc_msgSend(v13, "preferredFormat") & 4) != 0)
                  v19 = 1.0;
                else
                  v19 = 0.5;
                LOBYTE(v89) = v5;
                -[VCMediaNegotiationBlobVideoSettings checkAndInsertRuleWithWidth:height:framerate:payload:priority:negotiationBitfield:negotiationBit:rules:isCellular16x9Capable:](self, "checkAndInsertRuleWithWidth:height:framerate:payload:priority:negotiationBitfield:negotiationBit:rules:isCellular16x9Capable:", 1136, 640, 30, v9, &v155, 4, v19, v16, v89);
                v155 &= ~4u;
                if ((objc_msgSend(v13, "preferredFormat") & 8) != 0)
                  v20 = 1.0;
                else
                  v20 = 0.5;
                LOBYTE(v90) = v5;
                -[VCMediaNegotiationBlobVideoSettings checkAndInsertRuleWithWidth:height:framerate:payload:priority:negotiationBitfield:negotiationBit:rules:isCellular16x9Capable:](self, "checkAndInsertRuleWithWidth:height:framerate:payload:priority:negotiationBitfield:negotiationBit:rules:isCellular16x9Capable:", 1136, 640, 60, v9, &v155, 8, v20, v16, v90);
                v155 &= ~8u;
                if ((objc_msgSend(v13, "preferredFormat") & 0x4000) != 0)
                  v21 = 1.0;
                else
                  v21 = 0.5;
                LOBYTE(v91) = v5;
                -[VCMediaNegotiationBlobVideoSettings checkAndInsertRuleWithWidth:height:framerate:payload:priority:negotiationBitfield:negotiationBit:rules:isCellular16x9Capable:](self, "checkAndInsertRuleWithWidth:height:framerate:payload:priority:negotiationBitfield:negotiationBit:rules:isCellular16x9Capable:", 1280, 720, 30, v9, &v155, 0x4000, v21, v16, v91);
                v155 &= ~0x4000u;
                if ((objc_msgSend(v13, "preferredFormat") & 0x8000) != 0)
                  v22 = 1.0;
                else
                  v22 = 0.5;
                LOBYTE(v92) = v5;
                -[VCMediaNegotiationBlobVideoSettings checkAndInsertRuleWithWidth:height:framerate:payload:priority:negotiationBitfield:negotiationBit:rules:isCellular16x9Capable:](self, "checkAndInsertRuleWithWidth:height:framerate:payload:priority:negotiationBitfield:negotiationBit:rules:isCellular16x9Capable:", 1280, 720, 60, v9, &v155, 0x8000, v22, v16, v92);
                v155 &= ~0x8000u;
                if ((objc_msgSend(v13, "preferredFormat") & 0x10) != 0)
                  v23 = 1.0;
                else
                  v23 = 0.5;
                LOBYTE(v93) = v5;
                -[VCMediaNegotiationBlobVideoSettings checkAndInsertRuleWithWidth:height:framerate:payload:priority:negotiationBitfield:negotiationBit:rules:isCellular16x9Capable:](self, "checkAndInsertRuleWithWidth:height:framerate:payload:priority:negotiationBitfield:negotiationBit:rules:isCellular16x9Capable:", 1334, 750, 30, v9, &v155, 16, v23, v16, v93);
                v155 &= ~0x10u;
                if ((objc_msgSend(v13, "preferredFormat") & 0x20) != 0)
                  v24 = 1.0;
                else
                  v24 = 0.5;
                LOBYTE(v94) = v5;
                -[VCMediaNegotiationBlobVideoSettings checkAndInsertRuleWithWidth:height:framerate:payload:priority:negotiationBitfield:negotiationBit:rules:isCellular16x9Capable:](self, "checkAndInsertRuleWithWidth:height:framerate:payload:priority:negotiationBitfield:negotiationBit:rules:isCellular16x9Capable:", 1334, 750, 60, v9, &v155, 32, v24, v16, v94);
                v155 &= ~0x20u;
                if ((objc_msgSend(v13, "preferredFormat") & 0x40) != 0)
                  v25 = 1.0;
                else
                  v25 = 0.5;
                LOBYTE(v95) = v5;
                -[VCMediaNegotiationBlobVideoSettings checkAndInsertRuleWithWidth:height:framerate:payload:priority:negotiationBitfield:negotiationBit:rules:isCellular16x9Capable:](self, "checkAndInsertRuleWithWidth:height:framerate:payload:priority:negotiationBitfield:negotiationBit:rules:isCellular16x9Capable:", 1664, 1248, 30, v9, &v155, 64, v25, v16, v95);
                v155 &= ~0x40u;
                if ((objc_msgSend(v13, "preferredFormat") & 0x80) != 0)
                  v26 = 1.0;
                else
                  v26 = 0.5;
                LOBYTE(v96) = v5;
                -[VCMediaNegotiationBlobVideoSettings checkAndInsertRuleWithWidth:height:framerate:payload:priority:negotiationBitfield:negotiationBit:rules:isCellular16x9Capable:](self, "checkAndInsertRuleWithWidth:height:framerate:payload:priority:negotiationBitfield:negotiationBit:rules:isCellular16x9Capable:", 1664, 1248, 60, v9, &v155, 128, v26, v16, v96);
                v155 &= ~0x80u;
                if ((objc_msgSend(v13, "preferredFormat") & 0x100) != 0)
                  v27 = 1.0;
                else
                  v27 = 0.5;
                LOBYTE(v97) = v5;
                -[VCMediaNegotiationBlobVideoSettings checkAndInsertRuleWithWidth:height:framerate:payload:priority:negotiationBitfield:negotiationBit:rules:isCellular16x9Capable:](self, "checkAndInsertRuleWithWidth:height:framerate:payload:priority:negotiationBitfield:negotiationBit:rules:isCellular16x9Capable:", 1920, 1080, 30, v9, &v155, 256, v27, v16, v97);
                v155 &= ~0x100u;
                if ((objc_msgSend(v13, "preferredFormat") & 0x200) != 0)
                  v28 = 1.0;
                else
                  v28 = 0.5;
                LOBYTE(v98) = v5;
                -[VCMediaNegotiationBlobVideoSettings checkAndInsertRuleWithWidth:height:framerate:payload:priority:negotiationBitfield:negotiationBit:rules:isCellular16x9Capable:](self, "checkAndInsertRuleWithWidth:height:framerate:payload:priority:negotiationBitfield:negotiationBit:rules:isCellular16x9Capable:", 1920, 1080, 60, v9, &v155, 512, v28, v16, v98);
                v155 &= ~0x200u;
                if ((objc_msgSend(v13, "preferredFormat") & 0x400) != 0)
                  v29 = 1.0;
                else
                  v29 = 0.5;
                LOBYTE(v99) = v5;
                -[VCMediaNegotiationBlobVideoSettings checkAndInsertRuleWithWidth:height:framerate:payload:priority:negotiationBitfield:negotiationBit:rules:isCellular16x9Capable:](self, "checkAndInsertRuleWithWidth:height:framerate:payload:priority:negotiationBitfield:negotiationBit:rules:isCellular16x9Capable:", 2208, 1242, 30, v9, &v155, 1024, v29, v16, v99);
                v155 &= ~0x400u;
                if ((objc_msgSend(v13, "preferredFormat") & 0x800) != 0)
                  v30 = 1.0;
                else
                  v30 = 0.5;
                LOBYTE(v100) = v5;
                -[VCMediaNegotiationBlobVideoSettings checkAndInsertRuleWithWidth:height:framerate:payload:priority:negotiationBitfield:negotiationBit:rules:isCellular16x9Capable:](self, "checkAndInsertRuleWithWidth:height:framerate:payload:priority:negotiationBitfield:negotiationBit:rules:isCellular16x9Capable:", 2208, 1242, 60, v9, &v155, 2048, v30, v16, v100);
                v155 &= ~0x800u;
                if ((objc_msgSend(v13, "preferredFormat") & 0x1000) != 0)
                  v31 = 1.0;
                else
                  v31 = 0.5;
                LOBYTE(v101) = v5;
                -[VCMediaNegotiationBlobVideoSettings checkAndInsertRuleWithWidth:height:framerate:payload:priority:negotiationBitfield:negotiationBit:rules:isCellular16x9Capable:](self, "checkAndInsertRuleWithWidth:height:framerate:payload:priority:negotiationBitfield:negotiationBit:rules:isCellular16x9Capable:", 2048, 1536, 30, v9, &v155, 4096, v31, v16, v101);
                v155 &= ~0x1000u;
                if ((objc_msgSend(v13, "preferredFormat") & 0x2000) != 0)
                  v32 = 1.0;
                else
                  v32 = 0.5;
                LOBYTE(v102) = v5;
                -[VCMediaNegotiationBlobVideoSettings checkAndInsertRuleWithWidth:height:framerate:payload:priority:negotiationBitfield:negotiationBit:rules:isCellular16x9Capable:](self, "checkAndInsertRuleWithWidth:height:framerate:payload:priority:negotiationBitfield:negotiationBit:rules:isCellular16x9Capable:", 2048, 1536, 60, v9, &v155, 0x2000, v32, v16, v102);
                v155 &= ~0x2000u;
                if ((objc_msgSend(v13, "preferredFormat") & 0x10000) != 0)
                  v33 = 1.0;
                else
                  v33 = 0.5;
                LOBYTE(v103) = v5;
                -[VCMediaNegotiationBlobVideoSettings checkAndInsertRuleWithWidth:height:framerate:payload:priority:negotiationBitfield:negotiationBit:rules:isCellular16x9Capable:](self, "checkAndInsertRuleWithWidth:height:framerate:payload:priority:negotiationBitfield:negotiationBit:rules:isCellular16x9Capable:", 1920, 896, 30, v9, &v155, 0x10000, v33, v16, v103);
                v155 &= ~0x10000u;
                if ((objc_msgSend(v13, "preferredFormat") & 0x20000) != 0)
                  v34 = 1.0;
                else
                  v34 = 0.5;
                LOBYTE(v104) = v5;
                -[VCMediaNegotiationBlobVideoSettings checkAndInsertRuleWithWidth:height:framerate:payload:priority:negotiationBitfield:negotiationBit:rules:isCellular16x9Capable:](self, "checkAndInsertRuleWithWidth:height:framerate:payload:priority:negotiationBitfield:negotiationBit:rules:isCellular16x9Capable:", 1920, 896, 60, v9, &v155, 0x20000, v34, v16, v104);
                v155 &= ~0x20000u;
                if ((objc_msgSend(v13, "preferredFormat") & 0x40000) != 0)
                  v35 = 1.0;
                else
                  v35 = 0.5;
                LOBYTE(v105) = v5;
                -[VCMediaNegotiationBlobVideoSettings checkAndInsertRuleWithWidth:height:framerate:payload:priority:negotiationBitfield:negotiationBit:rules:isCellular16x9Capable:](self, "checkAndInsertRuleWithWidth:height:framerate:payload:priority:negotiationBitfield:negotiationBit:rules:isCellular16x9Capable:", 2732, 2048, 60, v9, &v155, 0x40000, v35, v16, v105);
                v155 &= ~0x40000u;
                if ((objc_msgSend(v13, "preferredFormat") & 0x80000) != 0)
                  v36 = 1.0;
                else
                  v36 = 0.5;
                LOBYTE(v106) = v5;
                -[VCMediaNegotiationBlobVideoSettings checkAndInsertRuleWithWidth:height:framerate:payload:priority:negotiationBitfield:negotiationBit:rules:isCellular16x9Capable:](self, "checkAndInsertRuleWithWidth:height:framerate:payload:priority:negotiationBitfield:negotiationBit:rules:isCellular16x9Capable:", 2388, 1668, 60, v9, &v155, 0x80000, v36, v16, v106);
                v155 &= ~0x80000u;
                if ((objc_msgSend(v13, "preferredFormat") & 0x100000) != 0)
                  v37 = 1.0;
                else
                  v37 = 0.5;
                LOBYTE(v107) = v5;
                -[VCMediaNegotiationBlobVideoSettings checkAndInsertRuleWithWidth:height:framerate:payload:priority:negotiationBitfield:negotiationBit:rules:isCellular16x9Capable:](self, "checkAndInsertRuleWithWidth:height:framerate:payload:priority:negotiationBitfield:negotiationBit:rules:isCellular16x9Capable:", 2224, 1668, 60, v9, &v155, 0x100000, v37, v16, v107);
                v155 &= ~0x100000u;
                if ((objc_msgSend(v13, "preferredFormat") & 0x200000) != 0)
                  v38 = 1.0;
                else
                  v38 = 0.5;
                LOBYTE(v108) = v5;
                -[VCMediaNegotiationBlobVideoSettings checkAndInsertRuleWithWidth:height:framerate:payload:priority:negotiationBitfield:negotiationBit:rules:isCellular16x9Capable:](self, "checkAndInsertRuleWithWidth:height:framerate:payload:priority:negotiationBitfield:negotiationBit:rules:isCellular16x9Capable:", 3072, 1728, 60, v9, &v155, 0x200000, v38, v16, v108);
                v155 &= ~0x200000u;
                if ((objc_msgSend(v13, "preferredFormat") & 0x400000) != 0)
                  v39 = 1.0;
                else
                  v39 = 0.5;
                LOBYTE(v109) = v5;
                -[VCMediaNegotiationBlobVideoSettings checkAndInsertRuleWithWidth:height:framerate:payload:priority:negotiationBitfield:negotiationBit:rules:isCellular16x9Capable:](self, "checkAndInsertRuleWithWidth:height:framerate:payload:priority:negotiationBitfield:negotiationBit:rules:isCellular16x9Capable:", 3840, 2160, 60, v9, &v155, 0x400000, v39, v16, v109);
                v40 = v155 & 0xFFBFFFFF;
LABEL_197:
                v155 = v40;
                goto LABEL_198;
              }
              LOBYTE(v87) = v5;
              -[VCMediaNegotiationBlobVideoSettings checkAndInsertRuleWithWidth:height:framerate:payload:priority:negotiationBitfield:negotiationBit:rules:isCellular16x9Capable:](self, "checkAndInsertRuleWithWidth:height:framerate:payload:priority:negotiationBitfield:negotiationBit:rules:isCellular16x9Capable:", 320, 240, 15, v9, &v155, 1, v17, v16, v87);
              v155 &= ~1u;
              if ((objc_msgSend(v13, "preferredFormat") & 2) != 0)
                v41 = 1.0;
              else
                v41 = 0.5;
              LOBYTE(v110) = v5;
              -[VCMediaNegotiationBlobVideoSettings checkAndInsertRuleWithWidth:height:framerate:payload:priority:negotiationBitfield:negotiationBit:rules:isCellular16x9Capable:](self, "checkAndInsertRuleWithWidth:height:framerate:payload:priority:negotiationBitfield:negotiationBit:rules:isCellular16x9Capable:", 320, 240, 30, v9, &v155, 2, v41, v16, v110);
              v155 &= ~2u;
              if ((objc_msgSend(v13, "preferredFormat") & 4) != 0)
                v42 = 1.0;
              else
                v42 = 0.5;
              LOBYTE(v111) = v5;
              -[VCMediaNegotiationBlobVideoSettings checkAndInsertRuleWithWidth:height:framerate:payload:priority:negotiationBitfield:negotiationBit:rules:isCellular16x9Capable:](self, "checkAndInsertRuleWithWidth:height:framerate:payload:priority:negotiationBitfield:negotiationBit:rules:isCellular16x9Capable:", 480, 368, 15, v9, &v155, 4, v42, v16, v111);
              v155 &= ~4u;
              if ((objc_msgSend(v13, "preferredFormat") & 8) != 0)
                v43 = 1.0;
              else
                v43 = 0.5;
              LOBYTE(v112) = v5;
              -[VCMediaNegotiationBlobVideoSettings checkAndInsertRuleWithWidth:height:framerate:payload:priority:negotiationBitfield:negotiationBit:rules:isCellular16x9Capable:](self, "checkAndInsertRuleWithWidth:height:framerate:payload:priority:negotiationBitfield:negotiationBit:rules:isCellular16x9Capable:", 480, 368, 30, v9, &v155, 8, v43, v16, v112);
              v155 &= ~8u;
              if ((objc_msgSend(v13, "preferredFormat") & 0x10) != 0)
                v44 = 1.0;
              else
                v44 = 0.5;
              LOBYTE(v113) = v5;
              -[VCMediaNegotiationBlobVideoSettings checkAndInsertRuleWithWidth:height:framerate:payload:priority:negotiationBitfield:negotiationBit:rules:isCellular16x9Capable:](self, "checkAndInsertRuleWithWidth:height:framerate:payload:priority:negotiationBitfield:negotiationBit:rules:isCellular16x9Capable:", 640, 480, 15, v9, &v155, 16, v44, v16, v113);
              v155 &= ~0x10u;
              if ((objc_msgSend(v13, "preferredFormat") & 0x20) != 0)
                v45 = 1.0;
              else
                v45 = 0.5;
              LOBYTE(v114) = v5;
              -[VCMediaNegotiationBlobVideoSettings checkAndInsertRuleWithWidth:height:framerate:payload:priority:negotiationBitfield:negotiationBit:rules:isCellular16x9Capable:](self, "checkAndInsertRuleWithWidth:height:framerate:payload:priority:negotiationBitfield:negotiationBit:rules:isCellular16x9Capable:", 640, 480, 30, v9, &v155, 32, v45, v16, v114);
              v155 &= ~0x20u;
              if ((objc_msgSend(v13, "preferredFormat") & 0x40) != 0)
                v46 = 1.0;
              else
                v46 = 0.5;
              LOBYTE(v115) = v5;
              -[VCMediaNegotiationBlobVideoSettings checkAndInsertRuleWithWidth:height:framerate:payload:priority:negotiationBitfield:negotiationBit:rules:isCellular16x9Capable:](self, "checkAndInsertRuleWithWidth:height:framerate:payload:priority:negotiationBitfield:negotiationBit:rules:isCellular16x9Capable:", 848, 480, 15, v9, &v155, 64, v46, v16, v115);
              v155 &= ~0x40u;
              if ((objc_msgSend(v13, "preferredFormat") & 0x80) != 0)
                v47 = 1.0;
              else
                v47 = 0.5;
              LOBYTE(v116) = v5;
              -[VCMediaNegotiationBlobVideoSettings checkAndInsertRuleWithWidth:height:framerate:payload:priority:negotiationBitfield:negotiationBit:rules:isCellular16x9Capable:](self, "checkAndInsertRuleWithWidth:height:framerate:payload:priority:negotiationBitfield:negotiationBit:rules:isCellular16x9Capable:", 848, 480, 30, v9, &v155, 128, v47, v16, v116);
              v155 &= ~0x80u;
              if ((objc_msgSend(v13, "preferredFormat") & 0x100) != 0)
                v48 = 1.0;
              else
                v48 = 0.5;
              LOBYTE(v117) = v5;
              -[VCMediaNegotiationBlobVideoSettings checkAndInsertRuleWithWidth:height:framerate:payload:priority:negotiationBitfield:negotiationBit:rules:isCellular16x9Capable:](self, "checkAndInsertRuleWithWidth:height:framerate:payload:priority:negotiationBitfield:negotiationBit:rules:isCellular16x9Capable:", 1024, 768, 15, v9, &v155, 256, v48, v16, v117);
              v155 &= ~0x100u;
              if ((objc_msgSend(v13, "preferredFormat") & 0x200) != 0)
                v49 = 1.0;
              else
                v49 = 0.5;
              LOBYTE(v118) = v5;
              -[VCMediaNegotiationBlobVideoSettings checkAndInsertRuleWithWidth:height:framerate:payload:priority:negotiationBitfield:negotiationBit:rules:isCellular16x9Capable:](self, "checkAndInsertRuleWithWidth:height:framerate:payload:priority:negotiationBitfield:negotiationBit:rules:isCellular16x9Capable:", 1024, 768, 30, v9, &v155, 512, v49, v16, v118);
              v155 &= ~0x200u;
              if ((objc_msgSend(v13, "preferredFormat") & 0x1000) != 0)
                v50 = 1.0;
              else
                v50 = 0.5;
              LOBYTE(v119) = v5;
              -[VCMediaNegotiationBlobVideoSettings checkAndInsertRuleWithWidth:height:framerate:payload:priority:negotiationBitfield:negotiationBit:rules:isCellular16x9Capable:](self, "checkAndInsertRuleWithWidth:height:framerate:payload:priority:negotiationBitfield:negotiationBit:rules:isCellular16x9Capable:", 1024, 768, 60, v9, &v155, 4096, v50, v16, v119);
              v155 &= ~0x1000u;
              if ((objc_msgSend(v13, "preferredFormat") & 0x80000) != 0)
                v51 = 1.0;
              else
                v51 = 0.5;
              LOBYTE(v120) = v5;
              -[VCMediaNegotiationBlobVideoSettings checkAndInsertRuleWithWidth:height:framerate:payload:priority:negotiationBitfield:negotiationBit:rules:isCellular16x9Capable:](self, "checkAndInsertRuleWithWidth:height:framerate:payload:priority:negotiationBitfield:negotiationBit:rules:isCellular16x9Capable:", 192, 112, 15, v9, &v155, 0x80000, v51, v16, v120);
              v155 &= ~0x80000u;
              if ((objc_msgSend(v13, "preferredFormat") & 0x100000) != 0)
                v52 = 1.0;
              else
                v52 = 0.5;
              LOBYTE(v121) = v5;
              -[VCMediaNegotiationBlobVideoSettings checkAndInsertRuleWithWidth:height:framerate:payload:priority:negotiationBitfield:negotiationBit:rules:isCellular16x9Capable:](self, "checkAndInsertRuleWithWidth:height:framerate:payload:priority:negotiationBitfield:negotiationBit:rules:isCellular16x9Capable:", 192, 192, 15, v9, &v155, 0x100000, v52, v16, v121);
              v155 &= ~0x100000u;
              if ((objc_msgSend(v13, "preferredFormat") & 0x200000) != 0)
                v53 = 1.0;
              else
                v53 = 0.5;
              LOBYTE(v122) = v5;
              -[VCMediaNegotiationBlobVideoSettings checkAndInsertRuleWithWidth:height:framerate:payload:priority:negotiationBitfield:negotiationBit:rules:isCellular16x9Capable:](self, "checkAndInsertRuleWithWidth:height:framerate:payload:priority:negotiationBitfield:negotiationBit:rules:isCellular16x9Capable:", 240, 240, 15, v9, &v155, 0x200000, v53, v16, v122);
              v155 &= ~0x200000u;
              if ((objc_msgSend(v13, "preferredFormat") & 0x400000) != 0)
                v54 = 1.0;
              else
                v54 = 0.5;
              LOBYTE(v123) = v5;
              -[VCMediaNegotiationBlobVideoSettings checkAndInsertRuleWithWidth:height:framerate:payload:priority:negotiationBitfield:negotiationBit:rules:isCellular16x9Capable:](self, "checkAndInsertRuleWithWidth:height:framerate:payload:priority:negotiationBitfield:negotiationBit:rules:isCellular16x9Capable:", 320, 320, 30, v9, &v155, 0x400000, v54, v16, v123);
              v155 &= ~0x400000u;
              if ((objc_msgSend(v13, "preferredFormat") & 0x800000) != 0)
                v55 = 1.0;
              else
                v55 = 0.5;
              LOBYTE(v124) = v5;
              -[VCMediaNegotiationBlobVideoSettings checkAndInsertRuleWithWidth:height:framerate:payload:priority:negotiationBitfield:negotiationBit:rules:isCellular16x9Capable:](self, "checkAndInsertRuleWithWidth:height:framerate:payload:priority:negotiationBitfield:negotiationBit:rules:isCellular16x9Capable:", 480, 480, 30, v9, &v155, 0x800000, v55, v16, v124);
              v155 &= ~0x800000u;
              if ((objc_msgSend(v13, "preferredFormat") & 0x1000000) != 0)
                v56 = 1.0;
              else
                v56 = 0.5;
              LOBYTE(v125) = v5;
              -[VCMediaNegotiationBlobVideoSettings checkAndInsertRuleWithWidth:height:framerate:payload:priority:negotiationBitfield:negotiationBit:rules:isCellular16x9Capable:](self, "checkAndInsertRuleWithWidth:height:framerate:payload:priority:negotiationBitfield:negotiationBit:rules:isCellular16x9Capable:", 640, 640, 30, v9, &v155, 0x1000000, v56, v16, v125);
              v155 &= ~0x1000000u;
              if ((objc_msgSend(v13, "preferredFormat") & 0x2000000) != 0)
                v57 = 1.0;
              else
                v57 = 0.5;
              LOBYTE(v126) = v5;
              -[VCMediaNegotiationBlobVideoSettings checkAndInsertRuleWithWidth:height:framerate:payload:priority:negotiationBitfield:negotiationBit:rules:isCellular16x9Capable:](self, "checkAndInsertRuleWithWidth:height:framerate:payload:priority:negotiationBitfield:negotiationBit:rules:isCellular16x9Capable:", 720, 720, 30, v9, &v155, 0x2000000, v57, v16, v126);
              v155 &= ~0x2000000u;
              if ((objc_msgSend(v13, "preferredFormat") & 0x4000000) != 0)
                v58 = 1.0;
              else
                v58 = 0.5;
              LOBYTE(v127) = v5;
              -[VCMediaNegotiationBlobVideoSettings checkAndInsertRuleWithWidth:height:framerate:payload:priority:negotiationBitfield:negotiationBit:rules:isCellular16x9Capable:](self, "checkAndInsertRuleWithWidth:height:framerate:payload:priority:negotiationBitfield:negotiationBit:rules:isCellular16x9Capable:", 1024, 576, 30, v9, &v155, 0x4000000, v58, v16, v127);
              v155 &= ~0x4000000u;
              if ((objc_msgSend(v13, "preferredFormat") & 0x8000000) != 0)
                v59 = 1.0;
              else
                v59 = 0.5;
              LOBYTE(v128) = v5;
              -[VCMediaNegotiationBlobVideoSettings checkAndInsertRuleWithWidth:height:framerate:payload:priority:negotiationBitfield:negotiationBit:rules:isCellular16x9Capable:](self, "checkAndInsertRuleWithWidth:height:framerate:payload:priority:negotiationBitfield:negotiationBit:rules:isCellular16x9Capable:", 1920, 1080, 30, v9, &v155, 0x8000000, v59, v16, v128);
              v155 &= ~0x8000000u;
              if ((objc_msgSend(v13, "preferredFormat") & 0x10000000) != 0)
                v60 = 1.0;
              else
                v60 = 0.5;
              LOBYTE(v129) = v5;
              -[VCMediaNegotiationBlobVideoSettings checkAndInsertRuleWithWidth:height:framerate:payload:priority:negotiationBitfield:negotiationBit:rules:isCellular16x9Capable:](self, "checkAndInsertRuleWithWidth:height:framerate:payload:priority:negotiationBitfield:negotiationBit:rules:isCellular16x9Capable:", 1440, 1080, 30, v9, &v155, 0x10000000, v60, v16, v129);
              v155 &= ~0x10000000u;
              if ((objc_msgSend(v13, "preferredFormat") & 0x20000000) != 0)
                v61 = 1.0;
              else
                v61 = 0.5;
              LOBYTE(v130) = v5;
              -[VCMediaNegotiationBlobVideoSettings checkAndInsertRuleWithWidth:height:framerate:payload:priority:negotiationBitfield:negotiationBit:rules:isCellular16x9Capable:](self, "checkAndInsertRuleWithWidth:height:framerate:payload:priority:negotiationBitfield:negotiationBit:rules:isCellular16x9Capable:", 896, 672, 30, v9, &v155, 0x20000000, v61, v16, v130);
              v155 &= ~0x20000000u;
              if ((objc_msgSend(v13, "preferredFormat") & 0x40000000) != 0)
                v62 = 1.0;
              else
                v62 = 0.5;
              LOBYTE(v131) = v5;
              -[VCMediaNegotiationBlobVideoSettings checkAndInsertRuleWithWidth:height:framerate:payload:priority:negotiationBitfield:negotiationBit:rules:isCellular16x9Capable:](self, "checkAndInsertRuleWithWidth:height:framerate:payload:priority:negotiationBitfield:negotiationBit:rules:isCellular16x9Capable:", 1920, 1080, 60, v9, &v155, 0x40000000, v62, v16, v131);
              v155 &= ~0x40000000u;
              if ((objc_msgSend(v13, "preferredFormatExt1") & 1) != 0)
                v63 = 1.0;
              else
                v63 = 0.5;
              LOBYTE(v132) = v5;
              -[VCMediaNegotiationBlobVideoSettings checkAndInsertRuleWithWidth:height:framerate:payload:priority:negotiationBitfield:negotiationBit:rules:isCellular16x9Capable:](self, "checkAndInsertRuleWithWidth:height:framerate:payload:priority:negotiationBitfield:negotiationBit:rules:isCellular16x9Capable:", 896, 672, 60, v9, &v154, 1, v63, v16, v132);
              v154 &= ~1u;
              if ((objc_msgSend(v13, "preferredFormatExt1") & 2) != 0)
                v64 = 1.0;
              else
                v64 = 0.5;
              LOBYTE(v133) = v5;
              -[VCMediaNegotiationBlobVideoSettings checkAndInsertRuleWithWidth:height:framerate:payload:priority:negotiationBitfield:negotiationBit:rules:isCellular16x9Capable:](self, "checkAndInsertRuleWithWidth:height:framerate:payload:priority:negotiationBitfield:negotiationBit:rules:isCellular16x9Capable:", 1664, 1248, 30, v9, &v154, 2, v64, v16, v133);
              v154 &= ~2u;
              if ((objc_msgSend(v13, "preferredFormatExt1") & 4) != 0)
                v65 = 1.0;
              else
                v65 = 0.5;
              LOBYTE(v134) = v5;
              -[VCMediaNegotiationBlobVideoSettings checkAndInsertRuleWithWidth:height:framerate:payload:priority:negotiationBitfield:negotiationBit:rules:isCellular16x9Capable:](self, "checkAndInsertRuleWithWidth:height:framerate:payload:priority:negotiationBitfield:negotiationBit:rules:isCellular16x9Capable:", 1664, 1248, 60, v9, &v154, 4, v65, v16, v134);
              v154 &= ~4u;
              if ((objc_msgSend(v13, "preferredFormatExt1") & 8) != 0)
                v66 = 1.0;
              else
                v66 = 0.5;
              LOBYTE(v135) = v5;
              -[VCMediaNegotiationBlobVideoSettings checkAndInsertRuleWithWidth:height:framerate:payload:priority:negotiationBitfield:negotiationBit:rules:isCellular16x9Capable:](self, "checkAndInsertRuleWithWidth:height:framerate:payload:priority:negotiationBitfield:negotiationBit:rules:isCellular16x9Capable:", 1024, 576, 15, v9, &v154, 8, v66, v16, v135);
              v154 &= ~8u;
              if ((objc_msgSend(v13, "preferredFormatExt1") & 0x10) != 0)
                v67 = 1.0;
              else
                v67 = 0.5;
              LOBYTE(v136) = v5;
              -[VCMediaNegotiationBlobVideoSettings checkAndInsertRuleWithWidth:height:framerate:payload:priority:negotiationBitfield:negotiationBit:rules:isCellular16x9Capable:](self, "checkAndInsertRuleWithWidth:height:framerate:payload:priority:negotiationBitfield:negotiationBit:rules:isCellular16x9Capable:", 896, 672, 15, v9, &v154, 16, v67, v16, v136);
              v154 &= ~0x10u;
              if ((objc_msgSend(v13, "preferredFormatExt1") & 0x20) != 0)
                v68 = 1.0;
              else
                v68 = 0.5;
              LOBYTE(v137) = v5;
              -[VCMediaNegotiationBlobVideoSettings checkAndInsertRuleWithWidth:height:framerate:payload:priority:negotiationBitfield:negotiationBit:rules:isCellular16x9Capable:](self, "checkAndInsertRuleWithWidth:height:framerate:payload:priority:negotiationBitfield:negotiationBit:rules:isCellular16x9Capable:", 1920, 1440, 60, v9, &v154, 32, v68, v16, v137);
              v154 &= ~0x20u;
              if (a5 || objc_msgSend(v13, "operation") == 2)
              {
                if ((objc_msgSend(v13, "preferredFormat") & 0x400) != 0)
                  v69 = 1.0;
                else
                  v69 = 0.5;
                LOBYTE(v138) = v5;
                -[VCMediaNegotiationBlobVideoSettings checkAndInsertRuleWithWidth:height:framerate:payload:priority:negotiationBitfield:negotiationBit:rules:isCellular16x9Capable:](self, "checkAndInsertRuleWithWidth:height:framerate:payload:priority:negotiationBitfield:negotiationBit:rules:isCellular16x9Capable:", 1280, 720, 15, v9, &v155, 1024, v69, v16, v138);
                v155 &= ~0x400u;
                if ((objc_msgSend(v13, "preferredFormat") & 0x800) != 0)
                  v70 = 1.0;
                else
                  v70 = 0.5;
                LOBYTE(v139) = v5;
                -[VCMediaNegotiationBlobVideoSettings checkAndInsertRuleWithWidth:height:framerate:payload:priority:negotiationBitfield:negotiationBit:rules:isCellular16x9Capable:](self, "checkAndInsertRuleWithWidth:height:framerate:payload:priority:negotiationBitfield:negotiationBit:rules:isCellular16x9Capable:", 1280, 720, 30, v9, &v155, 2048, v70, v16, v139);
                v155 &= ~0x800u;
                if ((objc_msgSend(v13, "preferredFormat") & 0x2000) != 0)
                  v71 = 1.0;
                else
                  v71 = 0.5;
                LOBYTE(v140) = v5;
                -[VCMediaNegotiationBlobVideoSettings checkAndInsertRuleWithWidth:height:framerate:payload:priority:negotiationBitfield:negotiationBit:rules:isCellular16x9Capable:](self, "checkAndInsertRuleWithWidth:height:framerate:payload:priority:negotiationBitfield:negotiationBit:rules:isCellular16x9Capable:", 1280, 720, 60, v9, &v155, 0x2000, v71, v16, v140);
                v155 &= ~0x2000u;
              }
              if ((objc_msgSend(v13, "preferredFormat") & 0x4000) != 0)
                v72 = 1.0;
              else
                v72 = 0.5;
              LOBYTE(v138) = v5;
              -[VCMediaNegotiationBlobVideoSettings checkAndInsertRuleWithWidth:height:framerate:payload:priority:negotiationBitfield:negotiationBit:rules:isCellular16x9Capable:](self, "checkAndInsertRuleWithWidth:height:framerate:payload:priority:negotiationBitfield:negotiationBit:rules:isCellular16x9Capable:", 480, 272, 15, v9, &v155, 0x4000, v72, v16, v138);
              v155 &= ~0x4000u;
              if ((objc_msgSend(v13, "preferredFormat") & 0x8000) != 0)
                v73 = 1.0;
              else
                v73 = 0.5;
              LOBYTE(v141) = v5;
              -[VCMediaNegotiationBlobVideoSettings checkAndInsertRuleWithWidth:height:framerate:payload:priority:negotiationBitfield:negotiationBit:rules:isCellular16x9Capable:](self, "checkAndInsertRuleWithWidth:height:framerate:payload:priority:negotiationBitfield:negotiationBit:rules:isCellular16x9Capable:", 480, 272, 30, v9, &v155, 0x8000, v73, v16, v141);
              v40 = v155 & 0xFFFF7FFF;
              v155 &= ~0x8000u;
              if (v5)
              {
                if ((objc_msgSend(v13, "preferredFormat") & 0x10000) != 0)
                  v74 = 1.0;
                else
                  v74 = 0.5;
                LOBYTE(v87) = 1;
                -[VCMediaNegotiationBlobVideoSettings checkAndInsertRuleWithWidth:height:framerate:payload:priority:negotiationBitfield:negotiationBit:rules:isCellular16x9Capable:](self, "checkAndInsertRuleWithWidth:height:framerate:payload:priority:negotiationBitfield:negotiationBit:rules:isCellular16x9Capable:", 1280, 720, 15, v9, &v155, 0x10000, v74, v16, v87);
                v155 &= ~0x10000u;
                if ((objc_msgSend(v13, "preferredFormat") & 0x20000) != 0)
                  v75 = 1.0;
                else
                  v75 = 0.5;
                LOBYTE(v142) = 1;
                -[VCMediaNegotiationBlobVideoSettings checkAndInsertRuleWithWidth:height:framerate:payload:priority:negotiationBitfield:negotiationBit:rules:isCellular16x9Capable:](self, "checkAndInsertRuleWithWidth:height:framerate:payload:priority:negotiationBitfield:negotiationBit:rules:isCellular16x9Capable:", 1280, 720, 30, v9, &v155, 0x20000, v75, v16, v142);
                v155 &= ~0x20000u;
                if ((objc_msgSend(v13, "preferredFormat") & 0x40000) != 0)
                  v76 = 1.0;
                else
                  v76 = 0.5;
                LOBYTE(v143) = 1;
                -[VCMediaNegotiationBlobVideoSettings checkAndInsertRuleWithWidth:height:framerate:payload:priority:negotiationBitfield:negotiationBit:rules:isCellular16x9Capable:](self, "checkAndInsertRuleWithWidth:height:framerate:payload:priority:negotiationBitfield:negotiationBit:rules:isCellular16x9Capable:", 1280, 720, 60, v9, &v155, 0x40000, v76, v16, v143);
                v40 = v155 & 0xFFFBFFFF;
                goto LABEL_197;
              }
LABEL_198:
              if (v40 | v154)
              {
                if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
                {
                  v77 = VRTraceErrorLogLevelToCSTR();
                  v78 = *MEMORY[0x1E0CF2758];
                  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 136316418;
                    v157 = v77;
                    v158 = 2080;
                    v159 = "-[VCMediaNegotiationBlobVideoSettings(VideoRules) newVideoRuleCollectionsForScreen:isCellular"
                           "16x9Capable:isLocalConfig:]";
                    v160 = 1024;
                    v161 = 653;
                    v162 = 1024;
                    v163 = v155;
                    v164 = 1024;
                    v165 = v154;
                    v166 = 1024;
                    v167 = v153;
                    _os_log_impl(&dword_1D8A54000, v78, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Detected an unknown formats (bitfield=0x%08x, bitfieldExt1=0x%08x - screen=%d). Ignoring ...", buf, 0x2Eu);
                  }
                }
              }
              objc_msgSend(v16, "sortUsingSelector:", sel_compare_);
              v79 = objc_msgSend(v13, "transport");
              v80 = objc_msgSend(v151, "payload");
              v81 = objc_msgSend(v13, "operation");
              if (v79 == 1)
                v82 = 1;
              else
                v82 = 2;
              if (v81 == 1)
                v83 = 1;
              else
                v83 = 2;
              -[VCVideoRuleCollections addVideoRules:transportType:payload:encodingType:](v152, "addVideoRules:transportType:payload:encodingType:", v16, v82, v80, v83);

            }
            v11 = objc_msgSend(v149, "countByEnumeratingWithState:objects:count:", &v169, v168, 16);
            if (v11)
              continue;
            break;
          }
LABEL_210:
          v7 = v147 + 1;
        }
        while (v147 + 1 != v145);
        v145 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v174, v173, 16);
      }
      while (v145);
    }
  }
  else
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      v85 = VRTraceErrorLogLevelToCSTR();
      v86 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCMediaNegotiationBlobVideoSettings(VideoRules) newVideoRuleCollectionsForScreen:isCellular16x9Capable:isLocalConfig:].cold.1(v85, v153, v86);
    }
LABEL_216:

    return 0;
  }
  return v152;
}

- (id)newCameraConfiguration
{
  VCMediaNegotiatorVideoConfiguration *v3;
  VCMediaNegotiatorVideoConfiguration *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;

  v3 = objc_alloc_init(VCMediaNegotiatorVideoConfiguration);
  v4 = v3;
  if (!v3)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCMediaNegotiationBlobVideoSettings(VideoRules) newCameraConfiguration].cold.1();
    }
    goto LABEL_12;
  }
  -[VCMediaNegotiatorCommonConfiguration setSsrc:](v3, "setSsrc:", self->_rtpSSRC);
  v5 = -[VCMediaNegotiationBlobVideoSettings newVideoRuleCollectionsForScreen:isCellular16x9Capable:isLocalConfig:](self, "newVideoRuleCollectionsForScreen:isCellular16x9Capable:isLocalConfig:", 0, 1, 1);
  if (!v5)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCMediaNegotiationBlobVideoSettings(VideoRules) newCameraConfiguration].cold.2();
    }
LABEL_12:
    v6 = 0;
LABEL_16:

    return 0;
  }
  v6 = v5;
  -[VCMediaNegotiatorVideoConfiguration setVideoRuleCollections:](v4, "setVideoRuleCollections:", v5);
  v7 = -[VCMediaNegotiationBlobVideoSettings newFeatureStrings](self, "newFeatureStrings");
  if (!v7)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCMediaNegotiationBlobVideoSettings(VideoRules) newCameraConfiguration].cold.3();
    }
    goto LABEL_16;
  }
  v8 = v7;
  -[VCMediaNegotiatorVideoConfiguration setVideoFeatureStrings:](v4, "setVideoFeatureStrings:", v7);

  return v4;
}

- (id)newScreenConfigurationWithCameraConfiguration:(id)a3
{
  VCMediaNegotiatorVideoConfiguration *v4;
  VCMediaNegotiatorVideoConfiguration *v5;
  id v6;

  if (a3)
    v4 = (VCMediaNegotiatorVideoConfiguration *)objc_msgSend(a3, "copy");
  else
    v4 = objc_alloc_init(VCMediaNegotiatorVideoConfiguration);
  v5 = v4;
  if (v4)
  {
    -[VCMediaNegotiatorCommonConfiguration setSsrc:](v4, "setSsrc:", self->_rtpSSRC);
    v6 = -[VCMediaNegotiationBlobVideoSettings newVideoRuleCollectionsForScreen:isCellular16x9Capable:isLocalConfig:](self, "newVideoRuleCollectionsForScreen:isCellular16x9Capable:isLocalConfig:", 1, 1, 1);
    -[VCMediaNegotiatorVideoConfiguration setVideoRuleCollections:](v5, "setVideoRuleCollections:", v6);

  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      -[VCMediaNegotiationBlobVideoSettings(VideoRules) newScreenConfigurationWithCameraConfiguration:].cold.1();
  }
  return v5;
}

- (id)newFeatureStrings
{
  void *v3;
  NSMutableArray *videoPayloadCollections;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  _BYTE v13[128];
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", -[NSMutableArray count](self->_videoPayloadCollections, "count"));
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  videoPayloadCollections = self->_videoPayloadCollections;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](videoPayloadCollections, "countByEnumeratingWithState:objects:count:", &v14, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v15 != v7)
          objc_enumerationMutation(videoPayloadCollections);
        v9 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        v10 = objc_msgSend(v9, "payload");
        v11 = objc_msgSend(v9, "featureString");
        objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v10));
      }
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](videoPayloadCollections, "countByEnumeratingWithState:objects:count:", &v14, v13, 16);
    }
    while (v6);
  }
  return v3;
}

- (id)parameterSetStringFromPayloadSettings:(id)a3
{
  uint64_t v4;
  void *v5;
  int v6;
  uint64_t v7;
  __CFString *v8;
  BOOL v9;

  v4 = objc_msgSend(MEMORY[0x1E0CB3500], "characterSetWithCharactersInString:", CFSTR(", "));
  v5 = (void *)objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithString:", &stru_1E9E58EE0);
  v6 = objc_msgSend(a3, "parameterSet");
  v7 = 1;
  do
  {
    if ((v7 & v6) != 0)
    {
      if (v7 < 9 && ((0x117u >> v7) & 1) != 0)
        v8 = off_1E9E57C30[v7];
      else
        v8 = (__CFString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v7);
      objc_msgSend(v5, "appendFormat:", CFSTR(", %@"), v8);
    }
    v9 = v7 >= 8;
    v7 = (2 * v7);
  }
  while (!v9);
  return (id)objc_msgSend(v5, "stringByTrimmingCharactersInSet:", v4);
}

- (void)prepareFormatString:(id)a3 format:(id)a4 formatIndex:(unsigned int)a5 preferredFormat:(unsigned int)a6
{
  void *v9;
  int v10;
  uint64_t v12;
  uint64_t v13;
  const char *v14;

  v9 = (void *)objc_msgSend(a4, "componentsSeparatedByString:", CFSTR("_"));
  if (objc_msgSend(v9, "count") == 4)
    v10 = objc_msgSend((id)objc_msgSend(v9, "objectAtIndexedSubscript:", 3), "isEqualToString:", CFSTR("dec"));
  else
    v10 = 0;
  if (objc_msgSend(v9, "count") == 3 || v10 != 0)
  {
    v12 = objc_msgSend(v9, "objectAtIndex:", 1);
    v13 = objc_msgSend(v9, "objectAtIndex:", 2);
    v14 = "";
    if (v10)
      v14 = "*";
    objc_msgSend(a3, "appendFormat:", CFSTR(" %@@%@fps%s"), v12, v13, v14);
    if ((a6 & a5) != 0)
      objc_msgSend(a3, "appendString:", CFSTR(" (preferred)"));
    objc_msgSend(a3, "appendString:", CFSTR(","));
  }
}

- (void)printVideoWithLogFile:(void *)a3
{
  int ErrorLogLevelForModule;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSObject **v11;
  uint64_t v12;
  NSObject *v13;
  unsigned int rtpSSRC;
  _BOOL4 allowRTCPFB;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  NSObject *v19;
  int v20;
  uint64_t v21;
  char v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  id v29;
  uint64_t v30;
  NSObject *v31;
  int v32;
  uint64_t v33;
  char v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t i;
  void *v42;
  void *v43;
  void *v44;
  uint64_t v45;
  const char *v46;
  int v47;
  const char *v48;
  void *v49;
  uint64_t v50;
  uint64_t v51;
  const __CFString *v52;
  BOOL v53;
  uint64_t v54;
  uint64_t v55;
  const __CFString *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  NSObject *v65;
  NSMutableArray *obj;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  id v70;
  uint64_t v71;
  uint64_t v73;
  _BYTE v74[128];
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  uint8_t buf[4];
  uint64_t v80;
  __int16 v81;
  const char *v82;
  __int16 v83;
  int v84;
  __int16 v85;
  _BYTE v86[14];
  _BYTE v87[128];
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  uint64_t v92;

  v92 = *MEMORY[0x1E0C80C00];
  ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
  v11 = (NSObject **)MEMORY[0x1E0CF2758];
  if (ErrorLogLevelForModule > 6)
  {
    v12 = VRTraceErrorLogLevelToCSTR();
    v13 = *v11;
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      rtpSSRC = self->_rtpSSRC;
      allowRTCPFB = self->_allowRTCPFB;
      *(_DWORD *)buf = 136316162;
      v80 = v12;
      v81 = 2080;
      v82 = "-[VCMediaNegotiationBlobVideoSettings(VideoRules) printVideoWithLogFile:]";
      v83 = 1024;
      v84 = 760;
      v85 = 1024;
      *(_DWORD *)v86 = rtpSSRC;
      *(_WORD *)&v86[4] = 1024;
      *(_DWORD *)&v86[6] = allowRTCPFB;
      _os_log_impl(&dword_1D8A54000, v13, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Media Blob - Video Settings: SSRC=%x allowRTCPFB=%u", buf, 0x28u);
    }
  }
  VRLogfilePrintWithTimestamp((uint64_t)a3, "Media Blob - Video Settings: SSRC=%x allowRTCPFB=%u\n", v5, v6, v7, v8, v9, v10, self->_rtpSSRC);
  v90 = 0u;
  v91 = 0u;
  v88 = 0u;
  v89 = 0u;
  obj = self->_videoPayloadCollections;
  v68 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v88, v87, 16);
  if (v68)
  {
    v67 = *(_QWORD *)v89;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v89 != v67)
          objc_enumerationMutation(obj);
        v69 = v16;
        v17 = *(void **)(*((_QWORD *)&v88 + 1) + 8 * v16);
        if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
        {
          v18 = VRTraceErrorLogLevelToCSTR();
          v19 = *MEMORY[0x1E0CF2758];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
          {
            v20 = objc_msgSend(v17, "payload");
            v21 = objc_msgSend((id)objc_msgSend(v17, "featureString"), "UTF8String");
            *(_DWORD *)buf = 136316162;
            v80 = v18;
            v81 = 2080;
            v82 = "-[VCMediaNegotiationBlobVideoSettings(VideoRules) printVideoWithLogFile:]";
            v83 = 1024;
            v84 = 764;
            v85 = 1024;
            *(_DWORD *)v86 = v20;
            *(_WORD *)&v86[4] = 2080;
            *(_QWORD *)&v86[6] = v21;
            _os_log_impl(&dword_1D8A54000, v19, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Media Blob -     Payload=%u Format string=%s", buf, 0x2Cu);
          }
        }
        v22 = objc_msgSend(v17, "payload");
        objc_msgSend((id)objc_msgSend(v17, "featureString"), "UTF8String");
        VRLogfilePrintWithTimestamp((uint64_t)a3, "Media Blob -     Payload=%u Format string=%s\n", v23, v24, v25, v26, v27, v28, v22);
        v29 = -[VCMediaNegotiationBlobVideoSettings parameterSetStringFromPayloadSettings:](self, "parameterSetStringFromPayloadSettings:", v17);
        if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
        {
          v30 = VRTraceErrorLogLevelToCSTR();
          v31 = *MEMORY[0x1E0CF2758];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
          {
            v32 = objc_msgSend(v17, "payload");
            v33 = objc_msgSend(v29, "UTF8String");
            *(_DWORD *)buf = 136316162;
            v80 = v30;
            v81 = 2080;
            v82 = "-[VCMediaNegotiationBlobVideoSettings(VideoRules) printVideoWithLogFile:]";
            v83 = 1024;
            v84 = 768;
            v85 = 1024;
            *(_DWORD *)v86 = v32;
            *(_WORD *)&v86[4] = 2080;
            *(_QWORD *)&v86[6] = v33;
            _os_log_impl(&dword_1D8A54000, v31, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Media Blob -     Payload=%u Parameter set: %s", buf, 0x2Cu);
          }
        }
        v34 = objc_msgSend(v17, "payload");
        objc_msgSend(v29, "UTF8String");
        VRLogfilePrintWithTimestamp((uint64_t)a3, "Media Blob -     Payload=%u Parameter set: %s\n", v35, v36, v37, v38, v39, v40, v34);
        v77 = 0u;
        v78 = 0u;
        v75 = 0u;
        v76 = 0u;
        v70 = (id)objc_msgSend(v17, "videoRuleCollections");
        v73 = objc_msgSend(v70, "countByEnumeratingWithState:objects:count:", &v75, v74, 16);
        if (v73)
        {
          v71 = *(_QWORD *)v76;
          do
          {
            for (i = 0; i != v73; ++i)
            {
              if (*(_QWORD *)v76 != v71)
                objc_enumerationMutation(v70);
              v42 = *(void **)(*((_QWORD *)&v75 + 1) + 8 * i);
              v43 = (void *)MEMORY[0x1E0CB37A0];
              v44 = v17;
              v45 = objc_msgSend(v17, "payload");
              if (objc_msgSend(v42, "operation") == 1)
                v46 = "encode";
              else
                v46 = "decode";
              v47 = objc_msgSend(v42, "transport");
              v48 = "Cellular";
              if (v47 == 1)
                v48 = "WiFi";
              v49 = (void *)objc_msgSend(v43, "stringWithFormat:", CFSTR("Payload=%u %s %s"), v45, v46, v48);
              if (objc_msgSend(v42, "hasPreferredFormat"))
                v50 = objc_msgSend(v42, "preferredFormat");
              else
                v50 = 0;
              v51 = 1;
              do
              {
                if ((objc_msgSend(v42, "formats") & v51) == 0)
                  goto LABEL_106;
                if ((int)v51 >= 0x10000)
                {
                  if ((int)v51 > 0xFFFFFF)
                  {
                    if ((int)v51 > 0xFFFFFFF)
                    {
                      if ((int)v51 > 0x3FFFFFFF)
                      {
                        if ((_DWORD)v51 == 0x40000000)
                        {
                          v52 = CFSTR("video_1920x1080_60");
                        }
                        else
                        {
                          if ((_DWORD)v51 != 0x7FFFFFFF)
                          {
LABEL_104:
                            v52 = (const __CFString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v52, v51);
                            goto LABEL_105;
                          }
                          v52 = CFSTR("video_SUPPORTED");
                        }
                      }
                      else if ((_DWORD)v51 == 0x10000000)
                      {
                        v52 = CFSTR("video_1440x1080_30");
                      }
                      else
                      {
                        if ((_DWORD)v51 != 0x20000000)
                          goto LABEL_104;
                        v52 = CFSTR("video_896_672_30");
                      }
                    }
                    else if ((int)v51 > 0x3FFFFFF)
                    {
                      if ((_DWORD)v51 == 0x4000000)
                      {
                        v52 = CFSTR("video_1024x576_30");
                      }
                      else
                      {
                        if ((_DWORD)v51 != 0x8000000)
                          goto LABEL_104;
                        v52 = CFSTR("video_1920x1080_30");
                      }
                    }
                    else if ((_DWORD)v51 == 0x1000000)
                    {
                      v52 = CFSTR("video_640x640_30");
                    }
                    else
                    {
                      if ((_DWORD)v51 != 0x2000000)
                        goto LABEL_104;
                      v52 = CFSTR("video_720x720_30");
                    }
                  }
                  else if ((int)v51 >= 0x100000)
                  {
                    if ((int)v51 >= 0x400000)
                    {
                      if ((_DWORD)v51 == 0x400000)
                      {
                        v52 = CFSTR("video_320x320_30");
                      }
                      else
                      {
                        if ((_DWORD)v51 != 0x800000)
                          goto LABEL_104;
                        v52 = CFSTR("video_480x480_30");
                      }
                    }
                    else if ((_DWORD)v51 == 0x100000)
                    {
                      v52 = CFSTR("video_192x192_15");
                    }
                    else
                    {
                      if ((_DWORD)v51 != 0x200000)
                        goto LABEL_104;
                      v52 = CFSTR("video_240x240_15");
                    }
                  }
                  else if ((int)v51 >= 0x40000)
                  {
                    if ((_DWORD)v51 == 0x40000)
                    {
                      v52 = CFSTR("video_1280x720_60_dec");
                    }
                    else
                    {
                      if ((_DWORD)v51 != 0x80000)
                        goto LABEL_104;
                      v52 = CFSTR("video_192x112_15");
                    }
                  }
                  else if ((_DWORD)v51 == 0x10000)
                  {
                    v52 = CFSTR("video_1280x720_15_dec");
                  }
                  else
                  {
                    if ((_DWORD)v51 != 0x20000)
                      goto LABEL_104;
                    v52 = CFSTR("video_1280x720_30_dec");
                  }
                }
                else if ((int)v51 > 255)
                {
                  if ((int)v51 > 4095)
                  {
                    if ((int)v51 >= 0x4000)
                    {
                      if ((_DWORD)v51 == 0x4000)
                      {
                        v52 = CFSTR("video_480x272_15");
                      }
                      else
                      {
                        if ((_DWORD)v51 != 0x8000)
                          goto LABEL_104;
                        v52 = CFSTR("video_480x272_30");
                      }
                    }
                    else if ((_DWORD)v51 == 4096)
                    {
                      v52 = CFSTR("video_1024x768_60");
                    }
                    else
                    {
                      if ((_DWORD)v51 != 0x2000)
                        goto LABEL_104;
                      v52 = CFSTR("video_1280x720_60");
                    }
                  }
                  else if ((int)v51 > 1023)
                  {
                    if ((_DWORD)v51 == 1024)
                    {
                      v52 = CFSTR("video_1280x720_15");
                    }
                    else
                    {
                      if ((_DWORD)v51 != 2048)
                        goto LABEL_104;
                      v52 = CFSTR("video_1280x720_30");
                    }
                  }
                  else if ((_DWORD)v51 == 256)
                  {
                    v52 = CFSTR("video_1024x768_15");
                  }
                  else
                  {
                    if ((_DWORD)v51 != 512)
                      goto LABEL_104;
                    v52 = CFSTR("video_1024x768_30");
                  }
                }
                else
                {
                  if ((int)v51 <= 15)
                  {
                    v52 = CFSTR("video_320x240_15");
                    switch((int)v51)
                    {
                      case 1:
                        goto LABEL_105;
                      case 2:
                        v52 = CFSTR("video_320x240_30");
                        break;
                      case 4:
                        v52 = CFSTR("video_480x368_15");
                        break;
                      case 8:
                        v52 = CFSTR("video_480x368_30");
                        break;
                      default:
                        goto LABEL_104;
                    }
                    goto LABEL_105;
                  }
                  if ((int)v51 > 63)
                  {
                    if ((_DWORD)v51 == 64)
                    {
                      v52 = CFSTR("video_848x480_15");
                    }
                    else
                    {
                      if ((_DWORD)v51 != 128)
                        goto LABEL_104;
                      v52 = CFSTR("video_848x480_30");
                    }
                  }
                  else if ((_DWORD)v51 == 16)
                  {
                    v52 = CFSTR("video_640x480_15");
                  }
                  else
                  {
                    if ((_DWORD)v51 != 32)
                      goto LABEL_104;
                    v52 = CFSTR("video_640x480_30");
                  }
                }
LABEL_105:
                -[VCMediaNegotiationBlobVideoSettings prepareFormatString:format:formatIndex:preferredFormat:](self, "prepareFormatString:format:formatIndex:preferredFormat:", v49, v52, v51, v50);
LABEL_106:
                v53 = (v51 & 0x3FFFFFFF) == 0;
                v51 = (2 * v51);
              }
              while (!v53);
              if ((objc_msgSend(v42, "hasPreferredFormatExt1") & 1) != 0)
                v54 = objc_msgSend(v42, "preferredFormatExt1");
              else
                v54 = 0;
              v55 = 1;
              do
              {
                if ((objc_msgSend(v42, "formatsExt1") & v55) != 0)
                {
                  if ((int)v55 > 15)
                  {
                    switch((_DWORD)v55)
                    {
                      case 0x10:
                        v56 = CFSTR("video_896x672_15");
                        break;
                      case 0x20:
                        v56 = CFSTR("video_1920x1440_60");
                        break;
                      case 0x3F:
                        v56 = CFSTR("video_SUPPORTED");
                        break;
                      default:
LABEL_124:
                        v56 = (const __CFString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v56, v55);
                        break;
                    }
                  }
                  else
                  {
                    v56 = CFSTR("video_896x672_60");
                    switch((int)v55)
                    {
                      case 1:
                        break;
                      case 2:
                        v56 = CFSTR("video_1664x1248_30");
                        break;
                      case 4:
                        v56 = CFSTR("video_1664x1248_60");
                        break;
                      case 8:
                        v56 = CFSTR("video_1024x576_15");
                        break;
                      default:
                        goto LABEL_124;
                    }
                  }
                  -[VCMediaNegotiationBlobVideoSettings prepareFormatString:format:formatIndex:preferredFormat:](self, "prepareFormatString:format:formatIndex:preferredFormat:", v49, v56, v55, v54);
                }
                v53 = (v55 & 0x1F) == 0;
                v55 = (2 * v55);
              }
              while (!v53);
              v57 = objc_msgSend((id)objc_msgSend(v49, "stringByTrimmingCharactersInSet:", objc_msgSend(MEMORY[0x1E0CB3500], "characterSetWithCharactersInString:", CFSTR(","))), "UTF8String");
              if ((int)VRTraceGetErrorLogLevelForModule() > 6)
              {
                v64 = VRTraceErrorLogLevelToCSTR();
                v65 = *MEMORY[0x1E0CF2758];
                if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 136315906;
                  v80 = v64;
                  v81 = 2080;
                  v82 = "-[VCMediaNegotiationBlobVideoSettings(VideoRules) printVideoWithLogFile:]";
                  v83 = 1024;
                  v84 = 795;
                  v85 = 2080;
                  *(_QWORD *)v86 = v57;
                  _os_log_impl(&dword_1D8A54000, v65, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Media Blob -     %s", buf, 0x26u);
                }
              }
              VRLogfilePrintWithTimestamp((uint64_t)a3, "Media Blob -     %s\n", v58, v59, v60, v61, v62, v63, v57);
              v17 = v44;
            }
            v73 = objc_msgSend(v70, "countByEnumeratingWithState:objects:count:", &v75, v74, 16);
          }
          while (v73);
        }
        v16 = v69 + 1;
      }
      while (v69 + 1 != v68);
      v68 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v88, v87, 16);
    }
    while (v68);
  }
}

- (void)printScreenWithLogFile:(void *)a3
{
  int ErrorLogLevelForModule;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSObject **v10;
  uint64_t v11;
  NSObject *v12;
  unsigned int rtpSSRC;
  _BOOL4 allowRTCPFB;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  NSObject *v18;
  uint64_t v19;
  char v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  id v27;
  uint64_t v28;
  NSObject *v29;
  int v30;
  uint64_t v31;
  char v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t i;
  void *v40;
  void *v41;
  uint64_t v42;
  const char *v43;
  int v44;
  const char *v45;
  void *v46;
  int v47;
  uint64_t v48;
  __CFString *v49;
  void *v50;
  BOOL v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  NSObject *v60;
  NSMutableArray *obj;
  uint64_t v62;
  uint64_t v64;
  uint64_t v65;
  id v66;
  uint64_t v67;
  void *v68;
  uint64_t v70;
  _BYTE v71[128];
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  uint8_t buf[4];
  uint64_t v77;
  __int16 v78;
  const char *v79;
  __int16 v80;
  int v81;
  __int16 v82;
  _BYTE v83[14];
  _BYTE v84[128];
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  uint64_t v89;

  v89 = *MEMORY[0x1E0C80C00];
  ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
  v10 = (NSObject **)MEMORY[0x1E0CF2758];
  if (ErrorLogLevelForModule > 6)
  {
    v11 = VRTraceErrorLogLevelToCSTR();
    v12 = *v10;
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      rtpSSRC = self->_rtpSSRC;
      allowRTCPFB = self->_allowRTCPFB;
      *(_DWORD *)buf = 136316162;
      v77 = v11;
      v78 = 2080;
      v79 = "-[VCMediaNegotiationBlobVideoSettings(VideoRules) printScreenWithLogFile:]";
      v80 = 1024;
      v81 = 802;
      v82 = 1024;
      *(_DWORD *)v83 = rtpSSRC;
      *(_WORD *)&v83[4] = 1024;
      *(_DWORD *)&v83[6] = allowRTCPFB;
      _os_log_impl(&dword_1D8A54000, v12, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Media Blob - Screen Settings: SSRC=%x allowRTCPFB=%u", buf, 0x28u);
    }
  }
  VRLogfilePrintWithTimestamp((uint64_t)a3, "Media Blob - Screen Settings: SSRC=%x allowRTCPFB=%u\n", v4, v5, v6, v7, v8, v9, self->_rtpSSRC);
  v87 = 0u;
  v88 = 0u;
  v85 = 0u;
  v86 = 0u;
  obj = self->_videoPayloadCollections;
  v64 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v85, v84, 16);
  if (v64)
  {
    v62 = *(_QWORD *)v86;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v86 != v62)
          objc_enumerationMutation(obj);
        v16 = *(void **)(*((_QWORD *)&v85 + 1) + 8 * v15);
        if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
        {
          v17 = VRTraceErrorLogLevelToCSTR();
          v18 = *MEMORY[0x1E0CF2758];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
          {
            v19 = objc_msgSend((id)objc_msgSend(v16, "featureString"), "UTF8String");
            *(_DWORD *)buf = 136315906;
            v77 = v17;
            v78 = 2080;
            v79 = "-[VCMediaNegotiationBlobVideoSettings(VideoRules) printScreenWithLogFile:]";
            v80 = 1024;
            v81 = 806;
            v82 = 2080;
            *(_QWORD *)v83 = v19;
            _os_log_impl(&dword_1D8A54000, v18, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Media Blob -     Format string=%s", buf, 0x26u);
          }
        }
        v65 = v15;
        v20 = objc_msgSend((id)objc_msgSend(v16, "featureString"), "UTF8String");
        VRLogfilePrintWithTimestamp((uint64_t)a3, "Media Blob -     Format string=%s\n", v21, v22, v23, v24, v25, v26, v20);
        v27 = -[VCMediaNegotiationBlobVideoSettings parameterSetStringFromPayloadSettings:](self, "parameterSetStringFromPayloadSettings:", v16);
        if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
        {
          v28 = VRTraceErrorLogLevelToCSTR();
          v29 = *MEMORY[0x1E0CF2758];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
          {
            v30 = objc_msgSend(v16, "payload");
            v31 = objc_msgSend(v27, "UTF8String");
            *(_DWORD *)buf = 136316162;
            v77 = v28;
            v78 = 2080;
            v79 = "-[VCMediaNegotiationBlobVideoSettings(VideoRules) printScreenWithLogFile:]";
            v80 = 1024;
            v81 = 810;
            v82 = 1024;
            *(_DWORD *)v83 = v30;
            *(_WORD *)&v83[4] = 2080;
            *(_QWORD *)&v83[6] = v31;
            _os_log_impl(&dword_1D8A54000, v29, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Media Blob -     Payload=%u parameter set: %s", buf, 0x2Cu);
          }
        }
        v32 = objc_msgSend(v16, "payload");
        objc_msgSend(v27, "UTF8String");
        VRLogfilePrintWithTimestamp((uint64_t)a3, "Media Blob -     Payload=%u parameter set: %s\n", v33, v34, v35, v36, v37, v38, v32);
        v74 = 0u;
        v75 = 0u;
        v72 = 0u;
        v73 = 0u;
        v66 = (id)objc_msgSend(v16, "videoRuleCollections");
        v70 = objc_msgSend(v66, "countByEnumeratingWithState:objects:count:", &v72, v71, 16);
        if (v70)
        {
          v67 = *(_QWORD *)v73;
          v68 = v16;
          do
          {
            for (i = 0; i != v70; ++i)
            {
              if (*(_QWORD *)v73 != v67)
                objc_enumerationMutation(v66);
              v40 = *(void **)(*((_QWORD *)&v72 + 1) + 8 * i);
              v41 = (void *)MEMORY[0x1E0CB37A0];
              v42 = objc_msgSend(v16, "payload");
              if (objc_msgSend(v40, "operation") == 1)
                v43 = "encode";
              else
                v43 = "decode";
              v44 = objc_msgSend(v40, "transport");
              v45 = "Cellular";
              if (v44 == 1)
                v45 = "WiFi";
              v46 = (void *)objc_msgSend(v41, "stringWithFormat:", CFSTR("Payload=%u %s %s"), v42, v43, v45);
              if (objc_msgSend(v40, "hasPreferredFormat"))
                v47 = objc_msgSend(v40, "preferredFormat");
              else
                v47 = 0;
              v48 = 1;
              do
              {
                if ((objc_msgSend(v40, "formats") & v48) == 0)
                  goto LABEL_85;
                if ((int)v48 > 4095)
                {
                  if ((int)v48 >= 0x40000)
                  {
                    if ((int)v48 >= 0x200000)
                    {
                      switch((_DWORD)v48)
                      {
                        case 0x200000:
                          v49 = CFSTR("screen_3072x1728_60");
                          break;
                        case 0x400000:
                          v49 = CFSTR("screen_3840x2160_60");
                          break;
                        case 0x7FFFFF:
                          v49 = CFSTR("screen_SUPPORTED");
                          break;
                        default:
                          goto LABEL_67;
                      }
                    }
                    else
                    {
                      switch((_DWORD)v48)
                      {
                        case 0x40000:
                          v49 = CFSTR("screen_2732x2048_60");
                          break;
                        case 0x80000:
                          v49 = CFSTR("screen_2388x1668_60");
                          break;
                        case 0x100000:
                          v49 = CFSTR("screen_2224x1668_60");
                          break;
                        default:
                          goto LABEL_67;
                      }
                    }
                  }
                  else if ((int)v48 >= 0x8000)
                  {
                    switch((_DWORD)v48)
                    {
                      case 0x8000:
                        v49 = CFSTR("screen_1280x720_60");
                        break;
                      case 0x10000:
                        v49 = CFSTR("screen_1920x896_30");
                        break;
                      case 0x20000:
                        v49 = CFSTR("screen_1920x896_60");
                        break;
                      default:
                        goto LABEL_67;
                    }
                  }
                  else
                  {
                    switch((_DWORD)v48)
                    {
                      case 0x1000:
                        v49 = CFSTR("screen_2048x1536_30");
                        break;
                      case 0x2000:
                        v49 = CFSTR("screen_2048x1536_60");
                        break;
                      case 0x4000:
                        v49 = CFSTR("screen_1280x720_30");
                        break;
                      default:
LABEL_67:
                        v49 = (__CFString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v48);
                        break;
                    }
                  }
                }
                else
                {
                  if ((int)v48 <= 63)
                  {
                    v49 = CFSTR("screen_1024x768_30");
                    switch((int)v48)
                    {
                      case 1:
                        goto LABEL_81;
                      case 2:
                        v49 = CFSTR("screen_1024x768_60");
                        goto LABEL_81;
                      case 3:
                      case 5:
                      case 6:
                      case 7:
                        goto LABEL_67;
                      case 4:
                        v49 = CFSTR("screen_1136x640_30");
                        goto LABEL_81;
                      case 8:
                        v49 = CFSTR("screen_1136x640_60");
                        goto LABEL_81;
                      default:
                        if ((_DWORD)v48 == 16)
                        {
                          v49 = CFSTR("screen_1334x750_30");
                        }
                        else
                        {
                          if ((_DWORD)v48 != 32)
                            goto LABEL_67;
                          v49 = CFSTR("screen_1334x750_60");
                        }
                        break;
                    }
                    goto LABEL_81;
                  }
                  if ((int)v48 > 511)
                  {
                    switch((_DWORD)v48)
                    {
                      case 0x200:
                        v49 = CFSTR("screen_1920x1080_60");
                        break;
                      case 0x400:
                        v49 = CFSTR("screen_2208x1242_30");
                        break;
                      case 0x800:
                        v49 = CFSTR("screen_2208x1242_60");
                        break;
                      default:
                        goto LABEL_67;
                    }
                  }
                  else
                  {
                    switch((_DWORD)v48)
                    {
                      case 0x40:
                        v49 = CFSTR("screen_1664x1248_30");
                        break;
                      case 0x80:
                        v49 = CFSTR("screen_1664x1248_60");
                        break;
                      case 0x100:
                        v49 = CFSTR("screen_1920x1080_30");
                        break;
                      default:
                        goto LABEL_67;
                    }
                  }
                }
LABEL_81:
                v50 = (void *)-[__CFString componentsSeparatedByString:](v49, "componentsSeparatedByString:", CFSTR("_"));
                if (objc_msgSend(v50, "count") == 3)
                {
                  objc_msgSend(v46, "appendFormat:", CFSTR(" %@@%@fps"), objc_msgSend(v50, "objectAtIndex:", 1), objc_msgSend(v50, "objectAtIndex:", 2));
                  if (v47 == (_DWORD)v48)
                    objc_msgSend(v46, "appendString:", CFSTR(" (preferred)"));
                  objc_msgSend(v46, "appendString:", CFSTR(","));
                }
LABEL_85:
                v51 = (v48 & 0x3FFFFF) == 0;
                v48 = (2 * v48);
              }
              while (!v51);
              v52 = objc_msgSend((id)objc_msgSend(v46, "stringByTrimmingCharactersInSet:", objc_msgSend(MEMORY[0x1E0CB3500], "characterSetWithCharactersInString:", CFSTR(","))), "UTF8String");
              if ((int)VRTraceGetErrorLogLevelForModule() > 6)
              {
                v59 = VRTraceErrorLogLevelToCSTR();
                v60 = *MEMORY[0x1E0CF2758];
                if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 136315906;
                  v77 = v59;
                  v78 = 2080;
                  v79 = "-[VCMediaNegotiationBlobVideoSettings(VideoRules) printScreenWithLogFile:]";
                  v80 = 1024;
                  v81 = 835;
                  v82 = 2080;
                  *(_QWORD *)v83 = v52;
                  _os_log_impl(&dword_1D8A54000, v60, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Media Blob -     %s", buf, 0x26u);
                }
              }
              VRLogfilePrintWithTimestamp((uint64_t)a3, "Media Blob -     %s\n", v53, v54, v55, v56, v57, v58, v52);
              v16 = v68;
            }
            v70 = objc_msgSend(v66, "countByEnumeratingWithState:objects:count:", &v72, v71, 16);
          }
          while (v70);
        }
        v15 = v65 + 1;
      }
      while (v65 + 1 != v64);
      v64 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v85, v84, 16);
    }
    while (v64);
  }
}

@end
