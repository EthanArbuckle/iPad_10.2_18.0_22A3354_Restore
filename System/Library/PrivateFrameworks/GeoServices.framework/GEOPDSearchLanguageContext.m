@implementation GEOPDSearchLanguageContext

- (GEOPDSearchLanguageContext)init
{
  GEOPDSearchLanguageContext *v2;
  GEOPDSearchLanguageContext *v3;
  GEOPDSearchLanguageContext *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOPDSearchLanguageContext;
  v2 = -[GEOPDSearchLanguageContext init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPDSearchLanguageContext)initWithData:(id)a3
{
  GEOPDSearchLanguageContext *v3;
  GEOPDSearchLanguageContext *v4;
  GEOPDSearchLanguageContext *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOPDSearchLanguageContext;
  v3 = -[GEOPDSearchLanguageContext initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readDisplayLanguages
{
  void *v2;
  id v3;

  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
  if ((*(_BYTE *)(a1 + 68) & 8) == 0)
  {
    v2 = *(void **)(a1 + 8);
    if (v2)
    {
      v3 = v2;
      objc_sync_enter(v3);
      GEOPDSearchLanguageContextReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readDisplayLanguages_tags_2);
      objc_sync_exit(v3);

    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
}

- (void)addDisplayLanguage:(uint64_t)a1
{
  id v3;

  if (a1)
  {
    v3 = a2;
    -[GEOPDSearchLanguageContext _readDisplayLanguages](a1);
    -[GEOPDSearchLanguageContext _addNoFlagsDisplayLanguage:](a1, v3);

    os_unfair_lock_lock_with_options();
    *(_BYTE *)(a1 + 68) |= 8u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
    *(_BYTE *)(a1 + 68) |= 0x20u;
  }
}

- (void)_addNoFlagsDisplayLanguage:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 40);
    v7 = v3;
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *(void **)(a1 + 40);
      *(_QWORD *)(a1 + 40) = v5;

      v4 = *(void **)(a1 + 40);
    }
    objc_msgSend(v4, "addObject:", v7);
    v3 = v7;
  }

}

- (void)_readSpokenLanguages
{
  void *v2;
  id v3;

  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
  if ((*(_BYTE *)(a1 + 68) & 0x10) == 0)
  {
    v2 = *(void **)(a1 + 8);
    if (v2)
    {
      v3 = v2;
      objc_sync_enter(v3);
      GEOPDSearchLanguageContextReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readSpokenLanguages_tags_0);
      objc_sync_exit(v3);

    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
}

- (void)addSpokenLanguage:(uint64_t)a1
{
  id v3;

  if (a1)
  {
    v3 = a2;
    -[GEOPDSearchLanguageContext _readSpokenLanguages](a1);
    -[GEOPDSearchLanguageContext _addNoFlagsSpokenLanguage:](a1, v3);

    os_unfair_lock_lock_with_options();
    *(_BYTE *)(a1 + 68) |= 0x10u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
    *(_BYTE *)(a1 + 68) |= 0x20u;
  }
}

- (void)_addNoFlagsSpokenLanguage:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 48);
    v7 = v3;
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *(void **)(a1 + 48);
      *(_QWORD *)(a1 + 48) = v5;

      v4 = *(void **)(a1 + 48);
    }
    objc_msgSend(v4, "addObject:", v7);
    v3 = v7;
  }

}

- (void)setDeviceDisplayLanguage:(uint64_t)a1
{
  id v4;

  v4 = a2;
  *(_BYTE *)(a1 + 68) |= 1u;
  *(_BYTE *)(a1 + 68) |= 0x20u;
  objc_storeStrong((id *)(a1 + 16), a2);

}

- (void)setDeviceKeyboardLanguage:(uint64_t)a1
{
  id v4;

  v4 = a2;
  *(_BYTE *)(a1 + 68) |= 2u;
  *(_BYTE *)(a1 + 68) |= 0x20u;
  objc_storeStrong((id *)(a1 + 24), a2);

}

