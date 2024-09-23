@implementation CNChevronButton

- (CNChevronButton)initWithFrame:(CGRect)a3
{
  CNChevronButton *v3;
  CNChevronButton *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CNChevronButton;
  v3 = -[CNChevronButton initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[CNChevronButton setContextMenuInteractionEnabled:](v3, "setContextMenuInteractionEnabled:", 1);
    -[CNChevronButton setShowsMenuAsPrimaryAction:](v4, "setShowsMenuAsPrimaryAction:", 1);
  }
  return v4;
}

- (id)contextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4
{
  void *v4;
  void *v5;

  -[CNChevronButton delegateView](self, "delegateView", a3, a4.x, a4.y);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "menuConfigurationForChevronButton");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (CNChevronButtonMenuDelegate)delegateView
{
  return (CNChevronButtonMenuDelegate *)objc_loadWeakRetained((id *)&self->_delegateView);
}

- (void)setDelegateView:(id)a3
{
  objc_storeWeak((id *)&self->_delegateView, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegateView);
}

@end
