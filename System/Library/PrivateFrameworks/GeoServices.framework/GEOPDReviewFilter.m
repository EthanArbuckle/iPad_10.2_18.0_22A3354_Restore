@implementation GEOPDReviewFilter

- (void)dealloc
{
  objc_super v3;

  if (self)
  {
    self->_photoSizeFiltersSpace = 0;
    self->_photoSizeFiltersCount = 0;
    free(self->_photoSizeFilters);
    self->_photoSizeFilters = 0;
  }
  v3.receiver = self;
  v3.super_class = (Class)GEOPDReviewFilter;
  -[GEOPDReviewFilter dealloc](&v3, sel_dealloc);
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;

  v3 = PBHashBytes();
  if ((*(_BYTE *)&self->_flags & 1) != 0)
    v4 = 2654435761 * self->_suppressSyntheticReviews;
  else
    v4 = 0;
  return v4 ^ v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unknownFields, 0);
}

- (uint64_t)addPhotoSizeFilter:(int)a3
{
  uint64_t v5;
  uint64_t v6;

  if (result)
  {
    v5 = result;
    result = -[GEOPDReviewFilter _reservePhotoSizeFilters:](result, 1uLL);
    if ((_DWORD)result)
    {
      v6 = *(_QWORD *)(v5 + 16) + 12 * *(_QWORD *)(v5 + 24);
      *(_QWORD *)v6 = a2;
      *(_DWORD *)(v6 + 8) = a3;
      ++*(_QWORD *)(v5 + 24);
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
    v4 = *(_QWORD *)(a1 + 24);
    v5 = v4 + a2;
    if (v4 + a2 <= v4)
      return 0;
    v6 = *(_QWORD *)(a1 + 32);
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
    result = (uint64_t)malloc_type_realloc(*(void **)(a1 + 16), 12 * v9, 0x2DD92C00uLL);
    if (result)
    {
      *(_QWORD *)(a1 + 32) = v9;
      *(_QWORD *)(a1 + 16) = result;
      bzero((void *)(result + 12 * *(_QWORD *)(a1 + 24)), 12 * (v9 - *(_QWORD *)(a1 + 24)));
      return 1;
    }
  }
  return result;
}

- (void)writeTo:(id)a3
{
  id v4;
  uint64_t v5;
  unint64_t v6;

  v4 = a3;
  if (self->_photoSizeFiltersCount)
  {
    v5 = 0;
    v6 = 0;
    do
    {
      PBDataWriterPlaceMark();
      GEOPDPhotoSizeFilterValueWriteTo((uint64_t)&self->_photoSizeFilters[v5]);
      PBDataWriterRecallMark();
      ++v6;
      ++v5;
    }
    while (v6 < self->_photoSizeFiltersCount);
  }
  if ((*(_BYTE *)&self->_flags & 1) != 0)
    PBDataWriterWriteBOOLField();
  -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4);

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
  v8.super_class = (Class)GEOPDReviewFilter;
  -[GEOPDReviewFilter description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPDReviewFilter dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDReviewFilter _dictionaryRepresentation:]((uint64_t)self, 0);
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
  const __CFString *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  _QWORD v19[4];
  id v20;

  if (!a1)
    return 0;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (*(_QWORD *)(a1 + 24))
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", *(_QWORD *)(a1 + 24));
    if (*(_QWORD *)(a1 + 24))
    {
      v6 = 0;
      v7 = 0;
      do
      {
        _GEOPDPhotoSizeFilterValueDictionaryRepresentation((unsigned int *)(*(_QWORD *)(a1 + 16) + v6));
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObject:", v8);

        ++v7;
        v6 += 12;
      }
      while (v7 < *(_QWORD *)(a1 + 24));
    }
    if (a2)
      v9 = CFSTR("photoSizeFilter");
    else
      v9 = CFSTR("photo_size_filter");
    objc_msgSend(v4, "setObject:forKey:", v5, v9);

  }
  if ((*(_BYTE *)(a1 + 44) & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 40));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v11 = CFSTR("suppressSyntheticReviews");
    else
      v11 = CFSTR("suppress_synthetic_reviews");
    objc_msgSend(v4, "setObject:forKey:", v10, v11);

  }
  v12 = *(void **)(a1 + 8);
  if (v12)
  {
    objc_msgSend(v12, "dictionaryRepresentation");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (a2)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v13, "count"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v19[0] = MEMORY[0x1E0C809B0];
      v19[1] = 3221225472;
      v19[2] = __47__GEOPDReviewFilter__dictionaryRepresentation___block_invoke;
      v19[3] = &unk_1E1C00600;
      v16 = v15;
      v20 = v16;
      objc_msgSend(v14, "enumerateKeysAndObjectsUsingBlock:", v19);
      v17 = v16;

      v14 = v17;
    }
    objc_msgSend(v4, "setObject:forKey:", v14, CFSTR("Unknown Fields"));

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOPDReviewFilter _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __47__GEOPDReviewFilter__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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
  return GEOPDReviewFilterReadAllFrom((uint64_t)self, a3);
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4;
  uint64_t v5;
  unint64_t photoSizeFiltersCount;

  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5 = v4;
  photoSizeFiltersCount = self->_photoSizeFiltersCount;
  if (photoSizeFiltersCount)
  {
    -[GEOPDReviewFilter _reservePhotoSizeFilters:](v4, photoSizeFiltersCount);
    memcpy(*(void **)(v5 + 16), self->_photoSizeFilters, 12 * self->_photoSizeFiltersCount);
    *(_QWORD *)(v5 + 24) = self->_photoSizeFiltersCount;
  }
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    *(_BYTE *)(v5 + 40) = self->_suppressSyntheticReviews;
    *(_BYTE *)(v5 + 44) |= 1u;
  }
  objc_storeStrong((id *)(v5 + 8), self->_unknownFields);
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  unint64_t photoSizeFiltersCount;
  BOOL v6;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
  {
    photoSizeFiltersCount = self->_photoSizeFiltersCount;
    if (photoSizeFiltersCount == *((_QWORD *)v4 + 3)
      && !memcmp(self->_photoSizeFilters, *((const void **)v4 + 2), 12 * photoSizeFiltersCount))
    {
      v6 = (*((_BYTE *)v4 + 44) & 1) == 0;
      if ((*(_BYTE *)&self->_flags & 1) == 0)
        goto LABEL_5;
      if ((*((_BYTE *)v4 + 44) & 1) != 0)
      {
        if (self->_suppressSyntheticReviews)
        {
          if (!*((_BYTE *)v4 + 40))
            goto LABEL_4;
LABEL_12:
          v6 = 1;
          goto LABEL_5;
        }
        if (!*((_BYTE *)v4 + 40))
          goto LABEL_12;
      }
    }
  }
LABEL_4:
  v6 = 0;
LABEL_5:

  return v6;
}

@end
