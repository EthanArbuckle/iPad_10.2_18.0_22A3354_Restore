@implementation GEOPDPlaceCollectionFilter

- (unint64_t)hash
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    v2 = 2654435761 * self->_expectedResultCount;
    if ((*(_BYTE *)&self->_flags & 0x40) != 0)
    {
LABEL_3:
      v3 = 2654435761 * self->_partiallyClientize;
      if ((*(_BYTE *)&self->_flags & 0x10) != 0)
        goto LABEL_4;
      goto LABEL_11;
    }
  }
  else
  {
    v2 = 0;
    if ((*(_BYTE *)&self->_flags & 0x40) != 0)
      goto LABEL_3;
  }
  v3 = 0;
  if ((*(_BYTE *)&self->_flags & 0x10) != 0)
  {
LABEL_4:
    v4 = 2654435761 * self->_isCollectionView;
    if ((*(_BYTE *)&self->_flags & 2) != 0)
      goto LABEL_5;
    goto LABEL_12;
  }
LABEL_11:
  v4 = 0;
  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
LABEL_5:
    v5 = 2654435761 * self->_enableCollectionItemDescription;
    if ((*(_BYTE *)&self->_flags & 0x20) != 0)
      goto LABEL_6;
    goto LABEL_13;
  }
LABEL_12:
  v5 = 0;
  if ((*(_BYTE *)&self->_flags & 0x20) != 0)
  {
LABEL_6:
    v6 = 2654435761 * self->_overrideSuppress;
    if ((*(_BYTE *)&self->_flags & 4) != 0)
      goto LABEL_7;
LABEL_14:
    v7 = 0;
    if ((*(_BYTE *)&self->_flags & 8) != 0)
      goto LABEL_8;
LABEL_15:
    v8 = 0;
    return v3 ^ v2 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8;
  }
LABEL_13:
  v6 = 0;
  if ((*(_BYTE *)&self->_flags & 4) == 0)
    goto LABEL_14;
LABEL_7:
  v7 = 2654435761 * self->_enableMediaLink;
  if ((*(_BYTE *)&self->_flags & 8) == 0)
    goto LABEL_15;
LABEL_8:
  v8 = 2654435761 * self->_includePlaceCollectionItemPhotos;
  return v3 ^ v2 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unknownFields, 0);
}

- (void)writeTo:(id)a3
{
  char flags;
  id v5;

  v5 = a3;
  flags = (char)self->_flags;
  if ((flags & 1) != 0)
  {
    PBDataWriterWriteUint32Field();
    flags = (char)self->_flags;
    if ((flags & 0x40) == 0)
    {
LABEL_3:
      if ((flags & 0x10) == 0)
        goto LABEL_4;
      goto LABEL_12;
    }
  }
  else if ((*(_BYTE *)&self->_flags & 0x40) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteBOOLField();
  flags = (char)self->_flags;
  if ((flags & 0x10) == 0)
  {
LABEL_4:
    if ((flags & 2) == 0)
      goto LABEL_5;
    goto LABEL_13;
  }
LABEL_12:
  PBDataWriterWriteBOOLField();
  flags = (char)self->_flags;
  if ((flags & 2) == 0)
  {
LABEL_5:
    if ((flags & 0x20) == 0)
      goto LABEL_6;
    goto LABEL_14;
  }
LABEL_13:
  PBDataWriterWriteBOOLField();
  flags = (char)self->_flags;
  if ((flags & 0x20) == 0)
  {
LABEL_6:
    if ((flags & 4) == 0)
      goto LABEL_7;
LABEL_15:
    PBDataWriterWriteBOOLField();
    if ((*(_BYTE *)&self->_flags & 8) == 0)
      goto LABEL_9;
    goto LABEL_8;
  }
LABEL_14:
  PBDataWriterWriteBOOLField();
  flags = (char)self->_flags;
  if ((flags & 4) != 0)
    goto LABEL_15;
LABEL_7:
  if ((flags & 8) != 0)
LABEL_8:
    PBDataWriterWriteBOOLField();
LABEL_9:
  -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v5);

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
  v8.super_class = (Class)GEOPDPlaceCollectionFilter;
  -[GEOPDPlaceCollectionFilter description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPDPlaceCollectionFilter dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDPlaceCollectionFilter _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  char v5;
  void *v6;
  const __CFString *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  void *v15;
  const __CFString *v16;
  void *v17;
  const __CFString *v18;
  void *v19;
  const __CFString *v20;
  void *v21;
  const __CFString *v22;
  void *v23;
  const __CFString *v24;
  void *v25;
  const __CFString *v26;
  _QWORD v27[4];
  id v28;

  if (!a1)
    return 0;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(_BYTE *)(a1 + 28);
  if ((v5 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 16));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v16 = CFSTR("expectedResultCount");
    else
      v16 = CFSTR("expected_result_count");
    objc_msgSend(v4, "setObject:forKey:", v15, v16);

    v5 = *(_BYTE *)(a1 + 28);
    if ((v5 & 0x40) == 0)
    {
LABEL_4:
      if ((v5 & 0x10) == 0)
        goto LABEL_5;
      goto LABEL_27;
    }
  }
  else if ((*(_BYTE *)(a1 + 28) & 0x40) == 0)
  {
    goto LABEL_4;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 25));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v18 = CFSTR("partiallyClientize");
  else
    v18 = CFSTR("partially_clientize");
  objc_msgSend(v4, "setObject:forKey:", v17, v18);

  v5 = *(_BYTE *)(a1 + 28);
  if ((v5 & 0x10) == 0)
  {
LABEL_5:
    if ((v5 & 2) == 0)
      goto LABEL_6;
    goto LABEL_31;
  }
