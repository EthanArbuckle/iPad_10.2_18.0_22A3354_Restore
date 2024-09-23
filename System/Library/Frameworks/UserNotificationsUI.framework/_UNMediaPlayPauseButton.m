@implementation _UNMediaPlayPauseButton

- (_UNMediaPlayPauseButton)initWithFrame:(CGRect)a3 type:(int64_t)a4
{
  _UNMediaPlayPauseButton *v5;
  _UNMaterialButton *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  uint64_t v11;
  _UNMaterialButton *button;
  uint64_t v13;
  UIButton *invisibleButton;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)_UNMediaPlayPauseButton;
  v5 = -[_UNMediaPlayPauseButton initWithFrame:](&v16, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v5)
  {
    v6 = [_UNMaterialButton alloc];
    v7 = *MEMORY[0x24BDBF090];
    v8 = *(double *)(MEMORY[0x24BDBF090] + 8);
    v9 = *(double *)(MEMORY[0x24BDBF090] + 16);
    v10 = *(double *)(MEMORY[0x24BDBF090] + 24);
    v11 = -[_UNMaterialButton initWithFrame:](v6, "initWithFrame:", *MEMORY[0x24BDBF090], v8, v9, v10);
    button = v5->_button;
    v5->_button = (_UNMaterialButton *)v11;

    -[_UNMaterialButton setContentMode:](v5->_button, "setContentMode:", 0);
    -[_UNMaterialButton setContentHorizontalAlignment:](v5->_button, "setContentHorizontalAlignment:", 3);
    -[_UNMaterialButton setContentVerticalAlignment:](v5->_button, "setContentVerticalAlignment:", 3);
    -[_UNMaterialButton addTarget:action:forControlEvents:](v5->_button, "addTarget:action:forControlEvents:", v5, sel__buttonTouchUpInside_, 64);
    -[_UNMediaPlayPauseButton addSubview:](v5, "addSubview:", v5->_button);
    v13 = objc_msgSend(objc_alloc(MEMORY[0x24BDF6880]), "initWithFrame:", v7, v8, v9, v10);
    invisibleButton = v5->_invisibleButton;
    v5->_invisibleButton = (UIButton *)v13;

    -[UIButton addTarget:action:forControlEvents:](v5->_invisibleButton, "addTarget:action:forControlEvents:", v5, sel__buttonTouchUpInside_, 64);
    -[_UNMediaPlayPauseButton addSubview:](v5, "addSubview:", v5->_invisibleButton);
    v5->_type = a4;
    -[_UNMediaPlayPauseButton setNeedsLayout](v5, "setNeedsLayout");
  }
  return v5;
}

- (void)layoutSubviews
{
  -[_UNMediaPlayPauseButton _updateBackground](self, "_updateBackground");
  -[_UNMediaPlayPauseButton _updateSize](self, "_updateSize");
  -[_UNMediaPlayPauseButton _updateStyle](self, "_updateStyle");
  -[_UNMediaPlayPauseButton _updateSelected](self, "_updateSelected");
}

- (void)_updateType
{
  void *v3;
  void *v4;

  -[_UNMediaPlayPauseButton button](self, "button");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setImage:forState:", 0, 0);

  -[_UNMediaPlayPauseButton button](self, "button");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setImage:forState:", 0, 4);

  -[_UNMediaPlayPauseButton setNeedsLayout](self, "setNeedsLayout");
}

- (void)_updateBackground
{
  int64_t v3;

  v3 = -[_UNMediaPlayPauseButton type](self, "type");
  if (v3 == 1)
  {
    -[_UNMediaPlayPauseButton _updateBackgroundForMovieStyle](self, "_updateBackgroundForMovieStyle");
  }
  else if (!v3)
  {
    -[_UNMediaPlayPauseButton _updateBackgroundForAudioStyle](self, "_updateBackgroundForAudioStyle");
  }
}

- (void)_updateBackgroundForAudioStyle
{
  void *v3;
  void *v4;

  -[_UNMediaPlayPauseButton backgroundCircle](self, "backgroundCircle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[_UNMediaPlayPauseButton backgroundCircle](self, "backgroundCircle");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeFromSuperview");

    -[_UNMediaPlayPauseButton setBackgroundCircle:](self, "setBackgroundCircle:", 0);
  }
}

