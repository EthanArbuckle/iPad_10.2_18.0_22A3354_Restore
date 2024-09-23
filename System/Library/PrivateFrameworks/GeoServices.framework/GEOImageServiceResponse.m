@implementation GEOImageServiceResponse

- (int)status
{
  if ((*(_BYTE *)&self->_flags & 2) != 0)
    return self->_status;
  else
    return 0;
}

- (void)setStatus:(int)a3
{
  *(_BYTE *)&self->_flags |= 2u;
  self->_status = a3;
}

- (void)setHasStatus:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasStatus
{
  return (*(_BYTE *)&self->_flags >> 1) & 1;
}

- (id)statusAsString:(int)a3
{
  __CFString *v3;
  id result;

  if (a3 > 29)
  {
    if (a3 > 49)
    {
      if (a3 == 50)
        return CFSTR("STATUS_DEDUPED");
      if (a3 == 60)
        return CFSTR("VERSION_MISMATCH");
    }
    else
    {
      if (a3 == 30)
        return CFSTR("NEEDS_REFINEMENT");
      if (a3 == 40)
        return CFSTR("FAILED_NOT_AUTHORIZED");
    }
LABEL_15:
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
    return v3;
  }
  else
  {
    v3 = CFSTR("STATUS_SUCCESS");
    switch(a3)
    {
      case 0:
        return v3;
      case 1:
        v3 = CFSTR("STATUS_FAILED");
        return v3;
      case 2:
        result = CFSTR("STATUS_INCOMPLETE");
        break;
      case 3:
      case 4:
        goto LABEL_15;
      case 5:
        result = CFSTR("INVALID_REQUEST");
        break;
      default:
        if (a3 != 20)
          goto LABEL_15;
        result = CFSTR("FAILED_NO_RESULT");
        break;
    }
  }
  return result;
}

- (int)StringAsStatus:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("STATUS_SUCCESS")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("STATUS_FAILED")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("STATUS_INCOMPLETE")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("INVALID_REQUEST")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FAILED_NO_RESULT")) & 1) != 0)
  {
    v4 = 20;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NEEDS_REFINEMENT")) & 1) != 0)
  {
    v4 = 30;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FAILED_NOT_AUTHORIZED")) & 1) != 0)
  {
    v4 = 40;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("STATUS_DEDUPED")) & 1) != 0)
  {
    v4 = 50;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("VERSION_MISMATCH")))
  {
    v4 = 60;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (unsigned)width
{
  return self->_width;
}

- (void)setWidth:(unsigned int)a3
{
  *(_BYTE *)&self->_flags |= 4u;
  self->_width = a3;
}

- (void)setHasWidth:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFB | v3;
}

- (BOOL)hasWidth
{
  return (*(_BYTE *)&self->_flags >> 2) & 1;
}

- (unsigned)height
{
  return self->_height;
}

- (void)setHeight:(unsigned int)a3
{
  *(_BYTE *)&self->_flags |= 1u;
  self->_height = a3;
}

- (void)setHasHeight:(BOOL)a3
{
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFE | a3;
}

- (BOOL)hasHeight
{
  return *(_BYTE *)&self->_flags & 1;
}

- (NSMutableArray)images
{
  return self->_images;
}

- (void)setImages:(id)a3
{
  objc_storeStrong((id *)&self->_images, a3);
}

- (void)clearImages
{
  -[NSMutableArray removeAllObjects](self->_images, "removeAllObjects");
}

- (void)addImages:(id)a3
{
  id v4;
  NSMutableArray *images;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  images = self->_images;
  v8 = v4;
  if (!images)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_images;
    self->_images = v6;

    v4 = v8;
    images = self->_images;
  }
  -[NSMutableArray addObject:](images, "addObject:", v4);

}

- (unint64_t)imagesCount
{
  return -[NSMutableArray count](self->_images, "count");
}

- (id)imagesAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_images, "objectAtIndex:", a3);
}

