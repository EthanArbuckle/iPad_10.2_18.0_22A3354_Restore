@implementation AKFingerPotView

- (AKFingerPotView)initWithFrame:(CGRect)a3
{
  AKFingerPotView *v3;
  AKFingerPotView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)AKFingerPotView;
  v3 = -[AKFingerPotView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[AKFingerPotView setAdjustsImageWhenHighlighted:](v3, "setAdjustsImageWhenHighlighted:", 0);
    -[AKFingerPotView setShowsTouchWhenHighlighted:](v4, "setShowsTouchWhenHighlighted:", 0);
  }
  return v4;
}

- (UIImage)menuImage
{
  return (UIImage *)MEMORY[0x24BEDD108](self, sel_backgroundImageForState_);
}

- (void)setMenuImage:(id)a3
{
  MEMORY[0x24BEDD108](self, sel_setBackgroundImage_forState_);
}

- (void)setSelected:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  objc_super v14;

  v3 = a3;
  if (-[AKFingerPotView isSelected](self, "isSelected") != a3)
  {
    v14.receiver = self;
    v14.super_class = (Class)AKFingerPotView;
    -[AKFingerPotView setSelected:](&v14, sel_setSelected_, v3);
    if (v3)
    {
      -[AKFingerPotView selectedOutline](self, "selectedOutline");
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v5)
      {
        v6 = objc_alloc(MEMORY[0x24BDF6AE8]);
        objc_msgSend(MEMORY[0x24BDF6AC8], "imageNamed:", CFSTR("ib_text_pop_icon_highlight_swatch_selection"));
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = (void *)objc_msgSend(v6, "initWithImage:", v7);
        -[AKFingerPotView setSelectedOutline:](self, "setSelectedOutline:", v8);

        -[AKFingerPotView selectedOutline](self, "selectedOutline");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setContentMode:", 4);

        -[AKFingerPotView selectedOutline](self, "selectedOutline");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[AKFingerPotView addSubview:](self, "addSubview:", v10);

        -[AKFingerPotView highlight](self, "highlight");
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        if (v11)
        {
          -[AKFingerPotView highlight](self, "highlight");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          -[AKFingerPotView bringSubviewToFront:](self, "bringSubviewToFront:", v12);

        }
      }
    }
    -[AKFingerPotView selectedOutline](self, "selectedOutline");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setHidden:", v3 ^ 1);

  }
}

- (void)setHighlighted:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[5];
  objc_super v14;

  v3 = a3;
  if (-[AKFingerPotView isHighlighted](self, "isHighlighted") != a3)
  {
    v14.receiver = self;
    v14.super_class = (Class)AKFingerPotView;
    -[AKFingerPotView setHighlighted:](&v14, sel_setHighlighted_, v3);
    -[AKFingerPotView highlight](self, "highlight");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      if (v3)
      {
LABEL_4:
        -[AKFingerPotView highlight](self, "highlight");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "setAlpha:", 1.0);

        return;
      }
    }
    else
    {
      v7 = objc_alloc(MEMORY[0x24BDF6AE8]);
      objc_msgSend(MEMORY[0x24BDF6AC8], "imageNamed:", CFSTR("FingerPot_Pressed"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = (void *)objc_msgSend(v7, "initWithImage:", v8);
      -[AKFingerPotView setHighlight:](self, "setHighlight:", v9);

      -[AKFingerPotView highlight](self, "highlight");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setOpaque:", 0);

      -[AKFingerPotView highlight](self, "highlight");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setAlpha:", 0.0);

      -[AKFingerPotView highlight](self, "highlight");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[AKFingerPotView addSubview:](self, "addSubview:", v12);

      if (v3)
        goto LABEL_4;
    }
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = sub_2290273B8;
    v13[3] = &unk_24F1A7328;
    v13[4] = self;
    objc_msgSend(MEMORY[0x24BDF6F90], "animateWithDuration:animations:", v13, 0.25);
  }
}

- (void)layoutSubviews
{
  void *v3;
  double v4;
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
  void *v16;
  double MidX;
  double MidY;
  void *v19;
  void *v20;
  double x;
  double y;
  double width;
  double height;
  void *v25;
  objc_super v26;
  CGRect v27;
  CGRect v28;
  CGRect v29;
  CGRect v30;

  v26.receiver = self;
  v26.super_class = (Class)AKFingerPotView;
  -[AKFingerPotView layoutSubviews](&v26, sel_layoutSubviews);
  -[AKFingerPotView imageForState:](self, "imageForState:", 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  -[AKFingerPotView bounds](self, "bounds");
  -[AKFingerPotView contentRectForBounds:](self, "contentRectForBounds:");
  v8 = v4;
  v9 = v5;
  v10 = v6;
  v11 = v7;
  if (v3)
  {
    -[AKFingerPotView imageRectForContentRect:](self, "imageRectForContentRect:", v4, v5, v6, v7);
    v8 = v12;
    v9 = v13;
    v10 = v14;
    v11 = v15;
  }
  -[AKFingerPotView selectedOutline](self, "selectedOutline");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setFrame:", v8, v9, v10, v11);

  v27.origin.x = v8;
  v27.origin.y = v9;
  v27.size.width = v10;
  v27.size.height = v11;
  MidX = CGRectGetMidX(v27);
  v28.origin.x = v8;
  v28.origin.y = v9;
  v28.size.width = v10;
  v28.size.height = v11;
  MidY = CGRectGetMidY(v28);
  -[AKFingerPotView highlight](self, "highlight");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setCenter:", MidX, MidY);

  -[AKFingerPotView highlight](self, "highlight");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "frame");
  v30 = CGRectIntegral(v29);
  x = v30.origin.x;
  y = v30.origin.y;
  width = v30.size.width;
  height = v30.size.height;
  -[AKFingerPotView highlight](self, "highlight");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setFrame:", x, y, width, height);

}

- (UIImageView)selectedOutline
{
  return self->_selectedOutline;
}

- (void)setSelectedOutline:(id)a3
{
  objc_storeStrong((id *)&self->_selectedOutline, a3);
}

- (UIImageView)highlight
{
  return self->_highlight;
}

- (void)setHighlight:(id)a3
{
  objc_storeStrong((id *)&self->_highlight, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_highlight, 0);
  objc_storeStrong((id *)&self->_selectedOutline, 0);
}

@end
