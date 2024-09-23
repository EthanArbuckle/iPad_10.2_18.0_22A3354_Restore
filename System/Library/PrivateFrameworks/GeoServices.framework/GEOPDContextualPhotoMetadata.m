@implementation GEOPDContextualPhotoMetadata

- (void)addContextualPhotoLabel:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 16);
    v7 = v3;
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *(void **)(a1 + 16);
      *(_QWORD *)(a1 + 16) = v5;

      v4 = *(void **)(a1 + 16);
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
  v8.super_class = (Class)GEOPDContextualPhotoMetadata;
  -[GEOPDContextualPhotoMetadata description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPDContextualPhotoMetadata dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDContextualPhotoMetadata _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  void *v5;
  char v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  void *v16;
  const __CFString *v17;
  void *v18;
  const __CFString *v19;
  void *v20;
  const __CFString *v21;
  void *v22;
  const __CFString *v23;
  _QWORD v24[4];
  id v25;

  if (!a1)
    return 0;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (*(_QWORD *)(a1 + 16))
    objc_msgSend(v4, "setObject:forKey:");
  v6 = *(_BYTE *)(a1 + 36);
  if ((v6 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 24));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v17 = CFSTR("maxNumContextualPhotos");
    else
      v17 = CFSTR("max_num_contextual_photos");
    objc_msgSend(v5, "setObject:forKey:", v16, v17);

    v6 = *(_BYTE *)(a1 + 36);
    if ((v6 & 2) == 0)
    {
LABEL_6:
      if ((v6 & 0x10) == 0)
        goto LABEL_7;
      goto LABEL_26;
    }
  }
  else if ((*(_BYTE *)(a1 + 36) & 2) == 0)
  {
    goto LABEL_6;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 28));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v19 = CFSTR("maxNumPhotos");
  else
    v19 = CFSTR("max_num_photos");
  objc_msgSend(v5, "setObject:forKey:", v18, v19);

  v6 = *(_BYTE *)(a1 + 36);
  if ((v6 & 0x10) == 0)
  {
LABEL_7:
    if ((v6 & 8) == 0)
      goto LABEL_8;
LABEL_30:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 33));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v23 = CFSTR("shouldApplyContextualizationSearch");
    else
      v23 = CFSTR("should_apply_contextualization_search");
    objc_msgSend(v5, "setObject:forKey:", v22, v23);

    if ((*(_BYTE *)(a1 + 36) & 4) == 0)
      goto LABEL_13;
    goto LABEL_9;
  }
LABEL_26:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 34));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v21 = CFSTR("shouldLimitToPoisWithVendorTopPhoto");
  else
    v21 = CFSTR("should_limit_to_pois_with_vendor_top_photo");
  objc_msgSend(v5, "setObject:forKey:", v20, v21);

  v6 = *(_BYTE *)(a1 + 36);
  if ((v6 & 8) != 0)
    goto LABEL_30;
LABEL_8:
  if ((v6 & 4) != 0)
  {
LABEL_9:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 32));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v8 = CFSTR("shouldApplyContextualizationPlacecard");
    else
      v8 = CFSTR("should_apply_contextualization_placecard");
    objc_msgSend(v5, "setObject:forKey:", v7, v8);

  }
LABEL_13:
  v9 = *(void **)(a1 + 8);
  if (v9)
  {
    objc_msgSend(v9, "dictionaryRepresentation");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (a2)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v10, "count"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v24[0] = MEMORY[0x1E0C809B0];
      v24[1] = 3221225472;
      v24[2] = __58__GEOPDContextualPhotoMetadata__dictionaryRepresentation___block_invoke;
      v24[3] = &unk_1E1C00600;
      v13 = v12;
      v25 = v13;
      objc_msgSend(v11, "enumerateKeysAndObjectsUsingBlock:", v24);
      v14 = v13;

      v11 = v14;
    }
    objc_msgSend(v5, "setObject:forKey:", v11, CFSTR("Unknown Fields"));

  }
  return v5;
}

