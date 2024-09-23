@implementation BLSDesiredFidelityResponse

- (BLSDesiredFidelityResponse)initWithDesiredFidelity:(int64_t)a3
{
  id v5;
  void *v6;
  BLSDesiredFidelityResponse *v7;
  objc_super v9;

  v5 = objc_alloc_init(MEMORY[0x1E0D017D0]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forSetting:", v6, 1);

  v9.receiver = self;
  v9.super_class = (Class)BLSDesiredFidelityResponse;
  v7 = -[BSActionResponse initWithInfo:error:](&v9, sel_initWithInfo_error_, v5, 0);

  return v7;
}

- (int64_t)desiredFidelity
{
  void *v2;
  void *v3;
  int64_t v4;

  -[BSActionResponse info](self, "info");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForSetting:", 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = objc_msgSend(v3, "integerValue");
  return v4;
}

@end
