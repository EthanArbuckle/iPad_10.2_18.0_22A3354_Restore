@implementation HKHealthServiceDiscovery

- (HKHealthServiceDiscovery)initWithType:(int64_t)a3
{
  HKHealthServiceDiscovery *v4;
  HKHealthServiceDiscovery *v5;
  HKHealthServiceDiscovery *v6;
  void *v7;
  uint64_t v8;
  objc_class *v9;
  void *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)HKHealthServiceDiscovery;
  v4 = -[HKHealthServiceDiscovery init](&v12, sel_init);
  v5 = v4;
  if (!v4)
    goto LABEL_5;
  if ((unint64_t)a3 >= 4)
  {
    v7 = (void *)MEMORY[0x1E0C99DA0];
    v8 = *MEMORY[0x1E0C99778];
    v9 = (objc_class *)objc_opt_class();
    NSStringFromClass(v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "raise:format:", v8, CFSTR("%@, HKHealthServiceType parameter requires a valid type."), v10);

LABEL_5:
    v6 = 0;
    goto LABEL_6;
  }
  v4->_serviceType = a3;
  v4->_discoveryIdentifier = 0;
  v6 = v4;
LABEL_6:

  return v6;
}

- (id)initForAllTypes
{
  HKHealthServiceDiscovery *v2;
  HKHealthServiceDiscovery *v3;
  HKHealthServiceDiscovery *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)HKHealthServiceDiscovery;
  v2 = -[HKHealthServiceDiscovery init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_serviceType = -2;
    v2->_discoveryIdentifier = 0;
    v4 = v2;
  }

  return v3;
}

- (int64_t)serviceType
{
  return self->_serviceType;
}

- (unint64_t)discoveryIdentifier
{
  return self->_discoveryIdentifier;
}

- (void)setDiscoveryIdentifier:(unint64_t)a3
{
  self->_discoveryIdentifier = a3;
}

- (id)discoveryHandler
{
  return self->_discoveryHandler;
}

- (void)setDiscoveryHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_discoveryHandler, 0);
}

@end
