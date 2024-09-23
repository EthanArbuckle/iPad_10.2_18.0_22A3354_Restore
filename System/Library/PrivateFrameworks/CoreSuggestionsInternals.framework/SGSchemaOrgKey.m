@implementation SGSchemaOrgKey

- (id)serialize
{
  return self->_uuid;
}

- (SGSchemaOrgKey)init
{
  SGSchemaOrgKey *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  NSString *uuid;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SGSchemaOrgKey;
  v2 = -[SGSchemaOrgKey init](&v8, sel_init);
  if (v2)
  {
    v3 = (void *)MEMORY[0x1C3BD4F6C]();
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "UUIDString");
    v5 = objc_claimAutoreleasedReturnValue();

    objc_autoreleasePoolPop(v3);
    uuid = v2->_uuid;
    v2->_uuid = (NSString *)v5;

  }
  return v2;
}

- (SGSchemaOrgKey)initWithSerialized:(id)a3
{
  id v5;
  SGSchemaOrgKey *v6;
  SGSchemaOrgKey *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SGSchemaOrgKey;
  v6 = -[SGSchemaOrgKey init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_uuid, a3);

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  SGSchemaOrgKey *v4;
  SGSchemaOrgKey *v5;
  BOOL v6;

  v4 = (SGSchemaOrgKey *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[SGSchemaOrgKey isEqualToSchemaOrgKey:](self, "isEqualToSchemaOrgKey:", v5);

  return v6;
}

- (BOOL)isEqualToSchemaOrgKey:(id)a3
{
  SGSchemaOrgKey *v4;
  NSString *v5;
  NSString *v6;
  char v7;

  v4 = (SGSchemaOrgKey *)a3;
  if (self == v4)
  {
    v7 = 1;
  }
  else
  {
    v5 = self->_uuid;
    v6 = v5;
    if (v5 == v4->_uuid)
      v7 = 1;
    else
      v7 = -[NSString isEqual:](v5, "isEqual:");

  }
  return v7;
}

- (unint64_t)hash
{
  return -[NSString hash](self->_uuid, "hash");
}

- (NSString)description
{
  return (NSString *)(id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("<SGSchemaOrgKey uuid:%@>"), self->_uuid);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uuid, 0);
}

+ (BOOL)isSupportedEntityType:(int64_t)a3
{
  return a3 == 17;
}

@end
