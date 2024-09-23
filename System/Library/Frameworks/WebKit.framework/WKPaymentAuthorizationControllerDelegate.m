@implementation WKPaymentAuthorizationControllerDelegate

- (WKPaymentAuthorizationControllerDelegate)initWithRequest:(id)a3 presenter:(void *)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)WKPaymentAuthorizationControllerDelegate;
  return (WKPaymentAuthorizationControllerDelegate *)-[WKPaymentAuthorizationDelegate _initWithRequest:presenter:](&v5, sel__initWithRequest_presenter_, a3, a4);
}

- (void)_getPaymentServicesMerchantURL:(id)a3
{
  uint64_t (**v5)(void);
  char v6;
  uint64_t (**v7)(void);

  v5 = (uint64_t (**)(void))MEMORY[0x1E0DCE230];
  ((void (*)(WKPaymentAuthorizationControllerDelegate *, SEL))*MEMORY[0x1E0DCE230])(self, a2);
  v6 = objc_opt_respondsToSelector();
  v7 = (uint64_t (**)(void))MEMORY[0x1E0DCE2C0];
  if ((v6 & 1) != 0)
    v7 = v5;
  objc_msgSend((id)(*v7)(), "paymentServicesMerchantURLForAPIType:completion:", objc_msgSend(self->super._request.m_ptr, "APIType"), a3);
}

- (void)paymentAuthorizationController:(id)a3 didAuthorizePayment:(id)a4 handler:(id)a5
{
  -[WKPaymentAuthorizationDelegate _didAuthorizePayment:completion:](self, "_didAuthorizePayment:completion:", a4, a5);
}

- (void)paymentAuthorizationController:(id)a3 didSelectShippingMethod:(id)a4 handler:(id)a5
{
  -[WKPaymentAuthorizationDelegate _didSelectShippingMethod:completion:](self, "_didSelectShippingMethod:completion:", a4, a5);
}

- (void)paymentAuthorizationController:(id)a3 didSelectShippingContact:(id)a4 handler:(id)a5
{
  -[WKPaymentAuthorizationDelegate _didSelectShippingContact:completion:](self, "_didSelectShippingContact:completion:", a4, a5);
}

- (void)paymentAuthorizationController:(id)a3 didSelectPaymentMethod:(id)a4 handler:(id)a5
{
  -[WKPaymentAuthorizationDelegate _didSelectPaymentMethod:completion:](self, "_didSelectPaymentMethod:completion:", a4, a5);
}

- (id)presentationWindowForPaymentAuthorizationController:(id)a3
{
  return 0;
}

- (void)paymentAuthorizationController:(id)a3 didChangeCouponCode:(id)a4 handler:(id)a5
{
  -[WKPaymentAuthorizationDelegate _didChangeCouponCode:completion:](self, "_didChangeCouponCode:completion:", a4, a5);
}

- (void)paymentAuthorizationController:(id)a3 willFinishWithError:(id)a4
{
  -[WKPaymentAuthorizationDelegate _willFinishWithError:](self, "_willFinishWithError:", a4);
}

- (void)paymentAuthorizationController:(id)a3 didRequestMerchantSession:(id)a4
{
  -[WKPaymentAuthorizationDelegate _didRequestMerchantSession:](self, "_didRequestMerchantSession:", a4);
}

@end
