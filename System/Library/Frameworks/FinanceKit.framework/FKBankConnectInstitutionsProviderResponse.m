@implementation FKBankConnectInstitutionsProviderResponse

- (FKBankConnectInstitutionsProviderResponse)initWithInstitution:(id)a3 consentStatus:(unint64_t)a4
{
  id v6;
  FKBankConnectInstitutionsProviderResponse *v7;
  uint64_t v8;
  FKInstitution *institution;
  objc_super v11;

  v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)FKBankConnectInstitutionsProviderResponse;
  v7 = -[FKBankConnectInstitutionsProviderResponse init](&v11, sel_init);
  if (v7)
  {
    v8 = objc_msgSend(v6, "copy");
    institution = v7->_institution;
    v7->_institution = (FKInstitution *)v8;

    v7->_consentStatus = a4;
  }

  return v7;
}

- (FKInstitution)institution
{
  return self->_institution;
}

- (unint64_t)consentStatus
{
  return self->_consentStatus;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_institution, 0);
}

@end
