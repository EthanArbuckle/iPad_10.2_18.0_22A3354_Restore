@implementation GEOPDPopularNearbyResult

- (GEOPDPopularNearbyResult)init
{
  GEOPDPopularNearbyResult *v2;
  GEOPDPopularNearbyResult *v3;
  GEOPDPopularNearbyResult *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOPDPopularNearbyResult;
  v2 = -[GEOPDPopularNearbyResult init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPDPopularNearbyResult)initWithData:(id)a3
{
  GEOPDPopularNearbyResult *v3;
  GEOPDPopularNearbyResult *v4;
  GEOPDPopularNearbyResult *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOPDPopularNearbyResult;
  v3 = -[GEOPDPopularNearbyResult initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)dealloc
{
  objc_super v3;

  if (self)
  {
    os_unfair_lock_lock_with_options();
    *(_BYTE *)&self->_flags |= 2u;
    os_unfair_lock_unlock(&self->_readerLock);
    *(_BYTE *)&self->_flags |= 8u;
    self->_litePlaceResultsSpace = 0;
    self->_litePlaceResultsCount = 0;
    free(self->_litePlaceResults);
    self->_litePlaceResults = 0;
  }
  v3.receiver = self;
  v3.super_class = (Class)GEOPDPopularNearbyResult;
  -[GEOPDPopularNearbyResult dealloc](&v3, sel_dealloc);
}

- (void)_readSectionHeader
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(_BYTE *)(a1 + 68) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDPopularNearbyResultReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readSectionHeader_tags_4732);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (id)sectionHeader
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    -[GEOPDPopularNearbyResult _readSectionHeader]((uint64_t)a1);
    a1 = (id *)v1[6];
  }
  return a1;
}

- (void)_readLitePlaceResults
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(_BYTE *)(a1 + 68) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDPopularNearbyResultReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readLitePlaceResults_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (uint64_t)_reserveLitePlaceResults:(uint64_t)result
{
  _QWORD *v2;
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;

  if (result)
  {
    v2 = (_QWORD *)result;
    v3 = *(_QWORD *)(result + 32);
    v4 = v3 + a2;
    if (v3 + a2 <= v3)
      return 0;
    v5 = *(_QWORD *)(result + 40);
    if (v5 >= v4)
      return 1;
    v6 = v5 + a2;
    if (v5 + a2)
    {
      v7 = 1;
      while (1)
      {
        v8 = v7;
        if (v7 >= v6)
          break;
        v7 *= 2;
        if ((v8 & 0x8000000000000000) != 0)
        {
          v8 = -1;
          goto LABEL_11;
        }
      }
    }
    else
    {
      v8 = 0;
    }
    if (v8 < a2)
      return 0;
LABEL_11:
    if (16 * v8 < v8)
      return 0;
    result = (uint64_t)malloc_type_realloc(*(void **)(result + 24), 16 * v8, 0x109E87CCuLL);
    if (result)
    {
      v2[5] = v8;
      v2[3] = result;
      bzero((void *)(result + 16 * v2[4]), 16 * (v8 - v2[4]));
      return 1;
    }
  }
  return result;
}

- (uint64_t)litePlaceResultAtIndex:(uint64_t)result
{
  uint64_t v3;
  unint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;

  if (result)
  {
    v3 = result;
    -[GEOPDPopularNearbyResult _readLitePlaceResults](result);
    v4 = *(_QWORD *)(v3 + 32);
    if (v4 <= a2)
    {
      v5 = (void *)MEMORY[0x1E0C99DA0];
      v6 = *MEMORY[0x1E0C99858];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("idx (%tu) is out of range (%tu)"), a2, v4);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "exceptionWithName:reason:userInfo:", v6, v7, 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "raise");

    }
    return *(_QWORD *)(*(_QWORD *)(v3 + 24) + 16 * a2);
  }
  return result;
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
  v8.super_class = (Class)GEOPDPopularNearbyResult;
  -[GEOPDPopularNearbyResult description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPDPopularNearbyResult dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDPopularNearbyResult _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  void *v5;
  const __CFString *v6;
  void *v7;
  uint64_t v8;
  unint64_t v9;
  const __CFString *v10;
  uint64_t v11;
  void *v12;
  char v13;
  void *v14;
  void *v15;
  const __CFString *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  void *v24;
  int v25;
  const __CFString *v26;
  _QWORD v27[4];
  id v28;

  if (!a1)
    return 0;
  -[GEOPDPopularNearbyResult readAll:](a1, 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPDPopularNearbyResult sectionHeader]((id *)a1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    if (a2)
      v6 = CFSTR("sectionHeader");
    else
      v6 = CFSTR("section_header");
    objc_msgSend(v4, "setObject:forKey:", v5, v6);
  }

  if (*(_QWORD *)(a1 + 32))
  {
    v25 = a2;
    v24 = v4;
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", *(_QWORD *)(a1 + 32));
    if (*(_QWORD *)(a1 + 32))
    {
      v8 = 0;
      v9 = 0;
      v10 = CFSTR("result_provider_id");
      if (v25)
        v10 = CFSTR("resultProviderId");
      v26 = v10;
      do
      {
        v11 = *(_QWORD *)(a1 + 24);
        objc_msgSend(MEMORY[0x1E0C99E08], "dictionary", v24);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = *(_BYTE *)(v11 + v8 + 12);
        if ((v13 & 1) != 0)
        {
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *(_QWORD *)(v11 + v8));
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "setObject:forKey:", v14, CFSTR("muid"));

          v13 = *(_BYTE *)(v11 + v8 + 12);
        }
        if ((v13 & 2) != 0)
        {
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(v11 + v8 + 8));
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "setObject:forKey:", v15, v26);

        }
        objc_msgSend(v7, "addObject:", v12);

        ++v9;
        v8 += 16;
      }
      while (v9 < *(_QWORD *)(a1 + 32));
    }
    a2 = v25;
    if (v25)
      v16 = CFSTR("litePlaceResult");
    else
      v16 = CFSTR("lite_place_result");
    v4 = v24;
    objc_msgSend(v24, "setObject:forKey:", v7, v16, v24);

  }
  v17 = *(void **)(a1 + 16);
  if (v17)
  {
    objc_msgSend(v17, "dictionaryRepresentation");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v18;
    if (a2)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v18, "count"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v27[0] = MEMORY[0x1E0C809B0];
      v27[1] = 3221225472;
      v27[2] = __54__GEOPDPopularNearbyResult__dictionaryRepresentation___block_invoke;
      v27[3] = &unk_1E1C00600;
      v21 = v20;
      v28 = v21;
      objc_msgSend(v19, "enumerateKeysAndObjectsUsingBlock:", v27);
      v22 = v21;

      v19 = v22;
    }
    objc_msgSend(v4, "setObject:forKey:", v19, CFSTR("Unknown Fields"));

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOPDPopularNearbyResult _dictionaryRepresentation:]((uint64_t)self, 1);
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
        v6 = (int *)&readAll__recursiveTag_4737;
      else
        v6 = (int *)&readAll__nonRecursiveTag_4738;
      GEOPDPopularNearbyResultReadSpecified(a1, *(_QWORD *)(a1 + 8), v6);
      objc_sync_exit(v5);

    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

