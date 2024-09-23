@implementation PKSelectionGestureView

- (PKSelectionInteraction)selectionInteraction
{
  return self->_selectionInteraction;
}

- (PKSelectionGestureView)initWithFrame:(CGRect)a3 selectionController:(id)a4
{
  double height;
  double width;
  double y;
  double x;
  id v9;
  PKSelectionGestureView *v10;
  PKSelectionGestureView *v11;
  PKSelectionInteraction *v12;
  PKSelectionInteraction *selectionInteraction;
  objc_super v15;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v9 = a4;
  v15.receiver = self;
  v15.super_class = (Class)PKSelectionGestureView;
  v10 = -[PKSelectionGestureView initWithFrame:](&v15, sel_initWithFrame_, x, y, width, height);
  v11 = v10;
  if (v10)
  {
    objc_storeWeak((id *)&v10->_selectionController, v9);
    v12 = -[PKSelectionInteraction initWithSelectionController:]([PKSelectionInteraction alloc], "initWithSelectionController:", v9);
    selectionInteraction = v11->_selectionInteraction;
    v11->_selectionInteraction = v12;

    -[PKSelectionGestureView addInteraction:](v11, "addInteraction:", v11->_selectionInteraction);
  }

  return v11;
}

- (void)didMoveToWindow
{
  void *v3;
  id *WeakRetained;
  id *v5;
  id v6;
  void *v7;
  id v8;

  -[PKSelectionGestureView window](self, "window");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[PKSelectionGestureView selectionInteraction](self, "selectionInteraction");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    WeakRetained = (id *)objc_loadWeakRetained((id *)&self->_selectionController);
    v5 = WeakRetained;
    if (WeakRetained)
      v6 = objc_loadWeakRetained(WeakRetained + 14);
    else
      v6 = 0;
    objc_msgSend(v6, "ink");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "_updateAllowedTouchTypesForSelectedInk:", v7);

  }
}

- (void)setSelectionInteraction:(id)a3
{
  objc_storeStrong((id *)&self->_selectionInteraction, a3);
}

- (PKSelectionController)selectionController
{
  return (PKSelectionController *)objc_loadWeakRetained((id *)&self->_selectionController);
}

- (void)setSelectionController:(id)a3
{
  objc_storeWeak((id *)&self->_selectionController, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_selectionController);
  objc_storeStrong((id *)&self->_selectionInteraction, 0);
}

@end
