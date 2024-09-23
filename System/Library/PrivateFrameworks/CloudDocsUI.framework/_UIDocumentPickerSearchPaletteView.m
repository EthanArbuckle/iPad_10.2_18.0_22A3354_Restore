@implementation _UIDocumentPickerSearchPaletteView

- (_UIDocumentPickerSearchPaletteView)initWithFrame:(CGRect)a3
{
  return -[_UIDocumentPickerSearchPaletteView initWithFrame:resultsController:](self, "initWithFrame:resultsController:", 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_UIDocumentPickerSearchPaletteView)initWithCoder:(id)a3
{
  return -[_UIDocumentPickerSearchPaletteView initWithFrame:resultsController:](self, "initWithFrame:resultsController:", 0, *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
}

- (_UIDocumentPickerSearchPaletteView)initWithFrame:(CGRect)a3 resultsController:(id)a4
{
  double height;
  double width;
  double y;
  double x;
  id v9;
  _UIDocumentPickerSearchPaletteView *v10;
  _UIDocumentPickerSearchPaletteView *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  objc_super v19;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v9 = a4;
  v19.receiver = self;
  v19.super_class = (Class)_UIDocumentPickerSearchPaletteView;
  v10 = -[_UIDocumentPickerSearchPaletteView initWithFrame:](&v19, sel_initWithFrame_, x, y, width, height);
  v11 = v10;
  if (v10)
  {
    -[_UIDocumentPickerSearchPaletteView setResultsController:](v10, "setResultsController:", v9);
    v12 = objc_alloc(MEMORY[0x24BDF6D68]);
    -[_UIDocumentPickerSearchPaletteView resultsController](v11, "resultsController");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(v12, "initWithSearchResultsController:", v13);
    -[_UIDocumentPickerSearchPaletteView setSearchController:](v11, "setSearchController:", v14);

    objc_msgSend(MEMORY[0x24BDF6950], "systemBackgroundColor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIDocumentPickerSearchPaletteView setBackgroundColor:](v11, "setBackgroundColor:", v15);

    -[_UIDocumentPickerSearchPaletteView searchController](v11, "searchController");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "searchBar");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v17, "setDelegate:", v11);
    -[_UIDocumentPickerSearchPaletteView bounds](v11, "bounds");
    objc_msgSend(v17, "setFrame:");
    objc_msgSend(v17, "setAutoresizingMask:", 18);
    -[_UIDocumentPickerSearchPaletteView addSubview:](v11, "addSubview:", v17);

  }
  return v11;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[UISearchController searchBar](self->_searchController, "searchBar");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setDelegate:", 0);

  v4.receiver = self;
  v4.super_class = (Class)_UIDocumentPickerSearchPaletteView;
  -[_UIDocumentPickerSearchPaletteView dealloc](&v4, sel_dealloc);
}

- (void)setBounds:(CGRect)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_UIDocumentPickerSearchPaletteView;
  -[_UIDocumentPickerSearchPaletteView setBounds:](&v3, sel_setBounds_, a3.origin.x, a3.origin.y, a3.size.width, 44.0);
}

- (void)setFrame:(CGRect)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_UIDocumentPickerSearchPaletteView;
  -[_UIDocumentPickerSearchPaletteView setFrame:](&v3, sel_setFrame_, a3.origin.x, a3.origin.y, a3.size.width, 44.0);
}

- (void)layoutSubviews
{
  void *v3;
  void *v4;
  _UIDocumentPickerSearchPaletteView *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)_UIDocumentPickerSearchPaletteView;
  -[_UIDocumentPickerSearchPaletteView layoutSubviews](&v16, sel_layoutSubviews);
  -[_UIDocumentPickerSearchPaletteView searchController](self, "searchController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "searchBar");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "superview");
  v5 = (_UIDocumentPickerSearchPaletteView *)objc_claimAutoreleasedReturnValue();

  if (v5 == self)
  {
    -[_UIDocumentPickerSearchPaletteView bounds](self, "bounds");
    v7 = v6;
    v9 = v8;
    v11 = v10;
    v13 = v12;
    -[_UIDocumentPickerSearchPaletteView searchController](self, "searchController");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "searchBar");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setFrame:", v7, v9, v11, v13);

  }
}

- (void)searchBarTextDidBeginEditing:(id)a3
{
  void *v4;
  id v5;

  objc_msgSend(a3, "text");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[_UIDocumentPickerSearchPaletteView resultsController](self, "resultsController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setQueryString:", v5);

}

- (void)searchCanceled:(id)a3
{
  id v3;

  -[_UIDocumentPickerSearchPaletteView resultsController](self, "resultsController", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setQueryString:", &stru_24E43B9D8);

}

- (void)searchBar:(id)a3 textDidChange:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  -[_UIDocumentPickerSearchPaletteView resultsController](self, "resultsController");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setQueryString:", v5);

}

- (UISearchController)searchController
{
  return self->_searchController;
}

- (void)setSearchController:(id)a3
{
  objc_storeStrong((id *)&self->_searchController, a3);
}

- (_UIDocumentSearchListController)resultsController
{
  return self->_resultsController;
}

- (void)setResultsController:(id)a3
{
  objc_storeStrong((id *)&self->_resultsController, a3);
}

- (NSLayoutConstraint)searchFieldLeftConstraint
{
  return self->_searchFieldLeftConstraint;
}

- (void)setSearchFieldLeftConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_searchFieldLeftConstraint, a3);
}

- (NSLayoutConstraint)searchFieldRightConstraint
{
  return self->_searchFieldRightConstraint;
}

- (void)setSearchFieldRightConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_searchFieldRightConstraint, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_searchFieldRightConstraint, 0);
  objc_storeStrong((id *)&self->_searchFieldLeftConstraint, 0);
  objc_storeStrong((id *)&self->_resultsController, 0);
  objc_storeStrong((id *)&self->_searchController, 0);
}

@end
