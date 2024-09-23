@implementation GEOLocalizedPublisherAttribution

- (GEOLocalizedPublisherAttribution)init
{
  GEOLocalizedPublisherAttribution *v2;
  GEOLocalizedPublisherAttribution *v3;
  GEOLocalizedPublisherAttribution *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOLocalizedPublisherAttribution;
  v2 = -[GEOLocalizedPublisherAttribution init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOLocalizedPublisherAttribution)initWithData:(id)a3
{
  GEOLocalizedPublisherAttribution *v3;
  GEOLocalizedPublisherAttribution *v4;
  GEOLocalizedPublisherAttribution *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOLocalizedPublisherAttribution;
  v3 = -[GEOLocalizedPublisherAttribution initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readLanguage
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(_WORD *)(a1 + 96) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOLocalizedPublisherAttributionReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readLanguage_tags_167);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (BOOL)hasLanguage
{
  -[GEOLocalizedPublisherAttribution _readLanguage]((uint64_t)self);
  return self->_language != 0;
}

- (NSString)language
{
  -[GEOLocalizedPublisherAttribution _readLanguage]((uint64_t)self);
  return self->_language;
}

- (void)setLanguage:(id)a3
{
  *(_WORD *)&self->_flags |= 0x880u;
  objc_storeStrong((id *)&self->_language, a3);
}

- (void)_readDisplayName
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(_WORD *)(a1 + 96) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOLocalizedPublisherAttributionReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readDisplayName_tags_168);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (BOOL)hasDisplayName
{
  -[GEOLocalizedPublisherAttribution _readDisplayName]((uint64_t)self);
  return self->_displayName != 0;
}

- (NSString)displayName
{
  -[GEOLocalizedPublisherAttribution _readDisplayName]((uint64_t)self);
  return self->_displayName;
}

- (void)setDisplayName:(id)a3
{
  *(_WORD *)&self->_flags |= 0x840u;
  objc_storeStrong((id *)&self->_displayName, a3);
}

- (void)_readSubtitle
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(_WORD *)(a1 + 96) & 0x100) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOLocalizedPublisherAttributionReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readSubtitle_tags_0);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (BOOL)hasSubtitle
{
  -[GEOLocalizedPublisherAttribution _readSubtitle]((uint64_t)self);
  return self->_subtitle != 0;
}

- (NSString)subtitle
{
  -[GEOLocalizedPublisherAttribution _readSubtitle]((uint64_t)self);
  return self->_subtitle;
}

- (void)setSubtitle:(id)a3
{
  *(_WORD *)&self->_flags |= 0x900u;
  objc_storeStrong((id *)&self->_subtitle, a3);
}

- (unsigned)iconIdentifier
{
  return self->_iconIdentifier;
}

- (void)setIconIdentifier:(unsigned int)a3
{
  *(_WORD *)&self->_flags |= 0x801u;
  self->_iconIdentifier = a3;
}

- (void)setHasIconIdentifier:(BOOL)a3
{
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFFE | a3 | 0x800;
}

- (BOOL)hasIconIdentifier
{
  return *(_WORD *)&self->_flags & 1;
}

- (unsigned)logoIdentifier
{
  return self->_logoIdentifier;
}

- (void)setLogoIdentifier:(unsigned int)a3
{
  *(_WORD *)&self->_flags |= 0x808u;
  self->_logoIdentifier = a3;
}

- (void)setHasLogoIdentifier:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 2056;
  else
    v3 = 2048;
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFF7 | v3;
}

- (BOOL)hasLogoIdentifier
{
  return (*(_WORD *)&self->_flags >> 3) & 1;
}

- (unsigned)logoCenteredIdentifier
{
  return self->_logoCenteredIdentifier;
}

- (void)setLogoCenteredIdentifier:(unsigned int)a3
{
  *(_WORD *)&self->_flags |= 0x804u;
  self->_logoCenteredIdentifier = a3;
}

- (void)setHasLogoCenteredIdentifier:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 2052;
  else
    v3 = 2048;
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFFB | v3;
}

- (BOOL)hasLogoCenteredIdentifier
{
  return (*(_WORD *)&self->_flags >> 2) & 1;
}

