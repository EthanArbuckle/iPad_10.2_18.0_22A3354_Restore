@implementation MROrigin

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayName, 0);
}

- (id)copyWithZone:(_NSZone *)a3
{
  MROrigin *v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend((id)objc_opt_class(), "localOrigin");
  v4 = (MROrigin *)objc_claimAutoreleasedReturnValue();

  if (v4 == self)
    return self;
  v5 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_msgSend(v5, "setIdentifier:", -[MROrigin identifier](self, "identifier"));
  objc_msgSend(v5, "setType:", -[MROrigin type](self, "type"));
  -[MROrigin displayName](self, "displayName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "copyWithZone:", a3);
  objc_msgSend(v5, "setDisplayName:", v7);

  objc_msgSend(v5, "setLocallyHosted:", -[MROrigin isLocallyHosted](self, "isLocallyHosted"));
  return v5;
}

+ (MROrigin)localOrigin
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __23__MROrigin_localOrigin__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (localOrigin_onceToken != -1)
    dispatch_once(&localOrigin_onceToken, block);
  return (MROrigin *)(id)localOrigin_origin;
}

- (BOOL)isLocal
{
  return self->_type == 0;
}

- (void)setLocallyHosted:(BOOL)a3
{
  self->_locallyHosted = a3;
}

- (void)setDisplayName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (void)setIdentifier:(int)a3
{
  self->_identifier = a3;
}

- (_MROriginProtobuf)protobuf
{
  _MROriginProtobuf *v3;
  uint64_t v4;
  void *v5;

  v3 = objc_alloc_init(_MROriginProtobuf);
  if (-[MROrigin type](self, "type") == 1)
    v4 = 2;
  else
    v4 = 1;
  -[_MROriginProtobuf setType:](v3, "setType:", v4);
  -[_MROriginProtobuf setHasType:](v3, "setHasType:", -[MROrigin type](self, "type") != 0);
  -[MROrigin displayName](self, "displayName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MROriginProtobuf setDisplayName:](v3, "setDisplayName:", v5);

  -[_MROriginProtobuf setIdentifier:](v3, "setIdentifier:", -[MROrigin identifier](self, "identifier"));
  -[_MROriginProtobuf setHasIdentifier:](v3, "setHasIdentifier:", -[MROrigin identifier](self, "identifier") != 0);
  -[_MROriginProtobuf setIsLocallyHosted:](v3, "setIsLocallyHosted:", -[MROrigin isLocallyHosted](self, "isLocallyHosted"));
  -[_MROriginProtobuf setHasIsLocallyHosted:](v3, "setHasIsLocallyHosted:", -[MROrigin isLocallyHosted](self, "isLocallyHosted"));
  return v3;
}

- (BOOL)isLocallyHosted
{
  return self->_locallyHosted;
}

- (int)identifier
{
  return self->_identifier;
}

- (int64_t)type
{
  return self->_type;
}

- (NSString)displayName
{
  return self->_displayName;
}

- (MROrigin)initWithProtobuf:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  int v7;
  MROrigin *v8;
  _BOOL8 v9;
  void *v10;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v6 = objc_msgSend(v4, "identifier");
    v7 = objc_msgSend(v5, "type");
    if (v7 == 2 || (_DWORD)v6 != 1280262988)
    {
      v9 = v7 == 2;
      objc_msgSend(v5, "displayName");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      self = -[MROrigin initWithIdentifier:type:displayName:](self, "initWithIdentifier:type:displayName:", v6, v9, v10);

      -[MROrigin setLocallyHosted:](self, "setLocallyHosted:", objc_msgSend(v5, "isLocallyHosted"));
      v8 = self;
    }
    else
    {
      objc_msgSend((id)objc_opt_class(), "localOrigin");
      v8 = (MROrigin *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  return self->_identifier;
}

+ (MROrigin)anyOrigin
{
  return (MROrigin *)objc_alloc_init((Class)a1);
}

- (BOOL)isEqual:(id)a3
{
  MROrigin *v4;
  MROrigin *v5;
  int v6;
  uint64_t v7;
  BOOL v8;

  v4 = (MROrigin *)a3;
  if (v4 == self)
  {
    v8 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      v6 = -[MROrigin identifier](v5, "identifier");
      if (v6 == -[MROrigin identifier](self, "identifier"))
      {
        v7 = -[MROrigin type](v5, "type");
        v8 = v7 == -[MROrigin type](self, "type");
      }
      else
      {
        v8 = 0;
      }

    }
    else
    {
      v8 = 0;
    }
  }

  return v8;
}

void __23__MROrigin_localOrigin__block_invoke_2()
{
  id v0;

  v0 = (id)MSVCopyLocalizedModelName();
  objc_msgSend((id)localOrigin_origin, "setDisplayName:", v0);

}

void __23__MROrigin_localOrigin__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  NSObject *v3;

  v1 = objc_msgSend(objc_alloc(*(Class *)(a1 + 32)), "initWithIdentifier:type:displayName:", 1280262988, 0, CFSTR("Loading…"));
  v2 = (void *)localOrigin_origin;
  localOrigin_origin = v1;

  objc_msgSend((id)localOrigin_origin, "setLocallyHosted:", 1);
  dispatch_get_global_queue(21, 0);
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_async(v3, &__block_literal_global_26);

}

