@implementation HKUserDomainConceptLink(HDSyncSupport)

- (HDCodableUserDomainConceptLink)codableRepresentationForSync
{
  HDCodableUserDomainConceptLink *v2;
  void *v3;
  void *v4;

  v2 = objc_alloc_init(HDCodableUserDomainConceptLink);
  objc_msgSend(a1, "targetUUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "hk_dataForUUIDBytes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDCodableUserDomainConceptLink setTargetUUID:](v2, "setTargetUUID:", v4);

  -[HDCodableUserDomainConceptLink setType:](v2, "setType:", objc_msgSend(a1, "type"));
  return v2;
}

+ (id)createWithCodable:()HDSyncSupport
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = a3;
  if (objc_msgSend(v3, "isMemberOfClass:", objc_opt_class()))
  {
    v4 = objc_alloc(MEMORY[0x1E0CB6CF8]);
    v5 = (void *)MEMORY[0x1E0CB3A28];
    objc_msgSend(v3, "targetUUID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "hk_UUIDWithData:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v4, "initWithTarget:type:", v7, objc_msgSend(v3, "type"));

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

@end
