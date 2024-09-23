@implementation COClusterMemberRoleSnapshot

- (COClusterMemberRoleSnapshot)initWithMember:(id)a3 role:(id)a4
{
  id v7;
  id v8;
  COClusterMemberRoleSnapshot *v9;
  COClusterMemberRoleSnapshot *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)COClusterMemberRoleSnapshot;
  v9 = -[COClusterMemberRoleSnapshot init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_member, a3);
    objc_storeStrong((id *)&v10->_role, a4);
    v10->_stale = 0;
  }

  return v10;
}

+ (id)snapshotWithParticipantRoleForMember:(id)a3
{
  id v3;
  COClusterMemberRoleSnapshot *v4;
  void *v5;
  COClusterMemberRoleSnapshot *v6;

  v3 = a3;
  v4 = [COClusterMemberRoleSnapshot alloc];
  +[COClusterRole roleForParticipant](COClusterRole, "roleForParticipant");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[COClusterMemberRoleSnapshot initWithMember:role:](v4, "initWithMember:role:", v3, v5);

  return v6;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  _BOOL4 v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[COClusterMemberRoleSnapshot isStale](self, "isStale");
  -[COClusterMemberRoleSnapshot member](self, "member");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[COClusterMemberRoleSnapshot role](self, "role");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 78;
  if (v6)
    v9 = 89;
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p, stale = %c member = %@ role = %@>"), v5, self, v9, v7, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  COClusterMemberRoleSnapshot *v4;
  BOOL v5;

  v4 = (COClusterMemberRoleSnapshot *)a3;
  if (self == v4)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    v5 = (objc_opt_isKindOfClass() & 1) != 0
      && -[COClusterMemberRoleSnapshot isEqualToSnapshot:](self, "isEqualToSnapshot:", v4);
  }

  return v5;
}

- (BOOL)isEqualToSnapshot:(id)a3
{
  id v4;
  int v5;
  char v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = a3;
  v5 = -[COClusterMemberRoleSnapshot isStale](self, "isStale");
  if (v5 == objc_msgSend(v4, "isStale"))
  {
    -[COClusterMemberRoleSnapshot member](self, "member");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "member");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "isEqual:", v8))
    {
      -[COClusterMemberRoleSnapshot role](self, "role");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "role");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v9, "isEqual:", v10);

    }
    else
    {
      v6 = 0;
    }

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[COClusterMemberRoleSnapshot member](self, "member");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (COClusterMemberRoleSnapshot)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;
  BOOL v8;
  COClusterMemberRoleSnapshot *v9;
  COClusterMemberRoleSnapshot *v10;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("member"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("role"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("stale"));

  if (v5)
    v8 = v6 == 0;
  else
    v8 = 1;
  if (v8)
  {

    v9 = 0;
  }
  else
  {
    v10 = -[COClusterMemberRoleSnapshot initWithMember:role:](self, "initWithMember:role:", v5, v6);
    v9 = v10;
    if (v10)
      v10->_stale = v7;
  }

  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[COClusterMemberRoleSnapshot member](self, "member");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v4, CFSTR("member"));

  -[COClusterMemberRoleSnapshot role](self, "role");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v5, CFSTR("role"));

  objc_msgSend(v6, "encodeBool:forKey:", -[COClusterMemberRoleSnapshot isStale](self, "isStale"), CFSTR("stale"));
}

- (COClusterMember)member
{
  return self->_member;
}

- (COClusterRole)role
{
  return self->_role;
}

- (BOOL)isStale
{
  return self->_stale;
}

- (void)setStale:(BOOL)a3
{
  self->_stale = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_role, 0);
  objc_storeStrong((id *)&self->_member, 0);
}

@end
