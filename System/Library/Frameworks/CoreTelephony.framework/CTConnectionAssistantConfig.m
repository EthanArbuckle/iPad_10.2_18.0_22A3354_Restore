@implementation CTConnectionAssistantConfig

- (id)description
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@ %p"), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CTConnectionAssistantConfig modelVector](self, "modelVector");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", modelVector=%@"), v4);

  objc_msgSend(v3, "appendString:", CFSTR(">"));
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v5;
  void *v6;
  void *v7;

  v5 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  -[CTConnectionAssistantConfig modelVector](self, "modelVector");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "copyWithZone:", a3);
  objc_msgSend(v5, "setModelVector:", v7);

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[CTConnectionAssistantConfig modelVector](self, "modelVector");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v4, CFSTR("modelVector"));

}

- (CTConnectionAssistantConfig)initWithCoder:(id)a3
{
  id v4;
  CTConnectionAssistantConfig *v5;
  uint64_t v6;
  CTCAModelVector *modelVector;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CTConnectionAssistantConfig;
  v5 = -[CTConnectionAssistantConfig init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("modelVector"));
    v6 = objc_claimAutoreleasedReturnValue();
    modelVector = v5->_modelVector;
    v5->_modelVector = (CTCAModelVector *)v6;

  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CTCAModelVector)modelVector
{
  return self->_modelVector;
}

- (void)setModelVector:(id)a3
{
  objc_storeStrong((id *)&self->_modelVector, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modelVector, 0);
}

@end
