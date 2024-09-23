@implementation ASDMigrationRequestOptions

- (ASDMigrationRequestOptions)initWithMigrationType:(unint64_t)a3
{
  ASDMigrationRequestOptions *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)ASDMigrationRequestOptions;
  result = -[ASDMigrationRequestOptions init](&v5, sel_init);
  if (result)
    result->_migrationType = a3;
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;

  result = -[ASDMigrationRequestOptions init](+[ASDMigrationRequestOptions allocWithZone:](ASDMigrationRequestOptions, "allocWithZone:", a3), "init");
  *((_QWORD *)result + 1) = self->_migrationType;
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ASDMigrationRequestOptions)initWithCoder:(id)a3
{
  id v4;
  ASDMigrationRequestOptions *v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)ASDMigrationRequestOptions;
  v5 = -[ASDRequestOptions initWithCoder:](&v7, sel_initWithCoder_, v4);
  if (v5)
    v5->_migrationType = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("migrationType"));

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeInteger:forKey:", self->_migrationType, CFSTR("migrationType"));
}

- (unint64_t)migrationType
{
  return self->_migrationType;
}

@end
