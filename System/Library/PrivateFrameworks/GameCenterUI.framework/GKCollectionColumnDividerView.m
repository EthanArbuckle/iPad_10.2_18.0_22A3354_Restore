@implementation GKCollectionColumnDividerView

- (GKCollectionColumnDividerView)initWithFrame:(CGRect)a3
{
  GKCollectionColumnDividerView *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GKCollectionColumnDividerView;
  v3 = -[GKCollectionColumnDividerView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.0, 0.25);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[GKCollectionColumnDividerView setBackgroundColor:](v3, "setBackgroundColor:", v4);

  }
  return v3;
}

@end
