@implementation HDExtractionRequest

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_resources, CFSTR("Resources"));
}

- (HDExtractionRequest)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  HDExtractionRequest *v7;

  v4 = a3;
  objc_msgSend(MEMORY[0x24BDBCF20], "hk_typesForArrayOf:", objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v5, CFSTR("Resources"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    self = -[HDExtractionRequest initWithResources:](self, "initWithResources:", v6);
    v7 = self;
  }
  else
  {
    objc_msgSend(v4, "hrs_failWithCocoaValueNotFoundError");
    v7 = 0;
  }

  return v7;
}

- (HDExtractionRequest)initWithResources:(id)a3
{
  id v4;
  HDExtractionRequest *v5;
  uint64_t v6;
  NSArray *resources;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HDExtractionRequest;
  v5 = -[HDExtractionRequest init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    resources = v5->_resources;
    v5->_resources = (NSArray *)v6;

  }
  return v5;
}

- (id)debugDescription
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p, %ld resources>"), v5, self, -[NSArray count](self->_resources, "count"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (NSArray)resources
{
  return self->_resources;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resources, 0);
}

@end
