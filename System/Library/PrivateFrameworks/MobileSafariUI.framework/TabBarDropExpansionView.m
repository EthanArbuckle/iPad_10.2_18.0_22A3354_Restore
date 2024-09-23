@implementation TabBarDropExpansionView

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (TabBarDropExpansionView)initWithFrame:(CGRect)a3
{
  TabBarDropExpansionView *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)TabBarDropExpansionView;
  v3 = -[TabBarDropExpansionView initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  -[TabBarDropExpansionView layer](v3, "layer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setHitTestsAsOpaque:", 1);

  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3780]), "initWithDelegate:", v3);
  -[TabBarDropExpansionView addInteraction:](v3, "addInteraction:", v5);

  return v3;
}

- (TabBarDropExpansionView)initWithCoder:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)TabBarDropExpansionView;
  return -[TabBarDropExpansionView initWithCoder:](&v4, sel_initWithCoder_, a3);
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  id v7;
  BOOL v8;
  objc_super v10;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  if (objc_msgSend(v7, "type") == 9)
  {
    v10.receiver = self;
    v10.super_class = (Class)TabBarDropExpansionView;
    v8 = -[TabBarDropExpansionView pointInside:withEvent:](&v10, sel_pointInside_withEvent_, v7, x, y);
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  id v7;
  void *v8;
  objc_super v10;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  if (objc_msgSend(v7, "type") == 9)
  {
    v10.receiver = self;
    v10.super_class = (Class)TabBarDropExpansionView;
    -[TabBarDropExpansionView hitTest:withEvent:](&v10, sel_hitTest_withEvent_, v7, x, y);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (BOOL)dropInteraction:(id)a3 canHandleSession:(id)a4
{
  return +[TabDocumentDropHandler canHandleSession:](TabDocumentDropHandler, "canHandleSession:", a4);
}

- (void)dropInteraction:(id)a3 sessionDidEnter:(id)a4
{
  id WeakRetained;
  id v6;

  v6 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "tabBarDropExpansionView:didBeginTrackingDropSession:", self, v6);

}

- (void)dropInteraction:(id)a3 sessionDidEnd:(id)a4
{
  id WeakRetained;
  id v6;

  v6 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "tabBarDropExpansionView:didEndTrackingDropSession:", self, v6);

}

- (int64_t)_dropInteraction:(id)a3 dataOwnerForSession:(id)a4
{
  return 3;
}

- (TabBarDropExpansionViewDelegate)delegate
{
  return (TabBarDropExpansionViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

@end
