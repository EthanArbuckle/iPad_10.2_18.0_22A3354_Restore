@implementation GEOImageServiceRequest

- (NSMutableArray)imageIds
{
  return self->_imageIds;
}

- (void)setImageIds:(id)a3
{
  objc_storeStrong((id *)&self->_imageIds, a3);
}

- (void)clearImageIds
{
  -[NSMutableArray removeAllObjects](self->_imageIds, "removeAllObjects");
}

- (void)addImageId:(id)a3
{
  id v4;
  NSMutableArray *imageIds;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  imageIds = self->_imageIds;
  v8 = v4;
  if (!imageIds)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_imageIds;
    self->_imageIds = v6;

    v4 = v8;
    imageIds = self->_imageIds;
  }
  -[NSMutableArray addObject:](imageIds, "addObject:", v4);

}

- (unint64_t)imageIdsCount
{
  return -[NSMutableArray count](self->_imageIds, "count");
}

- (id)imageIdAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_imageIds, "objectAtIndex:", a3);
}

+ (Class)imageIdType
{
  return (Class)objc_opt_class();
}

- (unsigned)width
{
  return self->_width;
}

- (void)setWidth:(unsigned int)a3
{
  *(_BYTE *)&self->_flags |= 2u;
  self->_width = a3;
}

- (void)setHasWidth:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasWidth
{
  return (*(_BYTE *)&self->_flags >> 1) & 1;
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

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)GEOImageServiceRequest;
  -[GEOImageServiceRequest description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOImageServiceRequest dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOImageServiceRequest _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  const __CFString *v14;
  char v15;
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
  if (*(_QWORD *)(a1 + 8))
  {
    if (a2)
    {
      v5 = (void *)MEMORY[0x1E0C99DE8];
      objc_msgSend((id)a1, "imageIds");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "arrayWithCapacity:", objc_msgSend(v6, "count"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      v21 = 0u;
      v22 = 0u;
      v19 = 0u;
      v20 = 0u;
      objc_msgSend((id)a1, "imageIds", 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      if (v9)
      {
        v10 = v9;
        v11 = *(_QWORD *)v20;
        do
        {
          for (i = 0; i != v10; ++i)
          {
            if (*(_QWORD *)v20 != v11)
              objc_enumerationMutation(v8);
            objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * i), "base64EncodedStringWithOptions:", 0);
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v7, "addObject:", v13);

          }
          v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
        }
        while (v10);
      }

      v14 = CFSTR("imageId");
    }
    else
    {
      objc_msgSend((id)a1, "imageIds");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = CFSTR("image_id");
    }
    objc_msgSend(v4, "setObject:forKey:", v7, v14);

  }
  v15 = *(_BYTE *)(a1 + 24);
  if ((v15 & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 20));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v16, CFSTR("width"));

    v15 = *(_BYTE *)(a1 + 24);
  }
  if ((v15 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 16));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v17, CFSTR("height"));

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOImageServiceRequest _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEOImageServiceRequest)initWithDictionary:(id)a3
{
  return (GEOImageServiceRequest *)-[GEOImageServiceRequest _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5;
  const __CFString *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (a1)
  {
    a1 = (void *)objc_msgSend(a1, "init");
    if (a1)
    {
      if (a3)
        v6 = CFSTR("imageId");
      else
        v6 = CFSTR("image_id");
      objc_msgSend(v5, "objectForKeyedSubscript:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v21 = 0u;
        v22 = 0u;
        v19 = 0u;
        v20 = 0u;
        v8 = v7;
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
        if (v9)
        {
          v10 = v9;
          v11 = *(_QWORD *)v20;
          do
          {
            v12 = 0;
            do
            {
              if (*(_QWORD *)v20 != v11)
                objc_enumerationMutation(v8);
              v13 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * v12);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v14 = objc_alloc(MEMORY[0x1E0C99D50]);
                v15 = (void *)objc_msgSend(v14, "initWithBase64EncodedString:options:", v13, 0, (_QWORD)v19);
                objc_msgSend(a1, "addImageId:", v15);

              }
              ++v12;
            }
            while (v10 != v12);
            v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
          }
          while (v10);
        }

      }
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("width"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setWidth:", objc_msgSend(v16, "unsignedIntValue"));

      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("height"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setHeight:", objc_msgSend(v17, "unsignedIntValue"));

    }
  }

  return a1;
}

- (GEOImageServiceRequest)initWithJSON:(id)a3
{
  return (GEOImageServiceRequest *)-[GEOImageServiceRequest _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEOImageServiceRequestIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOImageServiceRequestReadAllFrom(self, a3);
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
  v5 = self->_imageIds;
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
        PBDataWriterWriteDataField();
      }
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }

  flags = (char)self->_flags;
  if ((flags & 2) != 0)
  {
    PBDataWriterWriteUint32Field();
    flags = (char)self->_flags;
  }
  if ((flags & 1) != 0)
    PBDataWriterWriteUint32Field();

}

