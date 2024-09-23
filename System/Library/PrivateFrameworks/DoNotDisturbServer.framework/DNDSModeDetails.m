@implementation DNDSModeDetails

+ (id)detailsForInactiveDoNotDisturb
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __49__DNDSModeDetails_detailsForInactiveDoNotDisturb__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (detailsForInactiveDoNotDisturb_onceToken != -1)
    dispatch_once(&detailsForInactiveDoNotDisturb_onceToken, block);
  return (id)detailsForInactiveDoNotDisturb_inactiveDetails;
}

void __49__DNDSModeDetails_detailsForInactiveDoNotDisturb__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v1 = objc_msgSend(objc_alloc(*(Class *)(a1 + 32)), "initWithInterruptionSuppression:", 0);
  v2 = (void *)detailsForInactiveDoNotDisturb_inactiveDetails;
  detailsForInactiveDoNotDisturb_inactiveDetails = v1;

}

- (DNDSModeDetails)initWithInterruptionSuppression:(unint64_t)a3
{
  DNDSModeDetails *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)DNDSModeDetails;
  result = -[DNDSModeDetails init](&v5, sel_init);
  if (result)
    result->_interruptionSuppression = a3;
  return result;
}

- (id)restrictedDetailsWithDetails:(id)a3
{
  id v4;

  v4 = a3;
  -[DNDSModeDetails interruptionSuppression](self, "interruptionSuppression");
  objc_msgSend(v4, "interruptionSuppression");

  return -[DNDSModeDetails initWithInterruptionSuppression:]([DNDSModeDetails alloc], "initWithInterruptionSuppression:", DNDMostRestrictiveInterruptionSuppression());
}

- (BOOL)isEqual:(id)a3
{
  DNDSModeDetails *v4;
  DNDSModeDetails *v5;
  unint64_t v6;
  uint64_t v7;
  BOOL v8;

  v4 = (DNDSModeDetails *)a3;
  if (self == v4)
  {
    v8 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      v6 = -[DNDSModeDetails interruptionSuppression](self, "interruptionSuppression");
      v7 = -[DNDSModeDetails interruptionSuppression](v5, "interruptionSuppression");

      v8 = v6 == v7;
    }
    else
    {
      v8 = 0;
    }
  }

  return v8;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[DNDSModeDetails interruptionSuppression](self, "interruptionSuppression");
  DNDStringFromInterruptionSuppression();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; interruptionSuppression: %@>"), v4, self, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (unint64_t)interruptionSuppression
{
  return self->_interruptionSuppression;
}

@end
