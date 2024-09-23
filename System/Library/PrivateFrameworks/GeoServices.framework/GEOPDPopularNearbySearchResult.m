@implementation GEOPDPopularNearbySearchResult

- (GEOPDPopularNearbySearchResult)init
{
  GEOPDPopularNearbySearchResult *v2;
  GEOPDPopularNearbySearchResult *v3;
  GEOPDPopularNearbySearchResult *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOPDPopularNearbySearchResult;
  v2 = -[GEOPDPopularNearbySearchResult init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPDPopularNearbySearchResult)initWithData:(id)a3
{
  GEOPDPopularNearbySearchResult *v3;
  GEOPDPopularNearbySearchResult *v4;
  GEOPDPopularNearbySearchResult *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOPDPopularNearbySearchResult;
  v3 = -[GEOPDPopularNearbySearchResult initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readDisplayMapRegion
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 48));
    if ((*(_BYTE *)(a1 + 56) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDPopularNearbySearchResultReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readDisplayMapRegion_tags_4761);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

- (id)displayMapRegion
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    -[GEOPDPopularNearbySearchResult _readDisplayMapRegion]((uint64_t)a1);
    a1 = (id *)v1[3];
  }
  return a1;
}

- (void)setDisplayMapRegion:(uint64_t)a1
{
  id v4;

  v4 = a2;
  *(_BYTE *)(a1 + 56) |= 4u;
  *(_BYTE *)(a1 + 56) |= 0x10u;
  objc_storeStrong((id *)(a1 + 24), a2);

}

- (void)_readSectionHeader
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 48));
    if ((*(_BYTE *)(a1 + 56) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDPopularNearbySearchResultReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readSectionHeader_tags_4762);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

- (id)sectionHeader
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    -[GEOPDPopularNearbySearchResult _readSectionHeader]((uint64_t)a1);
    a1 = (id *)v1[4];
  }
  return a1;
}

- (void)setSectionHeader:(uint64_t)a1
{
  id v4;

  v4 = a2;
  *(_BYTE *)(a1 + 56) |= 8u;
  *(_BYTE *)(a1 + 56) |= 0x10u;
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
  v8.super_class = (Class)GEOPDPopularNearbySearchResult;
  -[GEOPDPopularNearbySearchResult description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPDPopularNearbySearchResult dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDPopularNearbySearchResult _dictionaryRepresentation:]((uint64_t)self, 0);
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
  const __CFString *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  _QWORD v20[4];
  id v21;

  if (!a1)
    return 0;
  -[GEOPDPopularNearbySearchResult readAll:](a1, 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPDPopularNearbySearchResult displayMapRegion]((id *)a1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v5, "jsonRepresentation");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = CFSTR("displayMapRegion");
    }
    else
    {
      objc_msgSend(v5, "dictionaryRepresentation");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = CFSTR("display_map_region");
    }
    objc_msgSend(v4, "setObject:forKey:", v7, v8);

  }
  -[GEOPDPopularNearbySearchResult sectionHeader]((id *)a1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    if (a2)
      v10 = CFSTR("sectionHeader");
    else
      v10 = CFSTR("section_header");
    objc_msgSend(v4, "setObject:forKey:", v9, v10);
  }

  if ((*(_BYTE *)(a1 + 56) & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 52));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v12 = CFSTR("isChainResultSet");
    else
      v12 = CFSTR("is_chain_result_set");
    objc_msgSend(v4, "setObject:forKey:", v11, v12);

  }
  v13 = *(void **)(a1 + 16);
  if (v13)
  {
    objc_msgSend(v13, "dictionaryRepresentation");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v14;
    if (a2)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v14, "count"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v20[0] = MEMORY[0x1E0C809B0];
      v20[1] = 3221225472;
      v20[2] = __60__GEOPDPopularNearbySearchResult__dictionaryRepresentation___block_invoke;
      v20[3] = &unk_1E1C00600;
      v17 = v16;
      v21 = v17;
      objc_msgSend(v15, "enumerateKeysAndObjectsUsingBlock:", v20);
      v18 = v17;

      v15 = v18;
    }
    objc_msgSend(v4, "setObject:forKey:", v15, CFSTR("Unknown Fields"));

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOPDPopularNearbySearchResult _dictionaryRepresentation:]((uint64_t)self, 1);
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
        v6 = (int *)&readAll__recursiveTag_4763;
      else
        v6 = (int *)&readAll__nonRecursiveTag_4764;
      GEOPDPopularNearbySearchResultReadSpecified(a1, *(_QWORD *)(a1 + 8), v6);
      objc_sync_exit(v5);

    }
    if (a2)
      objc_msgSend(*(id *)(a1 + 24), "readAll:", 1);
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

