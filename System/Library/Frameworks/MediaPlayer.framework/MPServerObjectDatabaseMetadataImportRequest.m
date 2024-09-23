@implementation MPServerObjectDatabaseMetadataImportRequest

- (id)performWithDatabaseOperations:(id)a3 augmentingPayload:(id *)a4
{
  uint64_t v7;
  void *v9;
  objc_class *v10;
  void *v11;
  void *v12;

  v7 = objc_msgSend((id)objc_opt_class(), "instanceMethodForSelector:", a2);
  if (v7 == objc_msgSend((id)objc_opt_class(), "instanceMethodForSelector:", a2))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (objc_class *)objc_opt_class();
    NSStringFromClass(v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MPServerObjectDatabaseImportRequest.m"), 137, CFSTR("Subclass %@ must implement -%@ defined in %@."), v11, v12, CFSTR("[MPServerObjectDatabaseMetadataImportRequest class]"));

  }
  return -[MPServerObjectDatabaseImportResult initWithAnnotatedPayload:playableAssetIdentifiers:error:]([MPServerObjectDatabaseImportResult alloc], "initWithAnnotatedPayload:playableAssetIdentifiers:error:", a4, 0, 0);
}

+ (id)_entityTypeForObject:(id)a3
{
  return 0;
}

@end