- (MROrigin)initWithIdentifier:(int)a3 type:(int64_t)a4 displayName:(id)a5
{
  id v8;
  MROrigin *v9;
  MROrigin *v10;
  uint64_t v11;
  NSString *displayName;
  objc_super v14;

  v8 = a5;
  v14.receiver = self;
  v14.super_class = (Class)MROrigin;
  v9 = -[MROrigin init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    v9->_identifier = a3;
    v9->_type = a4;
    v11 = objc_msgSend(v8, "copy");
    displayName = v10->_displayName;
    v10->_displayName = (NSString *)v11;

  }
  return v10;
}

- (MROrigin)initWithData:(id)a3
{
  id v4;
  _MROriginProtobuf *v5;
  MROrigin *v6;

  if (a3)
  {
    v4 = a3;
    v5 = -[_MROriginProtobuf initWithData:]([_MROriginProtobuf alloc], "initWithData:", v4);

    self = -[MROrigin initWithProtobuf:](self, "initWithProtobuf:", v5);
    v6 = self;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (NSData)data
{
  void *v2;
  void *v3;

  -[MROrigin protobuf](self, "protobuf");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "data");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSData *)v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[MROrigin data](self, "data");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:", v5);

}

- (MROrigin)initWithCoder:(id)a3
{
  void *v4;
  MROrigin *v5;

  objc_msgSend(a3, "decodeObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[MROrigin initWithData:](self, "initWithData:", v4);

  return v5;
}

- (MROrigin)skeleton
{
  id v3;
  uint64_t v4;
  int64_t v5;
  void *v6;
  void *v7;

  v3 = objc_alloc((Class)objc_opt_class());
  v4 = -[MROrigin identifier](self, "identifier");
  v5 = -[MROrigin type](self, "type");
  -[MROrigin displayName](self, "displayName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v3, "initWithIdentifier:type:displayName:", v4, v5, v6);

  return (MROrigin *)v7;
}

- (BOOL)isHosted
{
  return !-[MROrigin isLocal](self, "isLocal") && -[MROrigin isLocallyHosted](self, "isLocallyHosted");
}

- (MRPlayerPath)playerPath
{
  return -[MRPlayerPath initWithOrigin:client:player:]([MRPlayerPath alloc], "initWithOrigin:client:player:", self, 0, 0);
}

- (id)description
{
  id v3;
  void *v4;
  uint64_t v5;
  _BOOL4 v6;
  const __CFString *v7;
  void *v8;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  -[MROrigin displayName](self, "displayName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[MROrigin identifier](self, "identifier");
  v6 = -[MROrigin isLocallyHosted](self, "isLocallyHosted");
  v7 = &stru_1E30D5AF8;
  if (v6)
    v7 = CFSTR(":LH");
  v8 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<origin:%@:%d%@>"), v4, v5, v7);

  return v8;
}

- (void)setLocal:(BOOL)a3
{
  self->_local = a3;
}

@end
