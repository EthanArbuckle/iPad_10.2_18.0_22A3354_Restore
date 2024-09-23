@implementation NTKSchoolTimeDialView

- (NTKSchoolTimeDialView)initWithFrame:(CGRect)a3 ringWidth:(double)a4
{
  NTKSchoolTimeDialView *v5;
  NTKSchoolTimeDialView *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)NTKSchoolTimeDialView;
  v5 = -[NTKSchoolTimeDialView initWithFrame:](&v8, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v6 = v5;
  if (v5)
  {
    v5->_ringWidth = a4;
    -[NTKSchoolTimeDialView _setupUI](v5, "_setupUI");
  }
  return v6;
}

- (void)_setupUI
{
  id v3;
  id WeakRetained;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  double v11;
  CGFloat x;
  CGFloat y;
  double width;
  CGFloat height;
  void *v16;
  id v17;
  void *v18;
  NSDictionary *v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  double v32;
  void *v33;
  void *v34;
  double v35;
  double v36;
  double v37;
  unint64_t i;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  __double2 v44;
  double v45;
  double v46;
  void *v47;
  void *v48;
  double v49;
  double v50;
  void *v51;
  NSDictionary *hourLabels;
  void *v53;
  void *v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double v59;
  _QWORD v60[3];
  _QWORD v61[3];
  _QWORD v62[3];
  _QWORD v63[5];
  CGRect v64;
  CGRect v65;
  CGRect v66;

  v63[3] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C944B0], "currentDevice");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_lock((os_unfair_lock_t)&_LayoutConstants___lock_8);
  WeakRetained = objc_loadWeakRetained(&_LayoutConstants___cachedDevice_8);
  if (!WeakRetained)
    goto LABEL_5;
  v5 = WeakRetained;
  v6 = objc_loadWeakRetained(&_LayoutConstants___cachedDevice_8);
  if (v6 != v3)
  {

LABEL_5:
    v9 = objc_storeWeak(&_LayoutConstants___cachedDevice_8, v3);
    _LayoutConstants___previousCLKDeviceVersion_8 = objc_msgSend(v3, "version");

    ___LayoutConstants_block_invoke_7(v10, (uint64_t)v3);
    goto LABEL_6;
  }
  v7 = objc_msgSend(v3, "version");
  v8 = _LayoutConstants___previousCLKDeviceVersion_8;

  if (v7 != v8)
    goto LABEL_5;
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&_LayoutConstants___lock_8);
  v59 = *(double *)&_LayoutConstants___constants_0_1;

  v11 = self->_ringWidth * 0.5;
  -[NTKSchoolTimeDialView bounds](self, "bounds");
  v65 = CGRectInset(v64, v11 * 0.5, v11 * 0.5);
  x = v65.origin.x;
  y = v65.origin.y;
  width = v65.size.width;
  height = v65.size.height;
  objc_msgSend(MEMORY[0x1E0CD2840], "layer");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v66.origin.x = x;
  v66.origin.y = y;
  v66.size.width = width;
  v66.size.height = height;
  objc_msgSend(v16, "setPath:", CGPathCreateWithEllipseInRect(v66, 0));
  +[NTKSchoolTimeFaceView schoolTimeColor](NTKSchoolTimeFaceView, "schoolTimeColor");
  v17 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v16, "setStrokeColor:", objc_msgSend(v17, "CGColor"));

  objc_msgSend(v16, "setFillColor:", 0);
  objc_msgSend(v16, "setLineWidth:", v11);
  -[NTKSchoolTimeDialView layer](self, "layer");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v53 = v16;
  objc_msgSend(v18, "addSublayer:", v16);

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 12);
  v19 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
  v20 = MEMORY[0x1BCCA72B8](-[NTKSchoolTimeDialView bounds](self, "bounds"));
  v57 = v21;
  v58 = v20;
  v22 = width * 0.5;
  v23 = (void *)objc_opt_new();
  objc_msgSend(v23, "setNumberStyle:", 0);
  objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setLocale:", v24);

  v54 = v3;
  objc_msgSend(MEMORY[0x1E0C944C0], "metricsWithDevice:identitySizeClass:", v3, 3);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v62[0] = &unk_1E6C9DE10;
  v26 = (void *)MEMORY[0x1E0CB3B18];
  objc_msgSend(v25, "scaledValue:withOverride:forSizeClass:", 0, -1.0, 0.0);
  objc_msgSend(v26, "valueWithCGPoint:");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v63[0] = v27;
  v62[1] = &unk_1E6C9DE28;
  v28 = (void *)MEMORY[0x1E0CB3B18];
  objc_msgSend(v25, "scaledValue:withOverride:forSizeClass:", 0, 1.0, 0.0);
  objc_msgSend(v28, "valueWithCGPoint:");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v63[1] = v29;
  v62[2] = &unk_1E6C9DE40;
  v30 = (void *)MEMORY[0x1E0CB3B18];
  v60[0] = &unk_1E6C9DE58;
  v60[1] = &unk_1E6C9DE70;
  v61[0] = &unk_1E6CA3268;
  v61[1] = &unk_1E6CA3268;
  v60[2] = &unk_1E6C9DE88;
  v61[2] = &unk_1E6CA3268;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v61, v60, 3);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "scaledValue:withOverrides:", v31, -1.0);
  objc_msgSend(v30, "valueWithCGPoint:", 0.0, v32);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v63[2] = v33;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v63, v62, 3);
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  v35 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v55 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v56 = *MEMORY[0x1E0C9D648];
  v36 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  v37 = *MEMORY[0x1E0DC1448];
  for (i = 1; i != 13; ++i)
  {
    v39 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3990]), "initWithFrame:", v56, v55, v35, v36);
    objc_msgSend(MEMORY[0x1E0C944D0], "compactSoftFontOfSize:weight:", v59, v37);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "setFont:", v40);

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", i);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "stringFromNumber:", v41);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "setText:", v42);

    -[NTKSchoolTimeDialView _inactiveHourColor](self, "_inactiveHourColor");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "setTextColor:", v43);

    objc_msgSend(v39, "sizeToFit");
    v44 = __sincos_stret((double)i * 0.523598776 + -1.57079633);
    v45 = round(v58 + v22 * v44.__cosval);
    v46 = round(v57 + v22 * v44.__sinval);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", i);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "objectForKeyedSubscript:", v47);
    v48 = (void *)objc_claimAutoreleasedReturnValue();

    if (v48)
    {
      objc_msgSend(v48, "CGPointValue");
      v45 = v45 + v49;
      v46 = v46 + v50;
    }
    objc_msgSend(v39, "setCenter:", v45, v46);
    -[NTKSchoolTimeDialView addSubview:](self, "addSubview:", v39);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", i);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSDictionary setObject:forKeyedSubscript:](v19, "setObject:forKeyedSubscript:", v39, v51);

  }
  hourLabels = self->_hourLabels;
  self->_hourLabels = v19;

}

