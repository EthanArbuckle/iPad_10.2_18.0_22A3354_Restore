@implementation NTKContainerView

- (void)layoutSubviews
{
  id WeakRetained;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)NTKContainerView;
  -[NTKContainerView layoutSubviews](&v4, sel_layoutSubviews);
  if ((*(_BYTE *)&self->_delegateRespondsTo & 1) != 0)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_layoutDelegate);
    objc_msgSend(WeakRetained, "layoutContainerView:", self);

  }
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat y;
  CGFloat x;
  id v7;
  void *v8;
  id v9;
  _QWORD v11[5];
  id v12;
  uint64_t *v13;
  CGFloat v14;
  CGFloat v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  char v19;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  v16 = 0;
  v17 = &v16;
  v18 = 0x2020000000;
  v19 = 0;
  -[NTKContainerView subviews](self, "subviews");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __42__NTKContainerView_pointInside_withEvent___block_invoke;
  v11[3] = &unk_1E6BD6168;
  v11[4] = self;
  v14 = x;
  v15 = y;
  v9 = v7;
  v12 = v9;
  v13 = &v16;
  objc_msgSend(v8, "enumerateObjectsUsingBlock:", v11);

  LOBYTE(v8) = *((_BYTE *)v17 + 24);
  _Block_object_dispose(&v16, 8);

  return (char)v8;
}

void __42__NTKContainerView_pointInside_withEvent___block_invoke(double *a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  double v7;
  double v8;
  id v9;

  v6 = (void *)*((_QWORD *)a1 + 4);
  v7 = a1[7];
  v8 = a1[8];
  v9 = a2;
  objc_msgSend(v6, "convertPoint:toView:", v9, v7, v8);
  LODWORD(v6) = objc_msgSend(v9, "pointInside:withEvent:", *((_QWORD *)a1 + 5));

  if ((_DWORD)v6)
  {
    *(_BYTE *)(*(_QWORD *)(*((_QWORD *)a1 + 6) + 8) + 24) = 1;
    *a4 = 1;
  }
}

- (void)setLayoutDelegate:(id)a3
{
  id WeakRetained;
  id v5;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_layoutDelegate);

  if (WeakRetained != obj)
  {
    v5 = objc_storeWeak((id *)&self->_layoutDelegate, obj);
    *(_BYTE *)&self->_delegateRespondsTo = *(_BYTE *)&self->_delegateRespondsTo & 0xFE | objc_opt_respondsToSelector() & 1;

  }
}

- (NTKContainerViewLayoutDelegate)layoutDelegate
{
  return (NTKContainerViewLayoutDelegate *)objc_loadWeakRetained((id *)&self->_layoutDelegate);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_layoutDelegate);
}

@end
