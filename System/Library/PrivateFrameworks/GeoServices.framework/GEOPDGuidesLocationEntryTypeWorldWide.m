@implementation GEOPDGuidesLocationEntryTypeWorldWide

- (void)clearUnknownFields:(uint64_t)a1
{
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    os_unfair_lock_lock_with_options();
    *(_BYTE *)(a1 + 60) |= 1u;
    *(_BYTE *)(a1 + 60) |= 0x10u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
    v4 = *(void **)(a1 + 16);
    *(_QWORD *)(a1 + 16) = 0;

    if (a2)
    {
      -[GEOPDGuidesLocationEntryTypeWorldWide readAll:](a1, 0);
      -[GEOPDCaptionedPhoto clearUnknownFields:](*(_QWORD *)(a1 + 40));
      v12 = 0u;
      v13 = 0u;
      v10 = 0u;
      v11 = 0u;
      v5 = *(id *)(a1 + 24);
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      if (v6)
      {
        v7 = v6;
        v8 = *(_QWORD *)v11;
        do
        {
          v9 = 0;
          do
          {
            if (*(_QWORD *)v11 != v8)
              objc_enumerationMutation(v5);
            -[GEOPDGuideLocationImage clearUnknownFields:](*(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v9++));
          }
          while (v7 != v9);
          v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
        }
        while (v7);
      }

    }
  }
}

