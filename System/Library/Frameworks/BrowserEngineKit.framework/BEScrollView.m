@implementation BEScrollView

- (void)setDelegate:(id)a3
{
  id v4;
  char v5;
  char v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)BEScrollView;
  v4 = a3;
  -[BEScrollView setDelegate:](&v7, sel_setDelegate_, v4);
  *(_BYTE *)&self->_beScrollViewFlags = *(_BYTE *)&self->_beScrollViewFlags & 0xFE | objc_opt_respondsToSelector() & 1;
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
    v6 = 2;
  else
    v6 = 0;
  *(_BYTE *)&self->_beScrollViewFlags = *(_BYTE *)&self->_beScrollViewFlags & 0xFD | v6;
}

- (id)delegateFromSuperclass
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BEScrollView;
  -[BEScrollView delegate](&v3, sel_delegate);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)_subclassHandlesAsyncScrollEvent
{
  return *(_BYTE *)&self->_beScrollViewFlags & 1;
}

- (void)_asynchronouslyHandleScrollEvent:(id)a3 completion:(id)a4
{
  void (**v6)(id, _QWORD);
  unint64_t v7;
  _QWORD *v8;
  void *v9;
  id v10;

  v10 = a3;
  v6 = (void (**)(id, _QWORD))a4;
  v7 = objc_msgSend(v10, "phase") - 2;
  if (v7 >= 4)
  {
    v6[2](v6, -[BEScrollView isScrollEnabled](self, "isScrollEnabled") ^ 1);
  }
  else
  {
    v8 = -[BEScrollViewScrollUpdate initWithScrollEvent:phase:]([BEScrollViewScrollUpdate alloc], v10, v7);
    -[BEScrollView delegateFromSuperclass](self, "delegateFromSuperclass");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "scrollView:handleScrollUpdate:completion:", self, v8, v6);

  }
}

- (id)_actingParentScrollView
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  -[BEScrollView delegateFromSuperclass](self, "delegateFromSuperclass");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if ((*(_BYTE *)&self->_beScrollViewFlags & 2) == 0
    || (objc_msgSend(v3, "parentScrollViewForScrollView:", self),
        (v5 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    v7.receiver = self;
    v7.super_class = (Class)BEScrollView;
    -[BEScrollView _actingParentScrollView](&v7, sel__actingParentScrollView);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v5;
}

@end
