@implementation ASCLockupMediaView

- (ASCLockupMediaView)initWithFrame:(CGRect)a3
{
  ASCLockupMediaView *v3;
  ASCLockupMediaView *v4;
  id v5;
  uint64_t v6;
  UIView *containerView;
  uint64_t v8;
  NSMutableArray *imageViews;
  ASCVideoView *videoView;
  ASCScreenshots *screenshots;
  ASCTrailers *trailers;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)ASCLockupMediaView;
  v3 = -[ASCLockupMediaView initWithFrame:](&v14, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v3->_numberOfViews = 0;
    v5 = objc_alloc(MEMORY[0x1E0DC3F10]);
    v6 = objc_msgSend(v5, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    containerView = v4->_containerView;
    v4->_containerView = (UIView *)v6;

    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 3);
    v8 = objc_claimAutoreleasedReturnValue();
    imageViews = v4->_imageViews;
    v4->_imageViews = (NSMutableArray *)v8;

    videoView = v4->_videoView;
    v4->_videoView = 0;

    screenshots = v4->_screenshots;
    v4->_screenshots = 0;

    trailers = v4->_trailers;
    v4->_trailers = 0;

    v4->_videoLoopingEnabled = 1;
    v4->_videoMuted = 1;
    -[ASCLockupMediaView setLayoutMargins:](v4, "setLayoutMargins:", *MEMORY[0x1E0DC49E8], *(double *)(MEMORY[0x1E0DC49E8] + 8), *(double *)(MEMORY[0x1E0DC49E8] + 16), *(double *)(MEMORY[0x1E0DC49E8] + 24));
    -[UIView setUserInteractionEnabled:](v4->_containerView, "setUserInteractionEnabled:", 0);
    -[ASCLockupMediaView addSubview:](v4, "addSubview:", v4->_containerView);
    -[ASCLockupMediaView setClipsToBounds:](v4, "setClipsToBounds:", 1);
  }
  return v4;
}

- (ASCLockupMediaView)initWithCoder:(id)a3
{
  -[ASCLockupMediaView doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);

  return 0;
}

- (void)encodeWithCoder:(id)a3
{
  -[ASCLockupMediaView doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
}

- (CGSize)preferredScreenshotSize
{
  double v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  CGSize result;

  -[ASCLockupMediaView estimatedMediaContentSize](self, "estimatedMediaContentSize");
  v4 = v3;
  v6 = v5;
  -[ASCLockupMediaView context](self, "context");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCLockupMediaView screenshots](self, "screenshots");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCLockupMediaView trailers](self, "trailers");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView asc_layoutTraitEnvironment](self, "asc_layoutTraitEnvironment");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[__ASCLayoutProxy lockupMediaPreferredMediaSizeWithFitting:for:with:and:in:](__ASCLayoutProxy, "lockupMediaPreferredMediaSizeWithFitting:for:with:and:in:", v7, v8, v9, v10, v4, v6);
  v12 = v11;
  v14 = v13;

  v15 = v12;
  v16 = v14;
  result.height = v16;
  result.width = v15;
  return result;
}

