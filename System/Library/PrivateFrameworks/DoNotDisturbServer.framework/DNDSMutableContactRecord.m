@implementation DNDSMutableContactRecord

- (void)setContactIdentifier:(id)a3
{
  NSString *v4;
  NSString *contactIdentifier;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  contactIdentifier = self->super._contactIdentifier;
  self->super._contactIdentifier = v4;

}

- (void)setFirstName:(id)a3
{
  NSString *v4;
  NSString *firstName;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  firstName = self->super._firstName;
  self->super._firstName = v4;

}

- (void)setMiddleName:(id)a3
{
  NSString *v4;
  NSString *middleName;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  middleName = self->super._middleName;
  self->super._middleName = v4;

}

- (void)setLastName:(id)a3
{
  NSString *v4;
  NSString *lastName;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  lastName = self->super._lastName;
  self->super._lastName = v4;

}

- (void)setNickName:(id)a3
{
  NSString *v4;
  NSString *nickName;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  nickName = self->super._nickName;
  self->super._nickName = v4;

}

- (void)setOrganizationName:(id)a3
{
  NSString *v4;
  NSString *organizationName;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  organizationName = self->super._organizationName;
  self->super._organizationName = v4;

}

- (void)setPhoneNumbers:(id)a3
{
  NSSet *v4;
  NSSet *phoneNumbers;

  v4 = (NSSet *)objc_msgSend(a3, "copy");
  phoneNumbers = self->super._phoneNumbers;
  self->super._phoneNumbers = v4;

}

- (void)setEmailAddresses:(id)a3
{
  NSSet *v4;
  NSSet *emailAddresses;

  v4 = (NSSet *)objc_msgSend(a3, "copy");
  emailAddresses = self->super._emailAddresses;
  self->super._emailAddresses = v4;

}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[DNDSContactRecord _initWithRecord:]([DNDSContactRecord alloc], "_initWithRecord:", self);
}

@end
