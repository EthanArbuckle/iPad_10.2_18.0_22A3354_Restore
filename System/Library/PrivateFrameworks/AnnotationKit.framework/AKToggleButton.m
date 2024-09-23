@implementation AKToggleButton

- (AKToggleButton)initWithFrame:(CGRect)a3 templateImage:(id)a4 autoUpdatesColor:(BOOL)a5
{
  _BOOL4 v5;
  double height;
  double width;
  double y;
  double x;
  id v11;
  AKToggleButton *v12;
  AKToggleButton *v13;
  uint64_t v14;
  UIColor *selectedColor;
  uint64_t v16;
  UIImage *templateImage;
  objc_super v19;

  v5 = a5;
  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v11 = a4;
  v19.receiver = self;
  v19.super_class = (Class)AKToggleButton;
  v12 = -[AKToggleButton initWithFrame:](&v19, sel_initWithFrame_, x, y, width, height);
  v13 = v12;
  if (v12)
  {
    v12->_showsBackgroundColor = 1;
    v12->_shouldTintNormalImage = 0;
    objc_msgSend(MEMORY[0x24BDF6950], "whiteColor");
    v14 = objc_claimAutoreleasedReturnValue();
    selectedColor = v13->_selectedColor;
    v13->_selectedColor = (UIColor *)v14;

    objc_msgSend(v11, "imageWithRenderingMode:", 2);
    v16 = objc_claimAutoreleasedReturnValue();
    templateImage = v13->_templateImage;
    v13->_templateImage = (UIImage *)v16;

    if (v5)
      -[AKToggleButton addTarget:action:forControlEvents:](v13, "addTarget:action:forControlEvents:", v13, sel__touchCommitted_, 64);
  }

  return v13;
}

- (void)_touchCommitted:(id)a3
{
  -[AKToggleButton setSelected:](self, "setSelected:", -[AKToggleButton isSelected](self, "isSelected", a3) ^ 1);
}

- (void)setSelected:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)AKToggleButton;
  -[AKToggleButton setSelected:](&v5, sel_setSelected_, a3);
  -[AKToggleButton imageForState:](self, "imageForState:", 4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
    NSLog(CFSTR("Create a selected image"));
  if (-[AKToggleButton showsBackgroundColor](self, "showsBackgroundColor"))
    -[AKToggleButton _updateSelectionColorsAnimated:](self, "_updateSelectionColorsAnimated:", 1);

}

- (void)setHighlighted:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)AKToggleButton;
  -[AKToggleButton setHighlighted:](&v4, sel_setHighlighted_, a3);
  if (-[AKToggleButton showsBackgroundColor](self, "showsBackgroundColor"))
    -[AKToggleButton _updateSelectionColorsAnimated:](self, "_updateSelectionColorsAnimated:", 1);
}

- (void)_updateSelectionColorsAnimated:(BOOL)a3
{
  _BOOL4 v3;
  double v5;
  void *v6;
  _QWORD *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;
  _QWORD v14[5];
  _QWORD v15[5];

  v3 = a3;
  if (!-[AKToggleButton showsBackgroundColor](self, "showsBackgroundColor"))
  {
LABEL_13:
    objc_msgSend(MEMORY[0x24BDF6950], "clearColor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_14;
  }
  if (v3)
    v5 = 0.2;
  else
    v5 = 0.0;
  if (-[AKToggleButton isSelected](self, "isSelected"))
  {
    v6 = (void *)MEMORY[0x24BDF6F90];
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = sub_228FD9F94;
    v15[3] = &unk_24F1A7328;
    v15[4] = self;
    v7 = v15;
LABEL_12:
    objc_msgSend(v6, "animateWithDuration:animations:", v7, v5);
    return;
  }
  if (!-[AKToggleButton isHighlighted](self, "isHighlighted"))
  {
    if ((-[AKToggleButton isSelected](self, "isSelected") & 1) != 0
      || (-[AKToggleButton isHighlighted](self, "isHighlighted") & 1) != 0)
    {
      v6 = (void *)MEMORY[0x24BDF6F90];
      v14[0] = MEMORY[0x24BDAC760];
      v14[1] = 3221225472;
      v14[2] = sub_228FD9FF4;
      v14[3] = &unk_24F1A7328;
      v14[4] = self;
      v7 = v14;
      goto LABEL_12;
    }
    goto LABEL_13;
  }
  -[AKToggleButton tintColor](self, "tintColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "colorWithAlphaComponent:", 0.35);
  v9 = objc_claimAutoreleasedReturnValue();

  v10 = (void *)v9;
LABEL_14:
  v13 = objc_retainAutorelease(v10);
  v11 = objc_msgSend(v13, "CGColor");
  -[AKToggleButton layer](self, "layer");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setBackgroundColor:", v11);

}

- (void)setImage:(id)a3 forState:(unint64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v11;
  objc_super v12;
  objc_super v13;

  v6 = a3;
  if (a4)
  {
    v11.receiver = self;
    v11.super_class = (Class)AKToggleButton;
    -[AKToggleButton setImage:forState:](&v11, sel_setImage_forState_, v6, a4);
  }
  else
  {
    if (-[AKToggleButton shouldTintNormalImage](self, "shouldTintNormalImage"))
    {
      v7 = (void *)objc_opt_class();
      -[AKToggleButton templateImage](self, "templateImage");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[AKToggleButton tintColor](self, "tintColor");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "colorImage:withColor:", v8, v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      v13.receiver = self;
      v13.super_class = (Class)AKToggleButton;
      -[AKToggleButton setImage:forState:](&v13, sel_setImage_forState_, v10, 0);

    }
    else
    {
      v12.receiver = self;
      v12.super_class = (Class)AKToggleButton;
      -[AKToggleButton setImage:forState:](&v12, sel_setImage_forState_, v6, 0);
    }
    -[AKToggleButton _setSelectedStateColorImage](self, "_setSelectedStateColorImage");
  }

}

- (void)_setSelectedStateColorImage
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  if (-[AKToggleButton shouldTintNormalImage](self, "shouldTintNormalImage"))
  {
    if (-[AKToggleButton tintAdjustmentMode](self, "tintAdjustmentMode") == 2)
      -[AKToggleButton tintColor](self, "tintColor");
    else
      -[AKToggleButton selectedColor](self, "selectedColor");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (void *)objc_opt_class();
    -[AKToggleButton templateImage](self, "templateImage");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "colorImage:withColor:", v5, v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7.receiver = self;
    v7.super_class = (Class)AKToggleButton;
    -[AKToggleButton setImage:forState:](&v7, sel_setImage_forState_, v6, 4);

  }
}

- (void)_setDeselectedStateColorImage
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  if (-[AKToggleButton shouldTintNormalImage](self, "shouldTintNormalImage"))
  {
    -[AKToggleButton tintColor](self, "tintColor");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (void *)objc_opt_class();
    -[AKToggleButton templateImage](self, "templateImage");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "colorImage:withColor:", v5, v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7.receiver = self;
    v7.super_class = (Class)AKToggleButton;
    -[AKToggleButton setImage:forState:](&v7, sel_setImage_forState_, v6, 0);

  }
}

