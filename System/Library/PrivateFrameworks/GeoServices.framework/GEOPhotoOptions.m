@implementation GEOPhotoOptions

- (void)dealloc
{
  objc_super v3;

  PBRepeatedInt32Clear();
  v3.receiver = self;
  v3.super_class = (Class)GEOPhotoOptions;
  -[GEOPhotoOptions dealloc](&v3, sel_dealloc);
}

- (int)maxPhotos
{
  return self->_maxPhotos;
}

- (void)setMaxPhotos:(int)a3
{
  self->_maxPhotos = a3;
}

- (int)photoType
{
  if ((*(_BYTE *)&self->_flags & 1) != 0)
    return self->_photoType;
  else
    return 0;
}

- (void)setPhotoType:(int)a3
{
  *(_BYTE *)&self->_flags |= 1u;
  self->_photoType = a3;
}

- (void)setHasPhotoType:(BOOL)a3
{
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFE | a3;
}

- (BOOL)hasPhotoType
{
  return *(_BYTE *)&self->_flags & 1;
}

- (id)photoTypeAsString:(int)a3
{
  if (a3 < 5)
    return off_1E1C0F0B0[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsPhotoType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("STOREFRONT")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TOP_RATED")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("USER")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PRIMARY")) & 1) != 0)
  {
    v4 = 3;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("STANDARD")))
  {
    v4 = 4;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (unint64_t)photoSizesCount
{
  return self->_photoSizes.count;
}

- (int)photoSizes
{
  return self->_photoSizes.list;
}

- (void)clearPhotoSizes
{
  PBRepeatedInt32Clear();
}

- (void)addPhotoSize:(int)a3
{
  PBRepeatedInt32Add();
}

- (int)photoSizeAtIndex:(unint64_t)a3
{
  $27AAA0BB14FCB8642CC83DAEBE69EA4A *p_photoSizes;
  unint64_t count;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;

  p_photoSizes = &self->_photoSizes;
  count = self->_photoSizes.count;
  if (count <= a3)
  {
    v6 = (void *)MEMORY[0x1E0C99DA0];
    v7 = *MEMORY[0x1E0C99858];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("idx (%tu) is out of range (%tu)"), a3, count);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "exceptionWithName:reason:userInfo:", v7, v8, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "raise");

  }
  return p_photoSizes->list[a3];
}

- (void)setPhotoSizes:(int *)a3 count:(unint64_t)a4
{
  PBRepeatedInt32Set();
}

- (id)photoSizesAsString:(int)a3
{
  if (a3 < 0xA)
    return off_1E1C0F0D8[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsPhotoSizes:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PX20")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PX30")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PX40")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PX60")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PX100")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PX120")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PX250")) & 1) != 0)
  {
    v4 = 6;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PX1000")) & 1) != 0)
  {
    v4 = 7;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PX600_400")) & 1) != 0)
  {
    v4 = 8;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("PX248_186")))
  {
    v4 = 9;
  }
  else
  {
    v4 = 0;
  }

  return v4;
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
  v8.super_class = (Class)GEOPhotoOptions;
  -[GEOPhotoOptions description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPhotoOptions dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPhotoOptions _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  void *v5;
  uint64_t v6;
  __CFString *v7;
  void *v8;
  _QWORD *v9;
  unint64_t v10;
  uint64_t v11;
  __CFString *v12;
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
  objc_msgSend((id)a1, "readAll:", 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(a1 + 40));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v5, CFSTR("maxPhotos"));

  if ((*(_BYTE *)(a1 + 48) & 1) != 0)
  {
    v6 = *(int *)(a1 + 44);
    if (v6 >= 5)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 44));
      v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = off_1E1C0F0B0[v6];
    }
    objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("photoType"));

  }
  if (*(_QWORD *)(a1 + 24))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (_QWORD *)(a1 + 16);
    if (*(_QWORD *)(a1 + 24))
    {
      v10 = 0;
      do
      {
        v11 = *(int *)(*v9 + 4 * v10);
        if (v11 >= 0xA)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v11);
          v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v12 = off_1E1C0F0D8[v11];
        }
        objc_msgSend(v8, "addObject:", v12);

        ++v10;
        v9 = (_QWORD *)(a1 + 16);
      }
      while (v10 < *(_QWORD *)(a1 + 24));
    }
    objc_msgSend(v4, "setObject:forKey:", v8, CFSTR("photoSize"));

  }
  v13 = *(void **)(a1 + 8);
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
      v20[2] = __45__GEOPhotoOptions__dictionaryRepresentation___block_invoke;
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
  return -[GEOPhotoOptions _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __45__GEOPhotoOptions__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (GEOPhotoOptions)initWithDictionary:(id)a3
{
  return (GEOPhotoOptions *)-[GEOPhotoOptions _initWithDictionary:isJSON:](self, a3);
}

- (void)_initWithDictionary:(void *)a1 isJSON:(void *)a2
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id v16;
  uint64_t v17;
  void *v19;
  id v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (!a1)
  {
    v4 = 0;
    goto LABEL_57;
  }
  v4 = (void *)objc_msgSend(a1, "init");
  if (v4)
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("maxPhotos"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      objc_msgSend(v4, "setMaxPhotos:", objc_msgSend(v5, "intValue"));

    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("photoType"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = v6;
      if ((objc_msgSend(v7, "isEqualToString:", CFSTR("STOREFRONT")) & 1) != 0)
      {
        v8 = 0;
      }
      else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("TOP_RATED")) & 1) != 0)
      {
        v8 = 1;
      }
      else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("USER")) & 1) != 0)
      {
        v8 = 2;
      }
      else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("PRIMARY")) & 1) != 0)
      {
        v8 = 3;
      }
      else if (objc_msgSend(v7, "isEqualToString:", CFSTR("STANDARD")))
      {
        v8 = 4;
      }
      else
      {
        v8 = 0;
      }

    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
