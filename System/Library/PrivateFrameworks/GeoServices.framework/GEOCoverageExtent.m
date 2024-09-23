@implementation GEOCoverageExtent

- (void)dealloc
{
  objc_super v3;

  -[GEOCoverageExtent clearCoverageExceptions](self, "clearCoverageExceptions");
  v3.receiver = self;
  v3.super_class = (Class)GEOCoverageExtent;
  -[GEOCoverageExtent dealloc](&v3, sel_dealloc);
}

- (unsigned)minX
{
  return self->_minX;
}

- (void)setMinX:(unsigned int)a3
{
  *(_BYTE *)&self->_flags |= 4u;
  self->_minX = a3;
}

- (void)setHasMinX:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFB | v3;
}

- (BOOL)hasMinX
{
  return (*(_BYTE *)&self->_flags >> 2) & 1;
}

- (unsigned)minY
{
  return self->_minY;
}

- (void)setMinY:(unsigned int)a3
{
  *(_BYTE *)&self->_flags |= 8u;
  self->_minY = a3;
}

- (void)setHasMinY:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xF7 | v3;
}

- (BOOL)hasMinY
{
  return (*(_BYTE *)&self->_flags >> 3) & 1;
}

- (unsigned)maxX
{
  return self->_maxX;
}

- (void)setMaxX:(unsigned int)a3
{
  *(_BYTE *)&self->_flags |= 1u;
  self->_maxX = a3;
}

- (void)setHasMaxX:(BOOL)a3
{
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFE | a3;
}

- (BOOL)hasMaxX
{
  return *(_BYTE *)&self->_flags & 1;
}

- (unsigned)maxY
{
  return self->_maxY;
}

- (void)setMaxY:(unsigned int)a3
{
  *(_BYTE *)&self->_flags |= 2u;
  self->_maxY = a3;
}

- (void)setHasMaxY:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasMaxY
{
  return (*(_BYTE *)&self->_flags >> 1) & 1;
}

- (unsigned)zoom
{
  return self->_zoom;
}

- (void)setZoom:(unsigned int)a3
{
  *(_BYTE *)&self->_flags |= 0x10u;
  self->_zoom = a3;
}

- (void)setHasZoom:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xEF | v3;
}

- (BOOL)hasZoom
{
  return (*(_BYTE *)&self->_flags >> 4) & 1;
}

- (unint64_t)coverageExceptionsCount
{
  return self->_coverageExceptionsCount;
}

- (GEOCoverageException)coverageExceptions
{
  return self->_coverageExceptions;
}

- (uint64_t)_reserveCoverageExceptions:(uint64_t)a1
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
    if (24 * v9 < v9)
      return 0;
    result = (uint64_t)malloc_type_realloc(*(void **)(a1 + 16), 24 * v9, 0xC606ED09uLL);
    if (result)
    {
      *(_QWORD *)(a1 + 32) = v9;
      *(_QWORD *)(a1 + 16) = result;
      bzero((void *)(result + 24 * *(_QWORD *)(a1 + 24)), 24 * (v9 - *(_QWORD *)(a1 + 24)));
      return 1;
    }
  }
  return result;
}

- (void)clearCoverageExceptions
{
  self->_coverageExceptionsSpace = 0;
  self->_coverageExceptionsCount = 0;
  free(self->_coverageExceptions);
  self->_coverageExceptions = 0;
}

- (void)addCoverageException:(GEOCoverageException *)a3
{
  GEOCoverageException *v5;
  uint64_t v6;

  if (-[GEOCoverageExtent _reserveCoverageExceptions:]((uint64_t)self, 1uLL))
  {
    v5 = &self->_coverageExceptions[self->_coverageExceptionsCount];
    v6 = *(_QWORD *)&a3->var4;
    *(_OWORD *)&v5->var0 = *(_OWORD *)&a3->var0;
    *(_QWORD *)&v5->var4 = v6;
    ++self->_coverageExceptionsCount;
  }
}

- (GEOCoverageException)coverageExceptionAtIndex:(SEL)a3
{
  GEOCoverageException *v5;
  unint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  unint64_t v12;

  v5 = self;
  v7 = *(_QWORD *)&self[1].var0;
  if (v7 <= a4)
  {
    v8 = (void *)MEMORY[0x1E0C99DA0];
    v9 = *MEMORY[0x1E0C99858];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("idx (%tu) is out of range (%tu)"), a4, v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "exceptionWithName:reason:userInfo:", v9, v10, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "raise");

  }
  v12 = *(_QWORD *)&v5->var4 + 24 * a4;
  *(_OWORD *)&retstr->var0 = *(_OWORD *)v12;
  *(_QWORD *)&retstr->var4 = *(_QWORD *)(v12 + 16);
  return self;
}

