@implementation MPUNowPlayingIndicatorView

- (MPUNowPlayingIndicatorView)initWithFrame:(CGRect)a3
{
  MPUNowPlayingIndicatorView *v3;
  MPUNowPlayingIndicatorView *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)MPUNowPlayingIndicatorView;
  v3 = -[MPUNowPlayingIndicatorView initWithFrame:](&v10, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[MPUNowPlayingIndicatorView setUserInteractionEnabled:](v3, "setUserInteractionEnabled:", 0);
    objc_msgSend(MEMORY[0x24BDF6950], "clearColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[MPUNowPlayingIndicatorView setBackgroundColor:](v4, "setBackgroundColor:", v5);

    objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "scale");
    v8 = v7;

    v4->_interLevelSpacing = 1.0 / v8 + 1.0;
    v4->_levelCornerRadius = 1.0 / v8;
    v4->_levelWidth = 3.0;
    v4->_maximumLevelHeight = 13.0;
    v4->_minimumLevelHeight = 3.0;
    v4->_numberOfLevels = 3;
    v4->_minimumFrameInterval = 0.0;
    -[MPUNowPlayingIndicatorView _reloadLevelViews](v4, "_reloadLevelViews");
  }
  return v4;
}

- (void)layoutSubviews
{
  double v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  NSMutableArray *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  double v18;
  double v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  objc_super v24;
  _BYTE v25[128];
  uint64_t v26;
  CGRect v27;

  v26 = *MEMORY[0x24BDAC8D0];
  v24.receiver = self;
  v24.super_class = (Class)MPUNowPlayingIndicatorView;
  -[MPUNowPlayingIndicatorView layoutSubviews](&v24, sel_layoutSubviews);
  -[MPUNowPlayingIndicatorView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v11 = self->_levelViews;
  v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
  if (v12)
  {
    v13 = v12;
    v14 = 0;
    v15 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v21 != v15)
          objc_enumerationMutation(v11);
        v17 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
        objc_msgSend(v17, "frame", (_QWORD)v20);
        v19 = v18;
        v27.origin.x = v4;
        v27.origin.y = v6;
        v27.size.width = v8;
        v27.size.height = v10;
        objc_msgSend(v17, "setFrame:", (self->_levelWidth + self->_interLevelSpacing) * (double)(v14 + i), CGRectGetMaxY(v27), self->_levelWidth, v19);
      }
      v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
      v14 += i;
    }
    while (v13);
  }

}

- (void)drawRect:(CGRect)a3
{
  UIColor *levelGuttersColor;
  UIColor *v5;
  double levelWidth;
  double MaxY;
  CGFloat v8;
  int64_t v9;
  UIColor *v10;
  CGRect v11;
  CGRect v12;

  if (self->_showsLevelGutters)
  {
    levelGuttersColor = self->_levelGuttersColor;
    if (levelGuttersColor)
    {
      v5 = levelGuttersColor;
    }
    else
    {
      -[MPUNowPlayingIndicatorView tintColor](self, "tintColor", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
      v5 = (UIColor *)objc_claimAutoreleasedReturnValue();
    }
    v10 = v5;
    -[UIColor setFill](v5, "setFill");
    -[MPUNowPlayingIndicatorView bounds](self, "bounds");
    levelWidth = self->_levelWidth;
    MaxY = CGRectGetMaxY(v11);
    if (self->_numberOfLevels >= 1)
    {
      v8 = MaxY;
      v9 = 0;
      do
      {
        v12.origin.x = (self->_levelWidth + self->_interLevelSpacing) * (double)v9;
        v12.origin.y = 0.0;
        v12.size.width = levelWidth;
        v12.size.height = v8;
        UIRectFillUsingBlendMode(v12, kCGBlendModeNormal);
        ++v9;
      }
      while (v9 < self->_numberOfLevels);
    }

  }
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  int64_t numberOfLevels;
  double v4;
  double *p_maximumLevelHeight;
  double v6;
  CGSize result;

  numberOfLevels = self->_numberOfLevels;
  if (numberOfLevels)
  {
    v4 = self->_interLevelSpacing * (double)(numberOfLevels - 1) + (double)numberOfLevels * self->_levelWidth;
    p_maximumLevelHeight = &self->_maximumLevelHeight;
  }
  else
  {
    p_maximumLevelHeight = (double *)(MEMORY[0x24BDBF148] + 8);
    v4 = *MEMORY[0x24BDBF148];
  }
  v6 = *p_maximumLevelHeight;
  result.height = v6;
  result.width = v4;
  return result;
}

- (void)tintColorDidChange
{
  UIColor *levelGuttersColor;
  UIColor *v4;
  UIColor *v5;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  objc_super v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v15.receiver = self;
  v15.super_class = (Class)MPUNowPlayingIndicatorView;
  -[MPUNowPlayingIndicatorView tintColorDidChange](&v15, sel_tintColorDidChange);
  if (self->_showsLevelGutters)
    -[MPUNowPlayingIndicatorView setNeedsDisplay](self, "setNeedsDisplay");
  levelGuttersColor = self->_levelGuttersColor;
  if (levelGuttersColor)
  {
    v4 = levelGuttersColor;
  }
  else
  {
    -[MPUNowPlayingIndicatorView tintColor](self, "tintColor");
    v4 = (UIColor *)objc_claimAutoreleasedReturnValue();
  }
  v5 = v4;
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v6 = self->_levelViews;
  v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v11, v16, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v12 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * i), "setBackgroundColor:", v5, (_QWORD)v11);
      }
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v11, v16, 16);
    }
    while (v8);
  }

}

