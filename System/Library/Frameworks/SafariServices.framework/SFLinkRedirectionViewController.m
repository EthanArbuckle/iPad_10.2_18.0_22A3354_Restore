@implementation SFLinkRedirectionViewController

- (SFLinkRedirectionViewController)initWithURL:(id)a3
{
  id v4;
  SFSafariViewControllerConfiguration *v5;
  SFLinkRedirectionViewController *v6;
  void *v7;
  void *v8;
  SFLinkRedirectionViewController *v9;
  objc_super v11;

  v4 = a3;
  v5 = objc_alloc_init(SFSafariViewControllerConfiguration);
  -[SFSafariViewControllerConfiguration setEntersReaderIfAvailable:](v5, "setEntersReaderIfAvailable:", 0);
  -[SFSafariViewControllerConfiguration _setEphemeral:](v5, "_setEphemeral:", 1);
  v11.receiver = self;
  v11.super_class = (Class)SFLinkRedirectionViewController;
  v6 = -[SFSafariViewController initWithURL:configuration:](&v11, sel_initWithURL_configuration_, v4, v5);

  if (v6)
  {
    -[SFSafariViewController serviceProxy](v6, "serviceProxy");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFSafariViewController initialURL](v6, "initialURL");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "startResolveRedirectionForURL:", v8);

    -[SFSafariViewController setDismissButtonStyle:](v6, "setDismissButtonStyle:", 1);
    -[SFLinkRedirectionViewController setDefersAddingRemoteViewController:](v6, "setDefersAddingRemoteViewController:", 1);
    v9 = v6;
  }

  return v6;
}

- (void)setDefersAddingRemoteViewController:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  if (-[SFSafariViewController defersAddingRemoteViewController](self, "defersAddingRemoteViewController") != a3)
  {
    v5.receiver = self;
    v5.super_class = (Class)SFLinkRedirectionViewController;
    -[SFSafariViewController setDefersAddingRemoteViewController:](&v5, sel_setDefersAddingRemoteViewController_, v3);
    if (!v3)
      -[SFSafariViewController _addRemoteViewControllerIfNeeded](self, "_addRemoteViewControllerIfNeeded");
  }
}

- (void)viewDidLoad
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SFLinkRedirectionViewController;
  -[SFLinkRedirectionViewController viewDidLoad](&v3, sel_viewDidLoad);
  -[SFLinkRedirectionViewController setDefersAddingRemoteViewController:](self, "setDefersAddingRemoteViewController:", 0);
}

- (void)remoteViewController:(id)a3 didResolveRedirectionWithURL:(id)a4 appLink:(id)a5
{
  id v7;
  void *v8;
  id v9;

  v9 = a4;
  v7 = a5;
  -[SFSafariViewController delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v8, "safariViewController:didResolveRedirectionWithURL:appLink:", self, v9, v7);

}

@end
