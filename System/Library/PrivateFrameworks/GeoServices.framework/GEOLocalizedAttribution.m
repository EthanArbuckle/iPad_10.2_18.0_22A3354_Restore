@implementation GEOLocalizedAttribution

- (GEOLocalizedAttribution)init
{
  GEOLocalizedAttribution *v2;
  GEOLocalizedAttribution *v3;
  GEOLocalizedAttribution *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOLocalizedAttribution;
  v2 = -[GEOLocalizedAttribution init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOLocalizedAttribution)initWithData:(id)a3
{
  GEOLocalizedAttribution *v3;
  GEOLocalizedAttribution *v4;
  GEOLocalizedAttribution *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOLocalizedAttribution;
  v3 = -[GEOLocalizedAttribution initWithData:](&v7, sel_initWithData_, a3);
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
    if ((*(_BYTE *)(a1 + 76) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOLocalizedAttributionReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readLanguage_tags_3);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (id)language
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    -[GEOLocalizedAttribution _readLanguage]((uint64_t)a1);
    a1 = (id *)v1[5];
  }
  return a1;
}

- (void)_readDisplayName
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(_BYTE *)(a1 + 76) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOLocalizedAttributionReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readDisplayName_tags_4);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (id)displayName
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    -[GEOLocalizedAttribution _readDisplayName]((uint64_t)a1);
    a1 = (id *)v1[4];
  }
  return a1;
}

- (void)_readLogoURLs
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(_BYTE *)(a1 + 76) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOLocalizedAttributionReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readLogoURLs_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (id)logoURLs
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    -[GEOLocalizedAttribution _readLogoURLs]((uint64_t)a1);
    a1 = (id *)v1[6];
  }
  return a1;
}

- (void)_addNoFlagsLogoURLs:(uint64_t)a1
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

- (id)logoURLsAtIndex:(id *)a1
{
  id *v3;

  if (a1)
  {
    v3 = a1;
    -[GEOLocalizedAttribution _readLogoURLs]((uint64_t)a1);
    objc_msgSend(v3[6], "objectAtIndex:", a2);
    a1 = (id *)objc_claimAutoreleasedReturnValue();
  }
  return a1;
}

- (void)_readSnippetLogoURLs
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(_BYTE *)(a1 + 76) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOLocalizedAttributionReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readSnippetLogoURLs_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (id)snippetLogoURLs
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    -[GEOLocalizedAttribution _readSnippetLogoURLs]((uint64_t)a1);
    a1 = (id *)v1[7];
  }
  return a1;
}

- (void)_addNoFlagsSnippetLogoURLs:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 56);
    v7 = v3;
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *(void **)(a1 + 56);
      *(_QWORD *)(a1 + 56) = v5;

      v4 = *(void **)(a1 + 56);
    }
    objc_msgSend(v4, "addObject:", v7);
    v3 = v7;
  }

}

- (id)snippetLogoURLsAtIndex:(id *)a1
{
  id *v3;

  if (a1)
  {
    v3 = a1;
    -[GEOLocalizedAttribution _readSnippetLogoURLs]((uint64_t)a1);
    objc_msgSend(v3[7], "objectAtIndex:", a2);
    a1 = (id *)objc_claimAutoreleasedReturnValue();
  }
  return a1;
}

