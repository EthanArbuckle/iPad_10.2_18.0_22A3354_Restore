@implementation HKDiagnosticTestResult(HKDistinctableObject)

+ (uint64_t)supportsDistinctByKeyPath:()HKDistinctableObject
{
  id v5;
  uint64_t v6;
  void *v8;
  objc_super v9;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("HKSample+HDDistinctableObject.m"), 87, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("keyPath"));

  }
  if ((objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0CB4CA8]) & 1) != 0)
  {
    v6 = 1;
  }
  else
  {
    v9.receiver = a1;
    v9.super_class = (Class)&off_1EF219B88;
    v6 = (uint64_t)objc_msgSendSuper2(&v9, sel_supportsDistinctByKeyPath_, v5);
  }

  return v6;
}

- (id)uniqueIdentifierForDistinctByKeyPath:()HKDistinctableObject error:
{
  id v7;
  uint64_t v8;
  void *v9;
  void *v11;
  objc_super v12;

  v7 = a3;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("HKSample+HDDistinctableObject.m"), 96, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("keyPath"));

  }
  if (objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0CB4CA8]))
  {
    objc_msgSend(a1, "category");
    v8 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12.receiver = a1;
    v12.super_class = (Class)&off_1EF21A478;
    objc_msgSendSuper2(&v12, sel_uniqueIdentifierForDistinctByKeyPath_error_, v7, a4);
    v8 = objc_claimAutoreleasedReturnValue();
  }
  v9 = (void *)v8;

  return v9;
}

@end
