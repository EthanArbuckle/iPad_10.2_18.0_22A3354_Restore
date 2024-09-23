@implementation HKMHReminder

- (HKMHReminder)initWithDateComponents:(id)a3 isEnabled:(BOOL)a4
{
  id v6;
  HKMHReminder *v7;
  uint64_t v8;
  NSDateComponents *dateComponents;
  objc_super v11;

  v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HKMHReminder;
  v7 = -[HKMHReminder init](&v11, sel_init);
  if (v7)
  {
    v8 = objc_msgSend(v6, "copy");
    dateComponents = v7->_dateComponents;
    v7->_dateComponents = (NSDateComponents *)v8;

    v7->_isEnabled = a4;
  }

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HKMHReminder)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  HKMHReminder *v7;

  v4 = a3;
  v5 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("EnabledKey"));
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("DateComponentsKey"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[HKMHReminder initWithDateComponents:isEnabled:](self, "initWithDateComponents:isEnabled:", v6, v5);
  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  _BOOL8 isEnabled;
  id v5;

  isEnabled = self->_isEnabled;
  v5 = a3;
  objc_msgSend(v5, "encodeBool:forKey:", isEnabled, CFSTR("EnabledKey"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_dateComponents, CFSTR("DateComponentsKey"));

}

- (NSDateComponents)dateComponents
{
  return self->_dateComponents;
}

- (BOOL)isEnabled
{
  return self->_isEnabled;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dateComponents, 0);
}

@end
