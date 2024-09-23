@implementation HMDHH2DuplicateUserModelTuple

- (HMDHH2DuplicateUserModelTuple)initWithHomeModelID:(id)a3 userMergeID:(id)a4
{
  id v7;
  id v8;
  HMDHH2DuplicateUserModelTuple *v9;
  HMDHH2DuplicateUserModelTuple *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HMDHH2DuplicateUserModelTuple;
  v9 = -[HMDHH2DuplicateUserModelTuple init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_homeModelID, a3);
    objc_storeStrong((id *)&v10->_userMergeID, a4);
  }

  return v10;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDHH2DuplicateUserModelTuple homeModelID](self, "homeModelID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDHH2DuplicateUserModelTuple userMergeID](self, "userMergeID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: home = %@, user = %@>"), v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (NSUUID)homeModelID
{
  return self->_homeModelID;
}

- (NSString)userMergeID
{
  return self->_userMergeID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userMergeID, 0);
  objc_storeStrong((id *)&self->_homeModelID, 0);
}

@end
