@implementation GEOLogMsgStateMapsServer

- (BOOL)hasServerMetadata
{
  return self->_serverMetadata != 0;
}

- (GEOMapsServerMetadata)serverMetadata
{
  return self->_serverMetadata;
}

- (void)setServerMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_serverMetadata, a3);
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
  v8.super_class = (Class)GEOLogMsgStateMapsServer;
  -[GEOLogMsgStateMapsServer description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOLogMsgStateMapsServer dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOLogMsgStateMapsServer _dictionaryRepresentation:](self, 0);
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
    objc_msgSend(a1, "serverMetadata");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5)
    {
      if ((a2 & 1) != 0)
      {
        objc_msgSend(v5, "jsonRepresentation");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = CFSTR("serverMetadata");
      }
      else
      {
        objc_msgSend(v5, "dictionaryRepresentation");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = CFSTR("server_metadata");
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
  return -[GEOLogMsgStateMapsServer _dictionaryRepresentation:](self, 1);
}

- (GEOLogMsgStateMapsServer)initWithDictionary:(id)a3
{
  return (GEOLogMsgStateMapsServer *)-[GEOLogMsgStateMapsServer _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5;
  const __CFString *v6;
  void *v7;
  GEOMapsServerMetadata *v8;
  uint64_t v9;
  void *v10;

  v5 = a2;
  if (a1)
  {
    a1 = (void *)objc_msgSend(a1, "init");
    if (a1)
    {
      if (a3)
        v6 = CFSTR("serverMetadata");
      else
        v6 = CFSTR("server_metadata");
      objc_msgSend(v5, "objectForKeyedSubscript:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v8 = [GEOMapsServerMetadata alloc];
        if ((a3 & 1) != 0)
          v9 = -[GEOMapsServerMetadata initWithJSON:](v8, "initWithJSON:", v7);
        else
          v9 = -[GEOMapsServerMetadata initWithDictionary:](v8, "initWithDictionary:", v7);
        v10 = (void *)v9;
        objc_msgSend(a1, "setServerMetadata:", v9);

      }
    }
  }

  return a1;
}

- (GEOLogMsgStateMapsServer)initWithJSON:(id)a3
{
  return (GEOLogMsgStateMapsServer *)-[GEOLogMsgStateMapsServer _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEOLogMsgStateMapsServerIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOLogMsgStateMapsServerReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  if (self->_serverMetadata)
    PBDataWriterWriteSubmessage();
}

- (BOOL)hasGreenTeaWithValue:(BOOL)a3
{
  return -[GEOMapsServerMetadata hasGreenTeaWithValue:](self->_serverMetadata, "hasGreenTeaWithValue:", a3);
}

- (void)copyTo:(id)a3
{
  id v4;

  v4 = a3;
  -[GEOLogMsgStateMapsServer readAll:](self, "readAll:", 0);
  if (self->_serverMetadata)
    objc_msgSend(v4, "setServerMetadata:");

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  id v6;
  void *v7;

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[GEOMapsServerMetadata copyWithZone:](self->_serverMetadata, "copyWithZone:", a3);
  v7 = (void *)v5[1];
  v5[1] = v6;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  char v5;
  GEOMapsServerMetadata *serverMetadata;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
  {
    v5 = 1;
    -[GEOLogMsgStateMapsServer readAll:](self, "readAll:", 1);
    objc_msgSend(v4, "readAll:", 1);
    serverMetadata = self->_serverMetadata;
    if ((unint64_t)serverMetadata | v4[1])
      v5 = -[GEOMapsServerMetadata isEqual:](serverMetadata, "isEqual:");
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (unint64_t)hash
{
  -[GEOLogMsgStateMapsServer readAll:](self, "readAll:", 1);
  return -[GEOMapsServerMetadata hash](self->_serverMetadata, "hash");
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;
  GEOMapsServerMetadata *serverMetadata;
  uint64_t v6;

  v4 = a3;
  objc_msgSend(v4, "readAll:", 0);
  serverMetadata = self->_serverMetadata;
  v6 = v4[1];

  if (serverMetadata)
  {
    if (v6)
      -[GEOMapsServerMetadata mergeFrom:](serverMetadata, "mergeFrom:", v6);
  }
  else if (v6)
  {
    -[GEOLogMsgStateMapsServer setServerMetadata:](self, "setServerMetadata:", v6);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serverMetadata, 0);
}

@end
