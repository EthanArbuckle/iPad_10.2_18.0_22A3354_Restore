@implementation GEONamedFeature

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_storeStrong((id *)&self->_name, a3);
}

- (double)value
{
  return self->_value;
}

- (void)setValue:(double)a3
{
  self->_value = a3;
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
  v8.super_class = (Class)GEONamedFeature;
  -[GEONamedFeature description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEONamedFeature dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEONamedFeature _dictionaryRepresentation:]((uint64_t)self, 0);
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
  objc_msgSend((id)a1, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    objc_msgSend(v4, "setObject:forKey:", v5, CFSTR("name"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 24));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v6, CFSTR("value"));

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
      v14[2] = __45__GEONamedFeature__dictionaryRepresentation___block_invoke;
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

- (id)jsonRepresentation
{
  return -[GEONamedFeature _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __45__GEONamedFeature__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (GEONamedFeature)initWithDictionary:(id)a3
{
  return (GEONamedFeature *)-[GEONamedFeature _initWithDictionary:isJSON:](self, a3);
}

- (void)_initWithDictionary:(void *)a1 isJSON:(void *)a2
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a2;
  if (a1)
  {
    a1 = (void *)objc_msgSend(a1, "init");
    if (a1)
    {
      objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("name"));
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v5 = (void *)objc_msgSend(v4, "copy");
        objc_msgSend(a1, "setName:", v5);

      }
      objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("value"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v6, "doubleValue");
        objc_msgSend(a1, "setValue:");
      }

    }
  }

  return a1;
}

- (GEONamedFeature)initWithJSON:(id)a3
{
  return (GEONamedFeature *)-[GEONamedFeature _initWithDictionary:isJSON:](self, a3);
}

+ (BOOL)isValid:(id)a3
{
  return GEONamedFeatureIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEONamedFeatureReadAllFrom(self, a3);
}

- (void)writeTo:(id)a3
{
  id v4;

  v4 = a3;
  PBDataWriterWriteStringField();
  PBDataWriterWriteDoubleField();
  -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4);

}

- (void)copyTo:(id)a3
{
  double *v4;

  v4 = (double *)a3;
  -[GEONamedFeature readAll:](self, "readAll:", 0);
  objc_msgSend(v4, "setName:", self->_name);
  v4[3] = self->_value;

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_name, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v6;

  *(double *)(v5 + 24) = self->_value;
  objc_storeStrong((id *)(v5 + 8), self->_unknownFields);
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *name;
  BOOL v6;

  v4 = a3;
  v6 = objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((-[GEONamedFeature readAll:](self, "readAll:", 1),
         objc_msgSend(v4, "readAll:", 1),
         name = self->_name,
         !((unint64_t)name | *((_QWORD *)v4 + 2)))
     || -[NSString isEqual:](name, "isEqual:"))
    && self->_value == *((double *)v4 + 3);

  return v6;
}

- (unint64_t)hash
{
  NSUInteger v3;
  double value;
  double v5;
  long double v6;
  double v7;
  unint64_t v8;
  unint64_t v9;
  double v10;
  unint64_t v11;

  -[GEONamedFeature readAll:](self, "readAll:", 1);
  v3 = -[NSString hash](self->_name, "hash");
  value = self->_value;
  v5 = -value;
  if (value >= 0.0)
    v5 = self->_value;
  v6 = floor(v5 + 0.5);
  v7 = (v5 - v6) * 1.84467441e19;
  v8 = 2654435761u * (unint64_t)fmod(v6, 1.84467441e19);
  v9 = v8 + (unint64_t)v7;
  v10 = fabs(v7);
  if (v7 <= 0.0)
    v9 = v8;
  v11 = v8 - (unint64_t)v10;
  if (v7 >= 0.0)
    v11 = v9;
  return v11 ^ v3;
}

- (void)mergeFrom:(id)a3
{
  double *v4;

  v4 = (double *)a3;
  objc_msgSend(v4, "readAll:", 0);
  if (*((_QWORD *)v4 + 2))
    -[GEONamedFeature setName:](self, "setName:");
  self->_value = v4[3];

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
    -[GEONamedFeature readAll:](self, "readAll:", 0);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
}

@end
