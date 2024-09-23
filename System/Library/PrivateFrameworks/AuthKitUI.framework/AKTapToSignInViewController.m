@implementation AKTapToSignInViewController

- (void)_provideDelegateWithAuthResults:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[AKBaseSignInViewController delegate](self, "delegate");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "tapToSignInViewController:didAuthenticateWithResults:error:", self, v7, v6);

}

@end
