@implementation CNContactViewServiceErrorViewController

- (void)setupWithOptions:(id)a3 readyBlock:(id)a4
{
  (*((void (**)(id, _QWORD))a4 + 2))(a4, 0);
}

- (CNContactViewControllerPPTDelegate)pptDelegate
{
  return (CNContactViewControllerPPTDelegate *)objc_loadWeakRetained((id *)&self->pptDelegate);
}

- (void)setPptDelegate:(id)a3
{
  objc_storeWeak((id *)&self->pptDelegate, a3);
}

- (CNContactViewHostProtocol)delegate
{
  return (CNContactViewHostProtocol *)objc_loadWeakRetained((id *)&self->delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->delegate);
  objc_destroyWeak((id *)&self->pptDelegate);
}

@end