- (void)setVideoView:(id)a3
{
  ASCVideoView **p_videoView;
  ASCVideoView *v6;
  char v7;
  void *v8;
  void *v9;
  ASCVideoView *v10;

  v10 = (ASCVideoView *)a3;
  p_videoView = &self->_videoView;
  v6 = self->_videoView;
  if (v10 && v6)
  {
    v7 = -[ASCVideoView isEqual:](v6, "isEqual:", v10);

    if ((v7 & 1) != 0)
      goto LABEL_11;
  }
  else
  {

    if (v6 == v10)
      goto LABEL_11;
  }
  -[ASCVideoView superview](*p_videoView, "superview");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
    -[ASCVideoView removeFromSuperview](*p_videoView, "removeFromSuperview");
  objc_storeStrong((id *)&self->_videoView, a3);
  if (*p_videoView)
  {
    -[ASCVideoView setLoopingEnabled:](*p_videoView, "setLoopingEnabled:", -[ASCLockupMediaView isVideoLoopingEnabled](self, "isVideoLoopingEnabled"));
    -[ASCVideoView setMuted:](*p_videoView, "setMuted:", -[ASCLockupMediaView isVideoMuted](self, "isVideoMuted"));
    -[ASCLockupMediaView containerView](self, "containerView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addSubview:", *p_videoView);

  }
  -[ASCLockupMediaView updateImageViews](self, "updateImageViews");
  -[ASCLockupMediaView setNeedsLayout](self, "setNeedsLayout");
  -[ASCLockupMediaView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
LABEL_11:

}

- (NSArray)mediaViews
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCLockupMediaView videoView](self, "videoView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[ASCLockupMediaView videoView](self, "videoView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v5);

  }
  -[ASCLockupMediaView imageViews](self, "imageViews");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObjectsFromArray:", v6);

  return (NSArray *)v3;
}

- (void)setVideoLoopingEnabled:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  if (self->_videoLoopingEnabled != a3)
  {
    v3 = a3;
    self->_videoLoopingEnabled = a3;
    -[ASCLockupMediaView videoView](self, "videoView");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setLoopingEnabled:", v3);

  }
}

- (void)setVideoMuted:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  if (self->_videoMuted != a3)
  {
    v3 = a3;
    self->_videoMuted = a3;
    -[ASCLockupMediaView videoView](self, "videoView");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setMuted:", v3);

  }
}

- (void)setContext:(id)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  objc_storeStrong((id *)&self->_context, a3);
  if (ASCLockupContextIsAdGridContext(v9))
  {
    v5 = (void *)MEMORY[0x1E0DC3658];
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.93333333, 0.93333333, 0.93333333, 1.0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.12941176, 0.12941176, 0.12941176, 1.0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "asc_colorWithLightColor:darkColor:", v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[ASCLockupMediaView setBackgroundColor:](self, "setBackgroundColor:", v8);

  }
  else
  {
    -[ASCLockupMediaView setBackgroundColor:](self, "setBackgroundColor:", 0);
  }

}

- (void)layoutMarginsDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)ASCLockupMediaView;
  -[ASCLockupMediaView layoutMarginsDidChange](&v3, sel_layoutMarginsDidChange);
  if (self)
  {
    -[ASCLockupMediaView updateImageViews](self, "updateImageViews");
    -[ASCLockupMediaView setNeedsLayout](self, "setNeedsLayout");
    -[ASCLockupMediaView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
  }
}

- (id)makeLayout
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  -[ASCLockupMediaView context](self, "context");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCLockupMediaView screenshots](self, "screenshots");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCLockupMediaView trailers](self, "trailers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCLockupMediaView containerView](self, "containerView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCLockupMediaView mediaViews](self, "mediaViews");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[__ASCLayoutProxy lockupMediaLayoutFor:screenshots:trailers:containerView:mediaViews:](__ASCLayoutProxy, "lockupMediaLayoutFor:screenshots:trailers:containerView:mediaViews:", v3, v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)makeSizingLayout
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  -[ASCLockupMediaView context](self, "context");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCLockupMediaView screenshots](self, "screenshots");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCLockupMediaView trailers](self, "trailers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCLockupMediaView containerView](self, "containerView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCLockupMediaView mediaViews](self, "mediaViews");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[__ASCLayoutProxy lockupMediaSizingLayoutFor:screenshots:trailers:containerView:mediaViews:](__ASCLayoutProxy, "lockupMediaSizingLayoutFor:screenshots:trailers:containerView:mediaViews:", v3, v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (CGSize)estimatedMediaContentSize
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  CGSize result;

  -[ASCLockupMediaView context](self, "context");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCLockupMediaView screenshots](self, "screenshots");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCLockupMediaView trailers](self, "trailers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCLockupMediaView bounds](self, "bounds");
  v7 = v6;
  v9 = v8;
  -[UIView asc_layoutTraitEnvironment](self, "asc_layoutTraitEnvironment");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[__ASCLayoutProxy estimatedMediaContentSizeFor:screenshots:trailers:fitting:in:](__ASCLayoutProxy, "estimatedMediaContentSizeFor:screenshots:trailers:fitting:in:", v3, v4, v5, v10, v7, v9);
  v12 = v11;
  v14 = v13;

  v15 = v12;
  v16 = v14;
  result.height = v16;
  result.width = v15;
  return result;
}

