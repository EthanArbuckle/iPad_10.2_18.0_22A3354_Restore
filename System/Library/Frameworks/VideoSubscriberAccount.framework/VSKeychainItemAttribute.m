@implementation VSKeychainItemAttribute

- (void)dealloc
{
  __CFString *secItemAttributeKey;
  objc_super v4;

  secItemAttributeKey = self->_secItemAttributeKey;
  if (secItemAttributeKey)
    CFRelease(secItemAttributeKey);
  v4.receiver = self;
  v4.super_class = (Class)VSKeychainItemAttribute;
  -[VSKeychainItemAttribute dealloc](&v4, sel_dealloc);
}

- (NSString)attributeValueClassName
{
  NSString *v2;
  objc_class *v3;

  v2 = self->_attributeValueClassName;
  if (!v2)
  {
    v3 = (objc_class *)objc_opt_class();
    NSStringFromClass(v3);
    v2 = (NSString *)objc_claimAutoreleasedReturnValue();
    if (!v2)
    {
      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("The attributeValueClassName parameter must not be nil."));
      v2 = 0;
    }
  }
  return v2;
}

- (void)setSecItemAttributeKey:(__CFString *)a3
{
  __CFString *secItemAttributeKey;

  secItemAttributeKey = self->_secItemAttributeKey;
  if (secItemAttributeKey != a3)
  {
    if (secItemAttributeKey)
      CFRelease(secItemAttributeKey);
    self->_secItemAttributeKey = (__CFString *)CFStringCreateCopy((CFAllocatorRef)*MEMORY[0x1E0C9AE00], a3);
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  VSKeychainItemAttribute *v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = -[VSKeychainItemAttribute init](+[VSKeychainItemAttribute allocWithZone:](VSKeychainItemAttribute, "allocWithZone:", a3), "init");
  -[VSKeychainItemAttribute name](self, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[VSKeychainItemAttribute setName:](v4, "setName:", v5);

  -[VSKeychainItemAttribute setAttributeType:](v4, "setAttributeType:", -[VSKeychainItemAttribute attributeType](self, "attributeType"));
  -[VSKeychainItemAttribute attributeValueClassName](self, "attributeValueClassName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[VSKeychainItemAttribute setAttributeValueClassName:](v4, "setAttributeValueClassName:", v6);

  -[VSKeychainItemAttribute setSecItemAttributeKey:](v4, "setSecItemAttributeKey:", -[VSKeychainItemAttribute secItemAttributeKey](self, "secItemAttributeKey"));
  -[VSKeychainItemAttribute defaultValue](self, "defaultValue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[VSKeychainItemAttribute setDefaultValue:](v4, "setDefaultValue:", v7);

  return v4;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (unint64_t)attributeType
{
  return self->_attributeType;
}

- (void)setAttributeType:(unint64_t)a3
{
  self->_attributeType = a3;
}

- (void)setAttributeValueClassName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (__CFString)secItemAttributeKey
{
  return self->_secItemAttributeKey;
}

- (id)defaultValue
{
  return self->_defaultValue;
}

- (void)setDefaultValue:(id)a3
{
  objc_storeStrong(&self->_defaultValue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_defaultValue, 0);
  objc_storeStrong((id *)&self->_attributeValueClassName, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
