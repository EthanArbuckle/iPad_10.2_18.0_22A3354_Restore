@implementation DIAttributeDate

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)DIAttributeDate;
  v4 = a3;
  -[DIAttribute encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  os_unfair_lock_lock(&self->super._lock);
  objc_msgSend(v4, "encodeBool:forKey:", self->_requireDay, CFSTR("requireDay"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeBool:forKey:", self->_requireMonth, CFSTR("requireMonth"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_requireYear, CFSTR("requireYear"));

  os_unfair_lock_unlock(&self->super._lock);
}

- (DIAttributeDate)initWithCoder:(id)a3
{
  id v4;
  DIAttributeDate *v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)DIAttributeDate;
  v5 = -[DIAttribute initWithCoder:](&v7, sel_initWithCoder_, v4);
  if (v5)
  {
    v5->_requireDay = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("requireDay"));
    v5->_requireMonth = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("requireMonth"));
    v5->_requireYear = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("requireYear"));
  }

  return v5;
}

- (DIAttributeDate)init
{
  DIAttributeDate *v2;
  DIAttributeDate *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)DIAttributeDate;
  v2 = -[DIAttribute init](&v5, sel_init);
  v3 = v2;
  if (v2)
  {
    -[DIAttribute setAttributeType:](v2, "setAttributeType:", 2);
    v3->_requireDay = 1;
    v3->_requireMonth = 1;
    v3->_requireYear = 1;
  }
  return v3;
}

- (void)setCurrentValue:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)DIAttributeDate;
  -[DIAttribute setCurrentValue:](&v3, sel_setCurrentValue_, a3);
}

- (void)setDefaultValue:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)DIAttributeDate;
  -[DIAttribute setDefaultValue:](&v3, sel_setDefaultValue_, a3);
}

- (void)setRequireDay:(BOOL)a3
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->super._lock;
  os_unfair_lock_lock(&self->super._lock);
  self->_requireDay = a3;
  os_unfair_lock_unlock(p_lock);
}

- (void)setRequireMonth:(BOOL)a3
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->super._lock;
  os_unfair_lock_lock(&self->super._lock);
  self->_requireMonth = a3;
  os_unfair_lock_unlock(p_lock);
}

- (void)setRequireYear:(BOOL)a3
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->super._lock;
  os_unfair_lock_lock(&self->super._lock);
  self->_requireYear = a3;
  os_unfair_lock_unlock(p_lock);
}

- (NSDate)getCurrentValue
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)DIAttributeDate;
  -[DIAttribute getCurrentValue](&v3, sel_getCurrentValue);
  return (NSDate *)(id)objc_claimAutoreleasedReturnValue();
}

- (NSDate)defaultValue
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)DIAttributeDate;
  -[DIAttribute defaultValue](&v3, sel_defaultValue);
  return (NSDate *)(id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)requireDay
{
  DIAttributeDate *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->super._lock;
  os_unfair_lock_lock(&self->super._lock);
  LOBYTE(v2) = v2->_requireDay;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (BOOL)requireMonth
{
  DIAttributeDate *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->super._lock;
  os_unfair_lock_lock(&self->super._lock);
  LOBYTE(v2) = v2->_requireMonth;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (BOOL)requireYear
{
  DIAttributeDate *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->super._lock;
  os_unfair_lock_lock(&self->super._lock);
  LOBYTE(v2) = v2->_requireYear;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (id)description
{
  void *v3;
  void *v4;
  const __CFString *v5;
  const __CFString *v6;
  const __CFString *v7;
  void *v8;
  void *v9;
  objc_super v11;

  objc_msgSend(MEMORY[0x24BDD16A8], "stringWithFormat:", &stru_24C2D5A40);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v11.receiver = self;
  v11.super_class = (Class)DIAttributeDate;
  -[DIAttribute description](&v11, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("%@"), v4);

  os_unfair_lock_lock(&self->super._lock);
  if (self->_requireDay)
    v5 = CFSTR("YES");
  else
    v5 = CFSTR("NO");
  objc_msgSend(v3, "appendFormat:", CFSTR("requireDay: '%@'; "), v5);
  if (self->_requireMonth)
    v6 = CFSTR("YES");
  else
    v6 = CFSTR("NO");
  objc_msgSend(v3, "appendFormat:", CFSTR("requireMonth: '%@'; "), v6);
  if (self->_requireYear)
    v7 = CFSTR("YES");
  else
    v7 = CFSTR("NO");
  objc_msgSend(v3, "appendFormat:", CFSTR("requireYear: '%@'; "), v7);
  os_unfair_lock_unlock(&self->super._lock);
  -[DIAttributeDate defaultValue](self, "defaultValue");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("defaultValue: '%@'; "), v8);

  -[DIAttributeDate getCurrentValue](self, "getCurrentValue");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("currentValue: '%@'; "), v9);

  objc_msgSend(v3, "appendFormat:", CFSTR(">"));
  return v3;
}

@end
