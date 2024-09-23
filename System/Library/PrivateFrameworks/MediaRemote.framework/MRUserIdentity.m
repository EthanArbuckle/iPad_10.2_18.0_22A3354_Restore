@implementation MRUserIdentity

+ (id)basicIdentityWithIdentifier:(id)a3 displayName:(id)a4
{
  id v5;
  id v6;
  MRUserIdentity *v7;

  v5 = a4;
  v6 = a3;
  v7 = -[MRUserIdentity initWithIdentifier:displayName:type:]([MRUserIdentity alloc], "initWithIdentifier:displayName:type:", v6, v5, 0);

  return v7;
}

+ (id)resolvableIdentityWithIdentifier:(id)a3
{
  id v3;
  MRUserIdentity *v4;

  v3 = a3;
  v4 = -[MRUserIdentity initWithIdentifier:displayName:type:]([MRUserIdentity alloc], "initWithIdentifier:displayName:type:", v3, 0, 1);

  return v4;
}

+ (id)resolvableIdentityWithIdentifier:(id)a3 displayName:(id)a4
{
  id v5;
  id v6;
  MRUserIdentity *v7;

  v5 = a4;
  v6 = a3;
  v7 = -[MRUserIdentity initWithIdentifier:displayName:type:]([MRUserIdentity alloc], "initWithIdentifier:displayName:type:", v6, v5, 1);

  return v7;
}

+ (void)fetchIdentityForDSID:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;

  v5 = a4;
  v6 = a3;
  MRGetSharedService();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  MRGroupSessionSubsystemGetNotificationQueue();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __50__MRUserIdentity_fetchIdentityForDSID_completion___block_invoke;
  v10[3] = &unk_1E30CA138;
  v11 = v5;
  v9 = v5;
  objc_msgSend(v7, "userIdentityForDSID:queue:completion:", v6, v8, v10);

}

uint64_t __50__MRUserIdentity_fetchIdentityForDSID_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (MRUserIdentity)initWithIdentifier:(id)a3 displayName:(id)a4 type:(int64_t)a5
{
  id v8;
  id v9;
  MRUserIdentity *v10;
  uint64_t v11;
  NSString *identifier;
  uint64_t v13;
  NSString *displayName;
  objc_super v16;

  v8 = a3;
  v9 = a4;
  v16.receiver = self;
  v16.super_class = (Class)MRUserIdentity;
  v10 = -[MRUserIdentity init](&v16, sel_init);
  if (v10)
  {
    v11 = objc_msgSend(v8, "copy");
    identifier = v10->_identifier;
    v10->_identifier = (NSString *)v11;

    v13 = objc_msgSend(v9, "copy");
    displayName = v10->_displayName;
    v10->_displayName = (NSString *)v13;

    v10->_type = a5;
  }

  return v10;
}

- (MRUserIdentity)initWithProtobuf:(id)a3
{
  id v4;
  MRUserIdentity *v5;
  uint64_t v6;
  NSString *identifier;
  uint64_t v8;
  NSString *displayName;
  MRUserIdentity *v10;
  objc_super v12;

  v4 = a3;
  if (v4)
  {
    v12.receiver = self;
    v12.super_class = (Class)MRUserIdentity;
    v5 = -[MRUserIdentity init](&v12, sel_init);
    if (v5)
    {
      objc_msgSend(v4, "identifier");
      v6 = objc_claimAutoreleasedReturnValue();
      identifier = v5->_identifier;
      v5->_identifier = (NSString *)v6;

      objc_msgSend(v4, "displayName");
      v8 = objc_claimAutoreleasedReturnValue();
      displayName = v5->_displayName;
      v5->_displayName = (NSString *)v8;

      v5->_type = (int)objc_msgSend(v4, "type");
    }
    self = v5;
    v10 = self;
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (MRUserIdentity)initWithProtobufData:(id)a3
{
  id v4;
  _MRUserIdentityProtobuf *v5;
  MRUserIdentity *v6;

  if (a3)
  {
    v4 = a3;
    v5 = -[_MRUserIdentityProtobuf initWithData:]([_MRUserIdentityProtobuf alloc], "initWithData:", v4);

    self = -[MRUserIdentity initWithProtobuf:](self, "initWithProtobuf:", v5);
    v6 = self;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (MRUserIdentity)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  MRUserIdentity *v6;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("protobufData"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[MRUserIdentity initWithProtobufData:](self, "initWithProtobufData:", v5);
  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[MRUserIdentity protobuf](self, "protobuf");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "data");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("protobufData"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)description
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  v4 = objc_opt_class();
  -[MRUserIdentity identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRUserIdentity displayName](self, "displayName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<%@: identifier=%@, displayName=%@, type=%ld>"), v4, v5, v6, -[MRUserIdentity type](self, "type"));

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  MRUserIdentity *v4;
  MRUserIdentity *v5;
  NSString *identifier;
  NSString *v7;
  NSString *v8;
  NSString *v9;
  int v10;
  BOOL v11;
  NSString *displayName;
  NSString *v13;
  NSString *v14;
  NSString *v15;
  int v16;

  v4 = (MRUserIdentity *)a3;
  if (self == v4)
  {
    v11 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      identifier = self->_identifier;
      v7 = v5->_identifier;
      if (identifier == v7)
      {

      }
      else
      {
        v8 = v7;
        v9 = identifier;
        v10 = -[NSString isEqual:](v9, "isEqual:", v8);

        if (!v10)
          goto LABEL_11;
      }
      displayName = self->_displayName;
      v13 = v5->_displayName;
      if (displayName == v13)
      {

      }
      else
      {
        v14 = v13;
        v15 = displayName;
        v16 = -[NSString isEqual:](v15, "isEqual:", v14);

        if (!v16)
        {
LABEL_11:
          v11 = 0;
LABEL_14:

          goto LABEL_15;
        }
      }
      v11 = self->_type == v5->_type;
      goto LABEL_14;
    }
    v11 = 0;
  }
LABEL_15:

  return v11;
}

- (unint64_t)hash
{
  NSUInteger v3;

  v3 = -[NSString hash](self->_identifier, "hash");
  return -[NSString hash](self->_displayName, "hash") ^ v3;
}

- (_MRUserIdentityProtobuf)protobuf
{
  _MRUserIdentityProtobuf *v3;
  void *v4;
  void *v5;

  v3 = objc_alloc_init(_MRUserIdentityProtobuf);
  -[MRUserIdentity identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MRUserIdentityProtobuf setIdentifier:](v3, "setIdentifier:", v4);

  -[MRUserIdentity displayName](self, "displayName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MRUserIdentityProtobuf setDisplayName:](v3, "setDisplayName:", v5);

  -[_MRUserIdentityProtobuf setType:](v3, "setType:", -[MRUserIdentity type](self, "type"));
  return v3;
}

- (NSData)protobufData
{
  void *v2;
  void *v3;

  -[MRUserIdentity protobuf](self, "protobuf");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "data");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSData *)v3;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)displayName
{
  return self->_displayName;
}

- (int64_t)type
{
  return self->_type;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
