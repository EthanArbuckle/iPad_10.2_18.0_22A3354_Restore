@implementation GEOPDStorefrontFeature

- (int)type
{
  if ((*(_BYTE *)&self->_flags & 1) != 0)
    return self->_type;
  else
    return 0;
}

- (void)setType:(int)a3
{
  *(_BYTE *)&self->_flags |= 1u;
  self->_type = a3;
}

- (void)setHasType:(BOOL)a3
{
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFE | a3;
}

- (BOOL)hasType
{
  return *(_BYTE *)&self->_flags & 1;
}

- (id)typeAsString:(int)a3
{
  __CFString *v3;

  if (a3 < 6 && ((0x37u >> a3) & 1) != 0)
  {
    v3 = off_1E1C08B88[a3];
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (int)StringAsType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("POI_UNSPECIFIED")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("POI_SIGN")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("POI_BUILDING_FACE_WITH_ENTRY")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("POI_ENTRY")) & 1) != 0)
  {
    v4 = 5;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("POI_OTHER_BUILDING_FACE")))
  {
    v4 = 4;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (BOOL)hasGeometry
{
  return self->_geometry != 0;
}

- (GEOPDOrientedBoundingBox)geometry
{
  return self->_geometry;
}

- (void)setGeometry:(id)a3
{
  objc_storeStrong((id *)&self->_geometry, a3);
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
  v8.super_class = (Class)GEOPDStorefrontFeature;
  -[GEOPDStorefrontFeature description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPDStorefrontFeature dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDStorefrontFeature _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  uint64_t v5;
  __CFString *v6;
  void *v7;
  void *v8;
  void *v9;

  if (a1)
  {
    objc_msgSend((id)a1, "readAll:", 1);
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if ((*(_BYTE *)(a1 + 20) & 1) != 0)
    {
      v5 = *(int *)(a1 + 16);
      if (v5 < 6 && ((0x37u >> v5) & 1) != 0)
      {
        v6 = off_1E1C08B88[v5];
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 16));
        v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v4, "setObject:forKey:", v6, CFSTR("type"));

    }
    objc_msgSend((id)a1, "geometry");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7)
    {
      if ((a2 & 1) != 0)
        objc_msgSend(v7, "jsonRepresentation");
      else
        objc_msgSend(v7, "dictionaryRepresentation");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKey:", v9, CFSTR("geometry"));

    }
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOPDStorefrontFeature _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEOPDStorefrontFeature)initWithDictionary:(id)a3
{
  return (GEOPDStorefrontFeature *)-[GEOPDStorefrontFeature _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(char)a3 isJSON:
{
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;
  GEOPDOrientedBoundingBox *v10;
  uint64_t v11;
  void *v12;

  v5 = a2;
  if (!a1)
    goto LABEL_25;
  a1 = (void *)objc_msgSend(a1, "init");
  if (!a1)
    goto LABEL_25;
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("type"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7 = v6;
    if ((objc_msgSend(v7, "isEqualToString:", CFSTR("POI_UNSPECIFIED")) & 1) != 0)
    {
      v8 = 0;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("POI_SIGN")) & 1) != 0)
    {
      v8 = 1;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("POI_BUILDING_FACE_WITH_ENTRY")) & 1) != 0)
    {
      v8 = 2;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("POI_ENTRY")) & 1) != 0)
    {
      v8 = 5;
    }
    else if (objc_msgSend(v7, "isEqualToString:", CFSTR("POI_OTHER_BUILDING_FACE")))
    {
      v8 = 4;
    }
    else
    {
      v8 = 0;
    }

    goto LABEL_18;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = objc_msgSend(v6, "intValue");
LABEL_18:
    objc_msgSend(a1, "setType:", v8);
  }

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("geometry"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v10 = [GEOPDOrientedBoundingBox alloc];
    if ((a3 & 1) != 0)
      v11 = -[GEOPDOrientedBoundingBox initWithJSON:](v10, "initWithJSON:", v9);
    else
      v11 = -[GEOPDOrientedBoundingBox initWithDictionary:](v10, "initWithDictionary:", v9);
    v12 = (void *)v11;
    objc_msgSend(a1, "setGeometry:", v11);

  }
LABEL_25:

  return a1;
}

- (GEOPDStorefrontFeature)initWithJSON:(id)a3
{
  return (GEOPDStorefrontFeature *)-[GEOPDStorefrontFeature _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEOPDStorefrontFeatureIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDStorefrontFeatureReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    PBDataWriterWriteInt32Field();
    v4 = v5;
  }
  if (self->_geometry)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }

}

- (void)copyTo:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[GEOPDStorefrontFeature readAll:](self, "readAll:", 0);
  v4 = v5;
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    *((_DWORD *)v5 + 4) = self->_type;
    *((_BYTE *)v5 + 20) |= 1u;
  }
  if (self->_geometry)
  {
    objc_msgSend(v5, "setGeometry:");
    v4 = v5;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  _QWORD *v6;
  id v7;
  void *v8;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = (_QWORD *)v5;
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    *(_DWORD *)(v5 + 16) = self->_type;
    *(_BYTE *)(v5 + 20) |= 1u;
  }
  v7 = -[GEOPDOrientedBoundingBox copyWithZone:](self->_geometry, "copyWithZone:", a3);
  v8 = (void *)v6[1];
  v6[1] = v7;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  GEOPDOrientedBoundingBox *geometry;
  char v6;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_9;
  -[GEOPDStorefrontFeature readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 20) & 1) == 0 || self->_type != *((_DWORD *)v4 + 4))
      goto LABEL_9;
  }
  else if ((*((_BYTE *)v4 + 20) & 1) != 0)
  {
LABEL_9:
    v6 = 0;
    goto LABEL_10;
  }
  geometry = self->_geometry;
  if ((unint64_t)geometry | *((_QWORD *)v4 + 1))
    v6 = -[GEOPDOrientedBoundingBox isEqual:](geometry, "isEqual:");
  else
    v6 = 1;
LABEL_10:

  return v6;
}

- (unint64_t)hash
{
  uint64_t v3;

  -[GEOPDStorefrontFeature readAll:](self, "readAll:", 1);
  if ((*(_BYTE *)&self->_flags & 1) != 0)
    v3 = 2654435761 * self->_type;
  else
    v3 = 0;
  return -[GEOPDOrientedBoundingBox hash](self->_geometry, "hash") ^ v3;
}

- (void)mergeFrom:(id)a3
{
  int *v4;
  GEOPDOrientedBoundingBox *geometry;
  uint64_t v6;
  int *v7;

  v7 = (int *)a3;
  objc_msgSend(v7, "readAll:", 0);
  v4 = v7;
  if ((v7[5] & 1) != 0)
  {
    self->_type = v7[4];
    *(_BYTE *)&self->_flags |= 1u;
  }
  geometry = self->_geometry;
  v6 = *((_QWORD *)v7 + 1);
  if (geometry)
  {
    if (v6)
    {
      -[GEOPDOrientedBoundingBox mergeFrom:](geometry, "mergeFrom:");
LABEL_8:
      v4 = v7;
    }
  }
  else if (v6)
  {
    -[GEOPDStorefrontFeature setGeometry:](self, "setGeometry:");
    goto LABEL_8;
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_geometry, 0);
}

@end