- (void)setDeviceSpokenLanguage:(uint64_t)a1
{
  id v4;

  v4 = a2;
  *(_BYTE *)(a1 + 68) |= 4u;
  *(_BYTE *)(a1 + 68) |= 0x20u;
  objc_storeStrong((id *)(a1 + 32), a2);

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
  v8.super_class = (Class)GEOPDSearchLanguageContext;
  -[GEOPDSearchLanguageContext description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPDSearchLanguageContext dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDSearchLanguageContext _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  id v5;
  const __CFString *v6;
  id v7;
  const __CFString *v8;
  void *v9;
  id v10;
  id v11;
  const __CFString *v12;
  void *v13;
  id v14;
  id v15;
  const __CFString *v16;
  void *v17;
  id v18;
  id v19;
  const __CFString *v20;

  if (a1)
  {
    -[GEOPDSearchLanguageContext readAll:](a1, 1);
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (*(_QWORD *)(a1 + 40))
    {
      -[GEOPDSearchLanguageContext _readDisplayLanguages](a1);
      v5 = *(id *)(a1 + 40);
      if (a2)
        v6 = CFSTR("displayLanguage");
      else
        v6 = CFSTR("display_language");
      objc_msgSend(v4, "setObject:forKey:", v5, v6);

    }
    if (*(_QWORD *)(a1 + 48))
    {
      -[GEOPDSearchLanguageContext _readSpokenLanguages](a1);
      v7 = *(id *)(a1 + 48);
      if (a2)
        v8 = CFSTR("spokenLanguage");
      else
        v8 = CFSTR("spoken_language");
      objc_msgSend(v4, "setObject:forKey:", v7, v8);

    }
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(_BYTE *)(a1 + 68) & 1) == 0)
    {
      v9 = *(void **)(a1 + 8);
      if (v9)
      {
        v10 = v9;
        objc_sync_enter(v10);
        GEOPDSearchLanguageContextReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readDeviceDisplayLanguage_tags_0);
        objc_sync_exit(v10);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
    v11 = *(id *)(a1 + 16);
    if (v11)
    {
      if (a2)
        v12 = CFSTR("deviceDisplayLanguage");
      else
        v12 = CFSTR("device_display_language");
      objc_msgSend(v4, "setObject:forKey:", v11, v12);
    }

    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(_BYTE *)(a1 + 68) & 2) == 0)
    {
      v13 = *(void **)(a1 + 8);
      if (v13)
      {
        v14 = v13;
        objc_sync_enter(v14);
        GEOPDSearchLanguageContextReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readDeviceKeyboardLanguage_tags_0);
        objc_sync_exit(v14);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
    v15 = *(id *)(a1 + 24);
    if (v15)
    {
      if (a2)
        v16 = CFSTR("deviceKeyboardLanguage");
      else
        v16 = CFSTR("device_keyboard_language");
      objc_msgSend(v4, "setObject:forKey:", v15, v16);
    }

    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(_BYTE *)(a1 + 68) & 4) == 0)
    {
      v17 = *(void **)(a1 + 8);
      if (v17)
      {
        v18 = v17;
        objc_sync_enter(v18);
        GEOPDSearchLanguageContextReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readDeviceSpokenLanguage_tags_0);
        objc_sync_exit(v18);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
    v19 = *(id *)(a1 + 32);
    if (v19)
    {
      if (a2)
        v20 = CFSTR("deviceSpokenLanguage");
      else
        v20 = CFSTR("device_spoken_language");
      objc_msgSend(v4, "setObject:forKey:", v19, v20);
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
  return -[GEOPDSearchLanguageContext _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (void)readAll:(uint64_t)a1
{
  void *v4;
  id v5;
  int *v6;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    v4 = *(void **)(a1 + 8);
    if (v4)
    {
      v5 = v4;
      objc_sync_enter(v5);
      if (a2)
        v6 = (int *)&readAll__recursiveTag_64;
      else
        v6 = (int *)&readAll__nonRecursiveTag_64;
      GEOPDSearchLanguageContextReadSpecified(a1, *(_QWORD *)(a1 + 8), v6);
      objc_sync_exit(v5);

    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5;
  const __CFString *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  const __CFString *v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  const __CFString *v24;
  void *v25;
  void *v26;
  const __CFString *v27;
  void *v28;
  void *v29;
  const __CFString *v30;
  void *v31;
  void *v32;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _BYTE v42[128];
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (a1)
  {
    a1 = (void *)objc_msgSend(a1, "init");
    if (a1)
    {
      if (a3)
        v6 = CFSTR("displayLanguage");
      else
        v6 = CFSTR("display_language");
      objc_msgSend(v5, "objectForKeyedSubscript:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v40 = 0u;
        v41 = 0u;
        v38 = 0u;
        v39 = 0u;
        v8 = v7;
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v38, v43, 16);
        if (v9)
        {
          v10 = v9;
          v11 = *(_QWORD *)v39;
          do
          {
            v12 = 0;
            do
            {
              if (*(_QWORD *)v39 != v11)
                objc_enumerationMutation(v8);
              v13 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * v12);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v14 = (void *)objc_msgSend(v13, "copy");
                -[GEOPDSearchLanguageContext addDisplayLanguage:]((uint64_t)a1, v14);

              }
              ++v12;
            }
            while (v10 != v12);
            v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v38, v43, 16);
          }
          while (v10);
        }

      }
      if (a3)
        v15 = CFSTR("spokenLanguage");
      else
        v15 = CFSTR("spoken_language");
      objc_msgSend(v5, "objectForKeyedSubscript:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v36 = 0u;
        v37 = 0u;
        v34 = 0u;
        v35 = 0u;
        v17 = v16;
        v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
        if (v18)
        {
          v19 = v18;
          v20 = *(_QWORD *)v35;
          do
          {
            v21 = 0;
            do
            {
              if (*(_QWORD *)v35 != v20)
                objc_enumerationMutation(v17);
              v22 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * v21);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v23 = (void *)objc_msgSend(v22, "copy", (_QWORD)v34);
                -[GEOPDSearchLanguageContext addSpokenLanguage:]((uint64_t)a1, v23);

              }
              ++v21;
            }
            while (v19 != v21);
            v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
          }
          while (v19);
        }

      }
      if (a3)
        v24 = CFSTR("deviceDisplayLanguage");
      else
        v24 = CFSTR("device_display_language");
      objc_msgSend(v5, "objectForKeyedSubscript:", v24, (_QWORD)v34);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v26 = (void *)objc_msgSend(v25, "copy");
        -[GEOPDSearchLanguageContext setDeviceDisplayLanguage:]((uint64_t)a1, v26);

      }
      if (a3)
        v27 = CFSTR("deviceKeyboardLanguage");
      else
        v27 = CFSTR("device_keyboard_language");
      objc_msgSend(v5, "objectForKeyedSubscript:", v27);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v29 = (void *)objc_msgSend(v28, "copy");
        -[GEOPDSearchLanguageContext setDeviceKeyboardLanguage:]((uint64_t)a1, v29);

      }
      if (a3)
        v30 = CFSTR("deviceSpokenLanguage");
      else
        v30 = CFSTR("device_spoken_language");
      objc_msgSend(v5, "objectForKeyedSubscript:", v30);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v32 = (void *)objc_msgSend(v31, "copy");
        -[GEOPDSearchLanguageContext setDeviceSpokenLanguage:]((uint64_t)a1, v32);

      }
    }
  }

  return a1;
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDSearchLanguageContextReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v4;
  os_unfair_lock_s *p_readerLock;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSMutableArray *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  PBDataReader *v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), (*(_BYTE *)&self->_flags & 0x3F) == 0))
  {
    v14 = self->_reader;
    objc_sync_enter(v14);
    *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
    -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
    -[PBDataReader readBytes:](self->_reader, "readBytes:", self->_readerMarkLength - self->_readerMarkPos);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "writeData:", v15);
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v14);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOPDSearchLanguageContext readAll:]((uint64_t)self, 0);
    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    v6 = self->_displayLanguages;
    v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v21;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v21 != v8)
            objc_enumerationMutation(v6);
          PBDataWriterWriteStringField();
          ++v9;
        }
        while (v7 != v9);
        v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
      }
      while (v7);
    }

    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    v10 = self->_spokenLanguages;
    v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
    if (v11)
    {
      v12 = *(_QWORD *)v17;
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v17 != v12)
            objc_enumerationMutation(v10);
          PBDataWriterWriteStringField();
          ++v13;
        }
        while (v11 != v13);
        v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
      }
      while (v11);
    }

    if (self->_deviceDisplayLanguage)
      PBDataWriterWriteStringField();
    if (self->_deviceKeyboardLanguage)
      PBDataWriterWriteStringField();
    if (self->_deviceSpokenLanguage)
      PBDataWriterWriteStringField();
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  PBDataReader *reader;
  PBDataReader *v7;
  NSMutableArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  NSMutableArray *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    v7 = reader;
    objc_sync_enter(v7);
    if ((*(_BYTE *)&self->_flags & 0x20) == 0)
    {
      *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
      -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
      GEOPDSearchLanguageContextReadAllFrom((uint64_t)v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      objc_sync_exit(v7);

      return v5;
    }
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPDSearchLanguageContext readAll:]((uint64_t)self, 0);
  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v8 = self->_displayLanguages;
  v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v30;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v30 != v10)
          objc_enumerationMutation(v8);
        v12 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v29 + 1) + 8 * v11), "copyWithZone:", a3);
        -[GEOPDSearchLanguageContext addDisplayLanguage:]((uint64_t)v5, v12);

        ++v11;
      }
      while (v9 != v11);
      v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
    }
    while (v9);
  }

  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v13 = self->_spokenLanguages;
  v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
  if (v14)
  {
    v15 = *(_QWORD *)v26;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v26 != v15)
          objc_enumerationMutation(v13);
        v17 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1) + 8 * v16), "copyWithZone:", a3, (_QWORD)v25);
        -[GEOPDSearchLanguageContext addSpokenLanguage:]((uint64_t)v5, v17);

        ++v16;
      }
      while (v14 != v16);
      v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
    }
    while (v14);
  }

  v18 = -[NSString copyWithZone:](self->_deviceDisplayLanguage, "copyWithZone:", a3);
  v19 = (void *)v5[2];
  v5[2] = v18;

  v20 = -[NSString copyWithZone:](self->_deviceKeyboardLanguage, "copyWithZone:", a3);
  v21 = (void *)v5[3];
  v5[3] = v20;

  v22 = -[NSString copyWithZone:](self->_deviceSpokenLanguage, "copyWithZone:", a3);
  v23 = (void *)v5[4];
  v5[4] = v22;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSMutableArray *displayLanguages;
  NSMutableArray *spokenLanguages;
  NSString *deviceDisplayLanguage;
  NSString *deviceKeyboardLanguage;
  NSString *deviceSpokenLanguage;
  char v10;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((-[GEOPDSearchLanguageContext readAll:]((uint64_t)self, 1),
         -[GEOPDSearchLanguageContext readAll:]((uint64_t)v4, 1),
         displayLanguages = self->_displayLanguages,
         !((unint64_t)displayLanguages | v4[5]))
     || -[NSMutableArray isEqual:](displayLanguages, "isEqual:"))
    && ((spokenLanguages = self->_spokenLanguages, !((unint64_t)spokenLanguages | v4[6]))
     || -[NSMutableArray isEqual:](spokenLanguages, "isEqual:"))
    && ((deviceDisplayLanguage = self->_deviceDisplayLanguage, !((unint64_t)deviceDisplayLanguage | v4[2]))
     || -[NSString isEqual:](deviceDisplayLanguage, "isEqual:"))
    && ((deviceKeyboardLanguage = self->_deviceKeyboardLanguage, !((unint64_t)deviceKeyboardLanguage | v4[3]))
     || -[NSString isEqual:](deviceKeyboardLanguage, "isEqual:")))
  {
    deviceSpokenLanguage = self->_deviceSpokenLanguage;
    if ((unint64_t)deviceSpokenLanguage | v4[4])
      v10 = -[NSString isEqual:](deviceSpokenLanguage, "isEqual:");
    else
      v10 = 1;
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  NSUInteger v5;
  NSUInteger v6;

  -[GEOPDSearchLanguageContext readAll:]((uint64_t)self, 1);
  v3 = -[NSMutableArray hash](self->_displayLanguages, "hash");
  v4 = -[NSMutableArray hash](self->_spokenLanguages, "hash") ^ v3;
  v5 = -[NSString hash](self->_deviceDisplayLanguage, "hash");
  v6 = v4 ^ v5 ^ -[NSString hash](self->_deviceKeyboardLanguage, "hash");
  return v6 ^ -[NSString hash](self->_deviceSpokenLanguage, "hash");
}

