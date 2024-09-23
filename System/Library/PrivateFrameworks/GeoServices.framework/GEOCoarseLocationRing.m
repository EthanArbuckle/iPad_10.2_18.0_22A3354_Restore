@implementation GEOCoarseLocationRing

- (unint64_t)pointsCount
{
  return self->_pointsCount;
}

- (GEOCoarseLocationPoint)pointsAtIndex:(unint64_t)a3
{
  unint64_t pointsCount;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;

  pointsCount = self->_pointsCount;
  if (pointsCount <= a3)
  {
    v6 = (void *)MEMORY[0x1E0C99DA0];
    v7 = *MEMORY[0x1E0C99858];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("idx (%tu) is out of range (%tu)"), a3, pointsCount);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "exceptionWithName:reason:userInfo:", v7, v8, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "raise");

  }
  return self->_points[a3];
}

- (uint64_t)_reservePoints:(uint64_t)a1
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
    v4 = *(_QWORD *)(a1 + 16);
    v5 = v4 + a2;
    if (v4 + a2 <= v4)
      return 0;
    v6 = *(_QWORD *)(a1 + 24);
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
    if (8 * v9 < v9)
      return 0;
    result = (uint64_t)malloc_type_realloc(*(void **)(a1 + 8), 8 * v9, 0x4AC541B6uLL);
    if (result)
    {
      *(_QWORD *)(a1 + 24) = v9;
      *(_QWORD *)(a1 + 8) = result;
      bzero((void *)(result + 8 * *(_QWORD *)(a1 + 16)), 8 * (v9 - *(_QWORD *)(a1 + 16)));
      return 1;
    }
  }
  return result;
}

- (void)dealloc
{
  objc_super v3;

  -[GEOCoarseLocationRing clearPoints](self, "clearPoints");
  v3.receiver = self;
  v3.super_class = (Class)GEOCoarseLocationRing;
  -[GEOCoarseLocationRing dealloc](&v3, sel_dealloc);
}

- (void)clearPoints
{
  self->_pointsSpace = 0;
  self->_pointsCount = 0;
  free(self->_points);
  self->_points = 0;
}

- (GEOCoarseLocationPoint)points
{
  return self->_points;
}

- (void)addPoints:(GEOCoarseLocationPoint)a3
{
  if (-[GEOCoarseLocationRing _reservePoints:]((uint64_t)self, 1uLL))
    self->_points[self->_pointsCount++] = a3;
}

- (void)setPoints:(GEOCoarseLocationPoint *)a3 count:(unint64_t)a4
{
  -[GEOCoarseLocationRing clearPoints](self, "clearPoints");
  if (-[GEOCoarseLocationRing _reservePoints:]((uint64_t)self, a4))
  {
    memcpy(self->_points, a3, 8 * a4);
    self->_pointsCount = a4;
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
  v8.super_class = (Class)GEOCoarseLocationRing;
  -[GEOCoarseLocationRing description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOCoarseLocationRing dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_dictionaryRepresentation:(_QWORD *)a1
{
  void *v2;
  void *v3;
  uint64_t v4;
  unint64_t v5;
  void *v6;

  if (a1)
  {
    objc_msgSend(a1, "readAll:", 1);
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    if (a1[2])
    {
      v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", a1[2]);
      if (a1[2])
      {
        v4 = 0;
        v5 = 0;
        do
        {
          _GEOCoarseLocationPointDictionaryRepresentation((unsigned int *)(a1[1] + v4));
          v6 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "addObject:", v6);

          ++v5;
          v4 += 8;
        }
        while (v5 < a1[2]);
      }
      objc_msgSend(v2, "setObject:forKey:", v3, CFSTR("points"));

    }
  }
  else
  {
    v2 = 0;
  }
  return v2;
}

- (GEOCoarseLocationRing)initWithDictionary:(id)a3
{
  return (GEOCoarseLocationRing *)-[GEOCoarseLocationRing _initWithDictionary:isJSON:](self, a3);
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
  uint64_t v12;
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
      objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("points"));
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
                v12 = 0;
                _GEOCoarseLocationPointFromDictionaryRepresentation(v10, &v12);
                objc_msgSend(a1, "addPoints:", v12);
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

- (GEOCoarseLocationRing)initWithJSON:(id)a3
{
  return (GEOCoarseLocationRing *)-[GEOCoarseLocationRing _initWithDictionary:isJSON:](self, a3);
}

+ (BOOL)isValid:(id)a3
{
  return GEOCoarseLocationRingIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOCoarseLocationRingReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  uint64_t v5;
  unint64_t v6;

  v4 = a3;
  if (self->_pointsCount)
  {
    v5 = 0;
    v6 = 0;
    do
    {
      PBDataWriterPlaceMark();
      PBDataWriterWriteSint32Field();
      PBDataWriterWriteSint32Field();
      PBDataWriterRecallMark();
      ++v6;
      v5 += 8;
    }
    while (v6 < self->_pointsCount);
  }

}

- (void)copyTo:(id)a3
{
  unint64_t v4;
  unint64_t v5;
  uint64_t i;
  id v7;

  v7 = a3;
  -[GEOCoarseLocationRing readAll:](self, "readAll:", 0);
  if (-[GEOCoarseLocationRing pointsCount](self, "pointsCount"))
  {
    objc_msgSend(v7, "clearPoints");
    v4 = -[GEOCoarseLocationRing pointsCount](self, "pointsCount");
    if (v4)
    {
      v5 = v4;
      for (i = 0; i != v5; ++i)
        objc_msgSend(v7, "addPoints:", -[GEOCoarseLocationRing pointsAtIndex:](self, "pointsAtIndex:", i));
    }
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4;
  uint64_t v5;
  unint64_t pointsCount;

  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5 = v4;
  pointsCount = self->_pointsCount;
  if (pointsCount)
  {
    -[GEOCoarseLocationRing _reservePoints:](v4, pointsCount);
    memcpy(*(void **)(v5 + 8), self->_points, 8 * self->_pointsCount);
    *(_QWORD *)(v5 + 16) = self->_pointsCount;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  const void **v4;
  unint64_t pointsCount;
  BOOL v6;

  v4 = (const void **)a3;
  v6 = objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && (-[GEOCoarseLocationRing readAll:](self, "readAll:", 1),
        objc_msgSend(v4, "readAll:", 1),
        pointsCount = self->_pointsCount,
        (const void *)pointsCount == v4[2])
    && memcmp(self->_points, v4[1], 8 * pointsCount) == 0;

  return v6;
}

- (unint64_t)hash
{
  -[GEOCoarseLocationRing readAll:](self, "readAll:", 1);
  return PBHashBytes();
}

- (void)mergeFrom:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  id v7;

  v7 = a3;
  objc_msgSend(v7, "readAll:", 0);
  v4 = objc_msgSend(v7, "pointsCount");
  if (v4)
  {
    v5 = v4;
    for (i = 0; i != v5; ++i)
      -[GEOCoarseLocationRing addPoints:](self, "addPoints:", objc_msgSend(v7, "pointsAtIndex:", i));
  }

}

@end
