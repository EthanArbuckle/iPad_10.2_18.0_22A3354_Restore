@implementation COMTTypedAction

- (COMTTypedAction)initWithType:(id)a3
{
  id v5;
  COMTTypedAction *v6;
  COMTTypedAction *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)COMTTypedAction;
  v6 = -[COMTAction init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_targetType, a3);

  return v7;
}

- (COMTTypedAction)initWithCoder:(id)a3
{
  id v4;
  COMTTypedAction *v5;
  uint64_t v6;
  NSString *targetType;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)COMTTypedAction;
  v5 = -[COMTAction initWithCoder:](&v9, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("TT"));
    v6 = objc_claimAutoreleasedReturnValue();
    targetType = v5->_targetType;
    v5->_targetType = (NSString *)v6;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)COMTTypedAction;
  v4 = a3;
  -[COMTAction encodeWithCoder:](&v6, sel_encodeWithCoder_, v4);
  -[COMTTypedAction targetType](self, "targetType", v6.receiver, v6.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("TT"));

}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[COMTAction actionIdentifier](self, "actionIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[COMTTypedAction targetType](self, "targetType");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p, id = %@, type = %@>"), v5, self, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (NSString)targetType
{
  return self->_targetType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_targetType, 0);
}

@end
