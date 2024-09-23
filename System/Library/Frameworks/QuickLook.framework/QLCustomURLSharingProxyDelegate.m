@implementation QLCustomURLSharingProxyDelegate

- (QLCustomURLSharingProxyDelegate)initWithDelegate:(id)a3
{
  id v4;
  QLCustomURLSharingProxyDelegate *v5;
  QLCustomURLSharingProxyDelegate *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)QLCustomURLSharingProxyDelegate;
  v5 = -[QLCustomURLSharingProxyDelegate init](&v8, sel_init);
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->_delegate, v4);

  return v6;
}

- (void)documentInteractionControllerDidDismissOptionsMenu:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  id v7;

  v7 = a3;
  -[QLCustomURLSharingProxyDelegate delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[QLCustomURLSharingProxyDelegate delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "documentInteractionControllerDidDismissOptionsMenu:", v7);

  }
}

- (UIDocumentInteractionControllerDelegate)delegate
{
  return (UIDocumentInteractionControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

@end
