@implementation VCMediaNegotiationBlobMomentsSettings

- (void)setSupportedVideoCodecs:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_supportedVideoCodecs = a3;
}

- (void)setHasSupportedVideoCodecs:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasSupportedVideoCodecs
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setSupportedImageTypes:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_supportedImageTypes = a3;
}

- (void)setHasSupportedImageTypes:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasSupportedImageTypes
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setMultiwayCapabilities:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_multiwayCapabilities = a3;
}

- (void)setHasMultiwayCapabilities:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasMultiwayCapabilities
{
  return *(_BYTE *)&self->_has & 1;
}

- (id)description
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v3.receiver = self;
  v3.super_class = (Class)VCMediaNegotiationBlobMomentsSettings;
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ %@"), -[VCMediaNegotiationBlobMomentsSettings description](&v3, sel_description), -[VCMediaNegotiationBlobMomentsSettings dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  void *v3;
  char has;

  v3 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_capabilities), CFSTR("capabilities"));
  has = (char)self->_has;
  if ((has & 4) == 0)
  {
    if ((*(_BYTE *)&self->_has & 2) == 0)
      goto LABEL_3;
LABEL_7:
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_supportedImageTypes), CFSTR("supportedImageTypes"));
    if ((*(_BYTE *)&self->_has & 1) == 0)
      return v3;
    goto LABEL_4;
  }
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_supportedVideoCodecs), CFSTR("supportedVideoCodecs"));
  has = (char)self->_has;
  if ((has & 2) != 0)
    goto LABEL_7;
LABEL_3:
  if ((has & 1) != 0)
LABEL_4:
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_multiwayCapabilities), CFSTR("multiwayCapabilities"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return VCMediaNegotiationBlobMomentsSettingsReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has;

  PBDataWriterWriteUint32Field();
  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    PBDataWriterWriteUint32Field();
    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 1) == 0)
        return;
LABEL_7:
      PBDataWriterWriteUint32Field();
      return;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint32Field();
  if ((*(_BYTE *)&self->_has & 1) != 0)
    goto LABEL_7;
}

- (void)copyTo:(id)a3
{
  char has;

  *((_DWORD *)a3 + 2) = self->_capabilities;
  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *((_DWORD *)a3 + 5) = self->_supportedVideoCodecs;
    *((_BYTE *)a3 + 24) |= 4u;
    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 1) == 0)
        return;
LABEL_7:
      *((_DWORD *)a3 + 3) = self->_multiwayCapabilities;
      *((_BYTE *)a3 + 24) |= 1u;
      return;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)a3 + 4) = self->_supportedImageTypes;
  *((_BYTE *)a3 + 24) |= 2u;
  if ((*(_BYTE *)&self->_has & 1) != 0)
    goto LABEL_7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;
  char has;

  result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *((_DWORD *)result + 2) = self->_capabilities;
  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *((_DWORD *)result + 5) = self->_supportedVideoCodecs;
    *((_BYTE *)result + 24) |= 4u;
    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 1) == 0)
        return result;
      goto LABEL_4;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)result + 4) = self->_supportedImageTypes;
  *((_BYTE *)result + 24) |= 2u;
  if ((*(_BYTE *)&self->_has & 1) == 0)
    return result;
