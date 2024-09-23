@implementation GEOAnnouncement

- (GEOAnnouncement)init
{
  GEOAnnouncement *v2;
  GEOAnnouncement *v3;
  GEOAnnouncement *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOAnnouncement;
  v2 = -[GEOAnnouncement init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOAnnouncement)initWithData:(id)a3
{
  GEOAnnouncement *v3;
  GEOAnnouncement *v4;
  GEOAnnouncement *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOAnnouncement;
  v3 = -[GEOAnnouncement initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (unsigned)announcementID
{
  return self->_announcementID;
}

- (void)setAnnouncementID:(unsigned int)a3
{
  *(_WORD *)&self->_flags |= 0x1001u;
  self->_announcementID = a3;
}

- (void)setHasAnnouncementID:(BOOL)a3
{
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFFE | a3 | 0x1000;
}

- (BOOL)hasAnnouncementID
{
  return *(_WORD *)&self->_flags & 1;
}

- (void)_readMapRegion
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 88));
    if ((*(_WORD *)(a1 + 108) & 0x200) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOAnnouncementReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readMapRegion_tags_1);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
  }
}

- (BOOL)hasMapRegion
{
  -[GEOAnnouncement _readMapRegion]((uint64_t)self);
  return self->_mapRegion != 0;
}

- (GEOMapRegion)mapRegion
{
  -[GEOAnnouncement _readMapRegion]((uint64_t)self);
  return self->_mapRegion;
}

- (void)setMapRegion:(id)a3
{
  *(_WORD *)&self->_flags |= 0x1200u;
  objc_storeStrong((id *)&self->_mapRegion, a3);
}

- (void)_readUserMessage
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 88));
    if ((*(_WORD *)(a1 + 108) & 0x800) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOAnnouncementReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readUserMessage_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
  }
}

- (BOOL)hasUserMessage
{
  -[GEOAnnouncement _readUserMessage]((uint64_t)self);
  return self->_userMessage != 0;
}

- (NSString)userMessage
{
  -[GEOAnnouncement _readUserMessage]((uint64_t)self);
  return self->_userMessage;
}

- (void)setUserMessage:(id)a3
{
  *(_WORD *)&self->_flags |= 0x1800u;
  objc_storeStrong((id *)&self->_userMessage, a3);
}

- (void)_readButtonOneMessage
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 88));
    if ((*(_WORD *)(a1 + 108) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOAnnouncementReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readButtonOneMessage_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
  }
}

- (BOOL)hasButtonOneMessage
{
  -[GEOAnnouncement _readButtonOneMessage]((uint64_t)self);
  return self->_buttonOneMessage != 0;
}

- (NSString)buttonOneMessage
{
  -[GEOAnnouncement _readButtonOneMessage]((uint64_t)self);
  return self->_buttonOneMessage;
}

- (void)setButtonOneMessage:(id)a3
{
  *(_WORD *)&self->_flags |= 0x1020u;
  objc_storeStrong((id *)&self->_buttonOneMessage, a3);
}

- (void)_readButtonOneAppURI
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 88));
    if ((*(_WORD *)(a1 + 108) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOAnnouncementReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readButtonOneAppURI_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
  }
}

- (BOOL)hasButtonOneAppURI
{
  -[GEOAnnouncement _readButtonOneAppURI]((uint64_t)self);
  return self->_buttonOneAppURI != 0;
}

- (NSString)buttonOneAppURI
{
  -[GEOAnnouncement _readButtonOneAppURI]((uint64_t)self);
  return self->_buttonOneAppURI;
}

- (void)setButtonOneAppURI:(id)a3
{
  *(_WORD *)&self->_flags |= 0x1010u;
  objc_storeStrong((id *)&self->_buttonOneAppURI, a3);
}

- (void)_readButtonTwoMessage
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 88));
    if ((*(_WORD *)(a1 + 108) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOAnnouncementReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readButtonTwoMessage_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
  }
}

- (BOOL)hasButtonTwoMessage
{
  -[GEOAnnouncement _readButtonTwoMessage]((uint64_t)self);
  return self->_buttonTwoMessage != 0;
}

- (NSString)buttonTwoMessage
{
  -[GEOAnnouncement _readButtonTwoMessage]((uint64_t)self);
  return self->_buttonTwoMessage;
}

