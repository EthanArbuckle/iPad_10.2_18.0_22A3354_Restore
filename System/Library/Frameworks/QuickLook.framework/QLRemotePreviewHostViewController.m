@implementation QLRemotePreviewHostViewController

- (void)viewServiceDidTerminateWithError:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[QLRemotePreviewHostViewController remoteItemViewController](self, "remoteItemViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "viewServiceDidTerminateWithError:", v4);

  -[NSExtension cancelExtensionRequestWithIdentifier:](self->_extension, "cancelExtensionRequestWithIdentifier:", self->_request);
}

- (QLRemoteItemViewController)remoteItemViewController
{
  return (QLRemoteItemViewController *)objc_loadWeakRetained((id *)&self->_remoteItemViewController);
}

- (void)setRemoteItemViewController:(id)a3
{
  objc_storeWeak((id *)&self->_remoteItemViewController, a3);
}

- (NSExtension)extension
{
  return self->_extension;
}

- (void)setExtension:(id)a3
{
  objc_storeStrong((id *)&self->_extension, a3);
}

- (id)request
{
  return self->_request;
}

- (void)setRequest:(id)a3
{
  objc_storeStrong(&self->_request, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_request, 0);
  objc_storeStrong((id *)&self->_extension, 0);
  objc_destroyWeak((id *)&self->_remoteItemViewController);
}

@end
