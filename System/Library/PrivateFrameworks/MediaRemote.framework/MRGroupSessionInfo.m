@implementation MRGroupSessionInfo

- (MRGroupSessionInfo)initWithIdentifier:(id)a3 hostInfo:(id)a4 isHosted:(BOOL)a5 equivalentMediaIdentifier:(id)a6 isPlaceholder:(BOOL)a7
{
  id v12;
  id v13;
  id v14;
  MRGroupSessionInfo *v15;
  uint64_t v16;
  NSString *identifier;
  objc_super v19;

  v12 = a3;
  v13 = a4;
  v14 = a6;
  v19.receiver = self;
  v19.super_class = (Class)MRGroupSessionInfo;
  v15 = -[MRGroupSessionInfo init](&v19, sel_init);
  if (v15)
  {
    v16 = objc_msgSend(v12, "copy");
    identifier = v15->_identifier;
    v15->_identifier = (NSString *)v16;

    objc_storeStrong((id *)&v15->_hostInfo, a4);
    v15->_isHosted = a5;
    objc_storeStrong((id *)&v15->_equivalentMediaIdentifier, a6);
    v15->_placeholder = a7;
  }

  return v15;
}

- (MRGroupSessionInfo)initWithToken:(id)a3 isHosted:(BOOL)a4 isPlaceholder:(BOOL)a5
{
  _BOOL8 v6;
  _BOOL8 v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  MRGroupSessionInfo *v12;

  if (a3)
  {
    v6 = a5;
    v7 = a4;
    v8 = a3;
    objc_msgSend(v8, "sessionIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "hostInfo");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "equivalentMediaIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    self = -[MRGroupSessionInfo initWithIdentifier:hostInfo:isHosted:equivalentMediaIdentifier:isPlaceholder:](self, "initWithIdentifier:hostInfo:isHosted:equivalentMediaIdentifier:isPlaceholder:", v9, v10, v7, v11, v6);
    v12 = self;
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (MRGroupSessionInfo)initWithToken:(id)a3 isHosted:(BOOL)a4
{
  return -[MRGroupSessionInfo initWithToken:isHosted:isPlaceholder:](self, "initWithToken:isHosted:isPlaceholder:", a3, a4, 0);
}

- (MRGroupSessionInfo)initWithProtobuf:(id)a3
{
  id v4;
  MRGroupSessionHostInfo *v5;
  unsigned int v6;
  uint64_t v7;
  void *v8;
  MRGroupSessionHostInfo *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  MRGroupSessionInfo *v13;

  v4 = a3;
  v5 = [MRGroupSessionHostInfo alloc];
  v6 = objc_msgSend(v4, "routeType") - 1;
  if (v6 > 0xA)
    v7 = 0;
  else
    v7 = byte_193ADA8A0[v6];
  objc_msgSend(v4, "hostDisplayName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[MRGroupSessionHostInfo initWithRouteType:displayName:](v5, "initWithRouteType:displayName:", v7, v8);

  objc_msgSend(v4, "identifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v4, "hosted");
  objc_msgSend(v4, "equivalentMediaIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[MRGroupSessionInfo initWithIdentifier:hostInfo:isHosted:equivalentMediaIdentifier:isPlaceholder:](self, "initWithIdentifier:hostInfo:isHosted:equivalentMediaIdentifier:isPlaceholder:", v10, v9, v11, v12, objc_msgSend(v4, "placeholder"));

  return v13;
}

- (_MRGroupSessionInfoProtobuf)protobuf
{
  _MRGroupSessionInfoProtobuf *v3;
  void *v4;
  unsigned int v5;
  uint64_t v6;

  v3 = objc_alloc_init(_MRGroupSessionInfoProtobuf);
  -[_MRGroupSessionInfoProtobuf setIdentifier:](v3, "setIdentifier:", self->_identifier);
  -[MRGroupSessionHostInfo displayName](self->_hostInfo, "displayName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MRGroupSessionInfoProtobuf setHostDisplayName:](v3, "setHostDisplayName:", v4);

  v5 = -[MRGroupSessionHostInfo routeType](self->_hostInfo, "routeType") - 1;
  if (v5 > 0xA)
    v6 = 0;
  else
    v6 = dword_193ADA8AC[(char)v5];
  -[_MRGroupSessionInfoProtobuf setRouteType:](v3, "setRouteType:", v6);
  -[_MRGroupSessionInfoProtobuf setHosted:](v3, "setHosted:", self->_isHosted);
  -[_MRGroupSessionInfoProtobuf setEquivalentMediaIdentifier:](v3, "setEquivalentMediaIdentifier:", self->_equivalentMediaIdentifier);
  -[_MRGroupSessionInfoProtobuf setPlaceholder:](v3, "setPlaceholder:", self->_placeholder);
  return v3;
}

- (id)description
{
  id v3;
  uint64_t v4;
  void *v5;
  const __CFString *v6;
  NSString *equivalentMediaIdentifier;
  const __CFString *v8;
  void *v9;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  v4 = objc_opt_class();
  -[MRGroupSessionInfo identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[MRGroupSessionInfo isHosted](self, "isHosted"))
    v6 = CFSTR("YES");
  else
    v6 = CFSTR("NO");
  equivalentMediaIdentifier = self->_equivalentMediaIdentifier;
  if (-[MRGroupSessionInfo isPlaceholder](self, "isPlaceholder"))
    v8 = CFSTR("YES");
  else
    v8 = CFSTR("NO");
  v9 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<%@: identifier=%@, hosted=%@, mediaID=%@, placeholder=%@>"), v4, v5, v6, equivalentMediaIdentifier, v8);

  return v9;
}

- (NSString)effectiveIdentifier
{
  void *v3;
  void *v4;
  id v5;
  void *v6;

  -[MRGroupSessionInfo equivalentMediaIdentifier](self, "equivalentMediaIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    -[MRGroupSessionInfo identifier](self, "identifier");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  return (NSString *)v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  -[MRGroupSessionInfo identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeObject:forKey:", v4, CFSTR("identifier"));

  -[MRGroupSessionInfo hostInfo](self, "hostInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeObject:forKey:", v5, CFSTR("hostInfo"));

  objc_msgSend(v7, "encodeBool:forKey:", -[MRGroupSessionInfo isHosted](self, "isHosted"), CFSTR("hosted"));
  -[MRGroupSessionInfo equivalentMediaIdentifier](self, "equivalentMediaIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeObject:forKey:", v6, CFSTR("mediaID"));

  objc_msgSend(v7, "encodeBool:forKey:", -[MRGroupSessionInfo isPlaceholder](self, "isPlaceholder"), CFSTR("placeholder"));
}

- (MRGroupSessionInfo)initWithCoder:(id)a3
{
  id v4;
  MRGroupSessionInfo *v5;
  uint64_t v6;
  NSString *identifier;
  uint64_t v8;
  MRGroupSessionHostInfo *hostInfo;
  uint64_t v10;
  NSString *equivalentMediaIdentifier;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)MRGroupSessionInfo;
  v5 = -[MRGroupSessionInfo init](&v13, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("hostInfo"));
    v8 = objc_claimAutoreleasedReturnValue();
    hostInfo = v5->_hostInfo;
    v5->_hostInfo = (MRGroupSessionHostInfo *)v8;

    v5->_isHosted = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("hosted"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("mediaID"));
    v10 = objc_claimAutoreleasedReturnValue();
    equivalentMediaIdentifier = v5->_equivalentMediaIdentifier;
    v5->_equivalentMediaIdentifier = (NSString *)v10;

    v5->_placeholder = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("placeholder"));
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  MRGroupSessionInfo *v4;
  NSString *identifier;
  NSString *v6;
  NSString *v7;
  NSString *v8;
  char v9;

  v4 = (MRGroupSessionInfo *)a3;
  if (self == v4)
  {
    v9 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      identifier = self->_identifier;
      v6 = v4->_identifier;
      v7 = identifier;
      v8 = v7;
      if (v7 == v6)
        v9 = 1;
      else
        v9 = -[NSString isEqual:](v7, "isEqual:", v6);

    }
    else
    {
      v9 = 0;
    }
  }

  return v9;
}

- (unint64_t)hash
{
  return -[NSString hash](self->_identifier, "hash");
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)equivalentMediaIdentifier
{
  return self->_equivalentMediaIdentifier;
}

- (MRGroupSessionHostInfo)hostInfo
{
  return self->_hostInfo;
}

- (BOOL)isHosted
{
  return self->_isHosted;
}

- (BOOL)isPlaceholder
{
  return self->_placeholder;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hostInfo, 0);
  objc_storeStrong((id *)&self->_equivalentMediaIdentifier, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
