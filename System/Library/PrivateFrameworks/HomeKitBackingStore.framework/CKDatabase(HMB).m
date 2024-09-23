@implementation CKDatabase(HMB)

- (id)hmbDescription
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v2 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(a1, "container");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "containerID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "hmbDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "scope");
  CKDatabaseScopeString();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("%@/%@"), v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

@end
