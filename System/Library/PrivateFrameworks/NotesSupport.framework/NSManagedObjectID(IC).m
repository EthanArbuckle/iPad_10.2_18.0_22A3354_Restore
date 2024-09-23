@implementation NSManagedObjectID(IC)

- (uint64_t)ic_isEntityOfClass:()IC
{
  return objc_msgSend((id)objc_msgSend(a1, "ic_entityClass"), "isSubclassOfClass:", a3);
}

- (id)ic_entityClass
{
  void *v1;
  NSString *v2;
  void *v3;

  objc_msgSend(a1, "entity");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "managedObjectClassName");
  v2 = (NSString *)objc_claimAutoreleasedReturnValue();
  NSClassFromString(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)ic_uriString
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "URIRepresentation");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "absoluteString");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

@end
