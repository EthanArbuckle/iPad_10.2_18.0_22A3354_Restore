@implementation CRKJoinControlGroupRequest

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CRKJoinControlGroupRequest)initWithCoder:(id)a3
{
  id v4;
  CRKJoinControlGroupRequest *v5;
  void *v6;
  uint64_t v7;
  CRKCourseInvitation *invitation;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CRKJoinControlGroupRequest;
  v5 = -[CATTaskRequest initWithCoder:](&v10, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v6, CFSTR("invitation"));
    v7 = objc_claimAutoreleasedReturnValue();
    invitation = v5->_invitation;
    v5->_invitation = (CRKCourseInvitation *)v7;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CRKJoinControlGroupRequest;
  v4 = a3;
  -[CATTaskRequest encodeWithCoder:](&v6, sel_encodeWithCoder_, v4);
  -[CRKJoinControlGroupRequest invitation](self, "invitation", v6.receiver, v6.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("invitation"));

}

- (CRKCourseInvitation)invitation
{
  return self->_invitation;
}

- (void)setInvitation:(id)a3
{
  objc_storeStrong((id *)&self->_invitation, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_invitation, 0);
}

@end
