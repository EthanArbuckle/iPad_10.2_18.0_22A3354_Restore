@implementation GEOPlaceFormattedString

- (GEOPlaceFormattedString)init
{
  GEOPlaceFormattedString *v2;
  GEOPlaceFormattedString *v3;
  GEOPlaceFormattedString *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOPlaceFormattedString;
  v2 = -[GEOPlaceFormattedString init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPlaceFormattedString)initWithData:(id)a3
{
  GEOPlaceFormattedString *v3;
  GEOPlaceFormattedString *v4;
  GEOPlaceFormattedString *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOPlaceFormattedString;
  v3 = -[GEOPlaceFormattedString initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readHome
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 104));
    if ((*(_WORD *)(a1 + 108) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPlaceFormattedStringReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readHome_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 104));
  }
}

- (BOOL)hasHome
{
  -[GEOPlaceFormattedString _readHome]((uint64_t)self);
  return self->_home != 0;
}

- (GEOFormattedString)home
{
  -[GEOPlaceFormattedString _readHome]((uint64_t)self);
  return self->_home;
}

- (void)setHome:(id)a3
{
  *(_WORD *)&self->_flags |= 0x420u;
  objc_storeStrong((id *)&self->_home, a3);
}

- (void)_readWork
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 104));
    if ((*(_WORD *)(a1 + 108) & 0x200) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPlaceFormattedStringReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readWork_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 104));
  }
}

- (BOOL)hasWork
{
  -[GEOPlaceFormattedString _readWork]((uint64_t)self);
  return self->_work != 0;
}

- (GEOFormattedString)work
{
  -[GEOPlaceFormattedString _readWork]((uint64_t)self);
  return self->_work;
}

- (void)setWork:(id)a3
{
  *(_WORD *)&self->_flags |= 0x600u;
  objc_storeStrong((id *)&self->_work, a3);
}

- (void)_readContactWork
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 104));
    if ((*(_WORD *)(a1 + 108) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPlaceFormattedStringReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readContactWork_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 104));
  }
}

- (BOOL)hasContactWork
{
  -[GEOPlaceFormattedString _readContactWork]((uint64_t)self);
  return self->_contactWork != 0;
}

- (GEOFormattedString)contactWork
{
  -[GEOPlaceFormattedString _readContactWork]((uint64_t)self);
  return self->_contactWork;
}

- (void)setContactWork:(id)a3
{
  *(_WORD *)&self->_flags |= 0x408u;
  objc_storeStrong((id *)&self->_contactWork, a3);
}

- (void)_readContactHome
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 104));
    if ((*(_WORD *)(a1 + 108) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPlaceFormattedStringReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readContactHome_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 104));
  }
}

- (BOOL)hasContactHome
{
  -[GEOPlaceFormattedString _readContactHome]((uint64_t)self);
  return self->_contactHome != 0;
}

- (GEOFormattedString)contactHome
{
  -[GEOPlaceFormattedString _readContactHome]((uint64_t)self);
  return self->_contactHome;
}

- (void)setContactHome:(id)a3
{
  *(_WORD *)&self->_flags |= 0x402u;
  objc_storeStrong((id *)&self->_contactHome, a3);
}

- (void)_readContactOther
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 104));
    if ((*(_WORD *)(a1 + 108) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPlaceFormattedStringReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readContactOther_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 104));
  }
}

- (BOOL)hasContactOther
{
  -[GEOPlaceFormattedString _readContactOther]((uint64_t)self);
  return self->_contactOther != 0;
}

- (GEOFormattedString)contactOther
{
  -[GEOPlaceFormattedString _readContactOther]((uint64_t)self);
  return self->_contactOther;
}

- (void)setContactOther:(id)a3
{
  *(_WORD *)&self->_flags |= 0x404u;
  objc_storeStrong((id *)&self->_contactOther, a3);
}

