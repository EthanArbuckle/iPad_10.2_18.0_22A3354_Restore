@implementation GEOPDCategorizedPhotosFilter

- (void)dealloc
{
  objc_super v3;

  if (self)
  {
    os_unfair_lock_lock_with_options();
    *(_BYTE *)&self->_flags |= 0x20u;
    os_unfair_lock_unlock(&self->_readerLock);
    *(_BYTE *)&self->_flags |= 0x80u;
    self->_photoSizeFiltersSpace = 0;
    self->_photoSizeFiltersCount = 0;
    free(self->_photoSizeFilters);
    self->_photoSizeFilters = 0;
  }
  v3.receiver = self;
  v3.super_class = (Class)GEOPDCategorizedPhotosFilter;
  -[GEOPDCategorizedPhotosFilter dealloc](&v3, sel_dealloc);
}

- (unint64_t)hash
{
  uint64_t v3;
  NSUInteger v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  -[GEOPDCategorizedPhotosFilter readAll:]((uint64_t)self, 1);
  v3 = PBHashBytes();
  v4 = -[NSString hash](self->_categoryId, "hash");
  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    v5 = 2654435761 * self->_startIndex;
    if ((*(_BYTE *)&self->_flags & 1) != 0)
    {
LABEL_3:
      v6 = 2654435761 * self->_count;
      if ((*(_BYTE *)&self->_flags & 8) != 0)
        goto LABEL_4;
LABEL_8:
      v7 = 0;
      if ((*(_BYTE *)&self->_flags & 4) != 0)
        goto LABEL_5;
LABEL_9:
      v8 = 0;
      return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8;
    }
  }
  else
  {
    v5 = 0;
    if ((*(_BYTE *)&self->_flags & 1) != 0)
      goto LABEL_3;
  }
  v6 = 0;
  if ((*(_BYTE *)&self->_flags & 8) == 0)
    goto LABEL_8;
LABEL_4:
  v7 = 2654435761 * self->_includeCoverPhoto;
  if ((*(_BYTE *)&self->_flags & 4) == 0)
    goto LABEL_9;
LABEL_5:
  v8 = 2654435761 * self->_coverPhotoFirst;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8;
}

- (GEOPDCategorizedPhotosFilter)init
{
  GEOPDCategorizedPhotosFilter *v2;
  GEOPDCategorizedPhotosFilter *v3;
  GEOPDCategorizedPhotosFilter *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOPDCategorizedPhotosFilter;
  v2 = -[GEOPDCategorizedPhotosFilter init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_categoryId, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
  objc_storeStrong((id *)&self->_reader, 0);
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
        v6 = (int *)&readAll__recursiveTag_996;
      else
        v6 = (int *)&readAll__nonRecursiveTag_997;
      GEOPDCategorizedPhotosFilterReadSpecified(a1, *(_QWORD *)(a1 + 8), v6);
      objc_sync_exit(v5);

    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (void)writeTo:(id)a3
{
  id v4;
  os_unfair_lock_s *p_readerLock;
  uint64_t v6;
  unint64_t v7;
  char flags;
  PBDataReader *v9;
  void *v10;

  v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader)
  {
    os_unfair_lock_assert_owner(&self->_readerLock);
    if (*(_BYTE *)&self->_flags <= 0x1Fu)
    {
      v9 = self->_reader;
      objc_sync_enter(v9);
      *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
      -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
      -[PBDataReader readBytes:](self->_reader, "readBytes:", self->_readerMarkLength - self->_readerMarkPos);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "writeData:", v10);
      os_unfair_lock_unlock(p_readerLock);

      objc_sync_exit(v9);
      goto LABEL_19;
    }
  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPDCategorizedPhotosFilter readAll:]((uint64_t)self, 0);
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
  if (self->_categoryId)
    PBDataWriterWriteStringField();
  flags = (char)self->_flags;
  if ((flags & 2) != 0)
  {
    PBDataWriterWriteInt32Field();
    flags = (char)self->_flags;
    if ((flags & 1) == 0)
    {
LABEL_10:
      if ((flags & 8) == 0)
        goto LABEL_11;
LABEL_16:
      PBDataWriterWriteBOOLField();
      if ((*(_BYTE *)&self->_flags & 4) == 0)
        goto LABEL_13;
      goto LABEL_12;
    }
  }
  else if ((*(_BYTE *)&self->_flags & 1) == 0)
  {
    goto LABEL_10;
  }
  PBDataWriterWriteInt32Field();
  flags = (char)self->_flags;
  if ((flags & 8) != 0)
    goto LABEL_16;
LABEL_11:
  if ((flags & 4) != 0)
LABEL_12:
    PBDataWriterWriteBOOLField();
LABEL_13:
  -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4);
LABEL_19:

}

