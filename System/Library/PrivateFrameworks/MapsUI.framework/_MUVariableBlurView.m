@implementation _MUVariableBlurView

- (_MUVariableBlurView)initWithRadius:(double)a3 maskImage:(CGImage *)a4
{
  _MUVariableBlurView *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v13.receiver = self;
  v13.super_class = (Class)_MUVariableBlurView;
  v6 = -[_MUVariableBlurView initWithFrame:](&v13, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[_MUVariableBlurView setBackgroundColor:](v6, "setBackgroundColor:", v7);

    objc_msgSend(MEMORY[0x1E0CD2780], "filterWithType:", *MEMORY[0x1E0CD2F00]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setValue:forKey:", MEMORY[0x1E0C9AAA0], CFSTR("inputDither"));
    objc_msgSend(v8, "setValue:forKey:", a4, CFSTR("inputMaskImage"));
    objc_msgSend(v8, "setValue:forKey:", MEMORY[0x1E0C9AAB0], CFSTR("inputNormalizeEdges"));
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setValue:forKey:", v9, CFSTR("inputRadius"));

    objc_msgSend(v8, "setName:", CFSTR("variableBlur"));
    -[_MUVariableBlurView backdropLayer](v6, "backdropLayer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setAllowsHitTesting:", 0);
    v14[0] = v8;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setFilters:", v11);

    objc_msgSend(v10, "setMasksToBounds:", 1);
  }
  return v6;
}

+ (Class)layerClass
{
  return (Class)objc_opt_class();
}

@end