- (void)setCoverageExceptions:(GEOCoverageException *)a3 count:(unint64_t)a4
{
  -[GEOCoverageExtent clearCoverageExceptions](self, "clearCoverageExceptions");
  if (-[GEOCoverageExtent _reserveCoverageExceptions:]((uint64_t)self, a4))
  {
    memcpy(self->_coverageExceptions, a3, 24 * a4);
    self->_coverageExceptionsCount = a4;
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
  v8.super_class = (Class)GEOCoverageExtent;
  -[GEOCoverageExtent description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOCoverageExtent dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOCoverageExtent _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  char v5;
  void *v6;
  void *v7;
  uint64_t v8;
  unint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  _QWORD v22[4];
  id v23;

  if (!a1)
    return 0;
  objc_msgSend((id)a1, "readAll:", 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(_BYTE *)(a1 + 60);
  if ((v5 & 4) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 48));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v18, CFSTR("minX"));

    v5 = *(_BYTE *)(a1 + 60);
    if ((v5 & 8) == 0)
    {
LABEL_4:
      if ((v5 & 1) == 0)
        goto LABEL_5;
      goto LABEL_21;
    }
  }
  else if ((*(_BYTE *)(a1 + 60) & 8) == 0)
  {
    goto LABEL_4;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 52));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v19, CFSTR("minY"));

  v5 = *(_BYTE *)(a1 + 60);
  if ((v5 & 1) == 0)
  {
LABEL_5:
    if ((v5 & 2) == 0)
      goto LABEL_6;
LABEL_22:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 44));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v21, CFSTR("maxY"));

    if ((*(_BYTE *)(a1 + 60) & 0x10) == 0)
      goto LABEL_8;
    goto LABEL_7;
  }
LABEL_21:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 40));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v20, CFSTR("maxX"));

  v5 = *(_BYTE *)(a1 + 60);
  if ((v5 & 2) != 0)
    goto LABEL_22;
LABEL_6:
  if ((v5 & 0x10) != 0)
  {
LABEL_7:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 56));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v6, CFSTR("zoom"));

  }
LABEL_8:
  if (*(_QWORD *)(a1 + 24))
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", *(_QWORD *)(a1 + 24));
    if (*(_QWORD *)(a1 + 24))
    {
      v8 = 0;
      v9 = 0;
      do
      {
        _GEOCoverageExceptionDictionaryRepresentation((unsigned int *)(*(_QWORD *)(a1 + 16) + v8));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "addObject:", v10);

        ++v9;
        v8 += 24;
      }
      while (v9 < *(_QWORD *)(a1 + 24));
    }
    objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("coverageException"));

  }
  v11 = *(void **)(a1 + 8);
  if (v11)
  {
    objc_msgSend(v11, "dictionaryRepresentation");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (a2)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v12, "count"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v22[0] = MEMORY[0x1E0C809B0];
      v22[1] = 3221225472;
      v22[2] = __47__GEOCoverageExtent__dictionaryRepresentation___block_invoke;
      v22[3] = &unk_1E1C00600;
      v15 = v14;
      v23 = v15;
      objc_msgSend(v13, "enumerateKeysAndObjectsUsingBlock:", v22);
      v16 = v15;

      v13 = v16;
    }
    objc_msgSend(v4, "setObject:forKey:", v13, CFSTR("Unknown Fields"));

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOCoverageExtent _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __47__GEOCoverageExtent__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (GEOCoverageExtent)initWithDictionary:(id)a3
{
  return (GEOCoverageExtent *)-[GEOCoverageExtent _initWithDictionary:isJSON:](self, a3);
}