- (void)_readPointOfInterest
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 104));
    if ((*(_WORD *)(a1 + 108) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPlaceFormattedStringReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readPointOfInterest_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 104));
  }
}

- (BOOL)hasPointOfInterest
{
  -[GEOPlaceFormattedString _readPointOfInterest]((uint64_t)self);
  return self->_pointOfInterest != 0;
}

- (GEOFormattedString)pointOfInterest
{
  -[GEOPlaceFormattedString _readPointOfInterest]((uint64_t)self);
  return self->_pointOfInterest;
}

- (void)setPointOfInterest:(id)a3
{
  *(_WORD *)&self->_flags |= 0x440u;
  objc_storeStrong((id *)&self->_pointOfInterest, a3);
}

- (void)_readStreetAddress
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 104));
    if ((*(_WORD *)(a1 + 108) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPlaceFormattedStringReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readStreetAddress_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 104));
  }
}

- (BOOL)hasStreetAddress
{
  -[GEOPlaceFormattedString _readStreetAddress]((uint64_t)self);
  return self->_streetAddress != 0;
}

- (GEOFormattedString)streetAddress
{
  -[GEOPlaceFormattedString _readStreetAddress]((uint64_t)self);
  return self->_streetAddress;
}

- (void)setStreetAddress:(id)a3
{
  *(_WORD *)&self->_flags |= 0x480u;
  objc_storeStrong((id *)&self->_streetAddress, a3);
}

- (void)_readUnknown
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 104));
    if ((*(_WORD *)(a1 + 108) & 0x100) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPlaceFormattedStringReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readUnknown_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 104));
  }
}

- (BOOL)hasUnknown
{
  -[GEOPlaceFormattedString _readUnknown]((uint64_t)self);
  return self->_unknown != 0;
}

- (GEOFormattedString)unknown
{
  -[GEOPlaceFormattedString _readUnknown]((uint64_t)self);
  return self->_unknown;
}

- (void)setUnknown:(id)a3
{
  *(_WORD *)&self->_flags |= 0x500u;
  objc_storeStrong((id *)&self->_unknown, a3);
}

- (void)_readCustom
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 104));
    if ((*(_WORD *)(a1 + 108) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPlaceFormattedStringReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readCustom_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 104));
  }
}

- (BOOL)hasCustom
{
  -[GEOPlaceFormattedString _readCustom]((uint64_t)self);
  return self->_custom != 0;
}

- (GEOFormattedString)custom
{
  -[GEOPlaceFormattedString _readCustom]((uint64_t)self);
  return self->_custom;
}

- (void)setCustom:(id)a3
{
  *(_WORD *)&self->_flags |= 0x410u;
  objc_storeStrong((id *)&self->_custom, a3);
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
  v8.super_class = (Class)GEOPlaceFormattedString;
  -[GEOPlaceFormattedString description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPlaceFormattedString dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPlaceFormattedString _dictionaryRepresentation:](self, 0);
}

