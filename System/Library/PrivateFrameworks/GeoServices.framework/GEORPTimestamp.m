@implementation GEORPTimestamp

- (int64_t)seconds
{
  return self->_seconds;
}

- (void)setSeconds:(int64_t)a3
{
  self->_seconds = a3;
}

- (int)nanos
{
  return self->_nanos;
}

- (void)setNanos:(int)a3
{
  self->_nanos = a3;
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
  v8.super_class = (Class)GEORPTimestamp;
  -[GEORPTimestamp description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEORPTimestamp dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v2;
  void *v3;
  void *v4;

  if (a1)
  {
    objc_msgSend((id)a1, "readAll:", 1);
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", *(_QWORD *)(a1 + 8));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setObject:forKey:", v3, CFSTR("seconds"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(a1 + 16));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setObject:forKey:", v4, CFSTR("nanos"));

  }
  else
  {
    v2 = 0;
  }
  return v2;
}

- (GEORPTimestamp)initWithDictionary:(id)a3
{
  return (GEORPTimestamp *)-[GEORPTimestamp _initWithDictionary:isJSON:](self, a3);
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
      objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("seconds"));
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setSeconds:", objc_msgSend(v4, "longLongValue"));

      objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("nanos"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setNanos:", objc_msgSend(v5, "intValue"));

    }
  }

  return a1;
}

- (GEORPTimestamp)initWithJSON:(id)a3
{
  return (GEORPTimestamp *)-[GEORPTimestamp _initWithDictionary:isJSON:](self, a3);
}

+ (BOOL)isValid:(id)a3
{
  return GEORPTimestampIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEORPTimestampReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  id v3;

  v3 = a3;
  PBDataWriterWriteInt64Field();
  PBDataWriterWriteInt32Field();

}

- (void)copyTo:(id)a3
{
  _QWORD *v4;

  v4 = a3;
  -[GEORPTimestamp readAll:](self, "readAll:", 0);
  v4[1] = self->_seconds;
  *((_DWORD *)v4 + 4) = self->_nanos;

}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;

  result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *((_QWORD *)result + 1) = self->_seconds;
  *((_DWORD *)result + 4) = self->_nanos;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  v5 = objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && (-[GEORPTimestamp readAll:](self, "readAll:", 1),
        objc_msgSend(v4, "readAll:", 1),
        self->_seconds == *((_QWORD *)v4 + 1))
    && self->_nanos == *((_DWORD *)v4 + 4);

  return v5;
}

- (unint64_t)hash
{
  -[GEORPTimestamp readAll:](self, "readAll:", 1);
  return (2654435761 * self->_nanos) ^ (2654435761 * self->_seconds);
}

- (void)mergeFrom:(id)a3
{
  id v4;
  int v5;

  v4 = a3;
  objc_msgSend(v4, "readAll:", 0);
  self->_seconds = *((_QWORD *)v4 + 1);
  v5 = *((_DWORD *)v4 + 4);

  self->_nanos = v5;
}

@end
