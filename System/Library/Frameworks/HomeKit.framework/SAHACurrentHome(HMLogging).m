@implementation SAHACurrentHome(HMLogging)

- (id)hm_shortDescription
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(a1, "currentHomeName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "currentHomeIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("Siri Current home name: %@, identifier: %@"), v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

@end
