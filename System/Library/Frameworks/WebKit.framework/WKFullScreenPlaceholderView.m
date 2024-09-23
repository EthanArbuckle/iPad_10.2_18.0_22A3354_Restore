@implementation WKFullScreenPlaceholderView

- (void)willMoveToSuperview:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)WKFullScreenPlaceholderView;
  -[WKFullScreenPlaceholderView willMoveToSuperview:](&v5, sel_willMoveToSuperview_);
  -[WKFullScreenWindowController placeholderWillMoveToSuperview:](-[WKFullScreenPlaceholderView parent](self, "parent"), "placeholderWillMoveToSuperview:", a3);
}

- (WKFullScreenWindowController)parent
{
  return (WKFullScreenWindowController *)objc_loadWeak((id *)&self->_parent);
}

- (void)setParent:(id)a3
{
  objc_storeWeak((id *)&self->_parent, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_parent);
}

@end