- (void)_readThemeColorLightMode
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(_WORD *)(a1 + 96) & 0x400) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOLocalizedPublisherAttributionReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readThemeColorLightMode_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (BOOL)hasThemeColorLightMode
{
  -[GEOLocalizedPublisherAttribution _readThemeColorLightMode]((uint64_t)self);
  return self->_themeColorLightMode != 0;
}

- (NSString)themeColorLightMode
{
  -[GEOLocalizedPublisherAttribution _readThemeColorLightMode]((uint64_t)self);
  return self->_themeColorLightMode;
}

- (void)setThemeColorLightMode:(id)a3
{
  *(_WORD *)&self->_flags |= 0xC00u;
  objc_storeStrong((id *)&self->_themeColorLightMode, a3);
}

- (void)_readThemeColorDarkMode
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(_WORD *)(a1 + 96) & 0x200) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOLocalizedPublisherAttributionReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readThemeColorDarkMode_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (BOOL)hasThemeColorDarkMode
{
  -[GEOLocalizedPublisherAttribution _readThemeColorDarkMode]((uint64_t)self);
  return self->_themeColorDarkMode != 0;
}

- (NSString)themeColorDarkMode
{
  -[GEOLocalizedPublisherAttribution _readThemeColorDarkMode]((uint64_t)self);
  return self->_themeColorDarkMode;
}

- (void)setThemeColorDarkMode:(id)a3
{
  *(_WORD *)&self->_flags |= 0xA00u;
  objc_storeStrong((id *)&self->_themeColorDarkMode, a3);
}

- (unsigned)logoCenteredColorizedIdentifier
{
  return self->_logoCenteredColorizedIdentifier;
}

- (void)setLogoCenteredColorizedIdentifier:(unsigned int)a3
{
  *(_WORD *)&self->_flags |= 0x802u;
  self->_logoCenteredColorizedIdentifier = a3;
}

- (void)setHasLogoCenteredColorizedIdentifier:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 2050;
  else
    v3 = 2048;
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFFD | v3;
}

- (BOOL)hasLogoCenteredColorizedIdentifier
{
  return (*(_WORD *)&self->_flags >> 1) & 1;
}

- (unsigned)logoWithoutPaddingIdentifier
{
  return self->_logoWithoutPaddingIdentifier;
}

- (void)setLogoWithoutPaddingIdentifier:(unsigned int)a3
{
  *(_WORD *)&self->_flags |= 0x810u;
  self->_logoWithoutPaddingIdentifier = a3;
}

- (void)setHasLogoWithoutPaddingIdentifier:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 2064;
  else
    v3 = 2048;
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFEF | v3;
}

- (BOOL)hasLogoWithoutPaddingIdentifier
{
  return (*(_WORD *)&self->_flags >> 4) & 1;
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
  v8.super_class = (Class)GEOLocalizedPublisherAttribution;
  -[GEOLocalizedPublisherAttribution description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOLocalizedPublisherAttribution dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOLocalizedPublisherAttribution _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  __int16 v8;
  void *v9;
  void *v10;
  void *v11;
  __int16 v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  void *v22;
  void *v23;
  _QWORD v24[4];
  id v25;

  if (!a1)
    return 0;
  objc_msgSend((id)a1, "readAll:", 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)a1, "language");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    objc_msgSend(v4, "setObject:forKey:", v5, CFSTR("language"));

  objc_msgSend((id)a1, "displayName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    objc_msgSend(v4, "setObject:forKey:", v6, CFSTR("displayName"));

  objc_msgSend((id)a1, "subtitle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
    objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("subtitle"));

  v8 = *(_WORD *)(a1 + 96);
  if ((v8 & 1) == 0)
  {
    if ((v8 & 8) == 0)
      goto LABEL_10;
LABEL_27:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 88));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v23, CFSTR("logoIdentifier"));

    if ((*(_WORD *)(a1 + 96) & 4) == 0)
      goto LABEL_12;
    goto LABEL_11;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 76));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v22, CFSTR("iconIdentifier"));

  v8 = *(_WORD *)(a1 + 96);
  if ((v8 & 8) != 0)
    goto LABEL_27;
