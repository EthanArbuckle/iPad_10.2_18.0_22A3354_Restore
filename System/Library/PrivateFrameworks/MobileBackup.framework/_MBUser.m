@implementation _MBUser

- (_MBUser)initWithUser:(id)a3
{
  id v4;
  void *v5;
  _MBUser *v6;
  objc_super v8;

  v4 = a3;
  if (!v4)
    -[_MBUser initWithUser:].cold.1();
  v5 = v4;
  v8.receiver = self;
  v8.super_class = (Class)_MBUser;
  v6 = -[_MBUser init](&v8, sel_init);
  if (v6)
    v6->_isPrimaryUser = objc_msgSend(v5, "isPrimaryUser");

  return v6;
}

+ (_MBUser)currentUser
{
  _MBUser *v2;
  void *v3;
  void *v4;
  _MBUser *v5;

  v2 = [_MBUser alloc];
  objc_msgSend(MEMORY[0x1E0DC5EE8], "sharedManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "currentUser");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[_MBUser initWithUser:](v2, "initWithUser:", v4);

  return v5;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; isPrimaryUser=%d>"), v5, self, self->_isPrimaryUser);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)isPrimaryUser
{
  return self->_isPrimaryUser;
}

- (void)initWithUser:.cold.1()
{
  __assert_rtn("-[_MBUser initWithUser:]", "_MBUser.m", 18, "user");
}

@end
