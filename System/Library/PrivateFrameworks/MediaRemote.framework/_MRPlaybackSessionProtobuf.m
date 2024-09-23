@implementation _MRPlaybackSessionProtobuf

- (BOOL)hasPlaybackSessionData
{
  return self->_playbackSessionData != 0;
}

- (BOOL)hasIdentifier
{
  return self->_identifier != 0;
}

- (BOOL)hasType
{
  return self->_type != 0;
}

- (BOOL)hasRevision
{
  return self->_revision != 0;
}

- (BOOL)hasMetadata
{
  return self->_metadata != 0;
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
  v8.super_class = (Class)_MRPlaybackSessionProtobuf;
  -[_MRPlaybackSessionProtobuf description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MRPlaybackSessionProtobuf dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSData *playbackSessionData;
  NSString *identifier;
  NSString *type;
  NSString *revision;
  NSData *metadata;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  playbackSessionData = self->_playbackSessionData;
  if (playbackSessionData)
    objc_msgSend(v3, "setObject:forKey:", playbackSessionData, CFSTR("playbackSessionData"));
  identifier = self->_identifier;
  if (identifier)
    objc_msgSend(v4, "setObject:forKey:", identifier, CFSTR("identifier"));
  type = self->_type;
  if (type)
    objc_msgSend(v4, "setObject:forKey:", type, CFSTR("type"));
  revision = self->_revision;
  if (revision)
    objc_msgSend(v4, "setObject:forKey:", revision, CFSTR("revision"));
  metadata = self->_metadata;
  if (metadata)
    objc_msgSend(v4, "setObject:forKey:", metadata, CFSTR("metadata"));
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return _MRPlaybackSessionProtobufReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_playbackSessionData)
  {
    PBDataWriterWriteDataField();
    v4 = v5;
  }
  if (self->_identifier)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_type)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_revision)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_metadata)
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
  if (self->_playbackSessionData)
  {
    objc_msgSend(v4, "setPlaybackSessionData:");
    v4 = v5;
  }
  if (self->_identifier)
  {
    objc_msgSend(v5, "setIdentifier:");
    v4 = v5;
  }
  if (self->_type)
  {
    objc_msgSend(v5, "setType:");
    v4 = v5;
  }
  if (self->_revision)
  {
    objc_msgSend(v5, "setRevision:");
    v4 = v5;
  }
  if (self->_metadata)
  {
    objc_msgSend(v5, "setMetadata:");
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
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSData copyWithZone:](self->_playbackSessionData, "copyWithZone:", a3);
  v7 = (void *)v5[3];
  v5[3] = v6;

  v8 = -[NSString copyWithZone:](self->_identifier, "copyWithZone:", a3);
  v9 = (void *)v5[1];
  v5[1] = v8;

  v10 = -[NSString copyWithZone:](self->_type, "copyWithZone:", a3);
  v11 = (void *)v5[5];
  v5[5] = v10;

  v12 = -[NSString copyWithZone:](self->_revision, "copyWithZone:", a3);
  v13 = (void *)v5[4];
  v5[4] = v12;

  v14 = -[NSData copyWithZone:](self->_metadata, "copyWithZone:", a3);
  v15 = (void *)v5[2];
  v5[2] = v14;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSData *playbackSessionData;
  NSString *identifier;
  NSString *type;
  NSString *revision;
  NSData *metadata;
  char v10;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((playbackSessionData = self->_playbackSessionData, !((unint64_t)playbackSessionData | v4[3]))
     || -[NSData isEqual:](playbackSessionData, "isEqual:"))
    && ((identifier = self->_identifier, !((unint64_t)identifier | v4[1]))
     || -[NSString isEqual:](identifier, "isEqual:"))
    && ((type = self->_type, !((unint64_t)type | v4[5])) || -[NSString isEqual:](type, "isEqual:"))
    && ((revision = self->_revision, !((unint64_t)revision | v4[4]))
     || -[NSString isEqual:](revision, "isEqual:")))
  {
    metadata = self->_metadata;
    if ((unint64_t)metadata | v4[2])
      v10 = -[NSData isEqual:](metadata, "isEqual:");
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
  NSUInteger v4;
  NSUInteger v5;
  NSUInteger v6;

  v3 = -[NSData hash](self->_playbackSessionData, "hash");
  v4 = -[NSString hash](self->_identifier, "hash") ^ v3;
  v5 = -[NSString hash](self->_type, "hash");
  v6 = v4 ^ v5 ^ -[NSString hash](self->_revision, "hash");
  return v6 ^ -[NSData hash](self->_metadata, "hash");
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;

  v4 = a3;
  if (v4[3])
    -[_MRPlaybackSessionProtobuf setPlaybackSessionData:](self, "setPlaybackSessionData:");
  if (v4[1])
    -[_MRPlaybackSessionProtobuf setIdentifier:](self, "setIdentifier:");
  if (v4[5])
    -[_MRPlaybackSessionProtobuf setType:](self, "setType:");
  if (v4[4])
    -[_MRPlaybackSessionProtobuf setRevision:](self, "setRevision:");
  if (v4[2])
    -[_MRPlaybackSessionProtobuf setMetadata:](self, "setMetadata:");

}

- (NSData)playbackSessionData
{
  return self->_playbackSessionData;
}

- (void)setPlaybackSessionData:(id)a3
{
  objc_storeStrong((id *)&self->_playbackSessionData, a3);
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_identifier, a3);
}

- (NSString)type
{
  return self->_type;
}

- (void)setType:(id)a3
{
  objc_storeStrong((id *)&self->_type, a3);
}

- (NSString)revision
{
  return self->_revision;
}

- (void)setRevision:(id)a3
{
  objc_storeStrong((id *)&self->_revision, a3);
}

- (NSData)metadata
{
  return self->_metadata;
}

- (void)setMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_metadata, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_type, 0);
  objc_storeStrong((id *)&self->_revision, 0);
  objc_storeStrong((id *)&self->_playbackSessionData, 0);
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
