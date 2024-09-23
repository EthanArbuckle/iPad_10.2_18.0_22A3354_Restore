@implementation MFComposeTextColorButton

+ (MFComposeTextColorButton)buttonWithColor:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  id v50;
  void *v51;
  _QWORD v52[10];

  v52[8] = *MEMORY[0x1E0C80C00];
  v50 = a3;
  +[MFComposeTextColorButton buttonWithType:](MFComposeTextColorButton, "buttonWithType:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setColor:", v50);
  v4 = (void *)MEMORY[0x1E0DC3870];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "imageNamed:inBundle:compatibleWithTraitCollection:", CFSTR("format-color-wheel"), v5, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setBackgroundImage:forState:", v6, 0);

  objc_msgSend(v3, "setAccessibilityIdentifier:", *MEMORY[0x1E0D46BE8]);
  v7 = objc_alloc(MEMORY[0x1E0DC3F10]);
  v8 = *MEMORY[0x1E0C9D648];
  v9 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v10 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v11 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  v51 = (void *)objc_msgSend(v7, "initWithFrame:", *MEMORY[0x1E0C9D648], v9, v10, v11);
  objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "setBackgroundColor:", v12);

  objc_msgSend(v51, "layer");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setMasksToBounds:", 1);

  objc_msgSend(v51, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v51, "setUserInteractionEnabled:", 0);
  objc_msgSend(v3, "addSubview:", v51);
  objc_msgSend(v3, "setColorRingView:", v51);
  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3F10]), "initWithFrame:", v8, v9, v10, v11);
  objc_msgSend(v14, "setBackgroundColor:", v50);
  objc_msgSend(MEMORY[0x1E0DC3658], "separatorColor");
  v15 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v16 = objc_msgSend(v15, "CGColor");
  objc_msgSend(v14, "layer");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setBorderColor:", v16);

  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "scale");
  v20 = v19;
  objc_msgSend(v14, "layer");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setBorderWidth:", 1.0 / v20);

  objc_msgSend(v14, "layer");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setMasksToBounds:", 1);

  objc_msgSend(v14, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v14, "setUserInteractionEnabled:", 0);
  objc_msgSend(v3, "addSubview:", v14);
  objc_msgSend(v3, "setColorView:", v14);
  v23 = (void *)MEMORY[0x1E0CB3718];
  objc_msgSend(v51, "widthAnchor");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "widthAnchor");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "constraintEqualToAnchor:multiplier:", 0.81);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v52[0] = v42;
  objc_msgSend(v51, "heightAnchor");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "heightAnchor");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "constraintEqualToAnchor:multiplier:", 0.81);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v52[1] = v40;
  objc_msgSend(v51, "centerXAnchor");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "centerXAnchor");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "constraintEqualToAnchor:");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v52[2] = v38;
  objc_msgSend(v51, "centerYAnchor");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "centerYAnchor");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "constraintEqualToAnchor:");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v52[3] = v36;
  objc_msgSend(v14, "widthAnchor");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "widthAnchor");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "constraintEqualToAnchor:multiplier:", 0.65);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v52[4] = v34;
  objc_msgSend(v14, "heightAnchor");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "heightAnchor");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "constraintEqualToAnchor:multiplier:", 0.65);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v52[5] = v32;
  objc_msgSend(v14, "centerXAnchor");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "centerXAnchor");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "constraintEqualToAnchor:", v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v52[6] = v26;
  objc_msgSend(v14, "centerYAnchor");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "centerYAnchor");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "constraintEqualToAnchor:", v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v52[7] = v29;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v52, 8);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "activateConstraints:", v30);

  return (MFComposeTextColorButton *)v3;
}

- (void)setColor:(id)a3
{
  UIColor *v5;
  void *v6;
  UIColor *v7;

  v5 = (UIColor *)a3;
  if (self->_color != v5)
  {
    v7 = v5;
    objc_storeStrong((id *)&self->_color, a3);
    -[MFComposeTextColorButton colorView](self, "colorView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setBackgroundColor:", v7);

    v5 = v7;
  }

}

- (void)layoutSubviews
{
  double v3;
  double v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)MFComposeTextColorButton;
  -[MFComposeTextColorButton layoutSubviews](&v16, sel_layoutSubviews);
  -[MFComposeTextColorButton bounds](self, "bounds");
  v4 = v3 * 0.5;
  -[MFComposeTextColorButton layer](self, "layer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setCornerRadius:", v4);

  -[MFComposeTextColorButton colorView](self, "colorView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "frame");
  v8 = v7;
  -[MFComposeTextColorButton colorView](self, "colorView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "layer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setCornerRadius:", v8 * 0.5);

  -[MFComposeTextColorButton colorRingView](self, "colorRingView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "frame");
  v13 = v12;
  -[MFComposeTextColorButton colorRingView](self, "colorRingView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "layer");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setCornerRadius:", v13 * 0.5);

}

- (UIColor)color
{
  return self->_color;
}

- (UIView)colorView
{
  return self->_colorView;
}

- (void)setColorView:(id)a3
{
  objc_storeStrong((id *)&self->_colorView, a3);
}

- (UIView)colorRingView
{
  return self->_colorRingView;
}

- (void)setColorRingView:(id)a3
{
  objc_storeStrong((id *)&self->_colorRingView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_colorRingView, 0);
  objc_storeStrong((id *)&self->_colorView, 0);
  objc_storeStrong((id *)&self->_color, 0);
}

@end