- (id)_dictionaryRepresentation:(_QWORD *)a1
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
  const __CFString *v14;
  void *v15;
  void *v16;
  void *v17;
  const __CFString *v18;
  void *v19;
  void *v20;
  void *v21;
  const __CFString *v22;
  void *v23;
  void *v24;
  void *v25;
  const __CFString *v26;
  void *v27;
  void *v28;
  void *v29;
  const __CFString *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  id v41;
  id v42;
  _QWORD v44[4];
  id v45;

  if (!a1)
    return 0;
  objc_msgSend(a1, "readAll:", 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "home");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    if ((a2 & 1) != 0)
      objc_msgSend(v5, "jsonRepresentation");
    else
      objc_msgSend(v5, "dictionaryRepresentation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("home"));

  }
  objc_msgSend(a1, "work");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    if ((a2 & 1) != 0)
      objc_msgSend(v8, "jsonRepresentation");
    else
      objc_msgSend(v8, "dictionaryRepresentation");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v10, CFSTR("work"));

  }
  objc_msgSend(a1, "contactWork");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v11)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v11, "jsonRepresentation");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = CFSTR("contactWork");
    }
    else
    {
      objc_msgSend(v11, "dictionaryRepresentation");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = CFSTR("contact_work");
    }
    objc_msgSend(v4, "setObject:forKey:", v13, v14);

  }
  objc_msgSend(a1, "contactHome");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (v15)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v15, "jsonRepresentation");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = CFSTR("contactHome");
    }
    else
    {
      objc_msgSend(v15, "dictionaryRepresentation");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = CFSTR("contact_home");
    }
    objc_msgSend(v4, "setObject:forKey:", v17, v18);

  }
  objc_msgSend(a1, "contactOther");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v19;
  if (v19)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v19, "jsonRepresentation");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = CFSTR("contactOther");
    }
    else
    {
      objc_msgSend(v19, "dictionaryRepresentation");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = CFSTR("contact_other");
    }
    objc_msgSend(v4, "setObject:forKey:", v21, v22);

  }
  objc_msgSend(a1, "pointOfInterest");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = v23;
  if (v23)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v23, "jsonRepresentation");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = CFSTR("pointOfInterest");
    }
    else
    {
      objc_msgSend(v23, "dictionaryRepresentation");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = CFSTR("point_of_interest");
    }
    objc_msgSend(v4, "setObject:forKey:", v25, v26);

  }
  objc_msgSend(a1, "streetAddress");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = v27;
  if (v27)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v27, "jsonRepresentation");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = CFSTR("streetAddress");
    }
    else
    {
      objc_msgSend(v27, "dictionaryRepresentation");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = CFSTR("street_address");
    }
    objc_msgSend(v4, "setObject:forKey:", v29, v30);

  }
  objc_msgSend(a1, "unknown");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = v31;
  if (v31)
  {
    if ((a2 & 1) != 0)
      objc_msgSend(v31, "jsonRepresentation");
    else
      objc_msgSend(v31, "dictionaryRepresentation");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v33, CFSTR("unknown"));

  }
  objc_msgSend(a1, "custom");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = v34;
  if (v34)
  {
    if ((a2 & 1) != 0)
      objc_msgSend(v34, "jsonRepresentation");
    else
      objc_msgSend(v34, "dictionaryRepresentation");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v36, CFSTR("custom"));

  }
  v37 = (void *)a1[2];
  if (v37)
  {
    objc_msgSend(v37, "dictionaryRepresentation");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = v38;
    if (a2)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v38, "count"));
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v44[0] = MEMORY[0x1E0C809B0];
      v44[1] = 3221225472;
      v44[2] = __53__GEOPlaceFormattedString__dictionaryRepresentation___block_invoke;
      v44[3] = &unk_1E1C00600;
      v41 = v40;
      v45 = v41;
      objc_msgSend(v39, "enumerateKeysAndObjectsUsingBlock:", v44);
      v42 = v41;

      v39 = v42;
    }
    objc_msgSend(v4, "setObject:forKey:", v39, CFSTR("Unknown Fields"));

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOPlaceFormattedString _dictionaryRepresentation:](self, 1);
}

