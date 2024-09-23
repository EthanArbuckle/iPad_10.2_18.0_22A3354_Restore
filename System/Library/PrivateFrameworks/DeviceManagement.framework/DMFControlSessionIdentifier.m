@implementation DMFControlSessionIdentifier

- (id)stringValue
{
  void *v3;
  void *v4;
  void *v5;
  unsigned int v6;
  in_addr v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[DMFControlGroupIdentifier organizationUUID](self, "organizationUUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "UUIDString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[DMFControlGroupIdentifier groupID](self, "groupID");
  v7.s_addr = self->_leaderIP;
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@:%d:%s:%d"), v5, v6, inet_ntoa(v7), -[DMFControlSessionIdentifier port](self, "port"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (DMFControlGroupIdentifier)groupIdentifier
{
  DMFControlGroupIdentifier *v3;
  void *v4;
  DMFControlGroupIdentifier *v5;

  v3 = [DMFControlGroupIdentifier alloc];
  -[DMFControlGroupIdentifier organizationUUID](self, "organizationUUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[DMFControlGroupIdentifier initWithOrganizationUUID:groupID:](v3, "initWithOrganizationUUID:groupID:", v4, -[DMFControlGroupIdentifier groupID](self, "groupID"));

  return v5;
}

- (DMFControlSessionIdentifier)initWithOrganizationUUID:(id)a3 groupID:(unsigned __int16)a4
{
  uint64_t v4;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  DMFControlSessionIdentifier *v12;

  v4 = a4;
  v7 = (void *)MEMORY[0x1E0CB3488];
  v8 = a3;
  objc_msgSend(v7, "currentHandler");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_opt_class();
  NSStringFromSelector(a2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("DMFControlSessionIdentifier.m"), 35, CFSTR("%@ cannot call %@"), v10, v11);

  v12 = -[DMFControlSessionIdentifier initWithOrganizationUUID:groupID:leaderIP:port:](self, "initWithOrganizationUUID:groupID:leaderIP:port:", v8, v4, 0, 3283);
  return v12;
}

- (DMFControlSessionIdentifier)initWithOrganizationUUID:(id)a3 groupID:(unsigned __int16)a4 leaderIP:(unsigned int)a5
{
  return -[DMFControlSessionIdentifier initWithOrganizationUUID:groupID:leaderIP:port:](self, "initWithOrganizationUUID:groupID:leaderIP:port:", a3, a4, *(_QWORD *)&a5, 3283);
}

- (DMFControlSessionIdentifier)initWithString:(id)a3
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  unsigned __int16 v11;
  DMFControlSessionIdentifier *v12;
  id v13;
  in_addr_t v14;
  uint64_t v15;
  void *v16;
  unsigned __int16 v17;
  void *v19;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("DMFControlSessionIdentifier.m"), 49, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("string"));

  }
  objc_msgSend(v5, "componentsSeparatedByString:", CFSTR(":"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_alloc(MEMORY[0x1E0CB3A28]);
  objc_msgSend(v6, "firstObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v7, "initWithUUIDString:", v8);

  if (v9)
  {
    if ((unint64_t)objc_msgSend(v6, "count") < 2)
    {
      v11 = 0;
    }
    else
    {
      objc_msgSend(v6, "objectAtIndexedSubscript:", 1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "intValue");

    }
    if ((unint64_t)objc_msgSend(v6, "count") < 3)
    {
      v15 = 0;
    }
    else
    {
      objc_msgSend(v6, "objectAtIndexedSubscript:", 2);
      v13 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v14 = inet_addr((const char *)objc_msgSend(v13, "UTF8String"));

      if (v14 == -1)
        v15 = 0;
      else
        v15 = v14;
    }
    if ((unint64_t)objc_msgSend(v6, "count") < 4)
    {
      v16 = 0;
    }
    else
    {
      objc_msgSend(v6, "objectAtIndexedSubscript:", 3);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
    }
    if (objc_msgSend(v16, "length"))
      v17 = objc_msgSend(v16, "intValue");
    else
      v17 = 3283;
    self = -[DMFControlSessionIdentifier initWithOrganizationUUID:groupID:leaderIP:port:](self, "initWithOrganizationUUID:groupID:leaderIP:port:", v9, v11, v15, v17);

    v12 = self;
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (DMFControlSessionIdentifier)initWithOrganizationUUID:(id)a3 groupID:(unsigned __int16)a4 leaderIP:(unsigned int)a5 port:(unsigned __int16)a6
{
  DMFControlSessionIdentifier *result;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)DMFControlSessionIdentifier;
  result = -[DMFControlGroupIdentifier initWithOrganizationUUID:groupID:](&v9, sel_initWithOrganizationUUID_groupID_, a3, a4);
  if (result)
  {
    result->_leaderIP = a5;
    result->_port = a6;
  }
  return result;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;

  -[DMFControlGroupIdentifier organizationUUID](self, "organizationUUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  v5 = v4 ^ -[DMFControlGroupIdentifier groupID](self, "groupID");
  v6 = -[DMFControlSessionIdentifier leaderIP](self, "leaderIP");
  v7 = v5 ^ v6 ^ -[DMFControlSessionIdentifier port](self, "port");

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)DMFControlSessionIdentifier;
  if (-[DMFControlGroupIdentifier isEqual:](&v7, sel_isEqual_, v4))
    v5 = -[DMFControlSessionIdentifier isEqualToControlSessionIdentifier:](self, "isEqualToControlSessionIdentifier:", v4);
  else
    v5 = 0;

  return v5;
}

- (BOOL)isEqualToControlSessionIdentifier:(id)a3
{
  id v4;
  unsigned int v5;
  int v6;
  BOOL v7;

  v4 = a3;
  v5 = -[DMFControlSessionIdentifier leaderIP](self, "leaderIP");
  if (v5 == objc_msgSend(v4, "leaderIP"))
  {
    v6 = -[DMFControlSessionIdentifier port](self, "port");
    v7 = v6 == objc_msgSend(v4, "port");
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = objc_alloc((Class)objc_opt_class());
  -[DMFControlGroupIdentifier organizationUUID](self, "organizationUUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithOrganizationUUID:groupID:leaderIP:port:", v5, -[DMFControlGroupIdentifier groupID](self, "groupID"), -[DMFControlSessionIdentifier leaderIP](self, "leaderIP"), -[DMFControlSessionIdentifier port](self, "port"));

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DMFControlSessionIdentifier)initWithCoder:(id)a3
{
  id v4;
  DMFControlSessionIdentifier *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)DMFControlSessionIdentifier;
  v5 = -[DMFControlGroupIdentifier initWithCoder:](&v9, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("leaderIP"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_leaderIP = objc_msgSend(v6, "unsignedIntegerValue");

    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("port")))
    {
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("port"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v5->_port = objc_msgSend(v7, "unsignedIntegerValue");

    }
    else
    {
      v5->_port = 3283;
    }
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)DMFControlSessionIdentifier;
  v4 = a3;
  -[DMFControlGroupIdentifier encodeWithCoder:](&v7, sel_encodeWithCoder_, v4);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[DMFControlSessionIdentifier leaderIP](self, "leaderIP", v7.receiver, v7.super_class));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("leaderIP"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", -[DMFControlSessionIdentifier port](self, "port"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("port"));

}

- (unsigned)leaderIP
{
  return self->_leaderIP;
}

- (unsigned)port
{
  return self->_port;
}

@end
