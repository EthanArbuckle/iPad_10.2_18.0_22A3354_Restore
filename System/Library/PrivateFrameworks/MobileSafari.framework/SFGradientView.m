@implementation SFGradientView

uint64_t __43__SFGradientView_initWithColors_locations___block_invoke(int a1, id a2)
{
  return objc_msgSend(objc_retainAutorelease(a2), "CGColor");
}

+ (Class)layerClass
{
  return (Class)objc_opt_class();
}

+ (id)standardGaussianGradientView
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  SFGradientView *v11;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  SFGradientView *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  _QWORD v22[18];

  v22[16] = *MEMORY[0x1E0C80C00];
  v17 = [SFGradientView alloc];
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.0, 1.0);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = v21;
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.0, 0.994603225);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v22[1] = v20;
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.0, 0.978587023);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v22[2] = v19;
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.0, 0.952464435);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v22[3] = v18;
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.0, 0.917060124);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v22[4] = v16;
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.0, 0.822990973);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v22[5] = v15;
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.0, 0.707279774);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v22[6] = v14;
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.0, 0.458754447);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v22[7] = v13;
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.0, 0.346236755);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v22[8] = v2;
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.0, 0.250244738);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v22[9] = v3;
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.0, 0.173203094);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v22[10] = v4;
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.0, 0.114800887);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v22[11] = v5;
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.0, 0.0728674787);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v22[12] = v6;
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.0, 0.0442915775);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v22[13] = v7;
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.0, 0.0143711881);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v22[14] = v8;
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.0, 0.00392156863);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v22[15] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 16);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[SFGradientView initWithColors:locations:](v17, "initWithColors:locations:", v10, &unk_1E2245CF0);

  return v11;
}

- (SFGradientView)initWithColors:(id)a3 locations:(id)a4
{
  id v6;
  id v7;
  SFGradientView *v8;
  SFGradientView *v9;
  void *v10;
  void *v11;
  SFGradientView *v12;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)SFGradientView;
  v8 = -[SFGradientView init](&v14, sel_init);
  v9 = v8;
  if (v8)
  {
    -[SFGradientView setUserInteractionEnabled:](v8, "setUserInteractionEnabled:", 0);
    -[SFGradientView gradientLayer](v9, "gradientLayer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "safari_mapObjectsUsingBlock:", &__block_literal_global_15);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setColors:", v11);

    objc_msgSend(v10, "setLocations:", v7);
    v12 = v9;

  }
  return v9;
}

- (SFGradientView)initWithFrame:(CGRect)a3
{
  SFGradientView *v3;
  SFGradientView *v4;
  SFGradientView *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SFGradientView;
  v3 = -[SFGradientView initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[SFGradientView setUserInteractionEnabled:](v3, "setUserInteractionEnabled:", 0);
    v5 = v4;
  }

  return v4;
}

- (SFGradientView)initWithCoder:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99750], CFSTR("SFGradientView is not compatible with Interface Builder."), 0);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v4);
}

- (BOOL)_shouldAnimatePropertyWithKey:(id)a3
{
  id v4;
  BOOL v5;
  objc_super v7;

  v4 = a3;
  if ((objc_msgSend(v4, "isEqualToString:", CFSTR("startPoint")) & 1) != 0
    || (objc_msgSend(v4, "isEqualToString:", CFSTR("endPoint")) & 1) != 0)
  {
    v5 = 1;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)SFGradientView;
    v5 = -[SFGradientView _shouldAnimatePropertyWithKey:](&v7, sel__shouldAnimatePropertyWithKey_, v4);
  }

  return v5;
}

@end
