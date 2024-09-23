@implementation SFAutomaticPasswordScrollViewContentView

- (void)layoutSubviews
{
  id WeakRetained;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SFAutomaticPasswordScrollViewContentView;
  -[SFAutomaticPasswordScrollViewContentView layoutSubviews](&v4, sel_layoutSubviews);
  WeakRetained = objc_loadWeakRetained((id *)&self->_layoutObserver);
  objc_msgSend(WeakRetained, "automaticPasswordScrollContentViewDidLayout:", self);

}

- (SFAutomaticPasswordScrollViewContentViewLayoutObserver)layoutObserver
{
  return (SFAutomaticPasswordScrollViewContentViewLayoutObserver *)objc_loadWeakRetained((id *)&self->_layoutObserver);
}

- (void)setLayoutObserver:(id)a3
{
  objc_storeWeak((id *)&self->_layoutObserver, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_layoutObserver);
}

@end
