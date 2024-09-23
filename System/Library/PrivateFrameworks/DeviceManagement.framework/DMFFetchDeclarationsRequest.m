@implementation DMFFetchDeclarationsRequest

+ (Class)allowlistedClassForResultObject
{
  return (Class)objc_opt_class();
}

+ (id)permittedPlatforms
{
  return &unk_1E6EF4910;
}

+ (BOOL)isPermittedOnSystemConnection
{
  return 1;
}

+ (BOOL)isPermittedOnUserConnection
{
  return 1;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DMFFetchDeclarationsRequest)initWithCoder:(id)a3
{
  id v4;
  DMFFetchDeclarationsRequest *v5;
  void *v6;
  uint64_t v7;
  NSString *organizationIdentifier;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  NSArray *payloadIdentifiers;
  void *v14;
  void *v15;
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)DMFFetchDeclarationsRequest;
  v5 = -[CATTaskRequest initWithCoder:](&v17, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v6, CFSTR("organizationIdentifier"));
    v7 = objc_claimAutoreleasedReturnValue();
    organizationIdentifier = v5->_organizationIdentifier;
    v5->_organizationIdentifier = (NSString *)v7;

    v9 = (void *)MEMORY[0x1E0C99E60];
    v10 = objc_opt_class();
    objc_msgSend(v9, "setWithObjects:", v10, objc_opt_class(), 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v11, CFSTR("payloadIdentifiers"));
    v12 = objc_claimAutoreleasedReturnValue();
    payloadIdentifiers = v5->_payloadIdentifiers;
    v5->_payloadIdentifiers = (NSArray *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("includePayloadContents"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_includePayloadContents = objc_msgSend(v14, "BOOLValue");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("includeInternalState"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_includeInternalState = objc_msgSend(v15, "BOOLValue");

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)DMFFetchDeclarationsRequest;
  v4 = a3;
  -[CATTaskRequest encodeWithCoder:](&v9, sel_encodeWithCoder_, v4);
  -[DMFFetchDeclarationsRequest organizationIdentifier](self, "organizationIdentifier", v9.receiver, v9.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("organizationIdentifier"));

  -[DMFFetchDeclarationsRequest payloadIdentifiers](self, "payloadIdentifiers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("payloadIdentifiers"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[DMFFetchDeclarationsRequest includePayloadContents](self, "includePayloadContents"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("includePayloadContents"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[DMFFetchDeclarationsRequest includeInternalState](self, "includeInternalState"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("includeInternalState"));

}

- (NSString)organizationIdentifier
{
  return self->_organizationIdentifier;
}

- (void)setOrganizationIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSArray)payloadIdentifiers
{
  return self->_payloadIdentifiers;
}

- (void)setPayloadIdentifiers:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (BOOL)includeInternalState
{
  return self->_includeInternalState;
}

- (void)setIncludeInternalState:(BOOL)a3
{
  self->_includeInternalState = a3;
}

- (BOOL)includePayloadContents
{
  return self->_includePayloadContents;
}

- (void)setIncludePayloadContents:(BOOL)a3
{
  self->_includePayloadContents = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payloadIdentifiers, 0);
  objc_storeStrong((id *)&self->_organizationIdentifier, 0);
}

@end