- (void)_updateStateColors
{
  void *v3;
  BOOL v4;

  -[AKToggleButton traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = sub_22901C04C(v3);

  if (!v4)
    -[AKToggleButton _setSelectedStateColorImage](self, "_setSelectedStateColorImage");
  -[AKToggleButton _setDeselectedStateColorImage](self, "_setDeselectedStateColorImage");
  -[AKToggleButton _updateSelectionColorsAnimated:](self, "_updateSelectionColorsAnimated:", 0);
}

- (void)tintColorDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AKToggleButton;
  -[AKToggleButton tintColorDidChange](&v3, sel_tintColorDidChange);
  -[AKToggleButton _updateStateColors](self, "_updateStateColors");
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  void *v5;
  BOOL v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)AKToggleButton;
  v4 = a3;
  -[AKToggleButton traitCollectionDidChange:](&v7, sel_traitCollectionDidChange_, v4);
  -[AKToggleButton traitCollection](self, "traitCollection", v7.receiver, v7.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = sub_22901C098(v5, v4);

  if (!v6)
    -[AKToggleButton _updateStateColors](self, "_updateStateColors");
}

+ (id)colorImage:(id)a3 withColor:(id)a4
{
  id v5;
  id v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  CGContext *CurrentContext;
  CGFloat v12;
  id v13;
  CGImage *v14;
  id v15;
  CGColor *v16;
  void *v17;
  CGAffineTransform v19;
  CGSize v20;
  CGRect v21;
  CGRect v22;

  v5 = a4;
  v6 = a3;
  objc_msgSend(v6, "size");
  UIGraphicsBeginImageContextWithOptions(v20, 0, 0.0);
  objc_msgSend(v6, "size");
  v8 = v7;
  objc_msgSend(v6, "size");
  v10 = v9;
  CurrentContext = UIGraphicsGetCurrentContext();
  objc_msgSend(v6, "size");
  v19.b = 0.0;
  v19.c = 0.0;
  v19.a = 1.0;
  *(_OWORD *)&v19.d = xmmword_2290937C0;
  v19.ty = v12;
  CGContextConcatCTM(CurrentContext, &v19);
  v13 = objc_retainAutorelease(v6);
  v14 = (CGImage *)objc_msgSend(v13, "CGImage");

  v21.origin.x = 0.0;
  v21.origin.y = 0.0;
  v21.size.width = v8;
  v21.size.height = v10;
  CGContextClipToMask(CurrentContext, v21, v14);
  v15 = objc_retainAutorelease(v5);
  v16 = (CGColor *)objc_msgSend(v15, "CGColor");

  CGContextSetFillColorWithColor(CurrentContext, v16);
  v22.origin.x = 0.0;
  v22.origin.y = 0.0;
  v22.size.width = v8;
  v22.size.height = v10;
  CGContextFillRect(CurrentContext, v22);
  UIGraphicsGetImageFromCurrentImageContext();
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  UIGraphicsEndImageContext();
  return v17;
}

- (BOOL)showsBackgroundColor
{
  return self->_showsBackgroundColor;
}

- (void)setShowsBackgroundColor:(BOOL)a3
{
  self->_showsBackgroundColor = a3;
}

- (BOOL)shouldTintNormalImage
{
  return self->_shouldTintNormalImage;
}

- (void)setShouldTintNormalImage:(BOOL)a3
{
  self->_shouldTintNormalImage = a3;
}

- (UIColor)selectedColor
{
  return self->_selectedColor;
}

- (void)setSelectedColor:(id)a3
{
  objc_storeStrong((id *)&self->_selectedColor, a3);
}

- (UIImage)templateImage
{
  return self->_templateImage;
}

- (void)setTemplateImage:(id)a3
{
  objc_storeStrong((id *)&self->_templateImage, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_templateImage, 0);
  objc_storeStrong((id *)&self->_selectedColor, 0);
}

@end
