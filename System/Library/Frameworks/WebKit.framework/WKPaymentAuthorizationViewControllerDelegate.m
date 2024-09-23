@implementation WKPaymentAuthorizationViewControllerDelegate

- (WKPaymentAuthorizationViewControllerDelegate)initWithRequest:(id)a3 presenter:(void *)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)WKPaymentAuthorizationViewControllerDelegate;
  return (WKPaymentAuthorizationViewControllerDelegate *)-[WKPaymentAuthorizationDelegate _initWithRequest:presenter:](&v5, sel__initWithRequest_presenter_, a3, a4);
}

- (void)_getPaymentServicesMerchantURL:(id)a3
{
  objc_msgSend((id)((uint64_t (*)(WKPaymentAuthorizationViewControllerDelegate *, SEL))*MEMORY[0x1E0DCE2C0])(self, a2), "paymentServicesMerchantURLForAPIType:completion:", objc_msgSend(self->super._request.m_ptr, "APIType"), a3);
}

- (void)paymentAuthorizationViewController:(id)a3 didAuthorizePayment:(id)a4 handler:(id)a5
{
  -[WKPaymentAuthorizationDelegate _didAuthorizePayment:completion:](self, "_didAuthorizePayment:completion:", a4, a5);
}

- (void)paymentAuthorizationViewController:(id)a3 didSelectShippingMethod:(id)a4 handler:(id)a5
{
  -[WKPaymentAuthorizationDelegate _didSelectShippingMethod:completion:](self, "_didSelectShippingMethod:completion:", a4, a5);
}

- (void)paymentAuthorizationViewController:(id)a3 didSelectShippingContact:(id)a4 handler:(id)a5
{
  -[WKPaymentAuthorizationDelegate _didSelectShippingContact:completion:](self, "_didSelectShippingContact:completion:", a4, a5);
}

- (void)paymentAuthorizationViewController:(id)a3 didSelectPaymentMethod:(id)a4 handler:(id)a5
{
  -[WKPaymentAuthorizationDelegate _didSelectPaymentMethod:completion:](self, "_didSelectPaymentMethod:completion:", a4, a5);
}

- (void)paymentAuthorizationViewController:(id)a3 didChangeCouponCode:(id)a4 handler:(id)a5
{
  -[WKPaymentAuthorizationDelegate _didChangeCouponCode:completion:](self, "_didChangeCouponCode:completion:", a4, a5);
}

- (void)paymentAuthorizationViewController:(id)a3 willFinishWithError:(id)a4
{
  -[WKPaymentAuthorizationDelegate _willFinishWithError:](self, "_willFinishWithError:", a4);
}

- (void)paymentAuthorizationViewController:(id)a3 didRequestMerchantSession:(id)a4
{
  -[WKPaymentAuthorizationDelegate _didRequestMerchantSession:](self, "_didRequestMerchantSession:", a4);
}

@end
