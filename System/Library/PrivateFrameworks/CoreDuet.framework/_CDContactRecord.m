@implementation _CDContactRecord

- (_CDContact)contact
{
  return (_CDContact *)objc_getProperty(self, a2, 64, 1);
}

- (void)setContact:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->contact, 0);
}

@end