LABEL_10:
  if ((v8 & 4) != 0)
  {
LABEL_11:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 84));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v9, CFSTR("logoCenteredIdentifier"));

  }
LABEL_12:
  objc_msgSend((id)a1, "themeColorLightMode");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
    objc_msgSend(v4, "setObject:forKey:", v10, CFSTR("themeColorLightMode"));

  objc_msgSend((id)a1, "themeColorDarkMode");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
    objc_msgSend(v4, "setObject:forKey:", v11, CFSTR("themeColorDarkMode"));

  v12 = *(_WORD *)(a1 + 96);
  if ((v12 & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 80));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v13, CFSTR("logoCenteredColorizedIdentifier"));

    v12 = *(_WORD *)(a1 + 96);
  }
  if ((v12 & 0x10) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 92));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v14, CFSTR("logoWithoutPaddingIdentifier"));

  }
  v15 = *(void **)(a1 + 16);
  if (v15)
  {
    objc_msgSend(v15, "dictionaryRepresentation");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v16;
    if (a2)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v16, "count"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v24[0] = MEMORY[0x1E0C809B0];
      v24[1] = 3221225472;
      v24[2] = __62__GEOLocalizedPublisherAttribution__dictionaryRepresentation___block_invoke;
      v24[3] = &unk_1E1C00600;
      v19 = v18;
      v25 = v19;
      objc_msgSend(v17, "enumerateKeysAndObjectsUsingBlock:", v24);
      v20 = v19;

      v17 = v20;
    }
    objc_msgSend(v4, "setObject:forKey:", v17, CFSTR("Unknown Fields"));

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOLocalizedPublisherAttribution _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __62__GEOLocalizedPublisherAttribution__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  char isKindOfClass;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a2;
  v5 = a3;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v7 = *(void **)(a1 + 32);
  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v5, "base64EncodedStringWithOptions:", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "description");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKey:", v8, v9);

  }
  else
  {
    objc_msgSend(v10, "description");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKey:", v5, v8);
  }

}

- (GEOLocalizedPublisherAttribution)initWithDictionary:(id)a3
{
  return (GEOLocalizedPublisherAttribution *)-[GEOLocalizedPublisherAttribution _initWithDictionary:isJSON:](self, a3);
}

