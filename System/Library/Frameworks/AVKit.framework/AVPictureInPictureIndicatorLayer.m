@implementation AVPictureInPictureIndicatorLayer

- (AVPictureInPictureIndicatorLayer)initWithDisplayScale:(double)a3 placeholderImage:(CGImage *)a4 opaque:(BOOL)a5 videoRectWhenPIPBegan:(CGRect)a6
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  _BOOL8 v10;
  AVPictureInPictureIndicatorLayer *v13;
  AVPictureInPictureIndicatorLayer *v14;
  AVPictureInPictureIndicatorSublayer *v15;
  AVPictureInPictureIndicatorSublayer *contentLayer;
  objc_super v18;

  height = a6.size.height;
  width = a6.size.width;
  y = a6.origin.y;
  x = a6.origin.x;
  v10 = a5;
  v18.receiver = self;
  v18.super_class = (Class)AVPictureInPictureIndicatorLayer;
  v13 = -[AVPictureInPictureIndicatorLayer init](&v18, sel_init);
  v14 = v13;
  if (v13)
  {
    v13->_videoRectWhenPIPBegan.origin.x = x;
    v13->_videoRectWhenPIPBegan.origin.y = y;
    v13->_videoRectWhenPIPBegan.size.width = width;
    v13->_videoRectWhenPIPBegan.size.height = height;
    v15 = -[AVPictureInPictureIndicatorSublayer initWithDisplayScale:placeholderImage:opaque:]([AVPictureInPictureIndicatorSublayer alloc], "initWithDisplayScale:placeholderImage:opaque:", a4, v10, a3);
    contentLayer = v14->_contentLayer;
    v14->_contentLayer = v15;

    -[AVPictureInPictureIndicatorLayer addSublayer:](v14, "addSublayer:", v14->_contentLayer);
  }
  return v14;
}

- (void)layoutSublayers
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  _BOOL4 IsNull;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  double v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  void *v23;
  double MidX;
  objc_super v25;
  CGSize v26;
  CGRect v27;
  CGRect v28;
  CGRect v29;
  CGRect v30;
  CGRect v31;

  v25.receiver = self;
  v25.super_class = (Class)AVPictureInPictureIndicatorLayer;
  -[AVPictureInPictureIndicatorLayer layoutSublayers](&v25, sel_layoutSublayers);
  objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
  objc_msgSend(MEMORY[0x1E0CD28B0], "setDisableActions:", 1);
  -[AVPictureInPictureIndicatorLayer videoRectWhenPIPBegan](self, "videoRectWhenPIPBegan");
  v4 = 16.0;
  v5 = 9.0;
  v7 = v6;
  if (v6 > 0.0)
  {
    v8 = v3;
    if (v3 > 0.0)
    {
      -[AVPictureInPictureIndicatorLayer videoRectWhenPIPBegan](self, "videoRectWhenPIPBegan");
      IsNull = CGRectIsNull(v27);
      if (IsNull)
        v5 = 9.0;
      else
        v5 = v7;
      if (IsNull)
        v4 = 16.0;
      else
        v4 = v8;
    }
  }
  -[AVPictureInPictureIndicatorLayer bounds](self, "bounds");
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v17 = v16;
  v26.width = v4;
  v26.height = v5;
  v31.origin.x = v11;
  v31.origin.y = v13;
  v31.size.width = v15;
  v31.size.height = v17;
  v28 = AVMakeRectWithAspectRatioInsideRect(v26, v31);
  v18 = round(v28.origin.x);
  v19 = round(v28.origin.y);
  v20 = round(v28.size.width);
  v21 = round(v28.size.height);
  -[AVPictureInPictureIndicatorLayer contentLayer](self, "contentLayer");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setBounds:", v18, v19, v20, v21);

  -[AVPictureInPictureIndicatorLayer contentLayer](self, "contentLayer");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVPictureInPictureIndicatorLayer bounds](self, "bounds");
  MidX = CGRectGetMidX(v29);
  -[AVPictureInPictureIndicatorLayer bounds](self, "bounds");
  objc_msgSend(v23, "setPosition:", MidX, CGRectGetMidY(v30));

  objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
}

- (AVPictureInPictureIndicatorLayer)init
{
  void *v3;
  uint64_t v4;
  void *v5;
  objc_class *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99750];
  _AVMethodProem(self);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "raise:format:", v4, CFSTR("%@ is not a valid initializer. You must call -[%@ initWithTraitCollection:opaque:]."), v5, v7);

  return -[AVPictureInPictureIndicatorLayer initWithDisplayScale:placeholderImage:opaque:videoRectWhenPIPBegan:](self, "initWithDisplayScale:placeholderImage:opaque:videoRectWhenPIPBegan:", 0, 0, 1.0, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
}

- (void)setCustomText:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[AVPictureInPictureIndicatorLayer contentLayer](self, "contentLayer");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setCustomText:", v4);

}

- (NSString)customText
{
  void *v2;
  void *v3;

  -[AVPictureInPictureIndicatorLayer contentLayer](self, "contentLayer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "customText");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (AVPictureInPictureIndicatorSublayer)contentLayer
{
  return self->_contentLayer;
}

- (CGRect)videoRectWhenPIPBegan
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_videoRectWhenPIPBegan.origin.x;
  y = self->_videoRectWhenPIPBegan.origin.y;
  width = self->_videoRectWhenPIPBegan.size.width;
  height = self->_videoRectWhenPIPBegan.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentLayer, 0);
}

@end
