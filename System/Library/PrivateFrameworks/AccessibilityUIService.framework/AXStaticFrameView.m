@implementation AXStaticFrameView

- (void)setFrame:(CGRect)a3
{
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  objc_super v13;

  objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;

  v13.receiver = self;
  v13.super_class = (Class)AXStaticFrameView;
  -[AXStaticFrameView setFrame:](&v13, sel_setFrame_, v6, v8, v10, v12);
}

@end
