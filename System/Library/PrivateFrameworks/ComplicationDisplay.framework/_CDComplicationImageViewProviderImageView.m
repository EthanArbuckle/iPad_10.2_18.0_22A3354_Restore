@implementation _CDComplicationImageViewProviderImageView

- (CGSize)sizeThatFits:(CGSize)a3
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGSize result;

  -[_CDComplicationImageViewProviderImageView image](self, "image", a3.width, a3.height);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "size");

  objc_msgSend(MEMORY[0x24BDB8780], "sharedRenderingContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "device");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  CLKFloorForDevice();
  v7 = v6;
  CLKFloorForDevice();
  v9 = v8;

  v10 = v7;
  v11 = v9;
  result.height = v11;
  result.width = v10;
  return result;
}

- (void)sizeToFit
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGAffineTransform v9;

  objc_msgSend(MEMORY[0x24BDB8780], "sharedRenderingContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "device");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[_CDComplicationImageViewProviderImageView transform](self, "transform");
  if (CGAffineTransformIsIdentity(&v9))
  {
    -[_CDComplicationImageViewProviderImageView frame](self, "frame");
    -[_CDComplicationImageViewProviderImageView sizeThatFits:](self, "sizeThatFits:", v5, v6);
    CLKPixelAlignRectForDevice();
    -[_CDComplicationImageViewProviderImageView setFrame:](self, "setFrame:");
  }
  else
  {
    -[_CDComplicationImageViewProviderImageView bounds](self, "bounds");
    -[_CDComplicationImageViewProviderImageView sizeThatFits:](self, "sizeThatFits:", v7, v8);
    CLKPixelAlignRectForDevice();
    -[_CDComplicationImageViewProviderImageView setBounds:](self, "setBounds:");
  }

}

- (CGSize)maxSize
{
  double width;
  double height;
  CGSize result;

  width = self->_maxSize.width;
  height = self->_maxSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setMaxSize:(CGSize)a3
{
  self->_maxSize = a3;
}

@end
