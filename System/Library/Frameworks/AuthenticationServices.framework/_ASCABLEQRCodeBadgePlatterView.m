@implementation _ASCABLEQRCodeBadgePlatterView

- (_ASCABLEQRCodeBadgePlatterView)initWithFrame:(CGRect)a3
{
  _ASCABLEQRCodeBadgePlatterView *v3;
  _ASCABLEQRCodeBadgePlatterView *v4;
  _ASCABLEQRCodeBadgePlatterView *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_ASCABLEQRCodeBadgePlatterView;
  v3 = -[_ASCABLEQRCodeBadgePlatterView initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[_ASCABLEQRCodeBadgePlatterView setOpaque:](v3, "setOpaque:", 0);
    v5 = v4;
  }

  return v4;
}

- (void)drawRect:(CGRect)a3
{
  double x;
  double y;
  double width;
  double height;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  CGRect v14;
  CGRect v15;
  CGRect v16;
  CGRect v17;

  -[_ASCABLEQRCodeBadgePlatterView bounds](self, "bounds", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v15 = CGRectInset(v14, 1.0, 1.0);
  x = v15.origin.x;
  y = v15.origin.y;
  width = v15.size.width;
  height = v15.size.height;
  -[_ASCABLEQRCodeBadgePlatterView bounds](self, "bounds");
  v8 = round(CGRectGetWidth(v16) * 0.24);
  v9 = (void *)MEMORY[0x24BEBD420];
  -[_ASCABLEQRCodeBadgePlatterView bounds](self, "bounds");
  objc_msgSend(v9, "bezierPathWithRoundedRect:cornerRadius:");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBD420], "bezierPathWithRoundedRect:cornerRadius:", x, y, width, height, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[_ASCABLEQRCodeBadgePlatterView bounds](self, "bounds");
  objc_msgSend(v13, "setLineWidth:", round(CGRectGetWidth(v17) * 0.085));
  objc_msgSend(v13, "addClip");
  qrCodeContentsColor();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setFill");

  objc_msgSend(v10, "fill");
  objc_msgSend(MEMORY[0x24BEBD4B8], "whiteColor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setStroke");

  objc_msgSend(v13, "stroke");
}

@end
