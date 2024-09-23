@implementation GEORoadComplexity

- (NSMutableArray)attributes
{
  return self->_attributes;
}

- (void)setAttributes:(id)a3
{
  objc_storeStrong((id *)&self->_attributes, a3);
}

- (void)clearAttributes
{
  -[NSMutableArray removeAllObjects](self->_attributes, "removeAllObjects");
}

- (void)addAttribute:(id)a3
{
  id v4;
  NSMutableArray *attributes;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  attributes = self->_attributes;
  v8 = v4;
  if (!attributes)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_attributes;
    self->_attributes = v6;

    v4 = v8;
    attributes = self->_attributes;
  }
  -[NSMutableArray addObject:](attributes, "addObject:", v4);

}

- (unint64_t)attributesCount
{
  return -[NSMutableArray count](self->_attributes, "count");
}

- (id)attributeAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_attributes, "objectAtIndex:", a3);
}

+ (Class)attributeType
{
  return (Class)objc_opt_class();
}

- (unsigned)offset
{
  return self->_offset;
}

- (void)setOffset:(unsigned int)a3
{
  *(_BYTE *)&self->_flags |= 1u;
  self->_offset = a3;
}

- (void)setHasOffset:(BOOL)a3
{
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFE | a3;
}

- (BOOL)hasOffset
{
  return *(_BYTE *)&self->_flags & 1;
}

- (unsigned)zilchPathIndex
{
  return self->_zilchPathIndex;
}

- (void)setZilchPathIndex:(unsigned int)a3
{
  *(_BYTE *)&self->_flags |= 2u;
  self->_zilchPathIndex = a3;
}

