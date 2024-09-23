@implementation AFUISiriRemoteContainerView

- (void)setRemoteContentView:(id)a3
{
  UIView *remoteContentView;
  id v6;

  v6 = a3;
  -[UIView removeFromSuperview](self->_remoteContentView, "removeFromSuperview");
  objc_storeStrong((id *)&self->_remoteContentView, a3);
  remoteContentView = self->_remoteContentView;
  if (remoteContentView)
  {
    -[AFUISiriRemoteContainerView bounds](self, "bounds");
    -[UIView setFrame:](remoteContentView, "setFrame:");
    -[AFUISiriRemoteContainerView addSubview:](self, "addSubview:", self->_remoteContentView);
  }

}

- (void)layoutSubviews
{
  UIView *remoteContentView;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)AFUISiriRemoteContainerView;
  -[AFUISiriRemoteContainerView layoutSubviews](&v4, sel_layoutSubviews);
  remoteContentView = self->_remoteContentView;
  -[AFUISiriRemoteContainerView bounds](self, "bounds");
  -[UIView setFrame:](remoteContentView, "setFrame:");
}

- (UIView)remoteContentView
{
  return self->_remoteContentView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remoteContentView, 0);
}

@end
