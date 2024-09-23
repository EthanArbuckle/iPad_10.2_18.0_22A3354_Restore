@implementation AXGestureRecorderGradientView

+ (Class)layerClass
{
  return (Class)objc_opt_class();
}

- (void)_configureGradientWithTopColor:(id)a3 bottomColor:(id)a4 locations:(id)a5 animated:(BOOL)a6 duration:(double)a7 completion:(id)a8
{
  _BOOL4 v10;
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  id v19;
  id v20;
  void (**v21)(void *, id, char *);
  uint64_t v22;
  uint64_t v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  objc_class *v29;
  void *v30;
  _QWORD aBlock[4];
  id v32;

  v10 = a6;
  v14 = a5;
  v15 = a8;
  v16 = a4;
  v17 = a3;
  -[AXGestureRecorderGradientView gradientLayer](self, "gradientLayer");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = -[AXGestureRecorderGradientView _copyColorsArrayWithTopColor:bottomColor:](self, "_copyColorsArrayWithTopColor:bottomColor:", v17, v16);

  if (a7 > 0.0 && v10)
  {
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __115__AXGestureRecorderGradientView__configureGradientWithTopColor_bottomColor_locations_animated_duration_completion___block_invoke;
    aBlock[3] = &unk_1E76AB3B0;
    v20 = v18;
    v32 = v20;
    v21 = (void (**)(void *, id, char *))_Block_copy(aBlock);
    v21[2](v21, v19, sel_colors);
    v22 = objc_claimAutoreleasedReturnValue();
    v21[2](v21, v14, sel_locations);
    v23 = objc_claimAutoreleasedReturnValue();
    v24 = (void *)v23;
    if (v22 && v23)
    {
      v25 = (id)objc_opt_new();
      v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithObjects:", v22, v24, 0);
      objc_msgSend(v25, "setAnimations:", v26);

      if (!v25)
        goto LABEL_20;
    }
    else
    {
      if (!(v22 | v23))
      {
        v25 = 0;
LABEL_20:

        goto LABEL_21;
      }
      if (v22)
        v27 = (void *)v22;
      else
        v27 = (void *)v23;
      v25 = v27;
    }
    objc_msgSend(v25, "setDuration:", a7);
    if (v15)
    {
      v28 = (void *)objc_opt_new();
      objc_msgSend(v28, "setCompletionBlock:", v15);
      objc_msgSend(v25, "setDelegate:", v28);

    }
    v29 = (objc_class *)objc_opt_class();
    NSStringFromClass(v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "addAnimation:forKey:", v25, v30);

    if (v22)
      objc_msgSend(v20, "setColors:", v19);
    if (v24)
      objc_msgSend(v20, "setLocations:", v14);
    goto LABEL_20;
  }
  objc_msgSend(v18, "setColors:", v19);
  objc_msgSend(v18, "setLocations:", v14);
LABEL_21:

}

id __115__AXGestureRecorderGradientView__configureGradientWithTopColor_bottomColor_locations_animated_duration_completion___block_invoke(uint64_t a1, void *a2, const char *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;

  v5 = a2;
  objc_msgSend(*(id *)(a1 + 32), "performSelector:", a3);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  if ((id)v6 == v5 || v5 && v6 && (objc_msgSend(v5, "isEqual:", v6) & 1) != 0)
  {
    v8 = 0;
  }
  else
  {
    v8 = (void *)objc_opt_new();
    NSStringFromSelector(a3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setKeyPath:", v9);

    objc_msgSend(v8, "setFromValue:", v7);
    objc_msgSend(v8, "setToValue:", v5);
  }

  return v8;
}

- (void)configureGradientWithTopColor:(id)a3 bottomColor:(id)a4
{
  -[AXGestureRecorderGradientView _configureGradientWithTopColor:bottomColor:locations:animated:duration:completion:](self, "_configureGradientWithTopColor:bottomColor:locations:animated:duration:completion:", a3, a4, 0, 0, 0, 0.0);
}

- (void)configureGradientWithTopColor:(id)a3 bottomColor:(id)a4 topColorLocation:(float)a5 bottomColorLocation:(float)a6
{
  id v10;
  id v11;
  double v12;
  double v13;
  id v14;

  v10 = a4;
  v11 = a3;
  *(float *)&v12 = a5;
  *(float *)&v13 = a6;
  v14 = -[AXGestureRecorderGradientView _copyLocationsArrayWithTopColorLocation:bottomColorLocation:](self, "_copyLocationsArrayWithTopColorLocation:bottomColorLocation:", v12, v13);
  -[AXGestureRecorderGradientView _configureGradientWithTopColor:bottomColor:locations:animated:duration:completion:](self, "_configureGradientWithTopColor:bottomColor:locations:animated:duration:completion:", v11, v10, v14, 0, 0, 0.0);

}

- (void)configureGradientAnimatedWithTopColor:(id)a3 bottomColor:(id)a4 duration:(double)a5 completion:(id)a6
{
  -[AXGestureRecorderGradientView _configureGradientWithTopColor:bottomColor:locations:animated:duration:completion:](self, "_configureGradientWithTopColor:bottomColor:locations:animated:duration:completion:", a3, a4, 0, 1, a6, a5);
}

- (void)configureGradientAnimatedWithTopColor:(id)a3 bottomColor:(id)a4 topColorLocation:(float)a5 bottomColorLocation:(float)a6 duration:(double)a7 completion:(id)a8
{
  id v14;
  id v15;
  id v16;
  double v17;
  double v18;
  id v19;

  v14 = a8;
  v15 = a4;
  v16 = a3;
  *(float *)&v17 = a5;
  *(float *)&v18 = a6;
  v19 = -[AXGestureRecorderGradientView _copyLocationsArrayWithTopColorLocation:bottomColorLocation:](self, "_copyLocationsArrayWithTopColorLocation:bottomColorLocation:", v17, v18);
  -[AXGestureRecorderGradientView _configureGradientWithTopColor:bottomColor:locations:animated:duration:completion:](self, "_configureGradientWithTopColor:bottomColor:locations:animated:duration:completion:", v16, v15, v19, 1, v14, a7);

}

- (id)_copyColorsArrayWithTopColor:(id)a3 bottomColor:(id)a4
{
  objc_class *v5;
  id v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  id v11;
  uint64_t v12;

  v5 = (objc_class *)MEMORY[0x1E0C99D20];
  v6 = a4;
  v7 = a3;
  v8 = [v5 alloc];
  v9 = objc_retainAutorelease(v7);
  v10 = objc_msgSend(v9, "CGColor");

  v11 = objc_retainAutorelease(v6);
  v12 = objc_msgSend(v11, "CGColor");

  return (id)objc_msgSend(v8, "initWithObjects:", v10, v12, 0);
}

- (id)_copyLocationsArrayWithTopColorLocation:(float)a3 bottomColorLocation:(float)a4
{
  id v6;
  double v7;
  void *v8;
  id v9;
  double v10;
  void *v11;
  void *v12;

  v6 = objc_alloc(MEMORY[0x1E0CB37E8]);
  *(float *)&v7 = a3;
  v8 = (void *)objc_msgSend(v6, "initWithFloat:", v7);
  v9 = objc_alloc(MEMORY[0x1E0CB37E8]);
  *(float *)&v10 = a4;
  v11 = (void *)objc_msgSend(v9, "initWithFloat:", v10);
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithObjects:", v8, v11, 0);

  return v12;
}

@end