- (void)_initWithDictionary:(void *)a1 isJSON:(void *)a2
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
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
  void *v18;

  v3 = a2;
  if (a1)
  {
    a1 = (void *)objc_msgSend(a1, "init");
    if (a1)
    {
      objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("language"));
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v5 = (void *)objc_msgSend(v4, "copy");
        objc_msgSend(a1, "setLanguage:", v5);

      }
      objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("displayName"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v7 = (void *)objc_msgSend(v6, "copy");
        objc_msgSend(a1, "setDisplayName:", v7);

      }
      objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("subtitle"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v9 = (void *)objc_msgSend(v8, "copy");
        objc_msgSend(a1, "setSubtitle:", v9);

      }
      objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("iconIdentifier"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setIconIdentifier:", objc_msgSend(v10, "unsignedIntValue"));

      objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("logoIdentifier"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setLogoIdentifier:", objc_msgSend(v11, "unsignedIntValue"));

      objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("logoCenteredIdentifier"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setLogoCenteredIdentifier:", objc_msgSend(v12, "unsignedIntValue"));

      objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("themeColorLightMode"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v14 = (void *)objc_msgSend(v13, "copy");
        objc_msgSend(a1, "setThemeColorLightMode:", v14);

      }
      objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("themeColorDarkMode"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v16 = (void *)objc_msgSend(v15, "copy");
        objc_msgSend(a1, "setThemeColorDarkMode:", v16);

      }
      objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("logoCenteredColorizedIdentifier"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setLogoCenteredColorizedIdentifier:", objc_msgSend(v17, "unsignedIntValue"));

      objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("logoWithoutPaddingIdentifier"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setLogoWithoutPaddingIdentifier:", objc_msgSend(v18, "unsignedIntValue"));

    }
  }

  return a1;
}

- (GEOLocalizedPublisherAttribution)initWithJSON:(id)a3
{
  return (GEOLocalizedPublisherAttribution *)-[GEOLocalizedPublisherAttribution _initWithDictionary:isJSON:](self, a3);
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
      v8 = (int *)&readAll__recursiveTag_185;
    else
      v8 = (int *)&readAll__nonRecursiveTag_186;
    GEOLocalizedPublisherAttributionReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOLocalizedPublisherAttributionIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOLocalizedPublisherAttributionReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  os_unfair_lock_s *p_readerLock;
  id v5;
  __int16 flags;
  __int16 v7;
  PBDataReader *v8;
  void *v9;
  id v10;

  v10 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader)
  {
    os_unfair_lock_assert_owner(&self->_readerLock);
    if ((*(_WORD *)&self->_flags & 0xFC0) == 0)
    {
      v8 = self->_reader;
      objc_sync_enter(v8);
      *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
      -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
      -[PBDataReader readBytes:](self->_reader, "readBytes:", self->_readerMarkLength - self->_readerMarkPos);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "writeData:", v9);
      os_unfair_lock_unlock(p_readerLock);

      objc_sync_exit(v8);
      goto LABEL_26;
    }
  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOLocalizedPublisherAttribution readAll:](self, "readAll:", 0);
  if (self->_language)
    PBDataWriterWriteStringField();
  v5 = v10;
  if (self->_displayName)
  {
    PBDataWriterWriteStringField();
    v5 = v10;
  }
  if (self->_subtitle)
  {
    PBDataWriterWriteStringField();
    v5 = v10;
  }
  flags = (__int16)self->_flags;
  if ((flags & 1) == 0)
  {
    if ((flags & 8) == 0)
      goto LABEL_11;
LABEL_23:
    PBDataWriterWriteUint32Field();
    v5 = v10;
    if ((*(_WORD *)&self->_flags & 4) == 0)
      goto LABEL_13;
    goto LABEL_12;
  }
  PBDataWriterWriteUint32Field();
  v5 = v10;
  flags = (__int16)self->_flags;
  if ((flags & 8) != 0)
    goto LABEL_23;
LABEL_11:
  if ((flags & 4) != 0)
  {
LABEL_12:
    PBDataWriterWriteUint32Field();
    v5 = v10;
  }
LABEL_13:
  if (self->_themeColorLightMode)
  {
    PBDataWriterWriteStringField();
    v5 = v10;
  }
  if (self->_themeColorDarkMode)
  {
    PBDataWriterWriteStringField();
    v5 = v10;
  }
  v7 = (__int16)self->_flags;
  if ((v7 & 2) != 0)
  {
    PBDataWriterWriteUint32Field();
    v5 = v10;
    v7 = (__int16)self->_flags;
  }
  if ((v7 & 0x10) != 0)
  {
    PBDataWriterWriteUint32Field();
    v5 = v10;
  }
  -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v5);
LABEL_26:

}

- (void)copyTo:(id)a3
{
  id *v4;
  __int16 flags;
  __int16 v6;
  id *v7;

  v7 = (id *)a3;
  -[GEOLocalizedPublisherAttribution readAll:](self, "readAll:", 0);
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v7 + 1, self->_reader);
  *((_DWORD *)v7 + 16) = self->_readerMarkPos;
  *((_DWORD *)v7 + 17) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (self->_language)
    objc_msgSend(v7, "setLanguage:");
  if (self->_displayName)
    objc_msgSend(v7, "setDisplayName:");
  v4 = v7;
  if (self->_subtitle)
  {
    objc_msgSend(v7, "setSubtitle:");
    v4 = v7;
  }
  flags = (__int16)self->_flags;
  if ((flags & 1) != 0)
  {
    *((_DWORD *)v4 + 19) = self->_iconIdentifier;
    *((_WORD *)v4 + 48) |= 1u;
    flags = (__int16)self->_flags;
    if ((flags & 8) == 0)
    {
LABEL_9:
      if ((flags & 4) == 0)
        goto LABEL_11;
      goto LABEL_10;
    }
  }
  else if ((flags & 8) == 0)
  {
    goto LABEL_9;
  }
  *((_DWORD *)v4 + 22) = self->_logoIdentifier;
  *((_WORD *)v4 + 48) |= 8u;
  if ((*(_WORD *)&self->_flags & 4) != 0)
  {
LABEL_10:
    *((_DWORD *)v4 + 21) = self->_logoCenteredIdentifier;
    *((_WORD *)v4 + 48) |= 4u;
  }