LABEL_21:

        objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("photoSize"));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
          goto LABEL_56;
        v19 = v9;
        v20 = v3;
        v23 = 0u;
        v24 = 0u;
        v21 = 0u;
        v22 = 0u;
        v10 = v9;
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
        if (!v11)
          goto LABEL_55;
        v12 = v11;
        v13 = *(_QWORD *)v22;
        while (1)
        {
          v14 = 0;
          do
          {
            if (*(_QWORD *)v22 != v13)
              objc_enumerationMutation(v10);
            v15 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * v14);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v16 = v15;
              if ((objc_msgSend(v16, "isEqualToString:", CFSTR("PX20")) & 1) != 0)
              {
                v17 = 0;
              }
              else if ((objc_msgSend(v16, "isEqualToString:", CFSTR("PX30")) & 1) != 0)
              {
                v17 = 1;
              }
              else if ((objc_msgSend(v16, "isEqualToString:", CFSTR("PX40")) & 1) != 0)
              {
                v17 = 2;
              }
              else if ((objc_msgSend(v16, "isEqualToString:", CFSTR("PX60")) & 1) != 0)
              {
                v17 = 3;
              }
              else if ((objc_msgSend(v16, "isEqualToString:", CFSTR("PX100")) & 1) != 0)
              {
                v17 = 4;
              }
              else if ((objc_msgSend(v16, "isEqualToString:", CFSTR("PX120")) & 1) != 0)
              {
                v17 = 5;
              }
              else if ((objc_msgSend(v16, "isEqualToString:", CFSTR("PX250")) & 1) != 0)
              {
                v17 = 6;
              }
              else if ((objc_msgSend(v16, "isEqualToString:", CFSTR("PX1000")) & 1) != 0)
              {
                v17 = 7;
              }
              else if ((objc_msgSend(v16, "isEqualToString:", CFSTR("PX600_400")) & 1) != 0)
              {
                v17 = 8;
              }
              else if (objc_msgSend(v16, "isEqualToString:", CFSTR("PX248_186")))
              {
                v17 = 9;
              }
              else
              {
                v17 = 0;
              }

            }
            else
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0)
                goto LABEL_53;
              v17 = objc_msgSend(v15, "intValue");
            }
            objc_msgSend(v4, "addPhotoSize:", v17, v19, v20, (_QWORD)v21);
LABEL_53:
            ++v14;
          }
          while (v12 != v14);
          v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
          if (!v12)
          {
LABEL_55:

            v9 = v19;
            v3 = v20;
LABEL_56:

            goto LABEL_57;
          }
        }
      }
      v8 = objc_msgSend(v6, "intValue");
    }
    objc_msgSend(v4, "setPhotoType:", v8);
    goto LABEL_21;
  }
