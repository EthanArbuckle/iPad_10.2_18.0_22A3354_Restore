@implementation IXPlaceholderSeed

- (IXPlaceholderSeed)initWithCoder:(id)a3
{
  id v4;
  IXPlaceholderSeed *v5;
  uint64_t v6;
  NSString *bundleName;
  uint64_t v8;
  NSString *bundleID;
  void *v10;
  void *v11;
  int v12;
  uint64_t v13;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)IXPlaceholderSeed;
  v5 = -[IXOwnedDataPromiseSeed initWithCoder:](&v15, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("bundleName"));
    v6 = objc_claimAutoreleasedReturnValue();
    bundleName = v5->_bundleName;
    v5->_bundleName = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("bundleID"));
    v8 = objc_claimAutoreleasedReturnValue();
    bundleID = v5->_bundleID;
    v5->_bundleID = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("installType"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_installType = objc_msgSend(v10, "unsignedLongLongValue");

    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("placeholderType")))
    {
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("placeholderType"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v5->_placeholderType = objc_msgSend(v11, "unsignedLongLongValue");

    }
    else
    {
      v12 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isPlugin"));
      v13 = 1;
      if (v12)
        v13 = 2;
      v5->_placeholderType = v13;
    }
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)IXPlaceholderSeed;
  v4 = a3;
  -[IXOwnedDataPromiseSeed encodeWithCoder:](&v9, sel_encodeWithCoder_, v4);
  -[IXPlaceholderSeed bundleName](self, "bundleName", v9.receiver, v9.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("bundleName"));

  -[IXPlaceholderSeed bundleID](self, "bundleID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("bundleID"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[IXPlaceholderSeed installType](self, "installType"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("installType"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[IXPlaceholderSeed placeholderType](self, "placeholderType"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("placeholderType"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)IXPlaceholderSeed;
  v4 = -[IXOwnedDataPromiseSeed copyWithZone:](&v8, sel_copyWithZone_, a3);
  -[IXPlaceholderSeed bundleName](self, "bundleName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBundleName:", v5);

  -[IXPlaceholderSeed bundleID](self, "bundleID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBundleID:", v6);

  objc_msgSend(v4, "setInstallType:", -[IXPlaceholderSeed installType](self, "installType"));
  objc_msgSend(v4, "setPlaceholderType:", -[IXPlaceholderSeed placeholderType](self, "placeholderType"));
  return v4;
}

- (Class)clientPromiseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)isAppExtension
{
  return IXIsAppExtensionForPlaceholderType(-[IXPlaceholderSeed placeholderType](self, "placeholderType"));
}

- (NSString)bundleName
{
  return self->_bundleName;
}

- (void)setBundleName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (void)setBundleID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (unint64_t)installType
{
  return self->_installType;
}

- (void)setInstallType:(unint64_t)a3
{
  self->_installType = a3;
}

- (unint64_t)placeholderType
{
  return self->_placeholderType;
}

- (void)setPlaceholderType:(unint64_t)a3
{
  self->_placeholderType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleID, 0);
  objc_storeStrong((id *)&self->_bundleName, 0);
}

@end