void __53__GEOPlaceFormattedString__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (GEOPlaceFormattedString)initWithDictionary:(id)a3
{
  return (GEOPlaceFormattedString *)-[GEOPlaceFormattedString _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5;
  void *v6;
  GEOFormattedString *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  GEOFormattedString *v11;
  uint64_t v12;
  void *v13;
  const __CFString *v14;
  void *v15;
  GEOFormattedString *v16;
  uint64_t v17;
  void *v18;
  const __CFString *v19;
  void *v20;
  GEOFormattedString *v21;
  uint64_t v22;
  void *v23;
  const __CFString *v24;
  void *v25;
  GEOFormattedString *v26;
  uint64_t v27;
  void *v28;
  const __CFString *v29;
  void *v30;
  GEOFormattedString *v31;
  uint64_t v32;
  void *v33;
  const __CFString *v34;
  void *v35;
  GEOFormattedString *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  GEOFormattedString *v40;
  uint64_t v41;
  void *v42;
  void *v43;
  GEOFormattedString *v44;
  uint64_t v45;
  void *v46;

  v5 = a2;
  if (a1)
  {
    a1 = (void *)objc_msgSend(a1, "init");
    if (a1)
    {
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("home"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v7 = [GEOFormattedString alloc];
        if ((a3 & 1) != 0)
          v8 = -[GEOFormattedString initWithJSON:](v7, "initWithJSON:", v6);
        else
          v8 = -[GEOFormattedString initWithDictionary:](v7, "initWithDictionary:", v6);
        v9 = (void *)v8;
        objc_msgSend(a1, "setHome:", v8);

      }
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("work"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v11 = [GEOFormattedString alloc];
        if ((a3 & 1) != 0)
          v12 = -[GEOFormattedString initWithJSON:](v11, "initWithJSON:", v10);
        else
          v12 = -[GEOFormattedString initWithDictionary:](v11, "initWithDictionary:", v10);
        v13 = (void *)v12;
        objc_msgSend(a1, "setWork:", v12);

      }
      if (a3)
        v14 = CFSTR("contactWork");
      else
        v14 = CFSTR("contact_work");
      objc_msgSend(v5, "objectForKeyedSubscript:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v16 = [GEOFormattedString alloc];
        if ((a3 & 1) != 0)
          v17 = -[GEOFormattedString initWithJSON:](v16, "initWithJSON:", v15);
        else
          v17 = -[GEOFormattedString initWithDictionary:](v16, "initWithDictionary:", v15);
        v18 = (void *)v17;
        objc_msgSend(a1, "setContactWork:", v17);

      }
      if (a3)
        v19 = CFSTR("contactHome");
      else
        v19 = CFSTR("contact_home");
      objc_msgSend(v5, "objectForKeyedSubscript:", v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v21 = [GEOFormattedString alloc];
        if ((a3 & 1) != 0)
          v22 = -[GEOFormattedString initWithJSON:](v21, "initWithJSON:", v20);
        else
          v22 = -[GEOFormattedString initWithDictionary:](v21, "initWithDictionary:", v20);
        v23 = (void *)v22;
        objc_msgSend(a1, "setContactHome:", v22);

      }
      if (a3)
        v24 = CFSTR("contactOther");
      else
        v24 = CFSTR("contact_other");
      objc_msgSend(v5, "objectForKeyedSubscript:", v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v26 = [GEOFormattedString alloc];
        if ((a3 & 1) != 0)
          v27 = -[GEOFormattedString initWithJSON:](v26, "initWithJSON:", v25);
        else
          v27 = -[GEOFormattedString initWithDictionary:](v26, "initWithDictionary:", v25);
        v28 = (void *)v27;
        objc_msgSend(a1, "setContactOther:", v27);

      }
      if (a3)
        v29 = CFSTR("pointOfInterest");
      else
        v29 = CFSTR("point_of_interest");
      objc_msgSend(v5, "objectForKeyedSubscript:", v29);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v31 = [GEOFormattedString alloc];
        if ((a3 & 1) != 0)
          v32 = -[GEOFormattedString initWithJSON:](v31, "initWithJSON:", v30);
        else
          v32 = -[GEOFormattedString initWithDictionary:](v31, "initWithDictionary:", v30);
        v33 = (void *)v32;
        objc_msgSend(a1, "setPointOfInterest:", v32);

      }
      if (a3)
        v34 = CFSTR("streetAddress");
      else
        v34 = CFSTR("street_address");
      objc_msgSend(v5, "objectForKeyedSubscript:", v34);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v36 = [GEOFormattedString alloc];
        if ((a3 & 1) != 0)
          v37 = -[GEOFormattedString initWithJSON:](v36, "initWithJSON:", v35);
        else
          v37 = -[GEOFormattedString initWithDictionary:](v36, "initWithDictionary:", v35);
        v38 = (void *)v37;
        objc_msgSend(a1, "setStreetAddress:", v37);

      }
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("unknown"));
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v40 = [GEOFormattedString alloc];
        if ((a3 & 1) != 0)
          v41 = -[GEOFormattedString initWithJSON:](v40, "initWithJSON:", v39);
        else
          v41 = -[GEOFormattedString initWithDictionary:](v40, "initWithDictionary:", v39);
        v42 = (void *)v41;
        objc_msgSend(a1, "setUnknown:", v41);

      }
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("custom"));
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v44 = [GEOFormattedString alloc];
        if ((a3 & 1) != 0)
          v45 = -[GEOFormattedString initWithJSON:](v44, "initWithJSON:", v43);
        else
          v45 = -[GEOFormattedString initWithDictionary:](v44, "initWithDictionary:", v43);
        v46 = (void *)v45;
        objc_msgSend(a1, "setCustom:", v45);

      }
    }
  }

  return a1;
}

