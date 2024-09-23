@implementation WFOverlayImageEditorOptionButton

- (WFOverlayImageEditorOptionButton)initWithFrame:(CGRect)a3
{
  WFOverlayImageEditorOptionButton *v3;
  WFOverlayImageEditorOptionButton *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  WFOverlayImageEditorOptionButton *v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)WFOverlayImageEditorOptionButton;
  v3 = -[WFOverlayImageEditorOptionButton initWithFrame:](&v13, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[WFOverlayImageEditorOptionButton titleLabel](v3, "titleLabel");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFOverlayImageEditorOptionButton customFont](v4, "customFont");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setFont:", v6);

    objc_msgSend(v5, "setTextAlignment:", 1);
    -[WFOverlayImageEditorOptionButton imageView](v4, "imageView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setContentMode:", 5);

    objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithRed:green:blue:alpha:", 1.0, 0.756862745, 0.0274509804, 1.0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithWhite:alpha:", 1.0, 0.699999988);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFOverlayImageEditorOptionButton setTitleColor:forState:](v4, "setTitleColor:forState:", v8, 4);
    -[WFOverlayImageEditorOptionButton setTitleColor:forState:](v4, "setTitleColor:forState:", v9, 0);
    objc_msgSend(v9, "colorWithAlphaComponent:", 0.400000006);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFOverlayImageEditorOptionButton setTitleColor:forState:](v4, "setTitleColor:forState:", v10, 1);

    v11 = v4;
  }

  return v4;
}

- (id)customFont
{
  return (id)objc_msgSend(MEMORY[0x24BEBB520], "systemFontOfSize:", 13.0);
}

- (CGRect)titleRectForContentRect:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  CGFloat v12;
  CGRect v13;
  CGRect remainder;
  uint64_t v15;
  _QWORD v16[2];
  CGRect v17;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v16[1] = *MEMORY[0x24BDAC8D0];
  remainder = a3;
  -[WFOverlayImageEditorOptionButton currentTitle](self, "currentTitle");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = *MEMORY[0x24BEBB360];
  -[WFOverlayImageEditorOptionButton customFont](self, "customFont");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v9;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v16, &v15, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "sizeWithAttributes:", v10);
  v12 = v11;

  memset(&v13, 0, sizeof(v13));
  v17.origin.x = x;
  v17.origin.y = y;
  v17.size.width = width;
  v17.size.height = height;
  CGRectDivide(v17, &v13, &remainder, v12, CGRectMaxYEdge);
  return CGRectIntegral(v13);
}

- (CGSize)intrinsicContentSize
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  uint64_t v19;
  _QWORD v20[2];
  CGSize result;

  v20[1] = *MEMORY[0x24BDAC8D0];
  -[WFOverlayImageEditorOptionButton currentImage](self, "currentImage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "size");
  v5 = v4;
  v7 = v6;

  -[WFOverlayImageEditorOptionButton currentTitle](self, "currentTitle");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = *MEMORY[0x24BEBB360];
  -[WFOverlayImageEditorOptionButton titleLabel](self, "titleLabel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "font");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v10;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v20, &v19, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "sizeWithAttributes:", v11);
  v13 = v12;
  v15 = v14;

  if (v5 >= v13)
    v16 = v5;
  else
    v16 = v13;
  v17 = ceil(v16);
  v18 = ceil(v7 + v15);
  result.height = v18;
  result.width = v17;
  return result;
}

@end
