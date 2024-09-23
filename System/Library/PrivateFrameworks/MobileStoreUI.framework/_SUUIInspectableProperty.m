@implementation _SUUIInspectableProperty

- (NSString)valueString
{
  void *v3;
  void *v4;
  __CFString *v5;

  -[_SUUIInspectableProperty value](self, "value");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[_SUUIInspectableProperty value](self, "value");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "debugDescription");
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = CFSTR("<nil>");
  }
  return (NSString *)v5;
}

- (NSString)friendlyName
{
  return self->_friendlyName;
}

- (void)setFriendlyName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (id)value
{
  return self->_value;
}

- (void)setValue:(id)a3
{
  objc_storeStrong(&self->_value, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_value, 0);
  objc_storeStrong((id *)&self->_friendlyName, 0);
}

@end