- (void)_readCaptionDisplayString
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(_BYTE *)(a1 + 76) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOLocalizedAttributionReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readCaptionDisplayString_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (id)captionDisplayString
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    -[GEOLocalizedAttribution _readCaptionDisplayString]((uint64_t)a1);
    a1 = (id *)v1[3];
  }
  return a1;
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
  v8.super_class = (Class)GEOLocalizedAttribution;
  -[GEOLocalizedAttribution description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOLocalizedAttribution dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOLocalizedAttribution _dictionaryRepresentation:]((uint64_t)self, 0);
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
  id v14;
  id v15;
  _QWORD v17[4];
  id v18;

  if (!a1)
    return 0;
  -[GEOLocalizedAttribution readAll:](a1, 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOLocalizedAttribution language]((id *)a1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    objc_msgSend(v4, "setObject:forKey:", v5, CFSTR("language"));

  -[GEOLocalizedAttribution displayName]((id *)a1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    objc_msgSend(v4, "setObject:forKey:", v6, CFSTR("displayName"));

  if (*(_QWORD *)(a1 + 48))
  {
    -[GEOLocalizedAttribution logoURLs]((id *)a1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("logoURLs"));

  }
  if (*(_QWORD *)(a1 + 56))
  {
    -[GEOLocalizedAttribution snippetLogoURLs]((id *)a1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v8, CFSTR("snippetLogoURLs"));

  }
  -[GEOLocalizedAttribution captionDisplayString]((id *)a1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
    objc_msgSend(v4, "setObject:forKey:", v9, CFSTR("captionDisplayString"));

  v10 = *(void **)(a1 + 16);
  if (v10)
  {
    objc_msgSend(v10, "dictionaryRepresentation");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (a2)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v11, "count"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v17[0] = MEMORY[0x1E0C809B0];
      v17[1] = 3221225472;
      v17[2] = __53__GEOLocalizedAttribution__dictionaryRepresentation___block_invoke;
      v17[3] = &unk_1E1C00600;
      v14 = v13;
      v18 = v14;
      objc_msgSend(v12, "enumerateKeysAndObjectsUsingBlock:", v17);
      v15 = v14;

      v12 = v15;
    }
    objc_msgSend(v4, "setObject:forKey:", v12, CFSTR("Unknown Fields"));

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOLocalizedAttribution _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (void)readAll:(uint64_t)a1
{
  void *v4;
  id v5;
  int *v6;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    v4 = *(void **)(a1 + 8);
    if (v4)
    {
      v5 = v4;
      objc_sync_enter(v5);
      if (a2)
        v6 = (int *)&readAll__recursiveTag_153;
      else
        v6 = (int *)&readAll__nonRecursiveTag_154;
      GEOLocalizedAttributionReadSpecified(a1, *(_QWORD *)(a1 + 8), v6);
      objc_sync_exit(v5);

    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

void __53__GEOLocalizedAttribution__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (BOOL)readFrom:(id)a3
{
  return GEOLocalizedAttributionReadAllFrom((uint64_t)self, a3, 0);
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
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), (*(_BYTE *)&self->_flags & 0x7E) == 0))
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
    -[GEOLocalizedAttribution readAll:]((uint64_t)self, 0);
    if (self->_language)
      PBDataWriterWriteStringField();
    if (self->_displayName)
      PBDataWriterWriteStringField();
    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    v6 = self->_logoURLs;
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
    v10 = self->_snippetLogoURLs;
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

    if (self->_captionDisplayString)
      PBDataWriterWriteStringField();
    -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4, v16);
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  os_unfair_lock_s *p_readerLock;
  PBDataReader *reader;
  GEOLocalizedAttribution *v8;
  PBDataReader *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  NSMutableArray *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  id v18;
  NSMutableArray *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t j;
  void *v23;
  void *v24;
  id v25;
  uint64_t v26;
  void *v27;
  GEOLocalizedAttribution *v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    v8 = self;
    v9 = reader;
    objc_sync_enter(v9);
    if ((*(_BYTE *)&v8->_flags & 0x40) == 0)
    {
      *(_QWORD *)((char *)v8->_reader + (int)*MEMORY[0x1E0D82BD8]) = v8->_readerMarkLength;
      -[PBDataReader seekToOffset:](v8->_reader, "seekToOffset:", v8->_readerMarkPos);
      GEOLocalizedAttributionReadAllFrom(v5, v8->_reader, 0);
      os_unfair_lock_unlock(p_readerLock);
      objc_sync_exit(v9);

      return (id)v5;
    }
    objc_sync_exit(v9);

    self = v8;
  }
  os_unfair_lock_unlock(p_readerLock);
  -[GEOLocalizedAttribution readAll:]((uint64_t)self, 0);
  v10 = -[NSString copyWithZone:](self->_language, "copyWithZone:", a3);
  v11 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v10;

  v12 = -[NSString copyWithZone:](self->_displayName, "copyWithZone:", a3);
  v13 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v12;

  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  v29 = self;
  v14 = self->_logoURLs;
  v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
  if (v15)
  {
    v16 = *(_QWORD *)v35;
    do
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v35 != v16)
          objc_enumerationMutation(v14);
        v18 = (id)objc_msgSend(*(id *)(*((_QWORD *)&v34 + 1) + 8 * i), "copyWithZone:", a3);
        -[GEOLocalizedAttribution _readLogoURLs](v5);
        -[GEOLocalizedAttribution _addNoFlagsLogoURLs:](v5, v18);

        os_unfair_lock_lock_with_options();
        *(_BYTE *)(v5 + 76) |= 0x10u;
        os_unfair_lock_unlock((os_unfair_lock_t)(v5 + 72));
        *(_BYTE *)(v5 + 76) |= 0x40u;

      }
      v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
    }
    while (v15);
  }

  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  v19 = v29->_snippetLogoURLs;
  v20 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
  if (v20)
  {
    v21 = *(_QWORD *)v31;
    do
    {
      for (j = 0; j != v20; ++j)
      {
        if (*(_QWORD *)v31 != v21)
          objc_enumerationMutation(v19);
        v23 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v30 + 1) + 8 * j), "copyWithZone:", a3);
        v24 = v23;
        if (v5)
        {
          v25 = v23;
          -[GEOLocalizedAttribution _readSnippetLogoURLs](v5);
          -[GEOLocalizedAttribution _addNoFlagsSnippetLogoURLs:](v5, v25);

          os_unfair_lock_lock_with_options();
          *(_BYTE *)(v5 + 76) |= 0x20u;
          os_unfair_lock_unlock((os_unfair_lock_t)(v5 + 72));
          *(_BYTE *)(v5 + 76) |= 0x40u;
        }

      }
      v20 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
    }
    while (v20);
  }

  v26 = -[NSString copyWithZone:](v29->_captionDisplayString, "copyWithZone:", a3);
  v27 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v26;

  objc_storeStrong((id *)(v5 + 16), v29->_unknownFields);
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSString *language;
  NSString *displayName;
  NSMutableArray *logoURLs;
  NSMutableArray *snippetLogoURLs;
  NSString *captionDisplayString;
  char v10;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((-[GEOLocalizedAttribution readAll:]((uint64_t)self, 1),
         -[GEOLocalizedAttribution readAll:]((uint64_t)v4, 1),
         language = self->_language,
         !((unint64_t)language | v4[5]))
     || -[NSString isEqual:](language, "isEqual:"))
    && ((displayName = self->_displayName, !((unint64_t)displayName | v4[4]))
     || -[NSString isEqual:](displayName, "isEqual:"))
    && ((logoURLs = self->_logoURLs, !((unint64_t)logoURLs | v4[6]))
     || -[NSMutableArray isEqual:](logoURLs, "isEqual:"))
    && ((snippetLogoURLs = self->_snippetLogoURLs, !((unint64_t)snippetLogoURLs | v4[7]))
     || -[NSMutableArray isEqual:](snippetLogoURLs, "isEqual:")))
  {
    captionDisplayString = self->_captionDisplayString;
    if ((unint64_t)captionDisplayString | v4[3])
      v10 = -[NSString isEqual:](captionDisplayString, "isEqual:");
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
  NSUInteger v3;
  NSUInteger v4;
  uint64_t v5;
  uint64_t v6;

  -[GEOLocalizedAttribution readAll:]((uint64_t)self, 1);
  v3 = -[NSString hash](self->_language, "hash");
  v4 = -[NSString hash](self->_displayName, "hash") ^ v3;
  v5 = -[NSMutableArray hash](self->_logoURLs, "hash");
  v6 = v4 ^ v5 ^ -[NSMutableArray hash](self->_snippetLogoURLs, "hash");
  return v6 ^ -[NSString hash](self->_captionDisplayString, "hash");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_snippetLogoURLs, 0);
  objc_storeStrong((id *)&self->_logoURLs, 0);
  objc_storeStrong((id *)&self->_language, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_captionDisplayString, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

- (id)bestURLForLogos:(id)a3 scale:(double)a4
{
  id v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t i;
  id v9;
  void *v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  uint64_t v14;
  char v15;
  void *v16;
  uint64_t v17;
  id v18;
  uint64_t v20;
  uint64_t v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v5 = a3;
  v21 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v21)
  {
    v6 = vcvtpd_u64_f64(a4);
    v7 = *(_QWORD *)v23;
    v20 = *(_QWORD *)v23;
    while (2)
    {
      for (i = 0; i != v21; ++i)
      {
        if (*(_QWORD *)v23 != v7)
          objc_enumerationMutation(v5);
        v9 = *(id *)(*((_QWORD *)&v22 + 1) + 8 * i);
        if (a4 <= 1.0)
        {
          v12 = v6;
          v13 = 0;
          v14 = 2;
          while (1)
          {
            v15 = v13;
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("@%lux"), v14);
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            v17 = objc_msgSend(v9, "rangeOfString:", v16);

            if (v17 != 0x7FFFFFFFFFFFFFFFLL)
              break;
            v13 = 1;
            v14 = 3;
            if ((v15 & 1) != 0)
            {

              goto LABEL_17;
            }
          }

          v6 = v12;
          v7 = v20;
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("@%lux"), v6);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = objc_msgSend(v9, "rangeOfString:", v10);

          if (v11 != 0x7FFFFFFFFFFFFFFFLL)
          {
LABEL_17:
            v18 = v9;
            goto LABEL_19;
          }
        }
      }
      v18 = 0;
      v21 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      if (v21)
        continue;
      break;
    }
  }
  else
  {
    v18 = 0;
  }
LABEL_19:

  return v18;
}

@end