- (void)_initWithDictionary:(void *)a1 isJSON:(void *)a2
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  __int128 v17;
  uint64_t v18;
  __int128 v19;
  uint64_t v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (a1)
  {
    a1 = (void *)objc_msgSend(a1, "init");
    if (a1)
    {
      objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("minX"));
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setMinX:", objc_msgSend(v4, "unsignedIntValue"));

      objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("minY"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setMinY:", objc_msgSend(v5, "unsignedIntValue"));

      objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("maxX"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setMaxX:", objc_msgSend(v6, "unsignedIntValue"));

      objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("maxY"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setMaxY:", objc_msgSend(v7, "unsignedIntValue"));

      objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("zoom"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setZoom:", objc_msgSend(v8, "unsignedIntValue"));

      objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("coverageException"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v23 = 0u;
        v24 = 0u;
        v21 = 0u;
        v22 = 0u;
        v10 = v9;
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
        if (v11)
        {
          v12 = v11;
          v13 = *(_QWORD *)v22;
          do
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
                v19 = 0uLL;
                v20 = 0;
                _GEOCoverageExceptionFromDictionaryRepresentation(v15, (uint64_t)&v19);
                v17 = v19;
                v18 = v20;
                objc_msgSend(a1, "addCoverageException:", &v17);
              }
              ++v14;
            }
            while (v12 != v14);
            v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
          }
          while (v12);
        }

      }
    }
  }

  return a1;
}

- (GEOCoverageExtent)initWithJSON:(id)a3
{
  return (GEOCoverageExtent *)-[GEOCoverageExtent _initWithDictionary:isJSON:](self, a3);
}

+ (BOOL)isValid:(id)a3
{
  return GEOCoverageExtentIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOCoverageExtentReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  char flags;
  uint64_t v6;
  unint64_t v7;

  v4 = a3;
  flags = (char)self->_flags;
  if ((flags & 4) != 0)
  {
    PBDataWriterWriteUint32Field();
    flags = (char)self->_flags;
    if ((flags & 8) == 0)
    {
LABEL_3:
      if ((flags & 1) == 0)
        goto LABEL_4;
      goto LABEL_13;
    }
  }
  else if ((*(_BYTE *)&self->_flags & 8) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint32Field();
  flags = (char)self->_flags;
  if ((flags & 1) == 0)
  {
LABEL_4:
    if ((flags & 2) == 0)
      goto LABEL_5;
    goto LABEL_14;
  }
LABEL_13:
  PBDataWriterWriteUint32Field();
  flags = (char)self->_flags;
  if ((flags & 2) == 0)
  {
LABEL_5:
    if ((flags & 0x10) == 0)
      goto LABEL_7;
    goto LABEL_6;
  }
LABEL_14:
  PBDataWriterWriteUint32Field();
  if ((*(_BYTE *)&self->_flags & 0x10) != 0)
LABEL_6:
    PBDataWriterWriteUint32Field();
LABEL_7:
  if (self->_coverageExceptionsCount)
  {
    v6 = 0;
    v7 = 0;
    do
    {
      PBDataWriterPlaceMark();
      GEOCoverageExceptionWriteTo((uint64_t)&self->_coverageExceptions[v6]);
      PBDataWriterRecallMark();
      ++v7;
      ++v6;
    }
    while (v7 < self->_coverageExceptionsCount);
  }
  -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4);

}

