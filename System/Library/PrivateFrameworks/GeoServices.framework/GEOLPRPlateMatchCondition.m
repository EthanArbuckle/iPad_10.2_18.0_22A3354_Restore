@implementation GEOLPRPlateMatchCondition

- (NSMutableArray)patterns
{
  return self->_patterns;
}

- (void)setPatterns:(id)a3
{
  objc_storeStrong((id *)&self->_patterns, a3);
}

- (void)clearPatterns
{
  -[NSMutableArray removeAllObjects](self->_patterns, "removeAllObjects");
}

- (void)addPatterns:(id)a3
{
  id v4;
  NSMutableArray *patterns;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  patterns = self->_patterns;
  v8 = v4;
  if (!patterns)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_patterns;
    self->_patterns = v6;

    v4 = v8;
    patterns = self->_patterns;
  }
  -[NSMutableArray addObject:](patterns, "addObject:", v4);

}

- (unint64_t)patternsCount
{
  return -[NSMutableArray count](self->_patterns, "count");
}

- (id)patternsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_patterns, "objectAtIndex:", a3);
}

+ (Class)patternsType
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
  v8.super_class = (Class)GEOLPRPlateMatchCondition;
  -[GEOLPRPlateMatchCondition description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOLPRPlateMatchCondition dictionaryRepresentation](self, "dictionaryRepresentation");
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
    if (a1[1])
    {
      objc_msgSend(a1, "patterns");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "setObject:forKey:", v3, CFSTR("patterns"));

    }
  }
  else
  {
    v2 = 0;
  }
  return v2;
}

- (GEOLPRPlateMatchCondition)initWithDictionary:(id)a3
{
  return (GEOLPRPlateMatchCondition *)-[GEOLPRPlateMatchCondition _initWithDictionary:isJSON:](self, a3);
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
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (a1)
  {
    a1 = (void *)objc_msgSend(a1, "init");
    if (a1)
    {
      objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("patterns"));
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v15 = 0u;
        v16 = 0u;
        v13 = 0u;
        v14 = 0u;
        v5 = v4;
        v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
        if (v6)
        {
          v7 = v6;
          v8 = *(_QWORD *)v14;
          do
          {
            v9 = 0;
            do
            {
              if (*(_QWORD *)v14 != v8)
                objc_enumerationMutation(v5);
              v10 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * v9);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v11 = (void *)objc_msgSend(v10, "copy", (_QWORD)v13);
                objc_msgSend(a1, "addPatterns:", v11);

              }
              ++v9;
            }
            while (v7 != v9);
            v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
          }
          while (v7);
        }

      }
    }
  }

  return a1;
}

- (GEOLPRPlateMatchCondition)initWithJSON:(id)a3
{
  return (GEOLPRPlateMatchCondition *)-[GEOLPRPlateMatchCondition _initWithDictionary:isJSON:](self, a3);
}

+ (BOOL)isValid:(id)a3
{
  return GEOLPRPlateMatchConditionIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOLPRPlateMatchConditionReadAllFrom(self, a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = self->_patterns;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        PBDataWriterWriteStringField();
        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

- (void)copyTo:(id)a3
{
  unint64_t v4;
  unint64_t v5;
  uint64_t i;
  void *v7;
  id v8;

  v8 = a3;
  -[GEOLPRPlateMatchCondition readAll:](self, "readAll:", 0);
  if (-[GEOLPRPlateMatchCondition patternsCount](self, "patternsCount"))
  {
    objc_msgSend(v8, "clearPatterns");
    v4 = -[GEOLPRPlateMatchCondition patternsCount](self, "patternsCount");
    if (v4)
    {
      v5 = v4;
      for (i = 0; i != v5; ++i)
      {
        -[GEOLPRPlateMatchCondition patternsAtIndex:](self, "patternsAtIndex:", i);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "addPatterns:", v7);

      }
    }
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v5;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v6 = self->_patterns;
  v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v6);
        v11 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v10), "copyWithZone:", a3, (_QWORD)v13);
        objc_msgSend(v5, "addPatterns:", v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  char v5;
  NSMutableArray *patterns;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
  {
    v5 = 1;
    -[GEOLPRPlateMatchCondition readAll:](self, "readAll:", 1);
    objc_msgSend(v4, "readAll:", 1);
    patterns = self->_patterns;
    if ((unint64_t)patterns | v4[1])
      v5 = -[NSMutableArray isEqual:](patterns, "isEqual:");
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (unint64_t)hash
{
  -[GEOLPRPlateMatchCondition readAll:](self, "readAll:", 1);
  return -[NSMutableArray hash](self->_patterns, "hash");
}

- (void)mergeFrom:(id)a3
{
  id *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = (id *)a3;
  objc_msgSend(v4, "readAll:", 0);
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v5 = v4[1];
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        -[GEOLPRPlateMatchCondition addPatterns:](self, "addPatterns:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v9++), (_QWORD)v10);
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_patterns, 0);
}

@end