- (GEOPDGuidesLocationEntryTypeWorldWide)init
{
  GEOPDGuidesLocationEntryTypeWorldWide *v2;
  GEOPDGuidesLocationEntryTypeWorldWide *v3;
  GEOPDGuidesLocationEntryTypeWorldWide *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOPDGuidesLocationEntryTypeWorldWide;
  v2 = -[GEOPDGuidesLocationEntryTypeWorldWide init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPDGuidesLocationEntryTypeWorldWide)initWithData:(id)a3
{
  GEOPDGuidesLocationEntryTypeWorldWide *v3;
  GEOPDGuidesLocationEntryTypeWorldWide *v4;
  GEOPDGuidesLocationEntryTypeWorldWide *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOPDGuidesLocationEntryTypeWorldWide;
  v3 = -[GEOPDGuidesLocationEntryTypeWorldWide initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readName
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    if ((*(_BYTE *)(a1 + 60) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDGuidesLocationEntryTypeWorldWideReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readName_tags_4214);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (id)name
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    -[GEOPDGuidesLocationEntryTypeWorldWide _readName]((uint64_t)a1);
    a1 = (id *)v1[4];
  }
  return a1;
}

- (void)setName:(uint64_t)a1
{
  id v4;

  v4 = a2;
  *(_BYTE *)(a1 + 60) |= 4u;
  *(_BYTE *)(a1 + 60) |= 0x10u;
  objc_storeStrong((id *)(a1 + 32), a2);

}

- (void)_readPhoto
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    if ((*(_BYTE *)(a1 + 60) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDGuidesLocationEntryTypeWorldWideReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readPhoto_tags_4215);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (void)setPhoto:(uint64_t)a1
{
  id v4;

  v4 = a2;
  *(_BYTE *)(a1 + 60) |= 8u;
  *(_BYTE *)(a1 + 60) |= 0x10u;
  objc_storeStrong((id *)(a1 + 40), a2);

}

- (void)_readGuideLocationImages
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    if ((*(_BYTE *)(a1 + 60) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDGuidesLocationEntryTypeWorldWideReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readGuideLocationImages_tags_4216);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (id)guideLocationImages
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    -[GEOPDGuidesLocationEntryTypeWorldWide _readGuideLocationImages]((uint64_t)a1);
    a1 = (id *)v1[3];
  }
  return a1;
}

- (void)addGuideLocationImage:(uint64_t)a1
{
  id v3;

  if (a1)
  {
    v3 = a2;
    -[GEOPDGuidesLocationEntryTypeWorldWide _readGuideLocationImages](a1);
    -[GEOPDGuidesLocationEntryTypeWorldWide _addNoFlagsGuideLocationImage:](a1, v3);

    os_unfair_lock_lock_with_options();
    *(_BYTE *)(a1 + 60) |= 2u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
    *(_BYTE *)(a1 + 60) |= 0x10u;
  }
}

- (void)_addNoFlagsGuideLocationImage:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 24);
    v7 = v3;
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *(void **)(a1 + 24);
      *(_QWORD *)(a1 + 24) = v5;

      v4 = *(void **)(a1 + 24);
    }
    objc_msgSend(v4, "addObject:", v7);
    v3 = v7;
  }

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
  v8.super_class = (Class)GEOPDGuidesLocationEntryTypeWorldWide;
  -[GEOPDGuidesLocationEntryTypeWorldWide description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPDGuidesLocationEntryTypeWorldWide dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDGuidesLocationEntryTypeWorldWide _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  const __CFString *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  id v23;
  _QWORD v25[4];
  id v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  -[GEOPDGuidesLocationEntryTypeWorldWide readAll:](a1, 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPDGuidesLocationEntryTypeWorldWide name]((id *)a1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    objc_msgSend(v4, "setObject:forKey:", v5, CFSTR("name"));

  -[GEOPDGuidesLocationEntryTypeWorldWide _readPhoto](a1);
  v6 = *(id *)(a1 + 40);
  v7 = v6;
  if (v6)
  {
    if ((a2 & 1) != 0)
      objc_msgSend(v6, "jsonRepresentation");
    else
      objc_msgSend(v6, "dictionaryRepresentation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v8, CFSTR("photo"));

  }
  if (objc_msgSend(*(id *)(a1 + 24), "count"))
  {
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 24), "count"));
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    v10 = *(id *)(a1 + 24);
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v28;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v28 != v13)
            objc_enumerationMutation(v10);
          v15 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
          if ((a2 & 1) != 0)
            objc_msgSend(v15, "jsonRepresentation");
          else
            objc_msgSend(v15, "dictionaryRepresentation");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "addObject:", v16);

        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
      }
      while (v12);
    }

    if (a2)
      v17 = CFSTR("guideLocationImage");
    else
      v17 = CFSTR("guide_location_image");
    objc_msgSend(v4, "setObject:forKey:", v9, v17);

  }
  v18 = *(void **)(a1 + 16);
  if (v18)
  {
    objc_msgSend(v18, "dictionaryRepresentation");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v19;
    if (a2)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v19, "count"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v25[0] = MEMORY[0x1E0C809B0];
      v25[1] = 3221225472;
      v25[2] = __67__GEOPDGuidesLocationEntryTypeWorldWide__dictionaryRepresentation___block_invoke;
      v25[3] = &unk_1E1C00600;
      v22 = v21;
      v26 = v22;
      objc_msgSend(v20, "enumerateKeysAndObjectsUsingBlock:", v25);
      v23 = v22;

      v20 = v23;
    }
    objc_msgSend(v4, "setObject:forKey:", v20, CFSTR("Unknown Fields"));

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOPDGuidesLocationEntryTypeWorldWide _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (void)readAll:(uint64_t)a1
{
  void *v4;
  id v5;
  int *v6;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    v4 = *(void **)(a1 + 8);
    if (v4)
    {
      v5 = v4;
      objc_sync_enter(v5);
      if (a2)
        v6 = (int *)&readAll__recursiveTag_4217;
      else
        v6 = (int *)&readAll__nonRecursiveTag_4218;
      GEOPDGuidesLocationEntryTypeWorldWideReadSpecified(a1, *(_QWORD *)(a1 + 8), v6);
      objc_sync_exit(v5);

    }
    if (a2)
      _GEOPDGuidesLocationEntryTypeWorldWideCallReadAllRecursiveWithoutSynchronized(a1);
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

void __67__GEOPDGuidesLocationEntryTypeWorldWide__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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
  return GEOPDGuidesLocationEntryTypeWorldWideReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v4;
  os_unfair_lock_s *p_readerLock;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  PBDataReader *v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEOPDGuidesLocationEntryTypeWorldWideIsDirty((uint64_t)self) & 1) == 0)
  {
    v10 = self->_reader;
    objc_sync_enter(v10);
    *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
    -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
    -[PBDataReader readBytes:](self->_reader, "readBytes:", self->_readerMarkLength - self->_readerMarkPos);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "writeData:", v11);
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v10);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOPDGuidesLocationEntryTypeWorldWide readAll:]((uint64_t)self, 0);
    if (self->_name)
      PBDataWriterWriteStringField();
    if (self->_photo)
      PBDataWriterWriteSubmessage();
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v6 = self->_guideLocationImages;
    v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v13;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v13 != v8)
            objc_enumerationMutation(v6);
          PBDataWriterWriteSubmessage();
          ++v9;
        }
        while (v7 != v9);
        v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v7);
    }

    -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4, v12);
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  PBDataReader *reader;
  PBDataReader *v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  NSMutableArray *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    v7 = reader;
    objc_sync_enter(v7);
    if ((*(_BYTE *)&self->_flags & 0x10) == 0)
    {
      *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
      -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
      GEOPDGuidesLocationEntryTypeWorldWideReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      objc_sync_exit(v7);

      return (id)v5;
    }
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPDGuidesLocationEntryTypeWorldWide readAll:]((uint64_t)self, 0);
  v8 = -[NSString copyWithZone:](self->_name, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v8;

  v10 = -[GEOPDCaptionedPhoto copyWithZone:](self->_photo, "copyWithZone:", a3);
  v11 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v10;

  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v12 = self->_guideLocationImages;
  v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v13)
  {
    v14 = *(_QWORD *)v19;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v19 != v14)
          objc_enumerationMutation(v12);
        v16 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * v15), "copyWithZone:", a3, (_QWORD)v18);
        -[GEOPDGuidesLocationEntryTypeWorldWide addGuideLocationImage:](v5, v16);

        ++v15;
      }
      while (v13 != v15);
      v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v13);
  }

  objc_storeStrong((id *)(v5 + 16), self->_unknownFields);
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSString *name;
  GEOPDCaptionedPhoto *photo;
  NSMutableArray *guideLocationImages;
  char v8;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((-[GEOPDGuidesLocationEntryTypeWorldWide readAll:]((uint64_t)self, 1),
         -[GEOPDGuidesLocationEntryTypeWorldWide readAll:]((uint64_t)v4, 1),
         name = self->_name,
         !((unint64_t)name | v4[4]))
     || -[NSString isEqual:](name, "isEqual:"))
    && ((photo = self->_photo, !((unint64_t)photo | v4[5])) || -[GEOPDCaptionedPhoto isEqual:](photo, "isEqual:")))
  {
    guideLocationImages = self->_guideLocationImages;
    if ((unint64_t)guideLocationImages | v4[3])
      v8 = -[NSMutableArray isEqual:](guideLocationImages, "isEqual:");
    else
      v8 = 1;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  NSUInteger v3;
  unint64_t v4;

  -[GEOPDGuidesLocationEntryTypeWorldWide readAll:]((uint64_t)self, 1);
  v3 = -[NSString hash](self->_name, "hash");
  v4 = -[GEOPDCaptionedPhoto hash](self->_photo, "hash") ^ v3;
  return v4 ^ -[NSMutableArray hash](self->_guideLocationImages, "hash");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_photo, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_guideLocationImages, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
