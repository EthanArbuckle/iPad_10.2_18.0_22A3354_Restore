@implementation HMTriggerPolicy

- (HMTriggerPolicy)init
{

  return 0;
}

- (id)_initWithIdentifier:(id)a3
{
  id v5;
  HMTriggerPolicy *v6;
  HMTriggerPolicy *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HMTriggerPolicy;
  v6 = -[HMTriggerPolicy init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_identifier, a3);

  return v7;
}

- (HMTriggerPolicy)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  HMTriggerPolicy *v7;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HMT.triggerPolicyUUIDCodingKey"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", v5);
  v7 = -[HMTriggerPolicy _initWithIdentifier:](self, "_initWithIdentifier:", v6);

  return v7;
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