- (void)setHasZilchPathIndex:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasZilchPathIndex
{
  return (*(_BYTE *)&self->_flags >> 1) & 1;
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
  v8.super_class = (Class)GEORoadComplexity;
  -[GEORoadComplexity description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEORoadComplexity dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEORoadComplexity _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  void *v15;
  const __CFString *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  _QWORD v24[4];
  id v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  objc_msgSend((id)a1, "readAll:", 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(*(id *)(a1 + 16), "count"))
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 16), "count"));
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    v6 = *(id *)(a1 + 16);
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v27;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v27 != v9)
            objc_enumerationMutation(v6);
          v11 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
          if ((a2 & 1) != 0)
            objc_msgSend(v11, "jsonRepresentation");
          else
            objc_msgSend(v11, "dictionaryRepresentation");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "addObject:", v12);

        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
      }
      while (v8);
    }

    objc_msgSend(v4, "setObject:forKey:", v5, CFSTR("attribute"));
  }
  v13 = *(_BYTE *)(a1 + 32);
  if ((v13 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 24));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v14, CFSTR("offset"));

    v13 = *(_BYTE *)(a1 + 32);
  }
  if ((v13 & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 28));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v16 = CFSTR("zilchPathIndex");
    else
      v16 = CFSTR("zilch_path_index");
    objc_msgSend(v4, "setObject:forKey:", v15, v16);

  }
  v17 = *(void **)(a1 + 8);
  if (v17)
  {
    objc_msgSend(v17, "dictionaryRepresentation");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v18;
    if (a2)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v18, "count"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v24[0] = MEMORY[0x1E0C809B0];
      v24[1] = 3221225472;
      v24[2] = __47__GEORoadComplexity__dictionaryRepresentation___block_invoke;
      v24[3] = &unk_1E1C00600;
      v21 = v20;
      v25 = v21;
      objc_msgSend(v19, "enumerateKeysAndObjectsUsingBlock:", v24);
      v22 = v21;

      v19 = v22;
    }
    objc_msgSend(v4, "setObject:forKey:", v19, CFSTR("Unknown Fields"));

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEORoadComplexity _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __47__GEORoadComplexity__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (GEORoadComplexity)initWithDictionary:(id)a3
{
  return (GEORoadComplexity *)-[GEORoadComplexity _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  GEOAttribute *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  const __CFString *v17;
  void *v18;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (a1)
  {
    a1 = (void *)objc_msgSend(a1, "init");
    if (a1)
    {
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("attribute"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v23 = 0u;
        v24 = 0u;
        v21 = 0u;
        v22 = 0u;
        v20 = v6;
        v7 = v6;
        v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
        if (v8)
        {
          v9 = v8;
          v10 = *(_QWORD *)v22;
          do
          {
            for (i = 0; i != v9; ++i)
            {
              if (*(_QWORD *)v22 != v10)
                objc_enumerationMutation(v7);
              v12 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * i);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v13 = [GEOAttribute alloc];
                if ((a3 & 1) != 0)
                  v14 = -[GEOAttribute initWithJSON:](v13, "initWithJSON:", v12);
                else
                  v14 = -[GEOAttribute initWithDictionary:](v13, "initWithDictionary:", v12);
                v15 = (void *)v14;
                objc_msgSend(a1, "addAttribute:", v14);

              }
            }
            v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
          }
          while (v9);
        }

        v6 = v20;
      }

      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("offset"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setOffset:", objc_msgSend(v16, "unsignedIntValue"));

      if (a3)
        v17 = CFSTR("zilchPathIndex");
      else
        v17 = CFSTR("zilch_path_index");
      objc_msgSend(v5, "objectForKeyedSubscript:", v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setZilchPathIndex:", objc_msgSend(v18, "unsignedIntValue"));

    }
  }

  return a1;
}

- (GEORoadComplexity)initWithJSON:(id)a3
{
  return (GEORoadComplexity *)-[GEORoadComplexity _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEORoadComplexityIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEORoadComplexityReadAllFrom((uint64_t)self, a3);
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
  v5 = self->_attributes;
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
        PBDataWriterWriteSubmessage();
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
  }
  if ((flags & 2) != 0)
    PBDataWriterWriteUint32Field();
  -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4, v11);

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
  -[GEORoadComplexity readAll:](self, "readAll:", 0);
  if (-[GEORoadComplexity attributesCount](self, "attributesCount"))
  {
    objc_msgSend(v9, "clearAttributes");
    v4 = -[GEORoadComplexity attributesCount](self, "attributesCount");
    if (v4)
    {
      v5 = v4;
      for (i = 0; i != v5; ++i)
      {
        -[GEORoadComplexity attributeAtIndex:](self, "attributeAtIndex:", i);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "addAttribute:", v7);

      }
    }
  }
  flags = (char)self->_flags;
  if ((flags & 1) != 0)
  {
    *((_DWORD *)v9 + 6) = self->_offset;
    *((_BYTE *)v9 + 32) |= 1u;
    flags = (char)self->_flags;
  }
  if ((flags & 2) != 0)
  {
    *((_DWORD *)v9 + 7) = self->_zilchPathIndex;
    *((_BYTE *)v9 + 32) |= 2u;
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
  v6 = self->_attributes;
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
        objc_msgSend((id)v5, "addAttribute:", v11);

      }
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v8);
  }

  flags = (char)self->_flags;
  if ((flags & 1) != 0)
  {
    *(_DWORD *)(v5 + 24) = self->_offset;
    *(_BYTE *)(v5 + 32) |= 1u;
    flags = (char)self->_flags;
  }
  if ((flags & 2) != 0)
  {
    *(_DWORD *)(v5 + 28) = self->_zilchPathIndex;
    *(_BYTE *)(v5 + 32) |= 2u;
  }
  objc_storeStrong((id *)(v5 + 8), self->_unknownFields);
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSMutableArray *attributes;
  BOOL v6;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_13;
  -[GEORoadComplexity readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  attributes = self->_attributes;
  if ((unint64_t)attributes | *((_QWORD *)v4 + 2))
  {
    if (!-[NSMutableArray isEqual:](attributes, "isEqual:"))
      goto LABEL_13;
  }
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 32) & 1) == 0 || self->_offset != *((_DWORD *)v4 + 6))
      goto LABEL_13;
  }
  else if ((*((_BYTE *)v4 + 32) & 1) != 0)
  {
LABEL_13:
    v6 = 0;
    goto LABEL_14;
  }
  v6 = (*((_BYTE *)v4 + 32) & 2) == 0;
  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 32) & 2) == 0 || self->_zilchPathIndex != *((_DWORD *)v4 + 7))
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

  -[GEORoadComplexity readAll:](self, "readAll:", 1);
  v3 = -[NSMutableArray hash](self->_attributes, "hash");
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    v4 = 2654435761 * self->_offset;
    if ((*(_BYTE *)&self->_flags & 2) != 0)
      goto LABEL_3;
LABEL_5:
    v5 = 0;
    return v4 ^ v3 ^ v5;
  }
  v4 = 0;
  if ((*(_BYTE *)&self->_flags & 2) == 0)
    goto LABEL_5;
LABEL_3:
  v5 = 2654435761 * self->_zilchPathIndex;
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
  v5 = *((id *)v4 + 2);
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
        -[GEORoadComplexity addAttribute:](self, "addAttribute:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * i), (_QWORD)v11);
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }

  v10 = *((_BYTE *)v4 + 32);
  if ((v10 & 1) != 0)
  {
    self->_offset = *((_DWORD *)v4 + 6);
    *(_BYTE *)&self->_flags |= 1u;
    v10 = *((_BYTE *)v4 + 32);
  }
  if ((v10 & 2) != 0)
  {
    self->_zilchPathIndex = *((_DWORD *)v4 + 7);
    *(_BYTE *)&self->_flags |= 2u;
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
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v3 = a3;
  v16 = *MEMORY[0x1E0C80C00];
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    -[GEORoadComplexity readAll:](self, "readAll:", 0);
    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    v6 = self->_attributes;
    v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v12;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v12 != v9)
            objc_enumerationMutation(v6);
          objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v10++), "clearUnknownFields:", 1, (_QWORD)v11);
        }
        while (v8 != v10);
        v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      }
      while (v8);
    }

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attributes, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
}

@end
