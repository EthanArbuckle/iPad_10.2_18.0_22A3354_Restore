@implementation AVStatusBarBackgroundGradientViewSubview

- (AVStatusBarBackgroundGradientViewSubview)initWithFrame:(CGRect)a3
{
  AVStatusBarBackgroundGradientViewSubview *v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  objc_super v26;
  _QWORD v27[18];

  v27[16] = *MEMORY[0x1E0C80C00];
  v26.receiver = self;
  v26.super_class = (Class)AVStatusBarBackgroundGradientViewSubview;
  v3 = -[AVStatusBarBackgroundGradientViewSubview initWithFrame:](&v26, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.0, 1.0);
    v25 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v27[0] = objc_msgSend(v25, "CGColor");
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.0, 0.994603225);
    v24 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v27[1] = objc_msgSend(v24, "CGColor");
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.0, 0.978587023);
    v23 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v27[2] = objc_msgSend(v23, "CGColor");
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.0, 0.952464435);
    v22 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v27[3] = objc_msgSend(v22, "CGColor");
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.0, 0.917060124);
    v21 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v27[4] = objc_msgSend(v21, "CGColor");
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.0, 0.822990973);
    v20 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v27[5] = objc_msgSend(v20, "CGColor");
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.0, 0.707279774);
    v19 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v27[6] = objc_msgSend(v19, "CGColor");
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.0, 0.458754447);
    v18 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v27[7] = objc_msgSend(v18, "CGColor");
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.0, 0.346236755);
    v17 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v27[8] = objc_msgSend(v17, "CGColor");
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.0, 0.250244738);
    v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v27[9] = objc_msgSend(v4, "CGColor");
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.0, 0.173203094);
    v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v27[10] = objc_msgSend(v5, "CGColor");
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.0, 0.114800887);
    v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v27[11] = objc_msgSend(v6, "CGColor");
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.0, 0.0728674787);
    v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v27[12] = objc_msgSend(v7, "CGColor");
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.0, 0.0442915775);
    v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v27[13] = objc_msgSend(v8, "CGColor");
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.0, 0.0143711881);
    v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v27[14] = objc_msgSend(v9, "CGColor");
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.0, 0.00392156863);
    v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v27[15] = objc_msgSend(v10, "CGColor");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 16);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVStatusBarBackgroundGradientViewSubview layer](v3, "layer");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setColors:", v11);

    -[AVStatusBarBackgroundGradientViewSubview layer](v3, "layer");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setLocations:", &unk_1E5BF3F48);

    objc_msgSend(MEMORY[0x1E0CD2780], "filterWithType:", *MEMORY[0x1E0CD2C30]);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVStatusBarBackgroundGradientViewSubview layer](v3, "layer");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setCompositingFilter:", v14);

  }
  return v3;
}

- (double)gradientOpacity
{
  return self->_gradientOpacity;
}

- (void)setGradientOpacity:(double)a3
{
  self->_gradientOpacity = a3;
}

+ (Class)layerClass
{
  return (Class)objc_opt_class();
}

@end
