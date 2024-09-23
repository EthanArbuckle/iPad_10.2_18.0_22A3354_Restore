@implementation SharedDefaults

- (SharedDefaults)init
{
  SharedDefaults *v2;
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SharedDefaults;
  v2 = -[SharedDefaults init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "measureUnits");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObserver:forKeyPath:options:context:", v2, v4, 5, 0);

  }
  return v2;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  objc_super v5;

  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "measureUnits");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:forKeyPath:", self, v4);

  v5.receiver = self;
  v5.super_class = (Class)SharedDefaults;
  -[SharedDefaults dealloc](&v5, sel_dealloc);
}

+ (id)defaults
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __26__SharedDefaults_defaults__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (defaults_onceToken[0] != -1)
    dispatch_once(defaults_onceToken, block);
  return (id)defaults_defaults;
}

void __26__SharedDefaults_defaults__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)defaults_defaults;
  defaults_defaults = (uint64_t)v1;

}

+ (NSString)measureUnits
{
  return (NSString *)CFSTR("kMeasureUnitsV1");
}

+ (id)getDefaultValues
{
  return (id)MEMORY[0x24BDBD1B8];
}

+ (void)setupSpecifier:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  BOOL v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  objc_msgSend(v10, "propertyForKey:", *MEMORY[0x24BE759E8]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "propertyForKey:", *MEMORY[0x24BE75B50]);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (v4)
    v7 = v5 == 0;
  else
    v7 = 1;
  if (!v7 && objc_msgSend(v4, "isEqualToString:", CFSTR("com.apple.measure")))
  {
    objc_msgSend(a1, "getDefaultValues");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
      objc_msgSend(v10, "setProperty:forKey:", v9, *MEMORY[0x24BE759E0]);

  }
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  uint64_t SystemDefault;
  id v13;

  v7 = a3;
  objc_msgSend((id)objc_opt_class(), "measureUnits");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "isEqualToString:", v8);

  if (v9)
  {
    objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "measureUnits");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "valueForKeyPath:", v11);
    v13 = (id)objc_claimAutoreleasedReturnValue();

    if (v13)
      SystemDefault = objc_msgSend(v13, "integerValue");
    else
      SystemDefault = MeasureUnitsGetSystemDefault();
    -[SharedDefaults setCachedMeasureUnits:](self, "setCachedMeasureUnits:", SystemDefault);

  }
}

+ (int64_t)currentMeasureUnits
{
  void *v2;
  int64_t v3;

  objc_msgSend(a1, "defaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "cachedMeasureUnits");

  return v3;
}

- (int64_t)cachedMeasureUnits
{
  return self->_cachedMeasureUnits;
}

- (void)setCachedMeasureUnits:(int64_t)a3
{
  self->_cachedMeasureUnits = a3;
}

@end
