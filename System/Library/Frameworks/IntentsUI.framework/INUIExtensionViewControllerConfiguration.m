@implementation INUIExtensionViewControllerConfiguration

- (INUIExtensionViewControllerConfiguration)initWithParameters:(id)a3 interactiveBehavior:(unint64_t)a4 hostedViewContext:(unint64_t)a5
{
  id v8;
  INUIExtensionViewControllerConfiguration *v9;
  uint64_t v10;
  NSSet *parameters;
  objc_super v13;

  v8 = a3;
  v13.receiver = self;
  v13.super_class = (Class)INUIExtensionViewControllerConfiguration;
  v9 = -[INUIExtensionViewControllerConfiguration init](&v13, sel_init);
  if (v9)
  {
    v10 = objc_msgSend(v8, "copy");
    parameters = v9->_parameters;
    v9->_parameters = (NSSet *)v10;

    v9->_interactiveBehavior = a4;
    v9->_hostedViewContext = a5;
  }

  return v9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5;
  void *v6;
  void *v7;

  v5 = objc_alloc((Class)objc_opt_class());
  v6 = (void *)-[NSSet copyWithZone:](self->_parameters, "copyWithZone:", a3);
  v7 = (void *)objc_msgSend(v5, "initWithParameters:interactiveBehavior:hostedViewContext:", v6, -[INUIExtensionViewControllerConfiguration interactiveBehavior](self, "interactiveBehavior"), -[INUIExtensionViewControllerConfiguration hostedViewContext](self, "hostedViewContext"));

  return v7;
}

- (INUIExtensionViewControllerConfiguration)initWithCoder:(id)a3
{
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  INUIExtensionViewControllerConfiguration *v11;

  v4 = (void *)MEMORY[0x1E0C99E60];
  v5 = a3;
  v6 = objc_opt_class();
  objc_msgSend(v4, "setWithObjects:", v6, objc_opt_class(), 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v7, CFSTR("parameters"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v5, "decodeIntegerForKey:", CFSTR("interactiveBehavior"));
  v10 = objc_msgSend(v5, "decodeIntegerForKey:", CFSTR("hostedViewContext"));

  v11 = -[INUIExtensionViewControllerConfiguration initWithParameters:interactiveBehavior:hostedViewContext:](self, "initWithParameters:interactiveBehavior:hostedViewContext:", v8, v9, v10);
  return v11;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[INUIExtensionViewControllerConfiguration parameters](self, "parameters");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v4, CFSTR("parameters"));

  objc_msgSend(v5, "encodeInteger:forKey:", -[INUIExtensionViewControllerConfiguration hostedViewContext](self, "hostedViewContext"), CFSTR("hostedViewContext"));
  objc_msgSend(v5, "encodeInteger:forKey:", -[INUIExtensionViewControllerConfiguration interactiveBehavior](self, "interactiveBehavior"), CFSTR("interactiveBehavior"));

}

- (NSSet)parameters
{
  return self->_parameters;
}

- (unint64_t)interactiveBehavior
{
  return self->_interactiveBehavior;
}

- (unint64_t)hostedViewContext
{
  return self->_hostedViewContext;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parameters, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
