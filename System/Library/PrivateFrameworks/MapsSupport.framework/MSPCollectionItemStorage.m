@implementation MSPCollectionItemStorage

- (BOOL)hasStorageIdentifier
{
  return self->_storageIdentifier != 0;
}

- (BOOL)hasContents
{
  return self->_contents != 0;
}

- (BOOL)hasContentsTimestamp
{
  return self->_contentsTimestamp != 0;
}

- (BOOL)hasPosition
{
  return self->_position != 0;
}

- (BOOL)hasPositionTimestamp
{
  return self->_positionTimestamp != 0;
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
  v8.super_class = (Class)MSPCollectionItemStorage;
  -[MSPCollectionItemStorage description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MSPCollectionItemStorage dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSData *storageIdentifier;
  NSData *contents;
  NSData *contentsTimestamp;
  NSData *position;
  NSData *positionTimestamp;
  PBUnknownFields *unknownFields;
  void *v11;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  storageIdentifier = self->_storageIdentifier;
  if (storageIdentifier)
    objc_msgSend(v3, "setObject:forKey:", storageIdentifier, CFSTR("storageIdentifier"));
  contents = self->_contents;
  if (contents)
    objc_msgSend(v4, "setObject:forKey:", contents, CFSTR("contents"));
  contentsTimestamp = self->_contentsTimestamp;
  if (contentsTimestamp)
    objc_msgSend(v4, "setObject:forKey:", contentsTimestamp, CFSTR("contentsTimestamp"));
  position = self->_position;
  if (position)
    objc_msgSend(v4, "setObject:forKey:", position, CFSTR("position"));
  positionTimestamp = self->_positionTimestamp;
  if (positionTimestamp)
    objc_msgSend(v4, "setObject:forKey:", positionTimestamp, CFSTR("positionTimestamp"));
  unknownFields = self->_unknownFields;
  if (unknownFields)
  {
    -[PBUnknownFields dictionaryRepresentation](unknownFields, "dictionaryRepresentation");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v11, CFSTR("Unknown Fields"));

  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return MSPCollectionItemStorageReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_storageIdentifier)
  {
    PBDataWriterWriteDataField();
    v4 = v5;
  }
  if (self->_contents)
  {
    PBDataWriterWriteDataField();
    v4 = v5;
  }
  if (self->_contentsTimestamp)
  {
    PBDataWriterWriteDataField();
    v4 = v5;
  }
  if (self->_position)
  {
    PBDataWriterWriteDataField();
    v4 = v5;
  }
  if (self->_positionTimestamp)
  {
    PBDataWriterWriteDataField();
    v4 = v5;
  }
  -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4);

}

- (void)copyTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_storageIdentifier)
  {
    objc_msgSend(v4, "setStorageIdentifier:");
    v4 = v5;
  }
  if (self->_contents)
  {
    objc_msgSend(v5, "setContents:");
    v4 = v5;
  }
  if (self->_contentsTimestamp)
  {
    objc_msgSend(v5, "setContentsTimestamp:");
    v4 = v5;
  }
  if (self->_position)
  {
    objc_msgSend(v5, "setPosition:");
    v4 = v5;
  }
  if (self->_positionTimestamp)
  {
    objc_msgSend(v5, "setPositionTimestamp:");
    v4 = v5;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSData copyWithZone:](self->_storageIdentifier, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 48);
  *(_QWORD *)(v5 + 48) = v6;

  v8 = -[NSData copyWithZone:](self->_contents, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v8;

  v10 = -[NSData copyWithZone:](self->_contentsTimestamp, "copyWithZone:", a3);
  v11 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v10;

  v12 = -[NSData copyWithZone:](self->_position, "copyWithZone:", a3);
  v13 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v12;

  v14 = -[NSData copyWithZone:](self->_positionTimestamp, "copyWithZone:", a3);
  v15 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v14;

  objc_storeStrong((id *)(v5 + 8), self->_unknownFields);
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSData *storageIdentifier;
  NSData *contents;
  NSData *contentsTimestamp;
  NSData *position;
  NSData *positionTimestamp;
  char v10;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((storageIdentifier = self->_storageIdentifier, !((unint64_t)storageIdentifier | v4[6]))
     || -[NSData isEqual:](storageIdentifier, "isEqual:"))
    && ((contents = self->_contents, !((unint64_t)contents | v4[2]))
     || -[NSData isEqual:](contents, "isEqual:"))
    && ((contentsTimestamp = self->_contentsTimestamp, !((unint64_t)contentsTimestamp | v4[3]))
     || -[NSData isEqual:](contentsTimestamp, "isEqual:"))
    && ((position = self->_position, !((unint64_t)position | v4[4]))
     || -[NSData isEqual:](position, "isEqual:")))
  {
    positionTimestamp = self->_positionTimestamp;
    if ((unint64_t)positionTimestamp | v4[5])
      v10 = -[NSData isEqual:](positionTimestamp, "isEqual:");
    else
      v10 = 1;
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v3 = -[NSData hash](self->_storageIdentifier, "hash");
  v4 = -[NSData hash](self->_contents, "hash") ^ v3;
  v5 = -[NSData hash](self->_contentsTimestamp, "hash");
  v6 = v4 ^ v5 ^ -[NSData hash](self->_position, "hash");
  return v6 ^ -[NSData hash](self->_positionTimestamp, "hash");
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;

  v4 = a3;
  if (v4[6])
    -[MSPCollectionItemStorage setStorageIdentifier:](self, "setStorageIdentifier:");
  if (v4[2])
    -[MSPCollectionItemStorage setContents:](self, "setContents:");
  if (v4[3])
    -[MSPCollectionItemStorage setContentsTimestamp:](self, "setContentsTimestamp:");
  if (v4[4])
    -[MSPCollectionItemStorage setPosition:](self, "setPosition:");
  if (v4[5])
    -[MSPCollectionItemStorage setPositionTimestamp:](self, "setPositionTimestamp:");

}

- (PBUnknownFields)unknownFields
{
  return self->_unknownFields;
}

- (NSData)storageIdentifier
{
  return self->_storageIdentifier;
}

- (void)setStorageIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_storageIdentifier, a3);
}

- (NSData)contents
{
  return self->_contents;
}

- (void)setContents:(id)a3
{
  objc_storeStrong((id *)&self->_contents, a3);
}

- (NSData)contentsTimestamp
{
  return self->_contentsTimestamp;
}

- (void)setContentsTimestamp:(id)a3
{
  objc_storeStrong((id *)&self->_contentsTimestamp, a3);
}

- (NSData)position
{
  return self->_position;
}

- (void)setPosition:(id)a3
{
  objc_storeStrong((id *)&self->_position, a3);
}

- (NSData)positionTimestamp
{
  return self->_positionTimestamp;
}

- (void)setPositionTimestamp:(id)a3
{
  objc_storeStrong((id *)&self->_positionTimestamp, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_storageIdentifier, 0);
  objc_storeStrong((id *)&self->_positionTimestamp, 0);
  objc_storeStrong((id *)&self->_position, 0);
  objc_storeStrong((id *)&self->_contentsTimestamp, 0);
  objc_storeStrong((id *)&self->_contents, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
}

@end
