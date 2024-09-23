@implementation KCSharingGroupUpdateRequest

- (KCSharingGroupUpdateRequest)initWithUpdatedGroup:(id)a3
{
  id v5;
  KCSharingGroupUpdateRequest *v6;
  KCSharingGroupUpdateRequest *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)KCSharingGroupUpdateRequest;
  v6 = -[KCSharingGroupUpdateRequest init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_group, a3);

  return v7;
}

- (KCSharingGroupUpdateRequest)initWithCoder:(id)a3
{
  id v4;
  KCSharingGroupUpdateRequest *v5;
  uint64_t v6;
  KCSharingGroup *group;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)KCSharingGroupUpdateRequest;
  v5 = -[KCSharingGroupUpdateRequest init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("group"));
    v6 = objc_claimAutoreleasedReturnValue();
    group = v5->_group;
    v5->_group = (KCSharingGroup *)v6;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[KCSharingGroupUpdateRequest group](self, "group");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("group"));

}

- (KCSharingGroup)group
{
  return self->_group;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_group, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
