@implementation ISPaneFrameView

- (void)layoutSubviews
{
  void *v3;
  objc_super v4;

  -[ISPaneFrameView owningViewController](self, "owningViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4.receiver = self;
  v4.super_class = (Class)ISPaneFrameView;
  -[ISPaneFrameView layoutSubviews](&v4, sel_layoutSubviews);
  -[ISPaneFrameView frame](self, "frame");
  objc_msgSend(v3, "_paneFrameChanged:");

}

- (FMSlidingPaneViewController)owningViewController
{
  return (FMSlidingPaneViewController *)objc_loadWeakRetained((id *)&self->_owningViewController);
}

- (void)setOwningViewController:(id)a3
{
  objc_storeWeak((id *)&self->_owningViewController, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_owningViewController);
}

@end
