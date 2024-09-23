@implementation LPVideoPlayButtonStyle

- (LPVideoPlayButtonStyle)initWithPlatform:(int64_t)a3
{
  LPVideoPlayButtonStyle *v4;
  LPSize *v5;
  LPSize *v6;
  uint64_t v7;
  LPSize *v8;
  LPSize *size;
  UIColor *color;
  LPSize *v11;
  LPSize *backgroundSize;
  LPVideoPlayButtonStyle *v13;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)LPVideoPlayButtonStyle;
  v4 = -[LPVideoPlayButtonStyle init](&v15, sel_init);
  if (v4)
  {
    if (a3 == 5)
    {
      v8 = -[LPSize initWithSquareSize:]([LPSize alloc], "initWithSquareSize:", 25.0);
      size = v4->_size;
      v4->_size = v8;

      objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
      v7 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (a3 == 3)
        v5 = -[LPSize initWithSquareSize:]([LPSize alloc], "initWithSquareSize:", 30.0);
      else
        v5 = -[LPSize initWithSquareSize:]([LPSize alloc], "initWithSquareSize:", 14.0);
      v6 = v4->_size;
      v4->_size = v5;

      objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
      v7 = objc_claimAutoreleasedReturnValue();
    }
    color = v4->_color;
    v4->_color = (UIColor *)v7;

    v11 = -[LPSize initWithSquareSize:]([LPSize alloc], "initWithSquareSize:", 48.0);
    backgroundSize = v4->_backgroundSize;
    v4->_backgroundSize = v11;

    v4->_disabledOpacity = 0.2;
    v13 = v4;
  }

  return v4;
}

- (LPSize)size
{
  return self->_size;
}

- (void)setSize:(id)a3
{
  objc_storeStrong((id *)&self->_size, a3);
}

- (LPSize)backgroundSize
{
  return self->_backgroundSize;
}

- (void)setBackgroundSize:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundSize, a3);
}

- (double)disabledOpacity
{
  return self->_disabledOpacity;
}

- (void)setDisabledOpacity:(double)a3
{
  self->_disabledOpacity = a3;
}

- (UIColor)color
{
  return self->_color;
}

- (void)setColor:(id)a3
{
  objc_storeStrong((id *)&self->_color, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_color, 0);
  objc_storeStrong((id *)&self->_backgroundSize, 0);
  objc_storeStrong((id *)&self->_size, 0);
}

@end
