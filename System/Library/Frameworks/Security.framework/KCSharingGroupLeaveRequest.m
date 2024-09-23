@implementation KCSharingGroupLeaveRequest

- (KCSharingGroupLeaveRequest)initWithGroupID:(id)a3
{
  id v5;
  KCSharingGroupLeaveRequest *v6;
  KCSharingGroupLeaveRequest *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)KCSharingGroupLeaveRequest;
  v6 = -[KCSharingGroupLeaveRequest init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_groupID, a3);

  return v7;
}

- (KCSharingGroupLeaveRequest)initWithCoder:(id)a3
{
  id v4;
  KCSharingGroupLeaveRequest *v5;
  uint64_t v6;
  NSString *groupID;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)KCSharingGroupLeaveRequest;
  v5 = -[KCSharingGroupLeaveRequest init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("groupID"));
    v6 = objc_claimAutoreleasedReturnValue();
    groupID = v5->_groupID;
    v5->_groupID = (NSString *)v6;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[KCSharingGroupLeaveRequest groupID](self, "groupID");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("groupID"));

}

- (NSString)groupID
{
  return self->_groupID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_groupID, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
