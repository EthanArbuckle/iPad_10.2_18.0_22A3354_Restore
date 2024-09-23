@implementation FKBankConnectAuthorizationViewControllerProvider

+ (id)makeAuthorizationViewControllerWithPaymentPass:(id)a3 institution:(id)a4 completion:(id)a5
{
  return +[BankConnectAuthorizationViewControllerProvider makeConsentViewControllerWithPaymentPass:fkInstitution:completion:](_TtC12FinanceKitUI46BankConnectAuthorizationViewControllerProvider, "makeConsentViewControllerWithPaymentPass:fkInstitution:completion:", a3, a4, a5);
}

+ (id)makeReconsentAuthorizationViewControllerWithPaymentPass:(id)a3 institution:(id)a4 previousConsentUUID:(id)a5 completion:(id)a6
{
  return +[BankConnectAuthorizationViewControllerProvider makeReconsentViewControllerWithPaymentPass:fkInstitution:previousConsentUUID:completion:](_TtC12FinanceKitUI46BankConnectAuthorizationViewControllerProvider, "makeReconsentViewControllerWithPaymentPass:fkInstitution:previousConsentUUID:completion:", a3, a4, a5, a6);
}

+ (id)makeMismatchedAccountAuthorizationViewControllerWithPaymentPass:(id)a3 institution:(id)a4 previousConsentUUID:(id)a5 completion:(id)a6
{
  return +[BankConnectAuthorizationViewControllerProvider makeMismatchedAccountViewControllerWithPaymentPass:fkInstitution:previousConsentUUID:completion:](_TtC12FinanceKitUI46BankConnectAuthorizationViewControllerProvider, "makeMismatchedAccountViewControllerWithPaymentPass:fkInstitution:previousConsentUUID:completion:", a3, a4, a5, a6);
}

+ (id)makeAuthorizationViewControllerForAuthorizationSession:(id)a3 completion:(id)a4
{
  return +[BankConnectAuthorizationViewControllerProvider makeAuthorizationViewControllerFor:completion:](_TtC12FinanceKitUI46BankConnectAuthorizationViewControllerProvider, "makeAuthorizationViewControllerFor:completion:", a3, a4);
}

@end
