@implementation GEOPDExploreGuides

+ (id)exploreGuideComponentFromPlaceData:(id)a3
{
  return (id)objc_msgSend(a3, "successfulComponentWithValuesOfType:", 85);
}

- (uint64_t)hasGreenTeaWithValue:(uint64_t)result
{
  uint64_t v3;

  if (result)
  {
    v3 = result;
    -[GEOPDExploreGuides _readGuidesLocationEntry](result);
    return -[GEOPDGuidesLocationEntry hasGreenTeaWithValue:](*(_QWORD *)(v3 + 32), a2);
  }
  return result;
}

- (void)mergeFrom:(uint64_t)a1
{
  _QWORD *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  _QWORD *v7;

  v3 = a2;
  if (a1)
  {
    v7 = v3;
    -[GEOPDExploreGuides readAll:]((uint64_t)v3, 0);
    v4 = *(_QWORD *)(a1 + 32);
    v5 = (void *)v7[4];
    if (v4)
    {
      if (v5)
        -[GEOPDGuidesLocationEntry mergeFrom:](v4, v5);
    }
    else if (v5)
    {
      -[GEOPDExploreGuides setGuidesLocationEntry:](a1, v5);
    }
    v3 = v7;
    v6 = (void *)v7[3];
    if (v6)
    {
      -[GEOPDExploreGuides setExploreImageUrlTemplate:](a1, v6);
      v3 = v7;
    }
  }

}

- (void)clearUnknownFields:(uint64_t)a1
{
  void *v4;

  if (a1)
  {
    os_unfair_lock_lock_with_options();
    *(_BYTE *)(a1 + 52) |= 1u;
    *(_BYTE *)(a1 + 52) |= 8u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
    v4 = *(void **)(a1 + 16);
    *(_QWORD *)(a1 + 16) = 0;

    if (a2)
    {
      -[GEOPDExploreGuides readAll:](a1, 0);
      -[GEOPDGuidesLocationEntry clearUnknownFields:](*(_QWORD *)(a1 + 32), 1);
    }
  }
}

- (GEOPDExploreGuides)init
{
  GEOPDExploreGuides *v2;
  GEOPDExploreGuides *v3;
  GEOPDExploreGuides *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOPDExploreGuides;
  v2 = -[GEOPDExploreGuides init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPDExploreGuides)initWithData:(id)a3
{
  GEOPDExploreGuides *v3;
  GEOPDExploreGuides *v4;
  GEOPDExploreGuides *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOPDExploreGuides;
  v3 = -[GEOPDExploreGuides initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readGuidesLocationEntry
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 48));
    if ((*(_BYTE *)(a1 + 52) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDExploreGuidesReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readGuidesLocationEntry_tags_0);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

- (id)guidesLocationEntry
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    -[GEOPDExploreGuides _readGuidesLocationEntry]((uint64_t)a1);
    a1 = (id *)v1[4];
  }
  return a1;
}

- (void)setGuidesLocationEntry:(uint64_t)a1
{
  id v4;

  v4 = a2;
  if (a1)
  {
    *(_BYTE *)(a1 + 52) |= 4u;
    *(_BYTE *)(a1 + 52) |= 8u;
    objc_storeStrong((id *)(a1 + 32), a2);
  }

}

- (void)_readExploreImageUrlTemplate
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 48));
    if ((*(_BYTE *)(a1 + 52) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDExploreGuidesReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readExploreImageUrlTemplate_tags_0);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

- (id)exploreImageUrlTemplate
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    -[GEOPDExploreGuides _readExploreImageUrlTemplate]((uint64_t)a1);
    a1 = (id *)v1[3];
  }
  return a1;
}

- (void)setExploreImageUrlTemplate:(uint64_t)a1
{
  id v4;

  v4 = a2;
  if (a1)
  {
    *(_BYTE *)(a1 + 52) |= 2u;
    *(_BYTE *)(a1 + 52) |= 8u;
    objc_storeStrong((id *)(a1 + 24), a2);
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
  v8.super_class = (Class)GEOPDExploreGuides;
  -[GEOPDExploreGuides description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPDExploreGuides dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDExploreGuides _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  const __CFString *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  _QWORD v18[4];
  id v19;

  if (!a1)
    return 0;
  -[GEOPDExploreGuides readAll:](a1, 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPDExploreGuides guidesLocationEntry]((id *)a1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v5, "jsonRepresentation");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = CFSTR("guidesLocationEntry");
    }
    else
    {
      objc_msgSend(v5, "dictionaryRepresentation");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = CFSTR("guides_location_entry");
    }
    objc_msgSend(v4, "setObject:forKey:", v7, v8);

  }
  -[GEOPDExploreGuides exploreImageUrlTemplate]((id *)a1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    if (a2)
      v10 = CFSTR("exploreImageUrlTemplate");
    else
      v10 = CFSTR("explore_image_url_template");
    objc_msgSend(v4, "setObject:forKey:", v9, v10);
  }

  v11 = *(void **)(a1 + 16);
  if (v11)
  {
    objc_msgSend(v11, "dictionaryRepresentation");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (a2)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v12, "count"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v18[0] = MEMORY[0x1E0C809B0];
      v18[1] = 3221225472;
      v18[2] = __48__GEOPDExploreGuides__dictionaryRepresentation___block_invoke;
      v18[3] = &unk_1E1C00600;
      v15 = v14;
      v19 = v15;
      objc_msgSend(v13, "enumerateKeysAndObjectsUsingBlock:", v18);
      v16 = v15;

      v13 = v16;
    }
    objc_msgSend(v4, "setObject:forKey:", v13, CFSTR("Unknown Fields"));

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOPDExploreGuides _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (void)readAll:(uint64_t)a1
{
  void *v4;
  id v5;
  int *v6;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 48));
    v4 = *(void **)(a1 + 8);
    if (v4)
    {
      v5 = v4;
      objc_sync_enter(v5);
      if (a2)
        v6 = (int *)&readAll__recursiveTag_3841;
      else
        v6 = (int *)&readAll__nonRecursiveTag_3842;
      GEOPDExploreGuidesReadSpecified(a1, *(_QWORD *)(a1 + 8), v6);
      objc_sync_exit(v5);

    }
    if (a2)
      -[GEOPDGuidesLocationEntry readAll:](*(_QWORD *)(a1 + 32), 1);
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

