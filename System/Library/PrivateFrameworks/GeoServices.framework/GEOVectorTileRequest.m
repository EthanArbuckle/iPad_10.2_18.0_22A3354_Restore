@implementation GEOVectorTileRequest

- (GEOVectorTileRequest)init
{
  GEOVectorTileRequest *v2;
  GEOVectorTileRequest *v3;
  GEOVectorTileRequest *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOVectorTileRequest;
  v2 = -[GEOVectorTileRequest init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOVectorTileRequest)initWithData:(id)a3
{
  GEOVectorTileRequest *v3;
  GEOVectorTileRequest *v4;
  GEOVectorTileRequest *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOVectorTileRequest;
  v3 = -[GEOVectorTileRequest initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (unsigned)x
{
  return self->_x;
}

- (void)setX:(unsigned int)a3
{
  *(_DWORD *)&self->_flags |= 0x10080u;
  self->_x = a3;
}

- (void)setHasX:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 65664;
  else
    v3 = 0x10000;
  self->_flags = ($8D903536FF5EFC81363F64804503A8CD)(*(_DWORD *)&self->_flags & 0xFFFFFF7F | v3);
}

- (BOOL)hasX
{
  return *(_BYTE *)&self->_flags >> 7;
}

- (unsigned)y
{
  return self->_y;
}

- (void)setY:(unsigned int)a3
{
  *(_DWORD *)&self->_flags |= 0x10100u;
  self->_y = a3;
}

- (void)setHasY:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 65792;
  else
    v3 = 0x10000;
  self->_flags = ($8D903536FF5EFC81363F64804503A8CD)(*(_DWORD *)&self->_flags & 0xFFFFFEFF | v3);
}

- (BOOL)hasY
{
  return *((_BYTE *)&self->_flags + 1) & 1;
}

- (unsigned)z
{
  return self->_z;
}

- (void)setZ:(unsigned int)a3
{
  *(_DWORD *)&self->_flags |= 0x10200u;
  self->_z = a3;
}

- (void)setHasZ:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 66048;
  else
    v3 = 0x10000;
  self->_flags = ($8D903536FF5EFC81363F64804503A8CD)(*(_DWORD *)&self->_flags & 0xFFFFFDFF | v3);
}

- (BOOL)hasZ
{
  return (*((unsigned __int8 *)&self->_flags + 1) >> 1) & 1;
}

- (unsigned)version
{
  return self->_version;
}

- (void)setVersion:(unsigned int)a3
{
  *(_DWORD *)&self->_flags |= 0x10040u;
  self->_version = a3;
}

- (void)setHasVersion:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 65600;
  else
    v3 = 0x10000;
  self->_flags = ($8D903536FF5EFC81363F64804503A8CD)(*(_DWORD *)&self->_flags & 0xFFFFFFBF | v3);
}

- (BOOL)hasVersion
{
  return (*(_BYTE *)&self->_flags >> 6) & 1;
}

- (unsigned)style
{
  return self->_style;
}

- (void)setStyle:(unsigned int)a3
{
  *(_DWORD *)&self->_flags |= 0x10020u;
  self->_style = a3;
}

- (void)setHasStyle:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 65568;
  else
    v3 = 0x10000;
  self->_flags = ($8D903536FF5EFC81363F64804503A8CD)(*(_DWORD *)&self->_flags & 0xFFFFFFDF | v3);
}

- (BOOL)hasStyle
{
  return (*(_BYTE *)&self->_flags >> 5) & 1;
}

- (void)_readLanguageCode
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    if ((*(_BYTE *)(a1 + 101) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOVectorTileRequestReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readLanguageCode_tags_0);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (BOOL)hasLanguageCode
{
  -[GEOVectorTileRequest _readLanguageCode]((uint64_t)self);
  return self->_languageCode != 0;
}

- (NSString)languageCode
{
  -[GEOVectorTileRequest _readLanguageCode]((uint64_t)self);
  return self->_languageCode;
}

- (void)setLanguageCode:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x18000u;
  objc_storeStrong((id *)&self->_languageCode, a3);
}

- (BOOL)preflight
{
  return self->_preflight;
}

- (void)setPreflight:(BOOL)a3
{
  *(_DWORD *)&self->_flags |= 0x10400u;
  self->_preflight = a3;
}

- (void)setHasPreflight:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 66560;
  else
    v3 = 0x10000;
  self->_flags = ($8D903536FF5EFC81363F64804503A8CD)(*(_DWORD *)&self->_flags & 0xFFFFFBFF | v3);
}

- (BOOL)hasPreflight
{
  return (*((unsigned __int8 *)&self->_flags + 1) >> 2) & 1;
}

- (unint64_t)lineId
{
  return self->_lineId;
}

- (void)setLineId:(unint64_t)a3
{
  *(_DWORD *)&self->_flags |= 0x10001u;
  self->_lineId = a3;
}

- (void)setHasLineId:(BOOL)a3
{
  self->_flags = ($8D903536FF5EFC81363F64804503A8CD)(*(_DWORD *)&self->_flags & 0xFFFEFFFE | a3 | 0x10000);
}

- (BOOL)hasLineId
{
  return *(_DWORD *)&self->_flags & 1;
}

- (unsigned)size
{
  return self->_size;
}

- (void)setSize:(unsigned int)a3
{
  *(_DWORD *)&self->_flags |= 0x10010u;
  self->_size = a3;
}

- (void)setHasSize:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 65552;
  else
    v3 = 0x10000;
  self->_flags = ($8D903536FF5EFC81363F64804503A8CD)(*(_DWORD *)&self->_flags & 0xFFFFFFEF | v3);
}

- (BOOL)hasSize
{
  return (*(_BYTE *)&self->_flags >> 4) & 1;
}

- (unsigned)scale
{
  return self->_scale;
}

- (void)setScale:(unsigned int)a3
{
  *(_DWORD *)&self->_flags |= 0x10008u;
  self->_scale = a3;
}

- (void)setHasScale:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 65544;
  else
    v3 = 0x10000;
  self->_flags = ($8D903536FF5EFC81363F64804503A8CD)(*(_DWORD *)&self->_flags & 0xFFFFFFF7 | v3);
}

- (BOOL)hasScale
{
  return (*(_BYTE *)&self->_flags >> 3) & 1;
}

- (void)_readAccessKey
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    if ((*(_BYTE *)(a1 + 101) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOVectorTileRequestReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readAccessKey_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (BOOL)hasAccessKey
{
  -[GEOVectorTileRequest _readAccessKey]((uint64_t)self);
  return self->_accessKey != 0;
}

- (NSString)accessKey
{
  -[GEOVectorTileRequest _readAccessKey]((uint64_t)self);
  return self->_accessKey;
}

- (void)setAccessKey:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x12000u;
  objc_storeStrong((id *)&self->_accessKey, a3);
}

- (float)longitudeHint
{
  return self->_longitudeHint;
}

- (void)setLongitudeHint:(float)a3
{
  *(_DWORD *)&self->_flags |= 0x10004u;
  self->_longitudeHint = a3;
}

- (void)setHasLongitudeHint:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 65540;
  else
    v3 = 0x10000;
  self->_flags = ($8D903536FF5EFC81363F64804503A8CD)(*(_DWORD *)&self->_flags & 0xFFFFFFFB | v3);
}

- (BOOL)hasLongitudeHint
{
  return (*(_BYTE *)&self->_flags >> 2) & 1;
}

- (float)latitudeHint
{
  return self->_latitudeHint;
}

- (void)setLatitudeHint:(float)a3
{
  *(_DWORD *)&self->_flags |= 0x10002u;
  self->_latitudeHint = a3;
}