- (void)copyTo:(id)a3
{
  _DWORD *v4;
  char flags;
  unint64_t v6;
  unint64_t v7;
  uint64_t i;
  _BYTE v9[24];

  v4 = a3;
  -[GEOCoverageExtent readAll:](self, "readAll:", 0);
  flags = (char)self->_flags;
  if ((flags & 4) != 0)
  {
    v4[12] = self->_minX;
    *((_BYTE *)v4 + 60) |= 4u;
    flags = (char)self->_flags;
    if ((flags & 8) == 0)
    {
LABEL_3:
      if ((flags & 1) == 0)
        goto LABEL_4;
      goto LABEL_14;
    }
  }
  else if ((*(_BYTE *)&self->_flags & 8) == 0)
  {
    goto LABEL_3;
  }
  v4[13] = self->_minY;
  *((_BYTE *)v4 + 60) |= 8u;
  flags = (char)self->_flags;
  if ((flags & 1) == 0)
  {
LABEL_4:
    if ((flags & 2) == 0)
      goto LABEL_5;
LABEL_15:
    v4[11] = self->_maxY;
    *((_BYTE *)v4 + 60) |= 2u;
    if ((*(_BYTE *)&self->_flags & 0x10) == 0)
      goto LABEL_7;
    goto LABEL_6;
  }
LABEL_14:
  v4[10] = self->_maxX;
  *((_BYTE *)v4 + 60) |= 1u;
  flags = (char)self->_flags;
  if ((flags & 2) != 0)
    goto LABEL_15;
LABEL_5:
  if ((flags & 0x10) != 0)
  {
LABEL_6:
    v4[14] = self->_zoom;
    *((_BYTE *)v4 + 60) |= 0x10u;
  }
LABEL_7:
  if (-[GEOCoverageExtent coverageExceptionsCount](self, "coverageExceptionsCount"))
  {
    objc_msgSend(v4, "clearCoverageExceptions");
    v6 = -[GEOCoverageExtent coverageExceptionsCount](self, "coverageExceptionsCount");
    if (v6)
    {
      v7 = v6;
      for (i = 0; i != v7; ++i)
      {
        -[GEOCoverageExtent coverageExceptionAtIndex:](self, "coverageExceptionAtIndex:", i);
        objc_msgSend(v4, "addCoverageException:", v9);
      }
    }
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4;
  uint64_t v5;
  char flags;
  unint64_t coverageExceptionsCount;

  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5 = v4;
  flags = (char)self->_flags;
  if ((flags & 4) != 0)
  {
    *(_DWORD *)(v4 + 48) = self->_minX;
    *(_BYTE *)(v4 + 60) |= 4u;
    flags = (char)self->_flags;
    if ((flags & 8) == 0)
    {
LABEL_3:
      if ((flags & 1) == 0)
        goto LABEL_4;
      goto LABEL_12;
    }
  }
  else if ((*(_BYTE *)&self->_flags & 8) == 0)
  {
    goto LABEL_3;
  }
  *(_DWORD *)(v4 + 52) = self->_minY;
  *(_BYTE *)(v4 + 60) |= 8u;
  flags = (char)self->_flags;
  if ((flags & 1) == 0)
  {
LABEL_4:
    if ((flags & 2) == 0)
      goto LABEL_5;
    goto LABEL_13;
  }
LABEL_12:
  *(_DWORD *)(v4 + 40) = self->_maxX;
  *(_BYTE *)(v4 + 60) |= 1u;
  flags = (char)self->_flags;
  if ((flags & 2) == 0)
  {
LABEL_5:
    if ((flags & 0x10) == 0)
      goto LABEL_7;
    goto LABEL_6;
  }
LABEL_13:
  *(_DWORD *)(v4 + 44) = self->_maxY;
  *(_BYTE *)(v4 + 60) |= 2u;
  if ((*(_BYTE *)&self->_flags & 0x10) != 0)
  {
LABEL_6:
    *(_DWORD *)(v4 + 56) = self->_zoom;
    *(_BYTE *)(v4 + 60) |= 0x10u;
  }
LABEL_7:
  coverageExceptionsCount = self->_coverageExceptionsCount;
  if (coverageExceptionsCount)
  {
    -[GEOCoverageExtent _reserveCoverageExceptions:](v4, coverageExceptionsCount);
    memcpy(*(void **)(v5 + 16), self->_coverageExceptions, 24 * self->_coverageExceptionsCount);
    *(_QWORD *)(v5 + 24) = self->_coverageExceptionsCount;
  }
  objc_storeStrong((id *)(v5 + 8), self->_unknownFields);
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  const void **v4;
  unint64_t coverageExceptionsCount;
  BOOL v6;

  v4 = (const void **)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_29;
  -[GEOCoverageExtent readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  if ((*(_BYTE *)&self->_flags & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 60) & 4) == 0 || self->_minX != *((_DWORD *)v4 + 12))
      goto LABEL_29;
  }
  else if ((*((_BYTE *)v4 + 60) & 4) != 0)
  {
    goto LABEL_29;
  }
  if ((*(_BYTE *)&self->_flags & 8) != 0)
  {
    if ((*((_BYTE *)v4 + 60) & 8) == 0 || self->_minY != *((_DWORD *)v4 + 13))
      goto LABEL_29;
  }
  else if ((*((_BYTE *)v4 + 60) & 8) != 0)
  {
    goto LABEL_29;
  }
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 60) & 1) == 0 || self->_maxX != *((_DWORD *)v4 + 10))
      goto LABEL_29;
  }
  else if ((*((_BYTE *)v4 + 60) & 1) != 0)
  {
    goto LABEL_29;
  }
  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 60) & 2) == 0 || self->_maxY != *((_DWORD *)v4 + 11))
      goto LABEL_29;
  }
  else if ((*((_BYTE *)v4 + 60) & 2) != 0)
  {
    goto LABEL_29;
  }
  if ((*(_BYTE *)&self->_flags & 0x10) != 0)
  {
    if ((*((_BYTE *)v4 + 60) & 0x10) == 0 || self->_zoom != *((_DWORD *)v4 + 14))
      goto LABEL_29;
  }
  else if ((*((_BYTE *)v4 + 60) & 0x10) != 0)
  {
    goto LABEL_29;
  }
  coverageExceptionsCount = self->_coverageExceptionsCount;
  if ((const void *)coverageExceptionsCount != v4[3])
  {
LABEL_29:
    v6 = 0;
    goto LABEL_30;
  }
  v6 = memcmp(self->_coverageExceptions, v4[2], 24 * coverageExceptionsCount) == 0;