- (void)mergeFrom:(uint64_t)a1
{
  id *v3;
  id *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  id v16;
  id v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = v3;
  if (a1)
  {
    -[GEOPDSearchLanguageContext readAll:]((uint64_t)v3, 0);
    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    v5 = v4[5];
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v23;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v23 != v8)
            objc_enumerationMutation(v5);
          -[GEOPDSearchLanguageContext addDisplayLanguage:](a1, *(void **)(*((_QWORD *)&v22 + 1) + 8 * v9++));
        }
        while (v7 != v9);
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
      }
      while (v7);
    }

    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    v10 = v4[6];
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v19;
      do
      {
        v14 = 0;
        do
        {
          if (*(_QWORD *)v19 != v13)
            objc_enumerationMutation(v10);
          -[GEOPDSearchLanguageContext addSpokenLanguage:](a1, *(void **)(*((_QWORD *)&v18 + 1) + 8 * v14++));
        }
        while (v12 != v14);
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
      }
      while (v12);
    }

    v15 = v4[2];
    if (v15)
      -[GEOPDSearchLanguageContext setDeviceDisplayLanguage:](a1, v15);
    v16 = v4[3];
    if (v16)
      -[GEOPDSearchLanguageContext setDeviceKeyboardLanguage:](a1, v16);
    v17 = v4[4];
    if (v17)
      -[GEOPDSearchLanguageContext setDeviceSpokenLanguage:](a1, v17);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_spokenLanguages, 0);
  objc_storeStrong((id *)&self->_displayLanguages, 0);
  objc_storeStrong((id *)&self->_deviceSpokenLanguage, 0);
  objc_storeStrong((id *)&self->_deviceKeyboardLanguage, 0);
  objc_storeStrong((id *)&self->_deviceDisplayLanguage, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
