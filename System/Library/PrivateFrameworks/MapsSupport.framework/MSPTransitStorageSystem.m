@implementation MSPTransitStorageSystem

- (MSPTransitStorageSystem)initWithSystem:(id)a3
{
  id v4;
  MSPTransitStorageSystem *v5;
  void *v6;
  void *v7;
  MSPTransitStorageArtwork *v8;
  void *v9;
  MSPTransitStorageArtwork *v10;
  MSPTransitStorageSystem *v11;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)MSPTransitStorageSystem;
  v5 = -[MSPTransitStorageSystem init](&v13, sel_init);
  if (v5)
  {
    -[MSPTransitStorageSystem setMuid:](v5, "setMuid:", objc_msgSend(v4, "muid"));
    objc_msgSend(v4, "name");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[MSPTransitStorageSystem setName:](v5, "setName:", v6);

    objc_msgSend(v4, "artwork");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      v8 = [MSPTransitStorageArtwork alloc];
      objc_msgSend(v4, "artwork");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = -[MSPTransitStorageArtwork initWithArtwork:](v8, "initWithArtwork:", v9);
      -[MSPTransitStorageSystem setArtwork:](v5, "setArtwork:", v10);

    }
    v11 = v5;
  }

  return v5;
}

- (void)setMuid:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_muid = a3;
}

- (void)setHasMuid:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasMuid
{
  return *(_BYTE *)&self->_has & 1;
}

- (BOOL)hasName
{
  return self->_name != 0;
}

- (BOOL)hasArtwork
{
  return self->_artwork != 0;
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)MSPTransitStorageSystem;
  -[MSPTransitStorageSystem description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MSPTransitStorageSystem dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *name;
  MSPTransitStorageArtwork *artwork;
  void *v7;
  PBUnknownFields *unknownFields;
  void *v9;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_muid);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("muid"));

  }
  name = self->_name;
  if (name)
    objc_msgSend(v3, "setObject:forKey:", name, CFSTR("name"));
  artwork = self->_artwork;
  if (artwork)
  {
    -[MSPTransitStorageArtwork dictionaryRepresentation](artwork, "dictionaryRepresentation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("artwork"));

  }
  unknownFields = self->_unknownFields;
  if (unknownFields)
  {
    -[PBUnknownFields dictionaryRepresentation](unknownFields, "dictionaryRepresentation");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("Unknown Fields"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return MSPTransitStorageSystemReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    PBDataWriterWriteUint64Field();
    v4 = v5;
  }
  if (self->_name)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_artwork)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4);

}

- (void)copyTo:(id)a3
{
  _QWORD *v4;
  _QWORD *v5;

  v4 = a3;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4[2] = self->_muid;
    *((_BYTE *)v4 + 40) |= 1u;
  }
  v5 = v4;
  if (self->_name)
  {
    objc_msgSend(v4, "setName:");
    v4 = v5;
  }
  if (self->_artwork)
  {
    objc_msgSend(v5, "setArtwork:");
    v4 = v5;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;
  void *v10;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_QWORD *)(v5 + 16) = self->_muid;
    *(_BYTE *)(v5 + 40) |= 1u;
  }
  v7 = -[NSString copyWithZone:](self->_name, "copyWithZone:", a3);
  v8 = *(void **)(v6 + 32);
  *(_QWORD *)(v6 + 32) = v7;

  v9 = -[MSPTransitStorageArtwork copyWithZone:](self->_artwork, "copyWithZone:", a3);
  v10 = *(void **)(v6 + 24);
  *(_QWORD *)(v6 + 24) = v9;

  objc_storeStrong((id *)(v6 + 8), self->_unknownFields);
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *name;
  MSPTransitStorageArtwork *artwork;
  char v7;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_11;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 40) & 1) == 0 || self->_muid != *((_QWORD *)v4 + 2))
      goto LABEL_11;
  }
  else if ((*((_BYTE *)v4 + 40) & 1) != 0)
  {
LABEL_11:
    v7 = 0;
    goto LABEL_12;
  }
  name = self->_name;
  if ((unint64_t)name | *((_QWORD *)v4 + 4) && !-[NSString isEqual:](name, "isEqual:"))
    goto LABEL_11;
  artwork = self->_artwork;
  if ((unint64_t)artwork | *((_QWORD *)v4 + 3))
    v7 = -[MSPTransitStorageArtwork isEqual:](artwork, "isEqual:");
  else
    v7 = 1;
LABEL_12:

  return v7;
}

- (unint64_t)hash
{
  unint64_t v3;
  NSUInteger v4;

  if ((*(_BYTE *)&self->_has & 1) != 0)
    v3 = 2654435761u * self->_muid;
  else
    v3 = 0;
  v4 = -[NSString hash](self->_name, "hash") ^ v3;
  return v4 ^ -[MSPTransitStorageArtwork hash](self->_artwork, "hash");
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;
  _QWORD *v5;
  MSPTransitStorageArtwork *artwork;
  uint64_t v7;
  _QWORD *v8;

  v4 = a3;
  v5 = v4;
  if ((v4[5] & 1) != 0)
  {
    self->_muid = v4[2];
    *(_BYTE *)&self->_has |= 1u;
  }
  v8 = v4;
  if (v4[4])
  {
    -[MSPTransitStorageSystem setName:](self, "setName:");
    v5 = v8;
  }
  artwork = self->_artwork;
  v7 = v5[3];
  if (artwork)
  {
    if (v7)
    {
      -[MSPTransitStorageArtwork mergeFrom:](artwork, "mergeFrom:");
LABEL_10:
      v5 = v8;
    }
  }
  else if (v7)
  {
    -[MSPTransitStorageSystem setArtwork:](self, "setArtwork:");
    goto LABEL_10;
  }

}

- (PBUnknownFields)unknownFields
{
  return self->_unknownFields;
}

- (unint64_t)muid
{
  return self->_muid;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_storeStrong((id *)&self->_name, a3);
}

- (GEOTransitArtworkDataSource)artwork
{
  return (GEOTransitArtworkDataSource *)self->_artwork;
}

- (void)setArtwork:(id)a3
{
  objc_storeStrong((id *)&self->_artwork, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_artwork, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
}

@end
