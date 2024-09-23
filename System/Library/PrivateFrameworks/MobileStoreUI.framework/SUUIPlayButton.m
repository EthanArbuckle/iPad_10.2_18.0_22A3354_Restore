@implementation SUUIPlayButton

+ (CGSize)sizeThatFitsWidth:(double)a3 viewElement:(id)a4 context:(id)a5
{
  double v5;
  double v6;
  CGSize result;

  v5 = fmin(a3, 36.0);
  v6 = v5;
  result.height = v6;
  result.width = v5;
  return result;
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SUUIPlayButton;
  -[SUUIPlayButtonControl layoutSubviews](&v8, sel_layoutSubviews);
  if (-[SUUIPlayButton style](self, "style") == 2)
  {
    if (-[SUUIPlayButtonControl showingPlayIndicator](self, "showingPlayIndicator"))
    {
      -[SUUIPlayButton buttonSize](self, "buttonSize");
      v4 = v3;
      v6 = v5;
      -[SUUIPlayButtonControl imageView](self, "imageView");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setFrame:", 0.0, 4.0, v4, v6);

    }
  }
}

- (void)setEnabled:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SUUIPlayButton;
  -[SUUIPlayButtonControl setEnabled:](&v5, sel_setEnabled_, a3);
  if (-[SUUIPlayButton style](self, "style") == 2)
  {
    if (-[SUUIPlayButtonControl showingPlayIndicator](self, "showingPlayIndicator"))
    {
      -[SUUIPlayButtonControl imageView](self, "imageView");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setAlpha:", 1.0);

    }
  }
}

- (void)tintColorDidChange
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SUUIPlayButton;
  -[SUUIPlayButtonControl tintColorDidChange](&v5, sel_tintColorDidChange);
  if (-[SUUIPlayButton style](self, "style") == 2)
  {
    if (-[SUUIPlayButtonControl showingPlayIndicator](self, "showingPlayIndicator"))
    {
      -[SUUIPlayButtonControl imageView](self, "imageView");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      -[SUUIPlayButton tintColor](self, "tintColor");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setTintColor:", v4);

    }
  }
}

- (CGSize)buttonSize
{
  double v2;
  double v3;
  CGSize result;

  v2 = 36.0;
  if (self->_style != 1)
    v2 = 28.0;
  v3 = v2;
  result.height = v3;
  result.width = v2;
  return result;
}

- (float)buttonCornerRadius
{
  float result;

  result = 14.0;
  if (self->_style == 1)
    return 18.0;
  return result;
}

