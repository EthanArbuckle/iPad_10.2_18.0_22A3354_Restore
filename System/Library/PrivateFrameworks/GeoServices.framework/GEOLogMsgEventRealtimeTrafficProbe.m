@implementation GEOLogMsgEventRealtimeTrafficProbe

- (BOOL)hasLocationCollection
{
  return self->_locationCollection != 0;
}

- (NSData)locationCollection
{
  return self->_locationCollection;
}

- (void)setLocationCollection:(id)a3
{
  objc_storeStrong((id *)&self->_locationCollection, a3);
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
  v8.super_class = (Class)GEOLogMsgEventRealtimeTrafficProbe;
  -[GEOLogMsgEventRealtimeTrafficProbe description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOLogMsgEventRealtimeTrafficProbe dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOLogMsgEventBatchTrafficProbe _dictionaryRepresentation:](self, 0);
}

- (id)jsonRepresentation
{
  return -[GEOLogMsgEventBatchTrafficProbe _dictionaryRepresentation:](self, 1);
}

- (GEOLogMsgEventRealtimeTrafficProbe)initWithDictionary:(id)a3
{
  return (GEOLogMsgEventRealtimeTrafficProbe *)-[GEOLogMsgEventBatchTrafficProbe _initWithDictionary:isJSON:](self, a3, 0);
}

- (GEOLogMsgEventRealtimeTrafficProbe)initWithJSON:(id)a3
{
  return (GEOLogMsgEventRealtimeTrafficProbe *)-[GEOLogMsgEventBatchTrafficProbe _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEOLogMsgEventRealtimeTrafficProbeIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOLogMsgEventRealtimeTrafficProbeReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  if (self->_locationCollection)
    PBDataWriterWriteDataField();
}

- (void)copyTo:(id)a3
{
  id v4;

  v4 = a3;
  -[GEOLogMsgEventRealtimeTrafficProbe readAll:](self, "readAll:", 0);
  if (self->_locationCollection)
    objc_msgSend(v4, "setLocationCollection:");

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  uint64_t v6;
  void *v7;

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSData copyWithZone:](self->_locationCollection, "copyWithZone:", a3);
  v7 = (void *)v5[1];
  v5[1] = v6;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  char v5;
  NSData *locationCollection;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
  {
    v5 = 1;
    -[GEOLogMsgEventRealtimeTrafficProbe readAll:](self, "readAll:", 1);
    objc_msgSend(v4, "readAll:", 1);
    locationCollection = self->_locationCollection;
    if ((unint64_t)locationCollection | v4[1])
      v5 = -[NSData isEqual:](locationCollection, "isEqual:");
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (unint64_t)hash
{
  -[GEOLogMsgEventRealtimeTrafficProbe readAll:](self, "readAll:", 1);
  return -[NSData hash](self->_locationCollection, "hash");
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;
  uint64_t v5;

  v4 = a3;
  objc_msgSend(v4, "readAll:", 0);
  v5 = v4[1];

  if (v5)
    -[GEOLogMsgEventRealtimeTrafficProbe setLocationCollection:](self, "setLocationCollection:", v5);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_locationCollection, 0);
}

@end
