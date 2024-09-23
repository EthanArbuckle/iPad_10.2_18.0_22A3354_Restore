@implementation COMTAction

- (COMTAction)init
{
  void *v3;
  NSString *v4;
  NSString *actionIdentifier;

  objc_msgSend(MEMORY[0x24BDD1880], "UUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "UUIDString");
  v4 = (NSString *)objc_claimAutoreleasedReturnValue();
  actionIdentifier = self->_actionIdentifier;
  self->_actionIdentifier = v4;

  return self;
}

- (COMTAction)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  NSString *v6;
  NSString *actionIdentifier;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AI"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (NSString *)objc_msgSend(v5, "copy");
  actionIdentifier = self->_actionIdentifier;
  self->_actionIdentifier = v6;

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
  -[COMTAction actionIdentifier](self, "actionIdentifier");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("AI"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)isEqual:(id)a3
{
  COMTAction *v4;
  void *v5;
  void *v6;
  char v7;

  v4 = (COMTAction *)a3;
  if (self == v4)
  {
    v7 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[COMTAction actionIdentifier](self, "actionIdentifier");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[COMTAction actionIdentifier](v4, "actionIdentifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v5, "isEqual:", v6);

    }
    else
    {
      v7 = 0;
    }
  }

  return v7;
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
