@implementation MRPlaybackSessionRequest

- (MRPlaybackSessionRequest)initWithIdentifier:(id)a3 type:(id)a4
{
  id v6;
  id v7;
  MRPlaybackSessionRequest *v8;
  uint64_t v9;
  NSString *identifier;
  uint64_t v11;
  NSString *type;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)MRPlaybackSessionRequest;
  v8 = -[MRPlaybackSessionRequest init](&v14, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    identifier = v8->_identifier;
    v8->_identifier = (NSString *)v9;

    v11 = objc_msgSend(v7, "copy");
    type = v8->_type;
    v8->_type = (NSString *)v11;

  }
  return v8;
}

- (MRPlaybackSessionRequest)initWithIdentifier:(id)a3 range:(_NSRange)a4
{
  NSUInteger length;
  NSUInteger location;
  id v7;
  MRPlaybackSessionRequest *v8;
  uint64_t v9;
  NSString *identifier;
  objc_super v12;

  length = a4.length;
  location = a4.location;
  v7 = a3;
  v12.receiver = self;
  v12.super_class = (Class)MRPlaybackSessionRequest;
  v8 = -[MRPlaybackSessionRequest init](&v12, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v7, "copy");
    identifier = v8->_identifier;
    v8->_identifier = (NSString *)v9;

    v8->_location = location;
    v8->_length = length;
    *(_WORD *)&v8->_hasLocation = 257;
  }

  return v8;
}

- (MRPlaybackSessionRequest)initWithProtobuf:(id)a3
{
  id v4;
  MRPlaybackSessionRequest *v5;
  void *v6;
  uint64_t v7;
  NSString *requestIdentifier;
  void *v9;
  uint64_t v10;
  NSString *identifier;
  void *v12;
  uint64_t v13;
  NSString *type;
  MRPlaybackSessionRequest *v15;
  objc_super v17;

  v4 = a3;
  if (v4)
  {
    v17.receiver = self;
    v17.super_class = (Class)MRPlaybackSessionRequest;
    v5 = -[MRPlaybackSessionRequest init](&v17, sel_init);
    if (v5)
    {
      objc_msgSend(v4, "requestID");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "copy");
      requestIdentifier = v5->_requestIdentifier;
      v5->_requestIdentifier = (NSString *)v7;

      objc_msgSend(v4, "identifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "copy");
      identifier = v5->_identifier;
      v5->_identifier = (NSString *)v10;

      objc_msgSend(v4, "type");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "copy");
      type = v5->_type;
      v5->_type = (NSString *)v13;

      v5->_location = (int)objc_msgSend(v4, "location");
      v5->_hasLocation = objc_msgSend(v4, "hasLocation");
      v5->_length = (int)objc_msgSend(v4, "length");
      v5->_hasLength = objc_msgSend(v4, "hasLength");
    }
    self = v5;
    v15 = self;
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (MRPlaybackSessionRequest)initWithData:(id)a3
{
  id v4;
  _MRPlaybackSessionRequestProtobuf *v5;
  MRPlaybackSessionRequest *v6;

  v4 = a3;
  if (v4)
  {
    v5 = -[_MRPlaybackSessionRequestProtobuf initWithData:]([_MRPlaybackSessionRequestProtobuf alloc], "initWithData:", v4);
    v6 = -[MRPlaybackSessionRequest initWithProtobuf:](self, "initWithProtobuf:", v5);

  }
  else
  {
    v6 = -[MRPlaybackSessionRequest initWithProtobuf:](self, "initWithProtobuf:", 0);
  }

  return v6;
}

- (_MRPlaybackSessionRequestProtobuf)protobuf
{
  _MRPlaybackSessionRequestProtobuf *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = objc_alloc_init(_MRPlaybackSessionRequestProtobuf);
  -[MRPlaybackSessionRequest requestIdentifier](self, "requestIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "copy");
  -[_MRPlaybackSessionRequestProtobuf setRequestID:](v3, "setRequestID:", v5);

  -[MRPlaybackSessionRequest identifier](self, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "copy");
  -[_MRPlaybackSessionRequestProtobuf setIdentifier:](v3, "setIdentifier:", v7);

  -[MRPlaybackSessionRequest type](self, "type");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "copy");
  -[_MRPlaybackSessionRequestProtobuf setType:](v3, "setType:", v9);

  -[_MRPlaybackSessionRequestProtobuf setLocation:](v3, "setLocation:", -[MRPlaybackSessionRequest location](self, "location"));
  -[_MRPlaybackSessionRequestProtobuf setHasLocation:](v3, "setHasLocation:", -[MRPlaybackSessionRequest hasLocation](self, "hasLocation"));
  -[_MRPlaybackSessionRequestProtobuf setLength:](v3, "setLength:", -[MRPlaybackSessionRequest length](self, "length"));
  -[_MRPlaybackSessionRequestProtobuf setHasLength:](v3, "setHasLength:", -[MRPlaybackSessionRequest hasLength](self, "hasLength"));
  return v3;
}

- (NSData)data
{
  void *v2;
  void *v3;

  -[MRPlaybackSessionRequest protobuf](self, "protobuf");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "data");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSData *)v3;
}

