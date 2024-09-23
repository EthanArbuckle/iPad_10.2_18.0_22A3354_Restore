@implementation GEOABConfigValue

- (int64_t)intValue
{
  return self->_intValue;
}

- (void)setIntValue:(int64_t)a3
{
  *(_BYTE *)&self->_flags |= 2u;
  self->_intValue = a3;
}

- (void)setHasIntValue:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasIntValue
{
  return (*(_BYTE *)&self->_flags >> 1) & 1;
}

- (double)doubleValue
{
  return self->_doubleValue;
}

- (void)setDoubleValue:(double)a3
{
  *(_BYTE *)&self->_flags |= 1u;
  self->_doubleValue = a3;
}

- (void)setHasDoubleValue:(BOOL)a3
{
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFE | a3;
}

- (BOOL)hasDoubleValue
{
  return *(_BYTE *)&self->_flags & 1;
}

- (BOOL)hasStringValue
{
  return self->_stringValue != 0;
}

- (NSString)stringValue
{
  return self->_stringValue;
}

- (void)setStringValue:(id)a3
{
  objc_storeStrong((id *)&self->_stringValue, a3);
}

- (BOOL)BOOLValue
{
  return self->_BOOLValue;
}

- (void)setBoolValue:(BOOL)a3
{
  *(_BYTE *)&self->_flags |= 4u;
  self->_BOOLValue = a3;
}

- (void)setHasBoolValue:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFB | v3;
}

