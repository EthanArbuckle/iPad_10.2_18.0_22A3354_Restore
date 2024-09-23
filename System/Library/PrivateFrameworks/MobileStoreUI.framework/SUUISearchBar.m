@implementation SUUISearchBar

- (SUUISearchBar)init
{
  SUUISearchBar *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SUUISearchBar;
  v2 = -[SUUISearchBar init](&v8, sel_init);
  if (v2)
  {
    v3 = storeSemanticContentAttribute();
    if (storeShouldReverseLayoutDirection())
      v4 = 2;
    else
      v4 = 0;
    -[SUUISearchBar setSemanticContentAttribute:](v2, "setSemanticContentAttribute:", v3);
    -[SUUISearchBar searchField](v2, "searchField");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setSemanticContentAttribute:", v3);

    -[SUUISearchBar searchField](v2, "searchField");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setTextAlignment:", v4);

  }
  return v2;
}

- (BOOL)showsCancelButton
{
  return 0;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  objc_super v13;
  CGSize result;

  v13.receiver = self;
  v13.super_class = (Class)SUUISearchBar;
  -[SUUISearchBar sizeThatFits:](&v13, sel_sizeThatFits_, a3.width, a3.height);
  v5 = v4;
  v7 = v6;
  -[SUUISearchBar intrinsicWidth](self, "intrinsicWidth");
  if (v8 > 0.0)
  {
    -[SUUISearchBar intrinsicWidth](self, "intrinsicWidth");
    if (v9 < v5)
    {
      -[SUUISearchBar intrinsicWidth](self, "intrinsicWidth");
      v5 = v10;
    }
  }
  v11 = v5;
  v12 = v7;
  result.height = v12;
  result.width = v11;
  return result;
}

- (double)intrinsicWidth
{
  return self->_intrinsicWidth;
}

- (void)setIntrinsicWidth:(double)a3
{
  self->_intrinsicWidth = a3;
}

@end
