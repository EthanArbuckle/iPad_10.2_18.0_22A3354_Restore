@implementation HMDManagedObject

- (BOOL)validateForInsertOrUpdate:(id *)a3
{
  return 1;
}

- (NSString)description
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x24BDD17C8];
  -[HMDManagedObject objectID](self, "objectID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "hmd_debugIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("<%@>"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v5;
}

- (NSString)debugDescription
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)HMDManagedObject;
  -[HMDManagedObject description](&v3, sel_description);
  return (NSString *)(id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)validateForInsert:(id *)a3
{
  _BOOL4 v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)HMDManagedObject;
  v5 = -[HMDManagedObject validateForInsert:](&v7, sel_validateForInsert_);
  if (v5)
    LOBYTE(v5) = -[HMDManagedObject validateForInsertOrUpdate:](self, "validateForInsertOrUpdate:", a3);
  return v5;
}

- (BOOL)validateForUpdate:(id *)a3
{
  _BOOL4 v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)HMDManagedObject;
  v5 = -[HMDManagedObject validateForUpdate:](&v7, sel_validateForUpdate_);
  if (v5)
    LOBYTE(v5) = -[HMDManagedObject validateForInsertOrUpdate:](self, "validateForInsertOrUpdate:", a3);
  return v5;
}

+ (id)logCategory
{
  return +[HMDCoreData logCategory](HMDCoreData, "logCategory");
}

@end