- (BOOL)hasBoolValue
{
  return (*(_BYTE *)&self->_flags >> 2) & 1;
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
  v8.super_class = (Class)GEOABConfigValue;
  -[GEOABConfigValue description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOABConfigValue dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOABConfigValue _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  char v5;
  void *v6;
  const __CFString *v7;
  void *v8;
  const __CFString *v9;
  void *v10;
  const __CFString *v11;
  void *v12;
  const __CFString *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  _QWORD v21[4];
  id v22;

  if (!a1)
    return 0;
  objc_msgSend((id)a1, "readAll:", 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(_BYTE *)(a1 + 44);
  if ((v5 & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", *(_QWORD *)(a1 + 24));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v7 = CFSTR("intValue");
    else
      v7 = CFSTR("int_value");
    objc_msgSend(v4, "setObject:forKey:", v6, v7);

    v5 = *(_BYTE *)(a1 + 44);
  }
  if ((v5 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 16));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v9 = CFSTR("doubleValue");
    else
      v9 = CFSTR("double_value");
    objc_msgSend(v4, "setObject:forKey:", v8, v9);

  }
  objc_msgSend((id)a1, "stringValue");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    if (a2)
      v11 = CFSTR("stringValue");
    else
      v11 = CFSTR("string_value");
    objc_msgSend(v4, "setObject:forKey:", v10, v11);
  }

  if ((*(_BYTE *)(a1 + 44) & 4) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 40));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v13 = CFSTR("BOOLValue");
    else
      v13 = CFSTR("BOOL_value");
    objc_msgSend(v4, "setObject:forKey:", v12, v13);

  }
  v14 = *(void **)(a1 + 8);
  if (v14)
  {
    objc_msgSend(v14, "dictionaryRepresentation");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v15;
    if (a2)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v15, "count"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v21[0] = MEMORY[0x1E0C809B0];
      v21[1] = 3221225472;
      v21[2] = __46__GEOABConfigValue__dictionaryRepresentation___block_invoke;
      v21[3] = &unk_1E1C00600;
      v18 = v17;
      v22 = v18;
      objc_msgSend(v16, "enumerateKeysAndObjectsUsingBlock:", v21);
      v19 = v18;

      v16 = v19;
    }
    objc_msgSend(v4, "setObject:forKey:", v16, CFSTR("Unknown Fields"));

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOABConfigValue _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __46__GEOABConfigValue__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (GEOABConfigValue)initWithDictionary:(id)a3
{
  return (GEOABConfigValue *)-[GEOABConfigValue _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5;
  const __CFString *v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  const __CFString *v10;
  void *v11;
  void *v12;
  const __CFString *v13;
  void *v14;

  v5 = a2;
  if (a1)
  {
    a1 = (void *)objc_msgSend(a1, "init");
    if (a1)
    {
      if (a3)
        v6 = CFSTR("intValue");
      else
        v6 = CFSTR("int_value");
      objc_msgSend(v5, "objectForKeyedSubscript:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setIntValue:", objc_msgSend(v7, "longLongValue"));

      if (a3)
        v8 = CFSTR("doubleValue");
      else
        v8 = CFSTR("double_value");
      objc_msgSend(v5, "objectForKeyedSubscript:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v9, "doubleValue");
        objc_msgSend(a1, "setDoubleValue:");
      }

      if (a3)
        v10 = CFSTR("stringValue");
      else
        v10 = CFSTR("string_value");
      objc_msgSend(v5, "objectForKeyedSubscript:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v12 = (void *)objc_msgSend(v11, "copy");
        objc_msgSend(a1, "setStringValue:", v12);

      }
      if (a3)
        v13 = CFSTR("BOOLValue");
      else
        v13 = CFSTR("BOOL_value");
      objc_msgSend(v5, "objectForKeyedSubscript:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setBoolValue:", objc_msgSend(v14, "BOOLValue"));

    }
  }

  return a1;
}

- (GEOABConfigValue)initWithJSON:(id)a3
{
  return (GEOABConfigValue *)-[GEOABConfigValue _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEOABConfigValueIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOABConfigValueReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  char flags;
  id v5;

  v5 = a3;
  flags = (char)self->_flags;
  if ((flags & 2) != 0)
  {
    PBDataWriterWriteSint64Field();
    flags = (char)self->_flags;
  }
  if ((flags & 1) != 0)
    PBDataWriterWriteDoubleField();
  if (self->_stringValue)
    PBDataWriterWriteStringField();
  if ((*(_BYTE *)&self->_flags & 4) != 0)
    PBDataWriterWriteBOOLField();
  -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v5);

}

- (void)copyTo:(id)a3
{
  _BYTE *v4;
  char flags;
  _BYTE *v6;

  v6 = a3;
  -[GEOABConfigValue readAll:](self, "readAll:", 0);
  v4 = v6;
  flags = (char)self->_flags;
  if ((flags & 2) != 0)
  {
    *((_QWORD *)v6 + 3) = self->_intValue;
    v6[44] |= 2u;
    flags = (char)self->_flags;
  }
  if ((flags & 1) != 0)
  {
    *((_QWORD *)v6 + 2) = *(_QWORD *)&self->_doubleValue;
    v6[44] |= 1u;
  }
  if (self->_stringValue)
  {
    objc_msgSend(v6, "setStringValue:");
    v4 = v6;
  }
  if ((*(_BYTE *)&self->_flags & 4) != 0)
  {
    v4[40] = self->_BOOLValue;
    v4[44] |= 4u;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  char flags;
  uint64_t v8;
  void *v9;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  flags = (char)self->_flags;
  if ((flags & 2) != 0)
  {
    *(_QWORD *)(v5 + 24) = self->_intValue;
    *(_BYTE *)(v5 + 44) |= 2u;
    flags = (char)self->_flags;
  }
  if ((flags & 1) != 0)
  {
    *(double *)(v5 + 16) = self->_doubleValue;
    *(_BYTE *)(v5 + 44) |= 1u;
  }
  v8 = -[NSString copyWithZone:](self->_stringValue, "copyWithZone:", a3);
  v9 = *(void **)(v6 + 32);
  *(_QWORD *)(v6 + 32) = v8;

  if ((*(_BYTE *)&self->_flags & 4) != 0)
  {
    *(_BYTE *)(v6 + 40) = self->_BOOLValue;
    *(_BYTE *)(v6 + 44) |= 4u;
  }
  objc_storeStrong((id *)(v6 + 8), self->_unknownFields);
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  char flags;
  char v6;
  NSString *stringValue;
  BOOL v8;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_17;
  -[GEOABConfigValue readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  flags = (char)self->_flags;
  v6 = *((_BYTE *)v4 + 44);
  if ((flags & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 44) & 2) == 0 || self->_intValue != *((_QWORD *)v4 + 3))
      goto LABEL_17;
  }
  else if ((*((_BYTE *)v4 + 44) & 2) != 0)
  {
    goto LABEL_17;
  }
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 44) & 1) == 0 || self->_doubleValue != *((double *)v4 + 2))
      goto LABEL_17;
  }
  else if ((*((_BYTE *)v4 + 44) & 1) != 0)
  {
    goto LABEL_17;
  }
  stringValue = self->_stringValue;
  if ((unint64_t)stringValue | *((_QWORD *)v4 + 4))
  {
    if (!-[NSString isEqual:](stringValue, "isEqual:"))
      goto LABEL_17;
    flags = (char)self->_flags;
    v6 = *((_BYTE *)v4 + 44);
  }
  v8 = (v6 & 4) == 0;
  if ((flags & 4) != 0)
  {
    if ((v6 & 4) != 0)
    {
      if (self->_BOOLValue)
      {
        if (!*((_BYTE *)v4 + 40))
          goto LABEL_17;
      }
      else if (*((_BYTE *)v4 + 40))
      {
        goto LABEL_17;
      }
      v8 = 1;
      goto LABEL_18;
    }
LABEL_17:
    v8 = 0;
  }