LABEL_30:

  return v6;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  -[GEOCoverageExtent readAll:](self, "readAll:", 1);
  if ((*(_BYTE *)&self->_flags & 4) != 0)
  {
    v3 = 2654435761 * self->_minX;
    if ((*(_BYTE *)&self->_flags & 8) != 0)
    {
LABEL_3:
      v4 = 2654435761 * self->_minY;
      if ((*(_BYTE *)&self->_flags & 1) != 0)
        goto LABEL_4;
      goto LABEL_9;
    }
  }
  else
  {
    v3 = 0;
    if ((*(_BYTE *)&self->_flags & 8) != 0)
      goto LABEL_3;
  }
  v4 = 0;
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
LABEL_4:
    v5 = 2654435761 * self->_maxX;
    if ((*(_BYTE *)&self->_flags & 2) != 0)
      goto LABEL_5;
LABEL_10:
    v6 = 0;
    if ((*(_BYTE *)&self->_flags & 0x10) != 0)
      goto LABEL_6;
LABEL_11:
    v7 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ PBHashBytes();
  }
LABEL_9:
  v5 = 0;
  if ((*(_BYTE *)&self->_flags & 2) == 0)
    goto LABEL_10;
LABEL_5:
  v6 = 2654435761 * self->_maxY;
  if ((*(_BYTE *)&self->_flags & 0x10) == 0)
    goto LABEL_11;
LABEL_6:
  v7 = 2654435761 * self->_zoom;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ PBHashBytes();
}

- (void)mergeFrom:(id)a3
{
  unsigned int *v4;
  char v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  _BYTE v9[24];

  v4 = (unsigned int *)a3;
  objc_msgSend(v4, "readAll:", 0);
  v5 = *((_BYTE *)v4 + 60);
  if ((v5 & 4) != 0)
  {
    self->_minX = v4[12];
    *(_BYTE *)&self->_flags |= 4u;
    v5 = *((_BYTE *)v4 + 60);
    if ((v5 & 8) == 0)
    {
LABEL_3:
      if ((v5 & 1) == 0)
        goto LABEL_4;
      goto LABEL_13;
    }
  }
  else if ((v4[15] & 8) == 0)
  {
    goto LABEL_3;
  }
  self->_minY = v4[13];
  *(_BYTE *)&self->_flags |= 8u;
  v5 = *((_BYTE *)v4 + 60);
  if ((v5 & 1) == 0)
  {
LABEL_4:
    if ((v5 & 2) == 0)
      goto LABEL_5;
    goto LABEL_14;
  }
LABEL_13:
  self->_maxX = v4[10];
  *(_BYTE *)&self->_flags |= 1u;
  v5 = *((_BYTE *)v4 + 60);
  if ((v5 & 2) == 0)
  {
LABEL_5:
    if ((v5 & 0x10) == 0)
      goto LABEL_7;
    goto LABEL_6;
  }
LABEL_14:
  self->_maxY = v4[11];
  *(_BYTE *)&self->_flags |= 2u;
  if ((v4[15] & 0x10) != 0)
  {
LABEL_6:
    self->_zoom = v4[14];
    *(_BYTE *)&self->_flags |= 0x10u;
  }
LABEL_7:
  v6 = objc_msgSend(v4, "coverageExceptionsCount");
  if (v6)
  {
    v7 = v6;
    for (i = 0; i != v7; ++i)
    {
      objc_msgSend(v4, "coverageExceptionAtIndex:", i);
      -[GEOCoverageExtent addCoverageException:](self, "addCoverageException:", v9);
    }
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
    -[GEOCoverageExtent readAll:](self, "readAll:", 0);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unknownFields, 0);
}

@end
