@implementation _LSBundleIdentifierAndType

- (_LSBundleIdentifierAndType)initWithBundleID:(id)a3 type:(id)a4
{
  id v7;
  id v8;
  _LSBundleIdentifierAndType *v9;
  _LSBundleIdentifierAndType *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)_LSBundleIdentifierAndType;
  v9 = -[_LSBundleIdentifierAndType init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_bundleID, a3);
    objc_storeStrong((id *)&v10->_type, a4);
  }

  return v10;
}

- (unint64_t)hash
{
  NSUInteger v3;

  v3 = -[NSString hash](self->_bundleID, "hash");
  return -[NSString hash](self->_type, "hash") ^ (2 * v3);
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  char v8;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    objc_msgSend(v5, "bundleID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "isEqualToString:", self->_bundleID))
    {
      objc_msgSend(v5, "type");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "isEqual:", self->_type);

    }
    else
    {
      v8 = 0;
    }

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[_LSBundleIdentifierAndType initWithBundleID:type:]([_LSBundleIdentifierAndType alloc], "initWithBundleID:type:", self->_bundleID, self->_type);
}

+ (id)createRepresentingProxy:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend(a3, "correspondingApplicationRecord");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "createRepresentingRecord:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)createRepresentingRecord:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  objc_msgSend(v4, "bundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "typeForInstallMachinery");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = 0;
  if (v5 && v6)
    v7 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithBundleID:type:", v5, v6);

  return v7;
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (NSString)type
{
  return self->_type;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_type, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
}

@end
