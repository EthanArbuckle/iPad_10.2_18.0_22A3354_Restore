@implementation MRPlaybackSession

- (MRPlaybackSession)initWithIdentifier:(id)a3 type:(id)a4 playbackSessionData:(id)a5 revision:(id)a6 metadata:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  MRPlaybackSession *v17;
  uint64_t v18;
  NSString *identifier;
  uint64_t v20;
  NSString *type;
  uint64_t v22;
  NSData *playbackSessionData;
  uint64_t v24;
  NSString *revision;
  uint64_t v26;
  NSData *metadata;
  objc_super v29;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v29.receiver = self;
  v29.super_class = (Class)MRPlaybackSession;
  v17 = -[MRPlaybackSession init](&v29, sel_init);
  if (v17)
  {
    v18 = objc_msgSend(v12, "copy");
    identifier = v17->_identifier;
    v17->_identifier = (NSString *)v18;

    v20 = objc_msgSend(v13, "copy");
    type = v17->_type;
    v17->_type = (NSString *)v20;

    v22 = objc_msgSend(v14, "copy");
    playbackSessionData = v17->_playbackSessionData;
    v17->_playbackSessionData = (NSData *)v22;

    v24 = objc_msgSend(v15, "copy");
    revision = v17->_revision;
    v17->_revision = (NSString *)v24;

    v26 = objc_msgSend(v16, "copy");
    metadata = v17->_metadata;
    v17->_metadata = (NSData *)v26;

  }
  return v17;
}

- (MRPlaybackSession)initWithProtobuf:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  MRPlaybackSession *v10;

  if (a3)
  {
    v4 = a3;
    objc_msgSend(v4, "identifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "type");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "playbackSessionData");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "revision");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "metadata");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = -[MRPlaybackSession initWithIdentifier:type:playbackSessionData:revision:metadata:](self, "initWithIdentifier:type:playbackSessionData:revision:metadata:", v5, v6, v7, v8, v9);
    self = v10;
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (MRPlaybackSession)initWithData:(id)a3
{
  id v4;
  _MRPlaybackSessionProtobuf *v5;
  MRPlaybackSession *v6;

  v4 = a3;
  if (v4)
  {
    v5 = -[_MRPlaybackSessionProtobuf initWithData:]([_MRPlaybackSessionProtobuf alloc], "initWithData:", v4);
    v6 = -[MRPlaybackSession initWithProtobuf:](self, "initWithProtobuf:", v5);

  }
  else
  {
    v6 = -[MRPlaybackSession initWithProtobuf:](self, "initWithProtobuf:", 0);
  }

  return v6;
}

- (_MRPlaybackSessionProtobuf)protobuf
{
  _MRPlaybackSessionProtobuf *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = objc_alloc_init(_MRPlaybackSessionProtobuf);
  -[MRPlaybackSession identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MRPlaybackSessionProtobuf setIdentifier:](v3, "setIdentifier:", v4);

  -[MRPlaybackSession type](self, "type");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MRPlaybackSessionProtobuf setType:](v3, "setType:", v5);

  -[MRPlaybackSession playbackSessionData](self, "playbackSessionData");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MRPlaybackSessionProtobuf setPlaybackSessionData:](v3, "setPlaybackSessionData:", v6);

  -[MRPlaybackSession revision](self, "revision");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MRPlaybackSessionProtobuf setRevision:](v3, "setRevision:", v7);

  -[MRPlaybackSession metadata](self, "metadata");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MRPlaybackSessionProtobuf setMetadata:](v3, "setMetadata:", v8);

  return v3;
}

- (NSData)data
{
  void *v2;
  void *v3;

  -[MRPlaybackSession protobuf](self, "protobuf");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "data");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSData *)v3;
}

- (id)dictionaryRepresentation
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  -[MRPlaybackSession playbackSessionData](self, "playbackSessionData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("playbackSessionData"));

  -[MRPlaybackSession identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("identifier"));

  -[MRPlaybackSession type](self, "type");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("type"));

  -[MRPlaybackSession revision](self, "revision");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("revision"));

  -[MRPlaybackSession metadata](self, "metadata");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("metadata"));

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  MRPlaybackSession *v4;
  void *v5;
  void *v6;
  char v7;

  v4 = (MRPlaybackSession *)a3;
  if (v4 == self)
  {
    v7 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[MRPlaybackSession dictionaryRepresentation](v4, "dictionaryRepresentation");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[MRPlaybackSession dictionaryRepresentation](self, "dictionaryRepresentation");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v5, "isEqualToDictionary:", v6);

    }
    else
    {
      v7 = 0;
    }
  }

  return v7;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[MRPlaybackSession dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p> %@"), v4, self, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)type
{
  return self->_type;
}

- (void)setType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSData)playbackSessionData
{
  return self->_playbackSessionData;
}

- (void)setPlaybackSessionData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)revision
{
  return self->_revision;
}

- (NSData)metadata
{
  return self->_metadata;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_revision, 0);
  objc_storeStrong((id *)&self->_playbackSessionData, 0);
  objc_storeStrong((id *)&self->_type, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
