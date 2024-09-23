@implementation HMTriggerDeleteAfterExecutionPolicy

- (HMTriggerDeleteAfterExecutionPolicy)init
{

  return 0;
}

- (HMTriggerDeleteAfterExecutionPolicy)initWithPayload:(id)a3 payload:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HMTriggerDeleteAfterExecutionPolicy;
  return (HMTriggerDeleteAfterExecutionPolicy *)-[HMTriggerDeletePolicy _initWithIdentifier:](&v5, sel__initWithIdentifier_, a3, a4);
}

- (id)_init
{
  void *v3;
  id v4;
  objc_super v6;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", CFSTR("AABDED76-96F7-4033-83B3-3C7D512E5F9D"));
  v6.receiver = self;
  v6.super_class = (Class)HMTriggerDeleteAfterExecutionPolicy;
  v4 = -[HMTriggerDeletePolicy _initWithIdentifier:](&v6, sel__initWithIdentifier_, v3);

  return v4;
}

- (id)description
{
  return CFSTR("Delete After Execution");
}

- (HMTriggerDeleteAfterExecutionPolicy)initWithCoder:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)HMTriggerDeleteAfterExecutionPolicy;
  return -[HMTriggerDeletePolicy initWithCoder:](&v4, sel_initWithCoder_, a3);
}

+ (id)deleteAfterExecutionPolicy
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __65__HMTriggerDeleteAfterExecutionPolicy_deleteAfterExecutionPolicy__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (deleteAfterExecutionPolicy_onceToken != -1)
    dispatch_once(&deleteAfterExecutionPolicy_onceToken, block);
  return (id)deleteAfterExecutionPolicy_policyInstance;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

void __65__HMTriggerDeleteAfterExecutionPolicy_deleteAfterExecutionPolicy__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_msgSend(objc_alloc((Class)objc_opt_class()), "_init");
  v1 = (void *)deleteAfterExecutionPolicy_policyInstance;
  deleteAfterExecutionPolicy_policyInstance = v0;

}

@end
