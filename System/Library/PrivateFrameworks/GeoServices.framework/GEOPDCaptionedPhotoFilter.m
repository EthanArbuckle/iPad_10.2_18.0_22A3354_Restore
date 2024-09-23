@implementation GEOPDCaptionedPhotoFilter

- (void)dealloc
{
  objc_super v3;

  if (self)
  {
    os_unfair_lock_lock_with_options();
    *(_BYTE *)&self->_flags |= 2u;
    os_unfair_lock_unlock(&self->_readerLock);
    *(_BYTE *)&self->_flags |= 8u;
    self->_photoSizeFiltersSpace = 0;
    self->_photoSizeFiltersCount = 0;
    free(self->_photoSizeFilters);
    self->_photoSizeFilters = 0;
  }
  v3.receiver = self;
  v3.super_class = (Class)GEOPDCaptionedPhotoFilter;
  -[GEOPDCaptionedPhotoFilter dealloc](&v3, sel_dealloc);
}

- (void)writeTo:(id)a3
{
  id v4;
  os_unfair_lock_s *p_readerLock;
  uint64_t v6;
  unint64_t v7;
  PBDataReader *v8;
  void *v9;

  v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), (*(_BYTE *)&self->_flags & 0xE) == 0))
  {
    v8 = self->_reader;
    objc_sync_enter(v8);
    *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
    -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
    -[PBDataReader readBytes:](self->_reader, "readBytes:", self->_readerMarkLength - self->_readerMarkPos);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "writeData:", v9);
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v8);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOPDCaptionedPhotoFilter readAll:]((uint64_t)self, 0);
    if (self->_photoSizeFiltersCount)
    {
      v6 = 0;
      v7 = 0;
      do
      {
        PBDataWriterPlaceMark();
        GEOPDPhotoSizeFilterValueWriteTo((uint64_t)&self->_photoSizeFilters[v6]);
        PBDataWriterRecallMark();
        ++v7;
        ++v6;
      }
      while (v7 < self->_photoSizeFiltersCount);
    }
    if (self->_vendorId)
      PBDataWriterWriteStringField();
    -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4);
  }

}

