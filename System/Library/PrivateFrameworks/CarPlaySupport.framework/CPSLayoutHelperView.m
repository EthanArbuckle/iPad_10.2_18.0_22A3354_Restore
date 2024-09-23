@implementation CPSLayoutHelperView

- (CPSLayoutHelperView)init
{
  CPSLayoutHelperView *v3;
  objc_super v4;
  SEL v5;
  CPSLayoutHelperView *v6;

  v5 = a2;
  v6 = 0;
  v4.receiver = self;
  v4.super_class = (Class)CPSLayoutHelperView;
  v6 = -[CPSLayoutHelperView init](&v4, sel_init);
  objc_storeStrong((id *)&v6, v6);
  if (v6)
    -[CPSLayoutHelperView setTranslatesAutoresizingMaskIntoConstraints:](v6, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v3 = v6;
  objc_storeStrong((id *)&v6, 0);
  return v3;
}

- (void)layoutSubviews
{
  CPSLayoutHelperViewDelegate *v2;
  CPSLayoutHelperViewDelegate *v3;
  char v4;
  char v5;
  CPSLayoutHelperViewDelegate *v6;
  objc_super v7;
  SEL v8;
  CPSLayoutHelperView *v9;

  v9 = self;
  v8 = a2;
  v7.receiver = self;
  v7.super_class = (Class)CPSLayoutHelperView;
  -[CPSLayoutHelperView layoutSubviews](&v7, sel_layoutSubviews);
  v3 = -[CPSLayoutHelperView layoutDelegate](v9, "layoutDelegate");
  v5 = 0;
  v4 = 0;
  if (v3)
  {
    v6 = -[CPSLayoutHelperView layoutDelegate](v9, "layoutDelegate");
    v5 = 1;
    v4 = objc_opt_respondsToSelector();
  }
  if ((v5 & 1) != 0)

  if ((v4 & 1) != 0)
  {
    v2 = -[CPSLayoutHelperView layoutDelegate](v9, "layoutDelegate");
    -[CPSLayoutHelperViewDelegate didChangeLayout:](v2, "didChangeLayout:", v9);

  }
}

- (CPSLayoutHelperViewDelegate)layoutDelegate
{
  return (CPSLayoutHelperViewDelegate *)objc_loadWeakRetained((id *)&self->_layoutDelegate);
}

- (void)setLayoutDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_layoutDelegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_layoutDelegate);
}

@end
