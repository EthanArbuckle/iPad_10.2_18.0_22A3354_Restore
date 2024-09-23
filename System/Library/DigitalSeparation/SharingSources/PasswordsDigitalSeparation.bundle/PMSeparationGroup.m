@implementation PMSeparationGroup

- (PMSeparationGroup)initWithGroup:(id)a3 participants:(id)a4
{
  id v7;
  id v8;
  PMSeparationGroup *v9;
  PMSeparationGroup *v10;
  uint64_t v11;
  NSArray *participants;
  PMSeparationGroup *v13;
  objc_super v15;

  v7 = a3;
  v8 = a4;
  v15.receiver = self;
  v15.super_class = (Class)PMSeparationGroup;
  v9 = -[PMSeparationGroup init](&v15, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_group, a3);
    v11 = objc_msgSend(v8, "copy");
    participants = v10->_participants;
    v10->_participants = (NSArray *)v11;

    v13 = v10;
  }

  return v10;
}

- (NSString)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = objc_opt_class();
  -[KCSharingGroup groupID](self->_group, "groupID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; groupID: %@>"), v4, self, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (NSString)displayName
{
  return (NSString *)MEMORY[0x24BEDD108](self->_group, sel_displayName);
}

- (NSString)displayDetail
{
  return 0;
}

- (int64_t)visibility
{
  return 1;
}

- (NSArray)participants
{
  return self->_participants;
}

- (KCSharingGroup)group
{
  return self->_group;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_group, 0);
  objc_storeStrong((id *)&self->_participants, 0);
}

@end