- (void)setButtonTwoMessage:(id)a3
{
  *(_WORD *)&self->_flags |= 0x1080u;
  objc_storeStrong((id *)&self->_buttonTwoMessage, a3);
}

- (void)_readButtonTwoAppURI
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 88));
    if ((*(_WORD *)(a1 + 108) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOAnnouncementReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readButtonTwoAppURI_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
  }
}

- (BOOL)hasButtonTwoAppURI
{
  -[GEOAnnouncement _readButtonTwoAppURI]((uint64_t)self);
  return self->_buttonTwoAppURI != 0;
}

- (NSString)buttonTwoAppURI
{
  -[GEOAnnouncement _readButtonTwoAppURI]((uint64_t)self);
  return self->_buttonTwoAppURI;
}

- (void)setButtonTwoAppURI:(id)a3
{
  *(_WORD *)&self->_flags |= 0x1040u;
  objc_storeStrong((id *)&self->_buttonTwoAppURI, a3);
}

- (unsigned)displayDestinations
{
  return self->_displayDestinations;
}

- (void)setDisplayDestinations:(unsigned int)a3
{
  *(_WORD *)&self->_flags |= 0x1004u;
  self->_displayDestinations = a3;
}

- (void)setHasDisplayDestinations:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 4100;
  else
    v3 = 4096;
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFFB | v3;
}

- (BOOL)hasDisplayDestinations
{
  return (*(_WORD *)&self->_flags >> 2) & 1;
}

- (int)releasePhase
{
  os_unfair_lock_s *p_readerLock;
  __int16 flags;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  flags = (__int16)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((flags & 8) != 0)
    return self->_releasePhase;
  else
    return 1;
}

- (void)setReleasePhase:(int)a3
{
  *(_WORD *)&self->_flags |= 0x1008u;
  self->_releasePhase = a3;
}

- (void)setHasReleasePhase:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 4104;
  else
    v3 = 4096;
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFF7 | v3;
}

- (BOOL)hasReleasePhase
{
  return (*(_WORD *)&self->_flags >> 3) & 1;
}

- (id)releasePhaseAsString:(int)a3
{
  if ((a3 - 1) < 3)
    return off_1E1C07A08[a3 - 1];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsReleasePhase:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PHASE_PRODUCTION")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PHASE_INTERNAL")) & 1) != 0)
  {
    v4 = 2;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("PHASE_BETA")))
  {
    v4 = 3;
  }
  else
  {
    v4 = 1;
  }

  return v4;
}

- (void)_readFlyoverInfo
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 88));
    if ((*(_WORD *)(a1 + 108) & 0x100) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOAnnouncementReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readFlyoverInfo_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
  }
}

- (BOOL)hasFlyoverInfo
{
  -[GEOAnnouncement _readFlyoverInfo]((uint64_t)self);
  return self->_flyoverInfo != 0;
}

- (GEOPDFlyover)flyoverInfo
{
  -[GEOAnnouncement _readFlyoverInfo]((uint64_t)self);
  return self->_flyoverInfo;
}

- (void)setFlyoverInfo:(id)a3
{
  *(_WORD *)&self->_flags |= 0x1100u;
  objc_storeStrong((id *)&self->_flyoverInfo, a3);
}

- (void)_readTitle
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 88));
    if ((*(_WORD *)(a1 + 108) & 0x400) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOAnnouncementReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readTitle_tags_3);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
  }
}

- (BOOL)hasTitle
{
  -[GEOAnnouncement _readTitle]((uint64_t)self);
  return self->_title != 0;
}

- (NSString)title
{
  -[GEOAnnouncement _readTitle]((uint64_t)self);
  return self->_title;
}

- (void)setTitle:(id)a3
{
  *(_WORD *)&self->_flags |= 0x1400u;
  objc_storeStrong((id *)&self->_title, a3);
}

- (int)announcementType
{
  os_unfair_lock_s *p_readerLock;
  __int16 flags;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  flags = (__int16)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((flags & 2) != 0)
    return self->_announcementType;
  else
    return 0;
}

- (void)setAnnouncementType:(int)a3
{
  *(_WORD *)&self->_flags |= 0x1002u;
  self->_announcementType = a3;
}

- (void)setHasAnnouncementType:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 4098;
  else
    v3 = 4096;
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFFD | v3;
}