- (unint64_t)hash
{
  uint64_t v3;

  -[GEOPDCaptionedPhotoFilter readAll:]((uint64_t)self, 1);
  v3 = PBHashBytes();
  return -[NSString hash](self->_vendorId, "hash") ^ v3;
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
        v6 = (int *)&readAll__recursiveTag_950;
      else
        v6 = (int *)&readAll__nonRecursiveTag_951;
      GEOPDCaptionedPhotoFilterReadSpecified(a1, *(_QWORD *)(a1 + 8), v6);
      objc_sync_exit(v5);

    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_vendorId, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

- (void)addPhotoSizeFilter:(int)a3
{
  if (a1)
  {
    -[GEOPDCaptionedPhotoFilter _readPhotoSizeFilters](a1);
    -[GEOPDCaptionedPhotoFilter _addNoFlagsPhotoSizeFilter:](a1, a2, a3);
    os_unfair_lock_lock_with_options();
    *(_BYTE *)(a1 + 68) |= 2u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
    *(_BYTE *)(a1 + 68) |= 8u;
  }
}

- (void)_readPhotoSizeFilters
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
        GEOPDCaptionedPhotoFilterReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readPhotoSizeFilters_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (uint64_t)_addNoFlagsPhotoSizeFilter:(int)a3
{
  uint64_t v5;
  uint64_t v6;

  if (result)
  {
    v5 = result;
    result = -[GEOPDCaptionedPhotoFilter _reservePhotoSizeFilters:](result, 1uLL);
    if ((_DWORD)result)
    {
      v6 = *(_QWORD *)(v5 + 24) + 12 * *(_QWORD *)(v5 + 32);
      *(_QWORD *)v6 = a2;
      *(_DWORD *)(v6 + 8) = a3;
      ++*(_QWORD *)(v5 + 32);
    }
  }
  return result;
}

- (uint64_t)_reservePhotoSizeFilters:(uint64_t)a1
{
  uint64_t result;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;

  result = 0;
  if (a1 && a2)
  {
    v4 = *(_QWORD *)(a1 + 32);
    v5 = v4 + a2;
    if (v4 + a2 <= v4)
      return 0;
    v6 = *(_QWORD *)(a1 + 40);
    if (v6 >= v5)
      return 1;
    v7 = v6 + a2;
    if (v6 + a2)
    {
      v8 = 1;
      while (1)
      {
        v9 = v8;
        if (v8 >= v7)
          break;
        v8 *= 2;
        if ((v9 & 0x8000000000000000) != 0)
        {
          v9 = -1;
          goto LABEL_12;
        }
      }
    }
    else
    {
      v9 = 0;
    }
    if (v9 < a2)
      return 0;
LABEL_12:
    if (12 * v9 < v9)
      return 0;
    result = (uint64_t)malloc_type_realloc(*(void **)(a1 + 24), 12 * v9, 0x25AA3467uLL);
    if (result)
    {
      *(_QWORD *)(a1 + 40) = v9;
      *(_QWORD *)(a1 + 24) = result;
      bzero((void *)(result + 12 * *(_QWORD *)(a1 + 32)), 12 * (v9 - *(_QWORD *)(a1 + 32)));
      return 1;
    }
  }
  return result;
}

- (GEOPDCaptionedPhotoFilter)init
{
  GEOPDCaptionedPhotoFilter *v2;
  GEOPDCaptionedPhotoFilter *v3;
  GEOPDCaptionedPhotoFilter *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOPDCaptionedPhotoFilter;
  v2 = -[GEOPDCaptionedPhotoFilter init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPDCaptionedPhotoFilter)initWithData:(id)a3
{
  GEOPDCaptionedPhotoFilter *v3;
  GEOPDCaptionedPhotoFilter *v4;
  GEOPDCaptionedPhotoFilter *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOPDCaptionedPhotoFilter;
  v3 = -[GEOPDCaptionedPhotoFilter initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)setVendorId:(uint64_t)a1
{
  id v4;

  v4 = a2;
  if (a1)
  {
    *(_BYTE *)(a1 + 68) |= 4u;
    *(_BYTE *)(a1 + 68) |= 8u;
    objc_storeStrong((id *)(a1 + 48), a2);
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
  v8.super_class = (Class)GEOPDCaptionedPhotoFilter;
  -[GEOPDCaptionedPhotoFilter description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPDCaptionedPhotoFilter dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDCaptionedPhotoFilter _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  void *v5;
  uint64_t v6;
  unint64_t v7;
  void *v8;
  const __CFString *v9;
  void *v10;
  id v11;
  id v12;
  const __CFString *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  _QWORD v21[4];
  id v22;

  if (!a1)
    return 0;
  -[GEOPDCaptionedPhotoFilter readAll:](a1, 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (*(_QWORD *)(a1 + 32))
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", *(_QWORD *)(a1 + 32));
    if (*(_QWORD *)(a1 + 32))
    {
      v6 = 0;
      v7 = 0;
      do
      {
        _GEOPDPhotoSizeFilterValueDictionaryRepresentation((unsigned int *)(*(_QWORD *)(a1 + 24) + v6));
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObject:", v8);

        ++v7;
        v6 += 12;
      }
      while (v7 < *(_QWORD *)(a1 + 32));
    }
    if (a2)
      v9 = CFSTR("photoSizeFilter");
    else
      v9 = CFSTR("photo_size_filter");
    objc_msgSend(v4, "setObject:forKey:", v5, v9);

  }
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
  if ((*(_BYTE *)(a1 + 68) & 4) == 0)
  {
    v10 = *(void **)(a1 + 8);
    if (v10)
    {
      v11 = v10;
      objc_sync_enter(v11);
      GEOPDCaptionedPhotoFilterReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readVendorId_tags_949);
      objc_sync_exit(v11);

    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  v12 = *(id *)(a1 + 48);
  if (v12)
  {
    if (a2)
      v13 = CFSTR("vendorId");
    else
      v13 = CFSTR("vendor_id");
    objc_msgSend(v4, "setObject:forKey:", v12, v13);
  }

  v14 = *(void **)(a1 + 16);
  if (v14)
  {
    objc_msgSend(v14, "dictionaryRepresentation");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v15;
    if (a2)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v15, "count"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v21[0] = MEMORY[0x1E0C809B0];
      v21[1] = 3221225472;
      v21[2] = __55__GEOPDCaptionedPhotoFilter__dictionaryRepresentation___block_invoke;
      v21[3] = &unk_1E1C00600;
      v18 = v17;
      v22 = v18;
      objc_msgSend(v16, "enumerateKeysAndObjectsUsingBlock:", v21);
      v19 = v18;

      v16 = v19;
    }
    objc_msgSend(v4, "setObject:forKey:", v16, CFSTR("Unknown Fields"));

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOPDCaptionedPhotoFilter _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __55__GEOPDCaptionedPhotoFilter__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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
  return GEOPDCaptionedPhotoFilterReadAllFrom((uint64_t)self, a3, 0);
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  PBDataReader *reader;
  PBDataReader *v7;
  unint64_t photoSizeFiltersCount;
  uint64_t v9;
  void *v10;

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
      GEOPDCaptionedPhotoFilterReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      objc_sync_exit(v7);

      return (id)v5;
    }
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPDCaptionedPhotoFilter readAll:]((uint64_t)self, 0);
  photoSizeFiltersCount = self->_photoSizeFiltersCount;
  if (photoSizeFiltersCount)
  {
    -[GEOPDCaptionedPhotoFilter _reservePhotoSizeFilters:](v5, photoSizeFiltersCount);
    memcpy(*(void **)(v5 + 24), self->_photoSizeFilters, 12 * self->_photoSizeFiltersCount);
    *(_QWORD *)(v5 + 32) = self->_photoSizeFiltersCount;
  }
  v9 = -[NSString copyWithZone:](self->_vendorId, "copyWithZone:", a3);
  v10 = *(void **)(v5 + 48);
  *(_QWORD *)(v5 + 48) = v9;

  objc_storeStrong((id *)(v5 + 16), self->_unknownFields);
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  unint64_t photoSizeFiltersCount;
  char v6;
  NSString *vendorId;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && (-[GEOPDCaptionedPhotoFilter readAll:]((uint64_t)self, 1),
        -[GEOPDCaptionedPhotoFilter readAll:]((uint64_t)v4, 1),
        photoSizeFiltersCount = self->_photoSizeFiltersCount,
        photoSizeFiltersCount == *((_QWORD *)v4 + 4))
    && !memcmp(self->_photoSizeFilters, *((const void **)v4 + 3), 12 * photoSizeFiltersCount))
  {
    vendorId = self->_vendorId;
    if ((unint64_t)vendorId | *((_QWORD *)v4 + 6))
      v6 = -[NSString isEqual:](vendorId, "isEqual:");
    else
      v6 = 1;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

@end
