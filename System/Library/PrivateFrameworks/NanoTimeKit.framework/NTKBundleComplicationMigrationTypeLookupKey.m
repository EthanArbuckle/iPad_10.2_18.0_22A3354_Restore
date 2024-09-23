@implementation NTKBundleComplicationMigrationTypeLookupKey

- (NTKBundleComplicationMigrationTypeLookupKey)initWithComplicationType:(unint64_t)a3 family:(int64_t)a4
{
  NTKBundleComplicationMigrationTypeLookupKey *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)NTKBundleComplicationMigrationTypeLookupKey;
  result = -[NTKBundleComplicationMigrationTypeLookupKey init](&v7, sel_init);
  if (result)
  {
    result->_type = a3;
    result->_family = a4;
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  BOOL v5;

  v4 = a3;
  objc_opt_class();
  v5 = (objc_opt_isKindOfClass() & 1) != 0 && self->_type == v4[1] && self->_family == v4[2];

  return v5;
}

- (unint64_t)hash
{
  void *v3;
  id v4;
  id v5;
  unint64_t v6;

  objc_msgSend(MEMORY[0x1E0D01788], "builder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendUnsignedInteger:", self->_type);
  v5 = (id)objc_msgSend(v3, "appendInteger:", self->_family);
  v6 = objc_msgSend(v3, "hash");

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t type;
  id v5;

  type = self->_type;
  v5 = a3;
  objc_msgSend(v5, "encodeInteger:forKey:", type, CFSTR("type"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_family, CFSTR("family"));

}

- (NTKBundleComplicationMigrationTypeLookupKey)initWithCoder:(id)a3
{
  id v4;
  NTKBundleComplicationMigrationTypeLookupKey *v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)NTKBundleComplicationMigrationTypeLookupKey;
  v5 = -[NTKBundleComplicationMigrationTypeLookupKey init](&v7, sel_init);
  if (v5)
  {
    v5->_type = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("type"));
    v5->_family = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("family"));
  }

  return v5;
}

- (unint64_t)type
{
  return self->_type;
}

- (int64_t)family
{
  return self->_family;
}

@end