LABEL_11:
  if (self->_themeColorLightMode)
  {
    objc_msgSend(v7, "setThemeColorLightMode:");
    v4 = v7;
  }
  if (self->_themeColorDarkMode)
  {
    objc_msgSend(v7, "setThemeColorDarkMode:");
    v4 = v7;
  }
  v6 = (__int16)self->_flags;
  if ((v6 & 2) != 0)
  {
    *((_DWORD *)v4 + 20) = self->_logoCenteredColorizedIdentifier;
    *((_WORD *)v4 + 48) |= 2u;
    v6 = (__int16)self->_flags;
  }
  if ((v6 & 0x10) != 0)
  {
    *((_DWORD *)v4 + 23) = self->_logoWithoutPaddingIdentifier;
    *((_WORD *)v4 + 48) |= 0x10u;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  PBDataReader *reader;
  PBDataReader *v7;
  id v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  __int16 flags;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  __int16 v20;
  PBUnknownFields *v21;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    v7 = reader;
    objc_sync_enter(v7);
    if ((*(_WORD *)&self->_flags & 0x800) == 0)
    {
      *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
      -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
      GEOLocalizedPublisherAttributionReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_14;
    }
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOLocalizedPublisherAttribution readAll:](self, "readAll:", 0);
  v9 = -[NSString copyWithZone:](self->_language, "copyWithZone:", a3);
  v10 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v9;

  v11 = -[NSString copyWithZone:](self->_displayName, "copyWithZone:", a3);
  v12 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v11;

  v13 = -[NSString copyWithZone:](self->_subtitle, "copyWithZone:", a3);
  v14 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v13;

  flags = (__int16)self->_flags;
  if ((flags & 1) == 0)
  {
    if ((flags & 8) == 0)
      goto LABEL_7;
LABEL_16:
    *(_DWORD *)(v5 + 88) = self->_logoIdentifier;
    *(_WORD *)(v5 + 96) |= 8u;
    if ((*(_WORD *)&self->_flags & 4) == 0)
      goto LABEL_9;
    goto LABEL_8;
  }
  *(_DWORD *)(v5 + 76) = self->_iconIdentifier;
  *(_WORD *)(v5 + 96) |= 1u;
  flags = (__int16)self->_flags;
  if ((flags & 8) != 0)
    goto LABEL_16;
LABEL_7:
  if ((flags & 4) != 0)
  {
LABEL_8:
    *(_DWORD *)(v5 + 84) = self->_logoCenteredIdentifier;
    *(_WORD *)(v5 + 96) |= 4u;
  }
LABEL_9:
  v16 = -[NSString copyWithZone:](self->_themeColorLightMode, "copyWithZone:", a3);
  v17 = *(void **)(v5 + 56);
  *(_QWORD *)(v5 + 56) = v16;

  v18 = -[NSString copyWithZone:](self->_themeColorDarkMode, "copyWithZone:", a3);
  v19 = *(void **)(v5 + 48);
  *(_QWORD *)(v5 + 48) = v18;

  v20 = (__int16)self->_flags;
  if ((v20 & 2) != 0)
  {
    *(_DWORD *)(v5 + 80) = self->_logoCenteredColorizedIdentifier;
    *(_WORD *)(v5 + 96) |= 2u;
    v20 = (__int16)self->_flags;
  }
  if ((v20 & 0x10) != 0)
  {
    *(_DWORD *)(v5 + 92) = self->_logoWithoutPaddingIdentifier;
    *(_WORD *)(v5 + 96) |= 0x10u;
  }
  v21 = self->_unknownFields;
  v8 = *(id *)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v21;
