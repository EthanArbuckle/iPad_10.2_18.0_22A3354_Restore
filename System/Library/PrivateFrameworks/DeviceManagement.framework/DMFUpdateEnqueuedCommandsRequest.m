@implementation DMFUpdateEnqueuedCommandsRequest

+ (id)permittedPlatforms
{
  return &unk_1E6EF4F70;
}

+ (BOOL)isPermittedOnSystemConnection
{
  return 1;
}

+ (BOOL)isPermittedOnUserConnection
{
  return 1;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DMFUpdateEnqueuedCommandsRequest)initWithCoder:(id)a3
{
  id v4;
  DMFUpdateEnqueuedCommandsRequest *v5;
  void *v6;
  uint64_t v7;
  NSString *organizationIdentifier;
  uint64_t v9;
  NSArray *addCommands;
  uint64_t v11;
  NSArray *removeCommands;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)DMFUpdateEnqueuedCommandsRequest;
  v5 = -[CATTaskRequest initWithCoder:](&v14, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v6, CFSTR("organizationIdentifier"));
    v7 = objc_claimAutoreleasedReturnValue();
    organizationIdentifier = v5->_organizationIdentifier;
    v5->_organizationIdentifier = (NSString *)v7;

    objc_msgSend(v4, "decodePropertyListForKey:", CFSTR("addCommands"));
    v9 = objc_claimAutoreleasedReturnValue();
    addCommands = v5->_addCommands;
    v5->_addCommands = (NSArray *)v9;

    objc_msgSend(v4, "decodePropertyListForKey:", CFSTR("removeCommands"));
    v11 = objc_claimAutoreleasedReturnValue();
    removeCommands = v5->_removeCommands;
    v5->_removeCommands = (NSArray *)v11;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)DMFUpdateEnqueuedCommandsRequest;
  v4 = a3;
  -[CATTaskRequest encodeWithCoder:](&v8, sel_encodeWithCoder_, v4);
  -[DMFUpdateEnqueuedCommandsRequest organizationIdentifier](self, "organizationIdentifier", v8.receiver, v8.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("organizationIdentifier"));

  -[DMFUpdateEnqueuedCommandsRequest addCommands](self, "addCommands");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("addCommands"));

  -[DMFUpdateEnqueuedCommandsRequest removeCommands](self, "removeCommands");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("removeCommands"));

}

- (NSString)organizationIdentifier
{
  return self->_organizationIdentifier;
}

- (void)setOrganizationIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSArray)addCommands
{
  return self->_addCommands;
}

- (void)setAddCommands:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSArray)removeCommands
{
  return self->_removeCommands;
}

- (void)setRemoveCommands:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_removeCommands, 0);
  objc_storeStrong((id *)&self->_addCommands, 0);
  objc_storeStrong((id *)&self->_organizationIdentifier, 0);
}

@end
