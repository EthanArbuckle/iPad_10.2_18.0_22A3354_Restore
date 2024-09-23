@implementation _SFLinkRedirectionResolver

- (_SFLinkRedirectionResolver)initWithURL:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  _SFLinkRedirectionResolver *v8;
  uint64_t v9;
  id completionHandler;
  SFLinkRedirectionViewController *v11;
  SFLinkRedirectionViewController *redirectionViewController;
  _SFLinkRedirectionResolver *v13;
  objc_super v15;

  v6 = a3;
  v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)_SFLinkRedirectionResolver;
  v8 = -[_SFLinkRedirectionResolver init](&v15, sel_init);
  if (v8)
  {
    v9 = MEMORY[0x1A8598C40](v7);
    completionHandler = v8->_completionHandler;
    v8->_completionHandler = (id)v9;

    v11 = -[SFLinkRedirectionViewController initWithURL:]([SFLinkRedirectionViewController alloc], "initWithURL:", v6);
    redirectionViewController = v8->_redirectionViewController;
    v8->_redirectionViewController = v11;

    -[SFSafariViewController setDelegate:](v8->_redirectionViewController, "setDelegate:", v8);
    v13 = v8;
  }

  return v8;
}

- (SFSafariViewController)safariViewController
{
  return (SFSafariViewController *)self->_redirectionViewController;
}

- (void)safariViewController:(id)a3 didResolveRedirectionWithURL:(id)a4 appLink:(id)a5
{
  void (**completionHandler)(id, id, id, _QWORD);

  completionHandler = (void (**)(id, id, id, _QWORD))self->_completionHandler;
  if (completionHandler)
    completionHandler[2](completionHandler, a4, a5, 0);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_redirectionViewController, 0);
  objc_storeStrong(&self->_completionHandler, 0);
}

@end
