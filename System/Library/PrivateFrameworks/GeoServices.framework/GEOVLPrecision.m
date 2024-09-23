@implementation GEOVLPrecision

- (void)dealloc
{
  objc_super v3;

  PBRepeatedUInt32Clear();
  v3.receiver = self;
  v3.super_class = (Class)GEOVLPrecision;
  -[GEOVLPrecision dealloc](&v3, sel_dealloc);
}

- (unint64_t)precisionsCount
{
  return self->_precisions.count;
}

- (unsigned)precisions
{
  return self->_precisions.list;
}

- (void)clearPrecisions
{
  PBRepeatedUInt32Clear();
}

- (void)addPrecisions:(unsigned int)a3
{
  PBRepeatedUInt32Add();
}

- (unsigned)precisionsAtIndex:(unint64_t)a3
{
  $1729E44CE8A3ADE0AA70C2F19EF2BB02 *p_precisions;
  unint64_t count;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;

  p_precisions = &self->_precisions;
  count = self->_precisions.count;
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
  return p_precisions->list[a3];
}

- (void)setPrecisions:(unsigned int *)a3 count:(unint64_t)a4
{
  PBRepeatedUInt32Set();
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
  v8.super_class = (Class)GEOVLPrecision;
  -[GEOVLPrecision description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOVLPrecision dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_dictionaryRepresentation:(_QWORD *)a1
{
  void *v2;
  void *v3;

  if (a1)
  {
    objc_msgSend(a1, "readAll:", 1);
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    if (a1[2])
    {
      PBRepeatedUInt32NSArray();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "setObject:forKey:", v3, CFSTR("precisions"));

    }
  }
  else
  {
    v2 = 0;
  }
  return v2;
}

- (GEOVLPrecision)initWithDictionary:(id)a3
{
  return (GEOVLPrecision *)-[GEOVLPrecision _initWithDictionary:isJSON:](self, a3);
}

- (void)_initWithDictionary:(void *)a1 isJSON:(void *)a2
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (a1)
  {
    a1 = (void *)objc_msgSend(a1, "init");
    if (a1)
    {
      objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("precisions"));
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v14 = 0u;
        v15 = 0u;
        v12 = 0u;
        v13 = 0u;
        v5 = v4;
        v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
        if (v6)
        {
          v7 = v6;
          v8 = *(_QWORD *)v13;
          do
          {
            v9 = 0;
            do
            {
              if (*(_QWORD *)v13 != v8)
                objc_enumerationMutation(v5);
              v10 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * v9);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
                objc_msgSend(a1, "addPrecisions:", objc_msgSend(v10, "unsignedIntValue", (_QWORD)v12));
              ++v9;
            }
            while (v7 != v9);
            v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
          }
          while (v7);
        }

      }
    }
  }

  return a1;
}

- (GEOVLPrecision)initWithJSON:(id)a3
{
  return (GEOVLPrecision *)-[GEOVLPrecision _initWithDictionary:isJSON:](self, a3);
}

+ (BOOL)isValid:(id)a3
{
  return GEOVLPrecisionIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOVLPrecisionReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  $1729E44CE8A3ADE0AA70C2F19EF2BB02 *p_precisions;
  unint64_t v4;

  p_precisions = &self->_precisions;
  if (self->_precisions.count)
  {
    v4 = 0;
    do
    {
      PBDataWriterWriteUint32Field();
      ++v4;
    }
    while (v4 < p_precisions->count);
  }
}

- (void)copyTo:(id)a3
{
  unint64_t v4;
  unint64_t v5;
  uint64_t i;
  id v7;

  v7 = a3;
  -[GEOVLPrecision readAll:](self, "readAll:", 0);
  if (-[GEOVLPrecision precisionsCount](self, "precisionsCount"))
  {
    objc_msgSend(v7, "clearPrecisions");
    v4 = -[GEOVLPrecision precisionsCount](self, "precisionsCount");
    if (v4)
    {
      v5 = v4;
      for (i = 0; i != v5; ++i)
        objc_msgSend(v7, "addPrecisions:", -[GEOVLPrecision precisionsAtIndex:](self, "precisionsAtIndex:", i));
    }
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v3;

  v3 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  PBRepeatedUInt32Copy();
  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  char IsEqual;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
  {
    -[GEOVLPrecision readAll:](self, "readAll:", 1);
    objc_msgSend(v4, "readAll:", 1);
    IsEqual = PBRepeatedUInt32IsEqual();
  }
  else
  {
    IsEqual = 0;
  }

  return IsEqual;
}

- (unint64_t)hash
{
  -[GEOVLPrecision readAll:](self, "readAll:", 1);
  return PBRepeatedUInt32Hash();
}

- (void)mergeFrom:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  id v7;

  v7 = a3;
  objc_msgSend(v7, "readAll:", 0);
  v4 = objc_msgSend(v7, "precisionsCount");
  if (v4)
  {
    v5 = v4;
    for (i = 0; i != v5; ++i)
      -[GEOVLPrecision addPrecisions:](self, "addPrecisions:", objc_msgSend(v7, "precisionsAtIndex:", i));
  }

}

@end
