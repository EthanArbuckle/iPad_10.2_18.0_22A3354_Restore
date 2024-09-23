@implementation SGContactDetailSummary

- (NSArray)phones
{
  return self->_phones;
}

- (void)setPhones:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)email
{
  return self->_email;
}

- (void)setEmail:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSArray)socialProfileIdentifiers
{
  return self->_socialProfileIdentifiers;
}

- (void)setSocialProfileIdentifiers:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_socialProfileIdentifiers, 0);
  objc_storeStrong((id *)&self->_email, 0);
  objc_storeStrong((id *)&self->_phones, 0);
}

@end
