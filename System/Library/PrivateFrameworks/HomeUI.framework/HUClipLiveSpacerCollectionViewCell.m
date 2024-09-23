@implementation HUClipLiveSpacerCollectionViewCell

- (HUClipLiveSpacerCollectionViewCell)initWithFrame:(CGRect)a3
{
  HUClipLiveSpacerCollectionViewCell *v3;
  HUClipLiveSpacerCollectionViewCell *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)HUClipLiveSpacerCollectionViewCell;
  v3 = -[HUClipLiveSpacerCollectionViewCell initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    -[HUClipLiveSpacerCollectionViewCell setOpaque:](v3, "setOpaque:", 0);
  return v4;
}

- (void)drawRect:(CGRect)a3
{
  double height;
  double width;
  CGFloat y;
  CGFloat x;
  CGContext *CurrentContext;
  void *v8;
  double MidY;
  void *v10;
  void *v11;
  id v12;
  CGRect v13;
  CGRect v14;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  CurrentContext = UIGraphicsGetCurrentContext();
  CGContextSetLineDash(CurrentContext, 2.0, drawRect__lengths_1, 2uLL);
  objc_msgSend(MEMORY[0x1E0CEA390], "bezierPath");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setLineWidth:", 2.0);
  objc_msgSend(v8, "setLineCapStyle:", 1);
  v13.origin.x = x;
  v13.origin.y = y;
  v13.size.width = width;
  v13.size.height = height;
  MidY = CGRectGetMidY(v13);
  objc_msgSend(v8, "moveToPoint:", 0.0, MidY);
  v14.origin.x = x;
  v14.origin.y = y;
  v14.size.width = width;
  v14.size.height = height;
  *(float *)&y = CGRectGetMaxX(v14) + -1.0;
  objc_msgSend(v8, "addLineToPoint:", width, MidY);
  objc_msgSend(MEMORY[0x1E0CEA478], "systemGrayColor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setStroke");

  objc_msgSend(v8, "stroke");
  objc_msgSend(MEMORY[0x1E0CEA390], "bezierPathWithRoundedRect:cornerRadius:", *(float *)&y, 7.0, 1.0, height + -14.0, 2.0);
  v12 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CEA478], "systemOrangeColor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setStroke");

  CGContextSetLineDash(CurrentContext, 0.0, 0, 0);
  objc_msgSend(v12, "stroke");

}

@end