- (void)setHasLatitudeHint:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 65538;
  else
    v3 = 0x10000;
  self->_flags = ($8D903536FF5EFC81363F64804503A8CD)(*(_DWORD *)&self->_flags & 0xFFFFFFFD | v3);
}

- (BOOL)hasLatitudeHint
{
  return (*(_BYTE *)&self->_flags >> 1) & 1;
}

- (void)_readCountryCode
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    if ((*(_BYTE *)(a1 + 101) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOVectorTileRequestReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readCountryCode_tags_2);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (BOOL)hasCountryCode
{
  -[GEOVectorTileRequest _readCountryCode]((uint64_t)self);
  return self->_countryCode != 0;
}

- (NSString)countryCode
{
  -[GEOVectorTileRequest _readCountryCode]((uint64_t)self);
  return self->_countryCode;
}

- (void)setCountryCode:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x14000u;
  objc_storeStrong((id *)&self->_countryCode, a3);
}

- (BOOL)venuesPreflight
{
  return self->_venuesPreflight;
}

- (void)setVenuesPreflight:(BOOL)a3
{
  *(_DWORD *)&self->_flags |= 0x10800u;
  self->_venuesPreflight = a3;
}

- (void)setHasVenuesPreflight:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 67584;
  else
    v3 = 0x10000;
  self->_flags = ($8D903536FF5EFC81363F64804503A8CD)(*(_DWORD *)&self->_flags & 0xFFFFF7FF | v3);
}

- (BOOL)hasVenuesPreflight
{
  return (*((unsigned __int8 *)&self->_flags + 1) >> 3) & 1;
}

- (BOOL)vloc
{
  return self->_vloc;
}

- (void)setVloc:(BOOL)a3
{
  *(_DWORD *)&self->_flags |= 0x11000u;
  self->_vloc = a3;
}

- (void)setHasVloc:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 69632;
  else
    v3 = 0x10000;
  self->_flags = ($8D903536FF5EFC81363F64804503A8CD)(*(_DWORD *)&self->_flags & 0xFFFFEFFF | v3);
}

- (BOOL)hasVloc
{
  return (*((unsigned __int8 *)&self->_flags + 1) >> 4) & 1;
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
  v8.super_class = (Class)GEOVectorTileRequest;
  -[GEOVectorTileRequest description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOVectorTileRequest dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOVectorTileRequest _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  const __CFString *v9;
  int v10;
  void *v11;
  void *v12;
  const __CFString *v13;
  double v14;
  int v15;
  void *v16;
  const __CFString *v17;
  void *v18;
  const __CFString *v19;
  void *v20;
  const __CFString *v21;
  int v22;
  void *v23;
  const __CFString *v24;
  void *v25;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  const __CFString *v32;
  void *v33;

  if (!a1)
  {
    v4 = 0;
    return v4;
  }
  objc_msgSend((id)a1, "readAll:", 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(_DWORD *)(a1 + 100);
  if ((v5 & 0x80) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 84));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v6, CFSTR("x"));

    v5 = *(_DWORD *)(a1 + 100);
  }
  if ((v5 & 0x100) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 88));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v27, CFSTR("y"));

    v5 = *(_DWORD *)(a1 + 100);
    if ((v5 & 0x200) == 0)
    {
LABEL_6:
      if ((v5 & 0x40) == 0)
        goto LABEL_7;
      goto LABEL_49;
    }
  }
  else if ((v5 & 0x200) == 0)
  {
    goto LABEL_6;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 92));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v28, CFSTR("z"));

  v5 = *(_DWORD *)(a1 + 100);
  if ((v5 & 0x40) == 0)
  {
LABEL_7:
    if ((v5 & 0x20) == 0)
      goto LABEL_9;
    goto LABEL_8;
  }
LABEL_49:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 80));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v29, CFSTR("version"));

  if ((*(_DWORD *)(a1 + 100) & 0x20) != 0)
  {
LABEL_8:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 76));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("style"));

  }
LABEL_9:
  objc_msgSend((id)a1, "languageCode");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    if (a2)
      v9 = CFSTR("languageCode");
    else
      v9 = CFSTR("language_code");
    objc_msgSend(v4, "setObject:forKey:", v8, v9);
  }

  v10 = *(_DWORD *)(a1 + 100);
  if ((v10 & 0x400) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 96));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v30, CFSTR("preflight"));

    v10 = *(_DWORD *)(a1 + 100);
    if ((v10 & 1) == 0)
    {
LABEL_16:
      if ((v10 & 0x10) == 0)
        goto LABEL_17;
LABEL_56:
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 72));
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKey:", v33, CFSTR("size"));

      if ((*(_DWORD *)(a1 + 100) & 8) == 0)
        goto LABEL_19;
      goto LABEL_18;
    }
  }
  else if ((v10 & 1) == 0)
  {
    goto LABEL_16;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *(_QWORD *)(a1 + 40));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v32 = CFSTR("lineId");
  else
    v32 = CFSTR("line_id");
  objc_msgSend(v4, "setObject:forKey:", v31, v32);

  v10 = *(_DWORD *)(a1 + 100);
  if ((v10 & 0x10) != 0)
    goto LABEL_56;
LABEL_17:
  if ((v10 & 8) != 0)
  {
LABEL_18:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 68));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v11, CFSTR("scale"));

  }
