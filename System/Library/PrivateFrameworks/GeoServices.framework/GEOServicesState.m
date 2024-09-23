@implementation GEOServicesState

- (BOOL)hasBogusFieldForTestingPurposes
{
  return self->_bogusFieldForTestingPurposes != 0;
}

- (NSString)bogusFieldForTestingPurposes
{
  return self->_bogusFieldForTestingPurposes;
}

- (void)setBogusFieldForTestingPurposes:(id)a3
{
  objc_storeStrong((id *)&self->_bogusFieldForTestingPurposes, a3);
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
  v8.super_class = (Class)GEOServicesState;
  -[GEOServicesState description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOServicesState dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOServicesState _dictionaryRepresentation:](self, 0);
}

- (id)_dictionaryRepresentation:(void *)a1
{
  void *v4;
  void *v5;
  const __CFString *v6;

  if (a1)
  {
    objc_msgSend(a1, "readAll:", 1);
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "bogusFieldForTestingPurposes");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      if (a2)
        v6 = CFSTR("bogusFieldForTestingPurposes");
      else
        v6 = CFSTR("bogus_field_for_testing_purposes");
      objc_msgSend(v4, "setObject:forKey:", v5, v6);
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
  return -[GEOServicesState _dictionaryRepresentation:](self, 1);
}

- (GEOServicesState)initWithDictionary:(id)a3
{
  return (GEOServicesState *)-[GEOServicesState _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5;
  const __CFString *v6;
  void *v7;
  void *v8;

  v5 = a2;
  if (a1)
  {
    a1 = (void *)objc_msgSend(a1, "init");
    if (a1)
    {
      if (a3)
        v6 = CFSTR("bogusFieldForTestingPurposes");
      else
        v6 = CFSTR("bogus_field_for_testing_purposes");
      objc_msgSend(v5, "objectForKeyedSubscript:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v8 = (void *)objc_msgSend(v7, "copy");
        objc_msgSend(a1, "setBogusFieldForTestingPurposes:", v8);

      }
    }
  }

  return a1;
}

- (GEOServicesState)initWithJSON:(id)a3
{
  return (GEOServicesState *)-[GEOServicesState _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEOServicesStateIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOServicesStateReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  if (self->_bogusFieldForTestingPurposes)
    PBDataWriterWriteStringField();
}

- (void)copyTo:(id)a3
{
  id v4;

  v4 = a3;
  -[GEOServicesState readAll:](self, "readAll:", 0);
  if (self->_bogusFieldForTestingPurposes)
    objc_msgSend(v4, "setBogusFieldForTestingPurposes:");

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  uint64_t v6;
  void *v7;

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_bogusFieldForTestingPurposes, "copyWithZone:", a3);
  v7 = (void *)v5[1];
  v5[1] = v6;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  char v5;
  NSString *bogusFieldForTestingPurposes;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
  {
    v5 = 1;
    -[GEOServicesState readAll:](self, "readAll:", 1);
    objc_msgSend(v4, "readAll:", 1);
    bogusFieldForTestingPurposes = self->_bogusFieldForTestingPurposes;
    if ((unint64_t)bogusFieldForTestingPurposes | v4[1])
      v5 = -[NSString isEqual:](bogusFieldForTestingPurposes, "isEqual:");
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (unint64_t)hash
{
  -[GEOServicesState readAll:](self, "readAll:", 1);
  return -[NSString hash](self->_bogusFieldForTestingPurposes, "hash");
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;
  uint64_t v5;

  v4 = a3;
  objc_msgSend(v4, "readAll:", 0);
  v5 = v4[1];

  if (v5)
    -[GEOServicesState setBogusFieldForTestingPurposes:](self, "setBogusFieldForTestingPurposes:", v5);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bogusFieldForTestingPurposes, 0);
}

@end
