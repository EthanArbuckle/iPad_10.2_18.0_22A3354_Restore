@implementation LAACL

- (LAACL)initWithData:(id)a3
{
  id v4;
  LAACL *v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)LAACL;
  v5 = -[LAACL init](&v7, sel_init);
  if (v5)
    v5->_acl = +[LASecAccessControl deserializeACL:](LASecAccessControl, "deserializeACL:", v4);

  return v5;
}

- (_QWORD)initWithSecAccessControl:(_QWORD *)result
{
  objc_super v3;

  if (result)
  {
    v3.receiver = result;
    v3.super_class = (Class)LAACL;
    result = objc_msgSendSuper2(&v3, sel_init);
    if (result)
      result[1] = a2;
  }
  return result;
}

- (void)dealloc
{
  __SecAccessControl *acl;
  objc_super v4;

  acl = self->_acl;
  if (acl)
    CFRelease(acl);
  v4.receiver = self;
  v4.super_class = (Class)LAACL;
  -[LAACL dealloc](&v4, sel_dealloc);
}

- (NSDictionary)constraints
{
  NSDictionary *constraints;
  NSDictionary *v4;
  NSDictionary *v5;

  constraints = self->_constraints;
  if (!constraints)
  {
    +[LASecAccessControl constraintsFromACL:](LASecAccessControl, "constraintsFromACL:", self->_acl);
    v4 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
    v5 = self->_constraints;
    self->_constraints = v4;

    constraints = self->_constraints;
  }
  return constraints;
}

- (NSData)data
{
  NSData *data;
  NSData *v4;
  NSData *v5;

  data = self->_data;
  if (!data)
  {
    +[LASecAccessControl serializeACL:](LASecAccessControl, "serializeACL:", self->_acl);
    v4 = (NSData *)objc_claimAutoreleasedReturnValue();
    v5 = self->_data;
    self->_data = v4;

    data = self->_data;
  }
  return data;
}

- (void)evaluateInContext:(id)a3 options:(id)a4 reply:(id)a5
{
  objc_msgSend(a3, "authorizeOperation:protectedBy:options:reply:", 3, self->_acl, a4, a5);
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    objc_msgSend(v5, "data");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[LAACL data](self, "data");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6 == v7)
    {
      v10 = 1;
    }
    else
    {
      objc_msgSend(v5, "data");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[LAACL data](self, "data");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v8, "isEqualToData:", v9);

    }
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_constraints, 0);
}

@end
