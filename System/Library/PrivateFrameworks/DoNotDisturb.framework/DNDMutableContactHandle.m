@implementation DNDMutableContactHandle

- (void)setContactIdentifier:(id)a3
{
  NSString *v4;
  NSString *contactIdentifier;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  contactIdentifier = self->super._contactIdentifier;
  self->super._contactIdentifier = v4;

}

- (void)setType:(unint64_t)a3
{
  NSString *normalizedValue;

  if (self->super._type != a3)
  {
    self->super._type = a3;
    normalizedValue = self->super._normalizedValue;
    self->super._normalizedValue = 0;

  }
}

- (void)setValue:(id)a3
{
  NSString *v4;
  NSString *v5;
  NSString *value;
  BOOL v7;
  NSString *v8;
  NSString *v9;
  NSString *normalizedValue;
  NSString *v11;

  v4 = (NSString *)a3;
  v5 = v4;
  value = self->super._value;
  if (value != v4)
  {
    v11 = v4;
    if (!v4 || !value || (v7 = -[NSString isEqualToString:](v4, "isEqualToString:"), v5 = v11, !v7))
    {
      v8 = (NSString *)-[NSString copy](v5, "copy");
      v9 = self->super._value;
      self->super._value = v8;

      normalizedValue = self->super._normalizedValue;
      self->super._normalizedValue = 0;

      v5 = v11;
    }
  }

}

@end
