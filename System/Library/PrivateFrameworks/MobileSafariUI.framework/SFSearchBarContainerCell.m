@implementation SFSearchBarContainerCell

+ (NSString)dataSourceSectionIdentifier
{
  return (NSString *)CFSTR("SearchBarContainerSection");
}

+ (NSString)dataSourceItemIdentifier
{
  return (NSString *)CFSTR("SearchBarContainer");
}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SFSearchBarContainerCell;
  -[SFSearchBarContainerCell layoutSubviews](&v3, sel_layoutSubviews);
  -[SFSearchBarContainerCell bounds](self, "bounds");
  -[UISearchBar setFrame:](self->_searchBar, "setFrame:");
}

- (void)setSearchBar:(id)a3
{
  UISearchBar *v5;
  UISearchBar *searchBar;
  UISearchBar *v7;

  v5 = (UISearchBar *)a3;
  searchBar = self->_searchBar;
  v7 = v5;
  if (searchBar != v5)
  {
    -[UISearchBar removeFromSuperview](searchBar, "removeFromSuperview");
    objc_storeStrong((id *)&self->_searchBar, a3);
    -[SFSearchBarContainerCell addSubview:](self, "addSubview:", v7);
    -[SFSearchBarContainerCell setNeedsLayout](self, "setNeedsLayout");
  }

}

- (id)preferredLayoutAttributesFittingAttributes:(id)a3
{
  void *v4;
  double v5;
  double v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SFSearchBarContainerCell;
  -[SFSearchBarContainerCell preferredLayoutAttributesFittingAttributes:](&v8, sel_preferredLayoutAttributesFittingAttributes_, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[UISearchBar frame](self->_searchBar, "frame");
  objc_msgSend(v4, "setSize:", v5, v6);
  return v4;
}

- (UISearchBar)searchBar
{
  return self->_searchBar;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_searchBar, 0);
}

@end
