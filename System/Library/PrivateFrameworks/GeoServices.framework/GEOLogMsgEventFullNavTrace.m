@implementation GEOLogMsgEventFullNavTrace

- (BOOL)hasNavTraceData
{
  return self->_navTraceData != 0;
}

- (NSData)navTraceData
{
  return self->_navTraceData;
}

- (void)setNavTraceData:(id)a3
{
  objc_storeStrong((id *)&self->_navTraceData, a3);
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
  v8.super_class = (Class)GEOLogMsgEventFullNavTrace;
  -[GEOLogMsgEventFullNavTrace description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOLogMsgEventFullNavTrace dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOLogMsgEventFullNavTrace _dictionaryRepresentation:](self, 0);
}

- (id)_dictionaryRepresentation:(void *)a1
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  if (a1)
  {
    objc_msgSend(a1, "readAll:", 1);
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "navTraceData");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5)
    {
      if ((a2 & 1) != 0)
      {
        objc_msgSend(v5, "base64EncodedStringWithOptions:", 0);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("navTraceData"));

      }
      else
      {
        objc_msgSend(v4, "setObject:forKey:", v5, CFSTR("nav_trace_data"));
      }
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
  return -[GEOLogMsgEventFullNavTrace _dictionaryRepresentation:](self, 1);
}

- (GEOLogMsgEventFullNavTrace)initWithDictionary:(id)a3
{
  return (GEOLogMsgEventFullNavTrace *)-[GEOLogMsgEventFullNavTrace _initWithDictionary:isJSON:](self, a3, 0);
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
        v6 = CFSTR("navTraceData");
      else
        v6 = CFSTR("nav_trace_data");
      objc_msgSend(v5, "objectForKeyedSubscript:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBase64EncodedString:options:", v7, 0);
        objc_msgSend(a1, "setNavTraceData:", v8);

      }
    }
  }

  return a1;
}

- (GEOLogMsgEventFullNavTrace)initWithJSON:(id)a3
{
  return (GEOLogMsgEventFullNavTrace *)-[GEOLogMsgEventFullNavTrace _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEOLogMsgEventFullNavTraceIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOLogMsgEventFullNavTraceReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  if (self->_navTraceData)
    PBDataWriterWriteDataField();
}

- (void)copyTo:(id)a3
{
  id v4;

  v4 = a3;
  -[GEOLogMsgEventFullNavTrace readAll:](self, "readAll:", 0);
  if (self->_navTraceData)
    objc_msgSend(v4, "setNavTraceData:");

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  uint64_t v6;
  void *v7;

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSData copyWithZone:](self->_navTraceData, "copyWithZone:", a3);
  v7 = (void *)v5[1];
  v5[1] = v6;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  char v5;
  NSData *navTraceData;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
  {
    v5 = 1;
    -[GEOLogMsgEventFullNavTrace readAll:](self, "readAll:", 1);
    objc_msgSend(v4, "readAll:", 1);
    navTraceData = self->_navTraceData;
    if ((unint64_t)navTraceData | v4[1])
      v5 = -[NSData isEqual:](navTraceData, "isEqual:");
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (unint64_t)hash
{
  -[GEOLogMsgEventFullNavTrace readAll:](self, "readAll:", 1);
  return -[NSData hash](self->_navTraceData, "hash");
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;
  uint64_t v5;

  v4 = a3;
  objc_msgSend(v4, "readAll:", 0);
  v5 = v4[1];

  if (v5)
    -[GEOLogMsgEventFullNavTrace setNavTraceData:](self, "setNavTraceData:", v5);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_navTraceData, 0);
}

@end