LABEL_57:

  return v4;
}

- (GEOPhotoOptions)initWithJSON:(id)a3
{
  return (GEOPhotoOptions *)-[GEOPhotoOptions _initWithDictionary:isJSON:](self, a3);
}

+ (BOOL)isValid:(id)a3
{
  return GEOPhotoOptionsIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOPhotoOptionsReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  unint64_t v5;
  id v6;

  v6 = a3;
  PBDataWriterWriteInt32Field();
  if ((*(_BYTE *)&self->_flags & 1) != 0)
    PBDataWriterWriteInt32Field();
  v4 = v6;
  if (self->_photoSizes.count)
  {
    v5 = 0;
    do
    {
      PBDataWriterWriteInt32Field();
      v4 = v6;
      ++v5;
    }
    while (v5 < self->_photoSizes.count);
  }
  -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4);

}

- (void)copyTo:(id)a3
{
  unint64_t v4;
  unint64_t v5;
  uint64_t i;
  _DWORD *v7;

  v7 = a3;
  -[GEOPhotoOptions readAll:](self, "readAll:", 0);
  v7[10] = self->_maxPhotos;
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    v7[11] = self->_photoType;
    *((_BYTE *)v7 + 48) |= 1u;
  }
  if (-[GEOPhotoOptions photoSizesCount](self, "photoSizesCount"))
  {
    objc_msgSend(v7, "clearPhotoSizes");
    v4 = -[GEOPhotoOptions photoSizesCount](self, "photoSizesCount");
    if (v4)
    {
      v5 = v4;
      for (i = 0; i != v5; ++i)
        objc_msgSend(v7, "addPhotoSize:", -[GEOPhotoOptions photoSizeAtIndex:](self, "photoSizeAtIndex:", i));
    }
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4;
  id *v5;

  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5 = (id *)v4;
  *(_DWORD *)(v4 + 40) = self->_maxPhotos;
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    *(_DWORD *)(v4 + 44) = self->_photoType;
    *(_BYTE *)(v4 + 48) |= 1u;
  }
  PBRepeatedInt32Copy();
  objc_storeStrong(v5 + 1, self->_unknownFields);
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  char IsEqual;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_9;
  -[GEOPhotoOptions readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  if (self->_maxPhotos != *((_DWORD *)v4 + 10))
    goto LABEL_9;
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 48) & 1) == 0 || self->_photoType != *((_DWORD *)v4 + 11))
      goto LABEL_9;
  }
  else if ((*((_BYTE *)v4 + 48) & 1) != 0)
  {
LABEL_9:
    IsEqual = 0;
    goto LABEL_10;
  }
  IsEqual = PBRepeatedInt32IsEqual();
LABEL_10:

  return IsEqual;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;

  -[GEOPhotoOptions readAll:](self, "readAll:", 1);
  if ((*(_BYTE *)&self->_flags & 1) != 0)
    v3 = 2654435761 * self->_photoType;
  else
    v3 = 0;
  v4 = 2654435761 * self->_maxPhotos;
  return v3 ^ PBRepeatedInt32Hash() ^ v4;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  int *v7;

  v7 = (int *)a3;
  objc_msgSend(v7, "readAll:", 0);
  self->_maxPhotos = v7[10];
  if ((v7[12] & 1) != 0)
  {
    self->_photoType = v7[11];
    *(_BYTE *)&self->_flags |= 1u;
  }
  v4 = objc_msgSend(v7, "photoSizesCount");
  if (v4)
  {
    v5 = v4;
    for (i = 0; i != v5; ++i)
      -[GEOPhotoOptions addPhotoSize:](self, "addPhotoSize:", objc_msgSend(v7, "photoSizeAtIndex:", i));
  }

}

- (PBUnknownFields)unknownFields
{
  return self->_unknownFields;
}

- (void)clearUnknownFields:(BOOL)a3
{
  _BOOL4 v3;
  PBUnknownFields *unknownFields;

  v3 = a3;
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
    -[GEOPhotoOptions readAll:](self, "readAll:", 0);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unknownFields, 0);
}

@end
