@implementation _HKOutsideTapCallback

- (_HKOutsideTapCallback)initWithView:(id)a3 outsideTapBlock:(id)a4
{
  id v6;
  id v7;
  _HKOutsideTapCallback *v8;
  _HKOutsideTapCallback *v9;
  void *v10;
  id outsideTapBlock;
  objc_super v13;

  v6 = a3;
  v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)_HKOutsideTapCallback;
  v8 = -[_HKOutsideTapCallback init](&v13, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_view, v6);
    v10 = _Block_copy(v7);
    outsideTapBlock = v9->_outsideTapBlock;
    v9->_outsideTapBlock = v10;

  }
  return v9;
}

- (UIView)view
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_view);
}

- (id)outsideTapBlock
{
  return self->_outsideTapBlock;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_outsideTapBlock, 0);
  objc_destroyWeak((id *)&self->_view);
}

@end
