@implementation ASDViewPresentationRequest

- (ASDViewPresentationRequest)initWithViewIdentifier:(int64_t)a3
{
  ASDViewPresentationRequest *v4;
  ASDViewPresentationRequest *v5;
  NSDictionary *configuration;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)ASDViewPresentationRequest;
  v4 = -[ASDViewPresentationRequest init](&v8, sel_init);
  v5 = v4;
  if (v4)
  {
    configuration = v4->_configuration;
    v4->_configuration = (NSDictionary *)MEMORY[0x1E0C9AA70];

    v5->_viewIdentifier = a3;
  }
  return v5;
}

- (ASDViewPresentationRequest)initWithViewIdentifier:(int64_t)a3 configuration:(id)a4
{
  id v7;
  ASDViewPresentationRequest *v8;
  ASDViewPresentationRequest *v9;
  objc_super v11;

  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)ASDViewPresentationRequest;
  v8 = -[ASDViewPresentationRequest init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_configuration, a4);
    v9->_viewIdentifier = a3;
  }

  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ASDViewPresentationRequest)initWithCoder:(id)a3
{
  id v4;
  ASDViewPresentationRequest *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  NSDictionary *configuration;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)ASDViewPresentationRequest;
  v5 = -[ASDViewPresentationRequest init](&v16, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    v7 = objc_opt_class();
    v8 = objc_opt_class();
    v9 = objc_opt_class();
    v10 = objc_opt_class();
    v11 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, v8, v9, v10, v11, objc_opt_class(), 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v12, CFSTR("C"));
    v13 = objc_claimAutoreleasedReturnValue();
    configuration = v5->_configuration;
    v5->_configuration = (NSDictionary *)v13;

    v5->_viewIdentifier = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("V"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSDictionary *configuration;
  id v5;

  configuration = self->_configuration;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", configuration, CFSTR("C"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_viewIdentifier, CFSTR("V"));

}

- (NSDictionary)configuration
{
  return self->_configuration;
}

- (int64_t)viewIdentifier
{
  return self->_viewIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configuration, 0);
}

@end
