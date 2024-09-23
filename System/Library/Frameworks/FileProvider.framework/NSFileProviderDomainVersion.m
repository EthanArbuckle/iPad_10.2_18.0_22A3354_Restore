@implementation NSFileProviderDomainVersion

- (NSFileProviderDomainVersion)init
{
  return -[NSFileProviderDomainVersion initWithVersion:](self, "initWithVersion:", 1);
}

- (NSFileProviderDomainVersion)initWithVersion:(int64_t)a3
{
  NSFileProviderDomainVersion *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)NSFileProviderDomainVersion;
  v5 = -[NSFileProviderDomainVersion init](&v8, sel_init);
  if (v5)
  {
    if (!a3)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, v5, CFSTR("NSFileProviderDomain.m"), 42, CFSTR("Never build a NSFileProviderDomainVersion with version 0"));

    }
    v5->_version = a3;
  }
  return v5;
}

+ (NSFileProviderDomainVersion)domainVersionWithVersion:(int64_t)a3
{
  return (NSFileProviderDomainVersion *)(id)objc_msgSend(objc_alloc((Class)a1), "initWithVersion:", a3);
}

- (NSFileProviderDomainVersion)next
{
  int64_t version;
  uint64_t v3;

  version = self->_version;
  if ((unint64_t)(version + 1) > 1)
    v3 = version + 1;
  else
    v3 = 1;
  return -[NSFileProviderDomainVersion initWithVersion:]([NSFileProviderDomainVersion alloc], "initWithVersion:", v3);
}

- (NSComparisonResult)compare:(NSFileProviderDomainVersion *)otherVersion
{
  NSFileProviderDomainVersion *v4;
  NSFileProviderDomainVersion *v5;
  int64_t version;
  int64_t v7;
  BOOL v8;
  _BOOL8 v9;
  NSComparisonResult v10;
  void *v12;
  uint64_t v13;
  void *v14;
  id v15;

  v4 = otherVersion;
  v5 = v4;
  if (v4)
  {
    if (v4 == self)
    {
      v10 = NSOrderedSame;
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v12 = (void *)MEMORY[0x1E0C99DA0];
        v13 = *MEMORY[0x1E0C99778];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unable to compare %@ with object of different class: %@"), self, v5);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "exceptionWithName:reason:userInfo:", v13, v14, 0);
        v15 = (id)objc_claimAutoreleasedReturnValue();

        objc_exception_throw(v15);
      }
      version = self->_version;
      v7 = v5->_version;
      v8 = version < v7;
      v9 = version != v7;
      if (v8)
        v10 = NSOrderedAscending;
      else
        v10 = v9;
    }
  }
  else
  {
    v10 = NSOrderedDescending;
  }

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeInteger:forKey:", self->_version, CFSTR("_version"));
}

- (NSFileProviderDomainVersion)initWithCoder:(id)a3
{
  id v4;
  NSFileProviderDomainVersion *v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)NSFileProviderDomainVersion;
  v5 = -[NSFileProviderDomainVersion init](&v7, sel_init);
  if (v5)
    v5->_version = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("_version"));

  return v5;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%ld"), self->_version);
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  BOOL v5;

  v4 = a3;
  objc_opt_class();
  v5 = (objc_opt_isKindOfClass() & 1) != 0 && self->_version == v4[1];

  return v5;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_version);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (int64_t)version
{
  return self->_version;
}

@end
