@implementation COMTResult

- (COMTResult)initWithActionIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_actionIdentifier, a3);
  return self;
}

- (COMTResult)initWithCoder:(id)a3
{
  id v4;
  NSString *v5;
  NSString *actionIdentifier;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("RA"));
  v5 = (NSString *)objc_claimAutoreleasedReturnValue();

  actionIdentifier = self->_actionIdentifier;
  self->_actionIdentifier = v5;

  return self;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p, id = %@>"), v5, self, self->_actionIdentifier);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[COMTResult actionIdentifier](self, "actionIdentifier");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("RA"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)actionIdentifier
{
  return self->_actionIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_actionIdentifier, 0);
}

@end
