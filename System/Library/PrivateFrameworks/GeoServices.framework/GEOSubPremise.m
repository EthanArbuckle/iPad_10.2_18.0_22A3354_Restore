@implementation GEOSubPremise

- (int)type
{
  return self->_type;
}

- (void)setType:(int)a3
{
  self->_type = a3;
}

- (id)typeAsString:(int)a3
{
  if (a3 < 4)
    return off_1E1C13CB0[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UNIT")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FLOOR")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("POSTBOX")) & 1) != 0)
  {
    v4 = 2;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("MAILSTOP")))
  {
    v4 = 3;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_storeStrong((id *)&self->_name, a3);
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
  v8.super_class = (Class)GEOSubPremise;
  -[GEOSubPremise description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOSubPremise dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOSubPremise _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  uint64_t v5;
  __CFString *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  _QWORD v15[4];
  id v16;

  if (!a1)
    return 0;
  objc_msgSend((id)a1, "readAll:", 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(int *)(a1 + 24);
  if (v5 >= 4)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 24));
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = off_1E1C13CB0[v5];
  }
  objc_msgSend(v4, "setObject:forKey:", v6, CFSTR("type"));

  objc_msgSend((id)a1, "name");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
    objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("name"));

  v8 = *(void **)(a1 + 8);
  if (v8)
  {
    objc_msgSend(v8, "dictionaryRepresentation");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (a2)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v9, "count"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v15[0] = MEMORY[0x1E0C809B0];
      v15[1] = 3221225472;
      v15[2] = __43__GEOSubPremise__dictionaryRepresentation___block_invoke;
      v15[3] = &unk_1E1C00600;
      v12 = v11;
      v16 = v12;
      objc_msgSend(v10, "enumerateKeysAndObjectsUsingBlock:", v15);
      v13 = v12;

      v10 = v13;
    }
    objc_msgSend(v4, "setObject:forKey:", v10, CFSTR("Unknown Fields"));

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOSubPremise _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __43__GEOSubPremise__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (GEOSubPremise)initWithDictionary:(id)a3
{
  return (GEOSubPremise *)-[GEOSubPremise _initWithDictionary:isJSON:](self, a3);
}

- (void)_initWithDictionary:(void *)a1 isJSON:(void *)a2
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;

  v3 = a2;
  if (!a1)
    goto LABEL_20;
  a1 = (void *)objc_msgSend(a1, "init");
  if (!a1)
    goto LABEL_20;
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("type"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    if ((objc_msgSend(v5, "isEqualToString:", CFSTR("UNIT")) & 1) != 0)
    {
      v6 = 0;
    }
    else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("FLOOR")) & 1) != 0)
    {
      v6 = 1;
    }
    else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("POSTBOX")) & 1) != 0)
    {
      v6 = 2;
    }
    else if (objc_msgSend(v5, "isEqualToString:", CFSTR("MAILSTOP")))
    {
      v6 = 3;
    }
    else
    {
      v6 = 0;
    }

    goto LABEL_16;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v6 = objc_msgSend(v4, "intValue");
LABEL_16:
    objc_msgSend(a1, "setType:", v6);
  }

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("name"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = (void *)objc_msgSend(v7, "copy");
    objc_msgSend(a1, "setName:", v8);

  }
LABEL_20:

  return a1;
}

- (GEOSubPremise)initWithJSON:(id)a3
{
  return (GEOSubPremise *)-[GEOSubPremise _initWithDictionary:isJSON:](self, a3);
}

+ (BOOL)isValid:(id)a3
{
  return GEOSubPremiseIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOSubPremiseReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  id v4;

  v4 = a3;
  PBDataWriterWriteInt32Field();
  PBDataWriterWriteStringField();
  -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4);

}

- (void)copyTo:(id)a3
{
  _DWORD *v4;

  v4 = a3;
  -[GEOSubPremise readAll:](self, "readAll:", 0);
  v4[6] = self->_type;
  objc_msgSend(v4, "setName:", self->_name);

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *(_DWORD *)(v5 + 24) = self->_type;
  v6 = -[NSString copyWithZone:](self->_name, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v6;

  objc_storeStrong((id *)(v5 + 8), self->_unknownFields);
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSString *name;
  char v6;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && (-[GEOSubPremise readAll:](self, "readAll:", 1),
        objc_msgSend(v4, "readAll:", 1),
        self->_type == *((_DWORD *)v4 + 6)))
  {
    name = self->_name;
    if ((unint64_t)name | v4[2])
      v6 = -[NSString isEqual:](name, "isEqual:");
    else
      v6 = 1;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (unint64_t)hash
{
  uint64_t v3;

  -[GEOSubPremise readAll:](self, "readAll:", 1);
  v3 = 2654435761 * self->_type;
  return -[NSString hash](self->_name, "hash") ^ v3;
}

- (void)mergeFrom:(id)a3
{
  int *v4;

  v4 = (int *)a3;
  objc_msgSend(v4, "readAll:", 0);
  self->_type = v4[6];
  if (*((_QWORD *)v4 + 2))
    -[GEOSubPremise setName:](self, "setName:");

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
    -[GEOSubPremise readAll:](self, "readAll:", 0);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
}

@end
