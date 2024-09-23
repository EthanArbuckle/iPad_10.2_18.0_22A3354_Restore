@implementation CRKSetRequestingUnenrollmentFromControlGroupRequest

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CRKSetRequestingUnenrollmentFromControlGroupRequest)initWithCoder:(id)a3
{
  id v4;
  CRKSetRequestingUnenrollmentFromControlGroupRequest *v5;
  void *v6;
  uint64_t v7;
  DMFControlGroupIdentifier *groupIdentifier;
  void *v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CRKSetRequestingUnenrollmentFromControlGroupRequest;
  v5 = -[CATTaskRequest initWithCoder:](&v11, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v6, CFSTR("groupIdentifier"));
    v7 = objc_claimAutoreleasedReturnValue();
    groupIdentifier = v5->_groupIdentifier;
    v5->_groupIdentifier = (DMFControlGroupIdentifier *)v7;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("requestingUnenroll"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_requestingUnenroll = objc_msgSend(v9, "BOOLValue");

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
  v7.super_class = (Class)CRKSetRequestingUnenrollmentFromControlGroupRequest;
  v4 = a3;
  -[CATTaskRequest encodeWithCoder:](&v7, sel_encodeWithCoder_, v4);
  -[CRKSetRequestingUnenrollmentFromControlGroupRequest groupIdentifier](self, "groupIdentifier", v7.receiver, v7.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("groupIdentifier"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[CRKSetRequestingUnenrollmentFromControlGroupRequest requestingUnenroll](self, "requestingUnenroll"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("requestingUnenroll"));

}

- (DMFControlGroupIdentifier)groupIdentifier
{
  return self->_groupIdentifier;
}

- (void)setGroupIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_groupIdentifier, a3);
}

- (BOOL)requestingUnenroll
{
  return self->_requestingUnenroll;
}

- (void)setRequestingUnenroll:(BOOL)a3
{
  self->_requestingUnenroll = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_groupIdentifier, 0);
}

@end