- (void)invalidateIntrinsicContentSize
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)ASCLockupMediaView;
  -[ASCLockupMediaView invalidateIntrinsicContentSize](&v4, sel_invalidateIntrinsicContentSize);
  if (-[ASCLockupMediaView translatesAutoresizingMaskIntoConstraints](self, "translatesAutoresizingMaskIntoConstraints"))
  {
    -[ASCLockupMediaView superview](self, "superview");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "invalidateIntrinsicContentSize");

  }
}

- (CGSize)intrinsicContentSize
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGSize result;

  -[ASCLockupMediaView bounds](self, "bounds");
  -[ASCLockupMediaView sizeThatFits:](self, "sizeThatFits:", v3, v4);
  result.height = v6;
  result.width = v5;
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  CGSize result;

  height = a3.height;
  width = a3.width;
  -[ASCLockupMediaView layoutMarginsForCurrentContext](self, "layoutMarginsForCurrentContext");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v14 = width - v8 - v12;
  v15 = height - v6 - v10;
  -[ASCLockupMediaView context](self, "context");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCLockupMediaView screenshots](self, "screenshots");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCLockupMediaView trailers](self, "trailers");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView asc_layoutTraitEnvironment](self, "asc_layoutTraitEnvironment");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  +[__ASCLayoutProxy estimatedMediaContentSizeFor:screenshots:trailers:fitting:in:](__ASCLayoutProxy, "estimatedMediaContentSizeFor:screenshots:trailers:fitting:in:", v16, v17, v18, v19, v14, v15);
  v21 = v20;
  v23 = v22;

  v24 = v9 + v13 + v21;
  v25 = v7 + v11 + v23;
  result.height = v25;
  result.width = v24;
  return result;
}

- (void)layoutSubviews
{
  void *v3;
  __int128 v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  double v26;
  double v27;
  void *v28;
  CGAffineTransform v29;
  CGAffineTransform v30;
  _OWORD v31[3];
  objc_super v32;

  v32.receiver = self;
  v32.super_class = (Class)ASCLockupMediaView;
  -[ASCLockupMediaView layoutSubviews](&v32, sel_layoutSubviews);
  -[ASCLockupMediaView containerView](self, "containerView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  v31[0] = *MEMORY[0x1E0C9BAA8];
  v31[1] = v4;
  v31[2] = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  objc_msgSend(v3, "setTransform:", v31);

  -[ASCLockupMediaView layoutMarginsForCurrentContext](self, "layoutMarginsForCurrentContext");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  -[ASCLockupMediaView bounds](self, "bounds");
  v14 = v8 + v13;
  v16 = v6 + v15;
  v18 = v17 - (v8 + v12);
  v20 = v19 - (v6 + v10);
  -[ASCLockupMediaView makeLayout](self, "makeLayout");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView asc_layoutTraitEnvironment](self, "asc_layoutTraitEnvironment");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "placeChildrenRelativeToRect:inTraitEnvironment:", v22, v14, v16, v18, v20);

  -[ASCLockupMediaView context](self, "context");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCLockupMediaView screenshots](self, "screenshots");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCLockupMediaView trailers](self, "trailers");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  +[__ASCLayoutProxy containerViewRotationAngleFor:screenshots:trailers:](__ASCLayoutProxy, "containerViewRotationAngleFor:screenshots:trailers:", v23, v24, v25);
  v27 = v26;

  if (v27 != 0.0)
  {
    CGAffineTransformMakeRotation(&v30, v27 * 3.14159265 / 180.0);
    -[ASCLockupMediaView containerView](self, "containerView");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = v30;
    objc_msgSend(v28, "setTransform:", &v29);

  }
}

