@implementation _MRRemoteArtworkProtobuf

- (BOOL)hasType
{
  return self->_type != 0;
}

- (BOOL)hasArtworkURLString
{
  return self->_artworkURLString != 0;
}

- (BOOL)hasArtworkURLTemplateData
{
  return self->_artworkURLTemplateData != 0;
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
  v8.super_class = (Class)_MRRemoteArtworkProtobuf;
  -[_MRRemoteArtworkProtobuf description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MRRemoteArtworkProtobuf dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *type;
  NSString *artworkURLString;
  NSData *artworkURLTemplateData;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  type = self->_type;
  if (type)
    objc_msgSend(v3, "setObject:forKey:", type, CFSTR("type"));
  artworkURLString = self->_artworkURLString;
  if (artworkURLString)
    objc_msgSend(v4, "setObject:forKey:", artworkURLString, CFSTR("artworkURLString"));
  artworkURLTemplateData = self->_artworkURLTemplateData;
  if (artworkURLTemplateData)
    objc_msgSend(v4, "setObject:forKey:", artworkURLTemplateData, CFSTR("artworkURLTemplateData"));
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return _MRRemoteArtworkProtobufReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_type)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_artworkURLString)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_artworkURLTemplateData)
  {
    PBDataWriterWriteDataField();
    v4 = v5;
  }

}

- (void)copyTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_type)
  {
    objc_msgSend(v4, "setType:");
    v4 = v5;
  }
  if (self->_artworkURLString)
  {
    objc_msgSend(v5, "setArtworkURLString:");
    v4 = v5;
  }
  if (self->_artworkURLTemplateData)
  {
    objc_msgSend(v5, "setArtworkURLTemplateData:");
    v4 = v5;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_type, "copyWithZone:", a3);
  v7 = (void *)v5[3];
  v5[3] = v6;

  v8 = -[NSString copyWithZone:](self->_artworkURLString, "copyWithZone:", a3);
  v9 = (void *)v5[1];
  v5[1] = v8;

  v10 = -[NSData copyWithZone:](self->_artworkURLTemplateData, "copyWithZone:", a3);
  v11 = (void *)v5[2];
  v5[2] = v10;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSString *type;
  NSString *artworkURLString;
  NSData *artworkURLTemplateData;
  char v8;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((type = self->_type, !((unint64_t)type | v4[3])) || -[NSString isEqual:](type, "isEqual:"))
    && ((artworkURLString = self->_artworkURLString, !((unint64_t)artworkURLString | v4[1]))
     || -[NSString isEqual:](artworkURLString, "isEqual:")))
  {
    artworkURLTemplateData = self->_artworkURLTemplateData;
    if ((unint64_t)artworkURLTemplateData | v4[2])
      v8 = -[NSData isEqual:](artworkURLTemplateData, "isEqual:");
    else
      v8 = 1;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;

  v3 = -[NSString hash](self->_type, "hash");
  v4 = -[NSString hash](self->_artworkURLString, "hash") ^ v3;
  return v4 ^ -[NSData hash](self->_artworkURLTemplateData, "hash");
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;

  v4 = a3;
  if (v4[3])
    -[_MRRemoteArtworkProtobuf setType:](self, "setType:");
  if (v4[1])
    -[_MRRemoteArtworkProtobuf setArtworkURLString:](self, "setArtworkURLString:");
  if (v4[2])
    -[_MRRemoteArtworkProtobuf setArtworkURLTemplateData:](self, "setArtworkURLTemplateData:");

}

- (NSString)type
{
  return self->_type;
}

- (void)setType:(id)a3
{
  objc_storeStrong((id *)&self->_type, a3);
}

- (NSString)artworkURLString
{
  return self->_artworkURLString;
}

- (void)setArtworkURLString:(id)a3
{
  objc_storeStrong((id *)&self->_artworkURLString, a3);
}

- (NSData)artworkURLTemplateData
{
  return self->_artworkURLTemplateData;
}

- (void)setArtworkURLTemplateData:(id)a3
{
  objc_storeStrong((id *)&self->_artworkURLTemplateData, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_type, 0);
  objc_storeStrong((id *)&self->_artworkURLTemplateData, 0);
  objc_storeStrong((id *)&self->_artworkURLString, 0);
}

@end
