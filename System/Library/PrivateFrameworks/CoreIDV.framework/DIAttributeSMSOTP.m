@implementation DIAttributeSMSOTP

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)DIAttributeSMSOTP;
  v4 = a3;
  -[DIAttributeText encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeInt:forKey:", LODWORD(self->_validityInSeconds), CFSTR("validityInSeconds"), v5.receiver, v5.super_class);

}

- (DIAttributeSMSOTP)initWithCoder:(id)a3
{
  id v4;
  DIAttributeSMSOTP *v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)DIAttributeSMSOTP;
  v5 = -[DIAttributeText initWithCoder:](&v7, sel_initWithCoder_, v4);
  if (v5)
    v5->_validityInSeconds = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("validityInSeconds"));

  return v5;
}

- (DIAttributeSMSOTP)init
{
  DIAttributeSMSOTP *v2;
  DIAttributeSMSOTP *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)DIAttributeSMSOTP;
  v2 = -[DIAttributeText init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[DIAttribute setAttributeType:](v2, "setAttributeType:", 8);
  return v3;
}

- (id)submissionString
{
  void *v2;
  void *v3;
  id v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)DIAttributeSMSOTP;
  -[DIAttributeText submissionString](&v6, sel_submissionString);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2 && (objc_msgSend(v2, "isEqualToString:", &stru_24C2D5A40) & 1) != 0)
    v4 = 0;
  else
    v4 = v3;

  return v4;
}

- (void)setCurrentValue:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)DIAttributeSMSOTP;
  -[DIAttributeText setCurrentValue:](&v3, sel_setCurrentValue_, a3);
}

- (void)setDefaultValue:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)DIAttributeSMSOTP;
  -[DIAttributeText setDefaultValue:](&v3, sel_setDefaultValue_, a3);
}

- (void)setValidityInSeconds:(unint64_t)a3
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->super.super._lock;
  os_unfair_lock_lock(&self->super.super._lock);
  self->_validityInSeconds = a3;
  os_unfair_lock_unlock(p_lock);
}

- (id)getCurrentValue
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)DIAttributeSMSOTP;
  -[DIAttributeText getCurrentValue](&v3, sel_getCurrentValue);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)defaultValue
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)DIAttributeSMSOTP;
  -[DIAttributeText defaultValue](&v3, sel_defaultValue);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (unint64_t)validityInSeconds
{
  os_unfair_lock_s *p_lock;
  unint64_t validityInSeconds;

  p_lock = &self->super.super._lock;
  os_unfair_lock_lock(&self->super.super._lock);
  validityInSeconds = self->_validityInSeconds;
  os_unfair_lock_unlock(p_lock);
  return validityInSeconds;
}

- (id)description
{
  void *v3;
  void *v4;
  objc_super v6;

  objc_msgSend(MEMORY[0x24BDD16A8], "stringWithFormat:", CFSTR("<%@: %p; "), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6.receiver = self;
  v6.super_class = (Class)DIAttributeSMSOTP;
  -[DIAttributeText description](&v6, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("%@"), v4);

  os_unfair_lock_lock(&self->super.super._lock);
  objc_msgSend(v3, "appendFormat:", CFSTR("validityInSeconds: '%lu'; "), self->_validityInSeconds);
  os_unfair_lock_unlock(&self->super.super._lock);
  objc_msgSend(v3, "appendFormat:", CFSTR(">"));
  return v3;
}

@end
