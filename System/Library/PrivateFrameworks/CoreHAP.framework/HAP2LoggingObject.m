@implementation HAP2LoggingObject

- (id)description
{
  void *v2;
  uint64_t v3;
  void *v4;
  objc_class *v5;
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%p"), self);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (shouldLogPrivateInformation_onceToken != -1)
    dispatch_once(&shouldLogPrivateInformation_onceToken, &__block_literal_global_20105);
  if (!shouldLogPrivateInformation_shouldLogPrivateInformation)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%u"), objc_msgSend(v2, "hash"));
    v3 = objc_claimAutoreleasedReturnValue();

    v2 = (void *)v3;
  }
  v4 = (void *)MEMORY[0x1E0CB3940];
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("<%@: %@>"), v6, v2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

@end
