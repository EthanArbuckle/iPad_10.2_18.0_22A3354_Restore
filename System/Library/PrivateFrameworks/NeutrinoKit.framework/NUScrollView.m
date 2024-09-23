@implementation NUScrollView

- (CGRect)visibleRect
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGRect result;

  -[NUScrollView contentSize](self, "contentSize");
  v4 = v3;
  -[NUScrollView contentOffset](self, "contentOffset");
  v6 = v4 - v5;
  -[NUScrollView contentSize](self, "contentSize");
  v8 = v7;
  -[NUScrollView contentOffset](self, "contentOffset");
  v10 = v8 - v9;
  -[NUScrollView contentOffset](self, "contentOffset");
  v13 = v6;
  v14 = v10;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (id)description
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v8.receiver = self;
  v8.super_class = (Class)NUScrollView;
  -[NUScrollView description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NUScrollView zoomScale](self, "zoomScale");
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@; zoomScale: %g"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

@end
