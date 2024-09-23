@implementation GEOLogMsgStateImpressionObject

- (BOOL)hasImpressionObjectId
{
  return self->_impressionObjectId != 0;
}

- (GEOImpressionObjectId)impressionObjectId
{
  return self->_impressionObjectId;
}

- (void)setImpressionObjectId:(id)a3
{
  objc_storeStrong((id *)&self->_impressionObjectId, a3);
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
  v8.super_class = (Class)GEOLogMsgStateImpressionObject;
  -[GEOLogMsgStateImpressionObject description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOLogMsgStateImpressionObject dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOLogMsgStateImpressionObject _dictionaryRepresentation:](self, 0);
}

- (id)_dictionaryRepresentation:(void *)a1
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  const __CFString *v8;

  if (a1)
  {
    objc_msgSend(a1, "readAll:", 1);
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "impressionObjectId");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5)
    {
      if ((a2 & 1) != 0)
      {
        objc_msgSend(v5, "jsonRepresentation");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = CFSTR("impressionObjectId");
      }
      else
      {
        objc_msgSend(v5, "dictionaryRepresentation");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = CFSTR("impression_object_id");
      }
      objc_msgSend(v4, "setObject:forKey:", v7, v8);

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
  return -[GEOLogMsgStateImpressionObject _dictionaryRepresentation:](self, 1);
}

- (GEOLogMsgStateImpressionObject)initWithDictionary:(id)a3
{
  return (GEOLogMsgStateImpressionObject *)-[GEOLogMsgStateImpressionObject _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5;
  const __CFString *v6;
  void *v7;
  GEOImpressionObjectId *v8;
  uint64_t v9;
  void *v10;

  v5 = a2;
  if (a1)
  {
    a1 = (void *)objc_msgSend(a1, "init");
    if (a1)
    {
      if (a3)
        v6 = CFSTR("impressionObjectId");
      else
        v6 = CFSTR("impression_object_id");
      objc_msgSend(v5, "objectForKeyedSubscript:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v8 = [GEOImpressionObjectId alloc];
        if ((a3 & 1) != 0)
          v9 = -[GEOImpressionObjectId initWithJSON:](v8, "initWithJSON:", v7);
        else
          v9 = -[GEOImpressionObjectId initWithDictionary:](v8, "initWithDictionary:", v7);
        v10 = (void *)v9;
        objc_msgSend(a1, "setImpressionObjectId:", v9);

      }
    }
  }

  return a1;
}

- (GEOLogMsgStateImpressionObject)initWithJSON:(id)a3
{
  return (GEOLogMsgStateImpressionObject *)-[GEOLogMsgStateImpressionObject _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEOLogMsgStateImpressionObjectIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOLogMsgStateImpressionObjectReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  if (self->_impressionObjectId)
    PBDataWriterWriteSubmessage();
}

- (void)copyTo:(id)a3
{
  id v4;

  v4 = a3;
  -[GEOLogMsgStateImpressionObject readAll:](self, "readAll:", 0);
  if (self->_impressionObjectId)
    objc_msgSend(v4, "setImpressionObjectId:");

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  id v6;
  void *v7;

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[GEOImpressionObjectId copyWithZone:](self->_impressionObjectId, "copyWithZone:", a3);
  v7 = (void *)v5[1];
  v5[1] = v6;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  char v5;
  GEOImpressionObjectId *impressionObjectId;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
  {
    v5 = 1;
    -[GEOLogMsgStateImpressionObject readAll:](self, "readAll:", 1);
    objc_msgSend(v4, "readAll:", 1);
    impressionObjectId = self->_impressionObjectId;
    if ((unint64_t)impressionObjectId | v4[1])
      v5 = -[GEOImpressionObjectId isEqual:](impressionObjectId, "isEqual:");
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (unint64_t)hash
{
  -[GEOLogMsgStateImpressionObject readAll:](self, "readAll:", 1);
  return -[GEOImpressionObjectId hash](self->_impressionObjectId, "hash");
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;
  GEOImpressionObjectId *impressionObjectId;
  uint64_t v6;

  v4 = a3;
  objc_msgSend(v4, "readAll:", 0);
  impressionObjectId = self->_impressionObjectId;
  v6 = v4[1];

  if (impressionObjectId)
  {
    if (v6)
      -[GEOImpressionObjectId mergeFrom:](impressionObjectId, "mergeFrom:", v6);
  }
  else if (v6)
  {
    -[GEOLogMsgStateImpressionObject setImpressionObjectId:](self, "setImpressionObjectId:", v6);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_impressionObjectId, 0);
}

@end