- (GEOPlaceFormattedString)initWithJSON:(id)a3
{
  return (GEOPlaceFormattedString *)-[GEOPlaceFormattedString _initWithDictionary:isJSON:](self, a3, 1);
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
      v8 = (int *)&readAll__recursiveTag_3694;
    else
      v8 = (int *)&readAll__nonRecursiveTag_3695;
    GEOPlaceFormattedStringReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);

  }
  if (v3)
    _GEOPlaceFormattedStringCallReadAllRecursiveWithoutSynchronized((id *)&self->super.super.isa);
  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOPlaceFormattedStringIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOPlaceFormattedStringReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  os_unfair_lock_s *p_readerLock;
  id v5;
  PBDataReader *v6;
  void *v7;
  id v8;

  v8 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEOPlaceFormattedStringIsDirty((uint64_t)self) & 1) == 0)
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
    -[GEOPlaceFormattedString readAll:](self, "readAll:", 0);
    if (self->_home)
      PBDataWriterWriteSubmessage();
    v5 = v8;
    if (self->_work)
    {
      PBDataWriterWriteSubmessage();
      v5 = v8;
    }
    if (self->_contactWork)
    {
      PBDataWriterWriteSubmessage();
      v5 = v8;
    }
    if (self->_contactHome)
    {
      PBDataWriterWriteSubmessage();
      v5 = v8;
    }
    if (self->_contactOther)
    {
      PBDataWriterWriteSubmessage();
      v5 = v8;
    }
    if (self->_pointOfInterest)
    {
      PBDataWriterWriteSubmessage();
      v5 = v8;
    }
    if (self->_streetAddress)
    {
      PBDataWriterWriteSubmessage();
      v5 = v8;
    }
    if (self->_unknown)
    {
      PBDataWriterWriteSubmessage();
      v5 = v8;
    }
    if (self->_custom)
    {
      PBDataWriterWriteSubmessage();
      v5 = v8;
    }
    -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v5);
  }

}

