@implementation ASCBorderedScreenshotView

- (ASCBorderedScreenshotView)initWithFrame:(CGRect)a3 screenshotDisplayConfiguration:(id)a4
{
  double height;
  double width;
  double y;
  double x;
  id v9;
  ASCBorderedScreenshotView *v10;
  ASCArtworkView *v11;
  uint64_t v12;
  ASCArtworkView *artworkView;
  objc_super v15;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v9 = a4;
  v15.receiver = self;
  v15.super_class = (Class)ASCBorderedScreenshotView;
  v10 = -[ASCBorderedScreenshotView initWithFrame:](&v15, sel_initWithFrame_, x, y, width, height);
  if (v10)
  {
    v11 = [ASCArtworkView alloc];
    v12 = -[ASCArtworkView initWithFrame:](v11, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    artworkView = v10->_artworkView;
    v10->_artworkView = (ASCArtworkView *)v12;

    -[ASCArtworkView setDecoration:](v10->_artworkView, "setDecoration:", CFSTR("screenshot"));
    -[ASCArtworkView setScreenshotDisplayConfiguration:](v10->_artworkView, "setScreenshotDisplayConfiguration:", v9);
    -[ASCBorderedScreenshotView setLayoutMargins:](v10, "setLayoutMargins:", *MEMORY[0x1E0DC49E8], *(double *)(MEMORY[0x1E0DC49E8] + 8), *(double *)(MEMORY[0x1E0DC49E8] + 16), *(double *)(MEMORY[0x1E0DC49E8] + 24));
    -[ASCBorderedScreenshotView addSubview:](v10, "addSubview:", v10->_artworkView);
  }

  return v10;
}

- (ASCBorderedScreenshotView)initWithCoder:(id)a3
{
  -[ASCBorderedScreenshotView doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);

  return 0;
}

- (void)encodeWithCoder:(id)a3
{
  -[ASCBorderedScreenshotView doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)ASCBorderedScreenshotView;
  -[ASCBorderedScreenshotView layoutSubviews](&v5, sel_layoutSubviews);
  -[ASCBorderedScreenshotView bounds](self, "bounds");
  -[ASCBorderedScreenshotView bounds](self, "bounds");
  -[ASCBorderedScreenshotView bounds](self, "bounds");
  v4 = v3;
  -[ASCBorderedScreenshotView bounds](self, "bounds");
  -[ASCArtworkView setFrame:](self->_artworkView, "setFrame:", v4);
}

- (id)imageView
{
  return self->_artworkView;
}

- (CGSize)preferredArtworkSize
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
  CGSize result;

  v4 = *MEMORY[0x1E0DC49E8];
  v3 = *(double *)(MEMORY[0x1E0DC49E8] + 8);
  v5 = *(double *)(MEMORY[0x1E0DC49E8] + 16);
  v6 = *(double *)(MEMORY[0x1E0DC49E8] + 24);
  -[ASCBorderedScreenshotView bounds](self, "bounds");
  v8 = v7 - (v3 + v6);
  -[ASCBorderedScreenshotView bounds](self, "bounds");
  v10 = v9 - (v4 + v5);
  v11 = v8;
  result.height = v10;
  result.width = v11;
  return result;
}

- (ASCArtworkView)artworkView
{
  return self->_artworkView;
}

- (void)setArtworkView:(id)a3
{
  objc_storeStrong((id *)&self->_artworkView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_artworkView, 0);
}

@end
