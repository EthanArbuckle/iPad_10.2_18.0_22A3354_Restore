@implementation GKRectShadowCell

- (void)awakeFromNib
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)GKRectShadowCell;
  -[GKRectShadowCell awakeFromNib](&v3, sel_awakeFromNib);
  -[GKRectShadowCell setClipsToBounds:](self, "setClipsToBounds:", 0);
}

- (BOOL)canBecomeFocused
{
  return 1;
}

- (void)setHighlighted:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  objc_super v7;

  v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)GKRectShadowCell;
  -[GKRectShadowCell setHighlighted:](&v7, sel_setHighlighted_);
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "_gkSelectedCellBackgroundColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }
  -[GKRectShadowCell contentView](self, "contentView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setBackgroundColor:", v5);

  if (v3)
}

- (void)setSelected:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v3 = a3;
  v8.receiver = self;
  v8.super_class = (Class)GKRectShadowCell;
  -[GKRectShadowCell setSelected:](&v8, sel_setSelected_);
  -[GKRectShadowCell layer](self, "layer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setBackgroundColor:", 0);

  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "_gkSelectedCellBackgroundColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }
  -[GKRectShadowCell contentView](self, "contentView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setBackgroundColor:", v6);

  if (v3)
}

@end