- (id)jsonRepresentation
{
  return -[GEOPDContextualPhotoMetadata _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __58__GEOPDContextualPhotoMetadata__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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
  return GEOPDContextualPhotoMetadataReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  char flags;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = self->_contextualPhotoLabels;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        PBDataWriterWriteStringField();
      }
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }

  flags = (char)self->_flags;
  if ((flags & 1) != 0)
  {
    PBDataWriterWriteUint32Field();
    flags = (char)self->_flags;
    if ((flags & 2) == 0)
    {
LABEL_10:
      if ((flags & 0x10) == 0)
        goto LABEL_11;
      goto LABEL_17;
    }
  }
  else if ((*(_BYTE *)&self->_flags & 2) == 0)
  {
    goto LABEL_10;
  }
  PBDataWriterWriteUint32Field();
  flags = (char)self->_flags;
  if ((flags & 0x10) == 0)
  {
LABEL_11:
    if ((flags & 8) == 0)
      goto LABEL_12;
LABEL_18:
    PBDataWriterWriteBOOLField();
    if ((*(_BYTE *)&self->_flags & 4) == 0)
      goto LABEL_14;
    goto LABEL_13;
  }
LABEL_17:
  PBDataWriterWriteBOOLField();
  flags = (char)self->_flags;
  if ((flags & 8) != 0)
    goto LABEL_18;
LABEL_12:
  if ((flags & 4) != 0)
LABEL_13:
    PBDataWriterWriteBOOLField();
LABEL_14:
  -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4, v11);

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  char flags;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v6 = self->_contextualPhotoLabels;
  v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v6);
        v11 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * i), "copyWithZone:", a3, (_QWORD)v14);
        -[GEOPDContextualPhotoMetadata addContextualPhotoLabel:](v5, v11);

      }
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v8);
  }

  flags = (char)self->_flags;
  if ((flags & 1) != 0)
  {
    *(_DWORD *)(v5 + 24) = self->_maxNumContextualPhotos;
    *(_BYTE *)(v5 + 36) |= 1u;
    flags = (char)self->_flags;
    if ((flags & 2) == 0)
    {
LABEL_10:
      if ((flags & 0x10) == 0)
        goto LABEL_11;
      goto LABEL_17;
    }
  }
  else if ((*(_BYTE *)&self->_flags & 2) == 0)
  {
    goto LABEL_10;
  }
  *(_DWORD *)(v5 + 28) = self->_maxNumPhotos;
  *(_BYTE *)(v5 + 36) |= 2u;
  flags = (char)self->_flags;
  if ((flags & 0x10) == 0)
  {
LABEL_11:
    if ((flags & 8) == 0)
      goto LABEL_12;
LABEL_18:
    *(_BYTE *)(v5 + 33) = self->_shouldApplyContextualizationSearch;
    *(_BYTE *)(v5 + 36) |= 8u;
    if ((*(_BYTE *)&self->_flags & 4) == 0)
      goto LABEL_14;
    goto LABEL_13;
  }
LABEL_17:
  *(_BYTE *)(v5 + 34) = self->_shouldLimitToPoisWithVendorTopPhoto;
  *(_BYTE *)(v5 + 36) |= 0x10u;
  flags = (char)self->_flags;
  if ((flags & 8) != 0)
    goto LABEL_18;
LABEL_12:
  if ((flags & 4) != 0)
  {
LABEL_13:
    *(_BYTE *)(v5 + 32) = self->_shouldApplyContextualizationPlacecard;
    *(_BYTE *)(v5 + 36) |= 4u;
  }
