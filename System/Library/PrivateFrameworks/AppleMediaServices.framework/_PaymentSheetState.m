@implementation _PaymentSheetState

- (_PaymentSheetState)init
{
  _PaymentSheetState *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_PaymentSheetState;
  result = -[_PaymentSheetState init](&v3, sel_init);
  if (result)
    result->_cancellationType = 0;
  return result;
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
  objc_storeStrong((id *)&self->_error, a3);
}

- (BOOL)didAuthorizePayment
{
  return self->_didAuthorizePayment;
}

- (void)setDidAuthorizePayment:(BOOL)a3
{
  self->_didAuthorizePayment = a3;
}

- (BOOL)didBiometricsLockout
{
  return self->_didBiometricsLockout;
}

- (void)setDidBiometricsLockout:(BOOL)a3
{
  self->_didBiometricsLockout = a3;
}

- (unint64_t)cancellationType
{
  return self->_cancellationType;
}

- (void)setCancellationType:(unint64_t)a3
{
  self->_cancellationType = a3;
}

- (BOOL)didPresent
{
  return self->_didPresent;
}

- (void)setDidPresent:(BOOL)a3
{
  self->_didPresent = a3;
}

- (NSString)passwordEquivalentToken
{
  return self->_passwordEquivalentToken;
}

- (void)setPasswordEquivalentToken:(id)a3
{
  objc_storeStrong((id *)&self->_passwordEquivalentToken, a3);
}

- (NSString)paymentToken
{
  return self->_paymentToken;
}

- (void)setPaymentToken:(id)a3
{
  objc_storeStrong((id *)&self->_paymentToken, a3);
}

- (AMSBiometricsSignatureResult)signatureResult
{
  return self->_signatureResult;
}

- (void)setSignatureResult:(id)a3
{
  objc_storeStrong((id *)&self->_signatureResult, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_signatureResult, 0);
  objc_storeStrong((id *)&self->_paymentToken, 0);
  objc_storeStrong((id *)&self->_passwordEquivalentToken, 0);
  objc_storeStrong((id *)&self->_error, 0);
}

@end
