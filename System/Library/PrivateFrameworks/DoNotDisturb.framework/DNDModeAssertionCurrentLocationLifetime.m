@implementation DNDModeAssertionCurrentLocationLifetime

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __57__DNDModeAssertionCurrentLocationLifetime_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken_0 != -1)
    dispatch_once(&sharedInstance_onceToken_0, block);
  return (id)sharedInstance_instance;
}

void __57__DNDModeAssertionCurrentLocationLifetime_sharedInstance__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v1 = objc_msgSend(objc_alloc(*(Class *)(a1 + 32)), "_init");
  v2 = (void *)sharedInstance_instance;
  sharedInstance_instance = v1;

}

- (unint64_t)hash
{
  return 64181;
}

- (BOOL)isEqual:(id)a3
{
  id v3;
  char isKindOfClass;

  if (self == a3)
  {
    isKindOfClass = 1;
  }
  else
  {
    v3 = a3;
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

  }
  return isKindOfClass & 1;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@: %p>"), objc_opt_class(), self);
}

- (unint64_t)lifetimeType
{
  return 3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)awakeAfterUsingCoder:(id)a3
{
  void *v4;

  objc_msgSend((id)objc_opt_class(), "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

@end
