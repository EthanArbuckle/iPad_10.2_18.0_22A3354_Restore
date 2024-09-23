@implementation HUClipScrubberSelectionView

- (HUClipScrubberSelectionView)initWithFrame:(CGRect)a3
{
  HUClipScrubberSelectionView *v3;
  HUClipScrubberSelectionView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)HUClipScrubberSelectionView;
  v3 = -[HUClipScrubberSelectionView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    -[HUClipScrubberSelectionView setOpaque:](v3, "setOpaque:", 0);
  return v4;
}

- (void)drawRect:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  void *v7;
  void *v8;
  id v9;
  CGRect v10;
  CGRect v11;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  objc_msgSend(MEMORY[0x1E0CEA390], "bezierPathWithRoundedRect:cornerRadius:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, 8.0);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setUsesEvenOddFillRule:", 1);
  v10.origin.x = x;
  v10.origin.y = y;
  v10.size.width = width;
  v10.size.height = height;
  v11 = CGRectInset(v10, 5.0, 4.0);
  objc_msgSend(MEMORY[0x1E0CEA390], "bezierPathWithRoundedRect:cornerRadius:", v11.origin.x, v11.origin.y, v11.size.width, v11.size.height, 8.0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "appendPath:", v7);
  objc_msgSend(MEMORY[0x1E0CEA478], "systemYellowColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setFill");

  objc_msgSend(v9, "fill");
}

- (void)updateFrameToMatchView:(id)a3
{
  void *v4;
  void *v5;
  int v6;
  void *v7;
  id v8;
  CGRect v9;
  CGRect v10;

  v8 = a3;
  objc_msgSend(v8, "frame");
  v10 = CGRectInset(v9, -4.0, 4.0);
  -[HUClipScrubberSelectionView setFrame:](self, "setFrame:", v10.origin.x, v10.origin.y, v10.size.width, v10.size.height);
  objc_msgSend(v8, "center");
  -[HUClipScrubberSelectionView setCenter:](self, "setCenter:");
  -[HUClipScrubberSelectionView superview](self, "superview");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "superview");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "isEqual:", v5);

  if (v6)
  {
    objc_msgSend(v8, "superview");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "insertSubview:below:", self, v8);

  }
  -[HUClipScrubberSelectionView setNeedsDisplay](self, "setNeedsDisplay");

}

+ (id)selectionView
{
  HUClipScrubberSelectionView *v2;

  v2 = [HUClipScrubberSelectionView alloc];
  return -[HUClipScrubberSelectionView initWithFrame:](v2, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
}

@end