- (void)_updateBackgroundForMovieStyle
{
  double v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  id v9;
  MTMaterialView *v10;
  MTMaterialView *backgroundCircle;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  double v21;
  void *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _QWORD v27[5];
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  -[_UNMediaPlayPauseButton bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  -[_UNMediaPlayPauseButton backgroundCircle](self, "backgroundCircle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    v28 = 0;
    v29 = &v28;
    v30 = 0x2050000000;
    v8 = (void *)getMTMaterialViewClass_softClass;
    v31 = getMTMaterialViewClass_softClass;
    if (!getMTMaterialViewClass_softClass)
    {
      v27[0] = MEMORY[0x24BDAC760];
      v27[1] = 3221225472;
      v27[2] = __getMTMaterialViewClass_block_invoke;
      v27[3] = &unk_24D5BB2D8;
      v27[4] = &v28;
      __getMTMaterialViewClass_block_invoke((uint64_t)v27);
      v8 = (void *)v29[3];
    }
    v9 = objc_retainAutorelease(v8);
    _Block_object_dispose(&v28, 8);
    objc_msgSend(v9, "materialViewWithRecipe:", 1);
    v10 = (MTMaterialView *)objc_claimAutoreleasedReturnValue();
    backgroundCircle = self->_backgroundCircle;
    self->_backgroundCircle = v10;

    -[_UNMediaPlayPauseButton addSubview:](self, "addSubview:", self->_backgroundCircle);
    -[_UNMediaPlayPauseButton sendSubviewToBack:](self, "sendSubviewToBack:", self->_backgroundCircle);
    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    -[_UNMediaPlayPauseButton button](self, "button", 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "requiredVisualStyleCategories");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v23, v32, 16);
    if (v14)
    {
      v15 = *(_QWORD *)v24;
      do
      {
        v16 = 0;
        do
        {
          if (*(_QWORD *)v24 != v15)
            objc_enumerationMutation(v13);
          v17 = objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * v16), "integerValue");
          -[_UNMediaPlayPauseButton button](self, "button");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          -[MTMaterialView visualStylingProviderForCategory:](self->_backgroundCircle, "visualStylingProviderForCategory:", v17);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "setVisualStylingProvider:forCategory:", v19, v17);

          ++v16;
        }
        while (v14 != v16);
        v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v23, v32, 16);
      }
      while (v14);
    }

  }
  -[_UNMediaPlayPauseButton backgroundCircle](self, "backgroundCircle");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = fmin(v4, v6);
  objc_msgSend(v20, "setFrame:", (v4 - v21) * 0.5, (v6 - v21) * 0.5, v21, v21);

  -[_UNMediaPlayPauseButton backgroundCircle](self, "backgroundCircle");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "_setContinuousCornerRadius:", v21 * 0.5);

}

- (void)_updateSize
{
  int64_t v3;

  v3 = -[_UNMediaPlayPauseButton type](self, "type");
  if (v3 == 1)
  {
    -[_UNMediaPlayPauseButton _updateSizeForMovieStyle](self, "_updateSizeForMovieStyle");
  }
  else if (!v3)
  {
    -[_UNMediaPlayPauseButton _updateSizeForAudioStyle](self, "_updateSizeForAudioStyle");
  }
}

- (void)_updateSizeForAudioStyle
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  objc_msgSend(MEMORY[0x24BDF6AC8], "_systemImageNamed:", CFSTR("play.fill"));
  v15 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF6AC8], "_systemImageNamed:", CFSTR("pause.fill"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UNMediaPlayPauseButton bounds](self, "bounds");
  v6 = fmin(v4, v5);
  v7 = (v4 - v6) * 0.5;
  v8 = (v5 - v6) * 0.5;
  -[_UNMediaPlayPauseButton button](self, "button");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setImage:forState:", v15, 0);

  -[_UNMediaPlayPauseButton button](self, "button");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setImage:forState:", v3, 4);

  -[_UNMediaPlayPauseButton button](self, "button");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setFrame:", v7, v8, v6, v6);

  -[_UNMediaPlayPauseButton button](self, "button");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  BSRectWithSize();
  objc_msgSend(v12, "setBounds:");

  -[_UNMediaPlayPauseButton button](self, "button");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setContentEdgeInsets:", *MEMORY[0x24BDF7718], *(double *)(MEMORY[0x24BDF7718] + 8), *(double *)(MEMORY[0x24BDF7718] + 16), *(double *)(MEMORY[0x24BDF7718] + 24));

  -[_UNMediaPlayPauseButton invisibleButton](self, "invisibleButton");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setBounds:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));

}

- (void)_updateSizeForMovieStyle
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  CGAffineTransform v16;

  objc_msgSend(MEMORY[0x24BDF6AC8], "_systemImageNamed:", CFSTR("play.fill"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UNMediaPlayPauseButton bounds](self, "bounds");
  v5 = v4;
  v7 = v6;
  v8 = fmin(v4, v6);
  CGAffineTransformMakeScale(&v16, 0.471428571, 0.471428571);
  v9 = v8 * v16.c + v16.a * v8;
  v10 = v8 * v16.d + v16.b * v8;
  -[_UNMediaPlayPauseButton button](self, "button");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setImage:forState:", v3, 0);

  -[_UNMediaPlayPauseButton button](self, "button");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setImage:forState:", 0, 4);

  -[_UNMediaPlayPauseButton button](self, "button");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setFrame:", (v5 - v8) * 0.5, (v7 - v8) * 0.5, v8, v8);

  -[_UNMediaPlayPauseButton button](self, "button");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setContentEdgeInsets:", (v8 - v10) * 0.5, (v8 - v9) * 0.56, (v8 - v10) * 0.5, (v8 - v9) * 0.44);

  -[_UNMediaPlayPauseButton invisibleButton](self, "invisibleButton");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UNMediaPlayPauseButton bounds](self, "bounds");
  objc_msgSend(v15, "setBounds:");

}