- (void)copyTo:(id)a3
{
  id *v4;
  id *v5;

  v5 = (id *)a3;
  -[GEOPlaceFormattedString readAll:](self, "readAll:", 0);
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v5 + 1, self->_reader);
  *((_DWORD *)v5 + 24) = self->_readerMarkPos;
  *((_DWORD *)v5 + 25) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (self->_home)
    objc_msgSend(v5, "setHome:");
  if (self->_work)
    objc_msgSend(v5, "setWork:");
  v4 = v5;
  if (self->_contactWork)
  {
    objc_msgSend(v5, "setContactWork:");
    v4 = v5;
  }
  if (self->_contactHome)
  {
    objc_msgSend(v5, "setContactHome:");
    v4 = v5;
  }
  if (self->_contactOther)
  {
    objc_msgSend(v5, "setContactOther:");
    v4 = v5;
  }
  if (self->_pointOfInterest)
  {
    objc_msgSend(v5, "setPointOfInterest:");
    v4 = v5;
  }
  if (self->_streetAddress)
  {
    objc_msgSend(v5, "setStreetAddress:");
    v4 = v5;
  }
  if (self->_unknown)
  {
    objc_msgSend(v5, "setUnknown:");
    v4 = v5;
  }
  if (self->_custom)
  {
    objc_msgSend(v5, "setCustom:");
    v4 = v5;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  PBDataReader *reader;
  PBDataReader *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  void *v21;
  id v22;
  void *v23;
  id v24;
  void *v25;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (!reader)
    goto LABEL_5;
  v7 = reader;
  objc_sync_enter(v7);
  if ((*(_WORD *)&self->_flags & 0x400) != 0)
  {
    objc_sync_exit(v7);

LABEL_5:
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOPlaceFormattedString readAll:](self, "readAll:", 0);
    v8 = -[GEOFormattedString copyWithZone:](self->_home, "copyWithZone:", a3);
    v9 = *(void **)(v5 + 56);
    *(_QWORD *)(v5 + 56) = v8;

    v10 = -[GEOFormattedString copyWithZone:](self->_work, "copyWithZone:", a3);
    v11 = *(void **)(v5 + 88);
    *(_QWORD *)(v5 + 88) = v10;

    v12 = -[GEOFormattedString copyWithZone:](self->_contactWork, "copyWithZone:", a3);
    v13 = *(void **)(v5 + 40);
    *(_QWORD *)(v5 + 40) = v12;

    v14 = -[GEOFormattedString copyWithZone:](self->_contactHome, "copyWithZone:", a3);
    v15 = *(void **)(v5 + 24);
    *(_QWORD *)(v5 + 24) = v14;

    v16 = -[GEOFormattedString copyWithZone:](self->_contactOther, "copyWithZone:", a3);
    v17 = *(void **)(v5 + 32);
    *(_QWORD *)(v5 + 32) = v16;

    v18 = -[GEOFormattedString copyWithZone:](self->_pointOfInterest, "copyWithZone:", a3);
    v19 = *(void **)(v5 + 64);
    *(_QWORD *)(v5 + 64) = v18;

    v20 = -[GEOFormattedString copyWithZone:](self->_streetAddress, "copyWithZone:", a3);
    v21 = *(void **)(v5 + 72);
    *(_QWORD *)(v5 + 72) = v20;

    v22 = -[GEOFormattedString copyWithZone:](self->_unknown, "copyWithZone:", a3);
    v23 = *(void **)(v5 + 80);
    *(_QWORD *)(v5 + 80) = v22;

    v24 = -[GEOFormattedString copyWithZone:](self->_custom, "copyWithZone:", a3);
    v25 = *(void **)(v5 + 48);
    *(_QWORD *)(v5 + 48) = v24;

    objc_storeStrong((id *)(v5 + 16), self->_unknownFields);
    return (id)v5;
  }
  *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
  -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
  GEOPlaceFormattedStringReadAllFrom(v5, self->_reader, 0);
  os_unfair_lock_unlock(&self->_readerLock);
  objc_sync_exit(v7);

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  GEOFormattedString *home;
  GEOFormattedString *work;
  GEOFormattedString *contactWork;
  GEOFormattedString *contactHome;
  GEOFormattedString *contactOther;
  GEOFormattedString *pointOfInterest;
  GEOFormattedString *streetAddress;
  GEOFormattedString *unknown;
  GEOFormattedString *custom;
  char v14;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_20;
  -[GEOPlaceFormattedString readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  home = self->_home;
  if ((unint64_t)home | v4[7])
  {
    if (!-[GEOFormattedString isEqual:](home, "isEqual:"))
      goto LABEL_20;
  }
  if (((work = self->_work, !((unint64_t)work | v4[11])) || -[GEOFormattedString isEqual:](work, "isEqual:"))
    && ((contactWork = self->_contactWork, !((unint64_t)contactWork | v4[5]))
     || -[GEOFormattedString isEqual:](contactWork, "isEqual:"))
    && ((contactHome = self->_contactHome, !((unint64_t)contactHome | v4[3]))
     || -[GEOFormattedString isEqual:](contactHome, "isEqual:"))
    && ((contactOther = self->_contactOther, !((unint64_t)contactOther | v4[4]))
     || -[GEOFormattedString isEqual:](contactOther, "isEqual:"))
    && ((pointOfInterest = self->_pointOfInterest, !((unint64_t)pointOfInterest | v4[8]))
     || -[GEOFormattedString isEqual:](pointOfInterest, "isEqual:"))
    && ((streetAddress = self->_streetAddress, !((unint64_t)streetAddress | v4[9]))
     || -[GEOFormattedString isEqual:](streetAddress, "isEqual:"))
    && ((unknown = self->_unknown, !((unint64_t)unknown | v4[10]))
     || -[GEOFormattedString isEqual:](unknown, "isEqual:")))
  {
    custom = self->_custom;
    if ((unint64_t)custom | v4[6])
      v14 = -[GEOFormattedString isEqual:](custom, "isEqual:");
    else
      v14 = 1;
  }
  else
  {
LABEL_20:
    v14 = 0;
  }

  return v14;
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;

  -[GEOPlaceFormattedString readAll:](self, "readAll:", 1);
  v3 = -[GEOFormattedString hash](self->_home, "hash");
  v4 = -[GEOFormattedString hash](self->_work, "hash") ^ v3;
  v5 = -[GEOFormattedString hash](self->_contactWork, "hash");
  v6 = v4 ^ v5 ^ -[GEOFormattedString hash](self->_contactHome, "hash");
  v7 = -[GEOFormattedString hash](self->_contactOther, "hash");
  v8 = v7 ^ -[GEOFormattedString hash](self->_pointOfInterest, "hash");
  v9 = v6 ^ v8 ^ -[GEOFormattedString hash](self->_streetAddress, "hash");
  v10 = -[GEOFormattedString hash](self->_unknown, "hash");
  return v9 ^ v10 ^ -[GEOFormattedString hash](self->_custom, "hash");
}