LABEL_4:
  *((_DWORD *)result + 3) = self->_multiwayCapabilities;
  *((_BYTE *)result + 24) |= 1u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  int v5;

  v5 = objc_msgSend(a3, "isMemberOfClass:", objc_opt_class());
  if (v5)
  {
    if (self->_capabilities != *((_DWORD *)a3 + 2))
    {
LABEL_17:
      LOBYTE(v5) = 0;
      return v5;
    }
    if ((*(_BYTE *)&self->_has & 4) != 0)
    {
      if ((*((_BYTE *)a3 + 24) & 4) == 0 || self->_supportedVideoCodecs != *((_DWORD *)a3 + 5))
        goto LABEL_17;
    }
    else if ((*((_BYTE *)a3 + 24) & 4) != 0)
    {
      goto LABEL_17;
    }
    if ((*(_BYTE *)&self->_has & 2) != 0)
    {
      if ((*((_BYTE *)a3 + 24) & 2) == 0 || self->_supportedImageTypes != *((_DWORD *)a3 + 4))
        goto LABEL_17;
    }
    else if ((*((_BYTE *)a3 + 24) & 2) != 0)
    {
      goto LABEL_17;
    }
    LOBYTE(v5) = (*((_BYTE *)a3 + 24) & 1) == 0;
    if ((*(_BYTE *)&self->_has & 1) != 0)
    {
      if ((*((_BYTE *)a3 + 24) & 1) == 0 || self->_multiwayCapabilities != *((_DWORD *)a3 + 3))
        goto LABEL_17;
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

  if ((*(_BYTE *)&self->_has & 4) != 0)
    v2 = 2654435761 * self->_supportedVideoCodecs;
  else
    v2 = 0;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    v3 = 2654435761 * self->_supportedImageTypes;
    if ((*(_BYTE *)&self->_has & 1) != 0)
      goto LABEL_6;
LABEL_8:
    v4 = 0;
    return v2 ^ v3 ^ v4 ^ (2654435761 * self->_capabilities);
  }
  v3 = 0;
  if ((*(_BYTE *)&self->_has & 1) == 0)
    goto LABEL_8;
LABEL_6:
  v4 = 2654435761 * self->_multiwayCapabilities;
  return v2 ^ v3 ^ v4 ^ (2654435761 * self->_capabilities);
}

- (void)mergeFrom:(id)a3
{
  char v3;

  self->_capabilities = *((_DWORD *)a3 + 2);
  v3 = *((_BYTE *)a3 + 24);
  if ((v3 & 4) != 0)
  {
    self->_supportedVideoCodecs = *((_DWORD *)a3 + 5);
    *(_BYTE *)&self->_has |= 4u;
    v3 = *((_BYTE *)a3 + 24);
    if ((v3 & 2) == 0)
    {
LABEL_3:
      if ((v3 & 1) == 0)
        return;
LABEL_7:
      self->_multiwayCapabilities = *((_DWORD *)a3 + 3);
      *(_BYTE *)&self->_has |= 1u;
      return;
    }
  }
  else if ((*((_BYTE *)a3 + 24) & 2) == 0)
  {
    goto LABEL_3;
  }
  self->_supportedImageTypes = *((_DWORD *)a3 + 4);
  *(_BYTE *)&self->_has |= 2u;
  if ((*((_BYTE *)a3 + 24) & 1) != 0)
    goto LABEL_7;
}

- (unsigned)capabilities
{
  return self->_capabilities;
}

- (void)setCapabilities:(unsigned int)a3
{
  self->_capabilities = a3;
}

- (unsigned)supportedVideoCodecs
{
  return self->_supportedVideoCodecs;
}

- (unsigned)supportedImageTypes
{
  return self->_supportedImageTypes;
}

- (unsigned)multiwayCapabilities
{
  return self->_multiwayCapabilities;
}

+ (unsigned)avcMomentsCapabilitiesForMultiwayMomentsCapabilities:(int)a3
{
  if ((a3 & 4) != 0)
    return 7;
  else
    return (a3 >> 1) & 1;
}

