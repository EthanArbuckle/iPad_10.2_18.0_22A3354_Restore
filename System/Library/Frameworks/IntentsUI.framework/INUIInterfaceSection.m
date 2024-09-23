@implementation INUIInterfaceSection

- (INUIInterfaceSection)initWithInteractiveBehavior:(unint64_t)a3 parameters:(id)a4
{
  id v6;
  INUIInterfaceSection *v7;
  INUIInterfaceSection *v8;
  uint64_t v9;
  NSSet *parameters;
  objc_super v12;

  v6 = a4;
  v12.receiver = self;
  v12.super_class = (Class)INUIInterfaceSection;
  v7 = -[INUIInterfaceSection init](&v12, sel_init);
  v8 = v7;
  if (v7)
  {
    v7->_interactiveBehavior = a3;
    v9 = objc_msgSend(v6, "copy");
    parameters = v8->_parameters;
    v8->_parameters = (NSSet *)v9;

  }
  return v8;
}

- (unint64_t)hash
{
  unint64_t interactiveBehavior;

  interactiveBehavior = self->_interactiveBehavior;
  return -[NSSet hash](self->_parameters, "hash") ^ interactiveBehavior;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  _QWORD *v5;
  NSSet *parameters;
  BOOL v7;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    v7 = 0;
    if (self->_interactiveBehavior == v5[1])
    {
      parameters = self->_parameters;
      if (parameters == (NSSet *)v5[2] || -[NSSet isEqual:](parameters, "isEqual:"))
        v7 = 1;
    }

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (INUIInterfaceSection)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  INUIInterfaceSection *v10;

  v4 = a3;
  v5 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("interactiveBehavior"));
  v6 = (void *)MEMORY[0x1E0C99E60];
  v7 = objc_opt_class();
  objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("parameters"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = -[INUIInterfaceSection initWithInteractiveBehavior:parameters:](self, "initWithInteractiveBehavior:parameters:", v5, v9);
  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t interactiveBehavior;
  id v5;

  interactiveBehavior = self->_interactiveBehavior;
  v5 = a3;
  objc_msgSend(v5, "encodeInteger:forKey:", interactiveBehavior, CFSTR("interactiveBehavior"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_parameters, CFSTR("parameters"));

}

- (unint64_t)interactiveBehavior
{
  return self->_interactiveBehavior;
}

- (NSSet)parameters
{
  return self->_parameters;
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