+ (Class)imagesType
{
  return (Class)objc_opt_class();
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
  v8.super_class = (Class)GEOImageServiceResponse;
  -[GEOImageServiceResponse description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOImageServiceResponse dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOImageServiceResponse _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  char v5;
  int v6;
  __CFString *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  objc_msgSend((id)a1, "readAll:", 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(_BYTE *)(a1 + 28);
  if ((v5 & 2) != 0)
  {
    v6 = *(_DWORD *)(a1 + 20);
    if (v6 <= 29)
    {
      v7 = CFSTR("STATUS_SUCCESS");
      switch(v6)
      {
        case 0:
          goto LABEL_20;
        case 1:
          v7 = CFSTR("STATUS_FAILED");
          break;
        case 2:
          v7 = CFSTR("STATUS_INCOMPLETE");
          break;
        case 3:
        case 4:
          goto LABEL_15;
        case 5:
          v7 = CFSTR("INVALID_REQUEST");
          break;
        default:
          if (v6 != 20)
            goto LABEL_15;
          v7 = CFSTR("FAILED_NO_RESULT");
          break;
      }
      goto LABEL_20;
    }
    if (v6 > 49)
    {
      if (v6 == 50)
      {
        v7 = CFSTR("STATUS_DEDUPED");
        goto LABEL_20;
      }
      if (v6 == 60)
      {
        v7 = CFSTR("VERSION_MISMATCH");
        goto LABEL_20;
      }
    }
    else
    {
      if (v6 == 30)
      {
        v7 = CFSTR("NEEDS_REFINEMENT");
        goto LABEL_20;
      }
      if (v6 == 40)
      {
        v7 = CFSTR("FAILED_NOT_AUTHORIZED");
LABEL_20:
        objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("status"));

        v5 = *(_BYTE *)(a1 + 28);
        goto LABEL_21;
      }
    }
LABEL_15:
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(unsigned int *)(a1 + 20));
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
    goto LABEL_20;
  }
LABEL_21:
  if ((v5 & 4) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 24));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v8, CFSTR("width"));

    v5 = *(_BYTE *)(a1 + 28);
  }
  if ((v5 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 16));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v9, CFSTR("height"));

  }
  if (objc_msgSend(*(id *)(a1 + 8), "count"))
  {
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 8), "count"));
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v11 = *(id *)(a1 + 8);
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v20;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v20 != v14)
            objc_enumerationMutation(v11);
          v16 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
          if ((a2 & 1) != 0)
            objc_msgSend(v16, "jsonRepresentation");
          else
            objc_msgSend(v16, "dictionaryRepresentation");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "addObject:", v17);

        }
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      }
      while (v13);
    }

    objc_msgSend(v4, "setObject:forKey:", v10, CFSTR("images"));
  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOImageServiceResponse _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEOImageServiceResponse)initWithDictionary:(id)a3
{
  return (GEOImageServiceResponse *)-[GEOImageServiceResponse _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(char)a3 isJSON:
{
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  uint64_t v17;
  GEOImageServiceImage *v18;
  uint64_t v19;
  void *v20;
  id v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (!a1)
    goto LABEL_46;
  a1 = (void *)objc_msgSend(a1, "init");
  if (!a1)
    goto LABEL_46;
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("status"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7 = v6;
    if ((objc_msgSend(v7, "isEqualToString:", CFSTR("STATUS_SUCCESS")) & 1) != 0)
    {
      v8 = 0;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("STATUS_FAILED")) & 1) != 0)
    {
      v8 = 1;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("STATUS_INCOMPLETE")) & 1) != 0)
    {
      v8 = 2;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("INVALID_REQUEST")) & 1) != 0)
    {
      v8 = 5;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("FAILED_NO_RESULT")) & 1) != 0)
    {
      v8 = 20;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("NEEDS_REFINEMENT")) & 1) != 0)
    {
      v8 = 30;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("FAILED_NOT_AUTHORIZED")) & 1) != 0)
    {
      v8 = 40;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("STATUS_DEDUPED")) & 1) != 0)
    {
      v8 = 50;
    }
    else if (objc_msgSend(v7, "isEqualToString:", CFSTR("VERSION_MISMATCH")))
    {
      v8 = 60;
    }
    else
    {
      v8 = 0;
    }

    goto LABEL_26;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = objc_msgSend(v6, "intValue");
