@implementation GEORPGroundViewImageResource

- (unsigned)cameraNumber
{
  return self->_cameraNumber;
}

- (void)setCameraNumber:(unsigned int)a3
{
  *(_BYTE *)&self->_flags |= 1u;
  self->_cameraNumber = a3;
}

- (void)setHasCameraNumber:(BOOL)a3
{
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFE | a3;
}

- (BOOL)hasCameraNumber
{
  return *(_BYTE *)&self->_flags & 1;
}

- (unsigned)lod
{
  return self->_lod;
}

- (void)setLod:(unsigned int)a3
{
  *(_BYTE *)&self->_flags |= 4u;
  self->_lod = a3;
}

- (void)setHasLod:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFB | v3;
}

- (BOOL)hasLod
{
  return (*(_BYTE *)&self->_flags >> 2) & 1;
}

- (int)loadStatus
{
  if ((*(_BYTE *)&self->_flags & 2) != 0)
    return self->_loadStatus;
  else
    return 0;
}

- (void)setLoadStatus:(int)a3
{
  *(_BYTE *)&self->_flags |= 2u;
  self->_loadStatus = a3;
}

- (void)setHasLoadStatus:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasLoadStatus
{
  return (*(_BYTE *)&self->_flags >> 1) & 1;
}

- (id)loadStatusAsString:(int)a3
{
  if (a3 < 3)
    return off_1E1C03C28[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsLoadStatus:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("IMAGE_LOAD_STATUS_UNKNOWN")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("IMAGE_LOAD_STATUS_SUCCESS")) & 1) != 0)
  {
    v4 = 1;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("IMAGE_LOAD_STATUS_FAILED")))
  {
    v4 = 2;
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
  v8.super_class = (Class)GEORPGroundViewImageResource;
  -[GEORPGroundViewImageResource description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEORPGroundViewImageResource dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEORPGroundViewImageResource _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  char v5;
  void *v6;
  const __CFString *v7;
  void *v8;
  uint64_t v9;
  __CFString *v10;
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
  objc_msgSend((id)a1, "readAll:", 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(_BYTE *)(a1 + 28);
  if ((v5 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 16));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v7 = CFSTR("cameraNumber");
    else
      v7 = CFSTR("camera_number");
    objc_msgSend(v4, "setObject:forKey:", v6, v7);

    v5 = *(_BYTE *)(a1 + 28);
    if ((v5 & 4) == 0)
    {
LABEL_4:
      if ((v5 & 2) == 0)
        goto LABEL_18;
LABEL_11:
      v9 = *(int *)(a1 + 20);
      if (v9 >= 3)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 20));
        v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v10 = off_1E1C03C28[v9];
      }
      if (a2)
        v11 = CFSTR("loadStatus");
      else
        v11 = CFSTR("load_status");
      objc_msgSend(v4, "setObject:forKey:", v10, v11);

      goto LABEL_18;
    }
  }
  else if ((*(_BYTE *)(a1 + 28) & 4) == 0)
  {
    goto LABEL_4;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 24));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v8, CFSTR("lod"));

  if ((*(_BYTE *)(a1 + 28) & 2) != 0)
    goto LABEL_11;
LABEL_18:
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
      v19[2] = __58__GEORPGroundViewImageResource__dictionaryRepresentation___block_invoke;
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
  return -[GEORPGroundViewImageResource _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __58__GEORPGroundViewImageResource__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (GEORPGroundViewImageResource)initWithDictionary:(id)a3
{
  return (GEORPGroundViewImageResource *)-[GEORPGroundViewImageResource _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5;
  const __CFString *v6;
  void *v7;
  void *v8;
  const __CFString *v9;
  void *v10;
  id v11;
  uint64_t v12;

  v5 = a2;
  if (a1)
  {
    a1 = (void *)objc_msgSend(a1, "init");
    if (a1)
    {
      if (a3)
        v6 = CFSTR("cameraNumber");
      else
        v6 = CFSTR("camera_number");
      objc_msgSend(v5, "objectForKeyedSubscript:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setCameraNumber:", objc_msgSend(v7, "unsignedIntValue"));

      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("lod"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setLod:", objc_msgSend(v8, "unsignedIntValue"));

      if (a3)
        v9 = CFSTR("loadStatus");
      else
        v9 = CFSTR("load_status");
      objc_msgSend(v5, "objectForKeyedSubscript:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v11 = v10;
        if ((objc_msgSend(v11, "isEqualToString:", CFSTR("IMAGE_LOAD_STATUS_UNKNOWN")) & 1) != 0)
        {
          v12 = 0;
        }
        else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("IMAGE_LOAD_STATUS_SUCCESS")) & 1) != 0)
        {
          v12 = 1;
        }
        else if (objc_msgSend(v11, "isEqualToString:", CFSTR("IMAGE_LOAD_STATUS_FAILED")))
        {
          v12 = 2;
        }
        else
        {
          v12 = 0;
        }

      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
LABEL_25:

          goto LABEL_26;
        }
        v12 = objc_msgSend(v10, "intValue");
      }
      objc_msgSend(a1, "setLoadStatus:", v12);
      goto LABEL_25;
    }
  }
LABEL_26:

  return a1;
}

- (GEORPGroundViewImageResource)initWithJSON:(id)a3
{
  return (GEORPGroundViewImageResource *)-[GEORPGroundViewImageResource _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEORPGroundViewImageResourceIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEORPGroundViewImageResourceReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  char flags;
  id v5;

  v5 = a3;
  flags = (char)self->_flags;
  if ((flags & 1) == 0)
  {
    if ((*(_BYTE *)&self->_flags & 4) == 0)
      goto LABEL_3;
LABEL_7:
    PBDataWriterWriteUint32Field();
    if ((*(_BYTE *)&self->_flags & 2) == 0)
      goto LABEL_5;
    goto LABEL_4;
  }
  PBDataWriterWriteUint32Field();
  flags = (char)self->_flags;
  if ((flags & 4) != 0)
    goto LABEL_7;
LABEL_3:
  if ((flags & 2) != 0)
LABEL_4:
    PBDataWriterWriteInt32Field();
LABEL_5:
  -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v5);

}

