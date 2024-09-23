@implementation AKAuthorizationUserResponse

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (AKAuthorizationUserResponse)initWithCoder:(id)a3
{
  id v4;
  AKAuthorizationUserResponse *v5;
  uint64_t v6;
  AKAuthorizationScopesUserSelection *userSelection;
  uint64_t v8;
  NSNumber *loginChoiceIndex;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  AKAuthorizationLoginChoice *loginChoice;
  uint64_t v16;
  AKCredentialRequestProtocol *selectedRequest;
  uint64_t v18;
  NSString *rawAccountPassword;
  objc_super v21;
  _QWORD v22[4];

  v22[3] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)AKAuthorizationUserResponse;
  v5 = -[AKAuthorizationUserResponse init](&v21, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_userSelection"));
    v6 = objc_claimAutoreleasedReturnValue();
    userSelection = v5->_userSelection;
    v5->_userSelection = (AKAuthorizationScopesUserSelection *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_loginChoiceIndex"));
    v8 = objc_claimAutoreleasedReturnValue();
    loginChoiceIndex = v5->_loginChoiceIndex;
    v5->_loginChoiceIndex = (NSNumber *)v8;

    v10 = (void *)MEMORY[0x1E0C99E20];
    v11 = objc_opt_class();
    objc_msgSend(v10, "setWithObjects:", v11, objc_opt_class(), 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v22[0] = objc_opt_class();
    v22[1] = objc_opt_class();
    v22[2] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 3);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addObjectsFromArray:", v13);

    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v12, CFSTR("_loginChoice"));
    v14 = objc_claimAutoreleasedReturnValue();
    loginChoice = v5->_loginChoice;
    v5->_loginChoice = (AKAuthorizationLoginChoice *)v14;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_selectedRequest"));
    v16 = objc_claimAutoreleasedReturnValue();
    selectedRequest = v5->_selectedRequest;
    v5->_selectedRequest = (AKCredentialRequestProtocol *)v16;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_rawAccountPassword"));
    v18 = objc_claimAutoreleasedReturnValue();
    rawAccountPassword = v5->_rawAccountPassword;
    v5->_rawAccountPassword = (NSString *)v18;

    v5->_requestParentalPermission = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_requestParentalPermission"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  AKAuthorizationScopesUserSelection *userSelection;
  id v5;

  userSelection = self->_userSelection;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", userSelection, CFSTR("_userSelection"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_loginChoiceIndex, CFSTR("_loginChoiceIndex"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_loginChoice, CFSTR("_loginChoice"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_selectedRequest, CFSTR("_selectedRequest"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_rawAccountPassword, CFSTR("_rawAccountPassword"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_requestParentalPermission, CFSTR("_requestParentalPermission"));

}

- (BOOL)hasSelectedSharedAccountForLogin
{
  void *v2;
  char isKindOfClass;

  -[AKAuthorizationUserResponse loginChoice](self, "loginChoice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  AKCredentialRequestProtocol *selectedRequest;
  AKAuthorizationScopesUserSelection *userSelection;
  NSNumber *loginChoiceIndex;
  NSString *rawAccountPassword;
  const __CFString *v10;
  const __CFString *v11;
  const __CFString *v12;
  void *v13;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  selectedRequest = self->_selectedRequest;
  userSelection = self->_userSelection;
  loginChoiceIndex = self->_loginChoiceIndex;
  rawAccountPassword = self->_rawAccountPassword;
  if (rawAccountPassword)
  {
    if (-[NSString length](rawAccountPassword, "length"))
      v10 = CFSTR("(******)");
    else
      v10 = CFSTR("(empty)");
  }
  else
  {
    v10 = CFSTR("(null)");
  }
  if (loginChoiceIndex)
    v11 = CFSTR("YES");
  else
    v11 = CFSTR("NO");
  if (-[AKAuthorizationUserResponse requestParentalPermission](self, "requestParentalPermission"))
    v12 = CFSTR("YES");
  else
    v12 = CFSTR("NO");
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p {\n\tselectedRequest: %@,\n\tuserSelection: %@,\n\tloginChoiceindex: %@,\n\trawPassword: %@,\n\trequestParentalPermission: %@,\n}>"), v5, self, selectedRequest, userSelection, v11, v10, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (AKCredentialRequestProtocol)selectedRequest
{
  return self->_selectedRequest;
}

- (void)setSelectedRequest:(id)a3
{
  objc_storeStrong((id *)&self->_selectedRequest, a3);
}

- (AKAuthorizationScopesUserSelection)userSelection
{
  return self->_userSelection;
}

- (void)setUserSelection:(id)a3
{
  objc_storeStrong((id *)&self->_userSelection, a3);
}

- (NSNumber)loginChoiceIndex
{
  return self->_loginChoiceIndex;
}

- (void)setLoginChoiceIndex:(id)a3
{
  objc_storeStrong((id *)&self->_loginChoiceIndex, a3);
}

- (AKAuthorizationLoginChoice)loginChoice
{
  return self->_loginChoice;
}

- (void)setLoginChoice:(id)a3
{
  objc_storeStrong((id *)&self->_loginChoice, a3);
}

- (NSString)rawAccountPassword
{
  return self->_rawAccountPassword;
}

- (void)setRawAccountPassword:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (BOOL)requestParentalPermission
{
  return self->_requestParentalPermission;
}

- (void)setRequestParentalPermission:(BOOL)a3
{
  self->_requestParentalPermission = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rawAccountPassword, 0);
  objc_storeStrong((id *)&self->_loginChoice, 0);
  objc_storeStrong((id *)&self->_loginChoiceIndex, 0);
  objc_storeStrong((id *)&self->_userSelection, 0);
  objc_storeStrong((id *)&self->_selectedRequest, 0);
}

@end
