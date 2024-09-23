@implementation HKGradientView

- (HKGradientView)initWithGradient:(id)a3
{
  id v5;
  HKGradientView *v6;
  HKGradientView *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HKGradientView;
  v6 = -[HKGradientView initWithFrame:](&v9, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_gradient, a3);
    -[HKGradientView _updateGradientLayer](v7, "_updateGradientLayer");
  }

  return v7;
}

- (void)setGradient:(id)a3
{
  id v5;
  void *v6;
  char v7;
  id v8;

  v5 = a3;
  v6 = v5;
  if (v5)
  {
    v8 = v5;
    v7 = objc_msgSend(v5, "isEqual:", self->_gradient);
    v6 = v8;
    if ((v7 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_gradient, a3);
      -[HKGradientView _updateGradientLayer](self, "_updateGradientLayer");
      v6 = v8;
    }
  }

}

- (void)maskCorners:(unint64_t)a3 radius:(double)a4
{
  unint64_t v6;
  void *v7;
  id v8;

  v6 = a3 & 0xF;
  -[HKGradientView layer](self, "layer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setCornerRadius:", a4);

  -[HKGradientView layer](self, "layer");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setMaskedCorners:", v6);

}

- (void)maskAllCornersWithRadius:(double)a3
{
  -[HKGradientView maskCorners:radius:](self, "maskCorners:radius:", -1, a3);
}

+ (Class)layerClass
{
  return (Class)objc_opt_class();
}

- (void)_updateGradientLayer
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  -[HKGradientView layer](self, "layer");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[HKGradientView gradient](self, "gradient");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "colors");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "hk_map:", &__block_literal_global_41);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setColors:", v5);

  -[HKGradientView gradient](self, "gradient");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "locations");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setLocations:", v7);

}

uint64_t __38__HKGradientView__updateGradientLayer__block_invoke(int a1, id a2)
{
  return objc_msgSend(objc_retainAutorelease(a2), "CGColor");
}

- (HKGradient)gradient
{
  return self->_gradient;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_gradient, 0);
}

+ (id)hk_verticalWaveformMaskGradientWithInsetLocation:(double)a3
{
  HKGradient *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  HKGradient *v13;
  HKGradientView *v14;
  _QWORD v16[4];
  _QWORD v17[5];

  v17[4] = *MEMORY[0x1E0C80C00];
  v4 = [HKGradient alloc];
  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v5;
  objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v17[1] = v6;
  objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v17[2] = v7;
  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v17[3] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = &unk_1E9CED5C8;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v16[1] = v10;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", 1.0 - a3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v16[2] = v11;
  v16[3] = &unk_1E9CED5D8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[HKGradient initWithColors:locations:](v4, "initWithColors:locations:", v9, v12);

  v14 = -[HKGradientView initWithGradient:]([HKGradientView alloc], "initWithGradient:", v13);
  return v14;
}

@end
