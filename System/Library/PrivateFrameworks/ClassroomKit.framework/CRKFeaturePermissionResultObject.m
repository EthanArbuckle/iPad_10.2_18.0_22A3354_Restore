@implementation CRKFeaturePermissionResultObject

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CRKFeaturePermissionResultObject)initWithCoder:(id)a3
{
  id v4;
  CRKFeaturePermissionResultObject *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CRKFeaturePermissionResultObject;
  v5 = -[CRKFeaturePermissionResultObject init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("permission"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_permission = objc_msgSend(v6, "unsignedIntegerValue");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("modifiable"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_modifiable = objc_msgSend(v7, "BOOLValue");

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  id v7;

  v4 = (void *)MEMORY[0x24BDD16E0];
  v5 = a3;
  objc_msgSend(v4, "numberWithUnsignedInteger:", -[CRKFeaturePermissionResultObject permission](self, "permission"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v6, CFSTR("permission"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[CRKFeaturePermissionResultObject isModifiable](self, "isModifiable"));
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v7, CFSTR("modifiable"));

}

- (NSDictionary)dictionaryValue
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[2];
  _QWORD v8[3];

  v8[2] = *MEMORY[0x24BDAC8D0];
  v7[0] = CFSTR("value");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[CRKFeaturePermissionResultObject permission](self, "permission"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[1] = CFSTR("modifiable");
  v8[0] = v3;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[CRKFeaturePermissionResultObject isModifiable](self, "isModifiable"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[1] = v4;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v8, v7, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v5;
}

- (unint64_t)permission
{
  return self->_permission;
}

- (void)setPermission:(unint64_t)a3
{
  self->_permission = a3;
}

- (BOOL)isModifiable
{
  return self->_modifiable;
}

- (void)setModifiable:(BOOL)a3
{
  self->_modifiable = a3;
}

@end