void __60__GEOPDPopularNearbySearchResult__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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
  return GEOPDPopularNearbySearchResultReadAllFrom((uint64_t)self, a3, 0);
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
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), (*(_BYTE *)&self->_flags & 0x1C) == 0))
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
    -[GEOPDPopularNearbySearchResult readAll:]((uint64_t)self, 0);
    if (self->_displayMapRegion)
      PBDataWriterWriteSubmessage();
    v5 = v8;
    if (self->_sectionHeader)
    {
      PBDataWriterWriteStringField();
      v5 = v8;
    }
    if ((*(_BYTE *)&self->_flags & 1) != 0)
    {
      PBDataWriterWriteBOOLField();
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
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  PBUnknownFields *v13;

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
      GEOPDPopularNearbySearchResultReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_8;
    }
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPDPopularNearbySearchResult readAll:]((uint64_t)self, 0);
  v9 = -[GEOMapRegion copyWithZone:](self->_displayMapRegion, "copyWithZone:", a3);
  v10 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v9;

  v11 = -[NSString copyWithZone:](self->_sectionHeader, "copyWithZone:", a3);
  v12 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v11;

  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    *(_BYTE *)(v5 + 52) = self->_isChainResultSet;
    *(_BYTE *)(v5 + 56) |= 1u;
  }
  v13 = self->_unknownFields;
  v8 = *(id *)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v13;
LABEL_8:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  GEOMapRegion *displayMapRegion;
  NSString *sectionHeader;
  BOOL v7;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_8;
  -[GEOPDPopularNearbySearchResult readAll:]((uint64_t)self, 1);
  -[GEOPDPopularNearbySearchResult readAll:]((uint64_t)v4, 1);
  displayMapRegion = self->_displayMapRegion;
  if ((unint64_t)displayMapRegion | *((_QWORD *)v4 + 3))
  {
    if (!-[GEOMapRegion isEqual:](displayMapRegion, "isEqual:"))
      goto LABEL_8;
  }
  sectionHeader = self->_sectionHeader;
  if ((unint64_t)sectionHeader | *((_QWORD *)v4 + 4))
  {
    if (!-[NSString isEqual:](sectionHeader, "isEqual:"))
      goto LABEL_8;
  }
  v7 = (*((_BYTE *)v4 + 56) & 1) == 0;
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 56) & 1) == 0)
    {
LABEL_8:
      v7 = 0;
      goto LABEL_9;
    }
    if (self->_isChainResultSet)
    {
      if (!*((_BYTE *)v4 + 52))
        goto LABEL_8;
    }
    else if (*((_BYTE *)v4 + 52))
    {
      goto LABEL_8;
    }
    v7 = 1;
  }
LABEL_9:

  return v7;
}

- (unint64_t)hash
{
  unint64_t v3;
  NSUInteger v4;
  uint64_t v5;

  -[GEOPDPopularNearbySearchResult readAll:]((uint64_t)self, 1);
  v3 = -[GEOMapRegion hash](self->_displayMapRegion, "hash");
  v4 = -[NSString hash](self->_sectionHeader, "hash");
  if ((*(_BYTE *)&self->_flags & 1) != 0)
    v5 = 2654435761 * self->_isChainResultSet;
  else
    v5 = 0;
  return v4 ^ v3 ^ v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sectionHeader, 0);
  objc_storeStrong((id *)&self->_displayMapRegion, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
