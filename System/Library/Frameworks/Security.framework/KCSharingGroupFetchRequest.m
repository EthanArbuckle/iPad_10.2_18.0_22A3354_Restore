@implementation KCSharingGroupFetchRequest

- (KCSharingGroupFetchRequest)init
{
  KCSharingGroupFetchRequest *v2;
  uint64_t v3;
  NSPredicate *predicate;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)KCSharingGroupFetchRequest;
  v2 = -[KCSharingGroupFetchRequest init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithValue:", 1);
    v3 = objc_claimAutoreleasedReturnValue();
    predicate = v2->_predicate;
    v2->_predicate = (NSPredicate *)v3;

  }
  return v2;
}

- (KCSharingGroupFetchRequest)initWithPredicate:(id)a3
{
  id v5;
  KCSharingGroupFetchRequest *v6;
  KCSharingGroupFetchRequest *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)KCSharingGroupFetchRequest;
  v6 = -[KCSharingGroupFetchRequest init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_predicate, a3);

  return v7;
}

- (KCSharingGroupFetchRequest)initWithCoder:(id)a3
{
  id v4;
  KCSharingGroupFetchRequest *v5;
  uint64_t v6;
  NSPredicate *predicate;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)KCSharingGroupFetchRequest;
  v5 = -[KCSharingGroupFetchRequest init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("predicate"));
    v6 = objc_claimAutoreleasedReturnValue();
    predicate = v5->_predicate;
    v5->_predicate = (NSPredicate *)v6;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[KCSharingGroupFetchRequest predicate](self, "predicate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("predicate"));

}

- (NSPredicate)predicate
{
  return self->_predicate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_predicate, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)all
{
  return objc_alloc_init(KCSharingGroupFetchRequest);
}

+ (id)groupName:(id)a3
{
  void *v3;
  KCSharingGroupFetchRequest *v4;

  +[KCSharingGroupFetchRequest predicateMatchingGroupsWithName:](KCSharingGroupFetchRequest, "predicateMatchingGroupsWithName:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[KCSharingGroupFetchRequest initWithPredicate:]([KCSharingGroupFetchRequest alloc], "initWithPredicate:", v3);

  return v4;
}

+ (id)pending
{
  void *v2;
  KCSharingGroupFetchRequest *v3;

  +[KCSharingGroupFetchRequest predicateMatchingGroupsWithInviteStatus:](KCSharingGroupFetchRequest, "predicateMatchingGroupsWithInviteStatus:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = -[KCSharingGroupFetchRequest initWithPredicate:]([KCSharingGroupFetchRequest alloc], "initWithPredicate:", v2);

  return v3;
}

+ (id)predicateMatchingAllGroups
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithValue:", 1);
}

+ (id)predicateMatchingGroupsWithName:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithValue:", 1);
}

+ (id)predicateMatchingGroupsWithInviteStatus:(int64_t)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithValue:", 1);
}

@end
