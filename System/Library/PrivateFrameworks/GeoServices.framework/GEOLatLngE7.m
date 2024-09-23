@implementation GEOLatLngE7

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unknownFields, 0);
}

- (id)dictionaryRepresentation
{
  return -[GEOLatLngE7 _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4;

  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *(_DWORD *)(v4 + 16) = self->_latE7;
  *(_DWORD *)(v4 + 20) = self->_lngE7;
  objc_storeStrong((id *)(v4 + 8), self->_unknownFields);
  return (id)v4;
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  _QWORD v14[4];
  id v15;

  if (!a1)
    return 0;
  objc_msgSend((id)a1, "readAll:", 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(a1 + 16));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v5, CFSTR("latE7"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(a1 + 20));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v6, CFSTR("lngE7"));

  v7 = *(void **)(a1 + 8);
  if (v7)
  {
    objc_msgSend(v7, "dictionaryRepresentation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (a2)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v8, "count"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v14[0] = MEMORY[0x1E0C809B0];
      v14[1] = 3221225472;
      v14[2] = __41__GEOLatLngE7__dictionaryRepresentation___block_invoke;
      v14[3] = &unk_1E1C00600;
      v11 = v10;
      v15 = v11;
      objc_msgSend(v9, "enumerateKeysAndObjectsUsingBlock:", v14);
      v12 = v11;

      v9 = v12;
    }
    objc_msgSend(v4, "setObject:forKey:", v9, CFSTR("Unknown Fields"));

  }
  return v4;
}

- (GEOLatLngE7)initWithLatLng:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;

  v4 = a3;
  objc_msgSend(v4, "lat");
  v6 = v5;
  objc_msgSend(v4, "lng");
  v8 = v7;

  return -[GEOLatLngE7 initWithLatitude:longitude:](self, "initWithLatitude:longitude:", v6, v8);
}

- (GEOLatLngE7)initWithE7Latitude:(int)a3 longitude:(int)a4
{
  uint64_t v4;
  uint64_t v5;
  GEOLatLngE7 *v6;
  GEOLatLngE7 *v7;
  GEOLatLngE7 *v8;
  objc_super v10;

  v4 = *(_QWORD *)&a4;
  v5 = *(_QWORD *)&a3;
  v10.receiver = self;
  v10.super_class = (Class)GEOLatLngE7;
  v6 = -[GEOLatLngE7 init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    -[GEOLatLngE7 setLatE7:](v6, "setLatE7:", v5);
    -[GEOLatLngE7 setLngE7:](v7, "setLngE7:", v4);
    v8 = v7;
  }

  return v7;
}

- (GEOLatLngE7)initWithLatitude:(double)a3 longitude:(double)a4
{
  GEOLatLngE7 *v6;
  GEOLatLngE7 *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)GEOLatLngE7;
  v6 = -[GEOLatLngE7 init](&v9, sel_init);
  if (v6)
  {
    -[GEOLatLngE7 setLatE7:](v6, "setLatE7:", +[GEOLatLngE7 toE7Coordinate:](GEOLatLngE7, "toE7Coordinate:", a3));
    -[GEOLatLngE7 setLngE7:](v6, "setLngE7:", +[GEOLatLngE7 toE7Coordinate:](GEOLatLngE7, "toE7Coordinate:", a4));
    v7 = v6;
  }

  return v6;
}

- ($F24F406B2B787EFB06265DBA3D28CBD5)coordinate
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  $F24F406B2B787EFB06265DBA3D28CBD5 result;

  +[GEOLatLngE7 fromE7Coordinate:](GEOLatLngE7, "fromE7Coordinate:", -[GEOLatLngE7 latE7](self, "latE7"));
  v4 = v3;
  +[GEOLatLngE7 fromE7Coordinate:](GEOLatLngE7, "fromE7Coordinate:", -[GEOLatLngE7 lngE7](self, "lngE7"));
  v6 = v5;
  v7 = v4;
  result.var1 = v6;
  result.var0 = v7;
  return result;
}

- (GEOLatLng)latLng
{
  GEOLatLng *v3;

  v3 = [GEOLatLng alloc];
  -[GEOLatLngE7 coordinate](self, "coordinate");
  return -[GEOLatLng initWithCoordinate:](v3, "initWithCoordinate:");
}

+ (double)fromE7Coordinate:(int)a3
{
  return (double)a3 * 0.0000001;
}

+ (int)toE7Coordinate:(double)a3
{
  return (int)(a3 * 10000000.0);
}

- (int)latE7
{
  return self->_latE7;
}

- (void)setLatE7:(int)a3
{
  self->_latE7 = a3;
}

- (int)lngE7
{
  return self->_lngE7;
}

- (void)setLngE7:(int)a3
{
  self->_lngE7 = a3;
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
  v8.super_class = (Class)GEOLatLngE7;
  -[GEOLatLngE7 description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOLatLngE7 dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)jsonRepresentation
{
  return -[GEOLatLngE7 _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __41__GEOLatLngE7__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (GEOLatLngE7)initWithDictionary:(id)a3
{
  return (GEOLatLngE7 *)-[GEOLatLngE7 _initWithDictionary:isJSON:](self, a3);
}

- (void)_initWithDictionary:(void *)a1 isJSON:(void *)a2
{
  id v3;
  void *v4;
  void *v5;

  v3 = a2;
  if (a1)
  {
    a1 = (void *)objc_msgSend(a1, "init");
    if (a1)
    {
      objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("latE7"));
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setLatE7:", objc_msgSend(v4, "intValue"));

      objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("lngE7"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setLngE7:", objc_msgSend(v5, "intValue"));

    }
  }

  return a1;
}

- (GEOLatLngE7)initWithJSON:(id)a3
{
  return (GEOLatLngE7 *)-[GEOLatLngE7 _initWithDictionary:isJSON:](self, a3);
}

+ (BOOL)isValid:(id)a3
{
  return GEOLatLngE7IsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOLatLngE7ReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  id v4;

  v4 = a3;
  PBDataWriterWriteSfixed32Field();
  PBDataWriterWriteSfixed32Field();
  -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4);

}

- (void)copyTo:(id)a3
{
  _DWORD *v4;

  v4 = a3;
  -[GEOLatLngE7 readAll:](self, "readAll:", 0);
  v4[4] = self->_latE7;
  v4[5] = self->_lngE7;

}

- (BOOL)isEqual:(id)a3
{
  _DWORD *v4;
  BOOL v5;

  v4 = a3;
  v5 = objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && (-[GEOLatLngE7 readAll:](self, "readAll:", 1), objc_msgSend(v4, "readAll:", 1), self->_latE7 == v4[4])
    && self->_lngE7 == v4[5];

  return v5;
}

- (unint64_t)hash
{
  -[GEOLatLngE7 readAll:](self, "readAll:", 1);
  return (2654435761 * self->_lngE7) ^ (2654435761 * self->_latE7);
}

- (void)mergeFrom:(id)a3
{
  int *v4;
  int v5;

  v4 = (int *)a3;
  objc_msgSend(v4, "readAll:", 0);
  self->_latE7 = v4[4];
  v5 = v4[5];

  self->_lngE7 = v5;
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
    -[GEOLatLngE7 readAll:](self, "readAll:", 0);
}

@end
