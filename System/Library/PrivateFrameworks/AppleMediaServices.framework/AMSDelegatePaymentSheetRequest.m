@implementation AMSDelegatePaymentSheetRequest

- (PKPaymentRequest)paymentRequest
{
  return self->_paymentRequest;
}

- (void)setPaymentRequest:(id)a3
{
  objc_storeStrong((id *)&self->_paymentRequest, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_paymentRequest, 0);
}

@end