- (_NSRange)range
{
  unint64_t v3;
  NSUInteger v4;
  NSUInteger v5;
  _NSRange result;

  v3 = -[MRPlaybackSessionRequest location](self, "location");
  v4 = -[MRPlaybackSessionRequest length](self, "length");
  v5 = v3;
  result.length = v4;
  result.location = v5;
  return result;
}

- (void)setLocation:(unint64_t)a3
{
  self->_location = a3;
  self->_hasLocation = 1;
}

- (void)setLength:(unint64_t)a3
{
  self->_length = a3;
  self->_hasLength = 1;
}

- (BOOL)isEqual:(id)a3
{
  MRPlaybackSessionRequest *v4;
  MRPlaybackSessionRequest *v5;
  _BOOL4 v6;
  uint64_t v7;
  _BOOL4 v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  char v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;

  v4 = (MRPlaybackSessionRequest *)a3;
  if (v4 == self)
  {
    v16 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      v6 = -[MRPlaybackSessionRequest hasLocation](v5, "hasLocation");
      if (v6 != -[MRPlaybackSessionRequest hasLocation](self, "hasLocation"))
        goto LABEL_19;
      if (-[MRPlaybackSessionRequest hasLocation](v5, "hasLocation"))
      {
        if (-[MRPlaybackSessionRequest hasLocation](self, "hasLocation"))
        {
          v7 = -[MRPlaybackSessionRequest location](v5, "location");
          if (v7 != -[MRPlaybackSessionRequest location](self, "location"))
            goto LABEL_19;
        }
      }
      v8 = -[MRPlaybackSessionRequest hasLength](v5, "hasLength");
      if (v8 != -[MRPlaybackSessionRequest hasLength](self, "hasLength"))
        goto LABEL_19;
      if (-[MRPlaybackSessionRequest hasLength](v5, "hasLength"))
      {
        if (-[MRPlaybackSessionRequest hasLength](self, "hasLength"))
        {
          v9 = -[MRPlaybackSessionRequest length](v5, "length");
          if (v9 != -[MRPlaybackSessionRequest length](self, "length"))
            goto LABEL_19;
        }
      }
      -[MRPlaybackSessionRequest requestIdentifier](v5, "requestIdentifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[MRPlaybackSessionRequest requestIdentifier](self, "requestIdentifier");
      v11 = objc_claimAutoreleasedReturnValue();
      if (v10 == (void *)v11)
      {

      }
      else
      {
        v12 = (void *)v11;
        -[MRPlaybackSessionRequest requestIdentifier](v5, "requestIdentifier");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[MRPlaybackSessionRequest requestIdentifier](self, "requestIdentifier");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v13, "isEqualToString:", v14);

        if (!v15)
          goto LABEL_19;
      }
      -[MRPlaybackSessionRequest identifier](v5, "identifier");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[MRPlaybackSessionRequest identifier](self, "identifier");
      v18 = objc_claimAutoreleasedReturnValue();
      if (v17 == (void *)v18)
      {

      }
      else
      {
        v19 = (void *)v18;
        -[MRPlaybackSessionRequest identifier](v5, "identifier");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        -[MRPlaybackSessionRequest identifier](self, "identifier");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = objc_msgSend(v20, "isEqualToString:", v21);

        if (!v22)
        {
LABEL_19:
          v16 = 0;
LABEL_20:

          goto LABEL_21;
        }
      }
      -[MRPlaybackSessionRequest type](v5, "type");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[MRPlaybackSessionRequest type](self, "type");
      v25 = objc_claimAutoreleasedReturnValue();
      if (v24 == (void *)v25)
      {
        v16 = 1;
        v26 = v24;
      }
      else
      {
        v26 = (void *)v25;
        -[MRPlaybackSessionRequest type](v5, "type");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        -[MRPlaybackSessionRequest type](self, "type");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v27, "isEqualToString:", v28);

      }
      goto LABEL_20;
    }
    v16 = 0;
  }
LABEL_21:

  return v16;
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  -[MRPlaybackSessionRequest requestIdentifier](self, "requestIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRPlaybackSessionRequest identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRPlaybackSessionRequest type](self, "type");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("%@/%@/%@"), v4, v5, v6);

  return v7;
}

- (NSString)requestIdentifier
{
  return self->_requestIdentifier;
}

- (void)setRequestIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)type
{
  return self->_type;
}

- (void)setType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (unint64_t)location
{
  return self->_location;
}

- (BOOL)hasLocation
{
  return self->_hasLocation;
}

- (void)setHasLocation:(BOOL)a3
{
  self->_hasLocation = a3;
}

- (unint64_t)length
{
  return self->_length;
}

- (BOOL)hasLength
{
  return self->_hasLength;
}

- (void)setHasLength:(BOOL)a3
{
  self->_hasLength = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_type, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_requestIdentifier, 0);
}

@end