void __54__GEOPDPopularNearbyResult__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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
  return GEOPDPopularNearbyResultReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v4;
  os_unfair_lock_s *p_readerLock;
  uint64_t v6;
  unint64_t v7;
  GEOPDLitePlaceResult *litePlaceResults;
  char var2;
  PBDataReader *v10;
  void *v11;

  v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), (*(_BYTE *)&self->_flags & 0xE) == 0))
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
    -[GEOPDPopularNearbyResult readAll:]((uint64_t)self, 0);
    if (self->_sectionHeader)
      PBDataWriterWriteStringField();
    if (self->_litePlaceResultsCount)
    {
      v6 = 0;
      v7 = 0;
      do
      {
        PBDataWriterPlaceMark();
        litePlaceResults = self->_litePlaceResults;
        var2 = (char)litePlaceResults[v6].var2;
        if ((var2 & 1) != 0)
        {
          PBDataWriterWriteUint64Field();
          var2 = (char)litePlaceResults[v6].var2;
        }
        if ((var2 & 2) != 0)
          PBDataWriterWriteInt32Field();
        PBDataWriterRecallMark();
        ++v7;
        ++v6;
      }
      while (v7 < self->_litePlaceResultsCount);
    }
    -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4);
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  PBDataReader *reader;
  PBDataReader *v7;
  uint64_t v8;
  void *v9;
  unint64_t litePlaceResultsCount;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    v7 = reader;
    objc_sync_enter(v7);
    if ((*(_BYTE *)&self->_flags & 8) == 0)
    {
      *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
      -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
      GEOPDPopularNearbyResultReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      objc_sync_exit(v7);

      return (id)v5;
    }
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPDPopularNearbyResult readAll:]((uint64_t)self, 0);
  v8 = -[NSString copyWithZone:](self->_sectionHeader, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 48);
  *(_QWORD *)(v5 + 48) = v8;

  litePlaceResultsCount = self->_litePlaceResultsCount;
  if (litePlaceResultsCount)
  {
    -[GEOPDPopularNearbyResult _reserveLitePlaceResults:](v5, litePlaceResultsCount);
    memcpy(*(void **)(v5 + 24), self->_litePlaceResults, 16 * self->_litePlaceResultsCount);
    *(_QWORD *)(v5 + 32) = self->_litePlaceResultsCount;
  }
  objc_storeStrong((id *)(v5 + 16), self->_unknownFields);
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  const void **v4;
  NSString *sectionHeader;
  unint64_t litePlaceResultsCount;
  BOOL v7;

  v4 = (const void **)a3;
  v7 = objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((-[GEOPDPopularNearbyResult readAll:]((uint64_t)self, 1),
         -[GEOPDPopularNearbyResult readAll:]((uint64_t)v4, 1),
         sectionHeader = self->_sectionHeader,
         !((unint64_t)sectionHeader | (unint64_t)v4[6]))
     || -[NSString isEqual:](sectionHeader, "isEqual:"))
    && (litePlaceResultsCount = self->_litePlaceResultsCount, (const void *)litePlaceResultsCount == v4[4])
    && memcmp(self->_litePlaceResults, v4[3], 16 * litePlaceResultsCount) == 0;

  return v7;
}

- (unint64_t)hash
{
  NSUInteger v3;

  -[GEOPDPopularNearbyResult readAll:]((uint64_t)self, 1);
  v3 = -[NSString hash](self->_sectionHeader, "hash");
  return PBHashBytes() ^ v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sectionHeader, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