- (BOOL)hasAnnouncementType
{
  return (*(_WORD *)&self->_flags >> 1) & 1;
}

- (id)announcementTypeAsString:(int)a3
{
  if (a3 < 8)
    return off_1E1C07A20[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsAnnouncementType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ANNOUNCEMENT_TYPE_UNKNOWN")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ANNOUNCEMENT_TYPE_GENERAL")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ANNOUNCEMENT_TYPE_FLYOVER")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ANNOUNCEMENT_TYPE_TRANSIT")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ANNOUNCEMENT_TYPE_VENUES")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ANNOUNCEMENT_TYPE_ENHANCED_DETAIL")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ANNOUNCEMENT_TYPE_LANE_GUIDANCE")) & 1) != 0)
  {
    v4 = 6;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("ANNOUNCEMENT_TYPE_LOOK_AROUND")))
  {
    v4 = 7;
  }
  else
  {
    v4 = 0;
  }

  return v4;
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
  v8.super_class = (Class)GEOAnnouncement;
  -[GEOAnnouncement description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOAnnouncement dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOAnnouncement _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
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
  __int16 v14;
  void *v15;
  unsigned int v16;
  __CFString *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  __CFString *v23;

  if (a1)
  {
    objc_msgSend((id)a1, "readAll:", 1);
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if ((*(_WORD *)(a1 + 108) & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 92));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKey:", v5, CFSTR("announcementID"));

    }
    objc_msgSend((id)a1, "mapRegion");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
    {
      if ((a2 & 1) != 0)
        objc_msgSend(v6, "jsonRepresentation");
      else
        objc_msgSend(v6, "dictionaryRepresentation");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKey:", v8, CFSTR("mapRegion"));

    }
    objc_msgSend((id)a1, "userMessage");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
      objc_msgSend(v4, "setObject:forKey:", v9, CFSTR("userMessage"));

    objc_msgSend((id)a1, "buttonOneMessage");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
      objc_msgSend(v4, "setObject:forKey:", v10, CFSTR("buttonOneMessage"));

    objc_msgSend((id)a1, "buttonOneAppURI");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
      objc_msgSend(v4, "setObject:forKey:", v11, CFSTR("buttonOneAppURI"));

    objc_msgSend((id)a1, "buttonTwoMessage");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
      objc_msgSend(v4, "setObject:forKey:", v12, CFSTR("buttonTwoMessage"));

    objc_msgSend((id)a1, "buttonTwoAppURI");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
      objc_msgSend(v4, "setObject:forKey:", v13, CFSTR("buttonTwoAppURI"));

    v14 = *(_WORD *)(a1 + 108);
    if ((v14 & 4) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 100));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKey:", v15, CFSTR("displayDestinations"));

      v14 = *(_WORD *)(a1 + 108);
    }
    if ((v14 & 8) != 0)
    {
      v16 = *(_DWORD *)(a1 + 104) - 1;
      if (v16 >= 3)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(unsigned int *)(a1 + 104));
        v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v17 = off_1E1C07A08[v16];
      }
      objc_msgSend(v4, "setObject:forKey:", v17, CFSTR("releasePhase"));

    }
    objc_msgSend((id)a1, "flyoverInfo");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v18;
    if (v18)
    {
      if ((a2 & 1) != 0)
        objc_msgSend(v18, "jsonRepresentation");
      else
        objc_msgSend(v18, "dictionaryRepresentation");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKey:", v20, CFSTR("flyoverInfo"));

    }
    objc_msgSend((id)a1, "title");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (v21)
      objc_msgSend(v4, "setObject:forKey:", v21, CFSTR("title"));

    if ((*(_WORD *)(a1 + 108) & 2) != 0)
    {
      v22 = *(int *)(a1 + 96);
      if (v22 >= 8)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 96));
        v23 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v23 = off_1E1C07A20[v22];
      }
      objc_msgSend(v4, "setObject:forKey:", v23, CFSTR("announcementType"));

    }
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOAnnouncement _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEOAnnouncement)initWithDictionary:(id)a3
{
  return (GEOAnnouncement *)-[GEOAnnouncement _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(char)a3 isJSON:
{
  id v5;
  void *v6;
  void *v7;
  GEOMapRegion *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  uint64_t v24;
  void *v25;
  GEOPDFlyover *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  uint64_t v33;

  v5 = a2;
  if (a1)
  {
    a1 = (void *)objc_msgSend(a1, "init");
    if (a1)
    {
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("announcementID"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setAnnouncementID:", objc_msgSend(v6, "unsignedIntValue"));

      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("mapRegion"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v8 = [GEOMapRegion alloc];
        if ((a3 & 1) != 0)
          v9 = -[GEOMapRegion initWithJSON:](v8, "initWithJSON:", v7);
        else
          v9 = -[GEOMapRegion initWithDictionary:](v8, "initWithDictionary:", v7);
        v10 = (void *)v9;
        objc_msgSend(a1, "setMapRegion:", v9);

      }
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("userMessage"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v12 = (void *)objc_msgSend(v11, "copy");
        objc_msgSend(a1, "setUserMessage:", v12);

      }
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("buttonOneMessage"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v14 = (void *)objc_msgSend(v13, "copy");
        objc_msgSend(a1, "setButtonOneMessage:", v14);

      }
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("buttonOneAppURI"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v16 = (void *)objc_msgSend(v15, "copy");
        objc_msgSend(a1, "setButtonOneAppURI:", v16);

      }
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("buttonTwoMessage"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v18 = (void *)objc_msgSend(v17, "copy");
        objc_msgSend(a1, "setButtonTwoMessage:", v18);

      }
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("buttonTwoAppURI"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v20 = (void *)objc_msgSend(v19, "copy");
        objc_msgSend(a1, "setButtonTwoAppURI:", v20);

      }
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("displayDestinations"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setDisplayDestinations:", objc_msgSend(v21, "unsignedIntValue"));

      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("releasePhase"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v23 = v22;
        if ((objc_msgSend(v23, "isEqualToString:", CFSTR("PHASE_PRODUCTION")) & 1) != 0)
        {
          v24 = 1;
        }
        else if ((objc_msgSend(v23, "isEqualToString:", CFSTR("PHASE_INTERNAL")) & 1) != 0)
        {
          v24 = 2;
        }
        else if (objc_msgSend(v23, "isEqualToString:", CFSTR("PHASE_BETA")))
        {
          v24 = 3;
        }
        else
        {
          v24 = 1;
        }

      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
          goto LABEL_34;
        v24 = objc_msgSend(v22, "intValue");
      }
      objc_msgSend(a1, "setReleasePhase:", v24);
LABEL_34:

      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("flyoverInfo"));
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v26 = [GEOPDFlyover alloc];
        if ((a3 & 1) != 0)
          v27 = -[GEOPDFlyover initWithJSON:](v26, "initWithJSON:", v25);
        else
          v27 = -[GEOPDFlyover initWithDictionary:](v26, "initWithDictionary:", v25);
        v28 = (void *)v27;
        objc_msgSend(a1, "setFlyoverInfo:", v27);

      }
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("title"));
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v30 = (void *)objc_msgSend(v29, "copy");
        objc_msgSend(a1, "setTitle:", v30);

      }
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("announcementType"));
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v32 = v31;
        if ((objc_msgSend(v32, "isEqualToString:", CFSTR("ANNOUNCEMENT_TYPE_UNKNOWN")) & 1) != 0)
        {
          v33 = 0;
        }
        else if ((objc_msgSend(v32, "isEqualToString:", CFSTR("ANNOUNCEMENT_TYPE_GENERAL")) & 1) != 0)
        {
          v33 = 1;
        }
        else if ((objc_msgSend(v32, "isEqualToString:", CFSTR("ANNOUNCEMENT_TYPE_FLYOVER")) & 1) != 0)
        {
          v33 = 2;
        }
        else if ((objc_msgSend(v32, "isEqualToString:", CFSTR("ANNOUNCEMENT_TYPE_TRANSIT")) & 1) != 0)
        {
          v33 = 3;
        }
        else if ((objc_msgSend(v32, "isEqualToString:", CFSTR("ANNOUNCEMENT_TYPE_VENUES")) & 1) != 0)
        {
          v33 = 4;
        }
        else if ((objc_msgSend(v32, "isEqualToString:", CFSTR("ANNOUNCEMENT_TYPE_ENHANCED_DETAIL")) & 1) != 0)
        {
          v33 = 5;
        }
        else if ((objc_msgSend(v32, "isEqualToString:", CFSTR("ANNOUNCEMENT_TYPE_LANE_GUIDANCE")) & 1) != 0)
        {
          v33 = 6;
        }
        else if (objc_msgSend(v32, "isEqualToString:", CFSTR("ANNOUNCEMENT_TYPE_LOOK_AROUND")))
        {
          v33 = 7;
        }
        else
        {
          v33 = 0;
        }

      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
LABEL_63:

          goto LABEL_64;
        }
        v33 = objc_msgSend(v31, "intValue");
      }
      objc_msgSend(a1, "setAnnouncementType:", v33);
      goto LABEL_63;
    }
  }