- (UIEdgeInsets)layoutMarginsForCurrentContext
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  UIEdgeInsets result;

  -[ASCLockupMediaView layoutMargins](self, "layoutMargins");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[ASCLockupMediaView context](self, "context");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[__ASCLayoutProxy layoutMarginsFor:existingLayoutMargins:](__ASCLayoutProxy, "layoutMarginsFor:existingLayoutMargins:", v11, v4, v6, v8, v10);
  v13 = v12;
  v15 = v14;
  v17 = v16;
  v19 = v18;

  v20 = v13;
  v21 = v15;
  v22 = v17;
  v23 = v19;
  result.right = v23;
  result.bottom = v22;
  result.left = v21;
  result.top = v20;
  return result;
}

- (unint64_t)numberOfImageViews
{
  void *v3;
  unint64_t result;

  -[ASCLockupMediaView videoView](self, "videoView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  result = -[ASCLockupMediaView numberOfViews](self, "numberOfViews");
  if (v3)
  {
    if (result)
      return -[ASCLockupMediaView numberOfViews](self, "numberOfViews") - 1;
  }
  return result;
}

- (void)updateImageViews
{
  ASCScreenshotDisplayConfiguration *v3;
  void *v4;
  void *v5;
  void *v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t i;
  void *v11;
  void *v12;
  unint64_t v13;
  unint64_t v14;
  double v15;
  double v16;
  double v17;
  double v18;
  ASCBorderedScreenshotView *v19;
  void *v20;
  ASCScreenshotDisplayConfiguration *v21;

  v3 = [ASCScreenshotDisplayConfiguration alloc];
  -[ASCLockupMediaView screenshots](self, "screenshots");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "mediaPlatform");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "deviceCornerRadiusFactor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = -[ASCScreenshotDisplayConfiguration initWithDeviceCornerRadiusFactor:](v3, "initWithDeviceCornerRadiusFactor:", v6);

  v7 = -[ASCLockupMediaView numberOfImageViews](self, "numberOfImageViews");
  v8 = -[NSMutableArray count](self->_imageViews, "count");
  if (v8 >= v7)
    v9 = v7;
  else
    v9 = v8;
  if (v9)
  {
    for (i = 0; i < v14; ++i)
    {
      -[NSMutableArray objectAtIndexedSubscript:](self->_imageViews, "objectAtIndexedSubscript:", i);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "artworkView");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setScreenshotDisplayConfiguration:", v21);

      v13 = -[NSMutableArray count](self->_imageViews, "count");
      if (v13 >= v7)
        v14 = v7;
      else
        v14 = v13;
    }
  }
  if (-[NSMutableArray count](self->_imageViews, "count") != v7)
  {
    v15 = *MEMORY[0x1E0C9D648];
    v16 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v17 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v18 = *(double *)(MEMORY[0x1E0C9D648] + 24);
    do
    {
      if (-[NSMutableArray count](self->_imageViews, "count") >= v7)
      {
        -[NSMutableArray lastObject](self->_imageViews, "lastObject");
        v19 = (ASCBorderedScreenshotView *)objc_claimAutoreleasedReturnValue();
        if (v19)
        {
          -[NSMutableArray removeLastObject](self->_imageViews, "removeLastObject");
          -[ASCBorderedScreenshotView removeFromSuperview](v19, "removeFromSuperview");
        }
      }
      else
      {
        v19 = -[ASCBorderedScreenshotView initWithFrame:screenshotDisplayConfiguration:]([ASCBorderedScreenshotView alloc], "initWithFrame:screenshotDisplayConfiguration:", v21, v15, v16, v17, v18);
        -[NSMutableArray addObject:](self->_imageViews, "addObject:", v19);
        -[ASCLockupMediaView containerView](self, "containerView");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "addSubview:", v19);

      }
    }
    while (-[NSMutableArray count](self->_imageViews, "count") != v7);
  }

}