- (void)mergeFrom:(id)a3
{
  GEOFormattedString *home;
  uint64_t v5;
  GEOFormattedString *work;
  uint64_t v7;
  GEOFormattedString *contactWork;
  uint64_t v9;
  GEOFormattedString *contactHome;
  uint64_t v11;
  GEOFormattedString *contactOther;
  uint64_t v13;
  GEOFormattedString *pointOfInterest;
  uint64_t v15;
  GEOFormattedString *streetAddress;
  uint64_t v17;
  GEOFormattedString *unknown;
  uint64_t v19;
  GEOFormattedString *custom;
  uint64_t v21;
  _QWORD *v22;

  v22 = a3;
  objc_msgSend(v22, "readAll:", 0);
  home = self->_home;
  v5 = v22[7];
  if (home)
  {
    if (v5)
      -[GEOFormattedString mergeFrom:](home, "mergeFrom:");
  }
  else if (v5)
  {
    -[GEOPlaceFormattedString setHome:](self, "setHome:");
  }
  work = self->_work;
  v7 = v22[11];
  if (work)
  {
    if (v7)
      -[GEOFormattedString mergeFrom:](work, "mergeFrom:");
  }
  else if (v7)
  {
    -[GEOPlaceFormattedString setWork:](self, "setWork:");
  }
  contactWork = self->_contactWork;
  v9 = v22[5];
  if (contactWork)
  {
    if (v9)
      -[GEOFormattedString mergeFrom:](contactWork, "mergeFrom:");
  }
  else if (v9)
  {
    -[GEOPlaceFormattedString setContactWork:](self, "setContactWork:");
  }
  contactHome = self->_contactHome;
  v11 = v22[3];
  if (contactHome)
  {
    if (v11)
      -[GEOFormattedString mergeFrom:](contactHome, "mergeFrom:");
  }
  else if (v11)
  {
    -[GEOPlaceFormattedString setContactHome:](self, "setContactHome:");
  }
  contactOther = self->_contactOther;
  v13 = v22[4];
  if (contactOther)
  {
    if (v13)
      -[GEOFormattedString mergeFrom:](contactOther, "mergeFrom:");
  }
  else if (v13)
  {
    -[GEOPlaceFormattedString setContactOther:](self, "setContactOther:");
  }
  pointOfInterest = self->_pointOfInterest;
  v15 = v22[8];
  if (pointOfInterest)
  {
    if (v15)
      -[GEOFormattedString mergeFrom:](pointOfInterest, "mergeFrom:");
  }
  else if (v15)
  {
    -[GEOPlaceFormattedString setPointOfInterest:](self, "setPointOfInterest:");
  }
  streetAddress = self->_streetAddress;
  v17 = v22[9];
  if (streetAddress)
  {
    if (v17)
      -[GEOFormattedString mergeFrom:](streetAddress, "mergeFrom:");
  }
  else if (v17)
  {
    -[GEOPlaceFormattedString setStreetAddress:](self, "setStreetAddress:");
  }
  unknown = self->_unknown;
  v19 = v22[10];
  if (unknown)
  {
    if (v19)
      -[GEOFormattedString mergeFrom:](unknown, "mergeFrom:");
  }
  else if (v19)
  {
    -[GEOPlaceFormattedString setUnknown:](self, "setUnknown:");
  }
  custom = self->_custom;
  v21 = v22[6];
  if (custom)
  {
    if (v21)
      -[GEOFormattedString mergeFrom:](custom, "mergeFrom:");
  }
  else if (v21)
  {
    -[GEOPlaceFormattedString setCustom:](self, "setCustom:");
  }

}