LABEL_14:
  objc_storeStrong((id *)(v5 + 8), self->_unknownFields);
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSMutableArray *contextualPhotoLabels;
  BOOL v6;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_32;
  contextualPhotoLabels = self->_contextualPhotoLabels;
  if ((unint64_t)contextualPhotoLabels | *((_QWORD *)v4 + 2))
  {
    if (!-[NSMutableArray isEqual:](contextualPhotoLabels, "isEqual:"))
      goto LABEL_32;
  }
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 36) & 1) == 0 || self->_maxNumContextualPhotos != *((_DWORD *)v4 + 6))
      goto LABEL_32;
  }
  else if ((*((_BYTE *)v4 + 36) & 1) != 0)
  {
    goto LABEL_32;
  }
  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 36) & 2) == 0 || self->_maxNumPhotos != *((_DWORD *)v4 + 7))
      goto LABEL_32;
  }
  else if ((*((_BYTE *)v4 + 36) & 2) != 0)
  {
    goto LABEL_32;
  }
  if ((*(_BYTE *)&self->_flags & 0x10) != 0)
  {
    if ((*((_BYTE *)v4 + 36) & 0x10) == 0)
      goto LABEL_32;
    if (self->_shouldLimitToPoisWithVendorTopPhoto)
    {
      if (!*((_BYTE *)v4 + 34))
        goto LABEL_32;
    }
    else if (*((_BYTE *)v4 + 34))
    {
      goto LABEL_32;
    }
  }
  else if ((*((_BYTE *)v4 + 36) & 0x10) != 0)
  {
    goto LABEL_32;
  }
  if ((*(_BYTE *)&self->_flags & 8) != 0)
  {
    if ((*((_BYTE *)v4 + 36) & 8) == 0)
      goto LABEL_32;
    if (self->_shouldApplyContextualizationSearch)
    {
      if (!*((_BYTE *)v4 + 33))
        goto LABEL_32;
    }
    else if (*((_BYTE *)v4 + 33))
    {
      goto LABEL_32;
    }
  }
  else if ((*((_BYTE *)v4 + 36) & 8) != 0)
  {
    goto LABEL_32;
  }
  v6 = (*((_BYTE *)v4 + 36) & 4) == 0;
  if ((*(_BYTE *)&self->_flags & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 36) & 4) != 0)
    {
      if (self->_shouldApplyContextualizationPlacecard)
      {
        if (!*((_BYTE *)v4 + 32))
          goto LABEL_32;
      }
      else if (*((_BYTE *)v4 + 32))
      {
        goto LABEL_32;
      }
      v6 = 1;
      goto LABEL_33;
    }
LABEL_32:
    v6 = 0;
  }
LABEL_33:

  return v6;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v3 = -[NSMutableArray hash](self->_contextualPhotoLabels, "hash");
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    v4 = 2654435761 * self->_maxNumContextualPhotos;
    if ((*(_BYTE *)&self->_flags & 2) != 0)
    {
LABEL_3:
      v5 = 2654435761 * self->_maxNumPhotos;
      if ((*(_BYTE *)&self->_flags & 0x10) != 0)
        goto LABEL_4;
      goto LABEL_9;
    }
  }
  else
  {
    v4 = 0;
    if ((*(_BYTE *)&self->_flags & 2) != 0)
      goto LABEL_3;
  }
  v5 = 0;
  if ((*(_BYTE *)&self->_flags & 0x10) != 0)
  {
LABEL_4:
    v6 = 2654435761 * self->_shouldLimitToPoisWithVendorTopPhoto;
    if ((*(_BYTE *)&self->_flags & 8) != 0)
      goto LABEL_5;
LABEL_10:
    v7 = 0;
    if ((*(_BYTE *)&self->_flags & 4) != 0)
      goto LABEL_6;
LABEL_11:
    v8 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8;
  }
LABEL_9:
  v6 = 0;
  if ((*(_BYTE *)&self->_flags & 8) == 0)
    goto LABEL_10;
LABEL_5:
  v7 = 2654435761 * self->_shouldApplyContextualizationSearch;
  if ((*(_BYTE *)&self->_flags & 4) == 0)
    goto LABEL_11;
LABEL_6:
  v8 = 2654435761 * self->_shouldApplyContextualizationPlacecard;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contextualPhotoLabels, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
}

@end