void __48__GEOPDExploreGuides__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5;
  const __CFString *v6;
  void *v7;
  GEOPDGuidesLocationEntry *v8;
  void *v9;
  const __CFString *v10;
  void *v11;
  void *v12;

  v5 = a2;
  if (a1)
  {
    a1 = (void *)objc_msgSend(a1, "init");
    if (a1)
    {
      if (a3)
        v6 = CFSTR("guidesLocationEntry");
      else
        v6 = CFSTR("guides_location_entry");
      objc_msgSend(v5, "objectForKeyedSubscript:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v8 = [GEOPDGuidesLocationEntry alloc];
        if (v8)
          v9 = (void *)-[GEOPDGuidesLocationEntry _initWithDictionary:isJSON:]((uint64_t)v8, v7, a3);
        else
          v9 = 0;
        -[GEOPDExploreGuides setGuidesLocationEntry:]((uint64_t)a1, v9);

      }
      if (a3)
        v10 = CFSTR("exploreImageUrlTemplate");
      else
        v10 = CFSTR("explore_image_url_template");
      objc_msgSend(v5, "objectForKeyedSubscript:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v12 = (void *)objc_msgSend(v11, "copy");
        -[GEOPDExploreGuides setExploreImageUrlTemplate:]((uint64_t)a1, v12);

      }
    }
  }

  return a1;
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDExploreGuidesReadAllFrom((uint64_t)self, a3, 0);
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
  if (self->_reader && (_GEOPDExploreGuidesIsDirty((uint64_t)self) & 1) == 0)
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
    -[GEOPDExploreGuides readAll:]((uint64_t)self, 0);
    if (self->_guidesLocationEntry)
      PBDataWriterWriteSubmessage();
    v5 = v8;
    if (self->_exploreImageUrlTemplate)
    {
      PBDataWriterWriteStringField();
      v5 = v8;
    }
    -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v5);
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  PBDataReader *reader;
  PBDataReader *v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (!reader)
    goto LABEL_5;
  v7 = reader;
  objc_sync_enter(v7);
  if ((*(_BYTE *)&self->_flags & 8) != 0)
  {
    objc_sync_exit(v7);

LABEL_5:
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOPDExploreGuides readAll:]((uint64_t)self, 0);
    v8 = -[GEOPDGuidesLocationEntry copyWithZone:](self->_guidesLocationEntry, "copyWithZone:", a3);
    v9 = *(void **)(v5 + 32);
    *(_QWORD *)(v5 + 32) = v8;

    v10 = -[NSString copyWithZone:](self->_exploreImageUrlTemplate, "copyWithZone:", a3);
    v11 = *(void **)(v5 + 24);
    *(_QWORD *)(v5 + 24) = v10;

    objc_storeStrong((id *)(v5 + 16), self->_unknownFields);
    return (id)v5;
  }
  *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
  -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
  GEOPDExploreGuidesReadAllFrom(v5, self->_reader, 0);
  os_unfair_lock_unlock(&self->_readerLock);
  objc_sync_exit(v7);

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  GEOPDGuidesLocationEntry *guidesLocationEntry;
  NSString *exploreImageUrlTemplate;
  char v7;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((-[GEOPDExploreGuides readAll:]((uint64_t)self, 1),
         -[GEOPDExploreGuides readAll:]((uint64_t)v4, 1),
         guidesLocationEntry = self->_guidesLocationEntry,
         !((unint64_t)guidesLocationEntry | v4[4]))
     || -[GEOPDGuidesLocationEntry isEqual:](guidesLocationEntry, "isEqual:")))
  {
    exploreImageUrlTemplate = self->_exploreImageUrlTemplate;
    if ((unint64_t)exploreImageUrlTemplate | v4[3])
      v7 = -[NSString isEqual:](exploreImageUrlTemplate, "isEqual:");
    else
      v7 = 1;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  unint64_t v3;

  -[GEOPDExploreGuides readAll:]((uint64_t)self, 1);
  v3 = -[GEOPDGuidesLocationEntry hash](self->_guidesLocationEntry, "hash");
  return -[NSString hash](self->_exploreImageUrlTemplate, "hash") ^ v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_guidesLocationEntry, 0);
  objc_storeStrong((id *)&self->_exploreImageUrlTemplate, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