- (void)setActiveHour:(unint64_t)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  NSDictionary *hourLabels;
  void *v7;
  void *v8;
  NSDictionary *v9;
  void *v10;
  void *v11;
  void (**v12)(double);
  void *v13;
  void *v14;
  _QWORD aBlock[4];
  id v16;
  NTKSchoolTimeDialView *v17;
  id v18;

  if (self->_activeHour != a3)
  {
    v4 = a4;
    self->_activeHour = a3;
    hourLabels = self->_hourLabels;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSDictionary objectForKeyedSubscript:](hourLabels, "objectForKeyedSubscript:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = self->_hourLabels;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_activeHour);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSDictionary objectForKeyedSubscript:](v9, "objectForKeyedSubscript:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      aBlock[0] = MEMORY[0x1E0C809B0];
      aBlock[1] = 3221225472;
      aBlock[2] = __48__NTKSchoolTimeDialView_setActiveHour_animated___block_invoke;
      aBlock[3] = &unk_1E6BD0220;
      v16 = v8;
      v17 = self;
      v18 = v11;
      v12 = (void (**)(double))_Block_copy(aBlock);
      v12[2](1.0);

    }
    else
    {
      if (v8)
      {
        -[NTKSchoolTimeDialView _inactiveHourColor](self, "_inactiveHourColor");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setTextColor:", v13);

      }
      if (v11)
      {
        -[NTKSchoolTimeDialView _activeHourColor](self, "_activeHourColor");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "setTextColor:", v14);

      }
    }

  }
}

void __48__NTKSchoolTimeDialView_setActiveHour_animated___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v2 = *(void **)(a1 + 32);
  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 40), "_activeHourColor");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "_inactiveHourColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    NTKInterpolateBetweenColors(v3, v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setTextColor:", v5);

  }
  v6 = *(void **)(a1 + 48);
  if (v6)
  {
    objc_msgSend(*(id *)(a1 + 40), "_inactiveHourColor");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "_activeHourColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    NTKInterpolateBetweenColors(v9, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setTextColor:", v8);

  }
}

- (id)_inactiveHourColor
{
  if (_inactiveHourColor_onceToken != -1)
    dispatch_once(&_inactiveHourColor_onceToken, &__block_literal_global_27);
  return (id)_inactiveHourColor___color;
}

void __43__NTKSchoolTimeDialView__inactiveHourColor__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.0, 0.3);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_inactiveHourColor___color;
  _inactiveHourColor___color = v0;

}

- (id)_activeHourColor
{
  if (_activeHourColor_onceToken != -1)
    dispatch_once(&_activeHourColor_onceToken, &__block_literal_global_21);
  return (id)_activeHourColor___color;
}

void __41__NTKSchoolTimeDialView__activeHourColor__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_activeHourColor___color;
  _activeHourColor___color = v0;

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hourLabels, 0);
}

@end
