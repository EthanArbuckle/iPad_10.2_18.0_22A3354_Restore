@implementation DMFControlGroupIdentifier

+ (id)new
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("DMFControlGroupIdentifier.m"), 16, CFSTR("%@ cannot call %@"), a1, v5);

  return 0;
}

- (DMFControlGroupIdentifier)init
{
  void *v4;
  uint64_t v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_class();
  NSStringFromSelector(a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("DMFControlGroupIdentifier.m"), 21, CFSTR("%@ cannot call %@"), v5, v6);

  return 0;
}

- (DMFControlGroupIdentifier)initWithString:(id)a3
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  unsigned __int16 v11;
  DMFControlGroupIdentifier *v12;
  void *v14;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("DMFControlGroupIdentifier.m"), 26, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("string"));

  }
  objc_msgSend(v5, "componentsSeparatedByString:", CFSTR(":"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_alloc(MEMORY[0x1E0CB3A28]);
  objc_msgSend(v6, "firstObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v7, "initWithUUIDString:", v8);

  if ((unint64_t)objc_msgSend(v6, "count") < 2)
  {
    v11 = 0;
    if (v9)
      goto LABEL_5;
LABEL_7:
    v12 = 0;
    goto LABEL_8;
  }
  objc_msgSend(v6, "objectAtIndexedSubscript:", 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "intValue");

  if (!v9)
    goto LABEL_7;
LABEL_5:
  self = -[DMFControlGroupIdentifier initWithOrganizationUUID:groupID:](self, "initWithOrganizationUUID:groupID:", v9, v11);
  v12 = self;
LABEL_8:

  return v12;
}

- (DMFControlGroupIdentifier)initWithOrganizationUUID:(id)a3 groupID:(unsigned __int16)a4
{
  id v8;
  DMFControlGroupIdentifier *v9;
  DMFControlGroupIdentifier *v10;
  void *v12;
  objc_super v13;

  v8 = a3;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("DMFControlGroupIdentifier.m"), 43, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("uuid"));

  }
  v13.receiver = self;
  v13.super_class = (Class)DMFControlGroupIdentifier;
  v9 = -[DMFControlGroupIdentifier init](&v13, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_organizationUUID, a3);
    v10->_groupID = a4;
  }

  return v10;
}

- (NSString)stringValue
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[DMFControlGroupIdentifier organizationUUID](self, "organizationUUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "UUIDString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@:%d"), v5, -[DMFControlGroupIdentifier groupID](self, "groupID"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[DMFControlGroupIdentifier stringValue](self, "stringValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p { identifier =  %@ }>"), v4, self, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  unint64_t v5;

  -[DMFControlGroupIdentifier organizationUUID](self, "organizationUUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  v5 = v4 ^ -[DMFControlGroupIdentifier groupID](self, "groupID");

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  DMFControlGroupIdentifier *v4;
  BOOL v5;

  v4 = (DMFControlGroupIdentifier *)a3;
  if (v4 == self)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    v5 = (objc_opt_isKindOfClass() & 1) != 0
      && -[DMFControlGroupIdentifier isEqualToGroupIdentifier:](self, "isEqualToGroupIdentifier:", v4);
  }

  return v5;
}

- (BOOL)isEqualToGroupIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  unint64_t v7;
  unint64_t v8;
  int v9;
  int v10;
  BOOL v11;

  v4 = a3;
  -[DMFControlGroupIdentifier organizationUUID](self, "organizationUUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "organizationUUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v5;
  v8 = v6;
  if (v7 | v8 && (v9 = objc_msgSend((id)v7, "isEqual:", v8), (id)v8, (id)v7, !v9))
  {
    v11 = 0;
  }
  else
  {
    v10 = -[DMFControlGroupIdentifier groupID](self, "groupID");
    v11 = v10 == objc_msgSend(v4, "groupID");
  }

  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = objc_alloc((Class)objc_opt_class());
  -[DMFControlGroupIdentifier organizationUUID](self, "organizationUUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithOrganizationUUID:groupID:", v5, -[DMFControlGroupIdentifier groupID](self, "groupID"));

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DMFControlGroupIdentifier)initWithCoder:(id)a3
{
  id v4;
  DMFControlGroupIdentifier *v5;
  void *v6;
  uint64_t v7;
  NSUUID *organizationUUID;
  void *v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)DMFControlGroupIdentifier;
  v5 = -[DMFControlGroupIdentifier init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v6, CFSTR("organizationUUID"));
    v7 = objc_claimAutoreleasedReturnValue();
    organizationUUID = v5->_organizationUUID;
    v5->_organizationUUID = (NSUUID *)v7;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("groupID"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_groupID = objc_msgSend(v9, "unsignedIntegerValue");

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[DMFControlGroupIdentifier organizationUUID](self, "organizationUUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("organizationUUID"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", -[DMFControlGroupIdentifier groupID](self, "groupID"));
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("groupID"));

}

- (NSUUID)organizationUUID
{
  return self->_organizationUUID;
}

- (unsigned)groupID
{
  return self->_groupID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_organizationUUID, 0);
}

@end
