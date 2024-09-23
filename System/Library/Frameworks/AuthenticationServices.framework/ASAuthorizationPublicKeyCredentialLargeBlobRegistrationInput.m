@implementation ASAuthorizationPublicKeyCredentialLargeBlobRegistrationInput

- (ASAuthorizationPublicKeyCredentialLargeBlobRegistrationInput)initWithSupportRequirement:(ASAuthorizationPublicKeyCredentialLargeBlobSupportRequirement)requirement
{
  ASAuthorizationPublicKeyCredentialLargeBlobRegistrationInput *v4;
  ASAuthorizationPublicKeyCredentialLargeBlobRegistrationInput *v5;
  ASAuthorizationPublicKeyCredentialLargeBlobRegistrationInput *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)ASAuthorizationPublicKeyCredentialLargeBlobRegistrationInput;
  v4 = -[ASAuthorizationPublicKeyCredentialLargeBlobRegistrationInput init](&v8, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_supportRequirement = requirement;
    v6 = v4;
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[ASAuthorizationPublicKeyCredentialLargeBlobRegistrationInput initWithSupportRequirement:](+[ASAuthorizationPublicKeyCredentialLargeBlobRegistrationInput allocWithZone:](ASAuthorizationPublicKeyCredentialLargeBlobRegistrationInput, "allocWithZone:", a3), "initWithSupportRequirement:", self->_supportRequirement);
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeInteger:forKey:", self->_supportRequirement, CFSTR("supportRequirementKey"));
}

- (ASAuthorizationPublicKeyCredentialLargeBlobRegistrationInput)initWithCoder:(id)a3
{
  return -[ASAuthorizationPublicKeyCredentialLargeBlobRegistrationInput initWithSupportRequirement:](self, "initWithSupportRequirement:", objc_msgSend(a3, "decodeIntegerForKey:", CFSTR("supportRequirementKey")));
}

- (ASAuthorizationPublicKeyCredentialLargeBlobSupportRequirement)supportRequirement
{
  return self->_supportRequirement;
}

- (void)setSupportRequirement:(ASAuthorizationPublicKeyCredentialLargeBlobSupportRequirement)supportRequirement
{
  self->_supportRequirement = supportRequirement;
}

@end