- (void)_updateStyle
{
  int64_t v3;

  v3 = -[_UNMediaPlayPauseButton type](self, "type");
  if (v3 == 1)
  {
    -[_UNMediaPlayPauseButton _updateStyleForMovieStyle](self, "_updateStyleForMovieStyle");
  }
  else if (!v3)
  {
    -[_UNMediaPlayPauseButton _updateStyleForAudioStyle](self, "_updateStyleForAudioStyle");
  }
}

- (void)_updateStyleForAudioStyle
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  -[_UNMediaPlayPauseButton button](self, "button");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setImageViewStyle:forState:", -1, 0);

  -[_UNMediaPlayPauseButton button](self, "button");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setImageViewStyle:forState:", -1, 1);

  -[_UNMediaPlayPauseButton button](self, "button");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setImageViewStyle:forState:", -1, 4);

  -[_UNMediaPlayPauseButton button](self, "button");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[_UNMediaPlayPauseButton tintColor](self, "tintColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setTintColor:", v6);

}

- (void)_updateStyleForMovieStyle
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[_UNMediaPlayPauseButton button](self, "button");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setImageViewStyle:forState:", 1, 0);

  -[_UNMediaPlayPauseButton button](self, "button");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setImageViewStyle:forState:", 0, 1);

  -[_UNMediaPlayPauseButton button](self, "button");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setImageViewStyle:forState:", -1, 4);

  -[_UNMediaPlayPauseButton button](self, "button");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setTintColor:", 0);

}

- (void)_updateSelected
{
  int64_t v3;

  v3 = -[_UNMediaPlayPauseButton type](self, "type");
  if (v3 == 1)
  {
    -[_UNMediaPlayPauseButton _updateSelectedForMovieStyle](self, "_updateSelectedForMovieStyle");
  }
  else if (!v3)
  {
    -[_UNMediaPlayPauseButton _updateSelectedForAudioStyle](self, "_updateSelectedForAudioStyle");
  }
}

- (void)_updateSelectedForAudioStyle
{
  void *v3;
  id v4;

  -[_UNMediaPlayPauseButton button](self, "button");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setSelected:", -[_UNMediaPlayPauseButton isSelected](self, "isSelected"));

  -[_UNMediaPlayPauseButton invisibleButton](self, "invisibleButton");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setHidden:", 1);

}

- (void)_updateSelectedForMovieStyle
{
  int v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;

  v3 = -[_UNMediaPlayPauseButton isSelected](self, "isSelected");
  -[_UNMediaPlayPauseButton button](self, "button");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    objc_msgSend(v4, "setHidden:", 1);

    -[_UNMediaPlayPauseButton backgroundCircle](self, "backgroundCircle");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setHidden:", 1);

    -[_UNMediaPlayPauseButton invisibleButton](self, "invisibleButton");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v7;
    v8 = 0;
  }
  else
  {
    objc_msgSend(v4, "setHidden:", 0);

    -[_UNMediaPlayPauseButton backgroundCircle](self, "backgroundCircle");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setHidden:", 0);

    -[_UNMediaPlayPauseButton invisibleButton](self, "invisibleButton");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v7;
    v8 = 1;
  }
  objc_msgSend(v7, "setHidden:", v8);

}

- (void)setType:(int64_t)a3
{
  if (self->_type != a3)
  {
    self->_type = a3;
    -[_UNMediaPlayPauseButton _updateType](self, "_updateType");
  }
}

- (void)setSelected:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  if (-[_UNMediaPlayPauseButton isSelected](self, "isSelected") != a3)
  {
    v5.receiver = self;
    v5.super_class = (Class)_UNMediaPlayPauseButton;
    -[_UNMediaPlayPauseButton setSelected:](&v5, sel_setSelected_, v3);
    -[_UNMediaPlayPauseButton _updateSelected](self, "_updateSelected");
  }
}

- (void)tintColorDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_UNMediaPlayPauseButton;
  -[_UNMediaPlayPauseButton tintColorDidChange](&v3, sel_tintColorDidChange);
  -[_UNMediaPlayPauseButton _updateStyle](self, "_updateStyle");
}

- (void)_buttonTouchUpInside:(id)a3
{
  -[_UNMediaPlayPauseButton sendActionsForControlEvents:](self, "sendActionsForControlEvents:", 64);
}

- (int64_t)type
{
  return self->_type;
}

- (_UNMaterialButton)button
{
  return self->_button;
}

- (void)setButton:(id)a3
{
  objc_storeStrong((id *)&self->_button, a3);
}

- (UIButton)invisibleButton
{
  return self->_invisibleButton;
}

- (void)setInvisibleButton:(id)a3
{
  objc_storeStrong((id *)&self->_invisibleButton, a3);
}

- (MTMaterialView)backgroundCircle
{
  return self->_backgroundCircle;
}

- (void)setBackgroundCircle:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundCircle, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backgroundCircle, 0);
  objc_storeStrong((id *)&self->_invisibleButton, 0);
  objc_storeStrong((id *)&self->_button, 0);
}

@end