- (void)copyTo:(id)a3
{
  char flags;
  _DWORD *v5;

  v5 = a3;
  -[GEORPGroundViewImageResource readAll:](self, "readAll:", 0);
  flags = (char)self->_flags;
  if ((flags & 1) == 0)
  {
    if ((*(_BYTE *)&self->_flags & 4) == 0)
      goto LABEL_3;
LABEL_7:
    v5[6] = self->_lod;
    *((_BYTE *)v5 + 28) |= 4u;
    if ((*(_BYTE *)&self->_flags & 2) == 0)
      goto LABEL_5;
    goto LABEL_4;
  }
  v5[4] = self->_cameraNumber;
  *((_BYTE *)v5 + 28) |= 1u;
  flags = (char)self->_flags;
  if ((flags & 4) != 0)
    goto LABEL_7;
LABEL_3:
  if ((flags & 2) != 0)
  {
LABEL_4:
    v5[5] = self->_loadStatus;
    *((_BYTE *)v5 + 28) |= 2u;
  }
LABEL_5:

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4;
  void *v5;
  char flags;

  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5 = (void *)v4;
  flags = (char)self->_flags;
  if ((flags & 1) == 0)
  {
    if ((*(_BYTE *)&self->_flags & 4) == 0)
      goto LABEL_3;
LABEL_7:
    *(_DWORD *)(v4 + 24) = self->_lod;
    *(_BYTE *)(v4 + 28) |= 4u;
    if ((*(_BYTE *)&self->_flags & 2) == 0)
      goto LABEL_5;
    goto LABEL_4;
  }
  *(_DWORD *)(v4 + 16) = self->_cameraNumber;
  *(_BYTE *)(v4 + 28) |= 1u;
  flags = (char)self->_flags;
  if ((flags & 4) != 0)
    goto LABEL_7;
LABEL_3:
  if ((flags & 2) != 0)
  {
LABEL_4:
    *(_DWORD *)(v4 + 20) = self->_loadStatus;
    *(_BYTE *)(v4 + 28) |= 2u;
  }
LABEL_5:
  objc_storeStrong((id *)(v4 + 8), self->_unknownFields);
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_16;
  -[GEORPGroundViewImageResource readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 28) & 1) == 0 || self->_cameraNumber != *((_DWORD *)v4 + 4))
      goto LABEL_16;
  }
  else if ((*((_BYTE *)v4 + 28) & 1) != 0)
  {
LABEL_16:
    v5 = 0;
    goto LABEL_17;
  }
  if ((*(_BYTE *)&self->_flags & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 28) & 4) == 0 || self->_lod != *((_DWORD *)v4 + 6))
      goto LABEL_16;
  }
  else if ((*((_BYTE *)v4 + 28) & 4) != 0)
  {
    goto LABEL_16;
  }
  v5 = (*((_BYTE *)v4 + 28) & 2) == 0;
  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 28) & 2) == 0 || self->_loadStatus != *((_DWORD *)v4 + 5))
      goto LABEL_16;
    v5 = 1;
  }
LABEL_17:

  return v5;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  -[GEORPGroundViewImageResource readAll:](self, "readAll:", 1);
  if ((*(_BYTE *)&self->_flags & 1) == 0)
  {
    v3 = 0;
    if ((*(_BYTE *)&self->_flags & 4) != 0)
      goto LABEL_3;
LABEL_6:
    v4 = 0;
    if ((*(_BYTE *)&self->_flags & 2) != 0)
      goto LABEL_4;
LABEL_7:
    v5 = 0;
    return v4 ^ v3 ^ v5;
  }
  v3 = 2654435761 * self->_cameraNumber;
  if ((*(_BYTE *)&self->_flags & 4) == 0)
    goto LABEL_6;
LABEL_3:
  v4 = 2654435761 * self->_lod;
  if ((*(_BYTE *)&self->_flags & 2) == 0)
    goto LABEL_7;
LABEL_4:
  v5 = 2654435761 * self->_loadStatus;
  return v4 ^ v3 ^ v5;
}

- (void)mergeFrom:(id)a3
{
  char v4;
  id v5;

  v5 = a3;
  objc_msgSend(v5, "readAll:", 0);
  v4 = *((_BYTE *)v5 + 28);
  if ((v4 & 1) == 0)
  {
    if ((*((_BYTE *)v5 + 28) & 4) == 0)
      goto LABEL_3;
LABEL_7:
    self->_lod = *((_DWORD *)v5 + 6);
    *(_BYTE *)&self->_flags |= 4u;
    if ((*((_BYTE *)v5 + 28) & 2) == 0)
      goto LABEL_5;
    goto LABEL_4;
  }
  self->_cameraNumber = *((_DWORD *)v5 + 4);
  *(_BYTE *)&self->_flags |= 1u;
  v4 = *((_BYTE *)v5 + 28);
  if ((v4 & 4) != 0)
    goto LABEL_7;
LABEL_3:
  if ((v4 & 2) != 0)
  {
LABEL_4:
    self->_loadStatus = *((_DWORD *)v5 + 5);
    *(_BYTE *)&self->_flags |= 2u;
  }
LABEL_5:

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
    -[GEORPGroundViewImageResource readAll:](self, "readAll:", 0);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unknownFields, 0);
}

@end
