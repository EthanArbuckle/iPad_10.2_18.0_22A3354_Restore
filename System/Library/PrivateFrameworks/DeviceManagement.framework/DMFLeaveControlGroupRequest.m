@implementation DMFLeaveControlGroupRequest

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DMFLeaveControlGroupRequest)initWithCoder:(id)a3
{
  id v4;
  DMFLeaveControlGroupRequest *v5;
  void *v6;
  uint64_t v7;
  DMFControlGroupIdentifier *groupIdentifier;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  NSArray *leaderIdentifiers;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)DMFLeaveControlGroupRequest;
  v5 = -[CATTaskRequest initWithCoder:](&v15, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v6, CFSTR("groupIdentifier"));
    v7 = objc_claimAutoreleasedReturnValue();
    groupIdentifier = v5->_groupIdentifier;
    v5->_groupIdentifier = (DMFControlGroupIdentifier *)v7;

    v9 = (void *)MEMORY[0x1E0C99E60];
    v10 = objc_opt_class();
    objc_msgSend(v9, "setWithObjects:", v10, objc_opt_class(), 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v11, CFSTR("leaderIdentifiers"));
    v12 = objc_claimAutoreleasedReturnValue();
    leaderIdentifiers = v5->_leaderIdentifiers;
    v5->_leaderIdentifiers = (NSArray *)v12;

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
  v7.super_class = (Class)DMFLeaveControlGroupRequest;
  v4 = a3;
  -[CATTaskRequest encodeWithCoder:](&v7, sel_encodeWithCoder_, v4);
  -[DMFLeaveControlGroupRequest groupIdentifier](self, "groupIdentifier", v7.receiver, v7.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("groupIdentifier"));

  -[DMFLeaveControlGroupRequest leaderIdentifiers](self, "leaderIdentifiers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("leaderIdentifiers"));

}

- (DMFControlGroupIdentifier)groupIdentifier
{
  return self->_groupIdentifier;
}

- (void)setGroupIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_groupIdentifier, a3);
}

- (NSArray)leaderIdentifiers
{
  return self->_leaderIdentifiers;
}

- (void)setLeaderIdentifiers:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_leaderIdentifiers, 0);
  objc_storeStrong((id *)&self->_groupIdentifier, 0);
}

@end
