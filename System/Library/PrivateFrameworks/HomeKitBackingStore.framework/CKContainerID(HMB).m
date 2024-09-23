@implementation CKContainerID(HMB)

- (id)hmbDescription
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  if (objc_msgSend(a1, "environment") == 1)
  {
    objc_msgSend(a1, "containerIdentifier");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(a1, "environment");
    CKContainerEnvironmentString();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "containerIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stringWithFormat:", CFSTR("%@.%@"), v4, v5);
    v2 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v2;
}

@end