- (id)cancelImage
{
  void *v3;
  void *v4;
  _BOOL4 showStop;
  void *v6;
  void *v7;

  -[SUUIPlayButtonControl customToggleImage](self, "customToggleImage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[SUUIPlayButtonControl customToggleImage](self, "customToggleImage");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    showStop = self->_showStop;
    -[SUUIPlayButton images](self, "images");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (showStop)
      objc_msgSend(v6, "stopImage");
    else
      objc_msgSend(v6, "pauseImage");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v4;
}

- (id)defaultBackgroundColor
{
  void *v3;
  objc_super v5;

  if (-[SUUIPlayButton style](self, "style") == 2
    && -[SUUIPlayButtonControl backgroundType](self, "backgroundType") == 1)
  {
    objc_msgSend(MEMORY[0x24BEBD4B8], "whiteColor");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)SUUIPlayButton;
    -[SUUIPlayButtonControl defaultBackgroundColor](&v5, sel_defaultBackgroundColor);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (id)outerBorderColor
{
  void *v3;

  if (-[SUUIPlayButton style](self, "style") == 2 || -[SUUIPlayButtonControl isIndeterminate](self, "isIndeterminate"))
  {
    -[SUUIPlayButton tintColor](self, "tintColor");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (id)playImage
{
  void *v3;
  void *v4;
  void *v5;

  -[SUUIPlayButtonControl customPlayImage](self, "customPlayImage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[SUUIPlayButtonControl customPlayImage](self, "customPlayImage");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[SUUIPlayButton images](self, "images");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "playImage");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v4;
}

- (void)playIndicatorDidChange:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  float v9;
  id v10;

  v3 = a3;
  if (-[SUUIPlayButton style](self, "style") == 2 && v3)
  {
    -[SUUIPlayButtonControl imageView](self, "imageView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setAlpha:", 1.0);

    -[SUUIPlayButtonControl imageView](self, "imageView");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    -[SUUIPlayButton tintColor](self, "tintColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setTintColor:", v6);

  }
  else
  {
    if (-[SUUIPlayButton style](self, "style") != 2)
      return;
    -[SUUIPlayButtonControl imageView](self, "imageView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BEBD4B8], "blackColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setTintColor:", v8);

    -[SUUIPlayButtonControl imageView](self, "imageView");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    -[SUUIPlayButtonControl playButtonDefaultAlpha](self, "playButtonDefaultAlpha");
    objc_msgSend(v10, "setAlpha:", v9);
  }

}

- (void)refresh
{
  objc_super v2;

  self->_showStop = 0;
  v2.receiver = self;
  v2.super_class = (Class)SUUIPlayButton;
  -[SUUIPlayButtonControl refresh](&v2, sel_refresh);
}

- (void)reloadWithItemStatus:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  uint64_t v6;
  _BOOL4 v7;
  double v8;
  double v9;
  double v10;
  double v11;
  id v12;

  v4 = a4;
  v12 = a3;
  v6 = objc_msgSend(v12, "playState");
  v7 = -[SUUIPlayButtonControl isIndeterminate](self, "isIndeterminate");
  if (v6 == 1)
  {
    if (!v7)
      -[SUUIPlayButtonControl beginIndeterminateAnimation](self, "beginIndeterminateAnimation");
  }
  else
  {
    if (v7)
      -[SUUIPlayButtonControl endIndeterminateAnimation](self, "endIndeterminateAnimation");
    objc_msgSend(v12, "duration");
    v9 = v8;
    if (self->_showStop != objc_msgSend(v12, "hideDuration"))
    {
      self->_showStop = objc_msgSend(v12, "hideDuration");
      -[SUUIPlayButtonControl showPlayIndicator:force:](self, "showPlayIndicator:force:", -[SUUIPlayButtonControl showingPlayIndicator](self, "showingPlayIndicator"), 1);
    }
    HIDWORD(v10) = 1018167296;
    if (v9 < 2.22044605e-16 || objc_msgSend(v12, "hideDuration"))
    {
      LODWORD(v10) = 0;
    }
    else
    {
      objc_msgSend(v12, "currentTime");
      v10 = v11 / v9;
      *(float *)&v10 = v10;
    }
    -[SUUIPlayButtonControl setProgress:animated:](self, "setProgress:animated:", v4, v10);
  }

}

- (void)setBackgroundType:(int64_t)a3
{
  objc_super v3;

  self->_showStop = 0;
  v3.receiver = self;
  v3.super_class = (Class)SUUIPlayButton;
  -[SUUIPlayButtonControl setBackgroundType:](&v3, sel_setBackgroundType_, a3);
}

- (void)setStyle:(int64_t)a3
{
  SUUIPlayButtonImageCache *v5;
  SUUIPlayButtonImageCache *imageCache;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  if (self->_style != a3)
  {
    self->_style = a3;
    +[SUUIPlayButtonImageCache imageCacheForStyle:](SUUIPlayButtonImageCache, "imageCacheForStyle:");
    v5 = (SUUIPlayButtonImageCache *)objc_claimAutoreleasedReturnValue();
    imageCache = self->_imageCache;
    self->_imageCache = v5;

    -[SUUIPlayButton refresh](self, "refresh");
    if (a3 == 2)
    {
      -[SUUIPlayButton playImage](self, "playImage");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "imageWithRenderingMode:", 2);
      v13 = (id)objc_claimAutoreleasedReturnValue();

      -[SUUIPlayButtonControl imageView](self, "imageView");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "image");
      v9 = (id)objc_claimAutoreleasedReturnValue();

      if (v9 != v13)
      {
        -[SUUIPlayButtonControl imageView](self, "imageView");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "setImage:", v13);

      }
      if (-[SUUIPlayButtonControl backgroundType](self, "backgroundType") == 1)
      {
        -[SUUIPlayButton defaultBackgroundColor](self, "defaultBackgroundColor");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[SUUIPlayButtonControl setControlColor:](self, "setControlColor:", v11);
      }
      else
      {
        -[SUUIPlayButtonControl imageView](self, "imageView");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[SUUIPlayButton tintColor](self, "tintColor");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "setTintColor:", v12);

      }
      -[SUUIPlayButtonControl updateOuterProgressLayerStroke](self, "updateOuterProgressLayerStroke");
      -[SUUIPlayButtonControl setShowBorder:](self, "setShowBorder:", 0);
      -[SUUIPlayButtonControl setShowOuterBorder:](self, "setShowOuterBorder:", 1);

    }
    else
    {
      -[SUUIPlayButtonControl setShowOuterBorder:](self, "setShowOuterBorder:", 0);
      -[SUUIPlayButtonControl setShowBorder:](self, "setShowBorder:", 1);
    }
  }
}