LABEL_64:

  return a1;
}

- (GEOAnnouncement)initWithJSON:(id)a3
{
  return (GEOAnnouncement *)-[GEOAnnouncement _initWithDictionary:isJSON:](self, a3, 1);
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
      v8 = (int *)&readAll__recursiveTag_22;
    else
      v8 = (int *)&readAll__nonRecursiveTag_22;
    GEOAnnouncementReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);

  }
  if (v3)
  {
    -[GEOMapRegion readAll:](self->_mapRegion, "readAll:", 1);
    -[GEOPDFlyover readAll:](self->_flyoverInfo, "readAll:", 1);
  }
  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOAnnouncementIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOAnnouncementReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  os_unfair_lock_s *p_readerLock;
  __int16 flags;
  PBDataReader *v6;
  void *v7;
  id v8;

  v8 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEOAnnouncementIsDirty((uint64_t)self) & 1) == 0)
  {
    v6 = self->_reader;
    objc_sync_enter(v6);
    *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
    -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
    -[PBDataReader readBytes:](self->_reader, "readBytes:", self->_readerMarkLength - self->_readerMarkPos);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "writeData:", v7);
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v6);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOAnnouncement readAll:](self, "readAll:", 0);
    if ((*(_WORD *)&self->_flags & 1) != 0)
      PBDataWriterWriteUint32Field();
    if (self->_mapRegion)
      PBDataWriterWriteSubmessage();
    if (self->_userMessage)
      PBDataWriterWriteStringField();
    if (self->_buttonOneMessage)
      PBDataWriterWriteStringField();
    if (self->_buttonOneAppURI)
      PBDataWriterWriteStringField();
    if (self->_buttonTwoMessage)
      PBDataWriterWriteStringField();
    if (self->_buttonTwoAppURI)
      PBDataWriterWriteStringField();
    flags = (__int16)self->_flags;
    if ((flags & 4) != 0)
    {
      PBDataWriterWriteUint32Field();
      flags = (__int16)self->_flags;
    }
    if ((flags & 8) != 0)
      PBDataWriterWriteInt32Field();
    if (self->_flyoverInfo)
      PBDataWriterWriteSubmessage();
    if (self->_title)
      PBDataWriterWriteStringField();
    if ((*(_WORD *)&self->_flags & 2) != 0)
      PBDataWriterWriteInt32Field();
  }

}