- (VCMediaNegotiationBlobMomentsSettings)initWithVideoCodecs:(id)a3 imageTypes:(id)a4 capabilities:(unsigned __int8)a5 multiwayCapabilities:(unsigned __int8)a6
{
  uint64_t v6;
  uint64_t v7;
  VCMediaNegotiationBlobMomentsSettings *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  int v15;
  int v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t j;
  int v21;
  int v22;
  objc_super v24;
  _BYTE v25[128];
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  uint64_t v35;

  v6 = a6;
  v7 = a5;
  v35 = *MEMORY[0x1E0C80C00];
  v24.receiver = self;
  v24.super_class = (Class)VCMediaNegotiationBlobMomentsSettings;
  v10 = -[VCMediaNegotiationBlobMomentsSettings init](&v24, sel_init);
  if (v10)
  {
    v33 = 0u;
    v34 = 0u;
    v31 = 0u;
    v32 = 0u;
    v11 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v31, v30, 16);
    if (!v11)
      goto LABEL_14;
    v12 = v11;
    v13 = *(_QWORD *)v32;
    while (1)
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v32 != v13)
          objc_enumerationMutation(a3);
        v15 = objc_msgSend(*(id *)(*((_QWORD *)&v31 + 1) + 8 * i), "intValue");
        if (v15 == 123)
        {
          v16 = 1;
        }
        else
        {
          if (v15 != 100)
            continue;
          v16 = 2;
        }
        v10->_supportedVideoCodecs |= v16;
        *(_BYTE *)&v10->_has |= 4u;
      }
      v12 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v31, v30, 16);
      if (!v12)
      {
LABEL_14:
        v28 = 0u;
        v29 = 0u;
        v26 = 0u;
        v27 = 0u;
        v17 = objc_msgSend(a4, "countByEnumeratingWithState:objects:count:", &v26, v25, 16);
        if (!v17)
          goto LABEL_26;
        v18 = v17;
        v19 = *(_QWORD *)v27;
        while (1)
        {
          for (j = 0; j != v18; ++j)
          {
            if (*(_QWORD *)v27 != v19)
              objc_enumerationMutation(a4);
            v21 = objc_msgSend(*(id *)(*((_QWORD *)&v26 + 1) + 8 * j), "intValue");
            if (v21)
            {
              if (v21 != 1)
                continue;
              v22 = 2;
            }
            else
            {
              v22 = 1;
            }
            v10->_supportedImageTypes |= v22;
            *(_BYTE *)&v10->_has |= 2u;
          }
          v18 = objc_msgSend(a4, "countByEnumeratingWithState:objects:count:", &v26, v25, 16);
          if (!v18)
          {
LABEL_26:
            -[VCMediaNegotiationBlobMomentsSettings setCapabilities:](v10, "setCapabilities:", +[VCMediaNegotiationBlobMomentsSettings capabilitiesBitmapWithCapabilities:](VCMediaNegotiationBlobMomentsSettings, "capabilitiesBitmapWithCapabilities:", v7));
            -[VCMediaNegotiationBlobMomentsSettings setMultiwayCapabilities:](v10, "setMultiwayCapabilities:", +[VCMediaNegotiationBlobMomentsSettings capabilitiesBitmapWithCapabilities:](VCMediaNegotiationBlobMomentsSettings, "capabilitiesBitmapWithCapabilities:", v6));
            return v10;
          }
        }
      }
    }
  }
  return v10;
}

- (id)newVideoCodecSet
{
  id v3;
  int v4;
  int v5;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v4 = 1;
  while (1)
  {
    v5 = v4;
    if ((self->_supportedVideoCodecs & v4) != 0)
    {
      if (v4 == 1)
      {
        objc_msgSend(v3, "addObject:", &unk_1E9EF6908);
        goto LABEL_7;
      }
      if (v4 == 2)
        break;
    }
LABEL_7:
    v4 = 2 * v5;
    if ((v5 & 1) == 0)
      return v3;
  }
  objc_msgSend(v3, "addObject:", &unk_1E9EF6920);
  return v3;
}

- (id)newImageTypeSet
{
  id v3;
  int v4;
  int v5;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v4 = 1;
  while (1)
  {
    v5 = v4;
    if ((self->_supportedImageTypes & v4) != 0)
    {
      if (v4 == 1)
      {
        objc_msgSend(v3, "addObject:", &unk_1E9EF6938);
        goto LABEL_7;
      }
      if (v4 == 2)
        break;
    }
LABEL_7:
    v4 = 2 * v5;
    if ((v5 & 1) == 0)
      return v3;
  }
  objc_msgSend(v3, "addObject:", &unk_1E9EF6950);
  return v3;
}

+ (unsigned)capabilitiesBitmapWithCapabilities:(unsigned __int8)a3
{
  unsigned int v3;

  if (a3 == 1)
    v3 = 2;
  else
    v3 = 1;
  if (a3 == 2)
    return 4;
  else
    return v3;
}

@end
