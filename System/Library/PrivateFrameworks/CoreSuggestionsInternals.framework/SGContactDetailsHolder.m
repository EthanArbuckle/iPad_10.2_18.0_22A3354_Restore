@implementation SGContactDetailsHolder

- (NSArray)emailAddresses
{
  return self->_emailAddresses;
}

- (void)setEmailAddresses:(id)a3
{
  objc_storeStrong((id *)&self->_emailAddresses, a3);
}

- (NSArray)postalAddresses
{
  return self->_postalAddresses;
}

- (void)setPostalAddresses:(id)a3
{
  objc_storeStrong((id *)&self->_postalAddresses, a3);
}

- (NSArray)phoneNumbers
{
  return self->_phoneNumbers;
}

- (void)setPhoneNumbers:(id)a3
{
  objc_storeStrong((id *)&self->_phoneNumbers, a3);
}

- (NSArray)instantMessageAddresses
{
  return self->_instantMessageAddresses;
}

- (void)setInstantMessageAddresses:(id)a3
{
  objc_storeStrong((id *)&self->_instantMessageAddresses, a3);
}

- (NSArray)socialProfiles
{
  return self->_socialProfiles;
}

- (void)setSocialProfiles:(id)a3
{
  objc_storeStrong((id *)&self->_socialProfiles, a3);
}

- (SGContactDetail)birthday
{
  return self->_birthday;
}

- (void)setBirthday:(id)a3
{
  objc_storeStrong((id *)&self->_birthday, a3);
}

- (SGContactDetail)photoPath
{
  return self->_photoPath;
}

- (void)setPhotoPath:(id)a3
{
  objc_storeStrong((id *)&self->_photoPath, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_photoPath, 0);
  objc_storeStrong((id *)&self->_birthday, 0);
  objc_storeStrong((id *)&self->_socialProfiles, 0);
  objc_storeStrong((id *)&self->_instantMessageAddresses, 0);
  objc_storeStrong((id *)&self->_phoneNumbers, 0);
  objc_storeStrong((id *)&self->_postalAddresses, 0);
  objc_storeStrong((id *)&self->_emailAddresses, 0);
}

@end
