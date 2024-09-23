@implementation BLSBacklightSceneUpdateBacklightRampResponse

- (BLSBacklightSceneUpdateBacklightRampResponse)initWithRampDuration:(double)a3
{
  id v5;
  void *v6;
  BLSBacklightSceneUpdateBacklightRampResponse *v7;
  objc_super v9;

  v5 = objc_alloc_init(MEMORY[0x1E0D017D0]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forSetting:", v6, 0);

  v9.receiver = self;
  v9.super_class = (Class)BLSBacklightSceneUpdateBacklightRampResponse;
  v7 = -[BSActionResponse initWithInfo:error:](&v9, sel_initWithInfo_error_, v5, 0);

  return v7;
}

- (double)rampDuration
{
  void *v2;
  void *v3;
  double v4;
  double v5;

  -[BSActionResponse info](self, "info");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForSetting:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "doubleValue");
  v5 = v4;

  return v5;
}

@end