- (void)setLevelCornerRadius:(double)a3
{
  NSMutableArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  if (self->_levelCornerRadius != a3)
  {
    self->_levelCornerRadius = a3;
    v10 = 0u;
    v11 = 0u;
    v12 = 0u;
    v13 = 0u;
    v4 = self->_levelViews;
    v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v11;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v11 != v7)
            objc_enumerationMutation(v4);
          objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v8), "layer", (_QWORD)v10);
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "setCornerRadius:", self->_levelCornerRadius);

          ++v8;
        }
        while (v6 != v8);
        v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      }
      while (v6);
    }

  }
}

- (void)setLevelWidth:(double)a3
{
  if (self->_levelWidth != a3)
  {
    self->_levelWidth = a3;
    -[MPUNowPlayingIndicatorView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setMaximumLevelHeight:(double)a3
{
  if (self->_maximumLevelHeight != a3)
  {
    self->_maximumLevelHeight = a3;
    -[MPUNowPlayingIndicatorView _updateLevelAnimations](self, "_updateLevelAnimations");
  }
}

- (void)setMinimumLevelHeight:(double)a3
{
  if (self->_minimumLevelHeight != a3)
  {
    self->_minimumLevelHeight = a3;
    -[MPUNowPlayingIndicatorView _updateLevelAnimations](self, "_updateLevelAnimations");
  }
}

- (void)setNumberOfLevels:(int64_t)a3
{
  if (self->_numberOfLevels != a3)
  {
    self->_numberOfLevels = a3;
    -[MPUNowPlayingIndicatorView _reloadLevelViews](self, "_reloadLevelViews");
  }
}

- (void)setPlaybackState:(int64_t)a3
{
  if (self->_playbackState != a3)
  {
    self->_playbackState = a3;
    -[MPUNowPlayingIndicatorView _updateLevelAnimations](self, "_updateLevelAnimations");
  }
}

- (void)setShowsLevelGutters:(BOOL)a3
{
  if (self->_showsLevelGutters != a3)
  {
    self->_showsLevelGutters = a3;
    -[MPUNowPlayingIndicatorView setNeedsDisplay](self, "setNeedsDisplay");
  }
}

- (void)setLevelGuttersColor:(id)a3
{
  UIColor *v5;
  UIColor *v6;

  v5 = (UIColor *)a3;
  if (self->_levelGuttersColor != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_levelGuttersColor, a3);
    -[MPUNowPlayingIndicatorView _reloadLevelViews](self, "_reloadLevelViews");
    v5 = v6;
  }

}

- (void)_reloadLevelViews
{
  unint64_t v3;
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  NSMutableArray *levelViews;
  NSMutableArray *v11;
  NSMutableArray *v12;
  UIColor *levelGuttersColor;
  UIColor *v14;
  UIColor *v15;
  void *v16;

  if (self->_numberOfLevels < 1)
  {
    v3 = 0;
  }
  else
  {
    v3 = 0;
    v4 = *MEMORY[0x24BDBF090];
    v5 = *(double *)(MEMORY[0x24BDBF090] + 8);
    v6 = *(double *)(MEMORY[0x24BDBF090] + 16);
    v7 = *(double *)(MEMORY[0x24BDBF090] + 24);
    do
    {
      if (v3 >= -[NSMutableArray count](self->_levelViews, "count")
        || (-[NSMutableArray objectAtIndex:](self->_levelViews, "objectAtIndex:", v3),
            (v8 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
      {
        v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6F90]), "initWithFrame:", v4, v5, v6, v7);
        objc_msgSend(v8, "layer");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setCornerRadius:", self->_levelCornerRadius);
        objc_msgSend(v9, "setAnchorPoint:", 0.5, 1.0);
        levelViews = self->_levelViews;
        if (!levelViews)
        {
          v11 = (NSMutableArray *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", self->_numberOfLevels);
          v12 = self->_levelViews;
          self->_levelViews = v11;

          levelViews = self->_levelViews;
        }
        -[NSMutableArray addObject:](levelViews, "addObject:", v8);
        -[MPUNowPlayingIndicatorView addSubview:](self, "addSubview:", v8);

      }
      levelGuttersColor = self->_levelGuttersColor;
      if (levelGuttersColor)
      {
        v14 = levelGuttersColor;
      }
      else
      {
        -[MPUNowPlayingIndicatorView tintColor](self, "tintColor");
        v14 = (UIColor *)objc_claimAutoreleasedReturnValue();
      }
      v15 = v14;
      objc_msgSend(v8, "setBackgroundColor:", v14);

      ++v3;
    }
    while ((int64_t)v3 < self->_numberOfLevels);
  }
  while (v3 < -[NSMutableArray count](self->_levelViews, "count"))
  {
    -[NSMutableArray objectAtIndex:](self->_levelViews, "objectAtIndex:", v3);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "removeFromSuperview");
    -[NSMutableArray removeObjectAtIndex:](self->_levelViews, "removeObjectAtIndex:", v3);

  }
  -[MPUNowPlayingIndicatorView _updateLevelAnimations](self, "_updateLevelAnimations");
  -[MPUNowPlayingIndicatorView setNeedsLayout](self, "setNeedsLayout");
}

- (void)_updateLevelAnimations
{
  MPUNowPlayingIndicatorView *v2;
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  int64_t playbackState;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint32_t v25;
  double maximumLevelHeight;
  double v27;
  void *v28;
  void *v29;
  uint64_t v30;
  MPUNowPlayingIndicatorView *v31;
  void *v32;
  void *v33;
  double v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  NSMutableArray *obj;
  uint64_t v43;
  uint64_t v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  _QWORD v49[3];
  _BYTE v50[128];
  uint64_t v51;
  CGRect v52;
  CGRect v53;

  v2 = self;
  v51 = *MEMORY[0x24BDAC8D0];
  -[MPUNowPlayingIndicatorView window](self, "window");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "screen");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "_refreshRate");
    v7 = v6;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "_refreshRate");
    v7 = v9;

  }
  -[MPUNowPlayingIndicatorView minimumFrameInterval](v2, "minimumFrameInterval");
  if (v10 == 0.0)
    v11 = 0.0166666667;
  else
    -[MPUNowPlayingIndicatorView minimumFrameInterval](v2, "minimumFrameInterval");
  if (v7 < v11)
    v7 = v11;
  v47 = 0u;
  v48 = 0u;
  v45 = 0u;
  v46 = 0u;
  obj = v2->_levelViews;
  v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v45, v50, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v46;
    v44 = *MEMORY[0x24BDE5D20];
    v43 = *MEMORY[0x24BDE5970];
    v41 = *(_QWORD *)v46;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v46 != v14)
          objc_enumerationMutation(obj);
        objc_msgSend(*(id *)(*((_QWORD *)&v45 + 1) + 8 * i), "layer");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        playbackState = v2->_playbackState;
        if (playbackState == 2)
        {
          objc_msgSend(MEMORY[0x24BDE5648], "animationWithKeyPath:", CFSTR("bounds.size.height"));
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "setDuration:", 0.45);
          objc_msgSend(MEMORY[0x24BDE56F0], "functionWithName:", v44);
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "setTimingFunction:", v35);

          objc_msgSend(v18, "setRemovedOnCompletion:", 0);
          objc_msgSend(v18, "setFillMode:", v43);
          v36 = (void *)MEMORY[0x24BDD16E0];
          objc_msgSend(v16, "presentationLayer");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          v38 = v37;
          if (!v37)
            v37 = v16;
          objc_msgSend(v37, "bounds");
          objc_msgSend(v36, "numberWithDouble:", CGRectGetHeight(v53));
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "setFromValue:", v39);

          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v2->_minimumLevelHeight);
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "setToValue:", v40);

        }
        else if (playbackState == 1)
        {
          objc_msgSend(MEMORY[0x24BDE56C0], "animationWithKeyPath:", CFSTR("bounds.size.height"));
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDE56F0], "functionWithName:", v44);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "setTimingFunction:", v24);

          objc_msgSend(v18, "setRemovedOnCompletion:", 0);
          objc_msgSend(v18, "setFillMode:", v43);
          v25 = arc4random();
          maximumLevelHeight = v2->_maximumLevelHeight;
          v27 = maximumLevelHeight * 0.5 + (double)(v25 % 0xB) / 10.0 * (maximumLevelHeight * 0.5);
          objc_msgSend(v18, "setDuration:", maximumLevelHeight / v27 * 0.65);
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v2->_minimumLevelHeight);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          v49[0] = v28;
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v27);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          v49[1] = v29;
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v2->_minimumLevelHeight);
          v30 = v13;
          v31 = v2;
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          v49[2] = v32;
          objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v49, 3);
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "setValues:", v33);

          v14 = v41;
          v2 = v31;
          v13 = v30;

          LODWORD(v34) = 2139095040;
          objc_msgSend(v18, "setRepeatCount:", v34);
        }
        else
        {
          if (playbackState)
            goto LABEL_25;
          objc_msgSend(MEMORY[0x24BDE5648], "animationWithKeyPath:", CFSTR("bounds.size.height"));
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "setDuration:", 0.45);
          objc_msgSend(MEMORY[0x24BDE56F0], "functionWithName:", v44);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "setTimingFunction:", v19);

          objc_msgSend(v18, "setRemovedOnCompletion:", 0);
          objc_msgSend(v18, "setFillMode:", v43);
          v20 = (void *)MEMORY[0x24BDD16E0];
          objc_msgSend(v16, "presentationLayer");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = v21;
          if (!v21)
            v21 = v16;
          objc_msgSend(v21, "bounds");
          objc_msgSend(v20, "numberWithDouble:", CGRectGetHeight(v52));
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "setFromValue:", v23);

          objc_msgSend(v18, "setToValue:", &unk_24DD76ED8);
        }
        objc_msgSend(v18, "setFrameInterval:", v7);
        objc_msgSend(v16, "addAnimation:forKey:", v18, CFSTR("nowPlayingIndicatorAnimation"));

LABEL_25:
      }
      v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v45, v50, 16);
    }
    while (v13);
  }

}

- (double)interLevelSpacing
{
  return self->_interLevelSpacing;
}

- (void)setInterLevelSpacing:(double)a3
{
  self->_interLevelSpacing = a3;
}

- (double)levelCornerRadius
{
  return self->_levelCornerRadius;
}

- (double)levelWidth
{
  return self->_levelWidth;
}

- (double)maximumLevelHeight
{
  return self->_maximumLevelHeight;
}

- (double)minimumLevelHeight
{
  return self->_minimumLevelHeight;
}

- (int64_t)numberOfLevels
{
  return self->_numberOfLevels;
}

- (int64_t)playbackState
{
  return self->_playbackState;
}

- (BOOL)showsLevelGutters
{
  return self->_showsLevelGutters;
}

- (UIColor)levelGuttersColor
{
  return self->_levelGuttersColor;
}

- (double)minimumFrameInterval
{
  return self->_minimumFrameInterval;
}

- (void)setMinimumFrameInterval:(double)a3
{
  self->_minimumFrameInterval = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_levelGuttersColor, 0);
  objc_storeStrong((id *)&self->_levelViews, 0);
}

@end
