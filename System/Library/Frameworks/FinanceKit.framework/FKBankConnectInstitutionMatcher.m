@implementation FKBankConnectInstitutionMatcher

- (FKBankConnectInstitutionMatcher)init
{
  FKBankConnectInstitutionMatcher *v2;
  _TtC10FinanceKit29BankConnectInstitutionMatcher *v3;
  _TtC10FinanceKit29BankConnectInstitutionMatcher *wrappedMatcher;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)FKBankConnectInstitutionMatcher;
  v2 = -[FKBankConnectInstitutionMatcher init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(_TtC10FinanceKit29BankConnectInstitutionMatcher);
    wrappedMatcher = v2->_wrappedMatcher;
    v2->_wrappedMatcher = v3;

  }
  return v2;
}

- (void)institutionForPaymentPass:(id)a3 withCompletion:(id)a4
{
  -[BankConnectInstitutionMatcher institutionForPaymentPass:withCompletion:](self->_wrappedMatcher, "institutionForPaymentPass:withCompletion:", a3, a4);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_wrappedMatcher, 0);
}

@end