- (GEOPDCategorizedPhotosFilter)initWithData:(id)a3
{
  GEOPDCategorizedPhotosFilter *v3;
  GEOPDCategorizedPhotosFilter *v4;
  GEOPDCategorizedPhotosFilter *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOPDCategorizedPhotosFilter;
  v3 = -[GEOPDCategorizedPhotosFilter initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (uint64_t)_reservePhotoSizeFilters:(uint64_t)result
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
    if (12 * v8 < v8)
      return 0;
    result = (uint64_t)malloc_type_realloc(*(void **)(result + 24), 12 * v8, 0x3E8DE316uLL);
    if (result)
    {
      v2[5] = v8;
      v2[3] = result;
      bzero((void *)(result + 12 * v2[4]), 12 * (v8 - v2[4]));
      return 1;
    }
  }
  return result;
}

- (void)setCategoryId:(uint64_t)a1
{
  id v4;

  v4 = a2;
  if (a1)
  {
    *(_BYTE *)(a1 + 80) |= 0x40u;
    *(_BYTE *)(a1 + 80) |= 0x80u;
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
  v8.super_class = (Class)GEOPDCategorizedPhotosFilter;
  -[GEOPDCategorizedPhotosFilter description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPDCategorizedPhotosFilter dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDCategorizedPhotosFilter _dictionaryRepresentation:]((uint64_t)self, 0);
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
  char v14;
  void *v15;
  const __CFString *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  void *v24;
  const __CFString *v25;
  void *v26;
  void *v27;
  const __CFString *v28;
  _QWORD v29[4];
  id v30;

  if (!a1)
    return 0;
  -[GEOPDCategorizedPhotosFilter readAll:](a1, 1);
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
  if ((*(_BYTE *)(a1 + 80) & 0x40) == 0)
  {
    v10 = *(void **)(a1 + 8);
    if (v10)
    {
      v11 = v10;
      objc_sync_enter(v11);
      GEOPDCategorizedPhotosFilterReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readCategoryId_tags_981);
      objc_sync_exit(v11);

    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  v12 = *(id *)(a1 + 48);
  if (v12)
  {
    if (a2)
      v13 = CFSTR("categoryId");
    else
      v13 = CFSTR("category_id");
    objc_msgSend(v4, "setObject:forKey:", v12, v13);
  }

  v14 = *(_BYTE *)(a1 + 80);
  if ((v14 & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(a1 + 72));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v25 = CFSTR("startIndex");
    else
      v25 = CFSTR("start_index");
    objc_msgSend(v4, "setObject:forKey:", v24, v25);

    v14 = *(_BYTE *)(a1 + 80);
    if ((v14 & 1) == 0)
    {
LABEL_20:
      if ((v14 & 8) == 0)
        goto LABEL_21;
LABEL_37:
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 77));
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      if (a2)
        v28 = CFSTR("includeCoverPhoto");
      else
        v28 = CFSTR("include_cover_photo");
      objc_msgSend(v4, "setObject:forKey:", v27, v28);

      if ((*(_BYTE *)(a1 + 80) & 4) == 0)
        goto LABEL_26;
      goto LABEL_22;
    }
  }
  else if ((*(_BYTE *)(a1 + 80) & 1) == 0)
  {
    goto LABEL_20;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(a1 + 68));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v26, CFSTR("count"));

  v14 = *(_BYTE *)(a1 + 80);
  if ((v14 & 8) != 0)
    goto LABEL_37;
LABEL_21:
  if ((v14 & 4) != 0)
  {
LABEL_22:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 76));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v16 = CFSTR("coverPhotoFirst");
    else
      v16 = CFSTR("cover_photo_first");
    objc_msgSend(v4, "setObject:forKey:", v15, v16);

  }