- (id)images
{
  SUUIPlayButtonImageCache *imageCache;
  SUUIPlayButtonImageCache *v4;
  SUUIPlayButtonImageCache *v5;

  imageCache = self->_imageCache;
  if (!imageCache)
  {
    +[SUUIPlayButtonImageCache imageCacheForStyle:](SUUIPlayButtonImageCache, "imageCacheForStyle:", self->_style);
    v4 = (SUUIPlayButtonImageCache *)objc_claimAutoreleasedReturnValue();
    v5 = self->_imageCache;
    self->_imageCache = v4;

    imageCache = self->_imageCache;
  }
  return imageCache;
}

- (BOOL)showOuterBorder
{
  return -[SUUIPlayButton style](self, "style") == 2;
}

- (void)setRadio:(BOOL)a3
{
  uint64_t v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  -[SUUIPlayButton setStyle:](self, "setStyle:", v3);
}

- (BOOL)isRadio
{
  return -[SUUIPlayButton style](self, "style") == 2;
}

- (void)setUseLargeButton:(BOOL)a3
{
  -[SUUIPlayButton setStyle:](self, "setStyle:", a3);
}

- (BOOL)useLargeButton
{
  return -[SUUIPlayButton style](self, "style") == 1;
}

- (void)_updateEnabledState
{
  double v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SUUIPlayButton;
  -[SUUIPlayButtonControl _updateEnabledState](&v8, sel__updateEnabledState);
  if (-[SUUIPlayButton style](self, "style") == 2)
  {
    if (-[SUUIPlayButtonControl showingPlayIndicator](self, "showingPlayIndicator"))
    {
      -[SUUIPlayButton buttonSize](self, "buttonSize");
      v4 = v3;
      v6 = v5;
      -[SUUIPlayButtonControl imageView](self, "imageView");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setFrame:", 0.0, 4.0, v4, v6);

    }
  }
}

- (int64_t)itemIdentifier
{
  return self->_itemIdentifier;
}

- (void)setItemIdentifier:(int64_t)a3
{
  self->_itemIdentifier = a3;
}

- (NSString)playItemIdentifier
{
  return self->_playItemIdentifier;
}

- (void)setPlayItemIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 760);
}

- (BOOL)showOnDemand
{
  return self->_showOnDemand;
}

- (void)setShowOnDemand:(BOOL)a3
{
  self->_showOnDemand = a3;
}

- (int64_t)style
{
  return self->_style;
}

- (NSString)mediaURLString
{
  return self->_mediaURLString;
}

- (void)setMediaURLString:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 776);
}

- (SUUIPlayButtonImageCache)imageCache
{
  return self->_imageCache;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mediaURLString, 0);
  objc_storeStrong((id *)&self->_playItemIdentifier, 0);
  objc_storeStrong((id *)&self->_imageCache, 0);
}

@end
