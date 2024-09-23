@implementation MBStartBackupOptions

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MBStartBackupOptions)initWithCoder:(id)a3
{
  id v4;
  MBStartBackupOptions *v5;
  void *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)MBStartBackupOptions;
  v5 = -[MBStartBackupOptions init](&v8, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("cellularAccess"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[MBStartBackupOptions setCellularAccess:](v5, "setCellularAccess:", v6);

    -[MBStartBackupOptions setBackupPolicy:](v5, "setBackupPolicy:", objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("backupPolicy")));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[MBStartBackupOptions cellularAccess](self, "cellularAccess");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v4, CFSTR("cellularAccess"));

  objc_msgSend(v5, "encodeInteger:forKey:", -[MBStartBackupOptions backupPolicy](self, "backupPolicy"), CFSTR("backupPolicy"));
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;

  v4 = (void *)objc_opt_new();
  -[MBStartBackupOptions cellularAccess](self, "cellularAccess");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setCellularAccess:", v5);

  objc_msgSend(v4, "setBackupPolicy:", -[MBStartBackupOptions backupPolicy](self, "backupPolicy"));
  return v4;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  const char *Name;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  Name = class_getName(v4);
  -[MBStartBackupOptions cellularAccess](self, "cellularAccess");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%s: %p; cellularAccess=%@; backupPolicy=%ld>"),
    Name,
    self,
    v6,
    -[MBStartBackupOptions backupPolicy](self, "backupPolicy"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (MBCellularAccess)cellularAccess
{
  return self->_cellularAccess;
}

- (void)setCellularAccess:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (int64_t)backupPolicy
{
  return self->_backupPolicy;
}

- (void)setBackupPolicy:(int64_t)a3
{
  self->_backupPolicy = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cellularAccess, 0);
}

@end