LABEL_27:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 23));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v20 = CFSTR("isCollectionView");
  else
    v20 = CFSTR("is_collection_view");
  objc_msgSend(v4, "setObject:forKey:", v19, v20);

  v5 = *(_BYTE *)(a1 + 28);
  if ((v5 & 2) == 0)
  {
LABEL_6:
    if ((v5 & 0x20) == 0)
      goto LABEL_7;
    goto LABEL_35;
  }
LABEL_31:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 20));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v22 = CFSTR("enableCollectionItemDescription");
  else
    v22 = CFSTR("enable_collection_item_description");
  objc_msgSend(v4, "setObject:forKey:", v21, v22);

  v5 = *(_BYTE *)(a1 + 28);
  if ((v5 & 0x20) == 0)
  {
LABEL_7:
    if ((v5 & 4) == 0)
      goto LABEL_8;
LABEL_39:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 21));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v26 = CFSTR("enableMediaLink");
    else
      v26 = CFSTR("enable_media_link");
    objc_msgSend(v4, "setObject:forKey:", v25, v26);

    if ((*(_BYTE *)(a1 + 28) & 8) == 0)
      goto LABEL_13;
    goto LABEL_9;
  }
LABEL_35:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 24));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v24 = CFSTR("overrideSuppress");
  else
    v24 = CFSTR("override_suppress");
  objc_msgSend(v4, "setObject:forKey:", v23, v24);

  v5 = *(_BYTE *)(a1 + 28);
  if ((v5 & 4) != 0)
    goto LABEL_39;
LABEL_8:
  if ((v5 & 8) != 0)
  {
LABEL_9:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 22));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v7 = CFSTR("includePlaceCollectionItemPhotos");
    else
      v7 = CFSTR("include_place_collection_item_photos");
    objc_msgSend(v4, "setObject:forKey:", v6, v7);

  }
LABEL_13:
  v8 = *(void **)(a1 + 8);
  if (v8)
  {
    objc_msgSend(v8, "dictionaryRepresentation");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (a2)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v9, "count"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v27[0] = MEMORY[0x1E0C809B0];
      v27[1] = 3221225472;
      v27[2] = __56__GEOPDPlaceCollectionFilter__dictionaryRepresentation___block_invoke;
      v27[3] = &unk_1E1C00600;
      v12 = v11;
      v28 = v12;
      objc_msgSend(v10, "enumerateKeysAndObjectsUsingBlock:", v27);
      v13 = v12;

      v10 = v13;
    }
    objc_msgSend(v4, "setObject:forKey:", v10, CFSTR("Unknown Fields"));

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOPDPlaceCollectionFilter _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __56__GEOPDPlaceCollectionFilter__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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
  return GEOPDPlaceCollectionFilterReadAllFrom((uint64_t)self, a3);
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4;
  void *v5;
  char flags;

  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5 = (void *)v4;
  flags = (char)self->_flags;
  if ((flags & 1) != 0)
  {
    *(_DWORD *)(v4 + 16) = self->_expectedResultCount;
    *(_BYTE *)(v4 + 28) |= 1u;
    flags = (char)self->_flags;
    if ((flags & 0x40) == 0)
    {
LABEL_3:
      if ((flags & 0x10) == 0)
        goto LABEL_4;
      goto LABEL_12;
    }
  }
  else if ((*(_BYTE *)&self->_flags & 0x40) == 0)
  {
    goto LABEL_3;
  }
  *(_BYTE *)(v4 + 25) = self->_partiallyClientize;
  *(_BYTE *)(v4 + 28) |= 0x40u;
  flags = (char)self->_flags;
  if ((flags & 0x10) == 0)
  {
LABEL_4:
    if ((flags & 2) == 0)
      goto LABEL_5;
    goto LABEL_13;
  }
LABEL_12:
  *(_BYTE *)(v4 + 23) = self->_isCollectionView;
  *(_BYTE *)(v4 + 28) |= 0x10u;
  flags = (char)self->_flags;
  if ((flags & 2) == 0)
  {
LABEL_5:
    if ((flags & 0x20) == 0)
      goto LABEL_6;
    goto LABEL_14;
  }
