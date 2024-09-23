@implementation GEOLogMsgStateCarPlay

- (BOOL)isConnected
{
  return self->_isConnected;
}

- (void)setIsConnected:(BOOL)a3
{
  *(_BYTE *)&self->_flags |= 1u;
  self->_isConnected = a3;
}

- (void)setHasIsConnected:(BOOL)a3
{
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFE | a3;
}

- (BOOL)hasIsConnected
{
  return *(_BYTE *)&self->_flags & 1;
}

- (BOOL)hasCarInfo
{
  return self->_carInfo != 0;
}

- (GEOCarInfo)carInfo
{
  return self->_carInfo;
}

- (void)setCarInfo:(id)a3
{
  objc_storeStrong((id *)&self->_carInfo, a3);
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
  v8.super_class = (Class)GEOLogMsgStateCarPlay;
  -[GEOLogMsgStateCarPlay description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOLogMsgStateCarPlay dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOLogMsgStateCarPlay _dictionaryRepresentation:]((unsigned __int8 *)self, 0);
}

- (id)_dictionaryRepresentation:(unsigned __int8 *)a1
{
  void *v4;
  void *v5;
  const __CFString *v6;
  void *v7;
  void *v8;
  void *v9;
  const __CFString *v10;

  if (a1)
  {
    objc_msgSend(a1, "readAll:", 1);
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if ((a1[20] & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a1[16]);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if (a2)
        v6 = CFSTR("isConnected");
      else
        v6 = CFSTR("is_connected");
      objc_msgSend(v4, "setObject:forKey:", v5, v6);

    }
    objc_msgSend(a1, "carInfo");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7)
    {
      if ((a2 & 1) != 0)
      {
        objc_msgSend(v7, "jsonRepresentation");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = CFSTR("carInfo");
      }
      else
      {
        objc_msgSend(v7, "dictionaryRepresentation");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = CFSTR("car_info");
      }
      objc_msgSend(v4, "setObject:forKey:", v9, v10);

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
  return -[GEOLogMsgStateCarPlay _dictionaryRepresentation:]((unsigned __int8 *)self, 1);
}

- (GEOLogMsgStateCarPlay)initWithDictionary:(id)a3
{
  return (GEOLogMsgStateCarPlay *)-[GEOLogMsgStateCarPlay _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5;
  const __CFString *v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  GEOCarInfo *v10;
  uint64_t v11;
  void *v12;

  v5 = a2;
  if (a1)
  {
    a1 = (void *)objc_msgSend(a1, "init");
    if (a1)
    {
      if (a3)
        v6 = CFSTR("isConnected");
      else
        v6 = CFSTR("is_connected");
      objc_msgSend(v5, "objectForKeyedSubscript:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setIsConnected:", objc_msgSend(v7, "BOOLValue"));

      if (a3)
        v8 = CFSTR("carInfo");
      else
        v8 = CFSTR("car_info");
      objc_msgSend(v5, "objectForKeyedSubscript:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v10 = [GEOCarInfo alloc];
        if ((a3 & 1) != 0)
          v11 = -[GEOCarInfo initWithJSON:](v10, "initWithJSON:", v9);
        else
          v11 = -[GEOCarInfo initWithDictionary:](v10, "initWithDictionary:", v9);
        v12 = (void *)v11;
        objc_msgSend(a1, "setCarInfo:", v11);

      }
    }
  }

  return a1;
}

- (GEOLogMsgStateCarPlay)initWithJSON:(id)a3
{
  return (GEOLogMsgStateCarPlay *)-[GEOLogMsgStateCarPlay _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEOLogMsgStateCarPlayIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOLogMsgStateCarPlayReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    PBDataWriterWriteBOOLField();
    v4 = v5;
  }
  if (self->_carInfo)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }

}

- (void)copyTo:(id)a3
{
  void *v4;
  _BYTE *v5;

  v5 = a3;
  -[GEOLogMsgStateCarPlay readAll:](self, "readAll:", 0);
  v4 = v5;
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    v5[16] = self->_isConnected;
    v5[20] |= 1u;
  }
  if (self->_carInfo)
  {
    objc_msgSend(v5, "setCarInfo:");
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
    *(_BYTE *)(v5 + 16) = self->_isConnected;
    *(_BYTE *)(v5 + 20) |= 1u;
  }
  v7 = -[GEOCarInfo copyWithZone:](self->_carInfo, "copyWithZone:", a3);
  v8 = (void *)v6[1];
  v6[1] = v7;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  char v5;
  GEOCarInfo *carInfo;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_6;
  -[GEOLogMsgStateCarPlay readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 20) & 1) != 0)
    {
      if (self->_isConnected)
      {
        if (*((_BYTE *)v4 + 16))
          goto LABEL_12;
      }
      else if (!*((_BYTE *)v4 + 16))
      {
        goto LABEL_12;
      }
    }
LABEL_6:
    v5 = 0;
    goto LABEL_7;
  }
  if ((*((_BYTE *)v4 + 20) & 1) != 0)
    goto LABEL_6;
LABEL_12:
  carInfo = self->_carInfo;
  if ((unint64_t)carInfo | *((_QWORD *)v4 + 1))
    v5 = -[GEOCarInfo isEqual:](carInfo, "isEqual:");
  else
    v5 = 1;
LABEL_7:

  return v5;
}

- (unint64_t)hash
{
  uint64_t v3;

  -[GEOLogMsgStateCarPlay readAll:](self, "readAll:", 1);
  if ((*(_BYTE *)&self->_flags & 1) != 0)
    v3 = 2654435761 * self->_isConnected;
  else
    v3 = 0;
  return -[GEOCarInfo hash](self->_carInfo, "hash") ^ v3;
}

- (void)mergeFrom:(id)a3
{
  BOOL *v4;
  GEOCarInfo *carInfo;
  uint64_t v6;
  BOOL *v7;

  v7 = (BOOL *)a3;
  objc_msgSend(v7, "readAll:", 0);
  v4 = v7;
  if (v7[20])
  {
    self->_isConnected = v7[16];
    *(_BYTE *)&self->_flags |= 1u;
  }
  carInfo = self->_carInfo;
  v6 = *((_QWORD *)v7 + 1);
  if (carInfo)
  {
    if (v6)
    {
      -[GEOCarInfo mergeFrom:](carInfo, "mergeFrom:");
LABEL_8:
      v4 = v7;
    }
  }
  else if (v6)
  {
    -[GEOLogMsgStateCarPlay setCarInfo:](self, "setCarInfo:");
    goto LABEL_8;
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_carInfo, 0);
}

@end
