@implementation _UIDocumentPickerContainerViewHuggingTableView

- (void)setFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  objc_super v14;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[_UIDocumentPickerContainerViewHuggingTableView superview](self, "superview");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[_UIDocumentPickerContainerViewHuggingTableView superview](self, "superview");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "bounds");
    x = v10;
    y = v11;
    width = v12;
    height = v13;

  }
  v14.receiver = self;
  v14.super_class = (Class)_UIDocumentPickerContainerViewHuggingTableView;
  -[_UIDocumentPickerContainerViewHuggingTableView setFrame:](&v14, sel_setFrame_, x, y, width, height);
}

- (void)willMoveToSuperview:(id)a3
{
  id v4;
  id WeakRetained;
  id v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  id v11;
  id v12;
  uint64_t v13;
  objc_super v14;

  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_ancestralContainerView);

  if (WeakRetained)
  {
    v6 = v4;
    if (v6)
    {
      v7 = v6;
      v8 = v6;
      while (1)
      {
        v9 = objc_loadWeakRetained((id *)&self->_ancestralContainerView);

        if (v8 == v9)
          break;
        objc_msgSend(v8, "superview");
        v10 = objc_claimAutoreleasedReturnValue();

        v8 = (id)v10;
        if (!v10)
          goto LABEL_11;
      }
      v11 = v7;

      do
      {
        v12 = objc_loadWeakRetained((id *)&self->_ancestralContainerView);

        if (v11 == v12)
          break;
        objc_msgSend(v11, "setAutoresizingMask:", 18);
        objc_msgSend(v11, "superview");
        v13 = objc_claimAutoreleasedReturnValue();

        v11 = (id)v13;
      }
      while (v13);

    }
  }
LABEL_11:
  v14.receiver = self;
  v14.super_class = (Class)_UIDocumentPickerContainerViewHuggingTableView;
  -[_UIDocumentPickerContainerViewHuggingTableView willMoveToSuperview:](&v14, sel_willMoveToSuperview_, v4);

}

- (UIView)ancestralContainerView
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_ancestralContainerView);
}

- (void)setAncestralContainerView:(id)a3
{
  objc_storeWeak((id *)&self->_ancestralContainerView, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_ancestralContainerView);
}

@end