- (void)prepareForReuse
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[ASCLockupMediaView imageViews](self, "imageViews", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v11;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v7), "artworkView");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setImage:", 0);

        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v5);
  }

  -[ASCLockupMediaView imageViews](self, "imageViews");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "removeAllObjects");

  -[ASCLockupMediaView setVideoView:](self, "setVideoView:", 0);
}

- (void)setScreenshots:(id)a3 andTrailers:(id)a4
{
  ASCTrailers *v6;
  ASCScreenshots *v7;
  ASCTrailers *v8;
  ASCScreenshots *screenshots;
  BOOL v10;
  int v11;
  ASCScreenshots *v12;
  ASCScreenshots *v13;
  ASCTrailers *trailers;
  ASCTrailers *v15;
  ASCTrailers *v16;
  void *v17;
  void *v18;
  void *v19;
  ASCScreenshots *v20;

  v20 = (ASCScreenshots *)a3;
  v6 = (ASCTrailers *)a4;
  v7 = v20;
  v8 = v6;
  screenshots = self->_screenshots;
  if (!v20 || !screenshots)
  {
    if (screenshots == v20)
      goto LABEL_4;
LABEL_6:
    v12 = (ASCScreenshots *)-[ASCScreenshots copy](v7, "copy");
    v13 = self->_screenshots;
    self->_screenshots = v12;

    v11 = 1;
    goto LABEL_7;
  }
  v10 = -[ASCScreenshots isEqual:](screenshots, "isEqual:", v20);
  v7 = v20;
  if (!v10)
    goto LABEL_6;
LABEL_4:
  v11 = 0;
LABEL_7:
  trailers = self->_trailers;
  if (v8 && trailers)
  {
    if (-[ASCTrailers isEqual:](trailers, "isEqual:", v8))
      goto LABEL_10;
  }
  else if (trailers == v8)
  {
LABEL_10:
    if (!v11)
      goto LABEL_15;
    goto LABEL_14;
  }
  v15 = (ASCTrailers *)-[ASCTrailers copy](v8, "copy");
  v16 = self->_trailers;
  self->_trailers = v15;

LABEL_14:
  -[ASCLockupMediaView context](self, "context");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCLockupMediaView screenshots](self, "screenshots");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCLockupMediaView trailers](self, "trailers");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCLockupMediaView setNumberOfViews:](self, "setNumberOfViews:", +[__ASCLayoutProxy numberOfViewsInLockupMediaLayoutFor:with:and:](__ASCLayoutProxy, "numberOfViewsInLockupMediaLayoutFor:with:and:", v17, v18, v19));

  -[ASCLockupMediaView updateImageViews](self, "updateImageViews");
  -[ASCLockupMediaView setNeedsLayout](self, "setNeedsLayout");
  -[ASCLockupMediaView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
LABEL_15:

}