LABEL_26:
    objc_msgSend(a1, "setStatus:", v8);
  }

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("width"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setWidth:", objc_msgSend(v9, "unsignedIntValue"));

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("height"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setHeight:", objc_msgSend(v10, "unsignedIntValue"));

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("images"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v22 = v5;
    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    v12 = v11;
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v24;
      do
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v24 != v15)
            objc_enumerationMutation(v12);
          v17 = *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * i);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v18 = [GEOImageServiceImage alloc];
            if ((a3 & 1) != 0)
              v19 = -[GEOImageServiceImage initWithJSON:](v18, "initWithJSON:", v17);
            else
              v19 = -[GEOImageServiceImage initWithDictionary:](v18, "initWithDictionary:", v17);
            v20 = (void *)v19;
            objc_msgSend(a1, "addImages:", v19);

          }
        }
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
      }
      while (v14);
    }

    v5 = v22;
  }

LABEL_46:
  return a1;
}

- (GEOImageServiceResponse)initWithJSON:(id)a3
{
  return (GEOImageServiceResponse *)-[GEOImageServiceResponse _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEOImageServiceResponseIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOImageServiceResponseReadAllFrom(self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v4;
  char flags;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  flags = (char)self->_flags;
  if ((flags & 2) != 0)
  {
    PBDataWriterWriteInt32Field();
    flags = (char)self->_flags;
    if ((flags & 4) == 0)
    {
LABEL_3:
      if ((flags & 1) == 0)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  else if ((*(_BYTE *)&self->_flags & 4) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint32Field();
  if ((*(_BYTE *)&self->_flags & 1) != 0)
LABEL_4:
    PBDataWriterWriteUint32Field();
LABEL_5:
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v6 = self->_images;
  v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v12 != v9)
          objc_enumerationMutation(v6);
        PBDataWriterWriteSubmessage();
      }
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v8);
  }

}

- (void)copyTo:(id)a3
{
  char flags;
  unint64_t v5;
  unint64_t v6;
  uint64_t i;
  void *v8;
  _DWORD *v9;

  v9 = a3;
  -[GEOImageServiceResponse readAll:](self, "readAll:", 0);
  flags = (char)self->_flags;
  if ((flags & 2) == 0)
  {
    if ((*(_BYTE *)&self->_flags & 4) == 0)
      goto LABEL_3;
LABEL_11:
    v9[6] = self->_width;
    *((_BYTE *)v9 + 28) |= 4u;
    if ((*(_BYTE *)&self->_flags & 1) == 0)
      goto LABEL_5;
    goto LABEL_4;
  }
  v9[5] = self->_status;
  *((_BYTE *)v9 + 28) |= 2u;
  flags = (char)self->_flags;
  if ((flags & 4) != 0)
    goto LABEL_11;
LABEL_3:
  if ((flags & 1) != 0)
  {
LABEL_4:
    v9[4] = self->_height;
    *((_BYTE *)v9 + 28) |= 1u;
  }
LABEL_5:
  if (-[GEOImageServiceResponse imagesCount](self, "imagesCount"))
  {
    objc_msgSend(v9, "clearImages");
    v5 = -[GEOImageServiceResponse imagesCount](self, "imagesCount");
    if (v5)
    {
      v6 = v5;
      for (i = 0; i != v6; ++i)
      {
        -[GEOImageServiceResponse imagesAtIndex:](self, "imagesAtIndex:", i);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "addImages:", v8);

      }
    }
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  void *v6;
  char flags;
  NSMutableArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = (void *)v5;
  flags = (char)self->_flags;
  if ((flags & 2) != 0)
  {
    *(_DWORD *)(v5 + 20) = self->_status;
    *(_BYTE *)(v5 + 28) |= 2u;
    flags = (char)self->_flags;
    if ((flags & 4) == 0)
    {
LABEL_3:
      if ((flags & 1) == 0)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  else if ((*(_BYTE *)&self->_flags & 4) == 0)
  {
    goto LABEL_3;
  }
  *(_DWORD *)(v5 + 24) = self->_width;
  *(_BYTE *)(v5 + 28) |= 4u;
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
LABEL_4:
    *(_DWORD *)(v5 + 16) = self->_height;
    *(_BYTE *)(v5 + 28) |= 1u;
  }
LABEL_5:
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v8 = self->_images;
  v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v16 != v11)
          objc_enumerationMutation(v8);
        v13 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * i), "copyWithZone:", a3, (_QWORD)v15);
        objc_msgSend(v6, "addImages:", v13);

      }
      v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v10);
  }

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSMutableArray *images;
  char v6;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_19;
  -[GEOImageServiceResponse readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 28) & 2) == 0 || self->_status != *((_DWORD *)v4 + 5))
      goto LABEL_19;
  }
  else if ((*((_BYTE *)v4 + 28) & 2) != 0)
  {
LABEL_19:
    v6 = 0;
    goto LABEL_20;
  }
  if ((*(_BYTE *)&self->_flags & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 28) & 4) == 0 || self->_width != *((_DWORD *)v4 + 6))
      goto LABEL_19;
  }
  else if ((*((_BYTE *)v4 + 28) & 4) != 0)
  {
    goto LABEL_19;
  }
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 28) & 1) == 0 || self->_height != *((_DWORD *)v4 + 4))
      goto LABEL_19;
  }
  else if ((*((_BYTE *)v4 + 28) & 1) != 0)
  {
    goto LABEL_19;
  }
  images = self->_images;
  if ((unint64_t)images | *((_QWORD *)v4 + 1))
    v6 = -[NSMutableArray isEqual:](images, "isEqual:");
  else
    v6 = 1;
