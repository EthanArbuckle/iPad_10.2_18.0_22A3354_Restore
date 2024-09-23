@implementation PMSeparationParticipantIdentity

- (PMSeparationParticipantIdentity)initWithContactIdentifier:(id)a3
{
  id v4;
  PMSeparationParticipantIdentity *v5;
  uint64_t v6;
  NSString *contactIdentifier;
  PMSeparationParticipantIdentity *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PMSeparationParticipantIdentity;
  v5 = -[PMSeparationParticipantIdentity init](&v10, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    contactIdentifier = v5->_contactIdentifier;
    v5->_contactIdentifier = (NSString *)v6;

    v8 = v5;
  }

  return v5;
}

- (PMSeparationParticipantIdentity)initWithEmailAddress:(id)a3
{
  id v4;
  PMSeparationParticipantIdentity *v5;
  uint64_t v6;
  NSString *emailAddress;
  PMSeparationParticipantIdentity *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PMSeparationParticipantIdentity;
  v5 = -[PMSeparationParticipantIdentity init](&v10, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    emailAddress = v5->_emailAddress;
    v5->_emailAddress = (NSString *)v6;

    v8 = v5;
  }

  return v5;
}

- (PMSeparationParticipantIdentity)initWithPhoneNumber:(id)a3
{
  id v4;
  PMSeparationParticipantIdentity *v5;
  uint64_t v6;
  NSString *phoneNumber;
  PMSeparationParticipantIdentity *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PMSeparationParticipantIdentity;
  v5 = -[PMSeparationParticipantIdentity init](&v10, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    phoneNumber = v5->_phoneNumber;
    v5->_phoneNumber = (NSString *)v6;

    v8 = v5;
  }

  return v5;
}

- (NSPersonNameComponents)nameComponents
{
  return 0;
}

- (NSString)unifiedContactIdentifier
{
  return self->_contactIdentifier;
}

- (NSString)emailAddress
{
  return self->_emailAddress;
}

- (NSString)phoneNumber
{
  return self->_phoneNumber;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_phoneNumber, 0);
  objc_storeStrong((id *)&self->_emailAddress, 0);
  objc_storeStrong((id *)&self->_contactIdentifier, 0);
}

@end