LABEL_13:
  *(_BYTE *)(v4 + 20) = self->_enableCollectionItemDescription;
  *(_BYTE *)(v4 + 28) |= 2u;
  flags = (char)self->_flags;
  if ((flags & 0x20) == 0)
  {
LABEL_6:
    if ((flags & 4) == 0)
      goto LABEL_7;
LABEL_15:
    *(_BYTE *)(v4 + 21) = self->_enableMediaLink;
    *(_BYTE *)(v4 + 28) |= 4u;
    if ((*(_BYTE *)&self->_flags & 8) == 0)
      goto LABEL_9;
    goto LABEL_8;
  }
LABEL_14:
  *(_BYTE *)(v4 + 24) = self->_overrideSuppress;
  *(_BYTE *)(v4 + 28) |= 0x20u;
  flags = (char)self->_flags;
  if ((flags & 4) != 0)
    goto LABEL_15;
LABEL_7:
  if ((flags & 8) != 0)
  {
LABEL_8:
    *(_BYTE *)(v4 + 22) = self->_includePlaceCollectionItemPhotos;
    *(_BYTE *)(v4 + 28) |= 8u;
  }
LABEL_9:
  objc_storeStrong((id *)(v4 + 8), self->_unknownFields);
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_49;
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 28) & 1) == 0 || self->_expectedResultCount != *((_DWORD *)v4 + 4))
      goto LABEL_49;
  }
  else if ((*((_BYTE *)v4 + 28) & 1) != 0)
  {
    goto LABEL_49;
  }
  if ((*(_BYTE *)&self->_flags & 0x40) != 0)
  {
    if ((*((_BYTE *)v4 + 28) & 0x40) == 0)
      goto LABEL_49;
    if (self->_partiallyClientize)
    {
      if (!*((_BYTE *)v4 + 25))
        goto LABEL_49;
    }
    else if (*((_BYTE *)v4 + 25))
    {
      goto LABEL_49;
    }
  }
  else if ((*((_BYTE *)v4 + 28) & 0x40) != 0)
  {
    goto LABEL_49;
  }
  if ((*(_BYTE *)&self->_flags & 0x10) != 0)
  {
    if ((*((_BYTE *)v4 + 28) & 0x10) == 0)
      goto LABEL_49;
    if (self->_isCollectionView)
    {
      if (!*((_BYTE *)v4 + 23))
        goto LABEL_49;
    }
    else if (*((_BYTE *)v4 + 23))
    {
      goto LABEL_49;
    }
  }
  else if ((*((_BYTE *)v4 + 28) & 0x10) != 0)
  {
    goto LABEL_49;
  }
  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 28) & 2) == 0)
      goto LABEL_49;
    if (self->_enableCollectionItemDescription)
    {
      if (!*((_BYTE *)v4 + 20))
        goto LABEL_49;
    }
    else if (*((_BYTE *)v4 + 20))
    {
      goto LABEL_49;
    }
  }
  else if ((*((_BYTE *)v4 + 28) & 2) != 0)
  {
    goto LABEL_49;
  }
  if ((*(_BYTE *)&self->_flags & 0x20) != 0)
  {
    if ((*((_BYTE *)v4 + 28) & 0x20) == 0)
      goto LABEL_49;
    if (self->_overrideSuppress)
    {
      if (!*((_BYTE *)v4 + 24))
        goto LABEL_49;
    }
    else if (*((_BYTE *)v4 + 24))
    {
      goto LABEL_49;
    }
  }
  else if ((*((_BYTE *)v4 + 28) & 0x20) != 0)
  {
    goto LABEL_49;
  }
  if ((*(_BYTE *)&self->_flags & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 28) & 4) == 0)
      goto LABEL_49;
    if (self->_enableMediaLink)
    {
      if (!*((_BYTE *)v4 + 21))
        goto LABEL_49;
    }
    else if (*((_BYTE *)v4 + 21))
    {
      goto LABEL_49;
    }
  }
  else if ((*((_BYTE *)v4 + 28) & 4) != 0)
  {
    goto LABEL_49;
  }
  v5 = (*((_BYTE *)v4 + 28) & 8) == 0;
  if ((*(_BYTE *)&self->_flags & 8) != 0)
  {
    if ((*((_BYTE *)v4 + 28) & 8) != 0)
    {
      if (self->_includePlaceCollectionItemPhotos)
      {
        if (!*((_BYTE *)v4 + 22))
          goto LABEL_49;
      }
      else if (*((_BYTE *)v4 + 22))
      {
        goto LABEL_49;
      }
      v5 = 1;
      goto LABEL_50;
    }
LABEL_49:
    v5 = 0;
  }
LABEL_50:

  return v5;
}

@end