LABEL_14:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *language;
  NSString *displayName;
  NSString *subtitle;
  __int16 flags;
  __int16 v9;
  NSString *themeColorLightMode;
  NSString *themeColorDarkMode;
  __int16 v12;
  __int16 v13;
  BOOL v14;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_36;
  -[GEOLocalizedPublisherAttribution readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  language = self->_language;
  if ((unint64_t)language | *((_QWORD *)v4 + 4))
  {
    if (!-[NSString isEqual:](language, "isEqual:"))
      goto LABEL_36;
  }
  displayName = self->_displayName;
  if ((unint64_t)displayName | *((_QWORD *)v4 + 3))
  {
    if (!-[NSString isEqual:](displayName, "isEqual:"))
      goto LABEL_36;
  }
  subtitle = self->_subtitle;
  if ((unint64_t)subtitle | *((_QWORD *)v4 + 5))
  {
    if (!-[NSString isEqual:](subtitle, "isEqual:"))
      goto LABEL_36;
  }
  flags = (__int16)self->_flags;
  v9 = *((_WORD *)v4 + 48);
  if ((flags & 1) != 0)
  {
    if ((v9 & 1) == 0 || self->_iconIdentifier != *((_DWORD *)v4 + 19))
      goto LABEL_36;
  }
  else if ((v9 & 1) != 0)
  {
LABEL_36:
    v14 = 0;
    goto LABEL_37;
  }
  if ((flags & 8) != 0)
  {
    if ((v9 & 8) == 0 || self->_logoIdentifier != *((_DWORD *)v4 + 22))
      goto LABEL_36;
  }
  else if ((v9 & 8) != 0)
  {
    goto LABEL_36;
  }
  if ((flags & 4) != 0)
  {
    if ((v9 & 4) == 0 || self->_logoCenteredIdentifier != *((_DWORD *)v4 + 21))
      goto LABEL_36;
  }
  else if ((v9 & 4) != 0)
  {
    goto LABEL_36;
  }
  themeColorLightMode = self->_themeColorLightMode;
  if ((unint64_t)themeColorLightMode | *((_QWORD *)v4 + 7)
    && !-[NSString isEqual:](themeColorLightMode, "isEqual:"))
  {
    goto LABEL_36;
  }
  themeColorDarkMode = self->_themeColorDarkMode;
  if ((unint64_t)themeColorDarkMode | *((_QWORD *)v4 + 6))
  {
    if (!-[NSString isEqual:](themeColorDarkMode, "isEqual:"))
      goto LABEL_36;
  }
  v12 = (__int16)self->_flags;
  v13 = *((_WORD *)v4 + 48);
  if ((v12 & 2) != 0)
  {
    if ((v13 & 2) == 0 || self->_logoCenteredColorizedIdentifier != *((_DWORD *)v4 + 20))
      goto LABEL_36;
  }
  else if ((v13 & 2) != 0)
  {
    goto LABEL_36;
  }
  v14 = (v13 & 0x10) == 0;
  if ((v12 & 0x10) != 0)
  {
    if ((v13 & 0x10) == 0 || self->_logoWithoutPaddingIdentifier != *((_DWORD *)v4 + 23))
      goto LABEL_36;
    v14 = 1;
  }
LABEL_37:

  return v14;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;
  NSUInteger v5;
  __int16 flags;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSUInteger v10;
  NSUInteger v11;
  __int16 v12;
  uint64_t v13;
  uint64_t v14;

  -[GEOLocalizedPublisherAttribution readAll:](self, "readAll:", 1);
  v3 = -[NSString hash](self->_language, "hash");
  v4 = -[NSString hash](self->_displayName, "hash");
  v5 = -[NSString hash](self->_subtitle, "hash");
  flags = (__int16)self->_flags;
  if ((flags & 1) == 0)
  {
    v7 = 0;
    if ((flags & 8) != 0)
      goto LABEL_3;
LABEL_6:
    v8 = 0;
    if ((flags & 4) != 0)
      goto LABEL_4;
    goto LABEL_7;
  }
  v7 = 2654435761 * self->_iconIdentifier;
  if ((flags & 8) == 0)
    goto LABEL_6;
LABEL_3:
  v8 = 2654435761 * self->_logoIdentifier;
  if ((flags & 4) != 0)
  {
LABEL_4:
    v9 = 2654435761 * self->_logoCenteredIdentifier;
    goto LABEL_8;
  }
LABEL_7:
  v9 = 0;
LABEL_8:
  v10 = -[NSString hash](self->_themeColorLightMode, "hash");
  v11 = -[NSString hash](self->_themeColorDarkMode, "hash");
  v12 = (__int16)self->_flags;
  if ((v12 & 2) != 0)
  {
    v13 = 2654435761 * self->_logoCenteredColorizedIdentifier;
    if ((v12 & 0x10) != 0)
      goto LABEL_10;
LABEL_12:
    v14 = 0;
    return v4 ^ v3 ^ v5 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v13 ^ v14;
  }
  v13 = 0;
  if ((v12 & 0x10) == 0)
    goto LABEL_12;
LABEL_10:
  v14 = 2654435761 * self->_logoWithoutPaddingIdentifier;
  return v4 ^ v3 ^ v5 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v13 ^ v14;
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;
  __int16 v5;
  __int16 v6;
  _QWORD *v7;

  v7 = a3;
  objc_msgSend(v7, "readAll:", 0);
  v4 = v7;
  if (v7[4])
  {
    -[GEOLocalizedPublisherAttribution setLanguage:](self, "setLanguage:");
    v4 = v7;
  }
  if (v4[3])
  {
    -[GEOLocalizedPublisherAttribution setDisplayName:](self, "setDisplayName:");
    v4 = v7;
  }
  if (v4[5])
  {
    -[GEOLocalizedPublisherAttribution setSubtitle:](self, "setSubtitle:");
    v4 = v7;
  }
  v5 = *((_WORD *)v4 + 48);
  if ((v5 & 1) != 0)
  {
    self->_iconIdentifier = *((_DWORD *)v4 + 19);
    *(_WORD *)&self->_flags |= 1u;
    v5 = *((_WORD *)v4 + 48);
    if ((v5 & 8) == 0)
    {
LABEL_9:
      if ((v5 & 4) == 0)
        goto LABEL_11;
      goto LABEL_10;
    }
  }
  else if ((v5 & 8) == 0)
  {
    goto LABEL_9;
  }
  self->_logoIdentifier = *((_DWORD *)v4 + 22);
  *(_WORD *)&self->_flags |= 8u;
  if ((v4[12] & 4) != 0)
  {
LABEL_10:
    self->_logoCenteredIdentifier = *((_DWORD *)v4 + 21);
    *(_WORD *)&self->_flags |= 4u;
  }
LABEL_11:
  if (v4[7])
  {
    -[GEOLocalizedPublisherAttribution setThemeColorLightMode:](self, "setThemeColorLightMode:");
    v4 = v7;
  }
  if (v4[6])
  {
    -[GEOLocalizedPublisherAttribution setThemeColorDarkMode:](self, "setThemeColorDarkMode:");
    v4 = v7;
  }
  v6 = *((_WORD *)v4 + 48);
  if ((v6 & 2) != 0)
  {
    self->_logoCenteredColorizedIdentifier = *((_DWORD *)v4 + 20);
    *(_WORD *)&self->_flags |= 2u;
    v6 = *((_WORD *)v4 + 48);
  }
  if ((v6 & 0x10) != 0)
  {
    self->_logoWithoutPaddingIdentifier = *((_DWORD *)v4 + 23);
    *(_WORD *)&self->_flags |= 0x10u;
  }

}

- (PBUnknownFields)unknownFields
{
  os_unfair_lock_s *p_readerLock;
  PBDataReader *reader;
  PBDataReader *v5;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if ((*(_WORD *)&self->_flags & 0x20) == 0)
  {
    reader = self->_reader;
    if (reader)
    {
      v5 = reader;
      objc_sync_enter(v5);
      GEOLocalizedPublisherAttributionReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&unknownFields_tags_189);
      objc_sync_exit(v5);

    }
  }
  os_unfair_lock_unlock(p_readerLock);
  return self->_unknownFields;
}

- (void)clearUnknownFields:(BOOL)a3
{
  _BOOL4 v3;
  os_unfair_lock_s *p_readerLock;
  PBUnknownFields *unknownFields;

  v3 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x820u;
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
    -[GEOLocalizedPublisherAttribution readAll:](self, "readAll:", 0);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_themeColorLightMode, 0);
  objc_storeStrong((id *)&self->_themeColorDarkMode, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_language, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
