@implementation ABPostalNameGroupItem

- (CNMutableContact)contact
{
  return self->_contact;
}

- (void)setContact:(id)a3
{
  objc_storeStrong((id *)&self->_contact, a3);
}

- (SEL)setter
{
  return self->_setter;
}

- (void)setSetter:(SEL)a3
{
  self->_setter = a3;
}

- (NSString)value
{
  return self->_value;
}

- (void)setValue:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)property
{
  return self->_property;
}

- (void)setProperty:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)placeholder
{
  return self->_placeholder;
}

- (void)setPlaceholder:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_placeholder, 0);
  objc_storeStrong((id *)&self->_property, 0);
  objc_storeStrong((id *)&self->_value, 0);
  objc_storeStrong((id *)&self->_contact, 0);
}

@end