- (void)setImage:(id)a3 atIndex:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id i;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  uint64_t v22;
  id v23;
  void *v24;
  id v25;
  id v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  id obj;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[ASCLockupMediaView mediaViews](self, "mediaViews");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "count") > (unint64_t)a4)
  {
    -[ASCLockupMediaView screenshots](self, "screenshots");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "artwork");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "count");

    -[ASCLockupMediaView trailers](self, "trailers");
    v11 = objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      v12 = (void *)v11;
      -[ASCLockupMediaView trailers](self, "trailers");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "videos");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "count");

      if (v15)
        ++v10;
    }
    for (i = objc_alloc_init(MEMORY[0x1E0C99DE8]); a4 < (unint64_t)objc_msgSend(v7, "count"); a4 += v10)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(i, "addObject:", v17);

    }
    v34 = 0u;
    v35 = 0u;
    v32 = 0u;
    v33 = 0u;
    obj = i;
    v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v33;
      do
      {
        for (j = 0; j != v19; ++j)
        {
          if (*(_QWORD *)v33 != v20)
            objc_enumerationMutation(obj);
          v22 = objc_msgSend(*(id *)(*((_QWORD *)&v32 + 1) + 8 * j), "integerValue");
          objc_opt_class();
          objc_msgSend(v7, "objectAtIndexedSubscript:", v22);
          v23 = (id)objc_claimAutoreleasedReturnValue();
          if (v23)
          {
            if ((objc_opt_isKindOfClass() & 1) != 0)
              v24 = v23;
            else
              v24 = 0;
          }
          else
          {
            v24 = 0;
          }
          v25 = v24;

          if (v25)
          {
            objc_msgSend(v25, "setImage:", v6);
            objc_msgSend(v25, "previewFrameArtwork");
            v26 = (id)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v26, "setNeedsDisplay");
          }
          else
          {
            objc_opt_class();
            objc_msgSend(v7, "objectAtIndexedSubscript:", v22);
            v27 = (id)objc_claimAutoreleasedReturnValue();
            if (v27)
            {
              if ((objc_opt_isKindOfClass() & 1) != 0)
                v28 = v27;
              else
                v28 = 0;
            }
            else
            {
              v28 = 0;
            }
            v26 = v28;

            if (v26)
            {
              objc_msgSend(v26, "artworkView");
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v29, "setImage:", v6);

              objc_msgSend(v26, "artworkView");
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v30, "setNeedsDisplay");

              objc_msgSend(v26, "setUserInteractionEnabled:", 0);
            }
          }

        }
        v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
      }
      while (v19);
    }

  }
}

- (id)accessibilityElements
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  -[ASCLockupMediaView videoView](self, "videoView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[ASCLockupMediaView videoView](self, "videoView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setIsAccessibilityElement:", 1);

    v6 = *MEMORY[0x1E0DC46A0];
    -[ASCLockupMediaView videoView](self, "videoView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setAccessibilityTraits:", v6);

    ASCLocalizedString(CFSTR("AX_VIDEO"), v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[ASCLockupMediaView videoView](self, "videoView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setAccessibilityLabel:", v9);

    -[ASCLockupMediaView videoView](self, "videoView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v11);

  }
  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  -[ASCLockupMediaView imageViews](self, "imageViews", 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v28;
    v16 = *MEMORY[0x1E0DC4678];
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v28 != v15)
          objc_enumerationMutation(v12);
        v18 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
        objc_msgSend(v18, "artworkView");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "setIsAccessibilityElement:", 1);

        objc_msgSend(v18, "artworkView");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "setAccessibilityTraits:", v16);

        ASCLocalizedString(CFSTR("AX_ARTWORK"), v21);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "artworkView");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "setAccessibilityLabel:", v22);

        objc_msgSend(v18, "artworkView");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObject:", v24);

      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    }
    while (v14);
  }

  v25 = (void *)objc_msgSend(v3, "copy");
  return v25;
}

- (ASCVideoView)videoView
{
  return self->_videoView;
}

- (NSString)context
{
  return self->_context;
}

- (BOOL)isVideoLoopingEnabled
{
  return self->_videoLoopingEnabled;
}

- (BOOL)isVideoMuted
{
  return self->_videoMuted;
}

- (unint64_t)numberOfViews
{
  return self->_numberOfViews;
}

- (void)setNumberOfViews:(unint64_t)a3
{
  self->_numberOfViews = a3;
}

- (ASCScreenshots)screenshots
{
  return self->_screenshots;
}

- (void)setScreenshots:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 496);
}

- (ASCTrailers)trailers
{
  return self->_trailers;
}

- (void)setTrailers:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 504);
}

- (NSMutableArray)imageViews
{
  return self->_imageViews;
}

- (UIView)containerView
{
  return self->_containerView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_containerView, 0);
  objc_storeStrong((id *)&self->_imageViews, 0);
  objc_storeStrong((id *)&self->_trailers, 0);
  objc_storeStrong((id *)&self->_screenshots, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_videoView, 0);
}

@end
