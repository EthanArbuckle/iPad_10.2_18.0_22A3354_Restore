@implementation CTDataUsagePoliciesWrapper

- (CTDataUsagePoliciesWrapper)initWithPolicies:(id)a3
{
  id v5;
  CTDataUsagePoliciesWrapper *v6;
  CTDataUsagePoliciesWrapper *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CTDataUsagePoliciesWrapper;
  v6 = -[CTDataUsagePoliciesWrapper init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_policies, a3);

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;

  v4 = a3;
  if (v4)
  {
    -[CTDataUsagePoliciesWrapper policies](self, "policies");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "policies");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "isEqualToSet:", v6);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v4;
  uint64_t v5;
  void *v6;

  v4 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  -[CTDataUsagePoliciesWrapper policies](self, "policies");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v4[1];
  v4[1] = v5;

  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CTDataUsagePoliciesWrapper policies](self, "policies");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("policiesKey"));

}

- (CTDataUsagePoliciesWrapper)initWithCoder:(id)a3
{
  id v4;
  CTDataUsagePoliciesWrapper *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSSet *policies;
  objc_super v12;
  _QWORD v13[3];

  v13[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CTDataUsagePoliciesWrapper;
  v5 = -[CTDataUsagePoliciesWrapper init](&v12, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    v13[0] = objc_opt_class();
    v13[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setWithArray:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("policiesKey"));
    v9 = objc_claimAutoreleasedReturnValue();
    policies = v5->_policies;
    v5->_policies = (NSSet *)v9;

  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSSet)policies
{
  return self->_policies;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_policies, 0);
}

@end