LABEL_18:

  return v8;
}

- (unint64_t)hash
{
  uint64_t v3;
  double doubleValue;
  double v5;
  long double v6;
  double v7;
  unint64_t v8;
  NSUInteger v9;
  uint64_t v10;

  -[GEOABConfigValue readAll:](self, "readAll:", 1);
  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    v3 = 2654435761 * self->_intValue;
    if ((*(_BYTE *)&self->_flags & 1) != 0)
      goto LABEL_3;
LABEL_8:
    v8 = 0;
    goto LABEL_11;
  }
  v3 = 0;
  if ((*(_BYTE *)&self->_flags & 1) == 0)
    goto LABEL_8;
LABEL_3:
  doubleValue = self->_doubleValue;
  v5 = -doubleValue;
  if (doubleValue >= 0.0)
    v5 = self->_doubleValue;
  v6 = floor(v5 + 0.5);
  v7 = (v5 - v6) * 1.84467441e19;
  v8 = 2654435761u * (unint64_t)fmod(v6, 1.84467441e19);
  if (v7 >= 0.0)
  {
    if (v7 > 0.0)
      v8 += (unint64_t)v7;
  }
  else
  {
    v8 -= (unint64_t)fabs(v7);
  }
LABEL_11:
  v9 = -[NSString hash](self->_stringValue, "hash");
  if ((*(_BYTE *)&self->_flags & 4) != 0)
    v10 = 2654435761 * self->_BOOLValue;
  else
    v10 = 0;
  return v8 ^ v3 ^ v10 ^ v9;
}

- (void)mergeFrom:(id)a3
{
  BOOL *v4;
  char v5;
  id v6;

  v6 = a3;
  objc_msgSend(v6, "readAll:", 0);
  v4 = (BOOL *)v6;
  v5 = *((_BYTE *)v6 + 44);
  if ((v5 & 2) != 0)
  {
    self->_intValue = *((_QWORD *)v6 + 3);
    *(_BYTE *)&self->_flags |= 2u;
    v5 = *((_BYTE *)v6 + 44);
  }
  if ((v5 & 1) != 0)
  {
    self->_doubleValue = *((double *)v6 + 2);
    *(_BYTE *)&self->_flags |= 1u;
  }
  if (*((_QWORD *)v6 + 4))
  {
    -[GEOABConfigValue setStringValue:](self, "setStringValue:");
    v4 = (BOOL *)v6;
  }
  if ((v4[44] & 4) != 0)
  {
    self->_BOOLValue = v4[40];
    *(_BYTE *)&self->_flags |= 4u;
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
    -[GEOABConfigValue readAll:](self, "readAll:", 0);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stringValue, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
}

@end