LABEL_20:

  return v6;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  -[GEOImageServiceResponse readAll:](self, "readAll:", 1);
  if ((*(_BYTE *)&self->_flags & 2) == 0)
  {
    v3 = 0;
    if ((*(_BYTE *)&self->_flags & 4) != 0)
      goto LABEL_3;
LABEL_6:
    v4 = 0;
    if ((*(_BYTE *)&self->_flags & 1) != 0)
      goto LABEL_4;
LABEL_7:
    v5 = 0;
    return v4 ^ v3 ^ v5 ^ -[NSMutableArray hash](self->_images, "hash");
  }
  v3 = 2654435761 * self->_status;
  if ((*(_BYTE *)&self->_flags & 4) == 0)
    goto LABEL_6;
LABEL_3:
  v4 = 2654435761 * self->_width;
  if ((*(_BYTE *)&self->_flags & 1) == 0)
    goto LABEL_7;
LABEL_4:
  v5 = 2654435761 * self->_height;
  return v4 ^ v3 ^ v5 ^ -[NSMutableArray hash](self->_images, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  char v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "readAll:", 0);
  v5 = *((_BYTE *)v4 + 28);
  if ((v5 & 2) != 0)
  {
    self->_status = *((_DWORD *)v4 + 5);
    *(_BYTE *)&self->_flags |= 2u;
    v5 = *((_BYTE *)v4 + 28);
    if ((v5 & 4) == 0)
    {
LABEL_3:
      if ((v5 & 1) == 0)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  else if ((*((_BYTE *)v4 + 28) & 4) == 0)
  {
    goto LABEL_3;
  }
  self->_width = *((_DWORD *)v4 + 6);
  *(_BYTE *)&self->_flags |= 4u;
  if ((*((_BYTE *)v4 + 28) & 1) != 0)
  {
LABEL_4:
    self->_height = *((_DWORD *)v4 + 4);
    *(_BYTE *)&self->_flags |= 1u;
  }
LABEL_5:
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v6 = *((id *)v4 + 1);
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v12 != v9)
          objc_enumerationMutation(v6);
        -[GEOImageServiceResponse addImages:](self, "addImages:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * i), (_QWORD)v11);
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v8);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_images, 0);
}

@end