LABEL_19:
  objc_msgSend((id)a1, "accessKey");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    if (a2)
      v13 = CFSTR("accessKey");
    else
      v13 = CFSTR("access_key");
    objc_msgSend(v4, "setObject:forKey:", v12, v13);
  }

  v15 = *(_DWORD *)(a1 + 100);
  if ((v15 & 4) != 0)
  {
    LODWORD(v14) = *(_DWORD *)(a1 + 64);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v14);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v17 = CFSTR("longitudeHint");
    else
      v17 = CFSTR("longitude_hint");
    objc_msgSend(v4, "setObject:forKey:", v16, v17);

    v15 = *(_DWORD *)(a1 + 100);
  }
  if ((v15 & 2) != 0)
  {
    LODWORD(v14) = *(_DWORD *)(a1 + 60);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v14);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v19 = CFSTR("latitudeHint");
    else
      v19 = CFSTR("latitude_hint");
    objc_msgSend(v4, "setObject:forKey:", v18, v19);

  }
  objc_msgSend((id)a1, "countryCode");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (v20)
  {
    if (a2)
      v21 = CFSTR("countryCode");
    else
      v21 = CFSTR("country_code");
    objc_msgSend(v4, "setObject:forKey:", v20, v21);
  }

  v22 = *(_DWORD *)(a1 + 100);
  if ((v22 & 0x800) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 97));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v24 = CFSTR("venuesPreflight");
    else
      v24 = CFSTR("venues_preflight");
    objc_msgSend(v4, "setObject:forKey:", v23, v24);

    v22 = *(_DWORD *)(a1 + 100);
  }
  if ((v22 & 0x1000) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 98));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v25, CFSTR("vloc"));

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOVectorTileRequest _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEOVectorTileRequest)initWithDictionary:(id)a3
{
  return (GEOVectorTileRequest *)-[GEOVectorTileRequest _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  const __CFString *v11;
  void *v12;
  void *v13;
  void *v14;
  const __CFString *v15;
  void *v16;
  void *v17;
  void *v18;
  const __CFString *v19;
  void *v20;
  void *v21;
  const __CFString *v22;
  void *v23;
  const __CFString *v24;
  void *v25;
  const __CFString *v26;
  void *v27;
  void *v28;
  const __CFString *v29;
  void *v30;
  void *v31;

  v5 = a2;
  if (a1)
  {
    a1 = (void *)objc_msgSend(a1, "init");
    if (a1)
    {
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("x"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setX:", objc_msgSend(v6, "unsignedIntValue"));

      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("y"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setY:", objc_msgSend(v7, "unsignedIntValue"));

      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("z"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setZ:", objc_msgSend(v8, "unsignedIntValue"));

      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("version"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setVersion:", objc_msgSend(v9, "unsignedIntValue"));

      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("style"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setStyle:", objc_msgSend(v10, "unsignedIntValue"));

      if (a3)
        v11 = CFSTR("languageCode");
      else
        v11 = CFSTR("language_code");
      objc_msgSend(v5, "objectForKeyedSubscript:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v13 = (void *)objc_msgSend(v12, "copy");
        objc_msgSend(a1, "setLanguageCode:", v13);

      }
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("preflight"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setPreflight:", objc_msgSend(v14, "BOOLValue"));

      if (a3)
        v15 = CFSTR("lineId");
      else
        v15 = CFSTR("line_id");
      objc_msgSend(v5, "objectForKeyedSubscript:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setLineId:", objc_msgSend(v16, "unsignedLongLongValue"));

      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("size"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setSize:", objc_msgSend(v17, "unsignedIntValue"));

      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("scale"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setScale:", objc_msgSend(v18, "unsignedIntValue"));

      if (a3)
        v19 = CFSTR("accessKey");
      else
        v19 = CFSTR("access_key");
      objc_msgSend(v5, "objectForKeyedSubscript:", v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v21 = (void *)objc_msgSend(v20, "copy");
        objc_msgSend(a1, "setAccessKey:", v21);

      }
      if (a3)
        v22 = CFSTR("longitudeHint");
      else
        v22 = CFSTR("longitude_hint");
      objc_msgSend(v5, "objectForKeyedSubscript:", v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v23, "floatValue");
        objc_msgSend(a1, "setLongitudeHint:");
      }

      if (a3)
        v24 = CFSTR("latitudeHint");
      else
        v24 = CFSTR("latitude_hint");
      objc_msgSend(v5, "objectForKeyedSubscript:", v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v25, "floatValue");
        objc_msgSend(a1, "setLatitudeHint:");
      }

      if (a3)
        v26 = CFSTR("countryCode");
      else
        v26 = CFSTR("country_code");
      objc_msgSend(v5, "objectForKeyedSubscript:", v26);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v28 = (void *)objc_msgSend(v27, "copy");
        objc_msgSend(a1, "setCountryCode:", v28);

      }
      if (a3)
        v29 = CFSTR("venuesPreflight");
      else
        v29 = CFSTR("venues_preflight");
      objc_msgSend(v5, "objectForKeyedSubscript:", v29);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setVenuesPreflight:", objc_msgSend(v30, "BOOLValue"));

      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("vloc"));
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setVloc:", objc_msgSend(v31, "BOOLValue"));

    }
  }

  return a1;
}

- (GEOVectorTileRequest)initWithJSON:(id)a3
{
  return (GEOVectorTileRequest *)-[GEOVectorTileRequest _initWithDictionary:isJSON:](self, a3, 1);
}

- (void)readAll:(BOOL)a3
{
  _BOOL4 v3;
  os_unfair_lock_s *p_readerLock;
  PBDataReader *reader;
  PBDataReader *v7;
  int *v8;

  v3 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    v7 = reader;
    objc_sync_enter(v7);
    if (v3)
      v8 = (int *)&readAll__recursiveTag_47;
    else
      v8 = (int *)&readAll__nonRecursiveTag_47;
    GEOVectorTileRequestReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  int *v4;
  int *v5;
  int *v6;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  char v14;
  uint64_t v16;
  int v17;
  int v18;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  unsigned int v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  int v27;
  BOOL v28;
  unsigned int v29;
  uint64_t v30;
  uint64_t v31;
  unint64_t v32;
  int v33;
  unsigned int v34;
  uint64_t v35;
  uint64_t v36;
  unint64_t v37;
  int v38;
  unsigned int v39;
  uint64_t v40;
  uint64_t v41;
  unint64_t v42;
  int v43;
  unsigned int v44;
  uint64_t v45;
  uint64_t v46;
  unint64_t v47;
  int v48;
  unsigned int v49;
  uint64_t v50;
  uint64_t v51;
  unint64_t v52;
  int v53;
  unsigned int v54;
  uint64_t v55;
  uint64_t v56;
  unint64_t v57;
  int v58;
  unsigned int v59;
  uint64_t v60;
  uint64_t v61;
  unint64_t v62;
  int v63;
  unsigned int v64;
  uint64_t v65;
  uint64_t v66;
  unint64_t v67;
  int v68;
  unsigned int v69;
  uint64_t v70;
  uint64_t v71;
  unint64_t v72;
  int v73;
  unsigned int v74;
  uint64_t v75;
  uint64_t v76;
  unint64_t v77;
  int v78;
  BOOL v79;

  objc_msgSend(a3, "length", objc_msgSend(a3, "position"));
  v4 = (int *)MEMORY[0x1E0D82BF0];
  v5 = (int *)MEMORY[0x1E0D82BD8];
  v6 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)((char *)a3 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)((char *)a3 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v7 = (int *)MEMORY[0x1E0D82BB8];
    do
    {
      if (*((_BYTE *)a3 + *v6))
        break;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v4;
        v12 = *(_QWORD *)((char *)a3 + v11);
        v13 = v12 + 1;
        if (v12 == -1 || v13 > *(_QWORD *)((char *)a3 + *v5))
          break;
        v14 = *(_BYTE *)(*(_QWORD *)((char *)a3 + *v7) + v12);
        *(_QWORD *)((char *)a3 + v11) = v13;
        v10 |= (unint64_t)(v14 & 0x7F) << v8;
        if ((v14 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        if (v9++ >= 9)
        {
          v10 = 0;
          v16 = *v6;
          v17 = *((unsigned __int8 *)a3 + v16);
          goto LABEL_14;
        }
      }
      *((_BYTE *)a3 + *v6) = 1;
LABEL_12:
      v16 = *v6;
      v17 = *((unsigned __int8 *)a3 + v16);
      if (*((_BYTE *)a3 + v16))
        v10 = 0;
LABEL_14:
      v18 = v10 & 7;
      if (v17 || v18 == 4)
        break;
      switch((v10 >> 3))
      {
        case 1u:
          if ((v10 & 7) != 0)
            goto LABEL_125;
          v23 = 0;
          while (1)
          {
            v24 = *v4;
            v25 = *(_QWORD *)((char *)a3 + v24);
            v26 = v25 + 1;
            if (v25 == -1 || v26 > *(_QWORD *)((char *)a3 + *v5))
              goto LABEL_120;
            v27 = *(char *)(*(_QWORD *)((char *)a3 + *v7) + v25);
            *(_QWORD *)((char *)a3 + v24) = v26;
            if (v27 < 0)
            {
              v28 = v23++ > 8;
              if (!v28)
                continue;
            }
            goto LABEL_122;
          }
        case 2u:
          if ((v10 & 7) != 0)
            goto LABEL_125;
          v29 = 0;
          while (1)
          {
            v30 = *v4;
            v31 = *(_QWORD *)((char *)a3 + v30);
            v32 = v31 + 1;
            if (v31 == -1 || v32 > *(_QWORD *)((char *)a3 + *v5))
              goto LABEL_120;
            v33 = *(char *)(*(_QWORD *)((char *)a3 + *v7) + v31);
            *(_QWORD *)((char *)a3 + v30) = v32;
            if (v33 < 0)
            {
              v28 = v29++ > 8;
              if (!v28)
                continue;
            }
            goto LABEL_122;
          }
        case 3u:
          if ((v10 & 7) != 0)
            goto LABEL_125;
          v34 = 0;
          while (1)
          {
            v35 = *v4;
            v36 = *(_QWORD *)((char *)a3 + v35);
            v37 = v36 + 1;
            if (v36 == -1 || v37 > *(_QWORD *)((char *)a3 + *v5))
              goto LABEL_120;
            v38 = *(char *)(*(_QWORD *)((char *)a3 + *v7) + v36);
            *(_QWORD *)((char *)a3 + v35) = v37;
            if (v38 < 0)
            {
              v28 = v34++ > 8;
              if (!v28)
                continue;
            }
            goto LABEL_122;
          }
        case 4u:
          if ((v10 & 7) != 0)
            goto LABEL_125;
          v39 = 0;
          while (1)
          {
            v40 = *v4;
            v41 = *(_QWORD *)((char *)a3 + v40);
            v42 = v41 + 1;
            if (v41 == -1 || v42 > *(_QWORD *)((char *)a3 + *v5))
              goto LABEL_120;
            v43 = *(char *)(*(_QWORD *)((char *)a3 + *v7) + v41);
            *(_QWORD *)((char *)a3 + v40) = v42;
            if (v43 < 0)
            {
              v28 = v39++ > 8;
              if (!v28)
                continue;
            }
            goto LABEL_122;
          }
        case 5u:
          if ((v10 & 7) != 0)
            goto LABEL_125;
          v44 = 0;
          while (1)
          {
            v45 = *v4;
            v46 = *(_QWORD *)((char *)a3 + v45);
            v47 = v46 + 1;
            if (v46 == -1 || v47 > *(_QWORD *)((char *)a3 + *v5))
              goto LABEL_120;
            v48 = *(char *)(*(_QWORD *)((char *)a3 + *v7) + v46);
            *(_QWORD *)((char *)a3 + v45) = v47;
            if (v48 < 0)
            {
              v28 = v44++ > 8;
              if (!v28)
                continue;
            }
            goto LABEL_122;
          }
        case 6u:
          if (v18 == 2)
            goto LABEL_102;
          goto LABEL_125;
        case 7u:
          if ((v10 & 7) != 0)
            goto LABEL_125;
          v49 = 0;
          while (1)
          {
            v50 = *v4;
            v51 = *(_QWORD *)((char *)a3 + v50);
            v52 = v51 + 1;
            if (v51 == -1 || v52 > *(_QWORD *)((char *)a3 + *v5))
              goto LABEL_120;
            v53 = *(char *)(*(_QWORD *)((char *)a3 + *v7) + v51);
            *(_QWORD *)((char *)a3 + v50) = v52;
            if (v53 < 0)
            {
              v28 = v49++ > 8;
              if (!v28)
                continue;
            }
            goto LABEL_122;
          }
        case 8u:
          if ((v10 & 7) != 0)
            goto LABEL_125;
          v54 = 0;
          while (1)
          {
            v55 = *v4;
            v56 = *(_QWORD *)((char *)a3 + v55);
            v57 = v56 + 1;
            if (v56 == -1 || v57 > *(_QWORD *)((char *)a3 + *v5))
              goto LABEL_120;
            v58 = *(char *)(*(_QWORD *)((char *)a3 + *v7) + v56);
            *(_QWORD *)((char *)a3 + v55) = v57;
            if (v58 < 0)
            {
              v28 = v54++ > 8;
              if (!v28)
                continue;
            }
            goto LABEL_122;
          }
        case 9u:
          if ((v10 & 7) != 0)
            goto LABEL_125;
          v59 = 0;
          while (1)
          {
            v60 = *v4;
            v61 = *(_QWORD *)((char *)a3 + v60);
            v62 = v61 + 1;
            if (v61 == -1 || v62 > *(_QWORD *)((char *)a3 + *v5))
              goto LABEL_120;
            v63 = *(char *)(*(_QWORD *)((char *)a3 + *v7) + v61);
            *(_QWORD *)((char *)a3 + v60) = v62;
            if (v63 < 0)
            {
              v28 = v59++ > 8;
              if (!v28)
                continue;
            }
            goto LABEL_122;
          }
        case 0xAu:
          if ((v10 & 7) != 0)
            goto LABEL_125;
          v64 = 0;
          while (1)
          {
            v65 = *v4;
            v66 = *(_QWORD *)((char *)a3 + v65);
            v67 = v66 + 1;
            if (v66 == -1 || v67 > *(_QWORD *)((char *)a3 + *v5))
              goto LABEL_120;
            v68 = *(char *)(*(_QWORD *)((char *)a3 + *v7) + v66);
            *(_QWORD *)((char *)a3 + v65) = v67;
            if (v68 < 0)
            {
              v28 = v64++ > 8;
              if (!v28)
                continue;
            }
            goto LABEL_122;
          }
        case 0xBu:
          if (v18 == 2)
            goto LABEL_102;
          goto LABEL_125;
        case 0xCu:
        case 0xDu:
          if (v18 != 5)
            goto LABEL_125;
          v20 = *v4;
          v21 = *(_QWORD *)((char *)a3 + v20);
          if (v21 > 0xFFFFFFFFFFFFFFFBLL)
            goto LABEL_121;
          v22 = v21 + 4;
          if (v22 > *(_QWORD *)((char *)a3 + *v5))
            goto LABEL_121;
          *(_QWORD *)((char *)a3 + v20) = v22;
          continue;
        case 0xEu:
          if (v18 != 2)
            goto LABEL_125;
LABEL_102:
          if ((PBReaderSkipValueWithTag() & 1) != 0)
            continue;
LABEL_125:
          v79 = 0;
          goto LABEL_124;
        case 0xFu:
          if ((v10 & 7) != 0)
            goto LABEL_125;
          v69 = 0;
          while (1)
          {
            v70 = *v4;
            v71 = *(_QWORD *)((char *)a3 + v70);
            v72 = v71 + 1;
            if (v71 == -1 || v72 > *(_QWORD *)((char *)a3 + *v5))
              goto LABEL_120;
            v73 = *(char *)(*(_QWORD *)((char *)a3 + *v7) + v71);
            *(_QWORD *)((char *)a3 + v70) = v72;
            if (v73 < 0)
            {
              v28 = v69++ > 8;
              if (!v28)
                continue;
            }
            goto LABEL_122;
          }
        case 0x10u:
          if ((v10 & 7) != 0)
            goto LABEL_125;
          v74 = 0;
          break;
        default:
          if (!PBReaderSkipValueWithTag())
            goto LABEL_125;
          continue;
      }
      while (1)
      {
        v75 = *v4;
        v76 = *(_QWORD *)((char *)a3 + v75);
        v77 = v76 + 1;
        if (v76 == -1 || v77 > *(_QWORD *)((char *)a3 + *v5))
          break;
        v78 = *(char *)(*(_QWORD *)((char *)a3 + *v7) + v76);
        *(_QWORD *)((char *)a3 + v75) = v77;
        if (v78 < 0)
        {
          v28 = v74++ > 8;
          if (!v28)
            continue;
        }
        goto LABEL_122;
      }
LABEL_120:
      v16 = *v6;
LABEL_121:
      *((_BYTE *)a3 + v16) = 1;
LABEL_122:
      ;
    }
    while (*(_QWORD *)((char *)a3 + *v4) < *(_QWORD *)((char *)a3 + *v5));
  }
  v79 = *((_BYTE *)a3 + *v6) == 0;
LABEL_124:
  PBReaderRecallMark();
  return v79;
}

- (BOOL)readFrom:(id)a3
{
  return GEOVectorTileRequestReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  os_unfair_lock_s *p_readerLock;
  $8D903536FF5EFC81363F64804503A8CD flags;
  $8D903536FF5EFC81363F64804503A8CD v6;
  $8D903536FF5EFC81363F64804503A8CD v7;
  $8D903536FF5EFC81363F64804503A8CD v8;
  PBDataReader *v9;
  void *v10;
  id v11;

  v11 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader)
  {
    os_unfair_lock_assert_owner(&self->_readerLock);
    if ((*(_DWORD *)&self->_flags & 0x1E000) == 0)
    {
      v9 = self->_reader;
      objc_sync_enter(v9);
      *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
      -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
      -[PBDataReader readBytes:](self->_reader, "readBytes:", self->_readerMarkLength - self->_readerMarkPos);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "writeData:", v10);
      os_unfair_lock_unlock(p_readerLock);

      objc_sync_exit(v9);
      goto LABEL_38;
    }
  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOVectorTileRequest readAll:](self, "readAll:", 0);
  flags = self->_flags;
  if ((*(_BYTE *)&flags & 0x80) != 0)
  {
    PBDataWriterWriteUint32Field();
    flags = self->_flags;
    if ((*(_WORD *)&flags & 0x100) == 0)
    {
LABEL_5:
      if ((*(_WORD *)&flags & 0x200) == 0)
        goto LABEL_6;
      goto LABEL_30;
    }
  }
  else if ((*(_WORD *)&flags & 0x100) == 0)
  {
    goto LABEL_5;
  }
  PBDataWriterWriteUint32Field();
  flags = self->_flags;
  if ((*(_WORD *)&flags & 0x200) == 0)
  {
LABEL_6:
    if ((*(_BYTE *)&flags & 0x40) == 0)
      goto LABEL_7;
    goto LABEL_31;
  }
LABEL_30:
  PBDataWriterWriteUint32Field();
  flags = self->_flags;
  if ((*(_BYTE *)&flags & 0x40) == 0)
  {
LABEL_7:
    if ((*(_BYTE *)&flags & 0x20) == 0)
      goto LABEL_9;
    goto LABEL_8;
  }
LABEL_31:
  PBDataWriterWriteUint32Field();
  if ((*(_DWORD *)&self->_flags & 0x20) != 0)
LABEL_8:
    PBDataWriterWriteUint32Field();
LABEL_9:
  if (self->_languageCode)
    PBDataWriterWriteStringField();
  v6 = self->_flags;
  if ((*(_WORD *)&v6 & 0x400) != 0)
  {
    PBDataWriterWriteBOOLField();
    v6 = self->_flags;
    if ((*(_BYTE *)&v6 & 1) == 0)
    {
LABEL_13:
      if ((*(_BYTE *)&v6 & 0x10) == 0)
        goto LABEL_14;
LABEL_35:
      PBDataWriterWriteUint32Field();
      if ((*(_DWORD *)&self->_flags & 8) == 0)
        goto LABEL_16;
      goto LABEL_15;
    }
  }
  else if ((*(_BYTE *)&v6 & 1) == 0)
  {
    goto LABEL_13;
  }
  PBDataWriterWriteUint64Field();
  v6 = self->_flags;
  if ((*(_BYTE *)&v6 & 0x10) != 0)
    goto LABEL_35;
LABEL_14:
  if ((*(_BYTE *)&v6 & 8) != 0)
LABEL_15:
    PBDataWriterWriteUint32Field();
LABEL_16:
  if (self->_accessKey)
    PBDataWriterWriteStringField();
  v7 = self->_flags;
  if ((*(_BYTE *)&v7 & 4) != 0)
  {
    PBDataWriterWriteFloatField();
    v7 = self->_flags;
  }
  if ((*(_BYTE *)&v7 & 2) != 0)
    PBDataWriterWriteFloatField();
  if (self->_countryCode)
    PBDataWriterWriteStringField();
  v8 = self->_flags;
  if ((*(_WORD *)&v8 & 0x800) != 0)
  {
    PBDataWriterWriteBOOLField();
    v8 = self->_flags;
  }
  if ((*(_WORD *)&v8 & 0x1000) != 0)
    PBDataWriterWriteBOOLField();
LABEL_38:

}

- (void)copyTo:(id)a3
{
  id *v4;
  $8D903536FF5EFC81363F64804503A8CD flags;
  $8D903536FF5EFC81363F64804503A8CD v6;
  $8D903536FF5EFC81363F64804503A8CD v7;
  $8D903536FF5EFC81363F64804503A8CD v8;
  id *v9;

  v9 = (id *)a3;
  -[GEOVectorTileRequest readAll:](self, "readAll:", 0);
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v9 + 1, self->_reader);
  *((_DWORD *)v9 + 12) = self->_readerMarkPos;
  *((_DWORD *)v9 + 13) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  v4 = v9;
  flags = self->_flags;
  if ((*(_BYTE *)&flags & 0x80) != 0)
  {
    *((_DWORD *)v9 + 21) = self->_x;
    *((_DWORD *)v9 + 25) |= 0x80u;
    flags = self->_flags;
    if ((*(_WORD *)&flags & 0x100) == 0)
    {
LABEL_3:
      if ((*(_WORD *)&flags & 0x200) == 0)
        goto LABEL_4;
      goto LABEL_29;
    }
  }
  else if ((*(_WORD *)&flags & 0x100) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)v9 + 22) = self->_y;
  *((_DWORD *)v9 + 25) |= 0x100u;
  flags = self->_flags;
  if ((*(_WORD *)&flags & 0x200) == 0)
  {
LABEL_4:
    if ((*(_BYTE *)&flags & 0x40) == 0)
      goto LABEL_5;
    goto LABEL_30;
  }
LABEL_29:
  *((_DWORD *)v9 + 23) = self->_z;
  *((_DWORD *)v9 + 25) |= 0x200u;
  flags = self->_flags;
  if ((*(_BYTE *)&flags & 0x40) == 0)
  {
LABEL_5:
    if ((*(_BYTE *)&flags & 0x20) == 0)
      goto LABEL_7;
    goto LABEL_6;
  }
LABEL_30:
  *((_DWORD *)v9 + 20) = self->_version;
  *((_DWORD *)v9 + 25) |= 0x40u;
  if ((*(_DWORD *)&self->_flags & 0x20) != 0)
  {
LABEL_6:
    *((_DWORD *)v9 + 19) = self->_style;
    *((_DWORD *)v9 + 25) |= 0x20u;
  }
LABEL_7:
  if (self->_languageCode)
  {
    objc_msgSend(v9, "setLanguageCode:");
    v4 = v9;
  }
  v6 = self->_flags;
  if ((*(_WORD *)&v6 & 0x400) != 0)
  {
    *((_BYTE *)v4 + 96) = self->_preflight;
    *((_DWORD *)v4 + 25) |= 0x400u;
    v6 = self->_flags;
    if ((*(_BYTE *)&v6 & 1) == 0)
    {
LABEL_11:
      if ((*(_BYTE *)&v6 & 0x10) == 0)
        goto LABEL_12;
      goto LABEL_34;
    }
  }
  else if ((*(_BYTE *)&v6 & 1) == 0)
  {
    goto LABEL_11;
  }
  v4[5] = (id)self->_lineId;
  *((_DWORD *)v4 + 25) |= 1u;
  v6 = self->_flags;
  if ((*(_BYTE *)&v6 & 0x10) == 0)
  {
LABEL_12:
    if ((*(_BYTE *)&v6 & 8) == 0)
      goto LABEL_14;
    goto LABEL_13;
  }
LABEL_34:
  *((_DWORD *)v4 + 18) = self->_size;
  *((_DWORD *)v4 + 25) |= 0x10u;
  if ((*(_DWORD *)&self->_flags & 8) != 0)
  {
LABEL_13:
    *((_DWORD *)v4 + 17) = self->_scale;
    *((_DWORD *)v4 + 25) |= 8u;
  }
LABEL_14:
  if (self->_accessKey)
  {
    objc_msgSend(v9, "setAccessKey:");
    v4 = v9;
  }
  v7 = self->_flags;
  if ((*(_BYTE *)&v7 & 4) != 0)
  {
    *((_DWORD *)v4 + 16) = LODWORD(self->_longitudeHint);
    *((_DWORD *)v4 + 25) |= 4u;
    v7 = self->_flags;
  }
  if ((*(_BYTE *)&v7 & 2) != 0)
  {
    *((_DWORD *)v4 + 15) = LODWORD(self->_latitudeHint);
    *((_DWORD *)v4 + 25) |= 2u;
  }
  if (self->_countryCode)
  {
    objc_msgSend(v9, "setCountryCode:");
    v4 = v9;
  }
  v8 = self->_flags;
  if ((*(_WORD *)&v8 & 0x800) != 0)
  {
    *((_BYTE *)v4 + 97) = self->_venuesPreflight;
    *((_DWORD *)v4 + 25) |= 0x800u;
    v8 = self->_flags;
  }
  if ((*(_WORD *)&v8 & 0x1000) != 0)
  {
    *((_BYTE *)v4 + 98) = self->_vloc;
    *((_DWORD *)v4 + 25) |= 0x1000u;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  PBDataReader *reader;
  PBDataReader *v7;
  id v8;
  $8D903536FF5EFC81363F64804503A8CD flags;
  uint64_t v10;
  void *v11;
  $8D903536FF5EFC81363F64804503A8CD v12;
  uint64_t v13;
  void *v14;
  $8D903536FF5EFC81363F64804503A8CD v15;
  uint64_t v16;
  void *v17;
  $8D903536FF5EFC81363F64804503A8CD v18;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    v7 = reader;
    objc_sync_enter(v7);
    if ((*((_BYTE *)&self->_flags + 2) & 1) == 0)
    {
      *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
      -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
      GEOVectorTileRequestReadAllFrom(v5, self->_reader);
      os_unfair_lock_unlock(&self->_readerLock);
      v8 = (id)v5;
      objc_sync_exit(v7);

      return (id)v5;
    }
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOVectorTileRequest readAll:](self, "readAll:", 0);
  flags = self->_flags;
  if ((*(_BYTE *)&flags & 0x80) != 0)
  {
    *(_DWORD *)(v5 + 84) = self->_x;
    *(_DWORD *)(v5 + 100) |= 0x80u;
    flags = self->_flags;
    if ((*(_WORD *)&flags & 0x100) == 0)
    {
LABEL_7:
      if ((*(_WORD *)&flags & 0x200) == 0)
        goto LABEL_8;
      goto LABEL_27;
    }
  }
  else if ((*(_WORD *)&flags & 0x100) == 0)
  {
    goto LABEL_7;
  }
  *(_DWORD *)(v5 + 88) = self->_y;
  *(_DWORD *)(v5 + 100) |= 0x100u;
  flags = self->_flags;
  if ((*(_WORD *)&flags & 0x200) == 0)
  {
LABEL_8:
    if ((*(_BYTE *)&flags & 0x40) == 0)
      goto LABEL_9;
    goto LABEL_28;
  }
LABEL_27:
  *(_DWORD *)(v5 + 92) = self->_z;
  *(_DWORD *)(v5 + 100) |= 0x200u;
  flags = self->_flags;
  if ((*(_BYTE *)&flags & 0x40) == 0)
  {
LABEL_9:
    if ((*(_BYTE *)&flags & 0x20) == 0)
      goto LABEL_11;
    goto LABEL_10;
  }
LABEL_28:
  *(_DWORD *)(v5 + 80) = self->_version;
  *(_DWORD *)(v5 + 100) |= 0x40u;
  if ((*(_DWORD *)&self->_flags & 0x20) != 0)
  {
LABEL_10:
    *(_DWORD *)(v5 + 76) = self->_style;
    *(_DWORD *)(v5 + 100) |= 0x20u;
  }
LABEL_11:
  v10 = -[NSString copyWithZone:](self->_languageCode, "copyWithZone:", a3);
  v11 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v10;

  v12 = self->_flags;
  if ((*(_WORD *)&v12 & 0x400) != 0)
  {
    *(_BYTE *)(v5 + 96) = self->_preflight;
    *(_DWORD *)(v5 + 100) |= 0x400u;
    v12 = self->_flags;
    if ((*(_BYTE *)&v12 & 1) == 0)
    {
LABEL_13:
      if ((*(_BYTE *)&v12 & 0x10) == 0)
        goto LABEL_14;
LABEL_32:
      *(_DWORD *)(v5 + 72) = self->_size;
      *(_DWORD *)(v5 + 100) |= 0x10u;
      if ((*(_DWORD *)&self->_flags & 8) == 0)
        goto LABEL_16;
      goto LABEL_15;
    }
  }
  else if ((*(_BYTE *)&v12 & 1) == 0)
  {
    goto LABEL_13;
  }
  *(_QWORD *)(v5 + 40) = self->_lineId;
  *(_DWORD *)(v5 + 100) |= 1u;
  v12 = self->_flags;
  if ((*(_BYTE *)&v12 & 0x10) != 0)
    goto LABEL_32;
LABEL_14:
  if ((*(_BYTE *)&v12 & 8) != 0)
  {
LABEL_15:
    *(_DWORD *)(v5 + 68) = self->_scale;
    *(_DWORD *)(v5 + 100) |= 8u;
  }
LABEL_16:
  v13 = -[NSString copyWithZone:](self->_accessKey, "copyWithZone:", a3);
  v14 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v13;

  v15 = self->_flags;
  if ((*(_BYTE *)&v15 & 4) != 0)
  {
    *(float *)(v5 + 64) = self->_longitudeHint;
    *(_DWORD *)(v5 + 100) |= 4u;
    v15 = self->_flags;
  }
  if ((*(_BYTE *)&v15 & 2) != 0)
  {
    *(float *)(v5 + 60) = self->_latitudeHint;
    *(_DWORD *)(v5 + 100) |= 2u;
  }
  v16 = -[NSString copyWithZone:](self->_countryCode, "copyWithZone:", a3);
  v17 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v16;

  v18 = self->_flags;
  if ((*(_WORD *)&v18 & 0x800) != 0)
  {
    *(_BYTE *)(v5 + 97) = self->_venuesPreflight;
    *(_DWORD *)(v5 + 100) |= 0x800u;
    v18 = self->_flags;
  }
  if ((*(_WORD *)&v18 & 0x1000) != 0)
  {
    *(_BYTE *)(v5 + 98) = self->_vloc;
    *(_DWORD *)(v5 + 100) |= 0x1000u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  $8D903536FF5EFC81363F64804503A8CD flags;
  int v6;
  NSString *languageCode;
  NSString *accessKey;
  NSString *countryCode;
  BOOL v10;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_80;
  -[GEOVectorTileRequest readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  flags = self->_flags;
  v6 = *((_DWORD *)v4 + 25);
  if ((*(_BYTE *)&flags & 0x80) != 0)
  {
    if ((v6 & 0x80) == 0 || self->_x != *((_DWORD *)v4 + 21))
      goto LABEL_80;
  }
  else if ((v6 & 0x80) != 0)
  {
    goto LABEL_80;
  }
  if ((*(_WORD *)&flags & 0x100) != 0)
  {
    if ((v6 & 0x100) == 0 || self->_y != *((_DWORD *)v4 + 22))
      goto LABEL_80;
  }
  else if ((v6 & 0x100) != 0)
  {
    goto LABEL_80;
  }
  if ((*(_WORD *)&flags & 0x200) != 0)
  {
    if ((v6 & 0x200) == 0 || self->_z != *((_DWORD *)v4 + 23))
      goto LABEL_80;
  }
  else if ((v6 & 0x200) != 0)
  {
    goto LABEL_80;
  }
  if ((*(_BYTE *)&flags & 0x40) != 0)
  {
    if ((v6 & 0x40) == 0 || self->_version != *((_DWORD *)v4 + 20))
      goto LABEL_80;
  }
  else if ((v6 & 0x40) != 0)
  {
    goto LABEL_80;
  }
  if ((*(_BYTE *)&flags & 0x20) != 0)
  {
    if ((v6 & 0x20) == 0 || self->_style != *((_DWORD *)v4 + 19))
      goto LABEL_80;
  }
  else if ((v6 & 0x20) != 0)
  {
    goto LABEL_80;
  }
  languageCode = self->_languageCode;
  if ((unint64_t)languageCode | *((_QWORD *)v4 + 4))
  {
    if (!-[NSString isEqual:](languageCode, "isEqual:"))
      goto LABEL_80;
    flags = self->_flags;
    v6 = *((_DWORD *)v4 + 25);
  }
  if ((*(_WORD *)&flags & 0x400) != 0)
  {
    if ((v6 & 0x400) == 0)
      goto LABEL_80;
    if (self->_preflight)
    {
      if (!*((_BYTE *)v4 + 96))
        goto LABEL_80;
    }
    else if (*((_BYTE *)v4 + 96))
    {
      goto LABEL_80;
    }
  }
  else if ((v6 & 0x400) != 0)
  {
    goto LABEL_80;
  }
  if ((*(_BYTE *)&flags & 1) != 0)
  {
    if ((v6 & 1) == 0 || self->_lineId != *((_QWORD *)v4 + 5))
      goto LABEL_80;
  }
  else if ((v6 & 1) != 0)
  {
    goto LABEL_80;
  }
  if ((*(_BYTE *)&flags & 0x10) != 0)
  {
    if ((v6 & 0x10) == 0 || self->_size != *((_DWORD *)v4 + 18))
      goto LABEL_80;
  }
  else if ((v6 & 0x10) != 0)
  {
    goto LABEL_80;
  }
  if ((*(_BYTE *)&flags & 8) != 0)
  {
    if ((v6 & 8) == 0 || self->_scale != *((_DWORD *)v4 + 17))
      goto LABEL_80;
  }
  else if ((v6 & 8) != 0)
  {
    goto LABEL_80;
  }
  accessKey = self->_accessKey;
  if ((unint64_t)accessKey | *((_QWORD *)v4 + 2))
  {
    if (!-[NSString isEqual:](accessKey, "isEqual:"))
      goto LABEL_80;
    flags = self->_flags;
    v6 = *((_DWORD *)v4 + 25);
  }
  if ((*(_BYTE *)&flags & 4) != 0)
  {
    if ((v6 & 4) == 0 || self->_longitudeHint != *((float *)v4 + 16))
      goto LABEL_80;
  }
  else if ((v6 & 4) != 0)
  {
    goto LABEL_80;
  }
  if ((*(_BYTE *)&flags & 2) != 0)
  {
    if ((v6 & 2) == 0 || self->_latitudeHint != *((float *)v4 + 15))
      goto LABEL_80;
  }
  else if ((v6 & 2) != 0)
  {
    goto LABEL_80;
  }
  countryCode = self->_countryCode;
  if ((unint64_t)countryCode | *((_QWORD *)v4 + 3))
  {
    if (!-[NSString isEqual:](countryCode, "isEqual:"))
      goto LABEL_80;
    flags = self->_flags;
    v6 = *((_DWORD *)v4 + 25);
  }
  if ((*(_WORD *)&flags & 0x800) != 0)
  {
    if ((v6 & 0x800) == 0)
      goto LABEL_80;
    if (self->_venuesPreflight)
    {
      if (!*((_BYTE *)v4 + 97))
        goto LABEL_80;
    }
    else if (*((_BYTE *)v4 + 97))
    {
      goto LABEL_80;
    }
  }
  else if ((v6 & 0x800) != 0)
  {
    goto LABEL_80;
  }
  if ((*(_WORD *)&flags & 0x1000) != 0)
  {
    if ((v6 & 0x1000) != 0)
    {
      if (self->_vloc)
      {
        if (!*((_BYTE *)v4 + 98))
          goto LABEL_80;
      }
      else if (*((_BYTE *)v4 + 98))
      {
        goto LABEL_80;
      }
      v10 = 1;
      goto LABEL_81;
    }
LABEL_80:
    v10 = 0;
    goto LABEL_81;
  }
  v10 = (v6 & 0x1000) == 0;
LABEL_81:

  return v10;
}

- (unint64_t)hash
{
  $8D903536FF5EFC81363F64804503A8CD flags;
  $8D903536FF5EFC81363F64804503A8CD v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSUInteger v9;
  $8D903536FF5EFC81363F64804503A8CD v10;
  unint64_t v11;
  float longitudeHint;
  double v13;
  long double v14;
  double v15;
  unint64_t v16;
  float latitudeHint;
  double v18;
  long double v19;
  double v20;
  NSUInteger v21;
  $8D903536FF5EFC81363F64804503A8CD v22;
  uint64_t v23;
  uint64_t v24;
  NSUInteger v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;

  -[GEOVectorTileRequest readAll:](self, "readAll:", 1);
  flags = self->_flags;
  if ((*(_BYTE *)&flags & 0x80) != 0)
  {
    v32 = 2654435761 * self->_x;
    if ((*(_WORD *)&flags & 0x100) != 0)
    {
LABEL_3:
      v31 = 2654435761 * self->_y;
      if ((*(_WORD *)&flags & 0x200) != 0)
        goto LABEL_4;
      goto LABEL_9;
    }
  }
  else
  {
    v32 = 0;
    if ((*(_WORD *)&flags & 0x100) != 0)
      goto LABEL_3;
  }
  v31 = 0;
  if ((*(_WORD *)&flags & 0x200) != 0)
  {
LABEL_4:
    v30 = 2654435761 * self->_z;
    if ((*(_BYTE *)&flags & 0x40) != 0)
      goto LABEL_5;
LABEL_10:
    v29 = 0;
    if ((*(_BYTE *)&flags & 0x20) != 0)
      goto LABEL_6;
    goto LABEL_11;
  }
LABEL_9:
  v30 = 0;
  if ((*(_BYTE *)&flags & 0x40) == 0)
    goto LABEL_10;
LABEL_5:
  v29 = 2654435761 * self->_version;
  if ((*(_BYTE *)&flags & 0x20) != 0)
  {
LABEL_6:
    v28 = 2654435761 * self->_style;
    goto LABEL_12;
  }
LABEL_11:
  v28 = 0;
LABEL_12:
  v26 = -[NSString hash](self->_languageCode, "hash");
  v4 = self->_flags;
  if ((*(_WORD *)&v4 & 0x400) != 0)
  {
    v5 = 2654435761 * self->_preflight;
    if ((*(_BYTE *)&v4 & 1) != 0)
    {
LABEL_14:
      v6 = 2654435761u * self->_lineId;
      if ((*(_BYTE *)&v4 & 0x10) != 0)
        goto LABEL_15;
LABEL_19:
      v7 = 0;
      if ((*(_BYTE *)&v4 & 8) != 0)
        goto LABEL_16;
      goto LABEL_20;
    }
  }
  else
  {
    v5 = 0;
    if ((*(_BYTE *)&v4 & 1) != 0)
      goto LABEL_14;
  }
  v6 = 0;
  if ((*(_BYTE *)&v4 & 0x10) == 0)
    goto LABEL_19;
LABEL_15:
  v7 = 2654435761 * self->_size;
  if ((*(_BYTE *)&v4 & 8) != 0)
  {
LABEL_16:
    v8 = 2654435761 * self->_scale;
    goto LABEL_21;
  }
LABEL_20:
  v8 = 0;
LABEL_21:
  v9 = -[NSString hash](self->_accessKey, "hash", v26);
  v10 = self->_flags;
  if ((*(_BYTE *)&v10 & 4) != 0)
  {
    longitudeHint = self->_longitudeHint;
    v13 = longitudeHint;
    if (longitudeHint < 0.0)
      v13 = -longitudeHint;
    v14 = floor(v13 + 0.5);
    v15 = (v13 - v14) * 1.84467441e19;
    v11 = 2654435761u * (unint64_t)fmod(v14, 1.84467441e19);
    if (v15 >= 0.0)
    {
      if (v15 > 0.0)
        v11 += (unint64_t)v15;
    }
    else
    {
      v11 -= (unint64_t)fabs(v15);
    }
  }
  else
  {
    v11 = 0;
  }
  if ((*(_BYTE *)&v10 & 2) != 0)
  {
    latitudeHint = self->_latitudeHint;
    v18 = latitudeHint;
    if (latitudeHint < 0.0)
      v18 = -latitudeHint;
    v19 = floor(v18 + 0.5);
    v20 = (v18 - v19) * 1.84467441e19;
    v16 = 2654435761u * (unint64_t)fmod(v19, 1.84467441e19);
    if (v20 >= 0.0)
    {
      if (v20 > 0.0)
        v16 += (unint64_t)v20;
    }
    else
    {
      v16 -= (unint64_t)fabs(v20);
    }
  }
  else
  {
    v16 = 0;
  }
  v21 = -[NSString hash](self->_countryCode, "hash");
  v22 = self->_flags;
  if ((*(_WORD *)&v22 & 0x800) != 0)
  {
    v23 = 2654435761 * self->_venuesPreflight;
    if ((*(_WORD *)&v22 & 0x1000) != 0)
      goto LABEL_39;
LABEL_41:
    v24 = 0;
    return v31 ^ v32 ^ v30 ^ v29 ^ v28 ^ v5 ^ v6 ^ v7 ^ v8 ^ v27 ^ v9 ^ v11 ^ v16 ^ v21 ^ v23 ^ v24;
  }
  v23 = 0;
  if ((*(_WORD *)&v22 & 0x1000) == 0)
    goto LABEL_41;
LABEL_39:
  v24 = 2654435761 * self->_vloc;
  return v31 ^ v32 ^ v30 ^ v29 ^ v28 ^ v5 ^ v6 ^ v7 ^ v8 ^ v27 ^ v9 ^ v11 ^ v16 ^ v21 ^ v23 ^ v24;
}

- (void)mergeFrom:(id)a3
{
  unsigned int *v4;
  unsigned int v5;
  unsigned int v6;
  unsigned int v7;
  unsigned int v8;
  unsigned int *v9;

  v9 = (unsigned int *)a3;
  objc_msgSend(v9, "readAll:", 0);
  v4 = v9;
  v5 = v9[25];
  if ((v5 & 0x80) != 0)
  {
    self->_x = v9[21];
    *(_DWORD *)&self->_flags |= 0x80u;
    v5 = v9[25];
    if ((v5 & 0x100) == 0)
    {
LABEL_3:
      if ((v5 & 0x200) == 0)
        goto LABEL_4;
      goto LABEL_29;
    }
  }
  else if ((v5 & 0x100) == 0)
  {
    goto LABEL_3;
  }
  self->_y = v9[22];
  *(_DWORD *)&self->_flags |= 0x100u;
  v5 = v9[25];
  if ((v5 & 0x200) == 0)
  {
LABEL_4:
    if ((v5 & 0x40) == 0)
      goto LABEL_5;
    goto LABEL_30;
  }
LABEL_29:
  self->_z = v9[23];
  *(_DWORD *)&self->_flags |= 0x200u;
  v5 = v9[25];
  if ((v5 & 0x40) == 0)
  {
LABEL_5:
    if ((v5 & 0x20) == 0)
      goto LABEL_7;
    goto LABEL_6;
  }
LABEL_30:
  self->_version = v9[20];
  *(_DWORD *)&self->_flags |= 0x40u;
  if ((v9[25] & 0x20) != 0)
  {
LABEL_6:
    self->_style = v9[19];
    *(_DWORD *)&self->_flags |= 0x20u;
  }
LABEL_7:
  if (*((_QWORD *)v9 + 4))
  {
    -[GEOVectorTileRequest setLanguageCode:](self, "setLanguageCode:");
    v4 = v9;
  }
  v6 = v4[25];
  if ((v6 & 0x400) != 0)
  {
    self->_preflight = *((_BYTE *)v4 + 96);
    *(_DWORD *)&self->_flags |= 0x400u;
    v6 = v4[25];
    if ((v6 & 1) == 0)
    {
LABEL_11:
      if ((v6 & 0x10) == 0)
        goto LABEL_12;
      goto LABEL_34;
    }
  }
  else if ((v6 & 1) == 0)
  {
    goto LABEL_11;
  }
  self->_lineId = *((_QWORD *)v4 + 5);
  *(_DWORD *)&self->_flags |= 1u;
  v6 = v4[25];
  if ((v6 & 0x10) == 0)
  {
LABEL_12:
    if ((v6 & 8) == 0)
      goto LABEL_14;
    goto LABEL_13;
  }
LABEL_34:
  self->_size = v4[18];
  *(_DWORD *)&self->_flags |= 0x10u;
  if ((v4[25] & 8) != 0)
  {
LABEL_13:
    self->_scale = v4[17];
    *(_DWORD *)&self->_flags |= 8u;
  }
LABEL_14:
  if (*((_QWORD *)v4 + 2))
  {
    -[GEOVectorTileRequest setAccessKey:](self, "setAccessKey:");
    v4 = v9;
  }
  v7 = v4[25];
  if ((v7 & 4) != 0)
  {
    LODWORD(self->_longitudeHint) = v4[16];
    *(_DWORD *)&self->_flags |= 4u;
    v7 = v4[25];
  }
  if ((v7 & 2) != 0)
  {
    LODWORD(self->_latitudeHint) = v4[15];
    *(_DWORD *)&self->_flags |= 2u;
  }
  if (*((_QWORD *)v4 + 3))
  {
    -[GEOVectorTileRequest setCountryCode:](self, "setCountryCode:");
    v4 = v9;
  }
  v8 = v4[25];
  if ((v8 & 0x800) != 0)
  {
    self->_venuesPreflight = *((_BYTE *)v4 + 97);
    *(_DWORD *)&self->_flags |= 0x800u;
    v8 = v4[25];
  }
  if ((v8 & 0x1000) != 0)
  {
    self->_vloc = *((_BYTE *)v4 + 98);
    *(_DWORD *)&self->_flags |= 0x1000u;
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_languageCode, 0);
  objc_storeStrong((id *)&self->_countryCode, 0);
  objc_storeStrong((id *)&self->_accessKey, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
