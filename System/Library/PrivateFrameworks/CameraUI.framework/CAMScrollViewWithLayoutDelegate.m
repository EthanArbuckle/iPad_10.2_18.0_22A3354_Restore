@implementation CAMScrollViewWithLayoutDelegate

- (void)layoutSubviews
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CAMScrollViewWithLayoutDelegate;
  -[CAMScrollViewWithLayoutDelegate layoutSubviews](&v4, sel_layoutSubviews);
  -[CAMScrollViewWithLayoutDelegate layoutDelegate](self, "layoutDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "scrollViewDidLayoutSubviews:", self);

}

- (CAMScrollViewLayoutDelegate)layoutDelegate
{
  return (CAMScrollViewLayoutDelegate *)objc_loadWeakRetained((id *)&self->_layoutDelegate);
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
