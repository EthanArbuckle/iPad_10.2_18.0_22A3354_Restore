@implementation NPKPaymentProvisioningFlowControllerWelcomeStepContext

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NPKPaymentProvisioningFlowControllerWelcomeStepContext)initWithRequestContext:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)NPKPaymentProvisioningFlowControllerWelcomeStepContext;
  return -[NPKPaymentProvisioningFlowStepContext initWithRequestContext:](&v4, sel_initWithRequestContext_, a3);
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BDD17C8];
  -[NPKPaymentProvisioningFlowStepContext _baseFlowStepDescription](self, "_baseFlowStepDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPKPaymentProvisioningFlowControllerWelcomeStepContext heroImages](self, "heroImages");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ images %@>"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (NPKPaymentProvisioningFlowControllerWelcomeStepContext)initWithCoder:(id)a3
{
  id v4;
  NPKPaymentProvisioningFlowControllerWelcomeStepContext *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  NSArray *heroImages;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)NPKPaymentProvisioningFlowControllerWelcomeStepContext;
  v5 = -[NPKPaymentProvisioningFlowStepContext initWithCoder:](&v12, sel_initWithCoder_, v4);
  if (v5)
  {
    v6 = (void *)MEMORY[0x24BDBCF20];
    v7 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("heroImages"));
    v9 = objc_claimAutoreleasedReturnValue();
    heroImages = v5->_heroImages;
    v5->_heroImages = (NSArray *)v9;

    v5->_defaultImagesUsed = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("defaultImagesUsed"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)NPKPaymentProvisioningFlowControllerWelcomeStepContext;
  v4 = a3;
  -[NPKPaymentProvisioningFlowStepContext encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_heroImages, CFSTR("heroImages"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeBool:forKey:", self->_defaultImagesUsed, CFSTR("defaultImagesUsed"));

}

- (NSArray)heroImages
{
  return self->_heroImages;
}

- (void)setHeroImages:(id)a3
{
  objc_storeStrong((id *)&self->_heroImages, a3);
}

- (BOOL)defaultImagesUsed
{
  return self->_defaultImagesUsed;
}

- (void)setDefaultImagesUsed:(BOOL)a3
{
  self->_defaultImagesUsed = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_heroImages, 0);
}

@end