- (BOOL)hasGreenTeaWithValue:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  -[GEOAnnouncement _readMapRegion]((uint64_t)self);
  return -[GEOMapRegion hasGreenTeaWithValue:](self->_mapRegion, "hasGreenTeaWithValue:", v3);
}

- (void)copyTo:(id)a3
{
  __int16 flags;
  id *v5;

  v5 = (id *)a3;
  -[GEOAnnouncement readAll:](self, "readAll:", 0);
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v5 + 1, self->_reader);
  *((_DWORD *)v5 + 20) = self->_readerMarkPos;
  *((_DWORD *)v5 + 21) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if ((*(_WORD *)&self->_flags & 1) != 0)
  {
    *((_DWORD *)v5 + 23) = self->_announcementID;
    *((_WORD *)v5 + 54) |= 1u;
  }
  if (self->_mapRegion)
    objc_msgSend(v5, "setMapRegion:");
  if (self->_userMessage)
    objc_msgSend(v5, "setUserMessage:");
  if (self->_buttonOneMessage)
    objc_msgSend(v5, "setButtonOneMessage:");
  if (self->_buttonOneAppURI)
    objc_msgSend(v5, "setButtonOneAppURI:");
  if (self->_buttonTwoMessage)
    objc_msgSend(v5, "setButtonTwoMessage:");
  if (self->_buttonTwoAppURI)
    objc_msgSend(v5, "setButtonTwoAppURI:");
  flags = (__int16)self->_flags;
  if ((flags & 4) != 0)
  {
    *((_DWORD *)v5 + 25) = self->_displayDestinations;
    *((_WORD *)v5 + 54) |= 4u;
    flags = (__int16)self->_flags;
  }
  if ((flags & 8) != 0)
  {
    *((_DWORD *)v5 + 26) = self->_releasePhase;
    *((_WORD *)v5 + 54) |= 8u;
  }
  if (self->_flyoverInfo)
    objc_msgSend(v5, "setFlyoverInfo:");
  if (self->_title)
    objc_msgSend(v5, "setTitle:");
  if ((*(_WORD *)&self->_flags & 2) != 0)
  {
    *((_DWORD *)v5 + 24) = self->_announcementType;
    *((_WORD *)v5 + 54) |= 2u;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  PBDataReader *reader;
  PBDataReader *v7;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  __int16 flags;
  id v22;
  void *v23;
  uint64_t v24;
  void *v25;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    v7 = reader;
    objc_sync_enter(v7);
    if ((*(_WORD *)&self->_flags & 0x1000) == 0)
    {
      *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
      -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
      GEOAnnouncementReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      v8 = (id)v5;
      objc_sync_exit(v7);

      return (id)v5;
    }
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOAnnouncement readAll:](self, "readAll:", 0);
  if ((*(_WORD *)&self->_flags & 1) != 0)
  {
    *(_DWORD *)(v5 + 92) = self->_announcementID;
    *(_WORD *)(v5 + 108) |= 1u;
  }
  v9 = -[GEOMapRegion copyWithZone:](self->_mapRegion, "copyWithZone:", a3);
  v10 = *(void **)(v5 + 56);
  *(_QWORD *)(v5 + 56) = v9;

  v11 = -[NSString copyWithZone:](self->_userMessage, "copyWithZone:", a3);
  v12 = *(void **)(v5 + 72);
  *(_QWORD *)(v5 + 72) = v11;

  v13 = -[NSString copyWithZone:](self->_buttonOneMessage, "copyWithZone:", a3);
  v14 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v13;

  v15 = -[NSString copyWithZone:](self->_buttonOneAppURI, "copyWithZone:", a3);
  v16 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v15;

  v17 = -[NSString copyWithZone:](self->_buttonTwoMessage, "copyWithZone:", a3);
  v18 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v17;

  v19 = -[NSString copyWithZone:](self->_buttonTwoAppURI, "copyWithZone:", a3);
  v20 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v19;

  flags = (__int16)self->_flags;
  if ((flags & 4) != 0)
  {
    *(_DWORD *)(v5 + 100) = self->_displayDestinations;
    *(_WORD *)(v5 + 108) |= 4u;
    flags = (__int16)self->_flags;
  }
  if ((flags & 8) != 0)
  {
    *(_DWORD *)(v5 + 104) = self->_releasePhase;
    *(_WORD *)(v5 + 108) |= 8u;
  }
  v22 = -[GEOPDFlyover copyWithZone:](self->_flyoverInfo, "copyWithZone:", a3);
  v23 = *(void **)(v5 + 48);
  *(_QWORD *)(v5 + 48) = v22;

  v24 = -[NSString copyWithZone:](self->_title, "copyWithZone:", a3);
  v25 = *(void **)(v5 + 64);
  *(_QWORD *)(v5 + 64) = v24;

  if ((*(_WORD *)&self->_flags & 2) != 0)
  {
    *(_DWORD *)(v5 + 96) = self->_announcementType;
    *(_WORD *)(v5 + 108) |= 2u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  __int16 v5;
  GEOMapRegion *mapRegion;
  NSString *userMessage;
  NSString *buttonOneMessage;
  NSString *buttonOneAppURI;
  NSString *buttonTwoMessage;
  NSString *buttonTwoAppURI;
  __int16 flags;
  __int16 v13;
  GEOPDFlyover *flyoverInfo;
  NSString *title;
  __int16 v16;
  BOOL v17;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_37;
  -[GEOAnnouncement readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  v5 = *((_WORD *)v4 + 54);
  if ((*(_WORD *)&self->_flags & 1) != 0)
  {
    if ((v5 & 1) == 0 || self->_announcementID != *((_DWORD *)v4 + 23))
      goto LABEL_37;
  }
  else if ((v5 & 1) != 0)
  {
LABEL_37:
    v17 = 0;
    goto LABEL_38;
  }
  mapRegion = self->_mapRegion;
  if ((unint64_t)mapRegion | *((_QWORD *)v4 + 7) && !-[GEOMapRegion isEqual:](mapRegion, "isEqual:"))
    goto LABEL_37;
  userMessage = self->_userMessage;
  if ((unint64_t)userMessage | *((_QWORD *)v4 + 9))
  {
    if (!-[NSString isEqual:](userMessage, "isEqual:"))
      goto LABEL_37;
  }
  buttonOneMessage = self->_buttonOneMessage;
  if ((unint64_t)buttonOneMessage | *((_QWORD *)v4 + 3))
  {
    if (!-[NSString isEqual:](buttonOneMessage, "isEqual:"))
      goto LABEL_37;
  }
  buttonOneAppURI = self->_buttonOneAppURI;
  if ((unint64_t)buttonOneAppURI | *((_QWORD *)v4 + 2))
  {
    if (!-[NSString isEqual:](buttonOneAppURI, "isEqual:"))
      goto LABEL_37;
  }
  buttonTwoMessage = self->_buttonTwoMessage;
  if ((unint64_t)buttonTwoMessage | *((_QWORD *)v4 + 5))
  {
    if (!-[NSString isEqual:](buttonTwoMessage, "isEqual:"))
      goto LABEL_37;
  }
  buttonTwoAppURI = self->_buttonTwoAppURI;
  if ((unint64_t)buttonTwoAppURI | *((_QWORD *)v4 + 4))
  {
    if (!-[NSString isEqual:](buttonTwoAppURI, "isEqual:"))
      goto LABEL_37;
  }
  flags = (__int16)self->_flags;
  v13 = *((_WORD *)v4 + 54);
  if ((flags & 4) != 0)
  {
    if ((v13 & 4) == 0 || self->_displayDestinations != *((_DWORD *)v4 + 25))
      goto LABEL_37;
  }
  else if ((v13 & 4) != 0)
  {
    goto LABEL_37;
  }
  if ((flags & 8) != 0)
  {
    if ((v13 & 8) == 0 || self->_releasePhase != *((_DWORD *)v4 + 26))
      goto LABEL_37;
  }
  else if ((v13 & 8) != 0)
  {
    goto LABEL_37;
  }
  flyoverInfo = self->_flyoverInfo;
  if ((unint64_t)flyoverInfo | *((_QWORD *)v4 + 6) && !-[GEOPDFlyover isEqual:](flyoverInfo, "isEqual:"))
    goto LABEL_37;
  title = self->_title;
  if ((unint64_t)title | *((_QWORD *)v4 + 8))
  {
    if (!-[NSString isEqual:](title, "isEqual:"))
      goto LABEL_37;
  }
  v16 = *((_WORD *)v4 + 54);
  v17 = (v16 & 2) == 0;
  if ((*(_WORD *)&self->_flags & 2) != 0)
  {
    if ((v16 & 2) == 0 || self->_announcementType != *((_DWORD *)v4 + 24))
      goto LABEL_37;
    v17 = 1;
  }
LABEL_38:

  return v17;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;
  NSUInteger v5;
  __int16 flags;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  NSUInteger v10;
  uint64_t v11;
  NSUInteger v13;
  NSUInteger v14;
  unint64_t v15;
  uint64_t v16;

  -[GEOAnnouncement readAll:](self, "readAll:", 1);
  if ((*(_WORD *)&self->_flags & 1) != 0)
    v16 = 2654435761 * self->_announcementID;
  else
    v16 = 0;
  v15 = -[GEOMapRegion hash](self->_mapRegion, "hash");
  v14 = -[NSString hash](self->_userMessage, "hash");
  v13 = -[NSString hash](self->_buttonOneMessage, "hash");
  v3 = -[NSString hash](self->_buttonOneAppURI, "hash");
  v4 = -[NSString hash](self->_buttonTwoMessage, "hash");
  v5 = -[NSString hash](self->_buttonTwoAppURI, "hash");
  flags = (__int16)self->_flags;
  if ((flags & 4) != 0)
  {
    v7 = 2654435761 * self->_displayDestinations;
    if ((flags & 8) != 0)
      goto LABEL_6;
  }
  else
  {
    v7 = 0;
    if ((flags & 8) != 0)
    {
LABEL_6:
      v8 = 2654435761 * self->_releasePhase;
      goto LABEL_9;
    }
  }
  v8 = 0;
LABEL_9:
  v9 = -[GEOPDFlyover hash](self->_flyoverInfo, "hash");
  v10 = -[NSString hash](self->_title, "hash");
  if ((*(_WORD *)&self->_flags & 2) != 0)
    v11 = 2654435761 * self->_announcementType;
  else
    v11 = 0;
  return v15 ^ v16 ^ v14 ^ v13 ^ v3 ^ v4 ^ v5 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11;
}

- (void)mergeFrom:(id)a3
{
  unsigned int *v4;
  GEOMapRegion *mapRegion;
  uint64_t v6;
  __int16 v7;
  GEOPDFlyover *flyoverInfo;
  uint64_t v9;
  unsigned int *v10;

  v10 = (unsigned int *)a3;
  objc_msgSend(v10, "readAll:", 0);
  v4 = v10;
  if ((v10[27] & 1) != 0)
  {
    self->_announcementID = v10[23];
    *(_WORD *)&self->_flags |= 1u;
  }
  mapRegion = self->_mapRegion;
  v6 = *((_QWORD *)v10 + 7);
  if (mapRegion)
  {
    if (!v6)
      goto LABEL_9;
    -[GEOMapRegion mergeFrom:](mapRegion, "mergeFrom:");
  }
  else
  {
    if (!v6)
      goto LABEL_9;
    -[GEOAnnouncement setMapRegion:](self, "setMapRegion:");
  }
  v4 = v10;
LABEL_9:
  if (*((_QWORD *)v4 + 9))
  {
    -[GEOAnnouncement setUserMessage:](self, "setUserMessage:");
    v4 = v10;
  }
  if (*((_QWORD *)v4 + 3))
  {
    -[GEOAnnouncement setButtonOneMessage:](self, "setButtonOneMessage:");
    v4 = v10;
  }
  if (*((_QWORD *)v4 + 2))
  {
    -[GEOAnnouncement setButtonOneAppURI:](self, "setButtonOneAppURI:");
    v4 = v10;
  }
  if (*((_QWORD *)v4 + 5))
  {
    -[GEOAnnouncement setButtonTwoMessage:](self, "setButtonTwoMessage:");
    v4 = v10;
  }
  if (*((_QWORD *)v4 + 4))
  {
    -[GEOAnnouncement setButtonTwoAppURI:](self, "setButtonTwoAppURI:");
    v4 = v10;
  }
  v7 = *((_WORD *)v4 + 54);
  if ((v7 & 4) != 0)
  {
    self->_displayDestinations = v4[25];
    *(_WORD *)&self->_flags |= 4u;
    v7 = *((_WORD *)v4 + 54);
  }
  if ((v7 & 8) != 0)
  {
    self->_releasePhase = v4[26];
    *(_WORD *)&self->_flags |= 8u;
  }
  flyoverInfo = self->_flyoverInfo;
  v9 = *((_QWORD *)v4 + 6);
  if (flyoverInfo)
  {
    if (!v9)
      goto LABEL_29;
    -[GEOPDFlyover mergeFrom:](flyoverInfo, "mergeFrom:");
  }
  else
  {
    if (!v9)
      goto LABEL_29;
    -[GEOAnnouncement setFlyoverInfo:](self, "setFlyoverInfo:");
  }
  v4 = v10;
LABEL_29:
  if (*((_QWORD *)v4 + 8))
  {
    -[GEOAnnouncement setTitle:](self, "setTitle:");
    v4 = v10;
  }
  if ((v4[27] & 2) != 0)
  {
    self->_announcementType = v4[24];
    *(_WORD *)&self->_flags |= 2u;
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userMessage, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_mapRegion, 0);
  objc_storeStrong((id *)&self->_flyoverInfo, 0);
  objc_storeStrong((id *)&self->_buttonTwoMessage, 0);
  objc_storeStrong((id *)&self->_buttonTwoAppURI, 0);
  objc_storeStrong((id *)&self->_buttonOneMessage, 0);
  objc_storeStrong((id *)&self->_buttonOneAppURI, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
