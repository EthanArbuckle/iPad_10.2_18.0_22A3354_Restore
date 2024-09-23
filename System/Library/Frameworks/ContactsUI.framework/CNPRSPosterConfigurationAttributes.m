@implementation CNPRSPosterConfigurationAttributes

- (NSString)extensionIdentifier
{
  return (NSString *)-[PRSPosterConfigurationAttributes extensionIdentifier](self->_wrappedPosterAttributes, "extensionIdentifier");
}

- (CNPRSPosterConfigurationAttributes)initWithCNConfiguration:(id)a3
{
  id v4;
  CNPRSPosterConfigurationAttributes *v5;
  id v6;
  void *v7;
  uint64_t v8;
  PRSPosterConfigurationAttributes *wrappedPosterAttributes;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CNPRSPosterConfigurationAttributes;
  v5 = -[CNPRSPosterConfigurationAttributes init](&v11, sel_init);
  if (v5)
  {
    v6 = objc_alloc(getPRSPosterConfigurationAttributesClass_61274());
    objc_msgSend(v4, "wrappedPosterConfiguration");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "initWithConfiguration:", v7);
    wrappedPosterAttributes = v5->_wrappedPosterAttributes;
    v5->_wrappedPosterAttributes = (PRSPosterConfigurationAttributes *)v8;

  }
  return v5;
}

- (PRSPosterConfigurationAttributes)wrappedPosterAttributes
{
  return self->_wrappedPosterAttributes;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_wrappedPosterAttributes, 0);
}

@end
