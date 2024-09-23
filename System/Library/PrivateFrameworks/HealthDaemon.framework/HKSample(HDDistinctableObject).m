@implementation HKSample(HDDistinctableObject)

+ (uint64_t)supportsDistinctByKeyPath:()HDDistinctableObject
{
  void *v6;

  if (!a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("HKSample+HDDistinctableObject.m"), 22, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("keyPath"));

  }
  return 0;
}

- (uint64_t)uniqueIdentifierForDistinctByKeyPath:()HDDistinctableObject error:
{
  id v7;
  void *v8;
  objc_class *v9;
  void *v10;
  void *v12;

  v7 = a3;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("HKSample+HDDistinctableObject.m"), 28, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("keyPath"));

  }
  v8 = (void *)MEMORY[0x1E0CB35C8];
  v9 = (objc_class *)objc_opt_class();
  NSStringFromClass(v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "hk_assignError:code:format:", a4, 3, CFSTR("%@ does not support distinct-by on key-path %@"), v10, v7);

  return 0;
}

@end
