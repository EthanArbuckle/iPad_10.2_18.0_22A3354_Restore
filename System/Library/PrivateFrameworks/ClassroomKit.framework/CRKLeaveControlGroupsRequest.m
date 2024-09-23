@implementation CRKLeaveControlGroupsRequest

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CRKLeaveControlGroupsRequest)initWithCoder:(id)a3
{
  id v5;
  CRKLeaveControlGroupsRequest *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  NSSet *groupIdentifiers;
  void *v13;
  objc_super v14;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CRKLeaveControlGroupsRequest.m"), 22, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("aDecoder"));

  }
  v14.receiver = self;
  v14.super_class = (Class)CRKLeaveControlGroupsRequest;
  v6 = -[CATTaskRequest initWithCoder:](&v14, sel_initWithCoder_, v5);
  if (v6)
  {
    v7 = (void *)MEMORY[0x24BDBCF20];
    v8 = objc_opt_class();
    objc_msgSend(v7, "setWithObjects:", v8, objc_opt_class(), 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v9, CFSTR("groupIdentifiers"));
    v10 = objc_claimAutoreleasedReturnValue();
    groupIdentifiers = v6->_groupIdentifiers;
    v6->_groupIdentifiers = (NSSet *)v10;

  }
  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  objc_super v8;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CRKLeaveControlGroupsRequest.m"), 33, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("aCoder"));

  }
  v8.receiver = self;
  v8.super_class = (Class)CRKLeaveControlGroupsRequest;
  -[CATTaskRequest encodeWithCoder:](&v8, sel_encodeWithCoder_, v5);
  -[CRKLeaveControlGroupsRequest groupIdentifiers](self, "groupIdentifiers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v6, CFSTR("groupIdentifiers"));

}

- (NSSet)groupIdentifiers
{
  return self->_groupIdentifiers;
}

- (void)setGroupIdentifiers:(id)a3
{
  objc_storeStrong((id *)&self->_groupIdentifiers, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_groupIdentifiers, 0);
}

@end
