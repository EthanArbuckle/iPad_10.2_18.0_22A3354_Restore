@implementation MUPresentationOptions

- (id)copyWithZone:(_NSZone *)a3
{
  MUPresentationOptions *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = objc_alloc_init(MUPresentationOptions);
  -[MUPresentationOptions presentingViewController](self, "presentingViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUPresentationOptions setPresentingViewController:](v4, "setPresentingViewController:", v5);

  -[MUPresentationOptions sourceView](self, "sourceView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUPresentationOptions setSourceView:](v4, "setSourceView:", v6);

  -[MUPresentationOptions sourceRect](self, "sourceRect");
  -[MUPresentationOptions setSourceRect:](v4, "setSourceRect:");
  -[MUPresentationOptions progressObserver](self, "progressObserver");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUPresentationOptions setProgressObserver:](v4, "setProgressObserver:", v7);

  -[MUPresentationOptions barButtonItem](self, "barButtonItem");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUPresentationOptions setBarButtonItem:](v4, "setBarButtonItem:", v8);

  return v4;
}

- (UIViewController)presentingViewController
{
  return self->_presentingViewController;
}

- (void)setPresentingViewController:(id)a3
{
  objc_storeStrong((id *)&self->_presentingViewController, a3);
}

- (UIView)sourceView
{
  return self->_sourceView;
}

- (void)setSourceView:(id)a3
{
  objc_storeStrong((id *)&self->_sourceView, a3);
}

- (CGRect)sourceRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_sourceRect.origin.x;
  y = self->_sourceRect.origin.y;
  width = self->_sourceRect.size.width;
  height = self->_sourceRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setSourceRect:(CGRect)a3
{
  self->_sourceRect = a3;
}

- (MUActivityObserving)progressObserver
{
  return self->_progressObserver;
}

- (void)setProgressObserver:(id)a3
{
  objc_storeStrong((id *)&self->_progressObserver, a3);
}

- (UIBarButtonItem)barButtonItem
{
  return self->_barButtonItem;
}

- (void)setBarButtonItem:(id)a3
{
  objc_storeStrong((id *)&self->_barButtonItem, a3);
}

- (UIContextMenuInteraction)contextMenuInteraction
{
  return self->_contextMenuInteraction;
}

- (void)setContextMenuInteraction:(id)a3
{
  objc_storeStrong((id *)&self->_contextMenuInteraction, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contextMenuInteraction, 0);
  objc_storeStrong((id *)&self->_barButtonItem, 0);
  objc_storeStrong((id *)&self->_progressObserver, 0);
  objc_storeStrong((id *)&self->_sourceView, 0);
  objc_storeStrong((id *)&self->_presentingViewController, 0);
}

@end
