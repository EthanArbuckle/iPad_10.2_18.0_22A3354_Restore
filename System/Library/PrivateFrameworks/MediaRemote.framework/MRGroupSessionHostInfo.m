@implementation MRGroupSessionHostInfo

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MRGroupSessionHostInfo)initWithRouteType:(unsigned __int8)a3 displayName:(id)a4 modelIdentifier:(id)a5 color:(id)a6
{
  id v10;
  id v11;
  id v12;
  MRGroupSessionHostInfo *v13;
  MRGroupSessionHostInfo *v14;
  uint64_t v15;
  NSString *displayName;
  uint64_t v17;
  NSString *modelIdentifier;
  uint64_t v19;
  NSString *color;
  objc_super v22;

  v10 = a4;
  v11 = a5;
  v12 = a6;
  v22.receiver = self;
  v22.super_class = (Class)MRGroupSessionHostInfo;
  v13 = -[MRGroupSessionHostInfo init](&v22, sel_init);
  v14 = v13;
  if (v13)
  {
    v13->_routeType = a3;
    v15 = objc_msgSend(v10, "copy");
    displayName = v14->_displayName;
    v14->_displayName = (NSString *)v15;

    v17 = objc_msgSend(v11, "copy");
    modelIdentifier = v14->_modelIdentifier;
    v14->_modelIdentifier = (NSString *)v17;

    v19 = objc_msgSend(v12, "copy");
    color = v14->_color;
    v14->_color = (NSString *)v19;

  }
  return v14;
}

- (MRGroupSessionHostInfo)initWithRouteType:(unsigned __int8)a3 displayName:(id)a4
{
  return -[MRGroupSessionHostInfo initWithRouteType:displayName:modelIdentifier:color:](self, "initWithRouteType:displayName:modelIdentifier:color:", a3, a4, 0, 0);
}

- (MRGroupSessionHostInfo)initWithCoder:(id)a3
{
  id v4;
  MRGroupSessionHostInfo *v5;
  uint64_t v6;
  NSString *displayName;
  uint64_t v8;
  NSString *modelIdentifier;
  uint64_t v10;
  NSString *color;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)MRGroupSessionHostInfo;
  v5 = -[MRGroupSessionHostInfo init](&v13, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("dn"));
    v6 = objc_claimAutoreleasedReturnValue();
    displayName = v5->_displayName;
    v5->_displayName = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("dm"));
    v8 = objc_claimAutoreleasedReturnValue();
    modelIdentifier = v5->_modelIdentifier;
    v5->_modelIdentifier = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("dc"));
    v10 = objc_claimAutoreleasedReturnValue();
    color = v5->_color;
    v5->_color = (NSString *)v10;

    v5->_routeType = objc_msgSend(v4, "decodeIntForKey:", CFSTR("rt"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t routeType;
  id v5;

  routeType = self->_routeType;
  v5 = a3;
  objc_msgSend(v5, "encodeInt:forKey:", routeType, CFSTR("rt"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_displayName, CFSTR("dn"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_modelIdentifier, CFSTR("dm"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_color, CFSTR("dc"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[MRGroupSessionHostInfo initWithRouteType:displayName:modelIdentifier:color:]([MRGroupSessionHostInfo alloc], "initWithRouteType:displayName:modelIdentifier:color:", self->_routeType, self->_displayName, self->_modelIdentifier, self->_color);
}

- (BOOL)isEqual:(id)a3
{
  MRGroupSessionHostInfo *v4;
  MRGroupSessionHostInfo *v5;
  NSString *displayName;
  void *v7;
  int routeType;
  BOOL v9;

  v4 = (MRGroupSessionHostInfo *)a3;
  if (v4 == self)
  {
    v9 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      displayName = self->_displayName;
      -[MRGroupSessionHostInfo displayName](v5, "displayName");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (-[NSString isEqual:](displayName, "isEqual:", v7))
      {
        routeType = self->_routeType;
        v9 = routeType == -[MRGroupSessionHostInfo routeType](v5, "routeType");
      }
      else
      {
        v9 = 0;
      }

    }
    else
    {
      v9 = 0;
    }
  }

  return v9;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  unsigned int v5;
  const __CFString *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  v5 = self->_routeType - 1;
  if (v5 > 0xA)
    v6 = CFSTR("Unknown");
  else
    v6 = off_1E30CF748[(char)v5];
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p displayName=%@ routeType=%@ modelID=%@>"), v4, self, self->_displayName, v6, self->_modelIdentifier);
}

- (unint64_t)hash
{
  NSUInteger v3;
  void *v4;
  unint64_t v5;

  v3 = -[NSString hash](self->_displayName, "hash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", self->_routeType);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash") ^ v3;

  return v5;
}

- (NSString)localizedSessionName
{
  return (NSString *)MRGroupSessionRouteMakeName(self->_displayName, self->_routeType);
}

- (BOOL)isLockScreenAffordanceAllowed
{
  return -[MRGroupSessionHostInfo routeType](self, "routeType") - 1 < 2;
}

- (BOOL)isInAppBannerAllowed
{
  void *v2;
  char v3;

  -[MRGroupSessionHostInfo modelIdentifier](self, "modelIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "containsString:", CFSTR("AudioAccessory")) ^ 1;

  return v3;
}

- (NSString)displayName
{
  return self->_displayName;
}

- (unsigned)routeType
{
  return self->_routeType;
}

- (NSString)modelIdentifier
{
  return self->_modelIdentifier;
}

- (NSString)color
{
  return self->_color;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_color, 0);
  objc_storeStrong((id *)&self->_modelIdentifier, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
}

@end
