@implementation NPKPaymentProvisioningFlowControllerReaderModeIngestionStepContext

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NPKPaymentProvisioningFlowControllerReaderModeIngestionStepContext)initWithRequestContext:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)NPKPaymentProvisioningFlowControllerReaderModeIngestionStepContext;
  return -[NPKPaymentProvisioningFlowStepContext initWithRequestContext:](&v4, sel_initWithRequestContext_, a3);
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  unint64_t v7;
  uint64_t v8;
  void *v9;

  v3 = (void *)MEMORY[0x24BDD17C8];
  -[NPKPaymentProvisioningFlowStepContext _baseFlowStepDescription](self, "_baseFlowStepDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPKPaymentProvisioningFlowControllerReaderModeIngestionStepContext title](self, "title");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPKPaymentProvisioningFlowControllerReaderModeIngestionStepContext subtitle](self, "subtitle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[NPKPaymentProvisioningFlowControllerReaderModeIngestionStepContext ingestionState](self, "ingestionState");
  -[NPKPaymentProvisioningFlowControllerReaderModeIngestionStepContext ingestionProgress](self, "ingestionProgress");
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ title %@ subtitle %@ ingestion state %ld ingestion progress %f>"), v4, v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (NPKPaymentProvisioningFlowControllerReaderModeIngestionStepContext)initWithCoder:(id)a3
{
  id v4;
  NPKPaymentProvisioningFlowControllerReaderModeIngestionStepContext *v5;
  uint64_t v6;
  NSString *title;
  uint64_t v8;
  NSString *subtitle;
  double v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)NPKPaymentProvisioningFlowControllerReaderModeIngestionStepContext;
  v5 = -[NPKPaymentProvisioningFlowStepContext initWithCoder:](&v12, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("title"));
    v6 = objc_claimAutoreleasedReturnValue();
    title = v5->_title;
    v5->_title = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("subtitle"));
    v8 = objc_claimAutoreleasedReturnValue();
    subtitle = v5->_subtitle;
    v5->_subtitle = (NSString *)v8;

    v5->_ingestionState = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("ingestionState"));
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("ingestionProgress"));
    v5->_ingestionProgress = v10;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)NPKPaymentProvisioningFlowControllerReaderModeIngestionStepContext;
  v4 = a3;
  -[NPKPaymentProvisioningFlowStepContext encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_title, CFSTR("title"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeObject:forKey:", self->_subtitle, CFSTR("subtitle"));
  objc_msgSend(v4, "encodeInteger:forKey:", self->_ingestionState, CFSTR("ingestionState"));
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("ingestionProgress"), self->_ingestionProgress);

}

- (NSURL)physicalCardImageURL
{
  return self->_physicalCardImageURL;
}

- (void)setPhysicalCardImageURL:(id)a3
{
  objc_storeStrong((id *)&self->_physicalCardImageURL, a3);
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_storeStrong((id *)&self->_title, a3);
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (void)setSubtitle:(id)a3
{
  objc_storeStrong((id *)&self->_subtitle, a3);
}

- (unint64_t)ingestionState
{
  return self->_ingestionState;
}

- (void)setIngestionState:(unint64_t)a3
{
  self->_ingestionState = a3;
}

- (double)ingestionProgress
{
  return self->_ingestionProgress;
}

- (void)setIngestionProgress:(double)a3
{
  self->_ingestionProgress = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_physicalCardImageURL, 0);
}

@end
