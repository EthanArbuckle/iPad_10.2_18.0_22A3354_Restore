@implementation MPServerObjectDatabaseAssetImportRequest

- (BOOL)performWithDatabaseOperations:(id)a3 error:(id *)a4
{
  uint64_t v6;
  void *v8;
  objc_class *v9;
  void *v10;
  void *v11;

  v6 = objc_msgSend((id)objc_opt_class(), "instanceMethodForSelector:", a2);
  if (v6 == objc_msgSend((id)objc_opt_class(), "instanceMethodForSelector:", a2))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (objc_class *)objc_opt_class();
    NSStringFromClass(v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MPServerObjectDatabaseImportRequest.m"), 798, CFSTR("Subclass %@ must implement -%@ defined in %@."), v10, v11, CFSTR("[MPServerObjectDatabaseAssetImportRequest class]"));

  }
  return 0;
}

@end