LABEL_26:
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
      v29[0] = MEMORY[0x1E0C809B0];
      v29[1] = 3221225472;
      v29[2] = __58__GEOPDCategorizedPhotosFilter__dictionaryRepresentation___block_invoke;
      v29[3] = &unk_1E1C00600;
      v21 = v20;
      v30 = v21;
      objc_msgSend(v19, "enumerateKeysAndObjectsUsingBlock:", v29);
      v22 = v21;

      v19 = v22;
    }
    objc_msgSend(v4, "setObject:forKey:", v19, CFSTR("Unknown Fields"));

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOPDCategorizedPhotosFilter _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __58__GEOPDCategorizedPhotosFilter__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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
  return GEOPDCategorizedPhotosFilterReadAllFrom((uint64_t)self, a3, 0);
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  PBDataReader *reader;
  PBDataReader *v7;
  id v8;
  unint64_t photoSizeFiltersCount;
  uint64_t v10;
  void *v11;
  char flags;
  PBUnknownFields *v13;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (!reader)
  {
LABEL_5:
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOPDCategorizedPhotosFilter readAll:]((uint64_t)self, 0);
    photoSizeFiltersCount = self->_photoSizeFiltersCount;
    if (photoSizeFiltersCount)
    {
      -[GEOPDCategorizedPhotosFilter _reservePhotoSizeFilters:](v5, photoSizeFiltersCount);
      memcpy(*(void **)(v5 + 24), self->_photoSizeFilters, 12 * self->_photoSizeFiltersCount);
      *(_QWORD *)(v5 + 32) = self->_photoSizeFiltersCount;
    }
    v10 = -[NSString copyWithZone:](self->_categoryId, "copyWithZone:", a3);
    v11 = *(void **)(v5 + 48);
    *(_QWORD *)(v5 + 48) = v10;

    flags = (char)self->_flags;
    if ((flags & 2) != 0)
    {
      *(_DWORD *)(v5 + 72) = self->_startIndex;
      *(_BYTE *)(v5 + 80) |= 2u;
      flags = (char)self->_flags;
      if ((flags & 1) == 0)
      {
LABEL_9:
        if ((flags & 8) == 0)
          goto LABEL_10;
        goto LABEL_16;
      }
    }
    else if ((*(_BYTE *)&self->_flags & 1) == 0)
    {
      goto LABEL_9;
    }
    *(_DWORD *)(v5 + 68) = self->_count;
    *(_BYTE *)(v5 + 80) |= 1u;
    flags = (char)self->_flags;
    if ((flags & 8) == 0)
    {
LABEL_10:
      if ((flags & 4) == 0)
      {
LABEL_12:
        v13 = self->_unknownFields;
        v8 = *(id *)(v5 + 16);
        *(_QWORD *)(v5 + 16) = v13;
        goto LABEL_13;
      }
LABEL_11:
      *(_BYTE *)(v5 + 76) = self->_coverPhotoFirst;
      *(_BYTE *)(v5 + 80) |= 4u;
      goto LABEL_12;
    }
LABEL_16:
    *(_BYTE *)(v5 + 77) = self->_includeCoverPhoto;
    *(_BYTE *)(v5 + 80) |= 8u;
    if ((*(_BYTE *)&self->_flags & 4) == 0)
      goto LABEL_12;
    goto LABEL_11;
  }
  v7 = reader;
  objc_sync_enter(v7);
  if ((*(_BYTE *)&self->_flags & 0x80000000) != 0)
  {
    objc_sync_exit(v7);

    goto LABEL_5;
  }
  *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
  -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
  GEOPDCategorizedPhotosFilterReadAllFrom(v5, self->_reader, 0);
  os_unfair_lock_unlock(&self->_readerLock);
  v8 = (id)v5;
  objc_sync_exit(v7);

LABEL_13:
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  const void **v4;
  unint64_t photoSizeFiltersCount;
  BOOL v6;
  NSString *categoryId;

  v4 = (const void **)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_4;
  -[GEOPDCategorizedPhotosFilter readAll:]((uint64_t)self, 1);
  -[GEOPDCategorizedPhotosFilter readAll:]((uint64_t)v4, 1);
  photoSizeFiltersCount = self->_photoSizeFiltersCount;
  if ((const void *)photoSizeFiltersCount != v4[4])
    goto LABEL_4;
  if (memcmp(self->_photoSizeFilters, v4[3], 12 * photoSizeFiltersCount))
    goto LABEL_4;
  categoryId = self->_categoryId;
  if ((unint64_t)categoryId | (unint64_t)v4[6])
  {
    if (!-[NSString isEqual:](categoryId, "isEqual:"))
      goto LABEL_4;
  }
  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    if (((_BYTE)v4[10] & 2) == 0 || self->_startIndex != *((_DWORD *)v4 + 18))
      goto LABEL_4;
  }
  else if (((_BYTE)v4[10] & 2) != 0)
  {
    goto LABEL_4;
  }
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    if (((_BYTE)v4[10] & 1) == 0 || self->_count != *((_DWORD *)v4 + 17))
      goto LABEL_4;
  }
  else if (((_BYTE)v4[10] & 1) != 0)
  {
    goto LABEL_4;
  }
  if ((*(_BYTE *)&self->_flags & 8) != 0)
  {
    if (((_BYTE)v4[10] & 8) == 0)
      goto LABEL_4;
    if (self->_includeCoverPhoto)
    {
      if (!*((_BYTE *)v4 + 77))
        goto LABEL_4;
    }
    else if (*((_BYTE *)v4 + 77))
    {
      goto LABEL_4;
    }
  }
  else if (((_BYTE)v4[10] & 8) != 0)
  {
    goto LABEL_4;
  }
  v6 = ((_BYTE)v4[10] & 4) == 0;
  if ((*(_BYTE *)&self->_flags & 4) == 0)
    goto LABEL_5;
  if (((_BYTE)v4[10] & 4) != 0)
  {
    if (self->_coverPhotoFirst)
    {
      if (!*((_BYTE *)v4 + 76))
        goto LABEL_4;
LABEL_32:
      v6 = 1;
      goto LABEL_5;
    }
    if (!*((_BYTE *)v4 + 76))
      goto LABEL_32;
  }
LABEL_4:
  v6 = 0;
LABEL_5:

  return v6;
}

@end
