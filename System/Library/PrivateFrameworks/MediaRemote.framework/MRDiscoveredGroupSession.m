@implementation MRDiscoveredGroupSession

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MRDiscoveredGroupSession)initWithIdentifier:(id)a3 hostInfo:(id)a4 source:(int64_t)a5
{
  id v9;
  id v10;
  MRDiscoveredGroupSession *v11;
  MRDiscoveredGroupSession *v12;
  objc_super v14;

  v9 = a3;
  v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)MRDiscoveredGroupSession;
  v11 = -[MRDiscoveredGroupSession init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_identifier, a3);
    objc_storeStrong((id *)&v12->_hostInfo, a4);
    v12->_source = a5;
  }

  return v12;
}

- (MRDiscoveredGroupSession)initWithIdentifier:(id)a3 hostInfo:(id)a4
{
  return -[MRDiscoveredGroupSession initWithIdentifier:hostInfo:source:](self, "initWithIdentifier:hostInfo:source:", a3, a4, 0);
}

- (MRDiscoveredGroupSession)initWithData:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  MRDiscoveredGroupSession *v9;
  id v10;
  NSObject *v11;
  id v13;
  _QWORD v14[3];

  v14[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  MSVPropertyListDataClasses();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "mutableCopy");

  v14[0] = objc_opt_class();
  objc_opt_self();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v14[1] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObjectsFromArray:", v8);

  v13 = 0;
  objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClasses:fromData:error:", v6, v4, &v13);
  v9 = (MRDiscoveredGroupSession *)objc_claimAutoreleasedReturnValue();

  v10 = v13;
  if (v10)
  {
    _MRLogForCategory(0xCuLL);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[MRDiscoveredGroupSession initWithData:].cold.1();

  }
  return v9;
}

- (MRDiscoveredGroupSession)initWithCoder:(id)a3
{
  id v4;
  MRDiscoveredGroupSession *v5;
  uint64_t v6;
  NSString *identifier;
  uint64_t v8;
  MRGroupSessionHostInfo *hostInfo;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MRDiscoveredGroupSession;
  v5 = -[MRDiscoveredGroupSession init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("id"));
    v6 = objc_claimAutoreleasedReturnValue();
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("hst"));
    v8 = objc_claimAutoreleasedReturnValue();
    hostInfo = v5->_hostInfo;
    v5->_hostInfo = (MRGroupSessionHostInfo *)v8;

    v5->_source = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("src"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *identifier;
  id v5;

  identifier = self->_identifier;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", identifier, CFSTR("id"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_hostInfo, CFSTR("hst"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_source, CFSTR("src"));

}

- (BOOL)isEqual:(id)a3
{
  MRDiscoveredGroupSession *v4;
  MRDiscoveredGroupSession *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int64_t v10;
  BOOL v11;

  v4 = (MRDiscoveredGroupSession *)a3;
  if (v4 == self)
  {
    v11 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[MRDiscoveredGroupSession identifier](self, "identifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[MRDiscoveredGroupSession identifier](v5, "identifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v6, "isEqual:", v7))
      {
        -[MRDiscoveredGroupSession hostInfo](self, "hostInfo");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        -[MRDiscoveredGroupSession hostInfo](v5, "hostInfo");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v8, "isEqual:", v9))
        {
          v10 = -[MRDiscoveredGroupSession source](self, "source");
          v11 = v10 == -[MRDiscoveredGroupSession source](v5, "source");
        }
        else
        {
          v11 = 0;
        }

      }
      else
      {
        v11 = 0;
      }

    }
    else
    {
      v11 = 0;
    }
  }

  return v11;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@ %@ - hostInfo: %@>"), objc_opt_class(), self->_identifier, self->_hostInfo);
}

- (unint64_t)hash
{
  NSUInteger v3;

  v3 = -[NSString hash](self->_identifier, "hash");
  return v3 ^ self->_source ^ -[MRGroupSessionHostInfo routeType](self->_hostInfo, "routeType");
}

- (NSData)data
{
  return (NSData *)objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", self, 1, 0);
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[MRDiscoveredGroupSession initWithIdentifier:hostInfo:source:]([MRDiscoveredGroupSession alloc], "initWithIdentifier:hostInfo:source:", self->_identifier, self->_hostInfo, self->_source);
}

- (NSString)identifier
{
  return self->_identifier;
}

- (MRGroupSessionHostInfo)hostInfo
{
  return self->_hostInfo;
}

- (int64_t)source
{
  return self->_source;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hostInfo, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

- (void)initWithData:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_5();
  OUTLINED_FUNCTION_5(&dword_193827000, v0, v1, "[MRGroupSession] Failed to decode MRDiscoveredGroupSession: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_8();
}

@end
