@implementation GEOPDPhotoConstraints

- (void)addMediaTypes:(uint64_t)a1
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
  v8.super_class = (Class)GEOPDPhotoConstraints;
  -[GEOPDPhotoConstraints description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPDPhotoConstraints dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDPhotoConstraints _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  double v5;
  void *v6;
  char v7;
  void *v8;
  const __CFString *v9;
  void *v10;
  const __CFString *v11;
  void *v12;
  const __CFString *v13;
  void *v14;
  const __CFString *v15;

  if (!a1)
  {
    v6 = 0;
    return v6;
  }
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v4;
  if (*(_QWORD *)(a1 + 16))
    objc_msgSend(v4, "setObject:forKey:");
  v7 = *(_BYTE *)(a1 + 40);
  if ((v7 & 8) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 36));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v9 = CFSTR("maxNumberOfPhotos");
    else
      v9 = CFSTR("max_number_of_photos");
    objc_msgSend(v6, "setObject:forKey:", v8, v9);

    v7 = *(_BYTE *)(a1 + 40);
    if ((v7 & 1) == 0)
    {
LABEL_6:
      if ((v7 & 2) == 0)
        goto LABEL_7;
      goto LABEL_17;
    }
  }
  else if ((*(_BYTE *)(a1 + 40) & 1) == 0)
  {
    goto LABEL_6;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *(_QWORD *)(a1 + 8));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v11 = CFSTR("maxPixels");
  else
    v11 = CFSTR("max_pixels");
  objc_msgSend(v6, "setObject:forKey:", v10, v11);

  v7 = *(_BYTE *)(a1 + 40);
  if ((v7 & 2) == 0)
  {
LABEL_7:
    if ((v7 & 4) == 0)
      return v6;
    goto LABEL_21;
  }
LABEL_17:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *(_QWORD *)(a1 + 24));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v13 = CFSTR("minPixels");
  else
    v13 = CFSTR("min_pixels");
  objc_msgSend(v6, "setObject:forKey:", v12, v13);

  if ((*(_BYTE *)(a1 + 40) & 4) != 0)
  {
LABEL_21:
    LODWORD(v5) = *(_DWORD *)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v5);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v15 = CFSTR("maxAspectRatio");
    else
      v15 = CFSTR("max_aspect_ratio");
    objc_msgSend(v6, "setObject:forKey:", v14, v15);

  }
  return v6;
}

- (id)jsonRepresentation
{
  return -[GEOPDPhotoConstraints _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDPhotoConstraintsReadAllFrom((uint64_t)self, a3);
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
  v5 = self->_mediaTypes;
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
  if ((flags & 8) != 0)
  {
    PBDataWriterWriteUint32Field();
    flags = (char)self->_flags;
    if ((flags & 1) == 0)
    {
LABEL_10:
      if ((flags & 2) == 0)
        goto LABEL_11;
LABEL_16:
      PBDataWriterWriteUint64Field();
      if ((*(_BYTE *)&self->_flags & 4) == 0)
        goto LABEL_13;
      goto LABEL_12;
    }
  }
  else if ((*(_BYTE *)&self->_flags & 1) == 0)
  {
    goto LABEL_10;
  }
  PBDataWriterWriteUint64Field();
  flags = (char)self->_flags;
  if ((flags & 2) != 0)
    goto LABEL_16;
LABEL_11:
  if ((flags & 4) != 0)
LABEL_12:
    PBDataWriterWriteFloatField();
LABEL_13:

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
  v6 = self->_mediaTypes;
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
        -[GEOPDPhotoConstraints addMediaTypes:](v5, v11);

      }
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v8);
  }

  flags = (char)self->_flags;
  if ((flags & 8) != 0)
  {
    *(_DWORD *)(v5 + 36) = self->_maxNumberOfPhotos;
    *(_BYTE *)(v5 + 40) |= 8u;
    flags = (char)self->_flags;
    if ((flags & 1) == 0)
    {
LABEL_10:
      if ((flags & 2) == 0)
        goto LABEL_11;
LABEL_16:
      *(_QWORD *)(v5 + 24) = self->_minPixels;
      *(_BYTE *)(v5 + 40) |= 2u;
      if ((*(_BYTE *)&self->_flags & 4) == 0)
        return (id)v5;
      goto LABEL_12;
    }
  }
  else if ((*(_BYTE *)&self->_flags & 1) == 0)
  {
    goto LABEL_10;
  }
  *(_QWORD *)(v5 + 8) = self->_maxPixels;
  *(_BYTE *)(v5 + 40) |= 1u;
  flags = (char)self->_flags;
  if ((flags & 2) != 0)
    goto LABEL_16;
