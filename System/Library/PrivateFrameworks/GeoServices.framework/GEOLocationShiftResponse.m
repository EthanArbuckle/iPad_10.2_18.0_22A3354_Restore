@implementation GEOLocationShiftResponse

- (GEOPixelPoint)shiftedPixel
{
  *retstr = *(GEOPixelPoint *)&self->_y;
  return self;
}

- (void)setShiftedPixel:(GEOPixelPoint *)a3
{
  uint64_t v3;

  v3 = *(_QWORD *)&a3->_z;
  *(_OWORD *)&self->_shiftedPixel._x = *(_OWORD *)&a3->_x;
  *(_QWORD *)&self->_shiftedPixel._z = v3;
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
  v8.super_class = (Class)GEOLocationShiftResponse;
  -[GEOLocationShiftResponse description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOLocationShiftResponse dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_dictionaryRepresentation:(void *)a1
{
  void *v2;
  void *v3;

  if (a1)
  {
    objc_msgSend(a1, "readAll:", 1);
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    _GEOPixelPointDictionaryRepresentation((uint64_t)a1 + 8);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setObject:forKey:", v3, CFSTR("shiftedPixel"));

  }
  else
  {
    v2 = 0;
  }
  return v2;
}

- (GEOLocationShiftResponse)initWithDictionary:(id)a3
{
  return (GEOLocationShiftResponse *)-[GEOLocationShiftResponse _initWithDictionary:isJSON:](self, a3);
}

- (void)_initWithDictionary:(void *)a1 isJSON:(void *)a2
{
  id v3;
  void *v4;
  __int128 v6;
  uint64_t v7;
  __int128 v8;
  uint64_t v9;

  v3 = a2;
  if (a1)
  {
    a1 = (void *)objc_msgSend(a1, "init");
    if (a1)
    {
      objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("shiftedPixel"));
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v8 = 0uLL;
        v9 = 0;
        _GEOPixelPointFromDictionaryRepresentation(v4, (uint64_t)&v8);
        v6 = v8;
        v7 = v9;
        objc_msgSend(a1, "setShiftedPixel:", &v6);
      }

    }
  }

  return a1;
}

- (GEOLocationShiftResponse)initWithJSON:(id)a3
{
  return (GEOLocationShiftResponse *)-[GEOLocationShiftResponse _initWithDictionary:isJSON:](self, a3);
}

+ (BOOL)isValid:(id)a3
{
  return GEOLocationShiftResponseIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOLocationShiftResponseReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  id v4;

  v4 = a3;
  PBDataWriterPlaceMark();
  GEOPixelPointWriteTo((uint64_t)&self->_shiftedPixel);
  PBDataWriterRecallMark();

}

- (void)copyTo:(id)a3
{
  uint64_t v4;
  char *v5;

  v5 = (char *)a3;
  -[GEOLocationShiftResponse readAll:](self, "readAll:", 0);
  v4 = *(_QWORD *)&self->_shiftedPixel._z;
  *(_OWORD *)(v5 + 8) = *(_OWORD *)&self->_shiftedPixel._x;
  *((_QWORD *)v5 + 3) = v4;

}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;
  uint64_t v5;

  result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5 = *(_QWORD *)&self->_shiftedPixel._z;
  *(_OWORD *)((char *)result + 8) = *(_OWORD *)&self->_shiftedPixel._x;
  *((_QWORD *)result + 3) = v5;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  BOOL v7;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
  {
    -[GEOLocationShiftResponse readAll:](self, "readAll:", 1);
    objc_msgSend(v4, "readAll:", 1);
    v7 = *(_QWORD *)&self->_shiftedPixel._x == v4[1]
      && *(_QWORD *)&self->_shiftedPixel._y == v4[2]
      && *(_QWORD *)&self->_shiftedPixel._z == v4[3];
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  -[GEOLocationShiftResponse readAll:](self, "readAll:", 1);
  return PBHashBytes();
}

- (void)mergeFrom:(id)a3
{
  uint64_t v4;
  char *v5;

  v5 = (char *)a3;
  objc_msgSend(v5, "readAll:", 0);
  v4 = *((_QWORD *)v5 + 3);
  *(_OWORD *)&self->_shiftedPixel._x = *(_OWORD *)(v5 + 8);
  *(_QWORD *)&self->_shiftedPixel._z = v4;

}

@end