- (PBUnknownFields)unknownFields
{
  os_unfair_lock_s *p_readerLock;
  PBDataReader *reader;
  PBDataReader *v5;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if ((*(_WORD *)&self->_flags & 1) == 0)
  {
    reader = self->_reader;
    if (reader)
    {
      v5 = reader;
      objc_sync_enter(v5);
      GEOPlaceFormattedStringReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&unknownFields_tags_3698);
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
  *(_WORD *)&self->_flags |= 0x401u;
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    -[GEOPlaceFormattedString readAll:](self, "readAll:", 0);
    -[GEOFormattedString clearUnknownFields:](self->_home, "clearUnknownFields:", 1);
    -[GEOFormattedString clearUnknownFields:](self->_work, "clearUnknownFields:", 1);
    -[GEOFormattedString clearUnknownFields:](self->_contactWork, "clearUnknownFields:", 1);
    -[GEOFormattedString clearUnknownFields:](self->_contactHome, "clearUnknownFields:", 1);
    -[GEOFormattedString clearUnknownFields:](self->_contactOther, "clearUnknownFields:", 1);
    -[GEOFormattedString clearUnknownFields:](self->_pointOfInterest, "clearUnknownFields:", 1);
    -[GEOFormattedString clearUnknownFields:](self->_streetAddress, "clearUnknownFields:", 1);
    -[GEOFormattedString clearUnknownFields:](self->_unknown, "clearUnknownFields:", 1);
    -[GEOFormattedString clearUnknownFields:](self->_custom, "clearUnknownFields:", 1);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_work, 0);
  objc_storeStrong((id *)&self->_unknown, 0);
  objc_storeStrong((id *)&self->_streetAddress, 0);
  objc_storeStrong((id *)&self->_pointOfInterest, 0);
  objc_storeStrong((id *)&self->_home, 0);
  objc_storeStrong((id *)&self->_custom, 0);
  objc_storeStrong((id *)&self->_contactWork, 0);
  objc_storeStrong((id *)&self->_contactOther, 0);
  objc_storeStrong((id *)&self->_contactHome, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