- (unsigned)requestTypeCode
{
  return 1024;
}

- (Class)responseClass
{
  return (Class)objc_opt_class();
}

- (void)copyTo:(id)a3
{
  unint64_t v4;
  unint64_t v5;
  uint64_t i;
  void *v7;
  char flags;
  id v9;

  v9 = a3;
  -[GEOImageServiceRequest readAll:](self, "readAll:", 0);
  if (-[GEOImageServiceRequest imageIdsCount](self, "imageIdsCount"))
  {
    objc_msgSend(v9, "clearImageIds");
    v4 = -[GEOImageServiceRequest imageIdsCount](self, "imageIdsCount");
    if (v4)
    {
      v5 = v4;
      for (i = 0; i != v5; ++i)
      {
        -[GEOImageServiceRequest imageIdAtIndex:](self, "imageIdAtIndex:", i);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "addImageId:", v7);

      }
    }
  }
  flags = (char)self->_flags;
  if ((flags & 2) != 0)
  {
    *((_DWORD *)v9 + 5) = self->_width;
    *((_BYTE *)v9 + 24) |= 2u;
    flags = (char)self->_flags;
  }
  if ((flags & 1) != 0)
  {
    *((_DWORD *)v9 + 4) = self->_height;
    *((_BYTE *)v9 + 24) |= 1u;
  }

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
  v6 = self->_imageIds;
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
        objc_msgSend((id)v5, "addImageId:", v11);

      }
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v8);
  }

  flags = (char)self->_flags;
  if ((flags & 2) != 0)
  {
    *(_DWORD *)(v5 + 20) = self->_width;
    *(_BYTE *)(v5 + 24) |= 2u;
    flags = (char)self->_flags;
  }
  if ((flags & 1) != 0)
  {
    *(_DWORD *)(v5 + 16) = self->_height;
    *(_BYTE *)(v5 + 24) |= 1u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSMutableArray *imageIds;
  BOOL v6;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_13;
  -[GEOImageServiceRequest readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  imageIds = self->_imageIds;
  if ((unint64_t)imageIds | *((_QWORD *)v4 + 1))
  {
    if (!-[NSMutableArray isEqual:](imageIds, "isEqual:"))
      goto LABEL_13;
  }
  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 24) & 2) == 0 || self->_width != *((_DWORD *)v4 + 5))
      goto LABEL_13;
  }
  else if ((*((_BYTE *)v4 + 24) & 2) != 0)
  {
LABEL_13:
    v6 = 0;
    goto LABEL_14;
  }
  v6 = (*((_BYTE *)v4 + 24) & 1) == 0;
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 24) & 1) == 0 || self->_height != *((_DWORD *)v4 + 4))
      goto LABEL_13;
    v6 = 1;
  }
LABEL_14:

  return v6;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  -[GEOImageServiceRequest readAll:](self, "readAll:", 1);
  v3 = -[NSMutableArray hash](self->_imageIds, "hash");
  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    v4 = 2654435761 * self->_width;
    if ((*(_BYTE *)&self->_flags & 1) != 0)
      goto LABEL_3;
LABEL_5:
    v5 = 0;
    return v4 ^ v3 ^ v5;
  }
  v4 = 0;
  if ((*(_BYTE *)&self->_flags & 1) == 0)
    goto LABEL_5;
LABEL_3:
  v5 = 2654435761 * self->_height;
  return v4 ^ v3 ^ v5;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  char v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "readAll:", 0);
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v5 = *((id *)v4 + 1);
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
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
        -[GEOImageServiceRequest addImageId:](self, "addImageId:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * i), (_QWORD)v11);
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }

  v10 = *((_BYTE *)v4 + 24);
  if ((v10 & 2) != 0)
  {
    self->_width = *((_DWORD *)v4 + 5);
    *(_BYTE *)&self->_flags |= 2u;
    v10 = *((_BYTE *)v4 + 24);
  }
  if ((v10 & 1) != 0)
  {
    self->_height = *((_DWORD *)v4 + 4);
    *(_BYTE *)&self->_flags |= 1u;
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageIds, 0);
}

@end
