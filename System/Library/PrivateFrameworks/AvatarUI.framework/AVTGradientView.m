@implementation AVTGradientView

+ (Class)layerClass
{
  return (Class)objc_opt_class();
}

- (AVTGradientView)initWithFrame:(CGRect)a3
{
  AVTGradientView *v3;
  AVTGradientView *v4;
  void *v5;
  char isKindOfClass;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  objc_super v18;
  _QWORD v19[7];

  v19[6] = *MEMORY[0x1E0C80C00];
  v18.receiver = self;
  v18.super_class = (Class)AVTGradientView;
  v3 = -[AVTGradientView initWithFrame:](&v18, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[AVTGradientView layer](v3, "layer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) == 0)
    {
      v7 = (void *)MEMORY[0x1E0C99DA0];
      -[AVTGradientView layer](v4, "layer");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "raise:format:", CFSTR("AVTTypeMismatchException"), CFSTR("Unexpected object class for %@"), v8);

    }
    -[AVTGradientView layer](v4, "layer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CEA478], "colorWithWhite:alpha:", 1.0, 0.0);
    v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v19[0] = objc_msgSend(v10, "CGColor");
    objc_msgSend(MEMORY[0x1E0CEA478], "colorWithWhite:alpha:", 1.0, 0.0);
    v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v19[1] = objc_msgSend(v11, "CGColor");
    objc_msgSend(MEMORY[0x1E0CEA478], "whiteColor");
    v12 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v19[2] = objc_msgSend(v12, "CGColor");
    objc_msgSend(MEMORY[0x1E0CEA478], "whiteColor");
    v13 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v19[3] = objc_msgSend(v13, "CGColor");
    objc_msgSend(MEMORY[0x1E0CEA478], "colorWithWhite:alpha:", 1.0, 0.0);
    v14 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v19[4] = objc_msgSend(v14, "CGColor");
    objc_msgSend(MEMORY[0x1E0CEA478], "colorWithWhite:alpha:", 1.0, 0.0);
    v15 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v19[5] = objc_msgSend(v15, "CGColor");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 6);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setColors:", v16);

    objc_msgSend(v9, "setLocations:", &unk_1EA571B38);
    objc_msgSend(v9, "setStartPoint:", *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8));
    objc_msgSend(v9, "setEndPoint:", 1.0, 0.0);

  }
  return v4;
}

@end
