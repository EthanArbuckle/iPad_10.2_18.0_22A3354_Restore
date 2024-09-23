@implementation MBStartRestoreOptions

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[MBStartRestoreOptions cellularAccess](self, "cellularAccess");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("cellularAccess"));

  -[MBStartRestoreOptions excludedAppBundleIDs](self, "excludedAppBundleIDs");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("excludedAppBundleIDs"));

}

- (MBStartRestoreOptions)initWithCoder:(id)a3
{
  id v4;
  MBStartRestoreOptions *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)MBStartRestoreOptions;
  v5 = -[MBStartRestoreOptions init](&v12, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("cellularAccess"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[MBStartRestoreOptions setCellularAccess:](v5, "setCellularAccess:", v6);

    v7 = (void *)MEMORY[0x1E0C99E60];
    v8 = objc_opt_class();
    objc_msgSend(v7, "setWithObjects:", v8, objc_opt_class(), 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v9, CFSTR("excludedAppBundleIDs"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[MBStartRestoreOptions setExcludedAppBundleIDs:](v5, "setExcludedAppBundleIDs:", v10);

  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = (void *)objc_opt_new();
  -[MBStartRestoreOptions cellularAccess](self, "cellularAccess");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setCellularAccess:", v5);

  -[MBStartRestoreOptions excludedAppBundleIDs](self, "excludedAppBundleIDs");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "copy");
  objc_msgSend(v4, "setExcludedAppBundleIDs:", v7);

  return v4;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  const char *Name;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  Name = class_getName(v4);
  -[MBStartRestoreOptions cellularAccess](self, "cellularAccess");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MBStartRestoreOptions excludedAppBundleIDs](self, "excludedAppBundleIDs");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%s: %p; cellularAccess=%@; excludedAppBundleIDs=%@>"),
    Name,
    self,
    v6,
    v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (NSSet)excludedAppBundleIDs
{
  return self->_excludedAppBundleIDs;
}

- (void)setExcludedAppBundleIDs:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (MBCellularAccess)cellularAccess
{
  return self->_cellularAccess;
}

- (void)setCellularAccess:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cellularAccess, 0);
  objc_storeStrong((id *)&self->_excludedAppBundleIDs, 0);
}

@end