LABEL_11:
  if ((flags & 4) != 0)
  {
LABEL_12:
    *(float *)(v5 + 32) = self->_maxAspectRatio;
    *(_BYTE *)(v5 + 40) |= 4u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSMutableArray *mediaTypes;
  BOOL v6;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_23;
  mediaTypes = self->_mediaTypes;
  if ((unint64_t)mediaTypes | *((_QWORD *)v4 + 2))
  {
    if (!-[NSMutableArray isEqual:](mediaTypes, "isEqual:"))
      goto LABEL_23;
  }
  if ((*(_BYTE *)&self->_flags & 8) != 0)
  {
    if ((*((_BYTE *)v4 + 40) & 8) == 0 || self->_maxNumberOfPhotos != *((_DWORD *)v4 + 9))
      goto LABEL_23;
  }
  else if ((*((_BYTE *)v4 + 40) & 8) != 0)
  {
LABEL_23:
    v6 = 0;
    goto LABEL_24;
  }
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 40) & 1) == 0 || self->_maxPixels != *((_QWORD *)v4 + 1))
      goto LABEL_23;
  }
  else if ((*((_BYTE *)v4 + 40) & 1) != 0)
  {
    goto LABEL_23;
  }
  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 40) & 2) == 0 || self->_minPixels != *((_QWORD *)v4 + 3))
      goto LABEL_23;
  }
  else if ((*((_BYTE *)v4 + 40) & 2) != 0)
  {
    goto LABEL_23;
  }
  v6 = (*((_BYTE *)v4 + 40) & 4) == 0;
  if ((*(_BYTE *)&self->_flags & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 40) & 4) == 0 || self->_maxAspectRatio != *((float *)v4 + 8))
      goto LABEL_23;
    v6 = 1;
  }
LABEL_24:

  return v6;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  float maxAspectRatio;
  double v8;
  long double v9;
  double v10;
  unint64_t v11;

  v3 = -[NSMutableArray hash](self->_mediaTypes, "hash");
  if ((*(_BYTE *)&self->_flags & 8) != 0)
  {
    v4 = 2654435761 * self->_maxNumberOfPhotos;
    if ((*(_BYTE *)&self->_flags & 1) != 0)
    {
LABEL_3:
      v5 = 2654435761u * self->_maxPixels;
      if ((*(_BYTE *)&self->_flags & 2) != 0)
        goto LABEL_4;
LABEL_11:
      v6 = 0;
      if ((*(_BYTE *)&self->_flags & 4) != 0)
        goto LABEL_5;
LABEL_12:
      v11 = 0;
      return v4 ^ v3 ^ v5 ^ v6 ^ v11;
    }
  }
  else
  {
    v4 = 0;
    if ((*(_BYTE *)&self->_flags & 1) != 0)
      goto LABEL_3;
  }
  v5 = 0;
  if ((*(_BYTE *)&self->_flags & 2) == 0)
    goto LABEL_11;
LABEL_4:
  v6 = 2654435761u * self->_minPixels;
  if ((*(_BYTE *)&self->_flags & 4) == 0)
    goto LABEL_12;
LABEL_5:
  maxAspectRatio = self->_maxAspectRatio;
  v8 = maxAspectRatio;
  if (maxAspectRatio < 0.0)
    v8 = -maxAspectRatio;
  v9 = floor(v8 + 0.5);
  v10 = (v8 - v9) * 1.84467441e19;
  v11 = 2654435761u * (unint64_t)fmod(v9, 1.84467441e19);
  if (v10 >= 0.0)
  {
    if (v10 > 0.0)
      v11 += (unint64_t)v10;
  }
  else
  {
    v11 -= (unint64_t)fabs(v10);
  }
  return v4 ^ v3 ^ v5 ^ v6 ^ v11;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mediaTypes, 0);
}

@end
