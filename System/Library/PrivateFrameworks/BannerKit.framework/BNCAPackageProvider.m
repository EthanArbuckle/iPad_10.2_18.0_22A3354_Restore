@implementation BNCAPackageProvider

- (BNCAPackageProvider)initWithPackageName:(id)a3 inBundle:(id)a4 state:(id)a5
{
  id v9;
  id v10;
  id v11;
  BNCAPackageProvider *v12;
  uint64_t v13;
  NSString *name;
  uint64_t v15;
  NSBundle *bundle;
  uint64_t v17;
  NSString *state;
  void *v20;
  void *v21;
  void *v22;
  objc_super v23;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (objc_msgSend(v9, "length"))
  {
    if (v10)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("BNCAPackageProvider.m"), 31, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[name length] > 0"));

    if (v10)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("BNCAPackageProvider.m"), 32, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("bundle"));

LABEL_3:
  if (!objc_msgSend(v11, "length"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("BNCAPackageProvider.m"), 33, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[state length] > 0"));

  }
  v23.receiver = self;
  v23.super_class = (Class)BNCAPackageProvider;
  v12 = -[BNCAPackageProvider init](&v23, sel_init);
  if (v12)
  {
    v13 = objc_msgSend(v9, "copy");
    name = v12->_name;
    v12->_name = (NSString *)v13;

    v15 = objc_msgSend(v10, "copy");
    bundle = v12->_bundle;
    v12->_bundle = (NSBundle *)v15;

    v17 = objc_msgSend(v11, "copy");
    state = v12->_state;
    v12->_state = (NSString *)v17;

  }
  return v12;
}

- (BOOL)isCAPackageProvider
{
  return 1;
}

- (NSString)name
{
  return self->_name;
}

- (NSBundle)bundle
{
  return self->_bundle;
}

- (NSString)state
{
  return self->_state;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *name;
  id v5;

  name = self->_name;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", name, CFSTR("name"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_bundle, CFSTR("bundle"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_state, CFSTR("state"));

}

- (BNCAPackageProvider)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  BNCAPackageProvider *v8;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("name"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("bundle"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("state"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = -[BNCAPackageProvider initWithPackageName:inBundle:state:](self, "initWithPackageName:inBundle:state:", v5, v6, v7);
  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_state, 0);
  objc_storeStrong((id *)&self->_bundle, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
