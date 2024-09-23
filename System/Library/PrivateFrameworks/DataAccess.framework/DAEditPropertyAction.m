@implementation DAEditPropertyAction

- (DAEditPropertyAction)initWithChangedItem:(id)a3 propertyName:(id)a4 value:(id)a5 propertyNamespace:(id)a6 serverId:(id)a7
{
  id v13;
  id v14;
  id v15;
  DAEditPropertyAction *v16;
  DAEditPropertyAction *v17;
  objc_super v19;

  v13 = a4;
  v14 = a5;
  v15 = a6;
  v19.receiver = self;
  v19.super_class = (Class)DAEditPropertyAction;
  v16 = -[DAAction initWithItemChangeType:changedItem:serverId:](&v19, sel_initWithItemChangeType_changedItem_serverId_, 10, a3, a7);
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_propertyName, a4);
    objc_storeStrong((id *)&v17->_propertyNamespace, a6);
    objc_storeStrong((id *)&v17->_value, a5);
  }

  return v17;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DAEditPropertyAction)initWithCoder:(id)a3
{
  id v5;
  DAEditPropertyAction *v6;
  uint64_t v7;
  NSString *propertyName;
  uint64_t v9;
  NSString *propertyNamespace;
  uint64_t v11;
  NSString *value;
  void *v14;
  objc_super v15;

  v5 = a3;
  if ((objc_msgSend(v5, "allowsKeyedCoding") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("DAAction.m"), 179, CFSTR("Who does non-keyed coding nowadays?"));

  }
  v15.receiver = self;
  v15.super_class = (Class)DAEditPropertyAction;
  v6 = -[DAAction initWithCoder:](&v15, sel_initWithCoder_, v5);
  if (v6)
  {
    objc_msgSend(v5, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("DAPropertyName"));
    v7 = objc_claimAutoreleasedReturnValue();
    propertyName = v6->_propertyName;
    v6->_propertyName = (NSString *)v7;

    objc_msgSend(v5, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("DAPropertyNamespace"));
    v9 = objc_claimAutoreleasedReturnValue();
    propertyNamespace = v6->_propertyNamespace;
    v6->_propertyNamespace = (NSString *)v9;

    objc_msgSend(v5, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("DAPropertyValue"));
    v11 = objc_claimAutoreleasedReturnValue();
    value = v6->_value;
    v6->_value = (NSString *)v11;

  }
  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v10;

  v5 = a3;
  if ((objc_msgSend(v5, "allowsKeyedCoding") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("DAAction.m"), 190, CFSTR("Who does non-keyed coding nowadays?"));

  }
  v10.receiver = self;
  v10.super_class = (Class)DAEditPropertyAction;
  -[DAAction encodeWithCoder:](&v10, sel_encodeWithCoder_, v5);
  -[DAEditPropertyAction value](self, "value");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v6, CFSTR("DAPropertyValue"));

  -[DAEditPropertyAction propertyNamespace](self, "propertyNamespace");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v7, CFSTR("DAPropertyNamespace"));

  -[DAEditPropertyAction propertyName](self, "propertyName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v8, CFSTR("DAPropertyName"));

}

- (NSString)propertyName
{
  return self->_propertyName;
}

- (NSString)value
{
  return self->_value;
}

- (NSString)propertyNamespace
{
  return self->_propertyNamespace;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_propertyNamespace, 0);
  objc_storeStrong((id *)&self->_value, 0);
  objc_storeStrong((id *)&self->_propertyName, 0);
}

@end
